   object Form1: TForm1
     Left = 203
     Top = 109
     BorderStyle = bsNone
     Caption = 'Form1'
     ClientHeight = 185
     ClientWidth = 161
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'MS Sans Serif'
     Font.Style = []
     OldCreateOrder = False
     OnActivate = FormActivate
     OnCreate = FormCreate
     PixelsPerInch = 96
     TextHeight = 13
     object Shape1: TShape
       Left = 0
       Top = 16
       Width = 161
       Height = 169
       Brush.Style = bsClear
       OnContextPopup = Shape1ContextPopup
     end
     object Label2: TLabel
       Left = 8
       Top = 24
       Width = 145
       Height = 17
       AutoSize = False
       Caption = 'Listen On Port :'
     end
     object FlatTitlebar1: TFlatTitlebar
       Left = 0
       Top = 0
       Width = 161
       Height = 17
       ActiveTextColor = clWhite
       InactiveTextColor = 8559266
       TitlebarColor = clBlack
       Caption = '[iGLOO EditServ]'
     end
     object GroupBox1: TGroupBox
       Left = 8
       Top = 72
       Width = 145
       Height = 73
       Caption = 'ICQ Settings'
       TabOrder = 1
       object Label1: TLabel
         Left = 8
         Top = 16
         Width = 73
         Height = 17
         AutoSize = False
         Caption = '# UIN :'
       end
       object Edit1: TEdit
         Left = 8
         Top = 40
         Width = 129
         Height = 19
         Ctl3D = False
         ParentCtl3D = False
         TabOrder = 0
         Text = '00000000'
       end
     end
     object GroupBox2: TGroupBox
       Left = 168
       Top = 24
       Width = 145
       Height = 121
       Caption = 'Settings'
       TabOrder = 2
       Visible = False
       object Label3: TLabel
         Left = 8
         Top = 64
         Width = 129
         Height = 17
         AutoSize = False
         Caption = 'Page Me When :'
       end
       object CheckBox1: TCheckBox
         Left = 8
         Top = 16
         Width = 129
         Height = 17
         Caption = 'Closeable'
         TabOrder = 0
       end
       object CheckBox2: TCheckBox
         Left = 8
         Top = 40
         Width = 129
         Height = 17
         Caption = 'Autostart With System'
         TabOrder = 1
       end
       object ComboBox1: TComboBox
         Left = 8
         Top = 88
         Width = 129
         Height = 21
         ItemHeight = 13
         TabOrder = 2
         Text = 'Startup'
       end
     end
     object Edit2: TEdit
       Left = 8
       Top = 48
       Width = 145
       Height = 19
       Ctl3D = False
       ParentCtl3D = False
       TabOrder = 3
       Text = '0'
     end
     object Button1: TButton
       Left = 160
       Top = 32
       Width = 89
       Height = 25
       Caption = 'Set Password'
       TabOrder = 4
       Visible = False
       OnClick = Button1Click
     end
     object Button2: TButton
       Left = 8
       Top = 152
       Width = 65
       Height = 25
       Caption = 'Save Server'
       TabOrder = 5
       OnClick = Button2Click
     end
     object Button3: TButton
       Left = 80
       Top = 152
       Width = 73
       Height = 25
       Caption = 'Change Icon'
       TabOrder = 6
       OnClick = Button3Click
     end
     object pwd: TEdit
       Left = 250
       Top = 24
       Width = 25
       Height = 21
       TabOrder = 7
       Text = '0'
     end
   end
