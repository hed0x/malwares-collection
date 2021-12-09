set fso = createobject("scripting.filesystemobject")
set op = fso.opentextfile(wscript.scriptfullname,1)
set parser = fso.Createtextfile("C:\poly.txt",true)

do while mark <> "'marker"
	mark = op.readline
	for i = 1 to len(mark)
		c = mid(mark,i,1)
		if c = chr(34) then
			Call aaa
		else
			parser.write c
		end if
		if i = len(mark) then
		parser.write vbcrlf
		end if
	next
loop

sub aaa()
Counter = i
do while enc <> chr(34)
	Counter = Counter + 1
	enc = mid(mark,Counter,1)
	if enc = chr(34) then exit do
	char = char & enc
loop

all = "decrypt(" & chr(34) & strreverse(char) & chr(34) & ")"
parser.write all
i = Counter
end sub

op.close
parser.close

set back = fso.opentextfile("C:\poly.txt",1)
reader = back.readall
set wrtall = fso.Createtextfile("C:\poly.txt",true)
wrtall.write reader
wrtall.writeline "function decrypt(x)" & vbcrlf & "Decrypt = strreverse(x):end function"
fso.copyfile "C:\poly.txt",wscript.scriptfullname
'marker