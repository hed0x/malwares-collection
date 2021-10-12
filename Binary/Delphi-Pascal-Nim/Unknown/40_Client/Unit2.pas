   unit Unit2;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, TFlatGaugeUnit, TFlatTitlebarUnit, ExtCtrls;

   type
     TForm2 = class(TForm)
       Bevel1: TBevel;
       FlatTitlebar1: TFlatTitlebar;
       GroupBox1: TGroupBox;
       Label1: TLabel;
       Bevel2: TBevel;
       Bevel3: TBevel;
       Bevel4: TBevel;
       Bevel5: TBevel;
       Label2: TLabel;
       Label3: TLabel;
       Label4: TLabel;
       FlatGauge2: TFlatGauge;
       FlatGauge3: TFlatGauge;
       Label5: TLabel;
       Label6: TLabel;
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form2: TForm2;

   implementation

   {$R *.dfm}

   end.
