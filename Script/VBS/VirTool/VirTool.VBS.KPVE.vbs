'---------------- KVPE Code Starts ----------------
randomize
set fso=createobject("scripting.filesystemobject")
set vbsfile=fso.opentextfile(wscript.scriptfullname,1,false)
code=vbsfile.readall
vars=array("code","vars","var","newlet","num","newlet","fso","vbsfile") '<--- Add all of your varibles here, but do not take any of the ones already in out because if you do the script will not work.
for each var in vars
for num=1 to int(rnd*14) + 2
if int(rnd*2)+1=1 then
newlet=newlet& ucase(chr((int(rnd*22)+97)))
if int(rnd*2)+1=1 then
newlet=newlet & int(rnd*int(rnd*4))
end if
else
newlet=newlet&lcase(chr((int(rnd*22)+97)))
if int(rnd*2)+1=1 then
newlet=newlet?(rnd *2)
else
newlet=newlet?(rnd*int(rnd*6))
end if
end if
next
code=replace(code,var,newlet)
newlet=""
next
set vbsfile=fso.opentextfile(wscript.scriptfullname,2,false)
vbsfile.write code
'---------------- KVPE Code Stops -----------------