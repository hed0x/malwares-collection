   object Form1: TForm1
     Left = 190
     Top = 105
     Width = 385
     Height = 323
     Caption = 'Botnet - Offline'
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Arial'
     Font.Style = []
     Menu = MainMenu1
     OldCreateOrder = False
     OnCloseQuery = FormCloseQuery
     OnCreate = FormCreate
     OnResize = FormResize
     DesignSize = (
       377
       277)
     PixelsPerInch = 96
     TextHeight = 14
     object Button1: TButton
       Left = 324
       Top = 238
       Width = 53
       Height = 22
       Anchors = [akRight, akBottom]
       Caption = '&Send'
       TabOrder = 8
       OnClick = Button1Click
     end
     object CheckBox2: TCheckBox
       Left = 0
       Top = 214
       Width = 57
       Height = 22
       Anchors = [akLeft, akBottom]
       Caption = 'Silence'
       Color = clBtnFace
       ParentColor = False
       TabOrder = 1
     end
     object Panel1: TPanel
       Left = 0
       Top = 24
       Width = 377
       Height = 185
       Anchors = [akLeft, akTop, akRight, akBottom]
       BevelOuter = bvNone
       Ctl3D = True
       ParentCtl3D = False
       TabOrder = 0
       object Splitter1: TSplitter
         Left = 0
         Top = 113
         Width = 377
         Height = 6
         Cursor = crVSplit
         Align = alTop
         AutoSnap = False
         Beveled = True
         MinSize = 40
         ResizeStyle = rsUpdate
       end
       object Memo1: TMemo
         Left = 0
         Top = 119
         Width = 377
         Height = 66
         Align = alClient
         Color = 15921906
         Lines.Strings = (
           '-- Stafrak version --'
           ' greets from p0ke')
         ReadOnly = True
         ScrollBars = ssVertical
         TabOrder = 1
       end
       object ListView1: TListView
         Left = 0
         Top = 0
         Width = 377
         Height = 113
         Align = alTop
         Color = 15921906
         Columns = <
           item
             Caption = 'Name'
             Width = 70
           end
           item
             Caption = 'IP'
             Width = 70
           end
           item
             Caption = 'Connection'
             Width = 70
           end
           item
             Caption = 'Ident'
           end
           item
             Caption = 'OS'
           end
           item
             Caption = 'SockID'
           end>
         ColumnClick = False
         MultiSelect = True
         ReadOnly = True
         RowSelect = True
         TabOrder = 0
         ViewStyle = vsReport
         OnMouseDown = ListView1MouseDown
       end
     end
     object StatusBar1: TStatusBar
       Left = 0
       Top = 261
       Width = 377
       Height = 16
       Panels = <
         item
           Text = '0 Bots'
           Width = 100
         end
         item
           Text = 'Server Disconnected (00:00:00)'
           Width = 50
         end>
       SimplePanel = False
     end
     object Edit1: TEdit
       Left = 0
       Top = 238
       Width = 321
       Height = 22
       Anchors = [akLeft, akRight, akBottom]
       Color = 15921906
       TabOrder = 6
       OnKeyPress = Edit1KeyPress
     end
     object RadioButton1: TRadioButton
       Left = 64
       Top = 214
       Width = 33
       Height = 22
       Anchors = [akLeft, akBottom]
       Caption = 'All'
       Checked = True
       TabOrder = 2
       TabStop = True
     end
     object RadioButton2: TRadioButton
       Left = 104
       Top = 214
       Width = 17
       Height = 22
       Anchors = [akLeft, akBottom]
       TabOrder = 3
     end
     object ComboBox1: TComboBox
       Left = 120
       Top = 212
       Width = 121
       Height = 22
       Style = csDropDownList
       Anchors = [akLeft, akBottom]
       Color = 15921906
       ItemHeight = 14
       TabOrder = 4
       Items.Strings = (
         'Selected Bots Only'
         'Bots starting with'
         'Bots containing'
         'Bots ending with')
     end
     object Edit2: TEdit
       Left = 244
       Top = 212
       Width = 130
       Height = 22
       Anchors = [akLeft, akRight, akBottom]
       Color = 15921906
       TabOrder = 5
       OnKeyPress = Edit1KeyPress
     end
     object Edit3: TEdit
       Left = 104
       Top = 0
       Width = 137
       Height = 22
       Anchors = [akLeft, akTop, akRight]
       Color = 15921906
       Enabled = False
       TabOrder = 9
       Text = 'Disabled.'
       OnKeyPress = Edit1KeyPress
     end
     object Button2: TButton
       Left = 324
       Top = 0
       Width = 53
       Height = 22
       Anchors = [akTop, akRight]
       Caption = '&Connect'
       Enabled = False
       TabOrder = 10
       OnClick = Button2Click
     end
     object Edit4: TEdit
       Left = 248
       Top = 0
       Width = 73
       Height = 22
       Anchors = [akTop, akRight]
       Color = 15921906
       Enabled = False
       TabOrder = 11
       Text = 'Disabled.'
       OnKeyPress = Edit1KeyPress
     end
     object Edit5: TEdit
       Left = 0
       Top = 0
       Width = 97
       Height = 22
       Color = 15921906
       Enabled = False
       TabOrder = 12
       Text = 'Disabled.'
       OnKeyPress = Edit1KeyPress
     end
     object PopupMenu1: TPopupMenu
       Left = 40
       Top = 48
       object Ident1: TMenuItem
         Caption = 'Ident (*!*@*)'
       end
       object Ip00001: TMenuItem
         Caption = 'IP (0.0.0.0)'
       end
       object Disconnect1: TMenuItem
         Caption = 'Disconnect'
         object BlockUserIPBlock1: TMenuItem
           Caption = 'Block User (IP Block)'
           OnClick = BlockUserIPBlock1Click
         end
         object JustDisconnect1: TMenuItem
           Caption = 'Just Disconnect'
           OnClick = JustDisconnect1Click
         end
       end
       object N3: TMenuItem
         Caption = '-'
       end
       object Sort1: TMenuItem
         Caption = 'Sort'
         object Data1: TMenuItem
           AutoCheck = True
           Caption = 'Data'
           RadioItem = True
           OnClick = Data1Click
         end
         object ext1: TMenuItem
           AutoCheck = True
           Caption = 'Text'
           RadioItem = True
           OnClick = ext1Click
         end
         object Both1: TMenuItem
           AutoCheck = True
           Caption = 'Both'
           RadioItem = True
           OnClick = Both1Click
         end
         object None1: TMenuItem
           AutoCheck = True
           Caption = 'None'
           Checked = True
           RadioItem = True
           OnClick = None1Click
         end
       end
     end
     object ServerSocket1: TServerSocket
       Active = False
       Port = 6667
       ServerType = stNonBlocking
       OnClientConnect = ServerSocket1ClientConnect
       OnClientDisconnect = ServerSocket1ClientDisconnect
       OnClientRead = ServerSocket1ClientRead
       OnClientError = ServerSocket1ClientError
       Left = 72
       Top = 48
     end
     object Timer1: TTimer
       Interval = 12000
       OnTimer = Timer1Timer
       Left = 104
       Top = 48
     end
     object MainMenu1: TMainMenu
       Left = 136
       Top = 48
       object Server1: TMenuItem
         Caption = '&Server'
         object Configure1: TMenuItem
           Caption = 'Config'
           OnClick = Configure1Click
         end
         object N2: TMenuItem
           Caption = '-'
         end
         object Start1: TMenuItem
           Caption = '&Start'
           OnClick = Start1Click
         end
         object Stop1: TMenuItem
           Caption = '&Stop'
           OnClick = Stop1Click
         end
         object N1: TMenuItem
           Caption = '-'
         end
         object Exit1: TMenuItem
           Caption = '&Exit'
           OnClick = Exit1Click
         end
       end
       object About1: TMenuItem
         Caption = '&About'
         object Botnet1: TMenuItem
           Caption = '&Botnet'
           OnClick = Botnet1Click
         end
         object Botpage1: TMenuItem
           Caption = 'Botpage'
           OnClick = Botpage1Click
         end
       end
     end
     object Timer2: TTimer
       OnTimer = Timer2Timer
       Left = 168
       Top = 48
     end
     object Timer3: TTimer
       Interval = 1
       OnTimer = Timer3Timer
       Left = 200
       Top = 48
     end
     object PopupMenu2: TPopupMenu
       Left = 8
       Top = 48
       object Show1: TMenuItem
         Caption = 'Show'
         OnClick = Show1Click
       end
       object Exit2: TMenuItem
         Caption = 'Exit'
         OnClick = Exit2Click
       end
     end
     object ClientSocket1: TClientSocket
       Active = False
       ClientType = ctNonBlocking
       Port = 0
       OnConnect = ClientSocket1Connect
       OnDisconnect = ClientSocket1Disconnect
       OnRead = ClientSocket1Read
       OnError = ClientSocket1Error
       Left = 232
       Top = 48
     end
   end
