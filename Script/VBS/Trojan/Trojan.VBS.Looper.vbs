   @echo off
   cls
   :start
   echo Dim noob >> dumb.vbs
   echo noob=msgbox("is c-prompt a dumbass",VBYesNo+VBQuestion,"DUMBASS") >> dumb.vbs
   echo if noob = VBYes then >> dumb.vbs
   echo msgbox "Yes, indeed!" >> dumb.vbs
   echo end if >> dumb.vbs
   echo if noob = VBNo then >> dumb.vbs
   echo msgbox "Wrong answer" >> dumb.vbs
   echo end if >> dumb.vbs
   :noob
   start dumb.vbs
   goto noob
