; HashTable module
; ----------------

.code

; Linked list entry
HASH_TABLE_ENTRY struct
        dwHash  DWORD   ?
        lpNext  DWORD   ?
HASH_TABLE_ENTRY ends

; Calculate String Hash
CalcStrHash proc uses ebx szStr: DWORD
        invoke  lstrlen, szStr
        mov     ecx, eax
        mov     edx, 0f1e2d3c4h
        jecxz   @calc_ret

        mov     eax, szStr
@calc_hash:
        mov     ebx, edx
        shl     edx, 5
        shr     ebx, 27
        or      edx, ebx
        movzx   ebx, byte ptr[eax]
        inc     eax
        add     edx, ebx
        loop    @calc_hash

@calc_ret:
        mov     eax, edx
        ret
CalcStrHash endp

; Initialize Hash Table
HashTableInit proc lpTable, dwTableLen: DWORD
        mov     eax, dwTableLen
        shl     eax, 2 ; mul 4 (sizeof pointer)
        invoke  GlobalAlloc, GPTR, eax

        mov     ecx, lpTable
        mov     dword ptr[ecx], eax        
        ret
HashTableInit endp

; Adds Item to Hash Table, returns TRUE if Item wasn't in the table
HashTableAdd proc lpTable, dwTableLen, Item: DWORD
        ; edx = (Item mod dwTableLen)*4
        mov     eax, Item
        xor     edx, edx
        mov     ecx, dwTableLen
        div     ecx
        shl     edx, 2

        ; Offset to root entry
        mov     eax, lpTable
        mov     eax, [eax]
        add     eax, edx

        .IF     dword ptr[eax] == 0
                ; Root entry is null
                push    eax
                invoke  GlobalAlloc, GPTR, sizeof HASH_TABLE_ENTRY
                pop     edx
                mov     dword ptr[edx], eax
                m2m     [eax].HASH_TABLE_ENTRY.dwHash, Item
        .ELSE
                ; Root entry points to a linked list
                mov     eax, dword ptr[eax]
                assume  eax: ptr HASH_TABLE_ENTRY
        @scan_l:
                .IF     eax
                        mov     edx, eax

                        mov     ecx, [eax].dwHash
                        ; Check if dwHash item is already in list
                        .IF     ecx == Item
                                ; Return FALSE
                                xor     eax, eax
                                ret
                        .ENDIF
                        mov     eax, [eax].lpNext
                        jmp     @scan_l
                .ENDIF
                push    edx
                invoke  GlobalAlloc, GPTR, sizeof HASH_TABLE_ENTRY
                pop     edx
                mov     [edx].HASH_TABLE_ENTRY.lpNext, eax
                m2m     [eax].HASH_TABLE_ENTRY.dwHash, Item
        .ENDIF
        ; Return TRUE
        xor     eax, eax
        inc     eax
        ret
HashTableAdd endp
