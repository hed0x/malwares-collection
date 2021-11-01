rem me is tools of endfix.vbs
on error resume next
dim fs,sh
set fs=createobject("scripting.filesystemobject")
set sh=createobject("wscript.shell")
sh.run"explorer.exe "&fs.getfile(wscript.scriptfullname).drive.path&"\"
sh.run"wscript.exe endfix.vbs"