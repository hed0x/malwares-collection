Attribute VB_Name = "Res"
Option Explicit
Private Declare Function BeginUpdateResource Lib "Kernel32" Alias "BeginUpdateResourceA" (ByVal pFileName As String, ByVal bDeleteExistingResources As Long) As Long
Private Declare Function UpdateResource Lib "Kernel32" Alias "UpdateResourceA" (ByVal hUpdate As Long, ByVal lpType As Long, ByVal lpName As Long, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function UpdateResource1 Lib "Kernel32" Alias "UpdateResourceA" (ByVal hUpdate As Long, ByVal lpType As Long, ByVal lpName As Long, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function EndUpdateResource Lib "Kernel32" Alias "EndUpdateResourceA" (ByVal hUpdate As Long, ByVal fDiscard As Long) As Long
Public Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function FindResource Lib "Kernel32" Alias "FindResourceA" (ByVal hInstance As Long, ByVal lpName As String, ByVal lpType As String) As Long
Private Declare Function FindResourceByNum Lib "Kernel32" Alias "FindResourceA" (ByVal hInstance As Long, ByVal lpName As String, ByVal lpType As Long) As Long
Private Declare Function LoadResource Lib "Kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function LockResource Lib "Kernel32" (ByVal hResData As Long) As Long
Private Declare Function SizeofResource Lib "Kernel32" (ByVal hInstance As Long, ByVal hResInfo As Long) As Long
Private Declare Function LoadLibrary Lib "Kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Private Declare Function FreeResource Lib "Kernel32" (ByVal hResData As Long) As Long
Private Declare Function FreeLibrary Lib "Kernel32" (ByVal hLibModule As Long) As Long

Public Function GetResData(ByVal ResType As String, ByVal ResName As String, Optional EXEPfad As String) As String

   Dim hRsrc As Long
   Dim hGlobal As Long
   Dim lpData As Long
   Dim Size As Long
   Dim hMod As Long
   Dim Text As String
   
  
   'Die eigene exe ist ja geladen, also ist hMod das InstanceHandle. Wenn eine Exe angegeben wird, kann allerdings jede exe oder dll ausgelesen werden
   If EXEPfad = "" Or EXEPfad = App.Path & "\" & App.EXEName & ".exe" Or Dir(EXEPfad) = "" Then
    hMod = App.hInstance
   Else
    hMod = LoadLibrary(EXEPfad)
   End If
   
   If hMod = 0 Then Exit Function
   'Resource suchen
   If IsNumeric(ResType) Then hRsrc = FindResourceByNum(hMod, ResName, CLng(ResType))
   If hRsrc = 0 Then hRsrc = FindResource(hMod, ResName, ResType)
   If hRsrc = 0 Then Exit Function
   'Resource Laden
   hGlobal = LoadResource(hMod, hRsrc)
   lpData = LockResource(hGlobal) 'Pointer zu unseren Daten
   Size = SizeofResource(hMod, hRsrc) 'Länge der Daten ermitteln
   If Size = 0 Then Exit Function
   Text = Space(Size) 'Buffer füllen
   Call CopyMemory(ByVal Text, ByVal lpData, Size) 'und umwandeln
   Call FreeResource(hGlobal)
   GetResData = Text
   FreeLibrary hMod
   
End Function

Public Function GetResDataBytes(ByVal ResType As String, ByVal ResName As String, Optional EXEPfad As String) As Byte()

   Dim hRsrc As Long
   Dim hGlobal As Long
   Dim lpData As Long
   Dim Size As Long
   Dim hMod As Long
   Dim Text As String
   Dim b() As Byte
  
   'Die eigene exe ist ja geladen, also ist hMod das InstanceHandle. Wenn eine Exe angegeben wird, kann allerdings jede exe oder dll ausgelesen werden
   If EXEPfad = "" Or EXEPfad = App.Path & "\" & App.EXEName & ".exe" Or Dir(EXEPfad) = "" Then
    hMod = App.hInstance
   Else
    hMod = LoadLibrary(EXEPfad)
   End If
   
   If hMod = 0 Then Exit Function
   'Resource suchen
   If IsNumeric(ResType) Then hRsrc = FindResourceByNum(hMod, ResName, CLng(ResType))
   If hRsrc = 0 Then hRsrc = FindResource(hMod, ResName, ResType)
   If hRsrc = 0 Then Exit Function
   'Resource Laden
   hGlobal = LoadResource(hMod, hRsrc)
   lpData = LockResource(hGlobal) 'Pointer zu unseren Daten
   Size = SizeofResource(hMod, hRsrc) 'Länge der Daten ermitteln
   If Size = 0 Then Exit Function
   Text = Space(Size) 'Buffer füllen
   ReDim b(0 To Size) As Byte
   Call CopyMemory(b(0), ByVal lpData, Size)  'und umwandeln
   Call FreeResource(hGlobal)
   GetResDataBytes = b
   FreeLibrary hMod
   
End Function

Public Function SetResource(lpType As Long, lpID As Long, lpData As String, lpFile As String) As Long

Dim pReturn As Long, rPort As Long
pReturn = BeginUpdateResource(lpFile, False)
If pReturn <> 0 Then
 rPort = UpdateResource(pReturn, lpType, lpID, 1033, ByVal lpData, Len(lpData))
 EndUpdateResource pReturn, False
 If rPort <> 0 Then SetResource = True
End If

End Function
Public Function SetResourceBytes(lpType As Long, lpID As Long, lpData() As Byte, lpFile As String) As Long

Dim pReturn As Long, rPort As Long, nCount As Long
nCount = UBound(lpData) + 1 - LBound(lpData)
pReturn = BeginUpdateResource(lpFile, False)
If pReturn <> 0 Then
 rPort = UpdateResource1(pReturn, lpType, lpID, 1033, lpData(LBound(lpData)), nCount)
 EndUpdateResource pReturn, False
 If rPort <> 0 Then SetResourceBytes = True
End If

End Function

