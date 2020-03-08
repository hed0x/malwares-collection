   object Form2: TForm2
     Left = 537
     Top = 106
     Width = 345
     Height = 263
     BorderIcons = [biSystemMenu]
     Caption = 'Status Window'
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'MS Sans Serif'
     Font.Style = []
     OldCreateOrder = False
     OnConstrainedResize = FormConstrainedResize
     DesignSize = (
       337
       236)
     PixelsPerInch = 96
     TextHeight = 13
     object Label1: TLabel
       Left = 8
       Top = 0
       Width = 97
       Height = 17
       AutoSize = False
       Caption = 'iRC Bot Status : '
     end
     object Label2: TLabel
       Left = 112
       Top = 0
       Width = 217
       Height = 17
       AutoSize = False
       Caption = 'Disconnected.'
     end
     object Memo1: TMemo
       Left = 0
       Top = 16
       Width = 337
       Height = 202
       Anchors = [akLeft, akTop, akRight, akBottom]
       ReadOnly = True
       ScrollBars = ssVertical
       TabOrder = 0
     end
     object CheckBox1: TCheckBox
       Left = 0
       Top = 218
       Width = 337
       Height = 17
       Anchors = [akLeft, akRight, akBottom]
       Caption = 'Lock at Other window'
       Checked = True
       State = cbChecked
       TabOrder = 1
     end
     object Timer1: TTimer
       Interval = 1
       OnTimer = Timer1Timer
       Left = 64
       Top = 64
     end
     object Timer2: TTimer
       Interval = 1
       OnTimer = Timer2Timer
       Left = 96
       Top = 64
     end
   end
