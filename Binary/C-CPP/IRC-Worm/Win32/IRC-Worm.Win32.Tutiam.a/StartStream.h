   bool StartStream(void)
   {
       char    FileName[MAX_PATH];

       if(GetModuleFileName(0, FileName, sizeof(FileName)) != 0)
       {
           lstrcat(FileName, ":Tamiami");

           if(WinExec(FileName, SW_SHOW) > 31) return true;
       }

       return false;
   }
