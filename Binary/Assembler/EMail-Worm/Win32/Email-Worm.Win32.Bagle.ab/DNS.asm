; DNS Client, only MX records are supported
; #########################################################################

.data
        bDNSLoaded      db      0

.const

;============
; Iphlpapi.h
;============

MAX_HOSTNAME_LEN        equ     128 
MAX_DOMAIN_NAME_LEN     equ     128 
MAX_SCOPE_ID_LEN        equ     256 

; The FIXED_INFO structure contains information that is the same across all the interfaces in a computer.
IP_ADDR_STRING struct
        Next            DWORD   ?
        IpAddress       BYTE    16 dup(?)
        IpMask          BYTE    16 dup(?)
        Context         DWORD   ?
IP_ADDR_STRING ends

FIXED_INFO struct
        HostName         BYTE   MAX_HOSTNAME_LEN+4 dup(?)       ; Host name for the local computer.
        DomainName       BYTE   MAX_DOMAIN_NAME_LEN+4 dup(?)    ; Domain in which the local computer is registered.
        CurrentDnsServer DWORD  ?                               ; Reserved. Use the DnsServerList member to obtain the DNS servers for the local computer.
        DnsServerList    IP_ADDR_STRING <>                      ; Linked list of IP_ADDR_STRING structures that specify the set of DNS servers used by the local computer.
        NodeType         DWORD  ?                               ; Node type of the local computer.
        ScopeId          BYTE   MAX_SCOPE_ID_LEN+4 dup(?)       ; DHCP scope name.
        EnableRouting    DWORD  ?                               ; Specifies whether routing is enabled on the local computer.
        EnableProxy      DWORD  ?                               ; Specifies whether the local computer is acting as an ARP proxy.
        EnableDns        DWORD  ?                               ; Specifies whether DNS is enabled on the local computer.
FIXED_INFO ends

;===========
; DNS types
;===========

; RR types
TYPE_A          equ 1   ; Host address
TYPE_NS         equ 2   ; Authorative name server
TYPE_MD         equ 3   ; Mail destination
TYPE_MF         equ 4   ; Mail forwarder
TYPE_CNAME      equ 5   ; Canonical name of an alias
TYPE_SOA        equ 6   ; Marks the start of a zone of authority
TYPE_MB         equ 7   ; Mailbox domain name (Experimental)
TYPE_MG         equ 8   ; Mail group member (Experimental)
TYPE_MR         equ 9   ; Mail rename domain name (Experimental)
TYPE_NULL       equ 10  ; Null RR (Experimental)
TYPE_WKS        equ 11  ; Will known service description
TYPE_PTR        equ 12  ; Domain name pointer
TYPE_HINFO      equ 13  ; Host information
TYPE_MINFO      equ 14  ; Mailbox or mail list information
TYPE_MX         equ 15  ; Mail exchange
TYPE_TXT        equ 16  ; Text strings
TYPE_RP         equ 17  ; Responsible person (Experimental)
TYPE_AFSDB      equ 18  ; Andrew File System Data Base (Experimental)
TYPE_X25        equ 19  ; X.25 address (Experimental)
TYPE_ISDN       equ 20  ; Integrated Services Digital Network addresses (Experimental)
TYPE_RT         equ 21  ; Route Through (Experimental)

; Classes
CLASS_IN        equ 1   ; Internet class
CLASS_CS        equ 2   ; CSNET class
CLASS_CH        equ 3   ; CHAOS class
CLASS_HS        equ 4   ; Hesiod

RECURSIZE_REQUEST equ 256

DNS_HEADER struct
        ID      WORD    ?
        OPCODE  WORD    ?
        QDCOUNT WORD    ?
        ANCOUNT WORD    ?
        NSCOUNT WORD    ?
        ARCOUNT WORD    ?
DNS_HEADER ends

.code

