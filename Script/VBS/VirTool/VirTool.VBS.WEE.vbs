'Weird VBS Encryption Engine
CrLf=Chr(13)&Chr(10)
M1="ENTER THE FULL PATH OF YOUR"&CrLf
M2="SCRIPT FILE TO BE ENCRYPTED:"
Title="Weird VBS Encryption Engine":SFN=InputBox(M1&M2,Title)
If SFN="" then Wscript.Quit
M1="ENTER THE FULL PATH OF YOUR"&CrLf
M2="ENCRYPTED SCRIPT FILE:"
NSF=InputBox(M1&M2,Title)
If NSF="" then Wscript.Quit
Randomize
RN=200+Int(Rnd*30)+1
RL1=Chr(Int(Rnd*26)+65)
RL2=Chr(Int(Rnd*26)+65)&Chr(Int(Rnd*26)+65)&Chr(Int(Rnd*26)+65)&Chr(Int(Rnd*26)+65)
RL3=Chr(Int(Rnd*26)+65)
Set FSO=CreateObject("Scripting.FileSystemObject")
Set OSF=FSO.OpenTextFile(SFN,1)
Set CSF=FSO.CreateTextFile(NSF,True)
Do
CSF.WriteLine "Execute "&RL1&"("&Chr(34)&WEE(OSF.ReadLine)&Chr(34)&")"
Loop While OSF.AtEndOfLine <> True
CSF.WriteLine "Function "&RL1&"("&RL2&")"
CSF.WriteLine "For "&RL3&"=1 to Len("&RL2&")"
CSF.WriteLine RL1&"="&RL1&"&Chr(Asc(Mid("&RL2&","&RL3&",1))Xor "&RN&")"
CSF.WriteLine "Next"
CSF.WriteLine "End Function"
CSF.Close
OSF.Close
MsgBox "THE SCRIPT FILE: "&SFN&" HAS BEEN ENCRYPTED TO THE SCRIPT FILE: "&NSF,0,Title
Function WEE(Line)
For N=1 to Len(Line)
WEE=WEE&Chr(Asc(Mid(Line,N,1))Xor RN)
Next
End Function