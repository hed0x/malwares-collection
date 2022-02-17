object Form1: TForm1
  Left = 192
  Top = 107
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Packet Forger by Aphex'
  ClientHeight = 169
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 185
    Height = 169
    TabOrder = 0
    Tabs.Strings = (
      'ICMP'
      'TCP'
      'UDP')
    TabIndex = 0
    OnChange = TabControl1Change
    object Panel1: TPanel
      Left = 2
      Top = 24
      Width = 181
      Height = 138
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      object iLabel1: TLabel
        Left = 4
        Top = 4
        Width = 56
        Height = 13
        Caption = 'Destination:'
      end
      object iLabel2: TLabel
        Left = 4
        Top = 44
        Width = 37
        Height = 13
        Caption = 'Source:'
      end
      object iLabel3: TLabel
        Left = 4
        Top = 84
        Width = 26
        Height = 13
        Caption = 'Data:'
      end
      object iEdit1: TEdit
        Left = 4
        Top = 20
        Width = 173
        Height = 21
        TabOrder = 0
      end
      object iEdit2: TEdit
        Left = 4
        Top = 60
        Width = 173
        Height = 21
        TabOrder = 1
      end
      object iCheckBox1: TCheckBox
        Left = 4
        Top = 123
        Width = 85
        Height = 16
        Caption = 'ICMP (echo)'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = iCheckBox1Click
      end
      object iEdit3: TEdit
        Left = 4
        Top = 100
        Width = 173
        Height = 21
        AutoSize = False
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 2
      Top = 24
      Width = 181
      Height = 138
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object uLabel1: TLabel
        Left = 4
        Top = 4
        Width = 56
        Height = 13
        Caption = 'Destination:'
      end
      object uLabel2: TLabel
        Left = 4
        Top = 44
        Width = 37
        Height = 13
        Caption = 'Source:'
      end
      object uLabel3: TLabel
        Left = 4
        Top = 84
        Width = 26
        Height = 13
        Caption = 'Data:'
      end
      object uEdit1: TEdit
        Left = 4
        Top = 20
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object uEdit2: TEdit
        Left = 128
        Top = 20
        Width = 49
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object uEdit3: TEdit
        Left = 4
        Top = 60
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object uEdit4: TEdit
        Left = 128
        Top = 60
        Width = 49
        Height = 21
        AutoSize = False
        Enabled = False
        TabOrder = 3
      end
      object uCheckBox1: TCheckBox
        Left = 4
        Top = 123
        Width = 45
        Height = 16
        Caption = 'UDP'
        TabOrder = 4
        OnClick = uCheckBox1Click
      end
      object uEdit5: TEdit
        Left = 4
        Top = 100
        Width = 173
        Height = 21
        AutoSize = False
        Enabled = False
        TabOrder = 5
      end
    end
    object Panel2: TPanel
      Left = 2
      Top = 24
      Width = 181
      Height = 100
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object tLabel1: TLabel
        Left = 4
        Top = 4
        Width = 56
        Height = 13
        Caption = 'Destination:'
      end
      object tLabel2: TLabel
        Left = 4
        Top = 44
        Width = 37
        Height = 13
        Caption = 'Source:'
      end
      object tEdit1: TEdit
        Left = 4
        Top = 20
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object tEdit2: TEdit
        Left = 128
        Top = 20
        Width = 49
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object tEdit3: TEdit
        Left = 4
        Top = 60
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object tEdit4: TEdit
        Left = 128
        Top = 60
        Width = 49
        Height = 21
        AutoSize = False
        Enabled = False
        TabOrder = 3
      end
      object tCheckBox1: TCheckBox
        Left = 4
        Top = 83
        Width = 69
        Height = 16
        Caption = 'TCP (syn)'
        TabOrder = 4
        OnClick = tCheckBox1Click
      end
    end
  end
  object MainMenu1: TMainMenu
    Top = 176
    object File1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Caption = 'New'
        OnClick = New1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Packets1: TMenuItem
      Caption = 'Packets'
      object Send1: TMenuItem
        Caption = 'Send'
        OnClick = Send1Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
end
