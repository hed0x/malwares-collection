   ; =========================  LZ77  PACKER   =========================
   ; ==========================  Made in SMF  ==========================
   ; In : ESI=packed data
   ;      EDI=LpBuffer 4 unpacked data
   ; Out: Buffer=unpacked data
   ;====================== LZ77 family unpacker ==========================
   unpack: jmp_  Errorret
   @unpack: xor ecx,ecx
           push dword ptr fs:[ecx]
           mov fs:[ecx],esp
           xor edx,edx
           cld
   unlzlp: cld
           lodsb
           test al,al
           je_  unlzret ; zero = end of packed data
           test al,80h
           jne_ lzref
           mov cl,al
           cld
           rep movsb ; simply copy some bytes from in to out
           jmp_  unlzlp
   lzref:  mov dh,al ; processing data reference
           and dh,0fh
           mov cl,al
           shr ecx,4
           and cl,7
           add ecx,3
           cld
           lodsb ; load reference offset (low 8 bits)
           mov dl,al
           xchg eax,esi
           mov esi,edi
           sub esi,edx
           cld
           rep movsb ; copy some bytes from already unpacked data
           xchg eax,esi
           jmp_  unlzlp
   unlzret: jmp_ @unlzret
   Errorret: call @unpack
       ; ====================== unpacker end ============================
              mov esp,[esp+8]
   @unlzret:  xor ecx,ecx
              pop dword ptr fs:[ecx]
              pop ecx
              ret
   ;----------------------------------------------------------------------
   ;dwSizepackedData=LZPack(plength,packed,unplen,unpacked)
   ;
   ; ======================== LZ77 PACKER ==============================
   ;       packs buffer ([unpacked],size=[unplen]), to ([packed],size=[plength])
   ;
   ;               registers alloc:
   ;                       al=first byte from source pointer
   ;                       edx=data register
   ;                       ebp=for saving search pointer
   ;                       ebx=for saving maximal length
   ;                       esi=source pointer
   ;                       edi=search pointer
   ;                       ecx=end of source pointer (bounds)
   ;
   LZPack: StackFrame EQU 128+4*4+4
           sub esp,StackFrame
           push esp
           pop ebp
           ;---------------
           unpacked EQU +16+StackFrame
           unplen   EQU unpacked-4
           packed   EQU unplen-4
           plength  EQU packed-4
           ;---------------
           retEIP   EQU plength-4
           ;---------------
           result   eqU retEIP-4
           buf      EQU result-4
           maxofs   EQU buf-4
           RegEBP   EQU maxofs-4
           Buffer   EQU RegEBP-128
           ;----------------------------------------
           mov esi,dword ptr [ebp+unpacked] ; seek source pointer to start of source
           mov eax,dword ptr [ebp+packed]
           mov dword ptr [ebp+result],eax ; zero result buffer
           mov eax,ebp ;offset buffer ;!!!
           add eax,Buffer
           mov dword ptr [ebp+buf],eax
           cld
           call nomatch ; start with storing first symbol to buffer
           mov eax,dword ptr [ebp+result]
           sub eax,dword ptr [ebp+packed]
           mov ebx,dword ptr [ebp+plength]
           mov [ebx],eax
           add esp,StackFrame
           ret 4*4

   lzloop: mov edi,esi
           mov ecx,dword ptr [ebp+unpacked]
           sub edi,4094 ; window size
           mov ebx,2 ; maximal found length
           cmp edi,ecx
           jae short shrwin ; if current pointer in source far then 4095 from start,
                   ; then search from (source-window_size)
           mov edi,ecx  ; else search from start of source
   shrwin: mov edx,esi ; store source pointer
           add ecx,dword ptr [ebp+unplen] ; now ecx points to last byte of source file
           dec edi
   lzz0:   mov al,[esi] ; get byte from source pointer
   lzbuf2: inc edi
           cmp edi,esi
           jz short findend
           cmp [edi],al
           jnz short lzbuf2
           mov [ebp+RegEBP],edi
   lzbuf0: inc esi
           inc edi
           cmp esi,ecx
           jz short fcheck
           mov al,[esi]
           cmp al,[edi]
           jz short lzbuf0
   fcheck:
           mov esi,edx ; restore source pointer
           db 2bh,0bdh,84h,0,0,0;sub edi,dword [ebp+RegEBP] ; calculate matched length
           cmp edi,ebx
           jbe short nomax
           push eax
           db 8bh,85h,84h,0,0,0 ;mov eax,dword [ebp+RegEBP]
           mov dword ptr [ebp+maxofs],eax
           pop eax
           mov ebx,edi
           cmp edi,10 ; if found reference longer than max_ref_len then stop search
           jae short findend
   nomax:  mov edi,dword [ebp+80H] ; restore search pointer
           jmp short lzz0
   findend:
           cmp ebx,2
           jbe short nomatch
           call flush
           cmp ebx,10
           jbe short len_ok1 ; if reference_length <= 10
           mov ebx,10
   len_ok1:mov edx,esi
           sub edx,dword ptr [ebp+maxofs] ; (offset to maximal matched string) will be there
           add esi,ebx
           sub bl,3
           shl bl,4
           or dh,bl
           or dh,80h ; bit7 - denoting a reference
           mov al,dh
           call putb
           mov al,dl
           call putb
           mov ecx,dword ptr [ebp+unplen]
           add ecx,dword ptr [ebp+unpacked]
           cmp esi,ecx
           jnz  lzloop
           jmp short lzdone

   nomatch:mov al,[esi]
           inc esi         ; store al to buffer
           mov edi,dword ptr [ebp+buf]
           mov  [edi],al
           inc edi
           mov dword ptr [ebp+buf],edi
           mov eax,ebp
           add eax,buffer+127
           cmp edi,eax
           jnz short nofull
           call flush
   nofull: mov ecx,dword ptr [ebp+unplen]
           add ecx,dword ptr [ebp+unpacked]
           cmp esi,ecx
           jnz lzloop
   lzdone: call flush
           xor al,al
           jmp short putb

   ; ================ FLUSH =======================
   ; flush temporary buffer (can't use esi,ebx,ebp)
   flush:  mov ecx,dword ptr [ebp+buf]
           mov edi,ebp ;offset buffer
           add edi,buffer
           sub ecx,edi
           jz short ret1ptr ; buffer is empty
           mov al,cl
           call putb ; store length
   flm1:   mov al,[edi]
           inc edi
           call putb
           loop flm1
           mov eax,ebp
           add eax,Buffer
           mov dword ptr [ebp+buf],eax
   ret1ptr:ret
   ; ================ PUT BYTE al TO OUTPUT STREAM ================
   ;               can't use esi,ebx,ecx,edi,edx
   putb:   push edi
           mov edi,dword ptr [ebp+result]
           stosb
           mov dword ptr [ebp+result],edi
           pop edi
           ret
   ; ==========================================================================
