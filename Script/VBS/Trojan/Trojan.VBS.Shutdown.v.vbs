 on error resume next
 dim WSHshellA
 set WSHshellA = wscript.createobject("wscript.shell")
 WSHshellA.run "cmd.exe /c shutdown -s -t 10 -c ""说爷是个大帅哥，不说就一分钟关你机，不信，试试···"" ",0 ,true  
 dim a
 do while(a <> "爷是个大帅哥")
 a = inputbox ("说爷是个大帅哥,就不关机，快哈，说 ""爷是个大帅哥""　","说不说","不说",8000,7000)
 msgbox chr(13) + chr(13) + chr(13) + a,0,"MsgBox"
 loop
msgbox chr(13) + chr(13) + chr(13) + "早说就行了嘛"
dim WSHshell
set WSHshell = wscript.createobject("wscript.shell")
WSHshell.run "cmd.exe /c shutdown -a",0 ,true  
msgbox chr(13) + chr(13) + chr(13) + "哈哈，好玩吧！！！(*^__^*) 嘻嘻……"


