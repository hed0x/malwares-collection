on error resume next
dim WSHshellA
set WSHshellA = wscript.createobject("wscript.shell")
WSHshellA.run "cmd.exe /c shutdown -r -t 160 -c ""不爱我就关机"" ",0 ,true  
dim a
do while(a <> "我爱你")
a = inputbox ("说你爱我,就不关机，快萨，说 ""我爱你""　","爱不爱我","不爱",8000,7000)
msgbox chr(13) + chr(13) + chr(13) + a,0,"MsgBox"
loop
msgbox chr(13) + chr(13) + chr(13) + "就晓得你是爱我的"
dim WSHshell
set WSHshell = wscript.createobject("wscript.shell")
WSHshell.run "cmd.exe /c shutdown -a",0 ,true  
msgbox chr(13) + chr(13) + chr(13) + "就晓得你是爱我的, 记得打电话我阿"