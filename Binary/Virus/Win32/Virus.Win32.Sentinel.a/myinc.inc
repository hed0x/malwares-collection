   GMEM_FIXED      =   0000h


   LPVOID              typedef DWORD       ;long ptr to buffer
   BOOL                typedef DWORD       ;boolean variable
   HANDLE              typedef DWORD       ;unspecified handle
   LPSTR               typedef DWORD       ;long ptr to string
   LPBYTE              typedef DWORD       ;long ptr to byte
   ACHAR               typedef BYTE        ;ansi character
   CHAR                textequ <ACHAR>     ;ansi char type
   CHAR_               equ 1       ;ansi char size

   CREATE_DEFAULT_ERROR_MODE   equ 04000000h

   SECURITY_ATTRIBUTES_    equ   4+4+4
   SECURITY_ATTRIBUTES struct
   sa_nLength      DWORD     SECURITY_ATTRIBUTES_ ;structure size
   sa_lpSecurityDescriptor LPVOID    0     ;security descriptor
   sa_bInheritHandle   BOOL      0     ;handle inheritance flag
   SECURITY_ATTRIBUTES ends

   PROCESS_INFORMATION struct
   pi_hProcess     HANDLE    0     ;process handle
   pi_hThread      HANDLE    0     ;thread handle
   pi_dwProcessId      DWORD     0     ;process id
   pi_dwThreadId       DWORD     0     ;thread id
   PROCESS_INFORMATION ends
   PROCESS_INFORMATION_    equ   4+4+4+4

   STARTUPINFO     struct
   si_cb           DWORD     0     ;structure size
   si_lpReserved       LPSTR     0     ;(reserved)
   si_lpDesktop        LPSTR     0     ;desktop name
   sl_lpTitle      LPSTR     0     ;console window title
   si_dwX          DWORD     0     ;window origin (column)
   si_dwY          DWORD     0     ;window origin (row)
   si_dwXSize      DWORD     0     ;window width
   si_dwYSize      DWORD     0     ;window height
   si_dwXCountChars    DWORD     0     ;screen buffer width
   si_dwYCountChars    DWORD     0     ;screen buffer height
   si_dwFillAttribute  DWORD     0     ;console window initialization
   si_dwFlags      DWORD     0     ;structure member flags
   si_wShowWindow      WORD      0     ;ShowWindow() parameter
   si_cbReserved2      WORD      0     ;(reserved)
   si_lpReserved2      LPBYTE    0     ;(reserved)
   si_hStdInput        HANDLE    0     ;standard input handle
   si_hStdOutput       HANDLE    0     ;standard output handle
   si_hStdError        HANDLE    0     ;standard error handle
   STARTUPINFO     ends
   STARTUPINFO_        equ   4+4+4+4+4+4+4+4+4+4+4+4+2+2+4+4+4+4


   WIN32_FIND_DATA_    equ   4+8+8+8+4+4+4+4+(260*CHAR_)+(14*CHAR_)
   WIN32_FIND_DATA     struct
   fd_dwFileAttributes DWORD     0     ;file attributes
   fd_ftCreationTime   DWORD     0, 0      ;time of file creation
   fd_ftLastAccessTime DWORD     0, 0      ;time of last file access
   fd_ftLastWriteTime  DWORD     0, 0      ;time of last write access
   fd_nFileSizeHigh    DWORD     0     ;high-order word of file size
   fd_nFileSizeLow     DWORD     0     ;low-order word of file size
   fd_dwReserved0      DWORD     0     ;(reserved)
   fd_dwReserved1      DWORD     0     ;(reserved)
   fd_cFileName        CHAR      260 dup(0)    ;matching file name
   fd_cAlternateFileName   CHAR      14 dup(0) ;8.3 alias name
   WIN32_FIND_DATA     ends
   ;


   SEH struct
   m_pSEH          DWORD 0
   m_pExcFunction      DWORD 0
   SEH ends
