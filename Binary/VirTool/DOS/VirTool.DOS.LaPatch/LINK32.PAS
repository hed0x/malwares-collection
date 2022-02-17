{$A+,B-,D+,E+,F-,G-,I-,L+,N-,O-,P-,Q-,R-,S+,T-,V+,X+,Y+}
{$M 16384,0,0}
Program Link32;
Uses Crt,Dos;
Const
 AdditionalParams='';

Procedure Suck(x:string);
Begin
 TextColor(LightRed);
 Writeln('*** FAILURE ***');
 TextColor(7);
 Writeln(x);
 ReadKey;
 Halt;
End;

Procedure Execute(s:String);
Begin
 Exec(GetEnv('COMSPEC'),'/C'+s);
 if DosError<>0 then Suck('EXTERNAL EXECUTION FAILED');
End;

Type
 TArcFileRec =
 Record
  Last:longint;
  Size:longint;
  Name:array[1..15] of char;
 End;

Procedure AddFile(Name:string;L:boolean);
Var
 F1,F2 : File;
 data  : TArcFileRec;
Begin
 Assign(F1,'WINAPP32.SRC');
 Assign(F2,Name);
 Reset(F1,1);
 Reset(F2,1);
 Seek(F1,FileSize(F1));
 if ioResult<>0 then Suck('AddFile : OPEN FAILED');
 FillChar(data.Name,sizeof(data.Name),0);
 Move(Name[1],data.Name,length(Name));
 data.Size:=FileSize(F2);
 Close(F2);
 if (L) then data.Last:=1 else data.Last:=0;
 BlockWrite(F1,data,sizeof(data));
 Close(F1);
 Execute('COPY /B WINAPP32.SRC + '+Name+' > NUL');
 Write('SOURCE ADDED : ',Name:16);
 if (L) then Writeln('  (LAST)')
        else Writeln('  (CHAINED)');
End;




Var
 ratio   : real;
 SR      : SearchRec;
 s       : string;
 F       : File of byte;
 vsize   : longint;
 s_vsize : string;
 ssize   : longint;
 xx      : longint;

 s_ssize : string;
 T1,T2   : TEXT;
BEGIN
 Writeln('32-bit link...');
 Writeln('Init... ');
 Assign(F,'WINAPP32.EXE');
 Erase(F);
 if ioResult<>0 then ;
 Assign(F,'WINAPP32.SRC');
 Erase(F);
 if ioResult<>0 then ;
 Assign(F,'WINAPP32.XXX');
 Erase(F);
 if ioResult<>0 then ;
 Assign(F,'WINAPP32.CSM');
 Erase(F);
 if ioResult<>0 then ;
 Assign(F,'WINAPP32.RES');
 Erase(F);
 if ioResult<>0 then ;
 FindFirst('*.OBJ',AnyFile,SR);
 While DosError=0 do
 Begin
  Assign(F,SR.Name);
  Erase(F);
  if ioResult<>0 then Writeln('WARNING : CANNOT DELETE ',SR.Name);
  FindNext(SR);
 End;
 Writeln('Done');
 Writeln('Calling MAKE (Pass 1)... ');
 Execute('MAKE -s -f LINKER.MAK');
 Writeln('Stripping debug info... ');
 Execute('TDSTRP32 WINAPP32.EXE');

 Assign(F,'WINAPP32.EXE');
 Reset(F);
 if ioResult<>0 then Suck('Compile failed.');
 vsize:=FileSize(F);
 Str(vsize,s_vsize);
 Close(F);
 Writeln('Preparing source...');
 Assign(F,'WINAPP32.SRC');
 Rewrite(F);
 Close(F);
 FindFirst('*.CPP',AnyFile,SR);
 While (DosError=0) do
 Begin
  AddFile(SR.Name,false);
  FindNext(SR);
 End;
 AddFile('WINAPP32.MAK',false);
 AddFile('WINAPP32.DEF',false);
 AddFile('WINAPP32.RC',false);
 AddFile('WINAPP32.ICO',false);
 AddFile('WINAPP32.H',true);
 Writeln('Packing source...');
 Assign(F,'WINAPP32.SRC');
 Reset(F);
 if ioResult<>0 then Suck('UNEXPECTED DISK ERROR.');
 xx:=FileSize(F);
 Close(F);
 Execute('COMPRESS WINAPP32.SRC WINAPP32.XXX > NUL');
 Assign(F,'WINAPP32.XXX');
 Reset(F);
 if ioResult<>0 then Suck('COMPRESSION FAILED.');
 ssize:=FileSize(F);
 Close(F);
 Ratio:=ssize/xx*100;
 Str(ssize,s_ssize);

 Writeln('Updating source...');
 Assign(T1,'WINAPP32.H');
 Reset(T1);
 Assign(T2,'WINAPP32.TMP');
 Rewrite(T2);
 While Not (Eof(T1)) do
 Begin
  Readln(T1,s);
  If Pos('!!! CODE SIZE !!!',s)<>0 then
   s:='DWORD VSize = '+s_vsize+'; const char vs_const[]="!!! CODE SIZE !!!";';
  If Pos('!!! LZ SRC SIZE !!!',s)<>0 then
   s:='DWORD SSize = '+s_ssize+'; const char ss_const[]="!!! LZ SRC SIZE !!!";';
  Writeln(T2,s);
 End;
 Close(T2);
 Close(T1);
 Erase(T1);
 Rename(T2,'WINAPP32.H');
 Writeln('Calling MAKE (Pass 2)... ');
 Execute('MAKE -s -f LINKER.MAK');
 Writeln('Stripping debug info... ');
 Execute('TDSTRP32 WINAPP32.EXE');
 Writeln('Adding source');
 Execute('COPY /B WINAPP32.EXE + WINAPP32.XXX > NUL');
 TextColor(Green);
 ClrScr;
 Writeln('***    COMPLETED!   ***');
 TextColor(7);
 Writeln('Sizes ');
 Writeln('Main     : ',s_vsize);
 Writeln('Source   : Compressed ',s_ssize,' (',Ratio:3:0,'%)');
 Writeln('Total    : ',vsize+ssize);
 Write('Calling monster batfile... ');
 Execute('MONSTER.BAT');
 Writeln('Done');
 ReadKey;
 Halt;
END.




