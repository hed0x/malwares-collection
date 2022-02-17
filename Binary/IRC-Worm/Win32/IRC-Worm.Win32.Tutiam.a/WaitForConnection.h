   void WaitForConnection(void)
   {
       char    CheckSite[] = "http://update.microsoft.com/";

       while(InternetCheckConnection(CheckSite, FLAG_ICC_FORCE_CONNECTION, 0) != 1)
       {
           Sleep(60000);
       }

       return;
   }
