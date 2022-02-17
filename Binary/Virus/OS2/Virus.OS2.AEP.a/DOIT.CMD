   masm /Zi os2vir,,;
   link os2vir,,,os2286,os2vir.def
   masm /Zi beep,,;
   link beep,,,os2286,beep.def
   copy beep.exe t
   copy os2vir.exe t
