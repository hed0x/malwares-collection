VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fester Dialog
   Caption         =   "Batch Encrypt - Version 2.0"
   ClientHeight    =   3885
   ClientLeft      =   5475
   ClientTop       =   4830
   ClientWidth     =   5295
   Icon            =   "BE2.00.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3885
   ScaleWidth      =   5295
   Begin VB.TextBox txtEncrypted 
      Height          =   1365
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertikal
      TabIndex        =   9
      Text            =   "BE2.00.frx":0442
      Top             =   2520
      Width           =   5295
   End
   Begin VB.TextBox txtBatch 
      Height          =   1095
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertikal
      TabIndex        =   8
      Text            =   "BE2.00.frx":0455
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
      ScrollBars      =   2  'Vertikal
      TabIndex        =   1
      Text            =   "BE2.00.frx":0469
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
Dim chars(1 To 27) As Integer 'initialize the array...

Private Sub cmdClear_Click()
txtDefs.Text = "[Definitions]" 'just clear the text boxes and put initial text there
txtBatch.Text = "[Paste Code Here]"
txtEncrypted.Text = "[Encrypted Code]"
For i = 1 To 27
  chars(i) = 0
  used(i) = ""
Next
txtBatch.Enabled = True
End Sub

Private Sub cmdCopy_Click()
Clipboard.SetText txtEncrypted.Text 'copy the code to the text box
End Sub

Private Sub cmdEncrypt_Click()
'add definitions to final text
txtEncrypted.Text = txtDefs.Text & Chr$(13) + Chr$(10) & Chr$(13) + Chr$(10)
'encrypt it
For i = 1 To Len(txtBatch.Text)
  checkifwritten = 1
    For j = 1 To 27
      If Mid(txtBatch.Text, i, 1) = Chr(chars(j)) Then
        txtEncrypted.Text = txtEncrypted.Text & "%" & used(j) & "%"
        checkifwritten = 0
      End If
    Next
If checkifwritten = 1 Then
        'this makes it so if it's not a lowercase letter then it will leave it alone
        txtEncrypted.Text = txtEncrypted.Text & Mid(txtBatch.Text, i, 1)
End If
Next i
txtBatch.Enabled = False
End Sub

Private Sub cmdExit_Click()
End
End Sub

Private Sub cmdgenkey_Click()
If txtBatch.Text = "[Paste Code Here]" + Chr(13) + Chr(10) Then
  MsgBox "Please first include your code to encrypt."
  Exit Sub
End If
Dim Setter(1 To 3) As String
'clear out the text
txtDefs.Text = ""

'Encrypt 's','e' and 't' for better encryption in definitions! (Thank SPTH for the idea)
For i = 1 To 3
    rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
    'save the variable for later use
            randchecker = Int(Rnd * 5) + 1
        If randchecker = 1 Then
          rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        ElseIf randchecker = 2 Then
          rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        ElseIf randchecker = 3 Then
          rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        ElseIf randchecker = 4 Then
          rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        Else
          rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        End If
    Setter$(i) = rand
    With txtDefs
        'for the random-variable-size
        
        Select Case i
            Case 1
                .Text = .Text & "set " & rand & "=s" & Chr$(13) + Chr$(10) 'The true statment
            Case 2
                .Text = .Text & "set " & rand & "=e" & Chr$(13) + Chr$(10) 'The true statment
            Case 3
                .Text = .Text & "set " & rand & "=t" & Chr$(13) + Chr$(10) 'The true statment
        End Select
        .Text = .Text & "goto " & rand & Chr$(13) + Chr$(10)
        .Text = .Text & "set " & rand & "=" & Chr$(Int(Rnd() * 26 + 97)) & Chr(Int(Rnd() * 26 + 97)) & Chr$(13) + Chr$(10)
        .Text = .Text & ":" & rand & Chr$(13) + Chr$(10)
    End With
Next i

