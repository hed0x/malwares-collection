   object Form1: TForm1
     Left = 192
     Top = 107
     BorderIcons = [biSystemMenu, biMinimize]
     BorderStyle = bsSingle
     Caption = 'Rasta Converter'
     ClientHeight = 50
     ClientWidth = 180
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
       Top = 32
       Width = 161
       Height = 17
       Alignment = taCenter
       AutoSize = False
       Caption = 'copyright p0ke (c) 2005 '
       Enabled = False
     end
     object CheckBox1: TCheckBox
       Left = 8
       Top = 8
       Width = 169
       Height = 17
       Caption = 'Switch rastaconverter on'
       Checked = True
       State = cbChecked
       TabOrder = 0
       OnClick = CheckBox1Click
     end
     object Timer1: TTimer
       Interval = 1
       OnTimer = Timer1Timer
       Left = 96
     end
   end
