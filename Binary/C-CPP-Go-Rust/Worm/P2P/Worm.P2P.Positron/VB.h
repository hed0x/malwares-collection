   //---------------------------------------------------------------------------

   #ifndef VBH
   #define VBH
   //---------------------------------------------------------------------------
   #include <Classes.hpp>
   #include <Controls.hpp>
   #include <StdCtrls.hpp>
   #include <Forms.hpp>
   //---------------------------------------------------------------------------
   class TForm1 : public TForm
   {
   __published:    // IDE-managed Components
           void __fastcall FormCreate(TObject *Sender);
   private:    // User declarations
   public:     // User declarations
           __fastcall TForm1(TComponent* Owner);
   };
   //---------------------------------------------------------------------------
   extern PACKAGE TForm1 *Form1;
   //---------------------------------------------------------------------------
   #endif
