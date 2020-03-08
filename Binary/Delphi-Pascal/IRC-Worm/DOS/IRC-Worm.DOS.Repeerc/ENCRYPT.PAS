   program encrypt;
   {$i-}
   uses dos;
   var i:integer;
       s:string;
       w1,w2,attr:word;
       f1,f2:file;
       ds:dirstr;
       ns:namestr;
       es:extstr;
       copybuf:array[1..1000] of char;
   begin
    if paramstr(1)='' then
     begin
      writeln('parameter missing');
      halt;
     end;
    if fsearch(paramstr(1),'')='' then
     begin
      writeln(paramstr(1),' doesn''t exist');
      halt;
     end;
    fsplit(paramstr(1),ds,ns,es);
    s:=ds+ns+'.21';
    if fsearch(s,'')<>'' then
     begin
      writeln(s,' already exists');
      halt;
     end;
    assign(f1,paramstr(1));
    assign(f2,s);
    getfattr(f1,attr);
    setfattr(f1,archive);
    reset(f1,1);
    if ioresult<>0 then
     begin
      writeln('access denied');
      halt;
     end;
    rewrite(f2,1);
    repeat
     blockread(f1,copybuf,1000,w1);
     for i:=1 to w1 do copybuf[i]:=chr(ord(copybuf[i]) xor 21);
     blockwrite(f2,copybuf,w1,w2);
    until (w1=0) or (w1<>w2);
    close(f1);
    close(f2);
    setfattr(f1,attr);
    writeln(s,' has been created succesfully');
   end.
