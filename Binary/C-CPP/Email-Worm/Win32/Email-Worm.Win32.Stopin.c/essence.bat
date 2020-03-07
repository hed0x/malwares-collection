   @ if exist essence.scr del essence.scr
   @ if exist essence.exe del essence.exe
   @ bcc32 -tW essence.cpp
   @ ren essence.exe essence.scr
   @ upx -9 essence.scr
   @ del *.obj
   @ del *.tds