; Get localy saved DNS server
DNSGetServer proc
        LOCAL   pFixedInfo, pOutBufLen: DWORD

        invoke  GlobalAlloc, GPTR, sizeof FIXED_INFO
        mov     pFixedInfo, eax
        mov     pOutBufLen, sizeof FIXED_INFO

        lea     eax, pOutBufLen
        push    eax
        push    pFixedInfo
        call    dwGetNetworkParams
        .IF     eax == ERROR_BUFFER_OVERFLOW
                invoke  GlobalFree, pFixedInfo
                invoke  GlobalAlloc, GPTR, pOutBufLen
                mov     pFixedInfo, eax
        .ENDIF

        lea     eax, pOutBufLen
        push    eax
        push    pFixedInfo
        call    dwGetNetworkParams
        .IF     !eax
                mov     eax, pFixedInfo
                assume  eax: ptr FIXED_INFO
                invoke  lstrcpy, offset szDNSHost, addr [eax].DnsServerList.IpAddress
        .ENDIF
        invoke  GlobalFree, pFixedInfo
        ret
DNSGetServer endp

DNSHandleRequest proto :DWORD ; forward

; Prepare MX record query
DNSQuery proc uses esi edi ebx stream, szHost: DWORD
        LOCAL   header: DNS_HEADER
        LOCAL   pbyte: DWORD
        LOCAL   bword: WORD
        
        invoke  ZeroMemory, addr header, sizeof header

        mov     header.ID, 0202h
        mov     header.OPCODE, RECURSIZE_REQUEST
        ror     header.OPCODE, 8
        mov     header.QDCOUNT, 1
        ror     header.QDCOUNT, 8
        coinvoke stream, IStream, Write, addr header, sizeof header, 0

        ; Write host
        invoke  lstrlen, szHost
        mov     ecx, eax
        mov     edi, szHost

@l:
        mov     edx, edi
        mov     al, '.'
        cld
        repnz scasb
        mov     ebx, edi
        sub     ebx, edx
        .IF     byte ptr[edi-1] == '.'
                dec     ebx
        .ENDIF
        mov     pbyte, ebx

        push    ecx
        push    edx

        coinvoke stream, IStream, Write, addr pbyte, 1, 0
        pop     ecx
        coinvoke stream, IStream, Write, ecx, pbyte, 0
        mov     pbyte, 0

        pop     ecx
        test    ecx, ecx
        jnz     @l

        ; Zero terminator
        coinvoke stream, IStream, Write, addr pbyte, 1, 0

        ; Type
        mov     bword, TYPE_MX
        ror     bword, 8
        coinvoke stream, IStream, Write, addr bword, 2, 0

        ; Class
        mov     bword, CLASS_IN
        ror     bword, 8
        coinvoke stream, IStream, Write, addr bword, 2, 0

        ret
DNSQuery endp

; Send request, receive response, returns MX server on success, otherwise NULL
DNSRequest proc uses ebx stream, szDNSServer: DWORD
        LOCAL   len: DWORD
        LOCAL   lpbuf[128]: BYTE

        mov     ecx, DNSPort
        xchg    cl, ch
        invoke  NetConnect, szDNSServer, 0, ecx
        .IF     eax
                mov     ebx, eax
                invoke  StreamGetLength, stream
                xchg    al, ah
                mov     len, eax

                invoke  send, ebx, addr len, 2, 0
                invoke  StreamGotoBegin, stream
@l:
                coinvoke stream, IStream, Read, addr lpbuf, 128, addr len
                .IF     len
                        invoke  send, ebx, addr lpbuf, len, 0
                        jmp     @l
                .ENDIF

                invoke  StreamClear, stream
                invoke  NetRecvUntilBytes, ebx, stream, 2, 4, 0
                test    eax, eax
                jz      @close_sock

                invoke  StreamGotoBegin, stream
                mov     len, 0
                coinvoke stream, IStream, Read, addr len, 2, 0
                invoke  StreamClear, stream

                mov     eax, len
                xchg    al, ah
                invoke  NetRecvUntilBytes, ebx, stream, eax, 4, 0
                test    eax, eax
                jz      @close_sock
                invoke  closesocket, ebx

                invoke  DNSHandleRequest, stream
                mov     ebx, eax
                invoke  lstrlen, eax
                .IF     !eax
                        ; Empty string
                        invoke  GlobalFree, ebx
                        xor     eax, eax
                .ELSE
                        mov     eax, ebx
                .ENDIF
                ret
@close_sock:
                invoke  closesocket, ebx
        .ENDIF
        xor     eax, eax
        ret
DNSRequest endp

; Read compressed string chunk and append it to strmem
DNSReadChunk proc uses esi edi basemem, mem, strmem: DWORD
        mov     esi, mem

