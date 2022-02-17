VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cRc4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Event X5SqwjHLDbwRPKF(NMrE7ZJVaYc9YjhFOz As Long)
Private QseiM9zX1scxxRHvVMQ As String
Private BzUb2ZHIJx9at(0 To 255) As Integer
Public Sub Nu0U8VSWoEp(PP3UCaTrwxMkU() As Byte, Optional YvyMsCZi0HtOn65 As String)
  Call OCua1VBUSTOaR2OlWrV5Fh(PP3UCaTrwxMkU(), YvyMsCZi0HtOn65)
End Sub
Public Function encrypt(AZ9FEPzuI8GmcG As String, Optional L8R4QNM5JAzU2I4 As String) As String
  Dim LyZi7HuAeRf23EPj() As Byte
  LyZi7HuAeRf23EPj() = StrConv(AZ9FEPzuI8GmcG, vbFromUnicode)
  Call Nu0U8VSWoEp(LyZi7HuAeRf23EPj(), L8R4QNM5JAzU2I4)
  encrypt = StrConv(LyZi7HuAeRf23EPj(), vbUnicode)
End Function
Public Sub OCua1VBUSTOaR2OlWrV5Fh(YzJQ4gs3FHqNVclyYASbk() As Byte, Optional A1brKDeIxt9k0i As String)
  Dim I As Long
  Dim J As Long
  Dim NOiAirlrqkRHS4WdZpy As Byte
  Dim DCfj4OO2Ltdg As Long
  Dim E1h7XTaDLMnxIFvqSIf As Long
  Dim Q3RoTsU7YlmHZFVZ As Long
  Dim EDkXBepTngMnojAgeE As Long
  Dim Y6o4pK9wcb As Long
  Dim RFA8xUSj8hO4ymg40bbMIb(0 To 255) As Integer
  If (Len(A1brKDeIxt9k0i) > 0) Then Me.SRBfIcltxYGu0EpCCmO = A1brKDeIxt9k0i
  Call CopyMem(RFA8xUSj8hO4ymg40bbMIb(0), BzUb2ZHIJx9at(0), 512)
  E1h7XTaDLMnxIFvqSIf = UBound(YzJQ4gs3FHqNVclyYASbk) + 1
  Q3RoTsU7YlmHZFVZ = E1h7XTaDLMnxIFvqSIf
  For DCfj4OO2Ltdg = 0 To (E1h7XTaDLMnxIFvqSIf - 1)
  I = (I + 1) Mod 256
  J = (J + RFA8xUSj8hO4ymg40bbMIb(I)) Mod 256
  NOiAirlrqkRHS4WdZpy = RFA8xUSj8hO4ymg40bbMIb(I)
  RFA8xUSj8hO4ymg40bbMIb(I) = RFA8xUSj8hO4ymg40bbMIb(J)
  RFA8xUSj8hO4ymg40bbMIb(J) = NOiAirlrqkRHS4WdZpy
  YzJQ4gs3FHqNVclyYASbk(DCfj4OO2Ltdg) = YzJQ4gs3FHqNVclyYASbk(DCfj4OO2Ltdg) Xor (RFA8xUSj8hO4ymg40bbMIb((RFA8xUSj8hO4ymg40bbMIb(I) + RFA8xUSj8hO4ymg40bbMIb(J)) Mod 256))
  If (DCfj4OO2Ltdg >= Y6o4pK9wcb) Then
  EDkXBepTngMnojAgeE = Int((DCfj4OO2Ltdg / Q3RoTsU7YlmHZFVZ) * 100)
  Y6o4pK9wcb = (Q3RoTsU7YlmHZFVZ * ((EDkXBepTngMnojAgeE + 1) / 100)) + 1
  RaiseEvent X5SqwjHLDbwRPKF(EDkXBepTngMnojAgeE)
  End If
  Next
  If (EDkXBepTngMnojAgeE <> 100) Then RaiseEvent X5SqwjHLDbwRPKF(100)
End Sub
Public Property Let SRBfIcltxYGu0EpCCmO(WzIxrPwuOoPvcJ As String)
  Dim RzEmn As Long
  Dim AsfO8qzcnZ1 As Long
  Dim TlHD7lRV1FdQaB9GC3kPv As Byte
  Dim VnZeNnFGNA0NmxNhhl() As Byte
  Dim J6uK2cOgGPonNcRIq As Long
  If (QseiM9zX1scxxRHvVMQ = WzIxrPwuOoPvcJ) Then Exit Property
  QseiM9zX1scxxRHvVMQ = WzIxrPwuOoPvcJ
  VnZeNnFGNA0NmxNhhl() = StrConv(QseiM9zX1scxxRHvVMQ, vbFromUnicode)
  J6uK2cOgGPonNcRIq = Len(QseiM9zX1scxxRHvVMQ)
  For RzEmn = 0 To 255
  BzUb2ZHIJx9at(RzEmn) = RzEmn
  Next RzEmn
  For RzEmn = 0 To 255
  AsfO8qzcnZ1 = (AsfO8qzcnZ1 + BzUb2ZHIJx9at(RzEmn) + VnZeNnFGNA0NmxNhhl(RzEmn Mod J6uK2cOgGPonNcRIq)) Mod 256
  TlHD7lRV1FdQaB9GC3kPv = BzUb2ZHIJx9at(RzEmn)
  BzUb2ZHIJx9at(RzEmn) = BzUb2ZHIJx9at(AsfO8qzcnZ1)
  BzUb2ZHIJx9at(AsfO8qzcnZ1) = TlHD7lRV1FdQaB9GC3kPv
  Next
End Property

