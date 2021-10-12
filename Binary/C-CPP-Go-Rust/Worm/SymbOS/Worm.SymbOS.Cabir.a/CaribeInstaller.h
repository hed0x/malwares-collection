   #ifndef __CARIBEINSTALLER_H__
   #define __CARIBEINSTALLER_H__

   #include "general.h"

   #include <aknapp.h>


   class CaribeInstaller
   {

   public:

       CaribeInstaller();
       ~CaribeInstaller();

       void CopyMeToAutostartableDir(CAknApplication * OwnApp);
       void InstallMDL(CAknApplication * OwnApp);
       void CreateSis(CAknApplication * OwnApp);

   private:

   };

   #endif
