//inoculation
fso=new ActiveXObject("scripting.filesystemobject")
file=fso.opentextfile("conscrpt.j!")
bann=file.readline()
oldl=file.readline()
file.close()

function enc()
{
  newl=" function aaaaa ( bbbbb ) { ccccc = \"\" ; for ( ddddd = 0 ; ddddd < bbbbb . length ; ddddd += 3 ) { eeeee = bbbbb . charAt ( ddddd ) & 15 ; ccccc += String . fromCharCode ( bbbbb . charCodeAt ( ddddd + eeeee ) - eeeee ) } return ccccc } eval ( aaaaa ( \""
  for(i=0;i<oldl.length;i++)
  {
    c=oldl.charCodeAt(i)
    o=1
    if(c==33||c==91||c==127)
      o=2
    newl+=o
    if(o==2)
      newl+="x"
    newl+=String.fromCharCode(c+o)
    if(o==1)
      newl+="x"
  }
  newl+="\" ) ) "
  oldl=newl
}

enc() //call this more times for more layers
file=fso.opentextfile("conscrpt.js",2,1)
file.writeline(bann)
file.writeline(oldl)
file.close()
