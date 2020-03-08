   object Form2: TForm2
     Left = 575
     Top = 105
     BorderIcons = [biSystemMenu, biMinimize]
     BorderStyle = bsSingle
     Caption = 'Botnet - Config'
     ClientHeight = 296
     ClientWidth = 563
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Arial'
     Font.Style = []
     OldCreateOrder = False
     PixelsPerInch = 96
     TextHeight = 14
     object Label2: TLabel
       Left = 8
       Top = 272
       Width = 249
       Height = 21
       AutoSize = False
       Caption = 'Botnet 2.0.0 - Stafrak Version'
       Enabled = False
       Layout = tlCenter
     end
     object Label8: TLabel
       Left = 424
       Top = 224
       Width = 129
       Height = 17
       AutoSize = False
       Caption = 'ServerName'
     end
     object Label9: TLabel
       Left = 424
       Top = 184
       Width = 129
       Height = 17
       AutoSize = False
       Caption = 'Topic'
     end
     object GroupBox1: TGroupBox
       Left = 8
       Top = 8
       Width = 409
       Height = 257
       Caption = 'Port && Connections'
       TabOrder = 1
       object GroupBox2: TGroupBox
         Left = 232
         Top = 96
         Width = 169
         Height = 153
         Caption = 'Connections'
         TabOrder = 0
         object Memo2: TMemo
           Left = 8
           Top = 64
           Width = 153
           Height = 81
           Color = 15921906
           Lines.Strings = (
             '127.*.*.*')
           ScrollBars = ssVertical
           TabOrder = 3
         end
         object RadioButton1: TRadioButton
           Left = 8
           Top = 32
           Width = 153
           Height = 17
           Caption = 'Only accept following ip'#39's'
           TabOrder = 1
         end
         object RadioButton2: TRadioButton
           Left = 8
           Top = 48
           Width = 153
           Height = 17
           Caption = 'Do no accept following ip'#39's'
           TabOrder = 2
         end
         object RadioButton3: TRadioButton
           Left = 8
           Top = 16
           Width = 153
           Height = 17
           Caption = 'Dont use this option'
           Checked = True
           TabOrder = 0
           TabStop = True
         end
       end
       object Memo1: TMemo
         Left = 232
         Top = 16
         Width = 169
         Height = 73
         Color = 15921906
         Lines.Strings = (
           'Welcome Message Goes '
           'Here...')
         ScrollBars = ssBoth
         TabOrder = 4
       end
       object CheckBox2: TCheckBox
         Left = 8
         Top = 232
         Width = 217
         Height = 17
         Caption = 'Make privmsgs public for everyone'
         TabOrder = 1
       end
       object GroupBox3: TGroupBox
         Left = 8
         Top = 16
         Width = 217
         Height = 177
         Caption = 'Admin Settings'
         TabOrder = 2
         object Label3: TLabel
           Left = 8
           Top = 40
           Width = 121
           Height = 22
           AutoSize = False
           Caption = 'Force-join channel'
           Layout = tlCenter
         end
         object Label1: TLabel
           Left = 8
           Top = 16
           Width = 121
           Height = 22
           AutoSize = False
           Caption = 'Listen on Port'
           Layout = tlCenter
         end
         object Edit1: TEdit
           Left = 128
           Top = 16
           Width = 81
           Height = 22
           Color = 15921906
           TabOrder = 0
           Text = '6667'
         end
         object Edit2: TEdit
           Left = 128
           Top = 40
           Width = 81
           Height = 22
           Color = 15921906
           TabOrder = 1
           Text = '#Admin'
         end
         object Panel1: TPanel
           Left = 8
           Top = 64
           Width = 201
           Height = 105
           BevelInner = bvRaised
           BevelOuter = bvLowered
           TabOrder = 2
           object Label4: TLabel
             Left = 8
             Top = 29
             Width = 105
             Height = 22
             AutoSize = False
             Caption = 'Admin name'
             Layout = tlCenter
           end
           object Label5: TLabel
             Left = 8
             Top = 52
             Width = 105
             Height = 22
             AutoSize = False
             Caption = 'Admin Ident'
             Layout = tlCenter
           end
           object Label6: TLabel
             Left = 8
             Top = 75
             Width = 105
             Height = 22
             AutoSize = False
             Caption = 'Admin host'
             Layout = tlCenter
           end
           object Edit5: TEdit
             Left = 112
             Top = 75
             Width = 81
             Height = 22
             Color = 15921906
             TabOrder = 3
             Text = '-Admin'
           end
           object Edit4: TEdit
             Left = 112
             Top = 52
             Width = 81
             Height = 22
             Color = 15921906
             TabOrder = 2
             Text = 'I-Am-'
           end
           object Edit3: TEdit
             Left = 112
             Top = 29
             Width = 81
             Height = 22
             Color = 15921906
             TabOrder = 1
             Text = 'Admin'
           end
           object CheckBox3: TCheckBox
             Left = 8
             Top = 8
             Width = 185
             Height = 17
             Caption = 'Use '#39'spoofed'#39' identity'
             TabOrder = 0
           end
         end
       end
       object CheckBox1: TCheckBox
         Left = 8
         Top = 208
         Width = 217
         Height = 17
         Caption = 'Make nicknamelist public for everyone'
         TabOrder = 3
       end
     end
     object Button1: TButton
       Left = 488
       Top = 272
       Width = 73
       Height = 21
       Caption = 'Close && &Save'
       TabOrder = 3
       OnClick = Button1Click
     end
     object Button2: TButton
       Left = 408
       Top = 272
       Width = 73
       Height = 21
       Caption = '&Cancel'
       TabOrder = 2
       OnClick = Button2Click
     end
     object GroupBox4: TGroupBox
       Left = 424
       Top = 8
       Width = 137
       Height = 169
       Caption = 'Friend List'
       TabOrder = 0
       object Label7: TLabel
         Left = 24
         Top = 16
         Width = 105
         Height = 33
         AutoSize = False
         Caption = 'Make server public for following names.'
         WordWrap = True
         OnClick = Label7Click
       end
       object CheckBox4: TCheckBox
         Left = 8
         Top = 16
         Width = 15
         Height = 17
         TabOrder = 0
       end
       object Memo3: TMemo
         Left = 8
         Top = 48
         Width = 121
         Height = 113
         Color = 15921906
         Lines.Strings = (
           'BestFriend'
           'BuddyMan'
           'p0ke')
         ScrollBars = ssVertical
         TabOrder = 1
       end
     end
     object Edit6: TEdit
       Left = 424
       Top = 240
       Width = 129
       Height = 22
       TabOrder = 4
       Text = 'SiC'
     end
     object Edit7: TEdit
       Left = 424
       Top = 200
       Width = 129
       Height = 22
       TabOrder = 5
       Text = '(Botnet 2.0.0 Stafrak Version)'
     end
   end
