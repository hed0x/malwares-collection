   object Form4: TForm4
     Left = 684
     Top = 112
     BorderStyle = bsNone
     Caption = 'Form4'
     ClientHeight = 193
     ClientWidth = 201
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Verdana'
     Font.Style = []
     OldCreateOrder = False
     OnCreate = FormCreate
     PixelsPerInch = 96
     TextHeight = 13
     object Shape1: TShape
       Left = 0
       Top = 16
       Width = 201
       Height = 177
       Brush.Style = bsClear
     end
     object Label1: TLabel
       Left = 8
       Top = 24
       Width = 105
       Height = 17
       AutoSize = False
       Caption = 'Current Icon :'
     end
     object Image1: TImage
       Left = 8
       Top = 48
       Width = 49
       Height = 49
       Stretch = True
     end
     object Label2: TLabel
       Left = 64
       Top = 64
       Width = 73
       Height = 17
       Alignment = taCenter
       AutoSize = False
       Caption = 'Change To :'
     end
     object Image2: TImage
       Left = 144
       Top = 48
       Width = 49
       Height = 49
       Stretch = True
     end
     object Label3: TLabel
       Left = 8
       Top = 104
       Width = 145
       Height = 17
       AutoSize = False
       Caption = 'New icon path :'
     end
     object FlatTitlebar1: TFlatTitlebar
       Left = 0
       Top = 0
       Width = 201
       Height = 17
       ActiveTextColor = clWhite
       InactiveTextColor = 8559266
       TitlebarColor = clBlack
       Caption = 'Change Servericon'
     end
     object Edit1: TEdit
       Left = 8
       Top = 128
       Width = 145
       Height = 17
       TabOrder = 1
     end
     object Button1: TButton
       Left = 160
       Top = 128
       Width = 33
       Height = 17
       Caption = '...'
       TabOrder = 2
       OnClick = Button1Click
     end
     object Button2: TButton
       Left = 8
       Top = 160
       Width = 89
       Height = 25
       Caption = 'Set'
       TabOrder = 3
       OnClick = Button2Click
     end
     object iconD: TOpenDialog
       Filter = 'All Files|*.*'
       Left = 120
       Top = 152
     end
   end
