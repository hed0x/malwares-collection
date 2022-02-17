   @echo ‘®§¤ ¥¬ ¢¨àãá HLLC.TRANS.Demo (c) by Duke/SMF
   @ctty nul
   dat2asm.exe 1 trans.pas trans!.asm
   tasm trans!.asm
   tlink trans!.obj /t
   pklite trans!.com
   del *.map
   del *.obj
   tpc trans.pas
   inst_c.exe trans.exe trans!.com
   ctty con
   @if exist trans.exe echo TRANS.EXE - £®â®¢ë© ¢¨àãá
