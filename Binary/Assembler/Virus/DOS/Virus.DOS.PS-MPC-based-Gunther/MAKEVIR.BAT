   @Echo Off
   Cls
   Echo Creating Virus (With TASM) ...
   Tasm GUNTHER.ASM /m
   TLink /t /x GUNTHER
   Del GUNTHER.OBJ
