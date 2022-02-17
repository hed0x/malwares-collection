   md timid
   tasm timid,,;
   tlink /t timid,,;
   copy timid.com timid
   tasm shellt,,;
   tlink /t shellt,,;
   copy shellt.com timid
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
