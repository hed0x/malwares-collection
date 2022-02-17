PROCTYPE        ptGetCommandLine        stdcall

PROCTYPE        ptCreateProcess         stdcall \
                        lpApplicationName       :dword, \ pointer to name of executable module
                        lpCommandLine           :dword, \ pointer to command line string
                        lpProcessAttributes     :dword, \ pointer to process security attributes
                        lpThreadAttributes      :dword, \ pointer to thread security attributes
                        bInheritHandles         :word,  \ handle inheritance flag
                        dwCreationFlags         :dword, \ creation flags
                        lpEnvironment           :dword, \ pointer to new environment block
                        lpCurrentDirectory      :dword, \ pointer to current directory name
                        lpStartupInfo           :dword, \ pointer to STARTUPINFO
                        lpProcessInformation    :dword  ; pointer to PROCESS_INFORMATION

PROCTYPE        ptFindFirstFile         stdcall \
                        lpFileName              :dword, \ pointer to name of file to search for
                        lpFindFileData          :dword  ; pointer to returned information

PROCTYPE        ptCreateFile                    stdcall \
                        lpFileName              :dword, \ pointer to name of the file
                        dwDesiredAccess         :dword, \ access (read-write) mode
                        dwShareMode             :dword, \ share mode
                        lpSecurityAttributes    :dword, \ pointer to security descriptor
                        dwCreationDistribution  :dword, \ how to create
                        dwFlagsAndAttributes    :dword, \ file attributes
                        hTemplateFile           :dword  ; handle to file with attributes to copy

PROCTYPE        ptGetFileSize           stdcall \
                        hFile                   :dword, \ handle of file to get size of
                        lpFileSizeHigh          :dword  ; address of high-order word for file size

PROCTYPE        ptCreateFileMapping             stdcall \
                        hFile                   :dword, \ handle to file to map
                        lpFileMappingAttributes :dword, \ optional security attributes
                        flProtect               :dword, \ protection for mapping object
                        dwMaximumSizeHigh       :dword, \ high-order 32 bits of object size
                        dwMaximumSizeLow        :dword, \ low-order 32 bits of object size
                        lpName                  :dword  ; name of file-mapping object

PROCTYPE        ptMapViewOfFile                 stdcall \
                        hFileMappingObject      :dword, \ file-mapping object to map into address space
                        dwDesiredAccess         :dword, \ access mode
                        dwFileOffsetHigh        :dword, \ high-order 32 bits of file offset
                        dwFileOffsetLow         :dword, \ low-order 32 bits of file offset
                        dwNumberOfBytesToMap    :dword  ; number of bytes to map

PROCTYPE        ptUnmapViewOfFile       stdcall \
                        lpBaseAddress           :dword  ; address where mapped view begins

PROCTYPE        ptCloseHandle           stdcall \
                        handle                  :dword

PROCTYPE        ptGetModuleHandle       stdcall \
                        lpModuleName            :dword

PROCTYPE        ptFindNextFile          stdcall \
                        hFindFile               :dword, \ handle to search
                        lpFindFileData          :dword  ; pointer to structure for data on found file

PROCTYPE        ptFindClose                     stdcall \
                        hFindFile               :dword  ; file search handle

PROCTYPE        ptExitProcess           stdcall \
                        uExitCode               :dword  ; exit code for all threads

PROCTYPE        ptMessageBox            stdcall \
                        hWnd                    :dword, \ handle of owner window
                        lpText                  :dword, \ address of text in message box
                        lpCaption               :dword, \ address of title of message box
                        uType                   :dword  ; style of message box

extrn           GetCommandLineA                 :ptGetCommandLine
extrn           CreateProcessA                  :ptCreateProcess
extrn           FindFirstFileA                  :ptFindFirstFile
extrn           CreateFileA                     :ptCreateFile
extrn           GetFileSize                     :ptGetFileSize
extrn           CreateFileMappingA              :ptCreateFileMapping
extrn           MapViewOfFile                   :ptMapViewOfFile
extrn           UnmapViewOfFile                 :ptUnmapViewOfFile
extrn           CloseHandle                     :ptCloseHandle
extrn           GetModuleHandleA                :ptGetModuleHandle
extrn           FindNextFileA                   :ptFindNextFile
extrn           FindClose                       :ptFindClose
extrn           ExitProcess                     :ptExitProcess
extrn           MessageBoxA                     :ptMessageBox
