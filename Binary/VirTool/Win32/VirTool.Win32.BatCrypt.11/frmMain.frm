VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Batch Encrypt - Version 1.1"
   ClientHeight    =   3885
   ClientLeft      =   5475
   ClientTop       =   4830
   ClientWidth     =   5295
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3885
   ScaleWidth      =   5295
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtEncrypted 
      Height          =   1365
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   9
      Text            =   "frmMain.frx":0442
      Top             =   2520
      Width           =   5295
   End
   Begin VB.TextBox txtBatch 
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   8
      Text            =   "frmMain.frx":0455
      Top             =   1320
      Width           =   3855
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   255
      Left            =   3960
      TabIndex        =   7
      Top             =   2160
      Width           =   1335
   End
   Begin VB.CommandButton cmdShouts 
      Caption         =   "Shouts"
      Height          =   255
      Left            =   3960
      TabIndex        =   6
      Top             =   1800
      Width           =   1335
   End
   Begin VB.CommandButton cmdHelp 
      Caption         =   "Help"
      Height          =   255
      Left            =   3960
      TabIndex        =   5
      Top             =   1440
      Width           =   1335
   End
   Begin VB.CommandButton cmdCopy 
      Caption         =   "Copy Code"
      Height          =   255
      Left            =   3960
      TabIndex        =   4
      Top             =   1080
      Width           =   1335
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear Code"
      Height          =   255
      Left            =   3960
      TabIndex        =   3
      Top             =   720
      Width           =   1335
   End
   Begin VB.CommandButton cmdEncrypt 
      Caption         =   "Encrypt .bat"
      Height          =   255
      Left            =   3960
      TabIndex        =   2
      Top             =   360
      Width           =   1335
   End
   Begin VB.TextBox txtDefs 
      Height          =   1215
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Text            =   "frmMain.frx":0469
      Top             =   0
      Width           =   3855
   End
   Begin VB.CommandButton cmdgenkey 
      Caption         =   "Generate Defs."
      Height          =   255
      Left            =   3960
      TabIndex        =   0
      Top             =   0
      Width           =   1335
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim used(1 To 27) As String 'this needs to be global ;)



Private Sub cmdClear_Click()
txtDefs.Text = "[Definitions]" 'just clear the text boxes and put initial text there
txtBatch.Text = "[Paste Code Here]"
txtEncrypted.Text = "[Encrypted Code]"
End Sub

Private Sub cmdCopy_Click()
Clipboard.SetText txtEncrypted.Text 'copy the code to the text box
End Sub

Private Sub cmdEncrypt_Click()
'add definitions to final text
txtEncrypted.Text = txtDefs.Text & Chr$(13) + Chr$(10) & Chr$(13) + Chr$(10)
'encrypt it
For i = 1 To Len(txtBatch.Text)
    Select Case Mid(txtBatch.Text, i, 1) 'were looking at one character at a time
    Case "a"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(1) & "%"
    Case "b"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(2) & "%"
    Case "c"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(3) & "%"
    Case "d"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(4) & "%"
    Case "e"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(5) & "%"
    Case "f"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(6) & "%"
    Case "g"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(7) & "%"
    Case "h"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(8) & "%"
    Case "i"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(9) & "%"
    Case "j"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(10) & "%"
    Case "k"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(11) & "%"
    Case "l"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(12) & "%"
    Case "m"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(13) & "%"
    Case "n"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(14) & "%"
    Case "o"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(15) & "%"
    Case "p"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(16) & "%"
    Case "q"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(17) & "%"
    Case "r"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(18) & "%"
    Case "s"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(19) & "%"
    Case "t"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(20) & "%"
    Case "u"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(21) & "%"
    Case "v"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(22) & "%"
    Case "w"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(23) & "%"
    Case "x"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(24) & "%"
    Case "y"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(25) & "%"
    Case "z"
     txtEncrypted.Text = txtEncrypted.Text & "%" & used(26) & "%"
    Case Else
      'this makes it so if it's not a lowercase letter then it will leave it alone
      txtEncrypted.Text = txtEncrypted.Text & Mid(txtBatch.Text, i, 1)
    End Select
Next i
End Sub

Private Sub cmdExit_Click()
End
End Sub

