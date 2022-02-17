   ; - -[ASSEMBLE.BAT - Batch file used to build GOLLUM.INC] - - - - - - - ->8

   tasm gollum
   tlink /Tde gollum
   exe2bin gollum.exe gollum.bin
   crypt
   data gollum.crp gollum.inc
