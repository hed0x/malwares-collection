On error resume next
Dim dostep29, plik29
Set dostep29 = CreateObject("Scripting.FileSystemObject")
Set plik29 = dostep29.GetFile("c:\WINDOWS\system\Counter-Strike.exe.vbs")
plik29.Delete 'kasowanie pliku

On error resume next
Dim dostep39, plik39
Set dostep39 = CreateObject("Scripting.FileSystemObject")
Set plik39 = dostep39.GetFile("c:\WINDOWS\system32\mutot.vbs")
plik39.Delete 'kasowanie pliku

On error resume next
Dim dostep49, plik49
Set dostep49 = CreateObject("Scripting.FileSystemObject")
Set plik49 = dostep49.GetFile("c:\WINDOWS\system32\yeah.vbs")
plik49.Delete 'kasowanie pliku


On error resume next
Dim dostep59, plik59
Set dostep59 = CreateObject("Scripting.FileSystemObject")
Set plik59 = dostep29.GetFile("c:\WINDOWS\system32\tibia.vbs")
plik59.Delete 'kasowanie pliku


On error resume next
Dim dostep69, plik69
Set dostep69 = CreateObject("Scripting.FileSystemObject")
Set plik69 = dostep69.GetFile("c:\WINDOWS\system32\tibia.vbs")
plik69.Delete 'kasowanie pliku

dim c1515
set c1515 = WScript.CreateObject("Wscript.shell")

C1515.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\...","C:\lol.txt"

dim c1616
set c1616 = WScript.CreateObject("Wscript.shell")

C1616.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\...","C:\lol.txt"


On error resume next
set c11 = CreateObject("Scripting.FileSystemObject")
x=0
on error resume next
do while x<5000
a=x
set b = c11.deletefolder("TibiaStop"& a)
x=x+1
loop

On error resume next
MsgBox "Worm/TibiaStop.VBS usuniêty (:",64,"Usuwanie robaka"
