   object Form2: TForm2
     Left = 379
     Top = 110
     BorderStyle = bsNone
     ClientHeight = 129
     ClientWidth = 289
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
       Width = 289
       Height = 113
       Brush.Style = bsClear
     end
     object Label1: TLabel
       Left = 8
       Top = 24
       Width = 113
       Height = 97
       Alignment = taCenter
       AutoSize = False
       Caption =
         'This EditServ only support [iGLOO] Servers. By editing the serve' +
         'r, you accept to take fully responsibility for server damage.'
       WordWrap = True
     end
     object Label2: TLabel
       Left = 128
       Top = 24
       Width = 145
       Height = 17
       AutoSize = False
       Caption = 'Server Path :'
     end
     object Label3: TLabel
       Left = 128
       Top = 72
       Width = 41
       Height = 17
       AutoSize = False
       Caption = 'Size : '
     end
     object Label4: TLabel
       Left = 176
       Top = 72
       Width = 105
       Height = 17
       AutoSize = False
       Caption = '0 Bytes'
       Font.Charset = DEFAULT_CHARSET
       Font.Color = clNavy
       Font.Height = -11
       Font.Name = 'Verdana'
       Font.Style = []
       ParentFont = False
     end
     object FlatTitlebar1: TFlatTitlebar
       Left = 0
       Top = 0
       Width = 289
       Height = 17
       ActiveTextColor = clWhite
       InactiveTextColor = 8559266
       TitlebarColor = clBlack
       Caption = 'Open Server'
     end
     object Edit1: TEdit
       Left = 128
       Top = 48
       Width = 113
       Height = 21
       TabOrder = 1
     end
     object Button1: TButton
       Left = 248
       Top = 48
       Width = 33
       Height = 17
       Caption = '...'
       TabOrder = 2
       OnClick = Button1Click
     end
     object Button2: TButton
       Left = 216
       Top = 96
       Width = 65
       Height = 25
       Caption = 'Read'
       TabOrder = 3
       OnClick = Button2Click
     end
     object Button3: TButton
       Left = 136
       Top = 96
       Width = 65
       Height = 25
       Caption = 'Exit'
       TabOrder = 4
       OnClick = Button3Click
     end
     object Openserver: TOpenDialog
       Filter = 'Server Files|*.exe'
       Left = 256
       Top = 16
     end
   end
