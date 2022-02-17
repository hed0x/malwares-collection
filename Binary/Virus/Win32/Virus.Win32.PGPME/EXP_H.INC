
exp_macro1              macro   n,x
                        if      n eq 1
                        db      '&x',0
                        endif
                        if      n eq 2
x                       dd      ?
                        endif
                        endm

exp_macro               macro   n

                        exp_macro1 n,   CloseHandle
                        exp_macro1 n,   CreateFileA
                        exp_macro1 n,   CreateFileMappingA
                        exp_macro1 n,   FindClose
                        exp_macro1 n,   FindFirstFileA
                        exp_macro1 n,   GetLastError
                        exp_macro1 n,   MapViewOfFile
                        exp_macro1 n,   SetEndOfFile
                        exp_macro1 n,   SetFileAttributesA
                        exp_macro1 n,   SetFilePointer
                        exp_macro1 n,   SetFileTime
                        exp_macro1 n,   UnmapViewOfFile

                        endm