Private Sub cmdgenkey_Click()
'initialize the array...
Dim chars(1 To 27) As Integer
'initialize the 'set' array, can't be call set :( since set is a illegal name :(
Dim Setter(1 To 3) As String
'clear out the text
txtDefs.Text = ""

'Encrypt 's','e' and 't' for better encryption in definitions! (Thank SPTH for the idea)
For i = 1 To 3
    rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
    'save the variable for later use
    Setter$(i) = rand
    With txtDefs
        .Text = .Text & "set " & rand & "=" & Chr$(Int(Rnd() * 26 + 97)) & Chr(Int(Rnd() * 26 + 97)) & Chr(Int(Rnd() * 26 + 97)) & Chr$(13) + Chr$(10)
        Select Case i
            Case 1
                .Text = .Text & "set " & rand & "=s" & Chr$(13) + Chr$(10) 'The true statment
            Case 2
                .Text = .Text & "set " & rand & "=e" & Chr$(13) + Chr$(10) 'The true statment
            Case 3
                .Text = .Text & "set " & rand & "=t" & Chr$(13) + Chr$(10) 'The true statment
            Case Else
                MsgBox "Error! E-mail Tim at Timstrazz@attbi.com and yell at him!", vbCritical, "Error!"
        End Select
        .Text = .Text & "GoTo " & rand & Chr$(13) + Chr$(10)
        .Text = .Text & "set " & rand & "=" & Chr$(Int(Rnd() * 26 + 97)) & Chr(Int(Rnd() * 26 + 97)) & Chr$(13) + Chr$(10)
        .Text = .Text & ":" & rand & Chr$(13) + Chr$(10)
    End With
Next i
'fill the array with a-z lowercase only
For i = 97 To 122
    chars(i - 96) = i
Next i
For i = 1 To 27
    Do
        ender = 1
        rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        For j = 1 To 27
            'make sure we havn't used that variable
            If used$(j) = rand Then
             ender = 0
            End If
        Next j
    Loop Until (ender = 1)
    'make that variable used
    used$(i) = rand
    With txtDefs
     'write the definitions
     .Text = .Text & "%" & Setter(1) & "%" & "%" & Setter(2) & "%" & "%" & Setter(3) & "%" & " " & rand & "=" & Chr$(Int(Rnd() * 26 + 97)) & Chr(Int(Rnd() * 26 + 97)) & Chr(Int(Rnd() * 26 + 97)) & Chr$(13) + Chr$(10)
     .Text = .Text & "%" & Setter(1) & "%" & "%" & Setter(2) & "%" & "%" & Setter(3) & "%" & " " & rand & "=" & Chr$(chars(i)) & Chr$(13) + Chr$(10)   'The true statment
     .Text = .Text & "GoTo " & rand & Chr$(13) + Chr$(10)
     .Text = .Text & "%" & Setter(1) & "%" & "%" & Setter(2) & "%" & "%" & Setter(3) & "%" & " " & " " & rand & "=" & Chr$(Int(Rnd() * 26 + 97)) & Chr(Int(Rnd() * 26 + 97)) & Chr$(13) + Chr$(10)
     .Text = .Text & ":" & rand & Chr$(13) + Chr$(10)
    End With
Next i
'definitions made; now we can encrypt
cmdEncrypt.Enabled = True
End Sub


Private Sub cmdHelp_Click()
'just a msgbox... interesting? eh?
MsgBox "Batch Encrpyt - Version 1.1" & Chr$(13) + Chr$(10) & _
       "Coded By Tim Strazzere for Diablo3k (http://www.diablo3k.net/)" & Chr$(13) + Chr$(10) & Chr$(13) + Chr$(10) & _
       "The purpose of this program is to encrypt a batch file, thus making it harder to" & Chr$(13) + Chr$(10) & _
       "to trace/scan the batch file. The idea was taken by a short tutorial written by" & Chr$(13) + Chr$(10) & _
       "Second Part To Hell." & Chr$(13) + Chr$(10) & Chr$(13) + Chr$(10) & _
       "How do you use it?" & Chr$(13) + Chr$(10) & _
       "First off, generate the definitions for the letters, do this by pressing the" & Chr$(13) + Chr$(10) & _
       "'Generate Defs.' button, if you deem these definitions acceptable then continue," & Chr$(13) + Chr$(10) & _
       "otherwise reclick until your satisfied. Next, load your batch file using the 'Load'" & Chr$(13) + Chr$(10) & _
       "button, or paste it into the text box deemed for it. Then click the 'Encrypt .bat'" & Chr$(13) + Chr$(10) & _
       "button. This will then generated the encrypted batch file in the third text box," & Chr$(13) + Chr$(10) & _
       "which is clearly marked. Now you can copy the code using the Copy Code button " & Chr$(13) + Chr$(10) & Chr$(13) + Chr$(10) & _
       "*NOTE: ONLY LOWERCASE CHARACTERS WILL BE CONVERTED, SYMBOLS AND UPPERCASE" & Chr$(13) + Chr$(10) & _
       "SHOULD BE RESERVED FOR VARIABLE NAMES! (i.e. - %WINPATH% will not be" & Chr$(13) + Chr$(10) & _
       "though in %winpath%, winpath would be converted - creating an error)"
MsgBox "For more indepth information and help consult the Read Me (which should" & Chr$(13) + Chr$(10) & _
       "be read prior to sending a bug report or e-mail for help)"
End Sub

Private Sub cmdShouts_Click()
'just a msgbox... interesting? eh?
MsgBox "Ok, first off a huge thanks to Second Part To Hell for giving me the idea and the knowledge." & Chr$(13) + Chr$(10) & _
       "Second i'd like to thank everyone at Diablo3k (http://www.diablo3k.net) especially" & Chr$(13) + Chr$(10) & _
       "Crystal Meth for being the coolest kid and mantaining the site (when it's not 99%" & Chr$(13) + Chr$(10) & _
       "completed but nothings done on it!) Also to Assassin007 for having the sick web site" & Chr$(13) + Chr$(10) & _
       " up so i could find SPTH's artical. Other than that - i don't really have any" & Chr$(13) + Chr$(10) & _
       " shouts... well except for Zoom32, the damn cool phili-virus writer and all of the rrlf " & Chr$(13) + Chr$(10) & _
       "(http://www.rrlf.de) - also keep the scene alive, and if i forgot you e-mail me and" & Chr$(13) + Chr$(10) & _
       "you'll be added in the final version!"
End Sub

Private Sub Form_Load()
StayOnTop Me 'call the stay on top function in the module
Randomize 'must be for random numbers
txtDefs.Locked = True 'disable the editing of the text box
txtEncrypted.Locked = True 'disable the editing of the text box
cmdEncrypt.Enabled = False 'You'll get an error if the user encrypt's without definitions
End Sub
