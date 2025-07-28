#!/bin/csh -fe

# Remove old files to ensure clean directory
set outputFileList=(__fmsh__ \
  __fubs__ \
  __globfiles__ \
  sim.csrc \
  __tests__ \
  __tmp__ \
  zoix.sim.daidir \
  fault_report.log \
  fmsh.log \
  fr2fdef.log \
  logic_sim.log \
  sim.fdef \
  sim.zdb \
  testability.txt \
  zoix.sim \
)

foreach f ($outputFileList)
  if ( -e $f ) then
    rm -rf $f
  endif
end
