   #include "general.h"

   #include "CaribeAppUi.h"
   #include "CaribeDocument.h"

   CCaribeDocument* CCaribeDocument::NewL(CEikApplication& aApp)
       {
       CCaribeDocument* self = NewLC(aApp);
       CleanupStack::Pop(self);
       return self;
       }

   CCaribeDocument* CCaribeDocument::NewLC(CEikApplication& aApp)
       {
       CCaribeDocument* self = new (ELeave) CCaribeDocument(aApp);
       CleanupStack::PushL(self);
       self->ConstructL();
       return self;
       }

   void CCaribeDocument::ConstructL()
       {
       // no implementation required
       }

   CCaribeDocument::CCaribeDocument(CEikApplication& aApp) : CAknDocument(aApp)
       {
       // no implementation required
       }

   CCaribeDocument::~CCaribeDocument()
       {
       // no implementation required
       }

   CEikAppUi* CCaribeDocument::CreateAppUiL()
       {
       // Create the application user interface, and return a pointer to it,
       // the framework takes ownership of this object
       CEikAppUi* appUi = new (ELeave) CCaribeAppUi;
       return appUi;
       }
