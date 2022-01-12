VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "VBS joiner  v1.0 (open source)"
   ClientHeight    =   6930
   ClientLeft      =   45
   ClientTop       =   210
   ClientWidth     =   4590
   FillColor       =   &H00E0E0E0&
   FillStyle       =   7  'Diagonal Cross
   ForeColor       =   &H00E0E0E0&
   Icon            =   "frmmenus.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6930
   ScaleWidth      =   4590
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame5 
      Caption         =   "Enclosed File Infos #1"
      Height          =   2175
      Left            =   75
      TabIndex        =   21
      Top             =   1680
      Width           =   4455
      Begin VB.CheckBox Check2 
         Caption         =   "Execute enclosed file when the VBSscript is launched"
         Height          =   255
         Left            =   240
         TabIndex        =   28
         Top             =   720
         Width           =   4155
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Build enclosed file in script folder"
         Height          =   255
         Left            =   240
         TabIndex        =   26
         Top             =   1440
         Width           =   4095
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Build enclosed file in temporary folder"
         Height          =   255
         Left            =   270
         TabIndex        =   25
         Top             =   1080
         Value           =   -1  'True
         Width           =   3735
      End
      Begin VB.TextBox Text4 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   3420
         Locked          =   -1  'True
         TabIndex        =   24
         Text            =   ".xxx"
         Top             =   320
         Width           =   495
      End
      Begin VB.TextBox Text3 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1800
         TabIndex        =   23
         Text            =   "default"
         Top             =   320
         Width           =   1455
      End
      Begin VB.Label Label8 
         Caption         =   "(editable after)"
         Height          =   255
         Left            =   480
         TabIndex        =   27
         Top             =   1800
         Width           =   3375
      End
      Begin VB.Label Label7 
         Caption         =   "Name of the File"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Enclosed File Infos #2"
      Height          =   1095
      Left            =   75
      TabIndex        =   11
      Top             =   3960
      Width           =   4455
      Begin VB.Label Label13 
         Caption         =   "bytes"
         Height          =   255
         Left            =   3600
         TabIndex        =   20
         Top             =   480
         Width           =   495
      End
      Begin VB.Label Label12 
         Caption         =   "bytes"
         Height          =   255
         Left            =   3600
         TabIndex        =   19
         Top             =   720
         Width           =   615
      End
      Begin VB.Label Label11 
         Alignment       =   1  'Right Justify
         Caption         =   "000000"
         Height          =   255
         Left            =   2280
         TabIndex        =   18
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label10 
         Alignment       =   1  'Right Justify
         Caption         =   "000000"
         Height          =   255
         Left            =   2280
         TabIndex        =   17
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label Label6 
         Caption         =   "length of enclosed file (in)"
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   720
         Width           =   2055
      End
      Begin VB.Label Label5 
         Caption         =   "length of enclosed file (out)"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   480
         Width           =   2055
      End
      Begin VB.Label Label4 
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   240
         Width           =   4215
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "New VBScript Path"
      Height          =   735
      Left            =   75
      TabIndex        =   7
      Top             =   840
      Width           =   4455
      Begin VB.TextBox Text2 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1020
         Locked          =   -1  'True
         TabIndex        =   8
         Top             =   280
         Width           =   2895
      End
      Begin MSComctlLib.Toolbar Toolbar2 
         Height          =   240
         Left            =   3960
         TabIndex        =   9
         Top             =   320
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   423
         ButtonWidth     =   450
         ButtonHeight    =   423
         Style           =   1
         ImageList       =   "ImageList1"
         HotImageList    =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Key             =   "b"
               Object.Tag             =   "destination"
               ImageIndex      =   1
            EndProperty
         EndProperty
      End
      Begin VB.Label Label2 
         Caption         =   "Destination:"
         Height          =   195
         Left            =   120
         TabIndex        =   10
         Top             =   310
         Width           =   945
      End
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   2520
      Top             =   7245
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DialogTitle     =   "Fichier source"
   End
   Begin MSComDlg.CommonDialog CommonDialog2 
      Left            =   2100
      Top             =   7245
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DefaultExt      =   ".vbs"
      DialogTitle     =   "Fichier de destination"
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   3045
      Top             =   7245
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   10
      ImageHeight     =   10
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmmenus.frx":000C
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame1 
      Caption         =   "Enclosed File Path"
      Height          =   735
      Left            =   75
      TabIndex        =   0
      Top             =   0
      Width           =   4455
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1020
         Locked          =   -1  'True
         TabIndex        =   3
         Top             =   280
         Width           =   2895
      End
      Begin MSComctlLib.Toolbar Toolbar1 
         Height          =   240
         Left            =   3960
         TabIndex        =   2
         Top             =   320
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   423
         ButtonWidth     =   450
         ButtonHeight    =   423
         ToolTips        =   0   'False
         AllowCustomize  =   0   'False
         Style           =   1
         ImageList       =   "ImageList1"
         HotImageList    =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Key             =   "a"
               Object.Tag             =   "destination"
               ImageIndex      =   1
            EndProperty
         EndProperty
      End
      Begin VB.Label Label1 
         Caption         =   "Source:"
         Height          =   195
         Left            =   400
         TabIndex        =   1
         Top             =   330
         Width           =   615
      End
   End
   Begin VB.Frame Frame2 
      Height          =   1695
      Left            =   75
      TabIndex        =   4
      Top             =   5160
      Width           =   4455
      Begin VB.CommandButton Command3 
         Caption         =   "Reset"
         Height          =   255
         Left            =   2760
         TabIndex        =   16
         Top             =   240
         Width           =   1575
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Edit script"
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   240
         Width           =   2655
      End
      Begin VB.CommandButton Command1 
         Appearance      =   0  'Flat
         Caption         =   "Build the script!"
         DisabledPicture =   "frmmenus.frx":01A0
         Height          =   255
         Left            =   135
         MaskColor       =   &H00E0E0E0&
         TabIndex        =   5
         Top             =   1320
         UseMaskColor    =   -1  'True
         Width           =   4200
      End
      Begin MSComctlLib.ProgressBar ProgressBar1 
         Height          =   240
         Left            =   120
         TabIndex        =   6
         Top             =   960
         Width           =   4230
         _ExtentX        =   7461
         _ExtentY        =   423
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Min             =   1e-4
         Scrolling       =   1
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Nothing to do..."
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   120
         TabIndex        =   29
         Top             =   600
         Width           =   4230
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'///////////////////////////////////////////////////////////////
'///////////////////////////////////////////////////////////////
'///                                                         ///
'///  VBS Joiner By Wonesek   (wonesek@free.fr)              ///
'///             Open Source/ Copy Left                      ///
'///                                                         ///
'///  Version : ouhla.... alpha quelques choses ;)           ///
'///            22/03/2003 14:30 GMT +0100                   ///
'///                                                         ///
'///  Infos: A utiliser à des fins légales sinon ca          ///
'///         fonctionnera pas :)                             ///
'///                                                         ///
'///  Disclaimer: Mmmm, t'es grand tu sais ce que tu fais    ///
'///              et t'es responsable                        ///
'///                                                         ///
'///////////////////////////////////////////////////////////////
'///////////////////////////////////////////////////////////////


