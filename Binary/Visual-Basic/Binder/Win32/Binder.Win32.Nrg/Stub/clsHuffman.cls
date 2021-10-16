VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsHuffman"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Module    : clsHuffman
' Author    : Fredrik Qvarfort
' Date      : 4/5/2010
' Purpose   : Huffman Compression Algorithm
'---------------------------------------------------------------------------------------

Option Explicit

Private Const PROGRESS_CALCFREQUENCY = 7
Private Const PROGRESS_CALCCRC = 5
Private Const PROGRESS_ENCODING = 88

Private Const PROGRESS_DECODING = 89
Private Const PROGRESS_CHECKCRC = 11

Event Progress(Percent As Integer)

Private Type HUFFMANTREE
    ParentNode As Integer
    RightNode As Integer
    LeftNode As Integer
    Value As Integer
    Weight As Long
End Type

Private Type ByteArray
    Count As Byte
    Data() As Byte
End Type

Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Public Function DecodeString(sData As String) As String

    Dim ByteArray() As Byte

    ByteArray() = StrConv(sData, vbFromUnicode)

    Call DecodeByte(ByteArray, Len(sData))
    DecodeString = StrConv(ByteArray(), vbUnicode)
End Function

Private Sub CreateTree(Nodes() As HUFFMANTREE, NodesCount As Long, Char As Long, Bytes As ByteArray)

    Dim a As Integer
    Dim NodeIndex As Long

    NodeIndex = 0

    For a = 0 To (Bytes.Count - 1)
        If (Bytes.Data(a) = 0) Then
            If (Nodes(NodeIndex).LeftNode = -1) Then
                Nodes(NodeIndex).LeftNode = NodesCount
                Nodes(NodesCount).ParentNode = NodeIndex
                Nodes(NodesCount).LeftNode = -1
                Nodes(NodesCount).RightNode = -1
                Nodes(NodesCount).Value = -1
                NodesCount = NodesCount + 1
            End If
            NodeIndex = Nodes(NodeIndex).LeftNode
        ElseIf (Bytes.Data(a) = 1) Then
            If (Nodes(NodeIndex).RightNode = -1) Then
                Nodes(NodeIndex).RightNode = NodesCount
                Nodes(NodesCount).ParentNode = NodeIndex
                Nodes(NodesCount).LeftNode = -1
                Nodes(NodesCount).RightNode = -1
                Nodes(NodesCount).Value = -1
                NodesCount = NodesCount + 1
            End If
            NodeIndex = Nodes(NodeIndex).RightNode
        Else
            Stop
        End If
    Next

    Nodes(NodeIndex).Value = Char

End Sub

