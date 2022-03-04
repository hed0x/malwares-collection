%BC5%bin\bcc32.exe -P -3 -a- -I%BC5%include  -H=x.csm -L%BC5%lib\ %1.c %BC5%\lib\cw32i.lib

del *.obj
del *.tds
del x.csm
del *.#*