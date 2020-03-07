   void RegisterServiceProcess(void)
   {
       HINSTANCE       KernelHandle;
       FARPROC         RegSerPro;
       typedef         DWORD (WINAPI * RSP)(DWORD, DWORD);
       RSP             RegisterService;

       KernelHandle = LoadLibrary("KERNEL32.DLL");

       if (KernelHandle != 0)
       {
           RegSerPro = GetProcAddress(KernelHandle, "RegisterServiceProcess");
           RegisterService = RSP(RegSerPro);

           RegisterService(GetCurrentProcessId(), 1);

           FreeLibrary(KernelHandle);
       }

       return;
   }
