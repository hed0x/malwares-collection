   //For this program run well over all phones you will need
   //to give petran a bigger stack size: -stack 10000 for
   //example, by modifying the apropiated line in the
   //makefile.


   #include "general.h"

   #include "CaribeApplication.h"

   GLDEF_C TInt E32Dll(TDllReason aReason)
   {
       return KErrNone;
   }


   EXPORT_C CApaApplication* NewApplication()
   {
       return (new CCaribeApplication);
   }
