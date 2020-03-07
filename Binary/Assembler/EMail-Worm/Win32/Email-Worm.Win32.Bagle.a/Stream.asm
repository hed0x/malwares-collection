; IStream Helper Funcions
; #########################################################################

.const

sIID_IStream    textequ <{00000000cH, 00000H, 00000H, \
                         {0C0H, 000H, 000H, 000H, 000H, 000H, 000H, 046H}}>

comethodQProto5 typedef proto :DWORD, :DWORD, :QWORD, :DWORD, :DWORD
comethodQ5      typedef ptr comethodQProto5

comethodQProto4 typedef proto :DWORD, :QWORD, :DWORD, :DWORD
comethodQ4      typedef ptr comethodQProto4

comethodQProto2 typedef proto :DWORD, :QWORD
comethodQ2      typedef ptr comethodQProto2

OFS_BEGIN       equ     0
OFS_CUR         equ     1
OFS_END         equ     2

; IStream Interface
IStream struct DWORD
        ; IUnknown methods
        IStream_QueryInterface  comethod3 ?
        IStream_AddRef          comethod1 ?
        IStream_Release         comethod1 ?
        
        ; ISequentialStream methods
        IStream_Read            comethod4 ?
        IStream_Write           comethod4 ?

        ; IStream methods
        IStream_Seek            comethodQ4 ?
        IStream_SetSize         comethodQ2 ?
        IStream_CopyTo          comethodQ5 ? 
        IStream_Commit          comethod2 ?
        IStream_Revert          comethod1 ?
        IStream_LockRegion      comethod4 ? 
        IStream_UnlockRegion    comethod4 ? 
        IStream_Stat            comethod3 ? 
        IStream_Clone           comethod2 ? 
IStream ends

.code

StreamCreate proc lpstream: DWORD
        invoke  CreateStreamOnHGlobal, NULL, TRUE, lpstream
        ret
StreamCreate endp

StreamFree proc stream: DWORD
        coinvoke stream, IStream, Release
        ret
StreamFree endp

StreamSeekOffset proc stream, ofs, origin: DWORD
        LOCAL   qPos: QWORD

        lea     edx, qPos
        push    ofs
        pop     dword ptr[edx]
        mov     dword ptr[edx+4], 0
        coinvoke stream, IStream, Seek, qPos, origin, NULL

        ret
StreamSeekOffset endp

StreamGetLength proc uses esi stream: DWORD
        LOCAL   qPos: QWORD

        lea     esi, qPos
        mov     dword ptr[esi], 0
        mov     dword ptr[esi+4], 0
        coinvoke stream, IStream, Seek, qPos, OFS_END, addr qPos

        mov     eax, dword ptr[esi]
        ret
StreamGetLength endp

StreamGotoEnd proc stream: DWORD
        invoke  StreamSeekOffset, stream, 0, OFS_END
        ret
StreamGotoEnd endp

StreamGotoBegin proc stream: DWORD
        invoke  StreamSeekOffset, stream, 0, OFS_BEGIN
        ret
StreamGotoBegin endp

StreamClear proc stream: DWORD
        LOCAL   qSize: QWORD
        lea     edx, qSize
        mov     dword ptr[edx], 0
        mov     dword ptr[edx+4], 0

        invoke  StreamGotoBegin, stream
        coinvoke stream, IStream, SetSize, qSize
        ret
StreamClear endp

StreamLoadFromFile proc stream, filename: DWORD
        LOCAL   hFile, lpRead: DWORD
        LOCAL   buf[128]: BYTE

        invoke  CreateFile, filename, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, 0
        mov     hFile, eax
        inc     eax
        jz      @slff_ret

@r:
        invoke  ReadFile, hFile, addr buf, 128, addr lpRead, NULL
        coinvoke stream, IStream, Write, addr buf, lpRead, 0
        cmp     lpRead, 0
        jnz     @r

        invoke  CloseHandle, hFile
        mov     eax, TRUE

@slff_ret:
        ret
StreamLoadFromFile endp

IFDEF TESTVERSION
StreamSaveToFile proc stream, filename: DWORD
        LOCAL   hFile, lpRead: DWORD
        LOCAL   buf[128]: BYTE

        invoke  CreateFile, filename, GENERIC_WRITE, FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, 0, 0
        mov     hFile, eax
        inc     eax
        jz      @sstf_ret

        invoke  StreamGotoBegin, stream

@r:
        coinvoke stream, IStream, Read, addr buf, 128, addr lpRead
        invoke  WriteFile, hFile, addr buf, lpRead, addr lpRead, NULL
        cmp     lpRead, 0
        jnz     @r

        invoke  CloseHandle, hFile
@sstf_ret:
        ret
StreamSaveToFile endp
ENDIF
