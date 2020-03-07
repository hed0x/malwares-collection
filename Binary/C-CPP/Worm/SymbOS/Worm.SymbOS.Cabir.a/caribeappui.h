   #ifndef __CARIBE_APPUI_H__
   #define __CARIBE_APPUI_H__

   #include "general.h"

   #include <aknappui.h>

   class CCaribeAppUi : public CAknAppUi
       {
   public:

       void ConstructL();

       CCaribeAppUi();

       ~CCaribeAppUi();

       //void HandleForegroundEventL(TBool aForeground);

       void HandleCommandL(TInt aCommand);

       };


   #endif
