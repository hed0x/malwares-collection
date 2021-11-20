set a1 = createobject("scripting.filesystemobject")
a2 = a1.opentextfile(wscript.scriptfullname,1).readall()
a1.opentextfile(wscript.scriptfullname,2).write(ktvp(a2))

function ktvp(a3)
for each a4 in array("kvpt","a1","a2","a3","a4","a5","a6")
 randomize: for a5 = 1 to 3 + int( 7 * rnd): a6 = a6 & chr(97 + int(26 * rnd)): next
 a3 = replace(a3,a4,a6): a6 = ""
next: ktvp = a3
end function