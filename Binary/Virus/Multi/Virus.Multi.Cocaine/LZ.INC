   ;void fast_copy(p_src,p_dst,len)
   ;
   fast_copy proc
          push edi esi ecx
          mov ecx,dword ptr [esp+ 4+(4*3)]
          mov edi,dword ptr [esp+ 8+(4*3)]
          mov esi,dword ptr [esp+12+(4*3)]
          cld
          rep movsb
          pop ecx esi edi
          ret 12
   fast_copy endp


   lzrw1_decompress proc   near
   ?live1@768:
      ;
      ;    void lzrw1_decompress(p_src_first,src_len,p_dst_first,p_dst_len)
      ;
   @27:
       push      ebp
       mov       ebp,esp
       add       esp,-8
       push      ebx
       push      esi
       push      edi
      ;
      ;    /* Input  : Specify input block using p_src_first and src_len.          */
      ;    /* Input  : Point p_dst_first to the start of the output zone.          */
      ;    /* Input  : Point p_dst_len to a ULONG to receive the output length.    */
      ;    /* Input  : Input block and output zone must not overlap. User knows    */
      ;    /* Input  : upperbound on output block length from earlier compression. */
      ;    /* Input  : In any case, maximum expansion possible is eight times.     */
      ;    /* Output : Length of output block written to *p_dst_len.               */
      ;    /* Output : Output block in Mem[p_dst_first..p_dst_first+*p_dst_len-1]. */
      ;    /* Output : Writes only  in Mem[p_dst_first..p_dst_first+*p_dst_len-1]. */
      ;    UBYTE *p_src_first, *p_dst_first; ULONG src_len, *p_dst_len;
      ;    {UWORD controlbits=0, control;
      ;
   ?live1@784: ; EDI = control, ECX = p_src_first
       xor       esi,esi
   ?live1@800: ;
       mov       ecx,dword ptr [ebp+20]
      ;
      ;     UBYTE *p_src=p_src_first+FLAG_BYTES, *p_dst=p_dst_first,
      ;           *p_src_post=p_src_first+src_len;
      ;
   ?live1@816: ; EAX = p_src, EDX = p_dst, EDI = control, ESI = controlbits, ECX = p_src_first
       ;
       mov       ebx,dword ptr [ebp+16]
       add       ebx,ecx
   ?live1@832: ; EDI = control, ESI = controlbits, ECX = p_src_first
       mov       edx,dword ptr [ebp+12]
   ?live1@848: ; EAX = p_src, EDX = p_dst, EDI = control, ESI = controlbits, ECX = p_src_first
       ;
       mov       dword ptr [ebp-4],ebx
   ?live1@864: ; EDI = control, ESI = controlbits, ECX = p_src_first
       lea       eax,dword ptr [ecx+4]
      ;
      ;     if (*p_src_first==FLAG_COPY)
      ;
   ?live1@880: ; EAX = p_src, EDX = p_dst, EDI = control, ESI = controlbits, ECX = p_src_first
       ;
       cmp       byte ptr [ecx],1
       jne       short @28
      ;
      ;       {fast_copy(p_src_first+FLAG_BYTES,p_dst_first,src_len-FLAG_BYTES);
      ;
   ?live1@896: ; ECX = p_src_first
       add       ecx,4
       push      ecx
       mov       eax,dword ptr [ebp+12]
       push      eax
       mov       edi,dword ptr [ebp+16]
       sub       edi,4
       push      edi
       call      fast_copy
      ;
      ;        *p_dst_len=src_len-FLAG_BYTES; return;}
      ;
   ?live1@912: ; EDI = @temp14
       mov       eax,dword ptr [ebp+8]
       mov       dword ptr [eax],edi
       jmp       short @29
      ;
      ;     while (p_src!=p_src_post)
      ;
   ?live1@928: ; EAX = p_src, EDX = p_dst, EDI = control, ESI = controlbits
   @28:
       cmp       eax,dword ptr [ebp-4]
       je        short @31
      ;
      ;       {if (controlbits==0)
      ;
   @30:
       test      esi,esi
       jne       short @32
      ;
      ;          {control=*p_src++; control|=(*p_src++)<<8; controlbits=16;}
      ;
   ?live1@960: ; EAX = p_src, EDX = p_dst
       movzx     edi,byte ptr [eax]
       inc       eax
       xor       ecx,ecx
   ;   mov       esi,16
           push 16
           pop esi
       mov       cl,byte ptr [eax]
       shl       ecx,8
       or        edi,ecx
       inc       eax
      ;
      ;        if (control&1)
      ;
   ?live1@976: ; EAX = p_src, EDX = p_dst, EDI = control, ESI = controlbits
   @32:
       test      edi,1
       je        short @33

   ;   jnc        short @33
      ;
      ;          {UWORD offset,len; UBYTE *p;
      ;           offset=(*p_src&0xF0)<<4; len=1+(*p_src++&0xF);
      ;
   @34:
       xor       ebx,ebx
       xor       ecx,ecx
       mov       bl,byte ptr [eax]
       mov       cl,byte ptr [eax]
       and       ebx,15
       inc       eax
       inc       ebx
       and       ecx,240
       mov       dword ptr [ebp-8],ebx
      ;
      ;           offset+=*p_src++&0xFF; p=p_dst-offset;
      ;
   ?live1@1008: ; EAX = p_src, EDX = p_dst, EDI = control, ESI = controlbits, ECX = offset
       ;
       xor       ebx,ebx
       mov       bl,byte ptr [eax]
       inc       eax
   ?live1@1024: ; EAX = p_src, EDX = p_dst, EDI = control, ESI = controlbits
       shl       ecx,4
   ?live1@1040: ; EAX = p_src, EDX = p_dst, EDI = control, ESI = controlbits, ECX = offset
       ;
       and       ebx,255
       add       ecx,ebx
       mov       ebx,edx
       sub       ebx,ecx
       mov       ecx,ebx
       jmp       short @36
      ;
      ;           while (len--) *p_dst++=*p++;}
      ;
   ?live1@1056: ; EAX = p_src, EDX = p_dst, ECX = p, EDI = control, ESI = controlbits
       ;
   @35:
       mov       bl,byte ptr [ecx]
       inc       ecx
       mov       byte ptr [edx],bl
       inc       edx
   @36:
       mov       ebx,dword ptr [ebp-8]
       add       dword ptr [ebp-8],-1
       test      ebx,ebx
       jne       short @35
   @37:
       jmp       short @38
      ;
      ;        else
      ;           *p_dst++=*p_src++;
      ;
   ?live1@1072: ; EAX = p_src, EDX = p_dst, EDI = control, ESI = controlbits
   @33:
       mov       cl,byte ptr [eax]
       inc       eax
       mov       byte ptr [edx],cl
       inc       edx
      ;
      ;        control>>=1; controlbits--;
      ;
   @38:
       shr       edi,1
       dec       esi
       cmp       eax,dword ptr [ebp-4]
       jne       short @30
      ;
      ;       }
      ;     *p_dst_len=p_dst-p_dst_first;
      ;
   ?live1@1120: ; EDX = p_dst
   @31:
       sub       edx,dword ptr [ebp+12]
       mov       eax,dword ptr [ebp+8]
       mov       dword ptr [eax],edx
      ;
      ;    }
      ;
   ?live1@1136: ;
   @39:
   @29:
       pop       edi
       pop       esi
       pop       ebx
       pop       ecx
       pop       ecx
       pop       ebp
       ret       16
   lzrw1_decompress    endp
