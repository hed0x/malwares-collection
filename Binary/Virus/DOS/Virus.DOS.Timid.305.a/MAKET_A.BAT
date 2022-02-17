   md timid
   a86 timid.asm timid.com
   a86 shellt.asm shellt.com
   copy shellt.com timid
   copy timid.com timid
   cd timid
   timid
   del timid.com
   copy shellt.com ..\timid.com
   del shellt.com
   cd ..
   rd timid
   del shellt.com
   del *.sym
