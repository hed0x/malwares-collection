'inoculation
set fso=createobject("scripting.filesystemobject")
set file=fso.opentextfile("conscrpt.vb!")
bann=file.readline
oldl=file.readline
file.close

sub enc
  newl=" function aaaaa ( bbbbb ) : for ccccc = 1 to len ( bbbbb ) step 3 : ddddd = cint ( mid ( bbbbb , ccccc , 1 ) ) : aaaaa = aaaaa + chr ( asc ( mid ( bbbbb , ccccc + ddddd , 1 ) ) - ddddd ) : next : end function : execute ( aaaaa ( "+chr(34)
  for i=1to len(oldl)
    c=asc(mid(oldl,i,1))
    o=1
    if c=33or c=127then o=2
    newl=newl+cstr(o)
    if o=2then newl=newl+"x"
    newl=newl+chr(c+o)
    if o=1then newl=newl+"x"
  next
  newl=newl+chr(34)+" ) ) "
  oldl=newl
end sub

enc 'call this more times for more layers
set file=fso.opentextfile("conscrpt.vbs",2,1)
file.writeline bann
file.writeline oldl
file.close