@next_read:
        cld
        xor     eax, eax
        lodsb

        test    al, 11000000b
        .IF     !ZERO?
                and     al, 00111111b
                shl     ax, 8
                ; Second octet of the offset
                lodsb
                push    esi
                mov     esi, basemem
                add     esi, eax
                invoke  DNSReadChunk, basemem, esi, strmem
                pop     esi
        .ELSEIF al
                push    eax
                invoke  lstrlen, strmem
                mov     edi, strmem
                add     edi, eax
                pop     ecx
                jecxz   @no_cpe_str

                cld
                rep movsb

        @no_cpe_str:
                mov     al, '.'
                stosb
                xor     eax, eax
                stosb

                jmp     @next_read
        .ENDIF

        mov     eax, esi        
        ret
DNSReadChunk endp

; Read compressed string
DNSReadString proc basemem, mem, strmem: DWORD
        szText  DNSTrimChars, "."
        mov     eax, strmem
        mov     byte ptr[eax], 0

        invoke  DNSReadChunk, basemem, mem, strmem
        push    eax
        invoke  StrTrim, strmem, offset DNSTrimChars
        pop     eax
        ret
DNSReadString endp

; Handles only MX records, returns string with MX server on success
; Otherwise returned string consists from NULL terminator only
DNSHandleRequest proc uses esi edi ebx stream: DWORD
        LOCAL   hMem, hStr, hStr2: DWORD
        LOCAL   pref: WORD

        mov     pref, 65535     ; MX PREFERENCE

        invoke  GlobalAlloc, GMEM_FIXED, 65536
        mov     hStr, eax

        invoke  GlobalAlloc, GMEM_FIXED, 65536
        mov     byte ptr[eax], 0
        mov     hStr2, eax

        invoke  StreamGetLength, stream
        mov     ebx, eax
        invoke  GlobalAlloc, GMEM_FIXED, eax
        mov     hMem, eax
        invoke  StreamGotoBegin, stream
        coinvoke stream, IStream, Read, hMem, ebx, 0

        mov     esi, hMem
        assume  esi: ptr DNS_HEADER
        ror     [esi].ANCOUNT, 8
        ror     [esi].OPCODE, 8
        test    [esi].OPCODE, 1111b
        .IF     !ZERO?
                jmp     @yep_the_error
        .ENDIF

        movzx   ebx, [esi].ANCOUNT
        add     esi, sizeof DNS_HEADER

        ; Skip question
        invoke  DNSReadString, hMem, esi, hStr
        mov     esi, eax
        lodsd   ; Type & Class
        .IF     eax != 01000f00h
                jmp     @yep_the_error
        .ENDIF

        ; Read answer
        .IF     ebx
                @read_answer:
                invoke  DNSReadString, hMem, esi, hStr
                mov     esi, eax
                lodsd   ; Type, Class
                push    eax
                lodsd   ; TTL
                xor     eax, eax
                lodsw   ; RDLENGTH
                
                pop     edx
                .IF     edx != 01000f00h
                        ; RDATA(Unknown), skip
                        xchg    al, ah
                        add     esi, eax
                .ELSE
                        ; RDATA(MX)
                        lodsw   ; PREFERENCE
                        push    ax
                        invoke  DNSReadString, hMem, esi, hStr
                        mov     esi, eax
                        pop     dx

                        ; Store MX host
                        .IF     dx < pref
                                mov     pref, dx
                                invoke  lstrcpy, hStr2, hStr
                        .ENDIF
                .ENDIF
                dec     ebx
                jnz     @read_answer
        .ENDIF

@yep_the_error:
        invoke  GlobalFree, hMem
        invoke  GlobalFree, hStr
        mov     eax, hStr2
        ret
DNSHandleRequest endp

; Retrieves MX record for szBaseHost, returns null terminated 
; host on success, otherwise null
DNSGetMXHost proc szBaseHost: DWORD
        LOCAL   stream: DWORD

        .IF     !bDNSLoaded
                mov     bDNSLoaded, 1
                .IF     dwGetNetworkParams
                        invoke  DNSGetServer
                .ENDIF
        .ENDIF

        invoke  StreamCreate, addr stream
        invoke  DNSQuery, stream, szBaseHost
        invoke  DNSRequest, stream, offset szDNSHost
        push    eax
        invoke  StreamFree, stream
        pop     eax
        ret
DNSGetMXHost endp
