   @ if exist Last.exe del Last.exe
   @ bcc32 -tW Last.cpp
   @ upx -9 Last.exe
   @ del *.obj
   @ del *.tds
