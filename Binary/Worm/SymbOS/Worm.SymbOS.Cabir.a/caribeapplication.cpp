   #include "general.h"

   #include "CaribeDocument.h"
   #include "CaribeApplication.h"
   #include <akndoc.h>

   static const TUid KUidCaribeApp = {0x10005B91};

   CApaDocument* CCaribeApplication::CreateDocumentL()
   {
       CApaDocument* document = CCaribeDocument::NewL(*this);
       return document;
   }

   TUid CCaribeApplication::AppDllUid() const
   {
       return KUidCaribeApp;
   }
