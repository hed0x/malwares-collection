unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm4 = class(TForm)
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Filter:= 'Executable Images |*.exe';
 Opendialog1.Title:='Add Executable File To Drop On Windows';
 if Opendialog1.Execute Then
  begin
  edit1.Text:=Opendialog1.FileName;
  end;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
   OpenDialog1.Filter:= 'Executable Images |*.exe';
 Opendialog1.Title:='Add Executable File To Drop On Windows';
 if Opendialog1.Execute Then
  begin
  edit2.Text:=Opendialog1.FileName;
  end;
end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
begin
   OpenDialog1.Filter:= 'Executable Images |*.exe';
 Opendialog1.Title:='Add Executable File To Drop On Windows';
 if Opendialog1.Execute Then
  begin
  edit3.Text:=Opendialog1.FileName;
  end;
end;

procedure TForm4.SpeedButton4Click(Sender: TObject);
begin
   OpenDialog1.Filter:= 'Executable Images |*.exe';
 Opendialog1.Title:='Add Executable File To Drop On Windows';
 if Opendialog1.Execute Then
  begin
  edit4.Text:=Opendialog1.FileName;
  end;
end;

procedure TForm4.SpeedButton5Click(Sender: TObject);
begin
   OpenDialog1.Filter:= 'Executable Images |*.exe';
 Opendialog1.Title:='Add Executable File To Drop On Windows';
 if Opendialog1.Execute Then
  begin
  edit5.Text:=Opendialog1.FileName;
  end;
end;

procedure TForm4.SpeedButton6Click(Sender: TObject);
begin
   OpenDialog1.Filter:= 'Executable Images |*.exe';
 Opendialog1.Title:='Add Executable File To Drop On Windows';
 if Opendialog1.Execute Then
  begin
  edit6.Text:=Opendialog1.FileName;
  end;
end;

procedure TForm4.SpeedButton7Click(Sender: TObject);
begin
 Form4.Close;
 Form1.Show;
end;

end.
