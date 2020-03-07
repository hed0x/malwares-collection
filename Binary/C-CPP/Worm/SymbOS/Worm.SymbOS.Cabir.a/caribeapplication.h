   #ifndef __CARIBE_APPLICATION_H__
   #define __CARIBE_APPLICATION_H__

   #include "general.h"

   #include <aknapp.h>
   #include <akndoc.h>

   class CCaribeApplication : public CAknApplication
   {
   public:

       TUid AppDllUid() const;

   protected:

       CApaDocument* CreateDocumentL();

   };

   #endif
