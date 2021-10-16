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

Public Function EncodeString(sData As String) As String

    Dim ByteArray() As Byte

    ByteArray() = StrConv(sData, vbFromUnicode)

    Call EncodeByte(ByteArray, Len(sData))
    EncodeString = StrConv(ByteArray(), vbUnicode)
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

Public Sub EncodeByte(ByteArray() As Byte, ByteLen As Long)

    Dim i As Long
    Dim j As Long
    Dim Char As Byte
    Dim BitPos As Byte
    Dim lNode1 As Long
    Dim lNode2 As Long
    Dim lNodes As Long
    Dim lLength As Long
    Dim Count As Integer
    Dim lWeight1 As Long
    Dim lWeight2 As Long
    Dim Result() As Byte
    Dim ByteValue As Byte
    Dim ResultLen As Long
    Dim Bytes As ByteArray
    Dim NodesCount As Integer
    Dim NewProgress As Integer
    Dim CurrProgress As Integer
    Dim BitValue(0 To 7) As Byte
    Dim CharCount(0 To 255) As Long
    Dim Nodes(0 To 511) As HUFFMANTREE
    Dim CharValue(0 To 255) As ByteArray

    If (ByteLen = 0) Then
        ReDim Preserve ByteArray(0 To ByteLen + 3)
        If (ByteLen > 0) Then
            Call CopyMem(ByteArray(4), ByteArray(0), ByteLen)
        End If
        ByteArray(0) = 72
        ByteArray(1) = 69
        ByteArray(2) = 48
        ByteArray(3) = 13
        Exit Sub
    End If

    ReDim Result(0 To 522)

    Result(0) = 72
    Result(1) = 69
    Result(2) = 51
    Result(3) = 13
    ResultLen = 4

    For i = 0 To (ByteLen - 1)
        CharCount(ByteArray(i)) = CharCount(ByteArray(i)) + 1
        If (i Mod 1000 = 0) Then
            NewProgress = i / ByteLen * PROGRESS_CALCFREQUENCY
            If (NewProgress <> CurrProgress) Then
                CurrProgress = NewProgress
                RaiseEvent Progress(CurrProgress)
            End If
        End If
    Next

    For i = 0 To 255
        If (CharCount(i) > 0) Then
            With Nodes(NodesCount)
                .Weight = CharCount(i)
                .Value = i
                .LeftNode = -1
                .RightNode = -1
                .ParentNode = -1
            End With
            NodesCount = NodesCount + 1
        End If
    Next

    For lNodes = NodesCount To 2 Step -1
        lNode1 = -1: lNode2 = -1
        For i = 0 To (NodesCount - 1)
            If (Nodes(i).ParentNode = -1) Then
                If (lNode1 = -1) Then
                    lWeight1 = Nodes(i).Weight
                    lNode1 = i
                ElseIf (lNode2 = -1) Then
                    lWeight2 = Nodes(i).Weight
                    lNode2 = i
                ElseIf (Nodes(i).Weight < lWeight1) Then
                    If (Nodes(i).Weight < lWeight2) Then
                        If (lWeight1 < lWeight2) Then
                            lWeight2 = Nodes(i).Weight
                            lNode2 = i
                        Else
                            lWeight1 = Nodes(i).Weight
                            lNode1 = i
                        End If
                    Else
                        lWeight1 = Nodes(i).Weight
                        lNode1 = i
                    End If
                ElseIf (Nodes(i).Weight < lWeight2) Then
                    lWeight2 = Nodes(i).Weight
                    lNode2 = i
                End If
            End If
        Next

        With Nodes(NodesCount)
            .Weight = lWeight1 + lWeight2
            .LeftNode = lNode1
            .RightNode = lNode2
            .ParentNode = -1
            .Value = -1
        End With

        Nodes(lNode1).ParentNode = NodesCount
        Nodes(lNode2).ParentNode = NodesCount
        NodesCount = NodesCount + 1
    Next

    ReDim Bytes.Data(0 To 255)
    Call CreateBitSequences(Nodes(), NodesCount - 1, Bytes, CharValue)

    For i = 0 To 255
        If (CharCount(i) > 0) Then
            lLength = lLength + CharValue(i).Count * CharCount(i)
        End If
    Next

    lLength = IIf(lLength Mod 8 = 0, lLength \ 8, lLength \ 8 + 1)

    If ((lLength = 0) Or (lLength > ByteLen)) Then
        ReDim Preserve ByteArray(0 To ByteLen + 3)
        Call CopyMem(ByteArray(4), ByteArray(0), ByteLen)
        ByteArray(0) = 72
        ByteArray(1) = 69
        ByteArray(2) = 48
        ByteArray(3) = 13
        Exit Sub
    End If

    Char = 0

    For i = 0 To (ByteLen - 1)
        Char = Char Xor ByteArray(i)
        If (i Mod 10000 = 0) Then
            NewProgress = i / ByteLen * PROGRESS_CALCCRC + PROGRESS_CALCFREQUENCY
            If (NewProgress <> CurrProgress) Then
                CurrProgress = NewProgress
                RaiseEvent Progress(CurrProgress)
            End If
        End If
    Next

    Result(ResultLen) = Char
    ResultLen = ResultLen + 1

    Call CopyMem(Result(ResultLen), ByteLen, 4)
    ResultLen = ResultLen + 4

    For i = 0 To 7
        BitValue(i) = 2 ^ i
    Next

    Count = 0

    For i = 0 To 255
        If (CharValue(i).Count > 0) Then
            Count = Count + 1
        End If
    Next

    Call CopyMem(Result(ResultLen), Count, 2)
    ResultLen = ResultLen + 2
    Count = 0

    For i = 0 To 255
        If (CharValue(i).Count > 0) Then
            Result(ResultLen) = i
            ResultLen = ResultLen + 1
            Result(ResultLen) = CharValue(i).Count
            ResultLen = ResultLen + 1
            Count = Count + 16 + CharValue(i).Count
        End If
    Next

    ReDim Preserve Result(0 To ResultLen + Count \ 8)
    BitPos = 0
    ByteValue = 0

    For i = 0 To 255
        With CharValue(i)
            If (.Count > 0) Then
                For j = 0 To (.Count - 1)
                    If (.Data(j)) Then ByteValue = ByteValue + BitValue(BitPos)
                    BitPos = BitPos + 1
                    If (BitPos = 8) Then
                        Result(ResultLen) = ByteValue
                        ResultLen = ResultLen + 1
                        ByteValue = 0
                        BitPos = 0
                    End If
                Next
            End If
        End With
    Next

    If (BitPos > 0) Then
        Result(ResultLen) = ByteValue
        ResultLen = ResultLen + 1
    End If

    ReDim Preserve Result(0 To ResultLen - 1 + lLength)
    Char = 0
    BitPos = 0

    For i = 0 To (ByteLen - 1)
        With CharValue(ByteArray(i))
            For j = 0 To (.Count - 1)
                If (.Data(j) = 1) Then Char = Char + BitValue(BitPos)
                BitPos = BitPos + 1
                If (BitPos = 8) Then
                    Result(ResultLen) = Char
                    ResultLen = ResultLen + 1
                    BitPos = 0
                    Char = 0
                End If
            Next
        End With
        If (i Mod 10000 = 0) Then
            NewProgress = i / ByteLen * PROGRESS_ENCODING + PROGRESS_CALCCRC + PROGRESS_CALCFREQUENCY
            If (NewProgress <> CurrProgress) Then
                CurrProgress = NewProgress
                RaiseEvent Progress(CurrProgress)
            End If
        End If
    Next

    If (BitPos > 0) Then
        Result(ResultLen) = Char
        ResultLen = ResultLen + 1
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