'call the sub, which tells the letters, that are used in the code to encrypt.
'to don't use vars, which we don't need
'and to avoid Win95|98|ME 21-vars-maximum error
Call findletters

        randchecker = Int(Rnd * 5) + 1
        If randchecker = 1 Then
          rando = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        ElseIf randchecker = 2 Then
          rando = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        ElseIf randchecker = 3 Then
          rando = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        ElseIf randchecker = 4 Then
          rando = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        Else
          rando = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        End If
defrand = rando
txtDefs.Text = txtDefs.Text & "%" & Setter(1) & "%" & "%" & Setter(2) & "%" & "%" & Setter(3) & "% " & defrand & "=%" & Setter(1) & "%" & "%" & Setter(2) & "%" & "%" & Setter(3) & "%" & Chr$(13) + Chr$(10)
For i = 1 To 27
 If chars(i) <> 0 Then
    Do
        ender = 1
        'for the random-var-size
        randchecker = Int(Rnd * 5) + 1
        If randchecker = 1 Then
          rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        ElseIf randchecker = 2 Then
          rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        ElseIf randchecker = 3 Then
          rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        ElseIf randchecker = 4 Then
          rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        Else
          rand = Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97)) & Chr$(Int(Rnd() * 26 + 97))
        End If
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
     defchrand = Int(Rnd * 2) + 1
     If defchrand = 1 Then
       sette = "%" & Setter(1) & "%" & "%" & Setter(2) & "%" & "%" & Setter(3) & "%"
     Else
       sette = "%" & defrand & "%"
     End If
     .Text = .Text & sette & " " & rand & "=" & Chr$(Int(Rnd() * 26 + 97)) & Chr(Int(Rnd() * 26 + 97)) & Chr(Int(Rnd() * 26 + 97)) & Chr$(13) + Chr$(10)
     trasha = Int(Rnd * 4) + 1
     If trasha = 1 Then Call trash
     .Text = .Text & sette & " " & rand & "=" & Chr$(chars(i)) & Chr$(13) + Chr$(10)   'The true statment
     trasha = Int(Rnd * 4) + 1
     If trasha = 1 Then Call trash
     .Text = .Text & "goto " & rand & Chr$(13) + Chr$(10)
     trasha = Int(Rnd * 4) + 1
     If trasha = 1 Then Call trash
     .Text = .Text & sette & " " & " " & rand & "=" & Chr$(Int(Rnd() * 26 + 97)) & Chr(Int(Rnd() * 26 + 97)) & Chr$(13) + Chr$(10)
     trasha = Int(Rnd * 4) + 1
     If trasha = 1 Then Call trash
     .Text = .Text & ":" & rand & Chr$(13) + Chr$(10)
    End With
  End If
Next i
'definitions made; now we can encrypt
cmdEncrypt.Enabled = True
End Sub

Sub trash()
With txtDefs
  Number = Int(Rnd * 40) + 10
  Do While a < Number
    b = Int(Rnd * 26) + 97
    c = c + Chr(b)
    a = a + 1
  Loop
  .Text = .Text + c + Chr(13) & Chr(10)
End With
End Sub

Sub findletters()
With txtBatch
charscount = 1
checkvar = 1
  For i = 1 To Len(.Text)
    If Asc(Mid(.Text, i, 1)) < 123 And Asc(Mid(.Text, i, 1)) > 96 Then
      For j = 1 To 27
        If Asc(Mid(.Text, i, 1)) = chars(j) Then checkvar = 0
      Next
      If checkvar = 1 Then
        chars(charscount) = Asc(Mid(.Text, i, 1))
        charscount = charscount + 1
      End If
    End If
  Next
End With
End Sub

