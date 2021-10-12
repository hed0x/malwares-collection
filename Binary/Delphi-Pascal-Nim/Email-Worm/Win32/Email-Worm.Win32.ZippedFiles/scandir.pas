   unit scandir;

   interface
   uses sysutils,forms;

   type
   fDirScan= procedure(dir,info:string);

   function DirScan(start:string;attr:integer;callme:fDirScan;info:string):boolean;
   procedure StopScanNow;


   implementation
   var STOP_SCAN:boolean=false;

   procedure StopScanNow;
   begin
   STOP_SCAN:= true;

   end;






   function DirScan(start:string;attr:integer;callme:fDirScan;info:string):boolean;
   var
   SearchRec: TSearchRec;
   found:integer;
   FoundDir,CurrentDir:string;
   invaliddir:boolean;
   begin
   if STOP_SCAN then exit;
   trim(start);



   if copy(start,length(start),1) <> '\' then start := start+'\';
   found:=FindFirst(start+'*.*', faDirectory , SearchRec);
   while (found =0) do
    begin
   if STOP_SCAN then exit;
    Application.ProcessMessages;
    FoundDir:= SearchRec.Name;
   CurrentDir:=start+FoundDir;

   if  ((FoundDir = '.') or (FoundDir = '..') or (FoundDir = '.\')  ) then
    invaliddir:=true
     else
       invaliddir:=false;
   Application.ProcessMessages;
   if( ((attr and SearchRec.attr) <> 0) and (not invaliddir)) then
      callme(CurrentDir,info);
   Application.ProcessMessages;
    if ((SearchRec.attr and faDirectory) = faDirectory) then
    begin

    if  not (invaliddir) then
    begin
   Application.ProcessMessages;
    DirScan(CurrentDir,attr,callme,info);
   Application.ProcessMessages;
    end;
    end;

    found:=FindNext(SearchRec);
    end;
    FindClose(SearchRec);
   end;

   end.
