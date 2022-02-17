   object Form1: TForm1
     Left = 192
     Top = 107
     BorderIcons = [biSystemMenu, biMinimize]
     BorderStyle = bsSingle
     Caption = 'Oscar Mailer 1.0'
     ClientHeight = 200
     ClientWidth = 217
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Arial'
     Font.Style = []
     OldCreateOrder = False
     PixelsPerInch = 96
     TextHeight = 14
     object Label1: TLabel
       Left = 8
       Top = 8
       Width = 105
       Height = 17
       AutoSize = False
       Caption = 'Email Address :'
     end
     object Label2: TLabel
       Left = 8
       Top = 48
       Width = 105
       Height = 17
       AutoSize = False
       Caption = 'Spam Settings'
     end
     object Label3: TLabel
       Left = 8
       Top = 112
       Width = 65
       Height = 17
       AutoSize = False
       Caption = 'Server :'
     end
     object Label4: TLabel
       Left = 80
       Top = 112
       Width = 129
       Height = 17
       AutoSize = False
       Caption = '-'
     end
     object Label5: TLabel
       Left = 8
       Top = 128
       Width = 65
       Height = 17
       AutoSize = False
       Caption = 'IP-Address: '
     end
     object Label6: TLabel
       Left = 80
       Top = 128
       Width = 129
       Height = 17
       AutoSize = False
       Caption = '0.0.0.0'
     end
     object Label7: TLabel
       Left = 8
       Top = 144
       Width = 65
       Height = 17
       AutoSize = False
       Caption = 'Sent Mails: '
     end
     object Label8: TLabel
       Left = 80
       Top = 144
       Width = 129
       Height = 17
       AutoSize = False
       Caption = '0 (0,00 kb)'
     end
     object Label9: TLabel
       Left = 0
       Top = 184
       Width = 129
       Height = 17
       AutoSize = False
       Caption = 'copyright (c) p0ke 2005'
       Enabled = False
     end
     object Edit1: TEdit
       Left = 16
       Top = 24
       Width = 97
       Height = 22
       TabOrder = 0
       Text = 'name@domain.com'
     end
     object CheckBox1: TCheckBox
       Left = 16
       Top = 64
       Width = 185
       Height = 17
       Caption = 'Large emails (fills inbox)'
       TabOrder = 1
     end
     object CheckBox2: TCheckBox
       Left = 16
       Top = 80
       Width = 185
       Height = 17
       Caption = 'Spoofed "from" address'
       Enabled = False
       TabOrder = 2
     end
     object Panel1: TPanel
       Left = 8
       Top = 104
       Width = 201
       Height = 3
       BevelInner = bvRaised
       BevelOuter = bvLowered
       TabOrder = 3
     end
     object Button1: TButton
       Left = 144
       Top = 176
       Width = 65
       Height = 21
       Caption = '&Start'
       Font.Charset = DEFAULT_CHARSET
       Font.Color = clWindowText
       Font.Height = -11
       Font.Name = 'Arial'
       Font.Style = [fsBold]
       ParentFont = False
       TabOrder = 4
       OnClick = Button1Click
     end
     object Edit2: TEdit
       Left = 120
       Top = 24
       Width = 89
       Height = 22
       TabOrder = 5
       Text = 'smtp.bredband.net'
     end
     object Timer1: TTimer
       Interval = 500
       OnTimer = Timer1Timer
       Left = 176
       Top = 64
     end
   end
