   object Form2: TForm2
     Left = 572
     Top = 105
     BorderIcons = [biSystemMenu, biMinimize]
     BorderStyle = bsSingle
     Caption = 'About PRAT'
     ClientHeight = 218
     ClientWidth = 289
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'Arial'
     Font.Style = []
     OldCreateOrder = False
     PixelsPerInch = 96
     TextHeight = 14
     object Label1: TLabel
       Left = 8
       Top = 8
       Width = 273
       Height = 57
       AutoSize = False
       Caption =
         'PRAT is a tool allowing you to create plugins, and put em togeth' +
         'er into a single exe file. Every action caused by using this pro' +
         'gram is taken on your responsibility. Not ours'
       WordWrap = True
     end
     object PageControl1: TPageControl
       Left = 8
       Top = 72
       Width = 273
       Height = 137
       ActivePage = TabSheet1
       Style = tsButtons
       TabHeight = 18
       TabIndex = 0
       TabOrder = 0
       object TabSheet1: TTabSheet
         Caption = 'Greetz to'
         object Label2: TLabel
           Left = 0
           Top = 0
           Width = 265
           Height = 41
           Alignment = taCenter
           AutoSize = False
           Caption =
             'Greetz to ; fsb, elf, dagreat1, psyphen, madman, p0kes weed, d-o' +
             'ne, and all of you other motherfuckers.'
           WordWrap = True
         end
         object Label3: TLabel
           Left = 8
           Top = 64
           Width = 249
           Height = 41
           Alignment = taCenter
           AutoSize = False
           Caption = 'This tool is brought to you by p0ke && Tzorcelan'
         end
       end
       object TabSheet2: TTabSheet
         Caption = 'Beta testers'
         ImageIndex = 1
         object Label4: TLabel
           Left = 0
           Top = 0
           Width = 265
           Height = 73
           Alignment = taCenter
           AutoSize = False
           Caption =
             'Beta Testers was : elf, lucifer0000. Thanks, i will spank you la' +
             'ter as we dealed.'
           WordWrap = True
         end
       end
       object TabSheet3: TTabSheet
         Caption = 'Other'
         ImageIndex = 2
         object Label5: TLabel
           Left = 0
           Top = 0
           Width = 265
           Height = 105
           AutoSize = False
           Caption =
             'PRAT will have opensourcecode plugins to allow users to easier c' +
             'reate and customize their own plugins. There will be a homepage ' +
             'later on, and you all will be notified.'
           WordWrap = True
         end
       end
     end
   end
