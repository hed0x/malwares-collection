   @echo off
   color 2
   echo.
   echo **These Batch File Formats A CD **
   echo.
   echo *******************************
   echo ******** Create By Richard *******
   echo ******** 06/06/04 *************
   echo ******** ver 1.0  ***************
   pause
   echo.
   echo **** Are You Sure U Want To Format These CD?
   echo **** You May Lose All Data On CD
   echo **** Press Enter To Format ****
   echo.
   echo.
   echo **** Press Ctrl+C to Quit ****
   pause
   echo Am Formating Your CD ***.
   echo.
   echo These May Take Several Minutes ....
   echo Please wait ....
   Format d: /fs:fat
   echo.
   echo  .End Of Format.
   echo.
   cls
   color
