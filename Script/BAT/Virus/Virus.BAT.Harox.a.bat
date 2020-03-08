   @echo off
   color 2
   title %hack&
   echo "|-|4><0|2 VERSION 2.2.34"
   ECHO  Usage: Haxor -F [Drive:\] [IP/HostName] [Port]
   echo (EG) hAXOR 127.0.0.1
   echo Options:
   echo   -F FORMAT The Drive To Format
   set time=%time%
   set /p hack=HAXOR -F C:\ %Hack% %ip%
   Echo Connecting.....................................
   echo Connected to IP:%hack%  %ip% At %TIME%
   set /p user=User:%user%
   set /p pass=Password:%pass%
   ECHO Valid Password
   Echo Logged in as %user% %pass%
   SET /P mESSAGE=message:%Message%
   echo Message Sent.
   echo Formatting C:\
   echo Formatting Complete %drive%.at %time%
   Echo Diconnected From:%Hack% At %Time%
   Mkdir C:\Haxor
   copy ass.bat c:\Haxor\Haxor.bat
   pause
