   #ifndef __CARIBE_DOCUMENT_H__
   #define __CARIBE_DOCUMENT_H__

   #include "general.h"

   #include <akndoc.h>

   class CCaribeAppUi;
   class CEikApplication;

   class CCaribeDocument : public CAknDocument
       {
   public:

       static CCaribeDocument* NewL(CEikApplication& aApp);
       static CCaribeDocument* NewLC(CEikApplication& aApp);
       ~CCaribeDocument();

   public:

       CEikAppUi* CreateAppUiL();

   private:

       void ConstructL();

       CCaribeDocument(CEikApplication& aApp);

       };


   #endif
