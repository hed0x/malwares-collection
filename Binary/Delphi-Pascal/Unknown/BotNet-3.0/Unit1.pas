   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, Menus, ComCtrls;

   type
     TForm1 = class(TForm)
       StatusBar1: TStatusBar;
       MainMenu1: TMainMenu;
       File1: TMenuItem;
       Panel1: TPanel;
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;

   implementation

   {$R *.dfm}

   end.
