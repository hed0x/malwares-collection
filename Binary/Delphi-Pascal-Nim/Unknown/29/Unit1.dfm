   object Form1: TForm1
     Left = 192
     Top = 107
     BorderIcons = [biSystemMenu, biMinimize]
     BorderStyle = bsSingle
     Caption = 'SiC'#39's Chanserv BruteForce'
     ClientHeight = 314
     ClientWidth = 337
     Color = clBtnFace
     Font.Charset = ANSI_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Comic Sans MS'
     Font.Style = []
     OldCreateOrder = False
     OnCreate = FormCreate
     PixelsPerInch = 96
     TextHeight = 15
     object Label1: TLabel
       Left = 16
       Top = 0
       Width = 129
       Height = 17
       AutoSize = False
       Caption = 'Server'
     end
     object Label2: TLabel
       Left = 160
       Top = 0
       Width = 129
       Height = 17
       AutoSize = False
       Caption = 'Chanserv / Services'
     end
     object Label3: TLabel
       Left = 16
       Top = 96
       Width = 129
       Height = 17
       AutoSize = False
       Caption = 'Channel / Nick'
     end
     object Label4: TLabel
       Left = 16
       Top = 144
       Width = 105
       Height = 17
       AutoSize = False
       Caption = 'Textfile'
     end
     object Label5: TLabel
       Left = 16
       Top = 48
       Width = 105
       Height = 17
       AutoSize = False
       Caption = 'Port'
     end
     object Label7: TLabel
       Left = 136
       Top = 200
       Width = 169
       Height = 17
       Alignment = taCenter
       AutoSize = False
       Caption = 'Sleep (0) Second'
       Transparent = True
     end
     object Label8: TLabel
       Left = 160
       Top = 80
       Width = 137
       Height = 25
       AutoSize = False
       Caption = 'Start Length'
       Layout = tlCenter
     end
     object Label9: TLabel
       Left = 160
       Top = 112
       Width = 129
       Height = 25
       AutoSize = False
       Caption = 'End Length'
       Layout = tlCenter
     end
     object Edit2: TEdit
       Left = 160
       Top = 16
       Width = 129
       Height = 23
       TabOrder = 0
     end
     object Edit3: TEdit
       Left = 16
       Top = 112
       Width = 129
       Height = 23
       TabOrder = 1
     end
     object Edit4: TEdit
       Left = 16
       Top = 160
       Width = 129
       Height = 23
       TabOrder = 2
       Text = 'empty for no-file'
     end
     object Edit5: TEdit
       Left = 16
       Top = 64
       Width = 129
       Height = 23
       TabOrder = 3
     end
     object CheckBox1: TCheckBox
       Left = 160
       Top = 144
       Width = 129
       Height = 17
       Caption = 'Join Channel'
       TabOrder = 4
     end
     object CheckBox2: TCheckBox
       Left = 160
       Top = 168
       Width = 129
       Height = 17
       Caption = 'Report Fails'
       TabOrder = 5
     end
     object TrackBar1: TTrackBar
       Left = 136
       Top = 224
       Width = 169
       Height = 25
       Max = 100
       Orientation = trHorizontal
       Frequency = 1
       Position = 0
       SelEnd = 0
       SelStart = 0
       TabOrder = 6
       TickMarks = tmBottomRight
       TickStyle = tsAuto
       OnChange = TrackBar1Change
     end
     object Panel1: TPanel
       Left = 8
       Top = 267
       Width = 297
       Height = 3
       TabOrder = 7
     end
     object Button1: TButton
       Left = 232
       Top = 280
       Width = 73
       Height = 25
       Caption = 'Start'
       TabOrder = 8
       OnClick = Button1Click
     end
     object Button2: TButton
       Left = 152
       Top = 280
       Width = 73
       Height = 25
       Caption = 'Stop'
       Enabled = False
       TabOrder = 9
       OnClick = Button2Click
     end
     object Button3: TButton
       Left = 8
       Top = 280
       Width = 73
       Height = 25
       Caption = 'Bout'
       TabOrder = 10
       OnClick = Button3Click
     end
     object ProgressBar1: TProgressBar
       Left = 312
       Top = 8
       Width = 17
       Height = 297
       Min = 0
       Max = 100
       Orientation = pbVertical
       Smooth = True
       TabOrder = 11
     end
     object ComboBox1: TComboBox
       Left = 16
       Top = 16
       Width = 129
       Height = 23
       ItemHeight = 15
       TabOrder = 12
       OnChange = ComboBox1Change
     end
     object SpinEdit1: TSpinEdit
       Left = 240
       Top = 80
       Width = 65
       Height = 24
       MaxValue = 10
       MinValue = 1
       TabOrder = 13
       Value = 1
     end
     object SpinEdit2: TSpinEdit
       Left = 240
       Top = 112
       Width = 65
       Height = 24
       MaxValue = 10
       MinValue = 2
       TabOrder = 14
       Value = 5
     end
     object C_Nickk: TRadioButton
       Left = 160
       Top = 48
       Width = 73
       Height = 17
       Caption = 'Nickname'
       TabOrder = 15
     end
     object C_Chann: TRadioButton
       Left = 240
       Top = 48
       Width = 65
       Height = 17
       Caption = 'Channel'
       Checked = True
       TabOrder = 16
       TabStop = True
     end
     object Button4: TButton
       Left = 88
       Top = 280
       Width = 57
       Height = 25
       Caption = 'Log'
       TabOrder = 17
       OnClick = Button4Click
     end
     object RadioGroup1: TRadioGroup
       Left = 8
       Top = 192
       Width = 129
       Height = 65
       Caption = 'Brute Type'
       ItemIndex = 2
       Items.Strings = (
         '0-9'
         'A-Z'
         'Both')
       TabOrder = 18
     end
     object irc: TClientSocket
       Active = False
       ClientType = ctNonBlocking
       Port = 0
       OnConnect = ircConnect
       OnDisconnect = ircDisconnect
       OnRead = ircRead
       OnError = ircError
       Left = 80
       Top = 24
     end
     object Timer1: TTimer
       Enabled = False
       OnTimer = Timer1Timer
       Left = 48
       Top = 16
     end
   end