Public Sub DecodeByte(ByteArray() As Byte, ByteLen As Long)

    Dim i As Long
    Dim j As Long
    Dim Pos As Long
    Dim Char As Byte
    Dim CurrPos As Long
    Dim Count As Integer
    Dim CheckSum As Byte
    Dim Result() As Byte
    Dim BitPos As Integer
    Dim NodeIndex As Long
    Dim ByteValue As Byte
    Dim ResultLen As Long
    Dim NodesCount As Long
    Dim lResultLen As Long
    Dim NewProgress As Integer
    Dim CurrProgress As Integer
    Dim BitValue(0 To 7) As Byte
    Dim Nodes(0 To 511) As HUFFMANTREE
    Dim CharValue(0 To 255) As ByteArray

    If (ByteArray(0) <> 72) Or (ByteArray(1) <> 69) Or (ByteArray(3) <> 13) Then

    ElseIf (ByteArray(2) = 48) Then
        Call CopyMem(ByteArray(0), ByteArray(4), ByteLen - 4)
        ReDim Preserve ByteArray(0 To ByteLen - 5)
        Exit Sub

    ElseIf (ByteArray(2) <> 51) Then
        Err.Raise vbObjectError, "clsHuffman.Decode()", "Data was not compressed with HE3 or is corrupted."
        Exit Sub
    End If

    CurrPos = 5
    CheckSum = ByteArray(CurrPos - 1)
    CurrPos = CurrPos + 1

    Call CopyMem(ResultLen, ByteArray(CurrPos - 1), 4)
    CurrPos = CurrPos + 4
    lResultLen = ResultLen

    If (ResultLen = 0) Then Exit Sub

    ReDim Result(0 To ResultLen - 1)
    Call CopyMem(Count, ByteArray(CurrPos - 1), 2)
    CurrPos = CurrPos + 2

    For i = 1 To Count
        With CharValue(ByteArray(CurrPos - 1))
            CurrPos = CurrPos + 1
            .Count = ByteArray(CurrPos - 1)
            CurrPos = CurrPos + 1
            ReDim .Data(0 To .Count - 1)
        End With
    Next

    For i = 0 To 7
        BitValue(i) = 2 ^ i
    Next

    ByteValue = ByteArray(CurrPos - 1)
    CurrPos = CurrPos + 1
    BitPos = 0

    For i = 0 To 255
        With CharValue(i)
            If (.Count > 0) Then
                For j = 0 To (.Count - 1)
                    If (ByteValue And BitValue(BitPos)) Then .Data(j) = 1
                    BitPos = BitPos + 1
                    If (BitPos = 8) Then
                        ByteValue = ByteArray(CurrPos - 1)
                        CurrPos = CurrPos + 1
                        BitPos = 0
                    End If
                Next
            End If
        End With
    Next

    If (BitPos = 0) Then CurrPos = CurrPos - 1

    NodesCount = 1
    Nodes(0).LeftNode = -1
    Nodes(0).RightNode = -1
    Nodes(0).ParentNode = -1
    Nodes(0).Value = -1

    For i = 0 To 255
        Call CreateTree(Nodes(), NodesCount, i, CharValue(i))
    Next

    ResultLen = 0

    For CurrPos = CurrPos To ByteLen
        ByteValue = ByteArray(CurrPos - 1)
        For BitPos = 0 To 7
            If (ByteValue And BitValue(BitPos)) Then
                NodeIndex = Nodes(NodeIndex).RightNode
            Else
                NodeIndex = Nodes(NodeIndex).LeftNode
            End If
            If (Nodes(NodeIndex).Value > -1) Then
                Result(ResultLen) = Nodes(NodeIndex).Value
                ResultLen = ResultLen + 1
                If (ResultLen = lResultLen) Then GoTo DecodeFinished
                NodeIndex = 0
            End If
        Next
        If (CurrPos Mod 10000 = 0) Then
            NewProgress = CurrPos / ByteLen * PROGRESS_DECODING
            If (NewProgress <> CurrProgress) Then
                CurrProgress = NewProgress
                RaiseEvent Progress(CurrProgress)
            End If
        End If
    Next

DecodeFinished:

    Char = 0

    For i = 0 To (ResultLen - 1)
        Char = Char Xor Result(i)
        If (i Mod 10000 = 0) Then
            NewProgress = i / ResultLen * PROGRESS_CHECKCRC + PROGRESS_DECODING
            If (NewProgress <> CurrProgress) Then
                CurrProgress = NewProgress
                RaiseEvent Progress(CurrProgress)
            End If
        End If
    Next

    If (Char <> CheckSum) Then
        Err.Raise vbObjectError, "clsHuffman.Decode()", "Data did not match checksum."
    End If

    ReDim ByteArray(0 To ResultLen - 1)
    Call CopyMem(ByteArray(0), Result(0), ResultLen)

    If (CurrProgress <> 100) Then
        RaiseEvent Progress(100)
    End If

End Sub

Private Sub CreateBitSequences(Nodes() As HUFFMANTREE, ByVal NodeIndex As Integer, Bytes As ByteArray, CharValue() As ByteArray)

    Dim NewBytes As ByteArray

    If (Nodes(NodeIndex).Value > -1) Then
        CharValue(Nodes(NodeIndex).Value) = Bytes
        Exit Sub
    End If

    If (Nodes(NodeIndex).LeftNode > -1) Then
        NewBytes = Bytes
        NewBytes.Data(NewBytes.Count) = 0
        NewBytes.Count = NewBytes.Count + 1
        Call CreateBitSequences(Nodes(), Nodes(NodeIndex).LeftNode, NewBytes, CharValue)
    End If

    If (Nodes(NodeIndex).RightNode > -1) Then
        NewBytes = Bytes
        NewBytes.Data(NewBytes.Count) = 1
        NewBytes.Count = NewBytes.Count + 1
        Call CreateBitSequences(Nodes(), Nodes(NodeIndex).RightNode, NewBytes, CharValue)
    End If

End Sub


