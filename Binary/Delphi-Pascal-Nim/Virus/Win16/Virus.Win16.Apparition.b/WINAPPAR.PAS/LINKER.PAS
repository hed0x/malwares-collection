{$A+,B-,D+,F+,G+,I+,K+,L+,N-,P-,Q-,R-,S+,T-,V+,W+,X+,Y+}
{$M 16384,0,0}
Program Linker;
Uses Crt,Dos;
Var
 e       : boolean;
 b       : byte;
 F,f1,f2 : File of byte;
 T1, T2  : Text;
 ts,fs,cts,css,ss,rs: longint;
 s,sts,sfs,scts,scss,sss,srs: string;
Procedure Execute(s:String);
Begin
 Exec(GetEnv('COMSPEC'),'/c'+s);
 if DosError<>0 then
 Begin
  Writeln('Execution error, code ',DosError);
  halt;
 End;
End;


BEGIN
 Writeln('Linking...');
 Writeln('Compiling resources...');
 Execute('BRC.EXE MAIN.RC -R -FOMAIN.RES');
 Writeln('Compiling main...');
 Execute('BPC.EXE WINAPP.PAS -DPRODUCTION -CW -UD:\LANG\BP\UNITS -RD:\LANG\BP\UNITS');
 Assign(F,'WINAPP.EXE');
 Reset(F);
 fs:=FileSize(F);
 Close(F);

 Assign(F,'TEMPLATE.DOT');
 Reset(F);
 ts:=FileSize(F);
 Close(F);
 Assign(F,'TEMPLATE.XXX');
 Reset(F);
 cts:=FileSize(F);
 Close(F);

 Writeln('Compressing source...');
 Execute('LZ-WA.EXE WINAPP.PAS /C WINAPP.XXX');

 Assign(F,'WINAPP.PAS');
 Reset(F);
 ss:=FileSize(F);
 Close(F);
 Assign(F,'WINAPP.XXX');
 Reset(F);
 css:=FileSize(F);
 Close(F);

 Assign(F,'MAIN.RES');
 Reset(F);
 rs:=FileSize(F);
 Close(F);

 Str(ts,sts);
 Str(fs,sfs);
 Str(cts,scts);
 Str(css,scss);
 Str(ss,sss);
 Str(rs,srs);
 Writeln('Updating constants...');
 Assign(T1,'WINAPP.PAS');
 Reset(T1);
 Assign(T2,'WINAPP.TMP');
 Rewrite(T2);
 While Not (Eof(T1)) do
 Begin
  Readln(T1,s);
  If Pos('!!! CODE SIZE !!!',s)<>0 then s:=' VSize='+sfs+'; cs_const='' !!! CODE SIZE !!! '';';
  If Pos('!!! COMPRESSED TEMPLATE SIZE !!!',s)<>0 then s:=' CTemplateSize='+scts+'; { !!! COMPRESSED TEMPLATE SIZE !!! }';
  If Pos('!!! DECOMPRESSED TEMPLATE SIZE !!!',s)<>0 then s:=' XTemplateSize='+sts+'; { !!! DECOMPRESSED TEMPLATE SIZE !!! }';
  If Pos('!!! DECOMPRESSED SRC SIZE !!!',s)<>0 then s:=' XSrcSize='+sss+'; xss_const = '' !!! DECOMPRESSED SRC SIZE !!! '';';
  If Pos('!!! COMPRESSED SRC SIZE !!!',s)<>0 then s:=' CSrcSize='+scss+'; css_const = '' !!! COMPRESSED SRC SIZE !!! '';';
  If Pos('!!! RESOURCE SIZE !!!',s)<>0 then s:=' ResSize='+srs+'; { !!! RESOURCE SIZE !!! }';
  Writeln(T2,s);
 End;
 Close(T2);
 Close(T1);
 Erase(T1);
 Rename(T2,'WINAPP.PAS');

 Writeln('Recompiling main...');
 Execute('BPC.EXE WINAPP.PAS -DPRODUCTION -CW -UD:\LANG\BP\UNITS -RD:\LANG\BP\UNITS');
 Writeln('Appending template and sources...');
 Execute('COPY /B WINAPP.EXE +  TEMPLATE.XXX + WINAPP.XXX + MAIN.RES TEMP$$$ > NUL');
 Execute('COPY /B TEMP$$$ WINAPP.EXE > NUL');
 Execute('DEL TEMP$$$ > NUL');
 Writeln('Recompiled,');
 Writeln('Code                  : ',sfs);
 Writeln('Template (Compressed) : ',scts);
 Writeln('Source (Compressed)   : ',scss);
 Writeln('Resource              : ',srs);
 Writeln('Total                 : ',cts+fs+css+rs);
END.