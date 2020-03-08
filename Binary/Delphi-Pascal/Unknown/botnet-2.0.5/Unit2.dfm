   object Form2: TForm2
     Left = 576
     Top = 108
     BorderIcons = [biSystemMenu, biMinimize]
     BorderStyle = bsSingle
     Caption = 'BotNet 2.0.5 Configuration'
     ClientHeight = 285
     ClientWidth = 497
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Arial'
     Font.Style = []
     Menu = MainMenu1
     OldCreateOrder = False
     PixelsPerInch = 96
     TextHeight = 14
     object Label3: TLabel
       Left = 0
       Top = 264
       Width = 169
       Height = 17
       AutoSize = False
       Caption = 'BotNet 2.0.5 - UCC Release'
       Enabled = False
     end
     object Label4: TLabel
       Left = 8
       Top = 216
       Width = 73
       Height = 17
       AutoSize = False
       Caption = 'Server name :'
     end
     object Label5: TLabel
       Left = 256
       Top = 216
       Width = 81
       Height = 17
       AutoSize = False
       Caption = 'Channel Topic:'
     end
     object Label6: TLabel
       Left = 376
       Top = 216
       Width = 81
       Height = 17
       AutoSize = False
       Caption = 'Channel:'
     end
     object Panel1: TPanel
       Left = 0
       Top = 0
       Width = 497
       Height = 2
       Align = alTop
       BevelOuter = bvLowered
       TabOrder = 0
     end
     object GroupBox1: TGroupBox
       Left = 0
       Top = 8
       Width = 169
       Height = 129
       Caption = 'Admin Settings'
       TabOrder = 1
       object Label1: TLabel
         Left = 8
         Top = 16
         Width = 153
         Height = 17
         AutoSize = False
         Caption = 'Server Port:'
       end
       object Edit1: TEdit
         Left = 8
         Top = 32
         Width = 153
         Height = 22
         Color = 15921906
         TabOrder = 0
         Text = '6667'
       end
       object RadioGroup1: TRadioGroup
         Left = 8
         Top = 56
         Width = 153
         Height = 65
         Caption = 'Server public-level'
         ItemIndex = 0
         Items.Strings = (
           'Low - Hidden'
           'Medium - Faked'
           'High - 100% Public')
         TabOrder = 1
       end
     end
     object GroupBox2: TGroupBox
       Left = 0
       Top = 144
       Width = 169
       Height = 65
       Caption = 'Spoofed Settings'
       TabOrder = 2
       object CheckBox1: TCheckBox
         Left = 8
         Top = 16
         Width = 153
         Height = 17
         Caption = 'Use '#39'spoofed'#39' identity'
         Checked = True
         State = cbChecked
         TabOrder = 0
       end
       object Edit2: TEdit
         Left = 8
         Top = 32
         Width = 153
         Height = 22
         Color = 15921906
         TabOrder = 1
         Text = 'nick!ident@host.com'
       end
     end
     object GroupBox3: TGroupBox
       Left = 176
       Top = 8
       Width = 185
       Height = 201
       Caption = 'On connection'
       TabOrder = 3
       object Memo1: TMemo
         Left = 8
         Top = 16
         Width = 169
         Height = 57
         Color = 15921906
         Lines.Strings = (
           'Welcome Message')
         ScrollBars = ssVertical
         TabOrder = 0
       end
       object GroupBox4: TGroupBox
         Left = 8
         Top = 80
         Width = 169
         Height = 113
         Caption = 'Connections'
         TabOrder = 1
         object RadioButton1: TRadioButton
           Left = 8
           Top = 16
           Width = 153
           Height = 17
           Caption = 'Dont use this option'
           Checked = True
           TabOrder = 0
           TabStop = True
         end
         object RadioButton2: TRadioButton
           Left = 8
           Top = 32
           Width = 153
           Height = 17
           Caption = 'Only accept following ips'
           TabOrder = 1
         end
         object RadioButton3: TRadioButton
           Left = 8
           Top = 48
           Width = 153
           Height = 17
           Caption = 'Do not accept following ips'
           TabOrder = 2
         end
         object Memo2: TMemo
           Left = 8
           Top = 64
           Width = 153
           Height = 41
           Color = 15921906
           Lines.Strings = (
             '127.*.*.*')
           ScrollBars = ssVertical
           TabOrder = 3
         end
       end
     end
     object GroupBox5: TGroupBox
       Left = 368
       Top = 8
       Width = 129
       Height = 201
       Caption = 'Friendlist'
       TabOrder = 4
       object Label2: TLabel
         Left = 24
         Top = 32
         Width = 97
         Height = 17
         AutoSize = False
         Caption = 'for following names'
       end
       object CheckBox2: TCheckBox
         Left = 8
         Top = 16
         Width = 113
         Height = 17
         Caption = 'Make server public'
         Checked = True
         State = cbChecked
         TabOrder = 0
       end
       object Memo3: TMemo
         Left = 8
         Top = 48
         Width = 113
         Height = 145
         Color = 15921906
         Lines.Strings = (
           'p0ke')
         ScrollBars = ssVertical
         TabOrder = 1
       end
     end
     object Button1: TButton
       Left = 416
       Top = 264
       Width = 81
       Height = 21
       Caption = 'Close && Save'
       TabOrder = 5
       OnClick = Button1Click
     end
     object Button2: TButton
       Left = 328
       Top = 264
       Width = 81
       Height = 21
       Caption = '&Cancel'
       TabOrder = 6
       OnClick = Button2Click
     end
     object Edit3: TEdit
       Left = 8
       Top = 232
       Width = 113
       Height = 22
       Color = 15921906
       TabOrder = 7
       Text = 'BotNet205'
       OnKeyDown = Edit3KeyDown
     end
     object Edit4: TEdit
       Left = 128
       Top = 232
       Width = 121
       Height = 22
       Color = 15921906
       TabOrder = 8
       Text = 'botnet-host.com'
       OnKeyDown = Edit3KeyDown
     end
     object CheckBox3: TCheckBox
       Left = 128
       Top = 216
       Width = 105
       Height = 16
       Caption = 'Use fake hosts'
       TabOrder = 9
     end
     object Edit5: TEdit
       Left = 256
       Top = 232
       Width = 113
       Height = 22
       Color = 15921906
       TabOrder = 10
       Text = 'BotNet 2.0.5 Service'
       OnKeyDown = Edit3KeyDown
     end
     object Edit6: TEdit
       Left = 376
       Top = 232
       Width = 113
       Height = 22
       Color = 15921906
       TabOrder = 11
       Text = '#Admin'
       OnKeyDown = Edit3KeyDown
     end
     object MainMenu1: TMainMenu
       Left = 384
       Top = 144
       object File1: TMenuItem
         Caption = '&File'
         object LoadSettings1: TMenuItem
           Caption = '&Load Settings...'
           OnClick = LoadSettings1Click
         end
       end
     end
     object OpenDialog1: TOpenDialog
       Filter = 'BotNet 2.0.5|*.bn5'
       Left = 384
       Top = 112
     end
     object SaveDialog1: TSaveDialog
       Filter = 'BotNet 2.0.5|*.bn5'
       Left = 384
       Top = 80
     end
   end