Private Sub cmdHelp_Click()
'just a msgbox... interesting? eh?
MsgBox "Batch Encrpyt - Version 2.0" & Chr$(13) + Chr$(10) & _
       "Coded By Tim Strazzere for Diablo3k (http://www.diablo3k.net/)" & Chr$(13) + Chr$(10) & _
       "Coded since version 1.2 by Second Part To Hell {www.spth.de.vu ~~ spth@aonmail.at}" & Chr(10) & Chr(13) & Chr(10) & Chr(13) & _
       "How do you use it?" & Chr$(13) + Chr$(10) & _
       "First off, load your batch file using the 'Load' button, or paste it into the text box deemed for it. " & Chr$(13) + Chr$(10) & _
       "Next, generate the definitions for the letters, do this by pressing the 'Generate Defs.' button," & Chr$(13) + Chr$(10) & _
       "if you deem these definitions acceptable then continue, otherwise reclick until your satisfied." & Chr$(13) + Chr$(10) & _
       "Then click the 'Encrypt .bat' button. This will then generated the encrypted batch file in the" & Chr$(13) + Chr$(10) & _
       "third text box, which is clearly marked. Now you can copy the code using the Copy Code button " & Chr$(13) + Chr$(10) & Chr$(13) + Chr$(10) & _
       "*NOTE: ONLY LOWERCASE CHARACTERS WILL BE CONVERTED, SYMBOLS AND UPPERCASE" & Chr$(13) + Chr$(10) & _
       "SHOULD BE RESERVED FOR VARIABLE NAMES! (i.e. - %WINPATH% will not be" & Chr$(13) + Chr$(10) & _
       "though in %winpath%, winpath would be converted - creating an error)"
MsgBox "For more indepth information and help consult the Read Me (which should" & Chr$(13) + Chr$(10) & _
       "be read prior to sending a bug report or e-mail for help)"
End Sub

Private Sub cmdShouts_Click()
'just a msgbox... interesting? eh?
MsgBox "Tim Strazzere:" & Chr(10) & Chr(13) & _
       "Ok, first off a huge thanks to Second Part To Hell for giving me the idea and the knowledge." & Chr$(13) + Chr$(10) & _
       "Second i'd like to thank everyone at Diablo3k (http://www.diablo3k.net) especially" & Chr$(13) + Chr$(10) & _
       "Crystal Meth for being the coolest kid and mantaining the site (when it's not 99%" & Chr$(13) + Chr$(10) & _
       "completed but nothings done on it!) Also to Assassin007 for having the sick web site" & Chr$(13) + Chr$(10) & _
       " up so i could find SPTH's artical. Other than that - i don't really have any" & Chr$(13) + Chr$(10) & _
       " shouts... well except for Zoom32, the damn cool phili-virus writer and all of the rrlf " & Chr$(13) + Chr$(10) & _
       "(http://www.rrlf.de) - also keep the scene alive, and if i forgot you e-mail me and" & Chr$(13) + Chr$(10) & _
       "you'll be added in the final version!"

MsgBox "Second Part To Hell:" + Chr(10) + Chr(13) & _
       "I just want to thank Tim Strazzere for 2 things: First, that he made this program, and second," + Chr(10) + Chr(13) & _
       "that he let me make new versions ;)! I also want to thank VorteX for giving me the idea of" + Chr(10) + Chr(13) & _
       "Special Character Encrypting (some time ago in MSN). My greets goes to everyone in rRlf, to Worf, herm1t, AlcoPaul, Gigabyte" + Chr(10) + Chr(13) & _
       "Necronomikron, malfunction and every else I forgot... And a big " + Chr(34) + "FUCK YOU" + Chr(34) + " goes to " + Chr(13) + Chr(10) & _
       "Joerg Haider and Wolfgang Schuessel!!!"
End Sub

Private Sub Form_Load()
Randomize 'must be for random numbers
txtDefs.Locked = True 'disable the editing of the text box
txtEncrypted.Locked = True 'disable the editing of the text box
cmdEncrypt.Enabled = False 'You'll get an error if the user encrypt's without definitions
End Sub

