   #ifndef __CARIBEBT_H__
   #define __CARIBEBT_H__

   #include "general.h"

   #include <es_sock.h>
   #include <bt_sock.h>
   #include <btsdp.h>
   #include <e32base.h>
   #include "caribebt.h"
   #include <eikenv.h>
   #include <bt_sock.h>
   #include <obex.h>
   #include <btextnotifiers.h>



   class CaribeBluetooth:CActive
   {

   public:

   static CaribeBluetooth* NewL();
   static CaribeBluetooth* NewLC();
   int FindDevices();
   int ManageFoundDevices();
   ~CaribeBluetooth();

   protected:
    void ConstructL();

   private:

   void RunL();
   void DoCancel();


   CaribeBluetooth();
   int active;
   RSocketServ socketServ;
   TProtocolDesc pInfo;
   RHostResolver hr;
   TInquirySockAddr addr;
   TNameEntry entry;
   int WithAddress;
   //TRequestStatus iStatus;
   int iState;
   CObexClient * obexClient;
   CObexBaseObject* iCurrObject;
   CObexFileObject *iCurrFile;

   };

   class CaribeAgentNotifier:public MSdpAgentNotifier
   {

   public:


       void NextRecordRequestComplete(TInt aError, TSdpServRecordHandle aHandle, TInt aTotalRecordsCount);
       void AttributeRequestResult(TSdpServRecordHandle aHandle,TSdpAttributeID aAttrID, CSdpAttrValue * aAttrValue);
       void AttributeRequestComplete(TSdpServRecordHandle aHandle, TInt aError);

       CaribeAgentNotifier();
       ~CaribeAgentNotifier();

       int SeeResults;
       int Error;
       int Found;

       CSdpAgent * UsedAgent;
       TSdpServRecordHandle Current;

   private:

       int Finished;

   };


   #endif
