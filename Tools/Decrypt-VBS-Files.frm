
   VERSION 5.00
   Begin VB.Form Form1
      BorderStyle     =   1  'Fixed Single
      Caption         =   "VBS and VBA Files Decrypter by PetiK - 16/07/2009 - 19/07/2009"
      ClientHeight    =   6375
      ClientLeft      =   45
      ClientTop       =   435
      ClientWidth     =   14475
      Icon            =   "Form1.frx":0000
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      ScaleHeight     =   6375
      ScaleWidth      =   14475
      StartUpPosition =   3  'Windows Default
      Begin VB.TextBox file_name
         BeginProperty Font
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   11040
         TabIndex        =   11
         Text            =   "vbsworm.vbs"
         Top             =   1320
         Width           =   2415
      End
      Begin VB.TextBox szligne
         BeginProperty Font
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1575
         Left            =   8640
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         Top             =   1800
         Width           =   5655
      End
      Begin VB.TextBox fontion_decrypt
         BeginProperty Font
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1815
         Left            =   8640
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   8
         Text            =   "Form1.frx":030A
         Top             =   3720
         Width           =   5655
      End
      Begin VB.CommandButton generate_vbs_decr_file
         Caption         =   "Generates VBS Decrypter File"
         BeginProperty Font
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   8640
         TabIndex        =   7
         Top             =   5640
         Width           =   5655
      End
      Begin VB.CommandButton find_crypt_line
         Caption         =   "Find Crypt Line"
         BeginProperty Font
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   11280
         TabIndex        =   6
         Top             =   600
         Width           =   2295
      End
      Begin VB.TextBox szfin
         BeginProperty Font
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   8640
         TabIndex        =   5
         Text            =   """)"
         Top             =   1320
         Width           =   855
      End
      Begin VB.TextBox szdebut
         BeginProperty Font
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   8640
         TabIndex        =   2
         Text            =   "D("""
         Top             =   600
         Width           =   2295
      End
      Begin VB.TextBox szsource
         BeginProperty Font
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   5775
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   0
         Text            =   "Form1.frx":036B
         Top             =   360
         Width           =   8295
      End
      Begin VB.Label Label5
         Caption         =   "Decrypt Function (found in the VBS File) :"
         Height          =   255
         Left            =   8640
         TabIndex        =   12
         Top             =   3480
         Width           =   3015
      End
      Begin VB.Label Label4
         Caption         =   "File Name :"
         Height          =   255
         Left            =   10080
         TabIndex        =   10
         Top             =   1320
         Width           =   855
      End
      Begin VB.Label Label3
         Caption         =   "End :"
         Height          =   255
         Left            =   8640
         TabIndex        =   4
         Top             =   1080
         Width           =   855
      End
      Begin VB.Label Label2
         Caption         =   "Start :"
         Height          =   255
         Left            =   8640
         TabIndex        =   3
         Top             =   360
         Width           =   855
      End
      Begin VB.Label Label1
         Caption         =   "Source of file :"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   120
         Width           =   6975
      End
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   'szsource.Text = Replace(szsource.Text, szdebut.Text & ancienne & szfin.Text, """" & nouvelle & """")

   Private Sub generate_vbs_decr_file_Click()
   If Len(szligne.Text) = 0 Then
   MsgBox "Don't forget to find crypt strings by clicking on the ""Find Crypt Line"" button", vbInformation
   Else

   Set fso = CreateObject("Scripting.FileSystemObject")

   For h = 1 To Len(fontion_decrypt.Text)
   If Mid(fontion_decrypt.Text, h, 9) = "Function " Then
   nouveau = ""
   ancien = ""
   cnt = 0
   Do While Mid(fontion_decrypt.Text, j + 9 + cnt, 1) <> "("
   nouveau = nouveau + Mid(fontion_decrypt.Text, j + 9 + cnt, 1)
   cnt = cnt + 1
   Loop

   End If
   Next
   cnt = cnt + 1
   Do While Mid(fontion_decrypt.Text, j + 9 + cnt, 1) <> ")"
   ancien = ancien + Mid(fontion_decrypt.Text, j + 9 + cnt, 1)
   cnt = cnt + 1
   Loop

   m_f = "' To decrypt VBS String File" & vbCrLf & vbCrLf
   m_f = m_f & "Set P=CreateObject(""Scripting.FileSystemObject"")" & vbCrLf
   m_f = m_f & szligne.Text & vbCrLf & vbCrLf
   m_f = m_f & Mid(fontion_decrypt.Text, 1, Len(fontion_decrypt) - 14) & vbCrLf
   m_f = m_f & "Set f1 = P.OpenTextFile(""" & file_name.Text & """, 1)" & vbCrLf
   m_f = m_f & "tl = f1.ReadAll" & vbCrLf
   m_f = m_f & "f1.Close" & vbCrLf
   m_f = m_f & "Set f2 = P.CreateTextFile(""" & file_name.Text & """, 1)" & vbCrLf
   'tl = f2.Write(Replace(tl, "D(""" & FR & """)", """" & D & """"))
   m_f = m_f & "tl = f2.Write(Replace(tl, """ & szdebut.Text & """"" & " & ancien & " & """"" & szfin.Text & """, """""""" & " & nouveau & " & """"""""))" & vbCrLf
   m_f = m_f & "f2.Close" & vbCrLf
   m_f = m_f & "End Function"

   'MsgBox m_f
   Set file_decrypt = fso.CreateTextFile("decrypt.vbs", 2)
   file_decrypt.Write (m_f)
   file_decrypt.Close

   'szsource.Text = szsource.Text & vbCrLf & vbCrLf & "'Decrypt by the VBS and VBA File Decrypter written by PetiK - " & Date
   End If

   End Sub


   Private Sub find_crypt_line_Click()
   szligne.Text = ""

   For j = 1 To Len(szsource.Text)
   If Mid(szsource.Text, j, Len(szdebut.Text)) = szdebut.Text Then
   mlto = ""
   cnt = 0
   Do While Mid(szsource.Text, j + Len(szdebut.Text) + cnt, 1) <> Mid(szfin.Text, 1, 1)
   mlto = mlto + Mid(szsource.Text, j + Len(szdebut.Text) + cnt, 1)
   cnt = cnt + 1
   Loop
   mlto = szdebut.Text & mlto & szfin.Text

   szligne.Text = szligne.Text & mlto & vbCrLf

   End If
   Next
   szligne.Text = Mid(szligne.Text, 1, Len(szligne.Text) - 2)
   End Sub
