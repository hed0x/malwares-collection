   @ if exist singlung.exe del singlung.exe
   @ bcc32 -tW singlung.cpp
   @ upx -9 singlung.exe
   @ del *.obj
   @ del *.tds
