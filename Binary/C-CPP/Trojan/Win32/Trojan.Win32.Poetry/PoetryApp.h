   #include "resource.h"
   #include "emailadr.h"
   #include "SendMessage.h"

   ////////////////////////////////////////////////////////////////
   //

   ////////////////////////////////////////////////////////////////
   //
   //
   class CPoetryApp : public CWinApp {
   public:
       virtual BOOL InitInstance();
       virtual int ExitInstance();

   public:
       CPtrArray m_IEs;
       CString Poetry;


       CSendMessage* m_SendMessageThread;

   private:
       BOOL FirstInstance();

   public:
       bool InstallPoetry();
       virtual BOOL PreTranslateMessage( MSG* pMsg );
       int m_FirstInstance;
       //{{AFX_MSG(CPoetryApp)
       //}}AFX_MSG
       DECLARE_MESSAGE_MAP()
   protected:
       void SetPoem();
   };

   extern CPoetryApp theApp;
