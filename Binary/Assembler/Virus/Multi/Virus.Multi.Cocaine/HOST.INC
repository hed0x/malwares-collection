   _TEXT segment dword use32 public'CODE'

         extrn ShellAboutA:Proc
         extrn ExitProcess:pRoc

   main   proc
          jmp DecriptInit
     host:
          push 0
          push ofs tit
          push ofs msg
          push 0
          call ShellAboutA
          push 0
          call ExitProcess
   main   endp

   _TEXT  ends

   _DATA  segment dword use32 public 'DATA'

   tit    db 'W32/Wm.Cocaine by Vecna', 0
   msg    db 'Cocaine - A Win32/WinWord Virus#'
          db 'Cocaine - Your PC is now addicted', 0

   _DATA  ends
