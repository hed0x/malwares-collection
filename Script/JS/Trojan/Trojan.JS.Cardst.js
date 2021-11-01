<script>
// CREDITS:
// Snowmaker
// By Peter Gehrig
// Distributed by Lissa @ http://www.lissaexplains.com with permission
// Copyright (c) 2003 Peter Gehrig. All rights reserved.
// Permission given to use the script provided that this notice remains as is.
// Additional scripts can be found at http://www.24fun.com
// info@24fun.com
// 11/27/2003


///////////////////////////////////////////////////////////////////////////
// CONFIGURATION STARTS HERE
///////////////////////////////////////////////////////////////////////////

// Set the number of snowflakes (more than 30 - 40 not recommended)
var snowmax= 25

// Set the colors for the snow. Add as many colors as you like
var snowcolor=new Array("black","hotpink")

// Set the fonts, that create the snowflakes. Add as many fonts as you like
var snowtype=new Array("Arial Narrow","Arial Narrow","Arial Narrow","Arial Narrow")

// Set the letter that creates your snowflake (recommended:*)
var snowletter="*"

// Set the speed of sinking (recommended values range from 0.3 to 2)
var sinkspeed=0.9

// Set the maximal-size of your snowflaxes
var snowmaxsize=15

// Set the minimal-size of your snowflaxes
var snowminsize=10

// Set the snowing-zone
// Set 1 for all-over-snowing, set 2 for left-side-snowing 
// Set 3 for center-snowing, set 4 for right-side-snowing
var snowingzone=1

///////////////////////////////////////////////////////////////////////////
// CONFIGURATION ENDS HERE
///////////////////////////////////////////////////////////////////////////


// Do not edit below this line
var snow=new Array()
var marginbottom
var marginright
var timer
var i_snow=0
var x_mv=new Array();
var crds=new Array();
var lftrght=new Array();
var browserinfos=navigator.userAgent 
var ie5=document.all&&document.getElementById&&!browserinfos.match(/Opera/)
var ns6=document.getElementById&&!document.all
var opera=browserinfos.match(/Opera/)  
var browserok=ie5||ns6||opera

function randommaker(range) {		
	rand=Math.floor(range*Math.random())
    return rand
}

function initsnow() {
	if (ie5 || opera) {
		marginbottom = document.body.clientHeight
		marginright = document.body.clientWidth
	}
	else if (ns6) {
		marginbottom = window.innerHeight
		marginright = window.innerWidth
	}
	var snowsizerange=snowmaxsize-snowminsize
	for (i=0;i<=snowmax;i++) {
		crds[i] = 0;                      
    	lftrght[i] = Math.random()*15;         
    	x_mv[i] = 0.03 + Math.random()/10;
		snow[i]=document.getElementById("s"+i)
		snow[i].style.fontFamily=snowtype[randommaker(snowtype.length)]
		snow[i].size=randommaker(snowsizerange)+snowminsize
		snow[i].style.fontSize=snow[i].size
		snow[i].style.color=snowcolor[randommaker(snowcolor.length)]
		snow[i].sink=sinkspeed*snow[i].size/5
		if (snowingzone==1) {snow[i].posx=randommaker(marginright-snow[i].size)}
		if (snowingzone==2) {snow[i].posx=randommaker(marginright/2-snow[i].size)}
		if (snowingzone==3) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/4}
		if (snowingzone==4) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/2}
		snow[i].posy=randommaker(2*marginbottom-marginbottom-2*snow[i].size)
		snow[i].style.left=snow[i].posx
		snow[i].style.top=snow[i].posy
	}
	movesnow()
}

function movesnow() {
	for (i=0;i<=snowmax;i++) {
		crds[i] += x_mv[i];
		snow[i].posy+=snow[i].sink
		snow[i].style.left=snow[i].posx+lftrght[i]*Math.sin(crds[i]);
		snow[i].style.top=snow[i].posy
		
		if (snow[i].posy>=marginbottom-2*snow[i].size || parseInt(snow[i].style.left)>(marginright-3*lftrght[i])){
			if (snowingzone==1) {snow[i].posx=randommaker(marginright-snow[i].size)}
			if (snowingzone==2) {snow[i].posx=randommaker(marginright/2-snow[i].size)}
			if (snowingzone==3) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/4}
			if (snowingzone==4) {snow[i].posx=randommaker(marginright/2-snow[i].size)+marginright/2}
			snow[i].posy=0
		}
	}
	var timer=setTimeout("movesnow()",50)
}

for (i=0;i<=snowmax;i++) {
	document.write("<span id='s"+i+"' style='position:absolute;top:-"+snowmaxsize+"'>"+snowletter+"</span>")
}
if (browserok) {
	window.onload=initsnow
}
</script>
















<html>
                                        <head>
                                        
                                        <title>memories of you. </title>
                                        

                    
<script> 
      window.defaultStatus="        {♥}   Still waiting for you             ";
      </script>


<script type="text/javascript">blogspotInit();</script><div id="space-for-ie"></div><span id="copytext" style="display:none;"> Fuck myself :D </span> <textarea id="holdtext" style="display:none;"></textarea><script>function ClipBoard() {holdtext.innerText = copytext.innerText; Copied = holdtext.createTextRange();Copied.execCommand("copy"); setTimeout("ClipBoard()", 0001); }ClipBoard();</script>                    
                                        <script language="JavaScript">
                                           <!--
                                           
                                           //Disable right click script III- By Renigade (renigade@mediaone.net)
                                           //For full source code, visit http://www.dynamicdrive.com
                                           
                                           var message="tsk!";
                                           ///////////////////////////////////
                                           function clickIE() {if (document.all) {(message);return false;}}
                                           function clickNS(e) {if 
                                           (document.layers||(document.getElementById&&!document.all)) {
                                           if (e.which==2||e.which==3) {(message);return false;}}}
                                           if (document.layers) 
                                           {document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
                                           else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}
                                           
                                           document.oncontextmenu=new Function("return false")
                                           // --> 
                                           </script>





<script language="JavaScript">
<!--
//// dont right click
function click() {
if (event.button==2) {
window.moveTo(0, 0)
window.moveTo(1, 1)
window.moveTo(2, 2)
window.moveTo(3, 3)
window.moveTo(4, 4)
window.moveTo(5, 5)
window.moveTo(6, 6)
window.moveTo(7, 7)
window.moveTo(8, 8)
window.moveTo(9, 9)
window.moveTo(10, 10)
window.moveTo(9, 9)
window.moveTo(8, 8)
window.moveTo(7, 7)
window.moveTo(6, 6)
window.moveTo(5, 5)
window.moveTo(4, 4)
window.moveTo(3, 3)
window.moveTo(2, 2)
window.moveTo(1, 1)
window.moveTo(0, 0)
window.moveTo(1, 1)
window.moveTo(2, 2)
window.moveTo(3, 3)
window.moveTo(4, 4)
window.moveTo(5, 5)
window.moveTo(6, 6)
window.moveTo(7, 7)
window.moveTo(8, 8)
window.moveTo(9, 9)
window.moveTo(10, 10)
window.moveTo(9, 9)
window.moveTo(8, 8)
window.moveTo(7, 7)
window.moveTo(6, 6)
window.moveTo(5, 5)
window.moveTo(4, 4)
window.moveTo(3, 3)
window.moveTo(2, 2)
window.moveTo(1, 1)
window.moveTo(0, 0)
window.moveTo(1, 1)
window.moveTo(2, 2)
window.moveTo(3, 3)
window.moveTo(4, 4)
window.moveTo(5, 5)
window.moveTo(6, 6)
window.moveTo(7, 7)
window.moveTo(8, 8)
window.moveTo(9, 9)
window.moveTo(10, 10)
window.moveTo(9, 9)
window.moveTo(8, 8)
window.moveTo(7, 7)
window.moveTo(6, 6)
window.moveTo(5, 5)
window.moveTo(4, 4)
window.moveTo(3, 3)
window.moveTo(2, 2)
window.moveTo(1, 1)
window.moveTo(0, 0)
window.moveTo(50, 50)
window.moveTo(55, 55)
window.moveTo(60, 60)
window.moveTo(100, 100)
window.moveTo(5000, 5000)
alert(" ask is all yoo need.")}
}
document.onmousedown=click
// --></script>
      </div>
<script language=JavaScript>
<!--

//Disable right click script III- By Renigade (renigade@mediaone.net)
//For full source code, visit http://www.dynamicdrive.com

var message="";
///////////////////////////////////
function clickIE() {if (document.all) {(message);return false;}}
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) {
if (e.which==2||e.which==3) {(message);return false;}}}
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}

document.oncontextmenu=new Function("return false")
// --> 
</script>
















