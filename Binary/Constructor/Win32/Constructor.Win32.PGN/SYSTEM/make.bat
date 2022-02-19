@echo off
if /%1==/ goto x1
:cycle
if /%1==/ goto exit
cd %1
call make
cd ..
shift
goto cycle
:x1
call make CHECK CPPSYS CRC32 DEBUG HAXOR HEADER HOST PACKER PE2PGN
:exit
