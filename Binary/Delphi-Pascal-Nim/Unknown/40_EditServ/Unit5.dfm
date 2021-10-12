   object Form5: TForm5
     Left = 824
     Top = 115
     BorderStyle = bsNone
     Caption = 'Form5'
     ClientHeight = 89
     ClientWidth = 217
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Verdana'
     Font.Style = []
     OldCreateOrder = False
     PixelsPerInch = 96
     TextHeight = 13
     object Shape1: TShape
       Left = 0
       Top = 16
       Width = 217
       Height = 73
       Brush.Style = bsClear
     end
     object Label1: TLabel
       Left = 8
       Top = 24
       Width = 201
       Height = 33
       Alignment = taCenter
       AutoSize = False
       Caption = 'If this server is your, please enter server password'
       WordWrap = True
     end
     object FlatTitlebar1: TFlatTitlebar
       Left = 0
       Top = 0
       Width = 217
       Height = 17
       ActiveTextColor = clWhite
       InactiveTextColor = 8559266
       TitlebarColor = clBlack
       Caption = 'Enter Password'
     end
     object Edit1: TEdit
       Left = 8
       Top = 56
       Width = 129
       Height = 21
       PasswordChar = '*'
       TabOrder = 1
       OnKeyPress = Edit1KeyPress
     end
     object Button1: TButton
       Left = 144
       Top = 56
       Width = 65
       Height = 21
       Caption = '&Cancel'
       TabOrder = 2
       OnClick = Button1Click
     end
     object Edit2: TEdit
       Left = 48
       Top = 32
       Width = 73
       Height = 21
       TabOrder = 3
       Visible = False
     end
   end
