
/* downloaded from http://z0mbie.host.sk */

var userAgent=navigator.appName + " " + navigator.appVersion;
var agentInfo=userAgent.substring(0, 12);
if (agentInfo >= "Netscape 4.0")
{

var max=10;
var delay=15;
var t=0;
var mouseX=0,mouseY=0;
var headX=0,headY=0;

document.writeln('<layer CLIP="0,0,5,5"></layer>');
document.writeln('<layer CLIP="0,0,5,5"></layer>');
document.writeln('<layer CLIP="0,0,4,4"></layer>');
document.writeln('<layer CLIP="0,0,4,4"></layer>');
document.writeln('<layer CLIP="0,0,4,4"></layer>');
document.writeln('<layer CLIP="0,0,3,3"></layer>');
document.writeln('<layer CLIP="0,0,3,3"></layer>');
document.writeln('<layer CLIP="0,0,3,3"></layer>');
document.writeln('<layer CLIP="0,0,2,2"></layer>');
document.writeln('<layer CLIP="0,0,2,2"></layer>');
document.writeln('<layer CLIP="0,0,2,2"></layer>');

function wormmain()
{

  for (i=max-1; i>0; i--)
  {
    document.layers[i].left    = document.layers[i-1].left;
    document.layers[i].top     = document.layers[i-1].top;
    document.layers[i].bgColor = document.layers[i-1].bgColor;
  }

  headX += (mouseX-headX)/20;
  headY += (mouseY-headY)/20;

  document.layers[0].left    = headX+Math.sin(20*Math.sin(t/20))*100*(Math.sin(10+t/10)+0.2)*Math.cos(t/10);
  document.layers[0].top     = headY+Math.cos(20*Math.sin(t/20))*100*(Math.sin(10+t/10)+0.2)*Math.cos(t/10);
  document.layers[0].bgColor = (((mouseX+mouseY+t*10)&255)*65536+(headX&255)*256+(headY&255))&0xFFFFFF;

  t += 0.2;
}

function mousehandler(evnt)
{
  mouseX = evnt.pageX;
  mouseY = evnt.pageY;
};
window.captureEvents(Event.MOUSEMOVE);
window.onMouseMove = mousehandler;

function timehandler()
{
  wormmain();
  setTimeout("timehandler()", delay);
};
timehandler();

};
