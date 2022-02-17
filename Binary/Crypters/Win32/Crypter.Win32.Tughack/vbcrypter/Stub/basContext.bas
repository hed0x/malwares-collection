Attribute VB_Name = "basContext"
Option Explicit

Public Const SIZE_OF_80387_REGISTERS = 80

Public Type FLOATING_SAVE_AREA
    ControlWord As Long
    StatusWord As Long
    TagWord As Long
    ErrorOffset As Long
    ErrorSelector As Long
    DataOffset As Long
    DataSelector As Long
    RegisterArea(1 To SIZE_OF_80387_REGISTERS) As Byte
    Cr0NpxState As Long
End Type

Public Type CONTEXT86
    ContextFlags As Long
    'CONTEXT_DEBUG_REGISTERS
    Dr0 As Long
    Dr1 As Long
    Dr2 As Long
    Dr3 As Long
    Dr6 As Long
    Dr7 As Long
    'CONTEXT_FLOATING_POINT
    FloatSave As FLOATING_SAVE_AREA
    'CONTEXT_SEGMENTS
    SegGs As Long
    SegFs As Long
    SegEs As Long
    SegDs As Long
    'CONTEXT_INTEGER
    Edi As Long
    Esi As Long
    Ebx As Long
    Edx As Long
    Ecx As Long
    Eax As Long
    'CONTEXT_CONTROL
    Ebp As Long
    Eip As Long
    SegCs As Long
    EFlags As Long
    Esp As Long
    SegSs As Long
End Type

Public Const CONTEXT_X86 = &H10000
Public Const CONTEXT86_CONTROL = (CONTEXT_X86 Or &H1)
Public Const CONTEXT86_INTEGER = (CONTEXT_X86 Or &H2)
Public Const CONTEXT86_SEGMENTS = (CONTEXT_X86 Or &H4)
Public Const CONTEXT86_FLOATING_POINT = (CONTEXT_X86 Or &H8)
Public Const CONTEXT86_DEBUG_REGISTERS = (CONTEXT_X86 Or &H10)
Public Const CONTEXT86_FULL = (CONTEXT86_CONTROL Or CONTEXT86_INTEGER Or CONTEXT86_SEGMENTS)

Public Declare Function GetThreadContext Lib "kernel32" (ByVal hThread As Long, lpContext As CONTEXT86) As Long
Public Declare Function SetThreadContext Lib "kernel32" (ByVal hThread As Long, lpContext As CONTEXT86) As Long
Public Declare Function SuspendThread Lib "kernel32" (ByVal hThread As Long) As Long
Public Declare Function ResumeThread Lib "kernel32" (ByVal hThread As Long) As Long

