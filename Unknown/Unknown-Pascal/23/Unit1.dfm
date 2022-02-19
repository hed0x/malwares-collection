   object Form1: TForm1
     Left = 190
     Top = 105
     Width = 534
     Height = 256
     Caption = 'PRAT: editor'
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Arial'
     Font.Style = []
     OldCreateOrder = False
     OnMouseMove = FormMouseMove
     DesignSize = (
       526
       229)
     PixelsPerInch = 96
     TextHeight = 14
     object ListView1: TListView
       Left = 0
       Top = 24
       Width = 526
       Height = 188
       Anchors = [akLeft, akTop, akRight, akBottom]
       Columns = <
         item
           Caption = 'Filename'
           Width = 77
         end
         item
           Caption = 'Main Function'
           Width = 100
         end
         item
           Caption = 'Size'
           Width = 77
         end
         item
           Caption = 'Load On Startup'
           Width = 100
         end
         item
           Caption = 'GetName result'
           Width = 150
         end>
       ColumnClick = False
       GridLines = True
       ReadOnly = True
       RowSelect = True
       TabOrder = 0
       ViewStyle = vsReport
       OnMouseDown = ListView1MouseDown
       OnMouseMove = ListView1MouseMove
     end
     object Panel1: TPanel
       Left = 0
       Top = 213
       Width = 526
       Height = 15
       Alignment = taLeftJustify
       Anchors = [akLeft, akRight, akBottom]
       BevelInner = bvRaised
       BevelOuter = bvNone
       BorderStyle = bsSingle
       Ctl3D = False
       ParentCtl3D = False
       TabOrder = 1
       OnMouseMove = Panel1MouseMove
     end
     object Button1: TButton
       Left = 0
       Top = 0
       Width = 57
       Height = 21
       Caption = '&Add Plugin'
       TabOrder = 2
       OnClick = Button1Click
       OnMouseMove = Button1MouseMove
     end
     object Button2: TButton
       Left = 64
       Top = 0
       Width = 57
       Height = 21
       Caption = '&Del Plugin'
       TabOrder = 3
       OnClick = Button2Click
       OnMouseMove = Button2MouseMove
     end
     object Button3: TButton
       Left = 469
       Top = 0
       Width = 57
       Height = 21
       Anchors = [akTop, akRight]
       Caption = '&Build'
       TabOrder = 4
       OnClick = Button3Click
       OnMouseMove = Button3MouseMove
     end
     object Button4: TButton
       Left = 128
       Top = 0
       Width = 57
       Height = 21
       Caption = 'A&bout'
       TabOrder = 5
       OnClick = Button4Click
       OnMouseMove = Button4MouseMove
     end
     object OpenDialog1: TOpenDialog
       Filter = '*.dll|*.dll'
       Options = [ofHideReadOnly, ofAllowMultiSelect, ofFileMustExist, ofEnableSizing]
       Left = 184
       Top = 96
     end
     object PopupMenu1: TPopupMenu
       Left = 216
       Top = 96
       object MainFunction1: TMenuItem
         Caption = '&Main Function'
         OnClick = MainFunction1Click
       end
       object N1: TMenuItem
         Caption = '-'
       end
       object LoadOnStartup1: TMenuItem
         Caption = 'Load On Startup'
         OnClick = LoadOnStartup1Click
       end
       object DontLoadOnStartup1: TMenuItem
         Caption = 'Dont Load On Startup'
         OnClick = DontLoadOnStartup1Click
       end
     end
   end
