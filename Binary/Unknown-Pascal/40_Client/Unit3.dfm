   object ScreenV: TScreenV
     Left = 316
     Top = 231
     BorderStyle = bsNone
     Caption = 'Screen View'
     ClientHeight = 663
     ClientWidth = 891
     Color = clBlack
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'MS Sans Serif'
     Font.Style = []
     OldCreateOrder = False
     OnResize = FormResize
     DesignSize = (
       891
       663)
     PixelsPerInch = 96
     TextHeight = 13
     object Shape1: TShape
       Left = 0
       Top = 16
       Width = 891
       Height = 647
       Anchors = [akLeft, akTop, akRight, akBottom]
       Brush.Style = bsClear
     end
     object Image1: TImage
       Left = 8
       Top = 24
       Width = 761
       Height = 631
       Anchors = [akLeft, akTop, akRight, akBottom]
       Stretch = True
     end
     object FlatTitlebar1: TFlatTitlebar
       Left = 0
       Top = 0
       Width = 891
       Height = 17
       ActiveTextColor = clBlack
       InactiveTextColor = 11560476
       TitlebarColor = 11560476
       Align = alTop
       Caption = 'Screen View'
       DesignSize = (
         891
         17)
       object Label1: TLabel
         Left = 872
         Top = 0
         Width = 17
         Height = 17
         Cursor = crHandPoint
         Alignment = taCenter
         Anchors = [akTop, akRight]
         AutoSize = False
         Caption = 'X'
         Color = 11560476
         Font.Charset = DEFAULT_CHARSET
         Font.Color = clBlack
         Font.Height = -11
         Font.Name = 'MS Sans Serif'
         Font.Style = []
         ParentColor = False
         ParentFont = False
         Layout = tlCenter
         OnClick = Label1Click
       end
     end
     object Button1: TButton
       Left = 776
       Top = 24
       Width = 105
       Height = 25
       Caption = 'Connect'
       TabOrder = 1
       OnClick = Button1Click
     end
     object _kk: TClientSocket
       Active = False
       ClientType = ctNonBlocking
       Port = 0
       Left = 72
       Top = 96
     end
   end
