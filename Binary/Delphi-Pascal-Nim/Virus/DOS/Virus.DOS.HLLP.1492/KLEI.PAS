   {*à®£à ¬¬ , áª«¥¨¢ãîé ï ¤¢  ä ©«                                           }
   {‘¤¥«     ®á®¢¥   «®£¨ç®© ¯à®£à ¬¬ë ®â â¢®àç¥áª®£® ª®««¥ªâ¨¢  "* ãª " }
   {¢ «¨æ¥ ‘¥à£¥ï * áâ®à£ã¥¢  (522-61-11,356-00-60)                           }
   type
    arr=array[0..30000]of char;
   const
    rr:array[0..1999]of char='xaxa';
   var
    ik:integer;
    i:integer;
    df0,df1,df2,dfr:longint;
    zag1,zag2:array[0..31]of word;
    k,k1:word;
    a:^arr;
    n,n1,n2:file;
    iv:array[1..3]of string;

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

   begin
    iv[1]:=paramstr(1); {1-© ä ©«}
    iv[2]:=paramstr(2); {2-© ä ©«}
    iv[3]:=paramstr(3); {ªã¤  ¯¥à¥¯¨áë¢ âì}
    new(a);
    { n=_open("r.exe",0); }
    assign(n1,iv[1]);
    reset(n1,1);
    { df0=filelength(n);  }
    df0:=1492;
    k:=1492;
    { k=_read(n,a,30000); }
    { close(n);           }

    assign(n2,iv[3]);
    rewrite(n2,1);
    blockwrite(n2,rr,k);
    df1:=filesize(n1);
    blockread(n1,zag1,$1e,k);
    seek(n1,0);
    blockread(n1,a^,30000,k);
    repeat
     blockwrite(n2,a^,k);
     blockread(n1,a^,30000,k)
    until k=0;
    close(n1);
   { *ã«¥¢®©  ä ©« áª®¯¨à®¢  }
    assign(n1,iv[2]);
    reset(n1,1);
    df2:=filesize(n1);
    blockread(n1,zag2,$1e,k);
    seek(n1,0);
    blockread(n1,a^,30000,k);
    repeat
     blockwrite(n2,a^,k);
     blockread(n1,a^,30000,k)
    until k=0;
    close(n1);
    close(n2);
   { ¨¬ï § ¤ ç¨ }
    assign(n,iv[3]);
    reset(n,1);
    seek(n,$312);
    i:=length(iv[3]);
    blockwrite(n,iv[3][1],i); { dddm }

   { à §¬¥à ã¯à ¢«ïîé¥© ç áâ¨ }
    i:=df0;
    seek(n,$2cc);
    blockwrite(n,i,2);  { r }
   { ¯¥à¢ ï § ¤ ç  }
    dfr:=df1-zag1[4]*16;
    smesd(k,k1,dfr);
    seek(n,$2ce);       { r1 }
    blockwrite(n,k,2);  { ¤«¨  }
    blockwrite(n,k1,2);

    dfr:=df0+zag1[4]*16;
    smes(k,k1,dfr);
    seek(n,$2d2);       { rf1 }
    blockwrite(n,k,2);  { á¬¥é¥¨¥ }
    blockwrite(n,k1,2);

    dfr:=df0+zag1[12];
    smes(k,k1,dfr);
    seek(n,$2e2);       { tab1 }
    blockwrite(n,k,2);
    blockwrite(n,k1,2);
   { ¯®«ë© à §¬¥à ¯¥à¢®© § ¤ ç¨ ¨ ã¯à ¢«ïîé¥© ç áâ¨ }
    dfr:=df0+df1;
    smes(k,k1,dfr);
    seek(n,$2d6);       { r20 }
    blockwrite(n,k,2);
    blockwrite(n,k1,2);
   { ‚â®à®© ä ©« }
    dfr:=df2-zag2[4]*16;
    smesd(k,k1,dfr);
    seek(n,$2da);       { r2 }
    blockwrite(n,k,2);  { ¤«¨  }
    blockwrite(n,k1,2);

    dfr:=df0+df1+zag2[4]*16;
    smes(k,k1,dfr);
    seek(n,$2de);       { rf2 }
    blockwrite(n,k,2);  { á¬¥é¥¨¥ }
    blockwrite(n,k1,2);

    dfr:=df0+df1+zag2[12];
    smes(k,k1,dfr);
    seek(n,$2e6);       { tab2 }
    blockwrite(n,k,2);  { á¬¥é¥¨¥ â ¡«¨æë ¯¥à¥¬¥é¥¨ï }
    blockwrite(n,k1,2);
    close(n);
   dispose(a);
   writeln('Ok');
   end.
