#!/usr/bin/env python
#
# SubIPConfig.py
# Francesco Conti <f.conti@unibo.it>
#
# Copyright (C) 2015 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

from .IPApproX_common  import *
from .vsim_defines     import *
from .makefile_defines import *
from .vivado_defines   import *
from .synopsys_defines import *
import sys

# returns true if source file is VHDL
def is_vhdl(f):
    if f[-4:] == ".vhd":
        return True
    else:
        return False

# list of allowed and mandatory keys for the Yaml dictionary
ALLOWED_KEYS = [
    'incdirs',
    'vlog_opts',
    'vcom_opts',
    'tech',
    'targets',
    'flags',
    'defines'
]
MANDATORY_KEYS = [
    'files'
]

# list of allowed targets
ALLOWED_TARGETS = [
    'all',
    'xilinx',
    'rtl',
    'verilator',
    'st28fdsoi',
    'umc65',
    'gf28',
    'tsmc55',
    'tsmc40',
    'gf22',
]

LEGACY_IPS = [
    'cea'
]

class SubIPConfig(object):
    def __init__(self, ip_name, sub_ip_name, sub_ip_dic, ip_path):
        super(SubIPConfig, self).__init__()

        self.ip_name     = ip_name
        self.ip_path     = ip_path
        self.sub_ip_name = sub_ip_name
        self.sub_ip_dic  = sub_ip_dic

        self.__check_dic()
        self.files     = self.__get_files()     # list of source files in the sub-IP
        self.targets   = self.__get_targets()   # target (all, rtl or fpga at the moment)
        self.incdirs   = self.__get_incdirs()   # verilog include directory
        self.tech      = self.__get_tech()      # if True, do not generate analyze scripts for this ip :)
        self.vlog_opts = self.__get_vlog_opts() # generic vlog options
        self.vcom_opts = self.__get_vcom_opts() # generic vcom options
        self.defines   = self.__get_defines()   # additional defines

    def export_make(self, abs_path, more_opts, target_tech='st28fdsoi'):
        if target_tech == 'xilinx':
            return self.__export_make_xilinx(abs_path, more_opts) # not implemented yet
        if not ("all" in self.targets or "rtl" in self.targets):
            return "\n"
        vlog_cmd = ""
        files = self.files
        vlog_includes = ""
        for i in self.incdirs:
            vlog_includes += "+%s/%s" % (abs_path, i)
        vhdl_files = ""
        vlog_files = ""
        for f in files:
            if not is_vhdl(f):
                vlog_files += "\\\n\t%s/%s" % (abs_path, f)
            else:
                vhdl_files += "\\\n\t%s/%s" % (abs_path, f)
        if len(vlog_includes) > 0:
            vlog_cmd += MK_SUBIPINC % (self.sub_ip_name, self.sub_ip_name.upper(), "+incdir" + vlog_includes)
        vlog_cmd += MK_SUBIPSRC % (self.sub_ip_name.upper(), vlog_files, self.sub_ip_name.upper(), vhdl_files)
        vlog_cmd += "\n"
        vlog_rule = ""
        if len(vlog_files) > 0:
            vlog_rule += MK_BUILDCMD_SVLOG % ("%s %s" % (more_opts, self.vlog_opts), self.sub_ip_name.upper(), self.sub_ip_name.upper())
            vlog_rule += "\n"
        if len(vhdl_files) > 0:
            vlog_rule += MK_BUILDCMD_VHDL % ("%s" % (more_opts), self.sub_ip_name.upper())
            vlog_rule += "\n"
        vlog_cmd += MK_SUBIPRULE % (self.sub_ip_name, self.sub_ip_name.upper(), self.sub_ip_name.upper(), self.sub_ip_name, vlog_rule)
        vlog_cmd += "\n"

        return vlog_cmd

    def export_vsim(self, abs_path, more_opts, target_tech='st28fdsoi'):
        if target_tech == 'xilinx':
            return self.__export_vsim_xilinx(abs_path, more_opts)
        if not ("all" in self.targets or "rtl" in self.targets):
            return "\n"
        if self.ip_name in LEGACY_IPS:
            print("Skipping %s.%s as it is not supported by the TCSH-based build flow." % (self.ip_name, self.sub_ip_name))
            return "\n"
        vlog_cmd = VSIM_PREAMBLE_SUBIP % (self.sub_ip_name)
        files = self.files
        vlog_includes = ""
        for i in self.incdirs:
            vlog_includes += "%s%s/%s" % (VSIM_VLOG_INCDIR_CMD, abs_path, i)
        defines = ""
        for d in self.defines:
            defines = "%s +define+%s" % (defines, d)
        for f in files:
            if not is_vhdl(f):
                vlog_cmd += VSIM_VLOG_CMD % ("%s %s %s" % (more_opts, self.vlog_opts, defines), vlog_includes, "%s/%s" % (abs_path, f))
            else:
                vlog_cmd += VSIM_VCOM_CMD % ("%s %s" % (more_opts, self.vcom_opts), "%s/%s" % (abs_path, f))
        return vlog_cmd

    def __export_vsim_xilinx(self, abs_path, more_opts):
        if not ("all" in self.targets or "xilinx" in self.targets):
            return "\n"
        vlog_cmd = VSIM_PREAMBLE_SUBIP % (self.sub_ip_name)
        files = self.files
        vlog_includes = ""
        vlog_opts = " +define+PULP_FPGA_EMUL +define+PULP_FPGA_SIM"
        for i in self.incdirs:
            vlog_includes += "%s%s/%s" % (VSIM_VLOG_INCDIR_CMD, abs_path, i)
        for f in files:
            if not is_vhdl(f):
                vlog_cmd += VSIM_VLOG_CMD % ("%s %s %s" % (more_opts, vlog_opts, self.vlog_opts), vlog_includes, "%s/%s" % (abs_path, f))
            else:
                vlog_cmd += VSIM_VCOM_CMD % ("%s %s" % (more_opts, self.vcom_opts), "%s/%s" % (abs_path, f))
        return vlog_cmd

    def export_synopsys(self, path, target_tech='st28fdsoi'):
        if not ("all" in self.targets or target_tech in self.targets):
            return "\n"
        analyze_cmd = SYNOPSYS_ANALYZE_PREAMBLE_SUBIP % (self.sub_ip_name)
        files = self.files
        for f in files:
            if not is_vhdl(f):
                analyze_cmd += SYNOPSYS_ANALYZE_SV_CMD % ("%s/%s" % (path, f))
            else:
                analyze_cmd += SYNOPSYS_ANALYZE_VHDL_CMD % ("%s/%s" % (path, f))
        return analyze_cmd

    def export_vivado(self, abs_path):
        if not ("all" in self.targets or "xilinx" in self.targets):
            return "\n"
        vivado_cmd = VIVADO_PREAMBLE_SUBIP % (self.sub_ip_name, prepare(self.sub_ip_name.upper()))
        files = self.files
        for f in files:
            vivado_cmd += "    %s/%s/%s \\\n" % (abs_path, self.ip_path, f)
        vivado_cmd += VIVADO_POSTAMBLE_SUBIP
        if len(self.incdirs) > 0:
            vivado_cmd += VIVADO_PREAMBLE_SUBIP_INCDIRS % prepare(self.sub_ip_name.upper())
            for i in self.incdirs:
                vivado_cmd += "    %s/%s/%s \\\n" % (abs_path, self.ip_path, i)
            vivado_cmd += VIVADO_POSTAMBLE_SUBIP
        return vivado_cmd

    def export_synplify(self, abs_path):
        if not ("all" in self.targets or "xilinx" in self.targets):
            return "\n"
        synplify_cmd = ""
        files = self.files
        if len(files) == 0:
            files.extend(self.files)
        for f in files:
            if not is_vhdl(f):
                synplify_cmd += "add_file -verilog %s/%s/%s\n" % (abs_path, self.ip_path, f)
            else:
                synplify_cmd += "add_file -vhdl %s/%s/%s\n" % (abs_path, self.ip_path, f)
        return synplify_cmd

    def export_verilator(self, abs_path):
        verilator_cmd = ""
        if not ("all" in self.targets or "verilator" in self.targets):
            return ""
        files = self.files
        if len(files) == 0:
            files.extend(self.files)
        for f in files:
            if not is_vhdl(f):
                verilator_cmd += "%s/%s/%s \\\n" % (abs_path, self.ip_path, f)
        return verilator_cmd

    ### management of the Yaml dictionary

    def __check_dic(self):
        if self.ip_name in LEGACY_IPS:
            return
        dic = self.sub_ip_dic
        if set(MANDATORY_KEYS).intersection(set(dic.keys())) == set([]):
            print("ERROR: there are no files for ip '%s', sub-ip '%s'. Check its src_files.yml file." % (self.ip_name, self.sub_ip_name))
            sys.exit(1)
        not_allowed = set(dic.keys()) - set(MANDATORY_KEYS) - set(ALLOWED_KEYS)
        if not_allowed != set([]):
            print("ERROR: there are unallowed keys for ip '%s', sub-ip '%s':" % (self.ip_name, self.sub_ip_name))
            for el in list(not_allowed):
                print("    %s" % el)
            print("Check the src_files.yml file.")
            sys.exit(1)

    def __get_files(self):
        return self.sub_ip_dic['files']

    def __get_defines(self):
        try:
            defines = self.sub_ip_dic['defines']
        except KeyError:
            defines = []
        return defines

    def __get_targets(self):
        try:
            targets = self.sub_ip_dic['targets']
        except KeyError:
            targets = ["all"]
        not_allowed = set(targets) - (set(ALLOWED_TARGETS))
        if not_allowed != set([]):
            print("ERROR: targets not allowed for ip '%s', sub-ip '%s':" % (self.ip_name, self.sub_ip_name))
            print(not_allowed)
            for el in list(not_allowed):
                print("    %s" % el)
            print("Check the src_files.yml file.")
            sys.exit(1)
        return targets

    def __get_incdirs(self):
        try:
            incdirs = self.sub_ip_dic['incdirs']
        except KeyError:
            incdirs = []
        return incdirs

    def __get_tech(self):
        try:
            tech = self.sub_ip_dic['tech']
        except KeyError:
            tech = False
        return tech

    def __get_vlog_opts(self):
        try:
            vlog_opts = " ".join(self.sub_ip_dic['vlog_opts'])
        except KeyError:
            vlog_opts = ""
        return vlog_opts

    def __get_vcom_opts(self):
        try:
            vcom_opts = " ".join(self.sub_ip_dic['vcom_opts'])
        except KeyError:
            vcom_opts = ""
        return vcom_opts

