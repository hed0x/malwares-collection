   object Form1: TForm1
     Left = 190
     Top = 110
     Width = 386
     Height = 335
     Caption = 'BotNet 2.0.5 - UCC Release'
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Arial'
     Font.Style = []
     Menu = MainMenu1
     OldCreateOrder = False
     OnCreate = FormCreate
     OnResize = FormResize
     DesignSize = (
       378
       289)
     PixelsPerInch = 96
     TextHeight = 14
     object Label1: TLabel
       Left = 129
       Top = 8
       Width = 9
       Height = 25
       Alignment = taCenter
       Anchors = [akTop, akRight]
       AutoSize = False
       Caption = ':'
       Font.Charset = DEFAULT_CHARSET
       Font.Color = clWindowText
       Font.Height = -11
       Font.Name = 'Arial'
       Font.Style = [fsBold]
       ParentFont = False
       Layout = tlCenter
     end
     object Label3: TLabel
       Left = 0
       Top = 32
       Width = 73
       Height = 17
       AutoSize = False
       Caption = 'Socket Status:'
       Font.Charset = DEFAULT_CHARSET
       Font.Color = 3618615
       Font.Height = -11
       Font.Name = 'Arial'
       Font.Style = []
       ParentFont = False
     end
     object Label4: TLabel
       Left = 80
       Top = 32
       Width = 298
       Height = 17
       Anchors = [akLeft, akTop, akRight]
       AutoSize = False
       Caption = 'None'
       Font.Charset = DEFAULT_CHARSET
       Font.Color = clMaroon
       Font.Height = -11
       Font.Name = 'Arial'
       Font.Style = []
       ParentFont = False
     end
     object Label2: TLabel
       Left = 193
       Top = 8
       Width = 9
       Height = 25
       Alignment = taCenter
       Anchors = [akTop, akRight]
       AutoSize = False
       Caption = ':'
       Font.Charset = DEFAULT_CHARSET
       Font.Color = clWindowText
       Font.Height = -11
       Font.Name = 'Arial'
       Font.Style = [fsBold]
       ParentFont = False
       Layout = tlCenter
     end
     object Panel1: TPanel
       Left = 0
       Top = 48
       Width = 378
       Height = 169
       Anchors = [akLeft, akTop, akRight, akBottom]
       BevelOuter = bvNone
       TabOrder = 0
       object Splitter1: TSplitter
         Left = 249
         Top = 0
         Width = 5
         Height = 169
         Cursor = crHSplit
         AutoSnap = False
         Beveled = True
         MinSize = 40
         ResizeStyle = rsUpdate
       end
       object ListView1: TListView
         Left = 254
         Top = 0
         Width = 124
         Height = 169
         Align = alClient
         Color = 15921906
         Columns = <
           item
             Caption = 'Nickname'
             Width = 80
           end
           item
             Caption = 'Data'
             Width = 0
           end>
         ColumnClick = False
         MultiSelect = True
         ReadOnly = True
         RowSelect = True
         ShowColumnHeaders = False
         TabOrder = 0
         ViewStyle = vsReport
         OnClick = ListView1Click
         OnResize = ListView1Resize
       end
       object PageControl1: TPageControl
         Left = 0
         Top = 0
         Width = 249
         Height = 169
         ActivePage = TabSheet2
         Align = alLeft
         Font.Charset = DEFAULT_CHARSET
         Font.Color = clWindowText
         Font.Height = -11
         Font.Name = 'Arial'
         Font.Style = []
         MultiLine = True
         ParentFont = False
         TabIndex = 1
         TabOrder = 1
         TabPosition = tpLeft
         object TabSheet1: TTabSheet
           Caption = 'Information'
           object Memo3: TMemo
             Left = 0
             Top = 0
             Width = 222
             Height = 161
             Align = alClient
             Color = 15921906
             Ctl3D = True
             ParentCtl3D = False
             ReadOnly = True
             ScrollBars = ssVertical
             TabOrder = 0
           end
         end
         object TabSheet2: TTabSheet
           Caption = 'Chat'
           ImageIndex = 1
           object Memo1: TMemo
             Left = 0
             Top = 0
             Width = 222
             Height = 161
             Align = alClient
             Color = 15921906
             ReadOnly = True
             ScrollBars = ssVertical
             TabOrder = 0
           end
         end
       end
     end
     object RadioButton1: TRadioButton
       Left = 0
       Top = 224
       Width = 33
       Height = 17
       Anchors = [akLeft, akBottom]
       Caption = 'All'
       Checked = True
       TabOrder = 1
       TabStop = True
     end
     object RadioButton2: TRadioButton
       Left = 40
       Top = 224
       Width = 17
       Height = 17
       Anchors = [akLeft, akBottom]
       Caption = 'RadioButton2'
       TabOrder = 2
     end
     object ComboBox1: TComboBox
       Left = 56
       Top = 220
       Width = 195
       Height = 22
       Style = csDropDownList
       Anchors = [akLeft, akRight, akBottom]
       Color = 15921906
       ItemHeight = 14
       ItemIndex = 0
       TabOrder = 3
       Text = 'Selected Bots Only'
       Items.Strings = (
         'Selected Bots Only'
         'Bots Starting With'
         'Bots Containing'
         'Bots Ending With')
     end
     object Edit4: TEdit
       Left = 254
       Top = 220
       Width = 124
       Height = 22
       Anchors = [akRight, akBottom]
       Color = 15921906
       TabOrder = 4
     end
     object Button3: TButton
       Left = 329
       Top = 245
       Width = 49
       Height = 20
       Anchors = [akRight, akBottom]
       Caption = '&Send'
       TabOrder = 5
       OnClick = Button3Click
     end
     object StatusBar1: TStatusBar
       Left = 0
       Top = 271
       Width = 378
       Height = 18
       Panels = <
         item
           Text = '0 Bots'
           Width = 80
         end
         item
           Text = 'Client: Offline'
           Width = 80
         end
         item
           Text = 'Server: Offline'
           Width = 80
         end
         item
           Text = 'Timer: 00:00:00'
           Width = 50
         end>
       SimplePanel = False
     end
     object Edit1: TEdit
       Left = 0
       Top = 8
       Width = 129
       Height = 22
       Anchors = [akLeft, akTop, akRight]
       Color = 15921906
       TabOrder = 7
       Text = '127.0.0.1'
     end
     object Edit2: TEdit
       Left = 137
       Top = 8
       Width = 57
       Height = 22
       Anchors = [akTop, akRight]
       Color = 15921906
       TabOrder = 8
       Text = '6668'
     end
     object Button2: TButton
       Left = 313
       Top = 8
       Width = 65
       Height = 22
       Anchors = [akTop, akRight]
       Caption = '&Connect'
       TabOrder = 10
       OnClick = Button2Click
     end
     object Panel2: TPanel
       Left = 0
       Top = 0
       Width = 378
       Height = 2
       Align = alTop
       BevelOuter = bvLowered
       TabOrder = 11
     end
     object CheckBox1: TCheckBox
       Left = 257
       Top = 248
       Width = 65
       Height = 17
       Anchors = [akRight, akBottom]
       Caption = 'Rawdata'
       TabOrder = 12
     end
     object bGate: TCheckBox
       Left = 264
       Top = 8
       Width = 49
       Height = 22
       Anchors = [akTop, akRight]
       Caption = 'Gate'
       TabOrder = 13
     end
     object Edit3: TEdit
       Left = 201
       Top = 8
       Width = 57
       Height = 22
       Anchors = [akTop, akRight]
       Color = 15921906
       TabOrder = 9
       Text = 'AdminNick'
     end
     object Memo2: TEdit
       Left = 0
       Top = 245
       Width = 251
       Height = 22
       Anchors = [akLeft, akRight, akBottom]
       TabOrder = 14
     end
     object MainMenu1: TMainMenu
       Left = 64
       Top = 56
       object FIle1: TMenuItem
         Caption = '&File'
         object Config1: TMenuItem
           Caption = '&Config'
           OnClick = Config1Click
         end
         object N1: TMenuItem
           Caption = '-'
         end
         object Client1: TMenuItem
           Caption = 'C&lient'
           object Start1: TMenuItem
             Caption = '&Start'
             OnClick = Start1Click
           end
           object Stop1: TMenuItem
             Caption = 'S&top'
             OnClick = Stop1Click
           end
         end
         object Server1: TMenuItem
           Caption = '&Server'
           object Start2: TMenuItem
             Caption = '&Start'
             OnClick = Start2Click
           end
           object Stop2: TMenuItem
             Caption = 'S&top'
             OnClick = Stop2Click
           end
         end
         object N2: TMenuItem
           Caption = '-'
         end
         object Exit1: TMenuItem
           Caption = '&Exit'
           OnClick = Exit1Click
         end
       end
       object About1: TMenuItem
         Caption = '&About'
         object BotNet1: TMenuItem
           Caption = '&BotNet'
         end
         object BotPage1: TMenuItem
           Caption = 'B&otPage'
         end
       end
     end
     object Timer1: TTimer
       Enabled = False
       Interval = 10
       OnTimer = Timer1Timer
       Left = 32
       Top = 56
     end
     object ServerSocket1: TServerSocket
       Active = False
       Port = 6667
       ServerType = stNonBlocking
       OnListen = ServerSocket1Listen
       OnClientConnect = ServerSocket1ClientConnect
       OnClientRead = ServerSocket1ClientRead
       OnClientError = ServerSocket1ClientError
       Left = 96
       Top = 56
     end
     object ClientSocket1: TClientSocket
       Active = False
       ClientType = ctNonBlocking
       Port = 0
       OnConnecting = ClientSocket1Connecting
       OnConnect = ClientSocket1Connect
       OnDisconnect = ClientSocket1Disconnect
       OnRead = ClientSocket1Read
       OnError = ClientSocket1Error
       Left = 128
       Top = 56
     end
     object Timer2: TTimer
       Interval = 1
       OnTimer = Timer2Timer
       Left = 160
       Top = 56
     end
   end
