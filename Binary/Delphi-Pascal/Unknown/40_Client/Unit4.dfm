   object frmWebCam: TfrmWebCam
     Left = 191
     Top = 107
     BorderIcons = [biSystemMenu, biMinimize]
     BorderStyle = bsSingle
     Caption = 'frmWebCam'
     ClientHeight = 217
     ClientWidth = 393
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'MS Sans Serif'
     Font.Style = []
     OldCreateOrder = False
     PixelsPerInch = 96
     TextHeight = 13
     object Label1: TLabel
       Left = 8
       Top = 0
       Width = 377
       Height = 17
       Alignment = taCenter
       AutoSize = False
       Caption = 'As you can see, Webcam function are under construction (;'
     end
     object Label3: TLabel
       Left = 232
       Top = 184
       Width = 153
       Height = 25
       Alignment = taCenter
       AutoSize = False
       Caption = 'Idle...'
       Font.Charset = DEFAULT_CHARSET
       Font.Color = clWindowText
       Font.Height = -19
       Font.Name = 'Verdana'
       Font.Style = []
       ParentFont = False
     end
     object Panel1: TPanel
       Left = 8
       Top = 24
       Width = 217
       Height = 185
       Caption = 'Not Connected'
       TabOrder = 0
       object Image1: TImage
         Left = 8
         Top = 8
         Width = 201
         Height = 169
         Stretch = True
       end
     end
     object Panel2: TPanel
       Left = 232
       Top = 24
       Width = 153
       Height = 73
       TabOrder = 1
       object Label2: TLabel
         Left = 8
         Top = 8
         Width = 49
         Height = 17
         Alignment = taCenter
         AutoSize = False
         Caption = 'IP :'
         Layout = tlCenter
       end
       object Button1: TButton
         Left = 80
         Top = 40
         Width = 65
         Height = 25
         Caption = 'Cancel'
         TabOrder = 0
       end
       object Button2: TButton
         Left = 8
         Top = 40
         Width = 65
         Height = 25
         Caption = 'Connect'
         TabOrder = 1
       end
     end
     object Edit1: TEdit
       Left = 280
       Top = 32
       Width = 97
       Height = 17
       TabOrder = 2
       Text = '127.0.0.1'
     end
     object WC: TClientSocket
       Active = False
       Address = '127.0.0.1'
       ClientType = ctNonBlocking
       Port = 6128
       OnConnecting = WCConnecting
       OnConnect = WCConnect
       OnDisconnect = WCDisconnect
       OnError = WCError
       Left = 232
       Top = 104
     end
   end
