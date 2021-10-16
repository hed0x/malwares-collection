Attribute VB_Name = "m"
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Public Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (r As Any, r1 As Any, ByVal r2 As Long)
Dim var1       As String
Public Function lRan(chs As String)
  Dim num_characters As Integer
  Dim i As Integer
  Dim txt As String
  Dim ch As Integer
  Randomize
  num_characters = CInt(chs)
  For i = 1 To num_characters
  ch = Int((26 + 26 + 10) * Rnd)
  If ch < 26 Then
  txt = txt & Chr$(ch + Asc("A"))
  ElseIf ch < 2 * 26 Then
  ch = ch - 26
  txt = txt & Chr$(ch + Asc("a"))
  Else
  ch = ch - 26 - 26
  txt = txt & Chr$(ch + Asc("0"))
  End If
  Next i
  lRan = txt
End Function
Public Function tmp() As String
  tmp = Environ("temp")
End Function
Public Function lk() As String
  lk = ""
  If Form1.Option6.Value = True Then
  lk = RandomLetter & lRan(RandomNumber) & lRan(RandomNumber)
  End If
  If Form1.Option7.Value = True Then
  lk = RandomLetter & lRan(RandomNumber) & lRan(RandomNumber) & lRan(RandomNumber)
  End If
  If Form1.Option8.Value = True Then
  lk = RandomLetter & lRan(RandomNumber) & lRan(RandomNumber) & lRan(RandomNumber) & lRan(RandomNumber)
  End If
End Function
Public Function RandomLetter() As String
  RandomLetter = ""
  Dim Keyset As String
  Keyset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
Anfang:
  Randomize
  var1 = Int(26 * Rnd)
  If var1 = 0 Then GoTo Anfang
  RandomLetter = Mid(Keyset, var1, 1)
End Function
Public Function RandomNumber() As String
  RandomNumber = ""
als:
  Randomize
  var1 = Int(9 * Rnd)
  RandomNumber = var1
If RandomNumber = "0" Then GoTo als
End Function
Public Function rn2() As String
  rn2 = ""
  GoTo als
als:
  Randomize
  var1 = Int(3 * Rnd)
  rn2 = var1
  If rn2 = "0" Then GoTo als
End Function
Public Function rn() As String
  rn = ""
als:
  Randomize
  var1 = Int(40 * Rnd)
  rn = var1
  If rn = "0" Then GoTo als
End Function
Public Function rnx() As String
  rnx = ""
  Randomize
  var1 = Int(17 * Rnd)
  rnx = var1
End Function
Public Function lt() As String
  lt = ""
  lt = RandomLetter & lRan(RandomNumber) & lRan(RandomNumber) & lRan(RandomNumber) & lRan(RandomNumber)
End Function
