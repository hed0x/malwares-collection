   // objmodel.h
   //Author: V. Rama Krishna
   // Contains definitions for all standard wrapper classes
   // for HTML document object model interfaces
   //
   //////////////////////////////////////////////////////////////////////

   #if !defined(AFX_OBJMODEL_H__2FE4918F_8567_11D2_ABF7_D72320888C7A__INCLUDED_)
   #define AFX_OBJMODEL_H__2FE4918F_8567_11D2_ABF7_D72320888C7A__INCLUDED_

   #if _MSC_VER > 1000
   #pragma once
   #endif // _MSC_VER > 1000

   #if !defined(HTML_THISLIB_LOCAL_BUILD)
       #include <mshtml.h>
       #include <mshtmhst.h>
       #include <mshtmdid.h>
   #endif //HTML_THISLIB_LOCAL_BUILD

   class CHTMLEventSink;
   class CHTMLElement;
   class CHTMLDocument2;

   class CHTMLEventTarget
   {
   public:
       CHTMLEventTarget()
       {
           m_nSinks = 0;
           m_pSinkList=NULL;
       }

       virtual ~CHTMLEventTarget();

       //The standard function which gets called if no event sink
       //Default does nothing override this to provide extra functionality
       virtual void OnHTMLEvent(DISPID dispId){
           dispId;
       }

       //This should return the Source Interface e.g IHTMLWindow2 or IHTMLElement
       virtual LPUNKNOWN GetEventSource()=0;
       //This should return the IID of the connection
       virtual REFIID GetConnectionIID() = 0;
       //Craetes a new sink and returns its index in the array
       int CreateEventSink();
       //Activates the sink i pOther is the source element
       void ActivateSink(int nSink, CHTMLEventTarget* pOther = NULL);


   protected:
       //A target may have many sinks but a sink can have only
       //one target for obvious reasons

       //Number of sinks
       int m_nSinks;
       //An array of all the sinks we have
       CHTMLEventSink** m_pSinkList;
   };

   //General structures and types
   typedef CHTMLEventSink *LPHTMLEVENTSINK;

   typedef void (CHTMLEventTarget::*HTMLEVENTHANDLERFN)(void);

   typedef struct _HTMLEVENTSINKMAP {
       //DISPID of the event
       DISPID m_dispId;
       //Handler function in the target class
       HTMLEVENTHANDLERFN m_pfnHandler;
   } HTMLEVENTSINKMAP, *LPHTMLEVENTSINKMAP;

   typedef struct _HTMLEVENTSINKMAPLIST {
       //Number of elements
       int m_nElements;
       //array of sink map entries
       HTMLEVENTSINKMAP m_pSinkMap[1];
   } HTMLEVENTSINKMAPLIST, *LPHTMLEVENTSINKMAPLIST;

   class CHTMLEventSink : public IDispatch
   {
   public:
       CHTMLEventSink()
           :m_pSinkMapList(NULL),
           m_spCP(NULL),
           m_nRefCount(0)
       {

       }

       virtual ~CHTMLEventSink() {
           free(m_pSinkMapList);
       }

       // IUnknown methods.
       virtual HRESULT __stdcall QueryInterface(REFIID riid, void **ppvObject)
       {
           if(IsEqualGUID(riid, IID_IDispatch) ||
              IsEqualGUID(riid, IID_IUnknown))
           {
                  this->AddRef();
                  *ppvObject = this;
                  return S_OK;
           }
           *ppvObject = NULL;
           return E_NOINTERFACE;
       }

       virtual ULONG _stdcall AddRef(void)
       {
           return ++m_nRefCount;
       }

       virtual ULONG _stdcall Release(void)
       {
           //Since these are COM objects
           //Allocate always on heap to prevent
           //undesirable effects
           if(--m_nRefCount <= 0)
           {
               delete this;
               return 0;
           }
           return m_nRefCount;
       }

       // IDispatch methods.
       //Luckily We don't need anything complex as all HTMLEvents
       //are of the type void func()
       virtual HRESULT _stdcall GetTypeInfoCount(UINT *pctinfo)
       {
               if(pctinfo) *pctinfo = 0;
               return E_NOTIMPL;
       }

       virtual HRESULT _stdcall GetTypeInfo(UINT iTInfo, LCID lcid, ITypeInfo **ppTInfo)
       {
               return E_NOTIMPL;
       }

       virtual HRESULT _stdcall GetIDsOfNames(REFIID riid, LPOLESTR *rgszNames, UINT cNames, LCID lcid, DISPID *rgDispId)
       {
           return E_NOTIMPL;
       }

       virtual HRESULT _stdcall Invoke(DISPID dispIdMember, REFIID riid, LCID lcid, WORD wFlags,
           DISPPARAMS *pDispParams, VARIANT *pVarResult,
           EXCEPINFO *pExcepInfo, UINT *puArgErr);

       //The target class where events are ultimately handled
       CHTMLEventTarget* m_pTarget;

       //Establish connection to the source
       BOOL StartConnection(LPUNKNOWN pUnkSrc, REFIID iidConnection);

       //Release connection from the source
       BOOL ReleaseConnection();

       //Adds an entry to the event sink map
       void AddToSinkMap(DISPID dispId, HTMLEVENTHANDLERFN pfnHandler);

       //Returns whether Sink is active
       BOOL IsConnected() {
           return (m_spCP != NULL);
       }
   protected:
       //The map containing dispid vs functions
       LPHTMLEVENTSINKMAPLIST m_pSinkMapList;
       //Our reference count
       ULONG m_nRefCount;
       //The connection Point
       LPCONNECTIONPOINT m_spCP;
       //The connection cookie
       DWORD m_dwCookie;
   };



   class CHTMLElementCollection
   {
   public:
       void FromCollection(IHTMLElementCollection* spColl);
       void GetElement(CHTMLElement& theElem, short nPos);
       void GetElement(CHTMLElement& theElem, LPCTSTR lpszName, short nIndex = 0);
       void GetCollectionByTag(LPCTSTR lpszTag, CHTMLElementCollection& otherColl);
       CHTMLElementCollection() {
           m_spColl = NULL;
       }

       virtual ~CHTMLElementCollection(){
           if (m_spColl)
               m_spColl->Release();
       }
       //Returns the interface if someone want's to the default is not to addref
       IHTMLElementCollection* GetIHTMLElementCollection(BOOL bAddRef = 0) {
           if (bAddRef)
               m_spColl->AddRef();
           return m_spColl;
       }

       //Returns the length of the collection
       long GetLength();
       //otherColl becomes a collection of all the elements having a particular name
       void GetCollectionByName(LPCTSTR lpszName, CHTMLElementCollection& otherColl);



   protected:
       //The interface pointer can be set only from CHTMLDocument2 class
       IHTMLElementCollection* m_spColl;

   };


   class CHTMLElement : public CHTMLEventTarget
   {
   public:
       CHTMLElement() {
           m_spElement = NULL;
       }

       virtual ~CHTMLElement() {
           if (m_spElement)
               m_spElement->Release();
       }

       //Return sthe interface
       IHTMLElement* GetIHTMLElement(BOOL bAddRef=FALSE){
           if (bAddRef)
               m_spElement->AddRef();

           return m_spElement;
       }
       //Connection source obviously our m_spElement pointer
       virtual LPUNKNOWN GetEventSource()
       {
           return m_spElement;
       }
       //Connection IID of the Event Dispatch interface supported
       virtual REFIID GetConnectionIID() {
           return DIID_HTMLElementEvents;
       }

       //Attaches an existing Dispatch pointer to the object
       void Attach(LPDISPATCH pDisp);
       //Gets the innerHTML
       void GetInnerHTML(LPTSTR lpszHTML, int nSize = -1);
       //sets the innerHTML
       void SetInnerHTML(LPCTSTR lpszHTML);
       //Gets the innerTEXT
       void GetInnerTEXT(LPTSTR lpszTEXT, int nSize = -1);
       //sets the innerTEXT
       void SetInnerTEXT(LPCTSTR lpszTEXT);
       //Gets the outerHTML
       void GetOuterHTML(LPTSTR lpszHTML, int nSize = -1);
       //sets the outerHTML
       void SetOuterHTML(LPCTSTR lpszHTML);
       //Get the tag name
       void GetTagName(LPTSTR lpszTag);
       //A collection of all the immediate children
       void GetChildren(CHTMLElementCollection& allColl);
       //A collection of all elements within it
       void GetAll(CHTMLElementCollection& allColl);
       //Get the ID or the name attribute
       void GetID(LPTSTR lpszID);
       //returns whether m_spElement is valid
       BOOL IsValid() {
           return (m_spElement != NULL);
       }

   protected:
       //The main interface pointer
       IHTMLElement* m_spElement;
   };


   class CHTMLPage :
       public CHTMLEventTarget,
       public CHTMLElementCollection //Basically the all collection
   {
   public:
       CHTMLPage();
       virtual ~CHTMLPage();
       //Connection source obviously our m_spElement pointer
       virtual LPUNKNOWN GetEventSource()
       {
           return m_spWindow2;
       }
       //Connection IID of the Event Dispatch interface supported
       virtual REFIID GetConnectionIID() {
           return DIID_HTMLWindowEvents;
       }
       //Set this flag if you wan't to auto delete at Unload
       BOOL m_bAutoDelete;
       //this is the main path through which class is initialized
       void SetDocument(LPDISPATCH pDispDoc);
       //Return interface to the document object
       IHTMLDocument2* GetIHTMLDocument2(BOOL bAddRef = FALSE) {
           if (bAddRef)
               m_spDocument2->AddRef();
           return m_spDocument2;
       }
       //Return interface to the window object
       IHTMLWindow2* GetIHTMLWindow2(BOOL bAddRef = FALSE) {
           if (bAddRef)
               m_spWindow2->AddRef();
           return m_spWindow2;
       }

   protected:
       //Default function which is called if there is no event map in the sink class
       virtual void OnHTMLEvent(DISPID dispIdMember);
       //We need to free ourshelves by this functiom
       virtual void OnUnload();
       //Overloads

       //We got the focus
       virtual void OnFocus(){}
       //Lost focus
       virtual void OnBlur(){}
       //Some script errors or other errors
       virtual void OnError(){}
       //Window is resized
       virtual void OnResize(){}
       //Scrolling is being done
       virtual void OnScroll(){}
       //Befor unload
       virtual void OnBeforeUnload(){}
       //Pressed F1 or calling fot help
       virtual void OnHelp(){}
       //Standard function where HTML elements are supposed to be mapped to CHTMLElement vars
       virtual void MapVars(){};
       //Where event mapping is done
       virtual void MapEvents(){};
       //Forst time the page is initialized
       virtual void OnInitPage(){};
       //Creates a memeber lpszName in Window object and assigns vtVal
       BOOL AddProperty(LPCTSTR lpszName, VARIANT vtVal);

       //The window object
       IHTMLWindow2* m_spWindow2;
       //The document object
       IHTMLDocument2* m_spDocument2;
   };



   #endif // !defined(AFX_OBJMODEL_H__2FE4918F_8567_11D2_ABF7_D72320888C7A__INCLUDED_)
