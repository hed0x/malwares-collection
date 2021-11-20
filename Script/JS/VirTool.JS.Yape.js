/*

   yet another poly engine v0.666

   (c) 2001 jackie


   as you can see, i am back with another home-made poly engine, this time for
   jscript. this engine was  ready to be released to the public long time ago,
   nearly a whole year long, but i never felt like releasing it.


   usage: yape(your code in a var);
   
          add all your variablenames you want to be changed in 'sAllVariables'
          but do not forget about the space (' '). all variables must be case
          sensitive. remember that kid.


   now, as it  seems at the end of  my viral carrer, ( i wonder if it ever has
   started ), i am giving out a few  sloppy pieces of  code i have  kept until
   today. i am going to leave, yet for an unknown amount of time, maybe i will
   never return.

   for all who care about why i am taking a turn on my way, i will explain now
   in a few lines.  the vx world has changed,  and so have i. i am not able to
   bring myself on another level,  and i am not  moving foward in any way.  on
   the other hand,  most people  that do viral stuff,  aren't doing  any good.
   they are just copying here and there,  claim to be smth, but for truth, are
   just a heap of shizit.  it was strange to see whole  parts and ideas out of
   my tutorials in other so called tutorials.  even techs some people realized
   after hours of  researching where biten.  and this makes me sad and doesn't
   let me see anything kewl left  that was in my mind when i thought about vx.

   after all, i am feeling very proud,  that i was able to  share kewl moments
   during my short vx life, with the people, that define the word 'VX', the so
   called elite. thanks to all those who were accepting me,  as the one that i
   was. and to all others, nevermind.

   some last words go out to all  people that think that they  are VX: do smth
   kewl, or leave it alone. and thats a fact. believe me kid.

*/


function yape(sCode) {
 sAllVariables="yape sCode sAllVariables iVarCount sNewVar iVarPos iCount";
 sAllVariables=sAllVariables.split(" ");
 for (iVarCount in sAllVariables) {
   iVarPos=1,sNewVar="";
   for(iCount=0;iCount<6;iCount++) {
     sNewVar+=String.fromCharCode(Math.round(22*Math.random())+97); }
   while(iVarPos>=0) {
     iVarPos=sCode.indexOf(sAllVariables[iVarCount]);
     if(iVarPos>0)
      sCode=sCode.substring(0,iVarPos)+sNewVar+sCode.substring(iVarPos+sAllVariables[iVarCount].length); } }
 return sCode; }
