   void OnlyOneInstance(char MutexName[])
   {
       HANDLE MutexHandle;

       MutexHandle = CreateMutex(0, 0, MutexName);

       if(GetLastError() == ERROR_ALREADY_EXISTS)
       {
           ExitProcess(0);
       }

       return;
   }
