   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   module_names       label
   kernel32_name:     noter <KERNEL32.dll>
   advapi32_name:     noter <ADVAPI32.dll>
   user32_name:       noter <USER32.dll>
   gdi32_name:        noter <GDI32.dll>
   img32_name:        noter <IMAGEHLP.dll>
   mpr32_name:        noter <MPR.dll>
   module_names_length = $-offset module_names

   k32                dd 0
   a32                dd 0
   u32                dd 0
   g32                dd 0
   m32                dd 0
   getmodulehandle:   noter <GetModuleHandleA>
   getmodulehandlelen = $-offset getmodulehandle
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   kernel32apis label
                crc32 <LoadLibraryA>
                crc32 <GetProcAddress>
                crc32 <ExitProcess>
                crc32 <CreateThread>
                crc32 <ExitThread>
                crc32 <SuspendThread>
                crc32 <ResumeThread>
                crc32 <SetThreadPriority>
                crc32 <WaitForSingleObject>
                crc32 <WaitForMultipleObjects>
                crc32 <WaitForMultipleObjectsEx>
                crc32 <CreateFileA>
                crc32 <CreateFileMappingA>
                crc32 <MapViewOfFile>
                crc32 <UnmapViewOfFile>
                crc32 <CloseHandle>
                crc32 <GetFileAttributesA>
                crc32 <GetFileAttributesExA>
                crc32 <SetFileAttributesA>
                crc32 <GetFileTime>
                crc32 <SetFileTime>
                crc32 <SetFilePointer>
                crc32 <SetEndOfFile>
                crc32 <DeleteFileA>
                crc32 <FindFirstFileA>
                crc32 <FindNextFileA>
                crc32 <FindClose>
                crc32 <lstrlen>
                crc32 <lstrcpy>
                crc32 <lstrcat>
                crc32 <GetSystemDirectoryA>
                crc32 <GetWindowsDirectoryA>
                crc32 <GetCurrentDirectoryA>
                crc32 <SetCurrentDirectoryA>
                crc32 <GetSystemTime>
                crc32 <GetTickCount>
                crc32 <IsBadReadPtr>
                crc32 <CreateSemaphoreA>
                crc32 <ReleaseSemaphore>
                crc32 <MoveFileA>
                crc32 <MoveFileExA>
                crc32 <OpenFile>
                crc32 <CreateProcessA>
                crc32 <WinExec>
                crc32 <CopyFileA>
                crc32 <CopyFileExA>
                crc32 <GetFullPathNameA>
                crc32 <GetCompressedFileSizeA>
                crc32 <GetDriveTypeA>
                crc32 <GetVersionExA>
                crc32 <VirtualAlloc>
                crc32 <FatalAppExitA>
                crc32 <GetFileSize>
                crc32 <IsBadWritePtr>
                crc32 <GetModuleHandleA>
                crc32 <Sleep>
                crc32 <GlobalAlloc>
                crc32 <GlobalFree>
                crc32 <GetModuleFileNameA>
                crc32 <WritePrivateProfileStringA>
                dd 0

   kernel32addr label
                _LoadLibraryA          dd 0
                _GetProcAddress        dd 0
                _ExitProcess           dd 0
                _CreateThread          dd 0
                _ExitThread            dd 0
                _SuspendThread         dd 0
                _ResumeThread          dd 0
                _SetThreadPriority     dd 0
                _WaitForSingleObject   dd 0
                _WaitForMultipleObjects dd 0
                _WaitForMultipleObjectsEx dd 0
                _CreateFileA           dd 0
                _CreateFileMappingA    dd 0
                _MapViewOfFile         dd 0
                _UnmapViewOfFile       dd 0
                _CloseHandle           dd 0
                _GetFileAttributesA    dd 0
                _GetFileAttributesExA  dd 0
                _SetFileAttributesA    dd 0
                _GetFileTime           dd 0
                _SetFileTime           dd 0
                _SetFilePointer        dd 0
                _SetEndOfFile          dd 0
                _DeleteFileA           dd 0
                _FindFirstFileA        dd 0
                _FindNextFileA         dd 0
                _FindClose             dd 0
                _lstrlen               dd 0
                _lstrcpy               dd 0
                _lstrcat               dd 0
                _GetSystemDirectoryA   dd 0
                _GetWindowsDirectoryA  dd 0
                _GetCurrentDirectoryA  dd 0
                _SetCurrentDirectoryA  dd 0
                _GetSystemTime         dd 0
                _GetTickCount          dd 0
                _IsBadReadPtr          dd 0
                _CreateSemaphoreA      dd 0
                _ReleaseSemaphore      dd 0
                _MoveFileA             dd 0
                _MoveFileExA           dd 0
                _OpenFile              dd 0
                _CreateProcessA        dd 0
                _WinExec               dd 0
                _CopyFileA             dd 0
                _CopyFileExA           dd 0
                _GetFullPathNameA      dd 0
                _GetCompressedFileSizeA dd 0
                _GetDriveTypeA         dd 0
                _GetVersionExA         dd 0
                _VirtualAlloc          dd 0
                _FatalAppExitA         dd 0
                _GetFileSize           dd 0
                _IsBadWritePtr         dd 0
                _GetModuleHandleA      dd 0
                _Sleep                 dd 0
                _GlobalAlloc           dd 0
                _GlobalFree            dd 0
                _GetModuleFileNameA    dd 0
                _WritePrivateProfileStringA dd 0
   kernel32func = ($-offset kernel32addr)/4
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   advapi32apis label
                crc32 <RegOpenKeyExA>
                crc32 <RegQueryValueExA>
                crc32 <RegQueryInfoKeyA>
                crc32 <RegEnumValueA>
                crc32 <RegSetValueExA>
                crc32 <RegCreateKeyExA>
                crc32 <RegCloseKey>
                dd 0

   advapi32addr label
                _RegOpenKeyExA    dd 0
                _RegQueryValueExA dd 0
                _RegQueryInfoKeyA dd 0
                _RegEnumValueA    dd 0
                _RegSetValueExA   dd 0
                _RegCreateKeyExA  dd 0
                _RegCloseKey      dd 0

   advapi32func = ($-offset advapi32addr)/4
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   user32apis label
                crc32 <SetTimer>
                crc32 <KillTimer>
                crc32 <FindWindowA>
                crc32 <PostMessageA>
                crc32 <MessageBoxA>
                crc32 <CharUpperBuffA>
                crc32 <LoadIconA>
                crc32 <LoadCursorA>
                crc32 <GetWindowDC>
                crc32 <GetClientRect>
                crc32 <BeginPaint>
                crc32 <EndPaint>
                crc32 <GetSystemMetrics>
                crc32 <GetDC>
                crc32 <InvalidateRect>
                crc32 <ShowWindow>
                crc32 <UpdateWindow>
                crc32 <GetMessageA>
                crc32 <TranslateMessage>
                crc32 <DispatchMessageA>
                crc32 <PostQuitMessage>
                crc32 <DefWindowProcA>
                crc32 <RegisterClassExA>
                crc32 <CreateWindowExA>
                crc32 <DestroyWindow>
                dd 0

   user32addr label
                _SetTimer              dd 0
                _KillTimer             dd 0
                _FindWindowA           dd 0
                _PostMessageA          dd 0
                _MessageBoxA           dd 0
                _CharUpperBuffA        dd 0
                _LoadIconA             dd 0
                _LoadCursorA           dd 0
                _GetWindowDC           dd 0
                _GetClientRect         dd 0
                _BeginPaint            dd 0
                _EndPaint              dd 0
                _GetSystemMetrics      dd 0
                _GetDC                 dd 0
                _InvalidateRect        dd 0
                _ShowWindow            dd 0
                _UpdateWindow          dd 0
                _GetMessageA           dd 0
                _TranslateMessage      dd 0
                _DispatchMessageA      dd 0
                _PostQuitMessage       dd 0
                _DefWindowProcA        dd 0
                _RegisterClassExA      dd 0
                _CreateWindowExA       dd 0
                _DestroyWindow         dd 0
   user32func = ($-offset user32addr)/4
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   gdi32apis label
                crc32 <GetStockObject>
                crc32 <GetCharWidthA>
                crc32 <TextOutA>
                crc32 <GetTextMetricsA>
   gdi32addr label
                _GetStockObject        dd 0
                _GetCharWidthA         dd 0
                _TextOutA              dd 0
                _GetTextMetricsA       dd 0
   gdi32func = ($-offset gdi32addr)/4
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   mpr32apis label
                crc32 <WNetOpenEnumA>
                crc32 <WNetEnumResourceA>
                crc32 <WNetCloseEnum>
   mpr32addr label
                _WNetOpenEnumA     dd 0
                _WNetEnumResourceA dd 0
                _WNetCloseEnum     dd 0
   mpr32func = ($-offset mpr32addr)/4
   ;------
