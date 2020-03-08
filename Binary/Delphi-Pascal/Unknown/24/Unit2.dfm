   object Form2: TForm2
     Left = 193
     Top = 141
     Width = 361
     Height = 236
     Caption = 'PRAT 1.5 Editor'
     Color = clBtnFace
     Constraints.MinHeight = 236
     Constraints.MinWidth = 321
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Arial'
     Font.Style = []
     OldCreateOrder = False
     Position = poScreenCenter
     OnClose = FormClose
     OnCloseQuery = FormCloseQuery
     DesignSize = (
       353
       209)
     PixelsPerInch = 96
     TextHeight = 14
     object Panel1: TPanel
       Left = 8
       Top = 40
       Width = 337
       Height = 3
       Anchors = [akLeft, akTop, akRight]
       BevelInner = bvRaised
       BevelOuter = bvLowered
       TabOrder = 0
     end
     object Edit1: TEdit
       Left = 8
       Top = 8
       Width = 73
       Height = 22
       Anchors = [akLeft, akTop, akRight]
       TabOrder = 1
       Text = 'Output.exe'
     end
     object Panel2: TPanel
       Left = 88
       Top = 8
       Width = 3
       Height = 25
       Anchors = [akTop, akRight]
       BevelInner = bvRaised
       BevelOuter = bvLowered
       TabOrder = 2
     end
     object Button1: TButton
       Left = 96
       Top = 8
       Width = 57
       Height = 21
       Anchors = [akTop, akRight]
       Caption = '&Add File'
       TabOrder = 3
       OnClick = Button1Click
     end
     object Button2: TButton
       Left = 160
       Top = 8
       Width = 57
       Height = 21
       Anchors = [akTop, akRight]
       Caption = '&Del File'
       TabOrder = 4
       OnClick = Button2Click
     end
     object Button3: TButton
       Left = 224
       Top = 8
       Width = 57
       Height = 21
       Anchors = [akTop, akRight]
       Caption = 'About'
       Font.Charset = DEFAULT_CHARSET
       Font.Color = clWindowText
       Font.Height = -11
       Font.Name = 'Arial'
       Font.Style = [fsBold]
       ParentFont = False
       TabOrder = 5
       OnClick = Button3Click
     end
     object ListView1: TListView
       Left = 8
       Top = 48
       Width = 337
       Height = 153
       Anchors = [akLeft, akTop, akRight, akBottom]
       Columns = <
         item
           Caption = 'Filename'
           Width = 70
         end
         item
           Caption = 'Size'
           Width = 70
         end
         item
           Caption = 'Startup'
           Width = 70
         end
         item
           Caption = 'DLL Call'
           Width = 70
         end>
       ColumnClick = False
       GridLines = True
       ReadOnly = True
       RowSelect = True
       TabOrder = 6
       ViewStyle = vsReport
     end
     object Button4: TButton
       Left = 288
       Top = 8
       Width = 57
       Height = 21
       Anchors = [akTop, akRight]
       Caption = '&Build'
       Font.Charset = DEFAULT_CHARSET
       Font.Color = clWindowText
       Font.Height = -11
       Font.Name = 'Arial'
       Font.Style = []
       ParentFont = False
       TabOrder = 7
       OnClick = Button4Click
     end
   end
