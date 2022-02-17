Attribute VB_Name = "Pack"
Option Explicit

Public Const COMPRESSION_FORMAT_NONE As Long = &H0
Public Const COMPRESSION_FORMAT_DEFAULT As Long = &H1
Public Const COMPRESSION_FORMAT_LZNT1 As Long = &H2
Public Const COMPRESSION_FORMAT_NS3 As Long = &H3
Public Const COMPRESSION_FORMAT_NS15 As Long = &HF
Public Const COMPRESSION_FORMAT_SPARSE As Long = &H4000

Public Const COMPRESSION_ENGINE_STANDARD As Long = &H0
Public Const COMPRESSION_ENGINE_MAXIMUM As Long = &H100
Public Const COMPRESSION_ENGINE_HIBER As Long = &H200
Private Declare Sub CopyMemory Lib "Kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal ByteLen As Long)
Private Declare Sub ZeroMemory Lib "kernel32.dll" Alias "RtlZeroMemory" (Destination As Any, ByVal Length As Long)
Public Declare Function RtlCompressBuffer Lib "ntdll.dll" (ByVal lpCompressionFormat As Long, lpSourceBuffer As Any, ByVal lpSrcLen As Long, lpDestBuffer As Any, ByVal lpDestLen As Long, ByVal lpUnknown As Long, lpDestSize As Long, lpWorkSpaceBuffer As Any) As Long
Public Declare Function RtlGetCompressionWorkSpaceSize Lib "ntdll.dll" (ByVal lpCompressionFormat As Long, lpUnknown As Long, pNeededBufferSize As Long) As Long
Public Declare Function RtlDecompressBuffer Lib "ntdll.dll" (ByVal lpCompressionFormat As Long, lpDestinationBuffer As Any, ByVal lpDestLen As Long, lpSrcBuffer As Any, ByVal lpSrcLen As Long, lpDestSize As Long) As Long

Public Function CompressData(lpData() As Byte) As Byte()

Dim b1() As Byte, lpTemp1 As Long, dwOutputSize As Long, lpSize As Long, b2(0 To 15) As Byte
Dim lpResult() As Byte
lpSize = UBound(lpData) + 1
b1 = lpData
ZeroMemory b1(0), lpSize
Call RtlGetCompressionWorkSpaceSize(COMPRESSION_FORMAT_LZNT1 Or COMPRESSION_ENGINE_MAXIMUM, lpTemp1, dwOutputSize)
lpTemp1 = 0
RtlCompressBuffer COMPRESSION_FORMAT_LZNT1 Or COMPRESSION_ENGINE_MAXIMUM, lpData(0), lpSize, b1(0), lpSize, 0, lpTemp1, b2(0)

ReDim lpResult(0 To lpTemp1 - 1) As Byte
CopyMemory lpResult(0), b1(0), lpTemp1

CompressData = lpResult

End Function

Public Function CompressInfo(lpData() As Byte, lpSize As Long, lpRatio As Long) As Long
Dim i1 As Long
i1 = UBound(CompressData(lpData))
lpSize = i1 + 1
lpRatio = Round((i1 / UBound(lpData)) * 100, 2)
End Function

Public Function CompressedSize(lpData() As Byte) As Long
CompressedSize = UBound(CompressData(lpData)) + 1
End Function

Public Function CompressedRatio(lpData() As Byte) As Long
Dim i1 As Long, i2 As Long, lpData2() As Byte
i1 = UBound(lpData)
lpData2 = CompressData(lpData)
i2 = UBound(lpData2)
CompressedRatio = Round((i2 / i1) * 100, 2)
End Function

Public Function DecompressData(lpData() As Byte, lpDecompressedSize As Long) As Byte()
Dim b1() As Byte, lpTemp1 As Long, dwOutputSize As Long, lpSize As Long, b2(0 To 15) As Byte
Dim lpResult() As Byte
lpDecompressedSize = UBound(lpData) + 1
dwOutputSize = lpDecompressedSize * 13
ReDim Preserve b1(0 To dwOutputSize) As Byte
RtlDecompressBuffer COMPRESSION_FORMAT_LZNT1 Or COMPRESSION_ENGINE_MAXIMUM, b1(0), dwOutputSize, lpData(0), lpDecompressedSize, lpTemp1
ReDim lpResult(0 To lpTemp1 - 1) As Byte
CopyMemory lpResult(0), b1(0), lpTemp1
DecompressData = lpResult
End Function
