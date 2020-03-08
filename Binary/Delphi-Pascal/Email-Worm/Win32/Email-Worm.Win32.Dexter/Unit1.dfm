   object Form1: TForm1
     Left = 290
     Top = 202
     Width = 112
     Height = 120
     Caption = 'Form1'
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'MS Sans Serif'
     Font.Style = []
     OldCreateOrder = False
     PixelsPerInch = 96
     TextHeight = 13
     object Label1: TLabel
       Left = 8
       Top = 40
       Width = 32
       Height = 13
       Caption = 'Label1'
     end
     object Label2: TLabel
       Left = 8
       Top = 56
       Width = 32
       Height = 13
       Caption = 'Label2'
     end
     object NMSMTP1: TNMSMTP
       Port = 25
       ReportLevel = 0
       EncodeType = uuMime
       ClearParams = True
       SubType = mtPlain
       Charset = 'us-ascii'
       Left = 8
       Top = 8
     end
     object Timer1: TTimer
       Left = 40
       Top = 8
     end
   end
