   object Form3: TForm3
     Left = 513
     Top = 104
     BorderStyle = bsNone
     Caption = 'Form3'
     ClientHeight = 73
     ClientWidth = 161
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'MS Sans Serif'
     Font.Style = []
     OldCreateOrder = False
     PixelsPerInch = 96
     TextHeight = 13
     object Shape1: TShape
       Left = 0
       Top = 16
       Width = 161
       Height = 57
       Brush.Style = bsClear
     end
     object Label1: TLabel
       Left = 8
       Top = 24
       Width = 145
       Height = 17
       AutoSize = False
       Caption = 'New Password :'
     end
     object FlatTitlebar1: TFlatTitlebar
       Left = 0
       Top = 0
       Width = 161
       Height = 17
       ActiveTextColor = clWhite
       InactiveTextColor = 8559266
       TitlebarColor = clBlack
       Caption = 'Set Password'
     end
     object Edit1: TEdit
       Left = 8
       Top = 48
       Width = 97
       Height = 21
       PasswordChar = '*'
       TabOrder = 1
     end
     object Button1: TButton
       Left = 112
       Top = 48
       Width = 41
       Height = 17
       Caption = 'Set'
       TabOrder = 2
       OnClick = Button1Click
     end
   end
