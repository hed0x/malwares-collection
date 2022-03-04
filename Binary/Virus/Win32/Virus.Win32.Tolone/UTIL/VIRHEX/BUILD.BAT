%BC5%bin\bcc32.exe -lap -P -3 -O2 -C -I%BC5%include  -H=x.csm -L%BC5%lib\ virhex.c %BC5%\lib\cw32i.lib
del virhex.obj

del x.csm
del *.#00

virhex.exe
