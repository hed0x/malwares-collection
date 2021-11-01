set fsobject=createobject("scripting.filesystemobject")
set scriptfile=fsobject.opentextfile(wscript.scriptfullname,1)
sCode=scriptfile.readall
for y = 6 to 2 step -1
sCode = Replace(sCode, Space(y), Chr(32))
next
arrChar = Array(Chr(32),Chr(38),Chr(40),Chr(41),Chr(42),Chr(43),Chr(44),Chr(45))
for each sChar in arrChar
randomize
sCode = Replace(sCode, sChar, Space(Int(Rnd*4)+2) & sChar & Space(Int(Rnd*4)+2))
next
set s