Private Sub Command1_Click()

Dim PathFichierSource As String              'Chemin du fichier dont le code hexa sera extrait
Dim PathFichierCible As String               'Chemin du fichier (txt/vbs) crée
Dim FolderPathFichierEmbarque As String      'endroit ou est generé le fichier joint
Dim NomFichierembarque As String             'nom du fichier embarque
Dim i As Double                              'variable d'iteration
Dim CodeHexFichierSource As String           'code hexa du fichier source
Dim Code As String                           'fragment de traduction du code hexadecimal
Dim TabCode()                                'contient tous les fragment de code
Dim AllCode As String                        'tabcode dont toutes les cellules ont été concatenées
Dim HexaOfAscii As String                    'valeur hexadecimal d'une valeur ascii

If (Not CreateObject("Scripting.FileSystemObject").FileExists(CommonDialog1.FileName)) Or _
   (CommonDialog2.FileName = Null) Or (CommonDialog2.FileName = Empty) Then
    Label3.Caption = "Error"
    Label3.Refresh
Else
    Label3.Caption = "Initialization"
    Label3.Refresh
    PathFichierSource = CommonDialog1.FileName
    PathFichierCible = CommonDialog2.FileName
    Label3.Caption = "Reading enclosed file #1"
    Label3.Refresh
    
    Open PathFichierSource For Binary As #1
    CodeHexFichierSource = Input(LOF(1), 1)
    Close #1
    
    ProgressBar1.Min = 0
    ProgressBar1.Max = Len(CodeHexFichierSource)
    ProgressBar1.Value = 0
    Label3.Caption = "Reading enclosed file #2"
    Label3.Refresh
    rows = 0
    For i = 1 To Len(CodeHexFichierSource)
            HexaOfAscii = Hex(Asc(Mid(CodeHexFichierSource, i, 1)))
            If (Len(HexaOfAscii) = 1) Then HexaOfAscii = "0" & HexaOfAscii
            Code = Code & HexaOfAscii
            If (Len(Code) > 10000) Then
                ReDim Preserve TabCode(rows + 1)
                TabCode(rows) = Code
                Code = ""
                rows = rows + 1
            End If
            ProgressBar1.Value = i
    Next
    ReDim Preserve TabCode(rows + 1)
    TabCode(rows) = Code
    For i = 0 To (UBound(TabCode, 1) - 1)
        AllCode = AllCode + TabCode(i)
    Next
    
    Label3.Caption = "Creation du script"
    Label3.Refresh
    
    If (Option1.Value) Then
        FolderPathFichierEmbarque = "fso.GetSpecialFolder(2)"
    Else
        FolderPathFichierEmbarque = "fso.getparentfoldername(wscript.scriptfullname)"
    End If
    
    NomFichierembarque = Text3.Text & Right(PathFichierSource, 4)
    
    Open PathFichierCible For Output As #2
    Print #2, "Set fso = createobject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
    Print #2, "HexadecimalCode = " & Chr(34) & AllCode & Chr(34)
    Print #2, "For flag1 = 1 To Len(HexadecimalCode) Step 2"
    Print #2, "NormalCode = NormalCode & Chr(" & Chr(34) & "&h" & Chr(34) & "& Mid(HexadecimalCode, flag1, 2))"
    Print #2, "next"
    Print #2, "Set MyFile = fso.createtextfile(" & FolderPathFichierEmbarque & " & " & Chr(34) & "\" & NomFichierembarque & Chr(34) & ", True)"
    Print #2, "MyFile.write NormalCode"
    Print #2, "MyFile.close"
    If (Check2.Value = 1) Then
        Print #2, "CreateObject (" & Chr(34) & "wscript.Shell" & Chr(34) & ").run " & FolderPathFichierEmbarque & " & " & Chr(34) & "\" & NomFichierembarque & Chr(34) & ", 1, False"
    End If
    Close #2
    
    If (Check1.Value = 1) Then
        CreateObject("wscript.Shell").run "%SystemRoot%\system32\notepad.exe " & PathFichierCible, 1, False
    End If
    
    ProgressBar1.Value = 0
    Label3.Caption = "Nothing to do..."
    Label3.Refresh
