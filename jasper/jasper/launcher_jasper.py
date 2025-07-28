# To use the script, just type: python3 launcher_jasper.py

import sys
import os

def main():
	# sequence of steps to launch jasper gold tool using a TCL script.

	# the option -allow_unsupported_OS is only used for buono server(check if latest OS is supported).

	os.system("jg -allow_unsupported_OS -no_gui -tcl jasperRun_final_ADD.tcl")

	# os.system("jg -allow_unsupported_OS -no_gui -tcl jasperRun_final_MAC.tcl") # to avoid gui interfase

main()


