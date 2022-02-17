Attribute VB_Name = "kaynak"
Option Explicit
Private Type guid
    Data1 As Long
    Data2 As Integer
    Data3 As Integer
    Data4(0 To 7) As Byte
End Type
Private Const E_NOINTERFACE As Long = &H80004002
Private Const E_NOTIMPL As Long = &H80004001
Private Const guidIEnumVARIANT As String = "{00020404-0000-0000-C000-000000000046}"
Private m_guidIEnumVARIANT As guid
Private Type VTable
Methods(0 To 6) As Long
End Type
Private m_pVTable As Long
Private m_VTable As VTable
Private Type EnumVar
    pVTable As Long
    cCount As Long
    lpCollection As Object
    iCurrent As Long
End Type
Private Declare Sub ZeroMemory Lib "kernel32.dll" Alias "RtlZeroMemory" (ByRef Destination As Any, ByVal Length As Long)
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function CoTaskMemAlloc Lib "ole32.dll" (ByVal cb As Long) As Long
Private Declare Sub CoTaskMemFree Lib "ole32.dll" (ByRef pv As Any)
Private Declare Sub CLSIDFromString Lib "ole32.dll" (ByVal lpsz As Long, ByRef pclsid As guid)
Private Function IsIIDEqual(guid1 As guid, guid2 As guid) As Boolean
    IsIIDEqual = ((guid1.Data1 = guid2.Data1) And (guid1.Data2 = guid2.Data2) And _
                  (guid1.Data3 = guid2.Data3) And (guid1.Data4(0) = guid2.Data4(0)) And (guid1.Data4(1) = guid2.Data4(1)) And _
                  (guid1.Data4(2) = guid2.Data4(2)) And (guid1.Data4(3) = guid2.Data4(3)) And _
                  (guid1.Data4(4) = guid2.Data4(4)) And (guid1.Data4(5) = guid2.Data4(5)) And (guid1.Data4(6) = guid2.Data4(6)) And (guid1.Data4(7) = guid2.Data4(7)))
End Function
Public Function FuncPtr(ByVal addr As Long) As Long
    FuncPtr = addr
End Function
Public Function InitCollection(ByVal objCallback As Object) As IEnumVARIANT
    Dim ptrCollection As Long
    Dim Collection As EnumVar
    If m_pVTable = 0 Then
        With m_VTable
            .Methods(0) = FuncPtr(AddressOf QueryInterface)
            .Methods(1) = FuncPtr(AddressOf AddRef)
            .Methods(2) = FuncPtr(AddressOf Release)
            .Methods(3) = FuncPtr(AddressOf IEnumVARIANT_Next)
            .Methods(4) = FuncPtr(AddressOf IEnumVARIANT_Skip)
            .Methods(5) = FuncPtr(AddressOf IEnumVARIANT_Reset)
            .Methods(6) = FuncPtr(AddressOf IEnumVARIANT_Clone)
        End With
        m_pVTable = VarPtr(m_VTable)
        CLSIDFromString ByVal StrPtr(guidIEnumVARIANT), m_guidIEnumVARIANT
    End If
    With Collection
        .pVTable = m_pVTable
        .cCount = 1
        Set .lpCollection = objCallback
    End With
    ptrCollection = CoTaskMemAlloc(LenB(Collection))
    If ptrCollection Then
        CopyMemory ByVal ptrCollection, ByVal VarPtr(Collection), LenB(Collection)
    End If
    CopyMemory ByVal VarPtr(InitCollection), ptrCollection, 4&
    ZeroMemory ByVal VarPtr(Collection), LenB(Collection)
End Function
Private Function QueryInterface(ByRef This As EnumVar, ByRef iid As guid, ByRef ppvObject As Long) As Long
    If IsIIDEqual(m_guidIEnumVARIANT, iid) Then
        This.cCount = This.cCount + 1
        ppvObject = VarPtr(This)
        QueryInterface = 0
    Else
        ppvObject = 0
        QueryInterface = E_NOINTERFACE
    End If
End Function
Private Function AddRef(ByRef This As EnumVar) As Long
This.cCount = This.cCount + 1
AddRef = This.cCount
End Function
Private Function Release(ByRef This As EnumVar) As Long
This.cCount = This.cCount - 1
Release = This.cCount
If This.cCount = 0 Then
    Set This.lpCollection = Nothing
    CoTaskMemFree ByVal VarPtr(This)
End If
End Function
Private Function IEnumVARIANT_Next(ByRef This As EnumVar, ByVal celt As Long, ByRef rgVar As Variant, ByVal pCeltFetched As Long) As Long
    Dim lng As Long
    If celt <> 1 Then
        IEnumVARIANT_Next = E_NOTIMPL
        Exit Function
    End If
    If pCeltFetched Then
        lng = 1
        CopyMemory ByVal pCeltFetched, lng, 4&
    End If
    IEnumVARIANT_Next = This.lpCollection.ForEach(This.iCurrent, rgVar)
    This.iCurrent = This.iCurrent + 1
End Function
Private Function IEnumVARIANT_Clone(ByRef This As EnumVar, ByRef ppEnum As Long) As Long
    ppEnum = CoTaskMemAlloc(LenB(This))
    CopyMemory ByVal ppEnum, This, LenB(This)
    IEnumVARIANT_Clone = 0
End Function
Private Function IEnumVARIANT_Reset(ByRef This As EnumVar)
    This.iCurrent = 0
End Function
Private Function IEnumVARIANT_Skip(ByRef This As EnumVar, ByVal celt As Long) As Long
    This.iCurrent = This.iCurrent + celt
End Function
