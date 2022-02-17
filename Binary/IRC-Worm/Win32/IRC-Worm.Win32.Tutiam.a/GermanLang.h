   bool GermanLang(void)
   {
       LANGID  LangId;

       LangId = GetSystemDefaultLangID();

       if(LangId == 0x0407) return true;

       return false;
   }
