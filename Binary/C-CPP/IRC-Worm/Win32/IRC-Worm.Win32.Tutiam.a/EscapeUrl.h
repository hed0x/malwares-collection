   void EscapeUrl(char *Url, char *OutputBuffer)
   {
       char    TempChar[2];

       lstrcpy(OutputBuffer, "%");

       for(int i = 0; lstrlen(Url) > i; i++)
       {
           wsprintf(TempChar, "%x", Url[i]);
           lstrcat(OutputBuffer, TempChar);
           lstrcat(OutputBuffer, "%");
       }

       lstrcpyn(OutputBuffer + lstrlen(OutputBuffer) - 1, "", 2);

       return;
   }
