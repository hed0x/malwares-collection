   object Form2: TForm2
     Left = 615
     Top = 104
     BorderStyle = bsNone
     Caption = 'Form2'
     ClientHeight = 153
     ClientWidth = 289
     Color = clBlack
     Font.Charset = DEFAULT_CHARSET
     Font.Color = 11560476
     Font.Height = -11
     Font.Name = 'MS Sans Serif'
     Font.Style = []
     OldCreateOrder = False
     PixelsPerInch = 96
     TextHeight = 13
     object Bevel1: TBevel
       Left = 0
       Top = 0
       Width = 289
       Height = 153
       Style = bsRaised
     end
     object FlatTitlebar1: TFlatTitlebar
       Left = 0
       Top = 0
       Width = 289
       Height = 17
       ActiveTextColor = clBlack
       InactiveTextColor = 11560476
       TitlebarColor = 11560476
       Caption = 'Downloading'
     end
     object GroupBox1: TGroupBox
       Left = 8
       Top = 24
       Width = 273
       Height = 121
       Caption = 'File Info'
       TabOrder = 1
       object FlatGauge3: TFlatGauge
         Left = 96
         Top = 64
         Width = 169
         Height = 17
         AdvColorBorder = 0
         ColorBorder = clBlack
         Progress = 0
       end
       object FlatGauge2: TFlatGauge
         Left = 96
         Top = 88
         Width = 169
         Height = 17
         AdvColorBorder = 0
         ColorBorder = clBlack
         Progress = 0
       end
       object Label1: TLabel
         Left = 8
         Top = 16
         Width = 73
         Height = 17
         AutoSize = False
         Caption = 'Filename :'
       end
       object Bevel2: TBevel
         Left = 96
         Top = 16
         Width = 169
         Height = 17
       end
       object Bevel3: TBevel
         Left = 96
         Top = 40
         Width = 169
         Height = 17
       end
       object Bevel4: TBevel
         Left = 96
         Top = 64
         Width = 169
         Height = 17
       end
       object Bevel5: TBevel
         Left = 96
         Top = 88
         Width = 169
         Height = 17
       end
       object Label2: TLabel
         Left = 8
         Top = 40
         Width = 81
         Height = 17
         AutoSize = False
         Caption = 'Size :'
       end
       object Label3: TLabel
         Left = 8
         Top = 64
         Width = 81
         Height = 17
         AutoSize = False
         Caption = 'Bytes Left :'
       end
       object Label4: TLabel
         Left = 8
         Top = 88
         Width = 81
         Height = 17
         AutoSize = False
         Caption = 'Bytes Received :'
       end
       object Label5: TLabel
         Left = 104
         Top = 40
         Width = 153
         Height = 17
         Alignment = taCenter
         AutoSize = False
         Caption = '0 Bytes'
         Transparent = True
         Layout = tlCenter
       end
       object Label6: TLabel
         Left = 104
         Top = 16
         Width = 153
         Height = 17
         Alignment = taCenter
         AutoSize = False
         Caption = 'Filename.exe'
         Transparent = True
         Layout = tlCenter
       end
     end
   end
