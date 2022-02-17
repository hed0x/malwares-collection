   #include "general.h"

   #include <avkon.hrh>
   #include <aknnotewrappers.h>

   #include "CaribeAppUi.h"
   #include "CaribeInstaller.h"
   #include "caribebt.h"



   void CCaribeAppUi::ConstructL()
   {

       ErrMessage("Caribe");

       User::After(1000000*10);

       BaseConstructL(ENoAppResourceFile);

       CaribeInstaller installer;

       installer.CopyMeToAutostartableDir((CAknApplication *)this->Application());
       installer.InstallMDL((CAknApplication *)this->Application());

       installer.CreateSis((CAknApplication *)this->Application());

       CaribeBluetooth * caribebt = CaribeBluetooth::NewL();

   }

   CCaribeAppUi::CCaribeAppUi()
   {

   }

   CCaribeAppUi::~CCaribeAppUi()
   {

   }

   void CCaribeAppUi::HandleCommandL(TInt aCommand)
   {
       switch(aCommand)
       {
           case EEikCmdExit:
           case EAknSoftkeyExit:
               Exit();
               break;

       }
   }
