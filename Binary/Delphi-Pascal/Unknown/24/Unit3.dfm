   object Form3: TForm3
     Left = 553
     Top = 209
     BorderIcons = [biSystemMenu, biMinimize]
     BorderStyle = bsSingle
     Caption = 'PRAT 1.5 - Add DLL'
     ClientHeight = 172
     ClientWidth = 233
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Arial'
     Font.Style = []
     OldCreateOrder = False
     Position = poScreenCenter
     PixelsPerInch = 96
     TextHeight = 14
     object Label1: TLabel
       Left = 8
       Top = 8
       Width = 105
       Height = 17
       AutoSize = False
       Caption = 'Filepath :'
     end
     object Label2: TLabel
       Left = 24
       Top = 104
       Width = 81
       Height = 21
       AutoSize = False
       Caption = 'DLL Call-name :'
       Layout = tlCenter
     end
     object Edit1: TEdit
       Left = 8
       Top = 24
       Width = 153
       Height = 22
       TabOrder = 0
       Text = '...'
     end
     object Button1: TButton
       Left = 168
       Top = 24
       Width = 57
       Height = 21
       Caption = '&Browse'
       TabOrder = 1
       OnClick = Button1Click
     end
     object Panel1: TPanel
       Left = 8
       Top = 72
       Width = 217
       Height = 3
       BevelInner = bvRaised
       BevelOuter = bvLowered
       TabOrder = 2
     end
     object CheckBox1: TCheckBox
       Left = 8
       Top = 80
       Width = 193
       Height = 17
       Caption = 'Load DLL once core is executed.'
       TabOrder = 3
       OnClick = CheckBox1Click
     end
     object Button2: TButton
       Left = 208
       Top = 80
       Width = 17
       Height = 17
       Caption = '?'
       TabOrder = 4
       OnClick = Button2Click
     end
     object Edit2: TEdit
       Left = 112
       Top = 104
       Width = 113
       Height = 22
       Enabled = False
       TabOrder = 5
       Text = 'Init'
     end
     object Panel2: TPanel
       Left = 8
       Top = 136
       Width = 217
       Height = 3
       BevelInner = bvRaised
       BevelOuter = bvLowered
       TabOrder = 6
     end
     object Button3: TButton
       Left = 168
       Top = 144
       Width = 57
       Height = 21
       Caption = '&Add'
       TabOrder = 7
       OnClick = Button3Click
     end
     object CheckBox2: TCheckBox
       Left = 8
       Top = 48
       Width = 217
       Height = 17
       Caption = 'Execute file once core is executed'
       Enabled = False
       TabOrder = 8
     end
     object OpenDialog1: TOpenDialog
       Filter = 'Any File|*.*'
       Left = 136
       Top = 144
     end
   end