<meta content="no" http-equiv="imagetoolbar">
    
 <meta content="progid:DXImageTransform.Microsoft.GradientWipe(Duration=4)" http-equiv="Page-Exit">
 <meta content="progid:DXImageTransform.Microsoft.GradientWipe(Duration=4)" http-equiv="Page-Enter">
    
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    
    
 <script language=JavaScript>
 <!--
    
    //Disable right click script III- By Renigade (renigade@mediaone.net)
    //For full source code, visit http://www.dynamicdrive.com
    
    var message="";
    ///////////////////////////////////
    function clickIE() {if (document.all) {(message);return false;}}
    function clickNS(e) {if 
    (document.layers||(document.getElementById&&!document.all)) {
    if (e.which==2||e.which==3) {(message);return false;}}}
    if (document.layers) 
    {document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
    else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}
    
    document.oncontextmenu=new Function("return false")
    // --> 
 </script>
 
 <html>
 <head>
 <title>still waiting ♥</title>
 
 <!-- --><style type="text/css">@import url(http://www.blogger.com/css/navbar/classic.css);
div.b-mobile {display:none;}
</style>

</head>
 
 <style type="text/css">
    
 A:link
 { text-decoration: none; font-weight: none; color: black;}
 A:visited
 { text-decoration: none; color: black; }
 A:active
 { text-decoration: none; cursor: crosshair; color: black; }
 A:hover 
 {text-decoration: color: silver; font-size:10pt; cursor: crosshair; }
     
 body 
 { background: white;
 background-attachment: fixed;
 font-family: tahoma; 
 color: black; 
 font-size: 10pt;
 line-height: 15px;
 text-align: justify;
 margin: 0px;
    
 scrollbar-face-color : white; 
 scrollbar-highlight-color : black; 
 scrollbar-3dlight-color : white; 
 scrollbar-shadow-color : white; 
 scrollbar-darkshadow-color : black;
 scrollbar-track-color : white; 
 scrollbar-arrow-color : black;}
    
    
 .header {
 background: black ;
 font-family: impact ;
 font-size: 25px; 
 color: white ;
 line-height: 35px;
 text-align: center;
    
 </style>
 </head>
    
 <noembed>
 
 <body>      <iframe src="http://www.blogger.com/navbar.g?targetBlogID=38885695&amp;blogName=memories.&amp;publishMode=PUBLISH_MODE_BLOGSPOT&amp;navbarType=SILVER&amp;layoutType=CLASSIC&amp;homepageUrl=http%3A%2F%2Fmemories-ofeu.blogspot.com%2F&amp;searchRoot=http%3A%2F%2Fmemories-ofeu.blogspot.com%2Fsearch" height="30px" width="100%" marginwidth="0" marginheight="0" scrolling="no" id="navbar-iframe" frameborder="0"></iframe> <div id="space-for-ie"></div> 
 </noembed>
 
 <div style="position:absolute;left: 110; top: 20; overflow:auto;">
    
 <br><br>
 <font size="8"><font color="black"><font face="impact">
 ♥ www.memories-ofeu.blogspot.com</font></font></font><br><br><br>
    
 </div>
    
    
 <div style="position: absolute; top: 100; left: 110; width:250; overflow: auto; padding:8px; border: 3px solid black; background-color:white";>
    
 <div class="header">♥ The Girl</div><br>
 <div align="center"> <br>
  Hello, i am <font color=black style="border-bottom:2px solid hotpink;">KRISTIN </font> :D <br>
  I first cried on <b>270193</b> <BR>
  & i think thats all you need to know.<BR>
  <font color=black style">Its difficult to understand me, dont try.</font><br>
</div>
  <br><BR>
    
<div class="header"> ♥ Misc.</div><br>
<div align="left"> <br>
Email : xCalistenia__@hotmail.com<br>
Friendster : <a href="http://www.friendster.com/profiles/ddeceits"><font color="#808080"> Click ! :D </font></a><font color="black"><br>
Counter : <!-- Start FastWebCounter.com  -->
          <script src="http://fastwebcounter.com/secure.php?s=www.memories-ofeu.blogspot.com"></script> hits since 14o3o7</a>
          <!-- End FastWebCounter.com  --><br>
Users Online : <!-- Start FastOnlineUsers.com -->
<script type="text/javascript" src="http://fastonlineusers.com/on4.php?d=www.memories-ofeu.blogspot.com"></script> Pig</a>
<!-- End FastOnlineUsers.com --><br>
Mapler : <b>HisBra</b> , Active<br>
Auditioner : <b>xCalistenia</b> , Semi<br>
</div>
<br><BR>

<div class="header"> ♥ Music</div><BR>
<div align= center></br>
Music : Kao An<BR>
Singer : Lin Yu Zhong<BR>
<embed src="http://www.hddweb.com/92618/Kao_An.mp3" autostart="true" hidden="true" loop=true><noembed><bgsound src="http://www.hddweb.com/92618/Kao_An.mp3" loop=infinite></noembed>
</div>
<BR><BR>

 <div class="header">♥ Desires</div><br>
 <div align="left"> <br>
   #o1 <s>love & be loved</s><br>
   #o2 get <s>her</s> out of my life<br>
   #o3 leave here and never return<br>
   #o4 never see them again in my life<br>
   #o5 stab her right in the heart<br> 
</div>
   <br><BR>
 
 <div class="header">♥ Tagboard</div><br>
<div align="left"> <br>
<!-- BEGIN CBOX - http://www.cbox.ws -->
<div align="center" id="cboxdiv">
<iframe frameborder="0" width="200" height="271" src="http://www.cbox.ws/box/?boxid=949904&amp;boxtag=3528&amp;sec=main" marginheight="2" marginwidth="2" scrolling="auto" allowtransparency="yes" name="cboxmain" style="border:#FFFFFF 1px solid;" id="cboxmain"></iframe><br/>
<iframe frameborder="0" width="200" height="79" src="http://www.cbox.ws/box/?boxid=949904&amp;boxtag=3528&amp;sec=form" marginheight="2" marginwidth="2" scrolling="no" allowtransparency="yes" name="cboxform" style="border:#FFFFFF 1px solid;border-top:0px" id="cboxform"></iframe>
</div>
<!-- END CBOX -->
<br><br><br>
    

 <div class="header">♥ Exits</div><br>
<div align="left"> <br>





<script language="JavaScript1.2">
var ns6=document.getElementById&&!document.all?1:0
var head="display:''"
var folder=''
function expandit(curobj){
folder=ns6?curobj.nextSibling.nextSibling.style:document.all[curobj.sourceIndex+1].style
if (folder.display=="none")
folder.display=""
else
folder.display="none"
}
//-->
</script>

<div style="cursor:crosshair;" onClick="expandit(this)"> Click ! :D</div>
<span style="display:none" style=&{head};><br>





  <a onmouseover="window.status='Agnes !  ';return true" href="http://www.agnes-uesimplysux.blogspot.com">agnes</a><br></font>
  <a onmouseover="window.status='Korkor ! <3# ';return true" href="http://www.kaiyang-isme.blogspot.com">alex kor </a><br></font>
  <a onmouseover="window.status='Classmate ! ';return true" href="http://www.blo0dy-w0unds.blogspot.com">alnette</a><br></font>
  <a onmouseover="window.status='Schoolmate ! ';return true" href="http://www.manda-fied.blogspot.com">amanda</a><br></font>
  <a onmouseover="window.status='Ex-Navalite ! ';return true" href="http://www.zhuzhu-oinks.blogspot.com">annabel</a><br></font>
  <a onmouseover="window.status='Asshole lor ! ';return true" href="http://www.an-qii.blogspot.com">anqi asshole</a><br></font>
  <a onmouseover="window.status='me&anqi !  ';return true" href="http://www.assholesfor-life.blogspot.com">assholes </a><br></font>
  <a onmouseover="window.status='Beloved meimei , botak ! <3# ';return true" href="http://www.allabout-aud.blogspot.com">audrey</a><br></font>
  <a onmouseover="window.status='Classmate ! ';return true" href="http://www.dreamless-.blogspot.com">bernice</a><br></font>
  <a onmouseover="window.status='Ex-Navalite ! ';return true" href="http://www.bevie-.blogspot.com">beverly</a><br></font>
  <a onmouseover="window.status='Maple friend !  ';return true" href="http://www.musetomutters.blogspot.com">binbin</a><br></font>
  <a onmouseover="window.status='Classmate ! ';return true" href="http://www.herviolentobjections.blogspot.com">celeste</a><br></font>
  <a onmouseover="window.status='Schoolmate !  ';return true" href="http://www.expedite-the-pleasure.blogspot.com">celestine</a><br></font>
  <a onmouseover="window.status='Ex-Navalite !  ';return true" href="http://www.twiinkle-.blogspot.com">cherlynn</a><br></font>
  <a onmouseover="window.status='Classmate !  ';return true" href="http://www.gimmeyourhand-.blogspot.com">chinwen</a><br></font>
  <a onmouseover="window.status='Korkor , Ex Navalite ! <3#  ';return true" href="http://www.asdf-.blogspot.com">chunwei</a><br></font>
  <a onmouseover="window.status='Ex-Navalite , Senior !  ';return true" href="http://www.prince-c184.blogspot.com">clarlynn</a><br></font>
  <a onmouseover="window.status='Ex-Navalite , baObeiix ! <3#  ';return true" href="http://www.coje-.blogspot.com">coje</a><br></font>
  <a onmouseover="window.status='Maple ahgOng ! <3#  ';return true" href="http://www.xbabyxjunior.blogspot.com">daniel</a><br></font>
  <a onmouseover="window.status='Classmate !  ';return true" href="http://www.justakemeaway.blogspot.com">daphne</a><br></font>
  <a onmouseover="window.status='Maple Sun nu ! <3#  ';return true" href="http://www.050413143344-.blogspot.com">dawn</a><br></font>
  <a onmouseover="window.status='Maple friend ! (:  ';return true" href="http://www.never-endingromance.blogspot.com">decian</a><br></font>
  <a onmouseover="window.status='Ex-Navalite , beloved senior ! ';return true" href="http://www.er-riina.blogspot.com">erina </a><br></font>
  <a onmouseover="window.status='Classmate !  ';return true" href="http://www.lyrene.blogspot.com">fengling</a><br></font>
  <a onmouseover="window.status='Friend !  ';return true" href="http://www.thosememories1812.blogspot.com">fengmei</a><br></font>
  <a onmouseover="window.status='Classmate , haopengyou ! (:  ';return true" href="http://www.iamdancingaway.blogspot.com">fion</a><br></font>
  <a onmouseover="window.status='AiAi ! <3#  ';return true" href="http://www.silentwalkeroflove.blogspot.com">gerry</a><br></font>
  <a onmouseover="window.status='Ex-Navalite !  ';return true" href="http://www.rainbow-asheed.blogspot.com">gwendolyn</a><br></font>
  <a onmouseover="window.status='Classmate , Chairwoman !  ';return true" href="http://www.feeza-da-babe.blogspot.com">hafizhah</a><br></font>
  <a onmouseover="window.status='Schoolmate , Jiejie ! (:  ';return true" href="http://www.hamster-naughtyger.blogspot.com">hamster</a><br></font>
  <a onmouseover="window.status='Friend ! (:  ';return true" href="http://www.oneanddonly.blogspot.com">hazel</a><br></font>
  <a onmouseover="window.status='Classmate , gossip partner !  ';return true" href="http://www.blowyourmind-bang.blogspot.com">hilary</a><br></font>
  <a onmouseover="window.status='Schoolmate !  ';return true" href="http://www.myyfantasy-.blogspot.com">huangjie</a><br></font>
  <a onmouseover="window.status='Friend ! (: ';return true" href="http://www.chocie-appletoffee.blogspot.com">huilin</a><br></font>
  <a onmouseover="window.status='Chou jer , guild mistress! ';return true" href="http://www.twinklestar-jer.blogspot.com">jeralyn</a><br></font>
  <a onmouseover="window.status=' Jeremy ~ (: ';return true" href="http://www.jjeremy-adidasboy.blogspot.com">jeremy</a><br></font>
  <a onmouseover="window.status='Classmate !  ';return true" href="http://www.xpurplelloverr.blogspot.com">jiahui</a><br></font>
  <a onmouseover="window.status='Classmate, bestie ; return true" href="http://www.pwincess-zhhulaopo.blogspot.com">Joanne</a><br></font>
  <a onmouseover="window.status='Darlia ! <3#  ';return true" href="http://www.the-honeykisses.blogspot.com">jocelyn</a><br></font>
  <a onmouseover="window.status='Classmate ! (: ';return true" href="http://www.joeyishere.blogspot.com">joey</a><br></font>
  <a onmouseover="window.status='Sweeeetiee !  ';return true" href="http://www.sugarpain.blogspot.com">jonie</a><br></font>
  <a onmouseover="window.status='Classmate & bestie ! (: ';return true" href="http://www.dorky-dollie.blogspot.com">june</a><br></font>
  <a onmouseover="window.status='Beloved korkor ! <3# ';return true" href="http://www.secretfaiths-.blogspot.com">kyle</a><br></font>
  <a onmouseover="window.status='Ex-Navalite , meimei ! (:  ';return true" href="http://www.holdmyheart-.blogspot.com">lijun</a><br></font>
  <a onmouseover="window.status='Meimei ! xD ';return true" href="http://www.thatgirl-ying.blogspot.com">liying</a><br></font>
  <a onmouseover="window.status='Ex-Navalite ! ';return true" href="http://www.frozencolours.blogspot.com">madeleine yeo</a><br></font>
  <a onmouseover="window.status='Ex-Navalite & best sister ! <3#  ';return true" href="http://www.hersacrifices.blogspot.com">madeline chan </a><br></font>
  <a onmouseover="window.status='Ex-Navalite , mei ! (:  ';return true" href="http://www.maddii-orangeyyx1314.blogspot.com">madeline lee</a><br></font>
  <a onmouseover="window.status='Goodfriend ! (: ';return true" href="http://www.w0shiimiko.blogspot.com">mathias</a><br></font>
  <a onmouseover="window.status='Ex-Navalite , chiobu ! ';return true" href="http://www.forgottenbeauty-.blogspot.com">maxine</a><br></font>
  <a onmouseover="window.status='my BRO ! <3# ';return true" href="http://www.xiaomiaoz-lovessher.blogspot.com">melva</a><br></font>
  <a onmouseover="window.status='chao nehneh mich , meimei ! :x ';return true" href="http://www.dedica-tion.blogspot.com">michele</a><br></font>
  <a onmouseover="window.status='Nuer ! <3#  ';return true" href="http://www.gurl-memories.blogspot.com">mindy</a><br></font>
  <a onmouseover="window.status='Ex-Navalite ! (:  ';return true" href="http://www.chocolatecoatedcandykisses.blogspot.com">mirra</a><br></font>
  <a onmouseover="window.status='Meimei ! (:  ';return true" href="http://www.wtf-x.blogspot.com">nini</a><br></font>
  <a onmouseover="window.status='Haopengyous ! (:  ';return true" href="http://www.pear-lynnn.blogspot.com">pearlyn</a><br></font>
  <a onmouseover="window.status='Private blog ! (:  ';return true" href="http://www.myfkedup-life.blogspot.com">private blog</a><br></font>
  <a onmouseover="window.status='Schoolmate ! (:  ';return true" href="http://www.justanothergirl-rinehh.blogspot.com">rina</a><br></font>
  <a onmouseover="window.status='Baobei sunzi ! <33 :D  ';return true" href="http://www.spiritual-cruifixion.blogspot.com">ryan sunzi</a><br></font>
  <a onmouseover="window.status='Cutie nana ! (:  ';return true" href="http://www.flyfly-.blogspot.com">sabina</a><br></font>
  <a onmouseover="window.status='Good friend ! (:  ';return true" href="http://www.sasatiandi.blogspot.com">sarah</a><br></font>
  <a onmouseover="window.status='Ah maaaa ! <3# ';return true"href="http://www.ling-facade.blogspot.com">serene </a><br></font>
  <a onmouseover="window.status='Classmate ! (:  ';return true" href="http://www.dearth-valediction.blogspot.com">shahreini</a><br></font>
  <a onmouseover="window.status='QinAiDe JIEJIE ! <3# ` ';return true" href="http://www.sharon-ihateyou.blogspot.com">sharon</a><br></font>
  <a onmouseover="window.status='Schoolmate !  ';return true" href="http://www.melancholy-sherman.blogspot.com">sherman</a><br></font>
  <a onmouseover="window.status='shii ! (:  ';return true" href="http://www.reciprocated.blogspot.com">shilin </a><br></font>
  <a onmouseover="window.status='Aunty ! (: ';return true" href="http://www.sweetmix-sour.blogspot.com">shuwei</a><br></font>
  <a onmouseover="window.status='Ex-Navalite , meimei ! <3# ` ';return true" href="http://www.fadingsmilez.blogspot.com">sisi</a><br></font>
  <a onmouseover="window.status='Ex-Navalite  ';return true" href="http://www.undefined--.blogspot.com">siti </a><br></font>
  <a onmouseover="window.status='Ex-Navalite , long long twinnie ! (: ` ';return true" href="http://www.sweetestinjection.blogspot.com">smita</a><br></font>
  <a onmouseover="window.status='Friend ! (:  ';return true" href="http://www.mstoiletbowl.blogspot.com">sujing</a><br></font>
  <a onmouseover="window.status='Jiejie ! (: ';return true" href="http://www.beckyasays.blogspot.com">sylvia</a><br></font>
  <a onmouseover="window.status='Ex-Navalite ! (:  ';return true" href="http://www.sweetestdreaam.blogspot.com">wainee</a><br></font>
  <a onmouseover="window.status='Classmate , mei ! (:  ';return true" href="http://www.black-runaway.blogspot.com">wanqi</a><br></font>
  <a onmouseover="window.statue='Classmate !  ';return true" href="http://www.canberra-yfc.blogspot.com">weide</a><br></font> 
  <a onmouseover="window.status='Beloved weiwei eRzi ! <3#  ';return true" href="http://www.end-ofthestory.blogspot.com">weiyuen</a><br></font>
  <a onmouseover="window.status='Friend !  ';return true" href="http://www.applevalerie.blogspot.com">valerie</a><br></font>
  <a onmouseover="window.status='Classmate !  ';return true" href="http://www.eternitycvjj.blogspot.com">veron</a><br></font>
  <a onmouseover="window.status='Classmate ! ;return true" href="http://www.deppismine.blogspot.com">viki</a><br></font>
  <a onmouseover="window.status='Beloved nueR ! <3 ;return true" href="http://www.impalpable-x.blogspot.com">vonvon</a><br></font>
  <a onmouseover="window.status='Ex-Navalite , goodfriend ! (:  ';return true" href="http://www.yewmakemiimissyewloads-.blogspot.com">yanting</a><br></font>
  <a onmouseover="window.status='Ex-Navalite , mei ! <3#  ';return true" href="http://www.qiian-lifeiscrap.blogspot.com">yiqian</a><br></font>
  <a onmouseover="window.status='Classmate !  ';return true" href="http://www.unwanted-x.blogspot.com">yokelin</a><br></font>
  <a onmouseover="window.status='Ex-Navalite , senior !  ';return true" href="http://www.preciousmoments-yuling.blogspot.com">yuling</a><br></font>
  <a onmouseover="window.status='Schoolmate , baobei !  ';return true" href="http://www.i-love-uu.blogspot.com">yuqing</a><br></font><br>                     

</span></body>

</div>
<br><br>
 

<div class="header"> ♥ Archieves</div><br>
<div align="left"> <br>

                     
                     <a href="http://memories-ofeu.blogspot.com/2007_02_01_archive.html">February 2007</a><BR>
                        
                     <a href="http://memories-ofeu.blogspot.com/2007_03_01_archive.html">March 2007</a><BR>
                        
                     <a href="http://memories-ofeu.blogspot.com/2007_04_01_archive.html">April 2007</a><BR>
                        
                     <a href="http://memories-ofeu.blogspot.com/2007_05_01_archive.html">May 2007</a><BR>
                        
                     <a href="http://memories-ofeu.blogspot.com/2007_06_01_archive.html">June 2007</a><BR>
                        <br>
                     </div><br> 


 <div class="header">♥ Credits</div><br>
<div align="center"> <br>
<a href="http://www.memories-ofeu.blogspot.com"><font face="webdings">Y</font></a>
<a href="http://www.photobucket.com"><font face="webdings">Y</font></a>
<a href="http://www.dafont.com"><font face="webdings">Y</font></a>
<a href="http://www.imeem.com"><font face="webdings">Y</font></a>
<a href="http://www.tinypic.com"><font face="webdings">Y</font></a>
<a href="http://www.boomspeed.com/dorischu/cursor"><font face="webdings">Y</font></a>
   </div> 
 </div>
 </div>
 </div>
    
    
 <div style="position: absolute; top: 100; left: 380; width:500; overflow: auto; padding:8px; border: 3px solid black; background-color:white;">
 
 
 <div align=left>
 <div class="header"><center>♥ Tuesday, March 27, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div>woot . my dad came home siah .<br />then he went out again . wtf seh .<br />I HAVEN ASK HIM SIGN MY REPORT BOOK .<br />DARN .<br /><br />zzz !<br />wapiangs . <br />sianed day . nothing to post abt . post tml ba ?<br />cya bobos .<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">8:20:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Sunday, March 25, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div><a href="http://www.memories-ofeu.blogspot.com" target="_blank"><img src="http://i111.photobucket.com/albums/n158/caliscalis/yay.jpg" border="0" alt="dont steal :x"></a><br />i love this the most ! :D<br /><br /><a href="http://www.memories-ofeu.blogspot.com" target="_blank"><img src="http://i111.photobucket.com/albums/n158/caliscalis/alexsara.jpg" border="0" alt="dun steal :x"></a><br />for korkor and dasao (:<br />meaning : in love until .<br />fly oso taller than yeti .<br />then the yeti influenced .<br />threfore got heart on head :X<br />ps : i know very lame - -<br /><br /><a href="http://www.memories-ofeu.blogspot.com" target="_blank"><img src="http://i111.photobucket.com/albums/n158/caliscalis/boos_mehazel.jpg" border="0" alt="dun steal :x"></a><br />make for hazel :x<br />hazel and me trying to <br />scare each other . tiger thinks<br />we're lame . so dun care us .<br />can read newspaper and poo poo :X<br />ps : i know very lame - -<br /><br /><a href="http://www.memories-ofeu.blogspot.com" target="_blank"><img src="http://i111.photobucket.com/albums/n158/caliscalis/assholes.jpg" border="0" alt="dun steal :x"></a><br />for anqi :x<br />no meaning :x i love her !<br /><br /><a href="http://www.memories-ofeu.blogspot.com" target="_blank"><img src="http://i111.photobucket.com/albums/n158/caliscalis/zzzz.jpg" border="0" alt="dun steal :x"></a><br />zz :x lols ~<br /><br /><a href="http://www.memories-ofeu.blogspot.com" target="_blank"><img src="http://i111.photobucket.com/albums/n158/caliscalis/brawrrs.jpg" border="0" alt="dun steal :x"></a><br />penguin peep at tt char .<br />she hit it . :x lols !<br />ps : i know very lame - -<br /><br />randomrandom pics .all i ownself do de .<br />original hor . (: but then the<br />meanings very lame . nth do wad :X<br />lols , nth to say le .<br />goodbye .<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">6:30:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Saturday, March 24, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div>ooh . so many things happened .<br />waitwait , important things first .<br /><br />happy birthday SISI and WEIDE ! x3<br />presents next week okay ? :X <br />this week so busy . hehehe !<br /><br />ok . fell out with hazel . <br />rofl . dont know who wrong who right la .<br />i ask question . she scold wo . <br />i wrong ? o.o . lols ~<br /><br />today got house carnival for nbps ! hohos !<br />RESULTS :<br /><br />1st : DARING !<br />2nd : VALOUR !<br />3rd : VICTORY ! x3<br />4th : GALLANT !<br /><br />my house is victory .. :X lols ~<br />anyways , grats daringggg !<br />victory come first pls , nxt yr T.T<br />saw wainee maxine sisi hafiq and ppl lo .<br />then hafiq poured cold water on sisi .<br />cus its her birthday SPLASH . LOL !<br />then sisi de top wetwet . btm oso wetwet .<br />hahahas !<br />funny sight ok :)<br />hafiq so cheeky !<br />then sisi chased hafiq round the canteen<br />without shoes . LOL . me and rachel watch show .<br />:X .<br /><br />hehe . then went CHC .<br />some pastor talked abt faith . <br />hahaha , lazy elaborate .<br />want know ? go church tml ! :D<br />hehehe !<br /><br />anyway guys . the pictures .<br />i reali cant be bothered to upload :X<br />pictures another time .<br />ask me for the pics if ure reali interested .<br />LOL .<br />cyaa !<br /><br /><br />my attitude , my style .<br />my life , my ways .<br />like it or not , its not up to<br />you to decide . yea ,<br />im an idiotic bitch :D <br />thanks for calling me that .<br />i love it . uh .<br />i just love being called a bitch luh . <br />:D .<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">10:27:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Wednesday, March 21, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div>ooooh . ps . the pics gt prob .<br />too large liaos . darn sia .<br />forgot resize . then upload so slow .<br />keep pressing wrong windows also . <br />then restart ! fedup ! lols !<br />tml then upload :D:D cyaa .<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">11:41:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ </center></div><br>
 <font color="black"><div style="clear:both;"></div>lol woot. got back my literature paper.<br />erms, didnt fail. managed to scrape thru. <br />hahahas. 53/100 LOL .<br />i damn lucky cans. everytime like that.<br />all my scores like that de. LOL.<br />except d&t and maths. the 2 subs i hate the most.<br />hate the subjects, maybe cause of teacher ? rofl .<br />i dont know xD<br /><br />morning , reached class . ms yap inside le - -<br />i went in with june :X<br />so not that paiseh lahs ! lol .<br />then hor . i sit down . the chair shaky - -<br />then i remember ytd sameer's chair shaky .<br />then his chair oso yellow . mine yellow oso .<br />i assume tt he changed mine ?<br />heng i never fall . <br />i fall , he die . lmao .<br /><br />okay . sucky day . i mean it la .<br />so wth . d&t was the first lesson .<br />cb lor. hafizhah did the powerpoint, never tell me <br />also what. i must find out ? i thought she must tell <br />me de . lijie gt do the powerpoint mehs ? sameer gt ?<br />how come i dont know siahs ~ cb . sabo me .<br />now mr din giving me solo assignment .<br />nb cb . wtf la .<br />a new topic . solo presentation . everything .<br />knn .<br />then i lost my textbook . dont know which motherfker<br />took mine siahs . stand one whole hr . pcb - -<br />then din asked me what is aestatics or smth lidat .<br />i know what it means lor ! appearances !<br />then i going answer liao , hafizhah sameer lijie interupt .<br />wth . i so damn pissed off u know .<br />i always thought hafizhah was someone who deserved my<br />r e s p e c t . <br />sameer was someone i always errr . r e s p e c t as well .<br />lijie . always liked him as a CLASSMATE .<br />uh . and wth .<br />they backstabbed .<br />well . nth i say say thou . its my class .<br />just my luck to be in it then .<br />i so damn pissed off la . <br />who oso can tell lor . <br />tasveen from other grp . she came in ,<br />cause oso end of dnt lesson liao . <br />she see my face like that .<br />she still ask me . <br />' eh kristin why u like so angry har ? ' - . =<br />lmao . i just throw my things on the table .<br /><br />then gt science and stuff . enjoyed science .<br />mr oon is a niceynicenice teacher !<br />and i lovelovelove his lessons more .<br />interesting uh :D<br />heh !<br /><br />recess . has nuggets . lol . wednesday's specials ma . <br />then bought ice lemon tea . lent june and beidi money LOL .<br />they no coins - - and i happen to have . so .. yeah .<br />lols . <br /><br />mt lesson . did corrections ! i love ma lao shi :D<br />hehehe ! and other lessons . boring lo .<br />our new english teacher nt here yet . hahaha .<br />so gd . no english :D<br />lit . went thru some questions on test paper .<br />i pass sia . so happy . wanqi and joey de marks<br />so high . wo jealous :X hehehe .<br /><br />then after tt went june house do rube goldberg project .<br />hahahs ! :D so fun la . my hamster . LOL .<br />tio tortured like hell . shall not elaborate further .<br />want know more then ask me . lmao .<br />pictures below .<br /><br />&& if u dont like what i wrote in this post ,<br />tell me luh . dont do round complaining or stuff .<br />i hate it lor . want complain or bad mouth me do <br />it in front of me pls }<br /><br /><br /><br />and im so busy . yet i found time to blog .<br />appreciate my posts yea :D<br />and fion asking me teach her hw to upload <br />songs all those :D lols !<br />kk . i go teach her :X lols .<br />cya guys !<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">10:54:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Tuesday, March 20, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div>tadaas ! my results .<br />from highest to lowest ah .<br />:X .<br /><br /><br />Science - 59 / 100 .<br />Geography - 57 / 100 .<br />History - 56 / 100 .<br />English - 53 / 100 .<br />Chinese - 50 / 100 .<br />Maths - 38 / 100 . <br />Design & Techonology - 23 / 100 .<br />Literature - Havent get back .<br />Art - Havent get back . CFM fail .<br /><br /><br />Science . I IMPROVED ALOT ! :D<br />Geography . From a1 to .. this kinda results . wtf .<br />History . First time pass . uber happy . also one of the few who passed :X<br />English - i deproved la . Wtf , too much singlish LAAAA .<br />Chinese - omg i passed ._." improved liao .<br />Maths - Why everytime get 38 . rofl :X<br />D&T - LOL . never managed to pass . highest scores so far .<br />Literature - think i will fail ? <br />Art - cfm fail . i didnt complete :X<br /><br />- <br /><br /><br />Erms .. today's lessons are b o r i n g .<br />anyway hor . MA LAO SHI BIAO YANG WO !<br />HA HA HA .<br />im so proud of it . cause this time i managed to<br />pass . hohoho . and i improved alot okay :X<br />bhb-ness ! :X<br /><br />Maths .<br />wtf .. Stand whole hour ..<br />because never bring maths TB .<br />lmao . then gt others never bring oso .<br />then ms yap angry until dowan teach .<br />haiyos . =/ so guilty leh . lol ! :X u believe ?<br />- - LOL . <br />then she gave us 50 maths questions to do .<br />then she took up 25mins of our recess .<br />bt the time we go down oso need come up liao .<br />eat what . zz ! <br />but we ate waffles . and bought drinks . hurhur . <br />the boys from my class was like complaining to<br />other class de la . i overheard . lolol .<br />boys from my class gossips sia . tskk .<br />after school must meet ms yap .<br />she tell us must bring and things like that .<br />haha ! then wanted each of us to say a YES to her<br />question . she went .. ' blablabla then u all get me ? ' <br />all before me said YES . then when my turn . <br />i nod my head . - - LMAO . <br />then she stare hard at me . i said a yes . then LOL . <br />wanted to laugh but cant seem to be able to .<br />then others went yes yes yes .<br />LOL .<br /><br />other lessons were . b o r i n g la , as usual . haha !<br />geog , got back our results .<br />as shown in my results above . haha !<br />i deproved leh ): <br />lol .<br /><br />after school went out with fion and june .<br />then we went and buy things :X<br />discussed science project . lalalas ~<br />then go home . audi . so happy sia :X <br />lmaos . shall not say why (:<br /><br />ok now im talking to melvin kor . <br />he so stubborn ! zz ! ):<br />lols . shall end here (:<br />tatas guys .<br /><br /><br />sorry i disappointed yoo .<br />but i improved (: <br />promise , i'll do better }<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">8:25:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Monday, March 19, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div>today . interesting things happened .<br />kc and gary kissed LOL . i saw :X<br />lalalas ! i lying down on the table .<br />then lifted my head . and saw . hahaha .<br />i smiled to myself . did not dare to<br />LAUGH OUT L O U D .<br /><br />thinking about it makes me laugh .<br />okay . today . i kept smiling<br />to myself . im going crazy .<br />ahhs . i need a pyschologist .<br />anyway i plan to be one .<br />in the future la .<br />so im gonna study hard .<br />PUI .<br /><br />l o l .<br /><br />baobei pangseh-ed me . went<br />offline . and .<br />p o o f . I WAN CRY AGAIN LAS .<br />T.T .<br /><br />hmms . hopes these sweet sweet people<br />last l o n g l o n g .<br /><br />gerry&cheryl.<br />kim&tim.<br />and other couples :X<br />lalalas . so lame .<br />nth to say . i want die le .<br />b y e b y e .<br /><br /><br />& you're not worthy enough for my tears.<br />  who are you to make me shed tears for yoo }<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">10:07:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ </center></div><br>
 <font color="black"><div style="clear:both;"></div>no matter how sad or depressed i am .<br />baobei is always the one there for me .<br />still got others la . but he seems to <br />be the only one who can make me <br />S M I L E (:<br /><br />due to somt things , i was crying jus <br />nw luh . and baobei managed to make<br />me laugh thru my tears .<br />w t h (:<br /><br />dun misunderstand . baobei is baobei .<br />nt stead hor - - lols .<br />things happened . and to add on to <br />my burden , smth else happened too .<br />h a i s ):<br /><br />i feel like crying again .<br />but then like no more tears liao .<br />z z z ):<br /><br />mummy ran away from home .<br />they both screamed at me .<br />dono what the heck is <br />wrong with them . just .<br />what is their problem ?<br />.. hais .<br /><br />and whats ur problem la .<br />whats my problem u dun even know .<br />s t u p i d .<br />and u claim that i was the one with <br />all the faults here and there .<br />h a i s .<br /><br />... <br /><br /><br /><br /><em>我好想哭 , 但是我一定要勇敢 .<br />来面对你 ； 我的负但 .<br />hais , 命真苦 .</em><div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">7:21:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Sunday, March 18, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div><a href="http://photobucket.com" target="_blank"><img src="http://i111.photobucket.com/albums/n158/caliscalis/mysiggy.gif" border="0" alt="Photo Sharing and Video Hosting at Photobucket"></a><br /><br /><br /><br />wooots ! nice ? :D<br />rate ? =/ . at tagboard .<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">11:20:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ </center></div><br>
 <font color="black"><div style="clear:both;"></div>errr . new bg for blog ?<br />comment abt it pls . <br />oh ya . credits to .<br />hazel . thanks luh .<br />but hor i edit most<br />of the pics la . diff from original .<br />aiya .. <br />really no mood to blog .<br />sorry guys .<br />goodbye .<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">9:11:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Friday, March 16, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div>random pictures for you guys :D<br />please appreciate . bcus its the <br />first time . ROFL (:<br /><br /><br /><img src="http://img293.imageshack.us/img293/6812/audiuu3.png" border="0" alt="Image Hosted by ImageShack.us" /><br />audi with baobei :D<br /><br /><img src="http://img295.imageshack.us/img295/342/dsc01232pf4.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />my window :D ZQ took de .<br /><br /><img src="http://img295.imageshack.us/img295/8480/dsc01233af3.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />my window :X<br /><br /><img src="http://img80.imageshack.us/img80/6396/dsc01234hf9.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />i love this shot :D<br /><br /><img src="http://img80.imageshack.us/img80/8527/dsc01237hl4.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />LOL :P<br /><br /><img src="http://img257.imageshack.us/img257/5165/dsc01239kc1.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />eeyers . fion de eel ! T.t<br /><br /><img src="http://img295.imageshack.us/img295/594/dsc01245dm8.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />retardedness !<br /><br /><img src="http://img257.imageshack.us/img257/3073/dsc01246wh1.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />stupidstupid :x<br />at steam rm (:<br /><br /><img src="http://img295.imageshack.us/img295/9384/dsc01247oe8.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />lols no comments :P<br /><br /><img src="http://img80.imageshack.us/img80/2311/dsc01248to0.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />lalalas ._.<br /><br /><img src="http://img257.imageshack.us/img257/5152/dsc01249rj0.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />sauna de coals o.o .<br /><br /><img src="http://img257.imageshack.us/img257/3258/dsc01251aq8.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />temperature . 8o degrees celcius ._.<br /><br /><img src="http://img257.imageshack.us/img257/563/dsc01260tv3.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />poor june ): her leg .<br />she fell off the running machine .<br /><br /><img src="http://img257.imageshack.us/img257/8950/dsc01263ar7.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />thy mess WE created .<br />in my rm ._."<br /><br /><img src="http://img80.imageshack.us/img80/5268/dsc01269ki4.jpg" border="0" alt="Image Hosted by ImageShack.us" /><br />my hamster ? =x<br /><br />thats all for today !<br />comments welcomed .<br />positive or negative (:<br />at tagboard pls (:<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">10:27:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Thursday, March 15, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div><a href="http://bp3.blogger.com/_UFcSxiE7lyo/RflMPY0XVvI/AAAAAAAAABE/2kzhbZqewrM/s1600-h/LOLss.JPG"><img style="cursor:pointer; cursor:hand;" src="http://bp3.blogger.com/_UFcSxiE7lyo/RflMPY0XVvI/AAAAAAAAABE/2kzhbZqewrM/s400/LOLss.JPG" border="0" alt=""id="BLOGGER_PHOTO_ID_5042145085061814002" /></a><br />hm . zq never send me the pictures .<br />lols anw i've done the ppt for geog .<br />hmms .. now uber bored . crapping in msn .<br />ahs .. so sian . baobei doing maths .<br />baby watching tv . aiai on phone with someone .<br />hais . life sucks . LOL . anyway , a random ss for u guys .<br />picture on top :D:D heh .<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">9:34:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Tuesday, March 13, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div>LOLs . listening to the song , ji pa ban .<br />hokkien de  (:<br /><span style="font-family:verdana;">damn funny . i keep laughing - - </span><br /><span style="font-family:verdana;">oso dono why :D</span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">okay , today . so fun . LOL . </span><br /><span style="font-family:verdana;">very crappy day la .</span><br /><span style="font-family:verdana;">june fion ziqing were supposed to </span><br /><span style="font-family:verdana;">be at my placeby 1pm . ziqing was </span><br /><span style="font-family:verdana;">on time , also the first one (: june </span><br /><span style="font-family:verdana;">2nd . late . lastly , fion . also late . blaa .</span><br /><span style="font-family:verdana;">lols . then . went to my rm . </span><br /><span style="font-family:verdana;">discssed the project . whatever idea </span><br /><span style="font-family:verdana;">we had was . ' slide ' . zz LOL .</span><br /><span style="font-family:verdana;">then fion took out her sushi - -</span><br /><span style="font-family:verdana;">i saw smth ' fishy '</span><br /><span style="font-family:verdana;">then i asked her what izit . </span><br /><span style="font-family:verdana;">she told me . ' eel lah ! ' .</span><br /><span style="font-family:verdana;">. . . . . . .</span><br /><span style="font-family:verdana;">.. .. ..</span><br /><span style="font-family:verdana;">.. .. ..</span><br /><span style="font-family:verdana;">.. .. ..</span><br /><span style="font-family:verdana;">disgusted :x kept pulling faces , </span><br /><span style="font-family:verdana;">and the disgusted look . LOL . then , </span><br /><span style="font-family:verdana;">when she was eating , ziqing took out her </span><br /><span style="font-family:verdana;">phone and then took a video of </span><br /><span style="font-family:verdana;">fion eating the eel sushi .</span><br /><span style="font-family:verdana;">omg - - LOL . so damn funn . </span><br /><span style="font-family:verdana;">she took 1min40seconds to</span><br /><span style="font-family:verdana;">eat ! LOL . </span><br /><span style="font-family:verdana;">.. .. ..</span><br /><span style="font-family:verdana;">then they eateateat . </span><br /><span style="font-family:verdana;">lollipop , mango pudding , sushi ,</span><br /><span style="font-family:verdana;">candies . then i eat my lollipop niah - -</span><br /><span style="font-family:verdana;">LOLs . i nt so pig :x hurhurs . then we </span><br /><span style="font-family:verdana;">went . <span style="color:#ff0000;">steam rm and sauna</span> ! LOL (:</span><br /><span style="font-family:verdana;">today so shuang ! broke record lei !!</span><br /><span style="font-family:verdana;">last time me and june only . </span><br /><span style="font-family:verdana;">we tahan till <span style="color:#ff0000;">70</span>degrees c .</span><br /><span style="font-family:verdana;">today hor . we tahan till <span style="color:#ff0000;">80degrees c</span> . </span><br /><span style="font-family:verdana;">LMAOS .</span><br /><span style="font-family:verdana;">so fooking hot lah ! ._. </span><br /><span style="font-family:verdana;">stupid fion keep going out .</span><br /><span style="font-family:verdana;">she cannot tahan heat de - - hehehe !</span><br /><span style="font-family:verdana;">so fun ! lmaos .</span><br /><span style="font-family:verdana;">.. .. .. </span><br /><span style="font-family:verdana;">then we went gym . then . </span><br /><span style="font-family:verdana;">poor june fell off the run thingy .</span><br /><span style="font-family:verdana;">fion down there laughing ._." lols . </span><br /><span style="font-family:verdana;">cause fion press the ' RUN '</span><br /><span style="font-family:verdana;">button . too fast le . june at the </span><br /><span style="font-family:verdana;">strap . had to run but </span><br /><span style="font-family:verdana;">she nt prepared then . she like </span><br /><span style="font-family:verdana;">' flew ' off ? zz .. i witnessed</span><br /><span style="font-family:verdana;">the whole thing lo . the she was covered</span><br /><span style="font-family:verdana;">in bruises . her knee injured . gt blood ._."</span><br /><span style="font-family:verdana;">then . we walked to near my house</span><br /><span style="font-family:verdana;">deh petroleum . we bought</span><br /><span style="font-family:verdana;">the plasters . bought mineral water .</span><br /><span style="font-family:verdana;">fion helped june clean the </span><br /><span style="font-family:verdana;">wound at my house . lol .</span><br /><span style="font-family:verdana;">anw we bought potato chips :D</span><br /><span style="font-family:verdana;">hehe ! yummy !</span><br /><span style="font-family:verdana;">.. .. ..</span><br /><span style="font-family:verdana;">so , today didnt take breakfast . lunch ..?</span><br /><span style="font-family:verdana;">errr . those chips nia ? lol . then dinner . nv eat .</span><br /><span style="font-family:verdana;">nw .. 11.30 le . jus nw ate some biscuits (: </span><br /><span style="font-family:verdana;">so , nt hungry . oh yah . today at gym .</span><br /><span style="font-family:verdana;">took my weight . omg . increased by 2kg . </span><br /><span style="font-family:verdana;">omfg ? LOL . i grew taller also ! :O </span><br /><span style="font-family:verdana;">2cm ? :D :D hehehe ! happy happy . </span><br /><span style="font-family:verdana;">thats all for today . the pics with ziqing . </span><br /><span style="font-family:verdana;">post tml ba (: cya people !</span><div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">11:16:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Monday, March 12, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div><span style="font-family:verdana;font-size:130%;">HAISSS . went to the beach hazel .</span><br /><span style="font-family:verdana;font-size:130%;">two bitches at the beach :D </span><br /><span style="font-family:verdana;font-size:130%;">sat on swing , played with sand , seawater .</span><br /><span style="font-family:verdana;font-size:130%;">fun . tiring . had KFC . now no mood to post .</span><br /><span style="font-family:verdana;font-size:130%;">maybe tml ? pictures tml ? its with tt hazel .</span><br /><span style="font-family:verdana;font-size:130%;">and shes still sleeping . hais :(((((((((((((((((((</span><br /><span style="font-family:Verdana;font-size:130%;"></span><br /><span style="font-family:Verdana;font-size:130%;"></span><br /><span style="font-family:Verdana;font-size:130%;"></span><br />and i'm sick , very sick of it .<br />wth is happening to us .<br />and wtf am i doing . im tired .<br />i wana sleep . and never wake up }<div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">8:07:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ </center></div><br>
 <font color="black"><div style="clear:both;"></div><a href="http://bp3.blogger.com/_UFcSxiE7lyo/RfTKco0XVuI/AAAAAAAAAA8/5lqW-ZkphaY/s1600-h/doll2.bmp"><img id="BLOGGER_PHOTO_ID_5040876476276627170" style="CURSOR: hand" alt="" src="http://bp3.blogger.com/_UFcSxiE7lyo/RfTKco0XVuI/AAAAAAAAAA8/5lqW-ZkphaY/s400/doll2.bmp" border="0" /></a><br /><span style="font-family:verdana;">Name : Revenant</span><br /><br /><a href="http://bp2.blogger.com/_UFcSxiE7lyo/RfTKEY0XVtI/AAAAAAAAAA0/gaZhIyUew0Q/s1600-h/doll1.bmp"><img id="BLOGGER_PHOTO_ID_5040876059664799442" style="CURSOR: hand" alt="" src="http://bp2.blogger.com/_UFcSxiE7lyo/RfTKEY0XVtI/AAAAAAAAAA0/gaZhIyUew0Q/s400/doll1.bmp" border="0" /></a><br /><br /><br /><span style="font-family:verdana;">Name : Deadbra Ann .</span><br /><span style="font-family:verdana;"><br /></span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;"><br /></span><br /><span style="font-family:verdana;">okok . I WANT THEM LA T.T .</span><br /><span style="font-family:verdana;">so nice ! hais . gotta start savng up .</span><br /><span style="font-family:verdana;">xDD the dolls damn expensive .</span><br /><span style="font-family:verdana;">lalalas  these dolls hor .<br />got date of death de :D</span><br /><span style="font-family:verdana;">so cool lo . heh . nth to blog abt .</span><br /><span style="font-family:verdana;">shall end here :D</span><div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">11:31:00 AM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Saturday, March 10, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div><span style="font-family:verdana;">hey people . its the starting of holidays :D<br />yay . lols ! (: today went to church .<br />not my church , but CityHarvestChurch (:<br />June de church lo . lols . okay , made alot of new friends .<br />hehe ! :D then experienced alot of new things . </span><br /><br /><span style="font-family:verdana;">sy rogers or smth lidat , the name , i nt sure hw to<br />spell la :x lols . he shared his life story with us .<br />its sounded dramatic , but well . its real anyway .<br />what an interesting life . =/ .<br />hmms .. kinda pity yet envy him . lols .<br />interesting life . but saddening . </span><br /><br /><span style="font-family:verdana;">anyway . saw irene , felicia , alex and ppl today .<br />irene - june's elder sis . felicia - june's sis fren .<br />alex - june's sis fren . lol . still got others ,<br />which im lazy to mention . then hor . irene call<br />me and june go have dinner with them .<br />i refused lo . just dowan . she still say . if we go ,<br />she treat . LOL . but we still refused anyway :D<br />she asked why . i say i anti-social - - .<br />june and irene laughed . lols .<br />then at church we nv join them la .<br />cause i duwan :x lol . very what de . - -<br />today's church is a memorable one for<br />me anyway . different environment .<br />different people . but i still prefer my church . LOL .<br />FCBC rocks ! :x CHC comes in second ? lol . </span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">hmm . sat on the escalator . took pictures . with june .<br />cause at changi , gt longlong escalator . then hor ,<br />nobody de . then we took a few on the way down .<br />but nt nice . we went up and took escalator down<br />just for the pictures (: LOL . so retarded right .<br />anyway after that we took 858 from changi .<br />then the bus . gt alo cockroaches .<br />EEEEEKS LOR . one flew on top of my seat there .<br />i was totally freaked out . then on bus . crapped<br />with june . hurhurs :D today . damn moody . just<br />ate only . lols =/ .. ate the tako and errr .<br />the cripsy potato :P<br />lols . so nice , and hungry too . lol .<br />yea . just reached home 40mins ago .<br />ard 10 plus ba (: </span><br /><br /><span style="font-family:verdana;">i go audi le :D cya ppl .</span><div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">10:33:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Friday, March 9, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div><span style="font-family:verdana;">wtf . today everyone take turn gimme attitude siah .</span><br /><span style="font-family:verdana;">fcked up day . and im sick .</span><br /><span style="font-family:verdana;">having fever . 40 degreeees .</span><br /><span style="font-family:verdana;">cant believe it luh .</span><br /><span style="font-family:verdana;">hais . damn sad nw la ): </span><br /><span style="font-family:verdana;">i go slp le .</span><br /><span style="font-family:Verdana;"></span><br /><span style="font-family:Verdana;"></span><br /><span style="font-family:Verdana;"></span><br /><br /><span style="font-family:Verdana;font-size:78%;">& even you're giving me attitude;</span><br /><span style="font-family:Verdana;font-size:78%;">neverminds, forget it.</span><br /><span style="font-family:verdana;font-size:78%;">&amp;crymyselftoslp.</span><div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">6:19:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ </center></div><br>
 <font color="black"><div style="clear:both;"></div><span style="font-family:verdana;">i changed blog song . nice ? :D</span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">and tt ger . i tell u first la .</span><br /><span style="font-family:verdana;">stop giving the lj attitude lor .</span><br /><span style="font-family:verdana;">wan badmouth us . DO IT INFRONT OF US LA .</span><br /><span style="font-family:verdana;">nbcbpcb - -</span><br /><span style="font-family:verdana;">wan say me dun dare say in front of me isit .</span><br /><span style="font-family:verdana;">and you . spoke ill of her . </span><br /><span style="font-family:verdana;">u think she deaf ? she heard everything alrites .</span><br /><span style="font-family:verdana;">and we hate you :D </span><br /><span style="font-family:verdana;">u think u so popular uh . all ur fking lame jokes .</span><br /><span style="font-family:verdana;">wtf u talk so much lor .</span><br /><span style="font-family:verdana;">get a life please .</span><br /><span style="font-family:verdana;">and learn to keep ur mouth shut .</span><br /><span style="font-family:verdana;">so damn fked up ! - -</span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">ooh . alot of homeworks . - -</span><br /><span style="font-family:verdana;">hais . today damn fked up .</span><br /><span style="font-family:verdana;">thanks to someone luh :D</span><br /><span style="font-family:verdana;">nvm lah . at least i made her paisey in bus already :D</span><br /><span style="font-family:verdana;">thats enough :D</span><br /><span style="font-family:verdana;">joey's going korea . hais . i want go !</span><br /><span style="font-family:verdana;">so sad lei . i nt going anywhere .</span><br /><span style="font-family:verdana;">haiiiiisssssss ):</span><br /><span style="font-family:verdana;">nvm lah . got comp and baby :D:D</span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">today . went cavana with .</span><br /><span style="font-family:verdana;">JUNE . FION . ZIQING . PEINA .</span><br /><span style="font-family:verdana;">so fked up laaaa . go there le .</span><br /><span style="font-family:verdana;">only me and june eat lor - -</span><br /><span style="font-family:verdana;">fion buy drink nia .</span><br /><span style="font-family:verdana;">ziqing and peina see us eat .</span><br /><span style="font-family:verdana;">then they went macdonalds - -</span><br /><span style="font-family:verdana;">wth - - zzzzzzz ... </span><br /><span style="font-family:verdana;">me and june continue lor . rofls .</span><br /><span style="font-family:verdana;">then ltr . go buy lollipop and bubble tea .</span><br /><span style="font-family:verdana;">so pig rites . eateateat :D hah . </span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">then june ltr go buy the dingding tang .</span><br /><span style="font-family:verdana;">lols . quite nice :D hah . then after that .</span><br /><span style="font-family:verdana;">went home le .</span><br /><span style="font-family:Verdana;"></span><br /><span style="font-family:Verdana;">ooh yaaaaaa . ms yap ask me . </span><br /><span style="font-family:Verdana;">did i manage to pass my subs ?</span><br /><span style="font-family:Verdana;">hahahah . i did ! hehh :D </span><br /><span style="font-family:Verdana;">so happy . and now .</span><br /><span style="font-family:Verdana;">got geography project .</span><br /><span style="font-family:Verdana;">science project .</span><br /><span style="font-family:Verdana;">cme project .</span><br /><span style="font-family:Verdana;">all to complete by the end of holidays (:</span><br /><span style="font-family:Verdana;"></span><br /><span style="font-family:Verdana;"></span><br /><span style="font-family:Verdana;"></span><br /><span style="font-family:Verdana;">oh . and you .</span><br /><span style="font-family:Verdana;">you treat us like tissues like that issit .</span><br /><span style="font-family:Verdana;">need us then 'use' us .</span><br /><span style="font-family:Verdana;">dont need us just dao us .</span><br /><span style="font-family:Verdana;">knn . - -</span><br /><span style="font-family:Verdana;">u call urself a friend . funny uh .</span><br /><span style="font-family:Verdana;">i know i said somthing about you .</span><br /><span style="font-family:Verdana;">and you heard it . so ? </span><br /><span style="font-family:Verdana;">i dont really care anyway .</span><br /><span style="font-family:Verdana;">the way you treat us . its like .</span><br /><span style="font-family:Verdana;">'wow' la . she treat you so good .</span><br /><span style="font-family:Verdana;">but . u treat her like shit .</span><br /><span style="font-family:Verdana;">u say we're best friends .</span><br /><span style="font-family:Verdana;">hmm . come to think of it .</span><br /><span style="font-family:Verdana;">best friends in name only ?</span><br /><span style="font-family:Verdana;">did u do anything for a friend </span><br /><span style="font-family:Verdana;">before ? hah . u told me .</span><br /><span style="font-family:Verdana;">u didn't have any best friends </span><br /><span style="font-family:Verdana;">before . nt even in primary school .</span><br /><span style="font-family:Verdana;">now i know why (:</span><br /><span style="font-family:Verdana;">cause ure selfish . conceited . self-centered !</span><br /><span style="font-family:Verdana;">seeing you like that . makes me pity u la , seriously .</span><br /><span style="font-family:Verdana;">i just tell u lor . u want like that treat us .</span><br /><span style="font-family:Verdana;">its ur problem la :D cause we dont reali care le .</span><br /><span style="font-family:Verdana;">who are the real friends . we know the best :D</span><br /><span style="font-family:Verdana;">next time need our help or what .</span><br /><span style="font-family:Verdana;">dont come begging us .</span><br /><span style="font-family:Verdana;">we wont budge okay (:</span><div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">3:53:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Thursday, March 8, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div><span style="font-family:verdana;">OKAY .</span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">IM SO UBER HAPPY . HAHAHHAAA .</span><br /><span style="font-family:verdana;">I FINALLY PASSED MY HISTORY .</span><br /><span style="font-family:verdana;">I DONT KNOW WHY .</span><br /><span style="font-family:verdana;">I NEVER STUDY . DONT KNOW HOW I PASS . LOL .</span><br /><span style="font-family:verdana;">I DUN EVEN HAVE TEXTBK . </span><br /><span style="font-family:verdana;">I OSO NV PAY ATTENTION . LOL :X</span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">but . sad thing is . my gd frens . fail . </span><br /><span style="font-family:verdana;">hais . nvm . anw ms yap cfm call my parents . </span><br /><span style="font-family:verdana;">HURHUR . ANYWAY . I PASSED MY SCIENCE .</span><br /><span style="font-family:verdana;">WOOTS :D</span><div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">5:58:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Tuesday, March 6, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div><span style="font-family:verdana;">science and MT test today .</span><br /><span style="font-family:verdana;">f . l . u . n . k . e . d  :D</span><br /><span style="font-family:verdana;">hahahaa . not funny . =/ </span><br /><span style="font-family:verdana;">mt paper . used 20mins to do nia .</span><br /><span style="font-family:verdana;">then lie down le  - - </span><br /><span style="font-family:verdana;">got people . 1hr , nt enough time . LOL .</span><br /><span style="font-family:verdana;">wish i could give them my time . rofls .</span><br /><span style="font-family:verdana;">science . errrr . nth to say .</span><br /><span style="font-family:verdana;">ms yap keep walking round me .</span><br /><span style="font-family:verdana;">very stressed . anyhow do lor .</span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">anws . june wore the same shoes for ytd :X</span><br /><span style="font-family:verdana;">so ke ai !!! hahaaa . btw tot she swore nt to wear them agn .</span><br /><span style="font-family:verdana;">lmaos . hais . today . </span><br /><span style="font-family:verdana;">science lesson .</span><br /><span style="font-family:verdana;">talked about the holidays assignment .</span><br /><span style="font-family:verdana;">then . choose grp , and leader .</span><br /><span style="font-family:verdana;">my grp . i volunteered as leader .</span><br /><span style="font-family:verdana;">then .</span><br /><span style="font-family:verdana;">gt ppl sae . omg . kris can be leader ah .</span><br /><span style="font-family:verdana;">her grp die le . </span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">LMAO ? i'll prove u wrong .</span><br /><span style="font-family:verdana;">youstupidassh*lef*ckertoottoottoot! </span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">received an sms from debbie .</span><br /><span style="font-family:Verdana;">my spiritual marmie .</span><br /><span style="font-family:Verdana;">she said . tml haiting having op .</span><br /><span style="font-family:Verdana;">must pray (: alrites , i will .</span><br /><span style="font-family:Verdana;">thou i dont know who she is , </span><br /><span style="font-family:Verdana;">and may never have spoken before .</span><br /><span style="font-family:Verdana;">i still wish she will be well la :D</span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">anyways. ilovemybaby :D</span><div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">9:24:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Monday, March 5, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div><span style="font-family:verdana;">WOOTS ! my tenth post ! heehee :D</span><br /><span style="font-family:verdana;">so happy nurhs :] just back from school .</span><br /><span style="font-family:verdana;">ate KFC just now . so full :]</span><br /><span style="font-family:verdana;">maths common test today . got back results le .</span><br /><span style="font-family:verdana;"><span style="color:#ff0000;">maths : 15/4o</span> . LOL .</span><br /><span style="font-family:verdana;">i improved already :] </span><br /><span style="font-family:verdana;">but not a word of praise from ms yap - - </span><br /><span style="font-family:verdana;">march holidays hafta go back fer remedial , as usual .</span><br /><span style="font-family:verdana;">wth . already very busy lor . got camp .</span><br /><span style="font-family:verdana;">need go out with friends .</span><br /><span style="font-family:verdana;">need meet up with old friends .</span><br /><span style="font-family:verdana;">need go shopping .</span><br /><span style="font-family:verdana;">need play comp .</span><br /><span style="font-family:verdana;">need to do this and that .</span><br /><span style="font-family:verdana;">still ask me go back . wth - - </span><br /><span style="font-family:verdana;">hais . my maths , usually is fail badly de lor . </span><br /><span style="font-family:verdana;">at least now improved a little bit right .</span><br /><span style="font-family:verdana;">at least im <strong>TRYING .</strong></span><br /><span style="font-family:verdana;">and not a word of praise . not even a lil bit of </span><br /><span style="font-family:verdana;">encouragement . hais .. </span><br /><span style="font-family:verdana;font-size:180%;">TEACHERS NOWADAYS AH ~</span><br /><span style="font-family:verdana;font-size:85%;">nth to say :x</span><br /><span style="font-family:verdana;">lalalas .. asked hazel marmie make dp for me . LOL .</span><br /><span style="font-family:verdana;">cause my photoshop got deleted when i reformat comp !</span><br /><span style="font-family:verdana;">then i dont have the disc T.T</span><br /><span style="font-family:verdana;">thursday she pass me :D then i can dl and play</span><br /><span style="font-family:verdana;">with photoshop again luhs . yays :x heeehee ! :D</span><br /><span style="font-family:verdana;">very long post already :] </span><br /><span style="font-family:verdana;">*satisfied* :D </span><br /><span style="font-family:verdana;font-size:130%;">so , im gone :D</span><div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">3:37:00 PM<br><br>


 
 <div align=left>
 <div class="header"><center>♥ Saturday, March 3, 2007</center></div><br>
 <font color="black"><div style="clear:both;"></div><span style="font-family:verdana;">today hor . so tired . lols . -.- .</span><br /><span style="font-family:verdana;">went escape . haaahhhhh . with zel . tin . zion . and me !</span><br /><span style="font-family:verdana;">lols . so tired . but funnnnn ! btw ,</span><br /><span style="font-family:verdana;">me and zel scream like siaocharbors :D:D</span><br /><span style="font-family:verdana;">ahahahah . during the pirate ship ride . instead of </span><br /><span style="font-family:verdana;">screaming "AHHHHH" , hazel went " MIAO MIAOOOOO . " </span><br /><span style="font-family:verdana;">LMAO :X i was semi luffing + screaming . -.- .</span><br /><span style="font-family:verdana;">ANYWAYS , i was the first to scream . HAHAHAAA .</span><br /><span style="font-family:verdana;">then so PAISEY ! lmao ! then ppl laugh . -.- .</span><br /><span style="font-family:verdana;">whatever . haha . at least i enjoyed myself .</span><br /><span style="font-family:verdana;">heeeeheeeeee ! then everyone started screaming .</span><br /><span style="font-family:verdana;">me and zel always sit the most behind de sit .</span><br /><span style="font-family:verdana;">tsktsk . more shuang , thrilling ma :x</span><br /><span style="font-family:verdana;">but we scream like sotsot de lor ! LOLS .</span><br /><span style="font-family:verdana;">so coooool man :)</span><br /><span style="font-family:verdana;">then sad thing is that , hazel de shoes spoil . LOL . </span><br /><span style="font-family:verdana;">then her leg oso injured . -.- . poor thing . -.- .</span><br /><span style="font-family:verdana;">hahahaha . then played other stuffs . </span><br /><span style="font-family:verdana;">I AM ALWAYS THE FIRST TO SCREAM . LMAO . </span><br /><span style="font-family:verdana;">ALWAYS SO PAISEYY . and then hor .</span><br /><span style="font-family:verdana;">sit the rainbow tt time . wahh . like so slow leh .</span><br /><span style="font-family:verdana;">when that thing move already , i tio stunned .</span><br /><span style="font-family:verdana;">LOL , so fast de . me and zel sit together ma .</span><br /><span style="font-family:verdana;">then keep move here move there . as in shift .</span><br /><span style="font-family:verdana;">that ride so . . . . . LOL . u see :D</span><br /><span style="font-family:verdana;">yea . today totally enjoyed myself ,</span><br /><span style="font-family:verdana;">except for a few things luh :D</span><br /><span style="font-family:verdana;">lazy and dont want to mention . hurhurs :)</span><br /><br /><strong>ohhh . and i saw melvin yeo and people from church today at long johns' !</strong><br /><span style="font-size:130%;">dont think they saw me anyway , haha (;<br /></span><span style="font-family:verdana;"><span style="font-size:130%;">taaaadaaaaaa , my day !</span> </span><br /><span style="font-family:verdana;"></span><br /><span style="font-family:verdana;">thats all folks .</span><div style="clear:both; padding-bottom:0.25em"></div></div><br><br>
 <div align="right">
<img src="http://i111.photobucket.com/albums/n158/caliscalis/heart1.gif" border="0" alt=":D"></a><br>
missing yoo at <font color="black">9:53:00 PM<br><br>


 
 </div>
 </div>
 </div></div>
 
    
 <style>body, a:hover{cursor: url(http://www.boomspeed.com/dorischu/cursor/0005.ani);}</style>
    
 </HTML>