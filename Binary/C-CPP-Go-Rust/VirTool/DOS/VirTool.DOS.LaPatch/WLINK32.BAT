@echo off
wpp386 winapp32.cpp @wcpp.cfg
wlink @wlink.cfg
wrc winapp32.rc -bt=nt -fe=winapp32.exe
