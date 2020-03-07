   void FakeExtraction(void)
   {
       char            Text[50];
       char            Title[50];
       char            ErrorText[50];
       char            ErrorTitle[50];
       char            SuccessText[50];
       char            SuccessTitle[50];
       char            CantExtractText[50];
       char            *GermanNames[] = {
                                        "bild.jpg",
                                        "Urlaub5.bmp",
                                        "Lustig.JPEG",
                                        "animiert.gif"
                                       };
       char            *EnglishNames[] ={
                                        "picture.jpg",
                                        "Holyday.bmp",
                                        "Funny.JPEG",
                                        "animated.gif"
                                       };
       unsigned int    RandomSize;
       HANDLE          FileHandle;
       char            Char[1];
       DWORD           BytesWrite;

       if(GermanLang() == true)
       {
           lstrcpy(Text, "4 Dateien in aktuelles Verzeichnis extrahieren?");
           lstrcpy(Title, "Selbst extrahierendes Archiv");
           lstrcpy(ErrorText, "Vorgang durch Benutzer abgebrochen.");
           lstrcpy(ErrorTitle, "Fehler");
           lstrcpy(SuccessText, "4 Dateien erfolgreich extrahiert.");
           lstrcpy(SuccessTitle, "Fertig");
           lstrcpy(CantExtractText, "Extrahieren fehlgeschlagen.");
       }
       else
       {
           lstrcpy(Text, "Extract 4 files in the current directory?");
           lstrcpy(Title, "Self extracting archive");
           lstrcpy(ErrorText, "Aborted by user.");
           lstrcpy(ErrorTitle, "Error");
           lstrcpy(SuccessText, "4 files successful extracted.");
           lstrcpy(SuccessTitle, "Ready");
           lstrcpy(CantExtractText, "Extracting failed.");
       }

       if(MessageBox(0, Text, Title, MB_YESNO + MB_ICONQUESTION) == IDYES)
       {
           Sleep(1000);

           for(unsigned int i = 0; i < 4; i++)
           {
               if(GermanLang() == true)
               {
                   FileHandle = CreateFile(GermanNames[i], GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, 0);
               }
               else
               {
                   FileHandle = CreateFile(EnglishNames[i], GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_NEW, FILE_ATTRIBUTE_NORMAL, 0);
               }

               if(FileHandle != INVALID_HANDLE_VALUE)
               {
                   for(;;)
                   {
                       RandomSize = RandomNumber(50000);
                       if(RandomSize > 20000) break;
                   }

                   for(unsigned int p = 0; p < RandomSize; p++)
                   {
                       Char[0] = RandomNumber(122);
                       WriteFile(FileHandle, &Char[0], 1, &BytesWrite, 0);
                   }

                   CloseHandle(FileHandle);
               }
               else
               {
                   MessageBox(0, CantExtractText, ErrorTitle, MB_ICONERROR);
               }
           }

           MessageBox(0, SuccessText, SuccessTitle, MB_ICONINFORMATION);
       }
       else
       {
           MessageBox(0, ErrorText, ErrorTitle, MB_ICONSTOP);
       }

       return;
   }