End If

End Sub



Private Sub Command3_Click()
CommonDialog1.FileName = Empty
CommonDialog2.FileName = Empty

Text1.Text = "No File"
Text2.Text = "No File"
Text3.Text = "Default"
Text4.Text = ".xxx"

Check1.Value = 0
Check2.Value = 0

Option1.Value = True
Option2.Value = False

Label4.Caption = "Enclosed File Type:  no type"
Label10.Caption = "000000"
Label11.Caption = "000000"
End Sub


Private Sub Form_Load()
CommonDialog1.Filter = "All Files|*.*"
CommonDialog2.Filter = "TXT File (*.txt)|*.txt|VBS File(*.vbs)|*.vbs"
CommonDialog2.Flags = cdlOFNOverwritePrompt
Call Command3_Click
End Sub


Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
CommonDialog1.ShowOpen
If CommonDialog1.FileName <> Empty Then
    Text1.Text = LCase(CommonDialog1.FileName)
    Open CommonDialog1.FileName For Binary As #1
    Label4.Caption = "Enclosed file type: " & Right(CommonDialog1.FileName, 3) & "."
    Label10.Caption = LOF(1)
    Label11.Caption = 2 * LOF(1)
    Close #1
    Text4.Text = Right(CommonDialog1.FileName, 4)
    Text3.Text = Mid(CommonDialog1.FileName, InStrRev(CommonDialog1.FileName, "\") + 1, Len(CommonDialog1.FileName) - InStrRev(CommonDialog1.FileName, "\") - 4)
End If
End Sub

Private Sub Toolbar2_ButtonClick(ByVal Button As MSComctlLib.Button)
CommonDialog2.ShowSave
If CommonDialog2.FileName <> Empty Then
    Text2.Text = LCase(CommonDialog2.FileName)
End If
End Sub

