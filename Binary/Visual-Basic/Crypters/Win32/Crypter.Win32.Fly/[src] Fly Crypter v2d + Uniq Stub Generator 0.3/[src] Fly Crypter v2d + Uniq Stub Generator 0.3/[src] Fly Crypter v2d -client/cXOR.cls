VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cXOR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private m_Key() As Byte
Private m_KeyLen As Long
Private m_KeyValue As String
Event Progress(Percent As Long)
Public Sub DecryptByte(ByteArray() As Byte, Optional Key As String)
  Call EncryptByte(ByteArray(), Key)
End Sub
Public Sub EncryptByte(ByteArray() As Byte, Optional Key As String)
  Dim Offset As Long
  Dim ByteLen As Long
  Dim ResultLen As Long
  Dim CurrPercent As Long
  Dim NextPercent As Long
  If (Len(Key) > 0) Then Me.Key = Key
  ByteLen = UBound(ByteArray) + 1
  ResultLen = ByteLen
  For Offset = 0 To (ByteLen - 1)
  ByteArray(Offset) = ByteArray(Offset) Xor m_Key(Offset Mod m_KeyLen)
  If (Offset >= NextPercent) Then
  CurrPercent = Int((Offset / ResultLen) * 100)
  NextPercent = (ResultLen * ((CurrPercent + 1) / 100)) + 1
  RaiseEvent Progress(CurrPercent)
  End If
  Next
  If (CurrPercent <> 100) Then RaiseEvent Progress(100)
End Sub
Public Function EncryptString(Text As String, Optional Key As String) As String
  Dim a As Long
  Dim ByteLen As Long
  Dim ByteArray() As Byte
  ByteArray() = StrConv(Text, vbFromUnicode)
  Call EncryptByte(ByteArray(), Key)
  EncryptString = StrConv(ByteArray(), vbUnicode)
End Function
Public Function DecryptString(Text As String, Optional Key As String) As String
  Dim a As Long
  Dim ByteLen As Long
  Dim ByteArray() As Byte
  ByteArray() = StrConv(Text, vbFromUnicode)
  Call DecryptByte(ByteArray(), Key)
  DecryptString = StrConv(ByteArray(), vbUnicode)
End Function
Public Property Let Key(New_Value As String)
  If (m_KeyValue = New_Value) Then Exit Property
  m_KeyValue = New_Value
  m_KeyLen = Len(New_Value)
  m_Key() = StrConv(m_KeyValue, vbFromUnicode)
End Property
