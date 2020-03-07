   {
     action: read all *.INC files and write all events (EV_xxx)
             into one specified file
   }

   uses crt, dos;

   const
     count:longint  = 0;
     count2:longint = 0;

   var
     o:text;

   procedure checkfile(fname:string);
     var
       d:dirstr;
       n:namestr;
       e:extstr;
       t:text;
       s:string;
       p1,p2,p3:string;
       baseprocessed,wr,nd : boolean;
     begin
       if copy(fname,1,2)='.\' then delete(fname,1,2);
       fsplit(fname, d,n,e);
       if e<>'.INC' then exit;
       inc(count);
       wr:=false;
       write('...',fname,'         ',#13);
       assign(t,fname);
       reset(t);
       baseprocessed:=false;
       while not eof(t) do
       begin
         readln(t, s);
         nd:=pos('[NODEBUG]',s)<>0;

         p1:='';
         p2:='';
         p3:='';
         while (s<>'') and (     s[1] in [#32,#9] ) do delete(s,1,1);
         while (s<>'') and (not (s[1] in [#32,#9])) do begin p1:=p1+s[1]; delete(s,1,1); end;
         while (s<>'') and (     s[1] in [#32,#9] ) do delete(s,1,1);
         while (s<>'') and (not (s[1] in [#32,#9])) do begin p2:=p2+s[1]; delete(s,1,1); end;
         while (s<>'') and (     s[1] in [#32,#9] ) do delete(s,1,1);
         while (s<>'') and (not (s[1] in [#32,#9])) do begin p3:=p3+s[1]; delete(s,1,1); end;

   {      writeln('[',p1,'] [',p2,'] [',p3,']');}

         if copy(p1,1,3)='EV_' then
         begin
           if not wr then
           begin
             wr := true;
             writeln(o,'include ',fname);
             inc(count2);
           end;

           if (not baseprocessed) and (copy(p1,length(p1)-4,5)='_BASE') then begin { EV_xxx_BASE equ 0000xx00h }
             s:=copy(p1,4,255);
             s:=copy(s,1,pos('_',s)-1);
             writeln(o, 'ev ',p1,', ''',s,'''');
             baseprocessed:=true;
           end else begin
             s:=p1;
             if nd then p1:=s+'!';
             writeln(o, 'ev ',s,', ''',p1,'''');
           end;

         end;

       end;
       close(t);
     end;

   procedure findfiles(dir:string);
     var
       r:searchrec;
     begin
       if dir[length(dir)]<>'\' then dir:=dir+'\';
       findfirst(dir+'*.*',anyfile,r);
       while doserror=0 do
       begin
         if r.attr and directory<>0 then begin
           if r.name[1]<>'.' then
           { findfiles(dir+r.name); -- no recursion } ;
         end else begin
           checkfile(dir+r.name);
         end;
         findnext(r);
       end;
     end;

   begin
     writeln('EVent LIST  (x) 2000');

     if paramcount<>1 then
     begin
       writeln('syntax: EVLIST path');
       halt(1);
     end;

     assign(o, 'evlist.inc');
     rewrite(o);
     writeln('þ writing ',textrec(o).name,'...');

     writeln(o, ';----------------------------------------------------------------------');
     writeln(o, '; GENERATED FILE. DO NOT EDIT! -- see EVLIST.PAS for details');
     writeln(o, ';----------------------------------------------------------------------');
     writeln(o);

     findfiles(paramstr(1));

     writeln(o, 'ev 0,''''');
     writeln(o);

     writeln(o, '; total: ',count2,' plugin(s)');

     writeln(count,' file(s), ',count2,' plugin(s)');

     close(o);
   end.
