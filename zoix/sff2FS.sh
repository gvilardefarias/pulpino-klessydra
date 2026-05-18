#!/bin/bash

#Convert generated sff report in a fault list in the format used by Fast Scan from Siemens
input=$1
output=${input%.*}.fs

fr2fdef -fr $input +verbose +format+standard -fdef rec.fdef
fault_report +format+fastscan -fdef rec.fdef -out $output